-- <Migration ID="c359601e-c28e-480f-a4e3-d75a8ed7378e" />
GO

PRINT N'Altering [tsa].[ics_land_SAP_GBR_MARM]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_MARM] ADD
[ReportingUnitOfMeasure] [nvarchar] (255) NULL
GO
PRINT N'Creating [tsa].[ics_land_baan_ttiitm004610]'
go


if object_id('[tsa].[ics_land_baan_ttiitm004610]', 'U') is not null
	drop table [tsa].[ics_land_baan_ttiitm004610] ;


CREATE TABLE [tsa].[ics_land_baan_ttiitm004610]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttiitm004610_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttiitm004610_IsDuplicate] DEFAULT ((0)),
[t_cprj] [nvarchar] (6) NULL,
[t_item] [nvarchar] (16) NULL,
[t_citg] [nvarchar] (6) NULL,
[t_basu] [nvarchar] (3) NULL,
[t_unit] [nvarchar] (3) NULL,
[t_conv] [float] NULL,
[t_rpow] [smallint] NULL,
[t_Refcntd] [int] NULL,
[t_Refcntu] [int] NULL
)
GO
