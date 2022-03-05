CREATE DATABASE read_novel;


CREATE TABLE users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    thumbnail TEXT,
    gender ENUM('Male','Female') NOT NULL,
    email TEXT NOT NULL,
    mobile VARCHAR(15) NOT NULL,
    username TEXT NOT NULL,
    password TEXT NOT NULL,
    birthday DATE NOT NULL,
    zone INT NOT NULL,
    status ENUM('active','disable') NOT NULL
);

CREATE TABLE novel(
    id INT PRIMARY KEY AUTO_INCREMENT,
    title TEXT NOT NULL,
    thumbnail TEXT,
    description TEXT,
    status ENUM('complete','incomplete','cancel') NOT NULL,
    id_user INT,
    create_at DATE NOT NULL,
    FOREIGN KEY (id_user) REFERENCES users(id)
);

CREATE TABLE comment(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT,
    id_novel INT,
    id_parent INT,
    content TEXT NOT NULL,
    create_at DATE NOT NULL,
    FOREIGN KEY (id_user) REFERENCES users(id),
    FOREIGN KEY (id_novel) REFERENCES novel(id),
    FOREIGN KEY (id_parent) REFERENCES comment(id)
);

CREATE TABLE review(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT,
    id_novel INT,
    content TEXT NOT NULL,
    score INT,
    create_at DATE NOT NULL,
    FOREIGN KEY (id_user) REFERENCES users(id),
    FOREIGN KEY (id_novel) REFERENCES novel(id)
);

CREATE TABLE follow(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT,
    id_novel INT,
    FOREIGN KEY (id_user) REFERENCES users(id),
    FOREIGN KEY (id_novel) REFERENCES novel(id)
);

CREATE TABLE love(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT,
    id_novel INT,
    FOREIGN KEY (id_user) REFERENCES users(id),
    FOREIGN KEY (id_novel) REFERENCES novel(id)
);

CREATE TABLE category(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    description TEXT
);

CREATE TABLE novel_category(
    id_novel INT,
    id_category INT,
    PRIMARY KEY (id_novel, id_category),
    FOREIGN KEY (id_novel) REFERENCES novel(id),
    FOREIGN KEY (id_category) REFERENCES category(id)
);

CREATE TABLE author(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    thumbnail TEXT,
    address TEXT,
    birthday DATE
);

CREATE TABLE novel_author(
    id_novel INT,
    id_author INT,
    PRIMARY KEY (id_novel, id_author),
    FOREIGN KEY (id_novel) REFERENCES novel(id),
    FOREIGN KEY (id_author) REFERENCES author(id)
);

CREATE TABLE type(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL
);

CREATE TABLE novel_type(
    id_novel INT,
    id_type INT,
    PRIMARY KEY (id_novel, id_type),
    FOREIGN KEY (id_novel) REFERENCES novel(id),
    FOREIGN KEY (id_type) REFERENCES type(id)
);

CREATE TABLE tag(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL
);

CREATE TABLE novel_tag(
    id_novel INT,
    id_tag INT,
    PRIMARY KEY (id_novel, id_tag),
    FOREIGN KEY (id_novel) REFERENCES novel(id),
    FOREIGN KEY (id_tag) REFERENCES tag(id)
);

CREATE TABLE chapter(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_novel INT,
    id_user INT,
    number INT NOT NULL,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    FOREIGN KEY (id_novel) REFERENCES novel(id),
    FOREIGN KEY (id_user) REFERENCES users(id)
);

CREATE TABLE like_chapter(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT,
    id_chapter INT,
    FOREIGN KEY (id_user) REFERENCES users(id),
    FOREIGN KEY (id_chapter) REFERENCES chapter(id)
);

CREATE TABLE view_chapter(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_chapter INT,
    ip TEXT NOT NULL,
    FOREIGN KEY (id_chapter) REFERENCES chapter(id)
);

CREATE TABLE report_chapter(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT,
    id_chapter INT,
    content TEXT NOT NULL,
    create_at DATE,
    FOREIGN KEY (id_user) REFERENCES users(id),
    FOREIGN KEY (id_chapter) REFERENCES chapter(id)
);



--them data

insert into users (id, name, thumbnail, gender, email, mobile, username, password, birthday, zone,status) values (null, 'Son Tung', null, 'Male', 'newstarvn01@gmail.com', '462-592-2036', 'sontung', '123456', '1994-11-03', 1,'active');
insert into users (id, name, thumbnail, gender, email, mobile, username, password, birthday, zone,status) values (null, 'Ade Tommasetti', null, 'Male', 'atommasetti1@loc.gov', '483-400-4273', 'atommasetti1', 'aLCearwa', '2005-05-17', 2,'active');
insert into users (id, name, thumbnail, gender, email, mobile, username, password, birthday, zone,status) values (null, 'Juana Rugiero', null, 'Male', 'jrugiero2@paypal.com', '255-342-4388', 'jrugiero2', 'Di34E5c', '1996-01-27', 2,'active');
insert into users (id, name, thumbnail, gender, email, mobile, username, password, birthday, zone,status) values (null, 'Thadeus Paschke', null, 'Male', 'tpaschke3@twitter.com', '148-362-5743', 'tpaschke3', 'H7TFA1xkuQ', '2000-08-14', 3,'active');
insert into users (id, name, thumbnail, gender, email, mobile, username, password, birthday, zone,status) values (null, 'Mommy Whitebread', null, 'Female', 'mwhitebread4@mapquest.com', '568-296-0060', 'mwhitebread4', 'WGoAq0LWJ', '1996-09-25', 3,'active');
insert into users (id, name, thumbnail, gender, email, mobile, username, password, birthday, zone,status) values (null, 'Karlie La Torre', null, 'Female', 'kla5@free.fr', '128-119-0604', 'kla5', 'Otr0df0ptBc3', '1997-07-14', 3,'active');
insert into users (id, name, thumbnail, gender, email, mobile, username, password, birthday, zone,status) values (null, 'Amaleta Northage', null, 'Female', 'anorthage6@state.tx.us', '806-903-7135', 'anorthage6', 'pOLgJ4XFXVH', '1991-08-06', 3,'active');
insert into users (id, name, thumbnail, gender, email, mobile, username, password, birthday, zone,status) values (null, 'Amerigo Munkley', null, 'Female', 'amunkley7@fema.gov', '230-870-4277', 'amunkley7', 'ZvFOH4XF5', '1990-05-26', 3,'active');
insert into users (id, name, thumbnail, gender, email, mobile, username, password, birthday, zone,status) values (null, 'Itch Wragge', null, 'Female', 'iwragge8@ftc.gov', '194-681-6405', 'iwragge8', 'R2F90WUgw', '1996-01-05', 3,'active');
insert into users (id, name, thumbnail, gender, email, mobile, username, password, birthday, zone,status) values (null, 'Jacinthe Winch', null, 'Female', 'jwinch9@sourceforge.net', '541-457-3627', 'jwinch9', 'MMYbdEx', '1993-04-29', 3,'active');

insert into novel (id, title, thumbnail, description, status, id_user, create_at) values (null, 'Mục Thần Ký', null, null, 'complete', 3, '2022-01-12');
insert into novel (id, title, thumbnail, description, status, id_user, create_at) values (null, 'Tru Tiên', null, null, 'complete', 1, '2022-01-24');
insert into novel (id, title, thumbnail, description, status, id_user, create_at) values (null, 'Vô Tận Võ Trang', null, null, 'complete', 1, '2022-02-25');
insert into novel (id, title, thumbnail, description, status, id_user, create_at) values (null, 'Luân Hồi Lạc Viên', null, null, 'incomplete', 1, '2022-01-28');
insert into novel (id, title, thumbnail, description, status, id_user, create_at) values (null, 'Tiên Nghịch', null, null, 'complete', 1, '2022-01-17');
insert into novel (id, title, thumbnail, description, status, id_user, create_at) values (null, 'Hắc Ám Huyết Thời Đại', null, null, 'incomplete', 3, '2022-02-08');
insert into novel (id, title, thumbnail, description, status, id_user, create_at) values (null, 'Tu Chân Liêu Thiên Quần', null, null, 'complete', 1, '2022-02-18');
insert into novel (id, title, thumbnail, description, status, id_user, create_at) values (null, 'Toàn Chức Pháp Sư', null, null, 'incomplete', 2, '2022-02-05');
insert into novel (id, title, thumbnail, description, status, id_user, create_at) values (null, 'Lê Minh Chi Kiếm', null, null, 'incomplete', 3, '2022-01-27');
insert into novel (id, title, thumbnail, description, status, id_user, create_at) values (null, 'Chấp Ma ', null, null, 'complete', 2, '2022-02-28');

insert into comment (id, id_user, id_novel, id_parent, content, create_at) values (null, 6, 7, null, 'truyện hay', '2022-03-03');
insert into comment (id, id_user, id_novel, id_parent, content, create_at) values (null, 7, 3, null, 'hay', '2022-03-02');
insert into comment (id, id_user, id_novel, id_parent, content, create_at) values (null, 1, 10, null, 'truyện hay', '2022-03-03');
insert into comment (id, id_user, id_novel, id_parent, content, create_at) values (null, 10, 4, null, 'truyện rất hay', '2022-03-03');
insert into comment (id, id_user, id_novel, id_parent, content, create_at) values (null, 2, 10, null, 'đáng đọc', '2022-03-03');
insert into comment (id, id_user, id_novel, id_parent, content, create_at) values (null, 3, 10, null, 'truyện chán', '2022-03-02');
insert into comment (id, id_user, id_novel, id_parent, content, create_at) values (null, 9, 6, null, 'rất chán', '2022-03-02');
insert into comment (id, id_user, id_novel, id_parent, content, create_at) values (null, 9, 10, null, 'không hay', '2022-03-02');
insert into comment (id, id_user, id_novel, id_parent, content, create_at) values (null, 5, 4, null, 'truyện hay', '2022-03-02');
insert into comment (id, id_user, id_novel, id_parent, content, create_at) values (null, 5, 10, null, 'đọc được', '2022-03-02');

insert into review (id, id_user, id_novel, content, score, create_at) values (null, 2, 3, 'M', 78, '2022-03-03');
insert into review (id, id_user, id_novel, content, score, create_at) values (null, 8, 7, '2XL', 92, '2022-03-02');
insert into review (id, id_user, id_novel, content, score, create_at) values (null, 10, 1, '3XL', 89, '2022-03-03');
insert into review (id, id_user, id_novel, content, score, create_at) values (null, 4, 2, 'S', 98, '2022-03-02');
insert into review (id, id_user, id_novel, content, score, create_at) values (null, 9, 9, 'L', 67, '2022-03-03');
insert into review (id, id_user, id_novel, content, score, create_at) values (null, 7, 4, 'XL', 72, '2022-03-03');
insert into review (id, id_user, id_novel, content, score, create_at) values (null, 4, 1, 'L', 73, '2022-03-02');
insert into review (id, id_user, id_novel, content, score, create_at) values (null, 8, 2, '3XL', 73, '2022-03-03');
insert into review (id, id_user, id_novel, content, score, create_at) values (null, 5, 1, '2XL', 59, '2022-03-02');
insert into review (id, id_user, id_novel, content, score, create_at) values (null, 3, 3, 'XL', 92, '2022-03-03');

insert into follow (id, id_user, id_novel) values (null, 8, 1);
insert into follow (id, id_user, id_novel) values (null, 10, 3);
insert into follow (id, id_user, id_novel) values (null, 3, 10);
insert into follow (id, id_user, id_novel) values (null, 3, 2);
insert into follow (id, id_user, id_novel) values (null, 1, 9);
insert into follow (id, id_user, id_novel) values (null, 8, 9);
insert into follow (id, id_user, id_novel) values (null, 1, 7);
insert into follow (id, id_user, id_novel) values (null, 6, 9);
insert into follow (id, id_user, id_novel) values (null, 5, 1);
insert into follow (id, id_user, id_novel) values (null, 2, 5);

insert into love (id, id_user, id_novel) values (null, 6, 4);
insert into love (id, id_user, id_novel) values (null, 7, 4);
insert into love (id, id_user, id_novel) values (null, 2, 2);
insert into love (id, id_user, id_novel) values (null, 8, 2);
insert into love (id, id_user, id_novel) values (null, 10, 1);
insert into love (id, id_user, id_novel) values (null, 8, 7);
insert into love (id, id_user, id_novel) values (null, 8, 6);
insert into love (id, id_user, id_novel) values (null, 6, 8);
insert into love (id, id_user, id_novel) values (null, 5, 2);
insert into love (id, id_user, id_novel) values (null, 10, 3);

insert into category (id, name, description) values (null, 'Tiên Hiệp', null);
insert into category (id, name, description) values (null, 'Huyền Huyễn', null);
insert into category (id, name, description) values (null, 'Đô Thị', null);
insert into category (id, name, description) values (null, 'Khoa Huyễn', null);
insert into category (id, name, description) values (null, 'Kỳ Huyễn', null);
insert into category (id, name, description) values (null, 'Võ Hiệp', null);
insert into category (id, name, description) values (null, 'Lịch Sử', null);
insert into category (id, name, description) values (null, 'Đồng Nhân', null);
insert into category (id, name, description) values (null, 'Quân Sự', null);
insert into category (id, name, description) values (null, 'Ngôn Tình', null);

insert into author (id, name, thumbnail, address, birthday) values (null, 'Rees Stode', null, null, null);
insert into author (id, name, thumbnail, address, birthday) values (null, 'Ettore Avory', null, null, null);
insert into author (id, name, thumbnail, address, birthday) values (null, 'Golda Jezzard', null, null, null);
insert into author (id, name, thumbnail, address, birthday) values (null, 'Krista Scogin', null, null, null);
insert into author (id, name, thumbnail, address, birthday) values (null, 'Haze Oppery', null, null, null);
insert into author (id, name, thumbnail, address, birthday) values (null, 'Valery Videler', null, null, null);
insert into author (id, name, thumbnail, address, birthday) values (null, 'Yoko Cartmel', null, null, null);
insert into author (id, name, thumbnail, address, birthday) values (null, 'Tore Roggers', null, null, null);
insert into author (id, name, thumbnail, address, birthday) values (null, 'Noach Scothorn', null, null, null);
insert into author (id, name, thumbnail, address, birthday) values (null, 'Dolf Hedman', null, null, null);

insert into type (id, name) values (null, 'Truyện Sáng Tác');
insert into type (id, name) values (null, 'Truyện Convert');
insert into type (id, name) values (null, 'Truyện Dịch');

insert into tag (id, name) values (null, 'Sủng Vật');
insert into tag (id, name) values (null, 'Đạo Tặc');
insert into tag (id, name) values (null, 'Cô Nhi');
insert into tag (id, name) values (null, 'Trọng Sinh');
insert into tag (id, name) values (null, 'Pháp Sư');

insert into novel_category (id_novel, id_category) values (1, 8);
insert into novel_category (id_novel, id_category) values (2, 1);
insert into novel_category (id_novel, id_category) values (3, 1);
insert into novel_category (id_novel, id_category) values (4, 4);
insert into novel_category (id_novel, id_category) values (5, 10);
insert into novel_category (id_novel, id_category) values (6, 9);
insert into novel_category (id_novel, id_category) values (8, 5);
insert into novel_category (id_novel, id_category) values (7, 9);
insert into novel_category (id_novel, id_category) values (9, 2);
insert into novel_category (id_novel, id_category) values (10, 2);
insert into novel_category (id_novel, id_category) values (2, 4);
insert into novel_category (id_novel, id_category) values (9, 4);
insert into novel_category (id_novel, id_category) values (8, 6);
insert into novel_category (id_novel, id_category) values (10, 7);
insert into novel_category (id_novel, id_category) values (4, 3);
insert into novel_category (id_novel, id_category) values (9, 3);
insert into novel_category (id_novel, id_category) values (4, 1);
insert into novel_category (id_novel, id_category) values (4, 8);
insert into novel_category (id_novel, id_category) values (2, 2);
insert into novel_category (id_novel, id_category) values (10, 1);

insert into novel_author (id_novel, id_author) values (1, 7);
insert into novel_author (id_novel, id_author) values (2, 3);
insert into novel_author (id_novel, id_author) values (3, 7);
insert into novel_author (id_novel, id_author) values (4, 6);
insert into novel_author (id_novel, id_author) values (5, 6);
insert into novel_author (id_novel, id_author) values (7, 5);
insert into novel_author (id_novel, id_author) values (6, 8);
insert into novel_author (id_novel, id_author) values (8, 6);
insert into novel_author (id_novel, id_author) values (9, 9);
insert into novel_author (id_novel, id_author) values (10, 4);

insert into novel_type (id_novel, id_type) values (3, 1);
insert into novel_type (id_novel, id_type) values (4, 2);
insert into novel_type (id_novel, id_type) values (2, 1);
insert into novel_type (id_novel, id_type) values (1, 3);
insert into novel_type (id_novel, id_type) values (6, 1);
insert into novel_type (id_novel, id_type) values (7, 1);
insert into novel_type (id_novel, id_type) values (5, 3);
insert into novel_type (id_novel, id_type) values (8, 1);
insert into novel_type (id_novel, id_type) values (9, 2);
insert into novel_type (id_novel, id_type) values (10, 2);

insert into novel_tag (id_novel, id_tag) values (10, 5);
insert into novel_tag (id_novel, id_tag) values (9, 4);
insert into novel_tag (id_novel, id_tag) values (8, 4);
insert into novel_tag (id_novel, id_tag) values (7, 4);
insert into novel_tag (id_novel, id_tag) values (6, 3);
insert into novel_tag (id_novel, id_tag) values (5, 5);
insert into novel_tag (id_novel, id_tag) values (4, 4);
insert into novel_tag (id_novel, id_tag) values (3, 2);
insert into novel_tag (id_novel, id_tag) values (2, 4);
insert into novel_tag (id_novel, id_tag) values (1, 4);

insert into chapter (id, id_novel, id_user, number, title, content) values (null, 1, 1, 1, 'Chương 1', 'Chương 1');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 1, 1, 2, 'Chương 2', 'Chương 2');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 1, 1, 3, 'Chương 3', 'Chương 3');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 1, 1, 4, 'Chương 4', 'Chương 4');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 1, 1, 5, 'Chương 5', 'Chương 5');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 1, 1, 6, 'Chương 6', 'Chương 6');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 1, 1, 7, 'Chương 7', 'Chương 7');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 1, 1, 8, 'Chương 8', 'Chương 8');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 1, 1, 9, 'Chương 9', 'Chương 9');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 1, 1, 10, 'Chương 10', 'Chương 10');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 2, 1, 1, 'Chương 1', 'Chương 1');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 2, 1, 2, 'Chương 2', 'Chương 2');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 2, 1, 3, 'Chương 3', 'Chương 3');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 2, 1, 4, 'Chương 4', 'Chương 4');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 2, 1, 5, 'Chương 5', 'Chương 5');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 2, 1, 6, 'Chương 6', 'Chương 6');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 2, 1, 7, 'Chương 7', 'Chương 7');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 2, 1, 8, 'Chương 8', 'Chương 8');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 2, 1, 9, 'Chương 9', 'Chương 9');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 2, 1, 10, 'Chương 10', 'Chương 10');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 3, 1, 1, 'Chương 1', 'Chương 1');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 3, 1, 2, 'Chương 2', 'Chương 2');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 3, 1, 3, 'Chương 3', 'Chương 3');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 3, 1, 4, 'Chương 4', 'Chương 4');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 3, 1, 5, 'Chương 5', 'Chương 5');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 3, 1, 6, 'Chương 6', 'Chương 6');
insert into chapter (id, id_novel, id_user, number, tit`le, content) values (null, 3, 1, 7, 'Chương 7', 'Chương 7');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 3, 1, 8, 'Chương 8', 'Chương 8');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 3, 1, 9, 'Chương 9', 'Chương 9');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 3, 1, 10, 'Chương 10', 'Chương 10');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 4, 1, 1, 'Chương 1', 'Chương 1');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 4, 1, 2, 'Chương 2', 'Chương 2');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 4, 1, 3, 'Chương 3', 'Chương 3');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 4, 1, 4, 'Chương 4', 'Chương 4');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 4, 1, 5, 'Chương 5', 'Chương 5');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 4, 1, 6, 'Chương 6', 'Chương 6');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 4, 1, 7, 'Chương 7', 'Chương 7');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 4, 1, 8, 'Chương 8', 'Chương 8');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 4, 1, 9, 'Chương 9', 'Chương 9');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 4, 1, 10, 'Chương 10', 'Chương 10');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 5, 1, 1, 'Chương 1', 'Chương 1');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 5, 1, 2, 'Chương 2', 'Chương 2');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 5, 1, 3, 'Chương 3', 'Chương 3');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 5, 1, 4, 'Chương 4', 'Chương 4');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 5, 1, 5, 'Chương 5', 'Chương 5');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 5, 1, 6, 'Chương 6', 'Chương 6');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 5, 1, 7, 'Chương 7', 'Chương 7');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 5, 1, 8, 'Chương 8', 'Chương 8');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 5, 1, 9, 'Chương 9', 'Chương 9');
insert into chapter (id, id_novel, id_user, number, title, content) values (null, 5, 1, 10, 'Chương 10', 'Chương 10');

insert into like_chapter (id, id_user, id_chapter) values (null, 1, 1);
insert into like_chapter (id, id_user, id_chapter) values (null, 2, 2);
insert into like_chapter (id, id_user, id_chapter) values (null, 3, 3);
insert into like_chapter (id, id_user, id_chapter) values (null, 4, 4);
insert into like_chapter (id, id_user, id_chapter) values (null, 5, 5);
insert into like_chapter (id, id_user, id_chapter) values (null, 6, 6);
insert into like_chapter (id, id_user, id_chapter) values (null, 7, 7);
insert into like_chapter (id, id_user, id_chapter) values (null, 8, 8);
insert into like_chapter (id, id_user, id_chapter) values (null, 9, 9);
insert into like_chapter (id, id_user, id_chapter) values (null, 10, 10);

insert into view_chapter (id, id_chapter, ip) values (null, 2, '197.133.133.174');
insert into view_chapter (id, id_chapter, ip) values (null, 10, '126.16.218.137');
insert into view_chapter (id, id_chapter, ip) values (null, 6, '109.139.255.89');
insert into view_chapter (id, id_chapter, ip) values (null, 1, '48.43.205.91');
insert into view_chapter (id, id_chapter, ip) values (null, 8, '177.62.113.57');
insert into view_chapter (id, id_chapter, ip) values (null, 4, '172.180.40.130');
insert into view_chapter (id, id_chapter, ip) values (null, 10, '221.243.213.28');
insert into view_chapter (id, id_chapter, ip) values (null, 5, '95.140.157.18');
insert into view_chapter (id, id_chapter, ip) values (null, 10, '4.241.109.151');
insert into view_chapter (id, id_chapter, ip) values (null, 9, '15.85.59.202');
insert into view_chapter (id, id_chapter, ip) values (null, 3, '23.125.106.222');
insert into view_chapter (id, id_chapter, ip) values (null, 9, '140.111.163.193');
insert into view_chapter (id, id_chapter, ip) values (null, 8, '138.49.185.149');
insert into view_chapter (id, id_chapter, ip) values (null, 1, '0.156.230.225');
insert into view_chapter (id, id_chapter, ip) values (null, 3, '93.246.13.181');
insert into view_chapter (id, id_chapter, ip) values (null, 3, '30.229.115.173');
insert into view_chapter (id, id_chapter, ip) values (null, 1, '184.18.228.229');
insert into view_chapter (id, id_chapter, ip) values (null, 2, '181.171.37.27');
insert into view_chapter (id, id_chapter, ip) values (null, 10, '70.1.227.211');
insert into view_chapter (id, id_chapter, ip) values (null, 7, '240.32.93.164');

insert into report_chapter (id, id_user, id_chapter, content, create_at) values (null, 1, 1, 'Female', '2022-03-04');
insert into report_chapter (id, id_user, id_chapter, content, create_at) values (null, 2, 2, 'Male', '2022-03-04');
insert into report_chapter (id, id_user, id_chapter, content, create_at) values (null, 3, 3, 'Male', '2022-03-04');
insert into report_chapter (id, id_user, id_chapter, content, create_at) values (null, 4, 4, 'Female', '2022-03-04');
insert into report_chapter (id, id_user, id_chapter, content, create_at) values (null, 5, 5, 'Male', '2022-03-04');
insert into report_chapter (id, id_user, id_chapter, content, create_at) values (null, 6, 6, 'Female', '2022-03-04');
insert into report_chapter (id, id_user, id_chapter, content, create_at) values (null, 7, 7, 'Male', '2022-03-04');
insert into report_chapter (id, id_user, id_chapter, content, create_at) values (null, 8, 8, 'Female', '2022-03-04');
insert into report_chapter (id, id_user, id_chapter, content, create_at) values (null, 9, 9, 'Male', '2022-03-04');
insert into report_chapter (id, id_user, id_chapter, content, create_at) values (null, 10, 10, 'Male', '2022-03-04');

