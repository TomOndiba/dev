--!
--! Azure SQL Logins.PROD.sql
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


--!
--! IMPORTANT NOTE:
--! When creating SQL Logins, we need to grant access to master so that
--! connection strings that do not specify a default database still work
--!

if not exists (select 1 from sys.sql_logins where name = 'InfaProd')
	begin
		create login [InfaProd] with password = 'Gy7&ji89fte$nbHC@fF';
	end
go
if not exists (select 1 from sys.database_principals where name = 'InfaProd')
	begin
		create user [InfaProd] for login [InfaProd] with default_schema = [dbo];
	end
go

if not exists (select 1 from sys.sql_logins where name = 'BmiBiDwFeedProd')
	begin
		create login [BmiBiDwFeedProd] with password = 'Bhy$ln@d8Bb3HLs!';
	end
go
if not exists (select 1 from sys.database_principals where name = 'BmiBiDwFeedProd')
	begin
		create user [BmiBiDwFeedProd] for login [BmiBiDwFeedProd] with default_schema = [dbo];
	end
go

if not exists (select 1 from sys.sql_logins where name = 'BmiBiMartFeedProd')
	begin
		create login [BmiBiMartFeedProd] with password = 'P0ft&gHq%dFfh!pe';
	end
go
if not exists (select 1 from sys.database_principals where name = 'BmiBiMartFeedProd')
	begin
		create user [BmiBiMartFeedProd] for login [BmiBiMartFeedProd] with default_schema = [dbo];
	end
go

if not exists (select 1 from sys.sql_logins where name = 'PowerBiReaderProd')
	begin
		create login [PowerBiReaderProd] with password = 'Huir45$&ghVzMX5D';
	end
go
if not exists (select 1 from sys.database_principals where name = 'PowerBiReaderProd')
	begin
		create user [PowerBiReaderProd] for login [PowerBiReaderProd] with default_schema = [dbo];
	end
go

--!
--!
--!
if not exists (select 1 from sys.sql_logins where name = 'SapBw4ExtractorProd')
	create login [SapBw4ExtractorProd] with password = 'MnbGhjUyt&89!tV' ;
else
	alter login [SapBw4ExtractorProd] with password = 'MnbGhjUyt&89!tV' ;
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
if not exists (select 1 from sys.sql_logins where name = 'greg.lucas.sql')
	create login [greg.lucas.sql] with password = 'Mko0Nhy6Vfgy!' ;
else
	alter login [greg.lucas.sql] with password = 'Mko0Nhy6Vfgy!' ;
go
if not exists (select 1 from sys.database_principals where name = 'greg.lucas.sql')
	create user [greg.lucas.sql] for login [greg.lucas.sql] with default_schema = [dbo];
go

if not exists (select 1 from sys.sql_logins where name = 'gary.elliott.sql')
	create login [gary.elliott.sql] with password = 'VcxSdfRew@34J8&f' ;
else
	alter login [gary.elliott.sql] with password = 'VcxSdfRew@34J8&f' ;
go
if not exists (select 1 from sys.database_principals where name = 'gary.elliott.sql')
	create user [gary.elliott.sql] for login [gary.elliott.sql] with default_schema = [dbo];
go

if not exists (select 1 from sys.sql_logins where name = 'george.whitby.sql')
	create login [george.whitby.sql] with password = 'BvcDfgErt&89!�ftY' ;
else
	alter login [george.whitby.sql] with password = 'BvcDfgErt&89!�ftY' ;
go
if not exists (select 1 from sys.database_principals where name = 'george.whitby.sql')
	create user [george.whitby.sql] for login [george.whitby.sql] with default_schema = [dbo];
go

if not exists (select 1 from sys.sql_logins where name = 'david.bradely.sql')
	create login [david.bradely.sql] with password = 'nBVkJHyUI6&*9$g' ;
else
	alter login [david.bradely.sql] with password = 'nBVkJHyUI6&*9$g' ;
go
if not exists (select 1 from sys.database_principals where name = 'david.bradely.sql')
	create user [david.bradely.sql] for login [david.bradely.sql] with default_schema = [dbo];
go


/*
--!
--!
--!
if not exists (select 1 from sys.sql_logins where name = 'razia.nazir.sql')
	create login [razia.nazir.sql] with password = 'VfBg%t6yBnDf-!234f' ;
else
	alter login [razia.nazir.sql] with password = 'VfBg%t6yBnDf-!234f' ;
go
if not exists (select 1 from sys.database_principals where name = 'razia.nazir.sql')
	create user [razia.nazir.sql] for login [razia.nazir.sql] with default_schema = [dbo];
go

--!
--!
--!
if not exists (select 1 from sys.sql_logins where name = 'vince.mitchell.sql')
	create login [vince.mitchell.sql] with password = 'IjnTyu7*9Vfg-!456d' ;
else
	alter login [vince.mitchell.sql] with password = 'IjnTyu7*9Vfg-!456d' ;
go
if not exists (select 1 from sys.database_principals where name = 'vince.mitchell.sql')
	create user [vince.mitchell.sql] for login [vince.mitchell.sql] with default_schema = [dbo];
go

--!
--!
--!
if not exists (select 1 from sys.sql_logins where name = 'jason.bogart.sql')
	create login [jason.bogart.sql] with password = 'Bhu@bhfX78hi-!246v' ;
else
	alter login [jason.bogart.sql] with password = 'Bhu@bhfX78hi-!246v' ;
go
if not exists (select 1 from sys.database_principals where name = 'jason.bogart.sql')
	create user [jason.bogart.sql] for login [jason.bogart.sql] with default_schema = [dbo];
go

--!
--!
--!
if not exists (select 1 from sys.sql_logins where name = 'tom.manville.sql')
	create login [tom.manville.sql] with password = 'MnbKjhOiu)98-!789k' ;
else
	alter login [tom.manville.sql] with password = 'MnbKjhOiu)98-!789k' ;
go
if not exists (select 1 from sys.database_principals where name = 'tom.manville.sql')
	create user [tom.manville.sql] for login [tom.manville.sql] with default_schema = [dbo];
go

--!
--!
--!
if not exists (select 1 from sys.sql_logins where name = 'mark.bolton.sql')
	create login [mark.bolton.sql] with password = 'VbnFghYtr65$-!451s' ;
else
	alter login [mark.bolton.sql] with password = 'VbnFghYtr65$-!451s' ;
go
if not exists (select 1 from sys.database_principals where name = 'mark.bolton.sql')
	create user [mark.bolton.sql] for login [mark.bolton.sql] with default_schema = [dbo];
go
*/
