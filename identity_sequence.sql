use AdventureWorks;
go

create table teste6(codigo int identity(1,1) not null, nome varchar(10));
go

insert teste6 values('teste1'),('teste2'),('teste3'),('teste4'),('teste5'),('teste6');
go

select * from teste6;
go

select SCOPE_IDENTITY(); -- mostra o ultimo identity da prorpia sessão
go

create sequence dbo.ObjSequence as int start with 1 increment by 1;
go

create table teste6(codigo int not null, nome varchar(10));
go

insert teste6
	values
		(next value for dbo.ObjSequence, 'teste1'),
		(next value for dbo.ObjSequence, 'teste2'),
		(next value for dbo.ObjSequence, 'teste3'),
		(next value for dbo.ObjSequence, 'teste4'),
		(next value for dbo.ObjSequence, 'teste5'),
		(next value for dbo.ObjSequence, 'teste6');
go

select * from teste6;
go

SELECT * from sys.sequences where name = 'ObjSequence'
go


select isnumeric('123x')
/*
IIF
CHOOSE
*/