/* Project:
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| project_id  | int     |
| employee_id | int     |
+-------------+---------+
(project_id, employee_id) is the primary key of this table.
employee_id is a foreign key to Employee table.

Employee:

+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| employee_id      | int     |
| name             | varchar |
| experience_years | int     |
+------------------+---------+
employee_id is the primary key of this table.
*/

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
