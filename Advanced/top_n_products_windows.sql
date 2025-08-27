-- Problem: Identify the top 3 best-selling products in each category using window functions.
-- Return category_id, product_id, total_quantity, and rank.

SELECT category_id,
       product_id,
       SUM(quantity) AS total_quantity,
       RANK() OVER (PARTITION BY category_id ORDER BY SUM(quantity) DESC) AS category_rank
FROM order_items
JOIN products
  ON order_items.product_id = products.product_id
GROUP BY category_id, product_id
HAVING RANK() OVER (PARTITION BY category_id ORDER BY SUM(quantity) DESC) <= 3;
