﻿CREATE TABLE [dbo].[AX_ORDER_CONFIRMATION_HISTORY] (
    [SYSTEM_ID]            [dbo].[D_INT]  NULL,
    [PO_NO]                [dbo].[N_C50]  NULL,
    [PO_LINE]              [dbo].[N_C50]  NULL,
    [CONFIRMATION_DATE]    [dbo].[D_DATE] NULL,
    [AGREED_DELIVERY_DATE] [dbo].[D_DATE] NULL,
    [CREATE_DATE]          [dbo].[D_DATE] NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_AX_ORDER_CONFIRMATION_HISTORY]
    ON [dbo].[AX_ORDER_CONFIRMATION_HISTORY]([SYSTEM_ID] ASC, [PO_NO] ASC, [PO_LINE] ASC);

