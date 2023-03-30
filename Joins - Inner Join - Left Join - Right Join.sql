--INNER JOIN RETORNA REGISTROS QUE TEM VALORES CORRESPONDENTES EM AMBAS AS TABELAS

--LEFT (OUTER) JOIN: RETORNA TODOS OS REGISTROS DA TABELA � ESQUERDA E OS REGISTROS CORRESPONDENTES
--DA TABELA DA DIREITA

--RIGHT (OUTER) JOIN: RETORNA TODOS OS REGISTROS DA TABELA DA DIRETA E OS REGISTROS CORRESPONDENTES
--DA TABELA DA ESQUERDA

--FULL (OUTER) JOIN: RETORNA TODOS OS REGISTROS QUANDO HOUVER UMA CORRESPOND�NCIA NA TABELA � ESQUERDA OU DIREITA

-- CRIA��O DA TABELA DE ALUNOS

CREATE TABLE alunos
(id_aluno int identity(1,1),
nome varchar(20) not null
);

-- CRIA��O DA TABELA DISCIPLINA

CREATE TABLE disciplina
(
	id_disciplina int identity(1,1),
	nome_disc varchar(20)
);

-- CRIA��O DA TABELA MATRICULA

CREATE TABLE matricula
(
 id_aluno int,
 id_disciplina int,
 periodo varchar(10)
 );

 -- ALTERANDO CAMPO ID_ALUNO e ID_DISCIPLINA DA MATRICULA PARA N�O PERMITIR NULL

 ALTER TABLE matricula ALTER COLUMN id_aluno INT NOT NULL;
 ALTER TABLE matricula ALTER COLUMN id_disciplina INT NOT NULL;

 -- ADICIONANDO CHAVE PRIM�RIA NAS TABELAS

 ALTER TABLE disciplina ADD CONSTRAINT PK2 PRIMARY KEY (id_disciplina)
 ALTER TABLE alunos ADD CONSTRAINT PK1 PRIMARY KEY (id_aluno)

 -- ADICIONANDO FOREIGN KEYS

 ALTER TABLE matricula
 ADD CONSTRAINT FK_MAT1 FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno)
 
 ALTER TABLE matricula
 ADD CONSTRAINT FK_MAT2 FOREIGN KEY (id_disciplina) REFERENCES disciplina (id_disciplina)

 -- INSERINDO REGISTRO ALUNOS

 INSERT INTO alunos VALUES ('Joao'), ('Maria'), ('Pedro'), ('Tiago'), ('Henrique')

 -- INSERT REGISTRO DISCIPLINAS

 INSERT INTO disciplina VALUES
 ('F�sica'), ('Qu�mica'), ('Matem�tica'), ('Banco de Dados'), ('Programa��o')

 -- INSERINDO MATRICULA DE ALUNOS

 INSERT INTO MATRICULA VALUES ('1', '1', 'Noturno')
 INSERT INTO MATRICULA VALUES ('1', '2', 'Vespertino')
 INSERT INTO MATRICULA VALUES ('1', '3', 'Matutino')

 INSERT INTO MATRICULA VALUES ('2', '3', 'Noturno')
 INSERT INTO MATRICULA VALUES ('2', '4', 'Noturno')

 INSERT INTO MATRICULA VALUES ('3', '1', 'Noturno')
 INSERT INTO MATRICULA VALUES ('3', '3', 'Noturno')
 INSERT INTO MATRICULA VALUES ('3', '4', 'Noturno')

 INSERT INTO MATRICULA VALUES ('5', '1', 'Matutino')
 INSERT INTO MATRICULA VALUES ('5', '2', 'Vespertino')
 INSERT INTO MATRICULA VALUES ('5', '4', 'Noturno')

 -- INNER JOIN
 -- NOTA-SE QUE O ALUNO 4 SUMIU, POIS N�O TEM DISCIPLINA CADASTRADA PRA ELE

 SELECT 
	A.id_aluno,
	A.nome,
	M.periodo,
	D.nome_disc
		FROM alunos A
		INNER JOIN matricula M ON M.id_aluno = A.id_aluno
		INNER JOIN disciplina D ON M.id_disciplina = D.id_disciplina

-- LEFT JOIN
-- NOTA-SE QUE APARECEU NULL PARA DISCIPLINA E PERIODO DO ALUNO 4

 SELECT 
	A.id_aluno,
	A.nome,
	M.periodo,
	D.nome_disc
		FROM alunos A
		LEFT JOIN matricula M ON M.id_aluno = A.id_aluno
		LEFT JOIN disciplina D ON M.id_disciplina = D.id_disciplina

-- USANDO EXEMPLO ANTERIOR PARA ENCONTRAR ALUNOS QUE N�O EST�O MATRICULADOS

 SELECT 
	A.id_aluno,
	A.nome,
	M.periodo,
	D.nome_disc
		FROM alunos A
		LEFT JOIN matricula M ON M.id_aluno = A.id_aluno
		LEFT JOIN disciplina D ON M.id_disciplina = D.id_disciplina
	WHERE D.nome_disc IS NULL

-- RIGHT JOIN
-- NOTA-SE QUE A MAT�RIA PROGRAMA��O APARECE SEM ALUNOS MATRICULADOS

 SELECT 
	A.id_aluno,
	A.nome,
	M.periodo,
	D.nome_disc
		FROM alunos A
		RIGHT JOIN matricula M ON M.id_aluno = A.id_aluno
		RIGHT JOIN disciplina D ON M.id_disciplina = D.id_disciplina