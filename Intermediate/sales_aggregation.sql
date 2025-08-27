-- Problem: Calculate total sales and average order value per customer from the 'orders' table.
-- Return customer_id, total_sales, and avg_order_value, ordered by total_sales descending.

SELECT customer_id,
       SUM(total_amount) AS total_sales,
       AVG(total_amount) AS avg_order_value
FROM orders
GROUP BY customer_id
ORDER BY total_sales DESC;

