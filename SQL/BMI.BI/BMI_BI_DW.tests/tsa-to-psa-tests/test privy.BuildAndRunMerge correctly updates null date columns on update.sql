CREATE      procedure [tsa-to-psa-tests].[test privy.BuildAndRunMerge correctly updates null date columns on update]
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
		  , col1			 date

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
			, [EtlUpdatedOn]
			, [EtlUpdatedBy]
		  --, [EtlDeletedOn]
		  --, [EtlDeletedBy]
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
		,@_now
				, 'Razia'
		  --, @_now
		  --, 'Razia'
		  , null 	---when deleted
		  , null
		  , 1
		  , cast( @_now as date) ;


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
		  , col1			 date
		  ,ExcludeFromMerge bit default 0
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
		  , col1			 date

		) ;


		insert into test_tsa.ICS_LAND_Dummy ([EtlBatchRunId], [EtlStepRunId], [EtlThreadRunId], [EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable], [DataSourceKey], pk, col1)
		select	1, 1, 1, @_now, 'Razia', 'Dummy', 1, 1, cast(@_now as date) ;

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
		select	1, 1, 1, @_now, 'Razia', 'Dummy', 1, 1, null ;


		exec privy.BuildAndRunMerge
			@Runtype = 'Full'
		  , @SourceTableName = 'ICS_LAND_Dummy'
		  , @SourceSchemaName = 'test_tsa'
		  , @TargetTableName = 'ICS_STG_Dummy'
		  , @TargetSchemaName = 'test_psa'
		  , @LoadDateTime = @_now ;


		  


		exec tSQLt.AssertEqualsTable
			@Expected = '[tsa-to-psa-tests].Expected'
		  , @Actual = N'test_psa.ICS_STG_Dummy' ;


	end ;