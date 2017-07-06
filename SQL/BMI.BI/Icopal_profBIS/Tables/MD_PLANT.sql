CREATE TABLE [dbo].[MD_PLANT] (
    [PLANT_ID]          [dbo].[D_INT]       NOT NULL,
    [PLANT_NAME]        [dbo].[N_C50]       NULL,
    [PLANT_DESCRIPTION] [dbo].[N_C100]      NULL,
    [SBU]               [dbo].[N_SBU]       NULL,
    [PLANT_ACTIVE]      [dbo].[N_BOOLEAN_Y] NULL,
    [SYSTEM_ID]         [dbo].[D_INT]       NULL,
    [LANGUAGE]          [dbo].[N_C4]        NULL,
    [CREATE_BY]         [dbo].[N_USER]      NULL,
    [CREATE_DATE]       [dbo].[D_DATE]      NULL,
    [UPDATE_BY]         [dbo].[N_USER]      NULL,
    [UPDATE_DATE]       [dbo].[D_DATE]      NULL,
    CONSTRAINT [PK_MD_PLANT] PRIMARY KEY CLUSTERED ([PLANT_ID] ASC),
    CONSTRAINT [FK_MD_PLANT_MD_SBU] FOREIGN KEY ([SBU]) REFERENCES [dbo].[MD_SBU] ([SBU]) ON DELETE CASCADE
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MD_PLANT]
    ON [dbo].[MD_PLANT]([PLANT_NAME] ASC);

