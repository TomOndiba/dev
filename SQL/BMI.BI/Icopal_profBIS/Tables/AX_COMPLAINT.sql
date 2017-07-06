CREATE TABLE [dbo].[AX_COMPLAINT] (
    [SYSTEM_ID]      [dbo].[D_INT]      NOT NULL,
    [COMPLAINT_ID]   [dbo].[N_C50]      NOT NULL,
    [ITEM_NO]        [dbo].[N_C50]      NULL,
    [SUPPLIER_CODE]  [dbo].[N_C50]      NULL,
    [STATUS_TEXT]    [dbo].[N_C100]     NULL,
    [STATUS_ID]      [dbo].[D_INT]      NOT NULL,
    [DEPARTMENT]     [dbo].[N_C100]     NULL,
    [DESCRIPTION]    [dbo].[N_C100]     NULL,
    [CREATE_DATE]    [dbo].[D_DATE]     NULL,
    [CLOSE_DATE]     [dbo].[D_DATE]     NULL,
    [COMPLIANT_TYPE] [dbo].[N_C100]     NULL,
    [CLAIM_WANTED]   [dbo].[D_DEC12.2]  NULL,
    [CLAIM_RECEIVED] [dbo].[D_DEC12.2]  NULL,
    [CURRENCY]       [dbo].[N_CURRENCY] NULL,
    CONSTRAINT [PK_AX_COMPLAINT] PRIMARY KEY CLUSTERED ([SYSTEM_ID] ASC, [COMPLAINT_ID] ASC)
);

