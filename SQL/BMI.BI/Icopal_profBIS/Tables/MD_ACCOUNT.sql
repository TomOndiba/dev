CREATE TABLE [dbo].[MD_ACCOUNT] (
    [SYSTEM_ID]        [dbo].[D_INT]  NOT NULL,
    [ACCOUNT_NO]       [dbo].[N_C50]  NOT NULL,
    [LOCAL_ACCOUNT_NO] [dbo].[N_C50]  NULL,
    [ACCOUNT_NAME]     [dbo].[N_C100] NULL,
    [ACCOUNT_TYPE_ID]  [dbo].[D_INT]  NULL,
    [CREATE_DATE]      [dbo].[D_DATE] NULL,
    [CREATE_BY]        [dbo].[N_USER] NULL,
    [UPDATE_DATE]      [dbo].[D_DATE] NULL,
    [UPDATE_BY]        [dbo].[N_USER] NULL,
    CONSTRAINT [PK_MD_ACCOUNT] PRIMARY KEY CLUSTERED ([SYSTEM_ID] ASC, [ACCOUNT_NO] ASC)
);

