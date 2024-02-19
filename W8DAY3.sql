USE sakila;

-- Identificate tutti i clienti che non hanno effettuato nessun noleggio a gennaio 2006.
select c.customer_id, concat(first_name," ",last_name) from customer c where not exists
(select r.customer_id from rental r where DATE_FORMAT(rental_date, "%m - %Y") = "01 - 2006" and r.customer_id = c.customer_id);

-- Elencate tutti i film che sono stati noleggiati più di 10 volte nell’ultimo quarto del 2005
select f.film_id, f.title, count(*) as number_of_rentals from film f, inventory i, rental r
where f.film_id = i.film_id and i.inventory_id = r.inventory_id
and quarter(r.rental_date) = 3 and year(r.rental_date) = "2005"
group by f.film_id, f.title
having count(*) > 10
order by 3 asc;

-- Trovate il numero totale di noleggi effettuati il giorno 1/1/2006.
select count(*) from rental where date(rental_date) = "2006-01-01";

-- Calcolate la somma degli incassi generati nei weekend (sabato e domenica).
select sum(amount) total_payment from payment where weekday(payment_date) in (5,6);

-- Individuate il cliente che ha speso di più in noleggi.
with tmp_table as
(select customer_id, sum(amount) as amount
from payment
group by
customer_id)
select c.customer_id, concat(c.first_name," ", c.last_name) from customer c
inner join tmp_table
on tmp_table.customer_id = c.customer_id
order by amount desc
limit 1;

-- Elencate i 5 film con la maggior durata media di noleggio
SELECT f.film_id, f.title, round(AVG(DATEDIFF(r.return_date, r.rental_date)),2) as avg_rental_days
from film f, inventory i, rental r
where f.film_id = i.film_id and i.inventory_id = r.inventory_id
group by f.film_id, f.title
order by 3 desc
limit 5;

-- Calcolate il tempo medio tra due noleggi consecutivi da parte di un cliente

-- Individuate il numero di noleggi per ogni mese del 2005
select date_format(rental_date, "%m %Y") as month_year, count(*) as total_rent from rental
where year(rental_date) = "2005" 
group by date_format(rental_date, "%m %Y");

-- Trovate i film che sono stati noleggiati almeno due volte lo stesso giorno
SELECT f.film_id, f.title, date(r.rental_date), count(*) as rent_days
from film f, inventory i, rental r
where f.film_id = i.film_id and i.inventory_id = r.inventory_id
group by f.film_id, f.title, date(r.rental_date)
having count(*) >=2;

-- Calcolare il tempo medio di noleggo
SELECT round(AVG(DATEDIFF(r.return_date, r.rental_date)),2) as avg_rent_days from rental r;


