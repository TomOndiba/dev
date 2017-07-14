﻿--MERGE generated by 'sp_generate_merge' stored procedure, Version 0.93
--Originally by Vyas (http://vyaskn.tripod.com): sp_generate_inserts (build 22)
--Adapted for SQL Server 2008/2012 by Daniel Nolan (http://danere.com)

set nocount on

merge into [dbo].[TranslationStatus] as Target
using (values
  (1,'Queued','Translation processing not started/pending the first attempt')
 ,(2,'Re-queued','Translation has been marked for re-try')
 ,(4,'In-Progress','Translation has started/is in progress')
 ,(8,'Failed','Translation attempt has resulted in an error or other failure')
 ,(16,'Complete','Translation has completed but not yet approved. Will not be attemnpted again unless status is changed to Re-queued (1)')
 ,(32,'Approved','Translation has been approved and will not be processed')
) as Source ([TranslationStatusId],[TranslationStatusName],[Narrative])
on (Target.[TranslationStatusId] = Source.[TranslationStatusId])
when matched and (
	nullif(Source.[TranslationStatusName], Target.[TranslationStatusName]) is not null or nullif(Target.[TranslationStatusName], Source.[TranslationStatusName]) is not null or 
	nullif(Source.[Narrative], Target.[Narrative]) is not null or nullif(Target.[Narrative], Source.[Narrative]) is not null) then
 update set
  [TranslationStatusName] = Source.[TranslationStatusName], 
  [Narrative] = Source.[Narrative]
when not matched by target then
 insert([TranslationStatusId],[TranslationStatusName],[Narrative])
 values(Source.[TranslationStatusId],Source.[TranslationStatusName],Source.[Narrative])
when not matched by source then 
 delete
;
go
declare @mergeError int
 , @mergeCount int
select @mergeError = @@error, @mergeCount = @@rowcount
if @mergeError != 0
 begin
 print 'ERROR OCCURRED IN MERGE FOR [dbo].[TranslationStatus]. Rows affected: ' + cast(@mergeCount as varchar(100)); -- SQL should always return zero rows affected
 end
else
 begin
 print '[dbo].[TranslationStatus] rows affected by MERGE: ' + cast(@mergeCount as varchar(100));
 end
go

set nocount off
go