CREATE TABLE [dbo].[KPI_SHIFT_PRODLINE_ITEM_DATA] (
    [PRODLINE_ID]      [dbo].[D_INT]     NOT NULL,
    [ITEM_NO]          [dbo].[N_C50]     NOT NULL,
    [WIDTH]            [dbo].[D_DEC7.2]  NULL,
    [LENGTH]           [dbo].[D_DEC7.2]  NULL,
    [WEIGHT]           [dbo].[D_DEC7.2]  NULL,
    [NORM_SPEED]       [dbo].[D_DEC12.2] NULL,
    [NORM_UOM]         [dbo].[N_C20]     NULL,
    [KG_PER_M2]        [dbo].[D_DEC11.4] NULL,
    [WEIGHT_ROLL]      [dbo].[D_DEC7.2]  NULL,
    [NORM_SPEED_M_MIN] [dbo].[D_DEC7.2]  NULL,
    [CREATE_BY]        [dbo].[N_USER]    NULL,
    [CREATE_DATE]      [dbo].[D_DATE]    NULL,
    [UPDATE_BY]        [dbo].[N_USER]    NULL,
    [UPDATE_DATE]      [dbo].[D_DATE]    NULL,
    CONSTRAINT [PK_KPI_SHIFT_PRODLINE_ITEM_DATA] PRIMARY KEY CLUSTERED ([PRODLINE_ID] ASC, [ITEM_NO] ASC),
    CONSTRAINT [FK_KPI_SHIFT_PRODLINE_ITEM_DATA_MD_PLANT_PRODLINE] FOREIGN KEY ([PRODLINE_ID]) REFERENCES [dbo].[MD_PLANT_PRODLINE] ([PRODLINE_ID]) ON DELETE CASCADE
);

