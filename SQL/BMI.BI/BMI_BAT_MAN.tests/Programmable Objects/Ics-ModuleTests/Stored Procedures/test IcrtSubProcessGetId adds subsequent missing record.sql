create procedure [Ics-ModuleTests].[test IcrtSubProcessGetId adds subsequent missing record]
as
begin
	--! Assemble
	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler' ;
	exec tSQLt.FakeTable @TableName = N'ics.IcrtSubProcess' ;

	declare @_IcrtSubProcessId_A int = 3, @_BatchProcessId_A varchar(100) = 101, @_IcrtSubProcessName_A varchar(100) = 'B' ;
	declare @_IcrtSubProcessId_B int = 4, @_BatchProcessId_B varchar(100) = 101, @_IcrtSubProcessName_B varchar(100) = 'D' ;

	insert ics.IcrtSubProcess (IcrtSubProcessId, BatchProcessId, IcrtSubProcessName) values (@_IcrtSubProcessId_A, @_BatchProcessId_A, @_IcrtSubProcessName_A) ;

	; with sourceCte (IcrtSubProcessId, BatchProcessId, IcrtSubProcessName)
	as
	(
				  select @_IcrtSubProcessId_A, @_BatchProcessId_A, @_IcrtSubProcessName_A
		union all select @_IcrtSubProcessId_B, @_BatchProcessId_B, @_IcrtSubProcessName_B
	)
	select * into #expected from sourceCte;

	--! Act
	exec ics.IcrtSubProcessGetId
		  @IcrtSubProcessName = @_IcrtSubProcessName_B
		, @BatchProcessId = @_BatchProcessId_B

	--! Assert
	exec tSQLt.AssertEqualsTable '#expected', 'ics.IcrtSubProcess';
end;