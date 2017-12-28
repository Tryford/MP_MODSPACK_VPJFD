--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
-- IconFontTextures
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CROSSBOX', 	'JFD_CrossboxFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_ADDON' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontMapping 
		(IconName, 							IconFontTexture,					IconMapping)
SELECT	'ICON_JFD_CROSSBOX',				'ICON_FONT_TEXTURE_JFD_CROSSBOX',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_ADDON' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================