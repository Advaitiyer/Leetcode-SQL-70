/* Write a query to judge whether these three sides can form a triangle, assuming table triangle holds the length of the three sides x, y and z 
Input Table: triangle (x, y, z)
Output Table: x, y, z, triangle (yes, no) */

SELECT x, y, z,
triangle = CASE WHEN (x + y > z AND y + x > x AND x + z > y AND x - y < z AND y - z < x AND x - z < y) THEN 'Yes'
ELSE 'No'
END
FROM triangle;
