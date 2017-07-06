create view [etl].[PaymentTermDelta]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      etl.PaymentTermDelta
DESCRIPTION:    Exposes Payment Term changes (new, changed and deleted) in the format best suited to populate the Interim
				Data Warehouse/Mart.
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    12-JUN-2017

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

	select
		  p.PaymentTermKey
        , p.IsDeleted
        , p.NativePaymentTermKey
        , p.PaymentTermName
        , p.PaymentTermDays
        , p.PaymentTermDescription
	from
		stg.PaymentTerm as p
	left join stg.PaymentTermControl as pc
		on pc.PaymentTermKey = p.PaymentTermKey
	where
			pc.PaymentTermKey is null --! New Payment Terms (not yet added to control)
		or pc.PreviousDeltaHash <> p.EtlDeltaHash -- Existing Payment Terms that have been updated
		or pc.IsDeleted <> p.IsDeleted --! Payment Terms that have been soft-deleted or (possibly) re-activated
go
exec sp_addextendedproperty @name = N'MS_Description'
, @value = 'Exposes Payment Term changes (new, changed and deleted) in the format best suited to populate the Interim Data Warehouse/Mart'
, @level0type = N'SCHEMA', @level0name = N'etl', @level1type = N'VIEW', @level1name = N'PaymentTermDelta';


