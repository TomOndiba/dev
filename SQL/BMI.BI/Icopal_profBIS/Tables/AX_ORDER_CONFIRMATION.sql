CREATE TABLE [dbo].[AX_ORDER_CONFIRMATION] (
    [SYSTEM_ID]                    [dbo].[D_INT]  NOT NULL,
    [PO_NO]                        [dbo].[N_C50]  NOT NULL,
    [PO_LINE]                      [dbo].[N_C50]  NOT NULL,
    [FIRST_CONFIRMATION_DATE]      [dbo].[D_DATE] NULL,
    [FIRST_AGREED_DELIVERY_DATE]   [dbo].[D_DATE] NULL,
    [CURRENT_AGREED_DELIVERY_DATE] [dbo].[D_DATE] NULL,
    [CREATE_DATE]                  [dbo].[D_DATE] NULL,
    [UPDATE_DATE]                  [dbo].[D_DATE] NULL,
    CONSTRAINT [PK_AX_ORDER_CONFIRMATION] PRIMARY KEY CLUSTERED ([SYSTEM_ID] ASC, [PO_NO] ASC, [PO_LINE] ASC)
);

