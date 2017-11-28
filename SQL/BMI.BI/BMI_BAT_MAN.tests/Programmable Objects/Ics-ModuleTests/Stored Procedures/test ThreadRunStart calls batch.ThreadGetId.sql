create   procedure [Ics-ModuleTests].[test ThreadRunStart calls batch.ThreadGetId]
as
	begin
		--! Mock all the calls that might be made by this wrapper sproc

		exec tSQLt.SpyProcedure
			@ProcedureName = N'ics.MappingConfigTaskGetId'
		  , @CommandToExecute = 'set @MappingConfigTaskId=1' ;

		exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler' ;


		exec tSQLt.SpyProcedure @ProcedureName = N'batch.ThreadGetId' ; -- nvarchar(max)

		delete	from batch.StepRun ;

		exec tSQLt.FakeTable @TableName = N'batch.StepRun' ; -- nvarchar(max)


		insert into batch.StepRun
		(
			StepRunId
		  , ProcessRunId
		  , StepId
		  , StartTime
		  , EndTime
		  , RunStateId
		  , EndState
		  , EndMessage
		)
		values
		(
			1
		  , 1			-- ProcessRunId - int
		  , 1			-- StepId - int
		  , getdate()	-- StartTime - datetime
		  , getdate()	-- EndTime - datetime
		  , 1			-- RunStateId - int
		  , ''			-- EndState - varchar(16)
		  , ''			-- EndMessage - varchar(500)
		) ;

		select	'MCTN' ThreadName, 1 as StepId, 1 as MappingConfigTaskId into
				#expected ;

		--! Act
		exec [ics].[ThreadRunStart]
			@MappingConfigTaskName = 'MCTN'
		  , @MappingName = 'MN'
		  , @SubProcessRunId = 1 ;

		--! Assert
		exec tSQLt.AssertEqualsTable
			'#expected'
		  , 'batch.ThreadGetId_SpyProcedureLog' ;
	end ;