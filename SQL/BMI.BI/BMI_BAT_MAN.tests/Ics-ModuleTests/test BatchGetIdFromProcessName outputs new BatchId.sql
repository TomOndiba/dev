create   procedure [Ics-ModuleTests].[test BatchGetIdFromProcessName outputs new BatchId]
as
begin
	--! Assemble
	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler' ;
	exec tSQLt.FakeTable @TableName = N'privy.Batch' ;

	insert privy.Batch (BatchId, BatchName, IcrtProcessName) values (3, 'A', 'B') ;

	--! Act
	declare @_actual int = 4;
	exec ics.BatchGetIdFromProcessName
		  @IcrtProcessName = 'C'
		, @BatchName = 'D'
		, @BatchId = @_actual out

	--! Assert
	exec tSQLt.AssertEquals 4, @_actual ;
end;