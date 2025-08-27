-- Problem: Perform a cohort analysis on user sign-ups from the 'users' table and 'orders' table.
-- Calculate the number of orders each monthly signup cohort made in the first 3 months after signup.

WITH cohorts AS (
    SELECT user_id,
           DATE_TRUNC('month', signup_date) AS cohort_month
    FROM users
),
orders_with_cohorts AS (
    SELECT c.cohort_month,
           o.user_id,
           DATE_TRUNC('month', o.order_date) AS order_month
    FROM cohorts c
    JOIN orders o
      ON c.user_id = o.user_id
    WHERE o.order_date <= c.cohort_month + INTERVAL '3 months'
)
SELECT cohort_month,
       order_month,
       COUNT(DISTINCT user_id) AS active_users
FROM orders_with_cohorts
GROUP BY cohort_month, order_month
ORDER BY cohort_month, order_month;
