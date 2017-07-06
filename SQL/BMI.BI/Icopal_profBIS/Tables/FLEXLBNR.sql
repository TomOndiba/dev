CREATE TABLE [dbo].[FLEXLBNR] (
    [LbnrType]    [dbo].[N_C50]  NOT NULL,
    [Lbnr]        [dbo].[D_INT]  NULL,
    [Beskrivelse] [dbo].[N_MEMO] NULL,
    CONSTRAINT [PK_FLEXLBNR] PRIMARY KEY CLUSTERED ([LbnrType] ASC)
);

