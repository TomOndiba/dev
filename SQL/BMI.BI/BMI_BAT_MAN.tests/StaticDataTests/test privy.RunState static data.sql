create   procedure [StaticDataTests].[test privy.RunState static data]
as
begin
	--! Assemble
	;with sourceCte ([RunStateId],[RunStateName],[IsEtlClosingState],[Narrative],[FlagBit])
	as
	(
				  select cast(-99 as int), cast('' as varchar(50)), cast('' as varchar(50)), cast('' as varchar(max)), cast(-1 as int)
		union all select -1,'Not Started','N','Used as run state placeholder when no BatchRunLog entries exist for a particular run',0
		union all select 1,'Process Started','N','',1
		union all select 2,'Process In-progress','N','',2
		union all select 3,'Process Succeeded','Y','Indicates that a complete end-to-end import process has completed successfully.',4
		union all select 4,'Process Stopped','Y','Indicates that an end-to-end import process has been stopped programmatically for some logical reason not considered to be an error condition e.g. there is no data to process.',8
		union all select 5,'Process Skipped','Y','Indicates that an end-to-end import process has been instructed to skip for some logical reason not considered to be an error condition e.g. loads should not run during a predefined maintenance window.',32
		union all select 6,'Process Failed','Y','Indicates that an end-to-end import process has been stopped or failed due to an unexpected error condition or other exception.',16
		union all select 7,'Sub-Process/Step Started','N','',1
		union all select 8,'Sub-Process/Step In-progress','N','',2
		union all select 9,'Sub-Process/Step Succeeded','N','Indicates that a Sub-Process/Step has completed successfully.',4
		union all select 10,'Sub-Process/Step Stopped','N','Indicates that a Sub-Process/Step has been stopped programmatically for some logical reason not considered to be an error condition e.g. there is no data to process.',8
		union all select 11,'Sub-Process/Step Skipped','N','Indicates that a Sub-Process/Step has been instructed to skip for some logical reason not considered to be an error condition e.g. subject area was loaded two hours ago but only needs to be loaded every 24 hours.',32
		union all select 12,'Sub-Process/Step Failed','N','Indicates that a Sub-Process/Step has been stopped or failed due to an unexpected error condition or other exception.',16
		union all select 13,'Thread Started','N','',1
		union all select 14,'Thread In-progress','N','',2
		union all select 15,'Thread Succeeded','N','Indicates that a Thread has completed successfully.',4
		union all select 16,'Thread Stopped','N','Indicates that a Thread has been stopped programmatically for some logical reason not considered to be an error condition.',8
		union all select 17,'Thread Skipped','N','Indicates that a Thread has been instructed to skip for some logical reason not considered to be an error condition e.g. a preceding step processed zero rows so there is nothing to do on this thread.',32
		union all select 18,'Thread Failed','N','Indicates that a Thread has been stopped or failed due to an unexpected error condition or other exception.',16
		union all select 19,'Landing Started','N','',1
		union all select 20,'Landing Completed','N','',4
		union all select 21,'Landing Failed','N','',16
		union all select 22,'Load Started','N','',1
		union all select 23,'Load Completed','N','',4
		union all select 24,'Load Failed','N','',16
		union all select 25,'Cleanse Started','N','',1
		union all select 26,'Cleanse Complete','N','',4
		union all select 27,'Cleanse Failed','N','',16
	)
	select * into #expected from sourceCte where RunStateId >= -1

	--! Assert
	exec tSQLt.AssertEqualsTable @Expected = '#expected', @Actual = 'privy.RunState';
end