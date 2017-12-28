--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
-- IconFontTextures
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontTextures 
		(IconFontTexture, 										IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_INNOVATION', 					'JFD_InnovationFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,									IconMapping)
SELECT	'ICON_JFD_INNOVATION',						'ICON_FONT_TEXTURE_JFD_INNOVATION',					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================