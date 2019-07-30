use AdventureWorks;
go

select
	avg(Weight),
	max(Weight),
	min(Weight),
	sum(Weight),
	count(Weight),
	count(isnull(Weight,0))	
from Production.Product;


select count(productid)
from Production.Product
where Weight is not null;