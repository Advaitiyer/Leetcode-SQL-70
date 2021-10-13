/* Problem: Sales Person
Output all the names in the table salesperson, who didn’t have sales to company 'RED'.

Input Table 1: salesperson (sales_id, name, salary, commission_rate, hire_date)
Input Table 2: company (com_id, name, city)
Input Table 3: orders (order_id, order_date, com_id, sales_id, amount)
Output Table: name*/

WITH sales_CTE AS
(SELECT salesperson.name
FROM salesperson 
INNER JOIN orders ON salesperson.sales_id = orders.sales_id
INNER JOIN company ON orders.com_id = company.com_id
WHERE company.name = 'RED')

SELECT salesperson.name FROM salesperson EXCEPT SELECT * FROM sales_CTE;
