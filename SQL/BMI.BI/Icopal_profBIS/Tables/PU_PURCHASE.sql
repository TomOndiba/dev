CREATE TABLE [dbo].[PU_PURCHASE] (
    [RECID]                        UNIQUEIDENTIFIER    CONSTRAINT [DF_PU_PURCHASE_RECID] DEFAULT (newid()) ROWGUIDCOL NOT NULL,
    [SYSTEM_ID]                    [dbo].[D_INT]       NOT NULL,
    [INVOICE_DATE]                 [dbo].[D_DATE]      NOT NULL,
    [INVOICE_NUMBER]               [dbo].[N_C50]       NOT NULL,
    [INVOICE_LINE_NUMBER]          [dbo].[N_C20]       NOT NULL,
    [SUPPLIER_CODE]                [dbo].[N_C50]       NOT NULL,
    [ORDERING_SITE]                [dbo].[N_C50]       NULL,
    [SHIP_TO_SITE]                 [dbo].[N_C50]       NULL,
    [INVOICE_TYPE]                 [dbo].[N_C1]        NULL,
    [ITEM_NO]                      [dbo].[N_C50]       NULL,
    [LOCAL_ITEM_NO]                [dbo].[N_C50]       NULL,
    [PAYMENT_TERM]                 [dbo].[N_C50]       NULL,
    [PAYMENT_TERM_TEXT]            [dbo].[N_C100]      NULL,
    [DELIVERY_TERM]                [dbo].[N_C50]       NULL,
    [DELIVERY_TERM_TEXT]           [dbo].[N_C100]      NULL,
    [INVOICE_AMOUNT]               [dbo].[D_DEC15,4]   NULL,
    [INVOICE_CURRENCY]             [dbo].[N_CURRENCY]  NULL,
    [INVOICE_AMOUNT_GROUP]         [dbo].[D_DEC15,4]   NULL,
    [INVOICE_AMOUNT_LOCAL]         [dbo].[D_DEC15,4]   NULL,
    [INVOICE_LOCAL_CURRENCY]       [dbo].[N_CURRENCY]  NULL,
    [QUANTITY]                     [dbo].[D_DEC12.2]   NULL,
    [UOM]                          [dbo].[N_C20]       NULL,
    [LOCAL_QUANTITY]               [dbo].[D_DEC12.2]   NULL,
    [LOCAL_UOM]                    [dbo].[N_C20]       NULL,
    [DELIVERY_DATE]                [dbo].[D_DATE]      NULL,
    [REQUESTED_DELIVERY_DATE]      [dbo].[D_DATE]      NULL,
    [DELIVERY_COUNT]               [dbo].[D_INT]       NULL,
    [AGREED_DATE]                  [dbo].[D_DATE]      NULL,
    [AGREED_QUANTITY]              [dbo].[D_DEC12.2]   NULL,
    [AGREED_UOM]                   [dbo].[N_C20]       NULL,
    [AGREED_QUANTITY_LOCAL]        [dbo].[D_DEC12.2]   NULL,
    [AGREED_UOM_LOCAL]             [dbo].[N_C20]       NULL,
    [ORDERED_QUANTITY]             [dbo].[D_DEC12.2]   NULL,
    [DELIVERY_PRECISION]           [dbo].[D_DEC7.2]    NULL,
    [QUANTITY_PRECISION]           [dbo].[D_DEC7.2]    NULL,
    [REQUESTED_DELIVERY_PRECISION] [dbo].[D_DEC7.2]    NULL,
    [PAYMENT_DATE]                 [dbo].[D_DATE]      NULL,
    [PAYMENT_ID]                   [dbo].[N_C50]       NULL,
    [PO_NO]                        [dbo].[N_C50]       NULL,
    [PO_DATE]                      [dbo].[D_DATE]      NULL,
    [PO_DATE_CONFIRMED]            [dbo].[D_DATE]      NULL,
    [PO_CONFIRMED_WORKDAYS]        [dbo].[D_INT]       NULL,
    [BUYER]                        [dbo].[N_C50]       NULL,
    [COMPLIANCE_ID]                [dbo].[D_INT]       NULL,
    [COMPLIANCE_KEPT]              BIT                 CONSTRAINT [DF_PU_PURCHASE_COMPLIANCE_KEPT] DEFAULT ((0)) NULL,
    [COMPLIANCE_AMOUNT_LOCAL]      [dbo].[D_DEC12.2]   NULL,
    [COMPLIANCE_AMOUNT_GROUP]      [dbo].[D_DEC12.2]   NULL,
    [PRICELIST_ID]                 [dbo].[D_INT]       NULL,
    [PRICELIST_KEPT]               BIT                 NULL,
    [PRICELIST_AMOUNT_LOCAL]       [dbo].[D_DEC12.2]   NULL,
    [PRICELIST_AMOUNT_GROUP]       [dbo].[D_DEC12.2]   NULL,
    [UNSPSC_ID]                    [dbo].[N_C20]       NULL,
    [ACCOUNT_INFO]                 [dbo].[N_C50]       NULL,
    [FILENAME]                     [dbo].[N_MEMO]      NULL,
    [REMARKS]                      [dbo].[N_MEMO]      NULL,
    [ORIGINAL_ITEM_TEXT]           [dbo].[N_C100]      NULL,
    [ADDITIONAL_TEXT1]             [dbo].[N_C50]       NULL,
    [ADDITIONAL_TEXT2]             [dbo].[N_C50]       NULL,
    [ADDITIONAL_TEXT3]             [dbo].[N_C50]       NULL,
    [ADDITIONAL_TEXT4]             [dbo].[N_C50]       NULL,
    [ADDITIONAL_TEXT5]             [dbo].[N_C50]       NULL,
    [ADDITIONAL_NUM1]              [dbo].[D_DEC12.2]   NULL,
    [ADDITIONAL_NUM2]              [dbo].[D_DEC12.2]   NULL,
    [ADDITIONAL_NUM3]              [dbo].[D_DEC12.2]   NULL,
    [ADDITIONAL_NUM4]              [dbo].[D_DEC12.2]   NULL,
    [ADDITIONAL_NUM5]              [dbo].[D_DEC12.2]   NULL,
    [KEEP_RECORD]                  [dbo].[N_BOOLEAN_N] NULL,
    [CREATE_DATE]                  [dbo].[D_DATE]      NULL,
    [CREATE_BY]                    [dbo].[N_C100]      NULL,
    [UPDATE_DATE]                  [dbo].[D_DATE]      NULL,
    [UPDATE_BY]                    [dbo].[N_USER]      NULL,
    [PRECISION_REC]                [dbo].[D_INT]       NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_PU_PURCHASE]
    ON [dbo].[PU_PURCHASE]([SYSTEM_ID] ASC, [INVOICE_DATE] ASC, [INVOICE_NUMBER] ASC, [INVOICE_LINE_NUMBER] ASC, [SUPPLIER_CODE] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_PU_PURCHASE_1]
    ON [dbo].[PU_PURCHASE]([SYSTEM_ID] ASC, [SUPPLIER_CODE] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_PU_PURCHASE_2]
    ON [dbo].[PU_PURCHASE]([SYSTEM_ID] ASC, [ITEM_NO] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_PU_PURCHASE_3]
    ON [dbo].[PU_PURCHASE]([SYSTEM_ID] ASC, [UOM] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_PU_PURCHASE_4]
    ON [dbo].[PU_PURCHASE]([RECID] ASC);

