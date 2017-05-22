--==========================================================================================================================
-- DEFINES
--==========================================================================================================================
-- Defines
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Defines
		(Name,												Value)
SELECT	'JFD_CID_DISEASE_CITY_CONNECTION_MODIFIER',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,												Value)
SELECT	'JFD_CID_DISEASE_PER_POPULATION',					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,												Value)
SELECT	'JFD_CID_DISEASE_TRADE_ROUTE_MODIFIER',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,												Value)
SELECT	'JFD_CID_PLAGUE_BARBARIAN_CHANCE',					20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,												Value)
SELECT	'JFD_CID_PLAGUE_FOOD_CONSUMPTION',					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,												Value)
SELECT	'JFD_CID_PLAGUE_MIN_THRESHOLD_GAMESPEED_EPIC',		200
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,												Value)
SELECT	'JFD_CID_PLAGUE_MIN_THRESHOLD_GAMESPEED_HISTORIC',	200
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,												Value)
SELECT	'JFD_CID_PLAGUE_MIN_THRESHOLD_GAMESPEED_MARATHON',	300
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,												Value)
SELECT	'JFD_CID_PLAGUE_MIN_THRESHOLD_GAMESPEED_QUICK',		100
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,												Value)
SELECT	'JFD_CID_PLAGUE_MIN_THRESHOLD_GAMESPEED_STANDARD',	150
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,												Value)
SELECT	'JFD_CID_PLAGUE_UNIT_DAMAGE_PER_TURN',				2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--==========================================================================================================================
-- NOTIFICATIONS
--==========================================================================================================================	
-- Notifications
------------------------------	
INSERT INTO Notifications 
		(NotificationType, 									Welcomeness)
VALUES	('NOTIFICATION_JFD_PLAGUE',							1);
--==========================================================================================================================
-- YIELDS
--==========================================================================================================================
-- Yields
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Yields
SET Description = 'TXT_KEY_YIELD_JFD_DISEASE', IconString = '[ICON_JFD_DISEASE]', ColorString = '[COLOR_JFD_DISEASE]', ImageTexture = 'YieldAtlas_128_Disease.dds'
WHERE Type = 'YIELD_JFD_DISEASE';

UPDATE Yields
SET Description = 'TXT_KEY_YIELD_JFD_HEALTH', IconString = '[ICON_JFD_HEALTH]', ColorString = '[COLOR_JFD_HEALTH]', ImageTexture = 'YieldAtlas_128_Health.dds'
WHERE Type = 'YIELD_JFD_HEALTH';

INSERT INTO Yields_JFD_CrimeTypes
		(YieldType,				CrimeType)
SELECT	'YIELD_JFD_HEALTH',		'CRIME_JFD_HEALTH'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================