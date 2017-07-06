set identity_insert stg.Customer on;
go

;with sourceCte (CustomerKey, IsDeleted, QlikViewSourceSystemId, CustomerNumber, CustomerName, CustomerAddress1)
as
(
			  select -1, 'N', 100000, 'N/S', 'Not Specified at Source'	, 'Indicates that the value in the source system was NULL'
	union all select -2, 'N', 100000, 'N/F', 'Lookup Not Found'			, 'Indicates that the source system provided a value but that there is no matching lookup'
	union all select -3, 'N', 100000, 'N/I', 'Not Implemented in Source'	, 'Used when the source system does not support the concept of a Customer'
	union all select -4, 'N', 100000, 'N/A', 'Not Applicable'			, 'Used in a context where Customer has no relevance in this context'
	union all select -5, 'N', 100000, 'N/D', 'Not Defined'				, 'The logic to identify the Customer has not been supplied or specified'
)
merge into stg.Customer as tgt
using sourceCte as src
	on src.CustomerKey = tgt.CustomerKey
when not matched
	then insert
	(
	  CustomerKey
	, IsDeleted
	, EtlDeltaHash
	, EtlCreatedOn
	, EtlCreatedBy
	, EtlUpdatedOn
	, EtlUpdatedBy
	, EtlDeletedOn
	, EtlDeletedBy
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
	  src.CustomerKey
	, src.IsDeleted
	, src.CustomerNumber -- EtlDeltaHash
	, getdate() -- EtlCreatedOn
	, 'add seed values' -- EtlCreatedBy
	, getdate() -- EtlUpdatedOn
	, 'add seed values'  -- EtlUpdatedBy
	, null -- EtlDeletedOn
	, null -- EtlDeletedBy
	, src.QlikViewSourceSystemId
	, src.CustomerNumber -- NativeCustomerKey
	, src.CustomerNumber
	, src.CustomerName

	, src.CustomerAddress1
	, '' -- CustomerAddress2
	, '' -- CustomerAddress3
	, src.CustomerNumber -- CustomerZipCode
	, src.CustomerName -- CustomerCity
	, src.CustomerNumber -- CustomerCountry
	, src.CustomerNumber -- CustomerVatNumber
	, null -- CustomerTypeId
	, src.CustomerName -- CustomerTypeName
	, src.CustomerName -- CustomerGroup1
	, '' -- CustomerGroup2
	, '' -- CustomerGroup3
	, '' -- CustomerGroup4
	, '' -- CustomerGroup5
	, '?' -- CategoryIsMapped
	, src.CustomerNumber -- NativeCustomerCategoryKey
	, src.CustomerName -- CustomerCategoryBaseLevel
	, src.CustomerName -- CustomerCategoryLevel1
	, '' -- CustomerCategoryLevel2
	, '' -- CustomerCategoryLevel3
	, '' -- CustomerCategoryLevel4
	, '' -- CustomerCategoryLevel5
	, '' -- CustomerCategoryLevel6
	, '' -- CustomerCategoryLevel7
	, '' -- CustomerCategoryLevel8
	)
when matched
	and tgt.IsDeleted <> src.IsDeleted
	or tgt.QlikViewSourceSystemId <> src.QlikViewSourceSystemId
	or tgt.CustomerNumber <> src.CustomerNumber
	or tgt.CustomerName <> src.CustomerName
	or tgt.CustomerAddress1 <> src.CustomerAddress1
then update
	set
		  tgt.IsDeleted = src.IsDeleted
		, tgt.EtlDeltaHash = src.CustomerNumber
		, tgt.EtlUpdatedOn = getdate()
		, tgt.EtlUpdatedBy = 'update seed values' 
		, tgt.EtlDeletedOn = case when src.IsDeleted = 'Y' then getdate() else tgt.EtlDeletedOn end
		, tgt.EtlDeletedBy = case when src.IsDeleted = 'Y' then 'update seed values' else tgt.EtlDeletedBy end
		, tgt.QlikViewSourceSystemId = src.QlikViewSourceSystemId
		, tgt.NativeCustomerKey = src.CustomerNumber -- NativeCustomerKey
		, tgt.CustomerNumber = src.CustomerNumber
		, tgt.CustomerName = src.CustomerName
		, tgt.CustomerAddress1 = src.CustomerAddress1
		, tgt.CustomerZipCode = src.CustomerNumber -- CustomerZipCode
		, tgt.CustomerCity = src.CustomerName -- CustomerCity
		, tgt.CustomerCountry = src.CustomerNumber -- CustomerCountry
		, tgt.CustomerVatNumber = src.CustomerNumber -- CustomerVatNumber
		, tgt.CustomerTypeName = src.CustomerName -- CustomerTypeName
		, tgt.CustomerGroup1 = src.CustomerName -- CustomerGroup1
		, tgt.NativeCustomerCategoryKey = src.CustomerNumber -- NativeCustomerCategoryKey
		, tgt.CustomerCategoryBaseLevel = src.CustomerName -- CustomerCategoryBaseLevel
		, tgt.CustomerCategoryLevel1 = src.CustomerName
;
	
set identity_insert stg.Customer off;
go

