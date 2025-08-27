-- Problem: Rank customers by total revenue and calculate the cumulative revenue contribution.
-- Return customer_id, total_revenue, rank, and cumulative_revenue.

SELECT customer_id,
       SUM(total_amount) AS total_revenue,
       RANK() OVER (ORDER BY SUM(total_amount) DESC) AS revenue_rank,
       SUM(SUM(total_amount)) OVER (ORDER BY SUM(total_amount) DESC) AS cumulative_revenue
FROM orders
GROUP BY customer_id
ORDER BY revenue_rank;
