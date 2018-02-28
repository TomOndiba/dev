select * from dbo.__MigrationLog as ml order by ml.sequence_no desc

--!
--! Generate the values to be inserted from the definitive migration log
--!
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
	+ ', ' + cast(sequence_no as varchar(50))
from dbo.__MigrationLog
where script_filename in ('Migrations\1.1.0\062_TSA_ibs_procurement_tables.sql', 'Migrations\1.1.0\063_PSA_ibs_procurement_tables.sql')
order by sequence_no desc


begin tran

select top 10 * from dbo.__MigrationLog as ml order by ml.sequence_no desc

--! Remove the migration log entries that need to be corrected
delete dbo.__MigrationLog where script_filename in ('Migrations\1.1.0\060_Procurement_psa.sql', 'Migrations\1.1.0\059_Procurement_tsa.sql')

;with sourceCte (migration_id, script_checksum, script_filename, complete_dt, applied_by, deployed, [version], package_version, release_version, sequence_no)
as
(
		  select  'B7C012C7-F6F4-42A2-9EFC-3DECFFA563F1', '0B894C435768A108768E7FFD8F5F0130021CF7B20FFCA80498', 'Migrations\1.1.0\063_PSA_ibs_procurement_tables.sql', '20180228 09:47:59', 'DATA-CENTRIC-V5\gml', 1, '1.1.0', '1.1.0', 'null', 100
union all select  'CA5BFF6D-ACEA-469B-B5B6-A76F21AE17EC', '8441CC6341A64BCD1E7CCA5A1671173242D42B46DDEBDCCE90', 'Migrations\1.1.0\062_TSA_ibs_procurement_tables.sql', '20180228 09:47:59', 'DATA-CENTRIC-V5\gml', 1, '1.1.0', '1.1.0', 'null', 99
)
insert dbo.__MigrationLog
(
  migration_id
, script_checksum
, script_filename
, complete_dt
, applied_by
, deployed
, [version]
, package_version
, release_version
)
select
	  migration_id
	, script_checksum
	, script_filename
	, getdate()
	, applied_by
	, deployed
	, [version]
	, package_version
	, release_version
from
	sourceCte
order by
	sequence_no asc

select top 10 * from dbo.__MigrationLog as ml order by ml.sequence_no desc


commit tran
go
