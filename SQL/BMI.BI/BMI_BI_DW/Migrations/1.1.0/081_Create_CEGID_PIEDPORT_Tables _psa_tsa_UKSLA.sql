﻿-- <Migration ID="cca6bc31-3754-4c5a-9876-9d2c9d80b609" />
GO

DROP TABLE IF EXISTS [psa].[ics_stg_cegid_comp_fra_procure_PIEDPORT]
GO
PRINT N'Creating [psa].[ics_stg_cegid_comp_fra_procure_PIEDPORT]'
GO
CREATE TABLE [psa].[ics_stg_cegid_comp_fra_procure_PIEDPORT]
(
[EtlRecordId] [bigint] NOT NULL IDENTITY(1, 1),
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_cegid_comp_fra_procure_PIEDPORT_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_cegid_comp_fra_procure_PIEDPORT_IsIncomplete] DEFAULT ('N'),
[GPT_NATUREPIECEG] [int] NOT NULL,
[GPT_SOUCHE] [nvarchar] (3) NULL,
[GPT_NUMERO] [int] NOT NULL,
[GPT_INDICEG] [int] NULL,
[GPT_DEVISE] [nvarchar] (3) NULL,
[GPT_NUMPORT] [int] NOT NULL,
[GPT_CODEPORT] [nvarchar] (18) NULL,
[GPT_LIBELLE] [nvarchar] (70) NULL,
[GPT_TYPEFRAIS] [nvarchar] (3) NULL,
[GPT_TYPEPORT] [nvarchar] (3) NULL,
[GPT_COMPTAARTICLE] [nvarchar] (3) NULL,
[GPT_FAMILLETAXE1] [nvarchar] (3) NULL,
[GPT_FAMILLETAXE2] [nvarchar] (3) NULL,
[GPT_FAMILLETAXE3] [nvarchar] (3) NULL,
[GPT_FAMILLETAXE4] [nvarchar] (3) NULL,
[GPT_FAMILLETAXE5] [nvarchar] (3) NULL,
[GPT_BASEHT] [decimal] (19, 4) NULL,
[GPT_BASEHTDEV] [decimal] (19, 4) NULL,
[GPT_BASETTC] [decimal] (19, 4) NULL,
[GPT_BASETTCDEV] [decimal] (19, 4) NULL,
[GPT_POURCENT] [decimal] (19, 4) NULL,
[GPT_TOTALTAXE1] [decimal] (19, 4) NULL,
[GPT_TOTALTAXE2] [decimal] (19, 4) NULL,
[GPT_TOTALTAXE3] [decimal] (19, 4) NULL,
[GPT_TOTALTAXE4] [decimal] (19, 4) NULL,
[GPT_TOTALTAXE5] [decimal] (19, 4) NULL,
[GPT_TOTALTAXEDEV1] [decimal] (19, 4) NULL,
[GPT_TOTALTAXEDEV2] [decimal] (19, 4) NULL,
[GPT_TOTALTAXEDEV3] [decimal] (19, 4) NULL,
[GPT_TOTALTAXEDEV4] [decimal] (19, 4) NULL,
[GPT_TOTALTAXEDEV5] [decimal] (19, 4) NULL,
[GPT_VALEURHT] [decimal] (19, 4) NULL,
[GPT_VALEURHTDEV] [decimal] (19, 4) NULL,
[GPT_VALEURTTC] [decimal] (19, 4) NULL,
[GPT_VALEURTTCDEV] [decimal] (19, 4) NULL,
[GPT_TOTALHT] [decimal] (19, 4) NULL,
[GPT_TOTALHTDEV] [decimal] (19, 4) NULL,
[GPT_TOTALTTC] [decimal] (19, 4) NULL,
[GPT_TOTALTTCDEV] [decimal] (19, 4) NULL,
[GPT_MONTANTREALISE] [decimal] (19, 4) NULL,
[GPT_MINIMUM] [decimal] (19, 4) NULL,
[GPT_FRANCO] [nvarchar] (1) NULL,
[GPT_MONTANTMINI] [decimal] (19, 4) NULL,
[GPT_BLOQUEFRAIS] [nvarchar] (3) NULL,
[GPT_FACTURABLE] [nvarchar] (1) NULL,
[GPT_TIERSFRAIS] [nvarchar] (17) NULL,
[GPT_ORIGINE] [nvarchar] (17) NULL,
[GPT_MODEGROUPEPORT] [nvarchar] (3) NULL,
[GPT_VENTPIECE] [nvarchar] (3) NULL,
[GPT_REPARTITION] [nvarchar] (3) NULL,
[GPT_TYPEFOURNI] [nvarchar] (35) NULL,
[GPT_VENTCOMPTA] [nvarchar] (3) NULL,
[GPT_FRAISFACTURE] [nvarchar] (18) NULL,
[GPT_FACTUREFRAIS] [nvarchar] (1) NULL
)
GO
PRINT N'Creating primary key [PK_psa_ics_stg_cegid_comp_fra_procure_PIEDPORT] on [psa].[ics_stg_cegid_comp_fra_procure_PIEDPORT]'
GO
ALTER TABLE [psa].[ics_stg_cegid_comp_fra_procure_PIEDPORT] ADD CONSTRAINT [PK_psa_ics_stg_cegid_comp_fra_procure_PIEDPORT] PRIMARY KEY CLUSTERED  ([GPT_NUMERO], [GPT_NUMPORT], [GPT_NATUREPIECEG])
GO

PRINT N'Creating [tsa].[ics_land_cegid_poly_fra_procure_PIEDPORT]'
GO

DROP TABLE IF EXISTS psa.ics_land_cegid_poly_fra_procure_PIEDPORT
GO
CREATE TABLE [tsa].[ics_land_cegid_poly_fra_procure_PIEDPORT]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [nvarchar] (10) NOT NULL,
[EtlSourceTable] [nvarchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [nvarchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL,
[IsDuplicate] [bit] NOT NULL,
[GPT_NATUREPIECEG] [nvarchar] (3) NULL,
[GPT_SOUCHE] [nvarchar] (3) NULL,
[GPT_NUMERO] [int] NULL,
[GPT_INDICEG] [int] NULL,
[GPT_DEVISE] [nvarchar] (3) NULL,
[GPT_NUMPORT] [int] NULL,
[GPT_CODEPORT] [nvarchar] (18) NULL,
[GPT_LIBELLE] [nvarchar] (70) NULL,
[GPT_TYPEFRAIS] [nvarchar] (3) NULL,
[GPT_TYPEPORT] [nvarchar] (3) NULL,
[GPT_COMPTAARTICLE] [nvarchar] (3) NULL,
[GPT_FAMILLETAXE1] [nvarchar] (3) NULL,
[GPT_FAMILLETAXE2] [nvarchar] (3) NULL,
[GPT_FAMILLETAXE3] [nvarchar] (3) NULL,
[GPT_FAMILLETAXE4] [nvarchar] (3) NULL,
[GPT_FAMILLETAXE5] [nvarchar] (3) NULL,
[GPT_BASEHT] [decimal] (19, 4) NULL,
[GPT_BASEHTDEV] [decimal] (19, 4) NULL,
[GPT_BASETTC] [decimal] (19, 4) NULL,
[GPT_BASETTCDEV] [decimal] (19, 4) NULL,
[GPT_POURCENT] [decimal] (19, 4) NULL,
[GPT_TOTALTAXE1] [decimal] (19, 4) NULL,
[GPT_TOTALTAXE2] [decimal] (19, 4) NULL,
[GPT_TOTALTAXE3] [decimal] (19, 4) NULL,
[GPT_TOTALTAXE4] [decimal] (19, 4) NULL,
[GPT_TOTALTAXE5] [decimal] (19, 4) NULL,
[GPT_TOTALTAXEDEV1] [decimal] (19, 4) NULL,
[GPT_TOTALTAXEDEV2] [decimal] (19, 4) NULL,
[GPT_TOTALTAXEDEV3] [decimal] (19, 4) NULL,
[GPT_TOTALTAXEDEV4] [decimal] (19, 4) NULL,
[GPT_TOTALTAXEDEV5] [decimal] (19, 4) NULL,
[GPT_VALEURHT] [decimal] (19, 4) NULL,
[GPT_VALEURHTDEV] [decimal] (19, 4) NULL,
[GPT_VALEURTTC] [decimal] (19, 4) NULL,
[GPT_VALEURTTCDEV] [decimal] (19, 4) NULL,
[GPT_TOTALHT] [decimal] (19, 4) NULL,
[GPT_TOTALHTDEV] [decimal] (19, 4) NULL,
[GPT_TOTALTTC] [decimal] (19, 4) NULL,
[GPT_TOTALTTCDEV] [decimal] (19, 4) NULL,
[GPT_MONTANTREALISE] [decimal] (19, 4) NULL,
[GPT_MINIMUM] [decimal] (19, 4) NULL,
[GPT_FRANCO] [nvarchar] (1) NULL,
[GPT_MONTANTMINI] [decimal] (19, 4) NULL,
[GPT_BLOQUEFRAIS] [nvarchar] (3) NULL,
[GPT_FACTURABLE] [nvarchar] (1) NULL,
[GPT_TIERSFRAIS] [nvarchar] (17) NULL,
[GPT_ORIGINE] [nvarchar] (17) NULL,
[GPT_MODEGROUPEPORT] [nvarchar] (3) NULL,
[GPT_VENTPIECE] [nvarchar] (3) NULL,
[GPT_REPARTITION] [nvarchar] (3) NULL,
[GPT_TYPEFOURNI] [nvarchar] (35) NULL,
[GPT_VENTCOMPTA] [nvarchar] (3) NULL,
[GPT_FRAISFACTURE] [nvarchar] (18) NULL,
[GPT_FACTUREFRAIS] [nvarchar] (1) NULL
)
GO
GO
PRINT N'Creating primary key [PK_psa_ics_stg_cegid_poly_fra_procure_PIEDPORT] on [psa].[ics_stg_cegid_poly_fra_procure_PIEDPORT]'
GO
ALTER TABLE [psa].[ics_stg_cegid_poly_fra_procure_PIEDPORT] ADD CONSTRAINT [PK_psa_ics_stg_cegid_poly_fra_procure_PIEDPORT] PRIMARY KEY CLUSTERED  ([GPT_NUMERO], [GPT_NUMPORT], [GPT_NATUREPIECEG])
GO
