--==========================================================================================================================
-- GAME OPTIONS
--==========================================================================================================================	
-- GameOptions
------------------------------
INSERT OR REPLACE INTO GameOptions
		(Type,					Description,					Help,								"Default")
VALUES	('GAMEOPTION_EVENTS',	'TXT_KEY_GAME_OPTION_EVENTS',	'TXT_KEY_GAME_OPTION_EVENTS_HELP',	1);
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
-- NOTIFICATIONS
--==========================================================================================================================	
-- Notifications
------------------------------	
INSERT INTO Notifications 
		(NotificationType, 						Welcomeness)
VALUES	('NOTIFICATION_EVENT_CHOICE_FIN',		0),
		('NOTIFICATION_EVENT_CHOICE_CITY_FIN',	0);
--==========================================================================================================================
--==========================================================================================================================