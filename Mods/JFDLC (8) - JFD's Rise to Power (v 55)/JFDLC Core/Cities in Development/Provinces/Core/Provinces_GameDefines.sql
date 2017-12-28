--==========================================================================================================================
-- DEFINES
--==========================================================================================================================
-- Defines
------------------------------------------------------------
UPDATE Defines
SET Value = 3
WHERE Name = 'MAX_CITY_ATTACK_RANGE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE_BOMBARD_RANGE' AND Value = 1);

INSERT INTO Defines
		(Name,								Value)
SELECT	'JFD_CID_PROVINCES_CITY_COST_MOD',	2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE_LEVIES' AND Value = 1);

INSERT INTO Defines
		(Name,								Value)
SELECT	'JFD_CID_PROVINCES_LEVY_COST_POP',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE_LEVIES' AND Value = 1);

INSERT INTO Defines
		(Name,								Value)
SELECT	'JFD_CID_PROVINCES_LEVY_MIN_POP',	5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE_LEVIES' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================