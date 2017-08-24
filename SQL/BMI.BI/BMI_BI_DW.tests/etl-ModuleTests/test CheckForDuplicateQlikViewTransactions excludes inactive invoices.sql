create procedure [etl-ModuleTests].[test CheckForDuplicateQlikViewTransactions excludes inactive invoices]
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
		, (1005		, 'Y'		, 1				, '2001'		, '3001'					, '4001'		, '5002')

	exec tSQLt.ExpectNoException
	
	exec etl.CheckForDuplicateQlikViewTransactions ;
end