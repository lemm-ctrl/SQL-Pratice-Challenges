-- Problem: Retrieve all orders over $100 placed in the last 30 days from the 'orders' table.
-- Return order_id, customer_id, order_date, and total_amount.

SELECT order_id, customer_id, order_date, total_amount
FROM orders
WHERE total_amount > 100
  AND order_date >= CURRENT_DATE - INTERVAL '30 days';
