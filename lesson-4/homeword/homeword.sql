
--Bài 1
SELECT b.title ,b.year_of_publication  FROM book b WHERE b.year_of_publication < 1900 ORDER BY b.year_of_publication

SELECT b.title ,b.page_number  FROM book b WHERE b.page_number <100 ORDER BY b.page_number

SELECT b.title ,b.id_publisher,b.page_number  FROM book b WHERE b.id_publisher = 1 ORDER BY b.page_number


--Bài 2
SELECT AVG(f.rental_rate) FROM film f WHERE f.rating = 'R'

SELECT COUNT(f.film_id) FROM film f WHERE f.special_features LIKE '%Deleted Scenes%'

SELECT f.title  FROM film f WHERE f.title LIKE '%ACADEMY%'






