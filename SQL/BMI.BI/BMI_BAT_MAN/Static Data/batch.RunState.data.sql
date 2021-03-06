﻿--MERGE generated by 'sp_generate_merge' stored procedure, Version 0.93
--Originally by Vyas (http://vyaskn.tripod.com): sp_generate_inserts (build 22)
--Adapted for SQL Server 2008/2012 by Daniel Nolan (http://danere.com)

set nocount on

merge into [batch].[RunState] as Target
using (values
  (-1,'Not Started','N','Used as run state placeholder when no BatchRunLog entries exist for a particular run',0)
 ,(1,'Process Started','N','',1)
 ,(2,'Process In-progress','N','',2)
 ,(3,'Process Succeeded','Y','Indicates that a complete end-to-end import process has completed successfully.',4)
 ,(4,'Process Stopped','Y','Indicates that an end-to-end import process has been stopped programmatically for some logical reason not considered to be an error condition e.g. there is no data to process.',8)
 ,(5,'Process Skipped','Y','Indicates that an end-to-end import process has been instructed to skip for some logical reason not considered to be an error condition e.g. loads should not run during a predefined maintenance window.',32)
 ,(6,'Process Failed','Y','Indicates that an end-to-end import process has been stopped or failed due to an unexpected error condition or other exception.',16)
 ,(7,'Sub-Process/Step Started','N','',1)
 ,(8,'Sub-Process/Step In-progress','N','',2)
 ,(9,'Sub-Process/Step Succeeded','N','Indicates that a Sub-Process/Step has completed successfully.',4)
 ,(10,'Sub-Process/Step Stopped','N','Indicates that a Sub-Process/Step has been stopped programmatically for some logical reason not considered to be an error condition e.g. there is no data to process.',8)
 ,(11,'Sub-Process/Step Skipped','N','Indicates that a Sub-Process/Step has been instructed to skip for some logical reason not considered to be an error condition e.g. subject area was loaded two hours ago but only needs to be loaded every 24 hours.',32)
 ,(12,'Sub-Process/Step Failed','N','Indicates that a Sub-Process/Step has been stopped or failed due to an unexpected error condition or other exception.',16)
 ,(13,'Thread Started','N','',1)
 ,(14,'Thread In-progress','N','',2)
 ,(15,'Thread Succeeded','N','Indicates that a Thread has completed successfully.',4)
 ,(16,'Thread Stopped','N','Indicates that a Thread has been stopped programmatically for some logical reason not considered to be an error condition.',8)
 ,(17,'Thread Skipped','N','Indicates that a Thread has been instructed to skip for some logical reason not considered to be an error condition e.g. a preceding step processed zero rows so there is nothing to do on this thread.',32)
 ,(18,'Thread Failed','N','Indicates that a Thread has been stopped or failed due to an unexpected error condition or other exception.',16)
 ,(19,'Landing Started','N','',1)
 ,(20,'Landing Completed','N','',4)
 ,(21,'Landing Failed','N','',16)
 ,(22,'Load Started','N','',1)
 ,(23,'Load Completed','N','',4)
 ,(24,'Load Failed','N','',16)
 ,(25,'Cleanse Started','N','',1)
 ,(26,'Cleanse Complete','N','',4)
 ,(27,'Cleanse Failed','N','',16)
) as Source ([RunStateId],[RunStateName],[IsEtlClosingState],[Narrative],[FlagBit])
on (Target.[RunStateId] = Source.[RunStateId])
when matched and (
	nullif(Source.[RunStateName], Target.[RunStateName]) is not null or nullif(Target.[RunStateName], Source.[RunStateName]) is not null or 
	nullif(Source.[IsEtlClosingState], Target.[IsEtlClosingState]) is not null or nullif(Target.[IsEtlClosingState], Source.[IsEtlClosingState]) is not null or 
	nullif(Source.[Narrative], Target.[Narrative]) is not null or nullif(Target.[Narrative], Source.[Narrative]) is not null or 
	nullif(Source.[FlagBit], Target.[FlagBit]) is not null or nullif(Target.[FlagBit], Source.[FlagBit]) is not null) then
 update set
  [RunStateName] = Source.[RunStateName], 
  [IsEtlClosingState] = Source.[IsEtlClosingState], 
  [Narrative] = Source.[Narrative], 
  [FlagBit] = Source.[FlagBit]
when not matched by target then
 insert([RunStateId],[RunStateName],[IsEtlClosingState],[Narrative],[FlagBit])
 values(Source.[RunStateId],Source.[RunStateName],Source.[IsEtlClosingState],Source.[Narrative],Source.[FlagBit])
when not matched by source then 
 delete
;
go
declare @mergeError int
 , @mergeCount int
select @mergeError = @@error, @mergeCount = @@rowcount
if @mergeError != 0
 begin
 print 'ERROR OCCURRED IN MERGE FOR [batch].[RunState]. Rows affected: ' + cast(@mergeCount as varchar(100)); -- SQL should always return zero rows affected
 end
else
 begin
 print '[batch].[RunState] rows affected by MERGE: ' + cast(@mergeCount as varchar(100));
 end
go

set nocount off
go
