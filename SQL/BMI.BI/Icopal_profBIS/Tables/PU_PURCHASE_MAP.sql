CREATE TABLE [dbo].[PU_PURCHASE_MAP] (
    [SYSTEM_ID]     [dbo].[D_INT]     NULL,
    [SBU]           [dbo].[N_SBU]     NULL,
    [SITE_ID]       [dbo].[D_INT]     NULL,
    [ITEM_NO]       [dbo].[N_C50]     NULL,
    [ITEM_NAME]     [dbo].[N_C100]    NULL,
    [ITEM_GROUP_1]  [dbo].[N_C50]     NULL,
    [ITEM_GROUP_2]  [dbo].[N_C50]     NULL,
    [ITEM_GROUP_3]  [dbo].[N_C50]     NULL,
    [SUPPLIER_CODE] [dbo].[N_C50]     NULL,
    [SUPPLIER_NAME] [dbo].[N_C100]    NULL,
    [CATEGORY_ID]   [dbo].[D_INT]     NULL,
    [JOIN_ITEM_NO]  [dbo].[N_C50]     NULL,
    [RecordCount]   [dbo].[D_INT]     NULL,
    [AmountGroup]   [dbo].[D_DEC12.2] NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_PU_PURCHASE_MAP]
    ON [dbo].[PU_PURCHASE_MAP]([SYSTEM_ID] ASC, [ITEM_NO] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_PU_PURCHASE_MAP_1]
    ON [dbo].[PU_PURCHASE_MAP]([SYSTEM_ID] ASC, [SBU] ASC);

