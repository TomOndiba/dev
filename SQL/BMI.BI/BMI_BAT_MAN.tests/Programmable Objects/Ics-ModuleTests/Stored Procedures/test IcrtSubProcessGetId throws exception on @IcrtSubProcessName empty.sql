IF OBJECT_ID('[Ics-ModuleTests].[test IcrtSubProcessGetId throws exception on @IcrtSubProcessName empty]') IS NOT NULL
	DROP PROCEDURE [Ics-ModuleTests].[test IcrtSubProcessGetId throws exception on @IcrtSubProcessName empty];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [Ics-ModuleTests].[test IcrtSubProcessGetId throws exception on @IcrtSubProcessName empty]
as
begin
	exec tSQLt.ExpectException @ExpectedMessagePattern = '%ICRT Sub-process Name input must not be null or empty%'
	
	exec ics.IcrtSubProcessGetId @IcrtSubProcessName = '', @BatchProcessId = 1 ;
end;
GO
