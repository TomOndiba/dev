-- <Migration ID="77bff175-ef28-4281-8da7-34ab82b7bac5" />
GO

PRINT N'Creating schemas'
GO
CREATE SCHEMA [idq]
AUTHORIZATION [dbo]
GO
PRINT N'Altering permissions on SCHEMA:: [idq]'
GO
GRANT SELECT ON SCHEMA:: [idq] TO [BusinessAnalystsPROD]
GO
GRANT ALTER ON SCHEMA:: [idq] TO [EtlDevelopersDEV]
GO
GRANT SELECT ON SCHEMA:: [idq] TO [EtlDevelopersDEV]
GO
GRANT INSERT ON SCHEMA:: [idq] TO [EtlDevelopersDEV]
GO
GRANT DELETE ON SCHEMA:: [idq] TO [EtlDevelopersDEV]
GO
GRANT UPDATE ON SCHEMA:: [idq] TO [EtlDevelopersDEV]
GO
GRANT SELECT ON SCHEMA:: [idq] TO [EtlDevelopersPROD]
GO
GRANT SELECT ON SCHEMA:: [idq] TO [EtlDevelopersTEST]
GO
GRANT INSERT ON SCHEMA:: [idq] TO [EtlDevelopersTEST]
GO
GRANT DELETE ON SCHEMA:: [idq] TO [EtlDevelopersTEST]
GO
GRANT UPDATE ON SCHEMA:: [idq] TO [EtlDevelopersTEST]
GO
