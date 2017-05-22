--==========================================================================================================================
-- GAZEBO CITY-STATE DIPLOMACY
--==========================================================================================================================
-- Buildings
------------------------------
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
------------------------------
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
------------------------------
-- Belief_SpecialistYieldChanges
------------------------------
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
------------------------------
-- Belief_GreatPersonExpendedYield
------------------------------
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
------------------------------
-- Technologies
------------------------------
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
------------------------------
-- Technology_PrereqTechs
------------------------------
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
------------------------------
-- Policies
------------------------------
UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_CONSULATES_HELP_CBP'
WHERE Type = 'POLICY_CONSULATES'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type='JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type='JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);
------------------------------
-- Policy_JFD_ClaimMods
------------------------------
INSERT INTO Policy_JFD_ClaimMods
		(PolicyType,					CauseChange)
SELECT	'POLICY_CONSULATES',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type='JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type='JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--==========================================================================================================================
-- JFD CRIMES
--==========================================================================================================================
-- Buildings
------------------------------
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
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_BUILDING_CHANGES_NATIONAL_WONDERS' AND Value = 0);

INSERT INTO Building_JFD_CrimeMods
		(BuildingType,					CrimeType,				CrimeMod)
SELECT	'BUILDING_JFD_HIGH_COURT',		'CRIME_JFD_HAPPINESS',	-15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_BUILDING_CHANGES_NATIONAL_WONDERS' AND Value = 0);

INSERT INTO Building_JFD_CrimeMods
		(BuildingType,					CrimeType,				GlobalCrimeMod,		CrimeMod)
SELECT	'BUILDING_JFD_COURT_CHANCERY',	'CRIME_JFD_PRODUCTION',	-5,					-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_BUILDING_CHANGES_NATIONAL_WONDERS' AND Value = 1);

INSERT INTO Building_JFD_CrimeMods
		(BuildingType,					CrimeType,				GlobalCrimeMod,	CrimeMod)
SELECT	'BUILDING_JFD_SUPREME_COURT',	'CRIME_JFD_HAPPINESS',	-5,				-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_BUILDING_CHANGES_NATIONAL_WONDERS' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_HelpTexts
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_JFD_HelpTexts
		(BuildingType,					HelpText,												IsWrittenFirst)
SELECT	'BUILDING_JFD_COURT_CHANCERY',	'TXT_KEY_WONDER_JFD_COURT_CHANCERY_HELP_CRIME',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_BUILDING_CHANGES_NATIONAL_WONDERS' AND Value = 1);

INSERT INTO Building_JFD_HelpTexts
		(BuildingType,					HelpText,												IsWrittenFirst)
SELECT	'BUILDING_JFD_SUPREME_COURT',	'TXT_KEY_WONDER_JFD_SUPREME_COURT_HELP_CRIME',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_BUILDING_CHANGES_NATIONAL_WONDERS' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors 
		(BuildingType, 							FlavorType,					Flavor)
SELECT	'BUILDING_JFD_COURT_CHANCERY',			'FLAVOR_PRODUCTION',		20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_BUILDING_CHANGES_NATIONAL_WONDERS' AND Value = 1);
--==========================================================================================================================	
-- JFD PIETY
--==========================================================================================================================	
-- Technologies
------------------------------------------------------------
--Code of Laws
UPDATE Technologies
SET GridX = 3, GridY = 1
WHERE Type = 'TECH_JFD_CODE_OF_LAWS' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_MYSTICISM' AND Value = 1);
--==========================================================================================================================	
-- JFD PROVINCES
--==========================================================================================================================	
-- Missions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Missions	
		(Type, 								Time,	OrderPriority,	EntityEventType,				Visible,	Description, 								Help, 											DisabledHelp, 										EntityEventType,			IconAtlas,						IconIndex)
SELECT	'MISSION_JFD_UPGRADE_PROVINCE', 	20,		199,			'ENTITY_EVENT_GREAT_EVENT',		1,			'TXT_KEY_MISSION_JFD_UPGRADE_PROVINCE', 	'TXT_KEY_MISSION_JFD_UPGRADE_PROVINCE_HELP',	'TXT_KEY_MISSION_JFD_UPGRADE_PROVINCE_DISABLED',	'ENTITY_EVENT_GREAT_EVENT',	'JFD_PROVINCES_MISSION_ATLAS',	0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Unit_Missions WHERE UnitType = 'UNIT_JFD_GREAT_MAGISTRATE' AND MissionType = 'MISSION_JFD_RECLAIM_CITY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
INSERT INTO Unit_Missions
		(UnitType, 							MissionType,						RequiresUpgradeableProvince)
SELECT	'UNIT_JFD_GREAT_MAGISTRATE',		'MISSION_JFD_UPGRADE_PROVINCE',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--==========================================================================================================================
-- POUAKAI ENLIGHTENMENT ERA
--==========================================================================================================================
-- Technology_PrereqTechs
------------------------------------------------------------------------------------------------------------------------	
DELETE FROM Technology_PrereqTechs WHERE PrereqTech = 'TECH_JFD_JURISPRUDENCE'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
INSERT INTO Technology_PrereqTechs 
		(TechType, 					PrereqTech)
SELECT	'TECH_ECONOMICS', 			'TECH_JFD_JURISPRUDENCE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_JURISPRUDENCE' AND Value = 1)
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
--==========================================================================================================================
-- SUKRITACT EVENTS & DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) SELECT ('JFD_RTP_Claims_Decisions.lua')
WHERE EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

UPDATE Policies
SET Description = 'TXT_KEY_DECISIONS_TRADEMAGISTRATE'
WHERE Type = 'POLICY_TRADEMAGISTRATE';
------------------------------
-- Policies
------------------------------
INSERT INTO Policies
		(Type,										PolicyCostModifier,	Description)
VALUES	('POLICY_DECISIONS_JFD_CODE_OF_LAWS',		-15,				'TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_CODE_LAWS_DESC'),
		('POLICY_DECISIONS_JFD_FORMAL_WEIGHTS',		0,					'TXT_KEY_DECISIONS_WEIGHTSFORMAL'),
		('POLICY_DECISIONS_JFD_IROQUOIS_LAW_PEACE',	0,					'TXT_KEY_DECISIONS_IROQUOISLAWOFPEACE'),
		('POLICY_DECISIONS_JFD_SHOSHONE_COMANCHE',	0,					'TXT_KEY_DECISIONS_SHOSHONECOMANCHE');

UPDATE Policies
SET PolicyCostModifier = 0
WHERE Type = 'POLICY_DECISIONS_JFD_CODE_OF_LAWS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
------------------------------
-- Policy_YieldModifiers
------------------------------
INSERT INTO Policy_YieldModifiers
		(PolicyType,								YieldType,			Yield)
VALUES	('POLICY_DECISIONS_JFD_FORMAL_WEIGHTS',		'YIELD_GOLD',		20),
		('POLICY_DECISIONS_JFD_IROQUOIS_LAW_PEACE',	'YIELD_CULTURE',	10);
------------------------------
-- Policy_JFD_SovereigntyMods
------------------------------
INSERT INTO Policy_JFD_SovereigntyMods
		(PolicyType,								ReformCooldownMod)
SELECT	'POLICY_DECISIONS_JFD_CODE_OF_LAWS',		-15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
------------------------------
-- Policy_JFD_CivilizationNames
------------------------------
CREATE TABLE IF NOT EXISTS 
	Policy_JFD_CivilizationNames (
	PolicyType  						text 		REFERENCES Policies(Type) 					default NULL,
	CivilizationType  					text 		REFERENCES Civilizations(Type) 				default NULL,
	Adjective							text													default	NULL,
	Description							text													default	NULL,
	ShortDescription					text													default	NULL);

INSERT INTO Policy_JFD_CivilizationNames
		(PolicyType,								CivilizationType,			ShortDescription,									Description,								Adjective)
VALUES	('POLICY_DECISIONS_JFD_SHOSHONE_COMANCHE',	'CIVILIZATION_SHOSHONE',	'TXT_KEY_DECISIONS_CIV_JFD_COMANCHE_SHORT_DESC',	'TXT_KEY_DECISIONS_CIV_JFD_COMANCHE_DESC',	'TXT_KEY_DECISIONS_CIV_JFD_COMANCHE_ADJECTIVE');
--==========================================================================================================================
-- SUZERAINITY UI ADDINS
--==========================================================================================================================
-- SuzerainUI_AddinSupport
--------------------------------
CREATE TABLE IF NOT EXISTS SuzerainUI_AddinSupport(FileName);
INSERT INTO SuzerainUI_AddinSupport (FileName) VALUES ('Interactions_Suk_Claims.lua');
--==========================================================================================================================
-- TEXT
--==========================================================================================================================
-- Language_en_US
------------------------------
UPDATE Language_en_US
SET Text = '[NEWLINE][NEWLINE]Neither player yet has the Technology to trade this item (Nobility).'
WHERE Tag = 'TXT_KEY_DIPLO_OPEN_BORDERS_NO_TECH'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_JFD_NOBILITY');
--==========================================================================================================================
--==========================================================================================================================