CREATE TABLE [dbo].[KPI_SCM_PLANT_MMA] (
    [PLANT_ID]            [dbo].[D_INT]     NOT NULL,
    [KPI_YEAR]            [dbo].[D_INT]     NOT NULL,
    [KPI_MONTH]           [dbo].[D_INT]     NOT NULL,
    [KPI_YYMM]            [dbo].[D_INT]     NOT NULL,
    [SLF_ORDER_ON_TIME]   [dbo].[D_INT]     NULL,
    [SLF_ORDER_RAISED]    [dbo].[D_INT]     NULL,
    [CC_COUNT]            [dbo].[D_INT]     NULL,
    [SA_SICK_HOURS]       [dbo].[D_DEC12.2] NULL,
    [SA_HOURS]            [dbo].[D_DEC12.2] NULL,
    [LTA_PROD_WORK_HOURS] [dbo].[D_DEC12.2] NULL,
    [LTA_CONT_WORK_HOURS] [dbo].[D_DEC12.2] NULL,
    [LTA_PROD_COUNT]      [dbo].[D_DEC12.2] NULL,
    [LTA_CONT_COUNT]      [dbo].[D_DEC12.2] NULL,
    [LOST_PROD_WORKDAYS]  [dbo].[D_DEC12.2] NULL,
    [LOST_CONT_WORKDAYS]  [dbo].[D_DEC12.2] NULL,
    [NLTA_PROD_COUNT]     [dbo].[D_DEC12.2] NULL,
    [NLTA_CONT_COUNT]     [dbo].[D_DEC12.2] NULL,
    [NEAR_PROD_COUNT]     [dbo].[D_DEC12.2] NULL,
    [NEAR_CONT_COUNT]     [dbo].[D_DEC12.2] NULL,
    [FAA_PROD_COUNT]      [dbo].[D_DEC12.2] NULL,
    [FAA_CONT_COUNT]      [dbo].[D_DEC12.2] NULL,
    [EC_GAS_KWH]          [dbo].[D_INT]     NULL,
    [EC_ELEC_KWH]         [dbo].[D_INT]     NULL,
    [EC_OTHER_KWH]        [dbo].[D_INT]     NULL,
    CONSTRAINT [PK_KPI_SCM_PLANT_AMM_1] PRIMARY KEY CLUSTERED ([PLANT_ID] ASC, [KPI_YEAR] ASC, [KPI_MONTH] ASC)
);



