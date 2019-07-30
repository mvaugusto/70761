use AdventureWorks;
go

declare @precomin decimal(8,2), @precomax decimal(8,2); -- uso de variaveis
set @precomin = 0;
set @precomax = 5000;

if (@precomin <0 or @precomax < @precomin)
	begin
		print 'Os valores não são válidos.'
	end
else
	begin
		select
			ProductID,
			[Name],
			ListPrice,
			Color,
			Weight,
			Size,
			ModifiedDate
		from production.Product
		where
			--(ListPrice >= 0 and ListPrice <= 5000)
			--listprice between 0 and 5000
			listprice between @precomin and @precomax
			--or (color = 'red'or color = 'black' or color = 'blue' or color = 'silver')
			--or (color in('red','black','blue','silver'))
		order by ListPrice desc, Weight desc, Size asc;
	end;
go


/*
nasceu em 1970 pela IBM, para dml, ddl, dcl, armazenar dados

*/