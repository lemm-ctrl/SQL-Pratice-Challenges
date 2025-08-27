-- Problem: Calculate total sales per month from the 'orders' table for the last year.
-- Return year, month, and total_sales, ordered chronologically.

SELECT EXTRACT(YEAR FROM order_date) AS year,
       EXTRACT(MONTH FROM order_date) AS month,
       SUM(total_amount) AS total_sales
FROM orders
WHERE order_date >= CURRENT_DATE - INTERVAL '1 year'
GROUP BY year, month
ORDER BY year, month;
