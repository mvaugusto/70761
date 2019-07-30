use TSQL;

select
	custid,
	count(*) as contagem
from Sales.Orders
group by custid
having count(*) <5 or count(*) >10;


select
	p.productid,
	count(*) as cnt
from Production.Products as p
join Sales.OrderDetails as od on p.productid = od.productid
group by p.productid
having count(*)>=10;