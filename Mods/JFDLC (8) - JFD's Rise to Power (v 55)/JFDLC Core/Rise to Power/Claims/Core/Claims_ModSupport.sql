--==========================================================================================================================
-- GAZEBO CITY-STATE DIPLOMACY
--==========================================================================================================================
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings
SET Description = 'TXT_KEY_BUILDING_JFD_CHANCERY_CSD', Strategy = 'TXT_KEY_BUILDING_JFD_CHANCERY_STRATEGY_CSD', Civilopedia = 'TXT_KEY_BUILDING_JFD_CHANCERY_TEXT_CSD'
WHERE Type = 'BUILDING_JFD_CHANCERY'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_CHANCERY');

UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_JFD_GRAND_COURT_CHANCERY_HELP_CSD', Strategy = 'TXT_KEY_BUILDING_JFD_GRAND_COURT_CHANCERY_STRATEGY_CSD'
WHERE Type = 'BUILDING_JFD_COURT_CHANCERY'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_CHANCERY');
--==========================================================================================================================
-- GAZEBO COMMUNITY BALANCE PATCH
--==========================================================================================================================
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings
SET PrereqTech = 'TECH_CIVIL_SERVICE'
WHERE Type IN ('BUILDING_JFD_CHANCERY', 'BUILDING_JFD_COURT_CHANCERY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);

UPDATE Buildings
SET Cost = 140
WHERE Type = 'BUILDING_JFD_MAGISTRATE_COURT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);

UPDATE Buildings
SET Cost = 400
WHERE Type = 'BUILDING_JFD_HIGH_COURT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);

UPDATE Buildings
SET Cost = 125
WHERE Type = 'BUILDING_JFD_SUPREME_COURT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);

UPDATE Buildings
SET NationalPopRequired = 30
WHERE Type = 'BUILDING_JFD_COURT_CHANCERY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);

UPDATE Buildings
SET NumPoliciesNeeded = 4
WHERE Type = 'BUILDING_JFD_FORUM_ROMANUM'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_FORUM' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);

UPDATE Buildings
SET NumPoliciesNeeded = 6
WHERE Type = 'BUILDING_JFD_WESTMINSTER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_WONDER_ADDITIONSWESTMINSTER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_SpecialistYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_SpecialistYieldChanges
		(BeliefType,				SpecialistType,				 YieldType,					 Yield)
SELECT	 'BELIEF_RELIGIOUS_ART', 	'SPECIALIST_JFD_DIGNITARY',  'YIELD_GOLDEN_AGE_POINTS',	 2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type='JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);

INSERT INTO Belief_SpecialistYieldChanges
		(BeliefType,				SpecialistType,				 YieldType,					 Yield)
SELECT	 'BELIEF_RELIGIOUS_ART', 	'SPECIALIST_JFD_MAGISTRATE', 'YIELD_GOLDEN_AGE_POINTS',	 2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type='JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_GreatPersonExpendedYield
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_GreatPersonExpendedYield
		(GreatPersonType,				BeliefType, YieldType, Yield)
SELECT	'GREATPERSON_JFD_DIGNITARY', 	BeliefType, YieldType, Yield
FROM Belief_GreatPersonExpendedYield WHERE BeliefType = 'BELIEF_TO_GLORY_OF_GOD' AND GreatPersonType = 'GREATPERSON_PROPHET'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type='JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);

INSERT INTO Belief_GreatPersonExpendedYield
		(GreatPersonType,				BeliefType, YieldType, Yield)
SELECT	'GREATPERSON_JFD_MAGISTRATE', 	BeliefType, YieldType, Yield
FROM Belief_GreatPersonExpendedYield WHERE BeliefType = 'BELIEF_TO_GLORY_OF_GOD' AND GreatPersonType = 'GREATPERSON_PROPHET'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type='JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Technologies
--------------------------------------------------------------------------------------------------------------------------
UPDATE Technologies
SET GridX = 3, GridY = 3, Cost = 150
WHERE Type = 'TECH_JFD_CODE_OF_LAWS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS' AND Value = 1);

UPDATE Technologies
SET GridX = 8, GridY = 2, Cost = 1700
WHERE Type = 'TECH_JFD_JURISPRUDENCE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_JURISPRUDENCE' AND Value = 1);

UPDATE Technologies
SET GridY = 2
WHERE Type = 'TECH_WRITING'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Technology_PrereqTechs
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Technology_PrereqTechs WHERE TechType = 'TECH_JFD_CODE_OF_LAWS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);
INSERT INTO Technology_PrereqTechs 
		(TechType, 					PrereqTech)
SELECT	'TECH_JFD_CODE_OF_LAWS', 	'TECH_ARCHERY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);

DELETE FROM Technology_PrereqTechs WHERE TechType = 'TECH_JFD_JURISPRUDENCE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);
INSERT INTO Technology_PrereqTechs 
		(TechType, 					PrereqTech)
SELECT	'TECH_JFD_JURISPRUDENCE', 	'TECH_BANKING'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_JURISPRUDENCE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);

UPDATE Technology_PrereqTechs
SET PrereqTech = 'TECH_JFD_CODE_OF_LAWS'
WHERE TechType = 'TECH_PHILOSOPHY' AND PrereqTech = 'TECH_WRITING'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS' AND Value = 1);

DELETE FROM Technology_PrereqTechs WHERE TechType = 'TECH_JFD_SAILING'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);

INSERT INTO Technology_PrereqTechs 
		(TechType, 					PrereqTech)
SELECT	'TECH_SCIENTIFIC_THEORY', 	'TECH_JFD_JURISPRUDENCE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_JURISPRUDENCE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policies
--------------------------------------------------------------------------------------------------------------------------
UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_CONSULATES_HELP_CBP'
WHERE Type = 'POLICY_CONSULATES'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type='JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type='JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_ClaimMods
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_JFD_ClaimMods
		(PolicyType,					CauseChange)
SELECT	'POLICY_CONSULATES',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type='JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type='JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--==========================================================================================================================
-- JFD CITIES IN DEVELOPMENT
--==========================================================================================================================
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings
SET PrereqTech = 'TECH_JFD_CODE_OF_LAWS'
WHERE Type = 'BUILDING_JFD_JAIL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS' AND Value = 1);

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_DIGNITARY'
WHERE Type = 'BUILDING_JFD_PENA'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_MAGISTRATE'
WHERE Type = 'BUILDING_JFD_TOWER_LONDON'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_CrimeMods
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_JFD_CrimeMods
		(BuildingType,					CrimeType,				CrimeMod)
SELECT	'BUILDING_JFD_CHANCERY',		'CRIME_JFD_PRODUCTION',	-15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Building_JFD_CrimeMods
		(BuildingType,					CrimeType,				CrimeMod)
SELECT	'BUILDING_JFD_HIGH_COURT',		'CRIME_JFD_HAPPINESS',	-15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors 
		(BuildingType, 							FlavorType,					Flavor)
SELECT	'BUILDING_JFD_COURT_CHANCERY',			'FLAVOR_PRODUCTION',		20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_BUILDING_CHANGES_NATIONAL_WONDERS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Missions
--------------------------------------------------------------------------------------------------------------------------	
-- INSERT INTO Missions	
		-- (Type, 								Time,	OrderPriority,	EntityEventType,				Visible,	Description, 								Help, 											DisabledHelp, 										EntityEventType,			IconAtlas,						IconIndex)
-- SELECT	'MISSION_JFD_UPGRADE_PROVINCE', 	20,		199,			'ENTITY_EVENT_GREAT_EVENT',		1,			'TXT_KEY_MISSION_JFD_UPGRADE_PROVINCE', 	'TXT_KEY_MISSION_JFD_UPGRADE_PROVINCE_HELP',	'TXT_KEY_MISSION_JFD_UPGRADE_PROVINCE_DISABLED',	'ENTITY_EVENT_GREAT_EVENT',	'JFD_PROVINCES_MISSION_ATLAS',	0
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--==========================================================================================================================	
-- JFD RISE TO POWER
--==========================================================================================================================	
-- Technologies
--------------------------------------------------------------------------------------------------------------------------
--Code of Laws
UPDATE Technologies
SET GridX = 3, GridY = 1
WHERE Type = 'TECH_JFD_CODE_OF_LAWS' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_MYSTICISM' AND Value = 1);
--==========================================================================================================================
-- POUAKAI ENLIGHTENMENT ERA
--==========================================================================================================================
-- Technology_PrereqTechs
--------------------------------------------------------------------------------------------------------------------------	
DELETE FROM Technology_PrereqTechs WHERE PrereqTech = 'TECH_JFD_JURISPRUDENCE'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
INSERT INTO Technology_PrereqTechs 
		(TechType, 					PrereqTech)
SELECT	'TECH_ECONOMICS', 			'TECH_JFD_JURISPRUDENCE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_JURISPRUDENCE' AND Value = 1)
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
--==========================================================================================================================
-- SUKRITACT SUZERAINITY 
--==========================================================================================================================
-- SuzerainUI_AddinSupport
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS SuzerainUI_AddinSupport(FileName);
INSERT INTO SuzerainUI_AddinSupport (FileName) VALUES ('Interactions_Suk_Claims.lua');
--==========================================================================================================================
--==========================================================================================================================