use AdventureWorks;
go
create view dbo.vw_ProdutosCategoria as
select
	b.ProductSubcategoryID,
	b.Name as nome1,
	c.Name as nome2,
	a.color,
	avg(a.[Weight])		as peso_media,
	avg(a.ListPrice)	as preco_media
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
--order by avg(a.ListPrice) Desc /* Não pode por order by na view */
;
go

select * 
from dbo.vw_ProdutosCategoria
order by preco_media desc, peso_media desc;
go

select * from sys.views; /*metadados da view*/

select
	ProductSubcategoryID,
	nome1,
	nome2,
	Color,
	peso_media
	preco_media	 
from dbo.vw_ProdutosCategoria
order by
	--preco_media desc
	--,
	peso_media desc
	;
go
