CREATE TABLE [dbo].[MD_MATCH_RULES] (
    [MATCH_ID]         [dbo].[D_INT]       NOT NULL,
    [MATCH_TYPE]       [dbo].[N_C1]        NULL,
    [CATEGORY_ID]      [dbo].[D_INT]       NOT NULL,
    [MATCH_SORT_NO]    [dbo].[D_INT]       NULL,
    [SYSTEM_ID]        [dbo].[D_INT]       NOT NULL,
    [RULE_DESCRIPTION] [dbo].[N_C100]      NULL,
    [RULE_ACTIVE]      [dbo].[N_BOOLEAN_Y] NULL,
    [CREATE_BY]        [dbo].[N_USER]      NULL,
    [CREATE_DATE]      [dbo].[D_DATE]      NULL,
    [UPDATE_BY]        [dbo].[N_USER]      NULL,
    [UPDATE_DATE]      [dbo].[D_DATE]      NULL,
    CONSTRAINT [PK_MD_MATCH_RULES] PRIMARY KEY CLUSTERED ([MATCH_ID] ASC)
);

