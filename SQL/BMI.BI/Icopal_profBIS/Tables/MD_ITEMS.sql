CREATE TABLE [dbo].[MD_ITEMS] (
    [SYSTEM_ID]          [dbo].[D_INT]  NOT NULL,
    [ITEM_NO]            [dbo].[N_C50]  NOT NULL,
    [LOCAL_ITEM_NO]      [dbo].[N_C50]  NULL,
    [SUPPLIER_NO]        [dbo].[N_C50]  NULL,
    [ITEM_NAME]          [dbo].[N_C100] NULL,
    [ITEM_TYPE_ID]       [dbo].[D_INT]  NULL,
    [ITEM_PROD_TYPE_ID]  [dbo].[D_INT]  NULL,
    [ITEM_TYPE]          [dbo].[N_C50]  NULL,
    [ITEM_GNIT]          [dbo].[N_C50]  NULL,
    [ITEM_DESCRIPTION_1] [dbo].[N_C100] NULL,
    [ITEM_DESCRIPTION_2] [dbo].[N_C100] NULL,
    [SUPPLIER_ITEM_NAME] [dbo].[N_C100] NULL,
    [ITEM_GROUP_1]       [dbo].[N_C50]  NULL,
    [ITEM_GROUP_2]       [dbo].[N_C50]  NULL,
    [ITEM_GROUP_3]       [dbo].[N_C50]  NULL,
    [ITEM_GROUP_4]       [dbo].[N_C50]  NULL,
    [ITEM_GROUP_5]       [dbo].[N_C50]  NULL,
    [CREATE_DATE]        [dbo].[D_DATE] NULL,
    [CREATE_BY]          [dbo].[N_USER] NULL,
    [UPDATE_DATE]        [dbo].[D_DATE] NULL,
    [UPDATE_BY]          [dbo].[N_USER] NULL,
    CONSTRAINT [PK_MD_ITEMS] PRIMARY KEY CLUSTERED ([SYSTEM_ID] ASC, [ITEM_NO] ASC)
);



