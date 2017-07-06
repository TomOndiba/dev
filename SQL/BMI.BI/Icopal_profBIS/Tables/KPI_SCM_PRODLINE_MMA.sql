CREATE TABLE [dbo].[KPI_SCM_PRODLINE_MMA] (
    [PRODLINE_ID]           [dbo].[D_INT]     NOT NULL,
    [KPI_YEAR]              [dbo].[D_INT]     NOT NULL,
    [KPI_MONTH]             [dbo].[D_INT]     NOT NULL,
    [KPI_YYMM]              [dbo].[D_INT]     NULL,
    [OEE_AVAIL_HOURS]       [dbo].[D_DEC12.2] NULL,
    [OEE_PLAN_PROD_HOURS]   [dbo].[D_DEC12.2] NULL,
    [OEE_UNPLAN_STOP_HOURS] [dbo].[D_DEC12.2] NULL,
    [OEE_REF_TIME]          [dbo].[D_DEC12.2] NULL,
    [OEE_PRIMA_M2]          [dbo].[D_INT]     NULL,
    [OEE_DEFECT_M2]         [dbo].[D_INT]     NULL,
    [OEE_PRIMA_TONS]        [dbo].[D_DEC12.2] NULL,
    [OEE_DEFECT_TONS]       [dbo].[D_DEC12.2] NULL,
    [OEE_CONSUMED_HOURS]    [dbo].[D_DEC12.2] NULL,
    [OEE_POSSIBLE_HOURS]    [dbo].[D_INT]     NULL,
    CONSTRAINT [PK_KPI_SCM_PRODLINE_MMA] PRIMARY KEY CLUSTERED ([PRODLINE_ID] ASC, [KPI_YEAR] ASC, [KPI_MONTH] ASC)
);

