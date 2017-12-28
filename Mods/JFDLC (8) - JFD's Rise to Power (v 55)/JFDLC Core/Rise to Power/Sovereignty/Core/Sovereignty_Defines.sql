--==========================================================================================================================
-- DEFINES
--==========================================================================================================================
-- Defines
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Defines
		(Name,															Value)
SELECT	'JFD_RTP_SOVEREIGNTY_DEFAULT_ANARCHY_TURNS',					2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,															Value)
SELECT	'JFD_RTP_SOVEREIGNTY_DEFAULT_ANARCHY_COOLDOWN_TURNS',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,															Value)
SELECT	'JFD_RTP_SOVEREIGNTY_DEFAULT_LEGISLATURE_COOLDOWN',				25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,															Value)
SELECT	'JFD_RTP_SOVEREIGNTY_DEFAULT_LEGISLATURE_COOLDOWN_RATE',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,															Value)
SELECT	'JFD_RTP_SOVEREIGNTY_DEFAULT_REFORM_COOLDOWN',					20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,															Value)
SELECT	'JFD_RTP_SOVEREIGNTY_NO_LEGISLATURE_ANARCHY_PENALTY',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,															Value)
SELECT	'JFD_RTP_SOVEREIGNTY_NO_LEGISLATURE_SOVEREIGNTY_PENALTY',		0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,															Value)
SELECT	'JFD_RTP_SOVEREIGNTY_LEGITIMACY_POPULATION_THRESHOLD',			8
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,															Value)
SELECT	'JFD_RTP_SOVEREIGNTY_REFORM_CITY_STATE_MAX_CITIES',				3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,															Value)
SELECT	'JFD_RTP_SOVEREIGNTY_REFORM_CITY_STATE_SOVEREIGNTY',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,															Value)
SELECT	'JFD_RTP_SOVEREIGNTY_REFORM_EMPIRE_MIN_CITIES',					6
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,															Value)
SELECT	'JFD_RTP_SOVEREIGNTY_REFORM_EMPIRE_SOVEREIGNTY',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================