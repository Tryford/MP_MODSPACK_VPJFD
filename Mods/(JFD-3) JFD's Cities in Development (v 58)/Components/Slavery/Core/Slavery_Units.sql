--==========================================================================================================================	
-- BUILDS
--==========================================================================================================================	
-- Builds
------------------------------	
INSERT INTO Builds
		(Type,						ImprovementType, 			Time,	Description,			CtrlDown,	OrderPriority,	IconIndex,	IconAtlas,				HotKey, EntityEvent)
SELECT	'BUILD_JFD_VILLAGE',		'IMPROVEMENT_JFD_VILLAGE',	1100,	'TXT_KEY_JFD_VILLAGE',	1,			95,				41,			'UNIT_ACTION_ATLAS',	'KB_T',	'ENTITY_EVENT_BUILD'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);
------------------------------
-- BuildFeatures
------------------------------
INSERT INTO BuildFeatures
		(BuildType, 					FeatureType, PrereqTech, Time, Remove)
SELECT	'BUILD_JFD_VILLAGE',			FeatureType, PrereqTech, Time, Remove
FROM BuildFeatures WHERE BuildType = 'BUILD_TRADING_POST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);
--==========================================================================================================================
-- UNIT PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions	
		(Type, 								ExperiencePercent,		UpgradeDiscount,	ShowInUnitPanel,	Description, 								Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_ENSLAVED', 			-50,					-100,				1,					'TXT_KEY_PROMOTION_JFD_ENSLAVED',			'TXT_KEY_PROMOTION_JFD_ENSLAVED_HELP',			'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_ENSLAVED'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 								ExperiencePercent,		UpgradeDiscount,	ShowInUnitPanel,	Description, 								Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_UPGRADE_DISCOUNT', 	0,						50,					0,					'TXT_KEY_PROMOTION_JFD_UPGRADE_DISCOUNT',	'TXT_KEY_PROMOTION_JFD_UPGRADE_DISCOUNT_HELP',	'AS2D_IF_LEVELUP',	1, 				59, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_UPGRADE_DISCOUNT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);
--==========================================================================================================================	
-- UNIT CLASSES
--==========================================================================================================================			
-- UnitClasses
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitClasses 
		(Type,						Description,				DefaultUnit)
SELECT	'UNITCLASS_JFD_SLAVE',		'TXT_KEY_UNIT_JFD_SLAVE', 	'UNIT_JFD_SLAVE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1);

INSERT INTO UnitClasses 
		(Type,						Description,				DefaultUnit)
SELECT	'UNITCLASS_JFD_WORKER',		'TXT_KEY_UNIT_JFD_WORKER', 	'UNIT_JFD_WORKER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1);
-----------------------------------------------------------------------------------------------------
-- UnitClass Overrides
-----------------------------------------------------------------------------------------------------
INSERT INTO Civilization_UnitClassOverrides	
		(CivilizationType, 			UnitClassType, 				UnitType)
SELECT 	'CIVILIZATION_BARBARIAN',   'UNITCLASS_JFD_SLAVE', 		NULL
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1);

INSERT INTO Civilization_UnitClassOverrides	
		(CivilizationType, 			UnitClassType, 				UnitType)
SELECT 	'CIVILIZATION_MINOR',	    'UNITCLASS_JFD_SLAVE', 		NULL
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1);

INSERT INTO Civilization_UnitClassOverrides	
		(CivilizationType, 			UnitClassType, 				UnitType)
SELECT 	'CIVILIZATION_BARBARIAN',   'UNITCLASS_JFD_WORKER', 	NULL
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1);

INSERT INTO Civilization_UnitClassOverrides	
		(CivilizationType, 			UnitClassType, 				UnitType)
SELECT 	'CIVILIZATION_MINOR',	    'UNITCLASS_JFD_WORKER', 	NULL
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1);
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 
		(Type,				Class,						PrereqTech,					Cost,	ShackleCost,	ShackleCostPerEra,	IsPurchaseOnlySlave,	CombatLimit,	NoMaintenance,			HurryCostModifier,	MoveAfterPurchase,  AdvancedStartCost,  PurchaseOnly, 	WorkRate, 	BaseHurry,	HurryMultiplier,	CivilianAttackPriority, 			Capture, 					Moves,	Unhappiness, 	BaseHurry,  HurryMultiplier, Domain,			DefaultUnitAI,		Description,				Civilopedia,						Strategy,								Help,								UnitArtInfo,					IconAtlas,					PortraitIndex,	UnitFlagAtlas,							UnitFlagIconOffset,		MoveRate)
SELECT	'UNIT_JFD_SLAVE',	'UNITCLASS_JFD_SLAVE',		NULL,						300,	20,				2,					1,						0,				0,						-1,					1, 					35,					0,				100, 		5,			10,					'CIVILIAN_ATTACK_PRIORITY_LOW',		'UNITCLASS_JFD_SLAVE',		2,		0, 				0, 			0, 				 'DOMAIN_LAND',		'UNITAI_WORKER',	'TXT_KEY_UNIT_JFD_SLAVE',	'TXT_KEY_CIV5_JFD_SLAVE_TEXT',		'TXT_KEY_UNIT_JFD_SLAVE_STRATEGY',		'TXT_KEY_UNIT_HELP_JFD_SLAVE', 		'ART_DEF_UNIT_JFD_SLAVE',		'JFD_SLAVERY_UNIT_ATLAS',	0,				'JFD_UNIT_FLAG_SLAVE_WORKER_ATLAS',		0,						'BIPED'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1);

INSERT INTO Units 
		(Type,				Class,						PrereqTech,					Cost,	ShackleCost,	ShackleCostPerEra,	IsPurchaseOnlySlave,	CombatLimit,	ExtraMaintenanceCost,	HurryCostModifier,	MoveAfterPurchase,  AdvancedStartCost, 	PurchaseOnly, 	WorkRate,	BaseHurry,	HurryMultiplier,	CivilianAttackPriority, 			Capture, 					Moves,	Unhappiness, 	BaseHurry,  HurryMultiplier, Domain,			DefaultUnitAI,		Description,				Civilopedia,						Strategy,								Help,								UnitArtInfo,					IconAtlas,					PortraitIndex,	UnitFlagAtlas,							UnitFlagIconOffset,		MoveRate)
SELECT	'UNIT_JFD_WORKER',	'UNITCLASS_JFD_WORKER',		'TECH_INDUSTRIALIZATION',	500,	0,				0,					0,						0,				1,						0,					0, 					35,					0,				150,		0,			0,					'CIVILIAN_ATTACK_PRIORITY_LOW',		'UNITCLASS_JFD_WORKER',		2,		0, 				0, 			0, 				 'DOMAIN_LAND',		'UNITAI_WORKER',	'TXT_KEY_UNIT_JFD_WORKER',	'TXT_KEY_CIV5_JFD_WORKER_TEXT',		'TXT_KEY_UNIT_JFD_WORKER_STRATEGY',		'TXT_KEY_UNIT_HELP_JFD_WORKER', 	'ART_DEF_UNIT_JFD_WORKER',		'UNIT_ATLAS_2',				43,				'UNIT_FLAG_ATLAS',						1,						'BIPED'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1);

--Gold Purchasing
UPDATE Units
SET HurryCostModifier= -1
WHERE Class IN ('UNITCLASS_WORKER', 'UNITCLASS_JFD_WORKER', 'UNITCLASS_SETTLER', 'UNITCLASS_JFD_COLONIST') OR HurryCostModifier != -1 AND NOT Class IN ('UNITCLASS_JFD_GREAT_RECON', 'UNITCLASS_JFD_GREAT_EXPLORER', 'UNITCLASS_JFD_GREAT_AIRSHIP', 'UNITCLASS_JFD_GREAT_ADVENTURER', 'UNITCLASS_CARAVAN', 'UNITCLASS_MISSIONARY', 'UNITCLASS_INQUISITOR', 'UNITCLASS_SS_BOOSTER', 'UNITCLASS_SS_COCKPIT', 'UNITCLASS_SS_ENGINE', 'UNITCLASS_SS_STASIS_CHAMBER') AND NOT CombatClass IN ('UNITCOMBAT_SIEGE', 'UNITCOMBAT_NAVALMELEE', 'UNITCOMBAT_NAVALRANGED', 'UNITCOMBAT_ARMOR', 'UNITCOMBAT_CARRIER', 'UNITCOMBAT_FIGHTER', 'UNITCOMBAT_BOMBER', 'UNITCOMBAT_SUBMARINE', 'UNITCOMBAT_HELICOPTER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_NO_GOLD_PURCHASING' AND Value = 1);

CREATE TRIGGER JFDCID_Slavery_Unit_HurryCostModifier
AFTER INSERT ON Units 
WHEN NEW.Class IN ('UNITCLASS_WORKER', 'UNITCLASS_JFD_WORKER', 'UNITCLASS_SETTLER', 'UNITCLASS_JFD_COLONIST') OR NEW.HurryCostModifier != -1 AND NOT NEW.Class IN ('UNITCLASS_JFD_GREAT_RECON', 'UNITCLASS_JFD_GREAT_EXPLORER', 'UNITCLASS_JFD_GREAT_AIRSHIP', 'UNITCLASS_JFD_GREAT_ADVENTURER', 'UNITCLASS_CARAVAN', 'UNITCLASS_MISSIONARY', 'UNITCLASS_INQUISITOR', 'UNITCLASS_SS_BOOSTER', 'UNITCLASS_SS_COCKPIT', 'UNITCLASS_SS_ENGINE', 'UNITCLASS_SS_STASIS_CHAMBER') AND NOT NEW.CombatClass IN ('UNITCOMBAT_SIEGE', 'UNITCOMBAT_NAVALMELEE', 'UNITCOMBAT_NAVALRANGED', 'UNITCOMBAT_ARMOR', 'UNITCOMBAT_CARRIER', 'UNITCOMBAT_FIGHTER', 'UNITCOMBAT_BOMBER', 'UNITCOMBAT_SUBMARINE', 'UNITCOMBAT_HELICOPTER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_NO_GOLD_PURCHASING' AND Value = 1)
BEGIN
	UPDATE Units
	SET HurryCostModifier= -1
	WHERE Type = NEW.Type;
END;

--Slave Cost
UPDATE Units
SET ShackleCost = Cost/5
WHERE Cost > 0 AND Mechanized = 0 AND MoveRate IS NOT 'WHEELED' AND NOT Class IN ('UNITCLASS_JFD_WORKER', 'UNITCLASS_WORKER', 'UNITCLASS_JFD_COLONIST', 'UNITCLASS_JFD_SLAVE', 'UNITCLASS_SETTLER', 'UNITCLASS_JFD_GREAT_RECON', 'UNITCLASS_JFD_GREAT_EXPLORER', 'UNITCLASS_JFD_GREAT_AIRSHIP', 'UNITCLASS_JFD_GREAT_ADVENTURER', 'UNITCLASS_CARAVAN', 'UNITCLASS_MISSIONARY', 'UNITCLASS_INQUISITOR', 'UNITCLASS_CARGO_SHIP', 'UNITCLASS_WORKBOAT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

CREATE TRIGGER JFDCID_Slavery_Unit_ShackleCost
AFTER INSERT ON Units 
WHEN NEW.Cost > 0 AND NEW.Mechanized = 0 AND NEW.MoveRate IS NOT 'WHEELED' AND NOT NEW.Class IN ('UNITCLASS_JFD_WORKER', 'UNITCLASS_JFD_COLONIST', 'UNITCLASS_WORKER', 'UNITCLASS_JFD_SLAVE', 'UNITCLASS_SETTLER', 'UNITCLASS_JFD_GREAT_RECON', 'UNITCLASS_JFD_GREAT_EXPLORER', 'UNITCLASS_JFD_GREAT_AIRSHIP', 'UNITCLASS_JFD_GREAT_ADVENTURER', 'UNITCLASS_CARAVAN', 'UNITCLASS_MISSIONARY', 'UNITCLASS_INQUISITOR', 'UNITCLASS_CARGO_SHIP', 'UNITCLASS_WORKBOAT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1)
BEGIN
	UPDATE Units
	SET ShackleCost = Cost/5
	WHERE Type = NEW.Type;
END;

--Janissary
UPDATE Units
SET ShackleCost = 28
WHERE Type = 'UNIT_OTTOMAN_JANISSARY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

--Peasant
UPDATE Units
SET Description = 'TXT_KEY_UNIT_JFD_PEASANT', Strategy = 'TXT_KEY_UNIT_JFD_PEASANT_STRATEGY', Help = 'TXT_KEY_UNIT_JFD_PEASANT_HELP', Civilopedia = 'TXT_KEY_UNIT_JFD_PEASANT_PEDIA', Capture = 'UNITCLASS_WORKER'
WHERE Type = 'UNIT_WORKER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1);

--Siege Tower
UPDATE Units
SET ShackleCost = 12
WHERE Type = 'UNIT_ASSYRIAN_SIEGE_TOWER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

--Worker
UPDATE Units
SET Cost = 50, UnitArtInfoEraVariation = 1, ExtraMaintenanceCost = 0, ObsoleteTech = 'TECH_INDUSTRIALIZATION', PrereqTech = 'TECH_AGRICULTURE', WorkRate = 75
WHERE Class = 'UNITCLASS_WORKER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1);
-----------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
-----------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 			SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_SLAVE', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_WORKER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1);

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 			SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_WORKER', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_WORKER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1);
-----------------------------------------------------------------------------------------------------
-- Unit_AITypes
-----------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 
		(UnitType,			UnitAIType)
SELECT	'UNIT_JFD_SLAVE',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_WORKER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1);

INSERT INTO Unit_AITypes 
		(UnitType,			UnitAIType)
SELECT	'UNIT_JFD_WORKER',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_WORKER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1);
-----------------------------------------------------------------------------------------------------
-- Unit_Builds
-----------------------------------------------------------------------------------------------------
INSERT INTO Unit_Builds 
		(UnitType,			BuildType)
SELECT	'UNIT_JFD_SLAVE',	BuildType
FROM Unit_Builds WHERE UnitType = 'UNIT_WORKER'
AND NOT BuildType IN ('BUILD_ROAD', 'BUILD_RAILROAD')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1);

INSERT INTO Unit_Builds 
		(UnitType,			BuildType)
SELECT	'UNIT_JFD_WORKER',	BuildType
FROM Unit_Builds WHERE UnitType = 'UNIT_WORKER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1);

CREATE TRIGGER JFDCID_Slavery_UnitBuilds
AFTER INSERT ON Builds 
WHEN EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1)
BEGIN
	INSERT INTO Unit_Builds 
			(UnitType,			BuildType)
	SELECT	'UNIT_JFD_SLAVE',	BuildType
	FROM Unit_Builds WHERE BuildType = NEW.Type AND UnitType = 'UNIT_WORKER'
	AND NOT BuildType IN ('BUILD_ROAD', 'BUILD_RAILROAD', 'BUILD_REMOVE_ROUTE', 'BUILD_REPAIR');

	INSERT INTO Unit_Builds 
			(UnitType,			BuildType)
	SELECT	'UNIT_JFD_WORKER',	BuildType
	FROM Unit_Builds WHERE BuildType = NEW.Type AND UnitType = 'UNIT_WORKER';
END;

INSERT INTO Unit_Builds 
		(UnitType,			BuildType)
SELECT	'UNIT_JFD_WORKER',	'BUILD_JFD_VILLAGE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1);

DELETE FROM Unit_Builds WHERE UnitType = 'UNIT_JFD_WORKER' AND BuildType = 'BUILD_TRADING_POST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1);

DELETE FROM Unit_Builds WHERE UnitType = 'UNIT_WORKER' AND BuildType = 'BUILD_RAILROAD'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1);
-----------------------------------------------------------------------------------------------------
-- Unit_Flavors
-----------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 
		(UnitType,			FlavorType, Flavor)
SELECT	'UNIT_JFD_SLAVE',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_WORKER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1);

INSERT INTO Unit_Flavors 
		(UnitType,			FlavorType, Flavor)
SELECT	'UNIT_JFD_WORKER',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_WORKER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1);
-----------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
-----------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions
		(UnitType, 			PromotionType)
SELECT 	'UNIT_JFD_SLAVE', 	'PROMOTION_JFD_ENSLAVED'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1);

INSERT INTO Unit_FreePromotions
		(UnitType, 			PromotionType)
SELECT 	'UNIT_JFD_SLAVE', 	'PROMOTION_JFD_UPGRADE_DISCOUNT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1);

INSERT INTO Unit_FreePromotions
		(UnitType, 			PromotionType)
SELECT 	'UNIT_WORKER',		'PROMOTION_JFD_UPGRADE_DISCOUNT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1);
-----------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
-----------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades
		(UnitType, 			UnitClassType)
SELECT 	'UNIT_JFD_SLAVE', 	'UNITCLASS_JFD_WORKER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1);

INSERT INTO Unit_ClassUpgrades
		(UnitType, 			UnitClassType)
SELECT 	'UNIT_WORKER',		'UNITCLASS_JFD_WORKER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================