SELECT b.title,p.name FROM book b INNER JOIN publisher p ON p.id =b.id_publisher 

SELECT b.title, p.name  FROM book b LEFT JOIN publisher p ON b.id_publisher =p.id 

SELECT b.title , p.name  FROM book b RIGHT JOIN publisher p ON b.id_publisher = p.id 

SELECT b.title, p.name  FROM book b LEFT JOIN publisher p ON b.id_publisher =p.id 
UNION 
SELECT b.title , p.name  FROM book b RIGHT JOIN publisher p ON b.id_publisher = p.id 

SELECT b.title , a.full_name  FROM book b 
		INNER JOIN book_author ba ON b.id = ba.id_book 
		INNER JOIN author a ON ba.id_author = a.id 
		
SELECT b.title ,c.name  FROM book b 
		INNER JOIN book_category bc ON b.id = bc.id_book 
		INNER JOIN category c ON c.id =bc.id_category 
		WHERE  c.name = 'Drama'

SELECT b.title , a.full_name  FROM book b 
		INNER JOIN book_author ba ON b.id = ba.id_book 
		INNER JOIN author a ON a.id = ba.id_author 
		WHERE a.full_name = 'Mort Mewitt'
		
SELECT b.title FROM book b INNER JOIN book_category bc ON b.id = bc.id_book 
		WHERE bc.id_category = (SELECT id FROM category c WHERE c.name = 'Drama')
		
SELECT b.title FROM book b WHERE b.id_publisher = (SELECT id FROM publisher p WHERE p.name = 'Wyman LLC')

SELECT p.name , COUNT(p.id) FROM publisher p 
		INNER JOIN book b ON b.id_publisher = p.id 
		GROUP BY p.id

SELECT r.full_name ,r.mobile ,r.address  FROM reader r
		INNER JOIN borrow_back bb ON r.id =bb.id_reader
		WHERE bb.status ='incomplete'

SELECT r.full_name , b.title , bbi.amount , bbi.amount_return, bb.return_date  FROM reader r
		INNER JOIN borrow_back bb ON r.id =bb.id_reader
		INNER JOIN borrow_back_item bbi ON bb.id = bbi.id_borrow
		INNER JOIN book b ON bbi.id_book = b.id
		WHERE bb.status ='incomplete'AND bb.return_date < CURDATE()


--sikala

SELECT c.country ,COUNT(c2.city_id ) FROM country c
		INNER JOIN city c2 ON c.country_id = c2.country_id
		GROUP BY c.country_id

SELECT c.country ,
		COUNT(c2.city_id) AS count_city,
		JSON_ARRAYAGG(JSON_OBJECT('id',c2.city_id, 'name', c2.city)) AS name_city
			FROM country c
			INNER JOIN city c2 ON c.country_id = c2.country_id
			GROUP BY c.country_id