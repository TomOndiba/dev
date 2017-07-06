CREATE TABLE [dbo].[PU_SUPPLIER] (
    [SYSTEM_ID]         [dbo].[D_INT]     NOT NULL,
    [SUPPLIER_CODE]     [dbo].[N_C50]     NOT NULL,
    [SUPPLIER_NAME]     [dbo].[N_C100]    NULL,
    [ADDRESS1]          [dbo].[N_C100]    NULL,
    [ADDRESS2]          [dbo].[N_C100]    NULL,
    [ADDRESS3]          [dbo].[N_C100]    NULL,
    [ZIPCODE]           [dbo].[N_C100]    NULL,
    [CITY]              [dbo].[N_C100]    NULL,
    [COUNTRY]           [dbo].[N_C50]     NULL,
    [VAT_NO]            [dbo].[N_C20]     NULL,
    [NACE_ID]           [dbo].[N_C20]     NULL,
    [TRANSACTION_COUNT] [dbo].[D_INT]     NULL,
    [AMOUNT_GROUP]      [dbo].[D_DEC12.2] NULL,
    [DUNS_ID]           [dbo].[N_C50]     NULL,
    [SUPPLIER_GROUP_1]  [dbo].[N_C100]    NULL,
    [SUPPLIER_GROUP_2]  [dbo].[N_C100]    NULL,
    [SUPPLIER_GROUP_3]  [dbo].[N_C100]    NULL,
    [SUPPLIER_GROUP_4]  [dbo].[N_C100]    NULL,
    [SUPPLIER_GROUP_5]  [dbo].[N_C100]    NULL,
    [CREATE_DATE]       [dbo].[D_DATE]    NULL,
    [CREATE_BY]         [dbo].[N_USER]    NULL,
    [UPDATE_DATE]       [dbo].[D_DATE]    NULL,
    [UPDATE_BY]         [dbo].[N_USER]    NULL,
    CONSTRAINT [PK_PU_SUPPLIER] PRIMARY KEY CLUSTERED ([SYSTEM_ID] ASC, [SUPPLIER_CODE] ASC),
    CONSTRAINT [FK_PU_SUPPLIER_MD_SYSTEMID] FOREIGN KEY ([SYSTEM_ID]) REFERENCES [dbo].[MD_SYSTEMID] ([SYSTEM_ID]),
    CONSTRAINT [FK_PU_SUPPLIER_PU_LINK_COUNTRY] FOREIGN KEY ([SYSTEM_ID], [COUNTRY]) REFERENCES [dbo].[PU_LINK_COUNTRY] ([SYSTEM_ID], [COUNTRY]) NOT FOR REPLICATION
);


GO
ALTER TABLE [dbo].[PU_SUPPLIER] NOCHECK CONSTRAINT [FK_PU_SUPPLIER_PU_LINK_COUNTRY];


GO
CREATE NONCLUSTERED INDEX [IX_PU_SUPPLIER]
    ON [dbo].[PU_SUPPLIER]([VAT_NO] ASC);

