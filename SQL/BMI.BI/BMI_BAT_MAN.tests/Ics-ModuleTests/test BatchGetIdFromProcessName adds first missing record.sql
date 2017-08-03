create   procedure [Ics-ModuleTests].[test BatchGetIdFromProcessName adds first missing record]
as
begin
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