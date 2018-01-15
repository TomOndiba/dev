-- <Migration ID="84f46379-49a6-4250-b7e9-b376874c32d0" />
GO

PRINT N'Altering permissions on SCHEMA:: [etl]'
GO
GRANT SELECT ON SCHEMA:: [etl] TO [DataFeedReaders]
GO
PRINT N'Altering permissions on SCHEMA:: [psa]'
GO
REVOKE EXECUTE ON SCHEMA:: [psa] TO [DataFeedReaders]
GO
PRINT N'Altering permissions on SCHEMA:: [stg]'
GO
REVOKE EXECUTE ON SCHEMA:: [stg] TO [DataFeedReaders]
GO
PRINT N'Altering permissions on SCHEMA:: [tsa]'
GO
REVOKE EXECUTE ON SCHEMA:: [tsa] TO [DataFeedReaders]
GO
