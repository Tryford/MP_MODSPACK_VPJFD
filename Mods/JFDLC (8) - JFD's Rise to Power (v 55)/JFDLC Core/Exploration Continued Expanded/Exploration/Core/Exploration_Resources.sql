--==========================================================================================================================
-- RESOURCES
--==========================================================================================================================
-- Resources
----------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Resources 
		(Type,						TechReveal,					TechCityTrade, 				Description,						Civilopedia, 									Help,										ResourceClassType, 			ArtDefineTag, 							OnlyMinorCivs,  Happiness,  PlacementOrder, ConstAppearance, 	AITradeModifier, 	RandApp1,	RandApp2, 	ResourceUsage,	AIObjective,	MinAreaSize, 	MaxLatitude, 	'Unique', 	TilesPer, 	Lakes, 		Hills, 	FlatLands, 	Normalize, 	Player, IconString, 					PortraitIndex, 	IconAtlas)
SELECT	'RESOURCE_JFD_CEDAR',		NULL,						'TECH_CONSTRUCTION',		'TXT_KEY_RESOURCE_JFD_CEDAR',		'TXT_KEY_CIV5_RESOURCE_JFD_CEDAR_TEXT',			NULL,										'RESOURCECLASS_BONUS',		'ART_DEF_RESOURCE_JFD_CEDAR',			0,				0,			4,				30,					0,					25, 		25, 		0,				0,				3,				50,				2, 			120, 		0,			0, 		1, 			1, 			50,		'[ICON_RES_JFD_CEDAR]',			6, 				'JFD_EXPLORATION_RESOURCE_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);	

INSERT OR REPLACE INTO Resources 
		(Type,						TechReveal,					TechCityTrade, 				Description,						Civilopedia, 									Help,										ResourceClassType, 			ArtDefineTag, 							OnlyMinorCivs,  Happiness,  PlacementOrder, ConstAppearance, 	AITradeModifier, 	RandApp1,	RandApp2, 	ResourceUsage,	AIObjective,	MinAreaSize, 	MaxLatitude, 	'Unique', 	TilesPer, 	Lakes, 		Hills, 	FlatLands, 	Normalize, 	Player, IconString, 					PortraitIndex, 	IconAtlas)
SELECT	'RESOURCE_JFD_FEATHERS',	NULL,						'TECH_GUILDS',				'TXT_KEY_RESOURCE_JFD_FEATHERS',	'TXT_KEY_CIV5_RESOURCE_JFD_FEATHERS_TEXT',		NULL,										'RESOURCECLASS_LUXURY',		'ART_DEF_RESOURCE_JFD_FEATHERS',		0,				4,			4,				5,					10,					20, 		20, 		2, 				0, 				3, 				50, 			2, 			120,		0,			0,		1,			1,			50,		'[ICON_RES_JFD_FEATHERS]',		7, 				'JFD_EXPLORATION_RESOURCE_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_COMMUNITY_BALANCE_PATCH' AND Value = 0);

INSERT OR REPLACE INTO Resources 
		(Type,						TechReveal,					TechCityTrade, 				Description,						Civilopedia, 									Help,										ResourceClassType, 			ArtDefineTag, 							OnlyMinorCivs,  Happiness,  PlacementOrder, ConstAppearance, 	AITradeModifier, 	RandApp1,	RandApp2, 	ResourceUsage,	AIObjective,	MinAreaSize, 	MaxLatitude, 	'Unique', 	TilesPer, 	Lakes, 		Hills, 	FlatLands, 	Normalize, 	Player, IconString, 					PortraitIndex, 	IconAtlas)
SELECT	'RESOURCE_JFD_GINGER',		NULL,						'TECH_CALENDAR',			'TXT_KEY_RESOURCE_JFD_GINGER',		'TXT_KEY_CIV5_RESOURCE_JFD_GINGER_TEXT',		NULL,										'RESOURCECLASS_LUXURY',		'ART_DEF_RESOURCE_JFD_GINGER',			0,				4,			4,				10,					20, 				20, 		10, 		2, 				0, 				3, 				50, 			2,			120,		0,			0,		1,			1,			50,		'[ICON_RES_JFD_GINGER]',		2, 				'JFD_EXPLORATION_RESOURCE_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);	

INSERT OR REPLACE INTO Resources 
		(Type,						TechReveal,					TechCityTrade, 				Description,						Civilopedia, 									Help,										ResourceClassType, 			ArtDefineTag, 							OnlyMinorCivs,  Happiness,  PlacementOrder, ConstAppearance, 	AITradeModifier, 	RandApp1,	RandApp2, 	ResourceUsage,	AIObjective,	MinAreaSize, 	MaxLatitude, 	'Unique', 	TilesPer, 	Lakes, 		Hills, 	FlatLands, 	Normalize, 	Player, IconString, 					PortraitIndex, 	IconAtlas)
SELECT	'RESOURCE_JFD_LOTUS',		NULL,						NULL,						'TXT_KEY_RESOURCE_JFD_LOTUS',		'TXT_KEY_CIV5_RESOURCE_JFD_LOTUS_TEXT',			NULL,										'RESOURCECLASS_BONUS',		'ART_DEF_RESOURCE_JFD_LOTUS',			0,				0,			4,				25,					0,					15, 		15, 		0,				0,				3,				50,				2, 			120, 		1,			0, 		1, 			1, 			50,		'[ICON_RES_JFD_LOTUS]',			4, 				'JFD_EXPLORATION_RESOURCE_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);	

INSERT OR REPLACE INTO Resources 
		(Type,						TechReveal,					TechCityTrade, 				Description,						Civilopedia, 									Help,										ResourceClassType, 			ArtDefineTag, 							OnlyMinorCivs,  Happiness,  PlacementOrder, ConstAppearance, 	AITradeModifier, 	RandApp1,	RandApp2, 	ResourceUsage,	AIObjective,	MinAreaSize, 	MaxLatitude, 	'Unique', 	TilesPer, 	Rivers, 	Hills, 	FlatLands, 	Normalize, 	Player, IconString, 					PortraitIndex, 	IconAtlas)
SELECT	'RESOURCE_JFD_MAIZE',		NULL,						'TECH_AGRICULTURE',			'TXT_KEY_RESOURCE_JFD_MAIZE',		'TXT_KEY_CIV5_RESOURCE_JFD_MAIZE_TEXT',			NULL,										'RESOURCECLASS_BONUS',		'ART_DEF_RESOURCE_JFD_MAIZE',			0,				0,			4,				25,					0,					15, 		15, 		0,				0,				3,				50,				2, 			120, 		0,			0, 		1, 			1, 			50,		'[ICON_RES_JFD_MAIZE]',			12, 			'JFD_EXPLORATION_RESOURCE_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);	

INSERT OR REPLACE INTO Resources 
		(Type,						TechReveal,					TechCityTrade, 				Description,						Civilopedia, 									Help,										ResourceClassType, 			ArtDefineTag, 							OnlyMinorCivs,  Happiness,  PlacementOrder, ConstAppearance, 	AITradeModifier, 	RandApp1,	RandApp2, 	ResourceUsage,	AIObjective,	MinAreaSize, 	MaxLatitude, 	'Unique', 	TilesPer, 	Lakes, 		Hills, 	FlatLands, 	Normalize, 	Player, IconString, 					PortraitIndex, 	IconAtlas)
SELECT	'RESOURCE_JFD_MANUSCRIPTS',	NULL,						NULL,						'TXT_KEY_RESOURCE_JFD_MANUSCRIPTS',	'TXT_KEY_CIV5_RESOURCE_JFD_MANUSCRIPTS_TEXT',	'TXT_KEY_RESOURCE_JFD_MANUSCRIPTS_HELP',	'RESOURCECLASS_LUXURY',		'ART_DEF_RESOURCE_JFD_MANUSCRIPTS',		1,				4,			3,				50,					10,					25, 		25, 		2,				0,				1500,			90,				2, 			0, 			0,			0, 		1, 			1, 			67,		'[ICON_RES_JFD_MANUSCRIPTS]',	11, 			'JFD_EXPLORATION_RESOURCE_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);	

INSERT OR REPLACE INTO Resources 
		(Type,						TechReveal,					TechCityTrade, 				Description,						Civilopedia, 									Help,										ResourceClassType, 			ArtDefineTag, 							OnlyMinorCivs,  Happiness,  PlacementOrder, ConstAppearance, 	AITradeModifier, 	RandApp1,	RandApp2, 	ResourceUsage,	AIObjective,	MinAreaSize, 	MaxLatitude, 	'Unique', 	TilesPer, 	Lakes, 		Hills, 	FlatLands, 	Normalize, 	Player, IconString, 					PortraitIndex, 	IconAtlas)
SELECT	'RESOURCE_JFD_OAK',			NULL,						'TECH_CONSTRUCTION',		'TXT_KEY_RESOURCE_JFD_OAK',			'TXT_KEY_CIV5_RESOURCE_JFD_OAK_TEXT',			NULL,										'RESOURCECLASS_BONUS',		'ART_DEF_RESOURCE_JFD_OAK',				0,				0,			4,				25,					0,					15, 		15, 		0,				0,				3,				50,				2, 			120, 		0,			0, 		1, 			1, 			50,		'[ICON_RES_JFD_OAK]',			3, 				'JFD_EXPLORATION_RESOURCE_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);	

INSERT OR REPLACE INTO Resources 
		(Type,						TechReveal,					TechCityTrade, 				Description,						Civilopedia, 									Help,										ResourceClassType, 			ArtDefineTag, 							OnlyMinorCivs,  Happiness,  PlacementOrder, ConstAppearance, 	AITradeModifier, 	RandApp1,	RandApp2, 	ResourceUsage,	AIObjective,	MinAreaSize, 	MaxLatitude, 	'Unique', 	TilesPer, 	Lakes, 		Hills, 	FlatLands, 	Normalize, 	Player, IconString, 					PortraitIndex, 	IconAtlas)
SELECT	'RESOURCE_JFD_OBSIDIAN',	NULL,						'TECH_MINING',				'TXT_KEY_RESOURCE_JFD_OBSIDIAN',	'TXT_KEY_CIV5_RESOURCE_JFD_OBSIDIAN_TEXT',		NULL,										'RESOURCECLASS_LUXURY',		'ART_DEF_RESOURCE_JFD_OBSIDIAN',		0,				4,			4,				25,					10,					15, 		15, 		2,				0,				3,				50,				2, 			120, 		0,			0, 		1, 			1, 			50,		'[ICON_RES_JFD_OBSIDIAN]',		10, 			'JFD_EXPLORATION_RESOURCE_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);	

INSERT OR REPLACE INTO Resources 
		(Type,						TechReveal,					TechCityTrade, 				Description,						Civilopedia, 									Help,										ResourceClassType, 			ArtDefineTag, 							OnlyMinorCivs,  Happiness,  PlacementOrder, ConstAppearance, 	AITradeModifier, 	RandApp1,	RandApp2, 	ResourceUsage,	AIObjective,	MinAreaSize, 	MaxLatitude, 	'Unique', 	TilesPer, 	Lakes, 		Hills, 	FlatLands, 	Normalize, 	Player, IconString, 					PortraitIndex, 	IconAtlas)
SELECT	'RESOURCE_JFD_OPIUM',		NULL,						'TECH_CALENDAR',			'TXT_KEY_RESOURCE_JFD_OPIUM',		'TXT_KEY_CIV5_RESOURCE_JFD_OPIUM_TEXT',			NULL,										'RESOURCECLASS_LUXURY',		'ART_DEF_RESOURCE_JFD_OPIUM',			0,				4,			4,				30,					10,					10, 		10, 		2,				0,				3,				50,				2, 			60, 		0,			0, 		1, 			1, 			50,		'[ICON_RES_JFD_OPIUM]',			0, 				'JFD_EXPLORATION_RESOURCE_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);	

INSERT OR REPLACE INTO Resources 
		(Type,						TechReveal,					TechCityTrade, 				Description,						Civilopedia, 									Help,										ResourceClassType, 			ArtDefineTag, 							OnlyMinorCivs,  Happiness,  PlacementOrder, ConstAppearance, 	AITradeModifier, 	RandApp1,	RandApp2, 	ResourceUsage,	AIObjective,	MinAreaSize, 	MaxLatitude, 	'Unique', 	TilesPer, 	Rivers, 	Hills, 	FlatLands, 	Normalize, 	Player, IconString, 					PortraitIndex, 	IconAtlas)
SELECT	'RESOURCE_JFD_RICE',		NULL,						'TECH_AGRICULTURE',			'TXT_KEY_RESOURCE_JFD_RICE',		'TXT_KEY_CIV5_RESOURCE_JFD_RICE_TEXT',			NULL,										'RESOURCECLASS_BONUS',		'ART_DEF_RESOURCE_JFD_RICE',			0,				0,			4,				25,					0,					15, 		15, 		0,				0,				3,				50,				2, 			120, 		1,			0, 		1, 			1, 			50,		'[ICON_RES_JFD_RICE]',			13, 			'JFD_EXPLORATION_RESOURCE_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);	

INSERT OR REPLACE INTO Resources 
		(Type,						TechReveal,					TechCityTrade, 				Description,						Civilopedia, 									Help,										ResourceClassType, 			ArtDefineTag, 							OnlyMinorCivs,  Happiness,  PlacementOrder, ConstAppearance, 	AITradeModifier, 	RandApp1,	RandApp2, 	ResourceUsage,	AIObjective,	MinAreaSize, 	MaxLatitude, 	'Unique', 	TilesPer, 	Lakes, 		Hills, 	FlatLands, 	Normalize, 	Player, IconString, 					PortraitIndex, 	IconAtlas)
SELECT	'RESOURCE_JFD_RUBBER',		'TECH_INDUSTRIALIZATION',	'TECH_INDUSTRIALIZATION',	'TXT_KEY_RESOURCE_JFD_RUBBER',		'TXT_KEY_CIV5_RESOURCE_JFD_RUBBER_TEXT',		NULL,										'RESOURCECLASS_BONUS',		'ART_DEF_RESOURCE_JFD_RUBBER',			0,				0,			4,				30,					0,					10, 		10, 		0,				0,				3,				50,				2, 			60, 		0,			0, 		1, 			1, 			50,		'[ICON_RES_JFD_RUBBER]',		8, 				'JFD_EXPLORATION_RESOURCE_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);	

INSERT OR REPLACE INTO Resources 
		(Type,						TechReveal,					TechCityTrade, 				Description,						Civilopedia, 									Help,										ResourceClassType, 			ArtDefineTag, 							OnlyMinorCivs,  Happiness,  PlacementOrder, ConstAppearance, 	AITradeModifier, 	RandApp1,	RandApp2, 	ResourceUsage,	AIObjective,	MinAreaSize, 	MaxLatitude, 	'Unique', 	TilesPer, 	Lakes, 		Hills, 	FlatLands, 	Normalize, 	Player, IconString, 					PortraitIndex, 	IconAtlas)
SELECT	'RESOURCE_JFD_SAFFRON',		NULL,						'TECH_CALENDAR',			'TXT_KEY_RESOURCE_JFD_SAFFRON',		'TXT_KEY_CIV5_RESOURCE_JFD_SAFFRON_TEXT',		NULL,										'RESOURCECLASS_LUXURY',		'ART_DEF_RESOURCE_JFD_SAFFRON',			0,				4,			4,				10,					20, 				20, 		10, 		2, 				0, 				3, 				50, 			2,			120,		0,			0,		1,			1,			50,		'[ICON_RES_JFD_SAFFRON]',		5, 				'JFD_EXPLORATION_RESOURCE_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);	

INSERT OR REPLACE INTO Resources 
		(Type,						TechReveal,					TechCityTrade, 				Description,						Civilopedia, 									Help,										ResourceClassType, 			ArtDefineTag, 							OnlyMinorCivs,  Happiness,  PlacementOrder, ConstAppearance, 	AITradeModifier, 	RandApp1,	RandApp2, 	ResourceUsage,	AIObjective,	MinAreaSize, 	MaxLatitude, 	'Unique', 	TilesPer, 	Lakes, 		Hills, 	FlatLands, 	Normalize, 	Player, IconString, 					PortraitIndex, 	IconAtlas)
SELECT	'RESOURCE_JFD_SULFUR',		'TECH_PHYSICS',				'TECH_PHYSICS',				'TXT_KEY_RESOURCE_JFD_SULFUR',		'TXT_KEY_CIV5_RESOURCE_JFD_SULFUR_TEXT',		NULL,										'RESOURCECLASS_BONUS',		'ART_DEF_RESOURCE_JFD_SULFUR',			0,				0,			3,				40,					0,					15, 		15, 		0,				0,				3,				90,				2, 			60, 		0,			1, 		0, 			1, 			30,		'[ICON_RES_JFD_SULFUR]',		9, 				'JFD_EXPLORATION_RESOURCE_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);	

INSERT OR REPLACE INTO Resources 
		(Type,						TechReveal,					TechCityTrade, 				Description,						Civilopedia, 									Help,										ResourceClassType, 			ArtDefineTag, 							OnlyMinorCivs,  Happiness,  PlacementOrder, ConstAppearance, 	AITradeModifier, 	RandApp1,	RandApp2, 	ResourceUsage,	AIObjective,	MinAreaSize, 	MaxLatitude, 	'Unique', 	TilesPer, 	Lakes, 		Hills, 	FlatLands, 	Normalize, 	Player, IconString, 					PortraitIndex, 	IconAtlas)
SELECT	'RESOURCE_JFD_VANILLA',		NULL,						'TECH_CALENDAR',			'TXT_KEY_RESOURCE_JFD_VANILLA',		'TXT_KEY_CIV5_RESOURCE_JFD_VANILLA_TEXT',		NULL,										'RESOURCECLASS_LUXURY',		'ART_DEF_RESOURCE_JFD_VANILLA',			0,				4,			4,				30,					10,					10, 		10, 		2,				0,				3,				50,				2, 			60, 		0,			0, 		1, 			1, 			50,		'[ICON_RES_JFD_VANILLA]',		1, 				'JFD_EXPLORATION_RESOURCE_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);

UPDATE Resources
SET Description = 'TXT_KEY_RESOURCE_JFD_CINNAMON', Civilopedia = 'TXT_KEY_CIV5_RESOURCE_JFD_CINNAMON_TEXT'
WHERE Type = 'RESOURCE_SPICES'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_CHANGES_SPICES' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_YieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Resource_YieldChanges 	
		(ResourceType, 					YieldType, 					Yield)
SELECT	'RESOURCE_BANANA',				'YIELD_PRODUCTION',			1	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_CHANGES_BANANA' AND Value = 1);

INSERT INTO Resource_YieldChanges 	
		(ResourceType, 					YieldType, 					Yield)
SELECT	Type,							'YIELD_PRODUCTION',			1	
FROM Resources WHERE Type IN ('RESOURCE_JFD_CEDAR', 'RESOURCE_JFD_OAK', 'RESOURCE_JFD_RUBBER', 'RESOURCE_JFD_SULFUR')		
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);

INSERT INTO Resource_YieldChanges 	
		(ResourceType, 					YieldType, 					Yield)
SELECT	'RESOURCE_JFD_FEATHERS',		'YIELD_CULTURE',			1			
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_COMMUNITY_BALANCE_PATCH' AND Value = 0);

INSERT INTO Resource_YieldChanges 	
		(ResourceType, 					YieldType, 					Yield)
SELECT	'RESOURCE_JFD_GINGER',			YieldType, 					Yield
FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_COCOA'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);

INSERT INTO Resource_YieldChanges 	
		(ResourceType, 					YieldType, 					Yield)
SELECT	'RESOURCE_JFD_LOTUS',			'YIELD_FAITH',				1			
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);

INSERT INTO Resource_YieldChanges 	
		(ResourceType, 					YieldType, 					Yield)
SELECT	'RESOURCE_JFD_MAIZE',			YieldType, 					Yield
FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_WHEAT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);

INSERT INTO Resource_YieldChanges 	
		(ResourceType, 					YieldType, 					Yield)
SELECT	Type,							'YIELD_FAITH',				1	
FROM Resources WHERE Type IN ('RESOURCE_JFD_OBSIDIAN', 'RESOURCE_JFD_SAFFRON')			
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);

INSERT INTO Resource_YieldChanges 	
		(ResourceType, 					YieldType, 					Yield)
SELECT	'RESOURCE_JFD_OPIUM',			YieldType, 					Yield
FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_DYE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);

INSERT INTO Resource_YieldChanges 	
		(ResourceType, 					YieldType, 					Yield)
SELECT	'RESOURCE_JFD_RICE',			YieldType, 					Yield
FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_WHEAT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);

INSERT INTO Resource_YieldChanges 	
		(ResourceType, 					YieldType, 					Yield)
SELECT	'RESOURCE_JFD_SAFFRON',			'YIELD_FOOD',				1			
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);

INSERT INTO Resource_YieldChanges 	
		(ResourceType, 					YieldType, 					Yield)
SELECT	'RESOURCE_JFD_VANILLA',			YieldType, 					Yield
FROM Resource_YieldChanges WHERE ResourceType = 'RESOURCE_SPICES'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);

INSERT INTO Resource_YieldChanges 	
		(ResourceType, 					YieldType, 					Yield)
SELECT	Type,							'YIELD_GOLD',				1		
FROM Resources WHERE Type IN ('RESOURCE_JFD_RUBBER', 'RESOURCE_JFD_SULFUR')	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Resource_Flavors 	
		(ResourceType, 					FlavorType, 				Flavor)
SELECT	Type,							'FLAVOR_PRODUCTION',		10
FROM Resources WHERE Type IN ('RESOURCE_JFD_CEDAR', 'RESOURCE_JFD_OAK', 'RESOURCE_JFD_RUBBER', 'RESOURCE_JFD_SULFUR');

INSERT INTO Resource_Flavors 	
		(ResourceType, 					FlavorType, 				Flavor)
SELECT	Type,							'FLAVOR_HAPPINESS',			10
FROM Resources WHERE Type IN ('RESOURCE_JFD_FEATHERS', 'RESOURCE_JFD_GINGER', 'RESOURCE_JFD_MANUSCRIPTS', 'RESOURCE_JFD_OBSIDIAN', 'RESOURCE_JFD_OPIUM', 'RESOURCE_JFD_CEDAR', 'RESOURCE_JFD_SAFFRON', 'RESOURCE_JFD_VANILLA');

INSERT INTO Resource_Flavors 	
		(ResourceType, 					FlavorType, 				Flavor)
SELECT	Type,							'FLAVOR_GROWTH',			20
FROM Resources WHERE Type IN ('RESOURCE_JFD_RICE', 'RESOURCE_JFD_MAIZE');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_TerrainBooleans
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Resource_TerrainBooleans 	
		(ResourceType, 					TerrainType)
SELECT	Type,							'TERRAIN_PLAINS'		
FROM Resources WHERE Type IN ('RESOURCE_JFD_GINGER', 'RESOURCE_JFD_OPIUM', 'RESOURCE_JFD_SULFUR', 'RESOURCE_JFD_RICE', 'RESOURCE_JFD_MAIZE');

INSERT INTO Resource_TerrainBooleans 	
		(ResourceType, 					TerrainType)
SELECT	Type,							'TERRAIN_COAST'		
FROM Resources WHERE Type IN ('RESOURCE_JFD_LOTUS');

INSERT INTO Resource_TerrainBooleans 	
		(ResourceType, 					TerrainType)
SELECT	Type,							'TERRAIN_DESERT'		
FROM Resources WHERE Type IN ('RESOURCE_JFD_OPIUM');

INSERT INTO Resource_TerrainBooleans 	
		(ResourceType, 					TerrainType)
SELECT	Type,							'TERRAIN_GRASS'		
FROM Resources WHERE Type IN ('RESOURCE_JFD_GINGER', 'RESOURCE_JFD_SAFFRON', 'RESOURCE_JFD_SULFUR', 'RESOURCE_JFD_RICE', 'RESOURCE_JFD_MAIZE');

INSERT INTO Resource_TerrainBooleans 	
		(ResourceType, 					TerrainType)
SELECT	Type,							'TERRAIN_TUNDRA'		
FROM Resources WHERE Type IN ('RESOURCE_JFD_SULFUR');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_FeatureBooleans
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Resource_FeatureBooleans 	
		(ResourceType, 					FeatureType)
SELECT	Type,							'FEATURE_FOREST'		
FROM Resources WHERE Type IN ('RESOURCE_JFD_CEDAR', 'RESOURCE_JFD_OAK');

INSERT INTO Resource_FeatureBooleans 	
		(ResourceType, 					FeatureType)
SELECT	Type,							'FEATURE_JUNGLE'		
FROM Resources WHERE Type IN ('RESOURCE_JFD_FEATHERS', 'RESOURCE_JFD_OBSIDIAN', 'RESOURCE_JFD_RUBBER', 'RESOURCE_JFD_VANILLA');

INSERT INTO Resource_FeatureBooleans 	
		(ResourceType, 					FeatureType)
SELECT	'RESOURCE_JFD_RICE',			Type
FROM Features WHERE Type IN ('FEATURE_MARSH', 'FEATURE_FLOOD_PLAINS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Resource_FeatureTerrainBooleans
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Resource_FeatureTerrainBooleans 	
		(ResourceType, 					TerrainType)
SELECT	Type,							'TERRAIN_GRASS'		
FROM Resources WHERE Type IN ('RESOURCE_JFD_CEDAR', 'RESOURCE_JFD_OAK');

INSERT INTO Resource_FeatureTerrainBooleans 	
		(ResourceType, 					TerrainType)
SELECT	Type,							'TERRAIN_PLAINS'		
FROM Resources WHERE Type IN ('RESOURCE_JFD_CEDAR', 'RESOURCE_JFD_OAK');

INSERT INTO Resource_FeatureTerrainBooleans 	
		(ResourceType, 					TerrainType)
SELECT	Type,							'TERRAIN_PLAINS'		
FROM Resources WHERE Type IN ('RESOURCE_JFD_FEATHERS', 'RESOURCE_JFD_OBSIDIAN', 'RESOURCE_JFD_RUBBER', 'RESOURCE_JFD_VANILLA');

INSERT INTO Resource_FeatureTerrainBooleans 	
		(ResourceType, 					TerrainType)
SELECT	Type,							'TERRAIN_DESERT'		
FROM Resources WHERE Type IN ('RESOURCE_JFD_RICE');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_JFD_RarityMods
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Resource_JFD_RarityMods 	
		(ResourceType, 					RarityMod)
SELECT	Type,							2
FROM Resources WHERE Type IN ('RESOURCE_JFD_RICE', 'RESOURCE_JFD_MAIZE');

INSERT INTO Resource_JFD_RarityMods 	
		(ResourceType, 					RarityMod)
SELECT	Type,							3
FROM Resources WHERE Type IN ('RESOURCE_JFD_CEDAR', 'RESOURCE_JFD_GINGER', 'RESOURCE_JFD_OAK', 'RESOURCE_JFD_OBSIDIAN', 'RESOURCE_JFD_OPIUM', 'RESOURCE_JFD_RUBBER', 'RESOURCE_JFD_SAFFRON', 'RESOURCE_JFD_VANILLA');

INSERT INTO Resource_JFD_RarityMods 	
		(ResourceType, 					RarityMod)
SELECT	Type,							4
FROM Resources WHERE Type IN ('RESOURCE_JFD_FEATHERS', 'RESOURCE_JFD_LOTUS', 'RESOURCE_JFD_SULFUR');
--==========================================================================================================================
-- RESOURCE REGION EXCLUDES
--==========================================================================================================================
-- Resource_AegeanRegionExclude
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AegeanRegionExclude(Type, Resource);
INSERT INTO Resource_AegeanRegionExclude
		(Type,				Resource)
VALUES	('GREECE',			'RESOURCE_JFD_CEDAR'),
		('GREECE',			'RESOURCE_JFD_FEATHERS'),
		('GREECE',			'RESOURCE_JFD_GINGER'),
		('GREECE',			'RESOURCE_JFD_LOTUS'),
		('GREECE',			'RESOURCE_JFD_MAIZE'),
		('GREECE',			'RESOURCE_JFD_OBSIDIAN'),
		('GREECE',			'RESOURCE_JFD_OPIUM'),
		('GREECE',			'RESOURCE_JFD_RICE'),
		('GREECE',			'RESOURCE_JFD_RUBBER'),
		('GREECE',			'RESOURCE_JFD_SULFUR'),
		('GREECE',			'RESOURCE_JFD_VANILLA'),
		('TURKEY',			'RESOURCE_JFD_FEATHERS'),
		('TURKEY',			'RESOURCE_JFD_GINGER'),
		('TURKEY',			'RESOURCE_JFD_LOTUS'),
		('TURKEY',			'RESOURCE_JFD_MAIZE'),
		('TURKEY',			'RESOURCE_JFD_OBSIDIAN'),
		('TURKEY',			'RESOURCE_JFD_OPIUM'),
		('TURKEY',			'RESOURCE_JFD_RICE'),
		('TURKEY',			'RESOURCE_JFD_RUBBER'),
		('TURKEY',			'RESOURCE_JFD_SULFUR'),
		('TURKEY',			'RESOURCE_JFD_VANILLA');	
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AfricaLargeRegionExclude (Africa)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AfricaLargeRegionExclude(Type, Resource);
INSERT INTO Resource_AfricaLargeRegionExclude
		(Type,				Resource)
VALUES	('AFRICA',			'RESOURCE_JFD_GINGER'),	
		('AFRICA',			'RESOURCE_JFD_MAIZE'),
		('AFRICA',			'RESOURCE_JFD_OPIUM'),			
		('AFRICA',			'RESOURCE_JFD_RICE'),
		('AFRICA',			'RESOURCE_JFD_SULFUR');			
--------------------------------------------------------------------------------------------------------------------------
-- Resource_AmericasRegionExclude (Americas)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_AmericasRegionExclude(Type, Resource);
INSERT INTO Resource_AmericasRegionExclude
		(Type,				Resource)
VALUES	('SOUTH_AMERICA',	'RESOURCE_JFD_LOTUS'),
		('SOUTH_AMERICA',	'RESOURCE_JFD_RICE'),
		('NORTH_AMERICA',	'RESOURCE_JFD_LOTUS'),
		('NORTH_AMERICA',	'RESOURCE_JFD_RICE');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_ApennineRegionExclude (Apennine)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_ApennineRegionExclude(Type, Resource);
INSERT INTO Resource_ApennineRegionExclude
		(Type,				Resource)
VALUES	('APENNINE',		'RESOURCE_JFD_CEDAR'),
		('APENNINE',		'RESOURCE_JFD_FEATHERS'),
		('APENNINE',		'RESOURCE_JFD_MAIZE'),
		('APENNINE',		'RESOURCE_JFD_OBSIDIAN'),
		('APENNINE',		'RESOURCE_JFD_RICE'),
		('APENNINE',		'RESOURCE_JFD_VANILLA'),
		('BALKANS',			'RESOURCE_JFD_CEDAR'),
		('BALKANS',			'RESOURCE_JFD_FEATHERS'),
		('BALKANS',			'RESOURCE_JFD_MAIZE'),
		('BALKANS',			'RESOURCE_JFD_OBSIDIAN'),
		('BALKANS',			'RESOURCE_JFD_RICE'),
		('BALKANS',			'RESOURCE_JFD_VANILLA'),
		('ITALY',			'RESOURCE_JFD_LOTUS'),
		('ITALY',			'RESOURCE_JFD_MAIZE'),
		('ITALY',			'RESOURCE_JFD_OPIUM'),
		('ITALY',			'RESOURCE_JFD_RICE'),
		('ITALY',			'RESOURCE_JFD_RUBBER');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_BritishIslesRegionExclude (British Isles)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_BritishIslesRegionExclude(Type, Resource);
INSERT INTO Resource_BritishIslesRegionExclude
		(Type,				Resource)
VALUES	('BRITISH_ISLES',	'RESOURCE_JFD_FEATHERS'),
		('BRITISH_ISLES',	'RESOURCE_JFD_LOTUS'),
		('BRITISH_ISLES',	'RESOURCE_JFD_MAIZE'),
		('BRITISH_ISLES',	'RESOURCE_JFD_OBSIDIAN'),
		('BRITISH_ISLES',	'RESOURCE_JFD_OPIUM'),
		('BRITISH_ISLES',	'RESOURCE_JFD_RICE'),
		('BRITISH_ISLES',	'RESOURCE_JFD_VANILLA');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_CaribbeanRegionExclude (Caribbean)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_CaribbeanRegionExclude(Type, Resource);
INSERT INTO Resource_CaribbeanRegionExclude
		(Type,				Resource)
VALUES	('CARIBBEAN',		'RESOURCE_JFD_LOTUS'),
		('CARIBBEAN',		'RESOURCE_JFD_MAIZE'),
		('CARIBBEAN',		'RESOURCE_JFD_RICE');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_MediterraneanRegionExclude (Mediterranean)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_MediterraneanRegionExclude(Type, Resource);
INSERT INTO Resource_MediterraneanRegionExclude
		(Type,				Resource)
VALUES	('EUROPE',			'RESOURCE_JFD_RICE'),
		('EUROPE',			'RESOURCE_JFD_MAIZE'),
		('EUROPE',			'RESOURCE_JFD_FEATHERS'),
		('EUROPE',			'RESOURCE_JFD_LOTUS'),
		('EUROPE',			'RESOURCE_JFD_OBSIDIAN'),
		('EUROPE',			'RESOURCE_JFD_OPIUM'),
		('EUROPE',			'RESOURCE_JFD_RUBBER'),
		('EUROPE',			'RESOURCE_JFD_VANILLA'),
		('AFRICA',			'RESOURCE_JFD_RICE'),
		('AFRICA',			'RESOURCE_JFD_MAIZE'),
		('AFRICA',			'RESOURCE_JFD_LOTUS'),
		('AFRICA',			'RESOURCE_JFD_OPIUM');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_MesopotamiaRegionExclude (Mesopotamia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_MesopotamiaRegionExclude(Type, Resource);
INSERT INTO Resource_MesopotamiaRegionExclude
		(Type,				Resource)
VALUES	('MESOPOTAMIA',		'RESOURCE_JFD_FEATHERS'),
		('MESOPOTAMIA',		'RESOURCE_JFD_LOTUS'),
		('MESOPOTAMIA',		'RESOURCE_JFD_MAIZE'),
		('MESOPOTAMIA',		'RESOURCE_JFD_OBSIDIAN'),
		('MESOPOTAMIA',		'RESOURCE_JFD_OPIUM'),
		('MESOPOTAMIA',		'RESOURCE_JFD_RICE'),
		('MESOPOTAMIA',		'RESOURCE_JFD_RUBBER'),
		('MESOPOTAMIA',		'RESOURCE_JFD_VANILLA');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NileValleyRegionExclude (Nile Valley)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NileValleyRegionExclude(Type, Resource);
INSERT INTO Resource_NileValleyRegionExclude
		(Type,				Resource)
VALUES	('NILE_VALLEY',		'RESOURCE_JFD_MAIZE'),
		('NILE_VALLEY',		'RESOURCE_JFD_OBSIDIAN'),
		('NILE_VALLEY',		'RESOURCE_JFD_OPIUM'),
		('NILE_VALLEY',		'RESOURCE_JFD_RICE'),
		('NILE_VALLEY',		'RESOURCE_JFD_SAFFRON'),
		('NILE_VALLEY',		'RESOURCE_JFD_VANILLA');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NorthAtlanticRegionExclude (North Atlantic)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NorthAtlanticRegionExclude(Type, Resource);
INSERT INTO Resource_NorthAtlanticRegionExclude
		(Type,				Resource)
VALUES	('AMERICA',			'RESOURCE_JFD_LOTUS'),
		('AMERICA',			'RESOURCE_JFD_MAIZE'),
		('EUROPE',			'RESOURCE_JFD_FEATHERS'),
		('EUROPE',			'RESOURCE_JFD_LOTUS'),
		('EUROPE',			'RESOURCE_JFD_MAIZE'),
		('EUROPE',			'RESOURCE_JFD_OBSIDIAN'),
		('EUROPE',			'RESOURCE_JFD_OPIUM'),
		('EUROPE',			'RESOURCE_JFD_RICE'),
		('EUROPE',			'RESOURCE_JFD_VANILLA');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NorthEastAsiaRegionExclude (North-East Asia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NorthEastAsiaRegionExclude(Type, Resource);
INSERT INTO Resource_NorthEastAsiaRegionExclude
		(Type,				Resource)
VALUES	('ASIA',			'RESOURCE_COCOA'),
		('ASIA',			'RESOURCE_BISON'),
		('ASIA',			'RESOURCE_FUR'),
		('ASIA',			'RESOURCE_INCENSE'),
		('ASIA',			'RESOURCE_JFD_MAIZE'),
		('ASIA',			'RESOURCE_OLIVE'),
		('ASIA',			'RESOURCE_SUGAR'),
		('ASIA',			'RESOURCE_TOBACCO'),
		('ASIA',			'RESOURCE_TRUFFLES'),
		('ASIA',			'RESOURCE_WINE');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_NorthWestEuropeRegionExclude (North-West Europe)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_NorthWestEuropeRegionExclude(Type, Resource);
INSERT INTO Resource_NorthWestEuropeRegionExclude
		(Type,				Resource)
VALUES	('EUROPE',			'RESOURCE_JFD_FEATHERS'),
		('EUROPE',			'RESOURCE_JFD_LOTUS'),
		('EUROPE',			'RESOURCE_JFD_MAIZE'),
		('EUROPE',			'RESOURCE_JFD_OBSIDIAN'),
		('EUROPE',			'RESOURCE_JFD_OPIUM'),
		('EUROPE',			'RESOURCE_JFD_RICE'),
		('EUROPE',			'RESOURCE_JFD_VANILLA'),
		('EUROPE',			'RESOURCE_JFD_TRIBE_COMANCHE'),
		('EUROPE',			'RESOURCE_JFD_TRIBE_COSSACKS'),
		('EUROPE',			'RESOURCE_JFD_TRIBE_DOGON'),
		('EUROPE',			'RESOURCE_JFD_TRIBE_HURON'),
		('EUROPE',			'RESOURCE_JFD_TRIBE_ITZA'),
		('EUROPE',			'RESOURCE_JFD_TRIBE_KHOIKHOI'),
		('EUROPE',			'RESOURCE_JFD_TRIBE_KOGA'),
		('EUROPE',			'RESOURCE_JFD_TRIBE_KWAK'),
		('EUROPE',			'RESOURCE_JFD_TRIBE_QUIMBAYA'),
		('EUROPE',			'RESOURCE_JFD_TRIBE_SHAOLIN'),
		('EUROPE',			'RESOURCE_JFD_TRIBE_SUFI'),
		('EUROPE',			'RESOURCE_JFD_TRIBE_TARTARS'),
		('EUROPE',			'RESOURCE_JFD_TRIBE_TLAXCALA'),
		('EUROPE',			'RESOURCE_JFD_TRIBE_UDASI');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_PacificRegionExclude (Pacific)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_PacificRegionExclude(Type, Resource);
INSERT INTO Resource_PacificRegionExclude
		(Type,				Resource)
VALUES	('AMERICA',			'RESOURCE_JFD_LOTUS'),
		('AMERICA',			'RESOURCE_JFD_RICE'),
		('AMERICA',			'RESOURCE_JFD_TRIBE_COSSACKS'),
		('AMERICA',			'RESOURCE_JFD_TRIBE_DOGON'),
		('AMERICA',			'RESOURCE_JFD_TRIBE_KHOIKHOI'),
		('AMERICA',			'RESOURCE_JFD_TRIBE_KOGA'),
		('AMERICA',			'RESOURCE_JFD_TRIBE_QUIMBAYA'),
		('AMERICA',			'RESOURCE_JFD_TRIBE_SHAOLIN'),
		('AMERICA',			'RESOURCE_JFD_TRIBE_SUFI'),
		('AMERICA',			'RESOURCE_JFD_TRIBE_TARTARS'),
		('AMERICA',			'RESOURCE_JFD_TRIBE_UDASI');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_SouthPacificRegionExclude (South Pacific)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_SouthPacificRegionExclude(Type, Resource);
INSERT INTO Resource_SouthPacificRegionExclude
		(Type,				Resource)
VALUES	('SOUTH_PACIFIC',	'RESOURCE_JFD_LOTUS'),
		('SOUTH_PACIFIC',	'RESOURCE_JFD_MAIZE'),
		('SOUTH_PACIFIC',	'RESOURCE_JFD_OPIUM'),
		('SOUTH_PACIFIC',	'RESOURCE_JFD_RICE'),
		('SOUTH_PACIFIC',	'RESOURCE_JFD_RUBBER'),
		('SOUTH_PACIFIC',	'RESOURCE_JFD_VANILLA'),
		('SOUTH_PACIFIC',	'RESOURCE_JFD_TRIBE_COMANCHE'),
		('SOUTH_PACIFIC',	'RESOURCE_JFD_TRIBE_COSSACKS'),
		('SOUTH_PACIFIC',	'RESOURCE_JFD_TRIBE_DOGON'),
		('SOUTH_PACIFIC',	'RESOURCE_JFD_TRIBE_HURON'),
		('SOUTH_PACIFIC',	'RESOURCE_JFD_TRIBE_ITZA'),
		('SOUTH_PACIFIC',	'RESOURCE_JFD_TRIBE_KHOIKHOI'),
		('SOUTH_PACIFIC',	'RESOURCE_JFD_TRIBE_KOGA'),
		('SOUTH_PACIFIC',	'RESOURCE_JFD_TRIBE_KWAK'),
		('SOUTH_PACIFIC',	'RESOURCE_JFD_TRIBE_QUIMBAYA'),
		('SOUTH_PACIFIC',	'RESOURCE_JFD_TRIBE_SHAOLIN'),
		('SOUTH_PACIFIC',	'RESOURCE_JFD_TRIBE_SUFI'),
		('SOUTH_PACIFIC',	'RESOURCE_JFD_TRIBE_TARTARS'),
		('SOUTH_PACIFIC',	'RESOURCE_JFD_TRIBE_TLAXCALA'),
		('SOUTH_PACIFIC',	'RESOURCE_JFD_TRIBE_UDASI');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_YagemRegionExclude (Giant Earth)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_YagemRegionExclude(Type, Resource);
INSERT INTO Resource_YagemRegionExclude 
		(Type,					Resource)
VALUES	('NORTH_AMERICA',		'RESOURCE_JFD_CEDAR'),
		('CENTRAL_AMERICA',		'RESOURCE_JFD_CEDAR'),
		('SOUTH_AMERICA_WEST',	'RESOURCE_JFD_CEDAR'),
		('AUSTRALIA',			'RESOURCE_JFD_CEDAR'),
		('OCEANIA',				'RESOURCE_JFD_CEDAR'),
		('SOUTH_ASIA',			'RESOURCE_JFD_CEDAR'),
		('CENTRAL_ASIA',		'RESOURCE_JFD_CEDAR'),
		('EAST_ASIA',			'RESOURCE_JFD_CEDAR'),
		('NORTH_ASIA',			'RESOURCE_JFD_CEDAR'),
		('TURKEY',				'RESOURCE_JFD_CEDAR'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_CEDAR'),
		('WEST_EUROPA',			'RESOURCE_JFD_CEDAR'),
		('NORTH_EUROPA',		'RESOURCE_JFD_CEDAR'),
		('EAST_EUROPA',			'RESOURCE_JFD_CEDAR'),
		('WEST_EUROPA',			'RESOURCE_JFD_CEDAR'),
		('NORTH_AFRICA',		'RESOURCE_JFD_CEDAR'),
		('CENTRAL_AFRICA',		'RESOURCE_JFD_CEDAR'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_CEDAR'),
		('MADAGASCAR',			'RESOURCE_JFD_CEDAR'),
		('ARCTIC_AMERICA',		'RESOURCE_JFD_FEATHERS'),
		('NORTH_AMERICA',		'RESOURCE_JFD_FEATHERS'),
		('ANTARCTIC_AMERICA',	'RESOURCE_JFD_FEATHERS'),
		('AUSTRALIA',			'RESOURCE_JFD_FEATHERS'),
		('OCEANIA',				'RESOURCE_JFD_FEATHERS'),
		('SOUTH_ASIA',			'RESOURCE_JFD_FEATHERS'),
		('CENTRAL_ASIA',		'RESOURCE_JFD_FEATHERS'),
		('EAST_ASIA',			'RESOURCE_JFD_FEATHERS'),
		('NORTH_ASIA',			'RESOURCE_JFD_FEATHERS'),
		('MEDITERRANEAN',		'RESOURCE_JFD_FEATHERS'),
		('MIDDLE_EAST',			'RESOURCE_JFD_FEATHERS'),
		('TURKEY',				'RESOURCE_JFD_FEATHERS'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_FEATHERS'),
		('WEST_EUROPA',			'RESOURCE_JFD_FEATHERS'),
		('NORTH_EUROPA',		'RESOURCE_JFD_FEATHERS'),
		('EAST_EUROPA',			'RESOURCE_JFD_FEATHERS'),
		('CENTRAL_AFRICA',		'RESOURCE_JFD_FEATHERS'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_FEATHERS'),
		('MADAGASCAR',			'RESOURCE_JFD_FEATHERS'),
		('ARCTIC_AMERICA',		'RESOURCE_JFD_LOTUS'),
		('NORTH_AMERICA',		'RESOURCE_JFD_LOTUS'),
		('CENTRAL_AMERICA',		'RESOURCE_JFD_LOTUS'),
		('SOUTH_AMERICA_WEST',	'RESOURCE_JFD_LOTUS'),
		('SOUTH_AMERICA_EAST',	'RESOURCE_JFD_LOTUS'),
		('ANTARCTIC_AMERICA',	'RESOURCE_JFD_LOTUS'),
		('OCEANIA',				'RESOURCE_JFD_LOTUS'),
		('CENTRAL_ASIA',		'RESOURCE_JFD_LOTUS'),
		('TURKEY',				'RESOURCE_JFD_LOTUS'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_LOTUS'),
		('WEST_EUROPA',			'RESOURCE_JFD_LOTUS'),
		('NORTH_EUROPA',		'RESOURCE_JFD_LOTUS'),
		('EAST_EUROPA',			'RESOURCE_JFD_LOTUS'),
		('CENTRAL_AFRICA',		'RESOURCE_JFD_LOTUS'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_LOTUS'),
		('MADAGASCAR',			'RESOURCE_JFD_LOTUS'),
		('ARCTIC_AMERICA',		'RESOURCE_JFD_MAIZE'),
		('NORTH_AMERICA',		'RESOURCE_JFD_MAIZE'),
		('ANTARCTIC_AMERICA',	'RESOURCE_JFD_MAIZE'),
		('AUSTRALIA',			'RESOURCE_JFD_MAIZE'),
		('OCEANIA',				'RESOURCE_JFD_MAIZE'),
		('SOUTH_ASIA',			'RESOURCE_JFD_MAIZE'),
		('CENTRAL_ASIA',		'RESOURCE_JFD_MAIZE'),
		('EAST_ASIA',			'RESOURCE_JFD_MAIZE'),
		('NORTH_ASIA',			'RESOURCE_JFD_MAIZE'),
		('MEDITERRANEAN',		'RESOURCE_JFD_MAIZE'),
		('MIDDLE_EAST',			'RESOURCE_JFD_MAIZE'),
		('TURKEY',				'RESOURCE_JFD_MAIZE'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_MAIZE'),
		('WEST_EUROPA',			'RESOURCE_JFD_MAIZE'),
		('NORTH_EUROPA',		'RESOURCE_JFD_MAIZE'),
		('EAST_EUROPA',			'RESOURCE_JFD_MAIZE'),
		('CENTRAL_AFRICA',		'RESOURCE_JFD_MAIZE'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_MAIZE'),
		('MADAGASCAR',			'RESOURCE_JFD_MAIZE'),		
		('ARCTIC_AMERICA',		'RESOURCE_JFD_CEDAR'),
		('ARCTIC_AMERICA',		'RESOURCE_JFD_OAK'),
		('CENTRAL_AMERICA',		'RESOURCE_JFD_OAK'),
		('SOUTH_AMERICA_WEST',	'RESOURCE_JFD_OAK'),
		('SOUTH_AMERICA_EAST',	'RESOURCE_JFD_OAK'),
		('ANTARCTIC_AMERICA',	'RESOURCE_JFD_OAK'),
		('AUSTRALIA',			'RESOURCE_JFD_OAK'),
		('OCEANIA',				'RESOURCE_JFD_OAK'),
		('SOUTH_ASIA',			'RESOURCE_JFD_OAK'),
		('CENTRAL_ASIA',		'RESOURCE_JFD_OAK'),
		('EAST_ASIA',			'RESOURCE_JFD_OAK'),
		('MEDITERRANEAN',		'RESOURCE_JFD_OAK'),
		('MIDDLE_EAST',			'RESOURCE_JFD_OAK'),
		('TURKEY',				'RESOURCE_JFD_OAK'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_OAK'),
		('CENTRAL_AFRICA',		'RESOURCE_JFD_OAK'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_OAK'),
		('MADAGASCAR',			'RESOURCE_JFD_OAK'),
		('GROENLAND',			'RESOURCE_JFD_OBSIDIAN'),
		('ARCTIC_AMERICA',		'RESOURCE_JFD_OBSIDIAN'),
		('NORTH_AMERICA',		'RESOURCE_JFD_OBSIDIAN'),
		('AUSTRALIA',			'RESOURCE_JFD_OBSIDIAN'),
		('ANTARCTIC_AMERICA',	'RESOURCE_JFD_OBSIDIAN'),
		('SOUTH_ASIA',			'RESOURCE_JFD_OBSIDIAN'),
		('CENTRAL_ASIA',		'RESOURCE_JFD_OBSIDIAN'),
		('MIDDLE_EAST',			'RESOURCE_JFD_OBSIDIAN'),
		('TURKEY',				'RESOURCE_JFD_OBSIDIAN'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_OBSIDIAN'),
		('WEST_EUROPA',			'RESOURCE_JFD_OBSIDIAN'),
		('NORTH_EUROPA',		'RESOURCE_JFD_OBSIDIAN'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_OBSIDIAN'),
		('EAST_EUROPA',			'RESOURCE_JFD_OBSIDIAN'),
		('NORTH_AFRICA',		'RESOURCE_JFD_OBSIDIAN'),
		('CENTRAL_AFRICA',		'RESOURCE_JFD_OBSIDIAN'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_OBSIDIAN'),
		('MADAGASCAR',			'RESOURCE_JFD_OBSIDIAN'),
		('ARCTIC_AMERICA',		'RESOURCE_JFD_OPIUM'),
		('NORTH_AMERICA',		'RESOURCE_JFD_OPIUM'),
		('CENTRAL_AMERICA',		'RESOURCE_JFD_OPIUM'),
		('SOUTH_AMERICA_WEST',	'RESOURCE_JFD_OPIUM'),
		('SOUTH_AMERICA_EAST',	'RESOURCE_JFD_OPIUM'),
		('ANTARCTIC_AMERICA',	'RESOURCE_JFD_OPIUM'),
		('AUSTRALIA',			'RESOURCE_JFD_OPIUM'),
		('OCEANIA',				'RESOURCE_JFD_OPIUM'),
		('SOUTH_ASIA',			'RESOURCE_JFD_OPIUM'),
		('EAST_ASIA',			'RESOURCE_JFD_OPIUM'),
		('TURKEY',				'RESOURCE_JFD_OPIUM'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_OPIUM'),
		('WEST_EUROPA',			'RESOURCE_JFD_OPIUM'),
		('NORTH_EUROPA',		'RESOURCE_JFD_OPIUM'),
		('EAST_EUROPA',			'RESOURCE_JFD_OPIUM'),
		('CENTRAL_AFRICA',		'RESOURCE_JFD_OPIUM'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_OPIUM'),
		('MADAGASCAR',			'RESOURCE_JFD_OPIUM'),
		('ARCTIC_AMERICA',		'RESOURCE_JFD_RICE'),
		('NORTH_AMERICA',		'RESOURCE_JFD_RICE'),
		('CENTRAL_AMERICA',		'RESOURCE_JFD_RICE'),
		('SOUTH_AMERICA_WEST',	'RESOURCE_JFD_RICE'),
		('SOUTH_AMERICA_EAST',	'RESOURCE_JFD_RICE'),
		('ANTARCTIC_AMERICA',	'RESOURCE_JFD_RICE'),
		('OCEANIA',				'RESOURCE_JFD_RICE'),
		('CENTRAL_ASIA',		'RESOURCE_JFD_RICE'),
		('TURKEY',				'RESOURCE_JFD_RICE'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_RICE'),
		('WEST_EUROPA',			'RESOURCE_JFD_RICE'),
		('NORTH_EUROPA',		'RESOURCE_JFD_RICE'),
		('EAST_EUROPA',			'RESOURCE_JFD_RICE'),
		('CENTRAL_AFRICA',		'RESOURCE_JFD_RICE'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_RICE'),
		('MADAGASCAR',			'RESOURCE_JFD_RICE'),
		('ARCTIC_AMERICA',		'RESOURCE_JFD_RUBBER'),
		('NORTH_AMERICA',		'RESOURCE_JFD_RUBBER'),
		('SOUTH_AMERICA_WEST',	'RESOURCE_JFD_RUBBER'),
		('ANTARCTIC_AMERICA',	'RESOURCE_JFD_RUBBER'),
		('AUSTRALIA',			'RESOURCE_JFD_RUBBER'),
		('OCEANIA',				'RESOURCE_JFD_RUBBER'),
		('CENTRAL_ASIA',		'RESOURCE_JFD_RUBBER'),
		('NORTH_ASIA',			'RESOURCE_JFD_RUBBER'),
		('MEDITERRANEAN',		'RESOURCE_JFD_RUBBER'),
		('MIDDLE_EAST',			'RESOURCE_JFD_RUBBER'),
		('TURKEY',				'RESOURCE_JFD_RUBBER'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_RUBBER'),
		('WEST_EUROPA',			'RESOURCE_JFD_RUBBER'),
		('NORTH_EUROPA',		'RESOURCE_JFD_RUBBER'),
		('EAST_EUROPA',			'RESOURCE_JFD_RUBBER'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_RUBBER'),
		('MADAGASCAR',			'RESOURCE_JFD_RUBBER'),
		('GROENLAND',			'RESOURCE_JFD_SAFFRON'),
		('ARCTIC_AMERICA',		'RESOURCE_JFD_SAFFRON'),
		('NORTH_AMERICA',		'RESOURCE_JFD_SAFFRON'),
		('CENTRAL_AMERICA',		'RESOURCE_JFD_SAFFRON'),
		('SOUTH_AMERICA_WEST',	'RESOURCE_JFD_SAFFRON'),
		('SOUTH_AMERICA_EAST',	'RESOURCE_JFD_SAFFRON'),
		('ANTARCTIC_AMERICA',	'RESOURCE_JFD_SAFFRON'),
		('AUSTRALIA',			'RESOURCE_JFD_SAFFRON'),
		('OCEANIA',				'RESOURCE_JFD_SAFFRON'),
		('EAST_ASIA',			'RESOURCE_JFD_SAFFRON'),
		('NORTH_ASIA',			'RESOURCE_JFD_SAFFRON'),
		('SOUTH_ASIA',			'RESOURCE_JFD_SAFFRON'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_SAFFRON'),
		('WEST_EUROPA',			'RESOURCE_JFD_SAFFRON'),
		('NORTH_EUROPA',		'RESOURCE_JFD_SAFFRON'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_SAFFRON'),
		('EAST_EUROPA',			'RESOURCE_JFD_SAFFRON'),
		('NORTH_AFRICA',		'RESOURCE_JFD_SAFFRON'),
		('CENTRAL_AFRICA',		'RESOURCE_JFD_SAFFRON'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_SAFFRON'),
		('MADAGASCAR',			'RESOURCE_JFD_SAFFRON'),
		('ARCTIC_AMERICA',		'RESOURCE_JFD_VANILLA'),
		('NORTH_AMERICA',		'RESOURCE_JFD_VANILLA'),
		('ANTARCTIC_AMERICA',	'RESOURCE_JFD_VANILLA'),
		('AUSTRALIA',			'RESOURCE_JFD_VANILLA'),
		('OCEANIA',				'RESOURCE_JFD_VANILLA'),
		('SOUTH_ASIA',			'RESOURCE_JFD_VANILLA'),
		('CENTRAL_ASIA',		'RESOURCE_JFD_VANILLA'),
		('EAST_ASIA',			'RESOURCE_JFD_VANILLA'),
		('NORTH_ASIA',			'RESOURCE_JFD_VANILLA'),
		('MEDITERRANEAN',		'RESOURCE_JFD_VANILLA'),
		('MIDDLE_EAST',			'RESOURCE_JFD_VANILLA'),
		('TURKEY',				'RESOURCE_JFD_VANILLA'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_VANILLA'),
		('WEST_EUROPA',			'RESOURCE_JFD_VANILLA'),
		('NORTH_EUROPA',		'RESOURCE_JFD_VANILLA'),
		('EAST_EUROPA',			'RESOURCE_JFD_VANILLA'),
		('CENTRAL_AFRICA',		'RESOURCE_JFD_VANILLA'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_VANILLA'),
		('MADAGASCAR',			'RESOURCE_JFD_VANILLA');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_YahemRegionExclude (Huge Earth)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_YahemRegionExclude(Type, Resource);
INSERT INTO Resource_YahemRegionExclude 
		(Type,					Resource)
VALUES	('ARCTIC_AMERICA',		'RESOURCE_JFD_CEDAR'),
		('NORTH_AMERICA',		'RESOURCE_JFD_CEDAR'),
		('CENTRAL_AMERICA',		'RESOURCE_JFD_CEDAR'),
		('SOUTH_AMERICA_WEST',	'RESOURCE_JFD_CEDAR'),
		('AUSTRALIA',			'RESOURCE_JFD_CEDAR'),
		('OCEANIA',				'RESOURCE_JFD_CEDAR'),
		('SOUTH_ASIA',			'RESOURCE_JFD_CEDAR'),
		('CENTRAL_ASIA',		'RESOURCE_JFD_CEDAR'),
		('EAST_ASIA',			'RESOURCE_JFD_CEDAR'),
		('NORTH_ASIA',			'RESOURCE_JFD_CEDAR'),
		('TURKEY',				'RESOURCE_JFD_CEDAR'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_CEDAR'),
		('WEST_EUROPA',			'RESOURCE_JFD_CEDAR'),
		('NORTH_EUROPA',		'RESOURCE_JFD_CEDAR'),
		('EAST_EUROPA',			'RESOURCE_JFD_CEDAR'),
		('WEST_EUROPA',			'RESOURCE_JFD_CEDAR'),
		('NORTH_AFRICA',		'RESOURCE_JFD_CEDAR'),
		('CENTRAL_AFRICA',		'RESOURCE_JFD_CEDAR'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_CEDAR'),
		('MADAGASCAR',			'RESOURCE_JFD_CEDAR'),
		('ARCTIC_AMERICA',		'RESOURCE_JFD_FEATHERS'),
		('NORTH_AMERICA',		'RESOURCE_JFD_FEATHERS'),
		('ANTARCTIC_AMERICA',	'RESOURCE_JFD_FEATHERS'),
		('AUSTRALIA',			'RESOURCE_JFD_FEATHERS'),
		('OCEANIA',				'RESOURCE_JFD_FEATHERS'),
		('SOUTH_ASIA',			'RESOURCE_JFD_FEATHERS'),
		('CENTRAL_ASIA',		'RESOURCE_JFD_FEATHERS'),
		('EAST_ASIA',			'RESOURCE_JFD_FEATHERS'),
		('NORTH_ASIA',			'RESOURCE_JFD_FEATHERS'),
		('MEDITERRANEAN',		'RESOURCE_JFD_FEATHERS'),
		('MIDDLE_EAST',			'RESOURCE_JFD_FEATHERS'),
		('TURKEY',				'RESOURCE_JFD_FEATHERS'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_FEATHERS'),
		('WEST_EUROPA',			'RESOURCE_JFD_FEATHERS'),
		('NORTH_EUROPA',		'RESOURCE_JFD_FEATHERS'),
		('EAST_EUROPA',			'RESOURCE_JFD_FEATHERS'),
		('CENTRAL_AFRICA',		'RESOURCE_JFD_FEATHERS'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_FEATHERS'),
		('MADAGASCAR',			'RESOURCE_JFD_FEATHERS'),
		('ARCTIC_AMERICA',		'RESOURCE_JFD_LOTUS'),
		('NORTH_AMERICA',		'RESOURCE_JFD_LOTUS'),
		('CENTRAL_AMERICA',		'RESOURCE_JFD_LOTUS'),
		('SOUTH_AMERICA_WEST',	'RESOURCE_JFD_LOTUS'),
		('SOUTH_AMERICA_EAST',	'RESOURCE_JFD_LOTUS'),
		('ANTARCTIC_AMERICA',	'RESOURCE_JFD_LOTUS'),
		('OCEANIA',				'RESOURCE_JFD_LOTUS'),
		('CENTRAL_ASIA',		'RESOURCE_JFD_LOTUS'),
		('TURKEY',				'RESOURCE_JFD_LOTUS'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_LOTUS'),
		('WEST_EUROPA',			'RESOURCE_JFD_LOTUS'),
		('NORTH_EUROPA',		'RESOURCE_JFD_LOTUS'),
		('EAST_EUROPA',			'RESOURCE_JFD_LOTUS'),
		('CENTRAL_AFRICA',		'RESOURCE_JFD_LOTUS'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_LOTUS'),
		('MADAGASCAR',			'RESOURCE_JFD_LOTUS'),
		('ARCTIC_AMERICA',		'RESOURCE_JFD_MAIZE'),
		('NORTH_AMERICA',		'RESOURCE_JFD_MAIZE'),
		('ANTARCTIC_AMERICA',	'RESOURCE_JFD_MAIZE'),
		('AUSTRALIA',			'RESOURCE_JFD_MAIZE'),
		('OCEANIA',				'RESOURCE_JFD_MAIZE'),
		('SOUTH_ASIA',			'RESOURCE_JFD_MAIZE'),
		('CENTRAL_ASIA',		'RESOURCE_JFD_MAIZE'),
		('EAST_ASIA',			'RESOURCE_JFD_MAIZE'),
		('NORTH_ASIA',			'RESOURCE_JFD_MAIZE'),
		('MEDITERRANEAN',		'RESOURCE_JFD_MAIZE'),
		('MIDDLE_EAST',			'RESOURCE_JFD_MAIZE'),
		('TURKEY',				'RESOURCE_JFD_MAIZE'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_MAIZE'),
		('WEST_EUROPA',			'RESOURCE_JFD_MAIZE'),
		('NORTH_EUROPA',		'RESOURCE_JFD_MAIZE'),
		('EAST_EUROPA',			'RESOURCE_JFD_MAIZE'),
		('CENTRAL_AFRICA',		'RESOURCE_JFD_MAIZE'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_MAIZE'),
		('MADAGASCAR',			'RESOURCE_JFD_MAIZE'),
		('ARCTIC_AMERICA',		'RESOURCE_JFD_OAK'),
		('CENTRAL_AMERICA',		'RESOURCE_JFD_OAK'),
		('SOUTH_AMERICA_WEST',	'RESOURCE_JFD_OAK'),
		('SOUTH_AMERICA_EAST',	'RESOURCE_JFD_OAK'),
		('ANTARCTIC_AMERICA',	'RESOURCE_JFD_OAK'),
		('AUSTRALIA',			'RESOURCE_JFD_OAK'),
		('OCEANIA',				'RESOURCE_JFD_OAK'),
		('SOUTH_ASIA',			'RESOURCE_JFD_OAK'),
		('CENTRAL_ASIA',		'RESOURCE_JFD_OAK'),
		('EAST_ASIA',			'RESOURCE_JFD_OAK'),
		('MEDITERRANEAN',		'RESOURCE_JFD_OAK'),
		('MIDDLE_EAST',			'RESOURCE_JFD_OAK'),
		('TURKEY',				'RESOURCE_JFD_OAK'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_OAK'),
		('CENTRAL_AFRICA',		'RESOURCE_JFD_OAK'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_OAK'),
		('MADAGASCAR',			'RESOURCE_JFD_OAK'),
		('GROENLAND',			'RESOURCE_JFD_OBSIDIAN'),
		('ARCTIC_AMERICA',		'RESOURCE_JFD_OBSIDIAN'),
		('NORTH_AMERICA',		'RESOURCE_JFD_OBSIDIAN'),
		('AUSTRALIA',			'RESOURCE_JFD_OBSIDIAN'),
		('ANTARCTIC_AMERICA',	'RESOURCE_JFD_OBSIDIAN'),
		('SOUTH_ASIA',			'RESOURCE_JFD_OBSIDIAN'),
		('CENTRAL_ASIA',		'RESOURCE_JFD_OBSIDIAN'),
		('MIDDLE_EAST',			'RESOURCE_JFD_OBSIDIAN'),
		('TURKEY',				'RESOURCE_JFD_OBSIDIAN'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_OBSIDIAN'),
		('WEST_EUROPA',			'RESOURCE_JFD_OBSIDIAN'),
		('NORTH_EUROPA',		'RESOURCE_JFD_OBSIDIAN'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_OBSIDIAN'),
		('EAST_EUROPA',			'RESOURCE_JFD_OBSIDIAN'),
		('NORTH_AFRICA',		'RESOURCE_JFD_OBSIDIAN'),
		('CENTRAL_AFRICA',		'RESOURCE_JFD_OBSIDIAN'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_OBSIDIAN'),
		('MADAGASCAR',			'RESOURCE_JFD_OBSIDIAN'),
		('ARCTIC_AMERICA',		'RESOURCE_JFD_OPIUM'),
		('NORTH_AMERICA',		'RESOURCE_JFD_OPIUM'),
		('CENTRAL_AMERICA',		'RESOURCE_JFD_OPIUM'),
		('SOUTH_AMERICA_WEST',	'RESOURCE_JFD_OPIUM'),
		('SOUTH_AMERICA_EAST',	'RESOURCE_JFD_OPIUM'),
		('ANTARCTIC_AMERICA',	'RESOURCE_JFD_OPIUM'),
		('AUSTRALIA',			'RESOURCE_JFD_OPIUM'),
		('OCEANIA',				'RESOURCE_JFD_OPIUM'),
		('SOUTH_ASIA',			'RESOURCE_JFD_OPIUM'),
		('EAST_ASIA',			'RESOURCE_JFD_OPIUM'),
		('TURKEY',				'RESOURCE_JFD_OPIUM'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_OPIUM'),
		('WEST_EUROPA',			'RESOURCE_JFD_OPIUM'),
		('NORTH_EUROPA',		'RESOURCE_JFD_OPIUM'),
		('EAST_EUROPA',			'RESOURCE_JFD_OPIUM'),
		('CENTRAL_AFRICA',		'RESOURCE_JFD_OPIUM'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_OPIUM'),
		('MADAGASCAR',			'RESOURCE_JFD_OPIUM'),
		('ARCTIC_AMERICA',		'RESOURCE_JFD_RICE'),
		('NORTH_AMERICA',		'RESOURCE_JFD_RICE'),
		('CENTRAL_AMERICA',		'RESOURCE_JFD_RICE'),
		('SOUTH_AMERICA_WEST',	'RESOURCE_JFD_RICE'),
		('SOUTH_AMERICA_EAST',	'RESOURCE_JFD_RICE'),
		('ANTARCTIC_AMERICA',	'RESOURCE_JFD_RICE'),
		('OCEANIA',				'RESOURCE_JFD_RICE'),
		('CENTRAL_ASIA',		'RESOURCE_JFD_RICE'),
		('TURKEY',				'RESOURCE_JFD_RICE'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_RICE'),
		('WEST_EUROPA',			'RESOURCE_JFD_RICE'),
		('NORTH_EUROPA',		'RESOURCE_JFD_RICE'),
		('EAST_EUROPA',			'RESOURCE_JFD_RICE'),
		('CENTRAL_AFRICA',		'RESOURCE_JFD_RICE'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_RICE'),
		('MADAGASCAR',			'RESOURCE_JFD_RICE'),
		('ARCTIC_AMERICA',		'RESOURCE_JFD_RUBBER'),
		('NORTH_AMERICA',		'RESOURCE_JFD_RUBBER'),
		('SOUTH_AMERICA_WEST',	'RESOURCE_JFD_RUBBER'),
		('ANTARCTIC_AMERICA',	'RESOURCE_JFD_RUBBER'),
		('AUSTRALIA',			'RESOURCE_JFD_RUBBER'),
		('OCEANIA',				'RESOURCE_JFD_RUBBER'),
		('CENTRAL_ASIA',		'RESOURCE_JFD_RUBBER'),
		('NORTH_ASIA',			'RESOURCE_JFD_RUBBER'),
		('MEDITERRANEAN',		'RESOURCE_JFD_RUBBER'),
		('MIDDLE_EAST',			'RESOURCE_JFD_RUBBER'),
		('TURKEY',				'RESOURCE_JFD_RUBBER'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_RUBBER'),
		('WEST_EUROPA',			'RESOURCE_JFD_RUBBER'),
		('NORTH_EUROPA',		'RESOURCE_JFD_RUBBER'),
		('EAST_EUROPA',			'RESOURCE_JFD_RUBBER'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_RUBBER'),
		('MADAGASCAR',			'RESOURCE_JFD_RUBBER'),
		('GROENLAND',			'RESOURCE_JFD_SAFFRON'),
		('ARCTIC_AMERICA',		'RESOURCE_JFD_SAFFRON'),
		('NORTH_AMERICA',		'RESOURCE_JFD_SAFFRON'),
		('CENTRAL_AMERICA',		'RESOURCE_JFD_SAFFRON'),
		('SOUTH_AMERICA_WEST',	'RESOURCE_JFD_SAFFRON'),
		('SOUTH_AMERICA_EAST',	'RESOURCE_JFD_SAFFRON'),
		('ANTARCTIC_AMERICA',	'RESOURCE_JFD_SAFFRON'),
		('AUSTRALIA',			'RESOURCE_JFD_SAFFRON'),
		('OCEANIA',				'RESOURCE_JFD_SAFFRON'),
		('EAST_ASIA',			'RESOURCE_JFD_SAFFRON'),
		('NORTH_ASIA',			'RESOURCE_JFD_SAFFRON'),
		('SOUTH_ASIA',			'RESOURCE_JFD_SAFFRON'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_SAFFRON'),
		('WEST_EUROPA',			'RESOURCE_JFD_SAFFRON'),
		('NORTH_EUROPA',		'RESOURCE_JFD_SAFFRON'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_SAFFRON'),
		('EAST_EUROPA',			'RESOURCE_JFD_SAFFRON'),
		('NORTH_AFRICA',		'RESOURCE_JFD_SAFFRON'),
		('CENTRAL_AFRICA',		'RESOURCE_JFD_SAFFRON'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_SAFFRON'),
		('MADAGASCAR',			'RESOURCE_JFD_SAFFRON'),
		('ARCTIC_AMERICA',		'RESOURCE_JFD_VANILLA'),
		('NORTH_AMERICA',		'RESOURCE_JFD_VANILLA'),
		('ANTARCTIC_AMERICA',	'RESOURCE_JFD_VANILLA'),
		('AUSTRALIA',			'RESOURCE_JFD_VANILLA'),
		('OCEANIA',				'RESOURCE_JFD_VANILLA'),
		('SOUTH_ASIA',			'RESOURCE_JFD_VANILLA'),
		('CENTRAL_ASIA',		'RESOURCE_JFD_VANILLA'),
		('EAST_ASIA',			'RESOURCE_JFD_VANILLA'),
		('NORTH_ASIA',			'RESOURCE_JFD_VANILLA'),
		('MEDITERRANEAN',		'RESOURCE_JFD_VANILLA'),
		('MIDDLE_EAST',			'RESOURCE_JFD_VANILLA'),
		('TURKEY',				'RESOURCE_JFD_VANILLA'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_VANILLA'),
		('WEST_EUROPA',			'RESOURCE_JFD_VANILLA'),
		('NORTH_EUROPA',		'RESOURCE_JFD_VANILLA'),
		('EAST_EUROPA',			'RESOURCE_JFD_VANILLA'),
		('CENTRAL_AFRICA',		'RESOURCE_JFD_VANILLA'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_VANILLA'),
		('MADAGASCAR',			'RESOURCE_JFD_VANILLA');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_CordiformRegionExclude (Standard Earth)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_CordiformRegionExclude(Type, Resource);
INSERT INTO Resource_CordiformRegionExclude 
		(Type,					Resource)
VALUES	('NORTH_AMERICA',		'RESOURCE_JFD_OPIUM');
--------------------------------------------------------------------------------------------------------------------------
-- Resource_EuroLargeRegionExclude (Large Europe)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_EuroLargeRegionExclude(Type, Resource);
INSERT INTO Resource_EuroLargeRegionExclude 
		(Type,					Resource)
VALUES	('NORTH_EUROPE',		'RESOURCE_JFD_CEDAR'),
		('SOUTH_EUROPE',		'RESOURCE_JFD_CEDAR'),
		('AFRICA',				'RESOURCE_JFD_CEDAR'),
		('NORTH_EUROPE',		'RESOURCE_JFD_FEATHERS'),
		('SOUTH_EUROPE',		'RESOURCE_JFD_FEATHERS'),
		('MIDDLE_EAST',			'RESOURCE_JFD_FEATHERS'),
		('AFRICA',				'RESOURCE_JFD_FEATHERS'),
		('BLACK_SEA',			'RESOURCE_JFD_FEATHERS'),
		('NORTH_EUROPE',		'RESOURCE_JFD_LOTUS'),
		('SOUTH_EUROPE',		'RESOURCE_JFD_LOTUS'),
		('AFRICA',				'RESOURCE_JFD_LOTUS'),
		('BLACK_SEA',			'RESOURCE_JFD_LOTUS'),
		('NORTH_EUROPE',		'RESOURCE_JFD_MAIZE'),
		('SOUTH_EUROPE',		'RESOURCE_JFD_MAIZE'),
		('MIDDLE_EAST',			'RESOURCE_JFD_MAIZE'),
		('AFRICA',				'RESOURCE_JFD_MAIZE'),
		('NORTH_ASIA',			'RESOURCE_JFD_MAIZE'),
		('BLACK_SEA',			'RESOURCE_JFD_MAIZE'),
		('SOUTH_EUROPE',		'RESOURCE_JFD_OAK'),
		('MIDDLE_EAST',			'RESOURCE_JFD_OAK'),
		('AFRICA',				'RESOURCE_JFD_OAK'),
		('BLACK_SEA',			'RESOURCE_JFD_OAK'),
		('NORTH_EUROPE',		'RESOURCE_JFD_OBSIDIAN'),	
		('AFRICA',				'RESOURCE_JFD_OBSIDIAN'),
		('NORTH_EUROPE',		'RESOURCE_JFD_OPIUM'),
		('SOUTH_EUROPE',		'RESOURCE_JFD_OPIUM'),
		('AFRICA',				'RESOURCE_JFD_OPIUM'),
		('BLACK_SEA',			'RESOURCE_JFD_OPIUM'),
		('NORTH_EUROPE',		'RESOURCE_JFD_RICE'),
		('SOUTH_EUROPE',		'RESOURCE_JFD_RICE'),
		('AFRICA',				'RESOURCE_JFD_RICE'),
		('BLACK_SEA',			'RESOURCE_JFD_RICE'),
		('NORTH_EUROPE',		'RESOURCE_JFD_RUBBER'),
		('SOUTH_EUROPE',		'RESOURCE_JFD_RUBBER'),
		('MIDDLE_EAST',			'RESOURCE_JFD_RUBBER'),
		('AFRICA',				'RESOURCE_JFD_RUBBER'),
		('BLACK_SEA',			'RESOURCE_JFD_RUBBER'),
		('NORTH_EUROPE',		'RESOURCE_JFD_SAFFRON'),	
		('AFRICA',				'RESOURCE_JFD_SAFFRON'),
		('NORTH_EUROPE',		'RESOURCE_JFD_VANILLA'),
		('SOUTH_EUROPE',		'RESOURCE_JFD_VANILLA'),
		('MIDDLE_EAST',			'RESOURCE_JFD_VANILLA'),
		('AFRICA',				'RESOURCE_JFD_VANILLA'),
		('BLACK_SEA',			'RESOURCE_JFD_VANILLA');
------------------------------------------------------------------------------------------------------------------------
 -- Resource_GreatestEarthRegionExclude (Greatest Earth)
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Resource_GreatestEarthRegionExclude(Type, Resource);
INSERT INTO Resource_GreatestEarthRegionExclude 
		(Type,					Resource)
VALUES	('ARCTIC_AMERICA',		'RESOURCE_JFD_CEDAR'),
		('NORTH_AMERICA',		'RESOURCE_JFD_CEDAR'),
		('CENTRAL_AMERICA',		'RESOURCE_JFD_CEDAR'),
		('SOUTH_AMERICA_WEST',	'RESOURCE_JFD_CEDAR'),
		('AUSTRALIA',			'RESOURCE_JFD_CEDAR'),
		('OCEANIA',				'RESOURCE_JFD_CEDAR'),
		('SOUTH_ASIA',			'RESOURCE_JFD_CEDAR'),
		('CENTRAL_ASIA',		'RESOURCE_JFD_CEDAR'),
		('EAST_ASIA',			'RESOURCE_JFD_CEDAR'),
		('NORTH_ASIA',			'RESOURCE_JFD_CEDAR'),
		('TURKEY',				'RESOURCE_JFD_CEDAR'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_CEDAR'),
		('WEST_EUROPA',			'RESOURCE_JFD_CEDAR'),
		('NORTH_EUROPA',		'RESOURCE_JFD_CEDAR'),
		('EAST_EUROPA',			'RESOURCE_JFD_CEDAR'),
		('WEST_EUROPA',			'RESOURCE_JFD_CEDAR'),
		('NORTH_AFRICA',		'RESOURCE_JFD_CEDAR'),
		('CENTRAL_AFRICA',		'RESOURCE_JFD_CEDAR'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_CEDAR'),
		('MADAGASCAR',			'RESOURCE_JFD_CEDAR'),
		('GROENLAND',			'RESOURCE_JFD_CEDAR'),
		('NORTH_AMERICA',		'RESOURCE_JFD_FEATHERS'),
		('ANTARCTIC_AMERICA',	'RESOURCE_JFD_FEATHERS'),
		('AUSTRALIA',			'RESOURCE_JFD_FEATHERS'),
		('OCEANIA',				'RESOURCE_JFD_FEATHERS'),
		('SOUTH_ASIA',			'RESOURCE_JFD_FEATHERS'),
		('CENTRAL_ASIA',		'RESOURCE_JFD_FEATHERS'),
		('EAST_ASIA',			'RESOURCE_JFD_FEATHERS'),
		('NORTH_ASIA',			'RESOURCE_JFD_FEATHERS'),
		('MEDITERRANEAN',		'RESOURCE_JFD_FEATHERS'),
		('MIDDLE_EAST',			'RESOURCE_JFD_FEATHERS'),
		('TURKEY',				'RESOURCE_JFD_FEATHERS'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_FEATHERS'),
		('WEST_EUROPA',			'RESOURCE_JFD_FEATHERS'),
		('NORTH_EUROPA',		'RESOURCE_JFD_FEATHERS'),
		('EAST_EUROPA',			'RESOURCE_JFD_FEATHERS'),
		('CENTRAL_AFRICA',		'RESOURCE_JFD_FEATHERS'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_FEATHERS'),
		('MADAGASCAR',			'RESOURCE_JFD_FEATHERS'),
		('ARCTIC_AMERICA',		'RESOURCE_JFD_LOTUS'),
		('NORTH_AMERICA',		'RESOURCE_JFD_LOTUS'),
		('CENTRAL_AMERICA',		'RESOURCE_JFD_LOTUS'),
		('SOUTH_AMERICA_WEST',	'RESOURCE_JFD_LOTUS'),
		('SOUTH_AMERICA_EAST',	'RESOURCE_JFD_LOTUS'),
		('ANTARCTIC_AMERICA',	'RESOURCE_JFD_LOTUS'),
		('OCEANIA',				'RESOURCE_JFD_LOTUS'),
		('CENTRAL_ASIA',		'RESOURCE_JFD_LOTUS'),
		('TURKEY',				'RESOURCE_JFD_LOTUS'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_LOTUS'),
		('WEST_EUROPA',			'RESOURCE_JFD_LOTUS'),
		('NORTH_EUROPA',		'RESOURCE_JFD_LOTUS'),
		('EAST_EUROPA',			'RESOURCE_JFD_LOTUS'),
		('CENTRAL_AFRICA',		'RESOURCE_JFD_LOTUS'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_LOTUS'),
		('MADAGASCAR',			'RESOURCE_JFD_LOTUS'),
		('ARCTIC_AMERICA',		'RESOURCE_JFD_MAIZE'),
		('SOUTH_ASIA',			'RESOURCE_JFD_MAIZE'),
		('CENTRAL_ASIA',		'RESOURCE_JFD_MAIZE'),
		('EAST_ASIA',			'RESOURCE_JFD_MAIZE'),
		('NORTH_ASIA',			'RESOURCE_JFD_MAIZE'),
		('AUSTRALIA',			'RESOURCE_JFD_MAIZE'),
		('OCEANIA',				'RESOURCE_JFD_MAIZE'),
		('TURKEY',				'RESOURCE_JFD_MAIZE'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_MAIZE'),
		('WEST_EUROPA',			'RESOURCE_JFD_MAIZE'),
		('NORTH_EUROPA',		'RESOURCE_JFD_MAIZE'),
		('CENTRAL_AFRICA',		'RESOURCE_JFD_MAIZE'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_MAIZE'),
		('MADAGASCAR',			'RESOURCE_JFD_MAIZE'),
		('MEDITERRANEAN',		'RESOURCE_JFD_MAIZE'),
		('MIDDLE_EAST',			'RESOURCE_JFD_MAIZE'),
		('GROENLAND',			'RESOURCE_JFD_MAIZE'),
		('ARCTIC_AMERICA',		'RESOURCE_JFD_OAK'),
		('CENTRAL_AMERICA',		'RESOURCE_JFD_OAK'),
		('SOUTH_AMERICA_WEST',	'RESOURCE_JFD_OAK'),
		('SOUTH_AMERICA_EAST',	'RESOURCE_JFD_OAK'),
		('ANTARCTIC_AMERICA',	'RESOURCE_JFD_OAK'),
		('AUSTRALIA',			'RESOURCE_JFD_OAK'),
		('OCEANIA',				'RESOURCE_JFD_OAK'),
		('SOUTH_ASIA',			'RESOURCE_JFD_OAK'),
		('CENTRAL_ASIA',		'RESOURCE_JFD_OAK'),
		('EAST_ASIA',			'RESOURCE_JFD_OAK'),
		('MEDITERRANEAN',		'RESOURCE_JFD_OAK'),
		('MIDDLE_EAST',			'RESOURCE_JFD_OAK'),
		('TURKEY',				'RESOURCE_JFD_OAK'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_OAK'),
		('CENTRAL_AFRICA',		'RESOURCE_JFD_OAK'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_OAK'),
		('MADAGASCAR',			'RESOURCE_JFD_OAK'),
		('GROENLAND',			'RESOURCE_JFD_OBSIDIAN'),
		('ARCTIC_AMERICA',		'RESOURCE_JFD_OBSIDIAN'),
		('NORTH_AMERICA',		'RESOURCE_JFD_OBSIDIAN'),
		('AUSTRALIA',			'RESOURCE_JFD_OBSIDIAN'),
		('ANTARCTIC_AMERICA',	'RESOURCE_JFD_OBSIDIAN'),
		('SOUTH_ASIA',			'RESOURCE_JFD_OBSIDIAN'),
		('CENTRAL_ASIA',		'RESOURCE_JFD_OBSIDIAN'),
		('MIDDLE_EAST',			'RESOURCE_JFD_OBSIDIAN'),
		('TURKEY',				'RESOURCE_JFD_OBSIDIAN'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_OBSIDIAN'),
		('WEST_EUROPA',			'RESOURCE_JFD_OBSIDIAN'),
		('NORTH_EUROPA',		'RESOURCE_JFD_OBSIDIAN'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_OBSIDIAN'),
		('EAST_EUROPA',			'RESOURCE_JFD_OBSIDIAN'),
		('NORTH_AFRICA',		'RESOURCE_JFD_OBSIDIAN'),
		('CENTRAL_AFRICA',		'RESOURCE_JFD_OBSIDIAN'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_OBSIDIAN'),
		('MADAGASCAR',			'RESOURCE_JFD_OBSIDIAN'),
		('ARCTIC_AMERICA',		'RESOURCE_JFD_OPIUM'),
		('NORTH_AMERICA',		'RESOURCE_JFD_OPIUM'),
		('CENTRAL_AMERICA',		'RESOURCE_JFD_OPIUM'),
		('SOUTH_AMERICA_WEST',	'RESOURCE_JFD_OPIUM'),
		('SOUTH_AMERICA_EAST',	'RESOURCE_JFD_OPIUM'),
		('ANTARCTIC_AMERICA',	'RESOURCE_JFD_OPIUM'),
		('AUSTRALIA',			'RESOURCE_JFD_OPIUM'),
		('OCEANIA',				'RESOURCE_JFD_OPIUM'),
		('SOUTH_ASIA',			'RESOURCE_JFD_OPIUM'),
		('EAST_ASIA',			'RESOURCE_JFD_OPIUM'),
		('TURKEY',				'RESOURCE_JFD_OPIUM'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_OPIUM'),
		('WEST_EUROPA',			'RESOURCE_JFD_OPIUM'),
		('NORTH_EUROPA',		'RESOURCE_JFD_OPIUM'),
		('EAST_EUROPA',			'RESOURCE_JFD_OPIUM'),
		('CENTRAL_AFRICA',		'RESOURCE_JFD_OPIUM'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_OPIUM'),
		('MADAGASCAR',			'RESOURCE_JFD_OPIUM'),
		('ARCTIC_AMERICA',		'RESOURCE_JFD_RICE'),
		('NORTH_AMERICA',		'RESOURCE_JFD_RICE'),
		('CENTRAL_AMERICA',		'RESOURCE_JFD_RICE'),
		('SOUTH_AMERICA_WEST',	'RESOURCE_JFD_RICE'),
		('AUSTRALIA',			'RESOURCE_JFD_RICE'),
		('OCEANIA',				'RESOURCE_JFD_RICE'),
		('TURKEY',				'RESOURCE_JFD_RICE'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_RICE'),
		('WEST_EUROPA',			'RESOURCE_JFD_RICE'),
		('NORTH_EUROPA',		'RESOURCE_JFD_RICE'),
		('CENTRAL_AFRICA',		'RESOURCE_JFD_RICE'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_RICE'),
		('MADAGASCAR',			'RESOURCE_JFD_RICE'),
		('MEDITERRANEAN',		'RESOURCE_JFD_RICE'),
		('MIDDLE_EAST',			'RESOURCE_JFD_RICE'),
		('GROENLAND',			'RESOURCE_JFD_RICE'),
		('ARCTIC_AMERICA',		'RESOURCE_JFD_RUBBER'),
		('NORTH_AMERICA',		'RESOURCE_JFD_RUBBER'),
		('SOUTH_AMERICA_WEST',	'RESOURCE_JFD_RUBBER'),
		('ANTARCTIC_AMERICA',	'RESOURCE_JFD_RUBBER'),
		('AUSTRALIA',			'RESOURCE_JFD_RUBBER'),
		('OCEANIA',				'RESOURCE_JFD_RUBBER'),
		('CENTRAL_ASIA',		'RESOURCE_JFD_RUBBER'),
		('NORTH_ASIA',			'RESOURCE_JFD_RUBBER'),
		('MEDITERRANEAN',		'RESOURCE_JFD_RUBBER'),
		('MIDDLE_EAST',			'RESOURCE_JFD_RUBBER'),
		('TURKEY',				'RESOURCE_JFD_RUBBER'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_RUBBER'),
		('WEST_EUROPA',			'RESOURCE_JFD_RUBBER'),
		('NORTH_EUROPA',		'RESOURCE_JFD_RUBBER'),
		('EAST_EUROPA',			'RESOURCE_JFD_RUBBER'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_RUBBER'),
		('MADAGASCAR',			'RESOURCE_JFD_RUBBER'),
		('GROENLAND',			'RESOURCE_JFD_SAFFRON'),
		('ARCTIC_AMERICA',		'RESOURCE_JFD_SAFFRON'),
		('NORTH_AMERICA',		'RESOURCE_JFD_SAFFRON'),
		('CENTRAL_AMERICA',		'RESOURCE_JFD_SAFFRON'),
		('SOUTH_AMERICA_WEST',	'RESOURCE_JFD_SAFFRON'),
		('SOUTH_AMERICA_EAST',	'RESOURCE_JFD_SAFFRON'),
		('ANTARCTIC_AMERICA',	'RESOURCE_JFD_SAFFRON'),
		('AUSTRALIA',			'RESOURCE_JFD_SAFFRON'),
		('OCEANIA',				'RESOURCE_JFD_SAFFRON'),
		('EAST_ASIA',			'RESOURCE_JFD_SAFFRON'),
		('NORTH_ASIA',			'RESOURCE_JFD_SAFFRON'),
		('SOUTH_ASIA',			'RESOURCE_JFD_SAFFRON'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_SAFFRON'),
		('WEST_EUROPA',			'RESOURCE_JFD_SAFFRON'),
		('NORTH_EUROPA',		'RESOURCE_JFD_SAFFRON'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_SAFFRON'),
		('EAST_EUROPA',			'RESOURCE_JFD_SAFFRON'),
		('NORTH_AFRICA',		'RESOURCE_JFD_SAFFRON'),
		('CENTRAL_AFRICA',		'RESOURCE_JFD_SAFFRON'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_SAFFRON'),
		('MADAGASCAR',			'RESOURCE_JFD_SAFFRON'),
		('ARCTIC_AMERICA',		'RESOURCE_JFD_VANILLA'),
		('NORTH_AMERICA',		'RESOURCE_JFD_VANILLA'),
		('ANTARCTIC_AMERICA',	'RESOURCE_JFD_VANILLA'),
		('AUSTRALIA',			'RESOURCE_JFD_VANILLA'),
		('OCEANIA',				'RESOURCE_JFD_VANILLA'),
		('SOUTH_ASIA',			'RESOURCE_JFD_VANILLA'),
		('CENTRAL_ASIA',		'RESOURCE_JFD_VANILLA'),
		('EAST_ASIA',			'RESOURCE_JFD_VANILLA'),
		('NORTH_ASIA',			'RESOURCE_JFD_VANILLA'),
		('MEDITERRANEAN',		'RESOURCE_JFD_VANILLA'),
		('MIDDLE_EAST',			'RESOURCE_JFD_VANILLA'),
		('TURKEY',				'RESOURCE_JFD_VANILLA'),
		('SOUTH_EUROPA',		'RESOURCE_JFD_VANILLA'),
		('WEST_EUROPA',			'RESOURCE_JFD_VANILLA'),
		('NORTH_EUROPA',		'RESOURCE_JFD_VANILLA'),
		('EAST_EUROPA',			'RESOURCE_JFD_VANILLA'),
		('CENTRAL_AFRICA',		'RESOURCE_JFD_VANILLA'),
		('SOUTH_AFRICA',		'RESOURCE_JFD_VANILLA'),
		('MADAGASCAR',			'RESOURCE_JFD_VANILLA');
--==========================================================================================================================
--==========================================================================================================================
