use AdventureWorks;
go
/*
ex 1: faça posssivel essa concatenação
ex 2: incluir em cada linha o dado: Código :
*/
--ex1
select
	convert(varchar(4),ProductID) +'-'+ Name,
	ListPrice,
	Color
from Production.Product;

--ex2
select
	'Código : '+
	convert(varchar(4),ProductID) +
	' - '+
	[Name]	as 'Código',
	ListPrice,
	Color
from Production.Product;

