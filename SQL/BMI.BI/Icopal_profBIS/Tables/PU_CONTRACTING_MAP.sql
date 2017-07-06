CREATE TABLE [dbo].[PU_CONTRACTING_MAP] (
    [SYSTEM_ID]            [dbo].[D_INT]     NULL,
    [SBU]                  [dbo].[N_SBU]     NULL,
    [SITE_ID]              [dbo].[D_INT]     NULL,
    [PROJECT_ELEMENT]      [dbo].[N_C50]     NULL,
    [PROJECT_ELEMENT_NAME] [dbo].[N_C100]    NULL,
    [SUPPLIER_CODE]        [dbo].[N_C50]     NULL,
    [SUPPLIER_NAME]        [dbo].[N_C100]    NULL,
    [CATEGORY_ID]          [dbo].[D_INT]     NULL,
    [RecordCount]          [dbo].[D_INT]     NULL,
    [AmountGroup]          [dbo].[D_DEC12.2] NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_PU_CONTRACTING_MAP]
    ON [dbo].[PU_CONTRACTING_MAP]([SYSTEM_ID] ASC, [PROJECT_ELEMENT] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_PU_CONTRACTING_MAP_1]
    ON [dbo].[PU_CONTRACTING_MAP]([SYSTEM_ID] ASC, [SBU] ASC);

