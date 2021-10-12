/* Problem: Customer Placing the Largest Number of Orders
Write an SQL query to find the customer_number for the customer who has placed the largest number of orders.
It is guaranteed that exactly one customer will have placed more orders than any other customer.

Input Table: Orders (order_number, customer_number) 
Output Table: customer_number 
*/

SELECT TOP(1) customer_number 
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC;


