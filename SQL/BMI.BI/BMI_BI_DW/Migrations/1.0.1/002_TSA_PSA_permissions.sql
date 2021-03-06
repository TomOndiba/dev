﻿-- <Migration ID="73484baa-33ea-4b1d-ae6a-c45137f3aa4a" />
GO

PRINT N'Altering permissions on SCHEMA:: [psa]'
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
PRINT N'Altering permissions on SCHEMA:: [tsa]'
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
GRANT SHOWPLAN TO [AppDevelopersDEV]
GRANT VIEW DEFINITION TO [AppDevelopersDEV]
GRANT SHOWPLAN TO [AppDevelopersPROD]
GRANT VIEW DEFINITION TO [AppDevelopersPROD]
GRANT SHOWPLAN TO [AppDevelopersTEST]
GRANT VIEW DEFINITION TO [AppDevelopersTEST]
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
