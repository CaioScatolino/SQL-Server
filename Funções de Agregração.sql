-- CONHECENDO AS TABELAS

SELECT * FROM cidades
SELECT * FROM senso_2013
SELECT * FROM uf
SELECT * FROM regiao_uf

-- AVG: RETORNA A M�DIA DOS VALORES EM UM GRUPO. VALORES NULL S�O IGNORADOS

SELECT AVG(C.populacao) M�dia 
	FROM cidades C

-- AVG: M�DIA POR ESTADO

SELECT	C.uf,
		AVG(C.populacao) Popula��o_M�dia
	FROM cidades C
GROUP BY C.uf
ORDER BY 2 DESC

-- AVG POR REGI�O

SELECT	R.regiao,
		avg(populacao) as M�dia_Popula��o
	FROM cidades C
	INNER JOIN regiao_uf R ON R.ID = C.cod_uf
GROUP BY R.regiao
ORDER BY 2 DESC
