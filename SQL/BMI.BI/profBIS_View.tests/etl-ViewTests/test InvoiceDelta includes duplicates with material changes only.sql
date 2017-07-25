create   procedure [etl-ViewTests].[test InvoiceDelta includes duplicates with material changes only]
as
begin
	exec tSQLt.FakeTable @TableName = N'stg.Invoice' ;
	exec tSQLt.FakeTable @TableName = N'stg.InvoiceControl' ;

	--! In yesterdays load when these three first arrived, InvoiceKey 1234 was the preferred record
	--! and therefore the only active record
	insert stg.InvoiceControl (InvoiceKey, PreviousDeltaHash, IsDeleted, LastTouchedOn)
	values
		  (1234, 'ABC', 'N', '20170724')
		, (2345, 'DEF', 'Y', '20170724')
		, (5678, 'GHI', 'Y', '20170724')

	--! Today, InvoiceKey 2345 has been updated meaning it is now the active preferred record
	--! Key 1234 is no longer active so should appear in the result set
	--! Key 5678 is still inactive but and so should not appear in the result set (even though Uniqueifier has changed)
	insert stg.Invoice (InvoiceKey, Uniqueifier, EtlCreatedOn, EtlUpdatedOn, EtlDeletedOn, EtlDeltaHash, IsDeleted)
	values
		  (1234, 3, '20170724'	, '20170724'	, '20170725'	, 'JKL'	, 'Y')
		, (2345, 1, '20170724'	, '20170725'	, null			, 'LMN'	, 'N')
		, (5678, 2, '20170724'	, '20170724'	, '20170724'	, 'TGH'	, 'Y');

	;with expectedCte (InvoiceKey)
	as
	(
				  select cast(1234 as int)
		union all select cast(2345 as int)
	)
	select * into #expected from expectedCte ;

	exec tSQLt.AssertEqualsTable '#expected', 'etl.InvoiceDelta';
end