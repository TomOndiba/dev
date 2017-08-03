create   procedure [Ics-ModuleTests].[test IcrtSubProcessGetId outputs new IcrtSubProcessId]
as
begin
	--! Assemble
	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler' ;
	exec tSQLt.FakeTable @TableName = N'ics.IcrtSubProcess' ;

	insert ics.IcrtSubProcess (IcrtSubProcessId, BatchId, IcrtSubProcessName) values (3, 101, 'B') ;

	--! Act
	declare @_actual int = 4;
	exec ics.IcrtSubProcessGetId
		  @IcrtSubProcessName = 'C'
		, @BatchId = 101
		, @IcrtSubProcessId = @_actual out

	--! Assert
	exec tSQLt.AssertEquals 4, @_actual ;
end;