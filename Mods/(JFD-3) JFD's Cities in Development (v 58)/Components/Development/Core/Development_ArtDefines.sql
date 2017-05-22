--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
-- IconFontTextures
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontTextures 
		(IconFontTexture, 								IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_DEVELOPMENT', 			'JFD_DevelopmentFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);	

INSERT INTO IconFontTextures 
		(IconFontTexture, 								IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_DEVELOPMENT_DEFICIT', 	'JFD_DevelopmentDeficitFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);	

INSERT INTO IconFontTextures 
		(IconFontTexture, 								IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_DEVELOPMENT_SURPLUS', 	'JFD_DevelopmentSurplusFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);	
------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontMapping 
		(IconName, 								IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_DEVELOPMENT',					'ICON_FONT_TEXTURE_JFD_DEVELOPMENT',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 								IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_DEVELOPMENT_DEFICIT',			'ICON_FONT_TEXTURE_JFD_DEVELOPMENT_DEFICIT',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 								IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_DEVELOPMENT_SURPLUS',			'ICON_FONT_TEXTURE_JFD_DEVELOPMENT_SURPLUS',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);
--==========================================================================================================================	
-- COLOURS
--==========================================================================================================================			
-- Colors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Colors 
		(Type, 									Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_JFD_DEVELOPMENT',				0.360, 	0.192, 	0.125, 	1);
--==========================================================================================================================
--==========================================================================================================================
