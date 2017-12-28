--==========================================================================================================================
-- BUILDING CLASSES
--==========================================================================================================================
-- BuildingClass_JFD_DevelopmentMods
------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClass_JFD_DevelopmentMods
        (BuildingClassType,     DevelopmentChange)
SELECT   a.BuildingClassType,   b.DevelopmentMultiplier
FROM BuildingClass_JFD_District a, JFD_Districts b
WHERE a.DistrictType = b.Type AND a.BuildingClassType IN (SELECT Type FROM BuildingClasses WHERE MaxGlobalInstances == -1) AND a.BuildingClassType IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances == -1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO BuildingClass_JFD_DevelopmentMods
        (BuildingClassType,     DevelopmentChange)
SELECT   a.BuildingClassType,   (b.DevelopmentMultiplier*2)
FROM BuildingClass_JFD_District a, JFD_Districts b
WHERE a.DistrictType = b.Type AND a.BuildingClassType IN (SELECT Type FROM BuildingClasses WHERE MaxGlobalInstances == -1) AND a.BuildingClassType IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances == 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
--------------------------------------------------------------------------------------------------------------------------
----------------------------------------
-- Wonders
----------------------------------------
INSERT INTO BuildingClasses 
		(Type, 									DefaultBuilding, 					Description, 									MaxGlobalInstances)
SELECT	'BUILDINGCLASS_JFD_EL_TAJIN',			'BUILDING_JFD_EL_TAJIN',			'TXT_KEY_BUILDING_JFD_EL_TAJIN', 				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_WONDER_ADDITIONS_EL_TAJIN' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides
		(BuildingClassType, 					CivilizationType, 		BuildingType)
SELECT	'BUILDINGCLASS_JFD_EL_TAJIN',			Type, 					NULL
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_WONDER_ADDITIONS_EL_TAJIN' AND Value = 1);
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================
-- Buildings
------------------------------------------------------------------------------------------------------------------------
----------------------------------------			
-- Wonders			
----------------------------------------		
INSERT INTO Buildings 													
		(Type, 								BuildingClass, 					Cost, 	PrereqTech, 			MaxStartEra, 	SpecialistType, 		GreatPeopleRateChange,	Description, 						Help, 								Civilopedia, 							Quote, 								 NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	ArtDefineTag,	IconAtlas, 							PortraitIndex, 	WonderSplashAudio,					WonderSplashImage, 		WonderSplashAnchor)
SELECT	'BUILDING_JFD_EL_TAJIN',			'BUILDINGCLASS_JFD_EL_TAJIN',	200,	'TECH_MATHEMATICS',		'ERA_MEDIEVAL', 'SPECIALIST_ENGINEER',	1,						'TXT_KEY_BUILDING_JFD_EL_TAJIN',	'TXT_KEY_WONDER_JFD_EL_TAJIN_HELP',	'TXT_KEY_WONDER_JFD_EL_TAJIN_PEDIA',	'TXT_KEY_WONDER_JFD_EL_TAJIN_QUOTE', 1,			-1,					-1,				100,			NULL,			'JFD_DEVELOPMENT_WONDER_ATLAS',		0,				'AS2D_WONDER_SPEECH_JFD_EL_TAJIN',	'Wonder_ElTajin.dds',	'L,B'	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_WONDER_ADDITIONS_EL_TAJIN' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_DevelopmentMods
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_JFD_DevelopmentMods
		(BuildingType,						DevelopmentThresholdMod,	IsGlobal)
SELECT	'BUILDING_JFD_EL_TAJIN',			-10,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_WONDER_ADDITIONS_EL_TAJIN' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_EL_TAJIN', 			'FLAVOR_WONDER',			35
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_WONDER_ADDITIONS_EL_TAJIN' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_EL_TAJIN', 			'FLAVOR_GROWTH',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_WONDER_ADDITIONS_EL_TAJIN' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_EL_TAJIN', 			'FLAVOR_PRODUCTION',		15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_WONDER_ADDITIONS_EL_TAJIN' AND Value = 1);

INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,					Flavor)
SELECT	'BUILDING_JFD_EL_TAJIN', 			'FLAVOR_CULTURE',			15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_WONDER_ADDITIONS_EL_TAJIN' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	Type,								'YIELD_JFD_DEVELOPMENT',	5
FROM Buildings WHERE Type = 'BUILDING_JFD_ASSEMBLY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_JFD_EL_TAJIN', 			'YIELD_FAITH',				2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_WONDER_ADDITIONS_EL_TAJIN' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_JFD_EL_TAJIN', 			'YIELD_CULTURE',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_WONDER_ADDITIONS_EL_TAJIN' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_JFD_EL_TAJIN', 			'YIELD_FOOD',				2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_WONDER_ADDITIONS_EL_TAJIN' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	'BUILDING_JFD_EL_TAJIN', 			'YIELD_GOLD',				2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_WONDER_ADDITIONS_EL_TAJIN' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	Type,								'YIELD_JFD_DEVELOPMENT',	10
FROM Buildings WHERE Type = 'BUILDING_JFD_GOVERNORS_MANSION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	Type,								'YIELD_JFD_DEVELOPMENT',	10
FROM Buildings WHERE Type = 'BUILDING_JFD_MANOR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	Type,								'YIELD_JFD_DEVELOPMENT',	15
FROM Buildings WHERE Type = 'BUILDING_JFD_MANSION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0);

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,					Yield)
SELECT	Type,								'YIELD_JFD_DEVELOPMENT',	15
FROM Buildings WHERE Type = 'BUILDING_PALACE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0);

-- INSERT INTO Building_YieldChanges 
		-- (BuildingType, 									YieldType,					Yield)
-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	2
-- FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_ANCIENT')
-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1)
-- AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0);

-- INSERT INTO Building_YieldChanges 
		-- (BuildingType, 									YieldType,					Yield)
-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	2
-- FROM Buildings WHERE PrereqTech IS NULL AND Cost > 0 AND GreatWorkCount > -1 AND IsDummy = 0
-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1)
-- AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0);

-- INSERT INTO Building_YieldChanges 
		-- (BuildingType, 									YieldType,					Yield)
-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	4
-- FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_ANCIENT')
-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1)
-- AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0);

-- INSERT INTO Building_YieldChanges 
		-- (BuildingType, 									YieldType,					Yield)
-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	3
-- FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_CLASSICAL')
-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1)
-- AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0);

-- INSERT INTO Building_YieldChanges 
		-- (BuildingType, 									YieldType,					Yield)
-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	6
-- FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_CLASSICAL')
-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1)
-- AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0);

-- INSERT INTO Building_YieldChanges 
		-- (BuildingType, 									YieldType,					Yield)
-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	4
-- FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MEDIEVAL')
-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1)
-- AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0);

-- INSERT INTO Building_YieldChanges 
		-- (BuildingType, 									YieldType,					Yield)
-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	8
-- FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MEDIEVAL')
-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1)
-- AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0);

-- INSERT INTO Building_YieldChanges 
		-- (BuildingType, 									YieldType,					Yield)
-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	4
-- FROM Buildings WHERE BuildingClass IN (SELECT BuildingClassType FROM Belief_BuildingClassFaithPurchase WHERE BeliefType IN (SELECT Type FROM Beliefs WHERE Follower = 1))
-- AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0);

-- INSERT INTO Building_YieldChanges 
		-- (BuildingType, 									YieldType,					Yield)
-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	5
-- FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_RENAISSANCE')
-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1)
-- AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0);

-- INSERT INTO Building_YieldChanges 
		-- (BuildingType, 									YieldType,					Yield)
-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	10
-- FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_RENAISSANCE')
-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1)
-- AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0);

-- INSERT INTO Building_YieldChanges 
		-- (BuildingType, 									YieldType,					Yield)
-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	6
-- FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_ENLIGHTENMENT')
-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1)
-- AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0);

-- INSERT INTO Building_YieldChanges 
		-- (BuildingType, 									YieldType,					Yield)
-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	12
-- FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_ENLIGHTENMENT')
-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1)
-- AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0);

-- INSERT INTO Building_YieldChanges 
		-- (BuildingType, 									YieldType,					Yield)
-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	7
-- FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_INDUSTRIAL')
-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1)
-- AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0);

-- INSERT INTO Building_YieldChanges 
		-- (BuildingType, 									YieldType,					Yield)
-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	14
-- FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_INDUSTRIAL')
-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1)
-- AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0);

-- INSERT INTO Building_YieldChanges 
		-- (BuildingType, 									YieldType,					Yield)
-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	8
-- FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN')
-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1)
-- AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0);

-- INSERT INTO Building_YieldChanges 
		-- (BuildingType, 									YieldType,					Yield)
-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	16
-- FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN')
-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1)
-- AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0);

-- INSERT INTO Building_YieldChanges 
		-- (BuildingType, 									YieldType,					Yield)
-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	9
-- FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN')
-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1)
-- AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0);

-- INSERT INTO Building_YieldChanges 
		-- (BuildingType, 									YieldType,					Yield)
-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	18
-- FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN')
-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1)
-- AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0);

-- INSERT INTO Building_YieldChanges 
		-- (BuildingType, 									YieldType,					Yield)
-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	10
-- FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_POSTMODERN')
-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1)
-- AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0);

-- INSERT INTO Building_YieldChanges 
		-- (BuildingType, 									YieldType,					Yield)
-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	20
-- FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_POSTMODERN')
-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1)
-- AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0);

-- INSERT INTO Building_YieldChanges 
		-- (BuildingType, 									YieldType,					Yield)
-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	11
-- FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_FUTURE')
-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1)
-- AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0);

-- INSERT INTO Building_YieldChanges 
		-- (BuildingType, 									YieldType,					Yield)
-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	22
-- FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_FUTURE')
-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1)
-- AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0);

-- CREATE TRIGGER JFDCID_Development_Building_YieldChanges
-- AFTER INSERT ON Buildings 
-- WHEN NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = NEW.Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0)
-- BEGIN
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	2
	-- FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_ANCIENT')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	2
	-- FROM Buildings WHERE Type = NEW.Type AND PrereqTech IS NULL AND Cost > 0 AND GreatWorkCount > -1 AND IsDummy = 0
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	4
	-- FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_ANCIENT')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	4
	-- FROM Buildings WHERE Type = NEW.Type AND PrereqTech IS NULL AND Cost > 0 AND GreatWorkCount > -1 AND IsDummy = 0
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	3
	-- FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_CLASSICAL')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	6
	-- FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_CLASSICAL')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	4
	-- FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MEDIEVAL')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	8
	-- FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MEDIEVAL')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	4
	-- FROM Buildings WHERE Type = NEW.Type AND BuildingClass IN (SELECT BuildingClassType FROM Belief_BuildingClassFaithPurchase WHERE BeliefType IN (SELECT Type FROM Beliefs WHERE Follower = 1));
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	5
	-- FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_RENAISSANCE')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	10
	-- FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_RENAISSANCE')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	6
	-- FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_ENLIGHTENMENT')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	12
	-- FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_ENLIGHTENMENT')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	7
	-- FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_INDUSTRIAL')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	14
	-- FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_INDUSTRIAL')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	8
	-- FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	16
	-- FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	9
	-- FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	18
	-- FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	10
	-- FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_POSTMODERN')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	20
	-- FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_POSTMODERN')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	11
	-- FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_FUTURE')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	22
	-- FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_FUTURE')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
-- END;

-- CREATE TRIGGER ChrisyIsAGenius 
-- AFTER INSERT ON Building_YieldChanges 
-- WHEN NEW.YieldType = 'YIELD_JFD_DEVELOPMENT'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
-- BEGIN
	-- DELETE FROM Building_YieldChanges WHERE BuildingType = NEW.BuildingType AND YieldType = 'YIELD_JFD_DEVELOPMENT';
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	2
	-- FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_ANCIENT')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	2
	-- FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IS NULL AND Cost > 0 AND GreatWorkCount > -1 AND IsDummy = 0
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	4
	-- FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_ANCIENT')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	4
	-- FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IS NULL AND Cost > 0 AND GreatWorkCount > -1 AND IsDummy = 0
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	3
	-- FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_CLASSICAL')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	6
	-- FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_CLASSICAL')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	4
	-- FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MEDIEVAL')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	8
	-- FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MEDIEVAL')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	4
	-- FROM Buildings WHERE Type = NEW.BuildingType AND BuildingClass IN (SELECT BuildingClassType FROM Belief_BuildingClassFaithPurchase WHERE BeliefType IN (SELECT Type FROM Beliefs WHERE Follower = 1));
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	5
	-- FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_RENAISSANCE')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	10
	-- FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_RENAISSANCE')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	6
	-- FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_ENLIGHTENMENT')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	12
	-- FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_ENLIGHTENMENT')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	7
	-- FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_INDUSTRIAL')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	14
	-- FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_INDUSTRIAL')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	8
	-- FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	16
	-- FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	9
	-- FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	18
	-- FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	10
	-- FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_POSTMODERN')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	20
	-- FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_POSTMODERN')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	11
	-- FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_FUTURE')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	-- INSERT INTO Building_YieldChanges 
			-- (BuildingType, 									YieldType,					Yield)
	-- SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	22
	-- FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_FUTURE')
	-- AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
-- END;
--==========================================================================================================================
--==========================================================================================================================