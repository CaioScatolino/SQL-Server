USE NORTHWND

SELECT CITY FROM Customers
UNION
SELECT City
FROM Suppliers
ORDER BY City ASC

SELECT City, Country
FROM Customers
WHERE Country = 'Germany'
UNION
SELECT City, Country
FROM Suppliers
WHERE Country = 'Germany'
ORDER BY City

select 'CLI', City from Customers

UNION

SELECT 'FORNEC', city from Suppliers
ORDER BY City