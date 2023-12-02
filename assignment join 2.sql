-- Question 1: Retrieve the first and last names of customers who have a postal code starting with '35'.
select customer.first_name, last_name, postal_code from customer
join address on customer.address_id = address.address_id 
where postal_code like '35%';

-- Question 2: Display the titles and rental rates of films that have a rental rate between 2.00 and 3.00.
select title, rental_rate from film
where rental_rate between 2.00 and 3.00;

-- Question 3: List the names and release years of films released in the 21st century (after the year 2000) ordered by release year
select title, release_year from film
where release_year > 2000
order by release_year;

-- Question 4: Find the actors whose last names contain the letter 'a'. Order the results alphabetically by last name
select last_name from actor
where last_name like '%a%'
order by last_name;

-- Question 5: Retrieve the film titles and rental duration of the top 5 longest films (ordered by rental duration)
select title, rental_duration from film
order by rental_duration desc limit 5;

-- Question 6: List the names of customers who have made more than 20 rentals, ordered by the number of rentals in descending order.
select first_name, count(rental_id) from customer
join rental on customer.customer_id = rental.customer_id
group by rental.customer_id
having count(rental_id) > 20
order by 2 desc;

-- Question 7: Display the first and last names of actors who have appeared in at least 3 films, ordered by the number of films in descending order.
select actor.first_name, actor.last_name,count(*) as number_of_film  from actor
join film_actor on actor.actor_id = film_actor.actor_id
group by film_actor.actor_id
having count(*)>3
order by number_of_film  desc;	

-- Question 8: Find the films that have a replacement cost greater than 20.00 and a rental rate less than 3.00.
select title, replacement_cost, rental_rate from film
where replacement_cost > 20.00 and rental_rate < 3;

-- Question 9: Retrieve the customer names and their total payments, ordered by total payments in descending order, and limit the result to 10 rows.
select customer.first_name,sum(amount) as total_payment from customer
join payment on customer.customer_id = payment.customer_id
group by payment.customer_id 
order by total_payment
desc limit 10;

-- Question 10: List the titles and release years of films released before the year 2005, ordered by release year in ascending order, and limit the result to 5 rows
select title, release_year from film
where release_year < 2005
order by release_year asc limit 5;







