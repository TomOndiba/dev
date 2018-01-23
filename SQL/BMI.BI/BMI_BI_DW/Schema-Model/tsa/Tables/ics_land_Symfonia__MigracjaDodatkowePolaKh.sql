CREATE TABLE [tsa].[ics_land_Symfonia__MigracjaDodatkowePolaKh]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia__MigracjaDodatkowePolaKh_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia__MigracjaDodatkowePolaKh_IsDuplicate] DEFAULT ((0)),
[id] [int] NULL,
[idkh] [int] NULL,
[nrpola] [smallint] NULL,
[opis] [varchar] (60) NULL
)
GO
