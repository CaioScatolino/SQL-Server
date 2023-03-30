use curso;

--Parte 1 CONCEDE-GRANT
-- Cria um login e dá permissões no banco
-- Revoga acesso do usuario.
EXEC sp_revokedbaccess 'UsrTeste';
-- dropa login
DROP LOGIN [UsrTeste];
-- adiciona login
exec master.dbo.sp_addlogin 'UsrTeste','SenhaTeste';
-- grant de acesso usuario
EXEC sp_grantdbaccess 'UsrTeste','UsrTeste';
-- seta o banco
use curso;
--Concedendo Acesso DE ATUALIZACAO PARA UsrTeste.
GRANT UPDATE ON FUNCIONARIOS TO UsrTeste;

--Concedendo Acesso de INSERT para UsrTeste

GRANT INSERT ON FUNCIONARIOS TO UsrTeste;

--CONCEDENDO ACESSO DE LEITURA PARA UsrTeste

GRANT SELECT ON FUNCIONARIOS TO UsrTeste;

--CONCEDENDO ACESSO DE DELETE PARA O UsrTeste

GRANT DELETE ON FUNCIONARIOS TO UsrTeste;

-- CRIANDO UMA PROCEDURE
CREATE PROCEDURE testeproc
AS
SELECT TOP 1000 * FROM cidades;

-- EXECUTANDO PROCEDURE

EXEC testeproc

--CONCEDENDO ACESSO PARA EXECUTAR PROC testeproc PARA UsrTeste
GRANT EXECUTE ON testeproc TO UsrTeste

-- VERIFICANDO USUARIO LOGADO

SELECT CURRENT_USER

-- ALTERANDO USUARIO LOGADO
SETUSER 'UsrTeste'

SETUSER