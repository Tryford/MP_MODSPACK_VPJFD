--==========================================================================================================================
-- GAZEBO COMMUNITY BALANCE OVERHAUL
--==========================================================================================================================
-- JFD_CultureType_StartingBonuses
--------------------------------------------------------------------------------------------------------------------------
UPDATE JFD_CultureType_StartingBonuses
SET FreePolicy = NULL, FreePolicyBranch = NULL, FreeBuilding = 'BUILDINGCLASS_MARKET', Description = 'TXT_KEY_JFD_DAWN_CLASSICAL_BONUSES_CBO'
WHERE CultureType = 'CULTURE_JFD_CLASSICAL'
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value = 1);

UPDATE JFD_CultureType_StartingBonuses
SET FreeBuildingAND = NULL, Description = 'TXT_KEY_JFD_DAWN_EASTERN_BONUSES_CBO'
WHERE CultureType = 'CULTURE_JFD_EASTERN'
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value = 1);

UPDATE JFD_CultureType_StartingBonuses
SET FreePolicy = NULL, FreePolicyBranch = NULL, FreeResource = 'RESOURCE_IVORY', FreeResourceCount = 1, Description = 'TXT_KEY_JFD_DAWN_MANDALA_BONUSES_CBO'
WHERE CultureType = 'CULTURE_JFD_MANDALA'
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_POLICIES' AND Value = 1);

UPDATE JFD_CultureType_StartingBonuses
SET FreePolicy = NULL, FreePolicyBranch = NULL, FreeUnitXP = 10, Description = 'TXT_KEY_JFD_DAWN_NORTHERN_BONUSES_CBO'
WHERE CultureType = 'CULTURE_JFD_NORTHERN'
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_POLICIES' AND Value = 1);

UPDATE JFD_CultureType_StartingBonuses
SET FreeTech = NULL, FreeResource = 'RESOURCE_FISH', FreeResourceCount = 2, Description = 'TXT_KEY_JFD_DAWN_PACIFIC_BONUSES_CBO'
WHERE CultureType = 'CULTURE_JFD_PACIFIC'
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_POLICIES' AND Value = 1);

UPDATE JFD_CultureType_StartingBonuses
SET FreePolicy = NULL, FreePolicyBranch = NULL, FreeResource = 'RESOURCE_WINE', FreeResourceCount = 1, Description = 'TXT_KEY_JFD_DAWN_SOUTHERN_BONUSES_CBO'
WHERE CultureType = 'CULTURE_JFD_SOUTHERN'
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_POLICIES' AND Value = 1);
--==========================================================================================================================
-- JFD CID
--==========================================================================================================================
-- JFD_CultureType_StartingBonuses
-------------------------------
UPDATE JFD_CultureType_StartingBonuses
SET FreeBuilding = 'BUILDINGCLASS_JFD_HERBALIST', Description = 'TXT_KEY_JFD_DAWN_IRANIAN_BONUSES_HEALTH'
WHERE CultureType = 'CULTURE_JFD_IRANIAN'
AND EXISTS (SELECT Type FROM BuildingClasses WHERE Type = 'BUILDINGCLASS_JFD_HERBALIST');

CREATE TRIGGER JFDCulDiv_CultureType_StartingBonuses
AFTER INSERT ON Buildings
WHEN NEW.BuildingClass = 'BUILDINGCLASS_JFD_HERBALIST'
BEGIN
	UPDATE JFD_CultureType_StartingBonuses
	SET FreeBuilding = 'BUILDINGCLASS_JFD_HERBALIST', Description = 'TXT_KEY_JFD_DAWN_IRANIAN_BONUSES_HEALTH'
	WHERE CultureType = 'CULTURE_JFD_IRANIAN'
	AND EXISTS (SELECT Type FROM BuildingClasses WHERE Type = 'BUILDINGCLASS_JFD_HERBALIST');
END;
--==========================================================================================================================
-- SUKRITACT EVENTS & DECISIONS
--==========================================================================================================================
-- EventsAddin_Support
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support
		(FileName)
VALUES	('JFD_CulDiv_Events.lua');
--------------------------------------------------------------------------------------------------------------------------
-- Resources
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Resources 
		(Type,							Description,							Civilopedia, 										ResourceClassType, 		Happiness,  AITradeModifier, 	ResourceUsage,	AIObjective,	'Unique', 	IconString, 						PortraitIndex, 	IconAtlas)
VALUES	('RESOURCE_JFD_WHITE_ELEPHANT',	'TXT_KEY_RESOURCE_JFD_WHITE_ELEPHANT',	'TXT_KEY_CIV5_RESOURCE_JFD_WHITE_ELEPHANT_TEXT',	'RESOURCECLASS_LUXURY',	4,			10,					2, 				0, 				2, 			'[ICON_RES_JFD_WHITE_ELEPHANT]',	0, 				'JFD_CULTURAL_DIVERSITY_RESOURCE_ATLAS');
--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Units 	
		(Type, 							Class,	FoundAbroad,	Cost, 	FaithCost,	Capture, CivilianAttackPriority, Moves, Domain, DefaultUnitAI, Description, Civilopedia, Strategy,	Help, CombatLimit, ObsoleteTech, UnitArtInfo, UnitFlagIconOffset, UnitArtInfoCulturalVariation, UnitFlagAtlas,	PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JFD_SETTLER_OCEANIC', 	Class,	1,				-1, 	-1,			Capture, CivilianAttackPriority, Moves, Domain, DefaultUnitAI, Description, Civilopedia, Strategy,  Help, CombatLimit, ObsoleteTech, UnitArtInfo, UnitFlagIconOffset, UnitArtInfoCulturalVariation, UnitFlagAtlas,	PortraitIndex, 	IconAtlas
FROM Units WHERE Type = 'UNIT_SETTLER';
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_SETTLER_OCEANIC', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_SETTLER';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	'UNIT_JFD_SETTLER_OCEANIC', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SETTLER';	
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType, Flavor)
SELECT	'UNIT_JFD_SETTLER_OCEANIC', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_SETTLER';	
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Unit_FreePromotions 
		(UnitType, 						PromotionType)
VALUES	('UNIT_JFD_SETTLER_OCEANIC', 	'PROMOTION_ALLWATER_EMBARKATION');
--==========================================================================================================================
--==========================================================================================================================