-- 1. List the number of films per category.
select count(f.film_id), c.category_id, c.name
from film_category as f
join category as c
on c.category_id = f.category_id
group by category_id, name;

-- 2. Display the first and the last names, as well as the address, of each staff member.
select s.first_name, s.last_name, a.address
from staff as s
join address as a
on s.address_id = a.address_id;

-- 3. Display the total amount rung up by each staff member in August 2005.
select s.first_name, s.last_name, sum(p.amount)
from staff as s
join payment as p
using (staff_id)
where payment_date between '2005-08-01 00:00:00' and '2005-08-31 23:59:59'
group by staff_id;

-- 4. List all films and the number of actors who are listed for each film.
select f.title, count(a.actor_id)
from film as f
join film_actor as a
using (film_id)
group by title;

-- 5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
select c.first_name, c.last_name, sum(p.amount)
from customer as c
join payment as p
using (customer_id)
group by first_name, last_name
order by last_name asc;