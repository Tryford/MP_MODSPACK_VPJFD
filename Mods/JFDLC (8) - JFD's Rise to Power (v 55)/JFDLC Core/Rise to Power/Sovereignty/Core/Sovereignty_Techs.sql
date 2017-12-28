--==========================================================================================================================
-- TECHNOLOGIES
--==========================================================================================================================	
-- Technologies_JFD_MiscEffects
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Technologies_JFD_MiscEffects
		(TechType,						AllowGovernments,		EffectToolTip)
SELECT	'TECH_PHILOSOPHY',				1,						'TXT_KEY_JFD_ALLOWS_GOVERNMENTS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);	
--------------------------------------------------------------------------------------------------------------------------
-- Technology_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Technology_Flavors 
		(TechType, 					FlavorType,					Flavor)
SELECT	'TECH_JFD_CODE_OF_LAWS', 	'FLAVOR_HAPPINESS',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================