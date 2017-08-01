-- <Migration ID="62fea8ba-454c-4b69-82fa-c9a79e5477c8" />
go

print N'Altering [psa].[ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName]'
go
if exists
	(
		select 1 from INFORMATION_SCHEMA.COLUMNS
		where TABLE_SCHEMA = 'psa'
		and TABLE_NAME = 'ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName'
		and COLUMN_NAME = 'EtlSampleTable'
	)
	exec sp_rename N'[psa].[ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName].[EtlSampleTable]', N'EtlSourceTable', N'COLUMN'
go
print N'Altering [tsa].[ICS_LAND_SampleSystemName_SourceCountryCode_SampleTableName]'
go
if exists
	(
		select 1 from INFORMATION_SCHEMA.COLUMNS
		where TABLE_SCHEMA = 'tsa'
		and TABLE_NAME = 'ICS_LAND_SampleSystemName_SourceCountryCode_SampleTableName'
		and COLUMN_NAME = 'EtlSampleTable'
	)
	exec sp_rename N'[tsa].[ICS_LAND_SampleSystemName_SourceCountryCode_SampleTableName].[EtlSampleTable]', N'EtlSourceTable', N'COLUMN'
go
go
grant create table to [EtlDevelopersDEV]
go
