CREATE DATABASE blog

CREATE TABLE tag(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL
)

CREATE TABLE author(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL
)


CREATE TABLE users(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    mobile TEXT NOT NULL,
    password TEXT NOT NULL,
    avartar TEXT
)

CREATE TABLE post(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    description TEXT NOT NULL,
    author_id INT,
    thumbnail TEXT NOT NULL,
    status TEXT NOT NULL,
    create_at DATE NOT NULL,
    published_at DATE NOT NULL,
    view_count INT NOT NULL,
    vote_score INT,
    post_type TEXT NOT NULL,
    FOREIGN KEY (id_author) REFERENCES author(id)  
)

CREATE TABLE post_tag(
	id_post INT,
    id_tag INT,
    PRIMARY KEY ( id_post, id_tag),
    FOREIGN KEY (id_post) REFERENCES post (id),
    FOREIGN KEY (id_tag) REFERENCES tag(id)
)

CREATE TABLE discuss(
	id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT,
    author_id INT,
    text TEXT NOT NULL,
    is_pulic TEXT NOT NULL,
    create_at DATE NOT NULL,
    FOREIGN KEY (post_id) REFERENCES post (id),
    FOREIGN KEY (author_id) REFERENCES author(id)

)




