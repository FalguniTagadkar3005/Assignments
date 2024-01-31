select title,description,rental_duration,replacement_cost from film
WHERE rental_duration between 4 and 6
ORDER BY replacement_cost DESC
LIMIT 100;