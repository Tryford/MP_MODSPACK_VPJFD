--==========================================================================================================================
-- GAME SPEEDS
--==========================================================================================================================
-- GameSpeeds
------------------------------------------------------------------------------------------------------------------------
UPDATE GameSpeeds
SET PietyMax = 100, PietyMin = 0
WHERE Type = 'GAMESPEED_HISTORIC';	

UPDATE GameSpeeds
SET PietyMax = 100, PietyMin = 0
WHERE Type IN ('GAMESPEED_MARATHON', 'GAMESPEED_REPACE_MARATHON');

UPDATE GameSpeeds
SET PietyMax = 100, PietyMin = 0
WHERE Type IN ('GAMESPEED_EPIC', 'GAMESPEED_REPACE_EPIC');

UPDATE GameSpeeds
SET PietyMax = 100, PietyMin = 0
WHERE Type IN ('GAMESPEED_STANDARD', 'GAMESPEED_REPACE_STANDARD');

UPDATE GameSpeeds
SET PietyMax = 100, PietyMin = 0
WHERE Type IN ('GAMESPEED_QUICK', 'GAMESPEED_REPACE_QUICK');

UPDATE GameSpeeds	
SET ReligiousPressureAdjacentCity = 10 -- 20
WHERE Type IN ('GAMESPEED_MARATHON', 'GAMESPEED_REPACE_MARATHON')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE_PRESSURE_HALF' AND Value = 1);	
		
UPDATE GameSpeeds
SET ReligiousPressureAdjacentCity = 0 -- 20
WHERE Type IN ('GAMESPEED_MARATHON', 'GAMESPEED_REPACE_MARATHON')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE_PRESSURE_NONE' AND Value = 1);	

UPDATE GameSpeeds	
SET ReligiousPressureAdjacentCity = 20 -- 40
WHERE Type IN ('GAMESPEED_EPIC', 'GAMESPEED_REPACE_EPIC')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE_PRESSURE_HALF' AND Value = 1);	
		
UPDATE GameSpeeds
SET ReligiousPressureAdjacentCity = 0 -- 40
WHERE Type IN ('GAMESPEED_EPIC', 'GAMESPEED_REPACE_EPIC')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE_PRESSURE_NONE' AND Value = 1);	

UPDATE GameSpeeds	
SET ReligiousPressureAdjacentCity = 30 -- 60
WHERE Type IN ('GAMESPEED_STANDARD', 'GAMESPEED_REPACE_STANDARD')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE_PRESSURE_HALF' AND Value = 1);	
		
UPDATE GameSpeeds
SET ReligiousPressureAdjacentCity = 0 -- 60
WHERE Type IN ('GAMESPEED_STANDARD', 'GAMESPEED_REPACE_STANDARD')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE_PRESSURE_NONE' AND Value = 1);	

UPDATE GameSpeeds	
SET ReligiousPressureAdjacentCity = 45 -- 90
WHERE Type IN ('GAMESPEED_QUICK', 'GAMESPEED_REPACE_QUICK')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE_PRESSURE_HALF' AND Value = 1);	
		
UPDATE GameSpeeds
SET ReligiousPressureAdjacentCity = 0 -- 90
WHERE Type IN ('GAMESPEED_QUICK', 'GAMESPEED_REPACE_QUICK')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE_PRESSURE_NONE' AND Value = 1);	
--==========================================================================================================================
--==========================================================================================================================