--!
--! BMI_BI_DWH.BMIBI_INFA_MODEL_REPO_PROD.users.sql
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
if @@servername <> 'bmidwhprod' or db_name() <> 'BMIBI_INFA_MODEL_REPO_PROD'
	begin
		raiserror('Failed to run users script due incorrect Azure SQL Server or database', 16, 1) ;
		set noexec on ;
	end
go

if exists(select * from sys.database_principals where name = 'INFA_SVC_PROD')
  drop user [INFA_SVC_PROD] ;
go
if exists(select * from sys.database_principals where name = 'InfaProd')
  drop user [InfaProd] ;
go

if not exists (select 1 from sys.database_principals where name = 'InfaProd')
	begin
		create user [InfaProd] for login [InfaProd] with default_schema = [dbo];

		alter role [db_owner] add member [InfaProd] ;
	end
go

