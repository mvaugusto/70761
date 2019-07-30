use AdventureWorks;
go
select
	b.ProductSubcategoryID,
	b.Name,
	c.Name,
	a.color,
	avg(a.[Weight]),
	avg(a.ListPrice)
from Production.Product	as a
left join Production.ProductSubcategory as b
on a.ProductSubcategoryID = b.ProductSubcategoryID
left join Production.ProductCategory as c
on b.ProductCategoryID = c.ProductCategoryID
group by
	b.ProductSubcategoryID,
	b.Name,
	c.Name,
	a.color
having avg(a.ListPrice) > 150
order by avg(a.ListPrice) Desc
;

select color from Production.Product group by color;
select distinct color from Production.Product;

/*
sequencia de execução da query
1 from
2 join
3 where
4 group by
5 having
6 select
7 order by
*/

/*
Exibir o mesmo relatório incluindo o nome da subcategoria
*/