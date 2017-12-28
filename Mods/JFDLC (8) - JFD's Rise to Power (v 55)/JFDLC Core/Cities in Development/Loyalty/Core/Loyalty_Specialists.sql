--==========================================================================================================================	
-- SPECIALISTS
--==========================================================================================================================	
--Specialists
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Specialists
		(Type,							Description,							Strategy,										GreatPeopleTitle,							Visible, Cost,	SlotTexture,				IconAtlas,						 PortraitIndex)
SELECT	'SPECIALIST_JFD_ARISTOCRAT',	'TXT_KEY_SPECIALIST_JFD_ARISTOCRAT',	'TXT_KEY_SPECIALIST_JFD_ARISTOCRAT_STRATEGY',	'TXT_KEY_SPECIALIST_JFD_ARISTOCRAT_TITLE',	1,		 0,		'citizenAristocrat.dds',	'JFD_LOYALTY_SPECIALIST_ATLAS',	 0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_CID_LOYALTY_SPECIALIST_ADDITIONS_ARISTOCRAT' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- SpecialistFlavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO SpecialistFlavors 
		(SpecialistType, 				FlavorType,		Flavor)
SELECT	'SPECIALIST_JFD_ARISTOCRAT', 	Type,			2
FROM Flavors WHERE Type IN ('FLAVOR_HAPPINESS', 'FLAVOR_CITY_DEFENSE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_CID_LOYALTY_SPECIALIST_ADDITIONS_ARISTOCRAT' AND Value = 1);
-----------------------------------------------------------------------------------------------------
-- Trait_SpecialistYieldChanges
-----------------------------------------------------------------------------------------------------
INSERT INTO Trait_SpecialistYieldChanges 
		(TraitType,		SpecialistType, 				YieldType, 	Yield)
SELECT	TraitType,		'SPECIALIST_JFD_ARISTOCRAT',	YieldType, 	Yield
FROM Trait_SpecialistYieldChanges WHERE SpecialistType = 'SPECIALIST_SCIENTIST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_CID_LOYALTY_SPECIALIST_ADDITIONS_ARISTOCRAT' AND Value = 1);
-----------------------------------------------------------------------------------------------------
-- Building_SpecialistYieldChanges
-----------------------------------------------------------------------------------------------------
INSERT INTO Building_SpecialistYieldChanges 
		(BuildingType,	SpecialistType, 				YieldType, 	Yield)
SELECT	BuildingType,	'SPECIALIST_JFD_ARISTOCRAT',	YieldType, 	Yield
FROM Building_SpecialistYieldChanges WHERE SpecialistType = 'SPECIALIST_MERCHANT' AND BuildingType = 'BUILDING_STATUE_LIBERTY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type ='JFD_CID_LOYALTY_SPECIALIST_ADDITIONS_ARISTOCRAT' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================