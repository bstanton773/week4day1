-- Hello World SQL Query
SELECT *
FROM actor;

-- Query for first name and last name in actor table
SELECT first_name, last_name
FROM actor;

-- Query for first name that is Nick
SELECT last_name, first_name
FROM actor
WHERE first_name = 'Nick';

-- Query for first name that equals Nick using the LIKE clause
SELECT last_name, first_name
FROM actor
WHERE first_name LIKE 'Nick';

-- Query for first name that starts with J using LIKE and WHERE with a wildcard
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J%';

-- Query for first name that starts with K using LIKE and WHERE with character lengths
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K__';

-- Query to combine both wildcards and character length
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K____%';

-- SELECT payments amounts using greater than statement
SELECT customer_id, amount
FROM payment
WHERE amount > '2.00';

-- SELECT payments amounts using less than statement
SELECT customer_id, amount
FROM payment
WHERE amount < 3.99;

-- SELECT payments less than or equal to 7.99 ordered by amount
SELECT customer_id, amount
FROM payment
WHERE amount <= 7.99
ORDER BY amount ASC;

-- SELECT payments NOT EQUAL to 0.00
SELECT customer_id, amount
FROM payment
WHERE amount <> 0.00
ORDER BY amount DESC;

-- SELECT state with WHERE clause including a range between 7.99 and 10.99
SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 7.99 AND 10.99
ORDER BY amount;

SELECT customer_id, amount
FROM payment
WHERE amount >= 7.99 AND amount <= 10.99;

-- SQL Aggregations => SUM(), AVG(), COUNT(), MIN(), MAX()

-- Query to display the sum of the amounts payed that are greater than 5.99
SELECT SUM(amount) AS Total
FROM payment
WHERE amount > 5.99;

-- Query to display the average of the amounts payed that are greater than 5.99
SELECT AVG(amount) AS average
FROM payment
WHERE amount > 5.99;

-- Query to display the count of the amounts payed that are greater than 5.99
SELECT COUNT(*)
FROM payment
WHERE amount > 5.99;

-- Query to display the max amount payed that is greater than 5.99
SELECT MAX(amount)
FROM payment
WHERE amount > 5.99;

-- Query to display the min amount payed that is greater than 5.99
SELECT MIN(amount)
FROM payment
WHERE amount > 5.99;

-- Query to display customer_ids with the summed amount for each customer
SELECT customer_id, SUM(amount) as total
FROM payment
GROUP BY customer_id
ORDER BY customer_id;

-- Query to display staff_ids with the average payment amount for each
SELECT staff_id, ROUND(AVG(amount), 2) as average_per_employee
FROM payment
GROUP BY staff_id;

-- SELECT statement to return customer_ids that show up more than 10 times for payments over 2.99
SELECT customer_id, COUNT(*) as num_payments
FROM payment
WHERE amount > 2.99
GROUP BY customer_id
HAVING COUNT(*) > 10;

-- SELECT statement to return top 10 customer_ids that show up more than 10 times for payments over 2.99 
SELECT customer_id, COUNT(*) as num_payments
FROM payment
WHERE amount > 2.99
GROUP BY customer_id
HAVING COUNT(*) > 10
ORDER BY num_payments DESC
LIMIT 10;

