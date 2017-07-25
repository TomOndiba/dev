-- <Migration ID="04d35d57-5cc1-48b8-a110-f739ab501612" />
GO

PRINT N'Altering permissions on SCHEMA:: [pbi]'
GO
GRANT SELECT ON SCHEMA:: [pbi] TO [AppDevelopersPROD]
GO
GRANT SELECT ON SCHEMA:: [pbi] TO [BusinessAnalystsPROD]
GO
