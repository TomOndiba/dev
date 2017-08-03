create   procedure [Ics-ModuleTests].[test BatchGetIdFromProcessName throws exception on @IcrtProcessName null]
as
begin
	exec tSQLt.ExpectException @ExpectedMessagePattern = '%ICRT Process Name input must not be null or empty%'
	
	exec ics.BatchGetIdFromProcessName  @IcrtProcessName = null
end;