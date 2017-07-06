CREATE TABLE [privy].[StagingLoadParameter] (
    [ModuleName]       VARCHAR (200) NOT NULL,
    [DataCaptureStart] DATETIME      NULL,
    [DataCaptureEnd]   DATETIME      NULL,
    CONSTRAINT [PK_StagingLoadParameter] PRIMARY KEY CLUSTERED ([ModuleName] ASC)
);



GO
GRANT UPDATE
    ON OBJECT::[privy].[StagingLoadParameter] TO [EtlDevelopers]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[privy].[StagingLoadParameter] TO [EtlDevelopers]
    AS [dbo];

