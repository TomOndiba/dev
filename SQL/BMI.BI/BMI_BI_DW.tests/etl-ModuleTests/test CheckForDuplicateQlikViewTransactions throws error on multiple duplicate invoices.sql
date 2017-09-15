CREATE procedure [etl-ModuleTests].[test CheckForDuplicateQlikViewTransactions throws error on multiple duplicate invoices]
as
begin
	exec tSQLt.FakeTable @TableName = N'qvstg.Invoice' ;
	exec tSQLt.FakeTable @TableName = N'qvstg.OrderBacklog' ;
	exec tSQLt.FakeTable @TableName = N'qvstg.OrderShippedNotInvoiced' ;

	insert qvstg.Invoice
		(InvoiceKey	, IsDeleted	, DataSourceKey	, InvoiceNumber	, NativeInvoiceLineNumber	, OrderNumber	, NativeOrderLineNumber)
	values
		  (1001		, 'N'		, 1				, '2001'		, '3001'					, '4001'		, '5001')
		, (1002		, 'N'		, 1				, '2001'		, '3002'					, '4001'		, '5001')
		, (1003		, 'N'		, 1				, '2001'		, '3001'					, '4002'		, '5001')
		, (1004		, 'N'		, 1				, '2001'		, '3001'					, '4001'		, '5002')
		--! Simple case of multiple (3/4) invoice lines being duplicated
		, (1005		, 'N'		, 1				, '2002'		, '3001'					, '4002'		, '5001')
		, (1006		, 'N'		, 1				, '2002'		, '3002'					, '4002'		, '5002')
		, (1007		, 'N'		, 1				, '2002'		, '3002'					, '4002'		, '5002')
		, (1008		, 'N'		, 1				, '2002'		, '3003'					, '4002'		, '5003')
		, (1009		, 'N'		, 1				, '2002'		, '3003'					, '4002'		, '5003')
		, (1010		, 'N'		, 1				, '2002'		, '3004'					, '4002'		, '5004')
		, (1011		, 'N'		, 1				, '2002'		, '3004'					, '4002'		, '5004')
		--! More complex case with multiple repeating invoice lines and some inactive which should be excluded from the count
		, (1012		, 'N'		, 1				, '2003'		, '3001'					, '4003'		, '5001')
		, (1013		, 'N'		, 1				, '2003'		, '3002'					, '4003'		, '5002')
		, (1014		, 'Y'		, 1				, '2003'		, '3002'					, '4003'		, '5002')
		, (1015		, 'N'		, 1				, '2003'		, '3003'					, '4003'		, '5003')
		, (1016		, 'N'		, 1				, '2003'		, '3003'					, '4003'		, '5003')
		--! Four dupes counts as 1 in output message
		, (1017		, 'N'		, 1				, '2003'		, '3004'					, '4003'		, '5004')
		, (1018		, 'N'		, 1				, '2003'		, '3004'					, '4003'		, '5004')
		, (1019		, 'N'		, 1				, '2003'		, '3004'					, '4003'		, '5004')
		, (1020		, 'N'		, 1				, '2003'		, '3004'					, '4003'		, '5004')

	exec tSQLt.ExpectException
		  @ExpectedErrorNumber = 50000
		, @ExpectedMessagePattern = 'Check for Duplicates failed!  Invoice: 5 record(s) duplicated;  Order Backlog: 0 record(s) duplicated;  Order SNI: 0 record(s) duplicated%'
	
	exec etl.CheckForDuplicateQlikViewTransactions ;
end