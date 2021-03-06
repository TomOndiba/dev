﻿CREATE TABLE [dbo].[PU_CONTRACTING_REQUEST] (
    [REQUEST_ID]           [dbo].[D_INT]       NOT NULL,
    [CATEGORY_ID]          [dbo].[D_INT]       NOT NULL,
    [NAME_SUGGESTION]      [dbo].[N_C100]      NOT NULL,
    [INGROUP]              [dbo].[N_MEMO]      NULL,
    [DESCRIPTION]          [dbo].[N_MEMO]      NULL,
    [CREATE_BY]            [dbo].[N_USER]      NULL,
    [CREATE_DATE]          [dbo].[D_DATE]      NULL,
    [CATEGORY_CREATED]     [dbo].[N_BOOLEAN_N] NULL,
    [CATEGORY_REJECTED]    [dbo].[N_BOOLEAN_N] NULL,
    [REQUEST_MANAGER]      [dbo].[N_USER]      NULL,
    [REQUEST_MANAGER_DATE] [dbo].[D_DATE]      NULL,
    CONSTRAINT [PK_PU_CONTRACTING_CATEGORY_REQUEST] PRIMARY KEY CLUSTERED ([REQUEST_ID] ASC),
    CONSTRAINT [FK_PU_CONTRACTING_CATEGORY_REQUEST_PU_CONTRACTING_CATEGORY] FOREIGN KEY ([CATEGORY_ID]) REFERENCES [dbo].[PU_CONTRACTING_CATEGORY] ([CATEGORY_ID])
);

