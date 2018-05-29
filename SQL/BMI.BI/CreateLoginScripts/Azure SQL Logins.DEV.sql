--!
--! Azure SQL Logins.DEV.sql
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

--if exists(select * from sys.database_principals where name = 'InfaDev')
--  drop user [InfaDev] ;
--go
--if exists(select * from sys.sql_logins where name = 'InfaDev')
--  drop login [InfaDev] ;
--go

--!
--! IMPORTANT NOTE:
--! When creating SQL Logins, we need to grant access to master so that
--! connection strings that do not specify a default database still work
--!

if not exists (select 1 from sys.sql_logins where name = 'greg.lucas.dba')
	create login [greg.lucas.dba] with password = 'ZxcAsdQwe!23' ;
else
	alter login [greg.lucas.dba] with password = 'ZxcAsdQwe!23' ;
go
if not exists (select 1 from sys.database_principals where name = 'greg.lucas.dba')
	create user [greg.lucas.dba] for login [greg.lucas.dba] with default_schema = [dbo];
go
alter role [dbmanager] add member [greg.lucas.dba]
go
alter role [loginmanager] add member [greg.lucas.dba]
go
grant alter any user to [greg.lucas.dba]
go


--!
--!
--!
if not exists (select 1 from sys.sql_logins where name = 'InfaDev')
	create login [InfaDev] with password = 'Pow�r$ent3r@' ;
else
	alter login [InfaDev] with password = 'Pow�r$ent3r@' ;
go
if not exists (select 1 from sys.database_principals where name = 'InfaDev')
	create user [InfaDev] for login [InfaDev] with default_schema = [dbo];
go

--!
--!
--!
if not exists (select 1 from sys.sql_logins where name = 'BmiBiDwFeedDev')
	create login [BmiBiDwFeedDev] with password = 'BvcGfdTre%43' ;
else
	alter login [BmiBiDwFeedDev] with password = 'BvcGfdTre%43' ;
go
if not exists (select 1 from sys.database_principals where name = 'BmiBiDwFeedDev')
	create user [BmiBiDwFeedDev] for login [BmiBiDwFeedDev] with default_schema = [dbo];
go

--!
--!
--!
if not exists (select 1 from sys.sql_logins where name = 'BmiBiMartFeedDev')
	create login [BmiBiMartFeedDev] with password = 'MnbJhgUyt&65' ;
else
	alter login [BmiBiMartFeedDev] with password = 'MnbJhgUyt&65' ;
go
if not exists (select 1 from sys.database_principals where name = 'BmiBiMartFeedDev')
	create user [BmiBiMartFeedDev] for login [BmiBiMartFeedDev] with default_schema = [dbo];
go

--!
--!
--!
if not exists (select 1 from sys.sql_logins where name = 'PowerBiReaderDev')
	create login [PowerBiReaderDev] with password = 'p0w3r8!R3aDer' ;
else
	alter login [PowerBiReaderDev] with password = 'p0w3r8!R3aDer' ;
go
if not exists (select 1 from sys.database_principals where name = 'PowerBiReaderDev')
	create user [PowerBiReaderDev] for login [PowerBiReaderDev] with default_schema = [dbo];
go

--!
--!
--!
if not exists (select 1 from sys.sql_logins where name = 'ReleaseManager')
	create login [ReleaseManager] with password = 'De1tyL!keP0wer5' ;
else
	alter login [ReleaseManager] with password = 'De1tyL!keP0wer5' ;
go
if not exists (select 1 from sys.database_principals where name = 'ReleaseManager')
	create user [ReleaseManager] for login [ReleaseManager] with default_schema = [dbo];
go



if exists(select * from sys.database_principals where name = 'greg.lucas.sql')
  drop user [greg.lucas.sql] ;
go
if exists(select * from sys.sql_logins where name = 'greg.lucas.sql')
  drop login [greg.lucas.sql] ;
go
if exists(select * from sys.database_principals where name = 'razia.nazir.sql')
  drop user [razia.nazir.sql] ;
go
if exists(select * from sys.sql_logins where name = 'razia.nazir.sql')
  drop login [razia.nazir.sql] ;
go
if exists(select * from sys.database_principals where name = 'vince.mitchell.sql')
  drop user [vince.mitchell.sql] ;
go
if exists(select * from sys.sql_logins where name = 'vince.mitchell.sql')
  drop login [vince.mitchell.sql] ;
go
if exists(select * from sys.database_principals where name = 'jason.bogart.sql')
  drop user [jason.bogart.sql] ;
go
if exists(select * from sys.sql_logins where name = 'jason.bogart.sql')
  drop login [jason.bogart.sql] ;
go
if exists(select * from sys.database_principals where name = 'tom.manville.sql')
  drop user [tom.manville.sql] ;
go
if exists(select * from sys.sql_logins where name = 'tom.manville.sql')
  drop login [tom.manville.sql] ;
go
if exists(select * from sys.database_principals where name = 'mark.bolton.sql')
  drop user [mark.bolton.sql] ;
go
if exists(select * from sys.sql_logins where name = 'mark.bolton.sql')
  drop login [mark.bolton.sql] ;
go

/*
--!
--!
--!
if not exists (select 1 from sys.sql_logins where name = 'greg.lucas.sql')
	create login [greg.lucas.sql] with password = 'Mko0Nhy6Vfgy!' ;
else
	alter login [greg.lucas.sql] with password = 'Mko0Nhy6Vfgy!' ;
go
if not exists (select 1 from sys.database_principals where name = 'greg.lucas.sql')
	create user [greg.lucas.sql] for login [greg.lucas.sql] with default_schema = [dbo];
go

--!
--!
--!
if not exists (select 1 from sys.sql_logins where name = 'razia.nazir.sql')
	create login [razia.nazir.sql] with password = 'VfBg%t6yBnDf' ;
else
	alter login [razia.nazir.sql] with password = 'VfBg%t6yBnDf' ;
go
if not exists (select 1 from sys.database_principals where name = 'razia.nazir.sql')
	create user [razia.nazir.sql] for login [razia.nazir.sql] with default_schema = [dbo];
go

--!
--!
--!
if not exists (select 1 from sys.sql_logins where name = 'vince.mitchell.sql')
	create login [vince.mitchell.sql] with password = 'IjnTyu7*9Vfg' ;
else
	alter login [vince.mitchell.sql] with password = 'IjnTyu7*9Vfg' ;
go
if not exists (select 1 from sys.database_principals where name = 'vince.mitchell.sql')
	create user [vince.mitchell.sql] for login [vince.mitchell.sql] with default_schema = [dbo];
go

--!
--!
--!
if not exists (select 1 from sys.sql_logins where name = 'jason.bogart.sql')
	create login [jason.bogart.sql] with password = 'Bhu@bhfX78hi' ;
else
	alter login [jason.bogart.sql] with password = 'Bhu@bhfX78hi' ;
go
if not exists (select 1 from sys.database_principals where name = 'jason.bogart.sql')
	create user [jason.bogart.sql] for login [jason.bogart.sql] with default_schema = [dbo];
go

--!
--!
--!
if not exists (select 1 from sys.sql_logins where name = 'tom.manville.sql')
	create login [tom.manville.sql] with password = 'MnbKjhOiu)98' ;
else
	alter login [tom.manville.sql] with password = 'MnbKjhOiu)98' ;
go
if not exists (select 1 from sys.database_principals where name = 'tom.manville.sql')
	create user [tom.manville.sql] for login [tom.manville.sql] with default_schema = [dbo];
go

--!
--!
--!
if not exists (select 1 from sys.sql_logins where name = 'mark.bolton.sql')
	create login [mark.bolton.sql] with password = 'VbnFghYtr65$' ;
else
	alter login [mark.bolton.sql] with password = 'VbnFghYtr65$' ;
go
if not exists (select 1 from sys.database_principals where name = 'mark.bolton.sql')
	create user [mark.bolton.sql] for login [mark.bolton.sql] with default_schema = [dbo];
go
*/
