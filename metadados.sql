--Metadados => s�o dados sobre os objetos no RDBMS
/*
Objetos para metadados => tabelas , views, procedures, functions(tudo que tem parenteses), variaveis globais
*/

--use AdventureWorks;
--use TSQL;
go

select * from sys.databases;
select * from sys.tables;
select top(100)* from sys.messages;

exec sp_help 'production.product';

go

select
	@@SERVERNAME	AS	[nome do servidor]
	,DB_NAME()		AS	banco
	,SUSER_NAME()	AS	usu�rio
	,@@SPID			AS	processo
	;
go

select * from production.product;
go

select top 5 p.* from production.product	AS p;
go


/*
para palavras reservadas ou espa�os no nome ou caracteres especiais usar o colchete []
para literaistamb�m pode usar apostrofo ou aspas
*/
/*
etapas para executar um statemant 
1 parse: � a sintaxe padronizada
2 algebrizer: os objetos existem
3 optimizer: melhor maneira de executar a query
4 compiler:
5 execute
*/

/*
comando go: roda por blocos, cada bloco passa pelas 5 etapas 
*/

create table teste (codigo int, nome varchar(100))
select * from teste;
go
create view v_teste as
select codigo, nome from teste;
go
select * from v_teste;
go
/*
SQL, statemant DDL, DML, DCL
DML = Manipulation: insert update delete select
DDL = Definition: create alter drop
DCL = Control: grant, deny revoke

SELECT INTO 
#TEMP (tempor�ria local, s� essa sess�o acessa)
##TEMP (tempor�ria global, todo mundo acessa)

*/
