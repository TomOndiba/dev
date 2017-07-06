CREATE TABLE [dbo].[FLEXCONSTRAINTERRORS] (
    [ConstraintName] [dbo].[N_C100] NOT NULL,
    [FORMAAL]        [dbo].[N_MEMO] NULL,
    [UpdateError]    [dbo].[N_MEMO] NULL,
    [InsertError]    [dbo].[N_MEMO] NULL,
    [DeleteError]    [dbo].[N_MEMO] NULL,
    [OtherError]     [dbo].[N_MEMO] NULL,
    [FieldName]      [dbo].[N_C100] NULL,
    [UPDATE_BY]      [dbo].[N_USER] NULL,
    [UPDATE_DATE]    [dbo].[D_DATE] NULL,
    CONSTRAINT [PK_FLEXCONSTRAINTERRORS] PRIMARY KEY CLUSTERED ([ConstraintName] ASC)
);

