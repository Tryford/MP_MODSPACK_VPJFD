--==========================================================================================================================
-- POLICIES
--==========================================================================================================================
-- Policies
--------------------------------------------------------------------------------------------------------------------------
UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_REPUBLIC_HELP', Description = 'TXT_KEY_POLICY_JFD_REPUBLIC', Civilopedia = 'TXT_KEY_CIV5_POLICY_JFD_REPUBLIC_TEXT'
WHERE Type = 'POLICY_REPUBLIC'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_POLICY_CHANGES_REPUBLIC' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 0);

UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_SCIENTIFIC_REVOLUTION_HELP'
WHERE Type = 'POLICY_SCIENTIFIC_REVOLUTION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_POLICY_CHANGES_SCIENTIFIC_REVOLUTION' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 0);

INSERT INTO Policies
		(Type,								Description,							Civilopedia,									Help,											PolicyBranchType,			CultureCost,	Level,	PortraitIndex,	IconAtlas,				IconAtlasAchieved)
SELECT	'POLICY_JFD_DECRIMINALIZATION',		'TXT_KEY_POLICY_JFD_DECRIMINALIZATION', 'TXT_KEY_POLICY_JFD_DECRIMINALIZATION_TEXT',	'TXT_KEY_POLICY_JFD_DECRIMINALIZATION_HELP',	'POLICY_BRANCH_FREEDOM',	10,				2,		25,				'POLICY_ATLAS',			'POLICY_A_ATLAS_EXP2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_POLICY_ADDITIONS_TENETS' AND Value = 1);

INSERT INTO Policies
		(Type,								Description,							Civilopedia,									Help,											PolicyBranchType,			CultureCost,	Level,	PortraitIndex,	IconAtlas,				IconAtlasAchieved)
SELECT	'POLICY_JFD_SECRET_POLICE',			'TXT_KEY_POLICY_JFD_SECRET_POLICE',		'TXT_KEY_POLICY_JFD_SECRET_POLICE_TEXT',		'TXT_KEY_POLICY_JFD_SECRET_POLICE_HELP',		'POLICY_BRANCH_AUTOCRACY',	10,				2,		10,				'POLICY_ATLAS_EXP2',	'POLICY_A_ATLAS_EXP2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_POLICY_ADDITIONS_TENETS' AND Value = 1);

INSERT INTO Policies
		(Type,								Description,							Civilopedia,									Help,											PolicyBranchType,			CultureCost,	Level,	PortraitIndex,	IconAtlas,				IconAtlasAchieved)
SELECT	'POLICY_JFD_WORKER_COUNCILS',		'TXT_KEY_POLICY_JFD_WORKER_COUNCILS',	'TXT_KEY_POLICY_JFD_WORKER_COUNCILS_TEXT',		'TXT_KEY_POLICY_JFD_WORKER_COUNCILS_HELP',		'POLICY_BRANCH_ORDER',		10,				2,		11,				'POLICY_ATLAS_EXP2',	'POLICY_A_ATLAS_EXP2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_POLICY_ADDITIONS_TENETS' AND Value = 1);
------------------------------------------------------------
-- Policy_JFD_CrimeMods
------------------------------------------------------------	
INSERT INTO Policy_JFD_CrimeMods
		(PolicyType,						CrimeType,				CrimeMod)
SELECT	'POLICY_JFD_DECRIMINALIZATION',		Type,					-20
FROM JFD_Crimes WHERE Type IN ('CRIME_JFD_TOURISM', 'CRIME_JFD_CULTURE', 'CRIME_JFD_HAPPINESS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_POLICY_ADDITIONS_TENETS' AND Value = 1);

INSERT INTO Policy_JFD_CrimeMods
		(PolicyType,						CrimeType,				CrimeMod)
SELECT	'POLICY_REPUBLIC',					'CRIME_JFD_PRODUCTION',	-15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_POLICY_CHANGES_REPUBLIC' AND Value = 1);

INSERT INTO Policy_JFD_CrimeMods
		(PolicyType,						CrimeType,				CrimeMod)
SELECT	'POLICY_SCIENTIFIC_REVOLUTION',		'CRIME_JFD_SCIENCE',	-15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_POLICY_CHANGES_SCIENTIFIC_REVOLUTION' AND Value = 1);

INSERT INTO Policy_JFD_CrimeMods
		(PolicyType,						CrimeType,				CrimeMod)
SELECT	'POLICY_JFD_SECRET_POLICE',			Type,					-20
FROM JFD_Crimes WHERE Type IN ('CRIME_JFD_FOOD', 'CRIME_JFD_HAPPINESS', 'CRIME_JFD_FAITH')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_POLICY_ADDITIONS_TENETS' AND Value = 1);

INSERT INTO Policy_JFD_CrimeMods
		(PolicyType,						CrimeType,				CrimeMod)
SELECT	'POLICY_JFD_WORKER_COUNCILS',		Type,					-20
FROM JFD_Crimes WHERE Type IN ('CRIME_JFD_PRODUCTION', 'CRIME_JFD_HAPPINESS', 'CRIME_JFD_SCIENCE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_POLICY_ADDITIONS_TENETS' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================