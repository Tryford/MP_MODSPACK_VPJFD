--==========================================================================================================================
-- TECHS
--==========================================================================================================================
-- Technologies
------------------------------------------------------------------------------------------------------------------------	
UPDATE Technologies SET Help = NULL WHERE Help IS NOT NULL 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Ancient
------------------
INSERT INTO Technologies 
		(Type, 						Cost, 	InternationalTradeRoutesChange,		AllowEmbassyTradingAllowed,		Description, 							Civilopedia,							Era,				Trade,	GoodyTech,	GridX,	GridY,	Quote,										PortraitIndex,	IconAtlas)
SELECT	'TECH_JFD_CIVILIZATION', 	10, 	0,									0,								'TXT_KEY_TECH_JFD_CIVILIZATION_TITLE',	'TXT_KEY_TECH_JFD_CIVILIZATION_DESC',	'ERA_ANCIENT',		1,		1,			0,		4,		'TXT_KEY_TECH_JFD_CIVILIZATION_QUOTE',		0,				'JFD_PROGRESS_TECH_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technologies 
		(Type, 						Cost, 	InternationalTradeRoutesChange,		AllowEmbassyTradingAllowed,		Description, 							Civilopedia,							Era,				Trade,	GoodyTech,	GridX,	GridY,	Quote,										PortraitIndex,	IconAtlas)
SELECT	'TECH_JFD_FISHING', 		15, 	0,									0,								'TXT_KEY_TECH_JFD_FISHING_TITLE',		'TXT_KEY_TECH_JFD_FISHING_DESC',		'ERA_ANCIENT',		1,		1,			1,		0,		'TXT_KEY_TECH_JFD_FISHING_QUOTE',			1,				'JFD_PROGRESS_TECH_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technologies 
		(Type, 						Cost, 	InternationalTradeRoutesChange,		AllowEmbassyTradingAllowed,		Description, 							Civilopedia,							Era,				Trade,	GoodyTech,	GridX,	GridY,	Quote,										PortraitIndex,	IconAtlas)
SELECT	'TECH_JFD_HUNTING', 		15, 	0,									0,								'TXT_KEY_TECH_JFD_HUNTING_TITLE',		'TXT_KEY_TECH_JFD_HUNTING_DESC',		'ERA_ANCIENT',		1,		1,			1,		6,		'TXT_KEY_TECH_JFD_HUNTING_QUOTE',			4,				'JFD_PROGRESS_TECH_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technologies 
		(Type, 						Cost, 	InternationalTradeRoutesChange,		AllowEmbassyTradingAllowed,		Description, 							Civilopedia,							Era,				Trade,	GoodyTech,	GridX,	GridY,	Quote,										PortraitIndex,	IconAtlas)
SELECT	'TECH_JFD_TRADE',			55, 	1,									0,								'TXT_KEY_TECH_JFD_TRADE_TITLE',			'TXT_KEY_TECH_JFD_TRADE_DESC',			'ERA_ANCIENT',		1,		1,			4,		5,		'TXT_KEY_TECH_JFD_TRADE_QUOTE',				2,				'JFD_PROGRESS_TECH_ATLAS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

UPDATE Technologies
SET GridX = 1, GridY = 3, Cost = 15
WHERE Type = 'TECH_AGRICULTURE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

UPDATE Technologies
SET GridX = 3, GridY = 7, Cost = 40
WHERE Type = 'TECH_ARCHERY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

UPDATE Technologies
SET GridX = 2, GridY = 5, InternationalTradeRoutesChange = 0, Cost = 30
WHERE Type = 'TECH_ANIMAL_HUSBANDRY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

UPDATE Technologies
SET GridX = 3, GridY = 9, Cost = 40
WHERE Type = 'TECH_BRONZE_WORKING'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

UPDATE Technologies
SET GridX = 4, GridY = 1, Cost = 55
WHERE Type = 'TECH_CALENDAR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

UPDATE Technologies
SET GridX = 4, GridY = 8, PortraitIndex = 15, Cost = 55
WHERE Type = 'TECH_MASONRY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

UPDATE Technologies
SET GridX = 2, GridY = 8, Cost = 30
WHERE Type = 'TECH_MINING'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

UPDATE Technologies
SET GridX = 3, GridY = 2, Cost = 40
WHERE Type = 'TECH_JFD_MYSTICISM'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

UPDATE Technologies
SET GridX = 2, GridY = 2, Cost = 30
WHERE Type = 'TECH_POTTERY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
 
UPDATE Technologies
SET GridX = 3, GridY = 0, Cost = 40, IconAtlas = 'JFD_PROGRESS_TECH_ATLAS', PortraitIndex = 7
WHERE Type = 'TECH_SAILING'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

UPDATE Technologies
SET GridX = 2, GridY = 6, Cost = 30
WHERE Type = 'TECH_TRAPPING'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

UPDATE Technologies
SET GridX = 3, GridY = 6, Cost = 40
WHERE Type = 'TECH_THE_WHEEL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

UPDATE Technologies
SET GridX = 4, GridY = 3, AllowEmbassyTradingAllowed = 1, Cost = 55
WHERE Type = 'TECH_WRITING'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Classical
------------------
-- INSERT INTO Technologies 
		-- (Type, 						Cost, 	InternationalTradeRoutesChange,		Description, 								Civilopedia,							Era,				Trade,	GoodyTech,	GridX,	GridY,	Quote,										PortraitIndex,	IconAtlas)
-- SELECT	'TECH_JFD_CIVIL_PLANNING',  625, 	0,									'TXT_KEY_TECH_JFD_CIVIL_PLANNING_TITLE',	'TXT_KEY_TECH_JFD_CIVIL_PLANNING_DESC',	'ERA_CLASSICAL',	1,		1,			5,		4,		'TXT_KEY_TECH_JFD_CIVIL_PLANNING_QUOTE',	5,				'JFD_PROGRESS_TECH_ATLAS'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technologies 
		-- (Type, 						Cost, 	InternationalTradeRoutesChange,		Description, 								Civilopedia,							Era,				Trade,	GoodyTech,	GridX,	GridY,	Quote,										PortraitIndex,	IconAtlas)
-- SELECT	'TECH_JFD_GAMES',			140, 	0,									'TXT_KEY_TECH_JFD_GAMES_TITLE',				'TXT_KEY_TECH_JFD_GAMES_DESC',			'ERA_CLASSICAL',	1,		1,			7,		7,		'TXT_KEY_TECH_JFD_GAMES_QUOTE',				12,				'JFD_PROGRESS_TECH_ATLAS'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technologies 
		-- (Type, 						Cost, 	InternationalTradeRoutesChange,		Description, 								Civilopedia,							Era,				Trade,	GoodyTech,	GridX,	GridY,	Quote,										PortraitIndex,	IconAtlas)
-- SELECT	'TECH_JFD_MILITARY', 		105, 	0,									'TXT_KEY_TECH_JFD_MILITARY_TITLE',			'TXT_KEY_TECH_JFD_MILITARY_DESC',		'ERA_CLASSICAL',	1,		1,			6,		9,		'TXT_KEY_TECH_JFD_MILITARY_QUOTE',			11,				'JFD_PROGRESS_TECH_ATLAS'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technologies 
		-- (Type, 						Cost, 	ExtraWorkBoatBuildCharges,			Description, 								Civilopedia,							Era,				Trade,	GoodyTech,	GridX,	GridY,	Quote,										PortraitIndex,	IconAtlas)
-- SELECT	'TECH_JFD_SHIPBUILDING',	140, 	1,									'TXT_KEY_TECH_JFD_SHIPBUILDING_TITLE',		'TXT_KEY_TECH_JFD_SHIPBUILDING_DESC',	'ERA_CLASSICAL',	1,		1,			7,		0,		'TXT_KEY_TECH_JFD_SHIPBUILDING_QUOTE',		8,				'JFD_PROGRESS_TECH_ATLAS'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 6, GridY = 3, Cost = 105
-- WHERE Type = 'TECH_JFD_CODE_OF_LAWS'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 6, GridY = 8, PortraitIndex = 6, Cost = 105
-- WHERE Type = 'TECH_CONSTRUCTION'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 8, GridY = 5, InternationalTradeRoutesChange = 1, Cost = 175
-- WHERE Type = 'TECH_CURRENCY'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 7, GridY = 3, Cost = 140
-- WHERE Type = 'TECH_DRAMA'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 6, GridY = 6, Cost = 105, Description = 'TXT_KEY_TECH_JFD_STIRRUPS_TITLE', Civilopedia = 'TXT_KEY_TECH_JFD_STIRRUPS_DESC'
-- WHERE Type = 'TECH_HORSEBACK_RIDING'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 8, GridY = 8, InternationalTradeRoutesChange = 0, Cost = 175
-- WHERE Type = 'TECH_ENGINEERING'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 7, GridY = 9, Cost = 140
-- WHERE Type = 'TECH_IRON_WORKING'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 7, GridY = 5, Cost = 140
-- WHERE Type = 'TECH_MATHEMATICS'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 8, GridY = 6, Cost = 175
-- WHERE Type = 'TECH_JFD_MERCENARIES'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET ExtraWorkBoatBuildCharges = 1
-- WHERE Type = 'TECH_OPTICS'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0);

-- UPDATE Technologies
-- SET GridX = 6, GridY = 0, Cost = 105, ExtraWorkBoatBuildCharges = 0
-- WHERE Type = 'TECH_OPTICS'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 8, GridY = 2, Cost = 175
-- WHERE Type = 'TECH_PHILOSOPHY'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 7, GridY = 2, Cost = 140
-- WHERE Type = 'TECH_JFD_PRIESTHOOD'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Medieval
------------------
-- INSERT INTO Technologies 
		-- (Type, 							Cost, 	InternationalTradeRoutesChange,		Description, 							Civilopedia,						Era,				Trade,	GoodyTech,	GridX,	GridY,	Quote,								PortraitIndex,	IconAtlas,					AudioIntro,		AudioIntroHeader)
-- SELECT	'TECH_JFD_ALCHEMY', 			380 , 	0,									'TXT_KEY_TECH_JFD_ALCHEMY_TITLE',		'TXT_KEY_TECH_JFD_ALCHEMY_DESC',	'ERA_MEDIEVAL',		1,		1,			11,		4,		'TXT_KEY_TECH_JFD_ALCHEMY_QUOTE',	18,				'JFD_PROGRESS_TECH_ATLAS',	NULL,			NULL
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technologies 
		-- (Type, 							Cost, 	InternationalTradeRoutesChange,		Description, 							Civilopedia,						Era,				Trade,	GoodyTech,	GridX,	GridY,	Quote,								PortraitIndex,	IconAtlas,					AudioIntro,		AudioIntroHeader)
-- SELECT	'TECH_JFD_MILLING', 			275 , 	0,									'TXT_KEY_TECH_JFD_MILLING_TITLE',		'TXT_KEY_TECH_JFD_MILLING_DESC',	'ERA_MEDIEVAL',		1,		1,			10,		8,		'TXT_KEY_TECH_JFD_MILLING_QUOTE',	14,				'JFD_PROGRESS_TECH_ATLAS',	NULL,			NULL
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 10, GridY = 5, Cost = 275, OpenBordersTradingAllowed = 0
-- WHERE Type = 'TECH_CIVIL_SERVICE'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 12, GridY = 5, Cost = 485 
-- WHERE Type = 'TECH_CHIVALRY'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 12, GridY = 1, InternationalTradeRoutesChange = 0, Cost = 485 
-- WHERE Type = 'TECH_COMPASS'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 12, GridY = 3, ResearchAgreementTradingAllowed = 0, Cost = 485 
-- WHERE Type = 'TECH_EDUCATION'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET OpenBordersTradingAllowed = 1, GridX = 11, GridY = 6, InternationalTradeRoutesChange = 0, Cost = 380 
-- WHERE Type = 'TECH_GUILDS'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 11, GridY = 7, Cost = 380, InternationalTradeRoutesChange = 1
-- WHERE Type = 'TECH_MACHINERY'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 10, GridY = 9, Cost = 275 
-- WHERE Type = 'TECH_METAL_CASTING'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 11, GridY = 1, Cost = 380 
-- WHERE Type = 'TECH_JFD_MEDICINE'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 9, GridY = 4, OpenBordersTradingAllowed = 0, VassalageTradingAllowed = 1, Cost = 2065 
-- WHERE Type = 'TECH_JFD_NOBILITY'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Eras SET VassalageEnabled = 0 WHERE Type = 'ERA_MEDIEVAL' 
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 12, GridY = 8, Cost = 485 
-- WHERE Type = 'TECH_PHYSICS'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 11, GridY = 2, Cost = 380 
-- WHERE Type = 'TECH_JFD_RELIGIOUS_ORDERS'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 12, GridY = 9, Cost = 485 
-- WHERE Type = 'TECH_STEEL'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 10, GridY = 2, Cost = 275 
-- WHERE Type = 'TECH_THEOLOGY'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Renaissance
------------------
-- INSERT INTO Technologies 
		-- (Type, 							InternationalTradeRoutesChange,		Cost, 	Description, 									Civilopedia,									Era,				Trade,	GoodyTech,	GridX,	GridY,	Quote,											PortraitIndex,	IconAtlas)
-- SELECT	'TECH_JFD_COLONIALISM',			1,									1150, 	'TXT_KEY_TECH_JFD_COLONIALISM_TITLE',			'TXT_KEY_TECH_JFD_COLONIALISM_DESC',			'ERA_RENAISSANCE',	1,		1,			16,		1,		'TXT_KEY_TECH_JFD_COLONIALISM_QUOTE',			13,				'JFD_PROGRESS_TECH_ATLAS'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);							
						
-- INSERT INTO Technologies 						
		-- (Type, 							ResearchAgreementTradingAllowed,	Cost, 	Description, 									Civilopedia,									Era,				Trade,	GoodyTech,	GridX,	GridY,	Quote,											PortraitIndex,	IconAtlas)
-- SELECT	'TECH_JFD_FINE_ARTS',			0,									780, 	'TXT_KEY_TECH_JFD_FINE_ARTS_TITLE',				'TXT_KEY_TECH_JFD_FINE_ARTS_DESC',				'ERA_RENAISSANCE',	1,		1,			14,		3,		'TXT_KEY_TECH_JFD_FINE_ARTS_QUOTE',				17,				'JFD_PROGRESS_TECH_ATLAS'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);				
						
-- INSERT INTO Technologies 						
		-- (Type, 							ResearchAgreementTradingAllowed,	Cost, 	Description, 									Civilopedia,									Era,				Trade,	GoodyTech,	GridX,	GridY,	Quote,											PortraitIndex,	IconAtlas)
-- SELECT	'TECH_JFD_PATRONAGE',			1,									5910, 	'TXT_KEY_TECH_JFD_PATRONAGE_TITLE',				'TXT_KEY_TECH_JFD_PATRONAGE_DESC',				'ERA_RENAISSANCE',	1,		1,			13,		4,		'TXT_KEY_TECH_JFD_PATRONAGE_QUOTE',				10,				'JFD_PROGRESS_TECH_ATLAS'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technologies 
		-- (Type, 							InternationalTradeRoutesChange,		Cost, 	Description, 									Civilopedia,									Era,				Trade,	GoodyTech,	GridX,	GridY,	Quote,											PortraitIndex,	IconAtlas)
-- SELECT	'TECH_JFD_POLITICAL_SCIENCE',	0,									1050, 	'TXT_KEY_TECH_JFD_POLITICAL_SCIENCE_TITLE',		'TXT_KEY_TECH_JFD_POLITICAL_SCIENCE_DESC',		'ERA_RENAISSANCE',	1,		1,			15,		6,		'TXT_KEY_TECH_JFD_POLITICAL_SCIENCE_QUOTE',		15,				'JFD_PROGRESS_TECH_ATLAS'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET  GridX = 14, GridY = 2, Cost = 780
-- WHERE Type = 'TECH_ACOUSTICS'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET  GridX = 16, GridY = 3, Cost = 1150
-- WHERE Type = 'TECH_ARCHITECTURE'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET  GridX = 15, GridY = 0, EmbarkedMoveChange = 0, Cost = 1050
-- WHERE Type = 'TECH_ASTRONOMY'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 14, GridY = 5, InternationalTradeRoutesChange = 0, Cost = 780
-- WHERE Type = 'TECH_BANKING'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET  GridX = 16, GridY = 8, Cost = 1150
-- WHERE Type = 'TECH_CHEMISTRY'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET  GridX = 14, GridY = 1, EmbarkedMoveChange = 1, Cost = 780
-- WHERE Type = 'TECH_EE_EXPLORATION'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET  GridX = 15, GridY = 8, Cost = 1050
-- WHERE Type = 'TECH_GUNPOWDER'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET  GridX = 16, GridY = 5, Cost = 1150
-- WHERE Type = 'TECH_JFD_JURISPRUDENCE'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET  GridX = 16, GridY = 7, Cost = 1150
-- WHERE Type = 'TECH_METALLURGY'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 14, GridY = 6, Cost = 780
-- WHERE Type = 'TECH_PRINTING_PRESS'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Enlightenment
------------------
-- INSERT INTO Technologies 
		-- (Type, 							Cost, 	ExtraWorkBoatBuildCharges,	Description, 									Civilopedia,								Era,					Trade,	GoodyTech,	GridX,	GridY,	Quote,										PortraitIndex,	IconAtlas)
-- SELECT	'TECH_JFD_NAVAL_ENGINEERING',	780, 	1,							'TXT_KEY_TECH_JFD_NAVAL_ENGINEERING_TITLE',		'TXT_KEY_TECH_JFD_NAVAL_ENGINEERING_DESC',	'ERA_ENLIGHTENMENT',	1,		1,			19,		0,		'TXT_KEY_TECH_JFD_NAVAL_ENGINEERING_QUOTE',	13,				'TECH_ATLAS_1'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);	

-- INSERT INTO Technologies 	
		-- (Type, 							Cost, 	Description, 									Civilopedia,								Era,					Trade,	GoodyTech,	GridX,	GridY,	Quote,										PortraitIndex,	IconAtlas)
-- SELECT	'TECH_JFD_RATIONALISM',			780, 	'TXT_KEY_TECH_JFD_RATIONALISM_TITLE',			'TXT_KEY_TECH_JFD_RATIONALISM_DESC',		'ERA_ENLIGHTENMENT',	1,		1,			18,		3,		'TXT_KEY_TECH_JFD_RATIONALISM_QUOTE',		14,				'JFD_PROGRESS_TECH_ATLAS'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);	

-- UPDATE Technologies
-- SET GridX = 18, GridY = 5, InternationalTradeRoutesChange = 0
-- WHERE Type = 'TECH_ECONOMICS'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 19, GridY = 6
-- WHERE Type = 'TECH_FERTILIZER'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 18, GridY = 8
-- WHERE Type = 'TECH_EE_FLINTLOCK'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 20, GridY = 7
-- WHERE Type = 'TECH_EE_FORTIFICATION'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 12, GridY = 4
-- WHERE Type = 'TECH_EE_HUMANISM'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 18, GridY = 3, Description = 'TXT_KEY_TECH_JFD_LIBERALISM_TITLE', Civilopedia = 'TXT_KEY_TECH_JFD_LIBERALISM_DESC', Quote ='TXT_KEY_TECH_JFD_LIBERALISM_QUOTE', IconAtlas = 'JFD_PROGRESS_TECH_ATLAS', PortraitIndex = 3, AudioIntro = NULL, AudioIntroHeader = NULL
-- WHERE Type = 'TECH_EE_HUMANISM'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_WONDER_ADDITIONS_DA_VINCI' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 18, GridY = 1, InternationalTradeRoutesChange = 1
-- WHERE Type = 'TECH_EE_IMPERIALISM'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 20, GridY = 5
-- WHERE Type = 'TECH_EE_MANUFACTURING'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 19, GridY = 2, MapTrading = 1
-- WHERE Type = 'TECH_EE_NATURAL_HISTORY'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET ExtraWorkBoatBuildCharges = 1
-- WHERE Type = 'TECH_NAVIGATION'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0);

-- UPDATE Technologies
-- SET GridX = 19, GridY = 1, InternationalTradeRoutesChange = 0, ExtraWorkBoatBuildCharges = 0
-- WHERE Type = 'TECH_NAVIGATION'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 20, GridY = 3
-- WHERE Type = 'TECH_SCIENTIFIC_THEORY'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 17, GridY = 4, Era = 'ERA_ENLIGHTENMENT'
-- WHERE Type = 'TECH_EE_SOVEREIGNTY'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 20, GridY = 0
-- WHERE Type = 'TECH_EE_WARSHIPS'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Industrial
------------------
-- UPDATE Technologies
-- SET GridX = 24, GridY = 2
-- WHERE Type = 'TECH_ARCHAEOLOGY'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 23, GridY = 0
-- WHERE Type = 'TECH_EE_ARMOUR_PLATING'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 23, GridY = 1
-- WHERE Type = 'TECH_BIOLOGY'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 23, GridY = 8
-- WHERE Type = 'TECH_DYNAMITE'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 24, GridY = 5
-- WHERE Type = 'TECH_ELECTRICITY'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 21, GridY = 4
-- WHERE Type = 'TECH_INDUSTRIALIZATION'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 24, GridY = 7
-- WHERE Type = 'TECH_MILITARY_SCIENCE'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 23, GridY = 3
-- WHERE Type = 'TECH_JFD_NATIONALISM'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 22, GridY = 6
-- WHERE Type = 'TECH_RIFLING'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 22, GridY = 2
-- WHERE Type = 'TECH_EE_ROMANTICISM'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 23, GridY = 5
-- WHERE Type = 'TECH_STEAM_POWER'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = GridX + 20
-- WHERE Era NOT IN ('ERA_ANCIENT', 'ERA_CLASSICAL', 'ERA_MEDIEVAL', 'ERA_RENAISSANCE', 'ERA_ENLIGHTENMENT', 'ERA_INDUSTRIAL', 'ERA_MODERN')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Modern
------------------
-- INSERT INTO Technologies 
		-- (Type, 						Cost, 	Description, 						Civilopedia,					 Era,			Trade,	GoodyTech,	GridX,	GridY,	Quote,								PortraitIndex,	IconAtlas,			AudioIntro,					AudioIntroHeader)
-- SELECT	'TECH_JFD_TELEGRAPH',		780, 	'TXT_KEY_TECH_TELEGRAPH_TITLE',  	'TXT_KEY_TECH_TELEGRAPH_DESC',   'ERA_MODERN',	1,		1,			24,		3,		'TXT_KEY_TECH_TELEGRAPH_QUOTE',		59,				'TECH_ATLAS_1',		'AS2D_TECH_TELEGRAPH',		'AS2D_HEADING_TECH_TELEGRAPH'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);		

-- UPDATE Technologies
-- SET GridX = 25, GridY = 0
-- WHERE Type = 'TECH_BALLISTICS'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);			

-- UPDATE Technologies
-- SET GridX = 25, GridY = 1
-- WHERE Type = 'TECH_COMBUSTION'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);		

-- UPDATE Technologies
-- SET GridX = 27, GridY = 2
-- WHERE Type = 'TECH_ELECTRONICS'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);			

-- UPDATE Technologies
-- SET GridX = 25, GridY = 3
-- WHERE Type = 'TECH_FLIGHT'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);			

-- UPDATE Technologies
-- SET GridX = 27, GridY = 4
-- WHERE Type = 'TECH_PLASTIC'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);	

-- UPDATE Technologies
-- SET GridX = 25, GridY = 5
-- WHERE Type = 'TECH_RADIO'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 26, GridY = 4
-- WHERE Type = 'TECH_RAILROAD'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 26, GridY = 1
-- WHERE Type = 'TECH_REFRIGERATION'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technologies
-- SET GridX = 25, GridY = 4
-- WHERE Type = 'TECH_REPLACEABLE_PARTS'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Atomic
------------------
-- INSERT INTO Technologies 
		-- (Type, 						Cost, 	Description, 						Civilopedia,					 Era,				Trade,	GoodyTech,	GridX,	GridY,	Quote,								PortraitIndex,	IconAtlas,			AudioIntro,					AudioIntroHeader)
-- SELECT	'TECH_JFD_MASS_MEDIA',		780, 	'TXT_KEY_TECH_MASS_MEDIA_TITLE',  	'TXT_KEY_TECH_MASS_MEDIA_DESC',  'ERA_POSTMODERN',	1,		1,			29,		3,		'TXT_KEY_TECH_MASS_MEDIA_QUOTE',	59,				'TECH_ATLAS_1',		'AS2D_TECH_MASS_MEDIA',		'AS2D_HEADING_TECH_MASS_MEDIA'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);	

-- UPDATE Technologies
-- SET GridX = 28, GridY = 4
-- WHERE Type = 'TECH_ATOMIC_THEORY'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------		
-- Technology_PrereqTechs
------------------------------------------------------------------------------------------------------------------------	
DELETE FROM Technology_PrereqTechs WHERE TechType IN (SELECT Type FROM Technologies WHERE Era = 'ERA_ANCIENT') 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
-- DELETE FROM Technology_PrereqTechs WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Ancient
------------------
INSERT INTO Technology_PrereqTechs
		(TechType,						PrereqTech)
SELECT	'TECH_AGRICULTURE',				'TECH_JFD_CIVILIZATION'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technology_PrereqTechs
		(TechType,						PrereqTech)
SELECT	'TECH_ARCHERY',					'TECH_JFD_HUNTING'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technology_PrereqTechs
		(TechType,						PrereqTech)
SELECT	'TECH_ANIMAL_HUSBANDRY',		'TECH_AGRICULTURE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technology_PrereqTechs
		(TechType,						PrereqTech)
SELECT	'TECH_ANIMAL_HUSBANDRY',		'TECH_JFD_HUNTING'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technology_PrereqTechs
		(TechType,						PrereqTech)
SELECT	'TECH_BRONZE_WORKING',			'TECH_MINING'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technology_PrereqTechs
		(TechType,						PrereqTech)
SELECT	'TECH_CALENDAR',				'TECH_POTTERY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technology_PrereqTechs
		(TechType,						PrereqTech)
SELECT	'TECH_JFD_FISHING',				'TECH_JFD_CIVILIZATION'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technology_PrereqTechs
		(TechType,						PrereqTech)
SELECT	'TECH_JFD_HUNTING',				'TECH_JFD_CIVILIZATION'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technology_PrereqTechs
		(TechType,						PrereqTech)
SELECT	'TECH_JFD_MYSTICISM',			'TECH_POTTERY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technology_PrereqTechs
		(TechType,						PrereqTech)
SELECT	'TECH_MASONRY',					'TECH_MINING'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technology_PrereqTechs
		(TechType,						PrereqTech)
SELECT	'TECH_MINING',					'TECH_JFD_CIVILIZATION'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technology_PrereqTechs
		(TechType,						PrereqTech)
SELECT	'TECH_POTTERY',					'TECH_AGRICULTURE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technology_PrereqTechs
		(TechType,						PrereqTech)
SELECT	'TECH_SAILING',					'TECH_JFD_FISHING'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technology_PrereqTechs
		(TechType,						PrereqTech)
SELECT	'TECH_TRAPPING',				'TECH_JFD_HUNTING'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technology_PrereqTechs
		(TechType,						PrereqTech)
SELECT	'TECH_JFD_TRADE',				'TECH_ANIMAL_HUSBANDRY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technology_PrereqTechs
		(TechType,						PrereqTech)
SELECT	'TECH_THE_WHEEL',				'TECH_ANIMAL_HUSBANDRY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technology_PrereqTechs
		(TechType,						PrereqTech)
SELECT	'TECH_WRITING',					'TECH_POTTERY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Classical
------------------
-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_JFD_CIVIL_PLANNING',		'TECH_JFD_TRADE'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_JFD_CIVIL_PLANNING',		'TECH_WRITING'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_JFD_CODE_OF_LAWS',		'TECH_JFD_CIVIL_PLANNING'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_CONSTRUCTION',			'TECH_JFD_CIVIL_PLANNING'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_CURRENCY',				'TECH_MATHEMATICS'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_DRAMA',					'TECH_JFD_CODE_OF_LAWS'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_ENGINEERING',				'TECH_CONSTRUCTION'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_IRON_WORKING',			'TECH_CONSTRUCTION'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_MATHEMATICS',				'TECH_JFD_CIVIL_PLANNING'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_JFD_MERCENARIES',			'TECH_MATHEMATICS'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_JFD_MILITARY',			'TECH_JFD_CIVIL_PLANNING'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_OPTICS',					'TECH_JFD_CIVIL_PLANNING'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_PHILOSOPHY',				'TECH_JFD_PRIESTHOOD'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_JFD_PRIESTHOOD',			'TECH_JFD_CIVIL_PLANNING'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_JFD_GAMES',				'TECH_CONSTRUCTION'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_JFD_GAMES',				'TECH_HORSEBACK_RIDING'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_JFD_SHIPBUILDING',		'TECH_OPTICS'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_HORSEBACK_RIDING',		'TECH_JFD_CIVIL_PLANNING'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Medieval
------------------
-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_JFD_ALCHEMY',				'TECH_THEOLOGY'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_CHIVALRY',				'TECH_CIVIL_SERVICE'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_CHIVALRY',				'TECH_GUILDS'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_CIVIL_SERVICE',			'TECH_JFD_NOBILITY'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_COMPASS',					'TECH_JFD_MEDICINE'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_EDUCATION',				'TECH_THEOLOGY'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_GUILDS',					'TECH_JFD_NOBILITY'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_MACHINERY',				'TECH_JFD_MILLING'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_JFD_MEDICINE',			'TECH_THEOLOGY'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_METAL_CASTING',			'TECH_JFD_NOBILITY'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_JFD_MILLING',				'TECH_JFD_NOBILITY'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_JFD_NOBILITY',			'TECH_CURRENCY'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_JFD_NOBILITY',			'TECH_JFD_CODE_OF_LAWS'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_PHYSICS',					'TECH_JFD_MILLING'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_JFD_RELIGIOUS_ORDERS',	'TECH_THEOLOGY'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_STEEL',					'TECH_METAL_CASTING'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_THEOLOGY',				'TECH_JFD_NOBILITY'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Renaissance
------------------
-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_ACOUSTICS',				'TECH_JFD_PATRONAGE'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_ARCHITECTURE',			'TECH_JFD_FINE_ARTS'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_ASTRONOMY',				'TECH_EE_EXPLORATION'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_BANKING',					'TECH_JFD_PATRONAGE'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_CHEMISTRY',				'TECH_GUNPOWDER'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_JFD_COLONIALISM',			'TECH_EE_EXPLORATION'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_EE_EXPLORATION',			'TECH_JFD_PATRONAGE'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_JFD_FINE_ARTS',			'TECH_JFD_PATRONAGE'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_GUNPOWDER',				'TECH_JFD_PATRONAGE'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_JFD_JURISPRUDENCE',		'TECH_BANKING'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_METALLURGY',				'TECH_GUNPOWDER'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_JFD_PATRONAGE',			'TECH_CHIVALRY'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_JFD_PATRONAGE',			'TECH_EDUCATION'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_JFD_POLITICAL_SCIENCE',	'TECH_PRINTING_PRESS'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_PRINTING_PRESS',			'TECH_JFD_PATRONAGE'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Enlightenment
------------------
-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_ECONOMICS',				'TECH_EE_SOVEREIGNTY'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_FERTILIZER',				'TECH_ECONOMICS'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_FERTILIZER',				'TECH_EE_FLINTLOCK'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_EE_FLINTLOCK',			'TECH_EE_SOVEREIGNTY'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_EE_FORTIFICATION',		'TECH_ECONOMICS'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_EE_FORTIFICATION',		'TECH_EE_FLINTLOCK'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_EE_HUMANISM',				'TECH_EE_SOVEREIGNTY'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_EE_IMPERIALISM',			'TECH_EE_SOVEREIGNTY'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_EE_MANUFACTURING',		'TECH_ECONOMICS'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_EE_NATURAL_HISTORY',		'TECH_EE_IMPERIALISM'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_NAVIGATION',				'TECH_EE_IMPERIALISM'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_JFD_NAVAL_ENGINEERING',	'TECH_EE_IMPERIALISM'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_JFD_RATIONALISM',			'TECH_EE_SOVEREIGNTY'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_SCIENTIFIC_THEORY',		'TECH_EE_HUMANISM'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_EE_SOVEREIGNTY',			'TECH_ARCHITECTURE'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_EE_SOVEREIGNTY',			'TECH_JFD_JURISPRUDENCE'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_EE_WARSHIPS',				'TECH_JFD_NAVAL_ENGINEERING'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Industrial
------------------
-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_ARCHAEOLOGY',				'TECH_EE_ROMANTICISM'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_EE_ARMOUR_PLATING',		'TECH_INDUSTRIALIZATION'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_BIOLOGY',					'TECH_INDUSTRIALIZATION'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_DYNAMITE',				'TECH_INDUSTRIALIZATION'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_ELECTRICITY',				'TECH_INDUSTRIALIZATION'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_INDUSTRIALIZATION',		'TECH_EE_MANUFACTURING'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_INDUSTRIALIZATION',		'TECH_SCIENTIFIC_THEORY'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_MILITARY_SCIENCE',		'TECH_DYNAMITE'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_MILITARY_SCIENCE',		'TECH_RIFLING'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_JFD_NATIONALISM',			'TECH_EE_ROMANTICISM'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_RIFLING',					'TECH_INDUSTRIALIZATION'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_EE_ROMANTICISM',			'TECH_INDUSTRIALIZATION'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_STEAM_POWER',				'TECH_INDUSTRIALIZATION'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Modern
------------------
-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_REPLACEABLE_PARTS',		'TECH_JFD_NATIONALISM'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_REPLACEABLE_PARTS',		'TECH_ELECTRICITY'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Atomic
------------------
-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_ATOMIC_THEORY',			'TECH_ELECTRONICS'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_PrereqTechs
		-- (TechType,						PrereqTech)
-- SELECT	'TECH_ATOMIC_THEORY',			'TECH_PLASTIC'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------		
-- C15_TechCosts
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS C15_TechCosts (TechType TEXT NOT NULL PRIMARY KEY, Cost INTEGER, FOREIGN KEY (TechType) REFERENCES Technologies(Type));

INSERT INTO C15_TechCosts 
      (TechType, Cost) 
SELECT a.Type, (CASE WHEN 
                (SELECT PrereqTech FROM Technology_PrereqTechs WHERE TechType = a.Type LIMIT 1) NOT NULL 
                THEN (SELECT SUM(Cost) FROM Technologies WHERE Type IN (SELECT PrereqTech FROM Technology_PrereqTechs WHERE TechType = a.Type)) 
                ELSE 0 END)
FROM Technologies a;

UPDATE Technologies
SET Cost = (SELECT Cost FROM C15_TechCosts WHERE TechType = Type) AND Era = 'ERA_ANCIENT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

DROP TABLE C15_TechCosts;
------------------------------------------------------------------------------------------------------------------------		
-- Technology_Flavors
------------------------------------------------------------------------------------------------------------------------	
------------------
-- Ancient
------------------
INSERT INTO Technology_Flavors
		(TechType,						FlavorType,							Flavor)
SELECT	'TECH_AGRICULTURE',				Type,								5
FROM Flavors WHERE Type IN ('FLAVOR_TILE_IMPROVEMENT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technology_Flavors
		(TechType,						FlavorType,							Flavor)
SELECT	'TECH_JFD_CIVILIZATION',		Type,								5
FROM Flavors WHERE Type IN ('FLAVOR_MILITARY_TRAINING', 'FLAVOR_CULTURE', 'FLAVOR_WONDER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technology_Flavors
		(TechType,						FlavorType,							Flavor)
SELECT	'TECH_JFD_FISHING',				Type,								4
FROM Flavors WHERE Type IN ('FLAVOR_NAVAL_TILE_IMPROVEMENT', 'FLAVOR_GROWTH')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technology_Flavors
		(TechType,						FlavorType,							Flavor)
SELECT	'TECH_JFD_FISHING',				Type,								2
FROM Flavors WHERE Type IN ('FLAVOR_GOLD', 'FLAVOR_HAPPINESS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technology_Flavors
		(TechType,						FlavorType,							Flavor)
SELECT	'TECH_JFD_HUNTING',				Type,								4
FROM Flavors WHERE Type IN ('FLAVOR_RECON', 'FLAVOR_RANGED')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technology_Flavors
		(TechType,						FlavorType,							Flavor)
SELECT	'TECH_JFD_HUNTING',				Type,								1
FROM Flavors WHERE Type IN ('FLAVOR_OFFENSE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technology_Flavors
		(TechType,						FlavorType,							Flavor)
SELECT	'TECH_MINING',					Type,								1
FROM Flavors WHERE Type IN ('FLAVOR_WONDER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
DELETE FROM Technology_Flavors WHERE TechType = 'TECH_JFD_MYSTICISM'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
INSERT INTO Technology_Flavors
		(TechType,						FlavorType,							Flavor)
SELECT	'TECH_JFD_MYSTICISM',			Type,								6
FROM Flavors WHERE Type IN ('FLAVOR_RELIGION', 'FLAVOR_WONDER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technology_Flavors
		(TechType,						FlavorType,							Flavor)
SELECT	'TECH_JFD_MYSTICISM',			Type,								3
FROM Flavors WHERE Type IN ('FLAVOR_CULTURE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

DELETE FROM Technology_Flavors WHERE TechType = 'TECH_SAILING' AND FlavorType IN ('FLAVOR_HAPPINESS', 'FLAVOR_WONDER', 'FLAVOR_NAVAL_TILE_IMPROVEMENT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technology_Flavors
		(TechType,						FlavorType,							Flavor)
SELECT	'TECH_JFD_TRADE',				Type,								6
FROM Flavors WHERE Type IN ('FLAVOR_GOLD')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO Technology_Flavors
		(TechType,						FlavorType,							Flavor)
SELECT	'TECH_THE_WHEEL',				Type,								2
FROM Flavors WHERE Type IN ('FLAVOR_CULTURE', 'FLAVOR_WONDER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Classical
------------------
-- INSERT INTO Technology_Flavors
		-- (TechType,						FlavorType,							Flavor)
-- SELECT	'TECH_JFD_CIVIL_PLANNING',		Type,								5
-- FROM Flavors WHERE Type IN ('FLAVOR_OFFENSE', 'FLAVOR_GROWTH', 'FLAVOR_CITY_DEFENSE', 'FLAVOR_SCIENCE')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- DELETE FROM Technology_Flavors WHERE TechType = 'TECH_CONSTRUCTION' AND FlavorType = 'FLAVOR_HAPPINESS'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_Flavors
		-- (TechType,						FlavorType,							Flavor)
-- SELECT	'TECH_JFD_GAMES',				Type,								20
-- FROM Flavors WHERE Type IN ('FLAVOR_HAPPINESS')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_Flavors
		-- (TechType,						FlavorType,							Flavor)
-- SELECT	'TECH_JFD_GAMES',				Type,								2
-- FROM Flavors WHERE Type IN ('FLAVOR_WONDER')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_Flavors
		-- (TechType,						FlavorType,							Flavor)
-- SELECT	'TECH_MATHEMATICS',				Type,								4
-- FROM Flavors WHERE Type IN ('FLAVOR_GROWTH')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_Flavors
		-- (TechType,						FlavorType,							Flavor)
-- SELECT	'TECH_JFD_MERCENARIES',			Type,								2
-- FROM Flavors WHERE Type IN ('FLAVOR_GREAT_PEOPLE')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_Flavors
		-- (TechType,						FlavorType,							Flavor)
-- SELECT	'TECH_JFD_MILITARY',			Type,								4
-- FROM Flavors WHERE Type IN ('FLAVOR_OFFENSE', 'FLAVOR_MILITARY_TRAINING')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_Flavors
		-- (TechType,						FlavorType,							Flavor)
-- SELECT	'TECH_JFD_MILITARY',			Type,								1
-- FROM Flavors WHERE Type IN ('FLAVOR_WONDER')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technology_Flavors
-- SET Flavor = 4
-- WHERE TechType = 'TECH_PHILOSOPHY' AND FlavorType = 'FLAVOR_RELIGION'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_Flavors
		-- (TechType,						FlavorType,							Flavor)
-- SELECT	'TECH_JFD_SHIPBUILDING',		Type,								7
-- FROM Flavors WHERE Type IN ('FLAVOR_NAVAL', 'FLAVOR_NAVAL_RECON')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_Flavors
		-- (TechType,						FlavorType,							Flavor)
-- SELECT	'TECH_JFD_SHIPBUILDING',		Type,								5
-- FROM Flavors WHERE Type IN ('FLAVOR_GOLD', 'FLAVOR_WONDER')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Medieval
------------------
-- DELETE FROM Technology_Flavors WHERE TechType = 'TECH_CIVIL_SERVICE' AND FlavorType = 'FLAVOR_SCIENCE'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technology_Flavors SET Flavor = 5 WHERE TechType = 'TECH_CIVIL_SERVICE' AND FlavorType = 'FLAVOR_GROWTH'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_Flavors
		-- (TechType,						FlavorType,							Flavor)
-- SELECT	'TECH_JFD_ALCHEMY',				Type,								3
-- FROM Flavors WHERE Type IN ('FLAVOR_PRODUCTION', 'FLAVOR_GREAT_PEOPLE')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_Flavors
		-- (TechType,						FlavorType,							Flavor)
-- SELECT	'TECH_JFD_ALCHEMY',				Type,								1
-- FROM Flavors WHERE Type IN ('FLAVOR_WONDER')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_Flavors
		-- (TechType,						FlavorType,							Flavor)
-- SELECT	'TECH_CIVIL_SERVICE',			Type,								2
-- FROM Flavors WHERE Type IN ('FLAVOR_MILITARY_TRAINING', 'FLAVOR_GREAT_PEOPLE')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Technology_Flavors SET FlavorType = 'FLAVOR_HAPPINESS' WHERE TechType = 'TECH_GUILDS' AND FlavorType = 'FLAVOR_GOLD'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_Flavors
		-- (TechType,						FlavorType,							Flavor)
-- SELECT	'TECH_GUILDS',					Type,								5
-- FROM Flavors WHERE Type IN ('FLAVOR_GROWTH')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_Flavors
		-- (TechType,						FlavorType,							Flavor)
-- SELECT	'TECH_MACHINERY',				Type,								10
-- FROM Flavors WHERE Type IN ('FLAVOR_GOLD')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_Flavors
		-- (TechType,						FlavorType,							Flavor)
-- SELECT	'TECH_JFD_MILLING',				Type,								5
-- FROM Flavors WHERE Type IN ('FLAVOR_GROWTH')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_Flavors
		-- (TechType,						FlavorType,							Flavor)
-- SELECT	'TECH_JFD_MILLING',				Type,								2
-- FROM Flavors WHERE Type IN ('FLAVOR_RELIGION')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_Flavors
		-- (TechType,						FlavorType,							Flavor)
-- SELECT	'TECH_JFD_MILLING',				Type,								20
-- FROM Flavors WHERE Type IN ('FLAVOR_GROWTH')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_Flavors
		-- (TechType,						FlavorType,							Flavor)
-- SELECT	'TECH_JFD_MILLING',				Type,								10
-- FROM Flavors WHERE Type IN ('FLAVOR_SCIENCE')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_Flavors
		-- (TechType,						FlavorType,							Flavor)
-- SELECT	'TECH_JFD_MILLING',				Type,								5
-- FROM Flavors WHERE Type IN ('FLAVOR_PRODUCTION')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_Flavors
		-- (TechType,						FlavorType,							Flavor)
-- SELECT	'TECH_JFD_NOBILITY',			Type,								5
-- FROM Flavors WHERE Type IN ('FLAVOR_SCIENCE')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Renaissance
------------------
-- INSERT INTO Technology_Flavors
		-- (TechType,						FlavorType,							Flavor)
-- SELECT	'TECH_JFD_COLONIALISM',			Type,								10
-- FROM Flavors WHERE Type IN ('FLAVOR_GOLD', 'FLAVOR_EXPANSION')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_Flavors
		-- (TechType,						FlavorType,							Flavor)
-- SELECT	'TECH_JFD_FINE_ARTS',			Type,								8
-- FROM Flavors WHERE Type IN ('FLAVOR_CULTURE')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_Flavors
		-- (TechType,						FlavorType,							Flavor)
-- SELECT	'TECH_JFD_FINE_ARTS',			Type,								4
-- FROM Flavors WHERE Type IN ('FLAVOR_WONDER', 'FLAVOR_GREAT_PEOPLE')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- DELETE FROM Technology_Flavors WHERE TechType = 'TECH_JFD_JURISPRUDENCE' AND FlavorType = 'FLAVOR_ESPIONAGE'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_Flavors
		-- (TechType,						FlavorType,							Flavor)
-- SELECT	'TECH_JFD_PATRONAGE',			Type,								5
-- FROM Flavors WHERE Type IN ('FLAVOR_SCIENCE', 'FLAVOR_CULTURE')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_Flavors
		-- (TechType,						FlavorType,							Flavor)
-- SELECT	'TECH_JFD_PATRONAGE',			Type,								4
-- FROM Flavors WHERE Type IN ('FLAVOR_WONDER', 'FLAVOR_DIPLOMACY')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_Flavors
		-- (TechType,						FlavorType,							Flavor)
-- SELECT	'TECH_JFD_POLITICAL_SCIENCE',	Type,								10
-- FROM Flavors WHERE Type IN ('FLAVOR_GREAT_PEOPLE', 'FLAVOR_ESPIONAGE')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Enlightenment
------------------
-- INSERT INTO Technology_Flavors
		-- (TechType,						FlavorType,							Flavor)
-- SELECT	'TECH_EE_IMPERIALISM',			Type,								10
-- FROM Flavors WHERE Type IN ('FLAVOR_GOLD')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_Flavors
		-- (TechType,						FlavorType,							Flavor)
-- SELECT	'TECH_JFD_NAVAL_ENGINEERING',	Type,								5
-- FROM Flavors WHERE Type IN ('FLAVOR_NAVAL', 'FLAVOR_GOLD', 'FLAVOR_PRODUCTION')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_Flavors
		-- (TechType,						FlavorType,							Flavor)
-- SELECT	'TECH_EE_SOVEREIGNTY',			Type,								5
-- FROM Flavors WHERE Type IN ('FLAVOR_SCIENCE', 'FLAVOR_WONDER')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_Flavors
		-- (TechType,						FlavorType,							Flavor)
-- SELECT	'TECH_EE_SOVEREIGNTY',			Type,								10
-- FROM Flavors WHERE Type IN ('FLAVOR_DIPLOMACY')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Technology_Flavors
		-- (TechType,						FlavorType,							Flavor)
-- SELECT	'TECH_EE_WARSHIPS',				Type,								2
-- FROM Flavors WHERE Type IN ('FLAVOR_GREAT_PEOPLE')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
--==========================================================================================================================
-- AI
--==========================================================================================================================
-- AIEconomicStrategies
------------------------------------------------------------------------------------------------------------------------
UPDATE AIEconomicStrategies
SET TechPrereq = 'TECH_SAILING'
WHERE Type = 'ECONOMICAISTRATEGY_EXPAND_TO_OTHER_CONTINENTS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
--==========================================================================================================================	
-- BUILDS
--==========================================================================================================================	
-- Builds
------------------------------	
------------------
-- Ancient
------------------
--Fishing
UPDATE Builds
SET PrereqTech = 'TECH_JFD_FISHING'
WHERE Type IN ('BUILD_FISHING_BOATS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Trade
UPDATE Builds
SET PrereqTech = 'TECH_JFD_TRADE'
WHERE Type IN ('BUILD_TRADING_POST')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Classical
------------------
--Civil Planning
-- UPDATE Builds
-- SET PrereqTech = 'TECH_MASONRY'
-- WHERE Type IN ('BUILD_REMOVE_MARSH')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE BuildFeatures
-- SET PrereqTech = 'TECH_MASONRY'
-- WHERE FeatureType IN ('BUILD_REMOVE_MARSH')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Iron Working
-- UPDATE Builds
-- SET PrereqTech = 'TECH_IRON_WORKING'
-- WHERE Type IN ('BUILD_LUMBERMILL')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Buildings
------------------------------------------------------------------------------------------------------------------------
------------------
-- Ancient
------------------
--Bronze Working
UPDATE Buildings
SET PrereqTech = 'TECH_BRONZE_WORKING'
WHERE BuildingClass IN ('BUILDINGCLASS_MAUSOLEUM_HALICARNASSUS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Civilization
UPDATE Buildings
SET PrereqTech = 'TECH_JFD_CIVILIZATION'
WHERE BuildingClass IN ('BUILDINGCLASS_MONUMENT', 'BUILDINGCLASS_JFD_GOBEKLI') AND PrereqTech IS NULL
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Calendar
UPDATE Buildings
SET PrereqTech = 'TECH_CALENDAR'
WHERE BuildingClass IN ('BUILDINGCLASS_HANGING_GARDEN', 'BUILDINGCLASS_JFD_SOLOMONS_TEMPLE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- Masonry
-- UPDATE Buildings
-- SET PrereqTech = 'TECH_MASONRY'
-- WHERE BuildingClass IN ('BUILDINGCLASS_STONE_WORKS') AND PrereqTech = 'TECH_CALENDAR'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Mysticism
UPDATE Buildings
SET PrereqTech = 'TECH_JFD_MYSTICISM'
WHERE BuildingClass IN ('BUILDINGCLASS_ORACLE') 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Trade
--UPDATE Buildings
--SET PrereqTech = 'TECH_JFD_TRADE'
--WHERE BuildingClass IN ('BUILDINGCLASS_CARAVANSARY') AND PrereqTech = 'TECH_HORSEBACK_RIDING'
--AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Writing
UPDATE Buildings
SET PrereqTech = 'TECH_WRITING'
WHERE BuildingClass IN ('BUILDINGCLASS_JFD_JAIL') AND PrereqTech = 'TECH_THE_WHEEL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Classical
------------------
--Civil Planning
-- UPDATE Buildings
-- SET PrereqTech = 'TECH_JFD_CIVIL_PLANNING'
-- WHERE BuildingClass IN ('BUILDINGCLASS_COURTHOUSE') AND PrereqTech = 'TECH_MATHEMATICS'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Buildings
-- SET PrereqTech = 'TECH_JFD_CIVIL_PLANNING'
-- WHERE BuildingClass IN ('BUILDINGCLASS_STONE_WORKS') AND PrereqTech = 'TECH_CALENDAR'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
	
-- UPDATE Buildings
-- SET PrereqTech = 'TECH_JFD_CIVIL_PLANNING'
-- WHERE BuildingClass IN ('BUILDINGCLASS_JFD_JAIL', 'BUILDINGCLASS_JFD_EL_TAJIN')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Construction
-- UPDATE Buildings
-- SET PrereqTech = 'TECH_CONSTRUCTION'
-- WHERE BuildingClass IN ('BUILDINGCLASS_PETRA', 'BUILDINGCLASS_MAUSOLEUM_HALICARNASSUS')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Mathematics
-- UPDATE Buildings
-- SET PrereqTech = 'TECH_MATHEMATICS'
-- WHERE BuildingClass IN ('BUILDINGCLASS_JFD_PANTHEON')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Military Training
-- UPDATE Buildings
-- SET PrereqTech = 'TECH_JFD_MILITARY'
-- WHERE BuildingClass IN ('BUILDINGCLASS_STATUE_ZEUS', 'BUILDINGCLASS_BARRACKS') AND PrereqTech = 'TECH_BRONZE_WORKING'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Philosophy
-- UPDATE Buildings
-- SET PrereqTech = 'TECH_PHILOSOPHY'
-- WHERE BuildingClass IN ('BUILDINGCLASS_JFD_BUDDHAS_BAMIYAN')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Priesthood
-- UPDATE Buildings
-- SET PrereqTech = 'TECH_JFD_PRIESTHOOD'
-- WHERE BuildingClass IN ('BUILDINGCLASS_HAGIA_SOPHIA')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Public Games
-- UPDATE Buildings
-- SET PrereqTech = 'TECH_JFD_GAMES'
-- WHERE BuildingClass IN ('BUILDINGCLASS_COLOSSEUM') AND PrereqTech = 'TECH_CONSTRUCTION'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Buildings
-- SET PrereqTech = 'TECH_JFD_GAMES'
-- WHERE BuildingClass IN ('BUILDINGCLASS_WONDER_COLOSSEUM', 'BUILDINGCLASS_CIRCUS_MAXIMUS')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Shipbuilding
-- UPDATE Buildings
-- SET PrereqTech = 'TECH_JFD_SHIPBUILDING'
-- WHERE BuildingClass IN ('BUILDINGCLASS_COLOSSUS') 
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Medieval
------------------
--Alchemy
-- UPDATE Buildings
-- SET PrereqTech = 'TECH_JFD_ALCHEMY'
-- WHERE BuildingClass IN ('BUILDINGCLASS_GARDEN') AND PrereqTech IN ('TECH_THEOLOGY', 'TECH_PHILOSOPHY')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Buildings
-- SET PrereqTech = 'TECH_JFD_ALCHEMY'
-- WHERE BuildingClass IN ('BUILDINGCLASS_ALHAMBRA')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Guilds
-- UPDATE Buildings
-- SET PrereqTech = 'TECH_GUILDS'
-- WHERE BuildingClass IN ('BUILDINGCLASS_EE_TAVERN')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Metal Casting
-- UPDATE Buildings
-- SET PrereqTech = 'TECH_METAL_CASTING'
-- WHERE BuildingClass IN ('BUILDINGCLASS_MACHU_PICHU')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Milling
-- UPDATE Buildings
-- SET PrereqTech = 'TECH_JFD_MILLING'
-- WHERE BuildingClass IN ('BUILDINGCLASS_WINDMILL') AND PrereqTech = 'TECH_ECONOMICS'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Buildings
-- SET PrereqTech = 'TECH_JFD_MILLING'
-- WHERE BuildingClass IN ('BUILDINGCLASS_JFD_HORSE_MILL', 'BUILDINGCLASS_CHICHEN_ITZA')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Steel
-- UPDATE Buildings
-- SET PrereqTech = 'TECH_STEEL'
-- WHERE BuildingClass IN ('BUILDINGCLASS_IRONWORKS')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Renaissance
------------------
--Architecture
-- UPDATE Buildings
-- SET PrereqTech = 'TECH_ARCHITECTURE'
-- WHERE BuildingClass IN ('BUILDINGCLASS_FORBIDDEN_PALACE', 'BUILDINGCLASS_SISTINE_CHAPEL')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Fine Arts
-- UPDATE Buildings
-- SET PrereqTech = 'TECH_JFD_FINE_ARTS'
-- WHERE BuildingClass IN ('BUILDINGCLASS_EE_GALLERY') AND PrereqTech = 'TECH_ARCHITECTURE'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Buildings
-- SET PrereqTech = 'TECH_JFD_FINE_ARTS'
-- WHERE BuildingClass IN ('BUILDINGCLASS_UFFIZI', 'BUILDINGCLASS_JFD_VERSAILLES')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Patronage
-- UPDATE Buildings
-- SET PrereqTech = 'TECH_JFD_PATRONAGE'
-- WHERE BuildingClass IN ('BUILDINGCLASS_JFD_HOFBURG_PALACE', 'BUILDINGCLASS_ARTISTS_GUILD')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Political Science
-- UPDATE Buildings
-- SET PrereqTech = 'TECH_JFD_POLITICAL_SCIENCE'
-- WHERE BuildingClass IN ('BUILDINGCLASS_CONSTABLE') AND PrereqTech IN ('TECH_BANKING', 'TECH_JFD_JURISPRUDENCE')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Buildings
-- SET PrereqTech = 'TECH_JFD_POLITICAL_SCIENCE'
-- WHERE BuildingClass IN ('BUILDINGCLASS_LEANING_TOWER', 'BUILDINGCLASS_EE_SUMMER_PALACE')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Enlightenment
------------------
--Economics
-- UPDATE Buildings
-- SET PrereqTech = 'TECH_ECONOMICS'
-- WHERE BuildingClass IN ('BUILDINGCLASS_JFD_EAST_INDIA_COMPANY')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Flintlock
-- UPDATE Buildings
-- SET PrereqTech = 'TECH_EE_FLINTLOCK'
-- WHERE BuildingClass IN ('BUILDINGCLASS_JFD_HAWA')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Naval Engineering
-- UPDATE Buildings
-- SET PrereqTech = 'TECH_JFD_NAVAL_ENGINEERING'
-- WHERE BuildingClass IN ('BUILDINGCLASS_SEAPORT') AND PrereqTech IN ('TECH_NAVIGATION')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Buildings
-- SET PrereqTech = 'TECH_JFD_NAVAL_ENGINEERING'
-- WHERE BuildingClass IN ('BUILDINGCLASS_EE_KRONBORG')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Navigation
-- UPDATE Buildings
-- SET PrereqTech = 'TECH_NAVIGATION'
-- WHERE BuildingClass IN ('BUILDINGCLASS_EE_TORRE')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Rationalism
-- UPDATE Buildings
-- SET PrereqTech = 'TECH_JFD_RATIONALISM'
-- WHERE BuildingClass IN ('BUILDINGCLASS_EE_WAT_PHRA_KAEW', 'BUILDINGCLASS_EE_ACADEMY')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Sovereignty
-- UPDATE Buildings
-- SET PrereqTech = 'TECH_EE_SOVEREIGNTY'
-- WHERE BuildingClass IN ('BUILDINGCLASS_FORBIDDEN_PALACE')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Enlightenment
------------------
-- UPDATE Buildings
-- SET PrereqTech = 'TECH_EE_ROMANTICISM'
-- WHERE BuildingClass IN ('BUILDINGCLASS_JFD_PENA_PALACE')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Atomic
------------------
--Mass Media
-- UPDATE Buildings
-- SET PrereqTech = 'TECH_JFD_MASS_MEDIA'
-- WHERE BuildingClass IN ('BUILDINGCLASS_JFD_HOLLYWOOD', 'BUILDINGCLASS_JFD_CINEMA', 'BUILDINGCLASS_JFD_DIRECTORS_GUILD')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--JFDPIT_Progress_Techs
CREATE TRIGGER JFDPIT_Progress_Techs
AFTER INSERT ON Buildings 
WHEN NEW.BuildingClass IN ('BUILDINGCLASS_EE_TAVERN', 'BUILDINGCLASS_MONUMENT', 'BUILDINGCLASS_CARAVANSARY', 'BUILDINGCLASS_COURTHOUSE', 'BUILDINGCLASS_COLOSSEUM', 'BUILDINGCLASS_WINDMILL', 'BUILDINGCLASS_EE_GALLERY', 'BUILDINGCLASS_CONSTABLE') 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1)
BEGIN
------------------
-- Ancient
------------------
	--Civilization
	UPDATE Buildings
	SET PrereqTech = 'TECH_JFD_CIVILIZATION'
	WHERE Type = NEW.Type AND NEW.BuildingClass IN ('BUILDINGCLASS_MONUMENT') AND NEW.PrereqTech IS NULL;
	
	--Masonry
	-- UPDATE Buildings
	-- SET PrereqTech = 'TECH_MASONRY'
	-- WHERE Type = NEW.Type AND NEW.BuildingClass IN ('BUILDINGCLASS_STONE_WORKS') AND NEW.PrereqTech = 'TECH_CALENDAR';
	
	-- Trade
	UPDATE Buildings
	SET PrereqTech = 'TECH_JFD_TRADE'
	WHERE Type = NEW.Type AND NEW.BuildingClass IN ('BUILDINGCLASS_CARAVANSARY') AND NEW.PrereqTech = 'TECH_HORSEBACK_RIDING';

	--Writing
	UPDATE Buildings
	SET PrereqTech = 'TECH_WRITING'
	WHERE Type = NEW.Type AND NEW.BuildingClass IN ('BUILDINGCLASS_JFD_JAIL') AND NEW.PrereqTech = 'TECH_THE_WHEEL';
------------------
-- Classical
------------------
	--Civil Planning
	-- UPDATE Buildings
	-- SET PrereqTech = 'TECH_JFD_CIVIL_PLANNING'
	-- WHERE Type = NEW.Type AND NEW.BuildingClass IN ('BUILDINGCLASS_COURTHOUSE') AND NEW.PrereqTech = 'TECH_MATHEMATICS';
	
	-- UPDATE Buildings
	-- SET PrereqTech = 'TECH_JFD_CIVIL_PLANNING'
	-- WHERE Type = NEW.Type AND NEW.BuildingClass IN ('BUILDINGCLASS_STONE_WORKS') AND NEW.PrereqTech = 'TECH_CALENDAR';
	
	--Military Training
	-- UPDATE Buildings
	-- SET PrereqTech = 'TECH_JFD_MILITARY'
	-- WHERE Type = NEW.Type AND NEW.BuildingClass IN ('BUILDINGCLASS_BARRACKS') AND NEW.PrereqTech = 'TECH_BRONZE_WORKING';
	
	--Public Games
	-- UPDATE Buildings
	-- SET PrereqTech = 'TECH_JFD_GAMES'
	-- WHERE Type = NEW.Type AND NEW.BuildingClass IN ('BUILDINGCLASS_COLOSSEUM') AND NEW.PrereqTech = 'TECH_CONSTRUCTION';
------------------
-- Medieval
------------------
	--Alchemy
	-- UPDATE Buildings
	-- SET PrereqTech = 'TECH_JFD_ALCHEMY'
	-- WHERE Type = NEW.Type AND NEW.BuildingClass IN ('BUILDINGCLASS_GARDEN') AND NEW.PrereqTech IN ('TECH_THEOLOGY', 'TECH_PHILOSOPHY');
	
	--Guilds
	-- UPDATE Buildings
	-- SET PrereqTech = 'TECH_GUILDS'
	-- WHERE Type = NEW.Type AND NEW.BuildingClass IN ('BUILDINGCLASS_EE_TAVERN') AND NEW.PrereqTech = 'TECH_MACHINERY';
	
	--Milling
	-- UPDATE Buildings
	-- SET PrereqTech = 'TECH_JFD_MILLING'
	-- WHERE Type = NEW.Type AND NEW.BuildingClass IN ('BUILDINGCLASS_WINDMILL') AND NEW.PrereqTech = 'TECH_ECONOMICS';
------------------
-- Renaissance
------------------
	--Fine Arts
	-- UPDATE Buildings
	-- SET PrereqTech = 'TECH_JFD_FINE_ARTS'
	-- WHERE Type = NEW.Type AND NEW.BuildingClass IN ('BUILDINGCLASS_EE_GALLERY') AND NEW.PrereqTech = 'TECH_ARCHITECTURE';
	
	--Political Science
	-- UPDATE Buildings
	-- SET PrereqTech = 'TECH_JFD_POLITICAL_SCIENCE'
	-- WHERE Type = NEW.Type AND NEW.BuildingClass IN ('BUILDINGCLASS_CONSTABLE') AND NEW.PrereqTech IN ('TECH_BANKING', 'TECH_JFD_JURISPRUDENCE');
------------------
-- Enlightenment
------------------
	--Naval Engineering
	-- UPDATE Buildings
	-- SET PrereqTech = 'TECH_JFD_NAVAL_ENGINEERING'
	-- WHERE Type = NEW.Type AND NEW.BuildingClass IN ('BUILDINGCLASS_SEAPORT') AND NEW.PrereqTech IN ('TECH_NAVIGATION');
END;
--==========================================================================================================================
-- HANDICAPS
--==========================================================================================================================
-- HandicapInfo_AIFreeTechs
------------------------------------------------------------------------------------------------------------------------
UPDATE HandicapInfo_AIFreeTechs
SET TechType = 'TECH_JFD_FISHING'
WHERE HandicapType = 'HANDICAP_DEITY' AND TechType = 'TECH_THE_WHEEL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

UPDATE HandicapInfo_AIFreeTechs
SET TechType = 'TECH_JFD_HUNTING'
WHERE TechType = 'TECH_ARCHERY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

INSERT INTO HandicapInfo_AIFreeTechs
		(HandicapType,		TechType)
SELECT	Type,				'TECH_AGRICULTURE'
FROM HandicapInfos WHERE Type IN ('HANDICAP_IMMORTAL', 'HANDICAP_DEITY', 'HANDICAP_EMPEROR', 'HANDICAP_KING')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
--==========================================================================================================================	
-- IMPROVEMENTS
--==========================================================================================================================	
-- Improvement_TechFreshWaterYieldChanges
------------------------------------------------------------------------------------------------------------------------	
-- UPDATE Improvement_TechFreshWaterYieldChanges SET TechType = 'TECH_JFD_MILLING' WHERE TechType = 'TECH_CIVIL_SERVICE'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------		
-- Improvement_TechFreshWaterYieldChanges
------------------------------------------------------------------------------------------------------------------------	
-- UPDATE Technology_TradeRouteDomainExtraRange SET TechType = 'TECH_JFD_MEDICINE' WHERE TechType = 'TECH_COMPASS'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Improvement_TechYieldChanges SET TechType = 'TECH_PRINTING_PRESS' WHERE TechType = 'TECH_ACOUSTICS' AND ImprovementType = 'IMPROVEMENT_FAIRGROUNDS'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- CREATE TRIGGER JFDPIT_Progress_Improvement_TechFreshWaterYieldChanges
-- AFTER INSERT ON Improvement_TechYieldChanges 
-- WHEN NEW.ImprovementType IN ('IMPROVEMENT_FAIRGROUNDS')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1)
-- BEGIN
	-- UPDATE Improvement_TechYieldChanges SET TechType = 'TECH_PRINTING_PRESS' WHERE TechType = 'TECH_ACOUSTICS' AND ImprovementType = 'IMPROVEMENT_FAIRGROUNDS';
-- END;
------------------------------------------------------------------------------------------------------------------------		
-- Improvement_TechYieldChanges
------------------------------------------------------------------------------------------------------------------------	
-- UPDATE Improvement_TechYieldChanges SET TechType = 'TECH_JFD_COLONIALISM' WHERE TechType = 'TECH_COMPASS' AND ImprovementType = 'IMPROVEMENT_FISHING_BOATS'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- UPDATE Improvement_TechYieldChanges SET Yield = 1 WHERE TechType = 'TECH_SCIENTIFIC_THEORY' AND ImprovementType = 'IMPROVEMENT_ACADEMY'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Improvement_TechYieldChanges
		-- (ImprovementType,				TechType,			YieldType,			Yield)
-- SELECT	 'IMPROVEMENT_ACADEMY',			'TECH_ASTRONOMY',	'YIELD_SCIENCE',	1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

-- INSERT INTO Improvement_TechYieldChanges
		-- (ImprovementType,				TechType,			YieldType,			Yield)
-- SELECT	'IMPROVEMENT_CUSTOMS_HOUSE',	'TECH_BANKING',		'YIELD_GOLD',		1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
--==========================================================================================================================
-- PROCESSES
--==========================================================================================================================
-- Processes
--------------------------------------------------------------------------------------------------------------------------
------------------
-- Ancient
------------------
------------------
-- Classical
------------------
--Military Training
-- UPDATE Processes
-- SET TechPrereq = 'TECH_JFD_MILITARY'
-- WHERE Type IN ('PROCESS_JFD_GENERAL')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Public Games
-- UPDATE Processes
-- SET TechPrereq = 'TECH_JFD_GAMES'
-- WHERE Type IN ('PROCESS_JFD_GAP')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Shipbuilding
-- UPDATE Processes
-- SET TechPrereq = 'TECH_JFD_SHIPBUILDING'
-- WHERE Type IN ('PROCESS_JFD_ADMIRAL')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Medieval
------------------
--Chivalry
-- UPDATE Processes
-- SET TechPrereq = 'TECH_CHIVALRY'
-- WHERE Type IN ('PROCESS_JFD_DEFENSE')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Renaissance
------------------
--Patronage
-- UPDATE Processes
-- SET TechPrereq = 'TECH_JFD_PATRONAGE'
-- WHERE Type IN ('PROCESS_JFD_CULTURE')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Industrial
------------------
--Nationalism
-- UPDATE Processes
-- SET TechPrereq = 'TECH_JFD_NATIONALISM'
-- WHERE Type IN ('PROCESS_JFD_TOURISM')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
--==========================================================================================================================
-- RESOURCES
--==========================================================================================================================
-- Resources
--------------------------------------------------------------------------------------------------------------------------
------------------
-- Medieval
------------------
--Alchemy
-- UPDATE Resources
-- SET TechReveal = 'TECH_JFD_ALCHEMY', TechCityTrade = 'TECH_JFD_ALCHEMY'
-- WHERE Type IN ('RESOURCE_JFD_SULFUR')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
--==========================================================================================================================
-- TECHS
--==========================================================================================================================
-- Technologies_JFD_FreeUnitTypes
--------------------------------------------------------------------------------------------------------------------------	
-- INSERT INTO Technologies_JFD_FreeUnitTypes
		-- (TechType,						UnitClassType,							IsFirst)
-- SELECT	'TECH_JFD_FINE_ARTS',			'UNITCLASS_ARTIST',						1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE_FIRST_FREE_GREAT_PEOPLE' AND Value = 1);

-- INSERT INTO Technologies_JFD_FreeUnitTypes
		-- (TechType,						UnitClassType,							IsFirst)
-- SELECT	'TECH_EE_WARSHIPS',				'UNITCLASS_GREAT_ADMIRAL',				1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE_FIRST_FREE_GREAT_PEOPLE' AND Value = 1);

-- INSERT INTO Technologies_JFD_FreeUnitTypes
		-- (TechType,						UnitClassType,							IsFirst)
-- SELECT	'TECH_CIVIL_SERVICE',			'UNITCLASS_JFD_GREAT_DIGNITARY',		1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE_FIRST_FREE_GREAT_PEOPLE' AND Value = 1);

-- INSERT INTO Technologies_JFD_FreeUnitTypes
		-- (TechType,						UnitClassType,							IsFirst)
-- SELECT	'TECH_JFD_ALCHEMY',				'UNITCLASS_JFD_GREAT_DOCTOR',			1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE_FIRST_FREE_GREAT_PEOPLE' AND Value = 1);

-- INSERT INTO Technologies_JFD_FreeUnitTypes
		-- (TechType,						UnitClassType,							IsFirst)
-- SELECT	'TECH_JFD_MERCENARIES',			'UNITCLASS_GREAT_GENERAL',				1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE_FIRST_FREE_GREAT_PEOPLE' AND Value = 1);

-- INSERT INTO Technologies_JFD_FreeUnitTypes
		-- (TechType,						UnitClassType,							IsFirst)
-- SELECT	'TECH_PHYSICS',					'UNITCLASS_ENGINEER',					1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE_FIRST_FREE_GREAT_PEOPLE' AND Value = 1);

-- INSERT INTO Technologies_JFD_FreeUnitTypes
		-- (TechType,						UnitClassType,							IsFirst)
-- SELECT	'TECH_JFD_POLITICAL_SCIENCE',	'UNITCLASS_JFD_GREAT_MAGISTRATE',		1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE_FIRST_FREE_GREAT_PEOPLE' AND Value = 1);

-- INSERT INTO Technologies_JFD_FreeUnitTypes
		-- (TechType,						UnitClassType,							IsFirst)
-- SELECT	'TECH_FERTILIZER',				'UNITCLASS_MERCHANT',					1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE_FIRST_FREE_GREAT_PEOPLE' AND Value = 1);

-- INSERT INTO Technologies_JFD_FreeUnitTypes
		-- (TechType,						UnitClassType,							IsFirst)
-- SELECT	'TECH_ACOUSTICS',				'UNITCLASS_MUSICIAN',					1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE_FIRST_FREE_GREAT_PEOPLE' AND Value = 1);

-- INSERT INTO Technologies_JFD_FreeUnitTypes
		-- (TechType,						UnitClassType,							IsFirst)
-- SELECT	'TECH_PHILOSOPHY',				'UNITCLASS_PROPHET',					1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE_FIRST_FREE_GREAT_PEOPLE' AND Value = 1);

-- INSERT INTO Technologies_JFD_FreeUnitTypes
		-- (TechType,						UnitClassType,							IsFirst)
-- SELECT	'TECH_EE_NATURAL_HISTORY',		'UNITCLASS_SCIENTIST',					1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE_FIRST_FREE_GREAT_PEOPLE' AND Value = 1);

-- INSERT INTO Technologies_JFD_FreeUnitTypes
		-- (TechType,						UnitClassType,							IsFirst)
-- SELECT	'TECH_PRINTING_PRESS',			'UNITCLASS_WRITER',						1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE_FIRST_FREE_GREAT_PEOPLE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Technologies_JFD_MiscEffects
--------------------------------------------------------------------------------------------------------------------------	
-- UPDATE Technologies_JFD_MiscEffects
-- SET TechType = 'TECH_JFD_RATIONALISM'
-- WHERE AllowSecularization = 1
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------------------------------------------------------------------------------------------------
------------------
-- Ancient
------------------
--Agriculture
UPDATE Units
SET PrereqTech = 'TECH_AGRICULTURE'
WHERE Class IN ('UNITCLASS_WORKER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Archery
UPDATE Units
SET PrereqTech = 'TECH_ARCHERY'
WHERE Class IN ('UNITCLASS_CHARIOT_ARCHER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
	
--Civilization
UPDATE Units
SET PrereqTech = 'TECH_JFD_CIVILIZATION'
WHERE Class IN ('UNITCLASS_WARRIOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Fishing
UPDATE Units
SET PrereqTech = 'TECH_JFD_FISHING'
WHERE Class IN ('UNITCLASS_WORKBOAT') AND PrereqTech = 'TECH_SAILING'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Hunting
UPDATE Units
SET PrereqTech = 'TECH_JFD_HUNTING'
WHERE Class IN ('UNITCLASS_JFD_SLINGER', 'UNITCLASS_SCOUT') 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Trade
UPDATE Units
SET PrereqTech = 'TECH_JFD_TRADE'
WHERE Class IN ('UNITCLASS_CARAVAN') AND PrereqTech = 'TECH_ANIMAL_HUSBANDRY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Classical
------------------
--Shipbuilding
-- UPDATE Units
-- SET PrereqTech = 'TECH_JFD_SHIPBUILDING'
-- WHERE Class IN ('UNITCLASS_TRIREME') AND PrereqTech = 'TECH_OPTICS'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Renaissance
------------------
--Astronomy
-- UPDATE Units
-- SET PrereqTech = 'TECH_ASTRONOMY'
-- WHERE Class IN ('UNITCLASS_EE_GALLEON') AND PrereqTech = 'TECH_EE_EXPLORATION'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Colonialism
-- UPDATE Units
-- SET PrereqTech = 'TECH_JFD_COLONIALISM'
-- WHERE Class IN ('UNITCLASS_JFD_COLONIST')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--Exploration
-- UPDATE Units
-- SET PrereqTech = 'TECH_EE_EXPLORATION'
-- WHERE Class IN ('UNITCLASS_CARAVEL') AND PrereqTech = 'TECH_ASTRONOMY'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
------------------
-- Enlightenment
------------------
--Naval Engineering
-- UPDATE Units
-- SET PrereqTech = 'TECH_JFD_NAVAL_ENGINEERING' 
-- WHERE Class IN ('UNITCLASS_FRIGATE') AND PrereqTech = 'TECH_NAVIGATION'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);
	
--Sovereignty
-- UPDATE Units
-- SET PrereqTech = 'TECH_JFD_SOVEREIGNTY' 
-- WHERE Class IN ('UNITCLASS_EE_CUIRASSIER') AND PrereqTech = 'TECH_EE_IMPERIALISM';
	
--Warships
-- UPDATE Units
-- SET PrereqTech = 'TECH_EE_WARSHIPS'
-- WHERE Class IN ('UNITCLASS_PRIVATEER') AND PrereqTech = 'TECH_NAVIGATION'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

--JFDPIT_Progress_Units
CREATE TRIGGER JFDPIT_Progress_Units
AFTER INSERT ON Units 
WHEN NEW.Class IN ('UNITCLASS_WORKER', 'UNITCLASS_CHARIOT_ARCHER', 'UNITCLASS_WARRIOR', 'UNITCLASS_WORKBOAT', 'UNITCLASS_CARAVAN', 'UNITCLASS_SCOUT', 'UNITCLASS_EE_GALLEON', 'UNITCLASS_CARAVEL', 'UNITCLASS_PRIVATEER') 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1)
BEGIN
------------------
-- Ancient
------------------
	--Agriculture
	UPDATE Units
	SET PrereqTech = 'TECH_AGRICULTURE'
	WHERE Type = NEW.Type AND NEW.Class IN ('UNITCLASS_WORKER', 'UNITCLASS_WARRIOR');
	
	--Archery
	UPDATE Units
	SET PrereqTech = 'TECH_ARCHERY'
	WHERE Type = NEW.Type AND NEW.Class IN ('UNITCLASS_CHARIOT_ARCHER');
	
	--Civilization
	UPDATE Units
	SET PrereqTech = 'TECH_JFD_CIVILIZATION'
	WHERE Type = NEW.Type AND NEW.Class IN ('UNITCLASS_WARRIOR');
	
	--Fishing
	UPDATE Units
	SET PrereqTech = 'TECH_JFD_FISHING'
	WHERE Type = NEW.Type AND NEW.Class IN ('UNITCLASS_WORKBOAT') AND NEW.PrereqTech = 'TECH_SAILING';
	
	--Hunting
	UPDATE Units
	SET PrereqTech = 'TECH_JFD_HUNTING'
	WHERE Type = NEW.Type AND NEW.Class IN ('UNITCLASS_SCOUT');
	
	--Trade
	UPDATE Units
	SET PrereqTech = 'TECH_JFD_TRADE'
	WHERE Type = NEW.Type AND NEW.Class IN ('UNITCLASS_CARAVAN') AND NEW.PrereqTech = 'TECH_ANIMAL_HUSBANDRY';
------------------
-- Classical
------------------
	--Shipbuilding
	-- UPDATE Units
	-- SET PrereqTech = 'TECH_JFD_SHIPBUILDING'
	-- WHERE Type = NEW.Type AND NEW.Class IN ('UNITCLASS_TRIREME') AND NEW.PrereqTech = 'TECH_OPTICS';
------------------
-- Renaissance
------------------
	--Astronomy
	-- UPDATE Units
	-- SET PrereqTech = 'TECH_ASTRONOMY'
	-- WHERE Type = NEW.Type AND NEW.Class IN ('UNITCLASS_EE_GALLEON') AND NEW.PrereqTech = 'TECH_EE_EXPLORATION';
	
	--Exploration
	-- UPDATE Units
	-- SET PrereqTech = 'TECH_EE_EXPLORATION'
	-- WHERE Type = NEW.Type AND NEW.Class IN ('UNITCLASS_CARAVEL') AND NEW.PrereqTech = 'TECH_ASTRONOMY';
------------------
-- Enlightenment
------------------
	--Naval Engineering
	-- UPDATE Units
	-- SET PrereqTech = 'TECH_JFD_NAVAL_ENGINEERING' 
	-- WHERE Type = NEW.Type AND NEW.Class IN ('UNITCLASS_FRIGATE') AND NEW.PrereqTech = 'TECH_NAVIGATION';
	
	--Sovereignty
	-- UPDATE Units
	-- SET PrereqTech = 'TECH_EE_SOVEREIGNTY' 
	-- WHERE Type = NEW.Type AND NEW.Class IN ('UNITCLASS_EE_CUIRASSIER') AND NEW.PrereqTech = 'TECH_EE_IMPERIALISM';
	
	--Warships
	-- UPDATE Units
	-- SET PrereqTech = 'TECH_EE_WARSHIPS' 
	-- WHERE Type = NEW.Type AND NEW.Class IN ('UNITCLASS_PRIVATEER') AND NEW.PrereqTech = 'TECH_NAVIGATION';
END;
--==========================================================================================================================
-- CIVILIZATION
--==========================================================================================================================
-- Civilization_FreeTechs
------------------------------------------------------------------------------------------------------------------------
UPDATE Civilization_FreeTechs SET TechType = 'TECH_JFD_CIVILIZATION' WHERE TechType = 'TECH_AGRICULTURE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 1);

CREATE TRIGGER JFDPIT_Progress_Civilization_FreeTechs
AFTER INSERT ON Civilization_FreeTechs 
WHEN NEW.TechType IN ('TECH_AGRICULTURE') 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'TECH_JFD_CIVILIZATION' AND Value = 1)
BEGIN
	UPDATE Civilization_FreeTechs SET TechType = 'TECH_JFD_CIVILIZATION' WHERE TechType = 'TECH_AGRICULTURE';
END;
--==========================================================================================================================
--==========================================================================================================================