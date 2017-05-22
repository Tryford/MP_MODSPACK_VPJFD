--==========================================================================================================================
-- EPIDEMICS
--==========================================================================================================================
-- JFD_Epidemics
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO JFD_Plagues
		(Type,								BuildingType,							Description, 						IconString)
SELECT	'PLAGUE_JFD_BUBONIC',				'BUILDING_JFD_PLAGUE_BUBONIC',			'TXT_KEY_PLAGUE_JFD_BUBONIC',		'[ICON_JFD_PLAGUE_BUBONIC]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								BuildingType,							Description, 						IconString)
SELECT	'PLAGUE_JFD_CHOLERA',				'BUILDING_JFD_PLAGUE_CHOLERA',			'TXT_KEY_PLAGUE_JFD_CHOLERA',		'[ICON_JFD_PLAGUE_CHOLERA]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								BuildingType,							Description, 						IconString)
SELECT	'PLAGUE_JFD_INFLUENZA',				'BUILDING_JFD_PLAGUE_INFLUENZA',		'TXT_KEY_PLAGUE_JFD_INFLUENZA',		'[ICON_JFD_PLAGUE_INFLUENZA]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								BuildingType,							Description, 						IconString)
SELECT	'PLAGUE_JFD_LEPROSY',				'BUILDING_JFD_PLAGUE_LEPROSY',			'TXT_KEY_PLAGUE_JFD_LEPROSY',		'[ICON_JFD_PLAGUE_LEPROSY]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								BuildingType,							Description, 						IconString)
SELECT	'PLAGUE_JFD_MEASLES',				'BUILDING_JFD_PLAGUE_MEASLES',			'TXT_KEY_PLAGUE_JFD_MEASLES',		'[ICON_JFD_PLAGUE_MEASLES]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								BuildingType,							Description, 						IconString)
SELECT	'PLAGUE_JFD_PNEUMONIA',				'BUILDING_JFD_PLAGUE_PNEUMONIA',		'TXT_KEY_PLAGUE_JFD_PNEUMONIA',		'[ICON_JFD_PLAGUE_PNEUMONIA]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								BuildingType,							Description, 						IconString)
SELECT	'PLAGUE_JFD_SMALLPOX',				'BUILDING_JFD_PLAGUE_SMALLPOX',			'TXT_KEY_PLAGUE_JFD_SMALLPOX',		'[ICON_JFD_PLAGUE_SMALLPOX]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								BuildingType,							Description, 						IconString)
SELECT	'PLAGUE_JFD_TUBERCULOSIS',			'BUILDING_JFD_PLAGUE_TUBERCULOSIS',		'TXT_KEY_PLAGUE_JFD_TUBERCULOSIS',	'[ICON_JFD_PLAGUE_TUBERCULOSIS]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								BuildingType,							Description, 						IconString)
SELECT	'PLAGUE_JFD_TYPHOID',				'BUILDING_JFD_PLAGUE_TYPHOID',			'TXT_KEY_PLAGUE_JFD_TYPHOID',		'[ICON_JFD_PLAGUE_TYPHOID]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Plagues
		(Type,								BuildingType,							Description, 						IconString)
SELECT	'PLAGUE_JFD_TYPHUS',				'BUILDING_JFD_PLAGUE_TYPHUS',			'TXT_KEY_PLAGUE_JFD_TYPHUS',		'[ICON_JFD_PLAGUE_TYPHUS]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Dummies
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings
		(Type,									BuildingClass,				Cost, 	FaithCost, 	GoldMaintenance,	GreatWorkCount, Defense,	IsPlague,	PrereqTech,		ConquestProb,	Description, 									Help)
SELECT	'BUILDING_JFD_PLAGUE_BUBONIC',			'BUILDINGCLASS_JFD_CID',	-1,		-1,			0,					-1,				-100,		1,			NULL,			100,			'TXT_KEY_BUILDING_JFD_PLAGUE_BUBONIC',			'TXT_KEY_BUILDING_JFD_PLAGUE_BUBONIC_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type,									BuildingClass,				Cost, 	FaithCost, 	GoldMaintenance,	GreatWorkCount, Defense,	IsPlague,	PrereqTech,		ConquestProb,	Description, 									Help)
SELECT	'BUILDING_JFD_PLAGUE_CHOLERA',			'BUILDINGCLASS_JFD_CID',	-1,		-1,			0,					-1,				-100,		1,			NULL,			100,			'TXT_KEY_BUILDING_JFD_PLAGUE_CHOLERA',			'TXT_KEY_BUILDING_JFD_PLAGUE_CHOLERA_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type,									BuildingClass,				Cost, 	FaithCost, 	GoldMaintenance,	GreatWorkCount, Defense,	IsPlague,	PrereqTech,		ConquestProb,	Description, 									Help)
SELECT	'BUILDING_JFD_PLAGUE_INFLUENZA',		'BUILDINGCLASS_JFD_CID',	-1,		-1,			0,					-1,				-100,		1,			NULL,			100,			'TXT_KEY_BUILDING_JFD_PLAGUE_INFLUENZA',		'TXT_KEY_BUILDING_JFD_PLAGUE_INFLUENZA_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type,									BuildingClass,				Cost, 	FaithCost, 	GoldMaintenance,	GreatWorkCount, Defense,	IsPlague,	PrereqTech,		ConquestProb,	Description, 									Help)
SELECT	'BUILDING_JFD_PLAGUE_LEPROSY',			'BUILDINGCLASS_JFD_CID',	-1,		-1,			0,					-1,				-100,		1,			NULL,			100,			'TXT_KEY_BUILDING_JFD_PLAGUE_LEPROSY',			'TXT_KEY_BUILDING_JFD_PLAGUE_LEPROSY_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type,									BuildingClass,				Cost, 	FaithCost, 	GoldMaintenance,	GreatWorkCount, Defense,	IsPlague,	PrereqTech,		ConquestProb,	Description, 									Help)
SELECT	'BUILDING_JFD_PLAGUE_MEASLES',			'BUILDINGCLASS_JFD_CID',	-1,		-1,			0,					-1,				-100,		1,			NULL,			100,			'TXT_KEY_BUILDING_JFD_PLAGUE_MEASLES',			'TXT_KEY_BUILDING_JFD_PLAGUE_MEASLES_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type,									BuildingClass,				Cost, 	FaithCost, 	GoldMaintenance,	GreatWorkCount, Defense,	IsPlague,	PrereqTech,		ConquestProb,	Description, 									Help)
SELECT	'BUILDING_JFD_PLAGUE_PNEUMONIA',		'BUILDINGCLASS_JFD_CID',	-1,		-1,			0,					-1,				-100,		1,			NULL,			100,			'TXT_KEY_BUILDING_JFD_PLAGUE_PNEUMONIA',		'TXT_KEY_BUILDING_JFD_PLAGUE_PNEUMONIA_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type,									BuildingClass,				Cost, 	FaithCost, 	GoldMaintenance,	GreatWorkCount, Defense,	IsPlague,	PrereqTech,		ConquestProb,	Description, 									Help)
SELECT	'BUILDING_JFD_PLAGUE_TYPHOID',			'BUILDINGCLASS_JFD_CID',	-1,		-1,			0,					-1,				-100,		1,			NULL,			100,			'TXT_KEY_BUILDING_JFD_PLAGUE_TYPHOID',			'TXT_KEY_BUILDING_JFD_PLAGUE_TYPHOID_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type,									BuildingClass,				Cost, 	FaithCost, 	GoldMaintenance,	GreatWorkCount, Defense,	IsPlague,	PrereqTech,		ConquestProb,	Description, 									Help)
SELECT	'BUILDING_JFD_PLAGUE_SMALLPOX',			'BUILDINGCLASS_JFD_CID',	-1,		-1,			0,					-1,				-100,		1,			NULL,			100,			'TXT_KEY_BUILDING_JFD_PLAGUE_SMALLPOX',			'TXT_KEY_BUILDING_JFD_PLAGUE_SMALLPOX_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type,									BuildingClass,				Cost, 	FaithCost, 	GoldMaintenance,	GreatWorkCount, Defense,	IsPlague,	PrereqTech,		ConquestProb,	Description, 									Help)
SELECT	'BUILDING_JFD_PLAGUE_TUBERCULOSIS',		'BUILDINGCLASS_JFD_CID',	-1,		-1,			0,					-1,				-100,		1,			NULL,			100,			'TXT_KEY_BUILDING_JFD_PLAGUE_TUBERCULOSIS',		'TXT_KEY_BUILDING_JFD_PLAGUE_TUBERCULOSIS_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type,									BuildingClass,				Cost, 	FaithCost, 	GoldMaintenance,	GreatWorkCount, Defense,	IsPlague,	PrereqTech,		ConquestProb,	Description, 									Help)
SELECT	'BUILDING_JFD_PLAGUE_TYPHUS',			'BUILDINGCLASS_JFD_CID',	-1,		-1,			0,					-1,				-100,		1,			NULL,			100,			'TXT_KEY_BUILDING_JFD_PLAGUE_TYPHUS',			'TXT_KEY_BUILDING_JFD_PLAGUE_TYPHUS_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================
