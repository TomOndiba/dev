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
ALTER TABLE [tsa].[JobsExecutionDetails] ADD CONSTRAINT [PK_Id_JobsExecutionDetails] PRIMARY KEY CLUSTERED  ([Id])
GO
