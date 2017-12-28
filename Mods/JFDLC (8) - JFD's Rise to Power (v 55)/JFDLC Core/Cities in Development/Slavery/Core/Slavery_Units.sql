--==========================================================================================================================	
-- UNIT CLASSES
--==========================================================================================================================			
-- UnitClasses
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitClasses 
		(Type,						Description,				DefaultUnit)
SELECT	'UNITCLASS_JFD_SLAVE',		'TXT_KEY_UNIT_JFD_SLAVE', 	'UNIT_JFD_SLAVE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_LABOURER' AND Value = 1);
-----------------------------------------------------------------------------------------------------
-- UnitClass Overrides
-----------------------------------------------------------------------------------------------------
INSERT INTO Civilization_UnitClassOverrides	
		(CivilizationType, 			UnitClassType, 				UnitType)
SELECT 	'CIVILIZATION_BARBARIAN',   'UNITCLASS_JFD_SLAVE', 		NULL
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_LABOURER' AND Value = 1);

INSERT INTO Civilization_UnitClassOverrides	
		(CivilizationType, 			UnitClassType, 				UnitType)
SELECT 	'CIVILIZATION_MINOR',	    'UNITCLASS_JFD_SLAVE', 		NULL
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_LABOURER' AND Value = 1);
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 
		(Type,				Class,						Capture,				Cost,	ShackleCost,	ShackleCostPerEra,	IsPurchaseOnlySlave,	NoMaintenance,	CombatLimit,	NoMaintenance,	 HurryCostModifier,	 MoveAfterPurchase,  AdvancedStartCost,  PurchaseOnly, 	WorkRate, 	BaseHurry,	HurryMultiplier,	CivilianAttackPriority, 			Moves,	Unhappiness, 	BaseHurry,  HurryMultiplier, Domain,			DefaultUnitAI,		Description,				Civilopedia,						Strategy,								Help,								UnitArtInfo,					IconAtlas,					PortraitIndex,	UnitFlagAtlas,							UnitFlagIconOffset,		MoveRate)
SELECT	'UNIT_JFD_SLAVE',	'UNITCLASS_JFD_SLAVE',		'UNITCLASS_JFD_SLAVE',	300,	20,				2,					1,						1,				0,				0,				 -1,				 1, 				 35,				 0,				100, 		0,			0,					'CIVILIAN_ATTACK_PRIORITY_LOW',		2,		0, 				0, 			0, 				 'DOMAIN_LAND',		'UNITAI_WORKER',	'TXT_KEY_UNIT_JFD_SLAVE',	'TXT_KEY_CIV5_JFD_SLAVE_TEXT',		'TXT_KEY_UNIT_JFD_SLAVE_STRATEGY',		'TXT_KEY_UNIT_HELP_JFD_SLAVE', 		'ART_DEF_UNIT_JFD_SLAVE',		'JFD_SLAVERY_UNIT_ATLAS',	0,				'JFD_UNIT_FLAG_SLAVE_WORKER_ATLAS',		0,						'BIPED'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_LABOURER' AND Value = 1);

--Gold Purchasing
UPDATE Units
SET HurryCostModifier= -1
WHERE Class IN ('UNITCLASS_WORKER', 'UNITCLASS_JFD_WORKER', 'UNITCLASS_SETTLER', 'UNITCLASS_JFD_COLONIST') OR HurryCostModifier != -1 AND NOT Class IN ('UNITCLASS_JFD_GREAT_RECON', 'UNITCLASS_JFD_GREAT_EXPLORER', 'UNITCLASS_JFD_GREAT_AIRSHIP', 'UNITCLASS_JFD_GREAT_ADVENTURER', 'UNITCLASS_CARAVAN', 'UNITCLASS_MISSIONARY', 'UNITCLASS_INQUISITOR', 'UNITCLASS_SS_BOOSTER', 'UNITCLASS_SS_COCKPIT', 'UNITCLASS_SS_ENGINE', 'UNITCLASS_SS_STASIS_CHAMBER') AND NOT CombatClass IN ('UNITCOMBAT_SIEGE', 'UNITCOMBAT_NAVALMELEE', 'UNITCOMBAT_NAVALRANGED', 'UNITCOMBAT_ARMOR', 'UNITCOMBAT_CARRIER', 'UNITCOMBAT_FIGHTER', 'UNITCOMBAT_BOMBER', 'UNITCOMBAT_SUBMARINE', 'UNITCOMBAT_HELICOPTER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE_NO_GOLD_PURCHASING' AND Value = 1);

CREATE TRIGGER JFDCID_Slavery_Unit_HurryCostModifier
AFTER INSERT ON Units 
WHEN NEW.Class IN ('UNITCLASS_WORKER', 'UNITCLASS_JFD_WORKER', 'UNITCLASS_SETTLER', 'UNITCLASS_JFD_COLONIST') OR NEW.HurryCostModifier != -1 AND NOT NEW.Class IN ('UNITCLASS_JFD_GREAT_RECON', 'UNITCLASS_JFD_GREAT_EXPLORER', 'UNITCLASS_JFD_GREAT_AIRSHIP', 'UNITCLASS_JFD_GREAT_ADVENTURER', 'UNITCLASS_CARAVAN', 'UNITCLASS_MISSIONARY', 'UNITCLASS_INQUISITOR', 'UNITCLASS_SS_BOOSTER', 'UNITCLASS_SS_COCKPIT', 'UNITCLASS_SS_ENGINE', 'UNITCLASS_SS_STASIS_CHAMBER') AND NOT NEW.CombatClass IN ('UNITCOMBAT_SIEGE', 'UNITCOMBAT_NAVALMELEE', 'UNITCOMBAT_NAVALRANGED', 'UNITCOMBAT_ARMOR', 'UNITCOMBAT_CARRIER', 'UNITCOMBAT_FIGHTER', 'UNITCOMBAT_BOMBER', 'UNITCOMBAT_SUBMARINE', 'UNITCOMBAT_HELICOPTER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE_NO_GOLD_PURCHASING' AND Value = 1)
BEGIN
	UPDATE Units
	SET HurryCostModifier= -1
	WHERE Type = NEW.Type;
END;

--Shackle Cost
UPDATE Units
SET ShackleCost = Cost/5
WHERE Cost > 0 AND Mechanized = 0 AND MoveRate IS NOT 'WHEELED' AND NOT Class IN ('UNITCLASS_JFD_WORKER', 'UNITCLASS_WORKER', 'UNITCLASS_JFD_COLONIST', 'UNITCLASS_JFD_SLAVE', 'UNITCLASS_SETTLER', 'UNITCLASS_JFD_GREAT_RECON', 'UNITCLASS_JFD_GREAT_EXPLORER', 'UNITCLASS_JFD_GREAT_AIRSHIP', 'UNITCLASS_JFD_GREAT_ADVENTURER', 'UNITCLASS_CARAVAN', 'UNITCLASS_MISSIONARY', 'UNITCLASS_INQUISITOR', 'UNITCLASS_CARGO_SHIP', 'UNITCLASS_WORKBOAT', 'UNITCLASS_ARCHAEOLOGIST')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

CREATE TRIGGER JFDCID_Slavery_Unit_ShackleCost
AFTER INSERT ON Units 
WHEN NEW.Cost > 0 AND NEW.Mechanized = 0 AND NEW.MoveRate IS NOT 'WHEELED' AND NOT NEW.Class IN ('UNITCLASS_JFD_WORKER', 'UNITCLASS_JFD_COLONIST', 'UNITCLASS_WORKER', 'UNITCLASS_JFD_SLAVE', 'UNITCLASS_SETTLER', 'UNITCLASS_JFD_GREAT_RECON', 'UNITCLASS_JFD_GREAT_EXPLORER', 'UNITCLASS_JFD_GREAT_AIRSHIP', 'UNITCLASS_JFD_GREAT_ADVENTURER', 'UNITCLASS_CARAVAN', 'UNITCLASS_MISSIONARY', 'UNITCLASS_INQUISITOR', 'UNITCLASS_CARGO_SHIP', 'UNITCLASS_WORKBOAT', 'UNITCLASS_ARCHAEOLOGIST')
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

--Siege Tower
UPDATE Units
SET ShackleCost = 12
WHERE Type = 'UNIT_ASSYRIAN_SIEGE_TOWER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);
-----------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
-----------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 			SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_SLAVE', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_WORKER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_LABOURER' AND Value = 1);
-----------------------------------------------------------------------------------------------------
-- Unit_AITypes
-----------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 
		(UnitType,			UnitAIType)
SELECT	'UNIT_JFD_SLAVE',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_WORKER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_LABOURER' AND Value = 1);
-----------------------------------------------------------------------------------------------------
-- Unit_Builds
-----------------------------------------------------------------------------------------------------
INSERT INTO Unit_Builds 
		(UnitType,			BuildType)
SELECT	'UNIT_JFD_SLAVE',	BuildType
FROM Unit_Builds WHERE UnitType = 'UNIT_WORKER'
AND NOT BuildType IN ('BUILD_ROAD', 'BUILD_RAILROAD')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_LABOURER' AND Value = 1);

CREATE TRIGGER JFDCID_Slavery_UnitBuilds
AFTER INSERT ON Builds 
WHEN EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_LABOURER' AND Value = 1)
BEGIN
	INSERT INTO Unit_Builds 
			(UnitType,			BuildType)
	SELECT	'UNIT_JFD_SLAVE',	BuildType
	FROM Unit_Builds WHERE BuildType = NEW.Type AND UnitType = 'UNIT_WORKER'
	AND NOT BuildType IN ('BUILD_ROAD', 'BUILD_RAILROAD', 'BUILD_REMOVE_ROUTE', 'BUILD_REPAIR');
END;
-----------------------------------------------------------------------------------------------------
-- Unit_Flavors
-----------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 
		(UnitType,			FlavorType, Flavor)
SELECT	'UNIT_JFD_SLAVE',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_WORKER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_LABOURER' AND Value = 1);
-----------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
-----------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions
		(UnitType, 			PromotionType)
SELECT 	'UNIT_JFD_SLAVE', 	'PROMOTION_JFD_ENSLAVED'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_LABOURER' AND Value = 1);

INSERT INTO Unit_FreePromotions
		(UnitType, 			PromotionType)
SELECT 	'UNIT_JFD_SLAVE', 	'PROMOTION_JFD_UPGRADE_DISCOUNT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_LABOURER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_PEASANT' AND Value = 1);
-----------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
-----------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades
		(UnitType, 			UnitClassType)
SELECT 	'UNIT_JFD_SLAVE', 	'UNITCLASS_JFD_WORKER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_LABOURER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_CHANGES_PEASANT' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================