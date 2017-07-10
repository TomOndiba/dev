--!
--! privy.StagingLoadParameter.data.sql
--!
;with sourceCte (ModuleName, DataCaptureStart, DataCaptureEnd)
as
(
			  select cast('' as varchar(200))					, cast(null as datetime)	, cast(null as datetime)
	union all select 'OVERRIDE'									, null						, null
	union all select 'DEFAULT'									, '20160101 00:00:00'		, '20201231 23:59:59.997'
	union all select '[privy].[InvoiceRefresh]'					, '20160101 00:00:00'		, '20171231 23:59:59.997'
	union all select '[privy].[OrderShippedNotInvoicedRefresh]'	, '20160101 00:00:00'		, '20171231 23:59:59.997'
	union all select '[privy].[OrderBacklogRefresh]'			, '20160101 00:00:00'		, '20171231 23:59:59.997'
)
merge into privy.StagingLoadParameter as tgt
using sourceCte as src
	on src.ModuleName = tgt.ModuleName
when not matched and len(src.ModuleName) > 0
	then insert
	(
	  ModuleName
	, DataCaptureStart
	, DataCaptureEnd
	)
	values
	(
	  src.ModuleName
	, src.DataCaptureStart
	, src.DataCaptureEnd
	)
when matched and len(src.ModuleName) > 0
	then update
		set
			  tgt.DataCaptureStart = src.DataCaptureStart
			, tgt.DataCaptureEnd = src.DataCaptureEnd
when not matched by source
	then delete;
go
