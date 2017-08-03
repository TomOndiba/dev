create   procedure [Ics-ModuleTests].[test BatchGetIdFromProcessName adds subsequent missing record]
as
begin
	--! Assemble
	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler' ;
	exec tSQLt.FakeTable @TableName = N'privy.Batch' ;

	declare @_BatchId_A int = 3, @_BatchName_A varchar(100) = 'A', @_IcrtProcessName_A varchar(100) = 'B' ;
	declare @_BatchId_B int = 4, @_BatchName_B varchar(100) = 'C', @_IcrtProcessName_B varchar(100) = 'D' ;

	insert privy.Batch (BatchId, BatchName, IcrtProcessName) values (@_BatchId_A, @_BatchName_A, @_IcrtProcessName_A) ;

	; with sourceCte (BatchId, BatchName, IcrtProcessName)
	as
	(
				  select @_BatchId_A, @_BatchName_A, @_IcrtProcessName_A
		union all select @_BatchId_B, @_BatchName_B, @_IcrtProcessName_B
	)
	select * into #expected from sourceCte;

	--! Act
	exec ics.BatchGetIdFromProcessName
		  @IcrtProcessName = @_IcrtProcessName_B
		, @BatchName = @_BatchName_B

	--! Assert
	exec tSQLt.AssertEqualsTable '#expected', 'privy.Batch';
end;