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
-- o porcento pode por em qualquer posição e em qualquer lugar
select
	ProductID,
	Name,
	ListPrice
from Production.Product
where name like --'LL%'
	-- 'LL%e'
	-- 'LL%a%e'
	-- '%e"
	-- '[abcdef]%'-- começa com a ou b ou c ou d ou e ou f
	-- '[^abcdef]%'-- ñ começa com a ou b ou c ou d ou e ou f
	-- 'LL%[^a]%[^e]'
	-- '%[^b]%'
	-- '%[_e]'