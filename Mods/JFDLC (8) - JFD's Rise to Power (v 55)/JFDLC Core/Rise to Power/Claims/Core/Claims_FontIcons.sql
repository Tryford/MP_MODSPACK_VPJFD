--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
-- IconFontTextures
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontTextures 
		(IconFontTexture, 						IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CLAIMS', 		'JFD_ClaimsFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);		
------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontMapping 
		(IconName, 					IconFontTexture,						IconMapping)
SELECT	'ICON_JFD_CLAIM_MEDIUM',	'ICON_FONT_TEXTURE_JFD_CLAIMS',			3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 					IconFontTexture,						IconMapping)
SELECT	'ICON_JFD_CLAIM_STRONG',	'ICON_FONT_TEXTURE_JFD_CLAIMS',			4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 					IconFontTexture,						IconMapping)
SELECT	'ICON_JFD_CLAIM_WEAK',		'ICON_FONT_TEXTURE_JFD_CLAIMS',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 					IconFontTexture,						IconMapping)
SELECT	'ICON_JFD_DIGNITARY',		'ICON_FONT_TEXTURE_JFD_CLAIMS',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================