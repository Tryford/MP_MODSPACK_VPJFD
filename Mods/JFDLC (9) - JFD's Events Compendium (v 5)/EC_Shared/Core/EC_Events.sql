--==========================================================================================================================
-- EVENTS
--==========================================================================================================================	
-- Events
------------------------------	
UPDATE Events
SET RandomChance = -1, RandomChanceDelta = -1
WHERE EventClass = 'EVENT_CLASS_BAD'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EC_DISABLE_BAD_EVENTS' AND Value = 1);	

UPDATE CityEvents
SET RandomChance = -1, RandomChanceDelta = -1
WHERE EventClass = 'EVENT_CLASS_BAD'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EC_DISABLE_BAD_EVENTS' AND Value = 1);	
--==========================================================================================================================
--==========================================================================================================================