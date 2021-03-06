﻿CREATE TABLE [dbo].[MD_PLANT_PRODLINE] (
    [PRODLINE_ID]                       [dbo].[D_INT]       NOT NULL,
    [PLANT_ID]                          [dbo].[D_INT]       NULL,
    [PRODLINE_NAME]                     [dbo].[N_C50]       NULL,
    [PRODLINE_DESCRPTION]               [dbo].[N_C100]      NULL,
    [PRODLINE_ACTIVE]                   [dbo].[N_BOOLEAN_Y] NULL,
    [PRODLINE_SEMIFINISHED]             [dbo].[N_BOOLEAN_N] NULL,
    [PRODLINE_TYPE_ID]                  [dbo].[D_INT]       NULL,
    [PRODLINE_DEFECT_REPORT_TYPE_ID]    [dbo].[D_INT]       NULL,
    [PRODLINE_UNPLANNED_REPORT_TYPE_ID] [dbo].[D_INT]       NULL,
    [PRODLINE_PLANNED_REPORT_TYPE_ID]   [dbo].[D_INT]       NULL,
    [CREATE_BY]                         [dbo].[N_USER]      NULL,
    [CREATE_DATE]                       [dbo].[D_DATE]      NULL,
    [UPDATE_BY]                         [dbo].[N_USER]      NULL,
    [UPDATE_DATE]                       [dbo].[D_DATE]      NULL,
    CONSTRAINT [PK_MD_PLANT_PRODLINE] PRIMARY KEY CLUSTERED ([PRODLINE_ID] ASC),
    CONSTRAINT [FK_MD_PLANT_PRODLINE_MD_PLANT] FOREIGN KEY ([PLANT_ID]) REFERENCES [dbo].[MD_PLANT] ([PLANT_ID]) ON DELETE CASCADE
);




GO
CREATE NONCLUSTERED INDEX [IX_MD_PLANT_PRODLINE]
    ON [dbo].[MD_PLANT_PRODLINE]([PLANT_ID] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MD_PLANT_PRODLINE_1]
    ON [dbo].[MD_PLANT_PRODLINE]([PLANT_ID] ASC, [PRODLINE_NAME] ASC);

