CREATE TABLE [dbo].[PU_UOM_CALC] (
    [SYSTEM_ID]   [dbo].[D_INT]     NULL,
    [ITEM_NO]     [dbo].[N_C50]     NULL,
    [FROM_UOM]    [dbo].[N_C20]     NULL,
    [TO_UOM]      [dbo].[N_C20]     NULL,
    [IDX]         [dbo].[D_INT]     NULL,
    [CALC_TYPE]   [dbo].[N_C1]      NULL,
    [CONSTANT]    [dbo].[D_DEC11.4] NULL,
    [DATA_FIELD]  [dbo].[D_INT]     NULL,
    [CREATE_BY]   [dbo].[N_USER]    NULL,
    [CREATE_DATE] [dbo].[D_DATE]    NULL,
    CONSTRAINT [FK_PU_UOM_CALC_MD_UNIT] FOREIGN KEY ([TO_UOM]) REFERENCES [dbo].[MD_UNIT] ([UOM])
);


GO
CREATE NONCLUSTERED INDEX [IX_PU_UOM_CALC]
    ON [dbo].[PU_UOM_CALC]([SYSTEM_ID] ASC, [ITEM_NO] ASC, [FROM_UOM] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_PU_UOM_CALC_1]
    ON [dbo].[PU_UOM_CALC]([SYSTEM_ID] ASC, [ITEM_NO] ASC);

