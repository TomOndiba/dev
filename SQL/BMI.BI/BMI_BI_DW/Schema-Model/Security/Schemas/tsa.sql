CREATE SCHEMA [tsa]
AUTHORIZATION [dbo]
GO
GRANT SELECT ON SCHEMA:: [tsa] TO [AppDevelopersPROD]
GO
GRANT SELECT ON SCHEMA:: [tsa] TO [BatchManagers]
GO
GRANT SELECT ON SCHEMA:: [tsa] TO [BusinessAnalystsPROD]
GO
GRANT SELECT ON SCHEMA:: [tsa] TO [DataFeedReaders]
GO
GRANT EXECUTE ON SCHEMA:: [tsa] TO [DataFeedReaders]
GO
GRANT ALTER ON SCHEMA:: [tsa] TO [DataFeedWriters]
GO
GRANT SELECT ON SCHEMA:: [tsa] TO [DataFeedWriters]
GO
GRANT INSERT ON SCHEMA:: [tsa] TO [DataFeedWriters]
GO
GRANT UPDATE ON SCHEMA:: [tsa] TO [DataFeedWriters]
GO
GRANT EXECUTE ON SCHEMA:: [tsa] TO [DataFeedWriters]
GO
GRANT ALTER ON SCHEMA:: [tsa] TO [EtlDevelopersDEV]
GO
GRANT SELECT ON SCHEMA:: [tsa] TO [EtlDevelopersDEV]
GO
GRANT INSERT ON SCHEMA:: [tsa] TO [EtlDevelopersDEV]
GO
GRANT DELETE ON SCHEMA:: [tsa] TO [EtlDevelopersDEV]
GO
GRANT UPDATE ON SCHEMA:: [tsa] TO [EtlDevelopersDEV]
GO
GRANT EXECUTE ON SCHEMA:: [tsa] TO [EtlDevelopersDEV]
GO
GRANT SELECT ON SCHEMA:: [tsa] TO [EtlDevelopersPROD]
GO
GRANT SELECT ON SCHEMA:: [tsa] TO [EtlDevelopersTEST]
GO
GRANT INSERT ON SCHEMA:: [tsa] TO [EtlDevelopersTEST]
GO
GRANT DELETE ON SCHEMA:: [tsa] TO [EtlDevelopersTEST]
GO
GRANT UPDATE ON SCHEMA:: [tsa] TO [EtlDevelopersTEST]
GO
