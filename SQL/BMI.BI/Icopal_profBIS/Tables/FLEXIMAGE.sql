CREATE TABLE [dbo].[FLEXIMAGE] (
    [IMAGE_ID]          [dbo].[D_INT]  NOT NULL,
    [IMAGE_DATA]        IMAGE          NULL,
    [IMAGE_DESCRIPTION] [dbo].[N_C100] NULL,
    [IMAGE_FILENAME]    [dbo].[N_C100] NULL,
    [UPDATE_BY]         [dbo].[N_USER] NULL,
    [UPDATE_DATE]       [dbo].[D_DATE] NULL,
    CONSTRAINT [PK_FLEXIMAGE] PRIMARY KEY CLUSTERED ([IMAGE_ID] ASC)
);

