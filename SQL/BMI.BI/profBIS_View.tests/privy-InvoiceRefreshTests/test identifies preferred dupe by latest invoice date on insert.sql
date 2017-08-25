CREATE procedure [privy-InvoiceRefreshTests].[test identifies preferred dupe by latest invoice date on insert]
as
begin
	exec tSQLt.FakeTable @TableName = 'stg.Invoice', @Identity = 1, @Defaults = 1 ;
	exec tSQLt.FakeTable 'privy.StagingLoadParameter' ;
	insert privy.StagingLoadParameter (ModuleName, DataCaptureStart, DataCaptureEnd)
	values ('[privy].[InvoiceRefresh]', '20170710 00:00:00', '20170715 23:59:59.997') ;

	create table #expected
	(
	  InvoiceKey int not null
	, EtlDeltaHash char(32) collate Danish_Norwegian_CI_AS null
	, EtlCreatedOn datetime null
	, EtlCreatedBy varchar(200) collate Danish_Norwegian_CI_AS null
	, EtlUpdatedOn datetime not null
	, EtlUpdatedBy varchar(200) collate Danish_Norwegian_CI_AS null
	, IsDeleted char(1) collate Danish_Norwegian_CI_AS null
	-----------------------------------------------------------
	, REC_ID uniqueidentifier null -- QlikView surrogate key
	-----------------------------------------------------------
	--! This is effectively the business key that the ETL process will lookup
	, SYSTEM_ID int null
	, INVOICE_DATE datetime null
	, INVOICE_NUMBER nvarchar(20) collate Danish_Norwegian_CI_AS null
	, INVOICE_LINE_NUMBER nvarchar(20) collate Danish_Norwegian_CI_AS null
	, ORDER_NUMBER nvarchar(20) collate Danish_Norwegian_CI_AS null
	, ORDER_LINE_NUMBER nvarchar(20) collate Danish_Norwegian_CI_AS null
	, Uniqueifier bigint null
	-----------------------------------------------------------
	, INVOICE_TYPE nvarchar(1) collate Danish_Norwegian_CI_AS null
	, SITE_ID int null
	, ITEM_NO nvarchar(50) collate Danish_Norwegian_CI_AS null
	, INVOICE_QUANTITY decimal(12, 2) null
	, INVOICE_AMOUNT decimal(15, 4) null
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

	declare @_I001A_REC_ID uniqueidentifier = newid()-- QlikView surrogate key
		, @_I001A_InvoiceKey int
		, @_I001A_DeltaHash char(32)
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
		, @_I001A_Uniqueifier bigint = 2
		, @_I001A_DuplicateCount int  = 3

	declare @_I001B_REC_ID uniqueidentifier = newid()-- QlikView surrogate key
		, @_I001B_InvoiceKey int
		, @_I001B_DeltaHash char(32)
		-----------------------------------------------------------
		--! This is effectively the business key that the ETL process will lookup
		, @_I001B_INVOICE_NUMBER nvarchar(20) = 'IN001'
		, @_I001B_INVOICE_LINE_NUMBER nvarchar(20) = 'IN001-L1'
		, @_I001B_ORDER_NUMBER nvarchar(20) = 'ON001'
		, @_I001B_ORDER_LINE_NUMBER nvarchar(20)  = 'ON001-L1'
		-----------------------------------------------------------
		, @_I001B_INVOICE_DATE datetime = '20170712'
		, @_I001B_ITEM_NO nvarchar(50) = 'B'
		, @_I001B_INVOICE_QUANTITY decimal(12, 2) = 1234.23
		, @_I001B_INVOICE_AMOUNT decimal(15, 4) = 1234.34
		, @_I001B_GROUP_AMOUNT decimal(15, 4) = 1234.45
		, @_I001B_Uniqueifier bigint = 1
		, @_I001B_DuplicateCount int  = 3

	declare @_I001C_REC_ID uniqueidentifier = newid()-- QlikView surrogate key
		, @_I001C_InvoiceKey int
		, @_I001C_DeltaHash char(32)
		-----------------------------------------------------------
		--! This is effectively the business key that the ETL process will lookup
		, @_I001C_INVOICE_NUMBER nvarchar(20) = 'IN001'
		, @_I001C_INVOICE_LINE_NUMBER nvarchar(20) = 'IN001-L1'
		, @_I001C_ORDER_NUMBER nvarchar(20) = 'ON001'
		, @_I001C_ORDER_LINE_NUMBER nvarchar(20)  = 'ON001-L1'
		-----------------------------------------------------------
		, @_I001C_INVOICE_DATE datetime = '20170710'
		, @_I001C_ITEM_NO nvarchar(50) = 'B'
		, @_I001C_INVOICE_QUANTITY decimal(12, 2) = 1234.23
		, @_I001C_INVOICE_AMOUNT decimal(15, 4) = 1234.34
		, @_I001C_GROUP_AMOUNT decimal(15, 4) = 1234.45
		, @_I001C_Uniqueifier bigint = 3
		, @_I001C_DuplicateCount int  = 3

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


	--! Because privy.InvoiceDeltaHash() seems to generate the MD5 hash differently for the same values differently
	--! when passing variables as opposed to reading columns, use privy.InvoiceRefresh to set the data up
	exec privy.InvoiceRefresh @LoadStart = @_InsertedOn, @DebugLevel = 0 ;

	--! Assert
	select @_I001A_InvoiceKey = InvoiceKey, @_I001A_DeltaHash = EtlDeltaHash from stg.Invoice where REC_ID = @_I001A_REC_ID ;
	select @_I001B_InvoiceKey = InvoiceKey, @_I001B_DeltaHash = EtlDeltaHash from stg.Invoice where REC_ID = @_I001B_REC_ID ;
	select @_I001C_InvoiceKey = InvoiceKey, @_I001C_DeltaHash = EtlDeltaHash from stg.Invoice where REC_ID = @_I001B_REC_ID ;

	--!
	--!
	--!

	--! Act
	--exec privy.InvoiceRefresh @LoadStart = @_ModifiedOn, @DebugLevel = 0 ;
	
	--! What do we expect to see?
	insert #expected
	(
	  InvoiceKey
	, EtlDeltaHash
	, EtlCreatedOn
	, EtlCreatedBy
	, EtlUpdatedOn
	, EtlUpdatedBy
	, IsDeleted
	, REC_ID
	, SYSTEM_ID
	, INVOICE_DATE
	, INVOICE_NUMBER
	, INVOICE_LINE_NUMBER
	, ORDER_NUMBER
	, ORDER_LINE_NUMBER
	, Uniqueifier
	, INVOICE_TYPE
	, SITE_ID
	, ITEM_NO
	, INVOICE_QUANTITY
	, INVOICE_AMOUNT
	, GROUP_AMOUNT
	, DuplicateCount
	)
	values
	(
	  @_I001B_InvoiceKey
	, @_I001B_DeltaHash
	, @_InsertedOn
	, @_ModifiedBy
	, @_InsertedOn
	, @_ModifiedBy
	, @_IsDeleted
	, @_I001B_REC_ID
	, @_SYSTEM_ID
	, @_I001B_INVOICE_DATE
	, @_I001B_INVOICE_NUMBER
	, @_I001B_INVOICE_LINE_NUMBER
	, @_I001B_ORDER_NUMBER
	, @_I001B_ORDER_LINE_NUMBER
	, @_I001B_Uniqueifier
	, @_INVOICE_TYPE
	, @_SITE_ID
	, @_I001B_ITEM_NO
	, @_I001B_INVOICE_QUANTITY
	, @_I001B_INVOICE_AMOUNT
	, @_I001B_GROUP_AMOUNT
	, @_I001B_DuplicateCount
	)
/*
	, (
	  @_I001A_InvoiceKey
	, @_I001A_DeltaHash
	, @_InsertedOn
	, @_ModifiedBy
	, @_InsertedOn
	, @_ModifiedBy
	, @_IsDeleted
	, @_I001A_REC_ID
	, @_SYSTEM_ID
	, @_I001A_INVOICE_DATE
	, @_I001A_INVOICE_NUMBER
	, @_I001A_INVOICE_LINE_NUMBER
	, @_I001A_ORDER_NUMBER
	, @_I001A_ORDER_LINE_NUMBER
	, @_I001A_Uniqueifier
	, @_INVOICE_TYPE
	, @_SITE_ID
	, @_I001A_ITEM_NO
	, @_I001A_INVOICE_QUANTITY
	, @_I001A_INVOICE_AMOUNT
	, @_I001A_GROUP_AMOUNT
	, @_I001A_DuplicateCount
	)
	, (
	  @_I001C_InvoiceKey
	, @_I001C_DeltaHash
	, @_InsertedOn
	, @_ModifiedBy
	, @_InsertedOn
	, @_ModifiedBy
	, @_IsDeleted
	, @_I001C_REC_ID
	, @_SYSTEM_ID
	, @_I001C_INVOICE_DATE
	, @_I001C_INVOICE_NUMBER
	, @_I001C_INVOICE_LINE_NUMBER
	, @_I001C_ORDER_NUMBER
	, @_I001C_ORDER_LINE_NUMBER
	, @_I001C_Uniqueifier
	, @_INVOICE_TYPE
	, @_SITE_ID
	, @_I001C_ITEM_NO
	, @_I001C_INVOICE_QUANTITY
	, @_I001C_INVOICE_AMOUNT
	, @_I001C_GROUP_AMOUNT
	, @_I001C_DuplicateCount
	)
*/

	select
		  InvoiceKey
		, EtlDeltaHash
		, EtlCreatedOn
		, EtlCreatedBy
		, EtlUpdatedOn
		, EtlUpdatedBy
		, IsDeleted
		, REC_ID
		, SYSTEM_ID
		, INVOICE_DATE
		, INVOICE_NUMBER
		, INVOICE_LINE_NUMBER
		, ORDER_NUMBER
		, ORDER_LINE_NUMBER
		, Uniqueifier
		, INVOICE_TYPE
		, SITE_ID
		, ITEM_NO
		, INVOICE_QUANTITY
		, INVOICE_AMOUNT
		, GROUP_AMOUNT
		, DuplicateCount
	into
		#actual
	from
		stg.Invoice
	where
		REC_ID = @_I001B_REC_ID


--	select 'SA_INVOICE' as [Source], * from Icopal_profBIS.dbo.SA_INVOICE ;
--	select 'Invoice' as [Source], * from stg.Invoice
--	select '#expected' as [Source], * from #expected
--	select '#actual' as [Source], * from #actual
		
	exec tSQLt.AssertEqualsTable '#expected', '#actual'
end