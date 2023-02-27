CREATE DATABASE db_Biblioteca;

USE db_Biblioteca;

CREATE TABLE tbl_Livro
(ID_Livro SMALLINT PRIMARY KEY IDENTITY(100,1), -- é o autoincrement (inicial, incrimento)
Nome_Livro VARCHAR(50) NOT NULL,
ISBN VARCHAR(30) NOT NULL UNIQUE,
ID_Autor SMALLINT NOT NULL,
Data_Pub DATETIME NOT NULL,
Preco_livro MONEY NOT NULL
);

CREATE TABLE tbl_autores (
ID_Autor SMALLINT PRIMARY KEY,
Nome_Autor VARCHAR(30),
SobreNome_Autor VARCHAR(60)
);

CREATE TABLE tbl_editoras
(ID_Editora SMALLINT PRIMARY KEY IDENTITY,
Nome_Editora VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_teste_identidade
(ID_Teste SMALLINT PRIMARY KEY IDENTITY,
valor SMALLINT NOT NULL);

INSERT INTO tbl_teste_identidade(valor) VALUES (10);
INSERT INTO tbl_teste_identidade(valor) VALUES (20);
INSERT INTO tbl_teste_identidade(valor) VALUES (30);
INSERT INTO tbl_teste_identidade(valor) VALUES (40);
INSERT INTO tbl_teste_identidade(valor) VALUES (50);

select * from tbl_teste_identidade;

ALTER TABLE tbl_Livro
DROP COLUMN ID_Autor;

ALTER TABLE tbl_Livro
ADD ID_Autor SMALLINT NOT NULL
CONSTRAINT fk_ID_Autor
FOREIGN KEY (ID_Autor) REFERENCES tbl_autores;

ALTER TABLE tbl_Livro
ADD ID_editora SMALLINT NOT NULL
CONSTRAINT fk_id_editora
FOREIGN KEY (ID_editora) REFERENCES tbl_editoras;

ALTER TABLE tbl_Livro
ALTER COLUMN ID_Autor SMALLINT;

DROP TABLE tbl_teste_identidade;

