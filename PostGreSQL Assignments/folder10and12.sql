-- folder 10 exercise 1
select r.rental_date,r.return_date,extract(Days from age(r.return_date,r.rental_date)) as "Rental Duration",
	   c.first_name , c.last_name , c.email
from rental r
join customer c on r.customer_id = c.customer_id
where r.return_date is not null AND
extract(Days from age(r.return_date,r.rental_date)) >= 7
order by "Rental Duration" desc;

-- folder 10 exercise 2
select title,length(title),substr(title,10) from film;
select title,length(title),substr(title,15) from film;
select title,length(title),substr(title,5,3) from film;
select title,length(title),substr(title,5,1) from film;

-- folder 12 exercise 1

SELECT CONCAT(c.first_name,' ',c.last_name) as "Customer Name", c.email as "Email",sum(p.amount) as "Total Rentals",
CASE
	WHEN sum(p.amount)>200 THEN 'Elite'
	WHEN sum(p.amount)>150 AND sum(p.amount)<=200 THEN 'Platinum'
	WHEN sum(p.amount)>100 AND sum(p.amount)<=150 THEN 'Gold'
	ELSE 'Silver'
END AS "Customer Category"
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
GROUP BY "Customer Name","Email";

--folder 12 exercise 2

create view customer_categories
AS
SELECT CONCAT(c.first_name,' ',c.last_name) as "Customer Name", c.email as "Email",sum(p.amount) as "Total Rentals",
CASE
	WHEN sum(p.amount)>200 THEN 'Elite'
	WHEN sum(p.amount)>150 AND sum(p.amount)<=200 THEN 'Platinum'
	WHEN sum(p.amount)>100 AND sum(p.amount)<=150 THEN 'Gold'
	ELSE 'Silver'
END AS "Customer Category"
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
GROUP BY "Customer Name","Email";

	