CREATE TABLE [dbo].[MD_CURRENCY] (
    [CURRENCY]    [dbo].[N_CURRENCY] NOT NULL,
    [NAME]        [dbo].[N_C100]     NULL,
    [CREATE_BY]   [dbo].[N_USER]     NULL,
    [CREATE_DATE] [dbo].[D_DATE]     NULL,
    [UPDATE_BY]   [dbo].[N_USER]     NULL,
    [UPDATE_DATE] [dbo].[D_DATE]     NULL,
    CONSTRAINT [PK_CURRENCY] PRIMARY KEY CLUSTERED ([CURRENCY] ASC)
);

