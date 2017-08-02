CREATE TABLE [tsa].[ICS_LAND_SAP_DEU_T001W]
(
[EtlBatchRunId] [int] NULL,
[EtlStepRunId] [int] NULL,
[EtlThreadRunId] [int] NULL,
[DataSourceKey] [int] NULL,
[EtlCreatedOn] [datetime] NULL,
[EtlCreatedBy] [varchar] (200) NULL,
[MANDT] [nvarchar] (3) NULL,
[WERKS] [nvarchar] (4) NULL,
[NAME1] [nvarchar] (30) NULL,
[BWKEY] [nvarchar] (4) NULL,
[KUNNR] [nvarchar] (10) NULL,
[LIFNR] [nvarchar] (10) NULL,
[FABKL] [nvarchar] (2) NULL,
[NAME2] [nvarchar] (30) NULL,
[STRAS] [nvarchar] (30) NULL,
[PFACH] [nvarchar] (10) NULL,
[PSTLZ] [nvarchar] (10) NULL,
[ORT01] [nvarchar] (25) NULL,
[EKORG] [nvarchar] (4) NULL,
[VKORG] [nvarchar] (4) NULL,
[CHAZV] [nvarchar] (1) NULL,
[KKOWK] [nvarchar] (1) NULL,
[KORDB] [nvarchar] (1) NULL,
[BEDPL] [nvarchar] (1) NULL,
[LAND1] [nvarchar] (3) NULL,
[REGIO] [nvarchar] (3) NULL,
[COUNC] [nvarchar] (3) NULL,
[CITYC] [nvarchar] (4) NULL,
[ADRNR] [nvarchar] (10) NULL,
[IWERK] [nvarchar] (4) NULL,
[TXJCD] [nvarchar] (15) NULL,
[VTWEG] [nvarchar] (2) NULL,
[SPART] [nvarchar] (2) NULL,
[SPRAS] [nvarchar] (1) NULL,
[WKSOP] [nvarchar] (1) NULL,
[AWSLS] [nvarchar] (6) NULL,
[CHAZV_OLD] [nvarchar] (1) NULL,
[VLFKZ] [nvarchar] (1) NULL,
[BZIRK] [nvarchar] (6) NULL,
[ZONE1] [nvarchar] (10) NULL,
[TAXIW] [nvarchar] (1) NULL,
[BZQHL] [nvarchar] (1) NULL,
[LET01] [decimal] (3, 0) NULL,
[LET02] [decimal] (3, 0) NULL,
[LET03] [decimal] (3, 0) NULL,
[TXNAM_MA1] [nvarchar] (16) NULL,
[TXNAM_MA2] [nvarchar] (16) NULL,
[TXNAM_MA3] [nvarchar] (16) NULL,
[BETOL] [nvarchar] (3) NULL,
[J_1BBRANCH] [nvarchar] (4) NULL,
[VTBFI] [nvarchar] (2) NULL,
[FPRFW] [nvarchar] (3) NULL,
[ACHVM] [nvarchar] (1) NULL,
[DVSART] [nvarchar] (1) NULL,
[NODETYPE] [nvarchar] (3) NULL,
[NSCHEMA] [nvarchar] (4) NULL,
[PKOSA] [nvarchar] (1) NULL,
[MISCH] [nvarchar] (1) NULL,
[MGVUPD] [nvarchar] (1) NULL,
[VSTEL] [nvarchar] (4) NULL,
[MGVLAUPD] [nvarchar] (1) NULL,
[MGVLAREVAL] [nvarchar] (1) NULL,
[SOURCING] [nvarchar] (1) NULL,
[OILIVAL] [nvarchar] (1) NULL,
[OIHVTYPE] [nvarchar] (1) NULL,
[OIHCREDIPI] [nvarchar] (1) NULL,
[STORETYPE] [nvarchar] (1) NULL,
[DEP_STORE] [nvarchar] (4) NULL,
[EtlSourceTable] [varchar] (200) NOT NULL
)
GO
