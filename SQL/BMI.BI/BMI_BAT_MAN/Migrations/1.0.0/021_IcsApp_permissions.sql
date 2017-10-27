-- <Migration ID="2fb67b98-5ecd-4c30-8827-b9c8f3264b1d" />
GO

PRINT N'Altering permissions on SCHEMA:: [IcsApp]'
GO
GRANT EXECUTE ON SCHEMA:: [IcsApp] TO [EtlDevelopersDEV]
GO
GRANT SELECT ON SCHEMA:: [IcsApp] TO [IcsDataFeeders]
GO
GRANT EXECUTE ON SCHEMA:: [IcsApp] TO [IcsDataFeeders]
GO
PRINT N'Altering permissions on SCHEMA:: [ics]'
GO
GRANT SELECT ON SCHEMA:: [ics] TO [BatchManagers]
GO
GRANT SELECT ON SCHEMA:: [ics] TO [EtlDevelopersDEV]
GO
GRANT SELECT ON SCHEMA:: [ics] TO [EtlDevelopersPROD]
GO
