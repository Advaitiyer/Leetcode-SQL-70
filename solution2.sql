/* Problem 2: Consecutive Available Seats
Several friends at a cinema ticket office would like to reserve consecutive available seats.
Can you help to query all the consecutive available seats order by the seat_id using the following cinema table?
Note:
The seat_id is an auto increment int, and free is bool ('1' means free, and '0' means occupied.).
Consecutive available seats are more than 2(inclusive) seats consecutively available.

Input Table: cinema (seat_id, free ("true", "false"))
Output Table: seat_id
*/

SELECT DISTINCT a.seat_id
FROM cinema AS a
INNER JOIN cinema AS b
ON ABS(a.seat_id - b.seat_id) = 1
AND a.free = 'true' AND b.free = 'true'
ORDER BY a.seat_id;
