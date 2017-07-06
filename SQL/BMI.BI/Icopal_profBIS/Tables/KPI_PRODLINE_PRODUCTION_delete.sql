CREATE TABLE [dbo].[KPI_PRODLINE_PRODUCTION_delete] (
    [PRODUCTION_ID]        [dbo].[D_INT]     NOT NULL,
    [PRODLINE_ID]          [dbo].[D_INT]     NULL,
    [PROD_DATE]            [dbo].[D_DATE]    NULL,
    [PROD_SHIFT]           [dbo].[N_C20]     NULL,
    [SYSTEM_ID]            [dbo].[D_INT]     NULL,
    [ITEM_NO]              [dbo].[N_C50]     NULL,
    [PROD_START]           [dbo].[D_DATE]    NULL,
    [PROD_END]             [dbo].[D_DATE]    NULL,
    [PROD_TIME]            [dbo].[D_DATE]    NULL,
    [PROD_STOP]            [dbo].[D_DEC7.2]  NULL,
    [PROD_ACT_TIME]        [dbo].[D_DATE]    NULL,
    [PROD_NORM_SPEED]      [dbo].[D_DEC11.4] NULL,
    [PROD_PRIMA_QUANTITY]  [dbo].[D_INT]     NULL,
    [PROD_DEFECT_QUANTITY] [dbo].[D_INT]     NULL,
    [PROD_UOM]             [dbo].[N_C20]     NULL,
    [PROD_PRIMA_KG]        [dbo].[D_INT]     NULL,
    [PROD_DEFECT_KG]       [dbo].[D_INT]     NULL,
    [CREATE_BY]            [dbo].[N_USER]    NULL,
    [CREATE_DATE]          [dbo].[D_DATE]    NULL,
    [UPDATE_BY]            [dbo].[D_USER]    NULL,
    [UPDATE_DATE]          [dbo].[D_DATE]    NULL,
    CONSTRAINT [PK_KPI_PRODLINE_PRODUCTION] PRIMARY KEY CLUSTERED ([PRODUCTION_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_KPI_PRODLINE_PRODUCTION]
    ON [dbo].[KPI_PRODLINE_PRODUCTION_delete]([PRODLINE_ID] ASC, [PROD_DATE] ASC);

