--==========================================================================================================================
-- USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 											text 										default NULL,
	Value 											integer 									default 1);
--------------------------------------------------------------------------	
-- Modular Features that can be toggled on and off and then back on.
--------------------------------------------------------------------------
/*
Allows support for various third-party mods. 
  1 = Enabled (Default)
  0 = Disabled
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,															Value)
VALUES	('JFD_EC_DISABLE_BAD_EVENTS',									1); --Disables all 'Bad' Events (events with only negative outcomes). Temp. workaround for the failure of the default game option.
--==========================================================================================================================	
-- DO NOT MODIFY 
--==========================================================================================================================
--JFD_GlobalUserSettings
--------------------------
--Claims
UPDATE Events
SET RandomChance = -1, RandomChanceDelta = -1
WHERE Type IN ('PLAYER_EVENT_JFD_MISC_EXCELLENT_OFFICIAL_2', 'PLAYER_EVENT_JFD_MISC_TERRIBLE_OFFICIAL_2', 'PLAYER_EVENT_JFD_CULDIV_SOUTHERN_POLITICAL', 'PLAYER_EVENT_JFD_CULDIV_WEST_AFRICAN_DIGNITARY')
AND NOT EXISTS (SELECT Type FROM Resources WHERE Type = 'RESOURCE_JFD_DIGNITARIES');

--Epithets
UPDATE Events
SET RandomChance = -1, RandomChanceDelta = -1
WHERE Type IN ('PLAYER_EVENT_JFD_EPITHETS_EXECUTION_INNOCENT_2', 'PLAYER_EVENT_JFD_EPITHETS_BANQUET', 'PLAYER_EVENT_JFD_EPITHETS_CATHOLIC', 'PLAYER_EVENT_JFD_EPITHETS_DEFAMATION', 'PLAYER_EVENT_JFD_EPITHETS_EXECUTION', 'PLAYER_EVENT_JFD_EPITHETS_EXECUTION_GUILT', 'PLAYER_EVENT_JFD_EPITHETS_EXECUTION_GUILT_SUICIDE', 'PLAYER_EVENT_JFD_EPITHETS_EXECUTION_INNOCENT', 'PLAYER_EVENT_JFD_EPITHETS_EXECUTION_THANKS', 'PLAYER_EVENT_JFD_EPITHETS_SPOUSE', 'PLAYER_EVENT_JFD_EPITHETS_TREASURES')
AND NOT EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HAPPINESS_CORE' AND Value = 1);

--Exploration
UPDATE Events
SET RandomChance = -1, RandomChanceDelta = -1
WHERE Type IN ('PLAYER_EVENT_JFD_EXPLORATION_VENTURER')
AND NOT EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_CORE' AND Value = 1);

--Events
UPDATE Events
SET RandomChance = -1, RandomChanceDelta = -1
WHERE Type IN ('PLAYER_EVENT_JFD_MISC_EXCELLENT_OFFICIAL', 'PLAYER_EVENT_JFD_MISC_TERRIBLE_OFFICIAL')
AND NOT EXISTS (SELECT Type FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');

--Happiness
UPDATE Events
SET RandomChance = -1, RandomChanceDelta = -1
WHERE Type IN ('CITY_EVENT_JFD_COLONIES_PENAL', 'CITY_EVENT_JFD_MISC_ASSASSINATION', 'CITY_EVENT_JFD_COLONIES_ASSEMBLY', 'CITY_EVENT_JFD_COLONIES_ASSEMBLY_GOLD', 'CITY_EVENT_JFD_COLONIES_ASSEMBLY_FREEDOM', 'CITY_EVENT_JFD_COLONIES_ASSEMBLY_WAR', 'PLAYER_EVENT_JFD_EPITHETS_DEFAMATION')
AND NOT EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HAPPINESS_CORE' AND Value = 1);

--Loyalty
UPDATE Events
SET RandomChance = -1, RandomChanceDelta = -1
WHERE Type IN ('CITY_EVENT_JFD_COLONIES_ASSEMBLY', 'CITY_EVENT_JFD_COLONIES_ASSEMBLY_FLAG', 'CITY_EVENT_JFD_COLONIES_ASSEMBLY_FLAG_FAIL', 'CITY_EVENT_JFD_COLONIES_ASSEMBLY_FLAG_SUCCESS', 'CITY_EVENT_JFD_COLONIES_ASSEMBLY_GOLD', 'CITY_EVENT_JFD_COLONIES_ASSEMBLY_FREEDOM', 'CITY_EVENT_JFD_COLONIES_ASSEMBLY_WAR', 'PLAYER_EVENT_JFD_EPITHETS_DEFAMATION')
AND NOT EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

--Slavery
UPDATE Events
SET RandomChance = -1, RandomChanceDelta = -1
WHERE Type IN ('PLAYER_EVENT_JFD_CULDIV_WEST_AFRICAN_DIGNITARY')
AND NOT EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

--UPDATE CityEvents
--SET RandomChance = -1, RandomChanceDelta = -1
--WHERE Type IN ('', '')
--AND NOT EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HAPPINESS_CORE' AND Value = 1);
--==========================================================================================================================	
--==========================================================================================================================	