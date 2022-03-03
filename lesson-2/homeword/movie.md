# Quản lý phim #
### Tạo database ##
```sql
CREATE DATABASE movie
```

### Tạo bảng actor ###
```sql
CREATE TABLE actor(
id INT PRIMARY KEY AUTO_INCREMENT,
last_name TEXT NOT NULL,
first_name TEXT NOT NULL,
avatar TEXT
)
```
CREATE TABLE directors(
id INT PRIMARY KEY AUTO_INCREMENT,
name TEXT NOT NULL,
avatar TEXT,
description TEXT NOT NULL
)

CREATE TABLE category(
id INT PRIMARY KEY AUTO_INCREMENT,
name TEXT NOT NULL
)

CREATE TABLE film (
id INT PRIMARY KEY AUTO_INCREMENT,
title TEXT NOT NULL,
description TEXT NOT NULL,
poster TEXT NOT NULL,
length INT NOT NULL,
rating VARCHAR(10),
id_directors INT,
release_date DATE,
FOREIGN KEY (id_directors) REFERENCES directors(id)
)

CREATE TABLE film_actor(
id_film INT NOT NULL,
id_actor INT NOT NULL,
PRIMARY KEY (id_film, id_actor),
FOREIGN KEY (id_film) REFERENCES film(id),
FOREIGN KEY (id_actor) REFERENCES actor(id)
)

CREATE TABLE film_category(
id_film INT NOT NULL,
id_category INT NOT NULL,
PRIMARY KEY (id_film, id_category),
FOREIGN KEY (id_film) REFERENCES film(id),
FOREIGN KEY (id_category) REFERENCES category(id)
)





