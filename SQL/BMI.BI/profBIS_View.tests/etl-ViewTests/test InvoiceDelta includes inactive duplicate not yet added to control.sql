create procedure [etl-ViewTests].[test InvoiceDelta includes inactive duplicate not yet added to control]
as
begin
	exec tSQLt.FakeTable @TableName = N'stg.Invoice' ;
	exec tSQLt.FakeTable @TableName = N'stg.InvoiceControl' ;

	insert stg.InvoiceControl (InvoiceKey, PreviousDeltaHash, IsDeleted, LastTouchedOn)
	values
		  (5678, 'GHI', 'Y', '20170724')

	insert stg.Invoice (InvoiceKey, Uniqueifier, EtlDeltaHash, IsDeleted)
	values
		  (1234, 1, 'ABC', 'N')
		, (2345, 2, 'DEF', 'Y')
		, (5678, 3, 'GHI', 'Y');

	;with expectedCte (InvoiceKey)
	as
	(
				  select cast(1234 as int)
		union all select cast(2345 as int)
	)
	select * into #expected from expectedCte ;

	exec tSQLt.AssertEqualsTable '#expected', 'etl.InvoiceDelta';
end