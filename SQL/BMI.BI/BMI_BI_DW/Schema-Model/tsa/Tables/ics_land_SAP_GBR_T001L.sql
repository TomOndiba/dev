CREATE TABLE [tsa].[ics_land_SAP_GBR_T001L]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T001L_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T001L_IsDuplicate] DEFAULT ((0)),
[MANDT] [nvarchar] (3) NULL,
[WERKS] [nvarchar] (4) NULL,
[LGORT] [nvarchar] (4) NULL,
[LGOBE] [nvarchar] (16) NULL,
[SPART] [nvarchar] (2) NULL,
[XLONG] [nvarchar] (1) NULL,
[XBUFX] [nvarchar] (1) NULL,
[DISKZ] [nvarchar] (1) NULL,
[XBLGO] [nvarchar] (1) NULL,
[XRESS] [nvarchar] (1) NULL,
[XHUPF] [nvarchar] (1) NULL,
[PARLG] [nvarchar] (4) NULL,
[VKORG] [nvarchar] (4) NULL,
[VTWEG] [nvarchar] (2) NULL,
[VSTEL] [nvarchar] (4) NULL,
[LIFNR] [nvarchar] (10) NULL,
[KUNNR] [nvarchar] (10) NULL,
[MESBS] [nvarchar] (60) NULL,
[MESST] [nvarchar] (1) NULL,
[OIH_LICNO] [nvarchar] (15) NULL,
[OIG_ITRFL] [nvarchar] (1) NULL,
[OIB_TNKASSIGN] [nvarchar] (1) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_GBR_T001L_1] ON [tsa].[ics_land_SAP_GBR_T001L] ([MANDT], [WERKS], [LGORT])
GO
