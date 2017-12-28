--==========================================================================================================================
-- JFD CITIES IN DEVELOPMENT
--==========================================================================================================================
-- JFD_Epithets
------------------------------------------------------------------------------------------------------------------------
UPDATE JFD_Epithets
SET Description = 'TXT_KEY_EPITHET_JFD_COMMONER_DESC_CHARGES'
WHERE Type = 'EPITHET_JFD_COMMONER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Policies
------------------------------------------------------------------------------------------------------------------------
UPDATE Policies
SET WorkerSpeedModifier = 0
WHERE Type = 'POLICY_EPITHET_JFD_COMMONER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_BuildCharges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_JFD_BuildCharges
		(PolicyType,						NumCharges)
SELECT	'POLICY_EPITHET_JFD_COMMONER',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);
--==========================================================================================================================
-- LEUGI PANEM ET CIRCENSES
--==========================================================================================================================
-- JFD_Epithets
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO JFD_Epithets					
		(Type,									AcquisitionChance,			IsOnUnitClassBorn,			SpecialistMod,				NumSpecialistMod,	ShortDescription,							Description,							Help,									PolicyType)
SELECT	'EPITHET_JFD_FESTIVE',					1,							'UNITCLASS_ENTERTAINER',	'SPECIALIST_ENTERTAINER',	1,					'TXT_KEY_EPITHET_JFD_FESTIVE_SHORT_DESC',	'TXT_KEY_EPITHET_JFD_FESTIVE_DESC',	 	'TXT_KEY_EPITHET_JFD_FESTIVE_HELP',		'POLICY_EPITHET_JFD_FESTIVE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT Type FROM Specialists WHERE Type = 'SPECIALIST_ENTERTAINER');
------------------------------------------------------------------------------------------------------------------------
-- Policies
------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Policies
		(Type,									Description)
SELECT	'POLICY_EPITHET_JFD_FESTIVE',			'TXT_KEY_EPITHET_JFD_FESTIVE_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT Type FROM Specialists WHERE Type = 'SPECIALIST_ENTERTAINER');
------------------------------------------------------------------------------------------------------------------------
-- Policy_SpecialistYieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_SpecialistYieldChanges
		(PolicyType,							SpecialistType,				YieldType,			Yield)
SELECT	'POLICY_EPITHET_JFD_FESTIVE',			'SPECIALIST_ENTERTAINER',	'YIELD_CULTURE',	2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT Type FROM Specialists WHERE Type = 'SPECIALIST_ENTERTAINER');
------------------------------------------------------------------------------------------------------------------------
-- JFDRTP_Epithets_Specialists
------------------------------------------------------------------------------------------------------------------------
CREATE TRIGGER JFDRTP_Epithets_Specialists
AFTER INSERT ON Specialists
WHEN NEW.Type = 'SPECIALIST_ENTERTAINER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
BEGIN
	INSERT OR REPLACE INTO JFD_Epithets					
			(Type,									AcquisitionChance,			IsOnUnitClassBorn,			SpecialistMod,				NumSpecialistMod,	ShortDescription,							Description,							Help,									PolicyType)
	VALUES	('EPITHET_JFD_FESTIVE',					1,							'UNITCLASS_ENTERTAINER',	'SPECIALIST_ENTERTAINER',	1,					'TXT_KEY_EPITHET_JFD_FESTIVE_SHORT_DESC',	'TXT_KEY_EPITHET_JFD_FESTIVE_DESC',	 	'TXT_KEY_EPITHET_JFD_FESTIVE_HELP',		'POLICY_EPITHET_JFD_FESTIVE');

	INSERT OR REPLACE INTO Policies
			(Type,									Description)
	VALUES	('POLICY_EPITHET_JFD_FESTIVE',			'TXT_KEY_EPITHET_JFD_FESTIVE_SHORT_DESC');

	DELETE FROM Policy_SpecialistYieldChanges WHERE PolicyType = 'POLICY_EPITHET_JFD_FESTIVE';
	INSERT INTO Policy_SpecialistYieldChanges
			(PolicyType,							SpecialistType,				YieldType,			Yield)
	VALUES	('POLICY_EPITHET_JFD_FESTIVE',			'SPECIALIST_ENTERTAINER',	'YIELD_CULTURE',	2);
END;
--==========================================================================================================================
-- POUAKAI ENLIGHTENMENT ERA
--==========================================================================================================================
-- JFD_Epithets
--------------------------------------------------------------------------------------------------------------------------
UPDATE JFD_Epithets 
SET IsOnFirstToEra = 'ERA_ENLIGHTENMENT'
WHERE Type = 'EPITHET_JFD_ENLIGHTENED'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);
--========================================================================================================================================================================
--========================================================================================================================================================================