-- DDL CRIAÇÃO DA TABELA PARA EXERCÍCIOS

CREATE TABLE FUNCIONARIOS
(
ID int identity(1,1),
NOME VARCHAR(50) NOT NULL,
SALARIO DECIMAL(10,2),
SETOR VARCHAR(30)
)

-- DML SELECT
-- EXEMPLO SLECT
SELECT * FROM FUNCIONARIOS

SELECT NOME, SETOR AS DEPTO
FROM FUNCIONARIOS

-- DML INSERT

INSERT INTO FUNCIONARIOS VALUES ('Joao', 1000, ''), ('Jose', 2000, ''), ('Alexandre', 3000, '')

-- ou

INSERT INTO FUNCIONARIOS (NOME, SALARIO) VALUES ('Pedro', 1000)

-- DML UPDATE
	
UPDATE FUNCIONARIOS SET SALARIO = '1500'
WHERE ID = 1

SELECT * FROM FUNCIONARIOS

-- AUMENTO DE 50% PARA UM DOS FUNCIONÁRIOS

UPDATE FUNCIONARIOS SET SALARIO = SALARIO * 1.5
WHERE ID = 3

-- AUMENTO DE 20% PARA O RESTANTE DOS FUNCIONÁRIOS
UPDATE FUNCIONARIOS SET SALARIO = SALARIO * 1.2
WHERE ID <> 3;

-- MIGRANDO TODOS PARA O SETOR DE TI

UPDATE FUNCIONARIOS SET SETOR = 'TI'
WHERE ID <> 3 OR ID = 3

-- DML DELETE
DELETE FUNCIONARIOS WHERE ID = 2

-- DDL CRIANDO TABELA

CREATE TABLE funcionario
(
	matricula	INT IDENTITY(1,1),
	nome		CHAR(50) NOT NULL,
	sobrenome	CHAR(50) NOT NULL,
	endereco	CHAR(50),
	cidade		CHAR(50),
	pais		CHAR(25),
	data_nasc	DATETIME
)

-- DDL PARA ADICIONAR CHAVE PRIMARIA

ALTER TABLE funcionario ADD PRIMARY KEY (matricula);

-- DDL CRIANDO TABELA COM CHAVE ESTRANGEIRA

CREATE TABLE salario
(
	matricula	INT PRIMARY KEY NOT NULL,
	salario		DECIMAL(10,2) NOT NULL,
	FOREIGN KEY(matricula) REFERENCES funcionario(matricula)
);

SELECT * FROM salario;

-- DDL CRIAÇÃO DE TABELA COM CHAVE PRIMÁRIA

CREATE TABLE audit_salario
	(	
		transacao	INT IDENTITY(1,1),
		matricula	INT NOT NULL,
		data_trans	DATETIME NOT NULL,
		sal_antigo	DECIMAL(10,2),
		sal_novo	DECIMAL(10,2),
		usuario		VARCHAR(20) NOT NULL
	);

--DDL CRIAÇÃO DE INDEX

CREATE INDEX ix_func1 ON funcionario(data_nasc);
CREATE INDEX ix_func2 ON funcionario(cidade, pais);

-- Adicionando uma nova coluna na tabela

ALTER TABLE funcionario ADD genero CHAR(1);
SELECT * FROM funcionario

-- RENOMENADO CAMPO DA TABELA

EXEC sp_rename 'funcionario.endereco', 'ender', 'COLUMN';

EXEC sp_rename 'funcionario.ender', 'endereco', 'COLUMN';

-- ALTERAR TIPO DA COLUNA

ALTER TABLE funcionario ALTER COLUMN endereco VARCHAR(30)

-- DELETANDO COLUNA

ALTER TABLE funcionario DROP COLUMN genero;

-- RENOMEANDO TABELA

EXEC sp_rename 'funcionario', 'func'

EXEC sp_rename 'func', 'funcionario'

-- EXCLUINDO DATABASE

CREATE DATABASE TESTE

DROP DATABASE TESTE

-- CRIANDO UMA VIEW

CREATE VIEW v_funcionario
	AS
	SELECT * FROM funcionario;

ALTER VIEW v_funcionario
	AS
	SELECT ID, NOME FROM FUNCIONARIOS

