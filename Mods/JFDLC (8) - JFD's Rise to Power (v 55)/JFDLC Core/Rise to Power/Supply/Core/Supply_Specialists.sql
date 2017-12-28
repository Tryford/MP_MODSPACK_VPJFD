--==========================================================================================================================	
-- SPECIALISTS
--==========================================================================================================================	
--Specialists
-----------------------------------------------------------------------------------------------------	
INSERT INTO Specialists
		(Type,								Description,							Strategy,										GreatPeopleTitle,							GreatPeopleUnitClass, 				GreatPeopleRateChange, 	Visible,	Cost,	SlotTexture,			CulturePerTurn,		IconAtlas,							PortraitIndex)
SELECT	'SPECIALIST_JFD_ADMIRAL',			'TXT_KEY_SPECIALIST_JFD_ADMIRAL',		'TXT_KEY_SPECIALIST_JFD_ADMIRAL_STRATEGY',		'TXT_KEY_SPECIALIST_JFD_ADMIRAL_TITLE',		'UNITCLASS_GREAT_ADMIRAL', 			0,						0,			0,		'CitizenAdmiral.dds',	0,					'JFD_SUPPLY_SPECIALIST_ATLAS',		0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SUPPLY_SPECIALIST_ADDITIONS_ADMIRALS' AND Value = 1);

INSERT INTO Specialists
		(Type,								Description,							Strategy,										GreatPeopleTitle,							GreatPeopleUnitClass, 				GreatPeopleRateChange, 	Visible,	Cost,	SlotTexture,			CulturePerTurn,		IconAtlas,							PortraitIndex)
SELECT	'SPECIALIST_JFD_GENERAL',			'TXT_KEY_SPECIALIST_JFD_GENERAL',		'TXT_KEY_SPECIALIST_JFD_GENERAL_STRATEGY',		'TXT_KEY_SPECIALIST_JFD_GENERAL_TITLE',		'UNITCLASS_GREAT_GENERAL', 			0,						0,			0,		'CitizenGeneral.adds',	0,					'JFD_SUPPLY_SPECIALIST_ATLAS',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SUPPLY_SPECIALIST_ADDITIONS_GENERALS' AND Value = 1);
-----------------------------------------------------------------------------------------------------
-- SpecialistFlavors
-----------------------------------------------------------------------------------------------------
INSERT INTO SpecialistFlavors 
		(SpecialistType, 				FlavorType,						Flavor)
SELECT	'SPECIALIST_JFD_ADMIRAL', 		'FLAVOR_MILITARY_TRAINING',		3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SUPPLY_SPECIALIST_ADDITIONS_ADMIRALS' AND Value = 1);

INSERT INTO SpecialistFlavors 
		(SpecialistType, 				FlavorType,						Flavor)
SELECT	'SPECIALIST_JFD_ADMIRAL', 		'FLAVOR_NAVAL',					3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SUPPLY_SPECIALIST_ADDITIONS_GENERALS' AND Value = 1);

INSERT INTO SpecialistFlavors 
		(SpecialistType, 				FlavorType,						Flavor)
SELECT	'SPECIALIST_JFD_GENERAL', 		'FLAVOR_MILITARY_TRAINING',		3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SUPPLY_SPECIALIST_ADDITIONS_GENERALS' AND Value = 1);
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Trait_SpecialistYieldChanges
-----------------------------------------------------------------------------------------------------
INSERT INTO Trait_SpecialistYieldChanges 
		(TraitType,			SpecialistType, 				YieldType, 	Yield)
SELECT	TraitType,			'SPECIALIST_JFD_ADMIRAL',		YieldType, 	Yield
FROM Trait_SpecialistYieldChanges WHERE SpecialistType = 'SPECIALIST_MERCHANT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SUPPLY_SPECIALIST_ADDITIONS_ADMIRALS' AND Value = 1);

INSERT INTO Trait_SpecialistYieldChanges 
		(TraitType,			SpecialistType, 				YieldType, 	Yield)
SELECT	TraitType,			'SPECIALIST_JFD_GENERAL',		YieldType, 	Yield
FROM Trait_SpecialistYieldChanges WHERE SpecialistType = 'SPECIALIST_MERCHANT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SUPPLY_SPECIALIST_ADDITIONS_GENERALS' AND Value = 1);
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Building_SpecialistYieldChanges
-----------------------------------------------------------------------------------------------------
INSERT INTO Building_SpecialistYieldChanges 
		(BuildingType,		SpecialistType, 				YieldType, 	Yield)
SELECT	BuildingType,		'SPECIALIST_JFD_ADMIRAL',		YieldType, 	Yield
FROM Building_SpecialistYieldChanges WHERE SpecialistType = 'SPECIALIST_MERCHANT' AND BuildingType = 'BUILDING_STATUE_LIBERTY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SUPPLY_SPECIALIST_ADDITIONS_ADMIRALS' AND Value = 1);

INSERT INTO Building_SpecialistYieldChanges 
		(BuildingType,		SpecialistType, 				YieldType, 	Yield)
SELECT	BuildingType,		'SPECIALIST_JFD_GENERAL',		YieldType, 	Yield
FROM Building_SpecialistYieldChanges WHERE SpecialistType = 'SPECIALIST_MERCHANT' AND BuildingType = 'BUILDING_STATUE_LIBERTY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SUPPLY_SPECIALIST_ADDITIONS_GENERALS' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================