/* Reported Posts
Input Table: Actions

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| post_id       | int     |
| action_date   | date    | 
| action        | enum    |
| extra         | varchar |
+---------------+---------+
There is no primary key for this table, it may have duplicate rows.
The action column is an ENUM type of ('view', 'like', 'reaction', 'comment', 'report', 'share').
The extra column has optional information about the action such as a reason for report or a type of reaction. 
*/

/* Write an SQL query that reports the number of posts reported yesterday for each report reason. Assume today is 2019-07-05. */

SELECT extra AS report_reason, COUNT(DISTINCT post_id) AS report_count
FROM ACTIONS
WHERE DATEDIFF(DAY,'2019-07-05', action_date) = -1 AND extra IS NOT NULL AND action = 'REPORT'
GROUP BY extra;
