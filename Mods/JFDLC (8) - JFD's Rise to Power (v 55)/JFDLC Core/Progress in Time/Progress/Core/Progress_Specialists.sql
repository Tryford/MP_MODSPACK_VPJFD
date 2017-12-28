--==========================================================================================================================	
-- GREAT PERSONS
--==========================================================================================================================	
-- GreatPersons
-----------------------------------------------------------------------------------------------------
INSERT INTO GreatPersons 
		(Type, 								Class,									Specialist)
SELECT	'GREATPERSON_JFD_DIRECTOR', 		'UNITCLASS_JFD_GREAT_DIRECTOR',			'SPECIALIST_JFD_DIRECTOR'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);
--==========================================================================================================================	
-- SPECIALISTS
--==========================================================================================================================	
--Specialists
-----------------------------------------------------------------------------------------------------	
INSERT INTO Specialists
		(Type,								Description,							Strategy,										GreatPeopleTitle,							GreatPeopleUnitClass, 				GreatPeopleRateChange, 	Visible,	Cost,	SlotTexture,			CulturePerTurn,		IconAtlas,			PortraitIndex)
SELECT	'SPECIALIST_JFD_DIRECTOR',			'TXT_KEY_SPECIALIST_JFD_DIRECTOR',		'TXT_KEY_SPECIALIST_JFD_DIRECTOR_STRATEGY',		'TXT_KEY_SPECIALIST_JFD_DIRECTOR_TITLE',	'UNITCLASS_JFD_GREAT_DIRECTOR', 	4,						1,			0,		'CitizenArtist.dds',	3,					'CITIZEN_ATLAS',	4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);
-----------------------------------------------------------------------------------------------------
-- SpecialistFlavors
-----------------------------------------------------------------------------------------------------
INSERT INTO SpecialistFlavors 
		(SpecialistType, 				FlavorType,		Flavor)
SELECT	'SPECIALIST_JFD_DIRECTOR', 		FlavorType,		Flavor
FROM SpecialistFlavors WHERE SpecialistType = 'SPECIALIST_ARTIST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Trait_SpecialistYieldChanges
-----------------------------------------------------------------------------------------------------
INSERT INTO Trait_SpecialistYieldChanges 
		(TraitType,			SpecialistType, 				YieldType, 	Yield)
SELECT	TraitType,			'SPECIALIST_JFD_DIRECTOR',		YieldType, 	Yield
FROM Trait_SpecialistYieldChanges WHERE SpecialistType = 'SPECIALIST_ARTIST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Building_SpecialistYieldChanges
-----------------------------------------------------------------------------------------------------
INSERT INTO Building_SpecialistYieldChanges 
		(BuildingType,		SpecialistType, 				YieldType, 	Yield)
SELECT	BuildingType,		'SPECIALIST_JFD_DIRECTOR',		YieldType, 	Yield
FROM Building_SpecialistYieldChanges WHERE SpecialistType = 'SPECIALIST_ARTIST' AND BuildingType = 'BUILDING_STATUE_LIBERTY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================