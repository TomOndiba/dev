﻿CREATE TABLE [dbo].[KPI_REPORT_CATEGORY] (
    [REPORT_CATEGORY_ID] [dbo].[D_INT]  NOT NULL,
    [REPORT_TYPE_ID]     [dbo].[D_INT]  NULL,
    [REPORT_PARENT_ID]   [dbo].[D_INT]  NULL,
    [REPORT_DESCRIPTION] [dbo].[D_MEMO] NULL,
    [TEXT_ID]            [dbo].[D_INT]  NULL,
    [SORT_NO]            [dbo].[D_INT]  NULL,
    [UPDATE_BY]          [dbo].[N_USER] NULL,
    [UPDATE_DATE]        [dbo].[D_DATE] NULL,
    [CREATE_BY]          [dbo].[N_USER] NULL,
    [CREATE_DATE]        [dbo].[D_DATE] NULL,
    CONSTRAINT [PK_KPI_REPORT_CATEGORY] PRIMARY KEY CLUSTERED ([REPORT_CATEGORY_ID] ASC),
    CONSTRAINT [FK_KPI_REPORT_CATEGORY_KPI_REPORT_TYPE] FOREIGN KEY ([REPORT_TYPE_ID]) REFERENCES [dbo].[KPI_REPORT_TYPE] ([REPORT_TYPE_ID])
);



