use AdventureWorks;
go
/*
ex 1: fa�a posssivel essa concatena��o
ex 2: incluir em cada linha o dado: C�digo :
*/
--ex1
select
	convert(varchar(4),ProductID) +'-'+ Name,
	ListPrice,
	Color
from Production.Product;

--ex2
select
	'C�digo : '+
	convert(varchar(4),ProductID) +
	' - '+
	[Name]	as 'C�digo',
	ListPrice,
	Color
from Production.Product;

