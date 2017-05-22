--==========================================================================================================================
-- RESOLUTIONS
--==========================================================================================================================
-- Resolutions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Resolutions 
		(Type,						TechPrereqAnyMember,		LeagueProjectEnabled,										Description,											Help,														VoterDecision,						ProposerDecision)
SELECT	'RESOLUTION_JFD_CRIME',		'TECH_RADIO',				'LEAGUE_PROJECT_JFD_INTERNATIONAL_CRIMINAL_COURT',			'TXT_KEY_RESOLUTION_JFD_INTERNATIONAL_CRIMINAL_COURT',	'TXT_KEY_RESOLUTION_JFD_INTERNATIONAL_CRIMINAL_COURT_HELP',	'RESOLUTION_DECISION_YES_OR_NO',	'RESOLUTION_DECISION_NONE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_RESOLUTION_ADDITIONS_CRIMINAL_COURT' AND Value = 1);
----------------------------------------------------------------------------------------------------------------------------
---- LeagueProjects
----------------------------------------------------------------------------------------------------------------------------	
INSERT INTO LeagueProjects 
		(Type,													Description,												Help,																ProjectSplashImage,							Process,									CostPerPlayer,	RewardTier1,												RewardTier2,												RewardTier3,												PortraitIndex,	IconAtlas)
SELECT	'LEAGUE_PROJECT_JFD_INTERNATIONAL_CRIMINAL_COURT',		'TXT_KEY_LEAGUE_PROJECT_JFD_INTERNATIONAL_CRIMINAL_COURT',	'TXT_KEY_LEAGUE_PROJECT_JFD_INTERNATIONAL_CRIMINAL_COURT_SPLASH',	'Project_InternationalCriminalCourt.dds',	'PROCESS_JFD_INTERNATIONAL_CRIMINAL_COURT',	720,			'LEAGUE_PROJECT_REWARD_JFD_INTERNATIONAL_CRIMINAL_COURT_1',	'LEAGUE_PROJECT_REWARD_JFD_INTERNATIONAL_CRIMINAL_COURT_2',	'LEAGUE_PROJECT_REWARD_JFD_INTERNATIONAL_CRIMINAL_COURT_3',	0,				'INTL_PROJECT_ATLAS_EXP2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_RESOLUTION_ADDITIONS_CRIMINAL_COURT' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- LeagueProjectRewards
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO LeagueProjectRewards 
		(Type,															Description,														Help,																		Building)
SELECT	'LEAGUE_PROJECT_REWARD_JFD_INTERNATIONAL_CRIMINAL_COURT_1',		'TXT_KEY_LEAGUE_PROJECT_REWARD_JFD_INTERNATIONAL_CRIMINAL_COURT_1',	'TXT_KEY_LEAGUE_PROJECT_REWARD_JFD_INTERNATIONAL_CRIMINAL_COURT_1_HELP',	'BUILDING_JFD_ICC_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_RESOLUTION_ADDITIONS_CRIMINAL_COURT' AND Value = 1);

INSERT INTO LeagueProjectRewards 
		(Type,															Description,														Help,																		Building)
SELECT	'LEAGUE_PROJECT_REWARD_JFD_INTERNATIONAL_CRIMINAL_COURT_2',		'TXT_KEY_LEAGUE_PROJECT_REWARD_JFD_INTERNATIONAL_CRIMINAL_COURT_2',	'TXT_KEY_LEAGUE_PROJECT_REWARD_JFD_INTERNATIONAL_CRIMINAL_COURT_2_HELP',	'BUILDING_JFD_ICC_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_RESOLUTION_ADDITIONS_CRIMINAL_COURT' AND Value = 1);

INSERT INTO LeagueProjectRewards 
		(Type,															Description,														Help,																		Building)
SELECT	'LEAGUE_PROJECT_REWARD_JFD_INTERNATIONAL_CRIMINAL_COURT_3',		'TXT_KEY_LEAGUE_PROJECT_REWARD_JFD_INTERNATIONAL_CRIMINAL_COURT_3',	'TXT_KEY_LEAGUE_PROJECT_REWARD_JFD_INTERNATIONAL_CRIMINAL_COURT_3_HELP',	'BUILDING_JFD_ICC_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_RESOLUTION_ADDITIONS_CRIMINAL_COURT' AND Value = 1);
--==========================================================================================================================	
-- PROCESSES
--==========================================================================================================================			
-- Processes
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Processes 
		(Type,											Description,										Help,														Strategy, 													IconAtlas, 					PortraitIndex)
SELECT	'PROCESS_JFD_INTERNATIONAL_CRIMINAL_COURT',		'TXT_KEY_PROCESS_JFD_INTERNATIONAL_CRIMINAL_COURT',	'TXT_KEY_PROCESS_JFD_INTERNATIONAL_CRIMINAL_COURT_HELP',	'TXT_KEY_PROCESS_JFD_INTERNATIONAL_CRIMINAL_COURT_HELP',	'INTL_PROJECT_ATLAS_EXP2',	0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_RESOLUTION_ADDITIONS_CRIMINAL_COURT' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Process_Flavors
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Process_Flavors
		(ProcessType,									FlavorType,	 Flavor)
SELECT	'PROCESS_JFD_INTERNATIONAL_CRIMINAL_COURT',		Type,		 20
FROM Flavors WHERE Type IN ('FLAVOR_CULTURE', 'FLAVOR_SCIENCE', 'FLAVOR_GOLD', 'FLAVOR_GROWTH', 'FLAVOR_HAPPINESS', 'FLAVOR_RELIGION', 'FLAVOR_PRODUCTION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_RESOLUTION_ADDITIONS_CRIMINAL_COURT' AND Value = 1);
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================			
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings
		(Type,						BuildingClass,					PrereqTech,		GreatWorkCount, Cost, 	FaithCost, 	Description,							Help)
SELECT	'BUILDING_JFD_ICC_1',		'BUILDINGCLASS_JFD_CRIMES',		NULL,			-1,				-1,		-1,			'TXT_KEY_BUILDING_JFD_ICC_1_DESC',		'TXT_KEY_LEAGUE_PROJECT_REWARD_JFD_INTERNATIONAL_CRIMINAL_COURT_1_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_RESOLUTION_ADDITIONS_CRIMINAL_COURT' AND Value = 1);

INSERT INTO Buildings
		(Type,						BuildingClass,					PrereqTech,		GreatWorkCount, Cost, 	FaithCost, 	Description,							Help)
SELECT	'BUILDING_JFD_ICC_2',		'BUILDINGCLASS_JFD_CRIMES',		NULL,			-1,				-1,		-1,			'TXT_KEY_BUILDING_JFD_ICC_2_DESC',		'TXT_KEY_LEAGUE_PROJECT_REWARD_JFD_INTERNATIONAL_CRIMINAL_COURT_2_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_RESOLUTION_ADDITIONS_CRIMINAL_COURT' AND Value = 1);

INSERT INTO Buildings
		(Type,						BuildingClass,					PrereqTech,		GreatWorkCount, Cost, 	FaithCost, 	Description,							Help)
SELECT	'BUILDING_JFD_ICC_3',		'BUILDINGCLASS_JFD_CRIMES',		NULL,			-1,				-1,		-1,			'TXT_KEY_BUILDING_JFD_ICC_3_DESC',		'TXT_KEY_LEAGUE_PROJECT_REWARD_JFD_INTERNATIONAL_CRIMINAL_COURT_3_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_RESOLUTION_ADDITIONS_CRIMINAL_COURT' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_OrganizedCrimeMods
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_JFD_OrganizedCrimeMods
		(BuildingType,					GlobalThresholdMod)
SELECT	'BUILDING_JFD_ICC_1',			5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_RESOLUTION_ADDITIONS_CRIMINAL_COURT' AND Value = 1);

INSERT INTO Building_JFD_OrganizedCrimeMods
		(BuildingType,					GlobalThresholdMod)
SELECT	'BUILDING_JFD_ICC_2',			5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_RESOLUTION_ADDITIONS_CRIMINAL_COURT' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================