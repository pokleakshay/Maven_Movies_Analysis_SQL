/* pull the data to see payment over $5 for those same customer ,since january 1, 2016 */

select customer_id,
amount,
payment_date
from payment
where amount >= 5 and payment_date > "2006-01-01";

/* In operators */
select customer_id,
amount,
payment_date
from payment
where customer_id IN (5,42,53,60,75);

/* Like operatores,we need to understand the speacial feature in our films.pull the list of films which include a "Behind the scenes special feature */
select title,special_features from film
where special_features like '%Behind the Scenes%';

/* Group By */
SELECT rating,
count(film_id)
from film
group by rating;

 /*pull count of titles slice by renal duration */
 select rental_duration,count(title) as film_with_this_rental_duration
 from film
 group by rental_duration;

/* Multiple dimention Group By clauses */
select rating,rental_duration,
COUNT(film_id) AS count_of_this_rating
FROM film
GROUP BY
rental_duration,
rating;

/* Aggregate functions and Group By */
SELECT rating,
COUNT(film_id) AS count_of_film,
MIN(length) as shortest_film,
MAX(length) as longest_film,
AVG(length) as average_length_of_film,
AVG(rental_duration) as average_rental_duration
from film
group by rating;

/* pull a count of films,along with the average,min,max rental rate, group by replacement cost */
select replacement_cost,
count(film_id) as number_of_films,
min(rental_rate) as cheapest_rental,
max(rental_rate) as most_expensive_rental,
AVG(rental_rate) as average_rental
from film
GROUP BY replacement_cost;

/* Having Clause,Pull list of customer id with less than 15 rentals all time */
SELECT 
	customer_id,
    COUNT(*) as total_rental
FROM rental
GROUP BY
	customer_id
HAVING COUNT(*) >=15
