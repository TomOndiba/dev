--!
--! Retire DEV Databases.sql
--!

--!
--! MAKE SURE WE ARE ON THE RIGHT INSTANCE AND IN THE RIGHT DATABASE
--!
set noexec off
go
if cast(serverproperty('ServerName') as nvarchar(255)) <> 'bmibidwh' or db_name() <> 'master'
	begin
		raiserror('Failed to run users script due incorrect Azure SQL Server instance or database', 16, 1) ;
		set noexec on ;
	end
go

if exists (select * from sys.databases where name = 'BMI_BAT_MAN_DEV')
	drop database [BMI_BAT_MAN_DEV]
go
if exists (select * from sys.databases where name = 'bmi_prod_plant_apps_v2_1')
	drop database [bmi_prod_plant_apps_v2_1]
go
if exists (select * from sys.databases where name = 'BMIBI_INFA_CACHE_DEV')
	drop database [BMIBI_INFA_CACHE_DEV]
go
if exists (select * from sys.databases where name = 'BMIBI_INFA_DOMAIN_DEV')
	drop database [BMIBI_INFA_DOMAIN_DEV]
go
if exists (select * from sys.databases where name = 'BMIBI_INFA_MODEL_REPO_DEV')
	drop database [BMIBI_INFA_MODEL_REPO_DEV]
go
if exists (select * from sys.databases where name = 'BMIBI_INFA_PROFILING_DEV')
	drop database [BMIBI_INFA_PROFILING_DEV]
go
--if exists (select * from sys.databases where name = 'BMIBI_INFA_REFERENCE_DEV')
--	drop database [BMIBI_INFA_REFERENCE_DEV]
--go
if exists (select * from sys.databases where name = 'BMIBI_INFA_WORKFLOW_DEV_X')
	drop database [BMIBI_INFA_WORKFLOW_DEV_X]
go
if exists (select * from sys.databases where name = 'COPY_FRPARCEGID_CE')
	drop database [COPY_FRPARCEGID_CE]
go
if exists (select * from sys.databases where name = 'ICS_CODE_GEN_POC_SRC')
	drop database [ICS_CODE_GEN_POC_SRC]
go
if exists (select * from sys.databases where name = 'ICS_CODE_GEN_POC_TGT')
	drop database [ICS_CODE_GEN_POC_TGT]
go
if exists (select * from sys.databases where name = 'JASON_SANDBOX')
	drop database [JASON_SANDBOX]
go


