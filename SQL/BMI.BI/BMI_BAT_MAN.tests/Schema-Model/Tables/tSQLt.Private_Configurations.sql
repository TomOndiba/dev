CREATE TABLE [tSQLt].[Private_Configurations]
(
[Name] [nvarchar] (100) NOT NULL,
[Value] [sql_variant] NULL
)
GO
ALTER TABLE [tSQLt].[Private_Configurations] ADD CONSTRAINT [PK_Private_Configurations] PRIMARY KEY CLUSTERED  ([Name])
GO
