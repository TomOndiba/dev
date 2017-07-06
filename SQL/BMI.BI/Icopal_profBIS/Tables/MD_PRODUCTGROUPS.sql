CREATE TABLE [dbo].[MD_PRODUCTGROUPS] (
    [PRODUCT_GROUP]        [dbo].[N_C100]      NOT NULL,
    [UOM]                  [dbo].[N_C20]       NULL,
    [DESCRIPTION]          [dbo].[N_C100]      NULL,
    [UOM_CHECK_ONLY]       [dbo].[N_BOOLEAN_N] NULL,
    [UPDATE_BY]            [dbo].[N_USER]      NULL,
    [UPDATE_DATE]          [dbo].[D_DATE]      NULL,
    [CREATE_BY]            [dbo].[N_USER]      NULL,
    [CREATE_DATE]          [dbo].[D_DATE]      NULL,
    [PRODUCT_GROUP_BUDGET] [dbo].[N_C100]      NULL,
    CONSTRAINT [PK_MD_PRODUCTGROUPS] PRIMARY KEY CLUSTERED ([PRODUCT_GROUP] ASC),
    CONSTRAINT [FK_MD_PRODUCTGROUPS_MD_UNIT] FOREIGN KEY ([UOM]) REFERENCES [dbo].[MD_UNIT] ([UOM])
);

