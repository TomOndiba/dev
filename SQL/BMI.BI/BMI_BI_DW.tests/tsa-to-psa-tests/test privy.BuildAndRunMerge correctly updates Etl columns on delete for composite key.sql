﻿
CREATE   procedure [tsa-to-psa-tests].[test privy.BuildAndRunMerge correctly updates Etl columns on delete for composite key]
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
		  , pk1				 int
		  , pk2				 int
		  , pk3              int
		  , col1			 int
		  , col2			 varchar(50)
		 
		  , primary key (pk1,pk2,pk3)
		) ;


		Insert into [tsa-to-psa-tests].Expected([EtlBatchRunId], [EtlStepRunId], [EtlThreadRunId], [EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable], [DataSourceKey], [EtlUpdatedOn],[EtlUpdatedBy],
		[EtlDeletedOn], [EtlDeletedBy], IsDeleted,IsIncomplete, pk1, pk2, pk3, col1, col2)
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,null ,null,@_now	,'Razia',1 ,null	,1	,1	,1 ,12	,'col'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,null ,null,@_now	,'Razia',1 ,null	,1	,1	,2 ,13	,'col'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,null ,null,@_now	,'Razia',1 ,null	,1	,1  ,3 ,14	,'col'	
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,null ,null,@_now	,'Razia',1 ,null	,2	,2	,2 ,12	,'col'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,null ,null,@_now	,'Razia',1 ,null	,3	,3	,3 ,13	,'col'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,null ,null,@_now	,'Razia',1 ,null	,2	,1	,2 ,12	,'col'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,null ,null,@_now	,'Razia',1 ,null	,1	,2	,2 ,12	,'col'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,null ,null,@_now	,'Razia',1 ,null	,1	,2	,3 ,13	,'col'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,null ,null,@_now	,'Razia',1 ,null	,1	,3  ,1 ,14	,'col'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,null ,null,@_now	,'Razia',1 ,null	,1	,3	,2 ,12	,'col'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,null ,null,@_now	,'Razia',1 ,null	,1	,3	,3 ,13	,'col'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,null ,null,@_now	,'Razia',1 ,null	,2	,1  ,1 ,14	,'col'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,null ,null,@_now	,'Razia',1 ,null	,2	,1	,3 ,13	,'col'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,null ,null,@_now	,'Razia',1 ,null	,2	,2  ,1 ,14	,'col'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,null ,null,@_now	,'Razia',1 ,null	,2	,2	,3 ,12	,'col'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,null ,null,@_now	,'Razia',1 ,null	,3	,1	,1 ,13	,'col'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,null ,null,@_now	,'Razia',1 ,null	,3	,1  ,2 ,14	,'col'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,null ,null,@_now	,'Razia',1 ,null	,3	,1	,3 ,12	,'col'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,null ,null,@_now	,'Razia',1 ,null	,3	,2	,1 ,13	,'col'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,null ,null,@_now	,'Razia',1 ,null	,3	,2	,3 ,13	,'col'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,null ,null,@_now	,'Razia',1 ,null	,2	,3	,1 ,12	,'col'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,null ,null,@_now	,'Razia',1 ,null	,2	,3	,2 ,13	,'col'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,null ,null,@_now	,'Razia',1 ,null	,2	,3	,3 ,13	,'col'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,null ,null,@_now	,'Razia',1 ,null	,3	,3	,1 ,12	,'col'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,null ,null,@_now	,'Razia',1 ,null	,3	,3	,2 ,13	,'col'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,null ,null,@_now	,'Razia',1 ,null	,3	,2	,2 ,13	,'col'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,null ,null,@_now	,'Razia',1 ,null	,1	,2  ,1 ,14	,'col'
	
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
		  , pk1				 int		
		  , pk2				 int
		  , pk3				 int
		  , col1			 int
		  , col2			 varchar(50)
		  ,ExcludeFromMerge smallint
		  ,primary key (pk1,pk2,pk3)
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
		  , pk1				 int		
		  , pk2			     int		
		  , pk3				 int
		  , col1			 int
		  , col2			 varchar(50)
		    ,primary key (pk1,pk2,pk3)
		) ;	
---------------------------------stg
		insert into test_psa.ICS_STG_Dummy([EtlBatchRunId], [EtlStepRunId], [EtlThreadRunId], [EtlCreatedOn], [EtlCreatedBy],[EtlSourceTable], [DataSourceKey], pk1 , pk2 , pk3 , col1 , col2)
		select	1, 1, 1, @_now, 'Razia', 'Dummy', 1, 1, 1, 1, 12, 'col'
		union
		select	1, 1, 1, @_now, 'Razia', 'Dummy', 1, 1, 1, 2, 13, 'col'
		union
		select	1, 1, 1, @_now, 'Razia', 'Dummy', 1, 1, 1, 3, 14, 'col'
		union
		select	1, 1, 1, @_now, 'Razia', 'Dummy', 1, 2, 2, 2, 12, 'col'
		union
		select	1, 1, 1, @_now, 'Razia', 'Dummy', 1, 3, 3, 3, 13, 'col'
		union
		select	1, 1, 1, @_now, 'Razia', 'Dummy', 1, 2, 1, 2, 12, 'col'
		union
		select	1, 1, 1, @_now, 'Razia', 'Dummy', 1, 1, 2, 2, 12, 'col'
		union
		select	1, 1, 1, @_now, 'Razia', 'Dummy', 1, 1, 2, 3, 13, 'col'
		union
		select	1, 1, 1, @_now, 'Razia', 'Dummy', 1, 1, 3, 1, 14, 'col'
		union
		select	1, 1, 1, @_now, 'Razia', 'Dummy', 1, 1, 3, 2, 12, 'col'
		union
		select	1, 1, 1, @_now, 'Razia', 'Dummy', 1, 1, 3, 3, 13, 'col'
		union
		select	1, 1, 1, @_now, 'Razia', 'Dummy', 1, 2, 1, 1, 14, 'col'
		union
		select	1, 1, 1, @_now, 'Razia', 'Dummy', 1, 2, 1, 3, 13, 'col'
		union
		select	1, 1, 1, @_now, 'Razia', 'Dummy', 1, 2, 2, 1, 14, 'col'
		union
		select	1, 1, 1, @_now, 'Razia', 'Dummy', 1, 2, 2, 3, 12, 'col'
		union
		select	1, 1, 1, @_now, 'Razia', 'Dummy', 1, 3, 1, 1, 13, 'col'
		union
		select	1, 1, 1, @_now, 'Razia', 'Dummy', 1, 3, 1, 2, 14, 'col'
		union
		select	1, 1, 1, @_now, 'Razia', 'Dummy', 1, 3, 1, 3, 12, 'col'
		union
		select	1, 1, 1, @_now, 'Razia', 'Dummy', 1, 3, 2, 1, 13, 'col'
		union
		select	1, 1, 1, @_now, 'Razia', 'Dummy', 1, 3, 2, 3, 13, 'col'
		union
		select	1, 1, 1, @_now, 'Razia', 'Dummy', 1, 2, 3, 1, 12, 'col'
		union
		select	1, 1, 1, @_now, 'Razia', 'Dummy', 1, 2, 3, 2, 13, 'col'
		union
		select	1, 1, 1, @_now, 'Razia', 'Dummy', 1, 2, 3, 3, 13, 'col'
		union
		select	1, 1, 1, @_now, 'Razia', 'Dummy', 1, 3, 3, 1, 12, 'col'
		union
		select	1, 1, 1, @_now, 'Razia', 'Dummy', 1, 3, 3, 2, 13, 'col'
		union
		select	1, 1, 1, @_now, 'Razia', 'Dummy', 1, 3, 2, 2, 13, 'col'
		union
		select	1, 1, 1, @_now, 'Razia', 'Dummy', 1, 1, 2, 1, 14, 'col' ;

			
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