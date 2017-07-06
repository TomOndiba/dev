CREATE TABLE [dbo].[SA_CUSTOMER_MAP] (
    [SYSTEM_ID]        [dbo].[D_INT]     NOT NULL,
    [CUSTOMER_NO]      [dbo].[N_C50]     NOT NULL,
    [SBU]              [dbo].[N_SBU]     NOT NULL,
    [CATEGORY_ID]      [dbo].[D_INT]     NULL,
    [TransactionCount] [dbo].[D_INT]     NULL,
    [AmountGroup]      [dbo].[D_DEC12.2] NULL,
    CONSTRAINT [PK_SA_CUSTOMER_MAP_1] PRIMARY KEY CLUSTERED ([SYSTEM_ID] ASC, [CUSTOMER_NO] ASC, [SBU] ASC)
);

