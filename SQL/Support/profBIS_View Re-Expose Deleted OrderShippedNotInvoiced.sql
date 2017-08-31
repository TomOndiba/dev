/*
--! Find re-delete candidates in BMI_BI_DW_PROD
;with dupesCte
as
(
	select
		  DataSourceKey
		, OrderNumber
		, NativeOrderLineNumber
		, NativeShippingDocumentKey
		, count(*) as [DupeCount]
	from
		qvstg.OrderShippedNotInvoiced
	group by
		  DataSourceKey
		, OrderNumber
		, NativeOrderLineNumber
		, NativeShippingDocumentKey
	having count(*) > 1
)
, resultsCte as
(
	select
		  osni.OrderShippedNotInvoicedKey
		, osni.IsDeleted
		, osni.EtlUpdatedOn
		, osni.DataSourceKey
		, osni.QlikViewOrderShippedNotInvoicedKey
		, osni.LineCount
		, osni.OrderNumber
		, osni.NativeOrderLineNumber
		, osni.NativeShippingDocumentKey
		, row_number() over(partition by osni.DataSourceKey, osni.OrderNumber, osni.NativeOrderLineNumber, osni.NativeShippingDocumentKey order by osni.EtlUpdatedOn desc, osni.OrderShippedNotInvoicedKey desc) as [Preference]
		, ctrl.DupeCount
	from
		dupesCte as ctrl
	inner join qvstg.OrderShippedNotInvoiced as osni
		on osni.DataSourceKey = ctrl.DataSourceKey
		and osni.OrderNumber = ctrl.OrderNumber
		and osni.NativeOrderLineNumber = ctrl.NativeOrderLineNumber
		and osni.NativeShippingDocumentKey = ctrl.NativeShippingDocumentKey
	where
		osni.IsDeleted = 'N'
)
select distinct
	'union all select ' + cast(OrderShippedNotInvoicedKey as varchar(16)) as [cmd]
from
	resultsCte
where
		Preference > 1
--and
--	OrderShippedNotInvoicedKey % 2 = 1
order by
	[cmd]
go



*/

if object_id(N'tempdb..#tmp') is not null drop table #tmp;
go

; with tmpCte (OrderShippedNotInvoicedKey)
as
(
		  select 000000
union all select 000000
union all select 000000
union all select 000000
)
select * into #tmp from tmpCte


/*
create clustered index IDX_tmp_OrderShippedNotInvoicedKey on #tmp (OrderShippedNotInvoicedKey) ;

update
	ctrl
set
	  ctrl.IsDeleted = 'X'
	, ctrl.LastTouchedOn = getdate()
from
	#tmp as t
inner join stg.OrderShippedNotInvoicedControl as ctrl
	on t.OrderShippedNotInvoicedKey = ctrl.OrderShippedNotInvoicedKey
inner join stg.OrderShippedNotInvoiced as ob
	on ob.OrderShippedNotInvoicedKey = ctrl.OrderShippedNotInvoicedKey
where
	ob.IsDeleted = 'Y'
*/

