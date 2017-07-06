CREATE TABLE [dbo].[KPI_SHIFT_DATA] (
    [SHIFTDATA_ID]       [dbo].[D_INT]    NOT NULL,
    [PRODLINE_ID]        [dbo].[D_INT]    NULL,
    [SHIFT_ID]           [dbo].[D_INT]    NULL,
    [PROD_DATE]          [dbo].[D_DATE]   NULL,
    [PROD_SHIFT]         [dbo].[N_C20]    NULL,
    [PLANNED_STOP_HOURS] [dbo].[D_DEC7.2] NULL,
    [SHIFT_HOURS]        [dbo].[D_DEC7.2] NULL,
    [UPDATE_BY]          [dbo].[N_USER]   NULL,
    [UPDATE_DATE]        [dbo].[D_DATE]   NULL,
    [CREATE_BY]          [dbo].[N_USER]   NULL,
    [CREATE_DATE]        [dbo].[D_DATE]   NULL,
    CONSTRAINT [PK_KPI_SHIFT_DATA] PRIMARY KEY CLUSTERED ([SHIFTDATA_ID] ASC)
);

