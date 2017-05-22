--==========================================================================================================================
-- POUAKAI ENLIGHTENMENT ERA
--==========================================================================================================================
-- JFD_Epithets
--------------------------------------------------------------------------------------------------------------------------
UPDATE JFD_Epithets 
SET IsOnFirstToEra = 'ERA_ENLIGHTENMENT'
WHERE Type = 'EPITHET_JFD_ENLIGHTENED'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
--==========================================================================================================================
-- CITIES IN DEVELOPMENT
--==========================================================================================================================
-- JFD_Epithets
------------------------------------------------------------------------------------------------------------------------
UPDATE JFD_Epithets
SET Description = 'TXT_KEY_EPITHET_JFD_COMMONER_DESC_CHARGES'
WHERE Type = 'EPITHET_JFD_COMMONER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Policies
------------------------------------------------------------------------------------------------------------------------
UPDATE Policies
SET WorkerSpeedModifier = 0
WHERE Type = 'POLICY_EPITHET_JFD_COMMONER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_BuildCharges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_JFD_BuildCharges
		(PolicyType,						NumCharges)
SELECT	'POLICY_EPITHET_JFD_COMMONER',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);
--==========================================================================================================================
-- SUKRITACT EVENTS
--==========================================================================================================================
-- EventsAddin_Support
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) SELECT ('JFD_RTP_Epithets_Events.lua')
WHERE EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');
-------------------------------------
-- JFD_Epithets
-------------------------------------
INSERT INTO JFD_Epithets
		(Type,								EventOnly,	ShortDescription,								Description,							 Help,										PolicyType)
SELECT	'EPITHET_JFD_CHASTE',				1,			'TXT_KEY_EPITHET_JFD_CHASTE_SHORT_DESC',		'TXT_KEY_EPITHET_JFD_CHASTE_DESC',		 'TXT_KEY_EPITHET_JFD_CHASTE_HELP',			'POLICY_EPITHET_JFD_CHASTE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO JFD_Epithets
		(Type,								EventOnly,	ShortDescription,								Description,							 Help,										PolicyType)
SELECT	'EPITHET_JFD_FAIR',					1,			'TXT_KEY_EPITHET_JFD_FAIR_SHORT_DESC',			'TXT_KEY_EPITHET_JFD_FAIR_DESC',		 'TXT_KEY_EPITHET_JFD_FAIR_HELP',			'POLICY_EPITHET_JFD_FAIR'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO JFD_Epithets
		(Type,								EventOnly,	ShortDescription,								Description,							 Help,										PolicyType)
SELECT	'EPITHET_JFD_FORTUNATE',			1,			'TXT_KEY_EPITHET_JFD_FORTUNATE_SHORT_DESC',		'TXT_KEY_EPITHET_JFD_FORTUNATE_DESC',	 'TXT_KEY_EPITHET_JFD_FORTUNATE_HELP',		'POLICY_EPITHET_JFD_FORTUNATE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO JFD_Epithets
		(Type,								EventOnly,	ShortDescription,								Description,							 Help,										PolicyType)
SELECT	'EPITHET_JFD_HOMOSEXUAL',			1,			'TXT_KEY_EPITHET_JFD_HOMOSEXUAL_SHORT_DESC',	'TXT_KEY_EPITHET_JFD_HOMOSEXUAL_DESC',	 'TXT_KEY_EPITHET_JFD_HOMOSEXUAL_HELP',		'POLICY_EPITHET_JFD_HOMOSEXUAL'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);
-------------------------------------
-- Policies
-------------------------------------
INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_CHASTE',		'TXT_KEY_EPITHET_JFD_CHASTE_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_FAIR',			'TXT_KEY_EPITHET_JFD_FAIR_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_FORTUNATE',		'TXT_KEY_EPITHET_JFD_FORTUNATE_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_HOMOSEXUAL',	'TXT_KEY_EPITHET_JFD_HOMOSEXUAL_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);
--========================================================================================================================================================================
--========================================================================================================================================================================