use AdventureWorks;
go
select
	ProductID, [Name], ListPrice, Color, [Weight], Size, ModifiedDate
from production.Product
where
	((listprice between 0 and 5000) --(ListPrice >= 0 and ListPrice <= 5000)
	or
	(color in('red','black','blue','silver')))--(color = 'red'or color = 'black' or color = 'blue' or color = 'silver')
	and
	Weight is null --isnull([Weight],0) = 0 -- fode a query
order by ListPrice desc, Weight desc, Size asc;
/*
where => from
on => join
*/