-- <Migration ID="58993c81-7c42-49c3-9dfd-db1c6a4d48c7" />
go

print N'Dropping extended properties'
go
exec sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'privy', 'TABLE', N'BatchStep', null, null
go
exec sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'privy', 'TABLE', N'BatchStep', 'COLUMN', N'BatchId'
go
exec sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'privy', 'TABLE', N'BatchStep', 'COLUMN', N'BatchStepId'
go
exec sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'privy', 'TABLE', N'BatchStep', 'COLUMN', N'BatchStepName'
go
exec sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'privy', 'TABLE', N'BatchStep', 'COLUMN', N'IsDisabled'
go
exec sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'privy', 'TABLE', N'Thread', null, null
go
exec sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'privy', 'TABLE', N'Thread', 'COLUMN', N'BatchStepId'
go
exec sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'privy', 'TABLE', N'Thread', 'COLUMN', N'IsDisabled'
go
exec sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'privy', 'TABLE', N'Thread', 'COLUMN', N'ThreadId'
go
exec sp_dropextendedproperty N'MS_Description', 'SCHEMA', N'privy', 'TABLE', N'Thread', 'COLUMN', N'ThreadName'
go
print N'Dropping foreign keys from [privy].[BatchStep]'
go
alter table [privy].[BatchStep] drop constraint [FK_privy_BatchStep_Batch]
go
print N'Dropping foreign keys from [privy].[Thread]'
go
alter table [privy].[Thread] drop constraint [FK_privy_Thread_BatchStep]
go
print N'Dropping constraints from [privy].[BatchStep]'
go
alter table [privy].[BatchStep] drop constraint [PK_privy_BatchStep]
go
print N'Dropping constraints from [privy].[BatchStep]'
go
alter table [privy].[BatchStep] drop constraint [AK_privy_BatchStep_BatchId_BatchStepName]
go
print N'Dropping constraints from [privy].[BatchStep]'
go
alter table [privy].[BatchStep] drop constraint [DF_privy_BatchStep_Narrative]
go
print N'Dropping constraints from [privy].[BatchStep]'
go
alter table [privy].[BatchStep] drop constraint [DF_privy_BatchStep_IsDisabled]
go
print N'Dropping constraints from [privy].[Thread]'
go
alter table [privy].[Thread] drop constraint [PK_privy_Thread]
go
print N'Dropping constraints from [privy].[Thread]'
go
alter table [privy].[Thread] drop constraint [AK_privy_Thread_BatchStepId_ThreadName]
go
print N'Dropping constraints from [privy].[Thread]'
go
alter table [privy].[Thread] drop constraint [DF_privy_Thread_Narrative]
go
print N'Dropping constraints from [privy].[Thread]'
go
alter table [privy].[Thread] drop constraint [DF_privy_Thread_IsDisabled]
go
print N'Rebuilding [privy].[BatchStep]'
go
create table [privy].[RG_Recovery_1_BatchStep]
(
[BatchStepId] [int] not null,
[BatchStepName] [varchar] (100) not null,
[BatchId] [int] not null,
[IcrtSubProcessId] [int] null,
[Narrative] [varchar] (500) not null constraint [DF_privy_BatchStep_Narrative] default (''),
[IsDisabled] [bit] not null constraint [DF_privy_BatchStep_IsDisabled] default ((0))
)
go
insert into [privy].[RG_Recovery_1_BatchStep]
(
	[BatchStepId]
  , [BatchStepName]
  , [BatchId]
  , [Narrative]
  , [IsDisabled]
)
select
	[BatchStepId]
  , [BatchStepName]
  , [BatchId]
  , [Narrative]
  , [IsDisabled]
from
	[privy].[BatchStep] ;
go
drop table [privy].[BatchStep]
go
exec sp_rename N'[privy].[RG_Recovery_1_BatchStep]', N'BatchStep', N'OBJECT'
go
print N'Creating primary key [PK_privy_BatchStep] on [privy].[BatchStep]'
go
alter table [privy].[BatchStep] add constraint [PK_privy_BatchStep] primary key clustered  ([BatchStepId])
go
print N'Adding constraints to [privy].[BatchStep]'
go
alter table [privy].[BatchStep] add constraint [AK_privy_BatchStep_BatchId_BatchStepName] unique nonclustered  ([BatchId], [BatchStepName])
go
print N'Rebuilding [privy].[Thread]'
go
create table [privy].[RG_Recovery_2_Thread]
(
[ThreadId] [int] not null,
[ThreadName] [varchar] (100) not null,
[BatchStepId] [int] not null,
[MappingConfigTaskId] [int] null,
[Narrative] [varchar] (500) not null constraint [DF_privy_Thread_Narrative] default (''),
[IsDisabled] [bit] not null constraint [DF_privy_Thread_IsDisabled] default ((0))
)
go
insert into [privy].[RG_Recovery_2_Thread]
(
	[ThreadId]
  , [ThreadName]
  , [BatchStepId]
  , [Narrative]
  , [IsDisabled]
)
select
	[ThreadId]
  , [ThreadName]
  , [BatchStepId]
  , [Narrative]
  , [IsDisabled]
from
	[privy].[Thread] ;
go
drop table [privy].[Thread]
go
exec sp_rename N'[privy].[RG_Recovery_2_Thread]', N'Thread', N'OBJECT'
go
print N'Creating primary key [PK_privy_Thread] on [privy].[Thread]'
go
alter table [privy].[Thread] add constraint [PK_privy_Thread] primary key clustered  ([ThreadId])
go
print N'Adding constraints to [privy].[Thread]'
go
alter table [privy].[Thread] add constraint [AK_privy_Thread_BatchStepId_ThreadName] unique nonclustered  ([BatchStepId], [ThreadName])
go
print N'Adding foreign keys to [privy].[BatchStep]'
go
alter table [privy].[BatchStep] add constraint [FK_privy_BatchStep_ics_IcrtSubProcess] foreign key ([IcrtSubProcessId]) references [ics].[IcrtSubProcess] ([IcrtSubProcessId])
go
alter table [privy].[BatchStep] add constraint [FK_privy_BatchStep_privy_Batch] foreign key ([BatchId]) references [privy].[Batch] ([BatchId])
go
print N'Adding foreign keys to [privy].[Thread]'
go
alter table [privy].[Thread] add constraint [FK_privy_Thread_BatchStep] foreign key ([BatchStepId]) references [privy].[BatchStep] ([BatchStepId])
go
alter table [privy].[Thread] add constraint [FK_privy_BatchStep_ics_MappingConfigTask] foreign key ([MappingConfigTaskId]) references [ics].[MappingConfigTask] ([MappingConfigTaskId])
go
print N'Creating extended properties'
go
exec sp_addextendedproperty N'MS_Description', N'Represents one of one or more batch steps (a.k.a. sub-process) within an ETL process e.g. land Customer data, Load Sales Data, Remove Duplicates.  A Batch Step consist of one or more threads which may run sequentially or in parallel.', 'SCHEMA', N'privy', 'TABLE', N'BatchStep', null, null
go
exec sp_addextendedproperty N'MS_Description', N'Mandatory link to the database-specific unique identifier for a Batch (and part of an alternate key with BatchStepName)', 'SCHEMA', N'privy', 'TABLE', N'BatchStep', 'COLUMN', N'BatchId'
go
exec sp_addextendedproperty N'MS_Description', N'Database specific unique identifier for a single Batch Step', 'SCHEMA', N'privy', 'TABLE', N'BatchStep', 'COLUMN', N'BatchStepId'
go
exec sp_addextendedproperty N'MS_Description', N'User friendly name for a batch step, unique within a single batch (and part of an alternate key with BatchId)', 'SCHEMA', N'privy', 'TABLE', N'BatchStep', 'COLUMN', N'BatchStepName'
go
exec sp_addextendedproperty N'MS_Description', N'Optional link to the database-specific unique identifier for the ICRT sub-process that is responsible for running this step within a wider ICRT Process/Batch', 'SCHEMA', N'privy', 'TABLE', N'BatchStep', 'COLUMN', N'IcrtSubProcessId'
go
exec sp_addextendedproperty N'MS_Description', N'Indicates whether this batch step is disabled (where 1 = TRUE)', 'SCHEMA', N'privy', 'TABLE', N'BatchStep', 'COLUMN', N'IsDisabled'
go
exec sp_addextendedproperty N'MS_Description', N'Represents a single thread within a step of an ETL process, typically one thread is responsible for processing one table.', 'SCHEMA', N'privy', 'TABLE', N'Thread', null, null
go
exec sp_addextendedproperty N'MS_Description', N'Mandatory link to the database-specific unique identifier for a BatchStep (and part of an alternate key with ThreadName)', 'SCHEMA', N'privy', 'TABLE', N'Thread', 'COLUMN', N'BatchStepId'
go
exec sp_addextendedproperty N'MS_Description', N'Indicates whether this thread is disabled (where 1 = TRUE)', 'SCHEMA', N'privy', 'TABLE', N'Thread', 'COLUMN', N'IsDisabled'
go
exec sp_addextendedproperty N'MS_Description', N'Optional link to the database-specific unique identifier for the ICS Mapping Configuration Task/Mapping that is responsible for running this thread within a wider ICRT Sub-process/Step', 'SCHEMA', N'privy', 'TABLE', N'Thread', 'COLUMN', N'MappingConfigTaskId'
go
exec sp_addextendedproperty N'MS_Description', N'Database specific unique identifier for a single Thread', 'SCHEMA', N'privy', 'TABLE', N'Thread', 'COLUMN', N'ThreadId'
go
exec sp_addextendedproperty N'MS_Description', N'User friendly name for a thread, unique within a batch step (and part of an alternate key with BatchStepId)', 'SCHEMA', N'privy', 'TABLE', N'Thread', 'COLUMN', N'ThreadName'
go
