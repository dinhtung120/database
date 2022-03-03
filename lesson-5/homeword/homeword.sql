CREATE DATABASE answer_question;

CREATE TABLE question(
    id INT PRIMARY KEY AUTO_INCREMENT,
    content TEXT NOT NULL,
    type ENUM('single','multiple') NOT NULL
);

CREATE TABLE answer(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_question INT,
    content TEXT NOT NULL,
    true_content ENUM('true','false') NOT NULL,
	FOREIGN KEY (id_question) REFERENCES question(id)
);


insert into question (id, content, type) values (null, 'Thủ đô của Việt Nam là: ', 'single');

insert into answer (id, id_question, content, true_content) values (null, 1, 'Hà Nội', 'true');
insert into answer (id, id_question, content, true_content) values (null, 1, 'Hoà Bình', 'false');
insert into answer (id, id_question, content, true_content) values (null, 1, 'Nam Định', 'false');
insert into answer (id, id_question, content, true_content) values (null, 1, 'Thái Nguyên', 'false');

