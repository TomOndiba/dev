create procedure [etl-ModuleTests].[test CheckForDuplicateQlikViewTransactions returns non-zero on duplicate invoices]
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
		, (1005		, 'N'		, 1				, '2001'		, '3001'					, '4001'		, '5002')

	exec tSQLt.ExpectException ;

	declare @_actual int;
	exec @_actual = etl.CheckForDuplicateQlikViewTransactions ;

	exec tSQLt.AssertEquals @Expected = 50000, @Actual = @_actual;
end