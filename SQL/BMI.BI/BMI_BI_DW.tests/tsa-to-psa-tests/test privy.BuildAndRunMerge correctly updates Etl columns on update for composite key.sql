
CREATE   procedure [tsa-to-psa-tests].[test privy.BuildAndRunMerge correctly updates Etl columns on update for composite key]
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
		  , [EtlDeletedOn] 
		  , [EtlDeletedBy]
		  , IsDeleted
		  , IsIncomplete
		  , pk1
		  , pk2
		  , pk3
		  , col1
		  , col2
		)
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,@_now	,'Razia',null ,null,null ,null	,1	,1	,1 ,12	,'col1u'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,@_now	,'Razia',null ,null,null ,null	,1	,1	,2 ,13	,'col2u'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,@_now	,'Razia',null ,null,null ,null	,1	,1  ,3 ,14	,'col3u'	
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,@_now	,'Razia',null ,null,null ,null	,2	,2	,2 ,12	,'col4u'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,@_now	,'Razia',null ,null,null ,null	,3	,3	,3 ,13	,'col5u'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,@_now	,'Razia',null ,null,null ,null	,2	,1	,2 ,12	,'col6u'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,@_now	,'Razia',null ,null,null ,null	,1	,2	,2 ,12	,'col7u'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,@_now	,'Razia',null ,null,null ,null	,1	,2	,3 ,13	,'col8u'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,@_now	,'Razia',null ,null,null ,null	,1	,3  ,1 ,14	,'col9u'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,@_now	,'Razia',null ,null,null ,null	,1	,3	,2 ,12	,'col10u'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,@_now	,'Razia',null ,null,null ,null	,1	,3	,3 ,13	,'col11u'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,@_now	,'Razia',null ,null,null ,null	,2	,1  ,1 ,14	,'col12u'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,@_now	,'Razia',null ,null,null ,null	,2	,1	,3 ,13	,'col13u'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,@_now	,'Razia',null ,null,null ,null	,2	,2  ,1 ,14	,'col14u'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,@_now	,'Razia',null ,null,null ,null	,2	,2	,3 ,12	,'col15u'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,@_now	,'Razia',null ,null,null ,null	,3	,1	,1 ,13	,'col16u'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,@_now	,'Razia',null ,null,null ,null	,3	,1  ,2 ,14	,'col17u'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,@_now	,'Razia',null ,null,null ,null	,3	,1	,3 ,12	,'col18u'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,@_now	,'Razia',null ,null,null ,null	,3	,2	,1 ,13	,'col19u'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,@_now	,'Razia',null ,null,null ,null	,3	,2	,3 ,13	,'col20u'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,@_now	,'Razia',null ,null,null ,null	,2	,3	,1 ,12	,'col21u'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,@_now	,'Razia',null ,null,null ,null	,2	,3	,2 ,13	,'col22u'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,@_now	,'Razia',null ,null,null ,null	,2	,3	,3 ,13	,'col23u'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,@_now	,'Razia',null ,null,null ,null	,3	,3	,1 ,12	,'col24u'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,@_now	,'Razia',null ,null,null ,null	,3	,3	,2 ,13	,'col25u'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,@_now	,'Razia',null ,null,null ,null	,3	,2	,2 ,13	,'col26u'
		union
		select	1, 1 ,1	,@_now	,'Razia','Dummy',1	,@_now	,'Razia',null ,null,null ,null	,1	,2  ,1 ,14	,'col27u'
	
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
		  ,ExcludeFromMerge  bit default 0
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

		insert into test_tsa.ICS_LAND_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,1	,1	,1 ,12	,'col1u'

		insert into test_tsa.ICS_LAND_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,1	,1	,2 ,13	,'col2u'

		insert into test_tsa.ICS_LAND_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,1	,1  ,3 ,14	,'col3u'

		insert into test_tsa.ICS_LAND_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,2	,2	,2 ,12	,'col4u'

		insert into test_tsa.ICS_LAND_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,3	,3	,3 ,13	,'col5u'

		insert into test_tsa.ICS_LAND_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,2	,1	,2 ,12	,'col6u'

		insert into test_tsa.ICS_LAND_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,1	,2	,2 ,12	,'col7u'

		insert into test_tsa.ICS_LAND_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,1	,2	,3 ,13	,'col8u'

		insert into test_tsa.ICS_LAND_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,1	,3  ,1 ,14	,'col9u'

		insert into test_tsa.ICS_LAND_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,1	,3	,2 ,12	,'col10u'

		insert into test_tsa.ICS_LAND_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,1	,3	,3 ,13	,'col11u'

		insert into test_tsa.ICS_LAND_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,2	,1  ,1 ,14	,'col12u'

		insert into test_tsa.ICS_LAND_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,2	,1	,3 ,13	,'col13u'
			
		insert into test_tsa.ICS_LAND_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,2	,2  ,1 ,14	,'col14u'
			
		insert into test_tsa.ICS_LAND_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,2	,2	,3 ,12	,'col15u'
			
		insert into test_tsa.ICS_LAND_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,3	,1	,1 ,13	,'col16u'
			
		insert into test_tsa.ICS_LAND_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,3	,1  ,2 ,14	,'col17u'
			
		insert into test_tsa.ICS_LAND_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,3	,1	,3 ,12	,'col18u'
						
		insert into test_tsa.ICS_LAND_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,3	,2	,1 ,13	,'col19u'
			
		insert into test_tsa.ICS_LAND_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,3	,2	,3 ,13	,'col20u'
			
		insert into test_tsa.ICS_LAND_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,2	,3	,1 ,12	,'col21u'
			
		insert into test_tsa.ICS_LAND_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,2	,3	,2 ,13	,'col22u'
			
		insert into test_tsa.ICS_LAND_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,2	,3	,3 ,13	,'col23u'
			
		insert into test_tsa.ICS_LAND_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,3	,3	,1 ,12	,'col24u'
			
		insert into test_tsa.ICS_LAND_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,3	,3	,2 ,13	,'col25u'
			
		insert into test_tsa.ICS_LAND_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,3	,2	,2 ,13	,'col26u'
			
		insert into test_tsa.ICS_LAND_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,1	,2  ,1 ,14	,'col27u'

---------------------------------stg

		insert into test_psa.ICS_STG_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,1	,1	,1 ,12	,'col2'

		insert into test_psa.ICS_STG_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,1	,1	,2 ,13	,'col3'

		insert into test_psa.ICS_STG_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,1	,1  ,3 ,14	,'col4'

		insert into test_psa.ICS_STG_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,2	,2	,2 ,12	,'col2'

		insert into test_psa.ICS_STG_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,3	,3	,3 ,13	,'col3'

		insert into test_psa.ICS_STG_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,2	,1	,2 ,12	,'col2'

		insert into test_psa.ICS_STG_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,1	,2	,2 ,12	,'col2'

		insert into test_psa.ICS_STG_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,1	,2	,3 ,13	,'col3'

		insert into test_psa.ICS_STG_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,1	,3  ,1 ,14	,'col4'

		insert into test_psa.ICS_STG_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,1	,3	,2 ,12	,'col2'

		insert into test_psa.ICS_STG_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,1	,3	,3 ,13	,'col3'

		insert into test_psa.ICS_STG_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,2	,1  ,1 ,14	,'col4'
						
		insert into test_psa.ICS_STG_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,2	,1	,3 ,13	,'col3'
			
		insert into test_psa.ICS_STG_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,2	,2  ,1 ,14	,'col4'
			
		insert into test_psa.ICS_STG_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,2	,2	,3 ,12	,'col2'
			
		insert into test_psa.ICS_STG_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,3	,1	,1 ,13	,'col3'
			
		insert into test_psa.ICS_STG_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,3	,1  ,2 ,14	,'col4'
			
		insert into test_psa.ICS_STG_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,3	,1	,3 ,12	,'col2'
		
		insert into test_psa.ICS_STG_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,3	,2	,1 ,13	,'col3'
			
		insert into test_psa.ICS_STG_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,3	,2	,3 ,13	,'col3'
			
		insert into test_psa.ICS_STG_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,2	,3	,1 ,12	,'col2'
			
		insert into test_psa.ICS_STG_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,2	,3	,2 ,13	,'col3'
			
		insert into test_psa.ICS_STG_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,2	,3	,3 ,13	,'col3'
			
		insert into test_psa.ICS_STG_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,3	,3	,1 ,12	,'col2'
			
		insert into test_psa.ICS_STG_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,3	,3	,2 ,13	,'col3'
			
		insert into test_psa.ICS_STG_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,3	,2	,2 ,13	,'col3'
			
		insert into test_psa.ICS_STG_Dummy([EtlBatchRunId] , [EtlStepRunId], [EtlThreadRunId] ,[EtlCreatedOn], [EtlCreatedBy], [EtlSourceTable] 
		, [DataSourceKey], pk1, pk2, pk3,col1	, col2	)		
			select	1, 1, 1, @_now, 'Razia', 'Dummy', 1,1	,2  ,1 ,14	,'col4'

			
		exec privy.BuildAndRunMerge
			@Runtype = 'Delta'
		  , @SourceTableName = 'ICS_LAND_Dummy'
		  , @SourceSchemaName = 'test_tsa'
		  , @TargetTableName = 'ICS_STG_Dummy'
		  , @TargetSchemaName = 'test_psa'
		  , @LoadDateTime = @_now ;

		exec tSQLt.AssertEqualsTable
			@Expected = '[tsa-to-psa-tests].Expected'
		  , @Actual = N'test_psa.ICS_STG_Dummy' ;

	end ;