-- Problem: Find the top-selling product in each region from 'orders' and 'order_items' tables.
-- Return region, product_id, and total_quantity, ordered by region.

SELECT o.region,
       oi.product_id,
       SUM(oi.quantity) AS total_quantity
FROM orders o
JOIN order_items oi
  ON o.order_id = oi.order_id
GROUP BY o.region, oi.product_id
QUALIFY ROW_NUMBER() OVER (PARTITION BY o.region ORDER BY SUM(oi.quantity) DESC) = 1;
