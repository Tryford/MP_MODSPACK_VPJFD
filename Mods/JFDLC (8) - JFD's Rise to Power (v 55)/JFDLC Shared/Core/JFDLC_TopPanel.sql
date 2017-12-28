--==========================================================================================================================	
-- TOP PANEL
--==========================================================================================================================	
-- JFD_TopPanelAdditions
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO JFD_TopPanelIncludes
		(FileName)
SELECT	'JFDLCUtils.lua'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	
--------------------------------------------------------------------------------------------------------------------------
-- JFD_TopPanelAdditions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO JFD_TopPanelAdditions
		(YieldType,			YieldSourcefunction,					YieldSourceToolTip)
SELECT	'YIELD_GOLDEN_AGE',	'GetExtraGAPFromFaith',					'TXT_KEY_JFD_GOLDEN_AGE_FROM_FAITH'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

INSERT INTO JFD_TopPanelAdditions
		(YieldType,			YieldSourcefunction,					YieldSourceToolTip)
SELECT	'YIELD_GOLDEN_AGE',	'GetExtraGAPFromHappiness',				'TXT_KEY_JFD_GOLDEN_AGE_FROM_HAPPINESS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	
--==========================================================================================================================
--==========================================================================================================================