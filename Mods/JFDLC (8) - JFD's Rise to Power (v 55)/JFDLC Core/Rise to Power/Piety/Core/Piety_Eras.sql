--==========================================================================================================================	
-- ERAS
--==========================================================================================================================	
-- Eras
--------------------------------------------------------------------------------------------------------------------------		
UPDATE Eras 
SET StateReligionDiploMod = 1.5
WHERE Type = 'ERA_ANCIENT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

UPDATE Eras 
SET StateReligionDiploMod = 3
WHERE Type = 'ERA_CLASSICAL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

UPDATE Eras 
SET StateReligionDiploMod = 7
WHERE Type = 'ERA_MEDIEVAL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

UPDATE Eras 
SET StateReligionDiploMod = 5
WHERE Type = 'ERA_RENAISSANCE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

UPDATE Eras 
SET StateReligionDiploMod = 4
WHERE Type = 'ERA_ENLIGHTENMENT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

UPDATE Eras 
SET StateReligionDiploMod = 2
WHERE Type = 'ERA_INDUSTRIAL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

UPDATE Eras 
SET StateReligionDiploMod = 1
WHERE Type = 'ERA_MODERN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

UPDATE Eras 
SET StateReligionDiploMod = 1
WHERE Type = 'ERA_POSTMODERN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

UPDATE Eras 
SET StateReligionDiploMod = 1
WHERE Type = 'ERA_FUTURE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);		
--==========================================================================================================================
--==========================================================================================================================