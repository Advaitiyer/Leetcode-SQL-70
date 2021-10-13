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
