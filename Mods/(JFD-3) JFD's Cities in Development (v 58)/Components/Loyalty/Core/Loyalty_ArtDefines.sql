--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 								Filename, 				LoadType)
VALUES	('SND_SOUND_JFD_REVOLT', 				'RevolutionStart',		'DynamicResident'),	
		('SND_SOUND_JFD_WLTKD', 				'WLTKDStart',			'DynamicResident'),	
		('SND_WONDER_SPEECH_JFD_TRAFALGAR',		'Wonder_Trafalgar',		'DynamicResident');
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 								SoundID, 								SoundType, 				TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_SOUND_JFD_REVOLT',				'SND_SOUND_JFD_REVOLT', 				'GAME_SFX', 			-1.0,					100, 		100, 		0, 		 0),
		('AS2D_SOUND_JFD_WLTKD',				'SND_SOUND_JFD_WLTKD', 					'GAME_SFX', 			-1.0,					100, 		100, 		0, 		 0),
		('AS2D_WONDER_SPEECH_JFD_TRAFALGAR',	'SND_WONDER_SPEECH_JFD_TRAFALGAR',		'GAME_SPEECH',			0.0,					75, 		75, 		0, 		 0);
--==========================================================================================================================	
-- COLOURS
--==========================================================================================================================			
-- Colors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Colors 
		(Type, 									Red, 	Green, 	Blue, 	Alpha)
SELECT	'COLOR_LOYALTY_JFD_PATRIOTIC', 			0, 		1, 		1,		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Colors 
		(Type, 									Red, 	Green, 	Blue, 	Alpha)
SELECT	'COLOR_LOYALTY_JFD_ALLEGIANT',			0.552, 	0.807, 	0.447, 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);		

INSERT INTO Colors 
		(Type, 									Red, 	Green, 	Blue, 	Alpha)
SELECT	'COLOR_LOYALTY_JFD_NEUTRAL', 			0.882, 	0.878, 	0.780, 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);	

INSERT INTO Colors 
		(Type, 									Red, 	Green, 	Blue, 	Alpha)
SELECT	'COLOR_LOYALTY_JFD_REBELLIOUS',			0.890, 	0.882, 	0.392, 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);	

INSERT INTO Colors 
		(Type, 									Red, 	Green, 	Blue, 	Alpha)
SELECT	'COLOR_LOYALTY_JFD_SEPARATIST',			1, 		0.372, 	0.309, 	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);	
--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
-- IconFontTextures
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontTextures 
		(IconFontTexture, 						IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_BLUE_FIST', 		'JFD_LoyaltyBlueFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);	

INSERT INTO IconFontTextures 
		(IconFontTexture, 						IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_GREEN_FIST', 	'JFD_LoyaltyGreenFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);	

INSERT INTO IconFontTextures 
		(IconFontTexture, 						IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_RED_FIST', 		'JFD_LoyaltyRedFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);	

INSERT INTO IconFontTextures 
		(IconFontTexture, 						IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_YELLOW_FIST', 	'JFD_LoyaltyYellowFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);	

INSERT INTO IconFontTextures 
		(IconFontTexture, 						IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_STARVATION', 		'JFD_StarvationFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);		

INSERT INTO IconFontTextures 
		(IconFontTexture, 						IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_REVOLT', 		'JFD_RevoltFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);		

INSERT INTO IconFontTextures 
		(IconFontTexture, 						IconFontTextureFile)
VALUES	('ICON_FONT_TEXTURE_JFD_WLTKD',			'JFD_WLTKDFontIcons_22');		
------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontMapping 
		(IconName, 								IconFontTexture,						IconMapping)
SELECT	'ICON_JFD_BLUE_FIST',					'ICON_FONT_TEXTURE_JFD_BLUE_FIST',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 								IconFontTexture,						IconMapping)
SELECT	'ICON_JFD_GREEN_FIST',					'ICON_FONT_TEXTURE_JFD_GREEN_FIST',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 								IconFontTexture,						IconMapping)
SELECT	'ICON_JFD_RED_FIST',					'ICON_FONT_TEXTURE_JFD_RED_FIST',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 								IconFontTexture,						IconMapping)
SELECT	'ICON_JFD_YELLOW_FIST',					'ICON_FONT_TEXTURE_JFD_YELLOW_FIST',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 								IconFontTexture,						IconMapping)
SELECT	'ICON_STARVATION',						'ICON_FONT_TEXTURE_STARVATION',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 								IconFontTexture,						IconMapping)
SELECT	'ICON_JFD_REVOLT',						'ICON_FONT_TEXTURE_JFD_REVOLT',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 								IconFontTexture,						IconMapping)
VALUES	('ICON_JFD_WLTKD',						'ICON_FONT_TEXTURE_JFD_WLTKD',			1);
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_LOYALTY_TECH_ATLAS',				256, 		'JFD_LoyaltyTechAtlas_256.dds',		1, 				1),
		('JFD_LOYALTY_TECH_ATLAS',				214, 		'JFD_LoyaltyTechAtlas_214.dds',		1, 				1),
		('JFD_LOYALTY_TECH_ATLAS',				128, 		'JFD_LoyaltyTechAtlas_128.dds',		1, 				1),
		('JFD_LOYALTY_TECH_ATLAS',				80, 		'JFD_LoyaltyTechAtlas_80.dds',		1, 				1),
		('JFD_LOYALTY_TECH_ATLAS',				64, 		'JFD_LoyaltyTechAtlas_64.dds',		1, 				1),
		('JFD_LOYALTY_TECH_ATLAS',				45, 		'JFD_LoyaltyTechAtlas_45.dds',		1, 				1),
		('JFD_LOYALTY_WONDER_ATLAS',			256, 		'JFD_LoyaltyWonders_256.dds',		2, 				2),
		('JFD_LOYALTY_WONDER_ATLAS',			128, 		'JFD_LoyaltyWonders_128.dds',		2, 				2),
		('JFD_LOYALTY_WONDER_ATLAS',			80, 		'JFD_LoyaltyWonders_80.dds',		2, 				2),
		('JFD_LOYALTY_WONDER_ATLAS',			64, 		'JFD_LoyaltyWonders_64.dds',		2, 				2),
		('JFD_LOYALTY_WONDER_ATLAS',			45, 		'JFD_LoyaltyWonders_45.dds',		2, 				2),
		('JFD_LOYALTY_WONDER_ATLAS',			32, 		'JFD_LoyaltyWonders_32.dds',		2, 				2);	
--==========================================================================================================================
--==========================================================================================================================