/*
O select retorna uma tabela
*/
use AdventureWorks;
go
select 
	s.ProductSubcategoryID,
	p.ProductID,
	s.Name,
	p.name,
	p.Color,
	p.ListPrice,
	p.Weight,
	p.ModifiedDate
from
	production.Product p
	left 
	join Production.ProductSubcategory s
	on p.ProductSubcategoryID = s.ProductSubcategoryID
	WHERE s.ProductSubcategoryID is null
order by s.ProductSubcategoryID
;

select ProductSubcategoryID
from Production.Product;
/*
merge join
append union
*/






select
	c.ProductCategoryID,
	c.Name, 
	s.ProductSubcategoryID,
	p.ProductID,
	s.Name,
	p.name,
	p.Color,
	p.ListPrice,
	p.Weight,
	p.ModifiedDate
from
	production.Product p 
	join Production.ProductSubcategory s
	on p.ProductSubcategoryID = s.ProductSubcategoryID
	Join Production.ProductCategory c
	on s.ProductCategoryID = c.ProductCategoryID;


-- cross join
-- cruza uma tabela com outra sem o on, produto cartesiano
-- t1 =100 rows, t2 = 1000 rows, 100 x 1000 rows



use TSQL;
select
	e.empid,
	e.lastname,
	e.title,
	e.mgrid,
	m.lastname
from HR.Employees as e
--left 
join HR.Employees as m
on e.mgrid = m.empid;





--pagina 445
