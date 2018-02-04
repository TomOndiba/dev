-- <Migration ID="723c9a34-c1de-4edf-a96d-0c2d0d6cab6a" />
GO

PRINT N'Creating primary key [PK_psa_ics_stg_M3_FGRECL] on [psa].[ics_stg_m3_FGRECL]'
GO
ALTER TABLE [psa].[ics_stg_m3_FGRECL] ADD CONSTRAINT [PK_psa_ics_stg_M3_FGRECL] PRIMARY KEY CLUSTERED  ([F2CONO], [F2DIVI], [F2PNLI], [F2PNLS], [F2PUNO], [F2RELP], [F2REPN])
GO
PRINT N'Creating primary key [PK_psa_ics_stg_M3V7_FGRECL] on [psa].[ics_stg_m3v7_FGRECL]'
GO
ALTER TABLE [psa].[ics_stg_m3v7_FGRECL] ADD CONSTRAINT [PK_psa_ics_stg_M3V7_FGRECL] PRIMARY KEY CLUSTERED  ([F2CONO], [F2DIVI], [F2PNLI], [F2PNLS], [F2PUNO], [F2RELP], [F2REPN])
GO
