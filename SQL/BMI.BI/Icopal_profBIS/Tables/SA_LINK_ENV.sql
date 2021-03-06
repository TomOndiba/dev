﻿CREATE TABLE [dbo].[SA_LINK_ENV] (
    [ENV_CATEGORY_ID] [dbo].[D_INT]  NOT NULL,
    [SYSTEM_ID]       [dbo].[D_INT]  NOT NULL,
    [ITEM_NO]         [dbo].[N_C50]  NOT NULL,
    [MATCH_ID]        [dbo].[D_INT]  NULL,
    [CREATE_BY]       [dbo].[N_USER] NULL,
    [CREATE_DATE]     [dbo].[D_DATE] NULL,
    CONSTRAINT [PK_SA_LINK_ENV_CATEGORY_1] PRIMARY KEY CLUSTERED ([ENV_CATEGORY_ID] ASC, [SYSTEM_ID] ASC, [ITEM_NO] ASC),
    CONSTRAINT [FK_SA_LINK_ENV_CATEGORY_MD_SYSTEMID] FOREIGN KEY ([SYSTEM_ID]) REFERENCES [dbo].[MD_SYSTEMID] ([SYSTEM_ID]),
    CONSTRAINT [FK_SA_LINK_ENV_CATEGORY_SA_ENV_CATEGORY] FOREIGN KEY ([ENV_CATEGORY_ID]) REFERENCES [dbo].[SA_ENV_CATEGORY] ([ENV_CATEGORY_ID])
);


GO
CREATE NONCLUSTERED INDEX [IX_SA_LINK_ENV_CATEGORY]
    ON [dbo].[SA_LINK_ENV]([SYSTEM_ID] ASC, [ITEM_NO] ASC);

