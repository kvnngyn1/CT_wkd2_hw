-- 1. List all customers who live in Texas
-- (use JOINs)
SELECT customer.address_id, customer.customer_id, customer.first_name, customer.last_name, address.address, address.district
FROM customer
JOIN address ON customer.address_id = address.address_id
WHERE district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full Name
-- concat for full name
SELECT CONCAT(first_name, ' ', last_name) AS "Full Name", payment.amount
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;

-- 3. Show all customers names who have made payments over $175
-- (use subqueries)
-- Didn't use where because it couldnt taking aggregate functions
-- there is no payments over 175, so i used 10 to check if my query worked
-- played with ascending and decending order
SELECT customer.customer_id, customer.first_name, customer.last_name, sum(payment.amount)
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id, customer.first_name, customer.first_name, payment.amount
HAVING sum(payment.amount) > 10
ORDER BY sum(payment.amount)
DESC;

-- 4. List all customers that live in Nepal
-- (use the city table)
-- customers to nepal. link customer to address, link address to to city, and link city to country
SELECT customer.customer_id, customer.first_name, customer.last_name, country.country, address.address_id, city.city_id, country.country_id
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
WHERE country = 'Nepal';

-- 5. Which staff memeber had the most transactions?
SELECT staff.staff_id, staff.username, count(payment.amount)
FROM staff
JOIN payment ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id, staff.username

-- 6. How many movies of each rating are there?
-- I included 'order by' to organize the count(title) in ascending order
-- could've used rating and organize in alphabetical but it looked messy
SELECT rating, COUNT(title)
FROM film
GROUP BY rating
ORDER BY COUNT(title);

-- 7. Show all customers who have made a single payment above $6.99
-- (Use subqueries)
SELECT customer.customer_id, payment.amount
FROM payment
JOIN customer ON payment.customer_id = customer.customer_id
WHERE amount > 6.99
GROUP BY customer.customer_id, payment.amount
ORDER BY payment.amount;

-- 8. How many free rentals did our stores give away?
SELECT COUNT(amount)
FROM payment
WHERE amount = 0


