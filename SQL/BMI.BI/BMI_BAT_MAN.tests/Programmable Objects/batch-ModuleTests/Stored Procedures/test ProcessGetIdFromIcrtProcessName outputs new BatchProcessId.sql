create   procedure [batch-ModuleTests].[test ProcessGetIdFromIcrtProcessName outputs new BatchProcessId]
as
begin
	--! Assemble
	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler' ;
	exec tSQLt.FakeTable @TableName = N'batch.Process' ;

	insert batch.Process (BatchProcessId, BatchProcessName, IcrtProcessName) values (3, 'A', 'B') ;

	--! Act
	declare @_actual int;
	exec batch.ProcessGetIdFromIcrtProcessName
		  @IcrtProcessName = 'C'
		, @BatchProcessName = 'D'
		, @BatchProcessId = @_actual out

	--! Assert
	exec tSQLt.AssertEquals 4, @_actual ;
end;