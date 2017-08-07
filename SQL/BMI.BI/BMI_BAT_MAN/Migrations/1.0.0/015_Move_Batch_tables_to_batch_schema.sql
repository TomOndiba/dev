-- <Migration ID="d271f747-6330-4c34-b84a-c2ebd86e2e56" />
GO

if objectpropertyex(object_id(N'[privy].[Thread]'), N'IsUserTable') is not null
	drop table [privy].[Thread]
go
if objectpropertyex(object_id(N'[privy].[BatchStep]'), N'IsUserTable') is not null
	drop table [privy].[BatchStep]
go
if objectpropertyex(object_id(N'[ics].[MappingConfigTask]'), N'IsUserTable') is not null
	drop table [ics].[MappingConfigTask]
go
if objectpropertyex(object_id(N'[ics].[IcrtSubProcess]'), N'IsUserTable') is not null
	drop table [ics].[IcrtSubProcess]
go
if objectpropertyex(object_id(N'[privy].[Batch]'), N'IsUserTable') is not null
	drop table [privy].[Batch]
go
if schema_id('batch') is null
	exec(N'create schema [batch] authorization [dbo];');
go

create table [batch].[Process]
(
  BatchProcessId int not null
, BatchProcessName varchar(100) not null
, IcrtProcessName varchar(100) not null constraint DF_batch_Process_IcrtProcessName default ('')
, IsDisabled bit not null constraint DF_batch_Process_IsDisabled default (0)
, Narrative varchar(500) not null constraint DF_batch_Process_Narrative default ('')
, StartCapturePointOverride datetime null
, constraint PK_batch_Process primary key clustered (BatchProcessId asc)
, constraint AK_batch_Process_BatchProcessName unique nonclustered (BatchProcessName asc)
) on [PRIMARY] ;
go
create unique nonclustered index [NDX_UNQ_batch_Process_IcrtProcessName]
    on batch.Process(IcrtProcessName) where (IcrtProcessName <> '');
go

exec sys.sp_addextendedproperty @name=N'MS_Description'
, @value=N'Container for an end-to-end ETL Batch Process e.g. "SAK UP", "SAP Germany", "Movex Denmark" or "M3 France" etc.  Effectively a container for a set of steps or instructions to load a particular set of data using one or more ETL tools which may be PowerCenter, SSIS, ICS or something else.'
, @level0type=N'SCHEMA',@level0name=N'batch', @level1type=N'TABLE',@level1name=N'Process'
go
exec sys.sp_addextendedproperty @name=N'MS_Description'
, @value=N'Database-specific unique identifier for an ETL Batch Process'
, @level0type=N'SCHEMA',@level0name=N'batch', @level1type=N'TABLE',@level1name=N'Process', @level2type=N'COLUMN',@level2name=N'BatchProcessId'
go
exec sys.sp_addextendedproperty @name=N'MS_Description'
, @value=N'Database-specific, business-friendly unique identifier for an ETL Batch Process'
, @level0type=N'SCHEMA',@level0name=N'batch', @level1type=N'TABLE',@level1name=N'Process', @level2type=N'COLUMN',@level2name=N'BatchProcessName'
go
exec sys.sp_addextendedproperty @name=N'MS_Description'
, @value=N'Unique identifier for the equivalent batch process within ICRT/ICS.  Must be unique when populated'
, @level0type=N'SCHEMA',@level0name=N'batch', @level1type=N'TABLE',@level1name=N'Process', @level2type=N'COLUMN',@level2name=N'IcrtProcessName'
go
exec sys.sp_addextendedproperty @name=N'MS_Description'
, @value=N'Indicates whether this job is disabled where 1 = TRUE and will not run (only when managed through the standard JLL SSIS runtime)'
, @level0type=N'SCHEMA',@level0name=N'batch', @level1type=N'TABLE',@level1name=N'Process', @level2type=N'COLUMN',@level2name=N'IsDisabled'
go
exec sys.sp_addextendedproperty @name=N'MS_Description'
, @value=N'The date FROM which (i.e. ">") to fetch/process data for all steps in the job - used to force a full load over a delta'
, @level0type=N'SCHEMA',@level0name=N'batch', @level1type=N'TABLE',@level1name=N'Process', @level2type=N'COLUMN',@level2name=N'StartCapturePointOverride'
go

create table [ics].[IcrtSubProcess]
(
  IcrtSubProcessId int not null
, BatchProcessId int not null
, IcrtSubProcessName varchar(100) not null
, Narrative varchar(500) constraint DF_ics_IcrtSubProcess_Narrative default ('') not null
, constraint PK_ics_IcrtSubProcess primary key clustered (IcrtSubProcessId)
, constraint AK_ics_IcrtSubProcess_Name unique nonclustered (IcrtSubProcessName)
, constraint FK_ics_IcrtSubProcess_batch_Process foreign key (BatchProcessId) references batch.Process (BatchProcessId) 
) ;
go

execute sp_addextendedproperty N'MS_Description'
, N'Represents a uniquely named ICRT sub-process'
, N'SCHEMA', N'ics', N'TABLE', N'IcrtSubProcess' ;
go
execute sp_addextendedproperty N'MS_Description'
, N'Database-specific unique identifier for an ICRT sub-process'
, N'SCHEMA', N'ics', N'TABLE', N'IcrtSubProcess', N'COLUMN', N'IcrtSubProcessId' ;
go
execute sp_addextendedproperty N'MS_Description'
, N'The unique physical name of the ICRT sub-process'
, N'SCHEMA', N'ics', N'TABLE', N'IcrtSubProcess', N'COLUMN', N'IcrtSubProcessName' ;
go
execute sp_addextendedproperty N'MS_Description'
, N'Mandatory link to the database-specific unique identifier for the Batch Process of which this sub-process forms part'
, N'SCHEMA', N'ics', N'TABLE', N'IcrtSubProcess', N'COLUMN', N'BatchProcessId' ;
go

create table [ics].[MappingConfigTask]
(
	MappingConfigTaskId int not null
  , MappingConfigTaskName varchar(100) not null
  , MappingName varchar(100) not null
  , Narrative varchar(500) constraint DF_ics_MappingConfigTask_Narrative default ('') not null
  , constraint PK_ics_MappingConfigTask primary key clustered (MappingConfigTaskId)
  , constraint AK_ics_MappingConfigTask_Name unique nonclustered (MappingConfigTaskName, MappingName)
) ;
go

execute sp_addextendedproperty N'MS_Description'
, N'Represents a unique combination of a Mapping Configuration Task and a Mapping in ICS'
, N'SCHEMA', N'ics', N'TABLE', N'MappingConfigTask' ;
go
execute sp_addextendedproperty N'MS_Description'
, N'Database-specific unique identifier for an ICS Mapping Config Task'
, N'SCHEMA', N'ics', N'TABLE', N'MappingConfigTask', N'COLUMN', N'MappingConfigTaskId' ;
go
execute sp_addextendedproperty N'MS_Description'
, N'The unique physical name of the ICS Mapping Config Task'
, N'SCHEMA', N'ics', N'TABLE', N'MappingConfigTask', N'COLUMN', N'MappingConfigTaskName' ;
go
execute sp_addextendedproperty N'MS_Description'
, N'The physical name of the ICS Mapping contained in the ICS MappingsConfig Task'
, N'SCHEMA', N'ics', N'TABLE', N'MappingConfigTask', N'COLUMN', N'MappingName' ;
go


create table [batch].[Step]
(
  StepId int not null
, StepName varchar(100) not null
, BatchProcessId int not null
, IcrtSubProcessId int null
, Narrative varchar(500) constraint DF_privy_BatchStep_Narrative default ('') not null
, IsDisabled bit constraint DF_privy_BatchStep_IsDisabled default ((0)) not null
, constraint PK_batch_Step primary key clustered (StepId asc)
, constraint AK_batch_Step_BatchProcessId_StepName unique nonclustered (BatchProcessId asc, StepName asc)
, constraint FK_batch_Step_batch_Process foreign key (BatchProcessId) references batch.Process (BatchProcessId)
, constraint FK_batch_Step_ics_IcrtSubProcess foreign key (IcrtSubProcessId) references ics.IcrtSubProcess (IcrtSubProcessId)
) ;
go
create unique nonclustered index [NDX_UNQ_batch_Step_BatchProcessId_IcrtSubProcessId]
    on batch.Step(BatchProcessId, IcrtSubProcessId) where (IcrtSubProcessId is not null);
go
execute sp_addextendedproperty N'MS_Description'
, N'Represents one of one or more steps (a.k.a. sub-process) within an ETL batch process e.g. land Customer data, Load Sales Data, Remove Duplicates.  A Step consist of one or more threads which may run sequentially or in parallel.'
, N'SCHEMA', N'batch', N'TABLE', N'Step' ;
go
execute sp_addextendedproperty N'MS_Description'
, N'Database specific unique identifier for a single Batch Process Step'
, N'SCHEMA', N'batch', N'TABLE', N'Step', N'COLUMN', N'StepId' ;
go
execute sp_addextendedproperty N'MS_Description'
, N'User friendly name for a step, unique within a single batch process (and part of an alternate key with BatchProcessId)'
, N'SCHEMA', N'batch', N'TABLE', N'Step', N'COLUMN', N'StepName' ;
go
execute sp_addextendedproperty N'MS_Description'
, N'Mandatory link to the database-specific unique identifier for a Batch Process (and part of an alternate key with StepName)'
, N'SCHEMA', N'batch', N'TABLE', N'Step', N'COLUMN', N'BatchProcessId' ;
go
execute sp_addextendedproperty N'MS_Description'
, N'Optional link to the database-specific unique identifier for the ICRT sub-process that is responsible for running this step within a wider ICRT Process/Batch'
, N'SCHEMA', N'batch', N'TABLE', N'Step', N'COLUMN', N'IcrtSubProcessId' ;
go
execute sp_addextendedproperty N'MS_Description'
, N'Indicates whether this step is disabled (where 1 = TRUE)'
, N'SCHEMA', N'batch', N'TABLE', N'Step', N'COLUMN', N'IsDisabled' ;
go

create table [batch].[Thread]
(
  ThreadId int not null
, ThreadName varchar(100) not null
, StepId int not null
, MappingConfigTaskId int null
, Narrative varchar(500) constraint DF_privy_Thread_Narrative default ('') not null
, IsDisabled bit constraint DF_privy_Thread_IsDisabled default ((0)) not null
, constraint PK_batch_Thread primary key clustered (ThreadId asc)
, constraint AK_batch_Thread_StepId_ThreadName unique nonclustered (StepId asc, ThreadName asc)
, constraint FK_batch_Thread_batch_Step foreign key (StepId) references batch.Step (StepId)
, constraint FK_batch_BatchStep_ics_MappingConfigTask foreign key (MappingConfigTaskId) references ics.MappingConfigTask (MappingConfigTaskId)
) ;
go
execute sp_addextendedproperty N'MS_Description'
, N'Represents a single thread within a step of an ETL process, typically one thread is responsible for processing one table.'
, N'SCHEMA', N'batch', N'TABLE', N'Thread' ;
go
execute sp_addextendedproperty N'MS_Description'
, N'Database specific unique identifier for a single Thread'
, N'SCHEMA', N'batch', N'TABLE', N'Thread', N'COLUMN', N'ThreadId' ;
go
execute sp_addextendedproperty N'MS_Description'
, N'User friendly name for a thread, unique within a batch process step (and part of an alternate key with StepId)'
, N'SCHEMA', N'batch', N'TABLE', N'Thread', N'COLUMN', N'ThreadName' ;
go
execute sp_addextendedproperty N'MS_Description'
, N'Mandatory link to the database-specific unique identifier for a batch process step (and part of an alternate key with ThreadName)'
, N'SCHEMA', N'batch', N'TABLE', N'Thread', N'COLUMN', N'StepId' ;
go
execute sp_addextendedproperty N'MS_Description'
, N'Optional link to the database-specific unique identifier for the ICS Mapping Configuration Task/Mapping that is responsible for running this thread within a wider ICRT Sub-process/Step'
, N'SCHEMA', N'batch', N'TABLE', N'Thread', N'COLUMN', N'MappingConfigTaskId' ;
go
execute sp_addextendedproperty N'MS_Description'
, N'Indicates whether this thread is disabled (where 1 = TRUE)'
, N'SCHEMA', N'batch', N'TABLE', N'Thread', N'COLUMN', N'IsDisabled' ;
go
