/*
--! Find re-delete candidates in BMI_BI_DW_PROD
;with dupesCte
as
(
	select
		  DataSourceKey
		, OrderNumber
		, NativeOrderLineNumber
		, count(*) as [DupeCount]
	from
		qvstg.OrderBacklog
	where
		IsDeleted = 'N'
	group by
		  DataSourceKey
		, OrderNumber
		, NativeOrderLineNumber
	having count(*) > 1
)
, resultsCte as
(
	select
		  ob.OrderBacklogKey
		, ob.IsDeleted
		, ob.EtlCreatedOn
		, ob.EtlUpdatedOn
		, ob.DataSourceKey
		, ob.QlikViewOrderBacklogKey
		, ob.LineCount
		, ob.OrderNumber
		, ob.NativeOrderLineNumber
		, row_number() over(partition by ob.DataSourceKey, ob.OrderNumber, ob.NativeOrderLineNumber order by ob.EtlUpdatedOn desc, ob.OrderBacklogKey desc) as [Preference]
		, ctrl.DupeCount
	from
		dupesCte as ctrl
	inner join qvstg.OrderBacklog as ob
		on ob.DataSourceKey = ctrl.DataSourceKey
		and ob.OrderNumber = ctrl.OrderNumber
		and ob.NativeOrderLineNumber = ctrl.NativeOrderLineNumber
	where
		ob.IsDeleted = 'N'
)
select distinct
	'union all select ' + cast(OrderBacklogKey as varchar(16)) as [cmd]
from
	resultsCte
where
		Preference > 1
--and
--	OrderBacklogKey % 2 = 1
order by
	[cmd]
go


select * from qvstg.OrderBacklog
where DataSourceKey = 100101 and OrderNumber = '0000436402' and NativeOrderLineNumber = '000080'
order by DataSourceKey, OrderNumber, NativeOrderLineNumber, EtlCreatedOn desc

*/

/*
select * from etl.OrderBacklogDelta
where 
		(DataSourceKey = 100115 and OrderNumber = '0003735866' and NativeOrderLineNumber = '4') -- 856655 / 696541
	--or (DataSourceKey = 100115 and OrderNumber = '0003749416' and NativeOrderLineNumber = '10')
	--or (DataSourceKey = 100115 and OrderNumber = '0003749416' and NativeOrderLineNumber = '30')
	--or (DataSourceKey = 100131 and OrderNumber = '91830' and NativeOrderLineNumber = '1')
	--or (DataSourceKey = 91844 and OrderNumber = '5' and NativeOrderLineNumber = '2')
order by DataSourceKey, OrderNumber, NativeOrderLineNumber


select * from stg.OrderBacklog
where 
		(SYSTEM_ID = 15 and ORDER_NUMBER = '0003735866' and ORDER_LINE_NUMBER = '4' and OrderBacklogKey in (856655, 696541, 824283))
	--or (SYSTEM_ID = 100115 and ORDER_NUMBER = '0003749416' and ORDER_LINE_NUMBER = '10')
	--or (SYSTEM_ID = 100115 and ORDER_NUMBER = '0003749416' and ORDER_LINE_NUMBER = '30')
	--or (SYSTEM_ID = 100131 and ORDER_NUMBER = '91830' and ORDER_LINE_NUMBER = '1')
	--or (SYSTEM_ID = 91844 and ORDER_NUMBER = '5' and ORDER_LINE_NUMBER = '2')
order by SYSTEM_ID, ORDER_NUMBER, ORDER_LINE_NUMBER, EtlCreatedOn desc

select * from stg.OrderBacklogControl where OrderBacklogKey in (856655, 696541, 824283)
*/

--select
--	  ctrl.OrderBacklogKey
--	, ctrl.PreviousDeltaHash
--	, ctrl.IsDeleted
--	, ctrl.LastTouchedOn
--	, ob.EtlCreatedOn
--	, ob.EtlUpdatedOn
--	, ob.EtlDeletedOn
--	, ob.IsDeleted
--	, ob.DuplicateCount
--	, ob.ORDER_NUMBER
--	, ob.ORDER_LINE_NUMBER
if object_id(N'tempdb..#tmp') is not null drop table #tmp;
go

; with tmpCte (OrderBacklogKey)
as
(
		  select 000000
union all select 000000
union all select 000000
union all select 000000
)
select * into #tmp from tmpCte


/*
create clustered index IDX_tmp_OrderBacklogKey on #tmp (OrderBacklogKey) ;

update
	ctrl
set
	  ctrl.IsDeleted = 'X'
	, ctrl.LastTouchedOn = getdate()
from
	#tmp as t
inner join stg.OrderBacklogControl as ctrl
	on t.OrderBacklogKey = ctrl.OrderBacklogKey
inner join stg.OrderBacklog as ob
	on ob.OrderBacklogKey = ctrl.OrderBacklogKey
where
	ob.IsDeleted = 'Y'
*/
