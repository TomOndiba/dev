-- <Migration ID="caf8faa3-033b-4df0-8a2e-bee9de04e2b3" />
GO

PRINT N'Creating index [IndClust_tsa_ics_land_m3_FGINLI_1] on [tsa].[ics_land_m3_FGINLI]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3_FGINLI_1] ON [tsa].[ics_land_m3_FGINLI] ([F5PNLI], [F5PNLS], [F5PUNO], [F5RELP], [F5REPN], [F5SINO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3_FPLEDG_1] on [tsa].[ics_land_m3_FPLEDG]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3_FPLEDG_1] ON [tsa].[ics_land_m3_FPLEDG] ([EPDIVI], [EPJRNO], [EPJSNO], [EPYEA4])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3_MPLIND_1] on [tsa].[ics_land_m3_MPLIND]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3_MPLIND_1] ON [tsa].[ics_land_m3_MPLIND] ([ICPNLI], [ICPNLS], [ICPNLX], [ICPUNO], [ICREPN], [ICSUDO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3_MPLINE_1] on [tsa].[ics_land_m3_MPLINE]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3_MPLINE_1] ON [tsa].[ics_land_m3_MPLINE] ([IBFACI], [IBPNLI], [IBPNLS], [IBPUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3v7_FGINLI_1] on [tsa].[ics_land_m3v7_FGINLI]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3v7_FGINLI_1] ON [tsa].[ics_land_m3v7_FGINLI] ([F5CONO], [F5PNLI], [F5PNLS], [F5PUNO], [F5REPN], [F5SINO], [F5SUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3v7_FPLEDG_1] on [tsa].[ics_land_m3v7_FPLEDG]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3v7_FPLEDG_1] ON [tsa].[ics_land_m3v7_FPLEDG] ([EPDIVI], [EPJRNO], [EPJSNO], [EPYEA4])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3v7_MPLIND_1] on [tsa].[ics_land_m3v7_MPLIND]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3v7_MPLIND_1] ON [tsa].[ics_land_m3v7_MPLIND] ([ICPNLI], [ICPNLS], [ICPNLX], [ICPUNO], [ICREPN], [ICSUDO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_m3v7_MPLINE_1] on [tsa].[ics_land_m3v7_MPLINE]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3v7_MPLINE_1] ON [tsa].[ics_land_m3v7_MPLINE] ([IBFACI], [IBPNLI], [IBPNLS], [IBPUNO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_movex_FGINLI_1] on [tsa].[ics_land_movex_FGINLI]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_movex_FGINLI_1] ON [tsa].[ics_land_movex_FGINLI] ([F5PNLI], [F5PNLS], [F5PUNO], [F5RELP], [F5REPN], [F5SINO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_movex_FPLEDG_1] on [tsa].[ics_land_movex_FPLEDG]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_movex_FPLEDG_1] ON [tsa].[ics_land_movex_FPLEDG] ([EPDIVI], [EPJRNO], [EPJSNO], [EPYEA4])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_movex_MPLIND_1] on [tsa].[ics_land_movex_MPLIND]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_movex_MPLIND_1] ON [tsa].[ics_land_movex_MPLIND] ([ICPNLI], [ICPNLS], [ICPNLX], [ICPUNO], [ICREPN], [ICSUDO])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_movex_MPLINE_1] on [tsa].[ics_land_movex_MPLINE]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_movex_MPLINE_1] ON [tsa].[ics_land_movex_MPLINE] ([IBCONO], [IBPNLI], [IBPNLS], [IBPUNO])
GO
