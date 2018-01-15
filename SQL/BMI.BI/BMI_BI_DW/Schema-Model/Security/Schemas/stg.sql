CREATE SCHEMA [stg]
AUTHORIZATION [dbo]
GO
GRANT SELECT ON SCHEMA:: [stg] TO [AppDevelopersPROD]
GO
GRANT SELECT ON SCHEMA:: [stg] TO [BatchManagers]
GO
GRANT SELECT ON SCHEMA:: [stg] TO [BusinessAnalystsPROD]
GO
GRANT SELECT ON SCHEMA:: [stg] TO [DataFeedReaders]
GO
GRANT SELECT ON SCHEMA:: [stg] TO [DataFeedWriters]
GO
GRANT ALTER ON SCHEMA:: [stg] TO [DataFeedWriters]
GO
GRANT EXECUTE ON SCHEMA:: [stg] TO [DataFeedWriters]
GO
GRANT INSERT ON SCHEMA:: [stg] TO [DataFeedWriters]
GO
GRANT UPDATE ON SCHEMA:: [stg] TO [DataFeedWriters]
GO
GRANT SELECT ON SCHEMA:: [stg] TO [EtlDevelopersDEV]
GO
GRANT ALTER ON SCHEMA:: [stg] TO [EtlDevelopersDEV]
GO
GRANT EXECUTE ON SCHEMA:: [stg] TO [EtlDevelopersDEV]
GO
GRANT INSERT ON SCHEMA:: [stg] TO [EtlDevelopersDEV]
GO
GRANT UPDATE ON SCHEMA:: [stg] TO [EtlDevelopersDEV]
GO
GRANT DELETE ON SCHEMA:: [stg] TO [EtlDevelopersDEV]
GO
GRANT SELECT ON SCHEMA:: [stg] TO [EtlDevelopersPROD]
GO
GRANT SELECT ON SCHEMA:: [stg] TO [EtlDevelopersTEST]
GO
GRANT INSERT ON SCHEMA:: [stg] TO [EtlDevelopersTEST]
GO
GRANT UPDATE ON SCHEMA:: [stg] TO [EtlDevelopersTEST]
GO
GRANT DELETE ON SCHEMA:: [stg] TO [EtlDevelopersTEST]
GO
