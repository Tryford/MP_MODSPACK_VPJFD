--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
-- IconFontTextures
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontTextures 
		(IconFontTexture, 							IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_CRIME', 				'JFD_CrimeFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,										IconMapping)
SELECT	'ICON_JFD_CRIME_BLACK',						'ICON_FONT_TEXTURE_JFD_CRIME',							11
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,										IconMapping)
SELECT	'ICON_JFD_CRIME_CULTURE',					'ICON_FONT_TEXTURE_JFD_CRIME',							1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,										IconMapping)
SELECT	'ICON_JFD_CRIME_FAITH',						'ICON_FONT_TEXTURE_JFD_CRIME',							2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,										IconMapping)
SELECT	'ICON_JFD_CRIME_FOOD',						'ICON_FONT_TEXTURE_JFD_CRIME',							3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,										IconMapping)
SELECT	'ICON_JFD_CRIME_PRESTIGE',						'ICON_FONT_TEXTURE_JFD_CRIME',							5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,										IconMapping)
SELECT	'ICON_JFD_CRIME_GOLD',						'ICON_FONT_TEXTURE_JFD_CRIME',							4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,										IconMapping)
SELECT	'ICON_JFD_CRIME_HAPPINESS',					'ICON_FONT_TEXTURE_JFD_CRIME',							6
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,										IconMapping)
SELECT	'ICON_JFD_CRIME_HEALTH',					'ICON_FONT_TEXTURE_JFD_CRIME',							10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,										IconMapping)
SELECT	'ICON_JFD_CRIME_PRODUCTION',				'ICON_FONT_TEXTURE_JFD_CRIME',							7
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,										IconMapping)
SELECT	'ICON_JFD_CRIME_SCIENCE',					'ICON_FONT_TEXTURE_JFD_CRIME',							8
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 									IconFontTexture,										IconMapping)
SELECT	'ICON_JFD_CRIME_TOURISM',					'ICON_FONT_TEXTURE_JFD_CRIME',							9
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================
