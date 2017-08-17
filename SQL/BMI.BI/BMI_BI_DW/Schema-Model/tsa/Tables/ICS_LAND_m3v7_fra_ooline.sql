CREATE TABLE [tsa].[ICS_LAND_m3v7_fra_ooline]
(
[EtlBatchRunId] [int] NULL,
[EtlStepRunId] [int] NULL,
[EtlThreadRunId] [int] NULL,
[DataSourceKey] [int] NULL,
[EtlCreatedOn] [datetime] NULL,
[EtlCreatedBy] [varchar] (200) NULL,
[OBCONO] [decimal] (3, 0) NULL,
[OBDIVI] [nvarchar] (255) NULL,
[OBORNO] [nvarchar] (255) NULL,
[OBPONR] [decimal] (5, 0) NULL,
[OBPOSX] [decimal] (2, 0) NULL,
[OBLTYP] [nvarchar] (255) NULL,
[OBORST] [nvarchar] (255) NULL,
[OBFACI] [nvarchar] (255) NULL,
[OBWHLO] [nvarchar] (255) NULL,
[OBITNO] [nvarchar] (255) NULL,
[OBREPI] [nvarchar] (255) NULL,
[OBITDS] [nvarchar] (255) NULL,
[OBTEDS] [nvarchar] (255) NULL,
[OBORQT] [decimal] (15, 6) NULL,
[OBORQA] [decimal] (15, 6) NULL,
[OBRNQT] [decimal] (15, 6) NULL,
[OBRNQA] [decimal] (15, 6) NULL,
[OBALQT] [decimal] (15, 6) NULL,
[OBALQA] [decimal] (15, 6) NULL,
[OBPLQT] [decimal] (15, 6) NULL,
[OBPLQA] [decimal] (15, 6) NULL,
[OBDLQT] [decimal] (15, 6) NULL,
[OBDLQA] [decimal] (15, 6) NULL,
[OBIVQT] [decimal] (15, 6) NULL,
[OBIVQA] [decimal] (15, 6) NULL,
[OBDCCD] [decimal] (1, 0) NULL,
[OBALUN] [nvarchar] (255) NULL,
[OBDCCA] [decimal] (1, 0) NULL,
[OBCOFA] [decimal] (15, 9) NULL,
[OBDMCF] [decimal] (1, 0) NULL,
[OBSPUN] [nvarchar] (255) NULL,
[OBPCOF] [decimal] (15, 9) NULL,
[OBDCCS] [decimal] (1, 0) NULL,
[OBCOFS] [decimal] (15, 9) NULL,
[OBDMCS] [decimal] (1, 0) NULL,
[OBPOPN] [nvarchar] (255) NULL,
[OBALWT] [decimal] (2, 0) NULL,
[OBALWQ] [nvarchar] (255) NULL,
[OBSAPR] [decimal] (17, 6) NULL,
[OBNEPR] [decimal] (17, 6) NULL,
[OBSACD] [decimal] (5, 0) NULL,
[OBPRMO] [nvarchar] (255) NULL,
[OBDIC1] [decimal] (1, 0) NULL,
[OBDIC2] [decimal] (1, 0) NULL,
[OBDIC3] [decimal] (1, 0) NULL,
[OBDIC4] [decimal] (1, 0) NULL,
[OBDIC5] [decimal] (1, 0) NULL,
[OBDIC6] [decimal] (1, 0) NULL,
[OBDIP1] [decimal] (5, 2) NULL,
[OBDIP2] [decimal] (5, 2) NULL,
[OBDIP3] [decimal] (5, 2) NULL,
[OBDIP4] [decimal] (5, 2) NULL,
[OBDIP5] [decimal] (5, 2) NULL,
[OBDIP6] [decimal] (5, 2) NULL,
[OBDIA1] [decimal] (15, 2) NULL,
[OBDIA2] [decimal] (15, 2) NULL,
[OBDIA3] [decimal] (15, 2) NULL,
[OBDIA4] [decimal] (15, 2) NULL,
[OBDIA5] [decimal] (15, 2) NULL,
[OBDIA6] [decimal] (15, 2) NULL,
[OBCMP1] [nvarchar] (255) NULL,
[OBCMP2] [nvarchar] (255) NULL,
[OBCMP3] [nvarchar] (255) NULL,
[OBCMP4] [nvarchar] (255) NULL,
[OBCMP5] [nvarchar] (255) NULL,
[OBCMP6] [nvarchar] (255) NULL,
[OBDIBE] [nvarchar] (255) NULL,
[OBDIRE] [nvarchar] (255) NULL,
[OBDCHA] [decimal] (1, 0) NULL,
[OBDPST] [decimal] (1, 0) NULL,
[OBDDSU] [decimal] (1, 0) NULL,
[OBIDSC] [decimal] (1, 0) NULL,
[OBACRF] [nvarchar] (255) NULL,
[OBOTDI] [decimal] (1, 0) NULL,
[OBDWDT] [decimal] (8, 0) NULL,
[OBDWHM] [decimal] (4, 0) NULL,
[OBCODT] [decimal] (8, 0) NULL,
[OBCOHM] [decimal] (4, 0) NULL,
[OBDWDZ] [decimal] (8, 0) NULL,
[OBDWHZ] [decimal] (4, 0) NULL,
[OBCODZ] [decimal] (8, 0) NULL,
[OBCOHZ] [decimal] (4, 0) NULL,
[OBTIZO] [nvarchar] (255) NULL,
[OBDLTS] [decimal] (4, 0) NULL,
[OBSTCD] [decimal] (1, 0) NULL,
[OBPRCH] [decimal] (1, 0) NULL,
[OBRORC] [decimal] (1, 0) NULL,
[OBRORN] [nvarchar] (255) NULL,
[OBRORL] [decimal] (6, 0) NULL,
[OBUCOS] [decimal] (17, 6) NULL,
[OBCOCD] [decimal] (5, 0) NULL,
[OBUCCD] [decimal] (1, 0) NULL,
[OBCMNO] [nvarchar] (255) NULL,
[OBHDPR] [nvarchar] (255) NULL,
[OBCFIN] [decimal] (10, 0) NULL,
[OBECVS] [decimal] (3, 0) NULL,
[OBVTCD] [decimal] (2, 0) NULL,
[OBJDCD] [nvarchar] (255) NULL,
[OBDLSP] [nvarchar] (255) NULL,
[OBLNAM] [decimal] (15, 2) NULL,
[OBLNA2] [decimal] (15, 2) NULL,
[OBDINR] [decimal] (5, 0) NULL,
[OBDISX] [decimal] (2, 0) NULL,
[OBAGNO] [nvarchar] (255) NULL,
[OBBAGC] [nvarchar] (255) NULL,
[OBBAGD] [decimal] (8, 0) NULL,
[OBAGLN] [decimal] (7, 0) NULL,
[OBPRRF] [nvarchar] (255) NULL,
[OBNTCD] [decimal] (1, 0) NULL,
[OBCNQT] [decimal] (15, 6) NULL,
[OBEDFP] [decimal] (17, 6) NULL,
[OBSMCD] [nvarchar] (255) NULL,
[OBBNCD] [decimal] (1, 0) NULL,
[OBPRAC] [decimal] (1, 0) NULL,
[OBVRCD] [nvarchar] (255) NULL,
[OBECLC] [nvarchar] (255) NULL,
[OBORCO] [nvarchar] (255) NULL,
[OBPRTX] [decimal] (13, 0) NULL,
[OBPOTX] [decimal] (13, 0) NULL,
[OBDTID] [decimal] (13, 0) NULL,
[OBDELS] [decimal] (1, 0) NULL,
[OBE0PA] [nvarchar] (255) NULL,
[OBDSGP] [nvarchar] (255) NULL,
[OBMOYE] [nvarchar] (255) NULL,
[OBPUSN] [nvarchar] (255) NULL,
[OBPUTP] [decimal] (1, 0) NULL,
[OBQTQL] [decimal] (1, 0) NULL,
[OBTEPA] [nvarchar] (255) NULL,
[OBPACT] [nvarchar] (255) NULL,
[OBCUPA] [nvarchar] (255) NULL,
[OBD1QT] [decimal] (15, 6) NULL,
[OBCUNO] [nvarchar] (255) NULL,
[OBCUOR] [nvarchar] (255) NULL,
[OBCUPO] [decimal] (7, 0) NULL,
[OBCUSX] [decimal] (3, 0) NULL,
[OBSMCC] [decimal] (1, 0) NULL,
[OBRSCD] [nvarchar] (255) NULL,
[OBMUFT] [decimal] (2, 0) NULL,
[OBINPR] [decimal] (17, 6) NULL,
[OBCUCT] [nvarchar] (255) NULL,
[OBABNO] [decimal] (1, 0) NULL,
[OBPROJ] [nvarchar] (255) NULL,
[OBELNO] [nvarchar] (255) NULL,
[OBBPAT] [nvarchar] (255) NULL,
[OBBPST] [decimal] (1, 0) NULL,
[OBNOAA] [decimal] (1, 0) NULL,
[OBCPRE] [nvarchar] (255) NULL,
[OBHAFE] [nvarchar] (255) NULL,
[OBCAWE] [decimal] (15, 6) NULL,
[OBWHSL] [nvarchar] (255) NULL,
[OBBANO] [nvarchar] (255) NULL,
[OBCAMU] [nvarchar] (255) NULL,
[OBADID] [nvarchar] (255) NULL,
[OBROUT] [nvarchar] (255) NULL,
[OBRODN] [decimal] (3, 0) NULL,
[OBDSDT] [decimal] (8, 0) NULL,
[OBDSHM] [decimal] (4, 0) NULL,
[OBDSTX] [nvarchar] (255) NULL,
[OBDEFC] [decimal] (3, 0) NULL,
[OBPLDT] [decimal] (8, 0) NULL,
[OBPLHM] [decimal] (4, 0) NULL,
[OBSRCD] [decimal] (1, 0) NULL,
[OBSPLC] [nvarchar] (255) NULL,
[OBDLBU] [decimal] (1, 0) NULL,
[OBSPOS] [decimal] (3, 0) NULL,
[OBFDED] [decimal] (8, 0) NULL,
[OBLDED] [decimal] (8, 0) NULL,
[OBAETY] [decimal] (1, 0) NULL,
[OBATNR] [decimal] (17, 0) NULL,
[OBSCMO] [nvarchar] (255) NULL,
[OBPRPR] [decimal] (1, 0) NULL,
[OBCINA] [decimal] (1, 0) NULL,
[OBATV1] [decimal] (15, 6) NULL,
[OBATV2] [decimal] (15, 6) NULL,
[OBATV3] [decimal] (15, 6) NULL,
[OBATV4] [decimal] (15, 6) NULL,
[OBATV5] [decimal] (15, 6) NULL,
[OBATV6] [nvarchar] (255) NULL,
[OBATV7] [nvarchar] (255) NULL,
[OBATV8] [nvarchar] (255) NULL,
[OBATV9] [nvarchar] (255) NULL,
[OBATV0] [nvarchar] (255) NULL,
[OBCNNR] [decimal] (11, 0) NULL,
[OBMNIN] [nvarchar] (255) NULL,
[OBREPN] [decimal] (10, 0) NULL,
[OBATPR] [nvarchar] (255) NULL,
[OBATMO] [nvarchar] (255) NULL,
[OBORTY] [nvarchar] (255) NULL,
[OBSUNO] [nvarchar] (255) NULL,
[OBPUPR] [decimal] (17, 6) NULL,
[OBPUCD] [decimal] (5, 0) NULL,
[OBPPUN] [nvarchar] (255) NULL,
[OBCUCD] [nvarchar] (255) NULL,
[OBODI1] [decimal] (5, 2) NULL,
[OBODI2] [decimal] (5, 2) NULL,
[OBODI3] [decimal] (5, 2) NULL,
[OBOURR] [nvarchar] (255) NULL,
[OBOURT] [nvarchar] (255) NULL,
[OBBUYE] [nvarchar] (255) NULL,
[OBFWHL] [nvarchar] (255) NULL,
[OBPRNO] [nvarchar] (255) NULL,
[OBSCHN] [decimal] (11, 0) NULL,
[OBMODL] [nvarchar] (255) NULL,
[OBTEDL] [nvarchar] (255) NULL,
[OBTEL2] [nvarchar] (255) NULL,
[OBRGDT] [decimal] (8, 0) NULL,
[OBRGTM] [decimal] (6, 0) NULL,
[OBLMDT] [decimal] (8, 0) NULL,
[OBCHNO] [decimal] (3, 0) NULL,
[OBCHID] [nvarchar] (255) NULL,
[OBRORX] [decimal] (3, 0) NULL,
[OBLMTS] [decimal] (18, 0) NULL,
[OBRTQA] [decimal] (15, 6) NULL,
[OBRTQT] [decimal] (15, 6) NULL,
[EtlSourceTable] [varchar] (200) NOT NULL
)
GO
