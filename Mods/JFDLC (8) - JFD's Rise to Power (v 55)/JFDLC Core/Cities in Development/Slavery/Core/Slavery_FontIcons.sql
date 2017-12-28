--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
-- IconFontTextures
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_SHACKLES', 	'JFD_Shackles_22_Fonticons'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);	
------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontMapping 
		(IconName, 							IconFontTexture,					IconMapping)
SELECT	'ICON_JFD_SHACKLES',				'ICON_FONT_TEXTURE_JFD_SHACKLES',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================