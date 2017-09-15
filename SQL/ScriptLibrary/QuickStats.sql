select
	  Entity
	, DataSourceName
	, IsDeleted
	, ImportCount
from
	(
			select
				  cast('QV Customer' as varchar(32)) as [Entity]
				, ds.DataSourceName
				, src.IsDeleted
				, count(*) as [ImportCount]
			from
				qvstg.Customer as src
			inner join dbo.DataSource as ds
				on ds.DataSourceKey = src.DataSourceKey
			group by
				  ds.DataSourceName
				, src.IsDeleted
		union all
			select
				  cast('QV Product' as varchar(32)) as [Entity]
				, ds.DataSourceName
				, src.IsDeleted
				, count(*) as [ImportCount]
			from
				qvstg.Product as src
			inner join dbo.DataSource as ds
				on ds.DataSourceKey = src.DataSourceKey
			group by
				  ds.DataSourceName
				, src.IsDeleted
		union all
			select
				  cast('QV Invoice' as varchar(32)) as [Entity]
				, ds.DataSourceName
				, src.IsDeleted
				, count(*) as [ImportCount]
			from
				qvstg.Product as src
			inner join dbo.DataSource as ds
				on ds.DataSourceKey = src.DataSourceKey
			where
				src.IsDeleted = 'N'
			group by
				  ds.DataSourceName
				, src.IsDeleted
		union all
			select
				  cast('QV Order Backlog' as varchar(32)) as [Entity]
				, ds.DataSourceName
				, src.IsDeleted
				, count(*) as [ImportCount]
			from
				qvstg.Product as src
			inner join dbo.DataSource as ds
				on ds.DataSourceKey = src.DataSourceKey
			where
				src.IsDeleted = 'N'
			group by
				  ds.DataSourceName
				, src.IsDeleted
		union all
			select
				  cast('QV Order SNI' as varchar(32)) as [Entity]
				, ds.DataSourceName
				, src.IsDeleted
				, count(*) as [ImportCount]
			from
				qvstg.Product as src
			inner join dbo.DataSource as ds
				on ds.DataSourceKey = src.DataSourceKey
			where
				src.IsDeleted = 'N'
			group by
				  ds.DataSourceName
				, src.IsDeleted
) as x
--where
--	x.Moniker = 'CRP Russia'
order by
	[Entity], [DataSourceName], [IsDeleted]
go


declare	@sortbyrows int = 0
select
	  cast(object_name(id) as varchar(50))		as [TableName]
	, sum(case	when indid < 2 then rows end)	as [RowCount]
	, (sum(reserved) * 8) / 1024				as [ReservedMB]
	, (sum(dpages) * 8) / 1024					as [DataMB]
	, (sum(used - dpages) * 8) / 1024			as [IndexMB]
	, (sum(reserved - used) * 8)				as [UnusedKB]
from
	sysindexes with (nolock)
where
		indid in (0, 1, 255)
	and id > 100
	and cast(object_name(id) as varchar(50)) like 'ics_land_M3\_%' escape '\'
group by id with rollup
order by
	case when @sortbyrows = 1
			then sum(case when indid < 2 then [rows] end)
			else sum([reserved]) * 8
	end desc
go


