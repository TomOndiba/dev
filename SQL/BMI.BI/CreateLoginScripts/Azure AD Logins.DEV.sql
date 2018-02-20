--!
--! Azure AD Logins.DEV.sql
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

/*
select * from sys.sysusers;
select * from sys.sql_logins;
select * from sys.database_principals;
*/

--if exists(select * from sys.sysusers where name = 'INFA_SVC_DEV@icopal.com')
--  drop user [INFA_SVC_DEV@icopal.com] ;
--go

--if not exists (select 1 from sys.sysusers where name = 'greg.lucas@icopal.com')
--	begin
--		create user [greg.lucas@icopal.com] from external provider;
--	end
--go
--alter role [dbmanager] add member [greg.lucas@icopal.com]
--go
--alter role [loginmanager] add member [greg.lucas@icopal.com]
--go
--grant alter any user to [greg.lucas@icopal.com]
--go

if not exists (select * from sys.sysusers where name = 'andrew.couch@icopal.com')
	begin
		create user [andrew.couch@icopal.com] from external provider;
	end
go

if not exists (select * from sys.sysusers where name = 'razia.nazir@icopal.com')
	begin
		create user [razia.nazir@icopal.com] from external provider;
	end
go

if not exists (select * from sys.sysusers where name = 'anthony.smart@icopal.com')
	begin
		create user [anthony.smart@icopal.com] from external provider;
	end
go
if not exists (select * from sys.sysusers where name = 'jason.bogart@icopal.com')
	begin
		create user [jason.bogart@icopal.com] from external provider;
	end
go
if not exists (select * from sys.sysusers where name = 'tom.manville@icopal.com')
	begin
		create user [tom.manville@icopal.com] from external provider;
	end
go
if not exists (select * from sys.sysusers where name = 'mark.bolton@icopal.com')
	begin
		create user [mark.bolton@icopal.com] from external provider;
	end
go
if not exists (select * from sys.sysusers where name = 'bob.abildgaard-joergensen@icopal.com')
	begin
		create user [bob.abildgaard-joergensen@icopal.com] from external provider;
	end
go
if not exists (select * from sys.sysusers where name = 'gary.kearns@icopal.com')
	begin
		create user [Gary.Kearns@icopal.com] from external provider;
	end
go

/*
if not exists (select * from sys.sysusers where name = 'Amelie.Pogson@icopal.com')
	begin
		create user [Amelie.Pogson@icopal.com] from external provider;
	end
go
if not exists (select * from sys.sysusers where name = 'Andrew.Marshall@icopal.com')
	begin
		create user [Andrew.Marshall@icopal.com] from external provider;
	end
go
if not exists (select * from sys.sysusers where name = 'Angus.Beattie@icopal.com')
	begin
		create user [Angus.Beattie@icopal.com] from external provider;
	end
go
if not exists (select * from sys.sysusers where name = 'Anne.DuffyPenny@icopal.com')
	begin
		create user [Anne.DuffyPenny@icopal.com] from external provider;
	end
go
if not exists (select * from sys.sysusers where name = 'Humayun.Kabir@icopal.com')
	begin
		create user [Humayun.Kabir@icopal.com] from external provider;
	end
go
if not exists (select * from sys.sysusers where name = 'Patrick.LeBlond@icopal.com')
	begin
		create user [Patrick.LeBlond@icopal.com] from external provider;
	end
go
if not exists (select * from sys.sysusers where name = 'Redouane.Berksi@icopal.com')
	begin
		create user [Redouane.Berksi@icopal.com] from external provider;
	end
go
if not exists (select * from sys.sysusers where name = 'Robert.Metcalfe@icopal.com')
	begin
		create user [Robert.Metcalfe@icopal.com] from external provider;
	end
go
if not exists (select * from sys.sysusers where name = 'Stuart.Walton@icopal.com')
	begin
		create user [Stuart.Walton@icopal.com] from external provider;
	end
go
if not exists (select * from sys.sysusers where name = 'Tony.Pagett@icopal.com')
	begin
		create user [Tony.Pagett@icopal.com] from external provider;
	end
go
*/