﻿-- <Migration ID="b48d8663-af9b-451b-9e6d-8ebe5eb4835a" />
GO
SELECT 1

----!	Uncomment the whole script below to deploy

----!	CEGID Columns have yet to be defined

--/*BLF PRE */
--CREATE VIEW discovery.procurement_poly_fra_PO_to_Deliver
--WITH SCHEMABINDING
--AS SELECT	PRE_GL_NUMERO_CAL,
--			PRE_GL_NUMORDRE_CAL,
--			PRE_GL_INDECIG_CAL,
--			PRE_GL_SOUCHE_CAL,
--			'<COLUMNS>'	AS COLS		
--FROM psa.ics_stg_cegid_poly_fra_procure_LIGNE
--WHERE [PRE_GL_NATUREPIECCG_CAL] = 'BLF'
--GO;
--CREATE CLUSTERED INDEX IX_discovery_procurement_poly_fra_PO_to_Deliver
--ON discovery.procurement_poly_fra_PO_to_Delivery 
--			(	PRE_GL_NUMERO_CAL,
--				PRE_GL_NUMORDRE_CAL,
--				PRE_GL_INDECIG_CAL) 
--go;
--CREATE VIEW discovery.procurement_comp_fra_PO_to_Delivery
--WITH SCHEMABINDING
--AS SELECT	PRE_GL_NUMERO_CAL,
--			PRE_GL_NUMORDRE_CAL,
--			PRE_GL_INDECIG_CAL,
--			PRE_GL_SOUCHE_CAL,
--			'<COLUMNS>'	AS COLS		
--FROM psa.ics_stg_cegid_comp_fra_procure_LIGNE
--WHERE [PRE_GL_NATUREPIECCG_CAL] = 'BLF';
--GO;
--CREATE CLUSTERED INDEX IX_discovery_procurement_comp_fra_PO_to_Delivery
--ON discovery.procurement_poly_fra_PO_to_Delivery 
--			(	PRE_GL_NUMERO_CAL,
--				PRE_GL_NUMORDRE_CAL,
--				PRE_GL_INDECIG_CAL)
				
--/*FF on PIECEORIGINE*/ 
--go;
--CREATE VIEW discovery.procurement_poly_fra_PO_to_Invoice
--WITH SCHEMABINDING
--AS SELECT	ORIG_GL_NUMERO_CAL,
--			ORIG_GL_NUMORDRE_CAL,
--			ORIG_GL_INDECIG_CAL	,
--			ORIG_GL_SOUCHE_CAL,
--			'<COLUMNS>'	AS COLS		
--FROM psa.ics_stg_cegid_poly_fra_procure_LIGNE
--WHERE [ORIG_GL_NATUREPIECCG_CAL] =	'FF';
--GO;
--CREATE CLUSTERED INDEX IX_discovery_procurement_poly_fra_PO_to_Invoice
--ON discovery.procurement_poly_fra_PO_to_Invoice
--			(	ORIG_GL_NUMERO_CAL,
--				ORIG_GL_NUMORDRE_CAL,
--				ORIG_GL_INDECIG_CAL);
--GO

--CREATE VIEW discovery.procurement_comp_fra_PO_to_Invoice
--WITH SCHEMABINDING
--AS SELECT	ORIG_GL_NUMERO_CAL,
--			ORIG_GL_NUMORDRE_CAL,
--			ORIG_GL_INDECIG_CAL	,
--			ORIG_GL_SOUCHE_CAL,
--			'<COLUMNS>'	AS COLS		
--FROM psa.ics_stg_cegid_comp_fra_procure_LIGNE
--WHERE [ORIG_GL_NATUREPIECCG_CAL] =	'FF';
--GO;
--CREATE CLUSTERED INDEX IX_discovery_procurement_comp_fra_PO_to_Invoice
--ON discovery.procurement_comp_fra_PO_to_Invoice
--			(	ORIG_GL_NUMERO_CAL,
--				ORIG_GL_NUMORDRE_CAL,
--				ORIG_GL_INDECIG_CAL);

--GO;
--/*FF On PIECEPRECEDENT*/
--CREATE VIEW discovery.procurement_poly_fra_Delivery_to_Invoice
--WITH SCHEMABINDING
--AS SELECT	PRE_GL_NUMERO_CAL,
--			PRE_GL_NUMORDRE_CAL,
--			PRE_GL_INDECIG_CAL	,
--			PRE_GL_SOUCHE_CAL,
--			'<COLUMNS>'	AS COLS		
--FROM psa.ics_stg_cegid_poly_fra_procure_LIGNE
--WHERE [PRE_GL_NATUREPIECCG_CAL] =	'FF';
--GO;
--CREATE CLUSTERED INDEX IX_discovery_procurement_poly_fra_Delivery_to_Invoice
--ON discovery.procurement_poly_fra_Delivery_to_Invoice
--			(	PRE_GL_NUMERO_CAL,
--				PRE_GL_NUMORDRE_CAL,
--				PRE_GL_INDECIG_CAL);
--GO

--CREATE VIEW discovery.procurement_comp_fra_Delviery_to_Invoice
--WITH SCHEMABINDING
--AS SELECT	PRE_GL_NUMERO_CAL,
--			PRE_GL_NUMORDRE_CAL,
--			PRE_GL_INDECIG_CAL	,
--			PRE_GL_SOUCHE_CAL,
--			'<COLUMNS>'	AS COLS		
--FROM psa.ics_stg_cegid_comp_fra_procure_LIGNE
--WHERE [PRE_GL_NATUREPIECCG_CAL] =	'FF';
--GO;
--CREATE CLUSTERED INDEX IX_discovery_procurement_comp_fra_Delviery_to_Invoice
--ON discovery.procurement_comp_fra_PO_to_Invoice
--			(	PRE_GL_NUMERO_CAL,
--				PRE_GL_NUMORDRE_CAL,
--				PRE_GL_INDECIG_CAL);		  
		  	
