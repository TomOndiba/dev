create procedure [privy].[CustomerRefresh]
(
  @LoadStart datetime
, @RowsAffected int = null out
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		privy.CustomerRefresh
DESCRIPTION:		Merges any changes from the QlikView source into the staging area ready for consumption by the
					QV-to-IDW ETL process
ORIGIN DATE:		12-JUN-2017
ORIGINAL AUTHOR:	Greg M. Lucas

Returns
=======
@@Error - always zero on success

Additional Notes
================

REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		12-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------

**********************************************************************************************************************/
--</CommentHeader>

begin
	set nocount on;

	--! Standard/ExceptionHandler variables
	declare	@_FunctionName nvarchar(255) = quotename(object_schema_name(@@procid)) + '.' + quotename(object_name(@@procid));
	declare	@_Error int = 0;
	declare @_ReturnValue int
	declare	@_Message nvarchar(512);
	declare	@_ErrorContext nvarchar(512);
	declare	@_Step varchar(128);

	--! Find out if we are already in a transaction
	declare	@_TxnIsExternal bit = case when @@trancount > 0 then 1 else 0 end;

	begin try
		set @_Step = 'Collect Runtime Parameters';

		declare @_UnmappedCustomerCategory varchar(50) = (select TEKST from [$(Icopal_profBIS)].dbo.FLEXPARAMS where PARAMTYPE = 'DWH' and PARAMNAVN = 'SA_UNMAPPED_CUSTOMER') ;

		declare @_UnmappedCustomerCategoryId int ;
		if len(@_UnmappedCustomerCategory) > 0 and isnumeric(@_UnmappedCustomerCategory) = 1
			set @_UnmappedCustomerCategoryId = cast(@_UnmappedCustomerCategory as int)

		--! If there no outer transaction, use an explicit transaction so we can roll this piece back if required 
		if @_TxnIsExternal = 0 begin tran;

		set @_Step = 'Upsert Main'

		;with sourceCte
		as
		(
			select
				  c.SYSTEM_ID																								as [QlikViewSourceSystemId]
				, cast(c.CUSTOMER_NO as varchar(50))																		as [NativeCustomerKey]
				, cast(c.CUSTOMER_NO as varchar(50))																		as [CustomerNumber]
				, coalesce(c.CUSTOMER_NAME, '')																				as [CustomerName]
				, coalesce(c.CUSTOMER_ADDRESS_1, '')																		as [CustomerAddress1]
				, coalesce(c.CUSTOMER_ADDRESS_2, '')																		as [CustomerAddress2]
				, coalesce(c.CUSTOMER_ADDRESS_3, '')																		as [CustomerAddress3]
				, coalesce(c.CUSTOMER_ZIPCODE, '')																			as [CustomerZipCode]
				, coalesce(c.CUSTOMER_CITY, '')																				as [CustomerCity]
				, coalesce(c.CUSTOMER_COUNTRY, '')																			as [CustomerCountry]
				, coalesce(c.CUSTOMER_VAT_NO, '')																			as [CustomerVatNumber]
				-----------------------------------------------------------------------------------------------------------------------
				, c.CUSTOMER_TYPE_ID																						as [CustomerTypeId]
				, case
					when c.CUSTOMER_TYPE_ID is null
						then 'Not Specified at Source'
					else coalesce(nullif(c.CUSTOMER_TYPE, ''), 'Not Specified at Source')
					end																										as [CustomerTypeName]
				-----------------------------------------------------------------------------------------------------------------------
				, coalesce(c.CUSTOMER_GROUP_1, '')																			as [CustomerGroup1]
				, coalesce(c.CUSTOMER_GROUP_2, '')																			as [CustomerGroup2]
				, coalesce(c.CUSTOMER_GROUP_3, '')																			as [CustomerGroup3]
				, coalesce(c.CUSTOMER_GROUP_4, '')																			as [CustomerGroup4]
				, coalesce(c.CUSTOMER_GROUP_5, '')																			as [CustomerGroup5]
				-----------------------------------------------------------------------------------------------------------------------
				, case when cc.CUSTOMER_CATEGORY_ID is null then 'N' else 'Y' end				as [CategoryIsMapped]
				, coalesce(cast(coalesce(cc.CUSTOMER_CATEGORY_ID, @_UnmappedCustomerCategoryId) as nvarchar(50)), 'N/S')	as [NativeCustomerCategoryKey]
				, coalesce(l1.LeafName, 'Not Specified at Source')															as [CustomerCategoryBaseLevel]
				, coalesce(l1.ParentName, 'Not Specified at Source')														as [CustomerCategoryLevel1]
				, coalesce(l2.ParentName, '')																				as [CustomerCategoryLevel2]
				, coalesce(l3.ParentName, '')																				as [CustomerCategoryLevel3]
				, coalesce(l4.ParentName, '')																				as [CustomerCategoryLevel4]
				, coalesce(l5.ParentName, '')																				as [CustomerCategoryLevel5]
				, coalesce(l6.ParentName, '')																				as [CustomerCategoryLevel6]
				, coalesce(l7.ParentName, '')																				as [CustomerCategoryLevel7]
				, coalesce(l8.ParentName, '')																				as [CustomerCategoryLevel8]
				-----------------------------------------------------------------------------------------------------------------------
				--! Encapsulate ALL non-key columns into a hash value to speed up CDC checks during susbseqent loads
				, convert(nvarchar(32), hashbytes('MD5'
					, coalesce(c.CUSTOMER_NAME, 'CUSTOMER_NAME')
					+ coalesce(c.CUSTOMER_ADDRESS_1, 'CUSTOMER_ADDRESS_1')
					+ coalesce(c.CUSTOMER_ADDRESS_2, 'CUSTOMER_ADDRESS_2')
					+ coalesce(c.CUSTOMER_ADDRESS_3, 'CUSTOMER_ADDRESS_3')
					+ coalesce(c.CUSTOMER_ZIPCODE, 'CUSTOMER_ZIPCODE')
					+ coalesce(c.CUSTOMER_CITY, 'CUSTOMER_CITY')
					+ coalesce(c.CUSTOMER_COUNTRY, 'CUSTOMER_COUNTRY')
					+ coalesce(c.CUSTOMER_VAT_NO, 'CUSTOMER_VAT_NO')
				-----------------------------------------------------------------------------------------------------------------------
					+ coalesce(cast(c.CUSTOMER_TYPE_ID as nvarchar(30)), 'CUSTOMER_TYPE_ID')
					+ coalesce(c.CUSTOMER_TYPE, 'CUSTOMER_TYPE')
					+ coalesce(c.CUSTOMER_GROUP_1, 'CUSTOMER_GROUP_1')
					+ coalesce(c.CUSTOMER_GROUP_2, 'CUSTOMER_GROUP_2')
					+ coalesce(c.CUSTOMER_GROUP_3, 'CUSTOMER_GROUP_3')
					+ coalesce(c.CUSTOMER_GROUP_4, 'CUSTOMER_GROUP_4')
					+ coalesce(c.CUSTOMER_GROUP_5, 'CUSTOMER_GROUP_5')
				-----------------------------------------------------------------------------------------------------------------------
					+ case when cc.CUSTOMER_CATEGORY_ID is null then 'N' else 'Y' end
					+ coalesce(cast(coalesce(cc.CUSTOMER_CATEGORY_ID, @_UnmappedCustomerCategoryId) as nvarchar(30)), 'CUSTOMER_CATEGORY_ID')
					+ coalesce(l1.LeafName, 'l1.LeafName')
					+ coalesce(l1.ParentName, 'l1.ParentName')
					+ coalesce(l2.ParentName, 'ParentName')
					+ coalesce(l3.ParentName, 'l3.ParentName')
					+ coalesce(l4.ParentName, 'l4.ParentName')
					+ coalesce(l5.ParentName, 'l5.ParentName')
					+ coalesce(l6.ParentName, 'l6.ParentName')
					+ coalesce(l7.ParentName, 'l7.ParentName')
					+ coalesce(l8.ParentName, 'l8.ParentName')), 2)															as [EtlDeltaHash]
				-----------------------------------------------------------------------------------------------------------------------
			from
				[$(Icopal_profBIS)].[dbo].[SA_CUSTOMER] as c
			left join [$(Icopal_profBIS)].[dbo].[SA_LINK_CUSTOMER] as lcc
				on lcc.SYSTEM_ID = c.SYSTEM_ID
				and lcc.CUSTOMER_NO = c.CUSTOMER_NO
			left join [$(Icopal_profBIS)].[dbo].[SA_CUSTOMER_CATEGORY] as [cc]
				on cc.CUSTOMER_CATEGORY_ID = coalesce(lcc.CUSTOMER_CATEGORY_ID, @_UnmappedCustomerCategoryId)
			left join stg.CustomerCategoryHierarchy as l1
				on l1.LeafId = cc.CUSTOMER_CATEGORY_ID
				and l1.hNodeFromRoot = 0
			left join stg.CustomerCategoryHierarchy as l2
				on l2.LeafId = cc.CUSTOMER_CATEGORY_ID
				and l2.ParentId = l1.ChildId
				and l2.hNodeFromRoot = l1.hNodeFromRoot + 1
			left join stg.CustomerCategoryHierarchy as l3
				on l3.LeafId = cc.CUSTOMER_CATEGORY_ID
				and l3.ParentId = l2.ChildId
				and l3.hNodeFromRoot = l2.hNodeFromRoot + 1
			left join stg.CustomerCategoryHierarchy as l4
				on l4.LeafId = cc.CUSTOMER_CATEGORY_ID
				and l4.ParentId = l3.ChildId
				and l4.hNodeFromRoot = l3.hNodeFromRoot + 1
			left join stg.CustomerCategoryHierarchy as l5
				on l5.LeafId = cc.CUSTOMER_CATEGORY_ID
				and l5.ParentId = l4.ChildId
				and l5.hNodeFromRoot = l4.hNodeFromRoot + 1
			left join stg.CustomerCategoryHierarchy as l6
				on l6.LeafId = cc.CUSTOMER_CATEGORY_ID
				and l6.ParentId = l5.ChildId
				and l6.hNodeFromRoot = l5.hNodeFromRoot + 1
			left join stg.CustomerCategoryHierarchy as l7
				on l7.LeafId = cc.CUSTOMER_CATEGORY_ID
				and l7.ParentId = l6.ChildId
				and l7.hNodeFromRoot = l6.hNodeFromRoot + 1
			left join stg.CustomerCategoryHierarchy as l8
				on l8.LeafId = cc.CUSTOMER_CATEGORY_ID
				and l8.ParentId = l7.ChildId
				and l8.hNodeFromRoot = l7.hNodeFromRoot + 1
			where
				len(c.CUSTOMER_NO) > 0
		)
		merge into stg.Customer as tgt
		using sourceCte as src
			on src.QlikViewSourceSystemId = tgt.QlikViewSourceSystemId
			and src.NativeCustomerKey collate SQL_Latin1_General_CP1_CI_AS = tgt.NativeCustomerKey collate SQL_Latin1_General_CP1_CI_AS
		when not matched by target
			then insert
			(  
			  EtlDeltaHash
			, EtlCreatedOn
			, EtlCreatedBy
			, EtlUpdatedOn
			, EtlUpdatedBy
			, EtlDeletedOn
			, EtlDeletedBy
			, IsDeleted
			, QlikViewSourceSystemId
			, NativeCustomerKey
			, CustomerNumber
			, CustomerName
			, CustomerAddress1
			, CustomerAddress2
			, CustomerAddress3
			, CustomerZipCode
			, CustomerCity
			, CustomerCountry
			, CustomerVatNumber
			, CustomerTypeId
			, CustomerTypeName
			, CustomerGroup1
			, CustomerGroup2
			, CustomerGroup3
			, CustomerGroup4
			, CustomerGroup5
			, CategoryIsMapped
			, NativeCustomerCategoryKey
			, CustomerCategoryBaseLevel
			, CustomerCategoryLevel1
			, CustomerCategoryLevel2
			, CustomerCategoryLevel3
			, CustomerCategoryLevel4
			, CustomerCategoryLevel5
			, CustomerCategoryLevel6
			, CustomerCategoryLevel7
			, CustomerCategoryLevel8
			)
			values
			(  
			  src.EtlDeltaHash
			, @LoadStart
			, @_FunctionName
			, @LoadStart
			, @_FunctionName
			, null -- EtlDeletedOn
			, null -- EtlDeletedBy
			, 'N' -- IsDeleted
			, src.QlikViewSourceSystemId
			, src.NativeCustomerKey
			, src.CustomerNumber
			, src.CustomerName
			, src.CustomerAddress1
			, src.CustomerAddress2
			, src.CustomerAddress3
			, src.CustomerZipCode
			, src.CustomerCity
			, src.CustomerCountry
			, src.CustomerVatNumber
			, src.CustomerTypeId
			, src.CustomerTypeName
			, src.CustomerGroup1
			, src.CustomerGroup2
			, src.CustomerGroup3
			, src.CustomerGroup4
			, src.CustomerGroup5
			, src.CategoryIsMapped
			, src.NativeCustomerCategoryKey
			, src.CustomerCategoryBaseLevel
			, src.CustomerCategoryLevel1
			, src.CustomerCategoryLevel2
			, src.CustomerCategoryLevel3
			, src.CustomerCategoryLevel4
			, src.CustomerCategoryLevel5
			, src.CustomerCategoryLevel6
			, src.CustomerCategoryLevel7
			, src.CustomerCategoryLevel8
			)
		when matched and tgt.EtlDeltaHash <> src.EtlDeltaHash or tgt.IsDeleted = 'Y'
			then update set
					  tgt.EtlDeltaHash = src.EtlDeltaHash
					, tgt.EtlUpdatedOn = @LoadStart
					, tgt.EtlUpdatedBy = @_FunctionName
					, tgt.IsDeleted = 'N'
					, tgt.CustomerName = src.CustomerName
					, tgt.CustomerAddress1 = src.CustomerAddress1
					, tgt.CustomerAddress2 = src.CustomerAddress2
					, tgt.CustomerAddress3 = src.CustomerAddress3
					, tgt.CustomerZipCode = src.CustomerZipCode
					, tgt.CustomerCity = src.CustomerCity
					, tgt.CustomerCountry = src.CustomerCountry
					, tgt.CustomerVatNumber = src.CustomerVatNumber
					, tgt.CustomerTypeId = src.CustomerTypeId
					, tgt.CustomerTypeName = src.CustomerTypeName
					, tgt.CustomerGroup1 = src.CustomerGroup1
					, tgt.CustomerGroup2 = src.CustomerGroup2
					, tgt.CustomerGroup3 = src.CustomerGroup3
					, tgt.CustomerGroup4 = src.CustomerGroup4
					, tgt.CustomerGroup5 = src.CustomerGroup5
					, tgt.CategoryIsMapped = src.CategoryIsMapped
					, tgt.NativeCustomerCategoryKey = src.NativeCustomerCategoryKey
					, tgt.CustomerCategoryBaseLevel = src.CustomerCategoryBaseLevel
					, tgt.CustomerCategoryLevel1 = src.CustomerCategoryLevel1
					, tgt.CustomerCategoryLevel2 = src.CustomerCategoryLevel2
					, tgt.CustomerCategoryLevel3 = src.CustomerCategoryLevel3
					, tgt.CustomerCategoryLevel4 = src.CustomerCategoryLevel4
					, tgt.CustomerCategoryLevel5 = src.CustomerCategoryLevel5
					, tgt.CustomerCategoryLevel6 = src.CustomerCategoryLevel6
					, tgt.CustomerCategoryLevel7 = src.CustomerCategoryLevel7
					, tgt.CustomerCategoryLevel8 = src.CustomerCategoryLevel8
		when not matched by source and tgt.CustomerKey >= 100
			then update set
					  tgt.IsDeleted = 'Y'
					, tgt.EtlDeletedOn = @LoadStart
					, tgt.EtlDeletedBy = @_FunctionName
					, tgt.EtlUpdatedOn = @LoadStart
					, tgt.EtlUpdatedBy = @_FunctionName
		;

		set @RowsAffected = @@rowcount;

		--!
		--! Only commit transactions started within this procedure
		--!
		if @_TxnIsExternal = 0 and (xact_state() = 1 or @@trancount > 0) commit tran ;
	end try
	begin catch
		set @_ErrorContext = 'Failed to refresh Customer dimension at step '
			+ coalesce('[' + @_Step + ']', 'NULL');

		--! If we have an uncommittable external transaction (see BOL), or a deadlock
		--! we can't do anything else until we roll that back. Alternatively, if we
		--! started the transaction we should roll it back otherwise or let the caller
		--! handle its own external txn 
		if (xact_state() = -1) or (xact_state() = 1 and error_number() = 1205) or (xact_state() = 1 and @_TxnIsExternal = 0)
			begin
				rollback tran;
				set @_ErrorContext = @_ErrorContext + ' (Forced roll back all changes)';
			end
		
		exec log4.ExceptionHandler
				  @ErrorContext   = @_ErrorContext
				, @ErrorProcedure = @_FunctionName
				, @ErrorNumber    = @_Error out
				, @ReturnMessage  = @_Message out;
	end catch

--/////////////////////////////////////////////////////////////////////////////////////////////////
EndProc:
--/////////////////////////////////////////////////////////////////////////////////////////////////

	--! Finally, throw an exception that will be detected by the caller
	if @_Error > 0 raiserror(@_Message, 16, 99);

	set nocount off;

	--! Return the value of @@ERROR (which will be zero on success)
	return (@_Error);
end
go
exec sp_addextendedproperty 'MS_Description'
, 'Merges any changes from the QlikView source into the staging area ready for consumption by the QV-to-IDW ETL process'
, 'SCHEMA', 'privy', 'PROCEDURE', 'CustomerRefresh', null, null;
go
