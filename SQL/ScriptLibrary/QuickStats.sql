declare	@sortbyrows int = 0
select
	Id, 
	cast(object_name(Id) as varchar(50))		as [TableName]
	, sum(case	when indid < 2 then rows end)	as [RowCount]
	, (sum(reserved) * 8) / 1024				as [ReservedMB]
	, (sum(dpages) * 8) / 1024					as [DataMB]
	, (sum(used - dpages) * 8) / 1024			as [IndexMB]
	, (sum(reserved - used) * 8)				as [UnusedKB]
from
	sysindexes with (nolock)
where
		indid in (0, 1, 255)
	and cast(object_name(Id) as varchar(50)) is not null
	and Id > 100
group by Id with rollup
order by
	case when @sortbyrows = 1
			then sum(case when indid < 2 then [rows] end)
			else sum([reserved]) * 8
	end desc
go



