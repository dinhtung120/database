SELECT title , description, page_number  FROM book

SELECT full_name ,dob ,mobile  FROM  reader

SELECT full_name AS ten FROM reader

SELECT full_name, gender FROM reader WHERE gender ='male'

SELECT id, full_name, gender FROM reader WHERE id = 196156160

SELECT id, full_name, gender FROM reader WHERE full_name LIKE  '%Miles%'

SELECT id, full_name, gender FROM reader WHERE full_name LIKE  '%A'

SELECT id, full_name, gender FROM reader WHERE full_name LIKE  'A%'

SELECT b.title , b.page_number  FROM book b WHERE b.page_number > 100

SELECT b.title , b.page_number  FROM book b WHERE b.page_number > 50 AND b.page_number < 100

SELECT b.title , b.page_number  FROM book b WHERE b.page_number BETWEEN 50 AND 100

SELECT b.title , b.page_number  FROM book b WHERE b.page_number > 50 AND b.page_number < 100 AND b.title LIKE '%W%'

SELECT b.title , b.page_number  FROM book b WHERE b.page_number < 50 OR  b.page_number > 100 ORDER BY b.page_number ASC

SELECT b.title , b.page_number  FROM book b WHERE b.page_number < 50 OR  b.page_number > 100 ORDER BY b.page_number DESC

SELECT COUNT(id) AS count_book FROM book b WHERE b.page_number BETWEEN 50 AND 100

SELECT SUM(page_number) AS sum FROM book b WHERE b.page_number BETWEEN 50 AND 100

SELECT AVG(page_number)  AS avg FROM book b WHERE b.page_number BETWEEN 50 AND 100

SELECT b.title, b.id_publisher  ,b.page_number, (b.page_number * b.id_publisher ) AS nhan_thu FROM book b

SELECT sum(b.page_number * b.id_publisher) AS tong_nhan_thu FROM book b

SELECT b.title, b.year_of_publication  FROM book b WHERE b.year_of_publication >= 1900 ORDER BY b.year_of_publication

SELECT JSON_OBJECT ( 'id' ,id_publisher ,'so_trang',page_number ,'nhan_thu',(id_publisher * page_number)) FROM book

SELECT JSON_ARRAYAGG(JSON_OBJECT ( 'id' ,id_publisher ,'so_trang',page_number ,'nhan_thu',(id_publisher * page_number))),
SUM(id_publisher * page_number) FROM book

SELECT JSON_OBJECT ('ten', b.title, 'gioi_thieu',b.description) FROM book b

SELECT title ,description FROM book WHERE year_of_publication >=2000

SELECT COUNT(id) FROM book WHERE year_of_publication >=2000

SELECT JSON_ARRAYAGG(
			JSON_OBJECT ('ten', title, 'gioi_thieu',description)) AS book_infor,
			COUNT(id) AS count_book FROM book b WHERE year_of_publication >=2000

SELECT JSON_ARRAYAGG ('ten',title) FROM book b


--sakila
SELECT f.title ,f.length , f.rating  FROM film f WHERE f.length >100 AND f.rating = 'PG' ORDER BY f.length

SELECT f.title ,f.description ,f.rating  FROM film f WHERE f.rating IN ('G', 'PG') AND f.rental_rate = 0.99 ORDER BY f.rating

SELECT COUNT(f.film_id) AS count_film FROM film f WHERE f.rating = 'PG'

SELECT f.title, f.special_features, f.rating, f.length  FROM film f WHERE f.special_features LIKE '%Trailers%' AND f.rating ='G' AND f.length < 100 ORDER BY f.length

SELECT JSON_OBJECT('ten', title, 'do_dai' , length) FROM film f

SELECT JSON_ARRAYAGG(
			JSON_OBJECT('ten', title, 'do_dai' , f.length)),
			COUNT(film_id) FROM film f WHERE f.length < 50

SELECT f.title ,f.rating FROM film f WHERE f.rating NOT LIKE 'PG'






