--==========================================================================================================================
-- GAZEBO COMMUNITY BALANCE PATCH
--==========================================================================================================================
-- Units
------------------------
UPDATE Units
SET IconAtlas = 'JFD_COLONIES_UNIT_ATLAS', PortraitIndex = 0
WHERE Type IN ('UNIT_PIONEER')
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='SETTLER_COMMUNITY' AND Value= 1 )
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1);

INSERT INTO Unit_FreePromotions
		(PromotionType,						UnitType)
SELECT	'PROMOTION_JFD_COLONIAL_SETTLER',	Type
FROM Units WHERE Class IN ('UNITCLASS_PIONEER', 'UNITCLASS_COLONIST')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH_COLONISTS' AND Value = 1);
--==========================================================================================================================
-- JFD COLONIES
--==========================================================================================================================
-- Units
---------------------------------------------------------------------------------------------------------------------------
UPDATE Units
SET FaithCost = 500, BeliefRequired = 'BELIEF_JFD_MISSION_COLONIES'
WHERE Type = 'UNIT_JFD_COLONIST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_BELIEF_ADDITIONS_MISSION_COLONIES' AND Value = 1);

UPDATE Units
SET FaithCost = 500, BeliefRequired = 'BELIEF_JFD_MISSION_COLONIES'
WHERE Type = 'UNIT_SETTLER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_BELIEF_ADDITIONS_MISSION_COLONIES' AND Value = 1);

UPDATE Units
SET FaithCost = 500, BeliefRequired = 'BELIEF_JFD_MISSION_COLONIES'
WHERE Type = 'UNIT_WORKER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_BELIEF_ADDITIONS_MISSION_COLONIES' AND Value = 1);
--==========================================================================================================================
-- JFD EXPLORATION CONTINUED EXPANDED
--==========================================================================================================================
-- Policies
---------------------------------------------------------------------------------------------------------------------------
UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_VICEGENTRY_HELP_COLONIES'
WHERE Type = 'POLICY_TREASURE_FLEETS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_POLICY_CHANGES' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_BuildingClassHappiness
--------------------------------------------------------------------------------------------------------------------------
UPDATE Policy_BuildingClassHappiness
SET BuildingClassType = 'BUILDINGCLASS_JFD_GOVERNORS_MANSION'
WHERE PolicyType = 'POLICY_TREASURE_FLEETS' AND BuildingClassType = 'BUILDINGCLASS_HARBOR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_POLICY_CHANGES' AND Value = 1);
---------------------------------------------------------------------------------------------------------------------------
-- Units
---------------------------------------------------------------------------------------------------------------------------
UPDATE Units
SET FoundMid = 1
WHERE Type IN ('UNIT_JFD_GREAT_SCOUT', 'UNIT_JFD_GREAT_EXPLORER', 'UNIT_JFD_GREAT_AIRSHIP', 'UNIT_JFD_GREAT_ADVENTURER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_CORE_GREAT_RECON' AND Value = 1);
---------------------------------------------------------------------------------------------------------------------------
-- Unit_BuildOnFound
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 			PromotionType)
SELECT	Type, 				'PROMOTION_JFD_COLONIAL_SETTLER'
FROM Units WHERE Type IN ('UNIT_JFD_GREAT_SCOUT', 'UNIT_JFD_GREAT_EXPLORER', 'UNIT_JFD_GREAT_AIRSHIP', 'UNIT_JFD_GREAT_ADVENTURER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_UNIT_ADDITIONS_COLONIST' AND Value = 1);
---------------------------------------------------------------------------------------------------------------------------
-- Unit_BuildOnFound
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_BuildOnFound 	
		(UnitType, 						BuildingClassType)
SELECT	'UNIT_JFD_GREAT_ADVENTURER', 	BuildingClassType
FROM Unit_BuildOnFound WHERE UnitType = 'UNIT_JFD_COLONIST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_CORE_GREAT_RECON' AND Value = 1);

INSERT INTO Unit_BuildOnFound 	
		(UnitType, 						BuildingClassType)
SELECT	'UNIT_JFD_GREAT_AIRSHIP', 		BuildingClassType
FROM Unit_BuildOnFound WHERE UnitType = 'UNIT_JFD_COLONIST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_CORE_GREAT_RECON' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_CORE_AIRSHIP' AND Value = 1);

INSERT INTO Unit_BuildOnFound 	
		(UnitType, 						BuildingClassType)
SELECT	'UNIT_JFD_GREAT_EXPLORER', 		BuildingClassType
FROM Unit_BuildOnFound WHERE UnitType = 'UNIT_JFD_COLONIST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_CORE_GREAT_RECON' AND Value = 1);

INSERT INTO Unit_BuildOnFound 	
		(UnitType, 						BuildingClassType)
SELECT	'UNIT_JFD_GREAT_SCOUT', 		BuildingClassType
FROM Unit_BuildOnFound WHERE UnitType = 'UNIT_JFD_COLONIST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_CORE_GREAT_RECON' AND Value = 1);
--==========================================================================================================================
-- POUAKAI ENLIGHTENMENT ERA
--==========================================================================================================================
-- Buildings
------------------------------
UPDATE Buildings
SET PrereqTech = 'TECH_EE_ROMANTICISM'
WHERE Type = 'BUILDING_JFD_PENA' 
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_IMPERIALISM');
--==========================================================================================================================
-- SUKRITACT EVENTS & DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) SELECT ('JFD_CID_Colonies_Decisions.lua')
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policies
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policies
		(Type,									Description)
SELECT	'POLICY_DECISIONS_JFD_DECOLONIZATION',	'TXT_KEY_DECISIONS_JFD_CID_COLONIES_DECOLONIZATION'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- EventsAddin_Support
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) SELECT ('JFD_CID_Colonies_Events.lua')
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================