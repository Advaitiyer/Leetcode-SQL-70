*/ Product:

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| product_id   | int     |
| product_name | varchar |
| unit_price   | int     |
+--------------+---------+
product_id is the primary key of this table.

Sales:

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| seller_id   | int     |
| product_id  | int     |
| buyer_id    | int     |
| sale_date   | date    |
| quantity    | int     |
| price       | int     |
+------ ------+---------+
This table has no primary key, it can have repeated rows.
product_id is a foreign key to Product table.
*/

/* Write an SQL query that reports the best seller by total sales price, If there is a tie, report them all. */

SELECT seller_id FROM
(SELECT seller_id, RANK() OVER(ORDER BY SUM(price) DESC) as rank
FROM sales GROUP BY seller_id) AS b
WHERE rank = 1;

/* Write an SQL query that reports the buyers who have bought S8 but not iPhone. Note that S8 and iPhone are products present in the Product table. */

WITH cte(buyer_id, product_name, product_id) AS 
(SELECT Sales.buyer_id, Product.product_name, Sales.product_id
FROM Product INNER JOIN Sales ON Product.product_id = Sales.product_id)
SELECT buyer_id
FROM cte
WHERE product_name = 'S8' 
EXCEPT
SELECT buyer_id
FROM cte
WHERE product_name = 'iPhone';

/* Write an SQL query that reports the products that were only sold in spring 2019. That is, between 2019-01-01 and 2019-03-31 inclusive. */

WITH cte(product_id, product_name, sale_date) AS
(SELECT DISTINCT Product.product_id, Product.product_name, Sales.sale_date
FROM Product INNER JOIN Sales ON Product.product_id = Sales.product_id)

SELECT product_id, product_name FROM cte
WHERE sale_date >= '2019-01-01' AND sale_date <= '2019-03-31'
EXCEPT 
SELECT product_id, product_name FROM cte
WHERE sale_date < '2019-01-01' OR sale_date > '2019-03-31'
OPTION(HASH JOIN, MERGE JOIN);
