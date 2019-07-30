--Top_OffsetFech
use adventureworks;
go

select top 10 with ties
	ProductID,
	Name,
	ListPrice
from Production.Product
where name like '%[^b]%'
order by 
	ListPrice desc;

select 
	ProductID,
	Name,
	ListPrice
from Production.Product
where name like '%[^b]%'
order by 
	ListPrice desc
OFFSET 0  ROWS
FETCH NEXT 10 ROWS ONLY;

/*
Coisas distintas:
1 - conhecer
2 - saber fazer
3 - passar em prova, 70%, aula, apostila, simulados, prova
*/
--ex 1:  exibir todos os produtos em paginas de 10 linhas
declare @pg int, @qtd int, @linha int;
set @linha = 0;
set @pg = 10;

select @qtd = count(productid) from Production.Product where name like '%[^b]%'
while(@linha < @qtd)
begin
	select 
		ProductID,
		Name,
		ListPrice
	from Production.Product
	where name like '%[^b]%'
	order by 
		ListPrice desc
	OFFSET @linha  ROWS
	FETCH NEXT @pg ROWS ONLY;

	set @linha = @linha + @pg;
end;

