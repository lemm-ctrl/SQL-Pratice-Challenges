-- Problem: List all orders with customer names.
-- Join 'orders' and 'customers' tables to return order_id, first_name, last_name, and total_amount.

SELECT o.order_id, c.first_name, c.last_name, o.total_amount
FROM orders o
JOIN customers c
  ON o.customer_id = c.customer_id;
