CREATE DEFAULT [dbo].[NOW]
    AS GetDate();


GO
EXECUTE sp_bindefault @defname = N'[dbo].[NOW]', @objname = N'[dbo].[FLEXTEXT].[UPDATE_DATE]';


GO
EXECUTE sp_bindefault @defname = N'[dbo].[NOW]', @objname = N'[dbo].[FLEXTEXT].[CREATE_DATE]';


GO
EXECUTE sp_bindefault @defname = N'[dbo].[NOW]', @objname = N'[dbo].[FLEXLOG].[LOG_DATE]';


GO
EXECUTE sp_bindefault @defname = N'[dbo].[NOW]', @objname = N'[dbo].[MD_UNIT_CHANGE].[CREATE_DATE]';


GO
EXECUTE sp_bindefault @defname = N'[dbo].[NOW]', @objname = N'[dbo].[D_DAY]';

