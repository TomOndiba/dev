CREATE TABLE [dbo].[PU_SUPPLIER_BACKUP] (
    [SUPPLIER_ID]       [dbo].[D_INT]       NOT NULL,
    [SUPPLIER_NAME]     [dbo].[N_C100]      NULL,
    [ADDRESS1]          [dbo].[N_C100]      NULL,
    [ADDRESS2]          [dbo].[N_C100]      NULL,
    [ADDRESS3]          [dbo].[N_C100]      NULL,
    [ZIPCODE]           [dbo].[N_C100]      NULL,
    [CITY]              [dbo].[N_C100]      NULL,
    [COUNTRY]           [dbo].[N_C50]       NULL,
    [INTERNAL_SUPPLIER] [dbo].[N_BOOLEAN_N] NULL,
    [NACE_ID]           [dbo].[N_C20]       NULL,
    [CREATE_DATE]       [dbo].[D_DATE]      NULL,
    [CREATE_BY]         [dbo].[N_USER]      NULL,
    [UPDATE_DATE]       [dbo].[D_DATE]      NULL,
    [UPDATE_BY]         [dbo].[N_USER]      NULL,
    CONSTRAINT [PK_PU_SUPPLIER_BACKUP] PRIMARY KEY CLUSTERED ([SUPPLIER_ID] ASC)
);

