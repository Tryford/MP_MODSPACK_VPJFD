--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 								Filename, 							LoadType)
VALUES	('SND_SOUND_JFD_MAGISTRATE', 			'Magistrate',						'DynamicResident'),
		('SND_WONDER_SPEECH_JFD_PENA',			'Wonder_Pena',						'DynamicResident');
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 								SoundID, 							SoundType, 				TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_SOUND_JFD_MAGISTRATE',			'SND_SOUND_JFD_MAGISTRATE', 		'GAME_SFX', 			-1.0,					100, 		100, 		0, 		 0),
		('AS2D_WONDER_SPEECH_JFD_PENA',			'SND_WONDER_SPEECH_JFD_PENA', 		'GAME_MUSIC_STINGS', 	0.0,					75, 		75, 		0, 		 0);
--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
-- IconFontTextures
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_COLONY', 	'JFD_ColonyFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_MAGISTRATE', 'JFD_MagistrateFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontMapping 
		(IconName, 							IconFontTexture,					IconMapping)
SELECT	'ICON_JFD_COLONY',					'ICON_FONT_TEXTURE_JFD_COLONY',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 							IconFontTexture,					IconMapping)
SELECT	'ICON_JFD_MAGISTRATE',				'ICON_FONT_TEXTURE_JFD_MAGISTRATE',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_COLONIES_BUILDING_ATLAS',			256, 		'JFD_ColoniesBuildings_256.dds',		2, 				2),
		('JFD_COLONIES_BUILDING_ATLAS',			128, 		'JFD_ColoniesBuildings_128.dds',		2, 				2),
		('JFD_COLONIES_BUILDING_ATLAS',			64, 		'JFD_ColoniesBuildings_64.dds',			2, 				2),
		('JFD_COLONIES_BUILDING_ATLAS',			45, 		'JFD_ColoniesBuildings_45.dds',			2, 				2),
		('JFD_COLONIES_BUILDING_ATLAS',			32, 		'JFD_ColoniesBuildings_32.dds',			2, 				2),
		('JFD_COLONIES_MISSION_ATLAS',			64, 		'JFD_ColoniesMissionAtlas_64.dds',		1, 				1),
		('JFD_COLONIES_MISSION_ATLAS',			45, 		'JFD_ColoniesMissionAtlas_45.dds',		1, 				1),
		('JFD_COLONIES_UNIT_ATLAS',				256, 		'JFD_ColoniesUnitAtlas_256.dds',		1, 				1),
		('JFD_COLONIES_UNIT_ATLAS',				128, 		'JFD_ColoniesUnitAtlas_128.dds',		1, 				1),
		('JFD_COLONIES_UNIT_ATLAS',				80, 		'JFD_ColoniesUnitAtlas_80.dds',			1, 				1),
		('JFD_COLONIES_UNIT_ATLAS',				64, 		'JFD_ColoniesUnitAtlas_64.dds',			1, 				1),
		('JFD_COLONIES_UNIT_ATLAS',				45, 		'JFD_ColoniesUnitAtlas_45.dds',			1, 				1),
		('JFD_UNIT_FLAG_COLONIST_ATLAS',		32, 		'JFD_ColonistUnitFlag_32.dds',			1, 				1);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 					TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_COLONIST', 			'Unit', 	'sv_Colonist.dds'),
		('ART_DEF_UNIT_JFD_COLONIST_AFRI', 		'Unit', 	'sv_Colonist.dds'),
		('ART_DEF_UNIT_JFD_COLONIST_AMER', 		'Unit', 	'sv_Colonist.dds'),
		('ART_DEF_UNIT_JFD_COLONIST_ASIA', 		'Unit', 	'sv_Colonist.dds');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_COLONIST',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT__SETTLER';

INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_COLONIST_AFRI',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT__SETTLER_AFRI';

INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_COLONIST_AMER',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT__SETTLER_AMER';

INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_COLONIST_ASIA',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT__SETTLER_ASIA';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_UnitInfoMemberInfos 
		(UnitInfoType,						UnitMemberInfoType,	NumMembers)
SELECT	'ART_DEF_UNIT_JFD_COLONIST',		UnitMemberInfoType,	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER';

INSERT INTO ArtDefine_UnitInfoMemberInfos 
		(UnitInfoType, 						UnitMemberInfoType,	NumMembers)
SELECT	'ART_DEF_UNIT_JFD_COLONIST_AFRI',	UnitMemberInfoType,	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_AFRI';

INSERT INTO ArtDefine_UnitInfoMemberInfos 
		(UnitInfoType, 						UnitMemberInfoType,	NumMembers)
SELECT	'ART_DEF_UNIT_JFD_COLONIST_AMER',	UnitMemberInfoType,	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_AMER';

INSERT INTO ArtDefine_UnitInfoMemberInfos 
		(UnitInfoType, 						UnitMemberInfoType,	NumMembers)
SELECT	'ART_DEF_UNIT_JFD_COLONIST_ASIA',	UnitMemberInfoType,	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_ASIA';
--==========================================================================================================================
--==========================================================================================================================