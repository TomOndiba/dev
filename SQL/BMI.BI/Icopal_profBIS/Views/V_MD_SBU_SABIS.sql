


CREATE view [dbo].[V_MD_SBU_SABIS] as
SELECT SBU,
       SALESCENTER_SBU = 
		case
			when isnull(SALESCENTER_SBU, '') = '' then SBU
			else SALESCENTER_SBU
		end,
       REGION_ID, 
	   SBU_NAME =
		case
			when isnull(SALESCENTER_SBU_NAME, '') = '' then SBU_NAME
			else SALESCENTER_SBU_NAME
		end
FROM MD_SBU with (nolock)
where SABIS = 'Y'