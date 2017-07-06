CREATE TABLE [dbo].[MD_UNIT] (
    [UOM]         [dbo].[N_C20]     NOT NULL,
    [DESCRIPTION] [dbo].[N_C100]    NULL,
    [FACTOR]      [dbo].[D_DEC11.4] NULL,
    [FACTOR1_UOM] [dbo].[N_C20]     NULL,
    [CREATE_BY]   [dbo].[D_USER]    NULL,
    [CREATE_DATE] [dbo].[D_DATE]    NULL,
    [UPDATE_BY]   [dbo].[N_USER]    NULL,
    [UPDATE_DATE] [dbo].[D_DATE]    NULL,
    CONSTRAINT [PK_MD_UNIT] PRIMARY KEY CLUSTERED ([UOM] ASC)
);

