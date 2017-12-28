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
--==========================================================================================================================