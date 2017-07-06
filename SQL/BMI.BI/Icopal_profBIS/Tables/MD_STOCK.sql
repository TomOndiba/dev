CREATE TABLE [dbo].[MD_STOCK] (
    [SYSTEM_ID]            [dbo].[D_INT]       NOT NULL,
    [ITEM_NO]              [dbo].[N_C50]       NOT NULL,
    [LOCAL_SITE]           [dbo].[N_C20]       NOT NULL,
    [STOCK_DATE]           [dbo].[D_DATE]      NOT NULL,
    [STOCK_QUANTITY]       [dbo].[D_DEC12.2]   NULL,
    [STOCK_UOM]            [dbo].[N_C20]       NULL,
    [STOCK_QUANTITY_LOCAL] [dbo].[D_DEC12.2]   NULL,
    [STOCK_UOM_LOCAL]      [dbo].[N_C20]       NULL,
    [REPORTED_DATA]        [dbo].[N_BOOLEAN_N] NULL,
    [CREATE_DATE]          [dbo].[D_DATE]      NULL,
    [CREATE_BY]            [dbo].[N_USER]      NULL,
    CONSTRAINT [PK_MD_STOCK] PRIMARY KEY CLUSTERED ([SYSTEM_ID] ASC, [ITEM_NO] ASC, [LOCAL_SITE] ASC, [STOCK_DATE] ASC)
);

