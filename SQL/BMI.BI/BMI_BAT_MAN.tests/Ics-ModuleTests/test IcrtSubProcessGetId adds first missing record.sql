create   procedure [Ics-ModuleTests].[test IcrtSubProcessGetId adds first missing record]
as
begin
	--! Assemble
	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler' ;
	exec tSQLt.FakeTable @TableName = N'ics.IcrtSubProcess' ;

	declare @_IcrtSubProcessId int = 1, @_BatchId int = 101, @_IcrtSubProcessName varchar(100) = 'B' ;

	select @_IcrtSubProcessId as [IcrtSubProcessId], @_BatchId as [BatchId], @_IcrtSubProcessName as [IcrtSubProcessName] into #expected ;

	--! Act
	exec ics.IcrtSubProcessGetId
		  @IcrtSubProcessName = @_IcrtSubProcessName
		, @BatchId = @_BatchId

	--! Assert
	exec tSQLt.AssertEqualsTable '#expected', 'ics.IcrtSubProcess';
end;