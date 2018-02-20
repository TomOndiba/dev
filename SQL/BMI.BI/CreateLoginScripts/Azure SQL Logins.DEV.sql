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

--!
--!
--!
if not exists (select 1 from sys.sql_logins where name = 'InfaDev')
	create login [InfaDev] with password = 'Pow£r$ent3r@' ;
else
	alter login [InfaDev] with password = 'Pow£r$ent3r@' ;
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
if not exists (select 1 from sys.sql_logins where name = 'SapBw4ExtractorDev')
	create login [SapBw4ExtractorDev] with password = 'CvbDfgErt%43' ;
else
	alter login [SapBw4ExtractorDev] with password = 'CvbDfgErt%43' ;
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



if exists(select * from sys.database_principals where name = 'razia.nazir.sql')
  drop user [razia.nazir.sql] ;
go
if exists(select * from sys.sql_logins where name = 'razia.nazir.sql')
  drop login [razia.nazir.sql] ;
go
if exists(select * from sys.database_principals where name = 'anthony.smart.sql')
  drop user [anthony.smart.sql] ;
go
if exists(select * from sys.sql_logins where name = 'anthony.smart.sql')
  drop login [anthony.smart.sql] ;
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
--if exists(select * from sys.database_principals where name = 'greg.lucas.sql')
--  drop user [greg.lucas.sql] ;
--go
--if exists(select * from sys.sql_logins where name = 'greg.lucas.sql')
--  drop login [greg.lucas.sql] ;
--go
--if exists(select * from sys.database_principals where name = 'gary.elliott.sql')
--  drop user [gary.elliott.sql] ;
--go
--if exists(select * from sys.sql_logins where name = 'gary.elliott.sql')
--  drop login [gary.elliott.sql] ;
--go
--if exists(select * from sys.database_principals where name = 'george.whitby.sql')
--  drop user [george.whitby.sql] ;
--go
--if exists(select * from sys.sql_logins where name = 'george.whitby.sql')
--  drop login [george.whitby.sql] ;
--go
--if exists(select * from sys.database_principals where name = 'david.bradely.sql')
--  drop user [david.bradely.sql] ;
--go
--if exists(select * from sys.sql_logins where name = 'david.bradely.sql')
--  drop login [david.bradely.sql] ;
--go

--!
--!
--!
if not exists (select 1 from sys.sql_logins where name = 'greg.lucas.dba')
	create login [greg.lucas.dba] with password = 'ZxcAsdQwe!23' ;
else
	alter login [greg.lucas.dba] with password = 'ZxcAsdQwe!23' ;
go
if not exists (select 1 from sys.database_principals where name = 'greg.lucas.dba')
	create user [greg.lucas.dba] for login [greg.lucas.dba] with default_schema = [dbo];
go

if not exists (select 1 from sys.sql_logins where name = 'gary.elliott.sql')
	create login [gary.elliott.sql] with password = 'VcxSdfRew@34' ;
else
	alter login [gary.elliott.sql] with password = 'VcxSdfRew@34' ;
go
if not exists (select 1 from sys.database_principals where name = 'gary.elliott.sql')
	create user [gary.elliott.sql] for login [gary.elliott.sql] with default_schema = [dbo];
go

if not exists (select 1 from sys.sql_logins where name = 'george.whitby.sql')
	create login [george.whitby.sql] with password = 'BvcDfgErt&89!' ;
else
	alter login [george.whitby.sql] with password = 'BvcDfgErt&89!' ;
go
if not exists (select 1 from sys.database_principals where name = 'george.whitby.sql')
	create user [george.whitby.sql] for login [george.whitby.sql] with default_schema = [dbo];
go

if not exists (select 1 from sys.sql_logins where name = 'david.bradely.sql')
	create login [david.bradely.sql] with password = 'nBVkJHyUI6&*' ;
else
	alter login [david.bradely.sql] with password = 'nBVkJHyUI6&*' ;
go
if not exists (select 1 from sys.database_principals where name = 'david.bradely.sql')
	create user [david.bradely.sql] for login [david.bradely.sql] with default_schema = [dbo];
go

--!
--!
--!
if not exists (select 1 from sys.sql_logins where name = 'andrew.couch.dba')
	create login [andrew.couch.dba] with password = 'VbnFghYtr65$' ;
else
	alter login [andrew.couch.dba] with password = 'VbnFghYtr65$' ;
go
if not exists (select 1 from sys.database_principals where name = 'andrew.couch.dba')
	create user [andrew.couch.dba] for login [andrew.couch.dba] with default_schema = [dbo];
go

/*
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
if not exists (select 1 from sys.sql_logins where name = 'anthony.smart.sql')
	create login [anthony.smart.sql] with password = 'IjnTyu7*9Vfg' ;
else
	alter login [anthony.smart.sql] with password = 'IjnTyu7*9Vfg' ;
go
if not exists (select 1 from sys.database_principals where name = 'anthony.smart.sql')
	create user [anthony.smart.sql] for login [anthony.smart.sql] with default_schema = [dbo];
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


