IF OBJECT_ID('[Ics-ModuleTests].[test IcrtSubProcessGetId outputs new IcrtSubProcessId]') IS NOT NULL
	DROP PROCEDURE [Ics-ModuleTests].[test IcrtSubProcessGetId outputs new IcrtSubProcessId];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [Ics-ModuleTests].[test IcrtSubProcessGetId outputs new IcrtSubProcessId]
as
begin
	--! Assemble
	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler' ;
	exec tSQLt.FakeTable @TableName = N'ics.IcrtSubProcess' ;

	insert ics.IcrtSubProcess (IcrtSubProcessId, BatchProcessId, IcrtSubProcessName) values (3, 101, 'B') ;

	--! Act
	declare @_actual int = 4;
	exec ics.IcrtSubProcessGetId
		  @IcrtSubProcessName = 'C'
		, @BatchProcessId = 101
		, @IcrtSubProcessId = @_actual out

	--! Assert
	exec tSQLt.AssertEquals 4, @_actual ;
end;
GO
