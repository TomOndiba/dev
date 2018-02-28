select * from dbo.__MigrationLog as ml order by ml.complete_dt desc

select
	  sequence_no
	, 'select'
	+ '  ''' + cast(migration_id as varchar(50)) + ''''
	+ ', ''' + cast(script_checksum as varchar(50)) + ''''
	+ ', ''' + script_filename + ''''
	+ ', ''' + format(complete_dt, 'yyyyMMdd hh:mm:ss') + ''''
	+ ', ''' + applied_by + ''''
	+ ', ' + cast(deployed as varchar(50))
	+ ', ''' + coalesce([version], 'null') + ''''
	+ ', ''' + coalesce(package_version, 'null') + ''''
	+ ', ''' + coalesce(release_version, 'null') + ''''
from dbo.__MigrationLog
where script_filename in ('Migrations\1.1.0\060_Procurement_psa.sql', 'Migrations\1.1.0\059_Procurement_tsa.sql')
order by sequence_no desc
