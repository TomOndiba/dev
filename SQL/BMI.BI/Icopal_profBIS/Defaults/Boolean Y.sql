CREATE DEFAULT [dbo].[Boolean Y]
    AS 'Y';


GO
EXECUTE sp_bindefault @defname = N'[dbo].[Boolean Y]', @objname = N'[dbo].[MD_SYSTEMID].[REMOVE_FTP_FILE]';


GO
EXECUTE sp_bindefault @defname = N'[dbo].[Boolean Y]', @objname = N'[dbo].[KPI_SHIFT_PRODUCTION_NEW].[MANUAL_INPUT]';


GO
EXECUTE sp_bindefault @defname = N'[dbo].[Boolean Y]', @objname = N'[dbo].[KPI_SCM_PLANT].[PLANT_ACTIVE]';


GO
EXECUTE sp_bindefault @defname = N'[dbo].[Boolean Y]', @objname = N'[dbo].[KPI_SHIFT_PRODUCTION].[MANUAL_INPUT]';


GO
EXECUTE sp_bindefault @defname = N'[dbo].[Boolean Y]', @objname = N'[dbo].[MD_MATCH_RULES].[RULE_ACTIVE]';


GO
EXECUTE sp_bindefault @defname = N'[dbo].[Boolean Y]', @objname = N'[dbo].[KPI_SCM_PRODLINE].[PRODLINE_ACTIVE]';


GO
EXECUTE sp_bindefault @defname = N'[dbo].[Boolean Y]', @objname = N'[dbo].[MD_PLANT].[PLANT_ACTIVE]';


GO
EXECUTE sp_bindefault @defname = N'[dbo].[Boolean Y]', @objname = N'[dbo].[MD_PLANT_PRODLINE].[PRODLINE_ACTIVE]';


GO
EXECUTE sp_bindefault @defname = N'[dbo].[Boolean Y]', @objname = N'[dbo].[MD_SUB_SBU].[CEX_ACTIVE]';


GO
EXECUTE sp_bindefault @defname = N'[dbo].[Boolean Y]', @objname = N'[dbo].[PU_COMPLIANCE].[BONUS_DIFFERENT_PERIOD]';


GO
EXECUTE sp_bindefault @defname = N'[dbo].[Boolean Y]', @objname = N'[dbo].[N_BOOLEAN_Y]';

