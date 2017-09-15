CREATE procedure [etl-ModuleTests].[test CheckForDuplicateQlikViewTransactions throws error on single duplicate order backlog]
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
		, (1003		, 'N'		, 1				, '2002'		, '3001')
		, (1004		, 'N'		, 1				, '2002'		, '3001')
		, (1005		, 'N'		, 1				, '2002'		, '3001')

	exec tSQLt.ExpectException
		  @ExpectedErrorNumber = 50000
		, @ExpectedMessagePattern = 'Check for Duplicates failed!  Invoice: 0 record(s) duplicated;  Order Backlog: 1 record(s) duplicated;  Order SNI: 0 record(s) duplicated%'

	exec etl.CheckForDuplicateQlikViewTransactions ;
end