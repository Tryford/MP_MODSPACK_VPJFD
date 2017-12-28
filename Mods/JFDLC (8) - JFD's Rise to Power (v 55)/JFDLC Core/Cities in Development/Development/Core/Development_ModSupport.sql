--==========================================================================================================================
-- GAZEBO COMMUNITY BALANCE OVERHAUL
--==========================================================================================================================
-- Buildings
------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings
SET NumPoliciesNeeded = 4
WHERE Type = 'BUILDING_JFD_EL_TAJIN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_WONDER_ADDITIONS_EL_TAJIN' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_COMMUNITY_BALANCE_PATCH ' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Improvement_Yields
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_Yields
		(ImprovementType, 						YieldType,					Yield)
SELECT	'IMPROVEMENT_CUSTOMS_HOUSE',			'YIELD_JFD_DEVELOPMENT',	20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1);

INSERT INTO Improvement_Yields
		(ImprovementType, 						YieldType,					Yield)
SELECT	'IMPROVEMENT_TRADING_POST',				'YIELD_JFD_DEVELOPMENT',	10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--==========================================================================================================================
-- JFD CITIES IN DEVELOPMENT
--==========================================================================================================================
-- BuildingClass_JFD_DevelopmentMods
------------------------------------------------------------------------------------------------------------------------
--ANCIENT
-- INSERT INTO BuildingClass_JFD_DevelopmentMods 
		-- (BuildingClassType, 							DevelopmentChange)
-- SELECT	Type,											1
-- FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_SHRINE', 'BUILDINGCLASS_MONUMENT', 'BUILDINGCLASS_CIRCUS')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO BuildingClass_JFD_DevelopmentMods 
		-- (BuildingClassType, 							DevelopmentChange)
-- SELECT	Type,											2
-- FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_HERBALIST', 'BUILDINGCLASS_LIBRARY', 'BUILDINGCLASS_WALLS')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO BuildingClass_JFD_DevelopmentMods 
		-- (BuildingClassType, 							DevelopmentChange)
-- SELECT	Type,											3
-- FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_WATERMILL', 'BUILDINGCLASS_GRANARY')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--CLASSICAL
-- INSERT INTO BuildingClass_JFD_DevelopmentMods 
		-- (BuildingClassType, 							DevelopmentChange)
-- SELECT	Type,											2
-- FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_CARAVANSARY', 'BUILDINGCLASS_STABLE', 'BUILDINGCLASS_BARRACKS', 'BUILDINGCLASS_AMPHITHEATER', 'BUILDINGCLASS_COLOSSEUM')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO BuildingClass_JFD_DevelopmentMods 
		-- (BuildingClassType, 							DevelopmentChange)
-- SELECT	Type,											3
-- FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_COURTHOUSE', 'BUILDINGCLASS_MINT', 'BUILDINGCLASS_JFD_JAIL', 'BUILDINGCLASS_STONE_WORKS', 'BUILDINGCLASS_JFD_MAGISTRATE_COURT', 'BUILDINGCLASS_LIGHTHOUSE', 'BUILDINGCLASS_TEMPLE')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO BuildingClass_JFD_DevelopmentMods 
		-- (BuildingClassType, 							DevelopmentChange)
-- SELECT	Type,											4
-- FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_MAGISTRATE_COURT', 'BUILDINGCLASS_MARKET', 'BUILDINGCLASS_NATIONAL_EPIC', 'BUILDINGCLASS_WRITERS_GUILD', 'BUILDINGCLASS_HEROIC_EPIC', 'BUILDINGCLASS_NATIONAL_COLLEGE')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO BuildingClass_JFD_DevelopmentMods 
		-- (BuildingClassType, 							DevelopmentChange)
-- SELECT	Type,											5
-- FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_CISTERN', 'BUILDINGCLASS_AQUEDUCT')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
--==========================================================================================================================
-- JFD RISE TO POWER
--==========================================================================================================================
--Buildings
-------------------------------------
UPDATE Buildings
SET PrereqTech = 'TECH_JFD_CODE_OF_LAWS'
WHERE Type = 'BUILDING_JFD_EL_TAJIN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS' AND Value = 1);
-- ==========================================================================================================================
--==========================================================================================================================