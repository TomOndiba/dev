-- <Migration ID="d8bff350-d9de-4fb0-9e49-800c100e7902" />
GO

PRINT N'Creating role BatchManagers'
GO
CREATE ROLE [BatchManagers]
AUTHORIZATION [dbo]
GO
PRINT N'Creating role BusinessAnalystsDEV'
GO
CREATE ROLE [BusinessAnalystsDEV]
AUTHORIZATION [dbo]
GO
PRINT N'Creating role BusinessAnalystsPROD'
GO
CREATE ROLE [BusinessAnalystsPROD]
AUTHORIZATION [dbo]
GO
PRINT N'Creating role BusinessAnalystsTEST'
GO
CREATE ROLE [BusinessAnalystsTEST]
AUTHORIZATION [dbo]
GO
PRINT N'Creating role CodeReviewers'
GO
CREATE ROLE [CodeReviewers]
AUTHORIZATION [dbo]
GO
PRINT N'Creating role DeploymentManagers'
GO
CREATE ROLE [DeploymentManagers]
AUTHORIZATION [dbo]
GO
PRINT N'Creating role EtlDevelopersDEV'
GO
CREATE ROLE [EtlDevelopersDEV]
AUTHORIZATION [dbo]
GO
PRINT N'Creating role EtlDevelopersPROD'
GO
CREATE ROLE [EtlDevelopersPROD]
AUTHORIZATION [dbo]
GO
PRINT N'Creating role EtlDevelopersTEST'
GO
CREATE ROLE [EtlDevelopersTEST]
AUTHORIZATION [dbo]
GO
PRINT N'Creating role IcsDataFeeders'
GO
CREATE ROLE [IcsDataFeeders]
AUTHORIZATION [dbo]
GO
PRINT N'Creating role SqlDevelopersDEV'
GO
CREATE ROLE [SqlDevelopersDEV]
AUTHORIZATION [dbo]
GO
PRINT N'Creating role SqlDevelopersPROD'
GO
CREATE ROLE [SqlDevelopersPROD]
AUTHORIZATION [dbo]
GO
PRINT N'Creating role SqlDevelopersTEST'
GO
CREATE ROLE [SqlDevelopersTEST]
AUTHORIZATION [dbo]
GO
PRINT N'Altering members of role CodeReviewers'
GO
EXEC sp_addrolemember N'CodeReviewers', N'EtlDevelopersDEV'
GO
PRINT N'Altering members of role db_datareader'
GO
EXEC sp_addrolemember N'db_datareader', N'BusinessAnalystsDEV'
GO
EXEC sp_addrolemember N'db_datareader', N'BusinessAnalystsTEST'
GO
EXEC sp_addrolemember N'db_datareader', N'DeploymentManagers'
GO
EXEC sp_addrolemember N'db_datareader', N'EtlDevelopersDEV'
GO
EXEC sp_addrolemember N'db_datareader', N'EtlDevelopersTEST'
GO
EXEC sp_addrolemember N'db_datareader', N'SqlDevelopersDEV'
GO
EXEC sp_addrolemember N'db_datareader', N'SqlDevelopersPROD'
GO
EXEC sp_addrolemember N'db_datareader', N'SqlDevelopersTEST'
GO
PRINT N'Altering members of role db_datawriter'
GO
EXEC sp_addrolemember N'db_datawriter', N'DeploymentManagers'
GO
EXEC sp_addrolemember N'db_datawriter', N'SqlDevelopersDEV'
GO
EXEC sp_addrolemember N'db_datawriter', N'SqlDevelopersTEST'
GO
PRINT N'Altering members of role db_ddladmin'
GO
EXEC sp_addrolemember N'db_ddladmin', N'SqlDevelopersTEST'
GO
PRINT N'Altering members of role db_owner'
GO
EXEC sp_addrolemember N'db_owner', N'DeploymentManagers'
GO
EXEC sp_addrolemember N'db_owner', N'SqlDevelopersDEV'
GO
PRINT N'Altering permissions on  [dbo].[StubResultSet]'
GO
GRANT SELECT ON  [dbo].[StubResultSet] TO [EtlDevelopersDEV]
GO
GRANT UPDATE ON  [dbo].[StubResultSet] TO [EtlDevelopersDEV]
GO
PRINT N'Altering permissions on SCHEMA:: [INFORMATION_SCHEMA]'
GO
GRANT SELECT ON SCHEMA:: [INFORMATION_SCHEMA] TO [IcsDataFeeders]
GO
PRINT N'Altering permissions on SCHEMA:: [dbo]'
GO
GRANT SELECT ON SCHEMA:: [dbo] TO [IcsDataFeeders]
GO
PRINT N'Altering permissions on SCHEMA:: [log4Private]'
GO
GRANT SELECT ON SCHEMA:: [log4Private] TO [BatchManagers]
GO
GRANT VIEW DEFINITION TO [BusinessAnalystsDEV]
GRANT VIEW DEFINITION TO [BusinessAnalystsPROD]
GRANT VIEW DEFINITION TO [BusinessAnalystsTEST]
GRANT VIEW DEFINITION TO [CodeReviewers]
GRANT SHOWPLAN TO [EtlDevelopersDEV]
GRANT VIEW DEFINITION TO [EtlDevelopersDEV]
GRANT VIEW DEFINITION TO [EtlDevelopersPROD]
GRANT SHOWPLAN TO [EtlDevelopersTEST]
GRANT EXECUTE TO [SqlDevelopersDEV]
GRANT SHOWPLAN TO [SqlDevelopersPROD]
GRANT VIEW DEFINITION TO [SqlDevelopersPROD]
GRANT EXECUTE TO [SqlDevelopersTEST]
GRANT SHOWPLAN TO [SqlDevelopersTEST]
