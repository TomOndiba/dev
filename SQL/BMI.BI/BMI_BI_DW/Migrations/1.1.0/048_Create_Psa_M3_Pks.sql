-- <Migration ID="af03da55-76cd-474f-be0d-a1c5ae30e573" />
GO

PRINT N'Creating primary key [PK_psa_ics_stg_M3V10gen_POL_FGRECL] on [psa].[ics_stg_M3V10gen_POL_FGRECL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FGRECL] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_FGRECL] PRIMARY KEY CLUSTERED  ([F2CONO], [F2DIVI], [F2PNLI], [F2PNLS], [F2PUNO], [F2RELP], [F2REPN])
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10ved_POL_FGRECL] on [psa].[ics_stg_M3V10ved_POL_FGRECL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FGRECL] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_FGRECL] PRIMARY KEY CLUSTERED  ([F2CONO], [F2DIVI], [F2PNLI], [F2PNLS], [F2PUNO], [F2RELP], [F2REPN])
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V10vil_POL_FGRECL] on [psa].[ics_stg_M3V10vil_POL_FGRECL]'
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FGRECL] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_FGRECL] PRIMARY KEY CLUSTERED  ([F2CONO], [F2DIVI], [F2PNLI], [F2PNLS], [F2PUNO], [F2RELP], [F2REPN])
GO
