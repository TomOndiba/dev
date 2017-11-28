IF OBJECT_ID('[Ics-ModuleTests].[test ThreadRunStart sets @Instruction]') IS NOT NULL
	DROP PROCEDURE [Ics-ModuleTests].[test ThreadRunStart sets @Instruction];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   procedure [Ics-ModuleTests].[test ThreadRunStart sets @Instruction]
as
	begin
		--! Mock all the calls that might be made by this wrapper sproc
		declare
			@SetDate as datetime	= getdate()
		  , @expected	varchar(50) = 'RUN'
		  , @actual		varchar(50) ;

		exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler' ;

		exec tSQLt.SpyProcedure @ProcedureName = N'ics.MappingConfigTaskGetId' ;

		exec tSQLt.SpyProcedure
			@ProcedureName = N'batch.ThreadGetId'
		  , @CommandToExecute = N'set @StepId=1' ;

		--! Act
		exec [ics].[ThreadRunStart]
			@MappingConfigTaskName = 'MCTN'
		  , @MappingName = 'MN'
		  , @SubProcessRunId = 1
		  , @Instruction = @actual output ;

		--------! Assert
		exec tSQLt.AssertEquals
			@Expected = @expected	-- sql_variant
		  , @Actual = @actual ;		-- sql_variant

	end ;
GO
