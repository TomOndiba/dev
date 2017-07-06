CREATE TABLE [dbo].[MD_SUB_SBU] (
    [SUB_SBU]         [dbo].[N_C50]       NOT NULL,
    [SBU]             [dbo].[N_SBU]       NULL,
    [CEX_RESPONSIBLE] [dbo].[N_USER]      NULL,
    [CEX_ACTIVE]      [dbo].[N_BOOLEAN_Y] NULL,
    [CREATE_DATE]     [dbo].[D_DATE]      NULL,
    [CREATE_BY]       [dbo].[N_USER]      NULL,
    CONSTRAINT [PK_MD_SUB_SBU] PRIMARY KEY CLUSTERED ([SUB_SBU] ASC),
    CONSTRAINT [FK_MD_SUB_SBU_MD_SBU] FOREIGN KEY ([SBU]) REFERENCES [dbo].[MD_SBU] ([SBU]) ON DELETE CASCADE ON UPDATE CASCADE
);

