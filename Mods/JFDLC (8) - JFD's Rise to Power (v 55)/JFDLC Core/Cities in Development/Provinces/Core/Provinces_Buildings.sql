--==========================================================================================================================
-- BUILDING CLASSES
--==========================================================================================================================	
-- BuildingClasses
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type,							DefaultBuilding,				Description,						MaxPlayerInstances)
SELECT	'BUILDINGCLASS_JFD_ASSEMBLY',	'BUILDING_JFD_ASSEMBLY',		'TXT_KEY_BUILDING_JFD_ASSEMBLY',	999
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO BuildingClasses
		(Type,							DefaultBuilding,				Description,						MaxPlayerInstances)
SELECT	'BUILDINGCLASS_JFD_MANOR',		'BUILDING_JFD_MANOR',			'TXT_KEY_BUILDING_JFD_MANOR',		999
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO BuildingClasses
		(Type,							DefaultBuilding,				Description,						MaxPlayerInstances)
SELECT	'BUILDINGCLASS_JFD_MANSION',	'BUILDING_JFD_MANSION',			'TXT_KEY_BUILDING_JFD_MANSION',		999
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================	
-- National Wonders
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings
		(Type,							BuildingClass,					Cost,	Defense,	ExtraCityHitPoints,		IsProvince,		CannotBeSold,	PlotCultureCostModifier,	RequiresConnection,	 PlotBuyCostModifier,	ProvinceUpgradeType,		BombardRange,	Description,						Help, 									Civilopedia,							NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb,	IconAtlas, 						PortraitIndex)
SELECT	'BUILDING_JFD_ASSEMBLY',		'BUILDINGCLASS_JFD_ASSEMBLY',	140,	0,			0,						1,				1,				0,							1,					 0,						'PROVINCE_JFD_BARONY',		0,				'TXT_KEY_BUILDING_JFD_ASSEMBLY',	'TXT_KEY_BUILDING_JFD_ASSEMBLY_HELP',	'TXT_KEY_BUILDING_JFD_ASSEMBLY_TEXT',	1,			-1,					-1,				100,			'JFD_PROVINCES_BUILDING_ATLAS',	0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);																			 
																																													 
INSERT INTO Buildings																																								 
		(Type,							BuildingClass,					Cost,	Defense,	ExtraCityHitPoints,		IsProvince,		CannotBeSold,	PlotCultureCostModifier,	RequiresConnection,	 PlotBuyCostModifier,	ProvinceUpgradeType,		BombardRange,	Description,						Help, 									Civilopedia,							NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb,	IconAtlas, 						PortraitIndex)
SELECT	'BUILDING_JFD_MANOR',			'BUILDINGCLASS_JFD_MANOR',		140,	500,		15,						1,				1,				-10,						1,					 -10,					'PROVINCE_JFD_COUNTY',		2,				'TXT_KEY_BUILDING_JFD_MANOR',		'TXT_KEY_BUILDING_JFD_MANOR_HELP',		'TXT_KEY_BUILDING_JFD_MANOR_TEXT',		1,			-1,					-1,				100,			'JFD_PROVINCES_BUILDING_ATLAS',	2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);																			 
																																													 
INSERT INTO Buildings																																								 
		(Type,							BuildingClass,					Cost,	Defense,	ExtraCityHitPoints,		IsProvince,		CannotBeSold,	PlotCultureCostModifier,	RequiresConnection,	 PlotBuyCostModifier,	ProvinceUpgradeType,		BombardRange,	Description,						Help, 									Civilopedia,							NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb,	IconAtlas, 						PortraitIndex)
SELECT	'BUILDING_JFD_MANSION',			'BUILDINGCLASS_JFD_MANSION',	140,	1000,		25,						1,				1,				-20,						1,					 -20,					'PROVINCE_JFD_DUCHY',		3,				'TXT_KEY_BUILDING_JFD_MANSION',		'TXT_KEY_BUILDING_JFD_MANSION_HELP',	'TXT_KEY_BUILDING_JFD_MANSION_TEXT',	1,			-1,					-1,				100,			'JFD_PROVINCES_BUILDING_ATLAS',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

UPDATE Buildings 
SET BombardRange = 3, ProvinceUpgradeType = 'PROVINCE_JFD_DUCHY'
WHERE BuildingClass = 'BUILDINGCLASS_PALACE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

UPDATE Buildings 
SET BombardRange = 2, ProvinceUpgradeType = 'PROVINCE_JFD_COUNTY'
WHERE BuildingClass = 'BUILDINGCLASS_JFD_GOVERNORS_MANSION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

UPDATE Buildings
SET SpecialistCount = 1, SpecialistType = 'SPECIALIST_JFD_GOVERNOR'
WHERE Type IN ('BUILDING_JFD_ASSEMBLY', 'BUILDING_JFD_MANOR', 'BUILDING_JFD_MANSION', 'BUILDING_PALACE', 'BUILDING_JFD_GOVERNORS_MANSION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_SPECIALIST_ADDITIONS_GOVERNOR' AND Value = 1);

--Summer Palace
UPDATE Buildings
SET Cost = 200, Help = 'TXT_KEY_BUILDING_JFD_SUMMER_PALACE_HELP', Strategy = 'TXT_KEY_BUILDING_JFD_SUMMER_PALACE_STRATEGY', RemovesProvincesConnectionReq = 1
WHERE Type = 'BUILDING_EE_SUMMER_PALACE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_NATIONAL_WONDER_ADDITIONS_SUMMER_PALACE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_ProvinceMods
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_JFD_ProvinceMods 
		(BuildingType, 					ProvinceCityModMod)
SELECT	'BUILDING_EE_SUMMER_PALACE',	-50
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_ASSEMBLY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_NATIONAL_WONDER_ADDITIONS_SUMMER_PALACE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_ImprovementYieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ImprovementYieldChanges 
		(ImprovementType,			BuildingType, 	YieldType,		Yield)
SELECT	'IMPROVEMENT_JFD_TOWN',		Type,			'YIELD_GOLD',	1
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_JFD_GOVERNORS_MANSION', 'BUILDINGCLASS_JFD_MANOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 0);

INSERT INTO Building_ImprovementYieldChanges 
		(ImprovementType,			BuildingType, 	YieldType,		Yield)
SELECT	 'IMPROVEMENT_JFD_TOWN',	Type,			'YIELD_GOLD',	1
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_JFD_MANSION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 0);

INSERT INTO Building_ImprovementYieldChanges 
		(ImprovementType,			BuildingType, 	YieldType,		Yield)
SELECT	 'IMPROVEMENT_JFD_TOWN',	Type,			'YIELD_GOLD',	2
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_PALACE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 0);

INSERT INTO Building_ImprovementYieldChanges 
		(ImprovementType,			BuildingType, 	YieldType,		Yield)
SELECT	 'IMPROVEMENT_JFD_VILLAGE',	Type,			'YIELD_GOLD',	1
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_PALACE', 'BUILDINGCLASS_JFD_MANSION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 0);
-------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges 
		(YieldType,					BuildingType, 	Yield)
SELECT	'YIELD_CULTURE',			Type,			1
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_JFD_ASSEMBLY', 'BUILDINGCLASS_JFD_MANOR', 'BUILDINGCLASS_JFD_MANSION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_ClassesNeededInCity
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ClassesNeededInCity 
		(BuildingType, 				BuildingClassType)
SELECT	'BUILDING_JFD_MANOR',	 	Type
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_ASSEMBLY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO Building_ClassesNeededInCity 
		(BuildingType, 				BuildingClassType)
SELECT	'BUILDING_JFD_MANSION', 	Type
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_MANOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

DELETE FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_EE_SUMMER_PALACE' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_SUMMER_PALACE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_PrereqBuildingClasses
------------------------------------------------------------------------------------------------------------------------
DELETE FROM Building_PrereqBuildingClasses WHERE BuildingType = 'BUILDING_EE_SUMMER_PALACE' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_SUMMER_PALACE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors
		(BuildingType,				FlavorType,						Flavor)
SELECT	'BUILDING_JFD_ASSEMBLY',	Type,							50
FROM Flavors WHERE Type IN ('FLAVOR_WONDER', 'FLAVOR_GOLD', 'FLAVOR_CITY_DEFENSE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO Building_Flavors
		(FlavorType,				BuildingType,					Flavor)
SELECT	 'FLAVOR_GOLD',				Type,							20
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_BARRACKS', 'BUILDINGCLASS_WALLS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO Building_Flavors
		(FlavorType,				BuildingType,					Flavor)
SELECT	 'FLAVOR_CITY_DEFENSE',		Type,							20
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_BARRACKS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO Building_Flavors
		(BuildingType,				FlavorType,						Flavor)
SELECT	'BUILDING_JFD_MANOR',		Type,							50
FROM Flavors WHERE Type IN ('FLAVOR_WONDER', 'FLAVOR_GOLD', 'FLAVOR_CITY_DEFENSE', 'FLAVOR_HAPPINESS', 'FLAVOR_EXPANSION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO Building_Flavors
		(BuildingType,				FlavorType,						Flavor)
SELECT	'BUILDING_JFD_MANSION',		Type,							50
FROM Flavors WHERE Type IN ('FLAVOR_WONDER', 'FLAVOR_GOLD', 'FLAVOR_CITY_DEFENSE', 'FLAVOR_HAPPINESS', 'FLAVOR_EXPANSION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO Building_Flavors
		(BuildingType,				FlavorType,						Flavor)
SELECT	'BUILDING_EE_SUMMER_PALACE',Type,							50
FROM Flavors WHERE Type IN ('FLAVOR_WONDER', 'FLAVOR_GOLD', 'FLAVOR_CITY_DEFENSE', 'FLAVOR_HAPPINESS', 'FLAVOR_EXPANSION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================