--==========================================================================================================================
-- DEFINES
--==========================================================================================================================
-- Defines
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_LOYALTY_AI_BONUS',						0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_LOYALTY_DEFAULT_FROM_CONNECTIONS',		5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_LOYALTY_DEFAULT_FROM_GARRISON',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_LOYALTY_DEFAULT_FROM_ELIMINATION',		30
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_LOYALTY_DEFAULT_FROM_PUPPET',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_LOYALTY_DEFAULT_FROM_SPY',				30
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_LOYALTY_REVOLT_THRESHOLD_PER_POP',		50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_LOYALTY_WLTKD_THRESHOLD_PER_POP',		50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_LOYALTY_RAZING_PENALTY',				3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_LOYALTY_RESISTANCE_PENALTY',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_LOYALTY_STARVATION_PENALTY',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_LOYALTY_UNEMPLOYMENT_PENALTY',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================