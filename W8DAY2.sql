USE sakila;
-- Effettuate un’esplorazione preliminare del database. Di cosa si tratta? 
-- Quante e quali tabelle contiene? Fate in modo di avere un’idea abbastanza chiara riguardo a con cosa state lavorando.

SHOW tables;

-- Scoprite quanti clienti si sono registrati nel 2006
select count(*) from rental where YEAR(rental_date) = "2006";

-- Trovate il numero totale di noleggi effettuati il giorno 1/1/2006.
select count(*) from rental WHERE DATE(rental_date) = "2006-01-01";

-- Elencate tutti i film noleggiati nell’ultima settimana e tutte le informazioni legate al cliente che li ha noleggiati.
select week(r.rental_date) as last_week, c.customer_id, concat(c.first_name," ",c.last_name) as customer_name, c.email, f.title, f.description
from customer c, rental r, inventory i, film f
WHERE c.customer_id = r.customer_id and
r.inventory_id = i.inventory_id and
i.film_id = f.film_id
and week(r.rental_date) = (select MAX(week(rental_date)) from rental)
order by 2;

-- Calcolate la durata media del noleggio per ogni categoria di film.
SELECT c.category_id, c.name, round(AVG(DATEDIFF(r.return_date, r.rental_date)),2) as avg_rental_days
from category c, film_category fc, film f, inventory i, rental r
where c.category_id = fc.category_id and fc.film_id = f.film_id and f.film_id = i.film_id and i.inventory_id = r.inventory_id
group by c.category_id, c.name;

-- Trovate la durata del noleggio più lungo
SELECT MAX(DATEDIFF(r.return_date, r.rental_date)) as max_rental_days FROM rental r;



