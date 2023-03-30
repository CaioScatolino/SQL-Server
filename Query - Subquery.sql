-- CRIANDO TABELA DE CLEINTE

CREATE TABLE clientes
(	cod_cli nchar(5) primary key,
	cli_nome nvarchar(40) not null
)

-- INSERINDO DADOS DA TABELA CLIENTE APARTIR DA TABELA CUSTOMERS DO NORTHWIND

INSERT INTO clientes
SELECT CustomerID, companyname from NORTHWND.dbo.Customers

SELECT * FROM clientes

-- CRIANDO A TABELA PEDIDOS

CREATE TABLE pedidos

(
	num_ped int primary key,
	cod_cliente nchar(5) not null,
	data datetime not null,
	total decimal(10,2)
)

-- INSERINDO DADOS NA TABELA APARTIR DA TABELA ORDERS DO NORTHWIND

INSERT INTO pedidos (num_ped, cod_cliente, data)
SELECT OrderID, CustomerID, OrderDate FROM NORTHWND.dbo.Orders
SELECT TOP 100 * FROM pedidos

-- ATUALIZANDO CAMPO TOTAL DA TABELA PEDIDOS COM UPDATE EM SUBSELECT

UPDATE pedidos SET total = (SELECT SUM(b.UnitPrice * b.Quantity)
FROM NORTHWND.dbo.[Order Details] b
WHERE num_ped = b.OrderID);
SELECT * FROM pedidos

-- AQUI SOMENTE APRESENTAMOS OS CLIENTES QUE FIZERAM COMPRAS ANTES DA DATA ATUAL

SELECT cod_cli, cli_nome from clientes
WHERE cod_cli IN (SELECT cod_cliente FROM pedidos WHERE data < GETDATE())

-- BUSCANDO OS CLIENTES QUE NÃO FIZERAM PEDIDOS TROCANOD O IN POR NOT IN

SELECT * FROM clientes
WHERE cod_cli NOT IN (SELECT cod_cliente
						from pedidos b);

-- OU MODIFICANDO O EXERCICIO ANTERIOR
SELECT cod_cli, cli_nome from clientes
WHERE cod_cli NOT IN (SELECT cod_cliente FROM pedidos WHERE data < GETDATE())

/* NESTA QUERY ESTAMOS RETORNANDO O CAMPOCLI_NOME DA TABLEA CLIENTE.
PORÉM NÃO ESTAMOS FILTRANDO A TABELA PEDIDO DE MODO QUE SE HOUVER ALGUM
COD_CLI NA TABELA PEDIDO QUE NÃO SE ENCONTRE NA TABELA CLIENTE O VALOR
NULL SERÁ RETORNADO PARA O CAMPO NOME_CLI CALCULADO ATRAVÉS DA SUBQUERY
*/

SELECT	P.num_ped,
		P.data, 
		P.cod_cliente,
		(SELECT C.cli_nome from clientes C
							WHERE P.cod_cliente = C.cod_cli) AS nome_cli
FROM pedidos P;

-- Nesta Subquery vamos trazer o total de cada cliente partindo da tabela pedidos

SELECT	P.cod_cliente,
		(SELECT C.cli_nome from clientes C
			WHERE C.cod_cli = P.cod_cliente) AS nome_cli,
		SUM(p.total) AS TOTAL
FROM pedidos P
GROUP BY P.cod_cliente
ORDER BY TOTAL DESC

-- NESTA QUERY VAMOS TRAZER TODOS CLIENTES E ATRAVÉS DE SUBCONSULTA O VALOR DE SUAS COMPRAS

SELECT	
		C.cod_cli,
		C.cli_nome,
		(SELECT SUM(P.total) FROM pedidos P
			WHERE P.cod_cliente = C.cod_cli) AS Total
FROM clientes C
GROUP BY C.cod_cli, C.cli_nome
ORDER BY Total

-- DELETANDO CLIENTES DA TABELA CLIENTE QUE NÃO FIZERAM PEDIDOS

DELETE FROM clientes
WHERE cod_cli NOT IN (SELECT cod_cliente FROM pedidos)