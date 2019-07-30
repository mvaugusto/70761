USE TSQL;

select top 100 * from sys.messages;

select distinct language_id from sys.messages;

select max(message_id) from sys.messages;

raiserror(N'%s %d', -- string integer 
		10,	-- severidade
		1,	-- estado
		N'Custom error message', -- string
		2); -- segundo argumento

THROW 51000, 'The record does not exist.', 1;  

SET XACT_ABORT ON; -- se der erro no meio da transação dá rollback automático

begin try
	Begin transaction nome_da_transacao
		select max(message_id) as total_de_mensagens from sys.messages;
	commit transaction nome_da_transacao
end try
begin catch
	select distinct language_id as codigo_de_linguagens from sys.messages;
	PRINT 'In catch block.';  
	rollback transaction nome_da_transacao;
	Print error_message();
	THROW;
end catch;