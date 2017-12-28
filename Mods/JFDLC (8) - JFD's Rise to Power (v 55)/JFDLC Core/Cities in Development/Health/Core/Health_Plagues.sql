--==========================================================================================================================
-- PLAGUES
--==========================================================================================================================
-- JFD_Plagues
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_AIDS',					'TXT_KEY_PLAGUE_JFD_AIDS',				'[ICON_JFD_PLAGUE_AIDS]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_ALCOHOL',				'TXT_KEY_PLAGUE_JFD_ALCOHOL',			'[ICON_JFD_PLAGUE_ALCOHOL]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_BONES',					'TXT_KEY_PLAGUE_JFD_BONES',				'[ICON_JFD_PLAGUE_BONES]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_BRONCHITIS',			'TXT_KEY_PLAGUE_JFD_BRONCHITIS',		'[ICON_JFD_PLAGUE_BRONCHITIS]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_BUBONIC',				'TXT_KEY_PLAGUE_JFD_BUBONIC',			'[ICON_JFD_PLAGUE_BUBONIC]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_CANCER',				'TXT_KEY_PLAGUE_JFD_CANCER',			'[ICON_JFD_PLAGUE_CANCER]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_CHOLERA',				'TXT_KEY_PLAGUE_JFD_CHOLERA',			'[ICON_JFD_PLAGUE_CHOLERA]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_DANCING',				'TXT_KEY_PLAGUE_JFD_DANCING',			'[ICON_JFD_PLAGUE_DANCING]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_DENGUE',				'TXT_KEY_PLAGUE_JFD_DENGUE',			'[ICON_JFD_PLAGUE_DENGUE]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues	
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_DYSENTERY',				'TXT_KEY_PLAGUE_JFD_DYSENTERY',			'[ICON_JFD_PLAGUE_DYSENTERY]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_FATIGUE',				'TXT_KEY_PLAGUE_JFD_FATIGUE',			'[ICON_JFD_PLAGUE_FATIGUE]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_FEVER',					'TXT_KEY_PLAGUE_JFD_FEVER',				'[ICON_JFD_PLAGUE_FEVER]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_FOOD',					'TXT_KEY_PLAGUE_JFD_FOOD',				'[ICON_JFD_PLAGUE_FOOD]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_GOUT',					'TXT_KEY_PLAGUE_JFD_GOUT',				'[ICON_JFD_PLAGUE_GOUT]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_HIVES',					'TXT_KEY_PLAGUE_JFD_HIVES',				'[ICON_JFD_PLAGUE_HIVES]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_IMPOTENCE',				'TXT_KEY_PLAGUE_JFD_IMPOTENCE',			'[ICON_JFD_PLAGUE_IMPOTENCE]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_INFLUENZA',				'TXT_KEY_PLAGUE_JFD_INFLUENZA',			'[ICON_JFD_PLAGUE_INFLUENZA]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_LEG',					'TXT_KEY_PLAGUE_JFD_LEG',				'[ICON_JFD_PLAGUE_LEG]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_LEPROSY',				'TXT_KEY_PLAGUE_JFD_LEPROSY',			'[ICON_JFD_PLAGUE_LEPROSY]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_LOCKJAW',				'TXT_KEY_PLAGUE_JFD_LOCKJAW',			'[ICON_JFD_PLAGUE_LOCKJAW]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString,						IsEventOnly)
SELECT	'PLAGUE_JFD_LUNACY',				'TXT_KEY_PLAGUE_JFD_LUNACY',			'[ICON_JFD_PLAGUE_LUNACY]',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_MALAISE',				'TXT_KEY_PLAGUE_JFD_MALAISE',			'[ICON_JFD_PLAGUE_MALAISE]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_MEASLES',				'TXT_KEY_PLAGUE_JFD_MEASLES',			'[ICON_JFD_PLAGUE_MEASLES]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_MENIERE',				'TXT_KEY_PLAGUE_JFD_MENIERE',			'[ICON_JFD_PLAGUE_MENIERE]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString,							IsEventOnly)
SELECT	'PLAGUE_JFD_POSSESSION',			'TXT_KEY_PLAGUE_JFD_POSSESSION',		'[ICON_JFD_PLAGUE_POSSESSION]',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_PNEUMONIA',				'TXT_KEY_PLAGUE_JFD_PNEUMONIA',			'[ICON_JFD_PLAGUE_PNEUMONIA]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_RABIES',				'TXT_KEY_PLAGUE_JFD_RABIES',			'[ICON_JFD_PLAGUE_RABIES]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_SCURVY',				'TXT_KEY_PLAGUE_JFD_SCURVY',			'[ICON_JFD_PLAGUE_SCURVY]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_SEPTICEMIA',			'TXT_KEY_PLAGUE_JFD_SEPTICEMIA',		'[ICON_JFD_PLAGUE_SEPTICEMIA]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_SLEEPING',				'TXT_KEY_PLAGUE_JFD_SLEEPING',			'[ICON_JFD_PLAGUE_SLEEPING]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_SIDS',					'TXT_KEY_PLAGUE_JFD_SIDS',				'[ICON_JFD_PLAGUE_SIDS]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_SMALLPOX',				'TXT_KEY_PLAGUE_JFD_SMALLPOX',			'[ICON_JFD_PLAGUE_SMALLPOX]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_SYPHILIS',				'TXT_KEY_PLAGUE_JFD_SYPHILIS',			'[ICON_JFD_PLAGUE_SYPHILIS]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_SUICIDE',				'TXT_KEY_PLAGUE_JFD_SUICIDE',			'[ICON_JFD_PLAGUE_SUICIDE]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_TUBERCULOSIS',			'TXT_KEY_PLAGUE_JFD_TUBERCULOSIS',		'[ICON_JFD_PLAGUE_TUBERCULOSIS]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_TYPHOID',				'TXT_KEY_PLAGUE_JFD_TYPHOID',			'[ICON_JFD_PLAGUE_TYPHOID]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_TYPHUS',				'TXT_KEY_PLAGUE_JFD_TYPHUS',			'[ICON_JFD_PLAGUE_TYPHUS]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_WEILS',					'TXT_KEY_PLAGUE_JFD_WEILS',				'[ICON_JFD_PLAGUE_WEILS]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_YELLOW',				'TXT_KEY_PLAGUE_JFD_YELLOW',			'[ICON_JFD_PLAGUE_YELLOW]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								Description, 							IconString)
SELECT	'PLAGUE_JFD_ZIKA',					'TXT_KEY_PLAGUE_JFD_ZIKA',				'[ICON_JFD_PLAGUE_ZIKA]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================
