-- <Migration ID="48815206-e8b7-4b3d-84b7-46184385e3c2" />
GO

PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur000610_1] on [tsa].[ics_land_baan_ttdpur000610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur000610_1] ON [tsa].[ics_land_baan_ttdpur000610] ([t_sern])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur001610_1] on [tsa].[ics_land_baan_ttdpur001610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur001610_1] ON [tsa].[ics_land_baan_ttdpur001610] ([t_qono])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur002610_1] on [tsa].[ics_land_baan_ttdpur002610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur002610_1] ON [tsa].[ics_land_baan_ttdpur002610] ([t_pono], [t_qono])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur010610_1] on [tsa].[ics_land_baan_ttdpur010610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur010610_1] ON [tsa].[ics_land_baan_ttdpur010610] ([t_qono], [t_trdt], [t_trtm])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur011610_1] on [tsa].[ics_land_baan_ttdpur011610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur011610_1] ON [tsa].[ics_land_baan_ttdpur011610] ([t_pono], [t_qono], [t_sern], [t_trdt], [t_trtm])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur020610_1] on [tsa].[ics_land_baan_ttdpur020610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur020610_1] ON [tsa].[ics_land_baan_ttdpur020610] ([t_cntr], [t_item], [t_suno])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur021610_1] on [tsa].[ics_land_baan_ttdpur021610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur021610_1] ON [tsa].[ics_land_baan_ttdpur021610] ([t_item], [t_suno])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur027610_1] on [tsa].[ics_land_baan_ttdpur027610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur027610_1] ON [tsa].[ics_land_baan_ttdpur027610] ([t_cplp], [t_suno])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur028610_1] on [tsa].[ics_land_baan_ttdpur028610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur028610_1] ON [tsa].[ics_land_baan_ttdpur028610] ([t_ccos], [t_pono])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur030610_1] on [tsa].[ics_land_baan_ttdpur030610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur030610_1] ON [tsa].[ics_land_baan_ttdpur030610] ([t_cntr], [t_dile], [t_item], [t_qanp], [t_stdt], [t_suno])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur031610_1] on [tsa].[ics_land_baan_ttdpur031610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur031610_1] ON [tsa].[ics_land_baan_ttdpur031610] ([t_cpgp], [t_dile], [t_qanp], [t_stdt], [t_suno])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur032610_1] on [tsa].[ics_land_baan_ttdpur032610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur032610_1] ON [tsa].[ics_land_baan_ttdpur032610] ([t_cntr], [t_cplp], [t_dile], [t_item], [t_qanp], [t_stdt])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur033610_1] on [tsa].[ics_land_baan_ttdpur033610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur033610_1] ON [tsa].[ics_land_baan_ttdpur033610] ([t_cpgp], [t_cplp], [t_dile], [t_qanp], [t_stdt])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur034610_1] on [tsa].[ics_land_baan_ttdpur034610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur034610_1] ON [tsa].[ics_land_baan_ttdpur034610] ([t_cpgp], [t_dile], [t_suno])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur035610_1] on [tsa].[ics_land_baan_ttdpur035610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur035610_1] ON [tsa].[ics_land_baan_ttdpur035610] ([t_cpgp], [t_cplp], [t_dile])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur036610_1] on [tsa].[ics_land_baan_ttdpur036610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur036610_1] ON [tsa].[ics_land_baan_ttdpur036610] ([t_cntr], [t_dile], [t_item], [t_suno])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur037610_1] on [tsa].[ics_land_baan_ttdpur037610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur037610_1] ON [tsa].[ics_land_baan_ttdpur037610] ([t_cntr], [t_cplp], [t_dile], [t_item])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur040610_1] on [tsa].[ics_land_baan_ttdpur040610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur040610_1] ON [tsa].[ics_land_baan_ttdpur040610] ([t_orno])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur041610_1] on [tsa].[ics_land_baan_ttdpur041610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur041610_1] ON [tsa].[ics_land_baan_ttdpur041610] ([t_orno], [t_pono])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur042610_1] on [tsa].[ics_land_baan_ttdpur042610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur042610_1] ON [tsa].[ics_land_baan_ttdpur042610] ([t_ckor], [t_orno], [t_pono])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur043610_1] on [tsa].[ics_land_baan_ttdpur043610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur043610_1] ON [tsa].[ics_land_baan_ttdpur043610] ([t_logn])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur045610_1] on [tsa].[ics_land_baan_ttdpur045610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur045610_1] ON [tsa].[ics_land_baan_ttdpur045610] ([t_orno], [t_pono], [t_srnb])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur046610_1] on [tsa].[ics_land_baan_ttdpur046610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur046610_1] ON [tsa].[ics_land_baan_ttdpur046610] ([t_orno], [t_pono], [t_srnb], [t_srni], [t_suno])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur047610_1] on [tsa].[ics_land_baan_ttdpur047610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur047610_1] ON [tsa].[ics_land_baan_ttdpur047610] ([t_orno], [t_ponb], [t_pono])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur048610_1] on [tsa].[ics_land_baan_ttdpur048610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur048610_1] ON [tsa].[ics_land_baan_ttdpur048610] ([t_orno], [t_pono])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur050610_1] on [tsa].[ics_land_baan_ttdpur050610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur050610_1] ON [tsa].[ics_land_baan_ttdpur050610] ([t_orno], [t_trdt], [t_trtm])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur051610_1] on [tsa].[ics_land_baan_ttdpur051610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur051610_1] ON [tsa].[ics_land_baan_ttdpur051610] ([t_ckor], [t_orno], [t_pono], [t_sern], [t_trdt], [t_trtm])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur053610_1] on [tsa].[ics_land_baan_ttdpur053610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur053610_1] ON [tsa].[ics_land_baan_ttdpur053610] ([t_cosn], [t_orno])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur054610_1] on [tsa].[ics_land_baan_ttdpur054610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur054610_1] ON [tsa].[ics_land_baan_ttdpur054610] ([t_orno], [t_pono])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur061610_1] on [tsa].[ics_land_baan_ttdpur061610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur061610_1] ON [tsa].[ics_land_baan_ttdpur061610] ([t_citg], [t_item], [t_suno], [t_year])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur080610_1] on [tsa].[ics_land_baan_ttdpur080610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur080610_1] ON [tsa].[ics_land_baan_ttdpur080610] ([t_cntr], [t_item], [t_orno], [t_pono])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur081610_1] on [tsa].[ics_land_baan_ttdpur081610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur081610_1] ON [tsa].[ics_land_baan_ttdpur081610] ([t_cntr], [t_item], [t_orno])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur082610_1] on [tsa].[ics_land_baan_ttdpur082610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur082610_1] ON [tsa].[ics_land_baan_ttdpur082610] ([t_cpgp], [t_orno])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur300610_1] on [tsa].[ics_land_baan_ttdpur300610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur300610_1] ON [tsa].[ics_land_baan_ttdpur300610] ([t_cono])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur301610_1] on [tsa].[ics_land_baan_ttdpur301610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur301610_1] ON [tsa].[ics_land_baan_ttdpur301610] ([t_cono], [t_pono])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur302610_1] on [tsa].[ics_land_baan_ttdpur302610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur302610_1] ON [tsa].[ics_land_baan_ttdpur302610] ([t_cono], [t_ddta], [t_pono])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur303610_1] on [tsa].[ics_land_baan_ttdpur303610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur303610_1] ON [tsa].[ics_land_baan_ttdpur303610] ([t_ckor], [t_cono])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur305610_1] on [tsa].[ics_land_baan_ttdpur305610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur305610_1] ON [tsa].[ics_land_baan_ttdpur305610] ([t_cono], [t_trdt], [t_trtm])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur306610_1] on [tsa].[ics_land_baan_ttdpur306610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur306610_1] ON [tsa].[ics_land_baan_ttdpur306610] ([t_comp], [t_cono], [t_pono], [t_sern], [t_trdt], [t_trtm])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur310610_1] on [tsa].[ics_land_baan_ttdpur310610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur310610_1] ON [tsa].[ics_land_baan_ttdpur310610] ([t_cono], [t_pono], [t_upid])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur332610_1] on [tsa].[ics_land_baan_ttdpur332610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur332610_1] ON [tsa].[ics_land_baan_ttdpur332610] ([t_cono], [t_dile], [t_pono], [t_qanp], [t_stdt])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur333610_1] on [tsa].[ics_land_baan_ttdpur333610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur333610_1] ON [tsa].[ics_land_baan_ttdpur333610] ([t_cono], [t_dile], [t_pono], [t_qanp], [t_stdt])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur335610_1] on [tsa].[ics_land_baan_ttdpur335610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur335610_1] ON [tsa].[ics_land_baan_ttdpur335610] ([t_cono], [t_dile], [t_pono])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur336610_1] on [tsa].[ics_land_baan_ttdpur336610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur336610_1] ON [tsa].[ics_land_baan_ttdpur336610] ([t_cono], [t_dile], [t_pono])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur400610_1] on [tsa].[ics_land_baan_ttdpur400610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur400610_1] ON [tsa].[ics_land_baan_ttdpur400610] ([t_dino], [t_orno], [t_pono], [t_suno])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur401610_1] on [tsa].[ics_land_baan_ttdpur401610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur401610_1] ON [tsa].[ics_land_baan_ttdpur401610] ([t_dino], [t_orno], [t_pono], [t_sera], [t_serb], [t_suno])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur703610_1] on [tsa].[ics_land_baan_ttdpur703610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur703610_1] ON [tsa].[ics_land_baan_ttdpur703610] ([t_orno], [t_pono])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_baan_ttdpur704610_1] on [tsa].[ics_land_baan_ttdpur704610]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur704610_1] ON [tsa].[ics_land_baan_ttdpur704610] ([t_date], [t_orno], [t_pono], [t_time])
GO
