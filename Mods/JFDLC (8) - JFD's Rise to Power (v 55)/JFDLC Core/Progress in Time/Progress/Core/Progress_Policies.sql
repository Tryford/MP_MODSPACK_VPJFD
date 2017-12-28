--==========================================================================================================================
-- POLICIES
--==========================================================================================================================
-- Policies
------------------------------------------------------------------------------------------------------------------------
UPDATE Policies
SET WorkerSpeedModifier = 0
WHERE WorkerSpeedModifier > 0
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);

UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_CITIZENSHIP_HELP_CHARGES', WorkerSpeedModifier = 25
WHERE Type = 'POLICY_CITIZENSHIP'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);

UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_SECULARISM_HELP'
WHERE Type = 'POLICY_SECULARISM'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_POLICY_CHANGES_SECULARISM' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_BuildCharges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_JFD_BuildCharges
		(PolicyType,		UnitClassType,			NumCharges)
SELECT	Type,				'UNITCLASS_JFD_WORKER',	1
FROM Policies WHERE WorkerSpeedModifier > 0
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_PEASANT' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);

INSERT INTO Policy_JFD_BuildCharges
		(PolicyType,		UnitClassType,			NumCharges)
SELECT	Type,				'UNITCLASS_WORKER',		1
FROM Policies WHERE WorkerSpeedModifier > 0
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);

INSERT INTO Policy_JFD_BuildCharges
		(PolicyType,		UnitClassType,			NumCharges)
SELECT	Type,				'UNITCLASS_JFD_SLAVE',	1
FROM Policies WHERE WorkerSpeedModifier > 0
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_LABOURER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Policy_SpecialistExtraYields
------------------------------------------------------------------------------------------------------------------------
UPDATE Policy_SpecialistExtraYields
SET Yield = 1
WHERE PolicyType = 'POLICY_SECULARISM'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_POLICY_CHANGES_SECULARISM' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================