CREATE   procedure [Ics-ModuleTests].[test ProcessRunStart insert row into batch.ProcessRun table for a disabled process]
as
	begin

		declare @SetDate datetime = getdate() ;

		alter table batch.Process nocheck constraint all ;
		alter table batch.ProcessRun nocheck constraint all ;

		delete	from batch.Process ;
		delete	from batch.ProcessRun ;
		dbcc checkident('batch.ProcessRun', reseed, 0) ;

		exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler' ;
		
		alter table [batch].[Process] drop constraint [DF_batch_Process_IsDisabled] ;
		alter table [batch].[Process]
		add constraint [DF_batch_Process_IsDisabled] default 1 for [IsDisabled] ;
		
		update	batch.Process set	IsDisabled = 1 ;
		
		exec [ics].[ProcessRunStart]
			@ProcessName = 'Test PN1'
		  , @IcrtProcessId = 999
		  , @SetDate = @SetDate ;

		create table #Expected
		(
			[ProcessRunId]				[int]
		  , [BatchProcessId]			[int]		   null
		  , [IcrtProcessId]				[int]		   null
		  , [StartTime]					[datetime]	   null
		  , [EndTime]					[datetime]	   null
		  , [RunStateId]				[int]		   null
		  , [EndState]					[varchar](16)  collate Latin1_General_CS_AS null
		  , [EndMessage]				[varchar](500) collate Latin1_General_CS_AS null
		  , [MinChangeDataCapturePoint] [datetime]	   null
		  , [MaxChangeDataCapturePoint] [datetime]	   null
		) ;

		insert into #Expected
		(
			ProcessRunId
		  , BatchProcessId
		  , IcrtProcessId
		  , StartTime
		  , EndTime
		  , RunStateId
		  , EndState
		  , EndMessage
		  , MinChangeDataCapturePoint
		  , MaxChangeDataCapturePoint
		)
		select
			1					  as [ProcessRunId]
		  , 1					  as [BatchProcessId]
		  , 999					  [IcrtProcessId]
		  , @SetDate			  as [StartTime]
		  , @SetDate			  [EndTime]
		  , 4					  as [RunStateId]
		  , 'process stopped'	  as [EndState]
		  , 'process is disabled' as [EndMessage]
		  , cast(null as datetime)			  [MinChangeDataCapturePoint]
		  ,cast(null as datetime)			  [MaxChangeDataCapturePoint] ;
		;

		exec tSQLt.AssertEqualsTable '#Expected', 'batch.ProcessRun' ;

	end ;