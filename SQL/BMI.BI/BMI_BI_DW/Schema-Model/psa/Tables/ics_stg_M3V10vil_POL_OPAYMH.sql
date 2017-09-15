CREATE TABLE [psa].[ics_stg_M3V10vil_POL_OPAYMH]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_OPAYMH_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_OPAYMH_IsDuplicate] DEFAULT ((0)),
[UJACDT] [numeric] (18, 0) NULL,
[UJBKID] [nchar] (5) NULL,
[UJCDTT] [numeric] (18, 0) NULL,
[UJCHID] [nchar] (10) NULL,
[UJCHNO] [numeric] (18, 0) NULL,
[UJCKNO] [nchar] (15) NULL,
[UJCONO] [numeric] (18, 0) NOT NULL,
[UJCRTP] [numeric] (18, 0) NULL,
[UJCSHD] [nchar] (5) NULL,
[UJCUCD] [nchar] (3) NULL,
[UJCUNM] [nvarchar] (36) NULL,
[UJDIVI] [nchar] (3) NULL,
[UJFACI] [nchar] (3) NULL,
[UJLMDT] [numeric] (18, 0) NULL,
[UJPLNB] [numeric] (18, 0) NOT NULL,
[UJPMAM] [numeric] (18, 0) NULL,
[UJPMLA] [numeric] (18, 0) NULL,
[UJPMNB] [numeric] (18, 0) NOT NULL,
[UJPTST] [nchar] (2) NULL,
[UJPYCD] [nchar] (3) NULL,
[UJPYDT] [numeric] (18, 0) NULL,
[UJPYNO] [nchar] (10) NULL,
[UJRAPM] [numeric] (18, 0) NULL,
[UJRGDT] [numeric] (18, 0) NULL,
[UJRGTM] [numeric] (18, 0) NULL,
[UJVONO] [numeric] (18, 0) NULL,
[UJVSER] [nchar] (3) NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OPAYMH] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_OPAYMH] PRIMARY KEY CLUSTERED  ([UJCONO], [UJPLNB], [UJPMNB])
GO
