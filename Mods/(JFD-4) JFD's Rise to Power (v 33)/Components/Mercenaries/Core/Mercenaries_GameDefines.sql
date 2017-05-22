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
-- NOTIFICATIONS
--==========================================================================================================================	
-- Notifications
------------------------------	
INSERT INTO Notifications 
		(NotificationType, 								Welcomeness)
VALUES	('NOTIFICATION_JFD_MERCENARY',					1);
--==========================================================================================================================
-- POLICIES
--==========================================================================================================================
-- Language_en_US
--------------------------------------------------------------------------------------------------------------------------
UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_MERCENARY_ARMY_HELP'
WHERE Type = 'POLICY_TRADE_UNIONS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type='JFD_RTP_MERCENARIES_POLICY_CHANGES' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_ContractMods
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_JFD_ContractMods
		(PolicyType,				CostMod)
SELECT	'POLICY_TRADE_UNIONS',		-20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type='JFD_RTP_MERCENARIES_POLICY_CHANGES' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================