CREATE TABLE [dbo].[MD_STOCK_SIMPLE] (
    [SYSTEM_ID]      [dbo].[D_INT]     NOT NULL,
    [ITEM_NO]        [dbo].[N_C50]     NOT NULL,
    [STOCK_DATE]     [dbo].[D_DATE]    NOT NULL,
    [QUANTITY]       [dbo].[D_DEC12.2] NULL,
    [UOM]            [dbo].[N_C20]     NULL,
    [LOCAL_QUANTITY] [dbo].[D_DEC12.2] NULL,
    [LOCAL_UOM]      [dbo].[N_C20]     NULL,
    [UPDATE_DATE]    [dbo].[D_DATE]    NULL,
    [UPDATE_BY]      [dbo].[N_USER]    NULL,
    CONSTRAINT [PK_MD_STOCK_SIMPLE] PRIMARY KEY CLUSTERED ([SYSTEM_ID] ASC, [ITEM_NO] ASC, [STOCK_DATE] ASC)
);

