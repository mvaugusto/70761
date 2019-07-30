/*
receita mensal tem que ser igual 2x despesas mensais
1/2 despesas,
1/2 reinvestir no montante
tesouro direto
*/

use AdventureWorks;
select	
	ProductID, Name, ListPrice, ProductSubcategoryID,
	case ProductSubcategoryID --hard code
		when 1 then	'a'
		when 2 then	'b'
		when 3 then	'c' 
		when 4 then	'd' 
		when 5 then	'e' 
		when 6 then	'f' 
		else	'x' 	
	end as PSID,
	case
		when ProductSubcategoryID in(2,3,5) then 'Produto em Promoção'
		else 'Produto não em promoção'end as XPTO
from Production.Product 
order by
	ListPrice desc