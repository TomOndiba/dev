CREATE TABLE [dbo].[MD_REGION] (
    [REGION_ID]          [dbo].[D_INT]  NOT NULL,
    [REGION]             [dbo].[N_C50]  NULL,
    [REGION_DESCRIPTION] [dbo].[N_MEMO] NULL,
    [CREATE_BY]          [dbo].[N_USER] NULL,
    [CREATE_DATE]        [dbo].[D_DATE] NULL,
    [UPDATE_BY]          [dbo].[N_USER] NULL,
    [UPDATE_DATE]        [dbo].[D_DATE] NULL,
    CONSTRAINT [PK_MD_REGION] PRIMARY KEY CLUSTERED ([REGION_ID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MD_REGION]
    ON [dbo].[MD_REGION]([REGION] ASC);

