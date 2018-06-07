--==========================================================================================================================
-- POLICY BRANCHES
--==========================================================================================================================
-- PolicyBranchTypes
--------------------------------------------------------------------------------------------------------------------------
--Autocracy
UPDATE PolicyBranchTypes
SET Title = 'TXT_KEY_JFD_AUTOCRACY_TITLE'
WHERE Type = 'POLICY_BRANCH_AUTOCRACY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_POLICY_CHANGES' AND Value = 1);

--Honour
--UPDATE PolicyBranchTypes
--SET Help = 'TXT_KEY_POLICY_JFD_HONOR_HELP'
--WHERE Type = 'POLICY_BRANCH_HONOR'
--AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_POLICY_CHANGES' AND Value = 1);

--Exploration
UPDATE PolicyBranchTypes
SET Title = 'TXT_KEY_JFD_EXPLORATION_TITLE', Help = 'TXT_KEY_POLICY_JFD_EXPLORATION_HELP'
WHERE Type = 'POLICY_BRANCH_EXPLORATION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_POLICY_CHANGES' AND Value = 1);
--==========================================================================================================================
-- POLICIES
--==========================================================================================================================
-- Policies
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policies
		(Type,						Description)
VALUES	('POLICY_JFD_EXPLORATION',	'TXT_KEY_RESOURCE_JFD_SAFFRON');

--Honor Opener
-- UPDATE Policies
-- SET Help = 'TXT_KEY_POLICY_JFD_HONOR_HELP'
-- WHERE Type = 'POLICY_HONOR'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_POLICY_CHANGES' AND Value = 1);

--Exploration Opener
UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_EXPLORATION_HELP'
WHERE Type = 'POLICY_EXPLORATION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_POLICY_CHANGES' AND Value = 1);

--Maritime Infrastructure
UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_MARITIME_INFRASTRUCTURE_HELP'
WHERE Type = 'POLICY_MARITIME_INFRASTRUCTURE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_POLICY_CHANGES' AND Value = 1);

--Naval Tradition
UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_NAVAL_TRADITION_HELP'
WHERE Type = 'POLICY_NAVAL_TRADITION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_POLICY_CHANGES' AND Value = 1);

--Merchant Navy
UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_MERCHANT_NAVY_HELP', InternalTradeGold = 10, FreeTradeRoute = 1 
WHERE Type = 'POLICY_MERCHANT_NAVY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_POLICY_CHANGES' AND Value = 1);

--Treasure Fleets
UPDATE Policies
SET Description = 'TXT_KEY_POLICY_JFD_VICEGERENTRY', Help = 'TXT_KEY_POLICY_JFD_VICEGERENTRY_HELP', Civilopedia = 'TXT_KEY_CIV5_POLICY_JFD_VICEGERENTRY_TEXT', SeaTradeRouteGoldChange = 0, InternalTradeRouteYieldModifier = 50
WHERE Type = 'POLICY_TREASURE_FLEETS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_POLICY_CHANGES' AND Value = 1);

--Exploration Finisher
UPDATE Policies
SET CityWorkingChange = 1
WHERE Type = 'POLICY_EXPLORATION_FINISHER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_POLICY_CHANGES' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_CoastalCityYieldChanges
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Policy_CoastalCityYieldChanges WHERE PolicyType = 'POLICY_MARITIME_INFRASTRUCTURE' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_POLICY_CHANGES' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_BuildingClassYieldChanges
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Policy_BuildingClassYieldChanges WHERE PolicyType = 'POLICY_MERCHANT_NAVY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_POLICY_CHANGES' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_FreeBuilding
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_BuildingClassProductionModifiers 
		(PolicyType, 						BuildingClassType, 		ProductionModifier)
SELECT	'POLICY_MARITIME_INFRASTRUCTURE',	BuildingClass, 			20
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_SEAPORT', 'BUILDINGCLASS_HARBOR', 'BUILDINGCLASS_LIGHTHOUSE', 'BUILDINGCLASS_EE_DRYDOCK')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_POLICY_CHANGES' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_BuildingClassYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_BuildingClassYieldChanges 
		(PolicyType, 						BuildingClassType, 	YieldType, 				YieldChange)
SELECT	'POLICY_MARITIME_INFRASTRUCTURE',	BuildingClass, 		'YIELD_PRODUCTION',		1
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_SEAPORT', 'BUILDINGCLASS_HARBOR', 'BUILDINGCLASS_LIGHTHOUSE', 'BUILDINGCLASS_EE_DRYDOCK')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_POLICY_CHANGES' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_BuildingClassCultureChanges
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Policy_BuildingClassCultureChanges WHERE PolicyType = 'POLICY_MERCHANT_NAVY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_POLICY_CHANGES' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_BuildingClassHappiness
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Policy_BuildingClassHappiness WHERE PolicyType = 'POLICY_NAVAL_TRADITION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_POLICY_CHANGES' AND Value = 1);
INSERT INTO Policy_BuildingClassHappiness 
		(PolicyType, 					BuildingClassType, 			Happiness)
SELECT	'POLICY_TREASURE_FLEETS', 		'BUILDINGCLASS_HARBOR', 	2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_POLICY_CHANGES' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_UnitCombatProductionModifiers
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_UnitCombatProductionModifiers 
		(PolicyType, 					UnitCombatType, 			ProductionModifier)
SELECT	'POLICY_NAVAL_TRADITION', 		Type, 						25
FROM UnitCombatInfos WHERE Type IN ('UNITCOMBAT_NAVALMELEE', 'UNITCOMBAT_NAVALRANGED', 'UNITCOMBAT_SUBMARINE', 'UNITCOMBAT_CARRIER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_POLICY_CHANGES' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_FreePromotions 
		(PolicyType, 					PromotionType)
SELECT	'POLICY_NAVAL_TRADITION', 		'PROMOTION_JFD_NAVAL_TRADITION'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_POLICY_CHANGES' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_FaithPurchaseUnitClasses
--------------------------------------------------------------------------------------------------------------------------
-- DELETE FROM Policy_FaithPurchaseUnitClasses WHERE PolicyType = 'POLICY_EXPLORATION_FINISHER' 
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_POLICY_CHANGES' AND Value = 1);
-- INSERT INTO Policy_FaithPurchaseUnitClasses 
		-- (PolicyType, 					UnitClassType)
-- SELECT	'POLICY_HONOR_FINISHER', 		'UNITCLASS_GREAT_ADMIRAL'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_POLICY_CHANGES' AND Value = 1);

-- INSERT INTO Policy_FaithPurchaseUnitClasses 
		-- (PolicyType, 					UnitClassType)
-- SELECT	'POLICY_EXPLORATION_FINISHER',	Type
-- FROM UnitClasses WHERE Type IN ('UNITCLASS_JFD_GREAT_ADVENTURER', 'UNITCLASS_JFD_GREAT_EXPLORER', 'UNITCLASS_JFD_GREAT_SCOUT', 'UNITCLASS_JFD_GREAT_AIRSHIP', 'UNITCLASS_JFD_SCOUT', 'UNITCLASS_JFD_EXPLORER', 'UNITCLASS_JFD_ADVENTURER', 'UNITCLASS_JFD_AIRSHIP')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_POLICY_CHANGES' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_Flavors
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Policy_Flavors WHERE PolicyType IN ('POLICY_NAVAL_TRADITION', 'POLICY_TREASURE_FLEETS') 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_POLICY_CHANGES' AND Value = 1);
INSERT INTO Policy_Flavors
		(PolicyType,					FlavorType,				Flavor)
VALUES	('POLICY_NAVAL_TRADITION',		'FLAVOR_NAVAL',			20),
		('POLICY_NAVAL_TRADITION',		'FLAVOR_PRODUCTION',	10),
		('POLICY_TREASURE_FLEETS',		'FLAVOR_HAPPINESS',		10),
		('POLICY_TREASURE_FLEETS',		'FLAVOR_PRODUCTION',	5),
		('POLICY_TREASURE_FLEETS',		'FLAVOR_GROWTH',		5),
		('POLICY_TREASURE_FLEETS',		'FLAVOR_HAPPINESS',		10);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_PrereqPolicies
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Policy_PrereqPolicies WHERE PolicyType = 'POLICY_MERCHANT_NAVY' AND PrereqPolicy = 'POLICY_NAVAL_TRADITION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_POLICY_CHANGES' AND Value = 1);

--Opener
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Exploration[ENDCOLOR] enhances your abilties to spread your empire over the seas.[NEWLINE][NEWLINE]Adopting Exploration gives +1 [ICON_MOVES] Movement for Naval units and +1 Sight for Naval combat units. Unlocks building the Belem Tower.[NEWLINE][NEWLINE]Adopting all policies allows you to see Hidden Antiquity Sites and allows cities to work and purchase one additional ring of tiles. It also allows the purchase of Great Admirals with [ICON_PEACE] Faith starting in the Industrial Era.'
WHERE Tag = 'TXT_KEY_POLICY_BRANCH_EXPLORATION_HELP' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_POLICY_CHANGES' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================
	