-- Problem: Calculate user retention for each month using 'users' and 'orders' tables.
-- Return signup_month, month_offset, and retained_users.

WITH user_orders AS (
    SELECT user_id,
           DATE_TRUNC('month', signup_date) AS signup_month,
           DATE_TRUNC('month', order_date) AS order_month
    FROM users
    LEFT JOIN orders
      ON users.user_id = orders.user_id
)
SELECT signup_month,
       DATE_PART('month', order_month - signup_month) AS month_offset,
       COUNT(DISTINCT user_id) AS retained_users
FROM user_orders
GROUP BY signup_month, month_offset
ORDER BY signup_month, month_offset;
