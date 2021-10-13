/* Write a SQL query for a report that provides the pairs (actor_id, director_id) where the actor have cooperated with the director at least 3 times. 
Input Table: ActorDirector (actor_id, director_id, timestamp)
Output Table: (actor_id, director_id) */

/* Initial Solution 1 */
SELECT actor_id AS ACTOR_ID, director_id AS DIRECTOR_ID
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(*) >= 3;

/* Optimized Solution 2 */
WITH col_CTE(actor_id, director_id, rownum) AS 
(SELECT actor_id, director_id,
ROW_NUMBER() OVER(PARTITION BY actor_id, director_id ORDER BY actor_id, director_id) AS rownum
FROM ActorDirector)
SELECT DISTINCT actor_id AS ACTOR_ID, director_id AS DIRECTOR_ID FROM col_CTE
WHERE rownum >= 3;
