CREATE TABLE [dbo].[MD_PROJECT_ELEMENT] (
    [SYSTEM_ID]             [dbo].[D_INT]  NOT NULL,
    [PROJECT_ELEMENT]       [dbo].[N_C50]  NOT NULL,
    [LOCAL_PROJECT_ELEMENT] [dbo].[N_C50]  NULL,
    [PROJECT_ELEMENT_NAME]  [dbo].[N_C100] NULL,
    [CREATE_DATE]           [dbo].[D_DATE] NULL,
    [CREATE_BY]             [dbo].[N_USER] NULL,
    [UPDATE_DATE]           [dbo].[D_DATE] NULL,
    [UPDATE_BY]             [dbo].[N_USER] NULL,
    CONSTRAINT [PK_MD_PROJECT_ELELEMT] PRIMARY KEY CLUSTERED ([SYSTEM_ID] ASC, [PROJECT_ELEMENT] ASC)
);

