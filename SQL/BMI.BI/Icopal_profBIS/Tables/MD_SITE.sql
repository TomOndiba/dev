CREATE TABLE [dbo].[MD_SITE] (
    [SITE_ID]          [dbo].[D_INT]   NOT NULL,
    [NAME]             [dbo].[N_C100]  NOT NULL,
    [SBU]              [dbo].[N_SBU]   NULL,
    [SYSTEM_ID]        [dbo].[D_INT]   NULL,
    [COUNTRY]          [dbo].[N_C20]   NULL,
    [SITE_DESCRIPTION] [dbo].[N_MEMO]  NULL,
    [LONGITUDE]        DECIMAL (10, 6) NULL,
    [LATITUDE]         DECIMAL (10, 6) NULL,
    [CREATE_BY]        [dbo].[N_USER]  NULL,
    [CREATE_DATE]      [dbo].[D_DATE]  NULL,
    [UPDATE_BY]        [dbo].[N_USER]  NULL,
    [UPDATE_DATE]      [dbo].[D_DATE]  NULL,
    [REGION_ID]        [dbo].[D_INT]   NULL,
    [PROD_SYSTEM_ID]   [dbo].[D_INT]   NULL,
    [PROCUREMENT_NAME] [dbo].[N_C100]  NULL,
    [SALESCENTER_NAME] [dbo].[N_C100]  NULL,
    CONSTRAINT [PK_MD_SITE] PRIMARY KEY CLUSTERED ([SITE_ID] ASC),
    CONSTRAINT [FK_MD_SITE_MD_SBU] FOREIGN KEY ([SBU]) REFERENCES [dbo].[MD_SBU] ([SBU]) ON UPDATE CASCADE,
    CONSTRAINT [FK_MD_SITE_MD_SYSTEMID] FOREIGN KEY ([SYSTEM_ID]) REFERENCES [dbo].[MD_SYSTEMID] ([SYSTEM_ID])
);

