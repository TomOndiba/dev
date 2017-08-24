CREATE procedure [etl-ModuleTests].[test CheckForDuplicateQlikViewTransactions throws error on multiple duplicate order SNI]
as
begin
	exec tSQLt.FakeTable @TableName = N'qvstg.Invoice' ;
	exec tSQLt.FakeTable @TableName = N'qvstg.OrderBacklog' ;
	exec tSQLt.FakeTable @TableName = N'qvstg.OrderShippedNotInvoiced' ;

	insert qvstg.OrderShippedNotInvoiced
		(OrderShippedNotInvoicedKey	, IsDeleted	, DataSourceKey	, OrderNumber	, NativeOrderLineNumber	, NativeShippingDocumentKey)
	values
		  (1001		, 'N'		, 1				, '2001'		, '3001'					, '4001')
		, (1002		, 'N'		, 1				, '2001'		, '3002'					, '4001')
		, (1003		, 'N'		, 1				, '2001'		, '3001'					, '4002')
		--! Simple case of multiple (3/4) invoice lines being duplicated
		, (1005		, 'N'		, 1				, '2002'		, '3001'					, '4002')
		, (1006		, 'N'		, 1				, '2002'		, '3002'					, '4002')
		, (1007		, 'N'		, 1				, '2002'		, '3002'					, '4002')
		, (1008		, 'N'		, 1				, '2002'		, '3003'					, '4002')
		, (1009		, 'N'		, 1				, '2002'		, '3003'					, '4002')
		, (1010		, 'N'		, 1				, '2002'		, '3004'					, '4002')
		, (1011		, 'N'		, 1				, '2002'		, '3004'					, '4002')
		--! More complex case with multiple repeating invoice lines and some inactive which should be excluded from the count
		, (1012		, 'N'		, 1				, '2003'		, '3001'					, '4003')
		, (1013		, 'N'		, 1				, '2003'		, '3002'					, '4003')
		, (1014		, 'Y'		, 1				, '2003'		, '3002'					, '4003')
		, (1015		, 'N'		, 1				, '2003'		, '3003'					, '4003')
		, (1016		, 'N'		, 1				, '2003'		, '3003'					, '4003')
		--! Four dupes counts as 1 in output message
		, (1017		, 'N'		, 1				, '2003'		, '3004'					, '4003')
		, (1018		, 'N'		, 1				, '2003'		, '3004'					, '4003')
		, (1019		, 'N'		, 1				, '2003'		, '3004'					, '4003')
		, (1020		, 'N'		, 1				, '2003'		, '3004'					, '4003')


	exec tSQLt.ExpectException
		  @ExpectedErrorNumber = 50000
		, @ExpectedMessagePattern = 'Check for Duplicates failed!  Invoice: 0 record(s) duplicated;  Order Backlog: 0 record(s) duplicated;  Order SNI: 5 record(s) duplicated%'
	
	exec etl.CheckForDuplicateQlikViewTransactions ;
end