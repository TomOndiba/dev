CREATE TABLE [dbo].[SA_INVOICE_ENV_MAP] (
    [SYSTEM_ID]   [dbo].[D_INT]     NULL,
    [SBU]         [dbo].[N_SBU]     NULL,
    [ITEM_NO]     [dbo].[N_C50]     NULL,
    [CATEGORY_ID] [dbo].[D_INT]     NULL,
    [RecordCount] [dbo].[D_INT]     NULL,
    [AmountGroup] [dbo].[D_DEC12.2] NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_SA_INVOICE_ENV:MAP]
    ON [dbo].[SA_INVOICE_ENV_MAP]([SYSTEM_ID] ASC, [ITEM_NO] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SA_INVOICE_ENV_MAP_1]
    ON [dbo].[SA_INVOICE_ENV_MAP]([SYSTEM_ID] ASC, [SBU] ASC);

