-- Problem: Find the top 5 best-selling products by quantity from the 'order_items' table.
-- Return product_id and total_quantity, ordered by total_quantity descending.

SELECT product_id, SUM(quantity) AS total_quantity
FROM order_items
GROUP BY product_id
ORDER BY total_quantity DESC
LIMIT 5;
