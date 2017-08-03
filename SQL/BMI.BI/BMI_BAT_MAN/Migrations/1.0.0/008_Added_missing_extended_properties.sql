-- <Migration ID="ac88f9b8-2ba8-4fca-8e5c-566fa6f5e2ef" />
GO

PRINT N'Creating extended properties'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Represents a uniquely named ICRT sub-process', 'SCHEMA', N'ics', 'TABLE', N'IcrtSubProcess', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory link to the database-specific unique identifier for the Batch of which this sub-process forms part', 'SCHEMA', N'ics', 'TABLE', N'IcrtSubProcess', 'COLUMN', N'BatchId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Database-specific unique identifier for an ICRT sub-process', 'SCHEMA', N'ics', 'TABLE', N'IcrtSubProcess', 'COLUMN', N'IcrtSubProcessId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The unique physical name of the ICRT sub-process', 'SCHEMA', N'ics', 'TABLE', N'IcrtSubProcess', 'COLUMN', N'IcrtSubProcessName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Represents a unique combination of a Mapping Configuration Task and a Mapping in ICS', 'SCHEMA', N'ics', 'TABLE', N'MappingConfigTask', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Database-specific unique identifier for an ICS Mapping Config Task', 'SCHEMA', N'ics', 'TABLE', N'MappingConfigTask', 'COLUMN', N'MappingConfigTaskId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The unique physical name of the ICS Mapping Config Task', 'SCHEMA', N'ics', 'TABLE', N'MappingConfigTask', 'COLUMN', N'MappingConfigTaskName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The physical name of the ICS Mapping contained in the ICS MappingsConfig Task', 'SCHEMA', N'ics', 'TABLE', N'MappingConfigTask', 'COLUMN', N'MappingName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Represents one of one or more batch steps (a.k.a. sub-process) within an ETL process e.g. land Customer data, Load Sales Data, Remove Duplicates.  A Batch Step consist of one or more threads which may run sequentially or in parallel.', 'SCHEMA', N'privy', 'TABLE', N'BatchStep', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory link to the database-specific unique identifier for a Batch (and part of an alternate key with BatchStepName)', 'SCHEMA', N'privy', 'TABLE', N'BatchStep', 'COLUMN', N'BatchId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Database specific unique identifier for a single Batch Step', 'SCHEMA', N'privy', 'TABLE', N'BatchStep', 'COLUMN', N'BatchStepId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'User friendly name for a batch step, unique within a single batch (and part of an alternate key with BatchId)', 'SCHEMA', N'privy', 'TABLE', N'BatchStep', 'COLUMN', N'BatchStepName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates whether this batch step is disabled (where 1 = TRUE)', 'SCHEMA', N'privy', 'TABLE', N'BatchStep', 'COLUMN', N'IsDisabled'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Container for an end-to-end ETL Load Batch process e.g. "SAK UP", "SAP Germany", "Movex Denmark" or "M3 France" etc.  Effectively a container for a set of steps or instructions to load a particular set of data which may be PowerCenter, SSIS, ICS or something else.', 'SCHEMA', N'privy', 'TABLE', N'Batch', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Database-specific unique identifier for an ETL Batch', 'SCHEMA', N'privy', 'TABLE', N'Batch', 'COLUMN', N'BatchId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Database-specific, business-friendly unique identifier for an ETL Batch', 'SCHEMA', N'privy', 'TABLE', N'Batch', 'COLUMN', N'BatchName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Unique identifier for the same batch within ICRT/ICS.  Must be unique when populated', 'SCHEMA', N'privy', 'TABLE', N'Batch', 'COLUMN', N'IcrtProcessName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates whether this job is disabled where 1 = TRUE and will not run (only when managed through the standard JLL SSIS runtime)', 'SCHEMA', N'privy', 'TABLE', N'Batch', 'COLUMN', N'IsDisabled'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The date from which to fetch/process data for all steps in the job - used to force a full load over a delta', 'SCHEMA', N'privy', 'TABLE', N'Batch', 'COLUMN', N'StartCapturePointOverride'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Represents a single thread within a step of an ETL process, typically one thread is responsible for processing one table.', 'SCHEMA', N'privy', 'TABLE', N'Thread', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory link to the database-specific unique identifier for a BatchStep (and part of an alternate key with ThreadName)', 'SCHEMA', N'privy', 'TABLE', N'Thread', 'COLUMN', N'BatchStepId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates whether this thread is disabled (where 1 = TRUE)', 'SCHEMA', N'privy', 'TABLE', N'Thread', 'COLUMN', N'IsDisabled'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Database specific unique identifier for a single Thread', 'SCHEMA', N'privy', 'TABLE', N'Thread', 'COLUMN', N'ThreadId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'User friendly name for a thread, unique within a batch step (and part of an alternate key with BatchStepId)', 'SCHEMA', N'privy', 'TABLE', N'Thread', 'COLUMN', N'ThreadName'
GO
PRINT N'Altering permissions on SCHEMA:: [ics]'
GO
REVOKE SELECT ON SCHEMA:: [ics] TO [BatchManagers]
GO
REVOKE SELECT ON SCHEMA:: [ics] TO [EtlDevelopersDEV]
GO
REVOKE SELECT ON SCHEMA:: [ics] TO [EtlDevelopersPROD]
GO
