/*  Q1. We will need a list of all staff members,including their first and last name ,email address and the store identification number where they work */
SELECT
	first_name,
    last_name,
    email,
    store_id
FROM customer;

/* Q2 -We Will need a seprate count of inventory items held at each of your two store */
SELECT
	store_id,
    COUNT(inventory_id) AS inventory_items
    FROM inventory
    GROUP BY store_id;

/* Q3 We will need a active customers for each of your stores,separately */
select store_id,COUNT(active)
from customer
group by store_id;

/* Q4 In order to access the Liability of data breach ,we will need you to provide a count of all customer email address stored in the database */
SELECT 
    COUNT(email) As total_emails
FROM
    customer;

/* Q5 We are intrested in how diverse your film offering is as a means of understanging how likely you are to keep customer engage in the future ,please provide the 
count of unique film titles you have in inventory at each store and then provide a count of the unique categories of films you provide */
SELECT 
    store_id, COUNT(DISTINCT film_id) AS unique_film
FROM
    inventory
GROUP BY store_id;
/* Q6 we would like to understand the replacement cost of your films,please provide the replacement cost for the film that is least expensive
to replace ,the most expensive to replace and the avearge of all film you carry */
select 
MIN(replacement_cost) as least_expensive,
MAX(replacement_cost) as most_expensive,
AVG(replacement_cost) as averae_expensive
FROM film


/* Q7 WE are intrestet in having you put payment monitoring systems and maximum payment processing restriction in place in order to minimum
the future risk of fruad by your staff .Please provide the average payment you process ,as well as the maximum payment you have processed */
SELECT
		AVG(amount) as avg_cost,
        MAX(amount) as max_cost
FROM payment