--==========================================================================================================================	
-- DIPLO MODIFIERS
--==========================================================================================================================	
-- DiploModifiers
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO DiploModifiers 
		(Type, 											Description)
SELECT	'DIPLOMODIFIER_JFD_AT_WAR_WITH_FOUNDER',		'TXT_KEY_SPECIFIC_DIPLO_JFD_AT_WAR_WITH_FOUNDER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

INSERT INTO DiploModifiers 
		(Type, 											Description)
SELECT	'DIPLOMODIFIER_JFD_HEATHEN',					'TXT_KEY_SPECIFIC_DIPLO_JFD_HEATHEN'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

INSERT INTO DiploModifiers 
		(Type, 											Description)
SELECT	'DIPLOMODIFIER_JFD_HEATHEN_TOLERANT',			'TXT_KEY_SPECIFIC_DIPLO_JFD_HEATHEN_TOLERANT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

INSERT INTO DiploModifiers 
		(Type, 											Description)
SELECT	'DIPLOMODIFIER_JFD_HIGH_PIETY',					'TXT_KEY_SPECIFIC_DIPLO_JFD_HIGH_PIETY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

INSERT INTO DiploModifiers 
		(Type, 											Description)
SELECT	'DIPLOMODIFIER_JFD_LOW_PIETY',					'TXT_KEY_SPECIFIC_DIPLO_JFD_LOW_PIETY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	
--==========================================================================================================================
--==========================================================================================================================