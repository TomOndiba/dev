﻿CREATE TABLE [dbo].[AMM_MONTHDATA] (
    [AMM_GROUP_ID]    [dbo].[D_INT]     NOT NULL,
    [SBU]             [dbo].[N_SBU]     NOT NULL,
    [AMM_YEAR]        [dbo].[D_INT]     NOT NULL,
    [AMM_MONTH]       [dbo].[D_INT]     NOT NULL,
    [AMM_INDEX]       [dbo].[D_DEC11.4] NULL,
    [AMM_SPEND]       [dbo].[D_DEC12.2] NULL,
    [AMM_QUANTITY]    [dbo].[D_DEC12.2] NULL,
    [AMM_PRICE]       [dbo].[D_DEC11.4] NULL,
    [ACTUAL_SPEND]    [dbo].[D_DEC12.2] NULL,
    [ACTUAL_QUANTITY] [dbo].[D_DEC12.2] NULL,
    [UPDATE_BY]       [dbo].[N_USER]    NULL,
    [UPDATE_DATE]     [dbo].[D_DATE]    NULL,
    CONSTRAINT [PK_AMM_MONTHDATA] PRIMARY KEY CLUSTERED ([AMM_GROUP_ID] ASC, [SBU] ASC, [AMM_YEAR] ASC, [AMM_MONTH] ASC),
    CONSTRAINT [FK_AMM_MONTHDATA_AMM_YEARDATA] FOREIGN KEY ([AMM_GROUP_ID], [SBU], [AMM_YEAR]) REFERENCES [dbo].[AMM_YEARDATA] ([AMM_GROUP_ID], [SBU], [AMM_YEAR]) ON DELETE CASCADE ON UPDATE CASCADE
);

