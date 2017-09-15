--!
--! Azure AD Admins.BMI_BAT_MAN_DEV.sql
--!

--!
--! MAKE SURE WE ARE ON THE RIGHT INSTANCE AND IN THE RIGHT DATABASE
--!
set noexec off
go
if cast(serverproperty('ServerName') as nvarchar(255)) <> 'bmibidwh' or db_name() <> 'BMI_BAT_MAN_DEV'
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

if not exists (select 1 from sys.sysusers where name = 'Greg.Lucas@icopal.com')
	begin
		create user [Greg.Lucas@icopal.com] from external provider;
	end
go
alter role [db_accessadmin] add member [Greg.Lucas@icopal.com]
go
alter role [db_owner] add member [Greg.Lucas@icopal.com]
go
grant alter any user to [greg.lucas@icopal.com]
go
