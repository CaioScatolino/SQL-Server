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

-- INSERINDO DADOS NA TABELA AUTORES --

INSERT INTO tbl_autores (ID_Autor, Nome_Autor, SobreNome_Autor)
VALUES (1 ,'Daniel', 'Barret');

INSERT INTO tbl_autores (ID_Autor, Nome_Autor, SobreNome_Autor)
VALUES (2 ,'Gerald', 'Carter');

INSERT INTO tbl_autores (ID_Autor, Nome_Autor, SobreNome_Autor)
VALUES (3 ,'Mark', 'Sobell');

INSERT INTO tbl_autores (ID_Autor, Nome_Autor, SobreNome_Autor)
VALUES (4 ,'William', 'Stanek');

INSERT INTO tbl_autores (ID_Autor, Nome_Autor, SobreNome_Autor)
VALUES (5 ,'Richard', 'Blum');


-- INSERINDO DADOS NA TABELA EDITORAS --

INSERT INTO tbl_editoras(Nome_Editora) VALUES ('Prentice Hall');

INSERT INTO tbl_editoras(Nome_Editora) VALUES ('O´Reilly');

INSERT INTO tbl_editoras(Nome_Editora) VALUES ('Microsoft Press');

INSERT INTO tbl_editoras(Nome_Editora) VALUES ('Wiley');

-- INSERINDO DADOS NA TABELA LIVROS --

INSERT INTO tbl_livro (Nome_Livro, ISBN, Data_Pub, Preco_Livro,  ID_Autor, ID_Editora)
values ('Linux Command Line and Shell Scripting',143856969, '20091221', 68.35, 5,4),
('SSH, the Secure Shell', 127658789, '20091221', 58.30, 1, 2), 
('Using Samba', 123856789, '20001221', 61.45, 2, 2),
('Fedora and Red Hat Linux', 123346789, '20101101', 62.24,3,1),
('Windows Server 2012 Inside Out', 123356789, '20040517', 66.80, 4,3),
('Microsoft Exchange Server 2010', 123366789,'20001221', 45.30, 4,3);

-- COMANDO SELECT --

SELECT Nome_Autor FROM tbl_autores ORDER BY Nome_Autor DESC;

SELECT Nome_Livro, Preco_livro FROM tbl_Livro ORDER BY Data_Pub ASC;

-- COMANDO DISTINCT --

SELECT DISTINCT ID_Autor FROM tbl_Livro;

-- COMANDO WHERE --

SELECT * FROM tbl_Livro WHERE ID_Autor = '1';

SELECT ID_Autor FROM tbl_autores WHERE SobreNome_Autor = 'Stanek';

-- OPERADORES AND e OR --

SELECT * FROM tbl_Livro
WHERE Preco_livro > 60 AND ID_Livro > 102;
