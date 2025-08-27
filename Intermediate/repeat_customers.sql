-- Problem: Identify customers who have placed more than 3 orders from the 'orders' table.
-- Return customer_id and number_of_orders, ordered by number_of_orders descending.

SELECT customer_id,
       COUNT(order_id) AS number_of_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 3
ORDER BY number_of_orders DESC;
