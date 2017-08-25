CREATE TABLE [tsa].[ics_land_M3V10ved_POL_MPOPLA]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF__ics_land___Exclu__04B07DB2] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF__ics_land___IsDup__05A4A1EB] DEFAULT ((0)),
[POACRF] [nchar] (8) NULL,
[POACTP] [nchar] (2) NULL,
[POADID] [nchar] (6) NULL,
[POADVI] [nchar] (6) NULL,
[POAECN] [nchar] (7) NULL,
[POALQT] [numeric] (18, 0) NULL,
[POAPRB] [nchar] (10) NULL,
[POATNR] [numeric] (18, 0) NULL,
[POAURE] [nchar] (10) NULL,
[POBANO] [nvarchar] (20) NULL,
[POBIRT] [numeric] (18, 0) NULL,
[POBLTA] [numeric] (18, 0) NULL,
[POBUYE] [nchar] (10) NULL,
[POCFGH] [nchar] (15) NULL,
[POCFGL] [nchar] (15) NULL,
[POCFI1] [nchar] (10) NULL,
[POCFI2] [numeric] (18, 0) NULL,
[POCFI3] [nchar] (3) NULL,
[POCFI4] [nchar] (5) NULL,
[POCFI5] [nchar] (1) NULL,
[POCHID] [nchar] (10) NULL,
[POCHNO] [numeric] (18, 0) NULL,
[POCMCO] [nchar] (2) NULL,
[POCOCE] [nchar] (8) NULL,
[POCONO] [numeric] (18, 0) NULL,
[POCUCD] [nchar] (3) NULL,
[PODEID] [numeric] (18, 0) NULL,
[PODILE] [numeric] (18, 0) NULL,
[PODLDT] [numeric] (18, 0) NULL,
[POECVE] [nchar] (4) NULL,
[POELNO] [nchar] (8) NULL,
[POETD1] [numeric] (18, 0) NULL,
[POETD2] [numeric] (18, 0) NULL,
[POETRF] [nchar] (3) NULL,
[POEXNO] [nchar] (7) NULL,
[POFACI] [nchar] (3) NULL,
[POFUDT] [numeric] (18, 0) NULL,
[POFUSC] [nchar] (3) NULL,
[POGETY] [nchar] (2) NULL,
[POGRMT] [nchar] (3) NULL,
[POHOMA] [numeric] (18, 0) NULL,
[POITNO] [nchar] (15) NULL,
[POLDIS] [numeric] (18, 0) NULL,
[POLEDN] [numeric] (18, 0) NULL,
[POLEDT] [numeric] (18, 0) NULL,
[POLMDT] [numeric] (18, 0) NULL,
[POLMTS] [numeric] (18, 0) NULL,
[POMEDC] [nchar] (10) NULL,
[POMES1] [nchar] (6) NULL,
[POMES2] [nchar] (6) NULL,
[POMES3] [nchar] (6) NULL,
[POMES4] [nchar] (6) NULL,
[POMETE] [numeric] (18, 0) NULL,
[POMODL] [nchar] (3) NULL,
[POMPRN] [nchar] (15) NULL,
[POMSG1] [nchar] (2) NULL,
[POMSG2] [nchar] (2) NULL,
[POMSG3] [nchar] (2) NULL,
[POMSG4] [nchar] (2) NULL,
[POMSTR] [nchar] (3) NULL,
[POMSUF] [nvarchar] (20) NULL,
[POMVA1] [numeric] (18, 0) NULL,
[POMVA2] [numeric] (18, 0) NULL,
[POMVA3] [numeric] (18, 0) NULL,
[POMVA4] [numeric] (18, 0) NULL,
[POMVB1] [numeric] (18, 0) NULL,
[POMVB2] [numeric] (18, 0) NULL,
[POMVB3] [numeric] (18, 0) NULL,
[POMVB4] [numeric] (18, 0) NULL,
[POMVS1] [numeric] (18, 0) NULL,
[POMVS2] [numeric] (18, 0) NULL,
[PONHAI] [nchar] (15) NULL,
[PONHSN] [nvarchar] (20) NULL,
[PONOED] [numeric] (18, 0) NULL,
[PONSUN] [nchar] (10) NULL,
[PONUAU] [numeric] (18, 0) NULL,
[PONUM2] [numeric] (18, 0) NULL,
[POODI1] [numeric] (18, 0) NULL,
[POODI2] [numeric] (18, 0) NULL,
[POODI3] [numeric] (18, 0) NULL,
[POOFID] [nchar] (10) NULL,
[POOPED] [numeric] (18, 0) NULL,
[POORQT] [numeric] (18, 0) NULL,
[POORTY] [nchar] (3) NULL,
[POOSHV] [nchar] (10) NULL,
[POOURR] [nchar] (10) NULL,
[POOURT] [nchar] (1) NULL,
[POPACT] [nchar] (6) NULL,
[POPITD] [nvarchar] (30) NULL,
[POPITT] [nvarchar] (60) NULL,
[POPLDT] [numeric] (18, 0) NULL,
[POPLP2] [numeric] (18, 0) NULL,
[POPLPN] [numeric] (18, 0) NULL,
[POPLPS] [numeric] (18, 0) NULL,
[POPNLI] [numeric] (18, 0) NULL,
[POPNLS] [numeric] (18, 0) NULL,
[POPOTC] [nchar] (2) NULL,
[POPPQT] [numeric] (18, 0) NULL,
[POPPSQ] [nchar] (2) NULL,
[POPPUN] [nchar] (3) NULL,
[POPRCS] [nchar] (3) NULL,
[POPRIF] [numeric] (18, 0) NULL,
[POPRIP] [nchar] (1) NULL,
[POPRNS] [nchar] (15) NULL,
[POPROD] [nchar] (10) NULL,
[POPROJ] [nchar] (7) NULL,
[POPSDT] [numeric] (18, 0) NULL,
[POPSTS] [nchar] (2) NULL,
[POPTCD] [numeric] (18, 0) NULL,
[POPTXT] [nvarchar] (60) NULL,
[POPUCD] [numeric] (18, 0) NULL,
[POPUNO] [nchar] (7) NULL,
[POPUPR] [numeric] (18, 0) NULL,
[POPURC] [nchar] (10) NULL,
[POPUSL] [nchar] (2) NULL,
[POPUUN] [nchar] (3) NULL,
[PORELD] [numeric] (18, 0) NULL,
[POREPP] [numeric] (18, 0) NULL,
[POREQT] [numeric] (18, 0) NULL,
[PORESP] [nchar] (10) NULL,
[PORFID] [nchar] (10) NULL,
[PORGDT] [numeric] (18, 0) NULL,
[PORGTM] [numeric] (18, 0) NULL,
[PORORC] [numeric] (18, 0) NULL,
[PORORL] [numeric] (18, 0) NULL,
[PORORN] [nchar] (10) NULL,
[PORORX] [numeric] (18, 0) NULL,
[PORPLD] [numeric] (18, 0) NULL,
[PORPLQ] [numeric] (18, 0) NULL,
[PORSCD] [nchar] (3) NULL,
[POSCHD] [numeric] (18, 0) NULL,
[POSITE] [nvarchar] (30) NULL,
[POSLTP] [nchar] (2) NULL,
[POSTQT] [numeric] (18, 0) NULL,
[POSTRT] [nchar] (3) NULL,
[POSUFI] [nvarchar] (20) NULL,
[POSUNO] [nchar] (10) NULL,
[POSUPR] [numeric] (18, 0) NULL,
[POSVDT] [numeric] (18, 0) NULL,
[POSVTS] [numeric] (18, 0) NULL,
[POTEDL] [nchar] (3) NULL,
[POTEOR] [numeric] (18, 0) NULL,
[POTEPY] [nchar] (3) NULL,
[POTFNO] [nchar] (16) NULL,
[POTIHM] [numeric] (18, 0) NULL,
[POTPCD] [numeric] (18, 0) NULL,
[POTXID] [numeric] (18, 0) NULL,
[POUPAV] [numeric] (18, 0) NULL,
[POWHLO] [nchar] (3) NULL,
[POYRE1] [nvarchar] (36) NULL,
[POZSET] [numeric] (18, 0) NULL
)
GO
