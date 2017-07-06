CREATE TABLE [dbo].[FLEXUSERS] (
    [USERINITIALS]     [dbo].[N_USER]      NOT NULL,
    [NAME]             [dbo].[N_C100]      NOT NULL,
    [USERPASSWORD]     [dbo].[N_C20]       NULL,
    [PASSWORDDATE]     [dbo].[D_DATE]      NULL,
    [UPDATE_BY]        [dbo].[N_USER]      NOT NULL,
    [UPDATE_DATE]      [dbo].[D_DATE]      NULL,
    [COMPANY]          [dbo].[N_C20]       NULL,
    [LANGUAG_]         [dbo].[N_LANGUAGE]  NULL,
    [MENUNAME]         [dbo].[N_C100]      NULL,
    [LOCKED]           [dbo].[N_BOOLEAN_N] NULL,
    [FORCENEWPASSWORD] [dbo].[N_BOOLEAN_N] NULL,
    [BLANK_PASSWORD]   [dbo].[N_BOOLEAN_N] NULL,
    [PRINTER]          [dbo].[N_C100]      NULL,
    [CHOICE]           [dbo].[N_BOOLEAN_N] NULL,
    [LOGONTYPE]        [dbo].[D_INT]       NULL,
    [EMAIL]            [dbo].[N_C100]      NULL,
    [ALL_SYSTEM]       [dbo].[N_BOOLEAN_N] NULL,
    [ALL_SBU]          [dbo].[N_BOOLEAN_N] NULL,
    [LAST_LOGIN_DATE]  [dbo].[D_DATE]      NULL,
    CONSTRAINT [PK_FLEXUSERS] PRIMARY KEY CLUSTERED ([USERINITIALS] ASC),
    CONSTRAINT [FK_FLEXUSERS_FLEXMENUS] FOREIGN KEY ([MENUNAME]) REFERENCES [dbo].[FLEXMENUS] ([MENUNAME]) ON UPDATE CASCADE
);

