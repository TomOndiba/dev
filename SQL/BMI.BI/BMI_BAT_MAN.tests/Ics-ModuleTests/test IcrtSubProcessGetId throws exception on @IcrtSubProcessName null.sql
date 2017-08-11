CREATE procedure [Ics-ModuleTests].[test IcrtSubProcessGetId throws exception on @IcrtSubProcessName null]
as
begin
	exec tSQLt.ExpectException @ExpectedMessagePattern = '%ICRT Sub-process Name input must not be null or empty%'
	
	exec ics.IcrtSubProcessGetId  @IcrtSubProcessName = null, @BatchProcessId = 1 ;
end;