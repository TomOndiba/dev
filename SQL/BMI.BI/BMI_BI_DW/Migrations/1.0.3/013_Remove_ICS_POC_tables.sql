-- <Migration ID="0c0ce9b8-63b4-41d5-b9db-7bd0db068815" />
GO

if objectpropertyex(object_id(N'[psa].[ICS_STG_audit]'), N'IsUserTable') is not null
	drop table [psa].[ICS_STG_audit]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_audit]'), N'IsUserTable') is not null
	drop table [tsa].[ICS_LAND_audit]
go
if objectpropertyex(object_id(N'[tsa].[ics_sql_dummySource]'), N'IsUserTable') is not null
	drop table [tsa].[ics_sql_dummySource]
go
if objectpropertyex(object_id(N'[tsa].[ics_sql_runLog]'), N'IsUserTable') is not null
	drop table [tsa].[ics_sql_runLog]
go