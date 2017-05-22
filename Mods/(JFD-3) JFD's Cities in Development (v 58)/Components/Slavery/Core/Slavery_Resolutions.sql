--==========================================================================================================================
-- RESOLUTIONS
--==========================================================================================================================
-- Resolutions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Resolutions 
		(Type,						TechPrereqAnyMember,		LeagueProjectEnabled,				Description,							Help,										VoterDecision,						ProposerDecision)
SELECT	'RESOLUTION_JFD_SLAVERY',	'TECH_INDUSTRIALIZATION',	'LEAGUE_PROJECT_JFD_HUMAN_RIGHTS',	'TXT_KEY_RESOLUTION_JFD_HUMAN_RIGHTS',	'TXT_KEY_RESOLUTION_JFD_HUMAN_RIGHTS_HELP',	'RESOLUTION_DECISION_YES_OR_NO',	'RESOLUTION_DECISION_NONE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_RESOLUTION_ADDITIONS_HUMAN_RIGHTS' AND Value = 1);
----------------------------------------------------------------------------------------------------------------------------
---- LeagueProjects
----------------------------------------------------------------------------------------------------------------------------	
INSERT INTO LeagueProjects 
		(Type,											Description,											Help,														ProjectSplashImage,				Process,						CostPerPlayer,		RewardTier1,									RewardTier2,									RewardTier3,									PortraitIndex,	IconAtlas)
SELECT	'LEAGUE_PROJECT_JFD_HUMAN_RIGHTS',				'TXT_KEY_LEAGUE_PROJECT_JFD_HUMAN_RIGHTS',				'TXT_KEY_LEAGUE_PROJECT_JFD_HUMAN_RIGHTS_SPLASH',			'Project_HumanRights.dds',		'PROCESS_JFD_HUMAN_RIGHTS',		720,					'LEAGUE_PROJECT_REWARD_JFD_HUMAN_RIGHTS_1',		'LEAGUE_PROJECT_REWARD_JFD_HUMAN_RIGHTS_2',		'LEAGUE_PROJECT_REWARD_JFD_HUMAN_RIGHTS_3',		0,				'INTL_PROJECT_ATLAS_EXP2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_RESOLUTION_ADDITIONS_HUMAN_RIGHTS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- LeagueProjectRewards
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO LeagueProjectRewards 
		(Type,											Description,											Help,														Happiness)
SELECT	'LEAGUE_PROJECT_REWARD_JFD_HUMAN_RIGHTS_1',		'TXT_KEY_LEAGUE_PROJECT_REWARD_JFD_HUMAN_RIGHTS_1',		'TXT_KEY_LEAGUE_PROJECT_REWARD_JFD_HUMAN_RIGHTS_1_HELP',	3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_RESOLUTION_ADDITIONS_HUMAN_RIGHTS' AND Value = 1);

INSERT INTO LeagueProjectRewards 
		(Type,											Description,											Help,														Happiness)
SELECT	'LEAGUE_PROJECT_REWARD_JFD_HUMAN_RIGHTS_2',		'TXT_KEY_LEAGUE_PROJECT_REWARD_JFD_HUMAN_RIGHTS_2',		'TXT_KEY_LEAGUE_PROJECT_REWARD_JFD_HUMAN_RIGHTS_2_HELP',	5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_RESOLUTION_ADDITIONS_HUMAN_RIGHTS' AND Value = 1);

INSERT INTO LeagueProjectRewards 
		(Type,											Description,											Help,														Happiness)
SELECT	'LEAGUE_PROJECT_REWARD_JFD_HUMAN_RIGHTS_3',		'TXT_KEY_LEAGUE_PROJECT_REWARD_JFD_HUMAN_RIGHTS_3',		'TXT_KEY_LEAGUE_PROJECT_REWARD_JFD_HUMAN_RIGHTS_3_HELP',	10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_RESOLUTION_ADDITIONS_HUMAN_RIGHTS' AND Value = 1);
--==========================================================================================================================	
-- PROCESSES
--==========================================================================================================================			
-- Processes
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Processes 
		(Type,							Description,							Help,										Strategy, 									IconAtlas, 					PortraitIndex)
SELECT	'PROCESS_JFD_HUMAN_RIGHTS',		'TXT_KEY_PROCESS_JFD_HUMAN_RIGHTS',		'TXT_KEY_PROCESS_JFD_HUMAN_RIGHTS_HELP',	'TXT_KEY_PROCESS_JFD_HUMAN_RIGHTS_HELP',	'INTL_PROJECT_ATLAS_EXP2',	0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_RESOLUTION_ADDITIONS_HUMAN_RIGHTS' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Process_Flavors
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Process_Flavors
		(ProcessType,					FlavorType,	 Flavor)
SELECT	'PROCESS_JFD_HUMAN_RIGHTS',		Type,		 20
FROM Flavors WHERE Type IN ('FLAVOR_CULTURE', 'FLAVOR_SCIENCE', 'FLAVOR_GOLD', 'FLAVOR_GROWTH', 'FLAVOR_HAPPINESS', 'FLAVOR_RELIGION', 'FLAVOR_PRODUCTION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_RESOLUTION_ADDITIONS_HUMAN_RIGHTS' AND Value = 1);
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================			
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings
		(Type,								BuildingClass,				PrereqTech,		GreatWorkCount, Cost, 	FaithCost, 	Description,									Help)
SELECT	'BUILDING_JFD_HUMAN_RIGHTS_1',		'BUILDINGCLASS_JFD_CID',	NULL,			-1,				-1,		-1,			'TXT_KEY_BUILDING_JFD_HUMAN_RIGHTS_1_DESC',		'TXT_KEY_LEAGUE_PROJECT_REWARD_JFD_HUMAN_RIGHTS_1_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_RESOLUTION_ADDITIONS_HUMAN_RIGHTS' AND Value = 1);

INSERT INTO Buildings
		(Type,								BuildingClass,				PrereqTech,		GreatWorkCount, Cost, 	FaithCost, 	Description,									Help)
SELECT	'BUILDING_JFD_HUMAN_RIGHTS_2',		'BUILDINGCLASS_JFD_CID',	NULL,			-1,				-1,		-1,			'TXT_KEY_BUILDING_JFD_HUMAN_RIGHTS_2_DESC',		'TXT_KEY_LEAGUE_PROJECT_REWARD_JFD_HUMAN_RIGHTS_2_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_RESOLUTION_ADDITIONS_HUMAN_RIGHTS' AND Value = 1);

INSERT INTO Buildings
		(Type,								BuildingClass,				PrereqTech,		GreatWorkCount, Cost, 	FaithCost, 	Description,									Help)
SELECT	'BUILDING_JFD_HUMAN_RIGHTS_3',		'BUILDINGCLASS_JFD_CID',	NULL,			-1,				-1,		-1,			'TXT_KEY_BUILDING_JFD_HUMAN_RIGHTS_3_DESC',		'TXT_KEY_LEAGUE_PROJECT_REWARD_JFD_HUMAN_RIGHTS_3_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_RESOLUTION_ADDITIONS_HUMAN_RIGHTS' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================