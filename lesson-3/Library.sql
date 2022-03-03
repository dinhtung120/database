CREATE DATABASE library;

CREATE TABLE category(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL
);

CREATE TABLE author(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL
);

CREATE TABLE company(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    address TEXT
);

CREATE TABLE manage(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    gender ENUM('male','female') NOT NULL,
    birthday DATE NOT NULL,
    mobile TEXT NOT NULL,
    email TEXT NOT NULL,
    password TEXT NOT NULL,
    datestart DATE NOT NULL
);

CREATE TABLE person(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    gender ENUM('male','female') NOT NULL,
    birthday DATE NOT NULL,
    mobile TEXT NOT NULL,
    email TEXT NOT NULL,
    password TEXT NOT NULL
);

CREATE TABLE book(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    date DATE NOT NULL,
    id_company INT,
    amount INT NOT NULL,
    FOREIGN KEY (id_company) REFERENCES company(id)
);

CREATE TABLE bookloan(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_person INT,
    id_manage INT,
    datestart DATE NOT NULL,
    dateend DATE NOT NULL,
    FOREIGN KEY (id_person) REFERENCES person(id),
    FOREIGN KEY (id_manage) REFERENCES manage(id)

);

CREATE TABLE item_bookloan(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_bookloan INT,
    id_book INT,
    amount INT NOT NULL,
    FOREIGN KEY (id_bookloan) REFERENCES bookloan(id),
    FOREIGN KEY (id_book) REFERENCES book(id)
);

CREATE TABLE givebookback(
    id INT PRIMARY KEY AUTO_INCREMENT,
    date DATE NOT NULL
);

CREATE TABLE item_givebookback(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_givebookback INT,
    id_book INT,
    amount INT NOT NULL,
    FOREIGN KEY (id_givebookback) REFERENCES givebookback(id),
    FOREIGN KEY (id_book) REFERENCES book(id)
);

CREATE TABLE book_category(
    id_book INT,
    id_category INT,
    PRIMARY KEY (id_book, id_category),
    FOREIGN KEY (id_book) REFERENCES book(id),
    FOREIGN KEY (id_category) REFERENCES category(id)
);

CREATE TABLE book_author(
    id_book INT,
    id_author INT,
    PRIMARY KEY (id_book, id_author),
    FOREIGN KEY (id_book) REFERENCES book(id),
    FOREIGN KEY (id_author) REFERENCES author(id)
);

CREATE TABLE bookloan_givebookback(
    id_bookloan INT,
    id_givebookback INT,
    PRIMARY KEY (id_bookloan, id_givebookback),
    FOREIGN KEY (id_bookloan) REFERENCES bookloan(id),
    FOREIGN KEY (id_givebookback) REFERENCES givebookback(id)
);






