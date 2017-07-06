CREATE TABLE [dbo].[FLEXERRORREPORTS] (
    [USERINITIALS] [dbo].[N_USER]      NULL,
    [PROGRAMNAME]  [dbo].[N_C100]      NULL,
    [MESSAGETEXT]  [dbo].[N_MEMO]      NULL,
    [HANDLED]      [dbo].[N_BOOLEAN_N] NULL,
    [ERRORDATE]    [dbo].[D_DATE]      NULL,
    [HANDLEDDATE]  [dbo].[D_DATE]      NULL,
    [HANDLEDBY]    [dbo].[N_USER]      NULL
);

