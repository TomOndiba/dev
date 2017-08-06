CREATE procedure [Ics-ModuleTests].[test BatchGetIdFromProcessName adds first missing record]
as
begin
	--!
	--! NOTE: DO NOT fake the privy.Batch table for this INSERT check
	--! so that if any new NOT NULL colunns are added in the future but not
	--! catered for by default constraint or changes in ics.BatchGetIdFromProcessName
	--! then this test will fail.
	--! But do make sure the target table (and any dependants) are empty, null or
	--! otherwise disabled for the duration of the test
	--!
	alter table ics.IcrtSubProcess drop constraint FK_ics_IcrtSubProcess_privy_Batch ;
	alter table privy.BatchStep drop constraint FK_privy_BatchStep_privy_Batch ;
	delete privy.Batch where 1 = 1;

	--! Assemble
	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler' ;
	exec tSQLt.FakeTable @TableName = N'privy.Batch' ;

	declare @_BatchId int = 1, @_BatchName varchar(100) = 'A', @_IcrtProcessName varchar(100) = 'B' ;

	select @_BatchId as [BatchId], @_BatchName as [BatchName], @_IcrtProcessName as [IcrtProcessName] into #expected ;

	--! Act
	exec ics.BatchGetIdFromProcessName
		  @IcrtProcessName = @_IcrtProcessName
		, @BatchName = @_BatchName

	--! Assert
	exec tSQLt.AssertEqualsTable '#expected', 'privy.Batch';
end;