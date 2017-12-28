--==========================================================================================================================
-- TEXT
--==========================================================================================================================
-- LocalizedText
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO LocalizedText (Language, Tag, Gender, Plurality, Text) 
SELECT Language, Tag, Gender, Plurality, Replace(Text, 'Worker', 'Peasant')
FROM LocalizedText WHERE Tag LIKE 'TXT_KEY_%' AND NOT Tag IN ('TXT_KEY_UNIT_JFD_WORKER', 'TXT_KEY_UNIT_JFD_WORKER_STRATEGY', 'TXT_KEY_UNIT_JFD_WORKER_STRATEGY_CHARGES')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_PEASANT' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================
