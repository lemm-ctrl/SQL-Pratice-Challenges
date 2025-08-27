-- Problem: Count the number of customers in each country from the 'customers' table.
-- Return country and total_customers, ordered by total_customers descending.

SELECT country, COUNT(*) AS total_customers
FROM customers
GROUP BY country
ORDER BY total_customers DESC;
