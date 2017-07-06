


create view [dbo].[V_MD_SBU_SCM] as
SELECT SBU, REGION_ID, SBU_NAME
FROM MD_SBU with (nolock)
where SCM_KPI = 'Y'