--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 								LoadType)
VALUES	('SND_WONDER_SPEECH_JFD_THREE_GORGES',		'Wonder_ThreeGorges',					'DynamicResident');	
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 								SoundType, 				TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_WONDER_SPEECH_JFD_THREE_GORGES',		'SND_WONDER_SPEECH_JFD_THREE_GORGES', 	'GAME_MUSIC_STINGS', 	0.0,					75, 		75, 		0, 		 0);
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconTextureAtlases 
		(Atlas, 							IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_POWER_BUILDING_ATLAS',		256, 		'JFD_PowerBuildingAtlas_256.dds',			2, 				2),
		('JFD_POWER_BUILDING_ATLAS',		128, 		'JFD_PowerBuildingAtlas_128.dds',			2, 				2),
		('JFD_POWER_BUILDING_ATLAS',		80, 		'JFD_PowerBuildingAtlas_80.dds',			2, 				2),
		('JFD_POWER_BUILDING_ATLAS',		64, 		'JFD_PowerBuildingAtlas_64.dds',			2, 				2),
		('JFD_POWER_BUILDING_ATLAS',		45, 		'JFD_PowerBuildingAtlas_45.dds',			2, 				2),
		('JFD_POWER_WONDER_ATLAS',			256, 		'JFD_PowerWonderAtlas_256.dds',				1, 				1),
		('JFD_POWER_WONDER_ATLAS',			128, 		'JFD_PowerWonderAtlas_128.dds',				1, 				1),
		('JFD_POWER_WONDER_ATLAS',			80, 		'JFD_PowerWonderAtlas_80.dds',				1, 				1),
		('JFD_POWER_WONDER_ATLAS',			64, 		'JFD_PowerWonderAtlas_64.dds',				1, 				1),
		('JFD_POWER_WONDER_ATLAS',			45, 		'JFD_PowerWonderAtlas_45.dds',				1, 				1);
--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
-- IconFontTextures
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_POWER', 		'JFD_Power_22_Fonticons'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_CORE' AND Value = 1);	
------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontMapping 
		(IconName, 							IconFontTexture,					IconMapping)
SELECT	'ICON_JFD_POWER',					'ICON_FONT_TEXTURE_JFD_POWER',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================
