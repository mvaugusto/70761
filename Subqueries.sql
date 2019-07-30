/*
inner query (auxiliar)
outer query (principal)

*/
USE TSQL;

select
	orderid,
	productid
	unitprice,
	qty
from Sales.OrderDetails
where orderid =
	(	select max(orderid) AS lastorder
		from sales.Orders	)
/*
nesse caso tem que usar subquery por que tem agregação
se não tiver agregação é mais adequado usar join

self containded sub query = nesse caso inner query dá pra rodar independente
correlated subquery = 
Tabular = retornam varios registros, como uma tabela
Escalar = retorna 1 linha, geralmente agregação

WHERE EXISTS

*/
;

USE TSQL;
GO

-- Step 2: Using EXISTS
-- Select this query and execute it to show
-- any customer who placed an order
SELECT custid, companyname
FROM Sales.Customers AS c
WHERE EXISTS (
	SELECT * 
	FROM Sales.Orders AS o
	WHERE c.custid=o.custid);

/*mesmo resultado utilizando o Join*/

SELECT
	c.custid,
	companyname
FROM Sales.Customers AS c
	join sales.Orders o
	on c.custid= o.custid
group by
	c.custid, companyname
;
/*
apostila pag 471 

*/