CREATE TABLE [dbo].[PU_LINK_SITE_BACKUP] (
    [SITE_ID]     [dbo].[D_INT]  NOT NULL,
    [SYSTEM_ID]   [dbo].[D_INT]  NOT NULL,
    [LOCAL_SITE]  [dbo].[N_C50]  NOT NULL,
    [CREATE_BY]   [dbo].[N_USER] NULL,
    [CREATE_DATE] [dbo].[D_DATE] NULL
);

