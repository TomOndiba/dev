CREATE TABLE [dbo].[MD_TEXT] (
    [TEXT_ID]     [dbo].[D_INT]  NOT NULL,
    [LANGUAGE]    [dbo].[N_C4]   NOT NULL,
    [TEXT]        [dbo].[N_C100] NULL,
    [UPDATE_BY]   [dbo].[N_USER] NULL,
    [UPDATE_DATE] [dbo].[D_DATE] NULL,
    [CREATE_BY]   [dbo].[N_USER] NULL,
    [CREATE_DATE] [dbo].[D_DATE] NULL,
    CONSTRAINT [PK_MD_TEXT] PRIMARY KEY CLUSTERED ([TEXT_ID] ASC, [LANGUAGE] ASC)
);

