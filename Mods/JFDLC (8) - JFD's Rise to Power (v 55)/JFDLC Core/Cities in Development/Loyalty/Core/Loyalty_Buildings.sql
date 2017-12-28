--==========================================================================================================================
---- BUILDINGS
--==========================================================================================================================	
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
--Aristocrats
UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_ARISTOCRAT', SpecialistCount = 1
WHERE BuildingClass IN ('BUILDINGCLASS_CASTLE', 'BUILDINGCLASS_ARSENAL', 'BUILDINGCLASS_EE_BASTION', 'BUILDINGCLASS_MILITARY_BASE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_CID_LOYALTY_SPECIALIST_ADDITIONS_ARISTOCRAT' AND Value = 1);

CREATE TRIGGER JFDCID_Loyalty_Buildings_Aristocrats
AFTER INSERT ON Buildings 
WHEN NEW.BuildingClass IN ('BUILDINGCLASS_CASTLE', 'BUILDINGCLASS_ARSENAL', 'BUILDINGCLASS_EE_BASTION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_CID_LOYALTY_SPECIALIST_ADDITIONS_ARISTOCRAT' AND Value = 1)
BEGIN
	UPDATE Buildings
	SET SpecialistType = 'SPECIALIST_JFD_ARISTOCRAT', SpecialistCount = 1
	WHERE Type = NEW.Type AND BuildingClass IN ('BUILDINGCLASS_CASTLE', 'BUILDINGCLASS_ARSENAL', 'BUILDINGCLASS_EE_BASTION');
END;

--Prison
UPDATE Buildings
SET PrereqTech = 'TECH_JFD_NATIONALISM'
WHERE Type = 'BUILDING_JFD_PRISON'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_TECH_ADDITIONS_NATIONALISM' AND Value = 1);

--Police Station
UPDATE Buildings
SET PrereqTech = 'TECH_JFD_NATIONALISM'
WHERE BuildingClass = 'BUILDINGCLASS_POLICE_STATION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_TECH_ADDITIONS_NATIONALISM' AND Value = 1);

CREATE TRIGGER JFDCID_Loyalty_Building
AFTER INSERT ON Buildings
WHEN NEW.BuildingClass IN ('BUILDINGCLASS_POLICE_STATION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_TECH_ADDITIONS_NATIONALISM' AND Value = 1)
BEGIN
	UPDATE Buildings
	SET PrereqTech = 'TECH_JFD_NATIONALISM'
	WHERE Type = NEW.Type;
END;
--------------------------------------------------------------------------------------------------------------------------
-- National Wonders
--------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings
SET Strategy = 'TXT_KEY_BUILDING_JFD_EAST_JFD_INDIA_COMPANY_STRATEGY', Help = 'TXT_KEY_BUILDING_EAST_JFD_INDIA_COMPANY_LOYALTY_HELP'
WHERE Type = 'BUILDING_JFD_EAST_INDIA_COMPANY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_NATIONAL_WONDER_CHANGES_EIC' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CITIES' AND Value > 1);
-------------------------------------------------------------------------------------------------------------------------
-- Building_BuildingClassYieldChanges
------------------------------------------------------------------------------------------------------------------------
DELETE FROM Building_BuildingClassYieldChanges WHERE BuildingType = 'BUILDING_JFD_EAST_INDIA_COMPANY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_NATIONAL_WONDER_CHANGES_EIC' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CITIES' AND Value > 1);
-------------------------------------------------------------------------------------------------------------------------
-- Building_YieldModifiers
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldModifiers 
		(BuildingType, 						YieldType,				Yield)
SELECT	Type, 								'YIELD_JFD_LOYALTY',	10
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_WALLS', 'BUILDINGCLASS_CASTLE', 'BUILDINGCLASS_ARSENAL', 'BUILDINGCLASS_MILITARY_BASE', 'BUILDINGCLASS_EE_BASTION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE_XP_BUILDINGS' AND Value = 0);

INSERT INTO Building_YieldModifiers 
		(BuildingType, 						YieldType,				Yield)
SELECT	Type, 								'YIELD_JFD_LOYALTY',	10
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_BARRACKS', 'BUILDINGCLASS_ARMORY', 'BUILDINGCLASS_MILITARY_ACADEMY', 'BUILDINGCLASS_EE_GUNSMITH')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE_XP_BUILDINGS' AND Value = 1);

INSERT INTO Building_YieldModifiers 
		(BuildingType, 						YieldType,				Yield)
SELECT	Type, 								'YIELD_JFD_LOYALTY',	20
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_COURTHOUSE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Building_YieldModifiers 
		(BuildingType, 						YieldType,				Yield)
SELECT	Type, 								'YIELD_JFD_LOYALTY',	20
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_JFD_DRILL_ACADEMY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Building_YieldModifiers 
		(BuildingType, 						YieldType,				Yield)
SELECT	Type,								'YIELD_JFD_LOYALTY',	20
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_PALACE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

CREATE TRIGGER JFDCID_Loyalty_Building_YieldModifiers
AFTER INSERT ON Buildings
WHEN NEW.BuildingClass IN ('BUILDINGCLASS_WALLS', 'BUILDINGCLASS_CASTLE', 'BUILDINGCLASS_ARSENAL', 'BUILDINGCLASS_MILITARY_BASE', 'BUILDINGCLASS_EE_BASTION', 'BUILDINGCLASS_BARRACKS', 'BUILDINGCLASS_ARMORY', 'BUILDINGCLASS_MILITARY_ACADEMY', 'BUILDINGCLASS_EE_GUNSMITH')
BEGIN
	INSERT INTO Building_YieldModifiers 
			(BuildingType, 					YieldType,				Yield)
	SELECT	Type, 							'YIELD_JFD_LOYALTY',	10
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass IN ('BUILDINGCLASS_WALLS', 'BUILDINGCLASS_CASTLE', 'BUILDINGCLASS_ARSENAL', 'BUILDINGCLASS_MILITARY_BASE', 'BUILDINGCLASS_EE_BASTION')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE_XP_BUILDINGS' AND Value = 0);
	
	INSERT INTO Building_YieldModifiers 
			(BuildingType, 						YieldType,				Yield)
	SELECT	Type, 								'YIELD_JFD_LOYALTY',	10
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass IN ('BUILDINGCLASS_BARRACKS', 'BUILDINGCLASS_ARMORY', 'BUILDINGCLASS_MILITARY_ACADEMY', 'BUILDINGCLASS_EE_GUNSMITH')
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE_XP_BUILDINGS' AND Value = 1);

	INSERT INTO Building_YieldModifiers 
			(BuildingType, 					YieldType,				Yield)
	SELECT	Type, 							'YIELD_JFD_LOYALTY',	20
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass = 'BUILDINGCLASS_COURTHOUSE'
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);
END;
-------------------------------------------------------------------------------------------------------------------------
-- Building_GlobalYieldModifiers
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_GlobalYieldModifiers 
		(BuildingType, 						YieldType,					Yield)
SELECT	Type, 								'YIELD_JFD_LOYALTY',		10
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_HEROIC_EPIC')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_HelpTexts
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_JFD_HelpTexts
		(BuildingType,						HelpText,										IsWrittenFirst)
SELECT	'BUILDING_HEROIC_EPIC',				'TXT_KEY_WONDER_JFD_HEROIC_EPIC_HELP_LOYALTY',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);
---------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
----------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_Flavors
		(BuildingType,						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_EAST_INDIA_COMPANY',	Type,						25
FROM Buildings WHERE Type IN ('FLAVOR_GROWTH', 'FLAVOR_HAPPINESS', 'FLAVOR_PRODUCTION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_NATIONAL_WONDER_CHANGES_EIC' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CITIES' AND Value > 1);

INSERT INTO Building_Flavors
		(BuildingType,						FlavorType,					Flavor)
SELECT	Type,								'FLAVOR_CULTURE',			10
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_BARRACKS', 'BUILDINGCLASS_ARMORY', 'BUILDINGCLASS_MILITARY_ACADEMY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Building_Flavors
		(BuildingType,						FlavorType,					Flavor)
SELECT	Type,								'FLAVOR_HAPPINESS',			10
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_BARRACKS', 'BUILDINGCLASS_ARMORY', 'BUILDINGCLASS_MILITARY_ACADEMY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

CREATE TRIGGER JFDCID_Loyalty_Building_Flavors
AFTER INSERT ON Buildings
WHEN NEW.BuildingClass IN ('BUILDINGCLASS_BARRACKS', 'BUILDINGCLASS_ARMORY', 'BUILDINGCLASS_MILITARY_ACADEMY')
BEGIN
	INSERT INTO Building_Flavors
			(BuildingType,					FlavorType,					Flavor)
	SELECT	Type,							'FLAVOR_CULTURE',			10
	FROM Buildings WHERE Type = NEW.Type
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);
	
	INSERT INTO Building_Flavors
			(BuildingType,					FlavorType,					Flavor)
	SELECT	Type,							'FLAVOR_HAPPINESS',			10
	FROM Buildings WHERE Type = NEW.Type
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);
END;
--==========================================================================================================================
--==========================================================================================================================