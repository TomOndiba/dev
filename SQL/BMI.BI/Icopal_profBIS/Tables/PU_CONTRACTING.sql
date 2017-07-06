CREATE TABLE [dbo].[PU_CONTRACTING] (
    [RECID]                  UNIQUEIDENTIFIER    CONSTRAINT [DF_PU_CONTRACTING_RECID] DEFAULT (newid()) ROWGUIDCOL NOT NULL,
    [SYSTEM_ID]              [dbo].[D_INT]       NOT NULL,
    [INVOICE_DATE]           [dbo].[D_DATE]      NOT NULL,
    [INVOICE_NUMBER]         [dbo].[N_C50]       NOT NULL,
    [INVOICE_LINE_NUMBER]    [dbo].[N_C20]       NOT NULL,
    [SUPPLIER_CODE]          [dbo].[N_C50]       NOT NULL,
    [SITE]                   [dbo].[N_C50]       NULL,
    [INVOICE_TYPE]           [dbo].[N_C1]        NULL,
    [ACCOUNT_NO]             [dbo].[N_C50]       NULL,
    [ACCOUNT_NAME]           [dbo].[N_C100]      NULL,
    [DEPARTMENT_NO]          [dbo].[N_C50]       NULL,
    [DEPARTMENT_NAME]        [dbo].[N_C50]       NULL,
    [PROJECT_ELEMENT]        [dbo].[N_C50]       NULL,
    [PROJECT_ELEMENT_NAME]   [dbo].[N_C100]      NULL,
    [JOB_NO]                 [dbo].[N_C50]       NULL,
    [PAYMENT_TERM]           [dbo].[N_C50]       NULL,
    [PAYMENT_TERM_TEXT]      [dbo].[N_C100]      NULL,
    [INVOICE_AMOUNT]         [dbo].[D_DEC15,4]   NULL,
    [INVOICE_CURRENCY]       [dbo].[N_CURRENCY]  NULL,
    [INVOICE_AMOUNT_GROUP]   [dbo].[D_DEC15,4]   NULL,
    [INVOICE_AMOUNT_LOCAL]   [dbo].[D_DEC15,4]   NULL,
    [INVOICE_LOCAL_CURRENCY] [dbo].[N_CURRENCY]  NULL,
    [KEEP_RECORD]            [dbo].[N_BOOLEAN_N] NULL,
    [CREATE_DATE]            [dbo].[D_DATE]      NULL,
    [CREATE_BY]              [dbo].[N_C100]      NULL,
    [UPDATE_DATE]            [dbo].[D_DATE]      NULL,
    [UPDATE_BY]              [dbo].[N_USER]      NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_PU_CONTRACTING]
    ON [dbo].[PU_CONTRACTING]([SYSTEM_ID] ASC, [INVOICE_DATE] ASC, [INVOICE_NUMBER] ASC, [INVOICE_LINE_NUMBER] ASC, [SUPPLIER_CODE] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_PU_CONTRACTING_1]
    ON [dbo].[PU_CONTRACTING]([SYSTEM_ID] ASC, [SUPPLIER_CODE] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_PU_CONTRACTING_2]
    ON [dbo].[PU_CONTRACTING]([SYSTEM_ID] ASC, [ACCOUNT_NO] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_PU_CONTRACTING_4]
    ON [dbo].[PU_CONTRACTING]([RECID] ASC);

