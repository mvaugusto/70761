/*
é uma inner query no FROM
*/
use AdventureWorks;

select
	derived_table.ProductSubcategoryID,
	derived_table.ProductID,
	derived_table.Name,
	derived_table.ListPrice,
	derived_table.Color
	FROM
	(
		select
			ProductSubcategoryID,
			ProductID,
			Name,
			ListPrice,
			Color
		from Production.Product
		where color = 'red' 
	) as derived_table
	
/*
subselect, inner select, derived table
*/
use TSQL;
select orderyear, cust_count from 
(
	select orderyear, count(distinct custid)as cust_count from 
	(
		select year(orderdate) as orderyear,custid from sales.orders as derived_table_1
	) 
	AS derived_table_2 GROUP BY orderyear
) as A where cust_count >80;

/*
ex: fazer a query acima como JOIN
*/

use AdventureWorks;
go
with cte_Table as (
select ProductSubcategoryID, ProductID, Name, ListPrice, color
from Production.Product)

select * from cte_table;

