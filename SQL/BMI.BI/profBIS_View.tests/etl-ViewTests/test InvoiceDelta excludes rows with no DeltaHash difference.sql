CREATE   procedure [etl-ViewTests].[test InvoiceDelta excludes rows with no DeltaHash difference]
as
begin
	exec tSQLt.FakeTable @TableName = N'stg.Invoice' ;
	exec tSQLt.FakeTable @TableName = N'stg.InvoiceControl' ;

	insert stg.InvoiceControl (InvoiceKey, PreviousDeltaHash, IsDeleted, LastTouchedOn)
	values
		  (1234, 'ABC', 'N', '20170724')
		, (2345, 'DEF', 'Y', '20170724')
		, (5678, 'GHI', 'Y', '20170724')
		, (2221, 'KLM', 'N', '20170723')
		--! This singleton has a different LastTouchedOn but the DeltaHash and IsDeleted values are the same
		, (2222, 'AAA', 'N', '20170722')

	insert stg.Invoice (InvoiceKey, Uniqueifier, EtlCreatedOn, EtlUpdatedOn, EtlDeletedOn, EtlDeltaHash, IsDeleted)
	values
		  (1234, 3, '20170724'	, '20170724'	, null	, 'ABC'	, 'N')
		, (2345, 1, '20170724'	, '20170724'	, null	, 'DEF'	, 'Y')
		, (5678, 2, '20170724'	, '20170724'	, null	, 'GHI'	, 'Y')
		, (2221, 1, '20170722'	, '20170723'	, null	, 'KLM'	, 'N')
		, (2222, 1, '20170722'	, '20170725'	, null	, 'AAA'	, 'N')

	exec tSQLt.AssertEmptyTable 'etl.InvoiceDelta';
end