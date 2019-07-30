use AdventureWorks;
go
--create 
alter function dbo.f_ProdutosCategoria(@preco decimal(8,2))
returns table
as
return
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
	having avg(a.ListPrice) > 150--@preco
	--order by avg(a.ListPrice) Desc /* Não pode por order by na view */
	;
go

select * from dbo.f_ProdutosCategoria(150); /* é uma function */

