-- Problem: Categorize customers based on total spending in the 'orders' table.
-- Categories: 'High' > $1000, 'Medium' $500-$1000, 'Low' < $500
-- Return customer_id, total_spent, and segment.

SELECT customer_id,
       SUM(total_amount) AS total_spent,
       CASE 
           WHEN SUM(total_amount) > 1000 THEN 'High'
           WHEN SUM(total_amount) BETWEEN 500 AND 1000 THEN 'Medium'
           ELSE 'Low'
       END AS segment
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC;
