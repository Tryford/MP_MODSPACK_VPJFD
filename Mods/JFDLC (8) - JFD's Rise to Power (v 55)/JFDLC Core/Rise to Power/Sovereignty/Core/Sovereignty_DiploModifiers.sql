--==========================================================================================================================	
-- DIPLO MODIFIERS
--==========================================================================================================================	
-- DiploModifiers
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO DiploModifiers 
		(Type, 								Description)
SELECT	'DIPLOMODIFIER_JFD_DOGES_PALACE',	'TXT_KEY_SPECIFIC_DIPLO_JFD_SAME_REPUBLIC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DOGES_PALACE' AND Value = 1);

INSERT INTO DiploModifiers 
		(Type, 								Description)
SELECT	'DIPLOMODIFIER_JFD_THEOCRACY',		'TXT_KEY_SPECIFIC_DIPLO_JFD_SAME_THEOCRACY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_ST_PETERS' AND Value = 1);

INSERT INTO DiploModifiers 
		(Type, 								Description)
SELECT	'DIPLOMODIFIER_JFD_VERSAILLES',		'TXT_KEY_SPECIFIC_DIPLO_JFD_SAME_MONARCHY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_VERSAILLES' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================