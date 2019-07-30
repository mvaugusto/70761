/*
	UNION -- não traz repetições, duplicatas são retiradas
	UNION ALL -- traz linhas iguais 
	INTERSECT
	EXCEPT
	OUTER APPLY
	INNER APPLY

Lab 11, apenas exercicios 2 e 3, pag 485
Lab 12, fazer só o lab sobre apply
*/


use AdventureWorks;
go

/* UNION ********************************/
select
	ProductID,
	Name,
	Color,
	ModifiedDate
from Production.Product
UNION
select
	BusinessEntityID,
	concat(FirstName,' ',Lastname),
	Title,
	ModifiedDate
from Person.Person	;


/* UNION ********************************/
use TSQL;
go
select
	country,
	region,
	city
from HR.Employees
UNION
Select
	country,
	region,
	city
from Sales.Customers;



/* INTERSECT ********************************/
use TSQL;
go
select
	country,
	region,
	city
from HR.Employees
INTERSECT
Select
	country,
	region,
	city
from Sales.Customers;


/* EXCEPT ********************************/
use TSQL;
go
select
	country,
	region,
	city
from HR.Employees
EXCEPT
Select
	country,
	region,
	city
from Sales.Customers;


/* APPLY ********************************/

-- Step 4: Using OUTER APPLY
-- Find customers with no orders 
SELECT C.custid, C.companyname
FROM Sales.Customers AS C --91 customers
LEFT OUTER JOIN Sales.Orders AS O -- 830 orders
ON C.custid = O.custid --832 results with NULL cust

-- Step 5: Using CROSS APPLY
-- Return 3 most recent orders per customer
SELECT C.custid, TopOrders.orderid, TopOrders.orderdate
FROM Sales.Customers AS C
OUTER APPLY
	(	
		SELECT orderid, orderdate
		FROM Sales.Orders AS O
		WHERE O.custid = C.custid
	) AS TopOrders;
