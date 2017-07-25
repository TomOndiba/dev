create   procedure [etl-ViewTests].[test InvoiceDelta includes rows with only IsDeleted different]
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
		--! We expect these tow records to be included because one has changed to actibve, the aother to inactive
		, (2222, 'AAA', 'N', '20170722')
		, (3333, 'AAA', 'Y', '20170722')

	insert stg.Invoice (InvoiceKey, Uniqueifier, EtlCreatedOn, EtlUpdatedOn, EtlDeletedOn, EtlDeltaHash, IsDeleted)
	values
		  (1234, 3, '20170724'	, '20170724'	, null	, 'ABC'	, 'N')
		, (2345, 1, '20170724'	, '20170724'	, null	, 'DEF'	, 'Y')
		, (5678, 2, '20170724'	, '20170724'	, null	, 'GHI'	, 'Y')
		, (2221, 1, '20170722'	, '20170723'	, null	, 'KLM'	, 'N')
		, (2222, 1, '20170722'	, '20170722'	, null	, 'AAA'	, 'Y')
		, (3333, 1, '20170722'	, '20170722'	, null	, 'AAA'	, 'N')

	;with expectedCte (InvoiceKey)
	as
	(
				  select cast(2222 as int)
		union all select cast(3333 as int)
	)
	select * into #expected from expectedCte ;
end