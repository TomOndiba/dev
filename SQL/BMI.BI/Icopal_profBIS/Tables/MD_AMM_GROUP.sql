CREATE TABLE [dbo].[MD_AMM_GROUP] (
    [AMM_GROUP_ID]  [dbo].[D_INT]       NOT NULL,
    [AMM_GROUP]     [dbo].[N_C100]      NOT NULL,
    [AMM_TYPE_ID]   [dbo].[D_INT]       NULL,
    [DATA_ENTRY]    [dbo].[N_BOOLEAN_N] NULL,
    [ROLLING_PRICE] [dbo].[N_BOOLEAN_N] NULL,
    [UOM]           [dbo].[N_C20]       NULL,
    [UOM2]          [dbo].[N_C20]       NULL,
    [UOM3]          [dbo].[N_C20]       NULL,
    [SORT_NO]       [dbo].[D_INT]       NULL,
    [CREATE_BY]     [dbo].[N_USER]      NULL,
    [CREATE_DATE]   [dbo].[D_DATE]      NULL,
    [UPDATE_BY]     [dbo].[N_USER]      NULL,
    [UPDATE_DATE]   [dbo].[D_DATE]      NULL,
    CONSTRAINT [PK_AMM_GROUP_1] PRIMARY KEY CLUSTERED ([AMM_GROUP_ID] ASC),
    CONSTRAINT [FK_AMM_GROUP_MD_UNIT] FOREIGN KEY ([UOM]) REFERENCES [dbo].[MD_UNIT] ([UOM])
);

