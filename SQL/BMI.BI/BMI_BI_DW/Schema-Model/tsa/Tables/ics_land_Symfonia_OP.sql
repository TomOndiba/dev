CREATE TABLE [tsa].[ics_land_Symfonia_OP]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_OP_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_OP_IsDuplicate] DEFAULT ((0)),
[datarozl] [datetime] NULL,
[flag] [smallint] NULL,
[id] [int] NULL,
[id_co] [int] NULL,
[id_transakcji] [int] NULL,
[ilosc] [float] NULL,
[ilosc_rozl] [float] NULL,
[kod] [varchar] (40) NULL,
[ok] [smallint] NULL,
[owner_base] [int] NULL,
[owner_id] [int] NULL,
[subtyp] [smallint] NULL,
[wartosc] [float] NULL,
[wartosc_rozl] [float] NULL
)
GO
