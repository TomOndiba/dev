-- <Migration ID="1a345c6e-3d35-475b-8c32-61c37ba3baa8" />
GO

if object_id('tsa.PU_CATEGORY', 'U') is not null
	drop table [tsa].[PU_CATEGORY];
	go

	
if object_id('tsa.PU_LINK_CATEGORY', 'U') is not null
	drop table [tsa].PU_LINK_CATEGORY;

	go

if object_id('tsa.DummyICS', 'U') is not null
	drop table tsa.DummyICS;
	go


PRINT N'Creating [tsa].[PU_CATEGORY]'
GO
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
PRINT N'Creating primary key [PK_PU_CATEGORY_1] on [tsa].[PU_CATEGORY]'
GO
ALTER TABLE [tsa].[PU_CATEGORY] ADD CONSTRAINT [PK_PU_CATEGORY_1] PRIMARY KEY CLUSTERED  ([CATEGORY_ID])
GO
PRINT N'Creating [tsa].[DummyICS]'
GO
CREATE TABLE [tsa].[DummyICS]
(
[DummyDelete] [nvarchar] (200) NULL,
[DummyUpdate] [nvarchar] (200) NULL,
[DummyInsert] [nvarchar] (200) NULL
)
GO
PRINT N'Creating [tsa].[PU_LINK_CATEGORY]'
GO
CREATE TABLE [tsa].[PU_LINK_CATEGORY]
(
[CATEGORY_ID] [int] NOT NULL,
[SYSTEM_ID] [int] NOT NULL,
[MATERIAL_CODE] [varchar] (50) NOT NULL,
[CREATE_BY] [varchar] (100) NULL,
[CREATE_DATE] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK_PU_LINK_CATEGORY_1] on [tsa].[PU_LINK_CATEGORY]'
GO
ALTER TABLE [tsa].[PU_LINK_CATEGORY] ADD CONSTRAINT [PK_PU_LINK_CATEGORY_1] PRIMARY KEY CLUSTERED  ([CATEGORY_ID], [SYSTEM_ID], [MATERIAL_CODE])
GO
