SET NOCOUNT ON

MERGE INTO [dbo].[StubResultSet] AS Target
USING (VALUES
  ('[dbo].[ProcessRunStart]',-999,NULL,NULL,'Process Instruction','Run','Process Message')
 ,('[dbo].[SubProcessRunStart]',NULL,-888,NULL,'Sub-Process Instruction','Run','Sub-Process Message')
 ,('[dbo].[ThreadRunStart]',NULL,NULL,-777,'Thread Instruction','Run','Thread Message')
) AS Source ([FunctionName],[ProcessRunID],[SubProcessRunID],[ThreadRunID],[Instruction],[RunType],[Message])
ON (Target.[FunctionName] = Source.[FunctionName])
WHEN MATCHED AND (
	NULLIF(Source.[ProcessRunID], Target.[ProcessRunID]) IS NOT NULL OR NULLIF(Target.[ProcessRunID], Source.[ProcessRunID]) IS NOT NULL OR 
	NULLIF(Source.[SubProcessRunID], Target.[SubProcessRunID]) IS NOT NULL OR NULLIF(Target.[SubProcessRunID], Source.[SubProcessRunID]) IS NOT NULL OR 
	NULLIF(Source.[ThreadRunID], Target.[ThreadRunID]) IS NOT NULL OR NULLIF(Target.[ThreadRunID], Source.[ThreadRunID]) IS NOT NULL OR 
	NULLIF(Source.[Instruction], Target.[Instruction]) IS NOT NULL OR NULLIF(Target.[Instruction], Source.[Instruction]) IS NOT NULL OR 
	NULLIF(Source.[RunType], Target.[RunType]) IS NOT NULL OR NULLIF(Target.[RunType], Source.[RunType]) IS NOT NULL OR 
	NULLIF(Source.[Message], Target.[Message]) IS NOT NULL OR NULLIF(Target.[Message], Source.[Message]) IS NOT NULL) THEN
 UPDATE SET
  [ProcessRunID] = Source.[ProcessRunID], 
  [SubProcessRunID] = Source.[SubProcessRunID], 
  [ThreadRunID] = Source.[ThreadRunID], 
  [Instruction] = Source.[Instruction], 
  [RunType] = Source.[RunType], 
  [Message] = Source.[Message]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([FunctionName],[ProcessRunID],[SubProcessRunID],[ThreadRunID],[Instruction],[RunType],[Message])
 VALUES(Source.[FunctionName],Source.[ProcessRunID],Source.[SubProcessRunID],Source.[ThreadRunID],Source.[Instruction],Source.[RunType],Source.[Message])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;
GO
DECLARE @mergeError int
 , @mergeCount int
SELECT @mergeError = @@ERROR, @mergeCount = @@ROWCOUNT
IF @mergeError != 0
 BEGIN
 PRINT 'ERROR OCCURRED IN MERGE FOR [dbo].[StubResultSet]. Rows affected: ' + CAST(@mergeCount AS VARCHAR(100)); -- SQL should always return zero rows affected
 END
ELSE
 BEGIN
 PRINT '[dbo].[StubResultSet] rows affected by MERGE: ' + CAST(@mergeCount AS VARCHAR(100));
 END
GO

SET NOCOUNT OFF
GO
