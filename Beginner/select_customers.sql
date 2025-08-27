-- Problem: Select all customers from the USA from the 'customers' table.
-- Return customer_id, first_name, last_name, and country.

SELECT customer_id, first_name, last_name, country
FROM customers
WHERE country = 'USA';
