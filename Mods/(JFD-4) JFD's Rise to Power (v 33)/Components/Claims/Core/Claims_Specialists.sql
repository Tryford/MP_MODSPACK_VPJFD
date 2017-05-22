--==========================================================================================================================	
-- GREAT PERSONS
--==========================================================================================================================	
-- GreatPersons
-----------------------------------------------------------------------------------------------------
INSERT INTO GreatPersons 
		(Type, 								Class,									Specialist)
SELECT	'GREATPERSON_JFD_DIGNITARY', 		'UNITCLASS_JFD_GREAT_DIGNITARY',		'SPECIALIST_JFD_DIGNITARY'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO GreatPersons 
		(Type, 								Class,									Specialist)
SELECT	'GREATPERSON_JFD_MAGISTRATE', 		'UNITCLASS_JFD_GREAT_MAGISTRATE',		'SPECIALIST_JFD_MAGISTRATE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--==========================================================================================================================	
-- SPECIALISTS
--==========================================================================================================================	
--Specialists
-----------------------------------------------------------------------------------------------------	
INSERT INTO Specialists
		(Type,								Description,							Strategy,										GreatPeopleTitle,							GreatPeopleUnitClass, 				GreatPeopleRateChange, 	Visible,	Cost,	SlotTexture,				IconAtlas,						PortraitIndex)
SELECT	'SPECIALIST_JFD_DIGNITARY',			'TXT_KEY_SPECIALIST_JFD_DIGNITARY',		'TXT_KEY_SPECIALIST_JFD_DIGNITARY_STRATEGY',	'TXT_KEY_SPECIALIST_JFD_DIGNITARY_TITLE',	'UNITCLASS_JFD_GREAT_DIGNITARY', 	4,						1,			0,		'CitizenDignitary.dds',		'JFD_CLAIMS_SPECIALIST_ATLAS',	0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Specialists
		(Type,								Description,							Strategy,										GreatPeopleTitle,							GreatPeopleUnitClass, 				GreatPeopleRateChange, 	Visible,	Cost,	SlotTexture,				IconAtlas,						PortraitIndex)
SELECT	'SPECIALIST_JFD_MAGISTRATE',		'TXT_KEY_SPECIALIST_JFD_MAGISTRATE',	'TXT_KEY_SPECIALIST_JFD_MAGISTRATE_STRATEGY',	'TXT_KEY_SPECIALIST_JFD_MAGISTRATE_TITLE',	'UNITCLASS_JFD_GREAT_MAGISTRATE', 	4,						1,			0,		'CitizenMagistrate.dds',	'JFD_CLAIMS_SPECIALIST_ATLAS',	0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
-----------------------------------------------------------------------------------------------------
-- SpecialistFlavors
-----------------------------------------------------------------------------------------------------
INSERT INTO SpecialistFlavors 
		(SpecialistType, 					FlavorType,		Flavor)
SELECT	'SPECIALIST_JFD_DIGNITARY', 		Type,			10
FROM Flavors WHERE Type IN ('FLAVOR_CULTURE', 'FLAVOR_GOLD', 'FLAVOR_PRODUCTION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO SpecialistFlavors 
		(SpecialistType, 					FlavorType,		Flavor)
SELECT	'SPECIALIST_JFD_MAGISTRATE', 		Type,			10
FROM Flavors WHERE Type IN ('FLAVOR_CULTURE', 'FLAVOR_GOLD', 'FLAVOR_PRODUCTION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
-----------------------------------------------------------------------------------------------------
-- SpecialistYields
-----------------------------------------------------------------------------------------------------
INSERT INTO SpecialistYields 
		(SpecialistType, 					YieldType,						Yield)
SELECT	'SPECIALIST_JFD_DIGNITARY', 		'YIELD_GOLDEN_AGE_POINTS',		4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO SpecialistYields 
		(SpecialistType, 					YieldType,						Yield)
SELECT	'SPECIALIST_JFD_MAGISTRATE', 		'YIELD_GOLDEN_AGE_POINTS',		4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Trait_SpecialistYieldChanges
-----------------------------------------------------------------------------------------------------
INSERT INTO Trait_SpecialistYieldChanges 
		(TraitType,			SpecialistType, 				YieldType, 	Yield)
SELECT	TraitType,			'SPECIALIST_JFD_DIGNITARY',		YieldType, 	Yield
FROM Trait_SpecialistYieldChanges WHERE SpecialistType = 'SPECIALIST_MERCHANT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Trait_SpecialistYieldChanges 
		(TraitType,			SpecialistType, 				YieldType, 	Yield)
SELECT	TraitType,			'SPECIALIST_JFD_MAGISTRATE',	YieldType, 	Yield
FROM Trait_SpecialistYieldChanges WHERE SpecialistType = 'SPECIALIST_MERCHANT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Building_SpecialistYieldChanges
-----------------------------------------------------------------------------------------------------
INSERT INTO Building_SpecialistYieldChanges 
		(BuildingType,		SpecialistType, 				YieldType, 	Yield)
SELECT	BuildingType,		'SPECIALIST_JFD_DIGNITARY',		YieldType, 	Yield
FROM Building_SpecialistYieldChanges WHERE SpecialistType = 'SPECIALIST_MERCHANT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Building_SpecialistYieldChanges 
		(BuildingType,		SpecialistType, 				YieldType, 	Yield)
SELECT	BuildingType,		'SPECIALIST_JFD_MAGISTRATE',	YieldType, 	Yield
FROM Building_SpecialistYieldChanges WHERE SpecialistType = 'SPECIALIST_MERCHANT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================