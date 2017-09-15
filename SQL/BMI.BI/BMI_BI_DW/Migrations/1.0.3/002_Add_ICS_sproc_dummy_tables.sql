-- <Migration ID="dcede30d-193b-4e33-ac04-5e9910b778de" />
GO

PRINT N'Creating [tsa].[ics_sql_dummySource]'
GO
CREATE TABLE [tsa].[ics_sql_dummySource]
(
[SP_dummy] [int] NULL
)
GO
PRINT N'Creating [tsa].[ics_sql_runLog]'
GO
CREATE TABLE [tsa].[ics_sql_runLog]
(
[RETURN_VALUE] [int] NULL,
[EtlExecutedOn] [datetime] NULL,
[EtlExecutedBy] [nvarchar] (512) NULL
)
GO
