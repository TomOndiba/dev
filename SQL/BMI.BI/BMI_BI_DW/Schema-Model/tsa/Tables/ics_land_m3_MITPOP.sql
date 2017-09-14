CREATE TABLE [tsa].[ics_land_m3_MITPOP]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_m3_MITPOP_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_m3_MITPOP_IsDuplicate] DEFAULT ((0)),
[MPCONO] [decimal] (3, 0) NULL,
[MPALWT] [decimal] (2, 0) NULL,
[MPALWQ] [nvarchar] (255) NULL,
[MPITNO] [nvarchar] (255) NULL,
[MPPOPN] [nvarchar] (255) NULL,
[MPE0PA] [nvarchar] (255) NULL,
[MPVFDT] [decimal] (8, 0) NULL,
[MPLVDT] [decimal] (8, 0) NULL,
[MPCNQT] [decimal] (15, 6) NULL,
[MPALUN] [nvarchar] (255) NULL,
[MPORCO] [nvarchar] (255) NULL,
[MPSEQN] [decimal] (7, 0) NULL,
[MPREMK] [nvarchar] (255) NULL,
[MPCFIN] [decimal] (10, 0) NULL,
[MPTXID] [decimal] (13, 0) NULL,
[MPSEA1] [nvarchar] (255) NULL,
[MPATPE] [nvarchar] (255) NULL,
[MPATNR] [decimal] (17, 0) NULL,
[MPRGDT] [decimal] (8, 0) NULL,
[MPRGTM] [decimal] (6, 0) NULL,
[MPLMDT] [decimal] (8, 0) NULL,
[MPCHNO] [decimal] (3, 0) NULL,
[MPCHID] [nvarchar] (255) NULL,
[MPLMTS] [decimal] (18, 0) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3_MITPOP_1] ON [tsa].[ics_land_m3_MITPOP] ([MPALWT], [MPCONO], [MPE0PA], [MPITNO], [MPPOPN], [MPVFDT])
GO
