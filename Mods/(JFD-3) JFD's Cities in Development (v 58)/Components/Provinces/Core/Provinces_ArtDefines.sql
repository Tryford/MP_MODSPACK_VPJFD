--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 							Filename, 					LoadType)
VALUES	('SND_SOUND_JFD_LEVIES', 			'Levies',					'DynamicResident');	
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 							SoundID, 					SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_SOUND_JFD_LEVIES',			'SND_SOUND_JFD_LEVIES', 	'GAME_SFX', 	-1.0,					100, 		100, 		0, 		 0);
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconTextureAtlases 
		(Atlas, 							IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_PROVINCES_BUILDING_ATLAS',	256, 		'JFD_ProvincesBuildingAtlas_256.dds',	2, 				2),
		('JFD_PROVINCES_BUILDING_ATLAS',	128, 		'JFD_ProvincesBuildingAtlas_128.dds',	2, 				2),
		('JFD_PROVINCES_BUILDING_ATLAS',	64, 		'JFD_ProvincesBuildingAtlas_64.dds',	2, 				2),
		('JFD_PROVINCES_BUILDING_ATLAS',	45, 		'JFD_ProvincesBuildingAtlas_45.dds',	2, 				2),
		('JFD_PROVINCES_MISSION_ATLAS',		64, 		'JFD_ProvincesMissionAtlas_64.dds',		1, 				1),
		('JFD_PROVINCES_MISSION_ATLAS',		45, 		'JFD_ProvincesMissionAtlas_45.dds',		1, 				1);
--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
-- IconFontTextures
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_BARONY', 	'JFD_BaronyFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);	

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_COUNTY', 	'JFD_CountyFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);			

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_DUCHY', 		'JFD_DuchyFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);		

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CAPITAL', 	'JFD_CapitalFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);			

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_LEVIES', 	'JFD_LeviesFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE_LEVIES' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontMapping 
		(IconName, 							IconFontTexture,						IconMapping)
SELECT	'ICON_JFD_BARONY',					'ICON_FONT_TEXTURE_JFD_BARONY',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 							IconFontTexture,						IconMapping)
SELECT	'ICON_JFD_COUNTY',					'ICON_FONT_TEXTURE_JFD_COUNTY',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 							IconFontTexture,						IconMapping)
SELECT	'ICON_JFD_DUCHY',					'ICON_FONT_TEXTURE_JFD_DUCHY',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 							IconFontTexture,						IconMapping)
SELECT	'ICON_JFD_CAPITAL',					'ICON_FONT_TEXTURE_JFD_CAPITAL',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 							IconFontTexture,						IconMapping)
SELECT	'ICON_JFD_LEVIES',					'ICON_FONT_TEXTURE_JFD_LEVIES',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE_LEVIES' AND Value = 1);
--==========================================================================================================================
-- IMPROVEMENT GRAPHICS
--==========================================================================================================================
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 						TileType,		 Asset)
VALUES	('ART_DEF_IMPROVEMENT_JFD_OUTDOOR_MARKET', 	'Improvement',	 'SV_TradingPost.dds'),
		('ART_DEF_IMPROVEMENT_JFD_VILLAGE', 		'Improvement',	 'SV_TradingPost.dds'),
		('ART_DEF_IMPROVEMENT_JFD_TOWN', 			'Improvement',	 'SV_TradingPost.dds');
------------------------------------------------------------------------------------------------------------------------		
-- ArtDefine_LandmarkTypes
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_LandmarkTypes 
		(Type, 										LandmarkType,		FriendlyName)
VALUES	('ART_DEF_IMPROVEMENT_JFD_OUTDOOR_MARKET', 	'Improvement',		'Outdoor Market'),
		('ART_DEF_IMPROVEMENT_JFD_VILLAGE', 		'Improvement',		'Village'),
		('ART_DEF_IMPROVEMENT_JFD_TOWN', 			'Improvement',		'Town');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_Landmarks
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_Landmarks 
		(Era, 			State,					Scale, ImprovementType,								LayoutHandler,	ResourceType,			Model,					TerrainContour, Tech)
VALUES	--Trading Post
		('Ancient', 	'UnderConstruction',	0.7,	'ART_DEF_IMPROVEMENT_JFD_OUTDOOR_MARKET',	'RANDOM',		'ART_DEF_RESOURCE_ALL', 'hb_med_town1.fxsxml',	1,				NULL),
		('Ancient', 	'Constructed',			0.7,	'ART_DEF_IMPROVEMENT_JFD_OUTDOOR_MARKET',	'RANDOM',		'ART_DEF_RESOURCE_ALL', 'med_town1.fxsxml',		1,				NULL),
		('Ancient', 	'Pillaged',				0.7,	'ART_DEF_IMPROVEMENT_JFD_OUTDOOR_MARKET',	'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_med_town1.fxsxml',	1,				NULL),
		('Ancient', 	'UnderConstruction',	0.7,	'ART_DEF_IMPROVEMENT_JFD_OUTDOOR_MARKET',	'RANDOM',		'ART_DEF_RESOURCE_ALL', 'hb_med_town2.fxsxml',	1,				NULL),
		('Ancient', 	'Constructed',			0.7,	'ART_DEF_IMPROVEMENT_JFD_OUTDOOR_MARKET',	'RANDOM',		'ART_DEF_RESOURCE_ALL', 'med_town2.fxsxml',		1,				NULL),
		('Ancient', 	'Pillaged',				0.7,	'ART_DEF_IMPROVEMENT_JFD_OUTDOOR_MARKET',	'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_med_town2.fxsxml',	1,				NULL),
		('Ancient', 	'UnderConstruction',	0.7,	'ART_DEF_IMPROVEMENT_JFD_OUTDOOR_MARKET',	'RANDOM',		'ART_DEF_RESOURCE_ALL', 'hb_med_town3.fxsxml',	1,				NULL),
		('Ancient', 	'Constructed',			0.7,	'ART_DEF_IMPROVEMENT_JFD_OUTDOOR_MARKET',	'RANDOM',		'ART_DEF_RESOURCE_ALL', 'med_town3.fxsxml',		1,				NULL),
		('Ancient', 	'Pillaged',				0.7,	'ART_DEF_IMPROVEMENT_JFD_OUTDOOR_MARKET',	'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_med_town3.fxsxml',	1,				NULL),
		('Ancient', 	'UnderConstruction',	0.7,	'ART_DEF_IMPROVEMENT_JFD_OUTDOOR_MARKET',	'RANDOM',		'ART_DEF_RESOURCE_ALL', 'hb_med_town4.fxsxml',	1,				NULL),
		('Ancient', 	'Constructed',			0.7,	'ART_DEF_IMPROVEMENT_JFD_OUTDOOR_MARKET',	'RANDOM',		'ART_DEF_RESOURCE_ALL', 'med_town4.fxsxml',		1,				NULL),
		('Ancient', 	'Pillaged',				0.7,	'ART_DEF_IMPROVEMENT_JFD_OUTDOOR_MARKET',	'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_med_town4.fxsxml',	1,				NULL),
		('Industrial', 	'UnderConstruction',	0.7,	'ART_DEF_IMPROVEMENT_JFD_OUTDOOR_MARKET',	'RANDOM',		'ART_DEF_RESOURCE_ALL', 'hb_med_town1.fxsxml',	1,				NULL),
		('Industrial', 	'Constructed',			0.7,	'ART_DEF_IMPROVEMENT_JFD_OUTDOOR_MARKET',	'RANDOM',		'ART_DEF_RESOURCE_ALL', 'med_town1.fxsxml',		1,				NULL),
		('Industrial', 	'Pillaged',				0.7,	'ART_DEF_IMPROVEMENT_JFD_OUTDOOR_MARKET',	'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_med_town1.fxsxml',	1,				NULL),
		('Industrial', 	'UnderConstruction',	0.7,	'ART_DEF_IMPROVEMENT_JFD_OUTDOOR_MARKET',	'RANDOM',		'ART_DEF_RESOURCE_ALL', 'hb_med_town2.fxsxml',	1,				NULL),
		('Industrial', 	'Constructed',			0.7,	'ART_DEF_IMPROVEMENT_JFD_OUTDOOR_MARKET',	'RANDOM',		'ART_DEF_RESOURCE_ALL', 'med_town2.fxsxml',		1,				NULL),
		('Industrial', 	'Pillaged',				0.7,	'ART_DEF_IMPROVEMENT_JFD_OUTDOOR_MARKET',	'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_med_town2.fxsxml',	1,				NULL),
		('Industrial', 	'UnderConstruction',	0.7,	'ART_DEF_IMPROVEMENT_JFD_OUTDOOR_MARKET',	'RANDOM',		'ART_DEF_RESOURCE_ALL', 'hb_med_town3.fxsxml',	1,				NULL),
		('Industrial', 	'Constructed',			0.7,	'ART_DEF_IMPROVEMENT_JFD_OUTDOOR_MARKET',	'RANDOM',		'ART_DEF_RESOURCE_ALL', 'med_town3.fxsxml',		1,				NULL),
		('Industrial', 	'Pillaged',				0.7,	'ART_DEF_IMPROVEMENT_JFD_OUTDOOR_MARKET',	'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_med_town3.fxsxml',	1,				NULL),
		('Industrial', 	'UnderConstruction',	0.7,	'ART_DEF_IMPROVEMENT_JFD_OUTDOOR_MARKET',	'RANDOM',		'ART_DEF_RESOURCE_ALL', 'hb_med_town4.fxsxml',	1,				NULL),
		('Industrial', 	'Constructed',			0.7,	'ART_DEF_IMPROVEMENT_JFD_OUTDOOR_MARKET',	'RANDOM',		'ART_DEF_RESOURCE_ALL', 'med_town4.fxsxml',		1,				NULL),
		('Industrial', 	'Pillaged',				0.7,	'ART_DEF_IMPROVEMENT_JFD_OUTDOOR_MARKET',	'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_med_town4.fxsxml',	1,				NULL),
		--Village
		('Ancient', 	'UnderConstruction',	0.7,	'ART_DEF_IMPROVEMENT_JFD_VILLAGE',			'RANDOM',		'ART_DEF_RESOURCE_ALL', 'hb_mod_town1.fxsxml',	1,				NULL),
		('Ancient', 	'Constructed',			0.7,	'ART_DEF_IMPROVEMENT_JFD_VILLAGE',			'RANDOM',		'ART_DEF_RESOURCE_ALL', 'mod_town1.fxsxml',		1,				NULL),
		('Ancient', 	'Pillaged',				0.7,	'ART_DEF_IMPROVEMENT_JFD_VILLAGE',			'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_mod_town1.fxsxml',	1,				NULL),
		('Ancient', 	'UnderConstruction',	0.7,	'ART_DEF_IMPROVEMENT_JFD_VILLAGE',			'RANDOM',		'ART_DEF_RESOURCE_ALL', 'hb_mod_town2.fxsxml',	1,				NULL),
		('Ancient', 	'Constructed',			0.7,	'ART_DEF_IMPROVEMENT_JFD_VILLAGE',			'RANDOM',		'ART_DEF_RESOURCE_ALL', 'mod_town2.fxsxml',		1,				NULL),
		('Ancient', 	'Pillaged',				0.7,	'ART_DEF_IMPROVEMENT_JFD_VILLAGE',			'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_mod_town2.fxsxml',	1,				NULL),
		('Ancient', 	'UnderConstruction',	0.7,	'ART_DEF_IMPROVEMENT_JFD_VILLAGE',			'RANDOM',		'ART_DEF_RESOURCE_ALL', 'hb_mod_town3.fxsxml',	1,				NULL),
		('Ancient', 	'Constructed',			0.7,	'ART_DEF_IMPROVEMENT_JFD_VILLAGE',			'RANDOM',		'ART_DEF_RESOURCE_ALL', 'mod_town3.fxsxml',		1,				NULL),
		('Ancient', 	'Pillaged',				0.7,	'ART_DEF_IMPROVEMENT_JFD_VILLAGE',			'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_mod_town3.fxsxml',	1,				NULL),
		('Ancient', 	'UnderConstruction',	0.7,	'ART_DEF_IMPROVEMENT_JFD_VILLAGE',			'RANDOM',		'ART_DEF_RESOURCE_ALL', 'hb_mod_town4.fxsxml',	1,				NULL),
		('Ancient', 	'Constructed',			0.7,	'ART_DEF_IMPROVEMENT_JFD_VILLAGE',			'RANDOM',		'ART_DEF_RESOURCE_ALL', 'mod_town4.fxsxml',		1,				NULL),
		('Ancient', 	'Pillaged',				0.7,	'ART_DEF_IMPROVEMENT_JFD_VILLAGE',			'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_mod_town4.fxsxml',	1,				NULL),
		('Industrial', 	'UnderConstruction',	0.7,	'ART_DEF_IMPROVEMENT_JFD_VILLAGE',			'RANDOM',		'ART_DEF_RESOURCE_ALL', 'hb_mod_town1.fxsxml',	1,				NULL),
		('Industrial', 	'Constructed',			0.7,	'ART_DEF_IMPROVEMENT_JFD_VILLAGE',			'RANDOM',		'ART_DEF_RESOURCE_ALL', 'mod_town1.fxsxml',		1,				NULL),
		('Industrial', 	'Pillaged',				0.7,	'ART_DEF_IMPROVEMENT_JFD_VILLAGE',			'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_mod_town1.fxsxml',	1,				NULL),
		('Industrial', 	'UnderConstruction',	0.7,	'ART_DEF_IMPROVEMENT_JFD_VILLAGE',			'RANDOM',		'ART_DEF_RESOURCE_ALL', 'hb_mod_town2.fxsxml',	1,				NULL),
		('Industrial', 	'Constructed',			0.7,	'ART_DEF_IMPROVEMENT_JFD_VILLAGE',			'RANDOM',		'ART_DEF_RESOURCE_ALL', 'mod_town2.fxsxml',		1,				NULL),
		('Industrial', 	'Pillaged',				0.7,	'ART_DEF_IMPROVEMENT_JFD_VILLAGE',			'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_mod_town2.fxsxml',	1,				NULL),
		('Industrial', 	'UnderConstruction',	0.7,	'ART_DEF_IMPROVEMENT_JFD_VILLAGE',			'RANDOM',		'ART_DEF_RESOURCE_ALL', 'hb_mod_town3.fxsxml',	1,				NULL),
		('Industrial', 	'Constructed',			0.7,	'ART_DEF_IMPROVEMENT_JFD_VILLAGE',			'RANDOM',		'ART_DEF_RESOURCE_ALL', 'mod_town3.fxsxml',		1,				NULL),
		('Industrial', 	'Pillaged',				0.7,	'ART_DEF_IMPROVEMENT_JFD_VILLAGE',			'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_mod_town3.fxsxml',	1,				NULL),
		('Industrial', 	'UnderConstruction',	0.7,	'ART_DEF_IMPROVEMENT_JFD_VILLAGE',			'RANDOM',		'ART_DEF_RESOURCE_ALL', 'hb_mod_town4.fxsxml',	1,				NULL),
		('Industrial', 	'Constructed',			0.7,	'ART_DEF_IMPROVEMENT_JFD_VILLAGE',			'RANDOM',		'ART_DEF_RESOURCE_ALL', 'mod_town4.fxsxml',		1,				NULL),
		('Industrial', 	'Pillaged',				0.7,	'ART_DEF_IMPROVEMENT_JFD_VILLAGE',			'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_mod_town4.fxsxml',	1,				NULL),
		--Town
		('Ancient', 	'UnderConstruction',	0.9,	'ART_DEF_IMPROVEMENT_JFD_TOWN',				'RANDOM',		'ART_DEF_RESOURCE_ALL', 'hb_mod_town1.fxsxml',	1,				NULL),
		('Ancient', 	'Constructed',			0.9,	'ART_DEF_IMPROVEMENT_JFD_TOWN',				'RANDOM',		'ART_DEF_RESOURCE_ALL', 'mod_town1.fxsxml',		1,				NULL),
		('Ancient', 	'Pillaged',				0.9,	'ART_DEF_IMPROVEMENT_JFD_TOWN',				'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_mod_town1.fxsxml',	1,				NULL),
		('Ancient', 	'UnderConstruction',	0.9,	'ART_DEF_IMPROVEMENT_JFD_TOWN',				'RANDOM',		'ART_DEF_RESOURCE_ALL', 'hb_mod_town2.fxsxml',	1,				NULL),
		('Ancient', 	'Constructed',			0.9,	'ART_DEF_IMPROVEMENT_JFD_TOWN',				'RANDOM',		'ART_DEF_RESOURCE_ALL', 'mod_town2.fxsxml',		1,				NULL),
		('Ancient', 	'Pillaged',				0.9,	'ART_DEF_IMPROVEMENT_JFD_TOWN',				'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_mod_town2.fxsxml',	1,				NULL),
		('Ancient', 	'UnderConstruction',	0.9,	'ART_DEF_IMPROVEMENT_JFD_TOWN',				'RANDOM',		'ART_DEF_RESOURCE_ALL', 'hb_mod_town3.fxsxml',	1,				NULL),
		('Ancient', 	'Constructed',			0.9,	'ART_DEF_IMPROVEMENT_JFD_TOWN',				'RANDOM',		'ART_DEF_RESOURCE_ALL', 'mod_town3.fxsxml',		1,				NULL),
		('Ancient', 	'Pillaged',				0.9,	'ART_DEF_IMPROVEMENT_JFD_TOWN',				'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_mod_town3.fxsxml',	1,				NULL),
		('Ancient', 	'UnderConstruction',	0.9,	'ART_DEF_IMPROVEMENT_JFD_TOWN',				'RANDOM',		'ART_DEF_RESOURCE_ALL', 'hb_mod_town4.fxsxml',	1,				NULL),
		('Ancient', 	'Constructed',			0.9,	'ART_DEF_IMPROVEMENT_JFD_TOWN',				'RANDOM',		'ART_DEF_RESOURCE_ALL', 'mod_town4.fxsxml',		1,				NULL),
		('Ancient', 	'Pillaged',				0.9,	'ART_DEF_IMPROVEMENT_JFD_TOWN',				'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_mod_town4.fxsxml',	1,				NULL),
		('Industrial', 	'UnderConstruction',	0.9,	'ART_DEF_IMPROVEMENT_JFD_TOWN',				'RANDOM',		'ART_DEF_RESOURCE_ALL', 'hb_mod_town1.fxsxml',	1,				NULL),
		('Industrial', 	'Constructed',			0.9,	'ART_DEF_IMPROVEMENT_JFD_TOWN',				'RANDOM',		'ART_DEF_RESOURCE_ALL', 'mod_town1.fxsxml',		1,				NULL),
		('Industrial', 	'Pillaged',				0.9,	'ART_DEF_IMPROVEMENT_JFD_TOWN',				'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_mod_town1.fxsxml',	1,				NULL),
		('Industrial', 	'UnderConstruction',	0.9,	'ART_DEF_IMPROVEMENT_JFD_TOWN',				'RANDOM',		'ART_DEF_RESOURCE_ALL', 'hb_mod_town2.fxsxml',	1,				NULL),
		('Industrial', 	'Constructed',			0.9,	'ART_DEF_IMPROVEMENT_JFD_TOWN',				'RANDOM',		'ART_DEF_RESOURCE_ALL', 'mod_town2.fxsxml',		1,				NULL),
		('Industrial', 	'Pillaged',				0.9,	'ART_DEF_IMPROVEMENT_JFD_TOWN',				'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_mod_town2.fxsxml',	1,				NULL),
		('Industrial', 	'UnderConstruction',	0.9,	'ART_DEF_IMPROVEMENT_JFD_TOWN',				'RANDOM',		'ART_DEF_RESOURCE_ALL', 'hb_mod_town3.fxsxml',	1,				NULL),
		('Industrial', 	'Constructed',			0.9,	'ART_DEF_IMPROVEMENT_JFD_TOWN',				'RANDOM',		'ART_DEF_RESOURCE_ALL', 'mod_town3.fxsxml',		1,				NULL),
		('Industrial', 	'Pillaged',				0.9,	'ART_DEF_IMPROVEMENT_JFD_TOWN',				'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_mod_town3.fxsxml',	1,				NULL),
		('Industrial', 	'UnderConstruction',	0.9,	'ART_DEF_IMPROVEMENT_JFD_TOWN',				'RANDOM',		'ART_DEF_RESOURCE_ALL', 'hb_mod_town4.fxsxml',	1,				NULL),
		('Industrial', 	'Constructed',			0.9,	'ART_DEF_IMPROVEMENT_JFD_TOWN',				'RANDOM',		'ART_DEF_RESOURCE_ALL', 'mod_town4.fxsxml',		1,				NULL),
		('Industrial', 	'Pillaged',				0.9,	'ART_DEF_IMPROVEMENT_JFD_TOWN',				'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pl_mod_town4.fxsxml',	1,				NULL);
--==========================================================================================================================
--==========================================================================================================================
