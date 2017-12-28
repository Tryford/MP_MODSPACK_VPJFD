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
