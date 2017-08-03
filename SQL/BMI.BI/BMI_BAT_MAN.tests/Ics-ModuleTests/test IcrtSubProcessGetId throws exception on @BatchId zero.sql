﻿create   procedure [Ics-ModuleTests].[test IcrtSubProcessGetId throws exception on @BatchId zero]
as
begin
	exec tSQLt.ExpectException @ExpectedMessagePattern = '%Batch Id (derived from ICRT process name) must be greater than zero%'
	
	exec ics.IcrtSubProcessGetId @IcrtSubProcessName = 'A', @BatchId = 0 ;
end;