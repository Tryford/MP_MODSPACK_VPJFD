--==========================================================================================================================
-- EDIFICE
--==========================================================================================================================
-- Suk_Edifices
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Suk_Edifices (
	ID  														integer 													primary key autoincrement,
	Type  														text 		UNIQUE											default NULL,
	BuildingType  												text 		REFERENCES Buildings(Type) 						default NULL,
	ImprovementTypeHB											text														default NULL,
	ImprovementType												text														default NULL,
	DynamicAdjaceny												boolean														default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Suk_Edifice_Requirement
-- Invert makes the requirement into something that must be avoided:
-- i.e. a Terrain_Desert requirement with an invert would become "Cannot build next to Desert"

-- NO_FEATURE, NO_RESOURCE, NO_IMPROVEMENT and IMPROVEMENT_CITY are valid entries
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Suk_Edifice_Requirements (
	EdificeType  												text														default NULL,
	
	-- If multiple fields are filled, they must be true of a single plot to return true
	-- So if you'd like a building to be next to a forest and next to tundra, but not neccesarily next to forested tundra,
	-- then use two separate entries in the same RequirementSet
	PlotType													text														default NULL,	
	TerrainType  												text														default NULL,
	FeatureType													text														default NULL,
	ResourceType												text 														default NULL,
	ImprovementType												text 														default NULL,
	River														boolean														default NULL,
	Lake														boolean														default NULL,
	FreshWater													boolean														default NULL,

	Range														integer														default 0,
	CentreExclude												boolean														default 0,
	IsNegative													boolean														default 0,
	RequirementSet												integer														default 1);
--------------------------------------------------------------------------------------------------------------------------
-- Suk_Edifice_Adjacency_YieldChanges
-- Yield is x100, so if you'd like to provide 1 Faith per Desert, then yield should be set at 100
-- Unlike Civ 6, the bonus is applied to the Polt! The tile must still be worked!

-- PLOT_LAND_HILLS, NO_FEATURE, NO_RESOURCE, NO_IMPROVEMENT and IMPROVEMENT_CITY are valid entries\
-- Description doesn't do anything right now :P
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Suk_Edifice_Adjacency_YieldChanges (
	EdificeType  												text														default NULL,
	Description													text														default NULL,
	YieldType													text														default NULL,
	Yield														integer														default 0,

	-- Refer to notes on Suk_Edifice_Requirement
	PlotType													text														default NULL,	
	TerrainType  												text														default NULL,
	FeatureType													text														default NULL,
	ResourceType												text 														default NULL,
	ImprovementType												text 														default NULL,
	River														boolean														default NULL,
	Lake														boolean														default NULL,
	FreshWater													boolean														default NULL,
	
	-- Additional Details
	Range														integer														default 1,
	CentreExclude												boolean														default 0,
	IsNegative													boolean														default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Suk_Edifice_CustomAdjacency
-- Allows modders to easliy retrieve Adjacency Bonuses for use in other functions
-- For example, if you have a wonder that gives experience based off an adjacency bonus, you can use this to aid in calculating
-- how much it should give
-- Use this in conjuction with Plot.GetCustomAdjacencyBonus(tAdjBonus)
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Suk_Edifice_CustomAdjacency (
	ID  														integer 													primary key autoincrement,
	EdificeAdjacencyType  										text 		UNIQUE											default NULL,
	Description													text														default NULL,

	-- Refer to notes on Suk_Edifice_Requirement
	PlotType													text														default NULL,	
	TerrainType  												text														default NULL,
	FeatureType													text														default NULL,
	ResourceType												text 														default NULL,
	ImprovementType												text 														default NULL,
	River														boolean														default NULL,
	Lake														boolean														default NULL,
	FreshWater													boolean														default NULL,
	
	-- Additional Details
	Range														integer														default 1,
	CentreExclude												boolean														default 0,
	IsNegative													boolean														default 0);
--------------------------------------------------------------------------------------------------------------------------
-- Suk_Edifice_RegionalFreeBuilding
-- This honestly is easier than dealing directlu with City Yields, and would work with custom yields like
-- Health and Development besides, so just fill this thing with a free building of your choice, and all
-- Cities in range will recieve it for free.

-- the NoMaintenance will use the function SetNumFreeBuilding when the Community Patch is active
-- It otherwise has no effect.
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Suk_Edifice_RegionalFreeBuilding (
	EdificeType  												text														default NULL,
	BuildingType  												text 		REFERENCES Buildings(Type) 						default NULL,
	Range														integer														default 6,
	RemovedWhenLost												boolean														default 1,
	NoMaintenance												boolean														default 0);
--==========================================================================================================================
--==========================================================================================================================