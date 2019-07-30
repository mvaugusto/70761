-- rank_functions.sql;
use AdventureWorks;
go 

select
	c.Name as subcategoria,
	p.Name as produto,
	p.ListPrice,
	ROW_NUMBER()		over (order by p.ListPrice desc) as linha,
	ROW_NUMBER()		over (partition by c.name order by p.ListPrice desc) as linhaPorSubCat,
	RANK()				over (partition by c.name order by p.ListPrice desc) as rankPorCat,
	DENSE_RANK()		over (partition by c.name order by p.ListPrice desc) as denseRankPorCat,
	NTILE(3)			over (partition by c.name order by p.ListPrice desc) as ntile3PorCat,
	sum(p.ListPrice)	over (partition by c.name) as somaPreçoPorCat
from Production.Product as p 
join Production.ProductSubcategory as s
on p.ProductSubcategoryID = s.ProductSubcategoryID
join Production.ProductCategory as c
on s.ProductCategoryID= c.ProductCategoryID
--order by subcategoria
order by c.name, p.ListPrice desc;
;




