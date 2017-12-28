--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
-- IconFontTextures
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontTextures 
		(IconFontTexture, 						IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CAPTAIN', 		'JFD_SupplyFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'SUK_DECISIONS_RTP_SUPPLY_RESOURCE_ADDITIONS_CAPTAINS' AND Value = 1);		
------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontMapping 
		(IconName, 				IconFontTexture,					IconMapping)
SELECT	'ICON_JFD_CAPTAIN',		'ICON_FONT_TEXTURE_JFD_CAPTAIN',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'SUK_DECISIONS_RTP_SUPPLY_RESOURCE_ADDITIONS_CAPTAINS' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================