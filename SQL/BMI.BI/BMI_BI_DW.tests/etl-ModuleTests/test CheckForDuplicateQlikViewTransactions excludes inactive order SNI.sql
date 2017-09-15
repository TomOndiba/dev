CREATE procedure [etl-ModuleTests].[test CheckForDuplicateQlikViewTransactions excludes inactive order SNI]
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
		, (1003		, 'Y'		, 1				, '2001'		, '3001'					, '4002')

	exec tSQLt.ExpectNoException
	
	exec etl.CheckForDuplicateQlikViewTransactions ;
end