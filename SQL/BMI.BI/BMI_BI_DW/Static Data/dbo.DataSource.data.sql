set nocount on
go

;with sourceCte (DataSourceKey, DataSourceCode, DataSourceName, DataSourceGroup, HostCountry, DataCountries, QlikViewSourceSystemId, IsActive, PbiTxnViewSource, Narrative)
as
(
			  select     -1	, 'N/S'				, 'Not Specified at Source'					, 'SYSTEM'	, ''	, ''										, null	, 'Y' , 'QVS', 'Indicates that the value in the source system was NULL'
	union all select     -2	, 'N/F'				, 'Lookup Not Found'						, 'SYSTEM'	, ''	, ''										, null	, 'Y' , 'QVS', 'Indicates that the source system provided a value but that there is no matching lookup'
	union all select     -3	, 'N/I'				, 'Not Implemented in Source'				, 'SYSTEM'	, ''	, ''										, null	, 'Y' , 'QVS', 'Used when the source system does not support the concept of a data source'
	union all select     -4	, 'N/A'				, 'Not Applicable'							, 'SYSTEM'	, ''	, ''										, null	, 'Y' , 'QVS', 'Used in a context where data source has no relevance in this context'
	union all select     -5	, 'N/D'				, 'Not Defined'								, 'SYSTEM'	, ''	, ''										, null	, 'Y' , 'QVS', 'The logic to identify the data source has not been supplied or specified'
	union all select 100000	, 'EDW'				, 'Data Warehouse Metadata'					, 'SYSTEM'	, ''	, ''										, null	, 'Y' , 'QVS', 'Data supplied from the BMI Enterprise data warehouse e.g. conformed static/reference data'
	union all select 100001	, 'MDM'				, 'Mastered Data Repository'				, 'MASTER'	, ''	, ''										, null	, 'Y' , 'QVS', 'Data supplied from the BMI Master Data Management System (once implemented)'
	union all select 100101 , 'UK'				, 'Icopal UK - SAP'							, ''		, ''	, ''										, 1		, 'Y' , 'QVS', ''		
	union all select 100102 , 'DK'				, 'DK/SKF/SKS/BE/SE - Movex'				, ''		, ''	, ''										, 2		, 'Y' , 'QVS', ''		
	union all select 100103 , 'US'				, 'Icopal US'								, ''		, ''	, ''										, 3		, 'Y' , 'QVS', ''		
	union all select 100104 , 'SK'				, 'Icopal SK - SAP'							, ''		, ''	, ''										, 4		, 'Y' , 'QVS', ''		
	union all select 100105 , 'NO'				, 'Icopal NO -'								, ''		, ''	, ''										, 5		, 'Y' , 'QVS', ''		
	union all select 100106 , 'MFX'				, 'Monarflex SK - Movex'					, ''		, ''	, ''										, 6		, 'Y' , 'QVS', ''		
	union all select 100107 , 'NL'				, 'Icopal NL (Esha) - Baan 4'				, ''		, ''	, ''										, 7		, 'Y' , 'QVS', ''		
	union all select 100108 , 'NLS'				, 'Van Besouw, NL -  Baan 4'				, ''		, ''	, ''										, 8		, 'Y' , 'QVS', ''		
	union all select 100109 , 'SE'				, 'Icopal SE - Movex'						, ''		, ''	, ''										, 9		, 'Y' , 'QVS', ''		
	union all select 100110 , 'BE'				, 'Icopal BE - MFG pro'						, ''		, ''	, ''										, 10	, 'Y' , 'QVS', ''		
	union all select 100111 , 'CZ'				, 'Icopal CZ - SAP'							, ''		, ''	, ''										, 11	, 'Y' , 'QVS', ''		
	union all select 100112 , 'FI'				, 'Icopal FI - IBS'							, ''		, ''	, ''										, 12	, 'Y' , 'QVS', ''		
	union all select 100113 , 'M3-POL-Gen'		, 'Gen Poland - M3'							, ''		, ''	, ''										, 13	, 'Y' , 'PSA', ''		
	union all select 100114 , 'DE'				, 'Icopal DE - Invers'						, ''		, ''	, ''										, 14	, 'Y' , 'QVS', ''		
	union all select 100115 , 'FR'				, 'France - Movex'							, ''		, ''	, ''										, 15	, 'Y' , 'QVS', ''		
	union all select 100116 , 'Vedag-SAP'		, 'VEDAG - SAP'								, ''		, ''	, ''										, 16	, 'Y' , 'QVS', ''		
	union all select 100117 , 'RU (old)'		, 'Icopal RU (before 2015)'					, ''		, ''	, ''										, 17	, 'Y' , 'QVS', ''		
	union all select 100119 , 'AT'				, 'VILLAS Austria - SAP'					, ''		, ''	, ''										, 19	, 'Y' , 'QVS', ''		
	union all select 100120 , 'Villas-HUM'		, 'Villas - Hungary'						, ''		, ''	, ''										, 20	, 'Y' , 'QVS', ''		
	union all select 100122 , 'DEU-SAP'			, 'Icopal Germany - SAP (from 2011.05.01)'	, ''		, ''	, ''										, 22	, 'Y' , 'QVS', ''		
	union all select 100125 , 'CAN'				, 'Icopal Canada  (US)'						, ''		, ''	, ''										, 25	, 'Y' , 'QVS', ''		
	union all select 100126 , 'DES-IKV'			, 'DES (IKV)'								, ''		, ''	, ''										, 26	, 'Y' , 'QVS', ''		
	union all select 100127 , 'RU-SA'			, 'Icopal RU - SAP'							, ''		, ''	, ''										, 27	, 'Y' , 'QVS', ''		
	union all select 100129 , 'Poly-Cegid'		, 'Polytuil - Cegid'						, ''		, ''	, ''										, 29	, 'Y' , 'QVS', ''		
	union all select 100130 , 'Symph-POL'		, 'Poland - Symphonia'						, ''		, ''	, ''										, 30	, 'Y' , 'QVS', ''		
	union all select 100131 , 'Comptoir-Cegid'	, 'Comptoir - Cegid'						, ''		, ''	, ''										, 31	, 'Y' , 'QVS', ''		
	union all select 100132 , 'Sage-FRA'		, 'France - Sage Forte'						, ''		, ''	, ''										, 32	, 'Y' , 'QVS', ''		
	union all select 100133 , 'Wolfin - SAP'	, 'Wolfin - SAP'							, ''		, ''	, ''										, 33	, 'Y' , 'QVS', ''		
	union all select 100134 , 'Decra-DEU-SAP'	, 'Decra - Germany SAP'						, ''		, ''	, ''										, 34	, 'Y' , 'QVS', ''		
	union all select 100135 , 'Feumas-DEU-SAP'	, 'Feumas - Germany SAP'					, ''		, ''	, ''										, 35	, 'Y' , 'QVS', ''		
	union all select 100136 , 'Nav-ESP'			, 'Spain - Navision'						, ''		, ''	, ''										, 36	, 'Y' , 'QVS', ''		
	union all select 100137 , 'Nav-ITA'			, 'Italy - Navision'						, ''		, ''	, ''										, 37	, 'Y' , 'QVS', ''		
	union all select 100138 , 'Nav-ROU'			, 'Romania - Navision'						, ''		, ''	, ''										, 38	, 'Y' , 'QVS', ''		
	union all select 100139 , 'Nav-BGR'			, 'Bulgaria - Navision'						, ''		, ''	, ''										, 39	, 'Y' , 'QVS', ''		
	union all select 100140 , 'M3-POL-Ved'		, 'Vedag Poland - M3'						, ''		, ''	, ''										, 40	, 'Y' , 'PSA', ''		
	union all select 100141 , 'M3-POL-Vil'		, 'Villas Poland - M3'						, ''		, ''	, ''										, 41	, 'Y' , 'PSA', ''		
	union all select 100142 , 'Baan-NLD'		, 'NL ?? - Baan'							, ''		, ''	, ''										, 42	, 'Y' , 'QVS', ''		
	union all select 100143 , 'Wijo-SWE'		, 'Wijo - Sweden'							, ''		, ''	, ''										, 43	, 'Y' , 'QVS', ''		
	union all select 100144 , 'M3'				, 'M3 (DNK/SWE/BEL/SVK)'					, ''		, 'DNK'	, 'Denmark, Sweden, Belgium and Slovakia'	, null	, 'Y' , 'QVS', ''		
	union all select 100145 , 'M3-v7'			, 'M3 v7 (FRA/ESP)'							, ''		, 'FRA'	, 'France and Spain'						, null	, 'Y' , 'QVS', ''		
	union all select 100146 , 'Movex'			, 'Movex (DNK/SWE/BEL/SVK)'					, ''		, 'DNK'	, 'Denmark, Sweden, Belgium and Slovakia'	, null	, 'Y' , 'QVS', ''		
)
merge into dbo.DataSource as tgt
using sourceCte as src
on src.DataSourceKey = tgt.DataSourceKey
when matched
		and tgt.DataSourceCode <> src.DataSourceCode
		or tgt.DataSourceName <> src.DataSourceName
		or tgt.DataSourceGroup <> src.DataSourceGroup
		or tgt.HostCountry <> src.HostCountry
		or tgt.DataCountries <> src.DataCountries
		or coalesce(tgt.QlikViewSourceSystemId, -1) <> coalesce(src.QlikViewSourceSystemId, -1)
		or tgt.IsActive <> src.IsActive
		or tgt.Narrative <> src.Narrative
	then update set
		  tgt.DataSourceCode = src.DataSourceCode
		, tgt.DataSourceName = src.DataSourceName
		, tgt.DataSourceGroup = src.DataSourceGroup
		, tgt.HostCountry = src.HostCountry
		, tgt.DataCountries = src.DataCountries
		, tgt.QlikViewSourceSystemId = src.QlikViewSourceSystemId
		, tgt.IsActive = src.IsActive
		, tgt.Narrative = src.Narrative
when not matched then
	insert
	(
	  DataSourceKey
	, DataSourceCode
	, DataSourceName
	, DataSourceGroup
	, HostCountry
	, DataCountries
	, QlikViewSourceSystemId
	, IsActive
	, Narrative
	)
	values
	(
	  src.DataSourceKey
	, src.DataSourceCode
	, src.DataSourceName
	, src.DataSourceGroup
	, src.HostCountry
	, src.DataCountries
	, src.QlikViewSourceSystemId
	, src.IsActive
	, src.Narrative
	)
when not matched by source then
	delete ;
go

set nocount off
go
