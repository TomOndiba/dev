CREATE TABLE [dbo].[PU_INDEX100] (
    [SYSTEM_ID]      [dbo].[D_INT]     NOT NULL,
    [ITEM_NO]        [dbo].[N_C50]     NOT NULL,
    [SUPPLIER_CODE]  [dbo].[N_C50]     NOT NULL,
    [SBU]            [dbo].[N_SBU]     NULL,
    [INDEX100_YEAR]  [dbo].[D_INT]     NULL,
    [INDEX100_MONTH] [dbo].[D_INT]     NULL,
    [GROUP_AMOUNT]   [dbo].[D_DEC12.2] NULL,
    [LOCAL_AMOUNT]   [dbo].[D_DEC12.2] NULL,
    [QUANTITY]       [dbo].[D_DEC12.2] NULL,
    CONSTRAINT [PK_PU_INDEX100] PRIMARY KEY CLUSTERED ([SYSTEM_ID] ASC, [ITEM_NO] ASC, [SUPPLIER_CODE] ASC)
);

