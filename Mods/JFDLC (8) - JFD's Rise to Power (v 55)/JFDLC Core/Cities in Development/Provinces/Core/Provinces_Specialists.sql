--==========================================================================================================================	
-- SPECIALISTS
--==========================================================================================================================	
--Specialists
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Specialists
		(Type,							Description,							Strategy,									GreatPeopleTitle,							Visible,	Cost,	SlotTexture,			IconAtlas,							PortraitIndex)
SELECT	'SPECIALIST_JFD_GOVERNOR',		'TXT_KEY_SPECIALIST_JFD_GOVERNOR',		'TXT_KEY_SPECIALIST_JFD_GOVERNOR_STRATEGY',	'TXT_KEY_SPECIALIST_JFD_GOVERNOR_TITLE',	1,			0,		'citizenGovernor.dds',	'JFD_PROVINCES_SPECIALIST_ATLAS',	0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_CID_PROVINCES_SPECIALIST_ADDITIONS_GOVERNOR' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- SpecialistFlavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO SpecialistFlavors 
		(SpecialistType, 				FlavorType,		Flavor)
SELECT	'SPECIALIST_JFD_GOVERNOR',		Type,			3
FROM Flavors WHERE Type IN ('FLAVOR_PRODUCTION', 'FLAVOR_GROWTH')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_CID_PROVINCES_SPECIALIST_ADDITIONS_GOVERNOR' AND Value = 1);
-----------------------------------------------------------------------------------------------------
-- Trait_SpecialistYieldChanges
-----------------------------------------------------------------------------------------------------
INSERT INTO Trait_SpecialistYieldChanges 
		(TraitType,		SpecialistType, 				YieldType, 	Yield)
SELECT	TraitType,		'SPECIALIST_JFD_GOVERNOR',		YieldType, 	Yield
FROM Trait_SpecialistYieldChanges WHERE SpecialistType = 'SPECIALIST_SCIENTIST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_CID_PROVINCES_SPECIALIST_ADDITIONS_GOVERNOR' AND Value = 1);
-----------------------------------------------------------------------------------------------------	
-- Building_SpecialistYieldChanges
-----------------------------------------------------------------------------------------------------
INSERT INTO Building_SpecialistYieldChanges 
		(BuildingType,	SpecialistType, 				YieldType, 	Yield)
SELECT	BuildingType,	'SPECIALIST_JFD_GOVERNOR',		YieldType, 	Yield
FROM Building_SpecialistYieldChanges WHERE SpecialistType = 'SPECIALIST_MERCHANT' AND BuildingType = 'BUILDING_STATUE_LIBERTY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_CID_PROVINCES_SPECIALIST_ADDITIONS_GOVERNOR' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================