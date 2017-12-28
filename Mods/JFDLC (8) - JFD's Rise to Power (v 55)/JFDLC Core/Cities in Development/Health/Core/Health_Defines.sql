--==========================================================================================================================
-- DEFINES
--==========================================================================================================================
-- Defines
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Defines
		(Name,														Value)
SELECT	'JFD_CID_HEALTH_DISEASE_PER_POPULATION',					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,														Value)
SELECT	'JFD_CID_HEALTH_DISEASE_CITY_CONNECTION_MODIFIER',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,														Value)
SELECT	'JFD_CID_HEALTH_DISEASE_TRADE_ROUTE_MODIFIER',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,														Value)
SELECT	'JFD_CID_HEALTH_PLAGUE_FOOD_CONSUMPTION',					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,														Value)
SELECT	'JFD_CID_HEALTH_PLAGUE_MIN_THRESHOLD_GAMESPEED_EPIC',		200
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,														Value)
SELECT	'JFD_CID_HEALTH_PLAGUE_MIN_THRESHOLD_GAMESPEED_HISTORIC',	200
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,														Value)
SELECT	'JFD_CID_HEALTH_PLAGUE_MIN_THRESHOLD_GAMESPEED_MARATHON',	300
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,														Value)
SELECT	'JFD_CID_HEALTH_PLAGUE_MIN_THRESHOLD_GAMESPEED_QUICK',		100
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,														Value)
SELECT	'JFD_CID_HEALTH_PLAGUE_MIN_THRESHOLD_GAMESPEED_STANDARD',	150
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================
