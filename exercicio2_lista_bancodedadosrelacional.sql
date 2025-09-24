/*Crie a tabela tb_classes e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar os personagens do Game Online.
Crie a tabela tb_personagens e determine 4 atributos, além da Chave Primária, relevantes aos personagens do Game Online.
Não esqueça de criar a Foreign Key da tabela tb_classes na tabela tb_personagens.
Insira 5 registros na tabela tb_classes.
Insira 8 registros na tabela tb_personagens, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_classes.
Faça um SELECT que retorne todes os personagens cujo poder de ataque seja maior do que 2000.
Faça um SELECT que retorne todes os personagens cujo poder de defesa esteja no intervalo 1000 e 2000.
Faça um SELECT utilizando o operador LIKE, buscando todes os personagens que possuam a letra C no atributo nome.
Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes.
Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes, onde traga apenas os personagens que pertençam a uma classe específica (Exemplo: Todes os personagens da classe dos arqueiros).
Salve todas as queries para cada um dos requisitos do exercício em um único script (arquivo .SQL) e coloque no seu Github pessoal, no repositório que você criou sobre Banco de dados.*/

CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_classes(
	id_classes BIGINT AUTO_INCREMENT PRIMARY KEY,
    nomeClasse VARCHAR(255) NOT NULL,
    passiva VARCHAR(1000)
);

CREATE TABLE tb_personagens(
	id_personagens BIGINT AUTO_INCREMENT PRIMARY KEY,
    nomePersonagem VARCHAR(255) NOT NULL,
    ataque INT NOT NULL,
    defesa INT NOT NULL,
    nivel INT NOT NULL,
    id_classes BIGINT,
    FOREIGN KEY (id_classes) REFERENCES tb_classes(id_classes)
);


INSERT INTO tb_classes(nomeClasse, passiva) VALUES
("Mago", "Explosão de dano mágico à distância"),
("Lutador", "Resistência e dano físico moderado"),
("Assassino", "Mobilidade e alto dano em pouco tempo"),
("Tanque", "Alta defesa e controle de grupo"),
("Atirador", "Alto dano físico contínuo à distância");


INSERT INTO tb_personagens(nomePersonagem, ataque, defesa, nivel, id_classes) VALUES
("Ahri", 2500, 1200, 6, 1);      


SELECT * FROM tb_personagens WHERE ataque > 2000;

SELECT * FROM tb_personagens WHERE defesa BETWEEN 1000 AND 2000;

SELECT * FROM tb_personagens WHERE nomePersonagem LIKE "%C%";

SELECT *
FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.id_classes = tb_classes.id_classes;

SELECT *
FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.id_classes = tb_classes.id_classes
WHERE tb_personagens.id_classes = 1;   

