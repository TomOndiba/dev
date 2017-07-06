CREATE TABLE [dbo].[FLEXSEARCH] (
    [SearchName]  [dbo].[N_C100]  NOT NULL,
    [Statement]   NVARCHAR (4000) NULL,
    [MASTERFELT]  [dbo].[N_C100]  NULL,
    [Caption]     [dbo].[N_C100]  NULL,
    [UPDATE_NY]   [dbo].[N_USER]  NOT NULL,
    [UPDATE_DATE] [dbo].[D_DATE]  NULL,
    CONSTRAINT [PK_FLEXSEARCH] PRIMARY KEY CLUSTERED ([SearchName] ASC)
);

