--==========================================================================================================================
-- DISTRICTS
--==========================================================================================================================
-- JFD_Districts
------------------------------------------------------------------------------------------------------------------------
INSERT INTO JFD_Districts
		(Type,									Description)
VALUES	('BUILDINGCLASSCATEGORY_CENTRAL',		'TXT_KEY_JFD_BUILDINGCLASSCATEGORY_CENTRAL_DESC'),
		('BUILDINGCLASSCATEGORY_CULTURAL',		'TXT_KEY_JFD_BUILDINGCLASSCATEGORY_CULTURAL_DESC'),
		('BUILDINGCLASSCATEGORY_EDUCATION',		'TXT_KEY_JFD_BUILDINGCLASSCATEGORY_EDUCATION_DESC'),
		('BUILDINGCLASSCATEGORY_ENTERTAINMENT',	'TXT_KEY_JFD_BUILDINGCLASSCATEGORY_ENTERTAINMENT_DESC'),
		('BUILDINGCLASSCATEGORY_FINANCIAL',		'TXT_KEY_JFD_BUILDINGCLASSCATEGORY_FINANCIAL_DESC'),
		('BUILDINGCLASSCATEGORY_INDUSTRIAL',	'TXT_KEY_JFD_BUILDINGCLASSCATEGORY_INDUSTRIAL_DESC'),
		('BUILDINGCLASSCATEGORY_MARITIME',		'TXT_KEY_JFD_BUILDINGCLASSCATEGORY_MARITIME_DESC'),
		('BUILDINGCLASSCATEGORY_MILITARY',		'TXT_KEY_JFD_BUILDINGCLASSCATEGORY_MILITARY_DESC'),
		('BUILDINGCLASSCATEGORY_RELIGIOUS',		'TXT_KEY_JFD_BUILDINGCLASSCATEGORY_RELIGIOUS_DESC'),
		('BUILDINGCLASSCATEGORY_WELFARE',		'TXT_KEY_JFD_BUILDINGCLASSCATEGORY_WELFARE_DESC');
--==========================================================================================================================
-- BUILDING CLASSES
--==========================================================================================================================	
-- BuildingClass_JFD_District
------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClass_JFD_District 
		(BuildingClassType, 	DistrictType)
SELECT	Type,					'BUILDINGCLASSCATEGORY_CULTURAL'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_MONUMENT', 'BUILDINGCLASS_AMPHITHEATER', 'BUILDINGCLASS_ARTISTS_GUILD', 'BUILDINGCLASS_BROADCAST_TOWER', 'BUILDINGCLASS_MUSEUM', 'BUILDINGCLASS_MUSICIANS_GUILD', 'BUILDINGCLASS_OPERA_HOUSE', 'BUILDINGCLASS_THEATRE', 'BUILDINGCLASS_WRITERS_GUILD', 'BUILDINGCLASS_NATIONAL_EPIC', 'BUILDINGCLASS_HERMITAGE', 'BUILDINGCLASS_PARTHENON', 'BUILDINGCLASS_ORACLE', 'BUILDINGCLASS_SISTINE_CHAPEL', 'BUILDINGCLASS_UFFIZI', 'BUILDINGCLASS_EIFFEL_TOWER', 'BUILDINGCLASS_CRISTO_REDENTOR', 'BUILDINGCLASS_SYDNEY_OPERA_HOUSE', 'BUILDINGCLASS_BROADWAY', 'BUILDINGCLASS_GLOBE_THEATRE', 'BUILDINGCLASS_LOUVRE', 'BUILDINGCLASS_TOURIST_CENTER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CITY_DISTRICTS' AND Value = 1);

INSERT INTO BuildingClass_JFD_District 
		(BuildingClassType, 	DistrictType)
SELECT	Type,					'BUILDINGCLASSCATEGORY_EDUCATION'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_LIBRARY', 'BUILDINGCLASS_UNIVERSITY', 'BUILDINGCLASS_PUBLIC_SCHOOL', 'BUILDINGCLASS_EE_ACADEMY', 'BUILDINGCLASS_LABORATORY', 'BUILDINGCLASS_NATIONAL_COLLEGE', 'BUILDINGCLASS_OBSERVATORY', 'BUILDINGCLASS_OXFORD_UNIVERSITY', 'BUILDINGCLASS_GREAT_LIBRARY', 'BUILDINGCLASS_PORCELAIN_TOWER', 'BUILDINGCLASS_HUBBLE', 'BUILDINGCLASS_INTERNATIONAL_SPACE_STATION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CITY_DISTRICTS' AND Value = 1);

INSERT INTO BuildingClass_JFD_District 
		(BuildingClassType, 	DistrictType)
SELECT	Type,					'BUILDINGCLASSCATEGORY_ENTERTAINMENT'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_COLOSSEUM', 'BUILDINGCLASS_CIRCUS', 'BUILDINGCLASS_CIRCUS_MAXIMUS', 'BUILDINGCLASS_STADIUM', 'BUILDINGCLASS_NOTRE_DAME', 'BUILDINGCLASS_PRORA_RESORT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CITY_DISTRICTS' AND Value = 1);

INSERT INTO BuildingClass_JFD_District 
		(BuildingClassType, 	DistrictType)
SELECT	Type,					'BUILDINGCLASSCATEGORY_FINANCIAL'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_MARKET', 'BUILDINGCLASS_BANK', 'BUILDINGCLASS_CARAVANSARY', 'BUILDINGCLASS_JFD_EAST_INDIA_COMPANY', 'BUILDINGCLASS_STOCK_EXCHANGE', 'BUILDINGCLASS_MINT', 'BUILDINGCLASS_NATIONAL_TREASURY', 'BUILDINGCLASS_MAUSOLEUM_HALICARNASSUS', 'BUILDINGCLASS_COLOSSUS', 'BUILDINGCLASS_PETRA', 'BUILDINGCLASS_MACHU_PICHU', 'BUILDINGCLASS_JFD_STONE_TOWN', 'BUILDINGCLASS_BIG_BEN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CITY_DISTRICTS' AND Value = 1);

INSERT INTO BuildingClass_JFD_District 
		(BuildingClassType, 	DistrictType)
SELECT	Type,					'BUILDINGCLASSCATEGORY_INDUSTRIAL'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_WINDMILL', 'BUILDINGCLASS_WATERMILL', 'BUILDINGCLASS_WORKSHOP', 'BUILDINGCLASS_FACTORY', 'BUILDINGCLASS_FACTORY', 'BUILDINGCLASS_HYDRO_PLANT', 'BUILDINGCLASS_IRONWORKS', 'BUILDINGCLASS_JFD_BLAST_FURNACE', 'BUILDINGCLASS_JFD_COAL_PLANT', 'BUILDINGCLASS_JFD_HORSE_MILL', 'BUILDINGCLASS_JFD_OIL_REFINERY', 'BUILDINGCLASS_JFD_WIND_FARM', 'BUILDINGCLASS_NUCLEAR_PLANT', 'BUILDINGCLASS_RECYCLING_CENTER', 'BUILDINGCLASS_SOLAR_PLANT', 'BUILDINGCLASS_SPACESHIP_FACTORY', 'BUILDINGCLASS_STONE_WORKS', 'BUILDINGCLASS_STATUE_OF_LIBERTY', 'BUILDINGCLASS_KREMLIN', 'BUILDINGCLASS_JFD_THREE_GORGES')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CITY_DISTRICTS' AND Value = 1);

INSERT INTO BuildingClass_JFD_District 
		(BuildingClassType, 	DistrictType)
SELECT	Type,					'BUILDINGCLASSCATEGORY_MARITIME'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_HARBOR', 'BUILDINGCLASS_LIGHTHOUSE', 'BUILDINGCLASS_SEAPORT', 'BUILDINGCLASS_GREAT_LIGHTHOUSE', 'BUILDINGCLASS_JFD_BELEM_TOWER', 'BUILDINGCLASS_JFD_TRAFALGAR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CITY_DISTRICTS' AND Value = 1);	

INSERT INTO BuildingClass_JFD_District 
		(BuildingClassType, 	DistrictType)
SELECT	Type,					'BUILDINGCLASSCATEGORY_MILITARY'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_BARRACKS', 'BUILDINGCLASS_ARMORY', 'BUILDINGCLASS_MILITARY_ACADEMY', 'BUILDINGCLASS_HEROIC_EPIC', 'BUILDINGCLASS_STABLE', 'BUILDINGCLASS_STATUE_ZEUS', 'BUILDINGCLASS_TERRACOTTA_ARMY', 'BUILDINGCLASS_BRANDENBURG_GATE', 'BUILDINGCLASS_PENTAGON')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CITY_DISTRICTS' AND Value = 1);	

INSERT INTO BuildingClass_JFD_District 
		(BuildingClassType, 	DistrictType)
SELECT	Type,					'BUILDINGCLASSCATEGORY_RELIGIOUS'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_SHRINE', 'BUILDINGCLASS_TEMPLE', 'BUILDINGCLASS_MONASTERY' ,'BUILDINGCLASS_CATHEDRAL', 'BUILDINGCLASS_GRAND_TEMPLE', 'BUILDINGCLASS_JFD_ALTAR', 'BUILDINGCLASS_JFD_CHURCH', 'BUILDINGCLASS_JFD_DAOGUAN', 'BUILDINGCLASS_JFD_GRAND_INQUISITION', 'BUILDINGCLASS_JFD_GURDWARA', 'BUILDINGCLASS_JFD_MANDIR', 'BUILDINGCLASS_JFD_SYNAGOGUE', 'BUILDINGCLASS_JFD_TORII', 'BUILDINGCLASS_MOSQUE', 'BUILDINGCLASS_PAGODA', 'BUILDINGCLASS_STONEHENGE', 'BUILDINGCLASS_BOROBUDUR', 'BUILDINGCLASS_MOSQUE_OF_DJENNE', 'BUILDINGCLASS_HAGIA_SOPHIA')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CITY_DISTRICTS' AND Value = 1);

INSERT INTO BuildingClass_JFD_District 
		(BuildingClassType, 	DistrictType)
SELECT	Type,					'BUILDINGCLASSCATEGORY_WELFARE'
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_GRANARY', 'BUILDINGCLASS_JFD_GRAIN_SILO', 'BUILDINGCLASS_JFD_HERBALIST', 'BUILDINGCLASS_AQUEDUCT', 'BUILDINGCLASS_JFD_CISTERN', 'BUILDINGCLASS_JFD_GROCER', 'BUILDINGCLASS_HOSPITAL', 'BUILDINGCLASS_JFD_SUPERMARKET', 'BUILDINGCLASS_JFD_RED_CROSS', 'BUILDINGCLASS_TEMPLE_ARTEMIS', 'BUILDINGCLASS_HANGING_GARDEN', 'BUILDINGCLASS_JFD_PONT_DU_GARD', 'BUILDINGCLASS_ANGKOR_WAT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CITY_DISTRICTS' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================