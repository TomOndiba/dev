CREATE TABLE [tsa].[ics_land_Symfonia_TR]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_TR_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_TR_IsDuplicate] DEFAULT ((0)),
[data] [datetime] NULL,
[datarozl] [datetime] NULL,
[dzial] [int] NULL,
[flag] [smallint] NULL,
[id] [int] NULL,
[id_komu] [int] NULL,
[id_kto] [int] NULL,
[kod] [varchar] (40) NULL,
[nrozl_oper] [int] NULL,
[nrozlilosc] [int] NULL,
[ok] [smallint] NULL,
[owner_base] [int] NULL,
[owner_id] [int] NULL,
[status] [smallint] NULL,
[subtyp] [smallint] NULL,
[termin] [datetime] NULL,
[typ] [smallint] NULL,
[wartosc] [float] NULL,
[wartosc_rozl] [float] NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_TR_1] ON [tsa].[ics_land_Symfonia_TR] ([id])
GO
