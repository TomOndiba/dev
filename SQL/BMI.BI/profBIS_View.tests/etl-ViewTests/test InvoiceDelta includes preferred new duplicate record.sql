﻿CREATE procedure [etl-ViewTests].[test InvoiceDelta includes preferred new duplicate record]
as
begin
	exec tSQLt.FakeTable @TableName = N'stg.Invoice' ;
	exec tSQLt.FakeTable @TableName = N'stg.InvoiceControl' ;

	insert stg.InvoiceControl (InvoiceKey, PreviousDeltaHash, IsDeleted, LastTouchedOn)
	values
		  (2345, 'DEF', 'Y', '20170724')
		, (5678, 'GHI', 'Y', '20170724')

	insert stg.Invoice (InvoiceKey, Uniqueifier, EtlDeltaHash, IsDeleted)
	values
		  (1234, 1, 'ABC', 'N')
		, (2345, 2, 'DEF', 'Y')
		, (5678, 3, 'GHI', 'Y');

	select cast(1234 as int) as [InvoiceKey] into #expected;

	exec tSQLt.AssertEqualsTable '#expected', 'etl.InvoiceDelta';
end