--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 								LoadType)
VALUES	('SND_WONDER_SPEECH_JFD_TOWER_LONDON',		'Wonder_TowerLondon',					'DynamicResident');	
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 								SoundType, 				TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_WONDER_SPEECH_JFD_TOWER_LONDON',		'SND_WONDER_SPEECH_JFD_TOWER_LONDON', 	'GAME_MUSIC_STINGS', 	0.0,					75, 		75, 		0, 		 0);
--==========================================================================================================================	
-- COLOURS
--==========================================================================================================================			
-- Colors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Colors 
		(Type, 						Red, 	Green, 	Blue, 	Alpha)
SELECT	'COLOR_JFD_CRIME_BLACK', 	0.474, 	0.474, 	0.474, 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);	
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 							IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_CRIMES_BUILDING_ATLAS',		256, 		'JFD_CrimesBuildingsAtlas_256.dds',		2, 				2),
		('JFD_CRIMES_BUILDING_ATLAS',		128, 		'JFD_CrimesBuildingsAtlas_128.dds',		2, 				2),
		('JFD_CRIMES_BUILDING_ATLAS',		64, 		'JFD_CrimesBuildingsAtlas_64.dds',		2, 				2),
		('JFD_CRIMES_BUILDING_ATLAS',		45, 		'JFD_CrimesBuildingsAtlas_45.dds',		2, 				2),
		('JFD_CRIMES_BUILDING_ATLAS',		32, 		'JFD_CrimesBuildingsAtlas_32.dds',		2, 				2),
		('JFD_CRIMES_WONDER_ATLAS',			256, 		'JFD_CrimesWondersAtlas_256.dds',		1, 				1),
		('JFD_CRIMES_WONDER_ATLAS',			128, 		'JFD_CrimesWondersAtlas_128.dds',		1, 				1),
		('JFD_CRIMES_WONDER_ATLAS',			80, 		'JFD_CrimesWondersAtlas_80.dds',		1, 				1),
		('JFD_CRIMES_WONDER_ATLAS',			64, 		'JFD_CrimesWondersAtlas_64.dds',		1, 				1),
		('JFD_CRIMES_WONDER_ATLAS',			45, 		'JFD_CrimesWondersAtlas_45.dds',		1, 				1),
		('JFD_CRIMES_WONDER_ATLAS',			32, 		'JFD_CrimesWondersAtlas_32.dds',		1, 				1);
--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
-- IconFontTextures
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CRIME_BLACK', 					'JFD_CrimeBlackFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CRIME_BLUE', 					'JFD_CrimeBlueFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 0);

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CRIME_CYAN', 					'JFD_CrimeCyanFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 0);

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CRIME_GRAY', 					'JFD_CrimeGrayFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 0);	

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CRIME_GREEN', 					'JFD_CrimeGreenFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 0);	

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CRIME_ORANGE',					'JFD_CrimeOrangeFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 0);	

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CRIME_PINK',						'JFD_CrimePinkFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CRIME_PURPLE', 					'JFD_CrimePurpleFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 0);

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CRIME_RED', 						'JFD_CrimeRedFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 0);

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CRIME_SILVER', 					'JFD_CrimeSilverFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 0);

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CRIME_YELLOW', 					'JFD_CrimeYellowFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 0);

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CRIME_WHITE', 					'JFD_CrimeWhiteFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 0);

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_ORGANIZED_CRIME', 				'JFD_OrganizedCrimeFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 0);

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_ORGANIZED_CRIME_ANARCHISTS',		'JFD_OrganizedCrimeAnarchismFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 0);

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_ORGANIZED_CRIME_COUNTERFEITERS', 'JFD_OrganizedCrimeCounterfeitingFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 0);

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_ORGANIZED_CRIME_MAFIA', 			'JFD_OrganizedCrimeMafiaFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 0);

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_ORGANIZED_CRIME_SMUGGLERS', 		'JFD_OrganizedCrimeSmugglingFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 0);

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_ORGANIZED_CRIME_TERRORISTS', 	'JFD_OrganizedCrimeTerrorismFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 0);

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CRIME_BLUE', 					'JFD_CrimeBlueFontIcons_22_Alt'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 1);	

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CRIME_CYAN', 					'JFD_CrimeCyanFontIcons_22_Alt'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 1);	

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CRIME_GREEN', 					'JFD_CrimeGreenFontIcons_22_Alt'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CRIME_GRAY', 					'JFD_CrimeGrayFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CRIME_ORANGE', 					'JFD_CrimeOrangeFontIcons_22_Alt'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 1);	

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CRIME_PINK',						'JFD_CrimePinkFontIcons_22_Alt'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CRIME_PURPLE', 					'JFD_CrimePurpleFontIcons_22_Alt'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CRIME_RED', 						'JFD_CrimeRedFontIcons_22_Alt'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 1);	

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CRIME_SILVER', 					'JFD_CrimeSilverFontIcons_22_Alt'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CRIME_YELLOW', 					'JFD_CrimeYellowFontIcons_22_Alt'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 1);	

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CRIME_WHITE', 					'JFD_CrimeWhiteFontIcons_22_Alt'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_ORGANIZED_CRIME', 				'JFD_OrganizedCrimeFontIcons_22_Alt'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_ORGANIZED_CRIME_ANARCHISTS',		'JFD_OrganizedCrimeAnarchismFontIcons_22_Alt'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_ORGANIZED_CRIME_COUNTERFEITERS', 'JFD_OrganizedCrimeCounterfeitingFontIcons_22_Alt'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_ORGANIZED_CRIME_MAFIA', 			'JFD_OrganizedCrimeMafiaFontIcons_22_Alt'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_ORGANIZED_CRIME_TERRORISTS',		'JFD_OrganizedCrimeTerrorismFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 1);

INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_ORGANIZED_CRIME_SMUGGLERS',		'JFD_OrganizedCrimeSaboteursFontIcons_22_Alt'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ALT_FONTS' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,										IconMapping)
SELECT	'ICON_JFD_CRIME_BLACK',						'ICON_FONT_TEXTURE_JFD_CRIME_BLACK',					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,										IconMapping)
SELECT	'ICON_JFD_CRIME_BLUE',						'ICON_FONT_TEXTURE_JFD_CRIME_BLUE',						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,										IconMapping)
SELECT	'ICON_JFD_CRIME_CYAN',						'ICON_FONT_TEXTURE_JFD_CRIME_CYAN',						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,										IconMapping)
SELECT	'ICON_JFD_CRIME_GREEN',						'ICON_FONT_TEXTURE_JFD_CRIME_GREEN',					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,										IconMapping)
SELECT	'ICON_JFD_CRIME_GRAY',						'ICON_FONT_TEXTURE_JFD_CRIME_GRAY',						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,										IconMapping)
SELECT	'ICON_JFD_CRIME_ORANGE',					'ICON_FONT_TEXTURE_JFD_CRIME_ORANGE',					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,										IconMapping)
SELECT	'ICON_JFD_CRIME_PINK',						'ICON_FONT_TEXTURE_JFD_CRIME_PINK',						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,										IconMapping)
SELECT	'ICON_JFD_CRIME_PURPLE',					'ICON_FONT_TEXTURE_JFD_CRIME_PURPLE',					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,										IconMapping)
SELECT	'ICON_JFD_CRIME_RED',						'ICON_FONT_TEXTURE_JFD_CRIME_RED',						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,										IconMapping)
SELECT	'ICON_JFD_CRIME_SILVER',					'ICON_FONT_TEXTURE_JFD_CRIME_SILVER',					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,										IconMapping)
SELECT	'ICON_JFD_CRIME_YELLOW',					'ICON_FONT_TEXTURE_JFD_CRIME_YELLOW',					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,										IconMapping)
SELECT	'ICON_JFD_CRIME_WHITE',						'ICON_FONT_TEXTURE_JFD_CRIME_WHITE',					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,										IconMapping)
SELECT	'ICON_JFD_ORGANIZED_CRIME',					'ICON_FONT_TEXTURE_JFD_ORGANIZED_CRIME',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,										IconMapping)
SELECT	'ICON_JFD_ORGANIZED_CRIME_ANARCHISTS',		'ICON_FONT_TEXTURE_JFD_ORGANIZED_CRIME_ANARCHISTS',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,										IconMapping)
SELECT	'ICON_JFD_ORGANIZED_CRIME_COUNTERFEITERS',	'ICON_FONT_TEXTURE_JFD_ORGANIZED_CRIME_COUNTERFEITERS',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,										IconMapping)
SELECT	'ICON_JFD_ORGANIZED_CRIME_MAFIA',			'ICON_FONT_TEXTURE_JFD_ORGANIZED_CRIME_MAFIA',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,										IconMapping)
SELECT	'ICON_JFD_ORGANIZED_CRIME_SMUGGLERS',		'ICON_FONT_TEXTURE_JFD_ORGANIZED_CRIME_SMUGGLERS',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,										IconMapping)
SELECT	'ICON_JFD_ORGANIZED_CRIME_TERRORISTS',		'ICON_FONT_TEXTURE_JFD_ORGANIZED_CRIME_TERRORISTS',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================
