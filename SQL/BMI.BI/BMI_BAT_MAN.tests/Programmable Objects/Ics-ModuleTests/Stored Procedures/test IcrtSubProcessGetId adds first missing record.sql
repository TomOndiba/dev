IF OBJECT_ID('[Ics-ModuleTests].[test IcrtSubProcessGetId adds first missing record]') IS NOT NULL
	DROP PROCEDURE [Ics-ModuleTests].[test IcrtSubProcessGetId adds first missing record];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [Ics-ModuleTests].[test IcrtSubProcessGetId adds first missing record]
as
begin
	--!
	--! NOTE: DO NOT fake the ics.IcrtSubProcess table for this INSERT check
	--! so that if any new NOT NULL colunns are added in the future but not
	--! catered for by default constraint or changes in ics.IcrtSubProcessGetId
	--! then this test will fail.
	--! But do make sure the target table (and any dependants) are empty or null
	--!
	update batch.Step set IcrtSubProcessId = null where IcrtSubProcessId is not null;
	delete ics.IcrtSubProcess where 1 = 1;

	declare @_IcrtSubProcessId int = 1, @_BatchProcessId int = 101, @_IcrtSubProcessName varchar(100) = 'B' ;

	--! Because this is a real table the Batch Process needs to exist too
	insert batch.Process (BatchProcessId, BatchProcessName) values (@_BatchProcessId, 'A');

	select @_IcrtSubProcessId as [IcrtSubProcessId], @_BatchProcessId as [BatchProcessId], @_IcrtSubProcessName as [IcrtSubProcessName] into #expected ;

	--! Act
	exec ics.IcrtSubProcessGetId
		  @IcrtSubProcessName = @_IcrtSubProcessName
		, @BatchProcessId = @_BatchProcessId

	--! Assert
	exec tSQLt.AssertEqualsTable '#expected', 'ics.IcrtSubProcess';
end;
GO
