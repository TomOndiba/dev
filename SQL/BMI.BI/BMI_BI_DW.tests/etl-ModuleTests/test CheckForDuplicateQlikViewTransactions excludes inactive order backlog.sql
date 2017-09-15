CREATE procedure [etl-ModuleTests].[test CheckForDuplicateQlikViewTransactions excludes inactive order backlog]
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
		, (1004		, 'N'		, 1				, '2002'		, '3002')
		, (1005		, 'Y'		, 1				, '2002'		, '3002')

	exec tSQLt.ExpectNoException
	
	exec etl.CheckForDuplicateQlikViewTransactions ;
end