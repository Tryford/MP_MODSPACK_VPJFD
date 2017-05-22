--==========================================================================================================================
-- Resources
--==========================================================================================================================
INSERT INTO Resources 
			(Type,						Description,						Civilopedia, 						Help,										ResourceClassType, 		AIStopTradingEra,	ResourceUsage, 	IconString, 			PortraitIndex, 	IconAtlas)
VALUES		('RESOURCE_MAGISTRATES',	'TXT_KEY_RESOURCE_MAGISTRATES',		'TXT_KEY_CIV5_MAGISTRATES_TEXT',	'TXT_KEY_RESOURCE_MAGISTRATES_HELP',		'RESOURCECLASS_RUSH',	'ERA_ANCIENT',		0,				'[ICON_MAGISTRATES]',	3, 				'CORE_DECISIONS_ATLAS');
--==========================================================================================================================		
-- CONCEPTS
--==========================================================================================================================
INSERT INTO Concepts	
		(Type, 								Topic,							Description,					Summary,						Advisor,	CivilopediaHeaderType)
VALUES	('CONCEPT_ED_EVENTS',				'TXT_KEY_TOPIC_SOCIALPOLICY',	'TXT_KEY_ED_EVENTS_TITLE',		'TXT_KEY_ED_EVENTS_BODY',		'ECONOMIC',	'HEADER_POLICIES'),
		('CONCEPT_ED_DECISIONS',			'TXT_KEY_TOPIC_SOCIALPOLICY',	'TXT_KEY_ED_DECISIONS_TITLE',	'TXT_KEY_ED_DECISIONS_BODY',	'ECONOMIC',	'HEADER_POLICIES');

INSERT OR REPLACE INTO Language_en_US (Tag, Text)
VALUES
	(
		'TXT_KEY_ED_EVENTS_TITLE',
		'Events'
	),
	(
		'TXT_KEY_ED_EVENTS_BODY',
		'[ICON_ED_EVENTS] Events may randomly occur throughout the course of play. There are a whole range of Events in the game, which can result in positive, negative and mixed outcomes for a player''s country. They take the form of a pop-up notification on the player''s screen, which may present a player with a choice, or may simply inform the player of the consequences and require they acknowledge the Event has occurred.'
	),
	(
		'TXT_KEY_ED_DECISIONS_TITLE',
		'Decisions'
	),
	(
		'TXT_KEY_ED_DECISIONS_BODY',
		'[ICON_ED_DECISIONS] Decisions are a set of choices a nation can make if certain conditions are met. Each Decision has consequences, which can be both positive and negative. A nation never has to take a Decision it is always at the players discretion whether to accept a Decision or not. Some Decisions are nation specific, some are religion specific and some are more generic.'
	);
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
			(Type) 
VALUES		('POLICY_TRADEMAGISTRATE');
--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 		 			DefaultBuilding, 							Description, 									MaxGlobalInstances, MaxPlayerInstances)
VALUES		('BUILDINGCLASS_DECISION_EFFECT', 				'BUILDING_DECISIONS_WEIGHTSFORMAL', 		'TXT_KEY_DECISIONS_WEIGHTSFORMAL',   			-1,					-1),
			('BUILDINGCLASS_DECISIONS_PUBLICTRANSPORT', 	'BUILDING_DECISIONS_PUBLICTRANSPORT', 		'TXT_KEY_DECISIONS_PUBLICTRANSPORT',    		-1,					-1),			
			('BUILDINGCLASS_DECISIONS_NATIONALCOURT', 		'BUILDING_DECISIONS_NATIONALCOURT', 		'TXT_KEY_DECISIONS_NATIONALCOURT',    			-1,					1),
			('BUILDINGCLASS_DECISIONS_CODEOFLAWS', 			'BUILDING_DECISIONS_CODEOFLAWS', 			'TXT_KEY_DECISIONS_CODEOFLAWS',    				-1,					1);
--==========================================================================================================================	
-- Buildings: Invisible
--==========================================================================================================================
INSERT INTO Buildings 	
			(Type, 						 					BuildingClass, 						Description,									GreatWorkCount, Cost, FaithCost, PrereqTech, 	NeverCapture)
VALUES		('BUILDING_DECISIONS_WEIGHTSFORMAL', 			'BUILDINGCLASS_DECISION_EFFECT',	'TXT_KEY_DECISIONS_WEIGHTSFORMAL',				-1, 			-1,   -1, 		 NULL,			1),
			('BUILDING_DECISIONS_UNIVERSITYGRANTS', 		'BUILDINGCLASS_DECISION_EFFECT',	'TXT_KEY_DECISIONS_UNIVERSITYGRANTS',			-1, 			-1,   -1, 		 NULL,			1),
			('BUILDING_DECISIONS_NATIONALISEUTILITIES', 	'BUILDINGCLASS_DECISION_EFFECT',	'TXT_KEY_DECISIONS_NATIONALISEUTILITIES',		-1, 			-1,   -1, 		 NULL,			1);
			
UPDATE Buildings
	SET FreeTechs = 1
	WHERE Type = 'BUILDING_DECISIONS_UNIVERSITYGRANTS';

UPDATE Buildings
	SET FreeBuildingThisCity = 'BUILDINGCLASS_FACTORY'
	WHERE Type = 'BUILDING_DECISIONS_NATIONALISEUTILITIES';
--==========================================================================================================================	
-- Buildings: Regular
--==========================================================================================================================
INSERT INTO Buildings 	
			(Type, 						 					BuildingClass, 								Description,									Civilopedia,												Help,													Strategy,										Cost, PrereqTech, 				NeverCapture,	IconAtlas, 				PortraitIndex)
VALUES		('BUILDING_DECISIONS_NATIONALCOURT', 			'BUILDINGCLASS_DECISIONS_NATIONALCOURT',	'TXT_KEY_DECISIONS_NATIONALCOURT',				'TXT_KEY_DECISIONS_NATIONALCOURT_CIVILOPEDIA',				'TXT_KEY_DECISIONS_NATIONALCOURT_HELP',					'TXT_KEY_DECISIONS_NATIONALCOURT_STRATEGY',		100,  'TECH_MATHEMATICS',		1,				'CORE_DECISIONS_ATLAS',	1),
			('BUILDING_DECISIONS_CODEOFLAWS', 				'BUILDINGCLASS_DECISIONS_CODEOFLAWS',		'TXT_KEY_DECISIONS_BUILDING_CODEOFLAWS',		'TXT_KEY_DECISIONS_BUILDING_CODEOFLAWS_CIVILOPEDIA',		'TXT_KEY_DECISIONS_BUILDING_CODEOFLAWS_HELP',			NULL,											-1,   NULL,						1,				'CORE_DECISIONS_ATLAS',	1),
			('BUILDING_DECISIONS_PUBLICTRANSPORT', 			'BUILDINGCLASS_DECISIONS_PUBLICTRANSPORT',	'TXT_KEY_DECISIONS_BUILDING_PUBLICTRANSPORT',	'TXT_KEY_DECISIONS_BUILDING_PUBLICTRANSPORT_CIVILOPEDIA',	'TXT_KEY_DECISIONS_BUILDING_PUBLICTRANSPORT_HELP',		NULL,											-1,   'TECH_STEAM_POWER',		0,				'CORE_DECISIONS_ATLAS',	4);

UPDATE Buildings
	SET Happiness = 4, GoldenAgeModifier = 25
	WHERE Type = 'BUILDING_DECISIONS_CODEOFLAWS';

UPDATE Buildings	
	SET HurryCostModifier = -1
	WHERE Type = 'BUILDING_DECISIONS_NATIONALCOURT';
	
UPDATE Buildings
	SET Help = 'TXT_KEY_BUILDING_PALACE_HELP_DECISIONS'
	WHERE Type = 'BUILDING_PALACE';
	
UPDATE Buildings
	SET ConquestProb = 100
	WHERE Type = 'BUILDING_DECISIONS_PUBLICTRANSPORT';
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================		
INSERT INTO Building_YieldChanges 	
			(BuildingType, 									YieldType, 				Yield)
VALUES		('BUILDING_DECISIONS_NATIONALCOURT', 			'YIELD_CULTURE', 		1),
			('BUILDING_DECISIONS_CODEOFLAWS', 				'YIELD_CULTURE', 		1);
--==========================================================================================================================	
-- Building_YieldModifiers
--==========================================================================================================================		
INSERT INTO Building_YieldModifiers 	
			(BuildingType, 									YieldType, 				Yield)
VALUES		('BUILDING_DECISIONS_WEIGHTSFORMAL', 			'YIELD_GOLD', 			25),
			('BUILDING_DECISIONS_PUBLICTRANSPORT', 			'YIELD_GOLD', 			15),
			('BUILDING_DECISIONS_PUBLICTRANSPORT', 			'YIELD_PRODUCTION', 	15);
--==========================================================================================================================	
-- Building_BuildingClassYieldChanges
--==========================================================================================================================		
INSERT INTO Building_BuildingClassYieldChanges 	
			(BuildingType, 									BuildingClassType,			YieldType, 				YieldChange)
VALUES		('BUILDING_DECISIONS_NATIONALISEUTILITIES', 	'BUILDINGCLASS_FACTORY',	'YIELD_PRODUCTION', 	1);
--==========================================================================================================================	
-- Building_ResourcePerEra
--==========================================================================================================================		
INSERT INTO Building_ResourcePerEra 	
			(BuildingType, 									ResourceType,			Quantity, 	InitialQuantity)
VALUES		('BUILDING_PALACE', 							'RESOURCE_MAGISTRATES',	0, 			2),
			('BUILDING_DECISIONS_NATIONALCOURT', 			'RESOURCE_MAGISTRATES',	1, 			3);
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================
INSERT INTO Building_Flavors 	
			(BuildingType, 									FlavorType, 				Flavor)
VALUES		('BUILDING_DECISIONS_NATIONALCOURT', 			'FLAVOR_GOLD', 				20),
			('BUILDING_DECISIONS_NATIONALCOURT', 			'FLAVOR_SCIENCE', 			20),
			('BUILDING_DECISIONS_NATIONALCOURT', 			'FLAVOR_CULTURE', 			20),
			('BUILDING_DECISIONS_NATIONALCOURT', 			'FLAVOR_GROWTH', 			20);
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================
INSERT INTO Civilization_BuildingClassOverrides 	
			(CivilizationType, 					BuildingClassType, 							BuildingType)
VALUES		('CIVILIZATION_BARBARIAN', 			'BUILDINGCLASS_DECISIONS_NATIONALCOURT', 	NULL),
			('CIVILIZATION_MINOR', 				'BUILDINGCLASS_DECISIONS_NATIONALCOURT', 	NULL);
--==========================================================================================================================
--==========================================================================================================================