-- Barbarian Healing

INSERT INTO Defines (
Name, Value)
SELECT 'BALANCE_BARBARIAN_HEAL_RATE', '0'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='BARBARIAN_HEAL' AND Value= 0 );

INSERT INTO Defines (
Name, Value)
SELECT 'BALANCE_BARBARIAN_HEAL_RATE', '10'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='BARBARIAN_HEAL' AND Value= 1 );

INSERT INTO Defines (
Name, Value)
SELECT 'BALANCE_BARBARIAN_HEAL_RATE', '15'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='BARBARIAN_HEAL' AND Value= 2 );

-- Barbarian Promotions

UPDATE Features
SET SpawnLocationUnitFreePromotion = 'PROMOTION_MARSH_WALKER'
WHERE Type = 'FEATURE_MARSH';

UPDATE Features
SET SpawnLocationUnitFreePromotion = 'PROMOTION_MARSH_WALKER'
WHERE Type = 'FEATURE_FLOOD_PLAINS';

UPDATE Features
SET SpawnLocationUnitFreePromotion = 'PROMOTION_WOODS_WALKER'
WHERE Type = 'FEATURE_FOREST';

UPDATE Features
SET SpawnLocationUnitFreePromotion = 'PROMOTION_WOODS_WALKER'
WHERE Type = 'FEATURE_JUNGLE';

UPDATE Terrains
SET SpawnLocationUnitFreePromotion = 'PROMOTION_DESERT_WALKER'
WHERE Type = 'TERRAIN_DESERT';

UPDATE Terrains
SET AdjacentSpawnLocationUnitFreePromotion = 'PROMOTION_COAST_WALKER'
WHERE Type = 'TERRAIN_COAST';

UPDATE Terrains
SET SpawnLocationUnitFreePromotion = 'PROMOTION_HILL_WALKER'
WHERE Type = 'TERRAIN_HILL';

UPDATE Terrains
SET SpawnLocationUnitFreePromotion = 'PROMOTION_WHITE_WALKER'
WHERE Type = 'TERRAIN_SNOW';

UPDATE Terrains
SET SpawnLocationUnitFreePromotion = 'PROMOTION_WHITE_WALKER'
WHERE Type = 'TERRAIN_TUNDRA';

INSERT INTO UnitPromotions
	(Type, Description, Help, Sound, OrderPriority, PortraitIndex, BarbarianOnly, IconAtlas, PediaType, CannotBeChosen, PediaEntry)
VALUES
	('PROMOTION_MARSH_WALKER', 'TXT_KEY_PROMOTION_MARSH_WALKER', 'TXT_KEY_PROMOTION_MARSH_WALKER_HELP', 'AS2D_IF_LEVELUP', 99, 44, 1, 'PROMOTION_ATLAS', 'PEDIA_ATTRIBUTES', 1, 'TXT_KEY_PROMOTION_MARSH_WALKER'),
	('PROMOTION_WHITE_WALKER', 'TXT_KEY_PROMOTION_WHITE_WALKER', 'TXT_KEY_PROMOTION_WHITE_WALKER_HELP', 'AS2D_IF_LEVELUP', 99, 44, 1, 'PROMOTION_ATLAS', 'PEDIA_ATTRIBUTES', 1, 'TXT_KEY_PROMOTION_WHITE_WALKER'),
	('PROMOTION_WOODS_WALKER', 'TXT_KEY_PROMOTION_WOODS_WALKER', 'TXT_KEY_PROMOTION_WOODS_WALKER_HELP', 'AS2D_IF_LEVELUP', 99, 56, 1, 'PROMOTION_ATLAS', 'PEDIA_ATTRIBUTES', 1, 'TXT_KEY_PROMOTION_WOODS_WALKER'),
	('PROMOTION_DESERT_WALKER', 'TXT_KEY_PROMOTION_DESERT_WALKER', 'TXT_KEY_PROMOTION_DESERT_WALKER_HELP', 'AS2D_IF_LEVELUP', 99, 1, 1, 'EXPANSION2_PROMOTION_ATLAS', 'PEDIA_ATTRIBUTES', 1, 'TXT_KEY_PROMOTION_DESERT_WALKER'),
	('PROMOTION_COAST_WALKER', 'TXT_KEY_PROMOTION_COAST_WALKER', 'TXT_KEY_PROMOTION_COAST_WALKER_HELP', 'AS2D_IF_LEVELUP', 99, 22, 1, 'PROMOTION_ATLAS', 'PEDIA_ATTRIBUTES', 1, 'TXT_KEY_PROMOTION_COAST_WALKER'),
	('PROMOTION_HILL_WALKER', 'TXT_KEY_PROMOTION_HILL_WALKER', 'TXT_KEY_PROMOTION_HILL_WALKER_HELP', 'AS2D_IF_LEVELUP', 99, 0, 1, 'EXPANSION2_PROMOTION_ATLAS', 'PEDIA_ATTRIBUTES', 1, 'TXT_KEY_PROMOTION_HILL_WALKER');

INSERT INTO UnitPromotions_Features
	(PromotionType, FeatureType, DoubleMove)
VALUES
	('PROMOTION_MARSH_WALKER', 'FEATURE_MARSH', 1),
	('PROMOTION_MARSH_WALKER', 'FEATURE_FLOOD_PLAINS', 1),
	('PROMOTION_WOODS_WALKER', 'FEATURE_FOREST', 1),
	('PROMOTION_WOODS_WALKER', 'FEATURE_JUNGLE', 1);

INSERT INTO UnitPromotions_Terrains
	(PromotionType, TerrainType, DoubleMove)
VALUES
	('PROMOTION_WHITE_WALKER', 'TERRAIN_TUNDRA', 1),
	('PROMOTION_WHITE_WALKER', 'TERRAIN_SNOW', 1),
	('PROMOTION_DESERT_WALKER', 'TERRAIN_DESERT', 1);

INSERT INTO UnitPromotions_UnitCombats
	(PromotionType, UnitCombatType)
VALUES
	('PROMOTION_MARSH_WALKER', 'UNITCOMBAT_RECON'),
	('PROMOTION_MARSH_WALKER', 'UNITCOMBAT_ARCHER'),
	('PROMOTION_MARSH_WALKER', 'UNITCOMBAT_MOUNTED'),
	('PROMOTION_MARSH_WALKER', 'UNITCOMBAT_MELEE'),
	('PROMOTION_MARSH_WALKER', 'UNITCOMBAT_SIEGE'),
	('PROMOTION_MARSH_WALKER', 'UNITCOMBAT_GUN'),
	('PROMOTION_MARSH_WALKER', 'UNITCOMBAT_ARMOR'),
	('PROMOTION_MARSH_WALKER', 'UNITCOMBAT_HELICOPTER'),
	('PROMOTION_WHITE_WALKER', 'UNITCOMBAT_RECON'),
	('PROMOTION_WHITE_WALKER', 'UNITCOMBAT_ARCHER'),
	('PROMOTION_WHITE_WALKER', 'UNITCOMBAT_MOUNTED'),
	('PROMOTION_WHITE_WALKER', 'UNITCOMBAT_MELEE'),
	('PROMOTION_WHITE_WALKER', 'UNITCOMBAT_SIEGE'),
	('PROMOTION_WHITE_WALKER', 'UNITCOMBAT_GUN'),
	('PROMOTION_WHITE_WALKER', 'UNITCOMBAT_ARMOR'),
	('PROMOTION_WHITE_WALKER', 'UNITCOMBAT_HELICOPTER'),
	('PROMOTION_WOODS_WALKER', 'UNITCOMBAT_RECON'),
	('PROMOTION_WOODS_WALKER', 'UNITCOMBAT_ARCHER'),
	('PROMOTION_WOODS_WALKER', 'UNITCOMBAT_MOUNTED'),
	('PROMOTION_WOODS_WALKER', 'UNITCOMBAT_MELEE'),
	('PROMOTION_WOODS_WALKER', 'UNITCOMBAT_SIEGE'),
	('PROMOTION_WOODS_WALKER', 'UNITCOMBAT_GUN'),
	('PROMOTION_WOODS_WALKER', 'UNITCOMBAT_ARMOR'),
	('PROMOTION_WOODS_WALKER', 'UNITCOMBAT_HELICOPTER'),
	('PROMOTION_COAST_WALKER', 'UNITCOMBAT_RECON'),
	('PROMOTION_COAST_WALKER', 'UNITCOMBAT_ARCHER'),
	('PROMOTION_COAST_WALKER', 'UNITCOMBAT_MOUNTED'),
	('PROMOTION_COAST_WALKER', 'UNITCOMBAT_MELEE'),
	('PROMOTION_COAST_WALKER', 'UNITCOMBAT_SIEGE'),
	('PROMOTION_COAST_WALKER', 'UNITCOMBAT_GUN'),
	('PROMOTION_COAST_WALKER', 'UNITCOMBAT_ARMOR'),
	('PROMOTION_COAST_WALKER', 'UNITCOMBAT_HELICOPTER'),
	('PROMOTION_DESERT_WALKER', 'UNITCOMBAT_RECON'),
	('PROMOTION_DESERT_WALKER', 'UNITCOMBAT_ARCHER'),
	('PROMOTION_DESERT_WALKER', 'UNITCOMBAT_MOUNTED'),
	('PROMOTION_DESERT_WALKER', 'UNITCOMBAT_MELEE'),
	('PROMOTION_DESERT_WALKER', 'UNITCOMBAT_SIEGE'),
	('PROMOTION_DESERT_WALKER', 'UNITCOMBAT_GUN'),
	('PROMOTION_DESERT_WALKER', 'UNITCOMBAT_ARMOR'),
	('PROMOTION_DESERT_WALKER', 'UNITCOMBAT_HELICOPTER'),
	('PROMOTION_HILL_WALKER', 'UNITCOMBAT_RECON'),
	('PROMOTION_HILL_WALKER', 'UNITCOMBAT_ARCHER'),
	('PROMOTION_HILL_WALKER', 'UNITCOMBAT_MOUNTED'),
	('PROMOTION_HILL_WALKER', 'UNITCOMBAT_MELEE'),
	('PROMOTION_HILL_WALKER', 'UNITCOMBAT_SIEGE'),
	('PROMOTION_HILL_WALKER', 'UNITCOMBAT_GUN'),
	('PROMOTION_HILL_WALKER', 'UNITCOMBAT_ARMOR'),
	('PROMOTION_HILL_WALKER', 'UNITCOMBAT_HELICOPTER');

INSERT INTO Civilization_UnitClassOverrides
	(CivilizationType, UnitClassType, UnitType)
VALUES
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXPLORER', NULL);