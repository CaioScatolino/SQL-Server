-- CONHECENDO AS TABELAS

SELECT * FROM cidades
SELECT * FROM senso_2013
SELECT * FROM uf
SELECT * FROM regiao_uf

-- AVG: RETORNA A MÉDIA DOS VALORES EM UM GRUPO. VALORES NULL SÃO IGNORADOS

SELECT AVG(C.populacao) Média 
	FROM cidades C

-- AVG: MÉDIA POR ESTADO

SELECT	C.uf,
		AVG(C.populacao) População_Média
	FROM cidades C
GROUP BY C.uf
ORDER BY 2 DESC

-- AVG POR REGIÃO

SELECT	R.regiao,
		avg(populacao) as Média_População
	FROM cidades C
	INNER JOIN regiao_uf R ON R.ID = C.cod_uf
GROUP BY R.regiao
ORDER BY 2 DESC
