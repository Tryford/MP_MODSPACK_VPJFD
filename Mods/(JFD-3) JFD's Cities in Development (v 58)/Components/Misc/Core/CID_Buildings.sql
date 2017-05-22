--==========================================================================================================================
-- BUILDING CLASSES
--==========================================================================================================================
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type,						DefaultBuilding,	MaxPlayerInstances)
VALUES	('BUILDINGCLASS_JFD_CID',	NULL,				-1);
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- BuildingClass_ConstructionAudio
------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_AIRPORT'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_AIRPORT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_AMPHITHEATER'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_AMPHITHEATER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_APOTHECARY'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_APOTHECARY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_AQUEDUCT'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_AQUEDUCT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_ARSENAL'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_ARSENAL')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_BANK'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_BANK')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_BARRACKS'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_BARRACKS', 'BUILDINGCLASS_ARMORY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_BOMB_SHELTER'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_BOMB_SHELTER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_BROADCAST_TOWER'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_BROADCAST_TOWER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_BLAST_FURNACE'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_BLAST_FURNACE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_CASTLE'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_CASTLE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_CARAVANSARY'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_CARAVANSARY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_CATHEDRAL'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_CATHEDRAL')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_CINEMA'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_CINEMA')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_CIRCUS'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_CIRCUS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_CISTERN'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_CISTERN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_COAL_PLANT'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_COAL_PLANT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_COLOSSEUM'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_COLOSSEUM')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_CONSTABULARY'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_CONSTABLE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_COURTHOUSE'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_COURTHOUSE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_DRILL_ACADEMY'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_DRILL_ACADEMY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_FACTORY'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_FACTORY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_FORGE'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_FORGE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_GARDEN'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_GARDEN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_GRAIN_ELEVATOR'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_GRAIN_ELEVATOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_GRANARY'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_GRANARY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_GROCER'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_GROCER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_HARBOR'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_HARBOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_HERBALIST'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_HERBALIST')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_HORSE_MILL'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_HORSE_MILL')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_HOSPITAL'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_HOSPITAL')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_HOTEL'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_HOTEL')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_HYDRO_PLANT'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_HYDRO_PLANT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_JAIL'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_JAIL')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_LABORATORY'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_LABORATORY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_LIBRARY'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_LIBRARY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_LIGHTHOUSE'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_LIGHTHOUSE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_MANOR'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_MANOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_MANSION'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_MANSION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_MARKET'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_MARKET')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_MEDICAL_LAB'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_MEDICAL_LAB')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_MILITARY_ACADEMY'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_MILITARY_ACADEMY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_MILITARY_BASE'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_MILITARY_BASE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_MINT'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_MINT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_MONASTERY'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_MONASTERY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_MONUMENT'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_MONUMENT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_MOSQUE'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_MOSQUE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_MUSEUM'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_MUSEUM')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_NUCLEAR_PLANT'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_NUCLEAR_PLANT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_OBSERVATORY'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_OBSERVATORY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_OIL_REFINERY'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_OIL_REFINERY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_OPERA_HOUSE'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_OPERA_HOUSE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_PAGODA'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_PAGODA')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_POLICE_STATION'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_POLICE_STATION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_PRISON'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_PRISON')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_PUBLIC_SCHOOL'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_PUBLIC_SCHOOL')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_RECYCLING_CENTER'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_RECYCLING_CENTER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_SEAPORT'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_SEAPORT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_SHRINE'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_SHRINE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_SOLAR_PLANT'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_SOLAR_PLANT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_SPACESHIP'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_SPACESHIP_FACTORY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_STABLE'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_STABLE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_STADIUM'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_STADIUM')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_STOCK_EXCHANGE'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_STOCK_EXCHANGE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_STONEWORKS'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_STONE_WORKS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_SUPERMARKET'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_SUPERMARKET')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_TEMPLE'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_TEMPLE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_UNIVERSITY'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_UNIVERSITY', 'BUILDINGCLASS_EE_ACADEMY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_WALLS'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_WALLS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_WATERMILL'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_WATERMILL')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_WINDMILL'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_WINDMILL')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_WIND_FARM'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_WIND_FARM')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_WORKSHOP'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_WORKSHOP')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_ZOO'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_THEATRE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);
---------------------
-- National Wonders
---------------------
INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_ARTISTS_GUILD'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_ARTISTS_GUILD')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_CIRCUS_MAXIMUS'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_CIRCUS_MAXIMUS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_COURT_CHANCERY'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_COURT_CHANCERY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_GRAND_TEMPLE'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_GRAND_TEMPLE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_EAST_INDIA_COMPANY'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_EAST_INDIA_COMPANY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_HEROIC_EPIC'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_HEROIC_EPIC')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_GALLERY'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_HERMITAGE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_INTELLIGENCE_AGENCY'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_INTELLIGENCE_AGENCY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_IRONWORKS'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_IRONWORKS', 'BUILDINGCLASS_JFD_BLAST_FURANCE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_MUSICIANS_GUILD'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_MUSICIANS_GUILD')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_NATIONAL_COLLEGE'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_NATIONAL_COLLEGE', 'BUILDINGCLASS_OXFORD_UNIVERSITY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_NATIONAL_EPIC'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_NATIONAL_EPIC')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_NATIONAL_TREASURY'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_NATIONAL_TREASURY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_JFD_RED_CROSS'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_RED_CROSS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_VISITORS_CENTER'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_TOURIST_CENTER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO BuildingClass_ConstructionAudio 
		(BuildingClassType, 	ConstructionAudio)
SELECT	Type,					'AS2D_BUILDING_JFD_WRITERS_GUILD'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_WRITERS_GUILD')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Buildings
----------------------
INSERT INTO Buildings
		(Type,							BuildingClass,				Cost, 	FaithCost,	Defense,	PrereqTech,	GreatWorkCount,			Description)
VALUES	('BUILDING_JFD_DEFENSE',		'BUILDINGCLASS_JFD_CID',	-1,		-1,			100,		NULL,		-1,						'TXT_KEY_BUILDING_JFD_DEFENSE_DESC');
----------------------
-- Building_ConstructionAudio
----------------------
INSERT INTO Building_ConstructionAudio
		(BuildingType, 					ConstructionAudio)
SELECT	'BUILDING_BAZAAR',				'AS2D_BUILDING_JFD_BAZAAR'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO Building_ConstructionAudio
		(BuildingType, 					ConstructionAudio)
SELECT	'BUILDING_BURIAL_TOMB',			'AS2D_BUILDING_JFD_BURIAL_TOMB'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO Building_ConstructionAudio
		(BuildingType, 					ConstructionAudio)
SELECT	'BUILDING_CANDI',				'AS2D_BUILDING_JFD_CANDI'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO Building_ConstructionAudio
		(BuildingType, 					ConstructionAudio)
SELECT	'BUILDING_CEILIDH_HALL',		'AS2D_BUILDING_JFD_CEILIDH_HALL'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO Building_ConstructionAudio
		(BuildingType, 					ConstructionAudio)
SELECT	'BUILDING_COFFEE_HOUSE',		'AS2D_BUILDING_JFD_COFFEE_HOUSE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO Building_ConstructionAudio
		(BuildingType, 					ConstructionAudio)
SELECT	'BUILDING_DUCAL_STABLE',		'AS2D_BUILDING_JFD_DUCAL_STABLE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO Building_ConstructionAudio
		(BuildingType, 					ConstructionAudio)
SELECT	'BUILDING_FLOATING_GARDENS',	'AS2D_BUILDING_JFD_FLOATING_GARDENS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO Building_ConstructionAudio
		(BuildingType, 					ConstructionAudio)
SELECT	'BUILDING_LONGHOUSE',			'AS2D_BUILDING_JFD_LONGHOUSE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO Building_ConstructionAudio
		(BuildingType, 					ConstructionAudio)
SELECT	'BUILDING_HANSE',				'AS2D_BUILDING_JFD_HANSE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO Building_ConstructionAudio
		(BuildingType, 					ConstructionAudio)
SELECT	'BUILDING_IKANDA',				'AS2D_BUILDING_JFD_IKANDA'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO Building_ConstructionAudio
		(BuildingType, 					ConstructionAudio)
SELECT	'BUILDING_KREPOST',				'AS2D_BUILDING_JFD_KREPOST'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO Building_ConstructionAudio
		(BuildingType, 					ConstructionAudio)
SELECT	'BUILDING_MUD_PYRAMID_MOSQUE',	'AS2D_BUILDING_JFD_MUD_PYRAMID_MOSQUE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO Building_ConstructionAudio
		(BuildingType, 					ConstructionAudio)
SELECT	'BUILDING_MUGHAL_FORT',			'AS2D_BUILDING_JFD_MUGHAL_FORT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO Building_ConstructionAudio
		(BuildingType, 					ConstructionAudio)
SELECT	'BUILDING_PAPER_MAKER',			'AS2D_BUILDING_JFD_PAPER_MAKER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO Building_ConstructionAudio
		(BuildingType, 					ConstructionAudio)
SELECT	'BUILDING_PYRAMID',				'AS2D_BUILDING_JFD_PYRAMID'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO Building_ConstructionAudio
		(BuildingType, 					ConstructionAudio)
SELECT	'BUILDING_ROYAL_LIBRARY',		'AS2D_BUILDING_JFD_ROYAL_LIBERARY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO Building_ConstructionAudio
		(BuildingType, 					ConstructionAudio)
SELECT	'BUILDING_SATRAPS_COURT',		'AS2D_BUILDING_JFD_SATRAP_COURT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO Building_ConstructionAudio
		(BuildingType, 					ConstructionAudio)
SELECT	'BUILDING_STELE',				'AS2D_BUILDING_JFD_STELE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO Building_ConstructionAudio
		(BuildingType, 					ConstructionAudio)
SELECT	'BUILDING_WAT',					'AS2D_BUILDING_JFD_WAT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);

INSERT INTO Building_ConstructionAudio
		(BuildingType, 					ConstructionAudio)
SELECT	'BUILDING_WALLS_OF_BABYLON',	'AS2D_BUILDING_JFD_WALLS_BABYLON'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================