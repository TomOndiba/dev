CREATE TABLE [dbo].[PU_INDIRECT_MAP] (
    [SYSTEM_ID]     [dbo].[D_INT]     NULL,
    [SBU]           [dbo].[N_SBU]     NULL,
    [SITE_ID]       [dbo].[D_INT]     NULL,
    [ACCOUNT_NO]    [dbo].[N_C50]     NULL,
    [ACCOUNT_NAME]  [dbo].[N_C100]    NULL,
    [SUPPLIER_CODE] [dbo].[N_C50]     NULL,
    [SUPPLIER_NAME] [dbo].[N_C100]    NULL,
    [CATEGORY_ID]   [dbo].[D_INT]     NULL,
    [RecordCount]   [dbo].[D_INT]     NULL,
    [AmountGroup]   [dbo].[D_DEC12.2] NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_PU_INDIRECT_MAP]
    ON [dbo].[PU_INDIRECT_MAP]([SYSTEM_ID] ASC, [ACCOUNT_NO] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_PU_INDIRECT_MAP_1]
    ON [dbo].[PU_INDIRECT_MAP]([SYSTEM_ID] ASC, [SBU] ASC);

