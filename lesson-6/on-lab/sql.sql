--answer_question
SELECT q.content, JSON_ARRAYAGG(JSON_OBJECT('dap an', a.content,'dap an dung',a.true_content)) AS dap_an
	FROM question q
	INNER JOIN answer a ON q.id = a.id_question
	GROUP BY q.id
	ORDER BY RAND()
	LIMIT 1

--blog
SELECT p.title, p.content,p.create_at,
		JSON_ARRAYAGG(t.name) AS tag,
		JSON_OBJECT('ten',a.name, 'amount', (SELECT COUNT(p.id) FROM author a
												INNER JOIN post p ON p.id_author =a.id
												WHERE a.id = (SELECT p2.id_author FROM post p2 WHERE p2.id = 1))) AS tac_gia,
		(SELECT JSON_ARRAYAGG(JSON_OBJECT('id',d.id ,'name',a.name ,'comment',d.comment ,'tao',d.create_at)) AS comment FROM discuss d
			INNER JOIN post p ON d.id_post =p.id
			INNER JOIN author a ON a.id = d.id_author
			WHERE p.id =1) AS comment
		FROM post p
		INNER JOIN post_tag pt ON pt.id_post = p.id
		INNER JOIN tag t ON t.id = pt.id_tag
		INNER JOIN author a ON a.id = p.id_author
		WHERE p.id = 1


SELECT COUNT(p.id) FROM author a
		INNER JOIN post p ON p.id_author =a.id
		WHERE a.id = (SELECT p2.id_author FROM post p2 WHERE p2.id = 1)

SELECT JSON_ARRAYAGG(JSON_OBJECT('id',d.id ,'name',a.name ,'comment',d.comment ,'tao',d.create_at)) AS comment FROM discuss d
		INNER JOIN post p ON d.id_post =p.id
		INNER JOIN author a ON a.id = d.id_author
		WHERE p.id =1


select p.title , p.content, p.create_at,
	(select JSON_ARRAYAGG(t2.name)
			from tag t2
			inner join post_tag pt2 on pt2.id_tag= t2.id
			 where pt2.id_post= 1) as tag,
	JSON_OBJECT("id",a.id, "name", a.name, "amount", (select count(p.id)
														from author a
														inner join post p on a.id = p.id_author
														where a.id = (select p2.id_author
																	from post p2
																	where p2.id = 1))) as author,
	(SELECT JSON_ARRAYAGG(JSON_OBJECT("id", d.id,"name", a.name,"comment", d.comment, "create_at",d.create_at ))
	FROM discuss d
	INNER JOIN post p on p.id = d.id_post
	INNER JOIN author a ON a.id  = d.id_author
	WHERE p.id = 1) as discuss
from post p
inner join author a on a.id = p.id_author
where p.id = 1



SELECT p.thumnail, p.title ,p.description ,p.create_at FROM post p
		INNER JOIN category c ON c.id = p.id_category
		WHERE c.name = 'Blog' AND p.status = 'public'
		ORDER BY p.create_at DESC


