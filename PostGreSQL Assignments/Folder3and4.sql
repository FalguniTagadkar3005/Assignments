--Folder 3
SELECT Distinct customer_id FROM payment
WHERE amount>=7.99


SELECT title , rental_rate , replacement_cost
FROM film WHERE rental_rate > 2.99 OR replacement_cost > 19.99