CREATE TABLE [dbo].[KPI_SHIFT_ID] (
    [SHIFT_ID]          [dbo].[D_INT]  NOT NULL,
    [SHIFT_NAME]        [dbo].[N_C100] NULL,
    [SHIFT_DESCRIPTION] [dbo].[N_MEMO] NULL,
    [PLANT_ID]          [dbo].[D_INT]  NULL,
    [UPDATE_BY]         [dbo].[N_USER] NULL,
    [UPDATE_DATE]       [dbo].[D_DATE] NULL,
    [CREATE_BY]         [dbo].[N_USER] NULL,
    [CREATE_DATE]       [dbo].[D_DATE] NULL,
    CONSTRAINT [PK_KPI_SHIFT_ID] PRIMARY KEY CLUSTERED ([SHIFT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_KPI_SHIFT_ID]
    ON [dbo].[KPI_SHIFT_ID]([PLANT_ID] ASC);

