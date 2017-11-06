-- <Migration ID="128f12f9-3840-4871-a9e5-db43cd15709f" />
GO

PRINT N'Altering permissions on SCHEMA:: [IcsApp]'
GO
GRANT REFERENCES ON SCHEMA:: [IcsApp] TO [EtlDevelopersDEV]
GO
PRINT N'Altering permissions on SCHEMA:: [batch]'
GO
GRANT REFERENCES ON SCHEMA:: [batch] TO [IcsDataFeeders]
GO
PRINT N'Altering permissions on SCHEMA:: [ics]'
GO
GRANT REFERENCES ON SCHEMA:: [ics] TO [BatchManagers]
GO
GRANT REFERENCES ON SCHEMA:: [ics] TO [EtlDevelopersDEV]
GO
GRANT REFERENCES ON SCHEMA:: [ics] TO [EtlDevelopersPROD]
GO
GRANT REFERENCES ON SCHEMA:: [ics] TO [IcsDataFeeders]
GO
PRINT N'Altering permissions on SCHEMA:: [privy]'
GO
GRANT REFERENCES ON SCHEMA:: [privy] TO [BatchManagers]
GO
GRANT REFERENCES ON SCHEMA:: [privy] TO [EtlDevelopersDEV]
GO
GRANT REFERENCES ON SCHEMA:: [privy] TO [EtlDevelopersPROD]
GO
GRANT REFERENCES ON SCHEMA:: [privy] TO [IcsDataFeeders]
GO
GRANT REFERENCES ON SCHEMA:: [log4Private] TO [BatchManagers]
GO