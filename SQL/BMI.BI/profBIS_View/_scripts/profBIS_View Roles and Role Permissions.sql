--!
--! profBIS_View Roles and Role Permissions.sql
--!
set noexec off;
go
:setvar DatabaseName "profBIS_View_DEV"
go

:on error exit
go

/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
go

if '$(__IsSqlCmdEnabled)' != 'True'
	begin
		declare	@i int = 0;

		while @i < 900
			begin
				set @i += 1;
				raiserror('SQLCMD mode must be enabled to successfully execute this script (%d of 300)', 10, 1, @i) with nowait;
				waitfor delay '00:00:01'
			end
		
		set noexec on;
	end
go

use [$(DatabaseName)];
go
--!
--!
--!
if schema_id('log4') is not null grant execute on schema :: [log4] to [public];
if schema_id('log4Utils') is not null grant execute on schema :: [log4Utils] to [public];
go

--!
--! Create any required data feed/ETL roles so we can grant the required permissions
--!
if not exists (select * from sys.database_principals where type = 'R' and name = 'EtlReaders')
	exec(N'create role [EtlReaders] authorization [dbo];') ;
go

--! ALTER permission is still required to allow TRUNCATE (even in SQL 2016/Azure - Doh!)
grant alter on stg.ProductCategoryHierarchy to [EtlReaders];
grant alter on stg.CustomerCategoryHierarchy to [EtlReaders];
go

if schema_id('etl') is not null
	exec (N'grant execute, select on schema :: [etl] to [EtlReaders];');
go


--!
--! Create any standard roles so we can grant the required permissions (in other environment-specific steps)
--!
if not exists (select * from sys.database_principals where type = 'R' and name = 'DeploymentManagers')
	exec(N'create role [DeploymentManagers] authorization [dbo];') ;
go

exec sp_addrolemember N'db_datareader', N'DeploymentManagers' ;
exec sp_addrolemember N'db_datawriter', N'DeploymentManagers' ;
exec sp_addrolemember N'db_owner', N'DeploymentManagers' ;
go

--!
--!
--!
if not exists (select * from sys.database_principals where type = 'R' and name = 'SqlDevelopers')
	exec(N'create role [SqlDevelopers] authorization [dbo];') ;
go

exec sp_addrolemember N'db_datareader', N'SqlDevelopers' ;
exec sp_addrolemember N'db_datawriter', N'SqlDevelopers' ;
go

grant execute to [SqlDevelopers];
go
grant showplan to [SqlDevelopers]
go

--!
--!
--!
if not exists (select * from sys.database_principals where type = 'R' and name = 'EtlDevelopers')
	exec(N'create role [EtlDevelopers] authorization [dbo];') ;
go

grant view definition to [EtlDevelopers];
go
grant showplan to [EtlDevelopers]
go

if schema_id('log4') is not null exec (N'grant execute, select on schema :: [log4] to [EtlDevelopers];');
if schema_id('etl') is not null exec (N'grant execute, select on schema :: [etl] to [EtlDevelopers];');
if schema_id('stg') is not null exec (N'grant select on schema :: [stg] to [EtlDevelopers];');
go

if objectpropertyex(object_id(N'privy.StagingLoadParameter'), N'IsUserTable') is not null
	exec (N'grant select, update on privy.StagingLoadParameter to [EtlDevelopers];') ;
go