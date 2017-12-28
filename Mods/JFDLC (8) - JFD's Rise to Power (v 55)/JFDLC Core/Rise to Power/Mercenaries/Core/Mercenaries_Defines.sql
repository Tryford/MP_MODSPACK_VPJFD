--==========================================================================================================================
-- DEFINES
--==========================================================================================================================
-- Defines
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_RTP_MERCENARIES_DEFAULT_BREAK_COST',		50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_RTP_MERCENARIES_DEFAULT_EXTENSION_COST',	25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_RTP_MERCENARIES_DEFAULT_EXTENSION_TURNS',	10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_RTP_MERCENARIES_EXTRA_COST_PER_LEVEL',		50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_RTP_MERCENARIES_EXTRA_COST_PER_UNIT',		25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_RTP_MERCENARIES_PRODUCTION_TO_GOLD_COST',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================