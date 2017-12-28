--==========================================================================================================================
-- FONT ATLASES
--==========================================================================================================================
-- IconFontTextures
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconFontTextures 
		(IconFontTexture, 							IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_HERESIES',			'JFD_PietyHeresyAtlas_22_Fonticons'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_HERMETICISM' AND Value = 1);	

INSERT INTO IconFontTextures 
		(IconFontTexture, 							IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_PIETY',				'JFD_PietyFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

INSERT INTO IconFontTextures 
		(IconFontTexture, 							IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_RELIGIONS',			'JFD_PietyReligionAtlas_22_Fonticons'	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_TLATEOMATILIZTLI' AND Value = 1);	
--------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_CLERIC',							'ICON_FONT_TEXTURE_JFD_PIETY',					4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'SUK_DECISIONS_RTP_PIETY_RESOURCE_ADDITIONS_CLERICS' AND Value = 1);	

INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PIETY',							'ICON_FONT_TEXTURE_JFD_PIETY',					1	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_GOLD_RELIGION',					'ICON_FONT_TEXTURE_JFD_PIETY',					2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,								IconMapping)
SELECT	'ICON_RELIGION_JFD_HERMETICISM',			'ICON_FONT_TEXTURE_JFD_HERESIES',				7		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_HERMETICISM' AND Value = 1);	

INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,								IconMapping)
SELECT	'ICON_RELIGION_JFD_TLATEOMATILIZTLI',		'ICON_FONT_TEXTURE_JFD_RELIGIONS',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_RELIGION_ADDITIONS_TLATEOMATILIZTLI' AND Value = 1);	

INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,								IconMapping)
SELECT	'ICON_VICTORY_JFD_RELIGIOUS',				'ICON_FONT_TEXTURE_JFD_PIETY',					3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	
--==========================================================================================================================
--==========================================================================================================================