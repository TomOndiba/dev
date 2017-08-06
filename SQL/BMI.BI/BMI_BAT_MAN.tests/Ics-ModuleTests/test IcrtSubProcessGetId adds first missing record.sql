CREATE procedure [Ics-ModuleTests].[test IcrtSubProcessGetId adds first missing record]
as
begin
	--!
	--! NOTE: DO NOT fake the ics.IcrtSubProcess table for this INSERT check
	--! so that if any new NOT NULL colunns are added in the future but not
	--! catered for by default constraint or changes in ics.IcrtSubProcessGetId
	--! then this test will fail.
	--! But do make sure the target table (and any dependants) are empty or null
	--!
	update privy.BatchStep set IcrtSubProcessId = null where IcrtSubProcessId is not null;
	delete ics.IcrtSubProcess where 1 = 1;

	declare @_IcrtSubProcessId int = 1, @_BatchId int = 101, @_IcrtSubProcessName varchar(100) = 'B' ;

	--! Because this is a real table the Batch needs to exist too
	insert privy.Batch (BatchId, BatchName) values (@_BatchId, 'A');

	select @_IcrtSubProcessId as [IcrtSubProcessId], @_BatchId as [BatchId], @_IcrtSubProcessName as [IcrtSubProcessName] into #expected ;

	--! Act
	exec ics.IcrtSubProcessGetId
		  @IcrtSubProcessName = @_IcrtSubProcessName
		, @BatchId = @_BatchId

	--! Assert
	exec tSQLt.AssertEqualsTable '#expected', 'ics.IcrtSubProcess';
end;