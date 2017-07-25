create   procedure [etl-ViewTests].[test InvoiceDelta includes changed singleton records]
as
begin
	exec tSQLt.FakeTable @TableName = N'stg.Invoice' ;
	exec tSQLt.FakeTable @TableName = N'stg.InvoiceControl' ;

	insert stg.InvoiceControl (InvoiceKey, PreviousDeltaHash) values (1234, 'ABC');
	insert stg.Invoice (InvoiceKey, Uniqueifier, EtlDeltaHash) values (1234, 1, 'DEF');

	select cast(1234 as int) as [InvoiceKey] into #expected;

	exec tSQLt.AssertEqualsTable '#expected', 'etl.InvoiceDelta';
end