--!
--! BMI_BAT_MAN Roles and Permissions.sql
--!

--!
--!
--!
if schema_id('log4') is not null grant execute on schema :: [log4] to [public];
if schema_id('log4Utils') is not null grant execute on schema :: [log4Utils] to [public];
go

if not exists (select * from sys.database_principals where type = 'R' and name = 'IcsDataFeeders')
	exec(N'create role [IcsDataFeeders] authorization [dbo];') ;
go

grant select on schema :: [INFORMATION_SCHEMA] to [IcsDataFeeders];
grant select on schema :: [dbo] to [IcsDataFeeders];
go
if schema_id('IcsApp') is not null
	exec (N'grant execute, select on schema :: [IcsApp] to [IcsDataFeeders];');
go

if objectpropertyex(object_id(N'dbo.ProcessRunStart'), N'IsProcedure') is not null 
	grant execute on [dbo].[ProcessRunStart] to [IcsDataFeeders]
go

if objectpropertyex(object_id(N'dbo.ProcessRunEnd'), N'IsProcedure') is not null 
	grant execute on [dbo].[ProcessRunEnd] to [IcsDataFeeders]
go

if objectpropertyex(object_id(N'dbo.ThreadRunEnd'), N'IsProcedure') is not null 
	grant execute on [dbo].[ThreadRunEnd] to [IcsDataFeeders]
go

if objectpropertyex(object_id(N'dbo.ThreadRunStart'), N'IsProcedure') is not null 
	grant execute on [dbo].[ThreadRunStart] to [IcsDataFeeders]
go

if objectpropertyex(object_id(N'dbo.SubProcessRunEnd'), N'IsProcedure') is not null 
	grant execute on [dbo].[SubProcessRunEnd] to [IcsDataFeeders]
go

if objectpropertyex(object_id(N'dbo.SubProcessRunStart'), N'IsProcedure') is not null 
	grant execute on [dbo].[SubProcessRunStart] to [IcsDataFeeders]
go

if objectpropertyex(object_id(N'dbo.SubProcessCheckThreads'), N'IsProcedure') is not null 
	grant execute on [dbo].[SubProcessCheckThreads] to [IcsDataFeeders]
go

--!
--! Create a batch managers role to allow support users to change selected load-related metadata etc.
--!
if not exists (select * from sys.database_principals where type = 'R' and name = 'BatchManagers')
	exec(N'create role [BatchManagers] authorization [dbo];') ;
go

if schema_id('log4Private') is not null exec (N'grant select on schema :: [log4Private] to [BatchManagers];') ;
if schema_id('privy') is not null exec (N'grant select on schema :: [privy] to [BatchManagers];') ;
if schema_id('ics') is not null exec (N'grant select on schema :: [ics] to [BatchManagers];') ;
go


--!
--! Create a role to allow read-only access to the actual code
--!
if not exists (select * from sys.database_principals where type = 'R' and name = 'CodeReviewers')
	exec(N'create role [CodeReviewers] authorization [dbo];') ;
go
grant view definition to [CodeReviewers];
go

--!
--! Create the super-user role used for deployment in all environments
--!
if not exists (select * from sys.database_principals where type = 'R' and name = 'DeploymentManagers')
	exec(N'create role [DeploymentManagers] authorization [dbo];') ;
go
exec sp_addrolemember N'db_datareader', N'DeploymentManagers' ;
exec sp_addrolemember N'db_datawriter', N'DeploymentManagers' ;
exec sp_addrolemember N'db_owner', N'DeploymentManagers' ;
go

--!
--! Create any remaining environment-specific roles
--!
if not exists (select * from sys.database_principals where type = 'R' and name = 'SqlDevelopersDEV')
	exec(N'create role [SqlDevelopersDEV] authorization [dbo];') ;
if not exists (select * from sys.database_principals where type = 'R' and name = 'SqlDevelopersTEST')
	exec(N'create role [SqlDevelopersTEST] authorization [dbo];') ;
if not exists (select * from sys.database_principals where type = 'R' and name = 'SqlDevelopersPROD')
	exec(N'create role [SqlDevelopersPROD] authorization [dbo];') ;
go

grant execute to [SqlDevelopersDEV];
go
exec sp_addrolemember N'db_datareader', N'SqlDevelopersDEV' ;
exec sp_addrolemember N'db_datawriter', N'SqlDevelopersDEV' ;
exec sp_addrolemember N'db_owner', N'SqlDevelopersDEV' ;
go

grant showplan to [SqlDevelopersTEST]
go
grant execute to [SqlDevelopersTEST];
go
exec sp_addrolemember N'db_datareader', N'SqlDevelopersTEST' ;
exec sp_addrolemember N'db_datawriter', N'SqlDevelopersTEST' ;
exec sp_addrolemember N'db_ddladmin', N'SqlDevelopersTEST' ;
go

grant view definition to [SqlDevelopersPROD];
go
grant showplan to [SqlDevelopersPROD]
go
exec sp_addrolemember N'db_datareader', N'SqlDevelopersPROD' ;
go


--!
--!
--!
if not exists (select * from sys.database_principals where type = 'R' and name = 'EtlDevelopersDEV')
	exec(N'create role [EtlDevelopersDEV] authorization [dbo];') ;
if not exists (select * from sys.database_principals where type = 'R' and name = 'EtlDevelopersTEST')
	exec(N'create role [EtlDevelopersTEST] authorization [dbo];') ;
if not exists (select * from sys.database_principals where type = 'R' and name = 'EtlDevelopersPROD')
	exec(N'create role [EtlDevelopersPROD] authorization [dbo];') ;
go

grant view definition to [EtlDevelopersDEV];
go
grant showplan to [EtlDevelopersDEV]
go
exec sp_addrolemember N'db_datareader', N'EtlDevelopersDEV' ;
exec sp_addrolemember N'CodeReviewers', N'EtlDevelopersDEV' ;
go

if schema_id('ics') is not null exec (N'grant select on schema :: [ics] to [EtlDevelopersDEV];') ;
if schema_id('IcsApp') is not null exec (N'grant execute on schema :: [IcsApp] to [EtlDevelopersDEV];') ;
go

if objectpropertyex(object_id(N'dbo.StubResultSet'), N'IsUserTable') is not null
	exec (N'grant select,update on dbo.StubResultSet to [EtlDevelopersDEV];') ;
go

if objectpropertyex(object_id(N'dbo.ProcessRunStart'), N'IsProcedure') is not null 
	grant execute on [dbo].[ProcessRunStart] to EtlDevelopersDEV ;
go

if objectpropertyex(object_id(N'dbo.ProcessRunEnd'), N'IsProcedure') is not null 
	grant execute on [dbo].[ProcessRunEnd] to EtlDevelopersDEV ;
go

if objectpropertyex(object_id(N'dbo.ThreadRunEnd'), N'IsProcedure') is not null
	grant execute on [dbo].[ThreadRunEnd] to EtlDevelopersDEV ;
go

if objectpropertyex(object_id(N'dbo.ThreadRunStart'), N'IsProcedure') is not null 
	grant execute on [dbo].[ThreadRunStart] to EtlDevelopersDEV ;
go

if objectpropertyex(object_id(N'dbo.SubProcessRunEnd'), N'IsProcedure') is not null
	grant execute on [dbo].[SubProcessRunEnd] to EtlDevelopersDEV ;
go

if objectpropertyex(object_id(N'dbo.SubProcessRunStart'), N'IsProcedure') is not null 
	grant execute on [dbo].[SubProcessRunStart] to EtlDevelopersDEV ;
go

if objectpropertyex(object_id(N'dbo.SubProcessCheckThreads'), N'IsProcedure') is not null
	grant execute on [dbo].[SubProcessCheckThreads] to EtlDevelopersDEV ;
go

grant view definition to [EtlDevelopersDEV];
go
grant showplan to [EtlDevelopersTEST]
go
exec sp_addrolemember N'db_datareader', N'EtlDevelopersTEST' ;
go

grant view definition to [EtlDevelopersPROD];
go
if schema_id('privy') is not null exec (N'grant select on schema :: [privy] to [EtlDevelopersPROD];');
go
if schema_id('ics') is not null exec (N'grant select on schema :: [ics] to [EtlDevelopersPROD];') ;
go

--!
--!
--!
if not exists (select * from sys.database_principals where type = 'R' and name = 'BusinessAnalystsDEV')
	exec(N'create role [BusinessAnalystsDEV] authorization [dbo];') ;
if not exists (select * from sys.database_principals where type = 'R' and name = 'BusinessAnalystsTEST')
	exec(N'create role [BusinessAnalystsTEST] authorization [dbo];') ;
if not exists (select * from sys.database_principals where type = 'R' and name = 'BusinessAnalystsPROD')
	exec(N'create role [BusinessAnalystsPROD] authorization [dbo];') ;
go

grant view definition to [BusinessAnalystsDEV];
go
exec sp_addrolemember N'db_datareader', N'BusinessAnalystsDEV' ;
go

grant view definition to [BusinessAnalystsTEST];
go
exec sp_addrolemember N'db_datareader', N'BusinessAnalystsTEST' ;
go

grant view definition to [BusinessAnalystsPROD];
go
if schema_id('privy') is not null exec (N'grant select on schema :: [privy] to [BusinessAnalystsPROD];');

go

