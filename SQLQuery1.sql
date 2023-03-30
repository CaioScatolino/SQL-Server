SELECT * FROM cidades
WHERE nome_mun = 'Dourado'
AND uf = 'sp';

select nome_mun, populacao from cidades
where populacao > 1000000
order by populacao desc

select nome_mun, populacao, uf from cidades
where populacao < 10000
order by populacao asc

select nome_mun, populacao, uf from cidades
where uf <> 'SP'
	and uf <> 'sc'
	and populacao < 10000
	and nome_mun LIKE '%ab%'

select 12%8