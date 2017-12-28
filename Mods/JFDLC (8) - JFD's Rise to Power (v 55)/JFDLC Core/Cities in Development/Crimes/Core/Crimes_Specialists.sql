--==========================================================================================================================	
-- SPECIALISTS
--==========================================================================================================================	
--Specialists
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Specialists
		(Type,						Description,							Strategy,									GreatPeopleTitle,							IsNoBaseCrime,	Visible,	Cost,	SlotTexture,			IconAtlas,			PortraitIndex)
SELECT	'SPECIALIST_JFD_OFFICER',	'TXT_KEY_SPECIALIST_JFD_OFFICER',		'TXT_KEY_SPECIALIST_JFD_OFFICER_STRATEGY',	'TXT_KEY_SPECIALIST_JFD_OFFICER_TITLE',		1,				1,			0,		'citizenOfficer.dds',	'CITIZEN_ATLAS',	6
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_CID_CRIMES_SPECIALIST_ADDITIONS_OFFICER' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- SpecialistYields
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO SpecialistYields 
		(SpecialistType, 			YieldType,					Yield)
SELECT	'SPECIALIST_JFD_OFFICER', 	'YIELD_JFD_CRIME',			-2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- SpecialistFlavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO SpecialistFlavors 
		(SpecialistType, 			FlavorType,					Flavor)
SELECT	'SPECIALIST_JFD_OFFICER', 	Type,						1
FROM Flavors WHERE Type IN ('FLAVOR_PRODUCTION', 'FLAVOR_GROWTH', 'FLAVOR_RELIGION', 'FLAVOR_HAPPINESS', 'FLAVOR_CITY_DEFENSE', 'FLAVOR_SCIENCE', 'FLAVOR_CULTURE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_CID_CRIMES_SPECIALIST_ADDITIONS_OFFICER' AND Value = 1);
-----------------------------------------------------------------------------------------------------
-- Trait_SpecialistYieldChanges
-----------------------------------------------------------------------------------------------------
INSERT INTO Trait_SpecialistYieldChanges 
		(TraitType,		SpecialistType, 			YieldType, 	Yield)
SELECT	TraitType,		'SPECIALIST_JFD_OFFICER',	YieldType, 	Yield
FROM Trait_SpecialistYieldChanges WHERE SpecialistType = 'SPECIALIST_SCIENTIST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_CID_CRIMES_SPECIALIST_ADDITIONS_OFFICER' AND Value = 1);
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Building_SpecialistYieldChanges
-----------------------------------------------------------------------------------------------------
INSERT INTO Building_SpecialistYieldChanges 
		(BuildingType,	SpecialistType, 			YieldType, 	Yield)
SELECT	BuildingType,	'SPECIALIST_JFD_OFFICER',	YieldType, 	Yield
FROM Building_SpecialistYieldChanges WHERE SpecialistType = 'SPECIALIST_SCIENTIST' AND BuildingType = 'BUILDING_STATUE_LIBERTY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_CID_CRIMES_SPECIALIST_ADDITIONS_OFFICER' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================