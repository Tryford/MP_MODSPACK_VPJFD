--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType,										TileType,			Asset)
SELECT	'ART_DEF_IMPROVEMENT_JFD_EDIFICE_COLOSSUS_B',			'Improvement',		'Colossus_SV.dds'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_COLOSSUS' AND Value = 1);

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType,										TileType,			Asset)
SELECT	'ART_DEF_IMPROVEMENT_JFD_EDIFICE_COLOSSUS_HB',			'Improvement',		'Colossus_SV.dds'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_COLOSSUS' AND Value = 1);

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType,										TileType,			Asset)
SELECT	'ART_DEF_IMPROVEMENT_JFD_EDIFICE_CRISTO_REDENTOR_B',	'Improvement',		'CristoRedenter_SV.dds'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_CRISTO_REDENTOR' AND Value = 1);

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType,										TileType,			Asset)
SELECT	'ART_DEF_IMPROVEMENT_JFD_EDIFICE_CRISTO_REDENTOR_HB',	'Improvement',		'CristoRedenter_SV.dds'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_CRISTO_REDENTOR' AND Value = 1);

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType,										TileType,			Asset)
SELECT	'ART_DEF_IMPROVEMENT_JFD_EDIFICE_NEUSCHWANSTEIN_B',		'Improvement',		'Neuschwanstein_SV.dds'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_NEUSCHWANSTEIN' AND Value = 1);

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType,										TileType,			Asset)
SELECT	'ART_DEF_IMPROVEMENT_JFD_EDIFICE_NEUSCHWANSTEIN_HB',	'Improvement',		'Neuschwanstein_SV.dds'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_NEUSCHWANSTEIN' AND Value = 1);

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType,										TileType,			Asset)
SELECT	'ART_DEF_IMPROVEMENT_JFD_EDIFICE_ORACLE_B',				'Improvement',		'Oracle_SV.dds'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_ORACLE' AND Value = 1);

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType,										TileType,			Asset)
SELECT	'ART_DEF_IMPROVEMENT_JFD_EDIFICE_ORACLE_HB',			'Improvement',		'Oracle_SV.dds'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_ORACLE' AND Value = 1);

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType,										TileType,			Asset)
SELECT	'ART_DEF_IMPROVEMENT_JFD_EDIFICE_RED_FORT_B',			'Improvement',		'RedFort_SV.dds'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_RED_FORT' AND Value = 1);

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType,										TileType,			Asset)
SELECT	'ART_DEF_IMPROVEMENT_JFD_EDIFICE_RED_FORT_HB',			'Improvement',		'RedFort_SV.dds'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_RED_FORT' AND Value = 1);

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType,										TileType,			Asset)
SELECT	'ART_DEF_IMPROVEMENT_JFD_EDIFICE_STATUE_LIBERTY_B',		'Improvement',		'StatueLiberty_SV.dds'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_STATUE_LIBERTY' AND Value = 1);

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType,										TileType,			Asset)
SELECT	'ART_DEF_IMPROVEMENT_JFD_EDIFICE_STATUE_LIBERTY_HB',	'Improvement',		'StatueLiberty_SV.dds'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_STATUE_LIBERTY' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------		
-- ArtDefine_LandmarkTypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes 
		(Type,													LandmarkType,		FriendlyName) 
SELECT	'ART_DEF_IMPROVEMENT_JFD_EDIFICE_COLOSSUS_B',			'Improvement',		'JFD_EDIFICE_COLOSSUS_B'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_COLOSSUS' AND Value = 1);

INSERT INTO ArtDefine_LandmarkTypes 
		(Type,													LandmarkType,		FriendlyName) 
SELECT	'ART_DEF_IMPROVEMENT_JFD_EDIFICE_COLOSSUS_HB',			'Improvement',		'JFD_EDIFICE_COLOSSUS_HB'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_COLOSSUS' AND Value = 1);

INSERT INTO ArtDefine_LandmarkTypes 
		(Type,													LandmarkType,		FriendlyName) 
SELECT	'ART_DEF_IMPROVEMENT_JFD_EDIFICE_CRISTO_REDENTOR_B',	'Improvement',		'JFD_EDIFICE_CRISTO_REDENTOR_B'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_CRISTO_REDENTOR' AND Value = 1);

INSERT INTO ArtDefine_LandmarkTypes 
		(Type,													LandmarkType,		FriendlyName) 
SELECT	'ART_DEF_IMPROVEMENT_JFD_EDIFICE_CRISTO_REDENTOR_HB',	'Improvement',		'JFD_EDIFICE_CRISTO_REDENTOR_HB'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_CRISTO_REDENTOR' AND Value = 1);

INSERT INTO ArtDefine_LandmarkTypes 
		(Type,													LandmarkType,		FriendlyName) 
SELECT	'ART_DEF_IMPROVEMENT_JFD_EDIFICE_NEUSCHWANSTEIN_B',		'Improvement',		'JFD_EDIFICE_NEUSCHWANSTEIN_B'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_NEUSCHWANSTEIN' AND Value = 1);

INSERT INTO ArtDefine_LandmarkTypes 
		(Type,													LandmarkType,		FriendlyName) 
SELECT	'ART_DEF_IMPROVEMENT_JFD_EDIFICE_NEUSCHWANSTEIN_HB',	'Improvement',		'JFD_EDIFICE_NEUSCHWANSTEIN_HB'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_NEUSCHWANSTEIN' AND Value = 1);

INSERT INTO ArtDefine_LandmarkTypes 
		(Type,													LandmarkType,		FriendlyName) 
SELECT	'ART_DEF_IMPROVEMENT_JFD_EDIFICE_ORACLE_B',				'Improvement',		'JFD_EDIFICE_ORACLE_B'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_ORACLE' AND Value = 1);

INSERT INTO ArtDefine_LandmarkTypes 
		(Type,													LandmarkType,		FriendlyName) 
SELECT	'ART_DEF_IMPROVEMENT_JFD_EDIFICE_ORACLE_HB',			'Improvement',		'JFD_EDIFICE_ORACLE_HB'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_ORACLE' AND Value = 1);

INSERT INTO ArtDefine_LandmarkTypes 
		(Type,													LandmarkType,		FriendlyName) 
SELECT	'ART_DEF_IMPROVEMENT_JFD_EDIFICE_RED_FORT_B',			'Improvement',		'JFD_EDIFICE_RED_FORT_B'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_RED_FORT' AND Value = 1);

INSERT INTO ArtDefine_LandmarkTypes 
		(Type,													LandmarkType,		FriendlyName) 
SELECT	'ART_DEF_IMPROVEMENT_JFD_EDIFICE_RED_FORT_HB',			'Improvement',		'JFD_EDIFICE_RED_FORT_HB'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_RED_FORT' AND Value = 1);

INSERT INTO ArtDefine_LandmarkTypes 
		(Type,													LandmarkType,		FriendlyName) 
SELECT	'ART_DEF_IMPROVEMENT_JFD_EDIFICE_STATUE_LIBERTY_B',		'Improvement',		'JFD_EDIFICE_STATUE_LIBERTY_B'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_STATUE_LIBERTY' AND Value = 1);

INSERT INTO ArtDefine_LandmarkTypes 
		(Type,													LandmarkType,		FriendlyName) 
SELECT	'ART_DEF_IMPROVEMENT_JFD_EDIFICE_STATUE_LIBERTY_HB',	'Improvement',		'JFD_EDIFICE_STATUE_LIBERTY_HB'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_STATUE_LIBERTY' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_Landmarks
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_Landmarks 
		(Era,	State,	Scale,	ImprovementType,											LayoutHandler,	ResourceType,				Model,							TerrainContour)
SELECT	'Any',	'Any',	1,		'ART_DEF_IMPROVEMENT_JFD_EDIFICE_COLOSSUS_B',				'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'Colossus_B.fxsxml',			0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_COLOSSUS' AND Value = 1);	
	
INSERT INTO ArtDefine_Landmarks 	
		(Era,	State,	Scale,	ImprovementType,											LayoutHandler,	ResourceType,				Model,							TerrainContour)
SELECT	'Any',	'Any',	1,		'ART_DEF_IMPROVEMENT_JFD_EDIFICE_COLOSSUS_HB',				'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'Colossus_HB.fxsxml',			0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_COLOSSUS' AND Value = 1);

INSERT INTO ArtDefine_Landmarks 
		(Era,	State,	Scale,	ImprovementType,											LayoutHandler,	ResourceType,				Model,							TerrainContour)
SELECT	'Any',	'Any',	1,		'ART_DEF_IMPROVEMENT_JFD_EDIFICE_CRISTO_REDENTOR_B',		'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'CristoRedenter_B.fxsxml',		0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_CRISTO_REDENTOR' AND Value = 1);

INSERT INTO ArtDefine_Landmarks 
		(Era,	State,	Scale,	ImprovementType,											LayoutHandler,	ResourceType,				Model,							TerrainContour)
SELECT	'Any',	'Any',	1,		'ART_DEF_IMPROVEMENT_JFD_EDIFICE_CRISTO_REDENTOR_HB',		'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'CristoRedenter_HB.fxsxml',		0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_CRISTO_REDENTOR' AND Value = 1);

INSERT INTO ArtDefine_Landmarks 
		(Era,	State,	Scale,	ImprovementType,											LayoutHandler,	ResourceType,				Model,							TerrainContour)
SELECT	'Any',	'Any',	1,		'ART_DEF_IMPROVEMENT_JFD_EDIFICE_NEUSCHWANSTEIN_B',			'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'Neuschwanstein_B.fxsxml',		0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_NEUSCHWANSTEIN' AND Value = 1);	
	
INSERT INTO ArtDefine_Landmarks 	
		(Era,	State,	Scale,	ImprovementType,											LayoutHandler,	ResourceType,				Model,							TerrainContour)
SELECT	'Any',	'Any',	1,		'ART_DEF_IMPROVEMENT_JFD_EDIFICE_NEUSCHWANSTEIN_HB',		'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'Neuschwanstein_HB.fxsxml',		0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_NEUSCHWANSTEIN' AND Value = 1);

INSERT INTO ArtDefine_Landmarks 
		(Era,	State,	Scale,	ImprovementType,											LayoutHandler,	ResourceType,				Model,							TerrainContour)
SELECT	'Any',	'Any',	1,		'ART_DEF_IMPROVEMENT_JFD_EDIFICE_ORACLE_B',					'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'Oracle_B.fxsxml',				0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_ORACLE' AND Value = 1);	
	
INSERT INTO ArtDefine_Landmarks 	
		(Era,	State,	Scale,	ImprovementType,											LayoutHandler,	ResourceType,				Model,							TerrainContour)
SELECT	'Any',	'Any',	1,		'ART_DEF_IMPROVEMENT_JFD_EDIFICE_ORACLE_HB',				'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'Oracle_HB.fxsxml',				0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_ORACLE' AND Value = 1);

INSERT INTO ArtDefine_Landmarks 
		(Era,	State,	Scale,	ImprovementType,											LayoutHandler,	ResourceType,				Model,							TerrainContour)
SELECT	'Any',	'Any',	1.2,	'ART_DEF_IMPROVEMENT_JFD_EDIFICE_RED_FORT_B',				'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'RedFort_B.fxsxml',				0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_RED_FORT' AND Value = 1);	
	
INSERT INTO ArtDefine_Landmarks 	
		(Era,	State,	Scale,	ImprovementType,											LayoutHandler,	ResourceType,				Model,							TerrainContour)
SELECT	'Any',	'Any',	1.2,	'ART_DEF_IMPROVEMENT_JFD_EDIFICE_RED_FORT_HB',				'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'RedFort_HB.fxsxml',			0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_RED_FORT' AND Value = 1);

INSERT INTO ArtDefine_Landmarks 
		(Era,	State,	Scale,	ImprovementType,											LayoutHandler,	ResourceType,				Model,							TerrainContour)
SELECT	'Any',	'Any',	0.1,	'ART_DEF_IMPROVEMENT_JFD_EDIFICE_STATUE_LIBERTY_B',			'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'StatueLiberty_B.fxsxml',		0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_STATUE_LIBERTY' AND Value = 1);	
	
INSERT INTO ArtDefine_Landmarks 	
		(Era,	State,	Scale,	ImprovementType,											LayoutHandler,	ResourceType,				Model,							TerrainContour)
SELECT	'Any',	'Any',	0.1,	'ART_DEF_IMPROVEMENT_JFD_EDIFICE_STATUE_LIBERTY_HB',		'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'StatueLiberty_HB.fxsxml',		0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_EDIFICES_ADDITIONS_STATUE_LIBERTY' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================