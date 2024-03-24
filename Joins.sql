/* Show all film title in each stores inventory table */
--INNER JOIN
select 
	inventory.store_id,
    inventory.film_id,
    film.title
FROM film
INNER JOIN inventory
	ON inventory.film_id=film.film_id;
    
/* I would like to see the films titles,description and the store_id values associated with each item,and its invetory_id */
SELECT 
    film.title,
    film.description,
    inventory.store_id,
    inventory.inventory_id
FROM
    film
        INNER JOIN
    inventory ON inventory.film_id = film.film_id;

/* LEFT JOIN , Calculate the count of each actors total film */
select * from film_actor;
SELECT 
    actor.first_name,
    actor.last_name,
    COUNT(film_actor.film_id) AS Total_film
FROM
    actor
        LEFT JOIN
    film_actor ON actor.actor_id = film_actor.film_id
GROUP BY actor.first_name , actor.last_name;

/* Can you pull a list of all titles,and figure out how many actors are associated with each title */
SELECT
	film.title,
    COUNT(film_actor.actor_id) as Total_actor
FROM film
LEFT JOIN film_actor ON
film.film_id=film_actor.film_id
GROUP BY title;

/* Bridging */
SELECT
	film.film_id,
    film.title AS Tittle,
    category.name AS category_name
FROM film
	INNER JOIN film_category
		ON film.film_id = film_category.film_id
	INNER JOIN category
    ON film_category.category_id=category.category_id;
    
/* It Would be greate to have a list of all actors, with each title  that they appears in ,Could you please pull that for me */
SELECT 
actor.first_name,
actor.last_name,
film.title
FROM  actor
INNER JOIN film_actor
	ON film_actor.actor_id=actor.actor_id
INNER JOIN film
ON film.film_id=film_actor.film_id;

/* Could you please pull a list of distinct titles and there respective descriptions,currently available in inventory at store 2 */
select 
	DISTINCT film.title,
	film.description,
    inventory.store_id
from film
INNER JOIN inventory on
	film.film_id=inventory.film_id
AND inventory.store_id=2
    