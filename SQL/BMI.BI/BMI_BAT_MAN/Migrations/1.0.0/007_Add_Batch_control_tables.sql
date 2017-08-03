-- <Migration ID="147a43b7-c2c2-472d-80a6-f296704eefdc" />
GO

PRINT N'Creating schemas'
GO
CREATE SCHEMA [ics]
AUTHORIZATION [dbo]
GO
PRINT N'Creating [privy].[Batch]'
GO
CREATE TABLE [privy].[Batch]
(
[BatchId] [int] NOT NULL,
[BatchName] [varchar] (100) NOT NULL,
[IcrtProcessName] [varchar] (100) NOT NULL CONSTRAINT [DF_privy_Batch_IcrtProcessName] DEFAULT (''),
[IsDisabled] [bit] NOT NULL CONSTRAINT [DF_privy_Batch_IsDisabled] DEFAULT ((0)),
[Narrative] [varchar] (500) NOT NULL CONSTRAINT [DF_privy_Batch_Narrative] DEFAULT (''),
[StartCapturePointOverride] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK_privy_Batch] on [privy].[Batch]'
GO
ALTER TABLE [privy].[Batch] ADD CONSTRAINT [PK_privy_Batch] PRIMARY KEY CLUSTERED  ([BatchId])
GO
PRINT N'Adding constraints to [privy].[Batch]'
GO
ALTER TABLE [privy].[Batch] ADD CONSTRAINT [AK_privy_Batch_BatchName] UNIQUE NONCLUSTERED  ([BatchId])
GO
PRINT N'Creating index [NDX_UNQ_privy_Batch_IcrtProcessName] on [privy].[Batch]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [NDX_UNQ_privy_Batch_IcrtProcessName] ON [privy].[Batch] ([IcrtProcessName]) WHERE ([IcrtProcessName]<>'')
GO
PRINT N'Creating [ics].[MappingConfigTask]'
GO
CREATE TABLE [ics].[MappingConfigTask]
(
[MappingConfigTaskId] [int] NOT NULL,
[MappingConfigTaskName] [varchar] (100) NOT NULL,
[MappingName] [varchar] (100) NOT NULL,
[Narrative] [varchar] (500) NOT NULL CONSTRAINT [DF_ics_MappingConfigTask_Narrative] DEFAULT ('')
)
GO
PRINT N'Creating primary key [PK_ics_MappingConfigTask] on [ics].[MappingConfigTask]'
GO
ALTER TABLE [ics].[MappingConfigTask] ADD CONSTRAINT [PK_ics_MappingConfigTask] PRIMARY KEY CLUSTERED  ([MappingConfigTaskId])
GO
PRINT N'Adding constraints to [ics].[MappingConfigTask]'
GO
ALTER TABLE [ics].[MappingConfigTask] ADD CONSTRAINT [AK_ics_MappingConfigTask_Name] UNIQUE NONCLUSTERED  ([MappingConfigTaskName], [MappingName])
GO
PRINT N'Creating [ics].[IcrtSubProcess]'
GO
CREATE TABLE [ics].[IcrtSubProcess]
(
[IcrtSubProcessId] [int] NOT NULL,
[BatchId] [int] NOT NULL,
[IcrtSubProcessName] [varchar] (100) NOT NULL,
[Narrative] [varchar] (500) NOT NULL CONSTRAINT [DF_ics_IcrtSubProcess_Narrative] DEFAULT ('')
)
GO
PRINT N'Creating primary key [PK_ics_IcrtSubProcess] on [ics].[IcrtSubProcess]'
GO
ALTER TABLE [ics].[IcrtSubProcess] ADD CONSTRAINT [PK_ics_IcrtSubProcess] PRIMARY KEY CLUSTERED  ([IcrtSubProcessId])
GO
PRINT N'Adding constraints to [ics].[IcrtSubProcess]'
GO
ALTER TABLE [ics].[IcrtSubProcess] ADD CONSTRAINT [AK_ics_IcrtSubProcess_Name] UNIQUE NONCLUSTERED  ([IcrtSubProcessName])
GO
PRINT N'Creating [privy].[BatchStep]'
GO
CREATE TABLE [privy].[BatchStep]
(
[BatchStepId] [int] NOT NULL,
[BatchStepName] [varchar] (100) NOT NULL,
[BatchId] [int] NOT NULL,
[Narrative] [varchar] (500) NOT NULL CONSTRAINT [DF_privy_BatchStep_Narrative] DEFAULT (''),
[IsDisabled] [bit] NOT NULL CONSTRAINT [DF_privy_BatchStep_IsDisabled] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_privy_BatchStep] on [privy].[BatchStep]'
GO
ALTER TABLE [privy].[BatchStep] ADD CONSTRAINT [PK_privy_BatchStep] PRIMARY KEY CLUSTERED  ([BatchStepId])
GO
PRINT N'Adding constraints to [privy].[BatchStep]'
GO
ALTER TABLE [privy].[BatchStep] ADD CONSTRAINT [AK_privy_BatchStep_BatchId_BatchStepName] UNIQUE NONCLUSTERED  ([BatchId], [BatchStepName])
GO
PRINT N'Creating [privy].[Thread]'
GO
CREATE TABLE [privy].[Thread]
(
[ThreadId] [int] NOT NULL,
[ThreadName] [varchar] (100) NOT NULL,
[BatchStepId] [int] NOT NULL,
[Narrative] [varchar] (500) NOT NULL CONSTRAINT [DF_privy_Thread_Narrative] DEFAULT (''),
[IsDisabled] [bit] NOT NULL CONSTRAINT [DF_privy_Thread_IsDisabled] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_privy_Thread] on [privy].[Thread]'
GO
ALTER TABLE [privy].[Thread] ADD CONSTRAINT [PK_privy_Thread] PRIMARY KEY CLUSTERED  ([ThreadId])
GO
PRINT N'Adding constraints to [privy].[Thread]'
GO
ALTER TABLE [privy].[Thread] ADD CONSTRAINT [AK_privy_Thread_BatchStepId_ThreadName] UNIQUE NONCLUSTERED  ([BatchStepId], [ThreadName])
GO
PRINT N'Adding foreign keys to [ics].[IcrtSubProcess]'
GO
ALTER TABLE [ics].[IcrtSubProcess] ADD CONSTRAINT [FK_ics_IcrtSubProcess_privy_Batch] FOREIGN KEY ([BatchId]) REFERENCES [privy].[Batch] ([BatchId])
GO
PRINT N'Adding foreign keys to [privy].[Thread]'
GO
ALTER TABLE [privy].[Thread] ADD CONSTRAINT [FK_privy_Thread_BatchStep] FOREIGN KEY ([BatchStepId]) REFERENCES [privy].[BatchStep] ([BatchStepId])
GO
PRINT N'Adding foreign keys to [privy].[BatchStep]'
GO
ALTER TABLE [privy].[BatchStep] ADD CONSTRAINT [FK_privy_BatchStep_Batch] FOREIGN KEY ([BatchId]) REFERENCES [privy].[Batch] ([BatchId])
GO
PRINT N'Altering permissions on SCHEMA:: [ics]'
GO
GRANT SELECT ON SCHEMA:: [ics] TO [BatchManagers]
GO
GRANT SELECT ON SCHEMA:: [ics] TO [EtlDevelopersDEV]
GO
GRANT SELECT ON SCHEMA:: [ics] TO [EtlDevelopersPROD]
GO
PRINT N'Altering permissions on SCHEMA:: [privy]'
GO
GRANT SELECT ON SCHEMA:: [privy] TO [BatchManagers]
GO
GRANT SELECT ON SCHEMA:: [privy] TO [BusinessAnalystsPROD]
GO
GRANT SELECT ON SCHEMA:: [privy] TO [EtlDevelopersPROD]
GO
