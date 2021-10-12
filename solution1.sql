/* Problem: Customer Placing the Largest Number of Orders 
Input Table: Orders (order_number, customer_number) 
Output Table: customer_number 
*/

SELECT TOP(1) customer_number 
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC;


