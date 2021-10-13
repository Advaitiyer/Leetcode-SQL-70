/* Write an SQL query that reports the product_name, year, and price for each sale_id in the Sales table. 
Input Table 1: Sales
+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| sale_id     | int   |
| product_id  | int   |
| year        | int   |
| quantity    | int   |
| price       | int   |
+-------------+-------+
(sale_id, year) is the primary key of this table.
product_id is a foreign key to Product table.
Note that the price is per unit.

Input Table 2: 
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| product_id   | int     |
| product_name | varchar |
+--------------+---------+
product_id is the primary key of this table.
*/

SELECT DISTINCT product_name, year,
SUM(price) OVER(PARTITION BY sale_id, product_name, year) AS "price"
FROM Sales INNER JOIN Product ON Sales.product_id = Product.product_id;

/* Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits. */

SELECT DISTINCT project_id,
ROUND(AVG(experience_years * 1.0) OVER(PARTITION BY project_id),2) AS "average_years"
FROM Project INNER JOIN Employee ON Project.employee_id = Employee.employee_id;

/* Write an SQL query that reports all the projects that have the most employees. */

/* Solution 1 */
SELECT project_id
FROM project
GROUP BY project_id
HAVING COUNT(employee_id) =
(
    SELECT TOP(1) COUNT(employee_id) AS ct
    FROM project
    GROUP BY project_id
    ORDER BY ct desc
);

/* Solution 2 */
WITH cte(project_id, ct) AS
(SELECT project_id, COUNT(*)
FROM Project
GROUP BY project_id)

SELECT project_id FROM cte WHERE ct IN (SELECT MAX(ct) FROM cte);
