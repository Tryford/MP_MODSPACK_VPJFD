--==========================================================================================================================	
-- SPECIALISTS
--==========================================================================================================================	
--Specialists
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Specialists
		(Type,						Description,							Strategy,									GreatPeopleTitle,						GreatPeopleRateChange, 	Visible,	Cost,	SlotTexture,			IconAtlas,						PortraitIndex)
SELECT	'SPECIALIST_JFD_DOCTOR',	'TXT_KEY_SPECIALIST_JFD_DOCTOR',		'TXT_KEY_SPECIALIST_JFD_DOCTOR_STRATEGY',	'TXT_KEY_SPECIALIST_JFD_DOCTOR_TITLE',	3,						1,			0,		'CitizenDoctor.dds',	'JFD_HEALTH_SPECIALIST_ATLAS',	0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

UPDATE Specialists
SET GreatPeopleUnitClass = 'UNITCLASS_JFD_GREAT_DOCTOR'
WHERE Type = 'SPECIALIST_JFD_DOCTOR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_GREAT_PEOPLE_ADDITIONS_DOCTOR' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- SpecialistFlavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO SpecialistFlavors 
		(SpecialistType, 			FlavorType,					Flavor)
SELECT	'SPECIALIST_JFD_DOCTOR', 	Type,						3
FROM Flavors WHERE Type IN ('FLAVOR_GROWTH', 'FLAVOR_SCIENCE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- SpecialistYields
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO SpecialistYields 
		(SpecialistType, 			YieldType,					Yield)
SELECT	'SPECIALIST_JFD_DOCTOR', 	'YIELD_JFD_HEALTH',			3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
-----------------------------------------------------------------------------------------------------
-- Trait_SpecialistYieldChanges
-----------------------------------------------------------------------------------------------------
INSERT INTO Trait_SpecialistYieldChanges 
		(TraitType,		SpecialistType, 			YieldType, 	Yield)
SELECT	TraitType,		'SPECIALIST_JFD_DOCTOR',	YieldType, 	Yield
FROM Trait_SpecialistYieldChanges WHERE SpecialistType = 'SPECIALIST_SCIENTIST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Building_SpecialistYieldChanges
-----------------------------------------------------------------------------------------------------
INSERT INTO Building_SpecialistYieldChanges 
		(BuildingType,	SpecialistType, 			YieldType, 	Yield)
SELECT	BuildingType,	'SPECIALIST_JFD_DOCTOR',	YieldType, 	Yield
FROM Building_SpecialistYieldChanges WHERE SpecialistType = 'SPECIALIST_SCIENTIST' AND BuildingType = 'BUILDING_STATUE_LIBERTY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================