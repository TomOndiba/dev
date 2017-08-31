/*
--! Find re-delete candidates in BMI_BI_DW_PROD
;with dupesCte
as
(
	select
		  i.DataSourceKey
		, i.InvoiceNumber
		, i.NativeInvoiceLineNumber
		, i.OrderNumber
		, i.NativeOrderLineNumber
		, count(*) as [DupeCount]
	from
		qvstg.Invoice as i
	group by
		  i.DataSourceKey
		, i.InvoiceNumber
		, i.NativeInvoiceLineNumber
		, i.OrderNumber
		, i.NativeOrderLineNumber
	having count(*) > 1
)
, resultsCte
as
(
	select
		  i.InvoiceKey
		, i.IsDeleted
		, i.EtlUpdatedOn
		, i.DataSourceKey
		, i.QlikViewInvoiceKey
		, i.LineCount
		, i.InvoiceNumber
		, i.InvoiceLineNumber
		, i.NativeInvoiceLineNumber
		, i.OrderNumber
		, i.OrderLineNumber
		, i.NativeOrderLineNumber
		, i.GroupAmountEUR
		, row_number() over(partition by i.DataSourceKey, i.InvoiceNumber, i.NativeInvoiceLineNumber, i.OrderNumber, i.NativeOrderLineNumber order by i.EtlUpdatedOn desc, i.InvoiceKey desc) as [Preference]
		, ctrl.DupeCount
	from
		dupesCte as ctrl
	inner join qvstg.Invoice as i
		on  i.DataSourceKey = ctrl.DataSourceKey
		and i.InvoiceNumber = ctrl.InvoiceNumber
		and i.NativeInvoiceLineNumber = ctrl.NativeInvoiceLineNumber
		and i.OrderNumber = ctrl.OrderNumber
		and i.NativeOrderLineNumber = ctrl.NativeOrderLineNumber
	where
		i.IsDeleted = 'N'
)
select distinct
	'union all select ' + cast(InvoiceKey as varchar(16))
from
	resultsCte
where
		Preference > 1
	and InvoiceKey % 2 = 1
go



*/

if object_id(N'tempdb..#tmp') is not null drop table #tmp;
go

; with tmpCte (InvoiceKey)
as
(
		  select 000000
union all select 000000
union all select 000000
union all select 000000
)
select * into #tmp from tmpCte

create clustered index IDX_tmp_InvoiceKey on #tmp (InvoiceKey) ;


--select
--	  ctrl.InvoiceKey
--	, ctrl.PreviousDeltaHash
--	, ctrl.IsDeleted
--	, ctrl.LastTouchedOn
--	, i.EtlCreatedOn
--	, i.EtlUpdatedOn
--	, i.EtlDeletedOn
--	, i.IsDeleted
--	, i.DuplicateCount
--	, i.INVOICE_NUMBER
--	, i.INVOICE_LINE_NUMBER
--	, i.ORDER_NUMBER
--	, i.ORDER_LINE_NUMBER
update
	ctrl
set
	  ctrl.IsDeleted = 'X'
	, ctrl.LastTouchedOn = getdate()
from
	#tmp as t
inner join stg.InvoiceControl as ctrl
	on t.InvoiceKey = ctrl.InvoiceKey
inner join stg.Invoice as i
	on i.InvoiceKey = ctrl.InvoiceKey
where
	i.IsDeleted = 'Y'
