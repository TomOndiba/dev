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
ALTER TABLE [psa].[JobsExecutionDetails] ADD CONSTRAINT [PK_Id_JobsExecutionDetails] PRIMARY KEY CLUSTERED  ([Id])
GO
