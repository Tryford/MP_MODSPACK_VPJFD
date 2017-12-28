--==========================================================================================================================
-- POUAKAI ENLIGHTENMENT ERA
--==========================================================================================================================
-- JFD_Ideals
------------------------------
UPDATE JFD_Ideals
SET MaxValidEra = 'ERA_ENLIGHTENMENT', HelpReq = 'TXT_KEY_IDEAL_JFD_CENTRAL_HELP_3_REQ_EE'
WHERE Type = 'IDEAL_JFD_CENTRAL_3' 
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_IMPERIALISM');

UPDATE JFD_Ideals
SET MaxValidEra = 'ERA_ENLIGHTENMENT', HelpReq = 'TXT_KEY_IDEAL_JFD_EASTERN_HELP_3_REQ_EE'
WHERE Type = 'IDEAL_JFD_EASTERN_3' 
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_IMPERIALISM');

UPDATE JFD_Ideals
SET MaxValidEra = 'ERA_ENLIGHTENMENT', HelpReq = 'TXT_KEY_IDEAL_JFD_WESTERN_HELP_2_REQ_EE'
WHERE Type = 'IDEAL_JFD_WESTERN_2' 
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_IMPERIALISM');
--==========================================================================================================================
--==========================================================================================================================