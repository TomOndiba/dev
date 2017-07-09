IF OBJECT_ID('[dbo].[Numbers]') IS NOT NULL
	DROP FUNCTION [dbo].[Numbers];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create function [dbo].[Numbers]
(
  @size int
)
returns table
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
FUNCTION NAME:  dbo.Numbers
DESCRIPTION:    Returns a dynamically created set of N sequential numbers starting at 1 where N is the value of @size
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    14-Jun-2017

Additional Notes
================
select max(Number) from  dbo.Numbers(255) -- tinyint
select max(Number) from  dbo.Numbers(32767) -- smallint
select max(Number) from  dbo.Numbers(2147483647) -- int
select max(Number) from  dbo.Numbers(9223372036854775807) -- bigint not supported

REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		14-Jun-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------

**********************************************************************************************************************/
--</CommentHeader>
return
	(
		with
			  cte0 (num) as (select 1 union all select 1)
			, cte1 (num) as (select 1 from cte0 as x cross join cte0 as y)
			, cte2 (num) as (select 1 from cte1 as x cross join cte1 as y)
			, cte3 (num) as (select 1 from cte2 as x cross join cte2 as y)
			, cte4 (num) as (select 1 from cte3 as x cross join cte3 as y)
			, cte5 (num) as (select 1 from cte4 as x cross join cte4 as y)
			, cte6 (num) as (select 1 from cte5 as x cross join cte5 as y)

		select top(case when @size > 0 then @size else 0 end)
			row_number() over (order by num) as [Number]
		from
			cte6
	)
GO
EXEC sp_addextendedproperty N'MS_Description', N'Returns a dynamically created set of N sequential numbers starting at 1 (up to a maximum of 2,147,483,647) where N is the value of @size', 'SCHEMA', N'dbo', 'FUNCTION', N'Numbers', NULL, NULL
GO
