create   procedure [Ics-ModuleTests].[test IcrtSubProcessGetId adds subsequent missing record]
as
begin
	--! Assemble
	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler' ;
	exec tSQLt.FakeTable @TableName = N'ics.IcrtSubProcess' ;

	declare @_IcrtSubProcessId_A int = 3, @_BatchId_A varchar(100) = 101, @_IcrtSubProcessName_A varchar(100) = 'B' ;
	declare @_IcrtSubProcessId_B int = 4, @_BatchId_B varchar(100) = 101, @_IcrtSubProcessName_B varchar(100) = 'D' ;

	insert ics.IcrtSubProcess (IcrtSubProcessId, BatchId, IcrtSubProcessName) values (@_IcrtSubProcessId_A, @_BatchId_A, @_IcrtSubProcessName_A) ;

	; with sourceCte (IcrtSubProcessId, BatchId, IcrtSubProcessName)
	as
	(
				  select @_IcrtSubProcessId_A, @_BatchId_A, @_IcrtSubProcessName_A
		union all select @_IcrtSubProcessId_B, @_BatchId_B, @_IcrtSubProcessName_B
	)
	select * into #expected from sourceCte;

	--! Act
	exec ics.IcrtSubProcessGetId
		  @IcrtSubProcessName = @_IcrtSubProcessName_B
		, @BatchId = @_BatchId_B

	--! Assert
	exec tSQLt.AssertEqualsTable '#expected', 'ics.IcrtSubProcess';
end;