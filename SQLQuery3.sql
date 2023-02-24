CREATE TABLE Alunos

(
	id_aluno int PRIMARY KEY NOT NULL,
	nome varchar(200) NOT NULL,
	data_nascimento date NOT NULL,
	sexo varchar(1) NOT NULL, --M para Masculino ou F para Feminino
	data_cadastro datetime NOT NULL,
	login_cadastro varchar(15) NOT NULL,
);


CREATE TABLE Situacao
(
id_situacao INT PRIMARY KEY NOT NULL,
situacao varchar(25) NOT NULL,
data_cadastro datetime,
login_cadastro varchar(15)
);



CREATE TABLE Cursos

(
 id_curso int PRIMARY KEY NOT NULL,
 nome_curso VARCHAR(50) NOT NULL,
 data_cadastro datetime not null,
 login_cadastro varchar(15) not null,
);

CREATE TABLE Turmas 

(

	id_turma int PRIMARY KEY NOT NULL,
	id_aluno int NOT NULL,
	id_curso int NOT NULL,
	valor_turma numeric(15,2) not null,
	desconto numeric (3,2) not null,
	data_inicio date not null,
	data_termino date,
	data_cadastro datetime not null,
	login_cadastro varchar(15),

);

ALTER TABLE Turmas
	ADD CONSTRAINT fk_Alunos FOREIGN KEY (id_aluno) REFERENCES Alunos (id_aluno);


CREATE TABLE Registro_Presenca

(

id_turma int not null,
id_aluno int not null,
id_situacao int not null,
data_presenca date not null,
data_cadastro date not null,
login_cadstro varchar(15) not null

)

ALTER TABLE Registro_Presenca ADD CONSTRAINT fk_TurmasRP
	FOREIGN KEY (id_turma) REFERENCES Turmas (id_turma);

ALTER TABLE Registro_Presenca ADD CONSTRAINT fk_AlunoRP
	FOREIGN KEY (id_aluno) REFERENCES Alunos (id_aluno);

ALTER TABLE Registro_Presenca ADD CONSTRAINT fk_SituacaoRP
	FOREIGN KEY (id_situacao) REFERENCES Situacao (id_situacao);