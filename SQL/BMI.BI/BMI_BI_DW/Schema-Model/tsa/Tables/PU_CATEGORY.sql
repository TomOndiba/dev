CREATE TABLE [tsa].[PU_CATEGORY]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[CATEGORY_ID] [int] NOT NULL,
[CATEGORY_NAME] [varchar] (100) NULL,
[PARENT_ID] [int] NULL,
[CREATE_BY] [varchar] (100) NULL,
[CREATE_DATE] [datetime] NULL,
[UPDATE_BY] [varchar] (100) NULL,
[UPDATE_DATE] [datetime] NULL,
[Flag] [int] NULL CONSTRAINT [DF__PU_CATEGOR__Flag__572B40D2] DEFAULT ((0)),
[ProductHierCombined] [nvarchar] (max) NULL,
[ProductHier1] [nvarchar] (200) NULL,
[ProductHier2] [nvarchar] (200) NULL,
[ProductHier3] [nvarchar] (200) NULL,
[ProductHier4] [nvarchar] (200) NULL,
[ProductHier5] [nvarchar] (200) NULL,
[ProductHier6] [nvarchar] (255) NULL,
[ProductHier7] [nvarchar] (255) NULL
)
GO
ALTER TABLE [tsa].[PU_CATEGORY] ADD CONSTRAINT [PK_PU_CATEGORY_1] PRIMARY KEY CLUSTERED  ([CATEGORY_ID])
GO
