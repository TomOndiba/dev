CREATE procedure [etl-ViewTests].[test InvoiceDelta includes new singleton records]
as
begin
	exec tSQLt.FakeTable @TableName = N'stg.Invoice' ;
	exec tSQLt.FakeTable @TableName = N'stg.InvoiceControl' ;

	insert stg.Invoice (InvoiceKey, Uniqueifier) values (1234, 1);

	select cast(1234 as int) as [InvoiceKey] into #expected;

	exec tSQLt.AssertEqualsTable '#expected', 'etl.InvoiceDelta';
end