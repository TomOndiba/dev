CREATE procedure [batch-ModuleTests].[test ProcessGetIdFromIcrtProcessName adds first missing record]
as
begin
	--!
	--! NOTE: DO NOT fake the batch.Process table for this INSERT check
	--! so that if any new NOT NULL colunns are added in the future but not
	--! catered for by default constraint or changes in batch.ProcessGetIdFromIcrtProcessName
	--! then this test will fail.
	--! But do make sure the target table (and any dependants) are empty, null or
	--! otherwise disabled for the duration of the test
	--!
	alter table ics.IcrtSubProcess drop constraint FK_ics_IcrtSubProcess_batch_Process ;
	alter table batch.Step drop constraint FK_batch_Step_batch_Process ;
	delete batch.Process where 1 = 1;

	--! Assemble
	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler' ;
	exec tSQLt.FakeTable @TableName = N'batch.Process' ;

	declare @_BatchProcessId int = 1, @_BatchProcessName varchar(100) = 'A', @_IcrtProcessName varchar(100) = 'B' ;

	select @_BatchProcessId as [BatchProcessId], @_BatchProcessName as [BatchProcessName], @_IcrtProcessName as [IcrtProcessName] into #expected ;

	--! Act
	exec batch.ProcessGetIdFromIcrtProcessName
		  @IcrtProcessName = @_IcrtProcessName
		, @BatchProcessName = @_BatchProcessName

	--! Assert
	exec tSQLt.AssertEqualsTable '#expected', 'batch.Process';
end;