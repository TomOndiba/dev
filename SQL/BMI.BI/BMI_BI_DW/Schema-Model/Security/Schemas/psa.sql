CREATE SCHEMA [psa]
AUTHORIZATION [dbo]
GO
GRANT SELECT ON SCHEMA:: [psa] TO [AppDevelopersPROD]
GO
GRANT SELECT ON SCHEMA:: [psa] TO [BatchManagers]
GO
GRANT SELECT ON SCHEMA:: [psa] TO [BusinessAnalystsPROD]
GO
GRANT SELECT ON SCHEMA:: [psa] TO [DataFeedReaders]
GO
GRANT EXECUTE ON SCHEMA:: [psa] TO [DataFeedReaders]
GO
GRANT SELECT ON SCHEMA:: [psa] TO [DataFeedWriters]
GO
GRANT INSERT ON SCHEMA:: [psa] TO [DataFeedWriters]
GO
GRANT UPDATE ON SCHEMA:: [psa] TO [DataFeedWriters]
GO
GRANT SELECT ON SCHEMA:: [psa] TO [EtlDevelopersDEV]
GO
GRANT INSERT ON SCHEMA:: [psa] TO [EtlDevelopersDEV]
GO
GRANT DELETE ON SCHEMA:: [psa] TO [EtlDevelopersDEV]
GO
GRANT UPDATE ON SCHEMA:: [psa] TO [EtlDevelopersDEV]
GO
GRANT EXECUTE ON SCHEMA:: [psa] TO [EtlDevelopersDEV]
GO
GRANT SELECT ON SCHEMA:: [psa] TO [EtlDevelopersPROD]
GO
GRANT SELECT ON SCHEMA:: [psa] TO [EtlDevelopersTEST]
GO
GRANT INSERT ON SCHEMA:: [psa] TO [EtlDevelopersTEST]
GO
GRANT DELETE ON SCHEMA:: [psa] TO [EtlDevelopersTEST]
GO
GRANT UPDATE ON SCHEMA:: [psa] TO [EtlDevelopersTEST]
GO
