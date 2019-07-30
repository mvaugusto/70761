/*
numéricos:
tinyint		= 8 bits,	1 byte,		2^8,	256, 0 ~ 255
smallint	= 16 bits,	2 bytes,	2^16,	65536 -32678 ~ +32767
int			= 32 bits,	4 bytes,	2^32,	4 bilhoes, -2bi ~ +2bi 
bigint		= 64bits,	8 bytes,	2^64,	18 quintilhoes, -9 ~+9 quintilhões
bit			=1,0 or null
uniqueidentifier	= 128bits ....
decimal/numeric		= decimal(escala,precisão) ex: decimal(8,2)
float		= float(8,2)
smallmoney	= 4 bytes (antigo)
money		= 8 bytes (antigo)

binary()		= para arquivos
varbinary()		= para arquivos
varbinary(max)	= para arquivos LOB (large object binary)

*/
--Curso = Alice no país das maravilhas.
declare @guid uniqueidentifier = newid();
select @guid;
/*
strings
char(tamanho) sempre ocupará este tamanho.
varchar(tamanho) ocupará o tamnho armazenado até o valor maximo que cabe nele
8k que é o tamanho de uma página do windows
ASCII = 1byte por letra (256 posições distintas)
UNICODE = 2bytes por letra (65536 posições distintas) internacionalização de sistemas ou de software
nchar(tamanho)
nvarchar(tamanho)

*/
declare @n1 char(10) = 'Nome', @n2 varchar(10) ='Nome';
select
	len(@n1) as len1,
	DATALENGTH(@n1) as byte1,
	len(@n2) as len2,
	DATALENGTH(@n2) as byte2
;
go

/*
UNICODE = 2bytes por letra (65536 posições distintas) internacionalização de sistemas ou de software
nchar(tamanho)
nvarchar(tamanho)

*/


declare @n1 nchar(10) = N'Rafa', @n2 nvarchar(10) = N'Rafa';
select
	len(@n1) as len1,
	DATALENGTH(@n1) as byte1,
	len(@n2) as len2,
	DATALENGTH(@n2) as byte2
;
go

/*
conversão de dados:
	explicit conversion = cast(field as datatype) or convert(datatype, field)
	implicit conversion = automático
*/

declare @n1 tinyint = 100, @n2 int = 200, @n3 bigint = 40000;
--set @n1 = @n2;
--select @n1;

--set @n2 = @n1;
--select @n2;

set @n1 = @n3; --overflow
select @n1;
go

select 1 + 1;
select '1'+'1';
select '1' + 1; --implicit convertion
select 1 +'1'; --implicit convertion




/*
datetime

até sql 2005 :
smalldatetime yymmdd hh:mm:ss
datetime	  yymmdd hh:mm:ss.mmm
funções getdate, current_timestamp, datepart

*/

select
	getdate() datahorapadrao,
	cast(getdate() as smalldatetime) datahoraSmall,
	CURRENT_TIMESTAMP;

select
convert(char(4),datepart(year,getdate()))
+
convert(char(2),datepart(MONTH,getdate()))
+
convert(char(2),datepart(DAY,getdate()))


/*
a partir sql 2008 :
time	hh:mm:ss.mmmmmmm
date	yymmdd
datetime2	yymmdd hh:mm:ss.mmmmmmm
datetimeoffset yymmdd hh:mm:ss.mmmmmmm +-offset UTC

funções sysdatetime(), datename()


*/
select  sysdatetime(),
		cast(sysdatetime() as time),
		convert(date, sysdatetime()),
		SYSUTCDATETIME(),
		SYSDATETIMEOFFSET()

select datediff(MONTH,'19981120',sysdatetime()),
		dateadd(day, 20, getdate())


use TSQL;
select
	e.city,
	e.country,
	count(*)
from Sales.Customers as c
join HR.Employees as e
on c.city = e.city AND c.country = e.country
group by
	e.city,
	e.country;

	/*
	declare @data datetime = '20070101'
	select @data;

	create table teste4(codigo int, nome char(10), versao timestamp);
	go
	insert teste4(codigo, nome) values(1,'teste1');
	insert teste4(codigo, nome) values(2,'teste2');
	go
	select * from teste4;
	update teste4 set nome='teste22' where codigo = 2;
	*/

use AdventureWorks;
select *
from production.Product
where name collate Latin1_General_CS_AS = 'Adjustable Race';-- CI = Case Insensitive CS = Case Sensitive

