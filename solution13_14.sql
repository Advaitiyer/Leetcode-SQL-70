/* Activity:
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| player_id    | int     |
| device_id    | int     |
| event_date   | date    |
| games_played | int     |
+--------------+---------+
(player_id, event_date) is the primary key of this table.
This table shows the activity of players of some games.
Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.
*/

/* Write an SQL query to report the first login date for each player. */

/* Solution 1 */
SELECT DISTINCT player_id, event_date AS first_login FROM
(SELECT player_id, 
 event_date,
 ROW_NUMBER() OVER(PARTITION BY player_id ORDER BY event_date) AS rownum
FROM Activity) A
WHERE A.rownum = 1;

/* Solution 2 */
SELECT DISTINCT player_id,
MIN(event_date) OVER(PARTITION BY player_id) AS first_login
FROM Activity;

/* Write an SQL query to report the device that is first logged in for each player. */

/* Solution 1 */
WITH cte(player_id, device_id, rownum) AS
(SELECT DISTINCT player_id, device_id,
ROW_NUMBER() OVER(PARTITION BY player_id ORDER BY event_date) AS rownum
FROM Activity)

SELECT player_id, device_id FROM cte WHERE cte.rownum = 1;

/* Solution 2 */
SELECT player_id, device_id
FROM
(SELECT DISTINCT player_id, device_id,
ROW_NUMBER() OVER(PARTITION BY player_id ORDER BY event_date) AS rownum
FROM Activity) A
WHERE A.rownum = 1;
