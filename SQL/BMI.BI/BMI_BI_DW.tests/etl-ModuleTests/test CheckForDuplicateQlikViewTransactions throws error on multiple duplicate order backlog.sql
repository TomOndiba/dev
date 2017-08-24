CREATE procedure [etl-ModuleTests].[test CheckForDuplicateQlikViewTransactions throws error on multiple duplicate order backlog]
as
begin
	exec tSQLt.FakeTable @TableName = N'qvstg.Invoice' ;
	exec tSQLt.FakeTable @TableName = N'qvstg.OrderBacklog' ;
	exec tSQLt.FakeTable @TableName = N'qvstg.OrderShippedNotInvoiced' ;

	insert qvstg.OrderBacklog
		(OrderBacklogKey	, IsDeleted	, DataSourceKey	, OrderNumber	, NativeOrderLineNumber)
	values
		  (1001		, 'N'		, 1				, '2001'		, '3001')
		, (1002		, 'N'		, 1				, '2001'		, '3002')
		, (1003		, 'N'		, 1				, '2004'		, '3001')
		, (1004		, 'N'		, 1				, '2004'		, '3002')
		--! Simple case of multiple (3/4) invoice lines being duplicated
		, (1005		, 'N'		, 1				, '2002'		, '3001')
		, (1006		, 'N'		, 1				, '2002'		, '3002')
		, (1007		, 'N'		, 1				, '2002'		, '3002')
		, (1008		, 'N'		, 1				, '2002'		, '3003')
		, (1009		, 'N'		, 1				, '2002'		, '3003')
		, (1010		, 'N'		, 1				, '2002'		, '3004')
		, (1011		, 'N'		, 1				, '2002'		, '3004')
		--! More complex case with multiple repeating invoice lines and some inactive which should be excluded from the count
		, (1012		, 'N'		, 1				, '2003'		, '3001')
		, (1013		, 'N'		, 1				, '2003'		, '3002')
		, (1014		, 'Y'		, 1				, '2003'		, '3002')
		, (1015		, 'N'		, 1				, '2003'		, '3003')
		, (1016		, 'N'		, 1				, '2003'		, '3003')
		--! Four dupes counts as 1 in output message
		, (1017		, 'N'		, 1				, '2003'		, '3004')
		, (1018		, 'N'		, 1				, '2003'		, '3004')
		, (1019		, 'N'		, 1				, '2003'		, '3004')
		, (1020		, 'N'		, 1				, '2003'		, '3004')

	exec tSQLt.ExpectException
		  @ExpectedErrorNumber = 50000
		, @ExpectedMessagePattern = 'Check for Duplicates failed!  Invoice: 0 record(s) duplicated;  Order Backlog: 5 record(s) duplicated;  Order SNI: 0 record(s) duplicated%'
	
	exec etl.CheckForDuplicateQlikViewTransactions ;
end