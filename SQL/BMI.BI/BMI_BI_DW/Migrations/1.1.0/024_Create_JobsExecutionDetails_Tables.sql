-- <Migration ID="fb9cf612-89ab-46a6-913f-2b362c6b74e1" />
GO

PRINT N'Creating [tsa].[JobsExecutionDetails]'
GO
CREATE TABLE [tsa].[JobsExecutionDetails]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Action] [nvarchar] (10) NULL CONSTRAINT [JobLoggingDetail_Action_Start] DEFAULT ('RUN'),
[MCTName] [nvarchar] (100) NOT NULL,
[MCTStartTime] [datetime] NULL,
[MCTEndTime] [datetime] NULL,
[MCTTotalExecutionTime] [varchar] (25) NULL,
[SuccessSourceRows] [int] NULL,
[SuccessTargetRows] [int] NULL,
[FailedSourceRows] [int] NULL,
[FailedTargetRows] [int] NULL,
[CDCNoOfIteration] [int] NULL CONSTRAINT [JobsExecutionDetails_CDCNoOfIteration] DEFAULT ((1)),
[DataSourceKey] [int] NOT NULL,
[DataSourceName] [nvarchar] (100) NOT NULL,
[SubjectArea] [nvarchar] (200) NOT NULL,
[OnCloudAgent] [nvarchar] (10) NOT NULL,
[ProcessName] [nvarchar] (200) NOT NULL,
[ScheduledTime] [nvarchar] (20) NOT NULL,
[ScheduleName] [nvarchar] (100) NOT NULL
)
GO
PRINT N'Creating primary key [PK_Id_JobsExecutionDetails] on [tsa].[JobsExecutionDetails]'
GO
ALTER TABLE [tsa].[JobsExecutionDetails] ADD CONSTRAINT [PK_Id_JobsExecutionDetails] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [psa].[JobsExecutionDetails]'
GO
CREATE TABLE [psa].[JobsExecutionDetails]
(
[Id] [int] NOT NULL,
[Action] [nvarchar] (10) NULL,
[MCTName] [nvarchar] (100) NOT NULL,
[MCTStartTime] [datetime] NULL,
[MCTEndTime] [datetime] NULL,
[MCTTotalExecutionTime] [varchar] (25) NULL,
[SuccessSourceRows] [int] NULL,
[SuccessTargetRows] [int] NULL,
[FailedSourceRows] [int] NULL,
[FailedTargetRows] [int] NULL,
[CDCNoOfIteration] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[DataSourceName] [nvarchar] (100) NOT NULL,
[SubjectArea] [nvarchar] (200) NOT NULL,
[OnCloudAgent] [nvarchar] (10) NOT NULL,
[ProcessName] [nvarchar] (200) NOT NULL,
[ScheduledTime] [nvarchar] (20) NOT NULL,
[ScheduleName] [nvarchar] (100) NOT NULL
)
GO
PRINT N'Creating primary key [PK_Id_JobsExecutionDetails] on [psa].[JobsExecutionDetails]'
GO
ALTER TABLE [psa].[JobsExecutionDetails] ADD CONSTRAINT [PK_Id_JobsExecutionDetails] PRIMARY KEY CLUSTERED  ([Id])
GO
