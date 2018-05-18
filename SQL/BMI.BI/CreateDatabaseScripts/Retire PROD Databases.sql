--!
--! Retire PROD Databases.sql
--!

--!
--! MAKE SURE WE ARE ON THE RIGHT INSTANCE AND IN THE RIGHT DATABASE
--!
set noexec off
go
if cast(serverproperty('ServerName') as nvarchar(255)) <> 'bmidwhprod' or db_name() <> 'master'
	begin
		raiserror('Failed to run users script due incorrect Azure SQL Server instance or database', 16, 1) ;
		set noexec on ;
	end
go

if exists (select * from sys.databases where name = 'BMI_BAT_MAN_PROD')
	drop database [BMI_BAT_MAN_PROD]
go
if exists (select * from sys.databases where name = 'BMIBI_INFA_CACHE_PROD')
	drop database [BMIBI_INFA_CACHE_PROD]
go
if exists (select * from sys.databases where name = 'BMIBI_INFA_DOMAIN_PROD')
	drop database [BMIBI_INFA_DOMAIN_PROD]
go
if exists (select * from sys.databases where name = 'BMIBI_INFA_MODEL_REPO_PROD')
	drop database [BMIBI_INFA_MODEL_REPO_PROD]
go
if exists (select * from sys.databases where name = 'BMIBI_INFA_PROFILING_PROD')
	drop database [BMIBI_INFA_PROFILING_PROD]
go
if exists (select * from sys.databases where name = 'BMIBI_INFA_WORKFLOW_PROD')
	drop database [BMIBI_INFA_WORKFLOW_PROD]
go

