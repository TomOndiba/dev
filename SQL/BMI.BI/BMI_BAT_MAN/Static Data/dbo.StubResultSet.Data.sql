﻿--MERGE generated by 'sp_generate_merge' stored procedure, Version 0.93
--Originally by Vyas (http://vyaskn.tripod.com): sp_generate_inserts (build 22)
--Adapted for SQL Server 2008/2012 by Daniel Nolan (http://danere.com)

set nocount on

merge into [dbo].[StubResultSet] as Target
using (values
  ('[ics].[ProcessRunStart]',999,null,null,'RUN','FULL','Process Message',null,null,null,null,null,null,null,null,null)
 ,('[ics].[SubProcessRunStart]',null,888,null,'RUN','FULL','Sub-Process Message',null,null,null,null,null,null,null,null,null)
 ,('[ics].[ThreadRunStart]',null,null,777,'RUN','FULL','Thread Message','2017-07-25T00:00:00','2017-07-25T00:00:00',null,null,null,null,null,null,null)
 ,('[IcsApp].[MappingConfigTaskGetCurrentRunIds]',999,888,777,null,null,null,null,null,null,null,null,null,null,null,null)
 ,('[IcsApp].[SubProcessCheckThreads]',null,888,null,null,null,null,null,null,'SUCCEEDED',1,1,1,0,0,0)
) as Source ([FunctionName],[ProcessRunID],[SubProcessRunID],[ThreadRunID],[Instruction],[RunType],[Message],[StartCapturePoint],[EndCapturePoint],[Outcome],[ExpectedThreadCount],[ActualThreadCount],[ThreadsSucceeded],[ThreadsSkipped],[ThreadsStopped],[ThreadsFailed])
on (Target.[FunctionName] = Source.[FunctionName])
when matched and (
	nullif(Source.[ProcessRunID], Target.[ProcessRunID]) is not null or nullif(Target.[ProcessRunID], Source.[ProcessRunID]) is not null or 
	nullif(Source.[SubProcessRunID], Target.[SubProcessRunID]) is not null or nullif(Target.[SubProcessRunID], Source.[SubProcessRunID]) is not null or 
	nullif(Source.[ThreadRunID], Target.[ThreadRunID]) is not null or nullif(Target.[ThreadRunID], Source.[ThreadRunID]) is not null or 
	nullif(Source.[Instruction], Target.[Instruction]) is not null or nullif(Target.[Instruction], Source.[Instruction]) is not null or 
	nullif(Source.[RunType], Target.[RunType]) is not null or nullif(Target.[RunType], Source.[RunType]) is not null or 
	nullif(Source.[Message], Target.[Message]) is not null or nullif(Target.[Message], Source.[Message]) is not null or 
	nullif(Source.[StartCapturePoint], Target.[StartCapturePoint]) is not null or nullif(Target.[StartCapturePoint], Source.[StartCapturePoint]) is not null or 
	nullif(Source.[EndCapturePoint], Target.[EndCapturePoint]) is not null or nullif(Target.[EndCapturePoint], Source.[EndCapturePoint]) is not null or 
	nullif(Source.[Outcome], Target.[Outcome]) is not null or nullif(Target.[Outcome], Source.[Outcome]) is not null or 
	nullif(Source.[ExpectedThreadCount], Target.[ExpectedThreadCount]) is not null or nullif(Target.[ExpectedThreadCount], Source.[ExpectedThreadCount]) is not null or 
	nullif(Source.[ActualThreadCount], Target.[ActualThreadCount]) is not null or nullif(Target.[ActualThreadCount], Source.[ActualThreadCount]) is not null or 
	nullif(Source.[ThreadsSucceeded], Target.[ThreadsSucceeded]) is not null or nullif(Target.[ThreadsSucceeded], Source.[ThreadsSucceeded]) is not null or 
	nullif(Source.[ThreadsSkipped], Target.[ThreadsSkipped]) is not null or nullif(Target.[ThreadsSkipped], Source.[ThreadsSkipped]) is not null or 
	nullif(Source.[ThreadsStopped], Target.[ThreadsStopped]) is not null or nullif(Target.[ThreadsStopped], Source.[ThreadsStopped]) is not null or 
	nullif(Source.[ThreadsFailed], Target.[ThreadsFailed]) is not null or nullif(Target.[ThreadsFailed], Source.[ThreadsFailed]) is not null) then
 update set
  [ProcessRunID] = Source.[ProcessRunID], 
  [SubProcessRunID] = Source.[SubProcessRunID], 
  [ThreadRunID] = Source.[ThreadRunID], 
  [Instruction] = Source.[Instruction], 
  [RunType] = Source.[RunType], 
  [Message] = Source.[Message], 
  [StartCapturePoint] = Source.[StartCapturePoint], 
  [EndCapturePoint] = Source.[EndCapturePoint], 
  [Outcome] = Source.[Outcome], 
  [ExpectedThreadCount] = Source.[ExpectedThreadCount], 
  [ActualThreadCount] = Source.[ActualThreadCount], 
  [ThreadsSucceeded] = Source.[ThreadsSucceeded], 
  [ThreadsSkipped] = Source.[ThreadsSkipped], 
  [ThreadsStopped] = Source.[ThreadsStopped], 
  [ThreadsFailed] = Source.[ThreadsFailed]
when not matched by target then
 insert([FunctionName],[ProcessRunID],[SubProcessRunID],[ThreadRunID],[Instruction],[RunType],[Message],[StartCapturePoint],[EndCapturePoint],[Outcome],[ExpectedThreadCount],[ActualThreadCount],[ThreadsSucceeded],[ThreadsSkipped],[ThreadsStopped],[ThreadsFailed])
 values(Source.[FunctionName],Source.[ProcessRunID],Source.[SubProcessRunID],Source.[ThreadRunID],Source.[Instruction],Source.[RunType],Source.[Message],Source.[StartCapturePoint],Source.[EndCapturePoint],Source.[Outcome],Source.[ExpectedThreadCount],Source.[ActualThreadCount],Source.[ThreadsSucceeded],Source.[ThreadsSkipped],Source.[ThreadsStopped],Source.[ThreadsFailed])
when not matched by source then 
 delete
;
go
declare @mergeError int
 , @mergeCount int
select @mergeError = @@error, @mergeCount = @@rowcount
if @mergeError != 0
 begin
 print 'ERROR OCCURRED IN MERGE FOR [dbo].[StubResultSet]. Rows affected: ' + cast(@mergeCount as varchar(100)); -- SQL should always return zero rows affected
 end
else
 begin
 print '[dbo].[StubResultSet] rows affected by MERGE: ' + cast(@mergeCount as varchar(100));
 end
go

set nocount off
go
