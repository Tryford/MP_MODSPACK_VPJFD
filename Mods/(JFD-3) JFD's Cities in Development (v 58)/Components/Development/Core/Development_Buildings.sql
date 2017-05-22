--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Dummies
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings
		(Type,											BuildingClass,					Happiness,	WonderProductionModifier,	GreatWorkCount, Cost, 	FaithCost, 	ConquestProb,	Description, 												Help)
SELECT	'BUILDING_JFD_DEVELOPMENT_DEFICIT_CRIME',		'BUILDINGCLASS_JFD_CID',		0,			0,							-1,				-1,		-1,			100,			'TXT_KEY_BUILDING_JFD_DEVELOPMENT_DEFICIT_CRIME',			'TXT_KEY_BUILDING_JFD_DEVELOPMENT_DEFICIT_CRIME_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type,											BuildingClass,					Happiness,	WonderProductionModifier,	GreatWorkCount, Cost, 	FaithCost, 	ConquestProb,	Description, 												Help)
SELECT	'BUILDING_JFD_DEVELOPMENT_DEFICIT_DISEASE',		'BUILDINGCLASS_JFD_CID',		0,			0,							-1,				-1,		-1,			100,			'TXT_KEY_BUILDING_JFD_DEVELOPMENT_DEFICIT_DISEASE',			'TXT_KEY_BUILDING_JFD_DEVELOPMENT_DEFICIT_DISEASE_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type,											BuildingClass,					Happiness,	WonderProductionModifier,	GreatWorkCount, Cost, 	FaithCost, 	ConquestProb,	Description, 												Help)
SELECT	'BUILDING_JFD_DEVELOPMENT_DEFICIT_WONDERS',		'BUILDINGCLASS_JFD_CID',		0,			-1,							-1,				-1,		-1,			100,			'TXT_KEY_BUILDING_JFD_DEVELOPMENT_DEFICIT_WONDERS',			'TXT_KEY_BUILDING_JFD_DEVELOPMENT_DEFICIT_WONDERS_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE_WONDER_PENALTY' AND Value = 1);

INSERT INTO Buildings
		(Type,											BuildingClass,					Happiness,	BuildingProductionModifier,	GreatWorkCount, Cost, 	FaithCost, 	ConquestProb,	Description, 												Help)
SELECT	'BUILDING_JFD_DEVELOPMENT_SURPLUS_BUILDINGS',	'BUILDINGCLASS_JFD_CID',		0,			1,							-1,				-1,		-1,			100,			'TXT_KEY_BUILDING_JFD_DEVELOPMENT_SURPLUS_BUILDINGS',		'TXT_KEY_BUILDING_JFD_DEVELOPMENT_SURPLUS_BUILDINGS_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE_BUILDING_BONUS' AND Value = 1);

INSERT INTO Buildings
		(Type,											BuildingClass,					Happiness,	WonderProductionModifier,	GreatWorkCount, Cost, 	FaithCost, 	ConquestProb,	Description, 												Help)
SELECT	'BUILDING_JFD_DEVELOPMENT_SURPLUS_HAPPINESS',	'BUILDINGCLASS_JFD_CID',		1,			0,							-1,				-1,		-1,			100,			'TXT_KEY_BUILDING_JFD_DEVELOPMENT_SURPLUS_HAPPINESS',		'TXT_KEY_BUILDING_JFD_DEVELOPMENT_SURPLUS_HAPPINESS_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Buildings
		(Type,											BuildingClass,					Happiness,	WonderProductionModifier,	GreatWorkCount, Cost, 	FaithCost, 	ConquestProb,	Description, 												Help)
SELECT	'BUILDING_JFD_DEVELOPMENT_SURPLUS_HEALTH',		'BUILDINGCLASS_JFD_CID',		0,			0,							-1,				-1,		-1,			100,			'TXT_KEY_BUILDING_JFD_DEVELOPMENT_SURPLUS_HEALTH',			'TXT_KEY_BUILDING_JFD_DEVELOPMENT_SURPLUS_HEALTH_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges
		(BuildingType, 									YieldType,					Yield)
SELECT	'BUILDING_JFD_DEVELOPMENT_DEFICIT_CRIME',		'YIELD_JFD_CRIME',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges
		(BuildingType, 									YieldType,					Yield)
SELECT	'BUILDING_JFD_DEVELOPMENT_DEFICIT_DISEASE',		'YIELD_JFD_DISEASE',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges
		(BuildingType, 									YieldType,					Yield)
SELECT	'BUILDING_JFD_DEVELOPMENT_SURPLUS_HEALTH',		'YIELD_JFD_HEALTH',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 									YieldType,					Yield)
SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	5
FROM Buildings WHERE Type = 'BUILDING_JFD_ASSEMBLY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 									YieldType,					Yield)
SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	10
FROM Buildings WHERE Type = 'BUILDING_JFD_MANOR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 									YieldType,					Yield)
SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	10
FROM Buildings WHERE Type = 'BUILDING_JFD_GOVERNORS_MANSION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 									YieldType,					Yield)
SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	15
FROM Buildings WHERE Type = 'BUILDING_JFD_MANSION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 									YieldType,					Yield)
SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	15
FROM Buildings WHERE Type = 'BUILDING_PALACE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 									YieldType,					Yield)
SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	2
FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_ANCIENT')
AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1)
AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 									YieldType,					Yield)
SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	2
FROM Buildings WHERE PrereqTech IS NULL AND Cost > 0 AND GreatWorkCount > -1 AND IsDummy = 0
AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1)
AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 									YieldType,					Yield)
SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	4
FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_ANCIENT')
AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1)
AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 									YieldType,					Yield)
SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	3
FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_CLASSICAL')
AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1)
AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 									YieldType,					Yield)
SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	6
FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_CLASSICAL')
AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1)
AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 									YieldType,					Yield)
SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	4
FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MEDIEVAL')
AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1)
AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 									YieldType,					Yield)
SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	8
FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MEDIEVAL')
AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1)
AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 									YieldType,					Yield)
SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	4
FROM Buildings WHERE BuildingClass IN (SELECT BuildingClassType FROM Belief_BuildingClassFaithPurchase WHERE BeliefType IN (SELECT Type FROM Beliefs WHERE Follower = 1))
AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 									YieldType,					Yield)
SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	5
FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_RENAISSANCE')
AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1)
AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 									YieldType,					Yield)
SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	10
FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_RENAISSANCE')
AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1)
AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 									YieldType,					Yield)
SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	6
FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_ENLIGHTENMENT')
AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1)
AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 									YieldType,					Yield)
SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	12
FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_ENLIGHTENMENT')
AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1)
AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 									YieldType,					Yield)
SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	7
FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_INDUSTRIAL')
AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1)
AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 									YieldType,					Yield)
SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	14
FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_INDUSTRIAL')
AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1)
AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 									YieldType,					Yield)
SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	8
FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN')
AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1)
AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 									YieldType,					Yield)
SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	16
FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN')
AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1)
AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 									YieldType,					Yield)
SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	9
FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN')
AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1)
AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 									YieldType,					Yield)
SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	18
FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN')
AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1)
AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 									YieldType,					Yield)
SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	10
FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_POSTMODERN')
AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1)
AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 									YieldType,					Yield)
SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	20
FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_POSTMODERN')
AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1)
AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 									YieldType,					Yield)
SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	11
FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_FUTURE')
AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1)
AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Building_YieldChanges 
		(BuildingType, 									YieldType,					Yield)
SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	22
FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_FUTURE')
AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1)
AND NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

CREATE TRIGGER JFDCID_Development_Building_YieldChanges
AFTER INSERT ON Buildings 
WHEN NOT EXISTS (SELECT BuildingType FROM Building_YieldChanges WHERE BuildingType = NEW.Type AND YieldType = 'YIELD_JFD_DEVELOPMENT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
BEGIN
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	2
	FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_ANCIENT')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	2
	FROM Buildings WHERE Type = NEW.Type AND PrereqTech IS NULL AND Cost > 0 AND GreatWorkCount > -1 AND IsDummy = 0
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	4
	FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_ANCIENT')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	4
	FROM Buildings WHERE Type = NEW.Type AND PrereqTech IS NULL AND Cost > 0 AND GreatWorkCount > -1 AND IsDummy = 0
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	3
	FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_CLASSICAL')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	6
	FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_CLASSICAL')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	4
	FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MEDIEVAL')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	8
	FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MEDIEVAL')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	4
	FROM Buildings WHERE Type = NEW.Type AND BuildingClass IN (SELECT BuildingClassType FROM Belief_BuildingClassFaithPurchase WHERE BeliefType IN (SELECT Type FROM Beliefs WHERE Follower = 1));
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	5
	FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_RENAISSANCE')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	10
	FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_RENAISSANCE')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	6
	FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_ENLIGHTENMENT')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	12
	FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_ENLIGHTENMENT')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	7
	FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_INDUSTRIAL')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	14
	FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_INDUSTRIAL')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	8
	FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	16
	FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	9
	FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	18
	FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	10
	FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_POSTMODERN')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	20
	FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_POSTMODERN')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	11
	FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_FUTURE')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	22
	FROM Buildings WHERE Type = NEW.Type AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_FUTURE')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
END;

CREATE TRIGGER ChrisyIsAGenius 
AFTER INSERT ON Building_YieldChanges 
WHEN NEW.YieldType = 'YIELD_JFD_DEVELOPMENT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
BEGIN
	DELETE FROM Building_YieldChanges WHERE BuildingType = NEW.BuildingType AND YieldType = 'YIELD_JFD_DEVELOPMENT';
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	2
	FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_ANCIENT')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	2
	FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IS NULL AND Cost > 0 AND GreatWorkCount > -1 AND IsDummy = 0
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	4
	FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_ANCIENT')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	4
	FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IS NULL AND Cost > 0 AND GreatWorkCount > -1 AND IsDummy = 0
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	3
	FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_CLASSICAL')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	6
	FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_CLASSICAL')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	4
	FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MEDIEVAL')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	8
	FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MEDIEVAL')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	4
	FROM Buildings WHERE Type = NEW.BuildingType AND BuildingClass IN (SELECT BuildingClassType FROM Belief_BuildingClassFaithPurchase WHERE BeliefType IN (SELECT Type FROM Beliefs WHERE Follower = 1));
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	5
	FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_RENAISSANCE')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	10
	FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_RENAISSANCE')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	6
	FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_ENLIGHTENMENT')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	12
	FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_ENLIGHTENMENT')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	7
	FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_INDUSTRIAL')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	14
	FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_INDUSTRIAL')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	8
	FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	16
	FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	9
	FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	18
	FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	10
	FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_POSTMODERN')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	20
	FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_POSTMODERN')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	11
	FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_FUTURE')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = -1);
	
	INSERT INTO Building_YieldChanges 
			(BuildingType, 									YieldType,					Yield)
	SELECT	Type,											'YIELD_JFD_DEVELOPMENT',	22
	FROM Buildings WHERE Type = NEW.BuildingType AND PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_FUTURE')
	AND Quote IS NULL AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxPlayerInstances = 1);
END;
--==========================================================================================================================
--==========================================================================================================================