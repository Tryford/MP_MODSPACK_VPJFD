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
INSERT OR REPLACE INTO IconFontMapping 
		(IconName, 								IconFontTexture,						IconMapping)
SELECT	'ICON_JFD_BLUE_FIST',					'ICON_FONT_TEXTURE_JFD_BLUE_FIST',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT OR REPLACE INTO IconFontMapping 
		(IconName, 								IconFontTexture,						IconMapping)
SELECT	'ICON_JFD_GREEN_FIST',					'ICON_FONT_TEXTURE_JFD_GREEN_FIST',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT OR REPLACE INTO IconFontMapping 
		(IconName, 								IconFontTexture,						IconMapping)
SELECT	'ICON_JFD_RED_FIST',					'ICON_FONT_TEXTURE_JFD_RED_FIST',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT OR REPLACE INTO IconFontMapping 
		(IconName, 								IconFontTexture,						IconMapping)
SELECT	'ICON_JFD_YELLOW_FIST',					'ICON_FONT_TEXTURE_JFD_YELLOW_FIST',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT OR REPLACE INTO IconFontMapping 
		(IconName, 								IconFontTexture,						IconMapping)
SELECT	'ICON_STARVATION',						'ICON_FONT_TEXTURE_STARVATION',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT OR REPLACE INTO IconFontMapping 
		(IconName, 								IconFontTexture,						IconMapping)
SELECT	'ICON_JFD_REVOLT',						'ICON_FONT_TEXTURE_JFD_REVOLT',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT OR REPLACE INTO IconFontMapping 
		(IconName, 								IconFontTexture,						IconMapping)
VALUES	('ICON_JFD_WLTKD',						'ICON_FONT_TEXTURE_JFD_WLTKD',			1);
--==========================================================================================================================
--==========================================================================================================================