CREATE TABLE [psa].[ics_stg_m3_FPLEDG]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_ics_land_m3_FPLEDG_IsDeleted] DEFAULT ((0)),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_ics_land_m3_FPLEDG_IsIncomplete] DEFAULT ((0)),
[EPACDT] [decimal] (8, 0) NULL,
[EPAPCD] [nvarchar] (255) NULL,
[EPAPRV] [decimal] (1, 0) NULL,
[EPARAT] [decimal] (11, 6) NULL,
[EPARCD] [decimal] (1, 0) NULL,
[EPBKID] [nvarchar] (255) NULL,
[EPBLBY] [nvarchar] (255) NULL,
[EPBLDT] [decimal] (8, 0) NULL,
[EPCHID] [nvarchar] (255) NULL,
[EPCHNO] [decimal] (3, 0) NULL,
[EPCONO] [decimal] (3, 0) NULL,
[EPCRTP] [decimal] (2, 0) NULL,
[EPCUAM] [decimal] (15, 2) NULL,
[EPCUCD] [nvarchar] (255) NULL,
[EPDCAM] [decimal] (1, 0) NULL,
[EPDEDA] [decimal] (8, 0) NULL,
[EPDIVI] [nvarchar] (255) NOT NULL,
[EPDUDT] [decimal] (8, 0) NULL,
[EPENME] [decimal] (1, 0) NULL,
[EPGEOC] [decimal] (9, 0) NULL,
[EPINYR] [decimal] (4, 0) NULL,
[EPIVBL] [decimal] (1, 0) NULL,
[EPIVCL] [nvarchar] (255) NULL,
[EPIVDT] [decimal] (8, 0) NULL,
[EPIVTP] [nvarchar] (255) NULL,
[EPJRNO] [decimal] (7, 0) NOT NULL,
[EPJSNO] [decimal] (7, 0) NOT NULL,
[EPLMDT] [decimal] (8, 0) NULL,
[EPLMTS] [decimal] (18, 0) NULL,
[EPPYME] [nvarchar] (255) NULL,
[EPPYRS] [nvarchar] (255) NULL,
[EPPYST] [decimal] (1, 0) NULL,
[EPPYTP] [nvarchar] (255) NULL,
[EPRECO] [decimal] (1, 0) NULL,
[EPREDE] [decimal] (8, 0) NULL,
[EPRGDT] [decimal] (8, 0) NULL,
[EPRGTM] [decimal] (6, 0) NULL,
[EPSINO] [nvarchar] (255) NULL,
[EPSLOP] [decimal] (2, 0) NULL,
[EPSPYN] [nvarchar] (255) NULL,
[EPSUCL] [nvarchar] (255) NULL,
[EPSUNO] [nvarchar] (255) NULL,
[EPTDCD] [nvarchar] (255) NULL,
[EPTDSC] [nvarchar] (255) NULL,
[EPTECD] [nvarchar] (255) NULL,
[EPTEPY] [nvarchar] (255) NULL,
[EPTRCD] [decimal] (2, 0) NULL,
[EPTXID] [decimal] (13, 0) NULL,
[EPTXIN] [decimal] (1, 0) NULL,
[EPVONO] [decimal] (8, 0) NULL,
[EPVSER] [nvarchar] (255) NULL,
[EPVTAM] [decimal] (15, 2) NULL,
[EPYEA4] [decimal] (4, 0) NOT NULL
)
GO
ALTER TABLE [psa].[ics_stg_m3_FPLEDG] ADD CONSTRAINT [PK_psa_ics_stg_m3_FPLEDG] PRIMARY KEY CLUSTERED  ([EPDIVI], [EPYEA4], [EPJRNO], [EPJSNO])
GO
