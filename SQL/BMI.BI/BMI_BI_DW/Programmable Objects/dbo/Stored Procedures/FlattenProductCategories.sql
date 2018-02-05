IF OBJECT_ID('[dbo].[FlattenProductCategories]') IS NOT NULL
	DROP PROCEDURE [dbo].[FlattenProductCategories];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create    procedure [dbo].[FlattenProductCategories] @dummyPara int
as
	begin


		update
			tsa.PU_CATEGORY
		set
			Flag = 0
		  , ProductHierCombined = ''
		  , ProductHier1 = null
		  , ProductHier2 = null
		  , ProductHier3 = null
		  , ProductHier4 = null
		  , ProductHier5 = null
		  , ProductHier6 = null
		  , ProductHier7 = null ;

		declare @pcountmax int = (
									 select count(*) from	tsa.PU_CATEGORY
								 ) ;
		declare
			@pcountmin int = 1
		  , @id		   int = 0
		  , @cid	   int = null
		  , @pid	   int = null
		  , @updatecid int = null ;
		declare @updateph nvarchar(max) = '' ;


		while ((select	count(*) from	tsa.PU_CATEGORY where	Flag = 0) >= 1)
			begin

				set @cid =
				(
					select top 1	CATEGORY_ID from   tsa.PU_CATEGORY where   Flag = 0
				) ;
				set @updatecid = @cid ;

				update	tsa.PU_CATEGORY set Flag = 1 where	CATEGORY_ID = @cid ;

				while (@cid <> 386)
					begin

						set @updateph = +
										(
											select	CATEGORY_NAME from	tsa.PU_CATEGORY where	CATEGORY_ID = @cid
										) + ',' + @updateph ;
						set @pid =
						(
							select	PARENT_ID from	tsa.PU_CATEGORY where	CATEGORY_ID = @cid
						) ;
						set @cid = @pid ;

						update	tsa.PU_CATEGORY set Flag = 1 where	CATEGORY_ID = @cid ;

					end ;

				update
					tsa.PU_CATEGORY
				set
					ProductHierCombined = @updateph
				where
					CATEGORY_ID = @updatecid ;
				set @updateph = '' ;
			end ;




		update	tsa.PU_CATEGORY set ProductHier7 = ProductHierCombined ;



		update
			tsa.PU_CATEGORY
		set
			ProductHierCombined = left(ProductHierCombined, len(ProductHierCombined) - 1)
		where
			right(ProductHierCombined, 1) = ',' ;


		update
			tsa.PU_CATEGORY
		set
			ProductHier1 = left(ProductHierCombined, charindex(',', ProductHierCombined, 3)) ;
		update
			tsa.PU_CATEGORY
		set
			ProductHierCombined = replace(ProductHierCombined, left(ProductHierCombined, charindex(',', ProductHierCombined, 3)), '') ;



		update
			tsa.PU_CATEGORY
		set
			ProductHier2 = left(ProductHierCombined, charindex(',', ProductHierCombined, 3)) ;
		update
			tsa.PU_CATEGORY
		set
			ProductHierCombined = replace(ProductHierCombined, left(ProductHierCombined, charindex(',', ProductHierCombined, 3)), '') ;



		update
			tsa.PU_CATEGORY
		set
			ProductHier3 = left(ProductHierCombined, charindex(',', ProductHierCombined, 3)) ;
		update
			tsa.PU_CATEGORY
		set
			ProductHierCombined = replace(ProductHierCombined, left(ProductHierCombined, charindex(',', ProductHierCombined, 3)), '') ;




		update
			tsa.PU_CATEGORY
		set
			ProductHier4 = left(ProductHierCombined, charindex(',', ProductHierCombined, 3)) ;
		update
			tsa.PU_CATEGORY
		set
			ProductHierCombined = replace(ProductHierCombined, left(ProductHierCombined, charindex(',', ProductHierCombined, 3)), '') ;



		update
			tsa.PU_CATEGORY
		set
			ProductHier5 = left(ProductHierCombined, charindex(',', ProductHierCombined, 3)) ;
		update
			tsa.PU_CATEGORY
		set
			ProductHierCombined = replace(ProductHierCombined, left(ProductHierCombined, charindex(',', ProductHierCombined, 3)), '') ;



		update
			tsa.PU_CATEGORY
		set
			ProductHier6 = left(ProductHierCombined, charindex(',', ProductHierCombined, 3)) ;
		update
			tsa.PU_CATEGORY
		set
			ProductHierCombined = replace(ProductHierCombined, left(ProductHierCombined, charindex(',', ProductHierCombined, 3)), '') ;


		update
			tsa.PU_CATEGORY
		set
			ProductHier1 = ProductHierCombined
		where
			ProductHier1 is null
			or	ProductHier1 = '' ;

		update
			tsa.PU_CATEGORY
		set
			ProductHier2 = ProductHierCombined
		where
			(
				ProductHier2 is null
				or	ProductHier2 = ''
			)
			and rtrim(ltrim(replace(ProductHierCombined, ',', ''))) <> rtrim(ltrim(replace(ProductHier1, ',', '')))
			and ProductHier1 <> '' ;

		update
			tsa.PU_CATEGORY
		set
			ProductHier3 = ProductHierCombined
		where
			(
				ProductHier3 is null
				or	ProductHier3 = ''
			)
			and rtrim(ltrim(replace(ProductHierCombined, ',', ''))) <> rtrim(ltrim(replace(ProductHier2, ',', '')))
			and ProductHier2 <> '' ;

		update
			tsa.PU_CATEGORY
		set
			ProductHier4 = ProductHierCombined
		where
			(
				ProductHier4 is null
				or	ProductHier4 = ''
			)
			and rtrim(ltrim(replace(ProductHierCombined, ',', ''))) <> rtrim(ltrim(replace(ProductHier3, ',', '')))
			and ProductHier3 <> '' ;

		update
			tsa.PU_CATEGORY
		set
			ProductHier5 = ProductHierCombined
		where
			(
				ProductHier5 is null
				or	ProductHier5 = ''
			)
			and rtrim(ltrim(replace(ProductHierCombined, ',', ''))) <> rtrim(ltrim(replace(ProductHier4, ',', '')))
			and ProductHier4 <> '' ;

		update
			tsa.PU_CATEGORY
		set
			ProductHier6 = ProductHierCombined
		where
			(
				ProductHier6 is null
				or	ProductHier6 = ''
			)
			and rtrim(ltrim(replace(ProductHierCombined, ',', ''))) <> rtrim(ltrim(replace(ProductHier5, ',', '')))
			and ProductHier5 <> '' ;



		update
			tsa.PU_CATEGORY
		set
			ProductHier1 = replace(ProductHier1, ',', '')
		  , ProductHier2 = replace(ProductHier2, ',', '')
		  , ProductHier3 = replace(ProductHier3, ',', '')
		  , ProductHier4 = replace(ProductHier4, ',', '')
		  , ProductHier5 = replace(ProductHier5, ',', '')
		  , ProductHier6 = replace(ProductHier6, ',', '')
		  , ProductHierCombined = ProductHier7 ;
		update	tsa.PU_CATEGORY set ProductHier7 = null ;

	--select	* from	tsa.PU_CATEGORY ;
	end ;



GO
