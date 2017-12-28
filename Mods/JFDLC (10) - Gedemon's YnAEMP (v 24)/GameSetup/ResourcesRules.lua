-- ResourcesRules
-- Author: Gedemon
-- DateCreated: 8/11/2011 5:56:44 PM
--------------------------------------------------------------

local defaultResourcesRule = {
-- reset Resource_TerrainBooleans
-- for reference default values are in vanilla CIV5Resources.xml
--
-- reset Resource_TerrainBooleans
-- simple table, resources listed here can be placed on defined terrains
"DELETE FROM Resource_TerrainBooleans",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_IRON','TERRAIN_GRASS')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_IRON','TERRAIN_PLAINS')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_IRON','TERRAIN_DESERT')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_IRON','TERRAIN_TUNDRA')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_IRON','TERRAIN_SNOW')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_HORSE','TERRAIN_GRASS')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_HORSE','TERRAIN_PLAINS')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_HORSE','TERRAIN_TUNDRA')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_COAL','TERRAIN_HILL')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_COAL','TERRAIN_PLAINS')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_COAL','TERRAIN_TUNDRA')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_OIL','TERRAIN_DESERT')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_OIL','TERRAIN_TUNDRA')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_OIL','TERRAIN_SNOW')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_OIL','TERRAIN_COAST')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_ALUMINUM','TERRAIN_PLAINS')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_ALUMINUM','TERRAIN_DESERT')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_ALUMINUM','TERRAIN_TUNDRA')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_URANIUM','TERRAIN_GRASS')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_URANIUM','TERRAIN_PLAINS')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_URANIUM','TERRAIN_DESERT')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_URANIUM','TERRAIN_TUNDRA')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_URANIUM','TERRAIN_SNOW')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_WHEAT','TERRAIN_PLAINS')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_COW','TERRAIN_GRASS')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SHEEP','TERRAIN_GRASS')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SHEEP','TERRAIN_PLAINS')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SHEEP','TERRAIN_DESERT')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SHEEP','TERRAIN_HILL')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_DEER','TERRAIN_TUNDRA')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_FISH','TERRAIN_COAST')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_WHALE','TERRAIN_COAST')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_PEARLS','TERRAIN_COAST')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_GOLD','TERRAIN_GRASS')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_GOLD','TERRAIN_PLAINS')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_GOLD','TERRAIN_DESERT')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SILVER','TERRAIN_TUNDRA')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SILVER','TERRAIN_DESERT')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SILVER','TERRAIN_PLAINS')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SILVER','TERRAIN_HILL')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_GEMS','TERRAIN_GRASS')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_GEMS','TERRAIN_PLAINS')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_GEMS','TERRAIN_DESERT')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_GEMS','TERRAIN_TUNDRA')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_MARBLE','TERRAIN_GRASS')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_MARBLE','TERRAIN_PLAINS')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_MARBLE','TERRAIN_DESERT')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_MARBLE','TERRAIN_TUNDRA')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_IVORY','TERRAIN_PLAINS')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_IVORY','TERRAIN_GRASS')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_FUR','TERRAIN_TUNDRA')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_COTTON','TERRAIN_GRASS')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_COTTON','TERRAIN_PLAINS')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_WINE','TERRAIN_GRASS')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_WINE','TERRAIN_PLAINS')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_WINE','TERRAIN_HILL')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_INCENSE','TERRAIN_PLAINS')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_INCENSE','TERRAIN_DESERT')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_STONE','TERRAIN_GRASS')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_STONE','TERRAIN_PLAINS')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_STONE','TERRAIN_DESERT')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_STONE','TERRAIN_TUNDRA')",
"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_STONE','TERRAIN_SNOW')",
"INSERT INTO Resource_TerrainBooleans VALUES ('RESOURCE_COPPER','TERRAIN_GRASS')",
"INSERT INTO Resource_TerrainBooleans VALUES ('RESOURCE_COPPER','TERRAIN_PLAINS')",
"INSERT INTO Resource_TerrainBooleans VALUES ('RESOURCE_COPPER','TERRAIN_DESERT')",
"INSERT INTO Resource_TerrainBooleans VALUES ('RESOURCE_COPPER','TERRAIN_TUNDRA')",
"INSERT INTO Resource_TerrainBooleans VALUES ('RESOURCE_COPPER','TERRAIN_SNOW')",
"INSERT INTO Resource_TerrainBooleans VALUES ('RESOURCE_SALT','TERRAIN_PLAINS')",
"INSERT INTO Resource_TerrainBooleans VALUES ('RESOURCE_SALT','TERRAIN_DESERT')",
"INSERT INTO Resource_TerrainBooleans VALUES ('RESOURCE_SALT','TERRAIN_TUNDRA')",
"INSERT INTO Resource_TerrainBooleans VALUES ('RESOURCE_CRAB','TERRAIN_COAST')",
"INSERT INTO Resource_TerrainBooleans VALUES ('RESOURCE_CITRUS','TERRAIN_GRASS')",
"INSERT INTO Resource_TerrainBooleans VALUES ('RESOURCE_CITRUS','TERRAIN_PLAINS')",

-- reset Resource_FeatureTerrainBooleans
-- usage : the terrains defined here will need one of the feature listed in Resource_FeatureBooleans to host the resource
"DELETE FROM Resource_FeatureTerrainBooleans",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_COAL','TERRAIN_GRASS')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_COAL','TERRAIN_PLAINS')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_ALUMINUM','TERRAIN_GRASS')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_ALUMINUM','TERRAIN_PLAINS')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_OIL','TERRAIN_GRASS')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_OIL','TERRAIN_PLAINS')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_IRON','TERRAIN_GRASS')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_IRON','TERRAIN_PLAINS')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_IRON','TERRAIN_TUNDRA')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_URANIUM','TERRAIN_GRASS')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_URANIUM','TERRAIN_PLAINS')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_URANIUM','TERRAIN_DESERT')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_URANIUM','TERRAIN_TUNDRA')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_URANIUM','TERRAIN_SNOW')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_WHEAT','TERRAIN_DESERT')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SHEEP','TERRAIN_HILL')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_DEER','TERRAIN_GRASS')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_DEER','TERRAIN_PLAINS')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_DEER','TERRAIN_TUNDRA')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_DEER','TERRAIN_SNOW')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_BANANA','TERRAIN_GRASS')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_BANANA','TERRAIN_PLAINS')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_GEMS','TERRAIN_GRASS')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_GEMS','TERRAIN_PLAINS')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_FUR','TERRAIN_GRASS')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_FUR','TERRAIN_PLAINS')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_FUR','TERRAIN_TUNDRA')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_FUR','TERRAIN_SNOW')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_DYE','TERRAIN_GRASS')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_DYE','TERRAIN_PLAINS')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SPICES','TERRAIN_GRASS')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SPICES','TERRAIN_PLAINS')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SILVER','TERRAIN_PLAINS')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SILK','TERRAIN_GRASS')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SILK','TERRAIN_PLAINS')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SUGAR','TERRAIN_GRASS')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SUGAR','TERRAIN_PLAINS')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SUGAR','TERRAIN_DESERT')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SUGAR','TERRAIN_HILL')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES ('RESOURCE_TRUFFLES','TERRAIN_GRASS')",
"INSERT INTO Resource_FeatureTerrainBooleans VALUES ('RESOURCE_TRUFFLES','TERRAIN_PLAINS')",

-- reset Resource_FeatureBooleans
-- this table list the feature needed for the resource to appears on terrains listed in Resource_FeatureTerrainBooleans
"DELETE FROM Resource_FeatureBooleans",
"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_COAL','FEATURE_FOREST')",
"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_COAL','FEATURE_JUNGLE')",
"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_ALUMINUM','FEATURE_JUNGLE')",
"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_ALUMINUM','FEATURE_FOREST')",
"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_OIL','FEATURE_JUNGLE')",
"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_OIL','FEATURE_MARSH')",
"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_OIL','FEATURE_FOREST')",
"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_IRON','FEATURE_JUNGLE')",
"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_IRON','FEATURE_FOREST')",
"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_URANIUM','FEATURE_JUNGLE')",
"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_URANIUM','FEATURE_FOREST')",
"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_URANIUM','FEATURE_MARSH')",
"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_WHEAT','FEATURE_FLOOD_PLAINS')",
"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_DEER','FEATURE_FOREST')",
"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_BANANA','FEATURE_JUNGLE')",
"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_GEMS','FEATURE_JUNGLE')",
"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_FUR','FEATURE_FOREST')",
"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_DYE','FEATURE_JUNGLE')",
"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_DYE','FEATURE_FOREST')",
"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_SILVER','FEATURE_FOREST')",
"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_SPICES','FEATURE_JUNGLE')",
"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_SILK','FEATURE_FOREST')",
"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_SUGAR','FEATURE_FLOOD_PLAINS')",
"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_SUGAR','FEATURE_MARSH')",
"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_SUGAR','FEATURE_JUNGLE')",
"INSERT INTO Resource_FeatureBooleans VALUES ('RESOURCE_TRUFFLES','FEATURE_FOREST')",
"INSERT INTO Resource_FeatureBooleans VALUES ('RESOURCE_TRUFFLES','FEATURE_MARSH')",
"INSERT INTO Resource_FeatureBooleans VALUES ('RESOURCE_TRUFFLES','FEATURE_JUNGLE')",

-- specific placement rules, available variables
-- see CaclulateNumResourcesToAdd(resource) in WorldBuilderRandomItems.lua for details on calculations
--
-- PlacementOrder : ?
-- ConstAppearance : base number
-- MinLatitude
-- MaxLatitude
-- RandApp1 : randomized and added to ConstAppearance
-- RandApp2 : randomized and added to ConstAppearance
-- RandApp3 : randomized and added to ConstAppearance
-- RandApp4 : randomized and added to ConstAppearance
-- Player :  % per player
-- TilesPer : number tiles for one resource of this type ? (high number means less resource)
-- MinLandPercent : ?
-- Unique : ?
-- GroupRange: ?
-- GroupRand : ?
-- ResourceUsage : ?
-- PresentOnAllValidPlots : I suppose make it appears on all plots that can host it
-- Area : ?
-- Hills : true (=1) means can on hills
-- Flatlands : true (=1) means can on flatlands
-- NoRiverSide : true (=1) means can't be near river
--
-- Added variables
-- AbsoluteBaseAmount : number of resource unaltered by other variable (available tiles, number of players, ...) except AbsoluteVarPercent
-- AbsoluteVarPercent : modify AbsoluteBaseAmount to a random number in the range of AbsoluteBaseAmount-(AbsoluteVarPercent*AbsoluteBaseAmount/100) and AbsoluteBaseAmount+(AbsoluteVarPercent*AbsoluteBaseAmount/100)
	
"UPDATE Resources SET TilesPer = 10 WHERE Type='RESOURCE_STONE'",
"UPDATE Resources SET Player = 0 WHERE Type='RESOURCE_STONE'",
"UPDATE Resources SET Flatlands = 1 WHERE Type='RESOURCE_STONE'", -- In vanilla/scripted map, stone is placed on flatland too...
}

g_ResourcesRules = {
[GIANT_EARTH] = defaultResourcesRule,
[HUGE_EARTH] = defaultResourcesRule,
[LARGE_GREATEST_EARTH] = defaultResourcesRule,
[LARGE_GREATEST_EARTH] = defaultResourcesRule,
[STANDARD_CORDIFORM_EARTH] = defaultResourcesRule,
[GIANT_EUROPE] = defaultResourcesRule,
[LARGE_EUROPE] = defaultResourcesRule,
[NORTHWEST_EUROPE] = defaultResourcesRule,
[LARGE_AFRICA] = defaultResourcesRule,
[WEST_AFRICA] = defaultResourcesRule,
[AMERICAS] = defaultResourcesRule,
[ASIA] = defaultResourcesRule,
[EAST_ASIA] = defaultResourcesRule,
[NORTHEAST_ASIA] = defaultResourcesRule,
[NORTH_ATLANTIC] = defaultResourcesRule,
[AEGEAN] = defaultResourcesRule,
[APENNINE] = defaultResourcesRule,
[BRITISH_ISLES] = defaultResourcesRule,
[CARIBBEAN] = defaultResourcesRule,
[MEDITERRANEAN] = defaultResourcesRule,
[MESOPOTAMIA] = defaultResourcesRule,
[NILE_VALLEY] = defaultResourcesRule,
[PACIFIC] = defaultResourcesRule,
[SOUTH_PACIFIC] = defaultResourcesRule,
[MESOPOTAMIA_GIANT] = defaultResourcesRule,
[ASIA_SMALL] = defaultResourcesRule,
[ASIA_SMALL] = defaultResourcesRule,
[LARGE_EUROPE_NEW] = defaultResourcesRule,
[ADRIATIC] = defaultResourcesRule,
[CAUCASUS] = defaultResourcesRule,
[ASIA_MONGOL_STEPPE] = defaultResourcesRule,
[CENTRAL_ASIA] = defaultResourcesRule,
[EASTERN_EUROPE] = defaultResourcesRule,
[NORTH_SEA_EUROPE] = defaultResourcesRule,
[AFRICA_ASIA_OCEANIA] = defaultResourcesRule,
[AFRICA_SOUTH_EUROPE] = defaultResourcesRule,
[AFRICA_GIANT] = defaultResourcesRule,
[SOUTH_AMERICA_GIANT] = defaultResourcesRule,
[AUSTRALIA_SOUTHEAST_ASIA] = defaultResourcesRule,
[INDIA_GIANT] = defaultResourcesRule,
[SOUTH_CENTRAL_AMERICA_HUGE] = defaultResourcesRule,
[SOUTH_CENTRAL_AMERICA_GIANT] = defaultResourcesRule,
[SCOTLAND_IRELAND_HUGE] = defaultResourcesRule,
[SOUTH_AMERICA_LARGE] = defaultResourcesRule,
[ASIA_SOUTH_HUGE] = defaultResourcesRule,
[SOUTH_PACIFIC_GIANT] = defaultResourcesRule,
[NORTH_AMERICA_GIANT] = defaultResourcesRule,
[NORTH_AMERICA_HUGE] = defaultResourcesRule,
}

--[STANDARD_WESTERN_MEDITERRANEAN] = {
--	-- for reference default values are in vanilla CIV5Resources.xml
--	--
--	-- reset Resource_TerrainBooleans
--	-- simple table, resources listed here can be placed on defined terrains
--	"DELETE FROM Resource_TerrainBooleans",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_HORSE','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_HORSE','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_IRON','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_IRON','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_IRON','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_COAL','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_OIL','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_OIL','TERRAIN_COAST')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_ALUMINUM','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_ALUMINUM','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_ALUMINUM','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_URANIUM','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_URANIUM','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_URANIUM','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_COW','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_FISH','TERRAIN_COAST')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SHEEP','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SHEEP','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SHEEP','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_STONE','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_STONE','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_STONE','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_WHEAT','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_COTTON','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_COTTON','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_GEMS','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_GEMS','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_GEMS','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_GOLD','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_GOLD','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_INCENSE','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_INCENSE','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_IVORY','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_IVORY','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_MARBLE','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_MARBLE','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_MARBLE','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_PEARLS','TERRAIN_COAST')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SILVER','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SILVER','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SUGAR','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_WHALE','TERRAIN_COAST')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_WINE','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_WINE','TERRAIN_PLAINS')",
--
--	-- reset Resource_FeatureTerrainBooleans
--	-- usage : the terrains defined here will need one of the feature listed in Resource_FeatureBooleans to host the resource
--	"DELETE FROM Resource_FeatureTerrainBooleans",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_IRON','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_IRON','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_COAL','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_COAL','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_OIL','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_OIL','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_ALUMINUM','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_ALUMINUM','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_URANIUM','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_URANIUM','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_BANANA','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_BANANA','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_DEER','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_DEER','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_WHEAT','TERRAIN_DESERT')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_DYE','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_DYE','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_FUR','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_FUR','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_GEMS','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_GEMS','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_GOLD','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_GOLD','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SILK','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SILK','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SILVER','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SILVER','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SPICES','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SPICES','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SUGAR','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SUGAR','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SUGAR','TERRAIN_DESERT')",
--
--	-- reset Resource_FeatureBooleans
--	-- this table list the feature needed for the resource to appears on terrains listed in Resource_FeatureTerrainBooleans
--	"DELETE FROM Resource_FeatureBooleans",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_IRON','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_COAL','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_OIL','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_OIL','FEATURE_MARSH')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_ALUMINUM','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_URANIUM','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_URANIUM','FEATURE_MARSH')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_BANANA','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_DEER','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_WHEAT','FEATURE_FLOOD_PLAINS')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_DYE','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_FUR','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_GEMS','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_GOLD','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_SILK','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_SILVER','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_SPICES','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_SUGAR','FEATURE_FLOOD_PLAINS')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_SUGAR','FEATURE_MARSH')",
--	
--	-- specific placement rules, available variables
--	-- see CaclulateNumResourcesToAdd(resource) in WorldBuilderRandomItems.lua for details on calculations
--	--
--	-- PlacementOrder : ?
--	-- ConstAppearance : base number
--	-- MinLatitude
--	-- MaxLatitude
--	-- RandApp1 : randomized and added to ConstAppearance
--	-- RandApp2 : randomized and added to ConstAppearance
--	-- RandApp3 : randomized and added to ConstAppearance
--	-- RandApp4 : randomized and added to ConstAppearance
--	-- Player :  % per player
--	-- TilesPer : number tiles for one resource of this type ? (high number means less resource)
--	-- MinLandPercent : ?
--	-- Unique : ?
--	-- GroupRange: ?
--	-- GroupRand : ?
--	-- ResourceUsage : ?
--	-- PresentOnAllValidPlots : I suppose make it appears on all plots that can host it
--	-- Area : ?
--	-- Hills : true (=1) means must be on hills
--	-- Flatlands : true (=1) means must be on flatlands
--	-- NoRiverSide : true (=1) means can't be near river
--	--
--	-- Added variables
--	-- AbsoluteBaseAmount : number of resource unaltered by other variable (available tiles, number of players, ...) except AbsoluteVarPercent
--	-- AbsoluteVarPercent : modify AbsoluteBaseAmount to a random number in the range of AbsoluteBaseAmount-(AbsoluteVarPercent*AbsoluteBaseAmount/100) and AbsoluteBaseAmount+(AbsoluteVarPercent*AbsoluteBaseAmount/100)
--	
--	 "UPDATE Resources SET AbsoluteBaseAmount = 14 WHERE Type='RESOURCE_HORSE'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 12 WHERE Type='RESOURCE_IRON'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 10 WHERE Type='RESOURCE_COAL'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 8 WHERE Type='RESOURCE_OIL'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 8 WHERE Type='RESOURCE_ALUMINUM'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 4 WHERE Type='RESOURCE_URANIUM'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 2 WHERE Type='RESOURCE_BANANA'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 22 WHERE Type='RESOURCE_COW'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 16 WHERE Type='RESOURCE_DEER'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 24 WHERE Type='RESOURCE_FISH'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 20 WHERE Type='RESOURCE_SHEEP'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 12 WHERE Type='RESOURCE_STONE'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 24 WHERE Type='RESOURCE_WHEAT'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 1 WHERE Type='RESOURCE_COTTON'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 1 WHERE Type='RESOURCE_DYE'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 12 WHERE Type='RESOURCE_FUR'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 6 WHERE Type='RESOURCE_GEMS'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 6 WHERE Type='RESOURCE_GOLD'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 4 WHERE Type='RESOURCE_INCENSE'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 4 WHERE Type='RESOURCE_IVORY'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 6 WHERE Type='RESOURCE_MARBLE'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 6 WHERE Type='RESOURCE_PEARLS'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 1 WHERE Type='RESOURCE_SILK'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 10 WHERE Type='RESOURCE_SILVER'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 4 WHERE Type='RESOURCE_SPICES'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 1 WHERE Type='RESOURCE_SUGAR'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 6 WHERE Type='RESOURCE_WHALE'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 12 WHERE Type='RESOURCE_WINE'",
--	},
--[LARGE_MEDITERRANEAN] = {
--	-- for reference default values are in vanilla CIV5Resources.xml
--	--
--	-- reset Resource_TerrainBooleans
--	-- simple table, resources listed here can be placed on defined terrains
--	"DELETE FROM Resource_TerrainBooleans",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_HORSE','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_HORSE','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_IRON','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_IRON','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_IRON','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_COAL','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_OIL','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_OIL','TERRAIN_COAST')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_ALUMINUM','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_ALUMINUM','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_ALUMINUM','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_URANIUM','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_URANIUM','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_URANIUM','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_COW','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_FISH','TERRAIN_COAST')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SHEEP','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SHEEP','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SHEEP','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_STONE','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_STONE','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_STONE','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_WHEAT','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_COTTON','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_COTTON','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_GEMS','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_GEMS','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_GEMS','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_GOLD','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_GOLD','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_INCENSE','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_INCENSE','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_IVORY','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_IVORY','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_MARBLE','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_MARBLE','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_MARBLE','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_PEARLS','TERRAIN_COAST')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SILVER','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SILVER','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SUGAR','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_WHALE','TERRAIN_COAST')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_WINE','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_WINE','TERRAIN_PLAINS')",
--
--	-- reset Resource_FeatureTerrainBooleans
--	-- usage : the terrains defined here will need one of the feature listed in Resource_FeatureBooleans to host the resource
--	"DELETE FROM Resource_FeatureTerrainBooleans",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_IRON','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_IRON','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_COAL','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_COAL','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_OIL','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_OIL','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_ALUMINUM','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_ALUMINUM','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_URANIUM','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_URANIUM','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_BANANA','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_BANANA','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_DEER','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_DEER','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_WHEAT','TERRAIN_DESERT')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_DYE','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_DYE','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_FUR','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_FUR','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_GEMS','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_GEMS','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_GOLD','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_GOLD','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SILK','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SILK','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SILVER','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SILVER','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SPICES','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SPICES','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SUGAR','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SUGAR','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SUGAR','TERRAIN_DESERT')",
--
--	-- reset Resource_FeatureBooleans
--	-- this table list the feature needed for the resource to appears on terrains listed in Resource_FeatureTerrainBooleans
--	"DELETE FROM Resource_FeatureBooleans",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_IRON','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_COAL','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_OIL','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_OIL','FEATURE_MARSH')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_ALUMINUM','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_URANIUM','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_URANIUM','FEATURE_MARSH')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_BANANA','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_DEER','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_WHEAT','FEATURE_FLOOD_PLAINS')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_DYE','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_FUR','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_GEMS','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_GOLD','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_SILK','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_SILVER','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_SPICES','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_SUGAR','FEATURE_FLOOD_PLAINS')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_SUGAR','FEATURE_MARSH')",
--	
--	-- specific placement rules, available variables
--	-- see CaclulateNumResourcesToAdd(resource) in WorldBuilderRandomItems.lua for details on calculations
--	--
--	-- PlacementOrder : ?
--	-- ConstAppearance : base number
--	-- MinLatitude
--	-- MaxLatitude
--	-- RandApp1 : randomized and added to ConstAppearance
--	-- RandApp2 : randomized and added to ConstAppearance
--	-- RandApp3 : randomized and added to ConstAppearance
--	-- RandApp4 : randomized and added to ConstAppearance
--	-- Player :  % per player
--	-- TilesPer : number tiles for one resource of this type ? (high number means less resource)
--	-- MinLandPercent : ?
--	-- Unique : ?
--	-- GroupRange: ?
--	-- GroupRand : ?
--	-- ResourceUsage : ?
--	-- PresentOnAllValidPlots : I suppose make it appears on all plots that can host it
--	-- Area : ?
--	-- Hills : true (=1) means must be on hills
--	-- Flatlands : true (=1) means must be on flatlands
--	-- NoRiverSide : true (=1) means can't be near river
--	--
--	-- Added variables
--	-- AbsoluteBaseAmount : number of resource unaltered by other variable (available tiles, number of players, ...) except AbsoluteVarPercent
--	-- AbsoluteVarPercent : modify AbsoluteBaseAmount to a random number in the range of AbsoluteBaseAmount-(AbsoluteVarPercent*AbsoluteBaseAmount/100) and AbsoluteBaseAmount+(AbsoluteVarPercent*AbsoluteBaseAmount/100)
--	
--	 "UPDATE Resources SET AbsoluteBaseAmount = 22 WHERE Type='RESOURCE_HORSE'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 18 WHERE Type='RESOURCE_IRON'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 16 WHERE Type='RESOURCE_COAL'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 13 WHERE Type='RESOURCE_OIL'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 13 WHERE Type='RESOURCE_ALUMINUM'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 8 WHERE Type='RESOURCE_URANIUM'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 4 WHERE Type='RESOURCE_BANANA'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 36 WHERE Type='RESOURCE_COW'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 28 WHERE Type='RESOURCE_DEER'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 36 WHERE Type='RESOURCE_FISH'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 36 WHERE Type='RESOURCE_SHEEP'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 20 WHERE Type='RESOURCE_STONE'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 36 WHERE Type='RESOURCE_WHEAT'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 2 WHERE Type='RESOURCE_COTTON'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 4 WHERE Type='RESOURCE_DYE'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 16 WHERE Type='RESOURCE_FUR'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 8 WHERE Type='RESOURCE_GEMS'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 8 WHERE Type='RESOURCE_GOLD'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 8 WHERE Type='RESOURCE_INCENSE'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 6 WHERE Type='RESOURCE_IVORY'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 12 WHERE Type='RESOURCE_MARBLE'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 6 WHERE Type='RESOURCE_PEARLS'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 2 WHERE Type='RESOURCE_SILK'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 12 WHERE Type='RESOURCE_SILVER'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 8 WHERE Type='RESOURCE_SPICES'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 2 WHERE Type='RESOURCE_SUGAR'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 6 WHERE Type='RESOURCE_WHALE'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 16 WHERE Type='RESOURCE_WINE'",
--	},
--[STANDARD_EASTERN_MEDITERRANEAN] = {
--	-- for reference default values are in vanilla CIV5Resources.xml
--	--
--	-- reset Resource_TerrainBooleans
--	-- simple table, resources listed here can be placed on defined terrains
--	"DELETE FROM Resource_TerrainBooleans",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_HORSE','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_HORSE','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_IRON','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_IRON','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_IRON','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_COAL','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_OIL','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_OIL','TERRAIN_COAST')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_ALUMINUM','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_ALUMINUM','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_ALUMINUM','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_URANIUM','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_URANIUM','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_URANIUM','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_COW','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_FISH','TERRAIN_COAST')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SHEEP','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SHEEP','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SHEEP','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_STONE','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_STONE','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_STONE','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_WHEAT','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_COTTON','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_COTTON','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_GEMS','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_GEMS','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_GEMS','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_GOLD','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_GOLD','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_INCENSE','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_INCENSE','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_IVORY','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_IVORY','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_MARBLE','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_MARBLE','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_MARBLE','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_PEARLS','TERRAIN_COAST')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SILVER','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SILVER','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SUGAR','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_WHALE','TERRAIN_COAST')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_WINE','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_WINE','TERRAIN_PLAINS')",
--
--	-- reset Resource_FeatureTerrainBooleans
--	-- usage : the terrains defined here will need one of the feature listed in Resource_FeatureBooleans to host the resource
--	"DELETE FROM Resource_FeatureTerrainBooleans",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_IRON','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_IRON','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_COAL','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_COAL','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_OIL','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_OIL','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_ALUMINUM','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_ALUMINUM','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_URANIUM','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_URANIUM','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_BANANA','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_BANANA','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_DEER','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_DEER','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_WHEAT','TERRAIN_DESERT')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_DYE','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_DYE','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_FUR','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_FUR','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_GEMS','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_GEMS','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_GOLD','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_GOLD','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SILK','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SILK','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SILVER','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SILVER','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SPICES','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SPICES','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SUGAR','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SUGAR','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SUGAR','TERRAIN_DESERT')",
--
--	-- reset Resource_FeatureBooleans
--	-- this table list the feature needed for the resource to appears on terrains listed in Resource_FeatureTerrainBooleans
--	"DELETE FROM Resource_FeatureBooleans",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_IRON','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_COAL','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_OIL','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_OIL','FEATURE_MARSH')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_ALUMINUM','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_URANIUM','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_URANIUM','FEATURE_MARSH')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_BANANA','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_DEER','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_WHEAT','FEATURE_FLOOD_PLAINS')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_DYE','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_FUR','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_GEMS','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_GOLD','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_SILK','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_SILVER','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_SPICES','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_SUGAR','FEATURE_FLOOD_PLAINS')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_SUGAR','FEATURE_MARSH')",
--	
--	-- specific placement rules, available variables
--	-- see CaclulateNumResourcesToAdd(resource) in WorldBuilderRandomItems.lua for details on calculations
--	--
--	-- PlacementOrder : ?
--	-- ConstAppearance : base number
--	-- MinLatitude
--	-- MaxLatitude
--	-- RandApp1 : randomized and added to ConstAppearance
--	-- RandApp2 : randomized and added to ConstAppearance
--	-- RandApp3 : randomized and added to ConstAppearance
--	-- RandApp4 : randomized and added to ConstAppearance
--	-- Player :  % per player
--	-- TilesPer : number tiles for one resource of this type ? (high number means less resource)
--	-- MinLandPercent : ?
--	-- Unique : ?
--	-- GroupRange: ?
--	-- GroupRand : ?
--	-- ResourceUsage : ?
--	-- PresentOnAllValidPlots : I suppose make it appears on all plots that can host it
--	-- Area : ?
--	-- Hills : true (=1) means must be on hills
--	-- Flatlands : true (=1) means must be on flatlands
--	-- NoRiverSide : true (=1) means can't be near river
--	--
--	-- Added variables
--	-- AbsoluteBaseAmount : number of resource unaltered by other variable (available tiles, number of players, ...) except AbsoluteVarPercent
--	-- AbsoluteVarPercent : modify AbsoluteBaseAmount to a random number in the range of AbsoluteBaseAmount-(AbsoluteVarPercent*AbsoluteBaseAmount/100) and AbsoluteBaseAmount+(AbsoluteVarPercent*AbsoluteBaseAmount/100)
--	
--	 "UPDATE Resources SET AbsoluteBaseAmount = 16 WHERE Type='RESOURCE_HORSE'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 14 WHERE Type='RESOURCE_IRON'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 10 WHERE Type='RESOURCE_COAL'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 9 WHERE Type='RESOURCE_OIL'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 9 WHERE Type='RESOURCE_ALUMINUM'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 6 WHERE Type='RESOURCE_URANIUM'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 2 WHERE Type='RESOURCE_BANANA'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 20 WHERE Type='RESOURCE_COW'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 18 WHERE Type='RESOURCE_DEER'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 20 WHERE Type='RESOURCE_FISH'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 20 WHERE Type='RESOURCE_SHEEP'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 12 WHERE Type='RESOURCE_STONE'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 28 WHERE Type='RESOURCE_WHEAT'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 1 WHERE Type='RESOURCE_COTTON'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 4 WHERE Type='RESOURCE_DYE'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 12 WHERE Type='RESOURCE_FUR'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 6 WHERE Type='RESOURCE_GEMS'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 6 WHERE Type='RESOURCE_GOLD'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 6 WHERE Type='RESOURCE_INCENSE'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 3 WHERE Type='RESOURCE_IVORY'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 6 WHERE Type='RESOURCE_MARBLE'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 6 WHERE Type='RESOURCE_PEARLS'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 4 WHERE Type='RESOURCE_SILK'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 10 WHERE Type='RESOURCE_SILVER'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 6 WHERE Type='RESOURCE_SPICES'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 1 WHERE Type='RESOURCE_SUGAR'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 1 WHERE Type='RESOURCE_WHALE'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 8 WHERE Type='RESOURCE_WINE'",
--	},
--[LARGE_EASTERN_MEDITERRANEAN] = {
--	-- for reference default values are in vanilla CIV5Resources.xml
--	--
--	-- reset Resource_TerrainBooleans
--	-- simple table, resources listed here can be placed on defined terrains
--	"DELETE FROM Resource_TerrainBooleans",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_HORSE','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_HORSE','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_IRON','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_IRON','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_IRON','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_COAL','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_OIL','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_OIL','TERRAIN_COAST')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_ALUMINUM','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_ALUMINUM','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_ALUMINUM','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_URANIUM','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_URANIUM','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_URANIUM','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_COW','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_FISH','TERRAIN_COAST')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SHEEP','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SHEEP','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SHEEP','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_STONE','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_STONE','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_STONE','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_WHEAT','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_COTTON','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_COTTON','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_GEMS','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_GEMS','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_GEMS','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_GOLD','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_GOLD','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_INCENSE','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_INCENSE','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_IVORY','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_IVORY','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_MARBLE','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_MARBLE','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_MARBLE','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_PEARLS','TERRAIN_COAST')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SILVER','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SILVER','TERRAIN_DESERT')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_SUGAR','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_WHALE','TERRAIN_COAST')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_WINE','TERRAIN_GRASS')",
--	"INSERT INTO Resource_TerrainBooleans VALUES('RESOURCE_WINE','TERRAIN_PLAINS')",
--
--	-- reset Resource_FeatureTerrainBooleans
--	-- usage : the terrains defined here will need one of the feature listed in Resource_FeatureBooleans to host the resource
--	"DELETE FROM Resource_FeatureTerrainBooleans",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_IRON','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_IRON','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_COAL','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_COAL','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_OIL','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_OIL','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_ALUMINUM','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_ALUMINUM','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_URANIUM','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_URANIUM','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_BANANA','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_BANANA','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_DEER','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_DEER','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_WHEAT','TERRAIN_DESERT')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_DYE','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_DYE','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_FUR','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_FUR','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_GEMS','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_GEMS','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_GOLD','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_GOLD','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SILK','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SILK','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SILVER','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SILVER','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SPICES','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SPICES','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SUGAR','TERRAIN_GRASS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SUGAR','TERRAIN_PLAINS')",
--	"INSERT INTO Resource_FeatureTerrainBooleans VALUES('RESOURCE_SUGAR','TERRAIN_DESERT')",
--
--	-- reset Resource_FeatureBooleans
--	-- this table list the feature needed for the resource to appears on terrains listed in Resource_FeatureTerrainBooleans
--	"DELETE FROM Resource_FeatureBooleans",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_IRON','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_COAL','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_OIL','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_OIL','FEATURE_MARSH')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_ALUMINUM','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_URANIUM','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_URANIUM','FEATURE_MARSH')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_BANANA','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_DEER','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_WHEAT','FEATURE_FLOOD_PLAINS')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_DYE','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_FUR','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_GEMS','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_GOLD','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_SILK','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_SILVER','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_SPICES','FEATURE_FOREST')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_SUGAR','FEATURE_FLOOD_PLAINS')",
--	"INSERT INTO Resource_FeatureBooleans VALUES('RESOURCE_SUGAR','FEATURE_MARSH')",
--	
--	-- specific placement rules, available variables
--	-- see CaclulateNumResourcesToAdd(resource) in WorldBuilderRandomItems.lua for details on calculations
--	--
--	-- PlacementOrder : ?
--	-- ConstAppearance : base number
--	-- MinLatitude
--	-- MaxLatitude
--	-- RandApp1 : randomized and added to ConstAppearance
--	-- RandApp2 : randomized and added to ConstAppearance
--	-- RandApp3 : randomized and added to ConstAppearance
--	-- RandApp4 : randomized and added to ConstAppearance
--	-- Player :  % per player
--	-- TilesPer : number tiles for one resource of this type ? (high number means less resource)
--	-- MinLandPercent : ?
--	-- Unique : ?
--	-- GroupRange: ?
--	-- GroupRand : ?
--	-- ResourceUsage : ?
--	-- PresentOnAllValidPlots : I suppose make it appears on all plots that can host it
--	-- Area : ?
--	-- Hills : true (=1) means must be on hills
--	-- Flatlands : true (=1) means must be on flatlands
--	-- NoRiverSide : true (=1) means can't be near river
--	--
--	-- Added variables
--	-- AbsoluteBaseAmount : number of resource unaltered by other variable (available tiles, number of players, ...) except AbsoluteVarPercent
--	-- AbsoluteVarPercent : modify AbsoluteBaseAmount to a random number in the range of AbsoluteBaseAmount-(AbsoluteVarPercent*AbsoluteBaseAmount/100) and AbsoluteBaseAmount+(AbsoluteVarPercent*AbsoluteBaseAmount/100)
--	
--	 "UPDATE Resources SET AbsoluteBaseAmount = 22 WHERE Type='RESOURCE_HORSE'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 18 WHERE Type='RESOURCE_IRON'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 16 WHERE Type='RESOURCE_COAL'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 13 WHERE Type='RESOURCE_OIL'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 13 WHERE Type='RESOURCE_ALUMINUM'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 8 WHERE Type='RESOURCE_URANIUM'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 4 WHERE Type='RESOURCE_BANANA'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 36 WHERE Type='RESOURCE_COW'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 28 WHERE Type='RESOURCE_DEER'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 36 WHERE Type='RESOURCE_FISH'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 36 WHERE Type='RESOURCE_SHEEP'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 20 WHERE Type='RESOURCE_STONE'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 36 WHERE Type='RESOURCE_WHEAT'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 2 WHERE Type='RESOURCE_COTTON'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 4 WHERE Type='RESOURCE_DYE'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 16 WHERE Type='RESOURCE_FUR'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 8 WHERE Type='RESOURCE_GEMS'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 8 WHERE Type='RESOURCE_GOLD'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 8 WHERE Type='RESOURCE_INCENSE'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 6 WHERE Type='RESOURCE_IVORY'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 12 WHERE Type='RESOURCE_MARBLE'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 8 WHERE Type='RESOURCE_PEARLS'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 4 WHERE Type='RESOURCE_SILK'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 12 WHERE Type='RESOURCE_SILVER'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 8 WHERE Type='RESOURCE_SPICES'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 2 WHERE Type='RESOURCE_SUGAR'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 2 WHERE Type='RESOURCE_WHALE'",
--	 "UPDATE Resources SET AbsoluteBaseAmount = 16 WHERE Type='RESOURCE_WINE'",
--	},
