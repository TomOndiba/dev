IF OBJECT_ID('[IcsApp-Tests].[test SubProcessCheckThreads returns expected resultset]') IS NOT NULL
	DROP PROCEDURE [IcsApp-Tests].[test SubProcessCheckThreads returns expected resultset];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [IcsApp-Tests].[test SubProcessCheckThreads returns expected resultset]
as
begin
	create table [IcsApp-Tests].expected
	(
	  SubProcessRunId int null
	, Outcome varchar(16)
	, [Message] varchar(500)
	, ExpectedThreadCount int
	, ActualThreadCount int
	, ThreadsSucceeded int
	, ThreadsSkipped int
	, ThreadsStopped int
	, ThreadsFailed int
	) ;

 exec tSQLt.AssertResultSetsHaveSameMetaData 'SELECT * From [IcsApp-Tests].expected', 'Exec [IcsApp].[SubProcessCheckThreads] ''PN'',1 ';
end;
GO
