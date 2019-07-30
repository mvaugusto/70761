use adventureworks;
go
select
	BusinessEntityID,
	FirstName,
	MiddleName,
	LastName,
	Title,
	ModifiedDate
from person.Person

select
	BusinessEntityID,
	isnull(FirstName,' ') +' '+  isnull(MiddleName,' ') +' '+ isnull(LastName,' '),
	coalesce(Title,'Sem Título'), --ANSI
	--isnull(convert(char(10),Title),'Sem Título'),
	ModifiedDate
from person.Person;

--exec sp_help 'person.person'

--16 bytes



/*
Null é o conteúdo que representa ausência de conteúdo
Não é: espaço em branco, apostrofo vazio, apostrofo com espaço, vazio
as colunas que não estão listadas no insert serão preenchidas como Null
Existem 3 observações como null
1) Concatenação com Null resulta em null
2) null não aceita operadores de comparação > < >= <=
3) Agregações ignoram null

*/

use AdventureWorks;
select
	BusinessEntityID,
	concat(FirstName, ' '+ MiddleName, ' ' + LastName)
from person.Person;