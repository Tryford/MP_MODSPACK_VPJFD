--==========================================================================================================================
-- DEFINES
--==========================================================================================================================
-- Defines
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Defines
		(Name,												Value)
SELECT	'JFD_RTP_PIETY_AI_CHANCE_TO_FOUND_VIRTUOUS',		25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,												Value)
SELECT	'JFD_RTP_PIETY_AI_CHANCE_TO_FOUND_NEUTRAL',			50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

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
SELECT	'JFD_RTP_PIETY_FROM_NATURAL_WONDER',				25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,												Value)
SELECT	'JFD_RTP_PIETY_FROM_PROPHET',						200
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

UPDATE Defines
SET Value = 20 -- 10
WHERE Name = 'RELIGION_MIN_FAITH_FIRST_PANTHEON';

UPDATE Defines
SET Value = 300 -- 200
WHERE Name = 'RELIGION_MIN_FAITH_FIRST_PROPHET';

UPDATE Defines
SET Value = 0 -- 5
WHERE Name = 'RELIGION_GAME_FAITH_DELTA_NEXT_PANTHEON'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE_PANTHEON_CHANGES' AND Value = 1);

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
--==========================================================================================================================


