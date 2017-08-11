create   procedure [batch-ModuleTests].[test ProcessGetIdFromIcrtProcessName adds subsequent missing record]
as
begin
	--! Assemble
	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler' ;
	exec tSQLt.FakeTable @TableName = N'batch.Process' ;

	declare @_BatchProcessId_A int = 3, @_BatchProcessName_A varchar(100) = 'A', @_IcrtProcessName_A varchar(100) = 'B' ;
	declare @_BatchProcessId_B int = 4, @_BatchProcessName_B varchar(100) = 'C', @_IcrtProcessName_B varchar(100) = 'D' ;

	insert batch.Process (BatchProcessId, BatchProcessName, IcrtProcessName) values (@_BatchProcessId_A, @_BatchProcessName_A, @_IcrtProcessName_A) ;

	; with sourceCte (BatchProcessId, BatchProcessName, IcrtProcessName)
	as
	(
				  select @_BatchProcessId_A, @_BatchProcessName_A, @_IcrtProcessName_A
		union all select @_BatchProcessId_B, @_BatchProcessName_B, @_IcrtProcessName_B
	)
	select * into #expected from sourceCte;

	--! Act
	exec batch.ProcessGetIdFromIcrtProcessName
		  @IcrtProcessName = @_IcrtProcessName_B
		, @BatchProcessName = @_BatchProcessName_B

	--! Assert
	exec tSQLt.AssertEqualsTable '#expected', 'batch.Process';
end;