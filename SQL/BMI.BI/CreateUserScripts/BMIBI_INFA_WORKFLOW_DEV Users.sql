--!
--! BMI_BI_DWH.BMIBI_INFA_WORKFLOW_DEV.users.sql
--!
/*
select * from sys.database_principals;

select * from sys.dm_db_uncontained_entities
select name, containment, containment_desc from sys.databases
*/
--!
--! MAKE SURE WE ARE ON THE RIGHT INSTANCE AND IN THE RIGHT DATABASE
--!
set noexec off
go
if @@servername <> 'bmibidwh' or db_name() <> 'BMIBI_INFA_WORKFLOW_DEV'
	begin
		raiserror('Failed to run users script due incorrect Azure SQL Server or database', 16, 1) ;
		set noexec on ;
	end
go

--if exists(select * from sys.database_principals where name = 'INFA_SVC_DEV')
--  drop user [INFA_SVC_DEV] ;
--go

if not exists (select 1 from sys.database_principals where name = 'InfaDev')
	begin
		create user [InfaDev] for login [InfaDev] with default_schema = [dbo];

		alter role [db_owner] add member [InfaDev] ;
	end
go
