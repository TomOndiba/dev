CREATE SCHEMA [qvstg]
AUTHORIZATION [dbo]
GO
GRANT SELECT ON SCHEMA:: [qvstg] TO [AppDevelopersPROD]
GO
GRANT SELECT ON SCHEMA:: [qvstg] TO [BatchManagers]
GO
GRANT SELECT ON SCHEMA:: [qvstg] TO [BusinessAnalystsPROD]
GO
GRANT SELECT ON SCHEMA:: [qvstg] TO [DataFeedReaders]
GO
GRANT EXECUTE ON SCHEMA:: [qvstg] TO [DataFeedReaders]
GO
GRANT ALTER ON SCHEMA:: [qvstg] TO [DataFeeds]
GO
GRANT SELECT ON SCHEMA:: [qvstg] TO [DataFeeds]
GO
GRANT INSERT ON SCHEMA:: [qvstg] TO [DataFeeds]
GO
GRANT UPDATE ON SCHEMA:: [qvstg] TO [DataFeeds]
GO
GRANT EXECUTE ON SCHEMA:: [qvstg] TO [DataFeeds]
GO
GRANT ALTER ON SCHEMA:: [qvstg] TO [DataFeedWriters]
GO
GRANT SELECT ON SCHEMA:: [qvstg] TO [DataFeedWriters]
GO
GRANT INSERT ON SCHEMA:: [qvstg] TO [DataFeedWriters]
GO
GRANT UPDATE ON SCHEMA:: [qvstg] TO [DataFeedWriters]
GO
GRANT EXECUTE ON SCHEMA:: [qvstg] TO [DataFeedWriters]
GO
GRANT ALTER ON SCHEMA:: [qvstg] TO [EtlDevelopersDEV]
GO
GRANT SELECT ON SCHEMA:: [qvstg] TO [EtlDevelopersDEV]
GO
GRANT INSERT ON SCHEMA:: [qvstg] TO [EtlDevelopersDEV]
GO
GRANT DELETE ON SCHEMA:: [qvstg] TO [EtlDevelopersDEV]
GO
GRANT UPDATE ON SCHEMA:: [qvstg] TO [EtlDevelopersDEV]
GO
GRANT EXECUTE ON SCHEMA:: [qvstg] TO [EtlDevelopersDEV]
GO
GRANT SELECT ON SCHEMA:: [qvstg] TO [EtlDevelopersPROD]
GO
GRANT SELECT ON SCHEMA:: [qvstg] TO [EtlDevelopersTEST]
GO
GRANT INSERT ON SCHEMA:: [qvstg] TO [EtlDevelopersTEST]
GO
GRANT DELETE ON SCHEMA:: [qvstg] TO [EtlDevelopersTEST]
GO
GRANT UPDATE ON SCHEMA:: [qvstg] TO [EtlDevelopersTEST]
GO
