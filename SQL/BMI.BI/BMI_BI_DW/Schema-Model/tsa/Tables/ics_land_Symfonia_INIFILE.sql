CREATE TABLE [tsa].[ics_land_Symfonia_INIFILE]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_INIFILE_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_INIFILE_IsDuplicate] DEFAULT ((0)),
[klucz] [varchar] (100) NULL,
[napis] [varchar] (256) NULL,
[plik] [varchar] (100) NULL,
[sekcja] [varchar] (100) NULL
)
GO
