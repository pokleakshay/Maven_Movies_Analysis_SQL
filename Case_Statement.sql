/* Case Statement- Allow you to Process a a series of If/Then Logical Operations in a specific orders */
select distinct length,
case
	when length < 60 THEN "Under 1 hr"
    when length between 60 and 90 THEN "1-1.5 hr"
    when length > 90 THEN "OVER 1.5 hr"
    ELSE "oops Check Logic"
END as Length_Bucket
FROM film;


/* Pull Data from customer table ,first name ,last name of each customer and label them either 'store 1' or 'store 2' */
select first_name,last_name,
CASE 
	when store_id=1 and active=1 THEN "Store 1 Active"
    when store_id=1 and active=0 THEN "Store 1 Inactive"
    WHEN store_id=2 and active=1 THEN "Store 2 Active"
    when store_id=2 and active=0 THEN "Store 2 Inactive"
    Else "Store Inactive"
END as store_AND_status
 from customer;
 
 /* Pivoting Using Count And CASE */
 SELECT film_id,
COUNT(CASE when store_id=1 THEN inventory_id ELSE NULL END) AS store_1_copies,
COUNT(CASE when store_id=2 THEN inventory_id ELSE NULL END) AS store_2_copies,
COUNT(inventory_id) AS total_copies
FROM inventory
GROUP BY 
film_id
ORDER BY film_id;

 /* Craete a Table to count the number of customers broken down by store_id(in rows)  and active_status (in columns) */
 select * from customer;
SELECT 
store_id,
COUNT(CASE WHEN active=1 Then active else Null END ) AS active,
COUNT(CASE WHEN active=0 Then active else Null END ) AS inactive
FROM customer
GROUP BY store_id
