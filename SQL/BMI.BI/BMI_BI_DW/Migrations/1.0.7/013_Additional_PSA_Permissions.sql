-- <Migration ID="85acddec-171e-42f4-b6df-86867f3316ce" />
GO

PRINT N'Altering permissions on SCHEMA:: [IcsApp]'
GO
GRANT EXECUTE ON SCHEMA:: [IcsApp] TO [DataFeedWriters]
GO
PRINT N'Altering permissions on SCHEMA:: [discovery]'
GO
GRANT SELECT ON SCHEMA:: [discovery] TO [BusinessAnalystsPROD]
GO
GRANT SELECT ON SCHEMA:: [discovery] TO [PowerBiReporters]
GO
PRINT N'Altering permissions on SCHEMA:: [psa]'
GO
GRANT INSERT ON SCHEMA:: [psa] TO [DataFeedWriters]
GO
GRANT UPDATE ON SCHEMA:: [psa] TO [DataFeedWriters]
GO
PRINT N'Altering permissions on SCHEMA:: [tsa]'
GO
REVOKE SELECT ON SCHEMA:: [tsa] TO [BusinessAnalystsPROD]
GO
GRANT CREATE TABLE TO [EtlDevelopersDEV]
