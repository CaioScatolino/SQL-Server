-- BEGIN - ABRE UMA TRANSA플O
-- COMMIT - CONFIRMA/SALVA TRANSA플O
-- ROLLBACK - REVERTER UMA TRANSA플O EM CASO DE ERRO

-- CRIANDO TESTE

CREATE TABLE cadastro
(
nome varchar(50) not null,
docto varchar(20) not null
)

-- INICIA UMA TRANSA플O
BEGIN TRANSACTION

-- INSERE REGISTROS

INSERT INTO cadastro VALUES ('Andre', '123123')
INSERT INTO cadastro VALUES ('Joao', '312312')
INSERT INTO cadastro VALUES ('Pedro', '123111')

-- SELECT DOS REGISTROS INSERIDOS

SELECT * FROM cadastro

-- RETORNA A TABELA NO ESTADO ANTERIOR DO BEGIN TRANSACTION

--ROLLBACK

-- COMMIT DA TRANSA플O PARA SALVAR NO BANCO DE DADOS

COMMIT TRANSACTION

