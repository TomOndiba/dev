CREATE TABLE [dbo].[AMM_YEARDATA] (
    [AMM_GROUP_ID]          [dbo].[D_INT]       NOT NULL,
    [SBU]                   [dbo].[N_SBU]       NOT NULL,
    [AMM_YEAR]              [dbo].[D_INT]       NOT NULL,
    [AMM_PCT]               [dbo].[D_DEC11.4]   NULL,
    [AMM_PRICE]             [dbo].[D_DEC11.4]   NULL,
    [AMM_PRICE_CALC]        [dbo].[D_DEC11.4]   NULL,
    [AMM_SPEND]             [dbo].[D_DEC12.2]   NULL,
    [AMM_PRICE_MANUAL]      [dbo].[N_BOOLEAN_N] NULL,
    [AMM_PRICE_MANUAL_USER] [dbo].[N_USER]      NULL,
    [AMM_PRICE_MANUAL_DATE] [dbo].[D_DATE]      NULL,
    [PRICE_SPEND]           [dbo].[D_DEC12.2]   NULL,
    [PRICE_QUANTITY]        [dbo].[D_DEC12.2]   NULL,
    [UPDATE_BY]             [dbo].[N_USER]      NULL,
    [UPDATE_DATE]           [dbo].[D_DATE]      NULL,
    CONSTRAINT [PK_AMM_YEARDATA] PRIMARY KEY CLUSTERED ([AMM_GROUP_ID] ASC, [SBU] ASC, [AMM_YEAR] ASC),
    CONSTRAINT [FK_AMM_YEARDATA_AMM_GROUP] FOREIGN KEY ([AMM_GROUP_ID]) REFERENCES [dbo].[MD_AMM_GROUP] ([AMM_GROUP_ID]) ON DELETE CASCADE,
    CONSTRAINT [FK_AMM_YEARDATA_MD_SBU] FOREIGN KEY ([SBU]) REFERENCES [dbo].[MD_SBU] ([SBU]) ON DELETE CASCADE ON UPDATE CASCADE
);

