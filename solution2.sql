/* Problem 2: Consecutive Available Seats
Input Table: cinema (seat_id, free ("true", "false"))
Output Table: seat_id
*/

SELECT DISTINCT a.seat_id
FROM cinema AS a
INNER JOIN cinema AS b
ON ABS(a.seat_id - b.seat_id) = 1
AND a.free = 'true' AND b.free = 'true'
ORDER BY a.seat_id;
