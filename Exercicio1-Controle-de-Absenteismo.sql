--Exercício: Localizar o total de horas de ausência do trabalho para cada funcionario
--Adicionando o número de horas usada para férias e o numero das horas usadas 
--por doença

select 
	p.FirstName + ' ' + p.LastName AS 'Nome Completo',
	e.JobTitle,
	e.VacationHours + e.SickLeaveHours Absenteísmo

from person.Person AS p
	JOIN HumanResources.Employee as e
	ON e.BusinessEntityID = p.BusinessEntityID

ORDER BY Absenteísmo DESC

--Exercício --
--Calcular a taxa de imposto entre o estado ou municipio com a taxa mais alta e 
--o mais alto

SELECT	Max(TaxRate) as Máximo,
		MIN(TaxRate) as Mínimo,
		Max(TaxRate) - MIN(TaxRate) as Diferença
FROM Sales.SalesTaxRate
WHERE StateProvinceID IS NOT NULL

-- Acrescentar 15% no valor dos produtos --

SELECT	ProductID,
		Name,
		ListPrice,
		ListPrice * 1.15 as NewPrice

FROM Production.Product
WHERE ListPrice > 0
	AND Name LIKE '%Mountain%'
ORDER BY NewPrice DESC

-- Usando 3 tabelas, trazer meta de vendas mensal da equipe --

SELECT	s.BusinessEntityID AS SalesPersonID,
		p.FirstName + p.LastName AS Nome_Completo,
		s.SalesQuota AS Venda_Anual,
		s.SalesQuota / 12 AS Target_Mes

FROM Sales.SalesPerson AS s
	JOIN HumanResources.Employee AS e
	ON s.BusinessEntityID = e.BusinessEntityID
	JOIN Person.Person AS p
	ON e.BusinessEntityID = p.BusinessEntityID
WHERE SalesQuota IS NOT NULL


