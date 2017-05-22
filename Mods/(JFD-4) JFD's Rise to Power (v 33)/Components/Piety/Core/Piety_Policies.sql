--==========================================================================================================================
-- POLICY BRANCHES
--==========================================================================================================================
-- PolicyBranchTypes
--------------------------------------------------------------------------------------------------------------------------	
UPDATE PolicyBranchTypes
SET EraPrereq = 'ERA_CLASSICAL', Help = 'TXT_KEY_POLICY_JFD_PIETY_HELP'
WHERE Type = 'POLICY_BRANCH_PIETY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_POLICY_CHANGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);

UPDATE PolicyBranchTypes
SET EraPrereq = 'ERA_CLASSICAL', Help = 'TXT_KEY_POLICY_JFD_PIETY_HELP_PIETY_HEALTH'
WHERE Type = 'POLICY_BRANCH_PIETY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_POLICY_CHANGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_POLICY_CHANGES_PIETY' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_UNIT_ADDITIONS_DOCTOR' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);
--==========================================================================================================================
-- POLICIES
--==========================================================================================================================
-- Policies
--------------------------------------------------------------------------------------------------------------------------	
--Opener
UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_PIETY_HELP'
WHERE Type = 'POLICY_PIETY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_POLICY_CHANGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);

UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_PIETY_HELP_PIETY_HEALTH'
WHERE Type = 'POLICY_PIETY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_POLICY_CHANGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_POLICY_CHANGES_PIETY' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_UNIT_ADDITIONS_DOCTOR' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);

--Infallibility
UPDATE Policies
SET Description = 'TXT_KEY_POLICY_JFD_INFALLIBILITY', Help = 'TXT_KEY_POLICY_JFD_INFALLIBILITY_HELP', Civilopedia = 'TXT_KEY_POLICY_JFD_INFALLIBILITY_TEXT', FaithCostModifier = -20, GridX = 3, GridY = 2, PortraitIndex = 47
WHERE Type = 'POLICY_MANDATE_OF_HEAVEN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_POLICY_CHANGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);

--Organised Religion
UPDATE Policies
SET GridX = 2, GridY = 1, PortraitIndex = 46
WHERE Type = 'POLICY_ORGANIZED_RELIGION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_POLICY_CHANGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);

UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_ORGANIZED_RELIGION_HELP'
WHERE Type = 'POLICY_ORGANIZED_RELIGION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_POLICY_CHANGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_POLICY_CHANGES_ORGANIZED_RELIGION' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);

--Theocracy
UPDATE Policies
SET GridX = 1, GridY = 2, PortraitIndex = 45
WHERE Type = 'POLICY_THEOCRACY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_POLICY_CHANGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);

--Monasticism
UPDATE Policies
SET Description = 'TXT_KEY_POLICY_JFD_MONASTICISM', Help = 'TXT_KEY_POLICY_JFD_MONASTICISM_HELP', Civilopedia = 'TXT_KEY_POLICY_JFD_MONASTICISM_TEXT', AddReformationBelief = 0, OneShot = 0, GridX = 5, GridY = 1, PortraitIndex = 43
WHERE Type = 'POLICY_REFORMATION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_POLICY_CHANGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);

--Syncretism
UPDATE Policies
SET Description = 'TXT_KEY_POLICY_JFD_SYNCRETISM', Help = 'TXT_KEY_POLICY_JFD_SYNCRETISM_HELP', Civilopedia = 'TXT_KEY_POLICY_JFD_SYNCRETISM_TEXT', SecondReligionPantheon = 0, JFD_ConvertAllReligions = 1, GridX = 4, GridY = 3, PortraitIndex = 44
WHERE Type = 'POLICY_FREE_RELIGION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_POLICY_CHANGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);

--Finisher
UPDATE Policies
SET AddReformationBelief = 1
WHERE Type = 'POLICY_PIETY_FINISHER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_POLICY_CHANGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_PietyYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_JFD_PietyYieldChanges	
		(PolicyType, 						OnReligiousUnitFaithPurchased, 	Yield)
SELECT	'POLICY_MANDATE_OF_HEAVEN', 		1,								3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_POLICY_CHANGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_FreeBuilding
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_FreeBuilding 
		(PolicyType, 				BuildingClassType, 			Count)
SELECT	'POLICY_REFORMATION', 		'BUILDINGCLASS_MONASTERY', 	4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_POLICY_CHANGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_SpecialistYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_SpecialistYieldChanges 
		(PolicyType, 				SpecialistType, 			YieldType,			Yield)
SELECT	'POLICY_REFORMATION', 		'SPECIALIST_JFD_MONK', 		'YIELD_SCIENCE', 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_POLICY_CHANGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_BuildingClassProductionModifiers
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_BuildingClassProductionModifiers 
		(PolicyType, 		BuildingClassType,					ProductionModifier)
SELECT	'POLICY_PIETY', 	'BUILDINGCLASS_MONASTERY',			100
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_POLICY_CHANGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_BuildingClassCultureChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_BuildingClassCultureChanges
		(PolicyType, 					BuildingClassType,			CultureChange)
SELECT	'POLICY_ORGANIZED_RELIGION', 	'BUILDINGCLASS_SHRINE',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_POLICY_CHANGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_POLICY_CHANGES_ORGANIZED_RELIGION' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);

INSERT INTO Policy_BuildingClassCultureChanges
		(PolicyType, 					BuildingClassType,			CultureChange)
SELECT	'POLICY_ORGANIZED_RELIGION', 	'BUILDINGCLASS_TEMPLE',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_POLICY_CHANGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_POLICY_CHANGES_ORGANIZED_RELIGION' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_FreeUnitClasses
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Policy_FreeUnitClasses WHERE PolicyType = 'POLICY_PIETY_FINISHER' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_POLICY_CHANGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_PietyMods
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_JFD_PietyMods
		(PolicyType,						RestingRateChange)
SELECT	'POLICY_FREE_RELIGION',				15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_POLICY_CHANGES' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_Flavors
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Policy_Flavors WHERE PolicyType IN ('POLICY_ORGANIZED_RELIGION', 'POLICY_REFORMATION') 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_POLICY_CHANGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);
INSERT INTO Policy_Flavors 
		(PolicyType, 				FlavorType,		Flavor)
SELECT	'POLICY_REFORMATION', 		Type,			10
FROM Flavors WHERE Type IN ('FLAVOR_SCIENCE', 'FLAVOR_RELIGION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_POLICY_CHANGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_PrereqPolicies
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Policy_PrereqPolicies WHERE PolicyType IN ('POLICY_FREE_RELIGION', 'POLICY_ORGANIZED_RELIGION', 'POLICY_MANDATE_OF_HEAVEN', 'POLICY_THEOCRACY', 'POLICY_REFORMATION') 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_POLICY_CHANGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);
INSERT INTO Policy_PrereqPolicies 
		(PolicyType, 					PrereqPolicy)
SELECT	'POLICY_MANDATE_OF_HEAVEN', 	'POLICY_ORGANIZED_RELIGION'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_POLICY_CHANGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);

INSERT INTO Policy_PrereqPolicies 
		(PolicyType, 					PrereqPolicy)
SELECT	'POLICY_THEOCRACY', 			'POLICY_ORGANIZED_RELIGION'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_POLICY_CHANGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);

INSERT INTO Policy_PrereqPolicies 
		(PolicyType, 					PrereqPolicy)
SELECT	'POLICY_FREE_RELIGION', 		'POLICY_MANDATE_OF_HEAVEN'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_POLICY_CHANGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);

INSERT INTO Policy_PrereqPolicies 
		(PolicyType, 					PrereqPolicy)
SELECT	'POLICY_FREE_RELIGION', 		'POLICY_REFORMATION'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_POLICY_CHANGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);
--==========================================================================================================================
-- TEXT
--==========================================================================================================================
-- Language_en_US
--------------------------------------------------------------------------------------------------------------------------
--Opener
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Piety[ENDCOLOR] increases the [ICON_PEACE] Faith of empires and the [ICON_JFD_PIETY] Piety of State Religions.[NEWLINE][NEWLINE]Adopting Piety allows you to [ICON_PRODUCTION] build Shrines, Temples, and Monasteries in half the usual time. Unlocks building the Mosque of Djenne.[NEWLINE][NEWLINE]Adopting all Policies in the Piety tree allows you to choose an additional belief for your religion. If you do not have a religion and no more religions can be founded, you will receive a free Great Prophet instead.'
WHERE Tag = 'TXT_KEY_POLICY_BRANCH_PIETY_HELP' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_POLICY_CHANGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Piety[ENDCOLOR] increases the [ICON_PEACE] Faith of empires and the [ICON_JFD_PIETY] Piety of State Religions.[NEWLINE][NEWLINE]Adopting Piety allows you to [ICON_PRODUCTION] build Shrines, Temples, and Monasteries in half the usual time. Unlocks building the Mosque of Djenne.[NEWLINE][NEWLINE]Adopting all Policies in the Piety tree allows you to choose an additional belief for your religion. If you do not have a religion and no more religions can be founded, you will receive a free Great Prophet instead. It also allows the purchase of Great Doctors with [ICON_PEACE] Faith starting in the Industrial Era.'
WHERE Tag = 'TXT_KEY_POLICY_BRANCH_PIETY_HELP' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_POLICY_CHANGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_POLICY_CHANGES_PIETY' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_UNIT_ADDITIONS_DOCTOR' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 0);
--==========================================================================================================================
--==========================================================================================================================