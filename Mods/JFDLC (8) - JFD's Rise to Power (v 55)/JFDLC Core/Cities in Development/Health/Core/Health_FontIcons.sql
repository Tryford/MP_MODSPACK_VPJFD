--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
-- IconFontTextures
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontTextures 
		(IconFontTexture, 								IconFontTextureFile)
SELECT	'ICON_FONT_TEXTURE_JFD_HEALTH', 				'JFD_HealthFontIcons_22'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);	
------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontMapping 
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_DISEASE',								'ICON_FONT_TEXTURE_JFD_HEALTH',					38
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_HEALTH',								'ICON_FONT_TEXTURE_JFD_HEALTH',					37
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE',								'ICON_FONT_TEXTURE_JFD_HEALTH',					39
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

--PLAGUES
INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_AIDS',							'ICON_FONT_TEXTURE_JFD_HEALTH',					36
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_ALCOHOL',						'ICON_FONT_TEXTURE_JFD_HEALTH',					34
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_BONES',						'ICON_FONT_TEXTURE_JFD_HEALTH',					41
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_BRONCHITIS',					'ICON_FONT_TEXTURE_JFD_HEALTH',					3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_BUBONIC',						'ICON_FONT_TEXTURE_JFD_HEALTH',					9
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_CANCER',						'ICON_FONT_TEXTURE_JFD_HEALTH',					7
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_CHOLERA',						'ICON_FONT_TEXTURE_JFD_HEALTH',					25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_DANCING',						'ICON_FONT_TEXTURE_JFD_HEALTH',					21
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_DENGUE',						'ICON_FONT_TEXTURE_JFD_HEALTH',					45
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_DYSENTERY',					'ICON_FONT_TEXTURE_JFD_HEALTH',					27
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_FATIGUE',						'ICON_FONT_TEXTURE_JFD_HEALTH',					6
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_FEVER',						'ICON_FONT_TEXTURE_JFD_HEALTH',					5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_FOOD',							'ICON_FONT_TEXTURE_JFD_HEALTH',					19
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_GOUT',							'ICON_FONT_TEXTURE_JFD_HEALTH',					20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_HIVES',						'ICON_FONT_TEXTURE_JFD_HEALTH',					23
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_IMPOTENCE',					'ICON_FONT_TEXTURE_JFD_HEALTH',					42
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_INFLUENZA',					'ICON_FONT_TEXTURE_JFD_HEALTH',					16
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_LEG',							'ICON_FONT_TEXTURE_JFD_HEALTH',					2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_LEPROSY',						'ICON_FONT_TEXTURE_JFD_HEALTH',					44
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_LOCKJAW',						'ICON_FONT_TEXTURE_JFD_HEALTH',					4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_LUNACY',						'ICON_FONT_TEXTURE_JFD_HEALTH',					35
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_MALAISE',						'ICON_FONT_TEXTURE_JFD_HEALTH',					15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_MEASLES',						'ICON_FONT_TEXTURE_JFD_HEALTH',					17
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_MENIERE',						'ICON_FONT_TEXTURE_JFD_HEALTH',					40
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_POSSESSION',					'ICON_FONT_TEXTURE_JFD_HEALTH',					13
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_PNEUMONIA',					'ICON_FONT_TEXTURE_JFD_HEALTH',					10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_RABIES',						'ICON_FONT_TEXTURE_JFD_HEALTH',					30
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_SCURVY',						'ICON_FONT_TEXTURE_JFD_HEALTH',					28
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping		
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_SEPTICEMIA',					'ICON_FONT_TEXTURE_JFD_HEALTH',					24
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_SIDS',							'ICON_FONT_TEXTURE_JFD_HEALTH',					14
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_SLEEPING',						'ICON_FONT_TEXTURE_JFD_HEALTH',					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_SMALLPOX',						'ICON_FONT_TEXTURE_JFD_HEALTH',					12
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_SYPHILIS',						'ICON_FONT_TEXTURE_JFD_HEALTH',					29
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_SUICIDE',						'ICON_FONT_TEXTURE_JFD_HEALTH',					33
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_TYPHOID',						'ICON_FONT_TEXTURE_JFD_HEALTH',					22
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_TUBERCULOSIS',					'ICON_FONT_TEXTURE_JFD_HEALTH',					11
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_TYPHUS',						'ICON_FONT_TEXTURE_JFD_HEALTH',					31
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_WEILS',						'ICON_FONT_TEXTURE_JFD_HEALTH',					26
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_YELLOW',						'ICON_FONT_TEXTURE_JFD_HEALTH',					8
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO IconFontMapping 
		(IconName, 										IconFontTexture,								IconMapping)
SELECT	'ICON_JFD_PLAGUE_ZIKA',							'ICON_FONT_TEXTURE_JFD_HEALTH',					18
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================