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
	coalesce(Title,'Sem T�tulo'), --ANSI
	--isnull(convert(char(10),Title),'Sem T�tulo'),
	ModifiedDate
from person.Person;

--exec sp_help 'person.person'

--16 bytes



/*
Null � o conte�do que representa aus�ncia de conte�do
N�o �: espa�o em branco, apostrofo vazio, apostrofo com espa�o, vazio
as colunas que n�o est�o listadas no insert ser�o preenchidas como Null
Existem 3 observa��es como null
1) Concatena��o com Null resulta em null
2) null n�o aceita operadores de compara��o > < >= <=
3) Agrega��es ignoram null

*/

use AdventureWorks;
select
	BusinessEntityID,
	concat(FirstName, ' '+ MiddleName, ' ' + LastName)
from person.Person;