--!
--! Azure AD Admins.BMIBI_INFA_PROFILING_DEV.sql
--!

--!
--! MAKE SURE WE ARE ON THE RIGHT INSTANCE AND IN THE RIGHT DATABASE
--!
set noexec off
go
if cast(serverproperty('ServerName') as nvarchar(255)) <> 'bmibidwh' or db_name() <> 'BMIBI_INFA_PROFILING_DEV'
	begin
		raiserror('Failed to run users script due incorrect Azure SQL Server instance or database', 16, 1) ;
		set noexec on ;
	end
go

/*
select * from sys.sysusers;
select * from sys.sql_logins;
select * from sys.database_principals;
*/

if exists (select 1 from sys.sysusers where name = 'Greg.Lucas@icopal.com')
	drop user [Greg.Lucas@icopal.com] ;
go
if not exists (select 1 from sys.sysusers where name = 'Greg.Lucas@icopal.com')
	create user [Greg.Lucas@icopal.com] from external provider;
go
exec sp_addrolemember N'db_accessadmin', N'Greg.Lucas@icopal.com' ;
go
exec sp_addrolemember N'db_owner', N'Greg.Lucas@icopal.com' ;
go
grant alter any user to [greg.lucas@icopal.com]
go
