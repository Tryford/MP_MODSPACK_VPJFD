--==========================================================================================================================	
-- SPECIALISTS
--==========================================================================================================================	
--Specialists
-----------------------------------------------------------------------------------------------------	
INSERT INTO Specialists
		(Type,						Description,					Strategy,									GreatPeopleTitle,						GreatPeopleUnitClass, 	GreatPeopleRateChange, 	Visible,	IconAtlas,						PortraitIndex)
SELECT	'SPECIALIST_JFD_MONK',		'TXT_KEY_SPECIALIST_JFD_MONK',	'TXT_KEY_SPECIALIST_JFD_MONK_STRATEGY', 	'TXT_KEY_SPECIALIST_JFD_MONK_TITLE',	'UNITCLASS_PROPHET', 	3,						1,			'JFD_PIETY_SPECIALIST_ATLAS',	0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);
-----------------------------------------------------------------------------------------------------
-- SpecialistFlavors
-----------------------------------------------------------------------------------------------------
INSERT INTO SpecialistFlavors 
		(SpecialistType, 			FlavorType, 			Flavor)
SELECT 	'SPECIALIST_JFD_MONK',		'FLAVOR_SCIENCE', 		5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);
		
INSERT INTO SpecialistFlavors 
		(SpecialistType, 			FlavorType, 			Flavor)
SELECT	'SPECIALIST_JFD_MONK',		'FLAVOR_RELIGION', 		20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);
-----------------------------------------------------------------------------------------------------
-- SpecialistYields
-----------------------------------------------------------------------------------------------------
INSERT INTO SpecialistYields 
		(SpecialistType, 			YieldType, 				Yield)
SELECT 	'SPECIALIST_JFD_MONK',		'YIELD_FAITH', 			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);
-----------------------------------------------------------------------------------------------------	
-- Trait_SpecialistYieldChanges
-----------------------------------------------------------------------------------------------------
INSERT INTO Trait_SpecialistYieldChanges 
		(TraitType,					SpecialistType, 		YieldType, 	Yield)
SELECT	TraitType,					'SPECIALIST_JFD_MONK',	YieldType, 	Yield
FROM Trait_SpecialistYieldChanges WHERE SpecialistType = 'SPECIALIST_MERCHANT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);
-----------------------------------------------------------------------------------------------------	
-- Building_SpecialistYieldChanges
-----------------------------------------------------------------------------------------------------
INSERT INTO Building_SpecialistYieldChanges 
		(BuildingType,				SpecialistType, 		YieldType, 	Yield)
SELECT	BuildingType,				'SPECIALIST_JFD_MONK',	YieldType, 	Yield
FROM Building_SpecialistYieldChanges WHERE SpecialistType = 'SPECIALIST_MERCHANT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);
-----------------------------------------------------------------------------------------------------	
-- Policy_SpecialistYieldChanges
-----------------------------------------------------------------------------------------------------
INSERT INTO Policy_SpecialistYieldChanges 
		(PolicyType,				SpecialistType, 		YieldType, 	Yield)
SELECT	PolicyType,					'SPECIALIST_JFD_MONK',	YieldType, 	Yield
FROM Policy_SpecialistYieldChanges WHERE SpecialistType = 'SPECIALIST_MERCHANT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================