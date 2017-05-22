--==========================================================================================================================
-- DEFINES
--==========================================================================================================================
-- Defines
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Defines
		(Name,												Value)
SELECT	'JFD_RTP_PIETY_AI_TURNS_BETWEEN_CONVERSION',		25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,												Value)
SELECT	'JFD_RTP_PIETY_CITY_STATE_REST_BONUS',				51
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,												Value)
SELECT	'JFD_RTP_PIETY_IDEOLOGY_PENALTY',					-50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,												Value)
SELECT	'JFD_RTP_PIETY_RESTING_RATE_PER_TURN_ABOVE',		-1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,												Value)
SELECT	'JFD_RTP_PIETY_RESTING_RATE_PER_TURN_BELOW',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,												Value)
SELECT	'JFD_RTP_PIETY_STATE_RELIGION_CHANGE_FIRST',		50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,												Value)
SELECT	'JFD_RTP_PIETY_STATE_RELIGION_CHANGE',				25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,												Value)
SELECT	'JFD_RTP_PIETY_STATE_RELIGION_SECULARIZE',			25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,												Value)
SELECT	'MINOR_JFD_PIETY_GIFT_LARGE',						50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,												Value)
SELECT	'MINOR_JFD_PIETY_GIFT_LARGE_REWARD',				100
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,												Value)
SELECT	'MINOR_JFD_PIETY_GIFT_MEDIUM',						25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,												Value)
SELECT	'MINOR_JFD_PIETY_GIFT_MEDIUM_REWARD',				50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,												Value)
SELECT	'MINOR_JFD_PIETY_GIFT_SMALL',						10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,												Value)
SELECT	'MINOR_JFD_PIETY_GIFT_SMALL_REWARD',				25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);
--==========================================================================================================================
-- POST DEFINES
--==========================================================================================================================
-- PostDefines
------------------------------------------------------------------------------------------------------------------------	
UPDATE PostDefines
SET Key = 'ERA_ENLIGHTENMENT'
WHERE Name = 'RELIGION_LAST_FOUND_ERA'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
--==========================================================================================================================	
-- TOP PANEL
--==========================================================================================================================	
-- JFD_TopPanelAdditions
------------------------------		
INSERT INTO JFD_TopPanelIncludes
		(FileName)
VALUES	('JFD_PietyUtils.lua');
------------------------------
-- JFD_TopPanelAdditions
------------------------------	
INSERT INTO JFD_TopPanelAdditions
		(YieldType,				YieldSourcefunction,					YieldSourceToolTip)
VALUES	('YIELD_GOLDEN_AGE',	'JFD_GetGoldenAgePointsFromFollowers',	'TXT_KEY_JFD_GOLDEN_AGE_FROM_FOLLOWERS'),
		('YIELD_GOLDEN_AGE',	'JFD_GetGoldenAgePointsFromFaith',		'TXT_KEY_JFD_GOLDEN_AGE_FROM_FAITH');
--==========================================================================================================================
-- GAME SPEEDS
--==========================================================================================================================
-- GameSpeeds
------------------------------------------------------------------------------------------------------------------------
UPDATE GameSpeeds
SET PietyMax = 200, PietyMin = 0
WHERE Type = 'GAMESPEED_HISTORIC';	

UPDATE GameSpeeds
SET PietyMax = 200, PietyMin = 0
WHERE Type IN ('GAMESPEED_MARATHON', 'GAMESPEED_REPACE_MARATHON');

UPDATE GameSpeeds
SET PietyMax = 200, PietyMin = 0
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
-- DEFINES
--==========================================================================================================================
-- Defines
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Defines
SET Value = 20 -- 10
WHERE Name = 'RELIGION_MIN_FAITH_FIRST_PANTHEON';

UPDATE Defines
SET Value = 300 -- 200
WHERE Name = 'RELIGION_MIN_FAITH_FIRST_PROPHET';

UPDATE Defines
SET Value = 0 -- 5
WHERE Name = 'RELIGION_GAME_FAITH_DELTA_NEXT_PANTHEON'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_PANTHEON_CHANGES' AND Value = 1);

UPDATE Defines
SET Value = 150 -- 100
WHERE Name = 'RELIGION_FAITH_DELTA_NEXT_PROPHET';

UPDATE Defines
SET Value = 50 -- 5
WHERE Name = 'RELIGION_BASE_CHANCE_PROPHET_SPAWN';

UPDATE Defines
SET Value = 500 -- 1000
WHERE Name = 'RELIGION_ATHEISM_PRESSURE_PER_POP'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE_PRESSURE_HALF' AND Value = 1);	

UPDATE Defines
SET Value = 0 -- 1000
WHERE Name = 'RELIGION_ATHEISM_PRESSURE_PER_POP'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE_PRESSURE_NONE' AND Value = 1);	
	
UPDATE Defines
SET Value = 2500 -- 5000
WHERE Name = 'RELIGION_INITIAL_FOUNDING_CITY_PRESSURE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE_PRESSURE_HALF' AND Value = 1);	
	
UPDATE Defines
SET Value = 0 -- 5000
WHERE Name = 'RELIGION_INITIAL_FOUNDING_CITY_PRESSURE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE_PRESSURE_NONE' AND Value = 1);

UPDATE Defines
SET Value = 2 -- 5
WHERE Name = 'RELIGION_PER_TURN_FOUNDING_CITY_PRESSURE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE_PRESSURE_HALF' AND Value = 1);		
	
UPDATE Defines
SET Value = 0 -- 5
WHERE Name = 'RELIGION_PER_TURN_FOUNDING_CITY_PRESSURE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE_PRESSURE_NONE' AND Value = 1);	

UPDATE Defines
SET Value = 5 -- 10
WHERE Name = 'RELIGION_MISSIONARY_PRESSURE_MULTIPLIER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE_PRESSURE_HALF' AND Value = 1);	

UPDATE Defines
SET Value = 0 -- 10
WHERE Name = 'RELIGION_MISSIONARY_PRESSURE_MULTIPLIER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE_PRESSURE_NONE' AND Value = 1);	
	
UPDATE Defines
SET Value = 5 -- 10
WHERE Name = 'RELIGION_ADJACENT_CITY_DISTANCE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE_PRESSURE_HALF' AND Value = 1);	
		
UPDATE Defines
SET Value = 5 -- 10
WHERE Name = 'RELIGION_ADJACENT_CITY_DISTANCE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE_PRESSURE_NONE' AND Value = 1);	
	
UPDATE Defines
SET Value = 1 -- 1
WHERE Name = 'RELIGION_DIPLO_HIT_INITIAL_CONVERT_FRIENDLY_CITY';	
		
UPDATE Defines
SET Value = 3 -- 3
WHERE Name = 'RELIGION_DIPLO_HIT_RELIGIOUS_FLIP_FRIENDLY_CITY';

UPDATE Defines
SET Value = 25 -- 25
WHERE Name = 'RELIGION_DIPLO_HIT_CONVERT_HOLY_CITY';
	
UPDATE Defines
SET Value = 5 -- 5
WHERE Name = 'RELIGION_DIPLO_HIT_THRESHOLD';
--==========================================================================================================================	
-- DIPLO MODIFIERS
--==========================================================================================================================	
-- DiploModifiers
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO DiploModifiers 
		(Type, 											Description)
SELECT	'DIPLOMODIFIER_JFD_AT_WAR_WITH_FOUNDER',		'TXT_KEY_SPECIFIC_DIPLO_JFD_AT_WAR_WITH_FOUNDER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

INSERT INTO DiploModifiers 
		(Type, 											Description)
SELECT	'DIPLOMODIFIER_JFD_HEATHEN',					'TXT_KEY_SPECIFIC_DIPLO_JFD_HEATHEN'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

INSERT INTO DiploModifiers 
		(Type, 											Description)
SELECT	'DIPLOMODIFIER_JFD_HEATHEN_TOLERANT',			'TXT_KEY_SPECIFIC_DIPLO_JFD_HEATHEN_TOLERANT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

INSERT INTO DiploModifiers 
		(Type, 											Description)
SELECT	'DIPLOMODIFIER_JFD_HIGH_PIETY',					'TXT_KEY_SPECIFIC_DIPLO_JFD_HIGH_PIETY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

INSERT INTO DiploModifiers 
		(Type, 											Description)
SELECT	'DIPLOMODIFIER_JFD_LOW_PIETY',					'TXT_KEY_SPECIFIC_DIPLO_JFD_LOW_PIETY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	
--==========================================================================================================================	
-- ERAS
--==========================================================================================================================	
-- Eras
--------------------------------------------------------------------------------------------------------------------------		
UPDATE Eras 
SET JFD_StateReligionDiploMod = 1.5
WHERE Type = 'ERA_ANCIENT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

UPDATE Eras 
SET JFD_StateReligionDiploMod = 3
WHERE Type = 'ERA_CLASSICAL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

UPDATE Eras 
SET JFD_StateReligionDiploMod = 7
WHERE Type = 'ERA_MEDIEVAL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

UPDATE Eras 
SET JFD_StateReligionDiploMod = 5
WHERE Type = 'ERA_RENAISSANCE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

UPDATE Eras 
SET JFD_StateReligionDiploMod = 4
WHERE Type = 'ERA_ENLIGHTENMENT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

UPDATE Eras 
SET JFD_StateReligionDiploMod = 2
WHERE Type = 'ERA_INDUSTRIAL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

UPDATE Eras 
SET JFD_StateReligionDiploMod = 1
WHERE Type = 'ERA_MODERN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

UPDATE Eras 
SET JFD_StateReligionDiploMod = 1
WHERE Type = 'ERA_POSTMODERN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

UPDATE Eras 
SET JFD_StateReligionDiploMod = 1
WHERE Type = 'ERA_FUTURE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);		
--==========================================================================================================================
-- NOTIFICATIONS
--==========================================================================================================================	
-- Notifications
------------------------------	
INSERT INTO Notifications 
		(NotificationType, 				Welcomeness)
VALUES	('NOTIFICATION_JFD_PIETY',		1);
--==========================================================================================================================	
-- PROCESSES
--==========================================================================================================================			
-- Processes
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Processes 
		(Type,					TechPrereq,			Description,					Help,								Strategy, 								IconAtlas, 					PortraitIndex)
SELECT	'PROCESS_JFD_PIETY',	'TECH_THEOLOGY',	'TXT_KEY_PROCESS_JFD_PIETY',	'TXT_KEY_PROCESS_JFD_PIETY_HELP',	'TXT_KEY_PROCESS_JFD_PIETY_STRATEGY',	'JFD_PIETY_PROCESS_ATLAS',	0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

UPDATE Processes
SET TechPrereq = 'TECH_JFD_RELIGIOUS_ORDERS' 
WHERE Type = 'PROCESS_JFD_PIETY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_RELIGIOUS_ORDERS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Process_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Process_Flavors 
		(ProcessType,				FlavorType,				Flavor)
SELECT	'PROCESS_JFD_PIETY',		'FLAVOR_RELIGION',		25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	
--==========================================================================================================================	
-- TEXT
--==========================================================================================================================	
-- Language_en_US
------------------------------
UPDATE Language_en_US
SET Text = 'You must have researched Philosophy to adopt a State Religion. There must be a valid Religion and you must have met the founder.[NEWLINE][NEWLINE]You may secularize your State Religion once you have researched Scientific Theory.[NEWLINE][NEWLINE]It will cost you {1_Num} Turn(s) of [ICON_RESISTANCE] Anarchy to change your State Religion or to Secularize.'
WHERE Tag = 'TXT_KEY_RO_YOUR_STATE_RELIGION_STATUS_CHANGE_TT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_PRIESTHOOD' AND Value = 0);

UPDATE Language_en_US
SET Text = 'You must have researched Philosophy to adopt a State Religion. There must be a valid Religion and you must have met the founder.'
WHERE Tag = 'TXT_KEY_RO_YOUR_STATE_RELIGION_STATUS_PAGAN_TT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_PRIESTHOOD' AND Value = 0);
--==========================================================================================================================
--==========================================================================================================================