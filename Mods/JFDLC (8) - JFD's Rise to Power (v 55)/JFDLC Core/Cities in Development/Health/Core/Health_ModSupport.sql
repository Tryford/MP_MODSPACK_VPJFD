--==========================================================================================================================
-- BARATHOR MORE LUXURIES
--==========================================================================================================================
-- Building_JFD_HelpTexts
------------------------------------------------------------------------------------------------------------------------
UPDATE Building_JFD_HelpTexts
SET HelpText = 'TXT_KEY_BUILDING_JFD_HARBOUR_HELP_ML'
WHERE BuildingType = 'BUILDING_HARBOR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT Type FROM Resources WHERE Type = 'RESOURCE_CORAL');
--==========================================================================================================================
-- GAZEBO COMMUNITY BALANCE OVERHAUL
--==========================================================================================================================
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_JFD_APOTHECARY_HELP_CBO'
WHERE Type = 'BUILDING_JFD_APOTHECARY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1);

UPDATE Buildings
SET GoldMaintenance = 1, FoodKept = 0,	Help = 'TXT_KEY_BUILDING_JFD_CISTERN_HELP_CBO', Strategy = 'TXT_KEY_BUILDING_JFD_CISTERN_STRATEGY_CBO'
WHERE Type = 'BUILDING_JFD_CISTERN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BUILDING_ADDITIONS_CISTERN' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1);

UPDATE Buildings
SET PrereqTech = 'TECH_REPLACEABLE_PARTS', Cost = 1000
WHERE Type = 'BUILDING_JFD_GRAIN_SILO'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1);

UPDATE Buildings
SET Description = 'TXT_KEY_BUILDING_JFD_HERBALIST_CBO', Strategy = 'TXT_KEY_BUILDING_JFD_HERBALIST_STRATEGY_CBO', Civilopedia = 'TXT_KEY_BUILDING_JFD_HERBALIST_TEXT_CBO'
WHERE Type = 'BUILDING_JFD_HERBALIST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1);

UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_JFD_LONGHOUSE_HELP_CBO', Strategy = 'TXT_KEY_BUILDING_JFD_LONGHOUSE_STRATEGY_CBO'
WHERE Type = 'BUILDING_LONGHOUSE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_BUILDING_CHANGES_LONGHOUSE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1);

UPDATE Buildings
SET NationalPopRequired = 44
WHERE Type = 'BUILDING_JFD_RED_CROSS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1);

UPDATE Buildings
SET NumPoliciesNeeded = 5
WHERE Type = 'BUILDING_JFD_PONT_DU_GARD'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_WONDER_ADDITIONS_PONT_DU_GARD' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_ImprovementYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_ImprovementYieldChanges
		(ImprovementType,				BeliefType,	YieldType,	Yield)
SELECT	'IMPROVEMENT_JFD_SANATORIUM', 	BeliefType,	YieldType,  Yield
FROM Belief_ImprovementYieldChanges WHERE BeliefType = 'BELIEF_UNITY_OF_PROPHETS' AND ImprovementType = 'IMPROVEMENT_HOLY_SITE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policies
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_ORGANIZED_RELIGION_HELP_HEALTH_CBO'
WHERE Type = 'POLICY_ORGANIZED_RELIGION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_POLICY_CHANGES_ORGANIZED_RELIGION' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_ImprovementYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_ImprovementYieldChanges
		(ImprovementType,				PolicyType,	YieldType,	Yield)
SELECT	'IMPROVEMENT_JFD_SANATORIUM', 	PolicyType,	YieldType,  Yield
FROM Policy_ImprovementYieldChanges WHERE PolicyType = 'POLICY_TRADITION_FINISHER' AND ImprovementType = 'IMPROVEMENT_HOLY_SITE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_ImprovementCultureChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_ImprovementCultureChanges
		(ImprovementType,				PolicyType,	CultureChange)
SELECT	'IMPROVEMENT_JFD_SANATORIUM', 	PolicyType,	CultureChange
FROM Policy_ImprovementCultureChanges WHERE PolicyType = 'POLICY_ARTISTIC_GENIUS' AND ImprovementType = 'IMPROVEMENT_HOLY_SITE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_GreatPersonExpendedYield
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_GreatPersonExpendedYield
		(GreatPersonType,				BeliefType, YieldType, Yield)
SELECT	'GREATPERSON_JFD_DOCTOR', 		BeliefType, YieldType, Yield
FROM Belief_GreatPersonExpendedYield WHERE BeliefType = 'BELIEF_TO_GLORY_OF_GOD' AND GreatPersonType = 'GREATPERSON_PROPHET'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_SpecialistYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_SpecialistYieldChanges
		(BeliefType,				SpecialistType,				 YieldType,					 Yield)
SELECT	 'BELIEF_RELIGIOUS_ART', 	'SPECIALIST_JFD_DOCTOR',	'YIELD_GOLDEN_AGE_POINTS',	 2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type='JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_GreatPersonExpendedYield
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_GreatPersonExpendedYield
		(GreatPersonType,				BeliefType, YieldType, Yield)
SELECT	'GREATPERSON_JFD_DOCTOR',		BeliefType, YieldType, Yield
FROM Belief_GreatPersonExpendedYield WHERE BeliefType = 'BELIEF_TO_GLORY_OF_GOD' AND GreatPersonType = 'GREATPERSON_PROPHET'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type='JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--==========================================================================================================================
-- JFD CITIES IN DEVELOPMENT
--==========================================================================================================================
-- Policies
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_DECRIMINALIZATION_HELP_HEALTH'
WHERE Type = 'POLICY_JFD_DECRIMINALIZATION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_POLICY_ADDITIONS_TENETS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_CrimeMods
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Policy_JFD_CrimeMods
SET CrimeType = 'CRIME_JFD_HEALTH'
WHERE PolicyType = 'POLICY_JFD_DECRIMINALIZATION' AND CrimeType = 'CRIME_JFD_TOURISM'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Unit_BuildOnFound
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Unit_BuildOnFound 	
		(UnitType, 						BuildingClassType)
SELECT	'UNIT_JFD_COLONIST', 			'BUILDINGCLASS_JFD_HERBALIST'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_UNIT_ADDITIONS_COLONIST' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Unit_BuildOnFound 	
		(UnitType, 						BuildingClassType)
SELECT	'UNIT_SPANISH_CONQUISTADOR', 	'BUILDINGCLASS_JFD_HERBALIST'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_UNIT_ADDITIONS_COLONIST' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--==========================================================================================================================
-- JFD EXPLORATION CONTINUED EXPANDED
--==========================================================================================================================
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_JFD_MONASTERY_HELP_HEALTH_EXCE', Strategy = 'TXT_KEY_BUILDING_JFD_MONASTERY_STRATEGY_HEALTH_EXCE'
WHERE BuildingClass = 'BUILDINGCLASS_MONASTERY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_BUILDING_CHANGES_MONASTERY' AND Value = 1);

UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_JFD_GROCER_HELP_EXCE'
WHERE BuildingClass = 'BUILDINGCLASS_JFD_GROCER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Improvement_RouteYieldChanges
--------------------------------------------------------------------------------------------------------------------------
UPDATE Improvement_RouteYieldChanges
SET YieldType = 'YIELD_JFD_HEALTH'
WHERE ImprovementType IN ('IMPROVEMENT_JFD_TRIBE_KOROWAI', 'IMPROVEMENT_JFD_TRIBE_KOROWAI_BORDER', 'IMPROVEMENT_JFD_TRIBE_MAYAIMI', 'IMPROVEMENT_JFD_TRIBE_MAYAIMI_BORDER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_TRIBES_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Improvement_RouteYieldChanges
--------------------------------------------------------------------------------------------------------------------------
UPDATE Improvement_Yields
SET YieldType = 'YIELD_JFD_HEALTH'
WHERE ImprovementType IN ('IMPROVEMENT_JFD_TRIBE_TLAXCALA', 'IMPROVEMENT_JFD_TRIBE_SUFI') AND YieldType = 'YIELD_FAITH'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_TRIBES_CORE' AND Value = 1);

UPDATE Improvement_Yields
SET YieldType = 'YIELD_JFD_HEALTH'
WHERE ImprovementType IN ('IMPROVEMENT_JFD_TRIBE_MAYAIMI') AND YieldType = 'YIELD_PRODUCTION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_TRIBES_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================