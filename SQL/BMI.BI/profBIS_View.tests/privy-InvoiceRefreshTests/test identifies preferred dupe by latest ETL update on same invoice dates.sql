CREATE procedure [privy-InvoiceRefreshTests].[test identifies preferred dupe by latest ETL update on same invoice dates]
as
begin
	exec tSQLt.FakeTable @TableName = 'stg.Invoice', @Identity = 1, @Defaults = 1 ;
	exec tSQLt.FakeTable 'privy.StagingLoadParameter' ;
	insert privy.StagingLoadParameter (ModuleName, DataCaptureStart, DataCaptureEnd)
	values ('[privy].[InvoiceRefresh]', '20170710 00:00:00', '20170715 23:59:59.997') ;

	create table #expected
	(
	  InvoiceKey int not null
	, EtlCreatedOn datetime null
	, EtlUpdatedOn datetime not null
	, REC_ID uniqueidentifier null -- QlikView surrogate key
	, Uniqueifier bigint null
	, GROUP_AMOUNT decimal(15, 4) null
	, DuplicateCount int null
	) ;

	--! What are the values we are going to insert?
	declare @_SBU varchar(8) = 'XXX'
		, @_InsertedOn datetime = dateadd(day, -1, getdate())
		, @_ModifiedOn datetime = getdate()
		, @_ModifiedBy varchar(200) = '[privy].[InvoiceRefresh]'
		, @_STD_ITEM_CATEGORY_ID int = 46247
		, @_STD_PAYMENT_TERM_ID int = 152
		, @_IsDeleted char(1) = 'N'
		, @_LOCAL_UOM nvarchar(20) = 'X'
		, @_LOCAL_UOM_HARMONIZED nvarchar(20) = 'Y'
		, @_LOCAL_UOM_FACTOR decimal(11, 4) = 1.4
		, @_SITE_ID int = 3
		, @_INVOICE_TYPE nvarchar(1) = '2'
		, @_LOCAL_SITE_SOLD nvarchar(20) = 'Z'
		, @_SYSTEM_ID int  = 2

	--!
	--! We need to start by setting up three completely identical records
	--! (the Uniqueifier will then be based on the REC_ID which is a GUID)
	--! Then we update a value one of the records (that is not already
	--! preferred) and validate that the Uniqueifier reflects the change
	--!
	declare @_I001A_REC_ID uniqueidentifier = newid()-- QlikView surrogate key
		, @_I001A_InvoiceKey int
		, @_I001A_DeltaHashOnInsert char(32)
		, @_I001A_DeltaHashOnUpdate char(32)
		-----------------------------------------------------------
		--! This is effectively the business key that the ETL process will lookup
		, @_I001A_INVOICE_NUMBER nvarchar(20) = 'IN001'
		, @_I001A_INVOICE_LINE_NUMBER nvarchar(20) = 'IN001-L1'
		, @_I001A_ORDER_NUMBER nvarchar(20) = 'ON001'
		, @_I001A_ORDER_LINE_NUMBER nvarchar(20)  = 'ON001-L1'
		-----------------------------------------------------------
		, @_I001A_INVOICE_DATE datetime = '20170710'
		, @_I001A_ITEM_NO nvarchar(50) = 'B'
		, @_I001A_INVOICE_QUANTITY decimal(12, 2) = 1234.12
		, @_I001A_INVOICE_AMOUNT decimal(15, 4) = 1234.23
		, @_I001A_GROUP_AMOUNT decimal(15, 4) = 1234.45
		, @_I001A_Uniqueifier bigint = 0
		, @_I001A_DuplicateCount int  = 3

	declare @_I001B_REC_ID uniqueidentifier = newid()-- QlikView surrogate key
		, @_I001B_InvoiceKey int
		, @_I001B_DeltaHashOnInsert char(32)
		, @_I001B_DeltaHashOnUpdate char(32)
		-----------------------------------------------------------
		--! This is effectively the business key that the ETL process will lookup
		, @_I001B_INVOICE_NUMBER nvarchar(20) = 'IN001'
		, @_I001B_INVOICE_LINE_NUMBER nvarchar(20) = 'IN001-L1'
		, @_I001B_ORDER_NUMBER nvarchar(20) = 'ON001'
		, @_I001B_ORDER_LINE_NUMBER nvarchar(20)  = 'ON001-L1'
		-----------------------------------------------------------
		, @_I001B_INVOICE_DATE datetime = '20170710'
		, @_I001B_ITEM_NO nvarchar(50) = 'B'
		, @_I001B_INVOICE_QUANTITY decimal(12, 2) = 1234.12
		, @_I001B_INVOICE_AMOUNT decimal(15, 4) = 1234.23
		, @_I001B_GROUP_AMOUNT decimal(15, 4) = 1234.45
		, @_I001B_Uniqueifier bigint = 0
		, @_I001B_DuplicateCount int  = 3

	declare @_I001C_REC_ID uniqueidentifier = newid()-- QlikView surrogate key
		, @_I001C_InvoiceKey int
		, @_I001C_DeltaHashOnInsert char(32)
		, @_I001C_DeltaHashOnUpdate char(32)
		-----------------------------------------------------------
		--! This is effectively the business key that the ETL process will lookup
		, @_I001C_INVOICE_NUMBER nvarchar(20) = 'IN001'
		, @_I001C_INVOICE_LINE_NUMBER nvarchar(20) = 'IN001-L1'
		, @_I001C_ORDER_NUMBER nvarchar(20) = 'ON001'
		, @_I001C_ORDER_LINE_NUMBER nvarchar(20)  = 'ON001-L1'
		-----------------------------------------------------------
		, @_I001C_INVOICE_DATE datetime = '20170710'
		, @_I001C_ITEM_NO nvarchar(50) = 'B'
		, @_I001C_INVOICE_QUANTITY decimal(12, 2) = 1234.12
		, @_I001C_INVOICE_AMOUNT decimal(15, 4) = 1234.23
		, @_I001C_GROUP_AMOUNT decimal(15, 4) = 1234.45
		, @_I001C_Uniqueifier bigint = 0
		, @_I001C_DuplicateCount int  = 3

	--! Because GUID's aren't sequential, we need to work out
	--! the Uniqueifier order for each test execution
	; with guidsCte (RecordId)
	as
	(
				  select @_I001A_REC_ID
		union all select @_I001B_REC_ID
		union all select @_I001C_REC_ID
	)
	, rankedCte (RecordId, Ranking)
	as
	(
		select
			  RecordId
			, row_number() over(order by RecordId asc)
		from
			guidsCte
	)
	select
		  @_I001A_Uniqueifier = case when RecordId = @_I001A_REC_ID then Ranking else @_I001A_Uniqueifier end
		, @_I001B_Uniqueifier = case when RecordId = @_I001B_REC_ID then Ranking else @_I001B_Uniqueifier end
		, @_I001C_Uniqueifier = case when RecordId = @_I001C_REC_ID then Ranking else @_I001C_Uniqueifier end
	from
		rankedCte ;

	--! Fake all the source tables
	exec Icopal_profBIS.tSQLt.FakeTable 'dbo.FLEXPARAMS' ;
	exec Icopal_profBIS.tSQLt.FakeTable 'dbo.SA_INVOICE' ;
	exec Icopal_profBIS.tSQLt.FakeTable 'dbo.PU_LINK_SITE' ;
	exec Icopal_profBIS.tSQLt.FakeTable 'dbo.MD_SITE' ;
	exec Icopal_profBIS.tSQLt.FakeTable 'dbo.MD_SBU' ;

	exec Icopal_profBIS.tSQLt.FakeTable 'dbo.PU_LINK_UOM' ;
	exec Icopal_profBIS.tSQLt.FakeTable 'dbo.SA_LINK_ITEM' ;
	exec Icopal_profBIS.tSQLt.FakeTable 'dbo.SA_LINK_ENV' ;
	exec Icopal_profBIS.tSQLt.FakeTable 'dbo.SA_LINK_CUSTOMER' ;
	exec Icopal_profBIS.tSQLt.FakeTable 'dbo.PU_LINK_PAYMENTTERM' ;

	--! Set up the Icopal_profBIS parameters that are used by privy.InvoiceRefresh
	insert Icopal_profBIS.dbo.FLEXPARAMS
	(   PARAMTYPE
	  , PARAMNAVN
	  , TEKST
	  , BESKRIVELSE
	  , ACCESS_DATE
	)
	values
		  ('DWH', 'PAYMENT_UNMAPPED', @_STD_PAYMENT_TERM_ID, 'BESKRIVELSE', '20170101')
		, ('DWH', 'SA_UNMAPPED_ITEM', @_STD_ITEM_CATEGORY_ID, 'BESKRIVELSE', '20170101')
		, ('DWH', 'SALES_NOT_QLIKVIEW', '46377', 'BESKRIVELSE', '20170101')
		, ('DWH', 'CUSTOMER_NOT_EXPORTED', '146875', 'BESKRIVELSE', '20170101')

	insert Icopal_profBIS.dbo.PU_LINK_SITE (SITE_ID, SYSTEM_ID, LOCAL_SITE) values (@_SITE_ID, @_SYSTEM_ID, @_LOCAL_SITE_SOLD) ;
	insert Icopal_profBIS.dbo.MD_SITE (SITE_ID, SBU, SYSTEM_ID) values (@_SITE_ID, @_SBU, @_SYSTEM_ID) ;
	insert Icopal_profBIS.dbo.MD_SBU (SBU, SABIS) values (@_SBU, 'Y') ;
	insert Icopal_profBIS.dbo.PU_LINK_UOM (SYSTEM_ID, LOCAL_UOM, HARMONIZED_UOM, FACTOR) values (@_SYSTEM_ID, @_LOCAL_UOM, @_LOCAL_UOM_HARMONIZED, @_LOCAL_UOM_FACTOR) ;

	--! Set up the source data
	insert Icopal_profBIS.dbo.SA_INVOICE
	(
	  REC_ID
	, SYSTEM_ID
	, SITE_SOLD
	, INVOICE_NUMBER
	, INVOICE_LINE_NUMBER
	, ORDER_NUMBER
	, ORDER_LINE_NUMBER
	, INVOICE_DATE
	, INVOICE_TYPE
	, ITEM_NO
	, INVOICE_QUANTITY
	, INVOICE_AMOUNT
	, GROUP_AMOUNT
	)
	values
	(
	  @_I001A_REC_ID, @_SYSTEM_ID, @_LOCAL_SITE_SOLD
	, @_I001A_INVOICE_NUMBER, @_I001A_INVOICE_LINE_NUMBER, @_I001A_ORDER_NUMBER, @_I001A_ORDER_LINE_NUMBER
	, @_I001A_INVOICE_DATE, @_INVOICE_TYPE, @_I001A_ITEM_NO
	, @_I001A_INVOICE_QUANTITY, @_I001A_INVOICE_AMOUNT, @_I001A_GROUP_AMOUNT
	)
	, (
	  @_I001B_REC_ID, @_SYSTEM_ID, @_LOCAL_SITE_SOLD
	, @_I001B_INVOICE_NUMBER, @_I001B_INVOICE_LINE_NUMBER, @_I001B_ORDER_NUMBER, @_I001B_ORDER_LINE_NUMBER
	, @_I001B_INVOICE_DATE, @_INVOICE_TYPE, @_I001B_ITEM_NO
	, @_I001B_INVOICE_QUANTITY, @_I001B_INVOICE_AMOUNT, @_I001B_GROUP_AMOUNT
	)
	, (
	  @_I001C_REC_ID, @_SYSTEM_ID, @_LOCAL_SITE_SOLD
	, @_I001C_INVOICE_NUMBER, @_I001C_INVOICE_LINE_NUMBER, @_I001C_ORDER_NUMBER, @_I001C_ORDER_LINE_NUMBER
	, @_I001C_INVOICE_DATE, @_INVOICE_TYPE, @_I001C_ITEM_NO
	, @_I001C_INVOICE_QUANTITY, @_I001C_INVOICE_AMOUNT, @_I001C_GROUP_AMOUNT
	)

	--! Because privy.InvoiceDeltaHash() seems to generate the MD5 hash for the same values differently
	--! when passing variables as opposed to reading columns, use privy.InvoiceRefresh to set the data up
	exec privy.InvoiceRefresh @LoadStart = @_InsertedOn, @DebugLevel = 0 ;

	--! Get the current Key and Hash values (we check later to ensure that the hash changes for all updated records)
	select @_I001A_InvoiceKey = InvoiceKey, @_I001A_DeltaHashOnInsert = EtlDeltaHash from stg.Invoice where REC_ID = @_I001A_REC_ID ;
	select @_I001B_InvoiceKey = InvoiceKey, @_I001B_DeltaHashOnInsert = EtlDeltaHash from stg.Invoice where REC_ID = @_I001B_REC_ID ;
	select @_I001C_InvoiceKey = InvoiceKey, @_I001C_DeltaHashOnInsert = EtlDeltaHash from stg.Invoice where REC_ID = @_I001C_REC_ID ;

	--! What do we expect to see?
	insert #expected
	(
	  InvoiceKey
	, EtlCreatedOn
	, EtlUpdatedOn
	, REC_ID
	, Uniqueifier
	, GROUP_AMOUNT
	, DuplicateCount
	)
	values
	(
	  @_I001B_InvoiceKey
	, @_InsertedOn
	, @_InsertedOn
	, @_I001B_REC_ID
	, @_I001B_Uniqueifier
	, @_I001B_GROUP_AMOUNT
	, @_I001B_DuplicateCount
	)
	, (
	  @_I001A_InvoiceKey
	, @_InsertedOn
	, @_InsertedOn
	, @_I001A_REC_ID
	, @_I001A_Uniqueifier
	, @_I001A_GROUP_AMOUNT
	, @_I001A_DuplicateCount
	)
	, (
	  @_I001C_InvoiceKey
	, @_InsertedOn
	, @_InsertedOn
	, @_I001C_REC_ID
	, @_I001C_Uniqueifier
	, @_I001C_GROUP_AMOUNT
	, @_I001C_DuplicateCount
	)

	exec tSQLt.AssertEqualsTable '#expected', 'stg.Invoice', ' One or more values do not match the expected result after the initial invoice refresh'

	--!
	--! Now update the values 
	--! Find out which one is currently ranked 3nd and change something so that
	--! it changes to first (and the other Uniquifiers should also change.
	--!
	declare @_REC_ID uniqueidentifier = (select REC_ID from stg.Invoice where Uniqueifier = 3)
		
	--! Change a source value for the record of interest
	update Icopal_profBIS.dbo.SA_INVOICE set GROUP_AMOUNT = GROUP_AMOUNT + 1 where REC_ID = @_REC_ID;
	
	--! Updated the record of interest in the expected data set
	update #expected set GROUP_AMOUNT = GROUP_AMOUNT + 1, Uniqueifier = 1, EtlUpdatedOn = @_ModifiedOn where REC_ID = @_REC_ID;

	--! We expect the Uniqueifier to change for non-preferred records too
	update #expected set Uniqueifier = Uniqueifier + 1 where REC_ID <> @_REC_ID

	--! Act - run InvoiceRefresh again to pick up the changes
	exec privy.InvoiceRefresh @LoadStart = @_ModifiedOn, @DebugLevel = 0 ;
	
	exec tSQLt.AssertEqualsTable '#expected', 'stg.Invoice', ' One or more values do not match the expected result after the updating invoice refresh'

	--! Get the new Hash values so we can make sure they've all been updated
	select @_I001A_DeltaHashOnUpdate = EtlDeltaHash from stg.Invoice where REC_ID = @_I001A_REC_ID ;
	select @_I001B_DeltaHashOnUpdate = EtlDeltaHash from stg.Invoice where REC_ID = @_I001B_REC_ID ;
	select @_I001C_DeltaHashOnUpdate = EtlDeltaHash from stg.Invoice where REC_ID = @_I001C_REC_ID ;

	if @_I001A_DeltaHashOnUpdate = @_I001A_DeltaHashOnInsert
		exec tSQLt.Fail @Message0 = N'Expected MD5 hash for I001A to be different but both hashes were identical' ;

	if @_I001B_DeltaHashOnUpdate = @_I001B_DeltaHashOnInsert
		exec tSQLt.Fail @Message0 = N'Expected MD5 hash for I001B to be different but both hashes were identical' ;

	if @_I001C_DeltaHashOnUpdate = @_I001C_DeltaHashOnInsert
		exec tSQLt.Fail @Message0 = N'Expected MD5 hash for I001C to be different but both hashes were identical' ;

	--! Act - run InvoiceRefresh one last time to ensure we are not making unnecessary changes
	set @_ModifiedOn = dateadd(hour, 1, @_ModifiedOn);
	exec privy.InvoiceRefresh @LoadStart = @_ModifiedOn, @DebugLevel = 0 ;
	
	--! Finally, check that if there are no changes at source, the records do not change again in stg.Invoice
	exec tSQLt.AssertEqualsTable '#expected', 'stg.Invoice', ' One or more values do not match the expected result after the non-changing invoice refresh'
end