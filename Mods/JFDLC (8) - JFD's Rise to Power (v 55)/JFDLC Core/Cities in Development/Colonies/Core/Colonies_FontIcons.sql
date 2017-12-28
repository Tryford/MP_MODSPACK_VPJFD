--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
-- IconFontTextures
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_COLONY', 	'JFD_ColonyFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontMapping 
		(IconName, 							IconFontTexture,					IconMapping)
SELECT	'ICON_JFD_COLONY',					'ICON_FONT_TEXTURE_JFD_COLONY',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================