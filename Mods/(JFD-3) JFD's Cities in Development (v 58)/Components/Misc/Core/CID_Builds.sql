--==========================================================================================================================
-- CONCEPTS
--==========================================================================================================================
-- Concepts
------------------------------------------------------------------------------------------------------------------------
UPDATE Concepts
SET Summary = 'TXT_KEY_WORKERS_JFD_REPAIRINGROADS_HEADING3_BODY'
WHERE Summary = 'TXT_KEY_WORKERS_REPAIRINGROADS_HEADING3_BODY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

UPDATE Concepts
SET Summary = 'TXT_KEY_WORKERS_JFD_DURATIONTOCONSTRUCT_HEADING3_BODY'
WHERE Summary = 'TXT_KEY_WORKERS_DURATIONTOCONSTRUCT_HEADING3_BODY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);
--==========================================================================================================================
-- BUILDS
--==========================================================================================================================
-- Builds
------------------------------------------------------------------------------------------------------------------------
UPDATE Builds
SET ActionAnimation = 1920
WHERE EntityEvent = 'ENTITY_EVENT_IRRIGATE' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

UPDATE Builds
SET ActionAnimation = 1940
WHERE EntityEvent = 'ENTITY_EVENT_MINE' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

CREATE TRIGGER JFDCID_Misc_Builds
AFTER INSERT ON Builds 
WHEN NEW.EntityEvent IN ('ENTITY_EVENT_MINE', 'ENTITY_EVENT_IRRIGATE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1)
BEGIN
	UPDATE Builds
	SET ActionAnimation = 1920
	WHERE EntityEvent = 'ENTITY_EVENT_IRRIGATE' ;
	
	UPDATE Builds
	SET ActionAnimation = 1940
	WHERE EntityEvent = 'ENTITY_EVENT_MINE' ;
END;

UPDATE Builds
SET Time = NULL, ChargeCost = 1
WHERE Type IN (SELECT BuildType FROM Unit_Builds WHERE UnitType = 'UNIT_WORKER' AND BuildType NOT IN ('BUILD_ROAD', 'BUILD_RAILROAD', 'BUILD_REMOVE_ROUTE', 'BUILD_REPAIR'))
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES_EXCLUDES_REMOVING' AND Value = 0);

UPDATE Builds
SET Time = NULL, ChargeCost = 1
WHERE Type IN (SELECT BuildType FROM Unit_Builds WHERE UnitType = 'UNIT_WORKER' AND BuildType NOT IN ('BUILD_ROAD', 'BUILD_RAILROAD', 'BUILD_REMOVE_ROUTE', 'BUILD_REPAIR', 'BUILD_REMOVE_JUNGLE', 'BUILD_REMOVE_FOREST', 'BUILD_REMOVE_MARSH', 'BUILD_SCRUB_FALLOUT'))
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES_EXCLUDES_REMOVING' AND Value = 1);

UPDATE Builds
SET Time = NULL, ChargeCost = 2
WHERE Type IN ('BUILD_JFD_VILLAGE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

CREATE TRIGGER JFDCID_Misc_Unit_Builds
AFTER INSERT ON Unit_Builds 
WHEN NEW.UnitType = 'UNIT_WORKER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1)
BEGIN
	UPDATE Builds
	SET Time = NULL, ChargeCost = 1
	WHERE Type = NEW.BuildType;
END;
------------------------------------------------------------------------------------------------------------------------
-- Build_JFD_ChargeExcludes
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Build_JFD_ChargeExcludes
		(BuildType)
SELECT	Type
FROM Builds WHERE Type IN ('BUILD_ROAD', 'BUILD_REPAIR', 'BUILD_REMOVE_ROUTE', 'BUILD_RAILROAD')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES_EXCLUDES_REMOVING' AND Value = 0);

INSERT INTO Build_JFD_ChargeExcludes
		(BuildType)
SELECT	Type
FROM Builds WHERE Type IN ('BUILD_REMOVE_JUNGLE', 'BUILD_REMOVE_FOREST', 'BUILD_REMOVE_MARSH', 'BUILD_SCRUB_FALLOUT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES_EXCLUDES_REMOVING' AND Value = 1);
--==========================================================================================================================
-- PROMOTIONS
--==========================================================================================================================
-- UnitPromotions
------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions	
		(Type, 								IsBuildCharge,	ShowInUnitPanel,	ShowInEnemyUnitPanel,	Description, 							Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_BUILD_CHARGE_1', 	1,				0,					0,						'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE',	'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 								IsBuildCharge,	ShowInUnitPanel,	ShowInEnemyUnitPanel,	Description, 							Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_BUILD_CHARGE_2', 	1,				0,					0,						'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE',	'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 								IsBuildCharge,	ShowInUnitPanel,	ShowInEnemyUnitPanel,	Description, 							Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_BUILD_CHARGE_3', 	1,				0,					0,						'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE',	'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 								IsBuildCharge,	ShowInUnitPanel,	ShowInEnemyUnitPanel,	Description, 							Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_BUILD_CHARGE_4', 	1,				0,					0,						'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE',	'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 								IsBuildCharge,	ShowInUnitPanel,	ShowInEnemyUnitPanel,	Description, 							Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_BUILD_CHARGE_5', 	1,				0,					0,						'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE',	'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 								IsBuildCharge,	ShowInUnitPanel,	ShowInEnemyUnitPanel,	Description, 							Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_BUILD_CHARGE_6', 	1,				0,					0,						'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE',	'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 								IsBuildCharge,	ShowInUnitPanel,	ShowInEnemyUnitPanel,	Description, 							Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_BUILD_CHARGE_7', 	1,				0,					0,						'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE',	'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 								IsBuildCharge,	ShowInUnitPanel,	ShowInEnemyUnitPanel,	Description, 							Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_BUILD_CHARGE_8', 	1,				0,					0,						'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE',	'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 								IsBuildCharge,	ShowInUnitPanel,	ShowInEnemyUnitPanel,	Description, 							Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_BUILD_CHARGE_9', 	1,				0,					0,						'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE',	'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 								IsBuildCharge,	ShowInUnitPanel,	ShowInEnemyUnitPanel,	Description, 							Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_BUILD_CHARGE_10', 	1,				0,					0,						'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE',	'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 								IsBuildCharge,	ShowInUnitPanel,	ShowInEnemyUnitPanel,	Description, 							Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_BUILD_CHARGE_11', 	1,				0,					0,						'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE',	'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

INSERT INTO UnitPromotions	
		(Type, 								IsBuildCharge,	ShowInUnitPanel,	ShowInEnemyUnitPanel,	Description, 							Help, 											Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
SELECT	'PROMOTION_JFD_BUILD_CHARGE_12', 	1,				0,					0,						'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE',	'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE_HELP',		'AS2D_IF_LEVELUP',	1, 				57, 			'ABILITY_ATLAS',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_JFD_BUILD_CHARGE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- JFD_Civilopedia_HideFromPedia
------------------------------------------------------------------------------------------------------------------------
INSERT INTO JFD_Civilopedia_HideFromPedia
		(Type)
SELECT   Type
FROM UnitPromotions WHERE IsBuildCharge = 1;
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
------------------------------------------------------------------------------------------------------------------------
--Slave
UPDATE Units
SET Strategy = 'TXT_KEY_UNIT_JFD_SLAVE_STRATEGY_CHARGES', Help = 'TXT_KEY_UNIT_HELP_JFD_SLAVE_CHARGES', ShackleCost = 10
WHERE Type = 'UNIT_JFD_SLAVE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

--Peasant
UPDATE Units
SET Strategy = 'TXT_KEY_UNIT_JFD_PEASANT_STRATEGY_CHARGES', Help = 'TXT_KEY_UNIT_JFD_PEASANT_HELP_CHARGES'
WHERE Type = 'UNIT_WORKER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

--Worker
UPDATE Units
SET Strategy = 'TXT_KEY_UNIT_JFD_WORKER_STRATEGY_CHARGES', Help = 'TXT_KEY_UNIT_HELP_JFD_WORKER_CHARGES'
WHERE Type = 'UNIT_JFD_WORKER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

CREATE TRIGGER JFDCID_Misc_Units
AFTER INSERT ON Units 
WHEN NEW.Class IN ('UNITCLASS_WORKER') 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1)
BEGIN
	UPDATE Units
	SET WorkRate = 1000
	WHERE Type = NEW.Type;
END;
------------------------------------------------------------------------------------------------------------------------
-- Unit_JFD_BuildCharges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_JFD_BuildCharges
		(UnitType,			NumCharges)
SELECT	Type,				3
FROM Units WHERE Class = 'UNITCLASS_WORKER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

INSERT INTO Unit_JFD_BuildCharges
		(UnitType,			NumCharges)
SELECT	Type,				4
FROM Units WHERE Class = 'UNITCLASS_JFD_SLAVE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

INSERT INTO Unit_JFD_BuildCharges
		(UnitType,			NumCharges)
SELECT	Type,				5
FROM Units WHERE Class = 'UNITCLASS_JFD_WORKER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

CREATE TRIGGER JFDCID_Misc_Unit_BuildCharges
AFTER INSERT ON Units 
WHEN NEW.Class IN ('UNITCLASS_WORKER') 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1)
BEGIN
	INSERT INTO Unit_JFD_BuildCharges
			(UnitType,			NumCharges)
	VALUES	(NEW.Type,			3);
END;
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Building_JFD_BuildCharges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_JFD_BuildCharges
		(BuildingType,		NumCharges)
SELECT	Type,				1
FROM Buildings WHERE WorkerSpeedModifier > 0
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

UPDATE Buildings
SET WorkerSpeedModifier = 0
WHERE WorkerSpeedModifier > 0
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

UPDATE Buildings
SET Help = 'TXT_KEY_WONDER_JFD_PYRAMID_HELP_CHARGES'
WHERE Type = 'BUILDING_PYRAMID'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 0);

UPDATE Buildings
SET Help = 'TXT_KEY_WONDER_JFD_PYRAMID_HELP_CHARGES_SLAVERY'
WHERE Type = 'BUILDING_PYRAMID'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_WONDER_CHANGES_PYRAMIDS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 0);
--==========================================================================================================================
-- POLICIES
--==========================================================================================================================
-- Policy_JFD_BuildCharges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_JFD_BuildCharges
		(PolicyType,		NumCharges)
SELECT	Type,				1
FROM Policies WHERE WorkerSpeedModifier > 0
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Policies
------------------------------------------------------------------------------------------------------------------------
UPDATE Policies
SET WorkerSpeedModifier = 0
WHERE WorkerSpeedModifier > 0
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_CITIZENSHIP_HELP_CHARGES'
WHERE Type = 'POLICY_CITIZENSHIP'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_CITIZENSHIP_HELP_CHARGES_SLAVERY'
WHERE Type = 'POLICY_CITIZENSHIP'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_POLICY_CHANGES_CITIZENSHIP' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================

