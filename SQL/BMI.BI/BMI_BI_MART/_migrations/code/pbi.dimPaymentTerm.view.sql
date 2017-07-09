if objectpropertyex(object_id(N'pbi.dimPaymentTerm'), N'IsView') = 1
	drop view pbi.dimPaymentTerm
go
set quoted_identifier on;
set ansi_nulls on;
go
create view [pbi].[dimPaymentTerm]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.dimPaymentTerm
DESCRIPTION:    Exposes current state of the PaymentTerm dimension imported from QlikView (no history available)
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
		  PaymentTermKey
		, PaymentTermName
		, PaymentTermDays
		, PaymentTermDescription
		, cast('19000101 00:00:00' as datetime) as [RowValidFromUTC]
		, cast('99991231 23:59:59' as datetime) as [RowValidToUTC]
		, cast('Y' as char(1)) as [IsCurrent]
		, IsDeleted
	from
		qvi.dimPaymentTerm
go
