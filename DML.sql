/*
Inserir o resultado de um select
*/
INSERT Sales.SalesOrderDetail
(orderID, ProductID, unitprice, qty, discount)
Select * from NewOrderDetails;

/*
Inserir o resultado de uma procedure
*/
INSERT Sales.SalesOrderDetail
(orderID, ProductID, unitprice, qty, discount)
PROCEDURE sp_NewOrderDetails;

/*
Select into
*/
select * into nova_tabela where id = 7