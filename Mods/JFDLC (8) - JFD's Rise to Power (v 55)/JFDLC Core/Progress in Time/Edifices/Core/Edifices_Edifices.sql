--==========================================================================================================================
-- EDIFICES
--==========================================================================================================================
-- Suk_Edifices
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Suk_Edifices 	
		(Type, 							BuildingType, 					ImprovementTypeHB,									ImprovementType,								DynamicAdjaceny)
SELECT	'EDIFICE_JFD_COLOSSUS', 		'BUILDING_COLOSSUS', 			'IMPROVEMENT_JFD_EDIFICE_COLOSSUS_HB',				'IMPROVEMENT_JFD_EDIFICE_COLOSSUS_B',			0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_COLOSSUS' AND Value = 1);

INSERT INTO Suk_Edifices 	
		(Type, 							BuildingType, 					ImprovementTypeHB,									ImprovementType,								DynamicAdjaceny)
SELECT	'EDIFICE_JFD_CRISTO_REDENTOR', 	'BUILDING_CRISTO_REDENTOR', 	'IMPROVEMENT_JFD_EDIFICE_CRISTO_REDENTOR_HB',		'IMPROVEMENT_JFD_EDIFICE_CRISTO_REDENTOR_B',	0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_CRISTO_REDENTOR' AND Value = 1);

INSERT INTO Suk_Edifices 	
		(Type, 							BuildingType, 					ImprovementTypeHB,									ImprovementType,								DynamicAdjaceny)
SELECT	'EDIFICE_JFD_NEUSCHWANSTEIN', 	'BUILDING_NEUSCHWANSTEIN', 		'IMPROVEMENT_JFD_EDIFICE_NEUSCHWANSTEIN_HB',		'IMPROVEMENT_JFD_EDIFICE_NEUSCHWANSTEIN_B',		0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_NEUSCHWANSTEIN' AND Value = 1);

INSERT INTO Suk_Edifices 	
		(Type, 							BuildingType, 					ImprovementTypeHB,									ImprovementType,								DynamicAdjaceny)
SELECT	'EDIFICE_JFD_ORACLE', 			'BUILDING_ORACLE', 				'IMPROVEMENT_JFD_EDIFICE_ORACLE_HB',				'IMPROVEMENT_JFD_EDIFICE_ORACLE_B',				0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_ORACLE' AND Value = 1);

INSERT INTO Suk_Edifices 	
		(Type, 							BuildingType, 					ImprovementTypeHB,									ImprovementType,								DynamicAdjaceny)
SELECT	'EDIFICE_JFD_RED_FORT', 		'BUILDING_RED_FORT', 			'IMPROVEMENT_JFD_EDIFICE_RED_FORT_HB',				'IMPROVEMENT_JFD_EDIFICE_RED_FORT_B',			0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_RED_FORT' AND Value = 1);

INSERT INTO Suk_Edifices 	
		(Type, 							BuildingType, 					ImprovementTypeHB,									ImprovementType,								DynamicAdjaceny)
SELECT	'EDIFICE_JFD_STATUE_LIBERTY', 	'BUILDING_STATUE_OF_LIBERTY', 	'IMPROVEMENT_JFD_EDIFICE_STATUE_LIBERTY_HB',		'IMPROVEMENT_JFD_EDIFICE_STATUE_LIBERTY_B',		0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_STATUE_LIBERTY' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------	
-- Suk_Edifice_Requirements
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Suk_Edifice_Requirements 	
		(EdificeType, 					PlotType,			River,				Lake,				ImprovementType,		FeatureType,		ResourceType,		TerrainType,		Range,	CentreExclude,		RequirementSet)
SELECT	'EDIFICE_JFD_COLOSSUS',			NULL, 				0,					NULL,				NULL,					'NO_FEATURE',		NULL,				'TERRAIN_COAST',	0,		0,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_COLOSSUS' AND Value = 1);

INSERT INTO Suk_Edifice_Requirements 	
		(EdificeType, 					PlotType,			River,				Lake,				ImprovementType,		FeatureType,		ResourceType,		TerrainType,		Range,	CentreExclude,		RequirementSet)
SELECT	'EDIFICE_JFD_COLOSSUS',			NULL, 				NULL,				NULL,				'IMPROVEMENT_CITY',		NULL,				NULL,				NULL,				1,		1,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_COLOSSUS' AND Value = 1);

INSERT INTO Suk_Edifice_Requirements 	
		(EdificeType, 					PlotType,			River,				Lake,				ImprovementType,		FeatureType,		ResourceType,		TerrainType,		Range,	CentreExclude,		RequirementSet)
SELECT	'EDIFICE_JFD_CRISTO_REDENTOR',	'PLOT_HILLS', 		NULL,				NULL,				NULL,					NULL,				NULL,				NULL,				0,		0,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_CRISTO_REDENTOR' AND Value = 1);

INSERT INTO Suk_Edifice_Requirements 	
		(EdificeType, 					PlotType,			River,				Lake,				ImprovementType,		FeatureType,		ResourceType,		TerrainType,		Range,	CentreExclude,		RequirementSet)
SELECT	'EDIFICE_JFD_CRISTO_REDENTOR',	NULL, 				NULL,				NULL,				'IMPROVEMENT_CITY',		NULL,				NULL,				NULL,				1,		1,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_CRISTO_REDENTOR' AND Value = 1);

INSERT INTO Suk_Edifice_Requirements 	
		(EdificeType, 					PlotType,			River,				Lake,				ImprovementType,		FeatureType,		ResourceType,		TerrainType,		Range,	CentreExclude,		RequirementSet)
SELECT	'EDIFICE_JFD_NEUSCHWANSTEIN',	'PLOT_MOUNTAIN', 	NULL,				NULL,				NULL,					NULL,				NULL,				NULL,				0,		0,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_NEUSCHWANSTEIN' AND Value = 1);

INSERT INTO Suk_Edifice_Requirements 	
		(EdificeType, 					PlotType,			River,				Lake,				ImprovementType,		FeatureType,		ResourceType,		TerrainType,		Range,	CentreExclude,		RequirementSet)
SELECT	'EDIFICE_JFD_ORACLE',			'PLOT_HILLS', 		NULL,				NULL,				NULL,					NULL,				NULL,				NULL,				0,		0,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_ORACLE' AND Value = 1);

INSERT INTO Suk_Edifice_Requirements 	
		(EdificeType, 					PlotType,			River,				Lake,				ImprovementType,		FeatureType,		ResourceType,		TerrainType,		Range,	CentreExclude,		RequirementSet)
SELECT	'EDIFICE_JFD_RED_FORT',			'PLOT_LAND', 		NULL,				NULL,				NULL,					NULL,				NULL,				NULL,				0,		0,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_RED_FORT' AND Value = 1);

INSERT INTO Suk_Edifice_Requirements 	
		(EdificeType, 					PlotType,			River,				Lake,				ImprovementType,		FeatureType,		ResourceType,		TerrainType,		Range,	CentreExclude,		RequirementSet)
SELECT	'EDIFICE_JFD_STATUE_LIBERTY',	NULL, 				0,					NULL,				NULL,					'NO_FEATURE',		NULL,				'TERRAIN_COAST',	0,		0,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_STATUE_LIBERTY' AND Value = 1);

INSERT INTO Suk_Edifice_Requirements 	
		(EdificeType, 					PlotType,			River,				Lake,				ImprovementType,		FeatureType,		ResourceType,		TerrainType,		Range,	CentreExclude,		RequirementSet)
SELECT	'EDIFICE_JFD_STATUE_LIBERTY',	NULL, 				NULL,				NULL,				'IMPROVEMENT_CITY',		NULL,				NULL,				NULL,				1,		1,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_STATUE_LIBERTY' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------	
-- Suk_Edifice_Adjacency_YieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Suk_Edifice_Adjacency_YieldChanges 	
		(EdificeType, 					YieldType,			Yield,				PlotType,			ImprovementType,		FeatureType,		ResourceType,		TerrainType,		Range,	CentreExclude)
SELECT	'EDIFICE_JFD_COLOSSUS', 		'YIELD_GOLD',		100,				NULL, 				NULL,					NULL,				NULL,				'TERRAIN_COAST',	1,		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_COLOSSUS' AND Value = 1);

INSERT INTO Suk_Edifice_Adjacency_YieldChanges 	
		(EdificeType, 					YieldType,			Yield,				PlotType,			ImprovementType,		FeatureType,		ResourceType,		TerrainType,		Range,	CentreExclude)
SELECT	'EDIFICE_JFD_CRISTO_REDENTOR', 	'YIELD_FAITH',		200,				'PLOT_HILLS', 		NULL,					NULL,				NULL,				NULL,				0,		0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_CRISTO_REDENTOR' AND Value = 1);

INSERT INTO Suk_Edifice_Adjacency_YieldChanges 	
		(EdificeType, 					YieldType,			Yield,				PlotType,			ImprovementType,		FeatureType,		ResourceType,		TerrainType,		Range,	CentreExclude)
SELECT	'EDIFICE_JFD_CRISTO_REDENTOR', 	'YIELD_CULTURE',	200,				'PLOT_HILLS', 		NULL,					NULL,				NULL,				NULL,				0,		0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_CRISTO_REDENTOR' AND Value = 1);

INSERT INTO Suk_Edifice_Adjacency_YieldChanges 	
		(EdificeType, 					YieldType,			Yield,				PlotType,			ImprovementType,		FeatureType,		ResourceType,		TerrainType,		Range,	CentreExclude)
SELECT	'EDIFICE_JFD_CRISTO_REDENTOR', 	'YIELD_TOURISM',	300,				'PLOT_HILLS', 		NULL,					NULL,				NULL,				NULL,				0,		0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_CRISTO_REDENTOR' AND Value = 1);

INSERT INTO Suk_Edifice_Adjacency_YieldChanges 	
		(EdificeType, 					YieldType,			Yield,				PlotType,			ImprovementType,		FeatureType,		ResourceType,		TerrainType,		Range,	CentreExclude)
SELECT	'EDIFICE_JFD_NEUSCHWANSTEIN', 	'YIELD_CULTURE',	200,				'PLOT_MOUNTAIN', 	NULL,					NULL,				NULL,				NULL,				0,		0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_NEUSCHWANSTEIN' AND Value = 1);

INSERT INTO Suk_Edifice_Adjacency_YieldChanges 	
		(EdificeType, 					YieldType,			Yield,				PlotType,			ImprovementType,		FeatureType,		ResourceType,		TerrainType,		Range,	CentreExclude)
SELECT	'EDIFICE_JFD_NEUSCHWANSTEIN', 	'YIELD_TOURISM',	200,				'PLOT_MOUNTAIN', 	NULL,					NULL,				NULL,				NULL,				0,		0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_NEUSCHWANSTEIN' AND Value = 1);

INSERT INTO Suk_Edifice_Adjacency_YieldChanges 	
		(EdificeType, 					YieldType,			Yield,				PlotType,			ImprovementType,		FeatureType,		ResourceType,		TerrainType,		Range,	CentreExclude)
SELECT	'EDIFICE_JFD_NEUSCHWANSTEIN', 	'YIELD_CULTURE',	200,				'PLOT_MOUNTAIN', 	NULL,					NULL,				NULL,				NULL,				1,		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_NEUSCHWANSTEIN' AND Value = 1);

INSERT INTO Suk_Edifice_Adjacency_YieldChanges 	
		(EdificeType, 					YieldType,			Yield,				PlotType,			ImprovementType,		FeatureType,		ResourceType,		TerrainType,		Range,	CentreExclude)
SELECT	'EDIFICE_JFD_NEUSCHWANSTEIN', 	'YIELD_TOURISM',	200,				'PLOT_MOUNTAIN', 	NULL,					NULL,				NULL,				NULL,				1,		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_NEUSCHWANSTEIN' AND Value = 1);

INSERT INTO Suk_Edifice_Adjacency_YieldChanges 	
		(EdificeType, 					YieldType,			Yield,				PlotType,			ImprovementType,		FeatureType,		ResourceType,		TerrainType,		Range,	CentreExclude)
SELECT	'EDIFICE_JFD_ORACLE', 			'YIELD_FAITH',		100,				'PLOT_HILLS', 		NULL,					NULL,				NULL,				NULL,				0,		0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_ORACLE' AND Value = 1);

INSERT INTO Suk_Edifice_Adjacency_YieldChanges 	
		(EdificeType, 					YieldType,			Yield,				PlotType,			ImprovementType,		FeatureType,		ResourceType,		TerrainType,		Range,	CentreExclude)
SELECT	'EDIFICE_JFD_ORACLE', 			'YIELD_FAITH',		100,				'PLOT_MOUNTAIN', 	NULL,					NULL,				NULL,				NULL,				1,		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_ORACLE' AND Value = 1);

INSERT INTO Suk_Edifice_Adjacency_YieldChanges 	
		(EdificeType, 					YieldType,			Yield,				PlotType,			ImprovementType,		FeatureType,		ResourceType,		TerrainType,		Range,	CentreExclude)
SELECT	'EDIFICE_JFD_STATUE_LIBERTY', 	'YIELD_TOURISM',	500,				NULL, 				NULL,					'NO_FEATURE',		NULL,				'TERRAIN_COAST',	0,		0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_STATUE_LIBERTY' AND Value = 1);
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings
SET ArtDefineTag = NULL, DisplayPosition = 0
WHERE Type = 'BUILDING_COLOSSUS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_COLOSSUS' AND Value = 1);

UPDATE Buildings
SET ArtDefineTag = NULL, DisplayPosition = 0
WHERE Type = 'BUILDING_CRISTO_REDENTOR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_CRISTO_REDENTOR' AND Value = 1);

UPDATE Buildings
SET ArtDefineTag = NULL, DisplayPosition = 0
WHERE Type = 'BUILDING_NEUSCHWANSTEIN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_NEUSCHWANSTEIN' AND Value = 1);

UPDATE Buildings
SET ArtDefineTag = NULL, DisplayPosition = 0
WHERE Type = 'BUILDING_ORACLE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_ORACLE' AND Value = 1);

UPDATE Buildings
SET ArtDefineTag = NULL, DisplayPosition = 0
WHERE Type = 'BUILDING_RED_FORT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_RED_FORT' AND Value = 1);

UPDATE Buildings
SET ArtDefineTag = NULL, DisplayPosition = 0
WHERE Type = 'BUILDING_STATUE_OF_LIBERTY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_STATUE_LIBERTY' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
--------------------------------------------------------------------------------------------------------------------------
UPDATE Building_YieldChanges 
SET Yield = 3
WHERE BuildingType = 'BUILDING_COLOSSUS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_COLOSSUS' AND Value = 1);

DELETE FROM Building_YieldChanges 
WHERE BuildingType = 'BUILDING_CRISTO_REDENTOR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_CRISTO_REDENTOR' AND Value = 1);
--==========================================================================================================================
-- TEXT
--==========================================================================================================================
-- Language_en_US
--------------------------------------------------------------------------------------------------------------------------
UPDATE Language_en_US
SET Text =  'This [ICON_SUK_EDIFICE] Edifice must be built on a coastal tile adjacent to a city. +1 [ICON_GOLD] Gold for each adjacent coastal tile.[NEWLINE][NEWLINE]' || Text
WHERE Tag = (SELECT Help FROM Buildings WHERE Type = 'BUILDING_COLOSSUS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_COLOSSUS' AND Value = 1);

UPDATE Language_en_US
SET Text =  'This [ICON_SUK_EDIFICE] Edifice must be built on a hill tile adjacent to a city. +2 [ICON_CULTURE] Culture, +2 [ICON_PEACE] Faith, and +3 [ICON_TOURISM] Tourism.[NEWLINE][NEWLINE]' || Text
WHERE Tag = (SELECT Help FROM Buildings WHERE Type = 'BUILDING_CRISTO_REDENTOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_CRISTO_REDENTOR' AND Value = 1);

UPDATE Language_en_US
SET Text =  'This [ICON_SUK_EDIFICE] Edifice must be built on a flatland tile. +2 [ICON_CULTURE] Culture and [ICON_TOURISM] Tourism, and +2 [ICON_CULTURE] Culture and [ICON_TOURISM] Tourism for each adjacent Mountain.[NEWLINE][NEWLINE]' || Text
WHERE Tag = (SELECT Help FROM Buildings WHERE Type = 'BUILDING_NEUSCHWANSTEIN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_NEUSCHWANSTEIN' AND Value = 1);

UPDATE Language_en_US
SET Text =  'This [ICON_SUK_EDIFICE] Edifice must be built on a hill tile. +1 [ICON_PEACE] Faith and +1 [ICON_PEACE] Faith for each adjacent Mountain.[NEWLINE][NEWLINE]' || Text
WHERE Tag = (SELECT Help FROM Buildings WHERE Type = 'BUILDING_ORACLE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_ORACLE' AND Value = 1);

UPDATE Language_en_US
SET Text =  'This [ICON_SUK_EDIFICE] Edifice must be built on a flatland tile. Any unit stationed on the Red Fort receives a 100% defensive strength bonus. Additionally, any enemy unit which ends its turn next to the Red Fort takes 50 damage.[NEWLINE][NEWLINE]' || Text
WHERE Tag = (SELECT Help FROM Buildings WHERE Type = 'BUILDING_RED_FORT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_RED_FORT' AND Value = 1);

UPDATE Language_en_US
SET Text =  'This [ICON_SUK_EDIFICE] Edifice must be built on a coastal tile adjacent to a city. +5 [ICON_TOURISM] Tourism.[NEWLINE][NEWLINE]' || Text
WHERE Tag = (SELECT Help FROM Buildings WHERE Type = 'BUILDING_STATUE_OF_LIBERTY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_STATUE_LIBERTY' AND Value = 1);
--==========================================================================================================================	
--==========================================================================================================================