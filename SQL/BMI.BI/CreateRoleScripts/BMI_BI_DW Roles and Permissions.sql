--!
--! BMI_BI_DW Roles and Permissions.sql
--!

--!
--!
--!
if schema_id('log4') is not null grant execute on schema :: [log4] to [public];
if schema_id('log4Utils') is not null grant execute on schema :: [log4Utils] to [public];
go

--!
--! Create any required data feed/ETL roles so we can grant the required permissions
--!
if not exists (select * from sys.database_principals where type = 'R' and name = 'DataFeedReaders')
	exec(N'create role [DataFeedReaders] authorization [dbo];') ;
go

grant select on schema :: [INFORMATION_SCHEMA] to [DataFeedReaders];
grant select on schema :: [dbo] to [DataFeedReaders];
go
if schema_id('qvstg') is not null
	begin
		exec (N'grant select on schema :: [qvstg] to [DataFeedReaders];');
	end
go
if schema_id('stg') is not null
	begin
		exec (N'grant select on schema :: [stg] to [DataFeedReaders];');
	end
go
if schema_id('tsa') is not null
	begin
		exec (N'grant select on schema :: [tsa] to [DataFeedReaders];');
	end
go
if schema_id('psa') is not null
	begin
		exec (N'grant select on schema :: [psa] to [DataFeedReaders];');
	end
go
if schema_id('etl') is not null
	begin
		exec (N'grant select on schema :: [etl] to [DataFeedReaders];');
	end
GO
IF SCHEMA_ID('discovery') IS NOT NULL
	BEGIN
		EXEC (N'grant select on schema :: [discovery] to [DataFeedReaders];');
    END
    
if not exists (select * from sys.database_principals where type = 'R' and name = 'DataFeedWriters')
	exec(N'create role [DataFeedWriters] authorization [dbo];') ;
go

grant select on schema :: [INFORMATION_SCHEMA] to [DataFeedWriters];
grant select on schema :: [dbo] to [DataFeedWriters];
go
if schema_id('qvstg') is not null
	begin
		--! ALTER permission is required to allow TRUNCATE
		exec (N'grant alter on schema :: qvstg to [DataFeedWriters];');
		exec (N'grant execute, select, insert, update on schema :: [qvstg] to [DataFeedWriters];');
	end
go
if schema_id('stg') is not null
	begin
		--! ALTER permission is required to allow TRUNCATE
		exec (N'grant alter on schema :: stg to [DataFeedWriters];');
		exec (N'grant execute, select, insert, update on schema :: [stg] to [DataFeedWriters];');
	end
go
if schema_id('tsa') is not null
	begin
		--! ALTER permission is required to allow TRUNCATE
		exec (N'grant alter on schema :: tsa to [DataFeedWriters];');
		exec (N'grant execute, select, insert, update on schema :: [tsa] to [DataFeedWriters];');
	end
go
if schema_id('psa') is not null
	begin
		--! TRUNCATE not required on PSA tables
		exec (N'grant select, insert, update on schema :: [psa] to [DataFeedWriters];');
	end
go
if schema_id('etl') is not null
	exec (N'grant execute, select on schema :: [etl] to [DataFeedWriters];');
go
if schema_id('IcsApp') is not NULL
	BEGIN
	    exec (N'grant execute on schema :: [IcsApp] to [DataFeedWriters];');
			END

go



--!
--! Create a batch managers role to allow support users to change selected load-related metadata etc.
--!
if not exists (select * from sys.database_principals where type = 'R' and name = 'BatchManagers')
	exec(N'create role [BatchManagers] authorization [dbo];') ;
go

if schema_id('log4Private') is not null exec (N'grant select on schema :: [log4Private] to [BatchManagers];') ;
if schema_id('qvstg') is not null exec (N'grant select on schema :: [qvstg] to [BatchManagers];') ;
if schema_id('stg') is not null exec (N'grant select on schema :: [stg] to [BatchManagers];') ;
if schema_id('tsa') is not null exec (N'grant select on schema :: [tsa] to [BatchManagers];') ;
if schema_id('psa') is not null exec (N'grant select on schema :: [psa] to [BatchManagers];') ;
if schema_id('etl') is not null exec (N'grant select on schema :: [etl] to [BatchManagers];') ;
if objectpropertyex(object_id(N'utils.LoadDateDimension'), N'IsProcedure') is not null exec (N'grant exec on utils.LoadDateDimension to [BatchManagers];') ;
if objectpropertyex(object_id(N'qvstg.DataSource'), N'IsUserTable') is not null exec (N'grant select on qvstg.DataSource to [BatchManagers];') ;

--! The below is required to TRUNCATE the discovery.ProcurementSnapshotGR Table
IF OBJECTPROPERTYEX(OBJECT_ID(N'discovery.ProcurementSnapshotGR'), N'IsUserTable') IS NOT NULL 
	BEGIN
		EXEC (N'grant alter on discovery.ProcurementSnapshotGR to [DataFeedWriters];');
		EXEC (N'grant INSERT on discovery.ProcurementSnapshotGR to [DataFeedWriters];');
	end
GO


--!
--! Create role to support the Power BI Reporting service and other users of the PBI views.
--!
if not exists (select * from sys.database_principals where type = 'R' and name = 'PowerBiReporters')
	exec(N'create role [PowerBiReporters] authorization [dbo];') ;
go

if schema_id('pbi') is not null exec (N'grant select on schema :: [pbi] to [PowerBiReporters];') ;
go
if schema_id('discovery') is not null exec (N'grant select on schema :: [discovery] to [PowerBiReporters];');

--!
--! Create read-only role for App Support Team 
--!
if not exists (select * from sys.database_principals where type = 'R' and name = 'AppSupportReadOnly')
	exec(N'create role [AppSupportReadOnly] authorization [dbo];') ;
go
exec sp_addrolemember N'db_datareader', N'AppSupportReadOnly' ;
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

grant create table to [EtlDevelopersDEV];
go
grant view definition to [EtlDevelopersDEV];
go
grant showplan to [EtlDevelopersDEV]
go
exec sp_addrolemember N'db_datareader', N'EtlDevelopersDEV' ;
exec sp_addrolemember N'CodeReviewers', N'EtlDevelopersDEV' ;
go
if schema_id('qvstg') is not null exec (N'grant alter on schema :: qvstg to [EtlDevelopersDEV];');
if schema_id('qvstg') is not null exec (N'grant execute, select, insert, update, delete on schema :: [qvstg] to [EtlDevelopersDEV];');
if schema_id('stg') is not null exec (N'grant alter on schema :: stg to [EtlDevelopersDEV];');
if schema_id('stg') is not null exec (N'grant execute, select, insert, update, delete on schema :: [stg] to [EtlDevelopersDEV];');
if schema_id('tsa') is not null exec (N'grant alter on schema :: tsa to [EtlDevelopersDEV];');
if schema_id('tsa') is not null exec (N'grant execute, select, insert, update, delete on schema :: [tsa] to [EtlDevelopersDEV];');
if schema_id('psa') is not null exec (N'grant execute, select, insert, update, delete on schema :: [psa] to [EtlDevelopersDEV];');
if schema_id('etl') is not null exec (N'grant execute, select, insert, update, delete on schema :: [etl] to [EtlDevelopersDEV];');
if schema_id('idq') is not null exec (N'grant alter on schema :: idq to [EtlDevelopersDEV];');
if schema_id('idq') is not null exec (N'grant select, insert, update, delete on schema :: [idq] to [EtlDevelopersDEV];');
go

grant view definition to [EtlDevelopersDEV];
go
grant showplan to [EtlDevelopersTEST]
go
exec sp_addrolemember N'db_datareader', N'EtlDevelopersTEST' ;
go
if schema_id('etl') is not null exec (N'grant execute, select, update on schema :: [etl] to [EtlDevelopersTEST];');
if schema_id('qvstg') is not null exec (N'grant select, insert, update, delete on schema :: [qvstg] to [EtlDevelopersTEST];');
if schema_id('stg') is not null exec (N'grant select, insert, update, delete on schema :: [stg] to [EtlDevelopersTEST];');
if schema_id('tsa') is not null exec (N'grant select, insert, update, delete on schema :: [tsa] to [EtlDevelopersTEST];');
if schema_id('psa') is not null exec (N'grant select, insert, update, delete on schema :: [psa] to [EtlDevelopersTEST];');
if schema_id('idq') is not null exec (N'grant select, insert, update, delete on schema :: [idq] to [EtlDevelopersTEST];');
go

grant view definition to [EtlDevelopersPROD];
go
if schema_id('etl') is not null exec (N'grant select on schema :: [etl] to [EtlDevelopersPROD];');
if schema_id('qvstg') is not null exec (N'grant select on schema :: [qvstg] to [EtlDevelopersPROD];');
if schema_id('stg') is not null exec (N'grant select on schema :: [stg] to [EtlDevelopersPROD];');
if schema_id('tsa') is not null exec (N'grant select on schema :: [tsa] to [EtlDevelopersPROD];');
if schema_id('psa') is not null exec (N'grant select on schema :: [psa] to [EtlDevelopersPROD];');
if schema_id('idq') is not null exec (N'grant select on schema :: [idq] to [EtlDevelopersPROD];');
go

--!
--!
--!
if not exists (select * from sys.database_principals where type = 'R' and name = 'AppDevelopersDEV')
	exec(N'create role [AppDevelopersDEV] authorization [dbo];') ;
if not exists (select * from sys.database_principals where type = 'R' and name = 'AppDevelopersTEST')
	exec(N'create role [AppDevelopersTEST] authorization [dbo];') ;
if not exists (select * from sys.database_principals where type = 'R' and name = 'AppDevelopersPROD')
	exec(N'create role [AppDevelopersPROD] authorization [dbo];') ;
go

grant view definition to [AppDevelopersDEV];
go
grant showplan to [AppDevelopersDEV]
go
exec sp_addrolemember N'db_datawriter', N'AppDevelopersDEV' ;
exec sp_addrolemember N'db_datareader', N'AppDevelopersDEV' ;
go

grant view definition to [AppDevelopersTEST];
go
grant showplan to [AppDevelopersTEST]
go
exec sp_addrolemember N'db_datareader', N'AppDevelopersTEST' ;
go

grant view definition to [AppDevelopersPROD];
go
grant showplan to [AppDevelopersPROD]
go
if schema_id('qvstg') is not null exec (N'grant select on schema :: [qvstg] to [AppDevelopersPROD];');
if schema_id('stg') is not null exec (N'grant select on schema :: [stg] to [AppDevelopersPROD];');
if schema_id('tsa') is not null exec (N'grant select on schema :: [tsa] to [AppDevelopersPROD];');
if schema_id('psa') is not null exec (N'grant select on schema :: [psa] to [AppDevelopersPROD];');
if schema_id('etl') is not null exec (N'grant select on schema :: [etl] to [AppDevelopersPROD];');
if schema_id('pbi') is not null exec (N'grant select on schema :: [pbi] to [AppDevelopersPROD];');
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
grant references, select on schema :: [dbo] to [BusinessAnalystsPROD];
go
if schema_id('qvstg') is not null exec (N'grant select on schema :: [qvstg] to [BusinessAnalystsPROD];');
if schema_id('stg') is not null exec (N'grant select on schema :: [stg] to [BusinessAnalystsPROD];');
if schema_id('tsa') is not null exec (N'revoke select on schema :: [tsa] to [BusinessAnalystsPROD];');
if schema_id('psa') is not null exec (N'grant select on schema :: [psa] to [BusinessAnalystsPROD];');
if schema_id('etl') is not null exec (N'grant select on schema :: [etl] to [BusinessAnalystsPROD];');
if schema_id('pbi') is not null exec (N'grant select on schema :: [pbi] to [BusinessAnalystsPROD];');
if schema_id('idq') is not null exec (N'grant select on schema :: [idq] to [BusinessAnalystsPROD];');
if schema_id('discovery') is not null exec (N'grant select on schema :: [discovery] to [BusinessAnalystsPROD];');
go

