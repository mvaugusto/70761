use adventureworks
go
/*
select
	ProductID,
	Name,
	ListPrice
from Production.Product
where name = 'LL Crankarm'
go
*/

-- o porcento substitui qualquer coisa em qualquer quantidade
-- o porcento pode por em qualquer posi��o e em qualquer lugar
select
	ProductID,
	Name,
	ListPrice
from Production.Product
where name like --'LL%'
	-- 'LL%e'
	-- 'LL%a%e'
	-- '%e"
	-- '[abcdef]%'-- come�a com a ou b ou c ou d ou e ou f
	-- '[^abcdef]%'-- � come�a com a ou b ou c ou d ou e ou f
	-- 'LL%[^a]%[^e]'
	-- '%[^b]%'
	-- '%[_e]'