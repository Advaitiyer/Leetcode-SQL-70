/* Write a query to find the shortest distance between two points in all the points. 
Input Table: x
Output: distance */

/* Initial Solution 1 */
WITH cross_CTE AS 
(SELECT DISTINCT P1.x AS X1, P2.x AS X2, distance = ABS(P1.x - P2.x)
FROM point AS P1, point as P2
WHERE P1.x != P2.x)
SELECT TOP(1) distance AS shortest FROM cross_CTE
ORDER BY distance;

/* Optimized Solution 2 */
SELECT MIN(ABS(P1.x - P2.x)) AS shortest 
FROM point AS P1, point AS P2
WHERE P1.x != P2.x;
