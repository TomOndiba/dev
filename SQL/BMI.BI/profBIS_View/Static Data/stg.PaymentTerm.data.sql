set identity_insert stg.PaymentTerm on;
go

;with sourceCte (PaymentTermKey, IsDeleted, PaymentTermCode, PaymentTermDays, PaymentTermName, PaymentTermDescription)
as
(
			  select -1, 'N', 'N/S'	, null, 'Not Specified at Source'	, 'Indicates that the value in the source system was NULL'
	union all select -2, 'N', 'N/F'	, null, 'Lookup Not Found'			, 'Indicates that the source system provided a value but that there is no matching lookup'
	union all select -3, 'N', 'N/I'	, null, 'Not Implemented in Source'	, 'Used when the source system does not support the concept of this static type'
	union all select -4, 'N', 'N/A'	, null, 'Not Applicable'			, 'Used in a context where this static type has no relevance in this context'
	union all select -5, 'N', 'N/D'	, null, 'Not Defined'				, 'The logic to identify the static type has not been supplied or specified'
)
merge into stg.PaymentTerm as tgt
using sourceCte as src
	on src.PaymentTermKey = tgt.PaymentTermKey
when not matched
	then insert
	(
	  PaymentTermKey
	, IsDeleted
	, EtlDeltaHash
	, EtlCreatedOn
	, EtlCreatedBy
	, EtlUpdatedOn
	, EtlUpdatedBy
	, EtlDeletedOn
	, EtlDeletedBy
	, NativePaymentTermKey
	, PaymentTermDays
	, PaymentTermName
	, PaymentTermDescription
	)
	values
	(
	  src.PaymentTermKey
	, src.IsDeleted
	, src.PaymentTermCode -- EtlDeltaHash
	, getdate() -- EtlCreatedOn
	, 'add seed values' -- EtlCreatedBy
	, getdate() -- EtlUpdatedOn
	, 'add seed values'  -- EtlUpdatedBy
	, null -- EtlDeletedOn
	, null -- EtlDeletedBy
	, src.PaymentTermCode
	, src.PaymentTermDays
	, src.PaymentTermName
	, src.PaymentTermDescription
	)
when matched
	and tgt.IsDeleted <> src.IsDeleted
	or coalesce(tgt.PaymentTermDays, -1) <> coalesce(src.PaymentTermDays, -1)
	or tgt.NativePaymentTermKey <> src.PaymentTermCode
	or tgt.PaymentTermName <> src.PaymentTermName
	or tgt.PaymentTermDescription <> src.PaymentTermDescription
then update
	set
		  tgt.IsDeleted = src.IsDeleted
		, tgt.EtlDeltaHash = src.PaymentTermDays
		, tgt.EtlUpdatedOn = getdate()
		, tgt.EtlUpdatedBy = 'update seed values' 
		, tgt.EtlDeletedOn = case when src.IsDeleted = 'Y' then getdate() else tgt.EtlDeletedOn end
		, tgt.EtlDeletedBy = case when src.IsDeleted = 'Y' then 'update seed values' else tgt.EtlDeletedBy end
		, tgt.NativePaymentTermKey = src.PaymentTermCode
		, tgt.PaymentTermDays = src.PaymentTermDays
		, tgt.PaymentTermName = src.PaymentTermName
		, tgt.PaymentTermDescription = src.PaymentTermDescription
;
	
set identity_insert stg.PaymentTerm off;
go
