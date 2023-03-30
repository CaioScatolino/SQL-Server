--RETORNAR TOP 3 UF COM CIDADE COM MENOR NÚMERO DE HABITANTES

SELECT TOP 3 MIN(populacao) População,
		C.uf
	FROM cidades C
	GROUP BY c.uf
	ORDER BY 1

-- RETORNAR REGIÃO COM A CIDADE QUE TEM O MENOR NÚMERO DE HABITANTES

SELECT R.regiao,
		MIN(c.populacao)
	FROM regiao_uf R
	LEFT JOIN cidades C ON C.cod_uf = R.id
	GROUP BY r.regiao
	ORDER BY 2

SELECT TOP 3 MIN(populacao), nome_mun FROM cidades
GROUP BY nome_mun
ORDER BY 1

-- SUM 

SELECT SUM(populacao) FROM cidades

-- SUM DE CADA ESTADO

SELECT uf, SUM(populacao) POPULAÇÃO FROM cidades GROUP BY uf ORDER BY 2

-- SUM POR REGIÃO

SELECT	R.regiao,
		sum(C.populacao) População_Total
	FROM regiao_uf R
	LEFT JOIN cidades C ON R.id = C.cod_uf
	GROUP BY R.regiao
	ORDER BY 2 desc


-- COUNT
SELECT COUNT(*) FROM cidades

-- COUNT POR ESTADO

SELECT	uf,
		COUNT(uf) QtdCidades
FROM cidades
GROUP BY uf
ORDER BY 2 DESC

-- COUNT DE ESTADOS

SELECT COUNT(DISTINCT uf) FROM cidades

-- COUNT DE CIDADES POR REGIÃO

SELECT	R.regiao,
		COUNT(DISTINCT C.cod_mun) QtdCidades
	FROM regiao_uf R
	LEFT JOIN cidades C ON R.id = C.cod_uf
	GROUP BY R.regiao
	ORDER BY 2 DESC

-- RESUMO POR ESTADO

SELECT	uf,
		SUM(populacao) Soma,
		AVG(populacao) Média,
		MAX(populacao) Maximo,
		MIN(populacao) Minimo,
		COUNT(*) Quantidade
FROM cidades
GROUP BY uf
ORDER BY 1

-- RESUMO POR REGIAO

SELECT R.regiao,
		SUM(populacao) Soma,
		AVG(populacao) Média,
		MAX(populacao) Maximo,
		MIN(populacao) Minimo,
		COUNT(*) Quantidade
FROM regiao_uf R
LEFT JOIN cidades C ON C.cod_uf = R.id
GROUP BY R.regiao
ORDER BY 1


-- GROUPING

SELECT	uf,
		sum(populacao) as populacao,
		GROUPING(uf) as grupo
FROM cidades
GROUP BY uf WITH ROLLUP

-- COMPARANDO CRESCIMENTO DA CIDADE

SELECT TOP 1 * FROM cidades
SELECT TOP 1 * FROM senso_2013

SELECT	cod_uf,
		cod_mun,
		cod_uf + cod_mun AS CONCATENADO
FROM cidades

-- USANDO EXEMPLO

SELECT	C.nome_mun,
		C.populacao pop_senso_2007,
		S.populacao pop_senso_2013,
		ROUND(cast(S.populacao as float)/cast(C.populacao as float)*100-100,2) AS pct_crescimento
FROM cidades C
INNER JOIN senso_2013 S ON S.cod_mun = C.cod_uf + C.cod_mun
ORDER BY pct_crescimento DESC

-- POR ESTADO

SELECT	c.uf,
		SUM(c.populacao) senso_2007,
		SUM(s.populacao) senso_2013,
		ROUND(CAST(SUM(S.populacao) as float)/cast(SUM(C.populacao) as float)*100 - 100, 2) pct_crescimento
FROM cidades C
INNER JOIN senso_2013 S ON C.cod_uf + C.cod_mun = S.cod_mun
GROUP BY C.uf
ORDER BY 4 DESC

-- GROUPING_ID

SELECT	R.regiao,
		C.uf,
		SUM(C.populacao) populacao,
		GROUPING_ID(R.regiao, C.uf) grupo
FROM cidades C
INNER JOIN regiao_uf R ON R.id = C.cod_uf
GROUP BY ROLLUP (R.regiao, C.uf)

