USE falgunitagadkar_db;

--SELECT * FROM Products;

--Assignment 1------------------------------------------------------------
--Query 1
SELECT ProductID,ProductName,UnitPrice
FROM Products
WHERE UnitPrice <= 20;


--Query 2
SELECT ProductID,ProductName,UnitPrice
FROM Products
WHERE UnitPrice BETWEEN 15 AND 20;

--Query 3
SELECT ProductName,UnitPrice
FROM Products
WHERE UnitPrice >= (SELECT AVG(UnitPrice) FROM Products);

--(SELECT AVG(UnitPrice) FROM Products);

--Query 4
SELECT TOP 10 ProductName,UnitPrice
FROM Products
ORDER BY UnitPrice DESC;

--Query 5
SELECT Discontinued,COUNT(Discontinued) as Count
FROM Products
GROUP BY Discontinued;

--Query 6
SELECT ProductName,UnitsOnOrder,UnitsInStock
FROM Products
WHERE UnitsInStock < UnitsOnOrder
