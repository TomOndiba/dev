--!
--! Azure AD Admins.BMI_BI_MART_DEV.sql
--!

--!
--! MAKE SURE WE ARE ON THE RIGHT INSTANCE AND IN THE RIGHT DATABASE
--!
if cast(serverproperty('ServerName') as nvarchar(255)) <> 'bmibidwh' or db_name() <> 'BMI_BI_MART_DEV'
	begin
		raiserror('Failed to run users script due incorrect Azure SQL Server instance or database', 16, 1) ;
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
exec sp_addrolemember N'db_accessadmin', N'Greg.Lucas@icopal.com' ;
go
exec sp_addrolemember N'db_owner', N'Greg.Lucas@icopal.com' ;
go
grant alter any user to [greg.lucas@icopal.com]
go

