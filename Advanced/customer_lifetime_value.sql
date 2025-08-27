-- Problem: Calculate the lifetime value (LTV) of each customer using CTEs.
-- Return customer_id, total_revenue, average_order_value, and total_orders.

WITH customer_orders AS (
    SELECT customer_id,
           COUNT(order_id) AS total_orders,
           SUM(total_amount) AS total_revenue
    FROM orders
    GROUP BY customer_id
),
customer_ltv AS (
    SELECT customer_id,
           total_orders,
           total_revenue,
           total_revenue::DECIMAL / total_orders AS average_order_value
    FROM customer_orders
)
SELECT *
FROM customer_ltv
ORDER BY total_revenue DESC;
