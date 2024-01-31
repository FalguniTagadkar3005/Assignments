select * from film;

select title as Title, length as "Time in minutes" ,rating as Rating, description as Description
from film
where length >= 120 AND (rating='G' OR rating='PG')
AND description ilike '%Action%';

-- folder 6 coding exercise 2 

select * from actor;

select first_name,count(first_name)
from actor
group by first_name;

select first_name,count(first_name)
from actor
group by first_name
having count(first_name) > (select avg(countt)
from (select first_name,count(first_name) as "countt"
from actor
group by first_name));

select first_name,count(*)
from actor
group by first_name 
order by count(*) desc;

--folder 8 exercise 1
select * from language limit 10;
select * from film limit 10;

select f.title , l.name , f.rental_rate
FROM film f
JOIN language l ON
f.language_id = l.language_id;


--folder 8 exercise 2
select * from film_actor;

select actor_id,count(film_id) as "No of films"
from film_actor
group by actor_id
order by count(film_id) desc;

select actor.actor_id,concat(first_name,' ',last_name) as "Actor Name","No_of_films"
from actor 
join (select actor_id,count(film_id) as "No_of_films"
from film_actor
group by actor_id) A
ON actor.actor_id = A.actor_id
order by "No_of_films" desc;

-- folder 8 exercise 3
select * from rental;
select * from inventory;

select rating,count(rental_id)
from ( select f.film_id,f.title,f.rating,i.inventory_id,r.rental_id
		from film f
		join inventory i
		on f.film_id = i.film_id
		left join rental r
		on r.inventory_id=i.inventory_id
		-- where r.rental_id is null
		order by film_id) 
group by rating
order by count(rental_id) desc;

select film.rating,count(inventory.inventory_id)
from rental
join inventory on rental.inventory_id = inventory.inventory_id
right join film on film.film_id = inventory.film_id
group by film.rating
order by count(inventory.inventory_id) desc;
































