use AdventureWorks;
go
create schema curso;
go
select * from sys.schemas
go
create table curso.teste5(codigo int, nome char(10));
create table dbo.teste5(codigo int, nome char(10));
go
select * from curso.teste5;
select * from dbo.teste5;
/*
FQDN => Full Qualified Domain Name
server.data_base.schema.object
select * from [mia-sql].adventureworks.production.product;
*/
select * from [mia-sql].adventureworks.production.product;

exec sp_help 'adventureworks.production.product';
