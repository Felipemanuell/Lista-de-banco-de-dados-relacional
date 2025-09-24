CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias(
	id_categorias BIGINT AUTO_INCREMENT PRIMARY KEY,
    nomeCategoria VARCHAR(255) NOT NULL,
    descricao VARCHAR(1000)
);

CREATE TABLE tb_pizzas(
	id_pizzas BIGINT AUTO_INCREMENT PRIMARY KEY,
    nomePizza VARCHAR(255) NOT NULL,
    preco DECIMAL(6,2) NOT NULL,
    tamanho VARCHAR(50),
    bordaRecheada BOOLEAN,
    id_categorias BIGINT,
    FOREIGN KEY (id_categorias) REFERENCES tb_categorias(id_categorias)
);


INSERT INTO tb_categorias(nomeCategoria, descricao) VALUES
("Tradicional", "Sabores clássicos da pizzaria"),
("Especial", "Sabores premium e diferenciados"),
("Doce", "Pizzas doces"),
("Vegetariana", "Sabores sem carne"),
("Promocional", "Opções em promoção");


INSERT INTO tb_pizzas(nomePizza, preco, tamanho, bordaRecheada, id_categorias) VALUES
("Mussarela", 35.00, "Média", TRUE, 1),
("Calabresa", 40.00, "Grande", FALSE, 1),
("Frango Catupiry", 48.00, "Grande", TRUE, 2),
("Quatro Queijos", 55.00, "Grande", FALSE, 2),
("Chocolate", 60.00, "Média", TRUE, 3),
("Prestígio", 70.00, "Grande", TRUE, 3),
("Vegetariana", 50.00, "Grande", FALSE, 4),
("Portuguesa", 42.00, "Grande", TRUE, 1);


SELECT * FROM tb_pizzas WHERE preco > 45.00;

SELECT * FROM tb_pizzas WHERE preco BETWEEN 50.00 AND 100.00;

SELECT * FROM tb_pizzas WHERE nomePizza LIKE "%M%";

SELECT *
FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.id_categorias = tb_categorias.id_categorias;

SELECT *
FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.id_categorias = tb_categorias.id_categorias
WHERE tb_pizzas.id_categorias = 3;
