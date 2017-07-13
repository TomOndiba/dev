CREATE procedure [privy-InvoiceRefreshTests].[test source values inserted to correct columns]
as
begin
	--! NB: Always use the real table for insert tests so we can detect likely failures arising from new NOT NULL columns
	truncate table stg.Invoice;

	exec tSQLt.FakeTable 'privy.StagingLoadParameter' ;
	insert privy.StagingLoadParameter (ModuleName, DataCaptureStart, DataCaptureEnd)
	values ('[privy].[InvoiceRefresh]', '20170710 00:00:00', '20170715 23:59:59.997') ;

	create table #expected
	(
	  InvoiceKey int not null
	, EtlDeltaHash char(32) collate SQL_Latin1_General_CP1_CI_AS null
	, EtlCreatedOn datetime null
	, EtlCreatedBy varchar(200) collate SQL_Latin1_General_CP1_CI_AS null
	, EtlUpdatedOn datetime not null
	, EtlUpdatedBy varchar(200) collate SQL_Latin1_General_CP1_CI_AS null
	, EtlDeletedOn datetime null
	, EtlDeletedBy varchar(200) collate SQL_Latin1_General_CP1_CI_AS null
	, IsDeleted char(1) collate SQL_Latin1_General_CP1_CI_AS null
	-----------------------------------------------------------
	, REC_ID uniqueidentifier null -- QlikView surrogate key
	-----------------------------------------------------------
	--! This is effectively the business key that the ETL process will lookup
	, SYSTEM_ID int null
	, INVOICE_DATE datetime null
	, INVOICE_NUMBER nvarchar(20) collate SQL_Latin1_General_CP1_CI_AS null
	, INVOICE_LINE_NUMBER nvarchar(20) collate SQL_Latin1_General_CP1_CI_AS null
	, ORDER_NUMBER nvarchar(20) collate SQL_Latin1_General_CP1_CI_AS null
	, ORDER_LINE_NUMBER nvarchar(20) collate SQL_Latin1_General_CP1_CI_AS null
	, Uniqueifier bigint null
	-----------------------------------------------------------
	, INVOICE_TYPE nvarchar(1) collate SQL_Latin1_General_CP1_CI_AS null
	, InvoiceTypeName nvarchar(29) collate SQL_Latin1_General_CP1_CI_AS null
	, LOCAL_SITE_SOLD nvarchar(20) collate SQL_Latin1_General_CP1_CI_AS null
	, SITE_ID int null
	, ITEM_NO nvarchar(50) collate SQL_Latin1_General_CP1_CI_AS null
	, ITEM_CATEGORY_ID int null
	, ENV_CATEGORY_ID int null
	, SOLD_TO_CUSTOMER_NO nvarchar(20) collate SQL_Latin1_General_CP1_CI_AS null
	, SHIP_TO_CUSTOMER_NO nvarchar(20) collate SQL_Latin1_General_CP1_CI_AS null
	, SALESPERSON_ID nvarchar(20) collate SQL_Latin1_General_CP1_CI_AS null
	, SALESPERSON_NAME nvarchar(100) collate SQL_Latin1_General_CP1_CI_AS null
	, DELIVERY_DATE datetime null
	, EXPECTED_PAYMENT_DATE datetime null
	, ACTUAL_PAYMENT_DATE datetime null
	, LOCAL_DELIVERY_TERM nvarchar(20) collate SQL_Latin1_General_CP1_CI_AS null
	, LOCAL_DELIVERY_TERM_TEXT nvarchar(100) collate SQL_Latin1_General_CP1_CI_AS null
	, PAYMENT_TERM_ID int null
	, LOCAL_PAYMENT_TERM nvarchar(20) collate SQL_Latin1_General_CP1_CI_AS null
	, LOCAL_PAYMENT_TERM_TEXT nvarchar(100) collate SQL_Latin1_General_CP1_CI_AS null
	, INVOICE_QUANTITY decimal(12, 2) null
	, INVOICE_UOM nvarchar(20) collate SQL_Latin1_General_CP1_CI_AS null
	, STATISTIC_QUANTITY decimal(12, 2) null
	, STATISTIC_UOM nvarchar(20) collate SQL_Latin1_General_CP1_CI_AS null
	, QUANTITY decimal(12, 2) null
	, LOCAL_UOM nvarchar(20) collate SQL_Latin1_General_CP1_CI_AS null
	, LOCAL_UOM_HARMONIZED nvarchar(20) collate SQL_Latin1_General_CP1_CI_AS null
	, LOCAL_UOM_FACTOR decimal(11, 4) null
	, INVOICE_AMOUNT decimal(15, 4) null
	, LOCAL_AMOUNT decimal(15, 4) null
	, GROUP_AMOUNT decimal(15, 4) null
	, INVOICE_CURRENCY nvarchar(3) collate SQL_Latin1_General_CP1_CI_AS null
	, LOCAL_CURRENCY nvarchar(3) collate SQL_Latin1_General_CP1_CI_AS null
	, LINE_DISCOUNT_AMOUNT decimal(15, 4) null
	, INVOICE_DISCOUNT_AMOUNT decimal(15, 4) null
	, LINE_BONUS_AMOUNT decimal(15, 4) null
	, BONUS_SHARE_AMOUNT decimal(15, 4) null
	, STD_COST decimal(15, 4) null
	, STD_FREIGHT decimal(15, 4) null
	, DuplicateCount int null
	) ;

	--! What are the values we are going to insert?
	declare @_SBU varchar(8) = 'XXX'
		, @_ModifiedOn datetime = getdate()
		, @_ModifiedBy varchar(200) = '[privy].[InvoiceRefresh]'
		, @_I001A_InvoiceKey int = 100
		, @_I001A_IsDeleted char(1) = 'N'
		-- QlikView surrogate key
		, @_I001A_REC_ID uniqueidentifier = newid()
		-----------------------------------------------------------
		--! This is effectively the business key that the ETL process will lookup
		, @_I001A_SYSTEM_ID int  = 2
		, @_I001A_INVOICE_DATE datetime = '20170712'
		, @_I001A_INVOICE_NUMBER nvarchar(20) = 'A001'
		, @_I001A_INVOICE_LINE_NUMBER nvarchar(20) = 'B02'
		, @_I001A_ORDER_NUMBER nvarchar(20) = 'C001'
		, @_I001A_ORDER_LINE_NUMBER nvarchar(20)  = 'C01'
		, @_I001A_Uniqueifier bigint = 1
		-----------------------------------------------------------
		, @_I001A_INVOICE_TYPE nvarchar(1) = '9'
		, @_I001A_InvoiceTypeName nvarchar(29)  = 'TODO: Define Invoice Type (9)'
		, @_I001A_LOCAL_SITE_SOLD nvarchar(20) = 'G'
		, @_I001A_SITE_ID int = 3
		, @_I001A_ITEM_NO nvarchar(50) = 'H'
		, @_I001A_ITEM_CATEGORY_ID int = 46247
		, @_I001A_ENV_CATEGORY_ID int = NULL
		, @_I001A_SOLD_TO_CUSTOMER_NO nvarchar(20) = 'I'
		, @_I001A_SHIP_TO_CUSTOMER_NO nvarchar(20) = 'J'
		, @_I001A_SALESPERSON_ID nvarchar(20) = 'K'
		, @_I001A_SALESPERSON_NAME nvarchar(100) = 'L'
		, @_I001A_DELIVERY_DATE datetime  = '20170713'
		, @_I001A_EXPECTED_PAYMENT_DATE datetime  = '20170714'
		, @_I001A_ACTUAL_PAYMENT_DATE datetime  = '20170715'
		, @_I001A_LOCAL_DELIVERY_TERM nvarchar(20) = 'M'
		, @_I001A_LOCAL_DELIVERY_TERM_TEXT nvarchar(100) = 'P'
		, @_I001A_PAYMENT_TERM_ID int = 152
		, @_I001A_LOCAL_PAYMENT_TERM nvarchar(20) = 'Q'
		, @_I001A_LOCAL_PAYMENT_TERM_TEXT nvarchar(100) = 'R'
		, @_I001A_INVOICE_QUANTITY decimal(12, 2) = 1234123412.11
		, @_I001A_INVOICE_UOM nvarchar(20)  = 'S'
		, @_I001A_STATISTIC_QUANTITY decimal(12, 2) = 1234123412.12
		, @_I001A_STATISTIC_UOM nvarchar(20) = 'T'
		, @_I001A_QUANTITY decimal(12, 2) = 1234123412.13
		, @_I001A_LOCAL_UOM nvarchar(20) = 'U'
		, @_I001A_LOCAL_UOM_HARMONIZED nvarchar(20) = 'V'
		, @_I001A_LOCAL_UOM_FACTOR decimal(11, 4) = 1234123.1444
		, @_I001A_INVOICE_AMOUNT decimal(15, 4) = 12341234123.1555
		, @_I001A_LOCAL_AMOUNT decimal(15, 4) = 12341234123.1666
		, @_I001A_GROUP_AMOUNT decimal(15, 4) = 12341234123.1777
		, @_I001A_INVOICE_CURRENCY nvarchar(3) = 'W'
		, @_I001A_LOCAL_CURRENCY nvarchar(3) = 'X'
		, @_I001A_LINE_DISCOUNT_AMOUNT decimal(15, 4) = 12341234123.1888
		, @_I001A_INVOICE_DISCOUNT_AMOUNT decimal(15, 4) = 12341234123.1999
		, @_I001A_LINE_BONUS_AMOUNT decimal(15, 4) = 12341234123.2011
		, @_I001A_BONUS_SHARE_AMOUNT decimal(15, 4) = 12341234123.2122
		, @_I001A_STD_COST decimal(15, 4) = 12341234123.2233
		, @_I001A_STD_FREIGHT decimal(15, 4) = 12341234123.2344
		, @_I001A_DuplicateCount int  = 1

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
		  ('DWH', 'PAYMENT_UNMAPPED', @_I001A_PAYMENT_TERM_ID, 'BESKRIVELSE', '20170101')
		, ('DWH', 'SA_UNMAPPED_ITEM', @_I001A_ITEM_CATEGORY_ID, 'BESKRIVELSE', '20170101')
		, ('DWH', 'SALES_NOT_QLIKVIEW', '46377', 'BESKRIVELSE', '20170101')
		, ('DWH', 'CUSTOMER_NOT_EXPORTED', '146875', 'BESKRIVELSE', '20170101')

	--! Set up the source data
	insert Icopal_profBIS.dbo.SA_INVOICE
	(
	  REC_ID
	, SYSTEM_ID, SITE_SOLD
	, INVOICE_NUMBER, INVOICE_LINE_NUMBER
	, INVOICE_DATE, INVOICE_TYPE
	, ORDER_NUMBER, ORDER_LINE_NUMBER
	, ITEM_NO, SOLD_TO, SHIP_TO
	, INVOICE_QUANTITY, INVOICE_UOM, STATISTIC_QUANTITY, STATISTIC_UOM, QUANTITY, UOM
	, INVOICE_AMOUNT, LOCAL_AMOUNT, GROUP_AMOUNT
	, INVOICE_CURRENCY, LOCAL_CURRENCY
	, LINE_DISCOUNT_AMOUNT, INVOICE_DISCOUNT_AMOUNT, LINE_BONUS_AMOUNT, BONUS_SHARE_AMOUNT
	, STD_COST, STD_FREIGHT
	, SALESPERSON_ID, SALESPERSON_NAME
	, DELIVERY_DATE, EXPECTED_PAYMENT_DATE, ACTUAL_PAYMENT_DATE
	, DELIVERY_TERM, DELIVERY_TERM_TEXT, PAYMENT_TERM, PAYMENT_TERM_TEXT
	)
	values
	(
	  @_I001A_REC_ID
	, @_I001A_SYSTEM_ID, @_I001A_LOCAL_SITE_SOLD
	, @_I001A_INVOICE_NUMBER, @_I001A_INVOICE_LINE_NUMBER
	, @_I001A_INVOICE_DATE, @_I001A_INVOICE_TYPE
	, @_I001A_ORDER_NUMBER, @_I001A_ORDER_LINE_NUMBER
	, @_I001A_ITEM_NO, @_I001A_SOLD_TO_CUSTOMER_NO, @_I001A_SHIP_TO_CUSTOMER_NO
	, @_I001A_INVOICE_QUANTITY, @_I001A_INVOICE_UOM, @_I001A_STATISTIC_QUANTITY, @_I001A_STATISTIC_UOM, @_I001A_QUANTITY, @_I001A_LOCAL_UOM
	, @_I001A_INVOICE_AMOUNT, @_I001A_LOCAL_AMOUNT, @_I001A_GROUP_AMOUNT
	, @_I001A_INVOICE_CURRENCY, @_I001A_LOCAL_CURRENCY
	, @_I001A_LINE_DISCOUNT_AMOUNT, @_I001A_INVOICE_DISCOUNT_AMOUNT, @_I001A_LINE_BONUS_AMOUNT, @_I001A_BONUS_SHARE_AMOUNT
	, @_I001A_STD_COST, @_I001A_STD_FREIGHT
	, @_I001A_SALESPERSON_ID, @_I001A_SALESPERSON_NAME
	, @_I001A_DELIVERY_DATE, @_I001A_EXPECTED_PAYMENT_DATE, @_I001A_ACTUAL_PAYMENT_DATE
	, @_I001A_LOCAL_DELIVERY_TERM, @_I001A_LOCAL_DELIVERY_TERM_TEXT, @_I001A_LOCAL_PAYMENT_TERM, @_I001A_LOCAL_PAYMENT_TERM_TEXT
	) ;

	insert Icopal_profBIS.dbo.PU_LINK_SITE (SITE_ID, SYSTEM_ID, LOCAL_SITE)
	values (@_I001A_SITE_ID, @_I001A_SYSTEM_ID, @_I001A_LOCAL_SITE_SOLD)

	insert Icopal_profBIS.dbo.MD_SITE (SITE_ID, SBU, SYSTEM_ID)
	values (@_I001A_SITE_ID, @_SBU, @_I001A_SYSTEM_ID) ;

	insert Icopal_profBIS.dbo.MD_SBU (SBU, SABIS) values (@_SBU, 'Y') ;

	insert Icopal_profBIS.dbo.PU_LINK_UOM (SYSTEM_ID, LOCAL_UOM, HARMONIZED_UOM, FACTOR)
	values (@_I001A_SYSTEM_ID, @_I001A_LOCAL_UOM, @_I001A_LOCAL_UOM_HARMONIZED, @_I001A_LOCAL_UOM_FACTOR) ;


	--! Act
	exec privy.InvoiceRefresh @LoadStart = @_ModifiedOn, @DebugLevel = 0 ;
	
	--! Assert
	declare @_I001A_DeltaHash char(32) = (select EtlDeltaHash from stg.Invoice where InvoiceKey = @_I001A_InvoiceKey);

	--! What do we expect to see?
	insert #expected
	(
	  InvoiceKey
	, EtlDeltaHash
	, EtlCreatedOn
	, EtlCreatedBy
	, EtlUpdatedOn
	, EtlUpdatedBy
	, EtlDeletedOn
	, EtlDeletedBy
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
	, InvoiceTypeName
	, LOCAL_SITE_SOLD
	, SITE_ID
	, ITEM_NO
	, ITEM_CATEGORY_ID
	, ENV_CATEGORY_ID
	, SOLD_TO_CUSTOMER_NO
	, SHIP_TO_CUSTOMER_NO
	, SALESPERSON_ID
	, SALESPERSON_NAME
	, DELIVERY_DATE
	, EXPECTED_PAYMENT_DATE
	, ACTUAL_PAYMENT_DATE
	, LOCAL_DELIVERY_TERM
	, LOCAL_DELIVERY_TERM_TEXT
	, PAYMENT_TERM_ID
	, LOCAL_PAYMENT_TERM
	, LOCAL_PAYMENT_TERM_TEXT
	, INVOICE_QUANTITY
	, INVOICE_UOM
	, STATISTIC_QUANTITY
	, STATISTIC_UOM
	, QUANTITY
	, LOCAL_UOM
	, LOCAL_UOM_HARMONIZED
	, LOCAL_UOM_FACTOR
	, INVOICE_AMOUNT
	, LOCAL_AMOUNT
	, GROUP_AMOUNT
	, INVOICE_CURRENCY
	, LOCAL_CURRENCY
	, LINE_DISCOUNT_AMOUNT
	, INVOICE_DISCOUNT_AMOUNT
	, LINE_BONUS_AMOUNT
	, BONUS_SHARE_AMOUNT
	, STD_COST
	, STD_FREIGHT
	, DuplicateCount
	)
	values
	(
	  @_I001A_InvoiceKey
	, @_I001A_DeltaHash
	, @_ModifiedOn
	, @_ModifiedBy
	, @_ModifiedOn
	, @_ModifiedBy
	, null -- EtlDeletedOn
	, null -- EtlDeletedBy
	, @_I001A_IsDeleted
	, @_I001A_REC_ID
	, @_I001A_SYSTEM_ID
	, @_I001A_INVOICE_DATE
	, @_I001A_INVOICE_NUMBER
	, @_I001A_INVOICE_LINE_NUMBER
	, @_I001A_ORDER_NUMBER
	, @_I001A_ORDER_LINE_NUMBER
	, @_I001A_Uniqueifier
	, @_I001A_INVOICE_TYPE
	, @_I001A_InvoiceTypeName
	, @_I001A_LOCAL_SITE_SOLD
	, @_I001A_SITE_ID
	, @_I001A_ITEM_NO
	, @_I001A_ITEM_CATEGORY_ID
	, @_I001A_ENV_CATEGORY_ID
	, @_I001A_SOLD_TO_CUSTOMER_NO
	, @_I001A_SHIP_TO_CUSTOMER_NO
	, @_I001A_SALESPERSON_ID
	, @_I001A_SALESPERSON_NAME
	, @_I001A_DELIVERY_DATE
	, @_I001A_EXPECTED_PAYMENT_DATE
	, @_I001A_ACTUAL_PAYMENT_DATE
	, @_I001A_LOCAL_DELIVERY_TERM
	, @_I001A_LOCAL_DELIVERY_TERM_TEXT
	, @_I001A_PAYMENT_TERM_ID
	, @_I001A_LOCAL_PAYMENT_TERM
	, @_I001A_LOCAL_PAYMENT_TERM_TEXT
	, @_I001A_INVOICE_QUANTITY
	, @_I001A_INVOICE_UOM
	, @_I001A_STATISTIC_QUANTITY
	, @_I001A_STATISTIC_UOM
	, @_I001A_QUANTITY
	, @_I001A_LOCAL_UOM
	, @_I001A_LOCAL_UOM_HARMONIZED
	, @_I001A_LOCAL_UOM_FACTOR
	, @_I001A_INVOICE_AMOUNT
	, @_I001A_LOCAL_AMOUNT
	, @_I001A_GROUP_AMOUNT
	, @_I001A_INVOICE_CURRENCY
	, @_I001A_LOCAL_CURRENCY
	, @_I001A_LINE_DISCOUNT_AMOUNT
	, @_I001A_INVOICE_DISCOUNT_AMOUNT
	, @_I001A_LINE_BONUS_AMOUNT
	, @_I001A_BONUS_SHARE_AMOUNT
	, @_I001A_STD_COST
	, @_I001A_STD_FREIGHT
	, @_I001A_DuplicateCount
	)
		
	exec tSQLt.AssertEqualsTable '#expected', 'stg.Invoice'
end