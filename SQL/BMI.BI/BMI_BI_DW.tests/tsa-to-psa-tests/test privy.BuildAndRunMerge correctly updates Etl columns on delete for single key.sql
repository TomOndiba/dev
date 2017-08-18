﻿CREATE    procedure [tsa-to-psa-tests].[test privy.BuildAndRunMerge correctly updates Etl columns on delete for single key]
as
	begin

		declare @_now varchar(200) = getdate() ;

		create table [tsa-to-psa-tests].Expected
		(
			[EtlBatchRunId]	 int
		  , [EtlStepRunId]	 int
		  , [EtlThreadRunId] int
		  , [EtlCreatedOn]	 datetime
		  , [EtlCreatedBy]	 varchar(200)
		  , [EtlSourceTable] varchar(50)
		  , [DataSourceKey]	 int
		  , [EtlUpdatedOn]	 datetime
		  , [EtlUpdatedBy]	 varchar(200)
		  , [EtlDeletedOn]	 datetime
		  , [EtlDeletedBy]	 varchar(200)
		  , IsDeleted		 char(1)
		  , IsIncomplete	 char(1)
		  , pk				 int
		  , col1			 int
		
		) ;


		insert into [tsa-to-psa-tests].Expected
		(
			[EtlBatchRunId]
		  , [EtlStepRunId]
		  , [EtlThreadRunId]
		  , [EtlCreatedOn]
		  , [EtlCreatedBy]
		  , [EtlSourceTable]
		  , [DataSourceKey]
			--, [EtlUpdatedOn]
			--, [EtlUpdatedBy]
		  , [EtlDeletedOn]
		  , [EtlDeletedBy]
		  , IsDeleted
		  , IsIncomplete
		  , pk
		  , col1
		)
		select
			1
		  , 1
		  , 1
		  , @_now
		  , 'Razia'
		  , 'Dummy'
		  , 1
				--, @_now
				--, 'Razia'
		  , @_now
		  , 'Razia'
		  , 1	---when deleted
		  , null
		  , 2
		  , 1 ;


		exec (N'create schema test_tsa;') ;
		exec (N'create schema test_psa;') ;

		create table test_tsa.ICS_LAND_Dummy
		(
			[EtlBatchRunId]	 int
		  , [EtlStepRunId]	 int
		  , [EtlThreadRunId] int
		  , [EtlCreatedOn]	 datetime
		  , [EtlCreatedBy]	 varchar(50)
		  , [EtlSourceTable] varchar(50)
		  , [DataSourceKey]	 int
		  , pk				 int		primary key
		  , col1			 int
		  ,ExcludeFromMerge bit
		) ;

		create table test_psa.ICS_STG_Dummy
		(
			[EtlBatchRunId]	 int
		  , [EtlStepRunId]	 int
		  , [EtlThreadRunId] int
		  , [EtlCreatedOn]	 datetime
		  , [EtlCreatedBy]	 varchar(50)
		  , [EtlSourceTable] varchar(50)
		  , [DataSourceKey]	 int
		  , [EtlUpdatedOn]	 datetime
		  , [EtlUpdatedBy]	 varchar(50)
		  , [EtlDeletedOn]	 datetime
		  , [EtlDeletedBy]	 varchar(50)
		  , [IsDeleted]		 char(1)
		  , IsIncomplete	 char(1)
		  , pk				 int		primary key
		  , col1			 int
	
		) ;


		--insert into test_tsa.ICS_LAND_Dummy ([EtlBatchRunId], [EtlStepRunId], [EtlThreadRunId], [EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable], [DataSourceKey], pk, col1)
		--select	1, 1, 1, @_now, 'Razia', 'Dummy', 1, 1, 1 ;

		insert into test_psa.ICS_STG_Dummy
		(
			[EtlBatchRunId]
		  , [EtlStepRunId]
		  , [EtlThreadRunId]
		  , [EtlCreatedOn]
		  , [EtlCreatedBy]
		  , [EtlSourceTable]
		  , [DataSourceKey]
		  , pk
		  , col1
		)
		select	1, 1, 1, @_now, 'Razia', 'Dummy', 1, 2, 1 ;


		exec privy.TsaToPsaBuildAndRunMerge
			@RunType = 'Full'
		  , @SourceTableName = 'ICS_LAND_Dummy'
		  , @SourceSchemaName = 'test_tsa'
		  , @TargetTableName = 'ICS_STG_Dummy'
		  , @TargetSchemaName = 'test_psa'
		  , @LoadDateTime = @_now ;

		exec tSQLt.AssertEqualsTable
			@Expected = '[tsa-to-psa-tests].Expected'
		  , @Actual = N'test_psa.ICS_STG_Dummy' ;


	end ;