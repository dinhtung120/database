CREATE DATABASE shoes;

CREATE TABLE color(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL
);

CREATE TABLE size(
    id INT PRIMARY KEY AUTO_INCREMENT,
    size TEXT NOT NULL
);

CREATE TABLE brand(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL
);

CREATE TABLE gender(
    id INT PRIMARY KEY AUTO_INCREMENT,
    gender TEXT NOT NULL
);

CREATE TABLE category(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_gender INT,
    name TEXT NOT NULL,
    FOREIGN KEY (id_gender) REFERENCES gender(id)
);

CREATE TABLE product(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    image TEXT NOT NULL,
    id_category INT,
    id_brand INT,
    status ENUM('stocking', 'out of stock'),
    id_gender INT,
    amount INT NOT NULL,
    FOREIGN KEY (id_category) REFERENCES category(id),
    FOREIGN KEY (id_brand) REFERENCES brand(id),
    FOREIGN KEY (id_gender) REFERENCES gender(id)
);

CREATE TABLE price(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_product INT,
    price INT NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (id_product) REFERENCES product(id)
);

CREATE TABLE color_product(
    id_color INT,
    id_product INT,
    PRIMARY KEY (id_color, id_product),
    FOREIGN KEY (id_product) REFERENCES product(id),
    FOREIGN KEY (id_color) REFERENCES color(id)
);

CREATE TABLE size_product(
    id_size INT,
    id_product INT,
    PRIMARY KEY (id_size, id_product),
    FOREIGN KEY (id_product) REFERENCES product(id),
    FOREIGN KEY (id_size) REFERENCES size(id)
);

INSERT INTO color(id, name) VALUES (NULL,'Xanh')
