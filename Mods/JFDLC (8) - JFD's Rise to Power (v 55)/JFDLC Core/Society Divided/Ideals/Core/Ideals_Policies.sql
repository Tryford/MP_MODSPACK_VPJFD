--==========================================================================================================================
-- POLICY BRANCHES
--==========================================================================================================================
-- PolicyBranchTypes
-------------------------------------	
INSERT INTO PolicyBranchTypes	
		(Type,							Description,							Help,										Title)
SELECT	'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_POLICY_BRANCH_JFD_IDEALS_HELP',	'TXT_KEY_POLICY_BRANCH_JFD_IDEALS_TITLE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	
--==========================================================================================================================
-- POLICIES
--==========================================================================================================================
-- Policies
-------------------------------------	
--Aboriginal
INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_ABORIGINAL_1',		'TXT_KEY_IDEAL_JFD_ABORIGINAL_DESC_1',		'TXT_KEY_IDEAL_JFD_ABORIGINAL_HELP_1',		0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_ABORIGINAL_TEXT_1',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_ABORIGINAL_2',		'TXT_KEY_IDEAL_JFD_ABORIGINAL_DESC_2',		'TXT_KEY_IDEAL_JFD_ABORIGINAL_HELP_2',		0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_ABORIGINAL_TEXT_2',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_ABORIGINAL_3',		'TXT_KEY_IDEAL_JFD_ABORIGINAL_DESC_3',		'TXT_KEY_IDEAL_JFD_ABORIGINAL_HELP_3',		0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_ABORIGINAL_TEXT_3',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);		

--Andean
INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_ANDEAN_1',			'TXT_KEY_IDEAL_JFD_ANDEAN_DESC_1',			'TXT_KEY_IDEAL_JFD_ANDEAN_HELP_1',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_ANDEAN_TEXT_1',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_ANDEAN_2',			'TXT_KEY_IDEAL_JFD_ANDEAN_DESC_2',			'TXT_KEY_IDEAL_JFD_ANDEAN_HELP_2',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_ANDEAN_TEXT_2',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO Policies	
		(Type,									Description,								Help,										ConversionModifier,							GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_ANDEAN_3',			'TXT_KEY_IDEAL_JFD_ANDEAN_DESC_3',			'TXT_KEY_IDEAL_JFD_ANDEAN_HELP_3',			-50,										0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_ANDEAN_TEXT_3',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

--Bantu
INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_BANTU_1',			'TXT_KEY_IDEAL_JFD_BANTU_DESC_1',			'TXT_KEY_IDEAL_JFD_BANTU_HELP_1',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_BANTU_TEXT_1',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_BANTU_2',			'TXT_KEY_IDEAL_JFD_BANTU_DESC_2',			'TXT_KEY_IDEAL_JFD_BANTU_HELP_2',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_BANTU_TEXT_2',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_BANTU_3',			'TXT_KEY_IDEAL_JFD_BANTU_DESC_3',			'TXT_KEY_IDEAL_JFD_BANTU_HELP_3',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_BANTU_TEXT_3',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT Type FROM Yields WHERE Type = 'YIELD_DEFENSE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

--Bharata
INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_BHARATA_1',			'TXT_KEY_IDEAL_JFD_BHARATA_DESC_1',			'TXT_KEY_IDEAL_JFD_BHARATA_HELP_1',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_BHARATA_TEXT_1',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);		

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_BHARATA_2',			'TXT_KEY_IDEAL_JFD_BHARATA_DESC_2',			'TXT_KEY_IDEAL_JFD_BHARATA_HELP_3',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_BHARATA_TEXT_2',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										ReligionDistance,							PressureMod,					IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_BHARATA_3',			'TXT_KEY_IDEAL_JFD_BHARATA_DESC_3',			'TXT_KEY_IDEAL_JFD_BHARATA_HELP_3',			50,											100,							1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_BHARATA_TEXT_3',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

--Central
INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_CENTRAL_1',			'TXT_KEY_IDEAL_JFD_CENTRAL_DESC_1',			'TXT_KEY_IDEAL_JFD_CENTRAL_HELP_1',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_CENTRAL_TEXT_1',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);	

INSERT INTO Policies	
		(Type,									Description,								Help,										MinorGoldFriendshipMod,						GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_CENTRAL_2',			'TXT_KEY_IDEAL_JFD_CENTRAL_DESC_2',			'TXT_KEY_IDEAL_JFD_CENTRAL_HELP_2',			20,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_CENTRAL_TEXT_2',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);	

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_CENTRAL_3',			'TXT_KEY_IDEAL_JFD_CENTRAL_DESC_3',			'TXT_KEY_IDEAL_JFD_CENTRAL_HELP_3',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_CENTRAL_TEXT_3',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

--Classical
INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_CLASSICAL_1',		'TXT_KEY_IDEAL_JFD_CLASSICAL_DESC_1',		'TXT_KEY_IDEAL_JFD_CLASSICAL_HELP_1',		0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_CLASSICAL_TEXT_1',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_CLASSICAL_2',		'TXT_KEY_IDEAL_JFD_CLASSICAL_DESC_2',		'TXT_KEY_IDEAL_JFD_CLASSICAL_HELP_2',		0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_CLASSICAL_TEXT_2',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO Policies	
		(Type,									Description,								Help,										CitadelBoost,								GreatGeneralExtraBonus,			IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_CLASSICAL_3',		'TXT_KEY_IDEAL_JFD_CLASSICAL_DESC_3',		'TXT_KEY_IDEAL_JFD_CLASSICAL_HELP_3',		1,											15,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_CLASSICAL_TEXT_3',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

--Colonial
INSERT INTO Policies	
		(Type,									Description,								Help,										HappinessPerXPolicies,						PolicyCostModifier,				IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_COLONIAL_2',			'TXT_KEY_IDEAL_JFD_COLONIAL_DESC_2',		'TXT_KEY_IDEAL_JFD_COLONIAL_HELP_2',		5,											-10,							1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_COLONIAL_TEXT_2',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					PolicyCostModifier,				IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_COLONIAL_3',			'TXT_KEY_IDEAL_JFD_COLONIAL_DESC_3',		'TXT_KEY_IDEAL_JFD_COLONIAL_HELP_3',		0,											-10,							1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_COLONIAL_TEXT_3',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

--East Indies
INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_EAST_INDIES_1',		'TXT_KEY_IDEAL_JFD_EAST_INDIES_DESC_1',		'TXT_KEY_IDEAL_JFD_EAST_INDIES_HELP_1',		0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_EAST_INDIES_TEXT_1',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);	

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_EAST_INDIES_2',		'TXT_KEY_IDEAL_JFD_EAST_INDIES_DESC_2',		'TXT_KEY_IDEAL_JFD_EAST_INDIES_HELP_2',		0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_EAST_INDIES_TEXT_2',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);		

INSERT INTO Policies	
		(Type,									Description,								Help,										TradeRouteSeaDistanceModifier,				GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_EAST_INDIES_3',		'TXT_KEY_IDEAL_JFD_EAST_INDIES_DESC_3',		'TXT_KEY_IDEAL_JFD_EAST_INDIES_HELP_3',		50,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_EAST_INDIES_TEXT_3',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

--Eastern
INSERT INTO Policies	
		(Type,									Description,								Help,										CityWorkingChange,							GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_EASTERN_1',			'TXT_KEY_IDEAL_JFD_EASTERN_DESC_1',			'TXT_KEY_IDEAL_JFD_EASTERN_HELP_1',			1,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_EASTERN_TEXT_1',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_EASTERN_2',			'TXT_KEY_IDEAL_JFD_EASTERN_DESC_2',			'TXT_KEY_IDEAL_JFD_EASTERN_HELP_2',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_EASTERN_TEXT_2',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_EASTERN_3',			'TXT_KEY_IDEAL_JFD_EASTERN_DESC_3',			'TXT_KEY_IDEAL_JFD_EASTERN_HELP_3',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_EASTERN_TEXT_3',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--Great Plains 
INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_GREAT_PLAINS_1',		'TXT_KEY_IDEAL_JFD_GREAT_PLAINS_DESC_1',	'TXT_KEY_IDEAL_JFD_GREAT_PLAINS_HELP_1',	0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_GREAT_PLAINS_TEXT_1',	24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_GREAT_PLAINS_2',		'TXT_KEY_IDEAL_JFD_GREAT_PLAINS_DESC_2',	'TXT_KEY_IDEAL_JFD_GREAT_PLAINS_HELP_2',	0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_GREAT_PLAINS_TEXT_2',	24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_GREAT_PLAINS_3',		'TXT_KEY_IDEAL_JFD_GREAT_PLAINS_DESC_3',	'TXT_KEY_IDEAL_JFD_GREAT_PLAINS_HELP_3',	0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_GREAT_PLAINS_TEXT_3',	24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

--Himalayan
INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_HIMALAYAN_1',		'TXT_KEY_IDEAL_JFD_HIMALAYAN_DESC_1',		'TXT_KEY_IDEAL_JFD_HIMALAYAN_HELP_1',		0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_HIMALAYAN_TEXT_1',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_HIMALAYAN_2',		'TXT_KEY_IDEAL_JFD_HIMALAYAN_DESC_2',		'TXT_KEY_IDEAL_JFD_HIMALAYAN_HELP_2',		0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_HIMALAYAN_TEXT_2',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);		

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_HIMALAYAN_3',		'TXT_KEY_IDEAL_JFD_HIMALAYAN_DESC_3',		'TXT_KEY_IDEAL_JFD_HIMALAYAN_HELP_3',		0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_HIMALAYAN_TEXT_3',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);	

--Iranian
INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_IRANIAN_1',			'TXT_KEY_IDEAL_JFD_IRANIAN_DESC_1',			'TXT_KEY_IDEAL_JFD_IRANIAN_HELP_1',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_IRANIAN_TEXT_1',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE_LEVIES' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										FreeSpy,									GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_IRANIAN_2',			'TXT_KEY_IDEAL_JFD_IRANIAN_DESC_2',			'TXT_KEY_IDEAL_JFD_IRANIAN_HELP_2',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_IRANIAN_TEXT_2',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_IRANIAN_3',			'TXT_KEY_IDEAL_JFD_IRANIAN_DESC_3',			'TXT_KEY_IDEAL_JFD_IRANIAN_HELP_3',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_IRANIAN_TEXT_3',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Islamic
INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_ISLAMIC_1',			'TXT_KEY_IDEAL_JFD_ISLAMIC_DESC_1',			'TXT_KEY_IDEAL_JFD_ISLAMIC_HELP_1',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_ISLAMIC_TEXT_1',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										RemovesUnwelcomeEvangelist,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_ISLAMIC_2',			'TXT_KEY_IDEAL_JFD_ISLAMIC_DESC_2',			'TXT_KEY_IDEAL_JFD_ISLAMIC_HELP_2',			1,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_ISLAMIC_TEXT_2',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										TRVisionBoost,								GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_ISLAMIC_3',			'TXT_KEY_IDEAL_JFD_ISLAMIC_DESC_3',			'TXT_KEY_IDEAL_JFD_ISLAMIC_HELP_3',			1,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_ISLAMIC_TEXT_3',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Katuje
INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_KATUJE_1',			'TXT_KEY_IDEAL_JFD_KATUJE_DESC_1',			'TXT_KEY_IDEAL_JFD_KATUJE_HELP_1',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_KATUJE_TEXT_1',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										FeatureConnections,							GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_KATUJE_2',			'TXT_KEY_IDEAL_JFD_KATUJE_DESC_2',			'TXT_KEY_IDEAL_JFD_KATUJE_HELP_2',			'FEATURE_JUNGLE',							0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_KATUJE_TEXT_2',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_KATUJE_3',			'TXT_KEY_IDEAL_JFD_KATUJE_DESC_3',			'TXT_KEY_IDEAL_JFD_KATUJE_HELP_3',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_KATUJE_TEXT_3',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Mandala
INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_MANDALA_1',			'TXT_KEY_IDEAL_JFD_MANDALA_DESC_1',			'TXT_KEY_IDEAL_JFD_MANDALA_HELP_1',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_MANDALA_TEXT_2',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										UpgradeCSTerritory,							ProtectedMinorPerTurnInfluence,	IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_MANDALA_2',			'TXT_KEY_IDEAL_JFD_MANDALA_DESC_2',			'TXT_KEY_IDEAL_JFD_MANDALA_HELP_2',			1,											100,							1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_MANDALA_TEXT_3',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_MANDALA_3',			'TXT_KEY_IDEAL_JFD_MANDALA_DESC_3',			'TXT_KEY_IDEAL_JFD_MANDALA_HELP_3',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_MANDALA_TEXT_3',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

--Mesoamerican
INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_MESOAMERICAN_1',		'TXT_KEY_IDEAL_JFD_MESOAMERICAN_DESC_1',	'TXT_KEY_IDEAL_JFD_MESOAMERICAN_HELP_1',	0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_MESOAMERICAN_TEXT_1',	24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);		

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_MESOAMERICAN_2',		'TXT_KEY_IDEAL_JFD_MESOAMERICAN_DESC_2',	'TXT_KEY_IDEAL_JFD_MESOAMERICAN_HELP_2',	0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_MESOAMERICAN_TEXT_1',	24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										PuppetProdMod,								PuppetUnhappinessModPolicy,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_MESOAMERICAN_3',		'TXT_KEY_IDEAL_JFD_MESOAMERICAN_DESC_3',	'TXT_KEY_IDEAL_JFD_MESOAMERICAN_HELP_3',	20,											-15,							1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_MESOAMERICAN_TEXT_1',	24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

--Mesopotamic
INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_MESOPOTAMIC_1',		'TXT_KEY_IDEAL_JFD_MESOPOTAMIC_DESC_1',		'TXT_KEY_IDEAL_JFD_MESOPOTAMIC_HELP_1',		0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_MESOPOTAMIC_TEXT_1',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO Policies	
		(Type,									Description,								Help,										NoUnhappfromXSpecialistsCapital,			GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_MESOPOTAMIC_2',		'TXT_KEY_IDEAL_JFD_MESOPOTAMIC_DESC_2',		'TXT_KEY_IDEAL_JFD_MESOPOTAMIC_HELP_2',		5,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_MESOPOTAMIC_TEXT_2',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_MESOPOTAMIC_3',		'TXT_KEY_IDEAL_JFD_MESOPOTAMIC_DESC_3',		'TXT_KEY_IDEAL_JFD_MESOPOTAMIC_HELP_3',		0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_MESOPOTAMIC_TEXT_3',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

--Northern
INSERT INTO Policies	
		(Type,									Description,								Help,										GreatWriterRateModifier,					GreatMusicianRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_NORTHERN_1',			'TXT_KEY_IDEAL_JFD_NORTHERN_DESC_1',		'TXT_KEY_IDEAL_JFD_NORTHERN_HELP_1',		33,											33,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_NORTHERN_TEXT_1',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_NORTHERN_2',			'TXT_KEY_IDEAL_JFD_NORTHERN_DESC_2',		'TXT_KEY_IDEAL_JFD_NORTHERN_HELP_2',		0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_NORTHERN_TEXT_2',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_NORTHERN_3',			'TXT_KEY_IDEAL_JFD_NORTHERN_DESC_3',		'TXT_KEY_IDEAL_JFD_NORTHERN_HELP_3',		0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_NORTHERN_TEXT_3',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

--Oceanic
INSERT INTO Policies	
		(Type,									Description,								Help,										EmbarkedExtraMoves,							GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_OCEANIC_1',			'TXT_KEY_IDEAL_JFD_OCEANIC_DESC_1',			'TXT_KEY_IDEAL_JFD_OCEANIC_HELP_1',			1,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_OCEANIC_TEXT_1',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_OCEANIC_2',			'TXT_KEY_IDEAL_JFD_OCEANIC_DESC_2',			'TXT_KEY_IDEAL_JFD_OCEANIC_HELP_2',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_OCEANIC_TEXT_2',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_OCEANIC_3',			'TXT_KEY_IDEAL_JFD_OCEANIC_DESC_3',			'TXT_KEY_IDEAL_JFD_OCEANIC_HELP_3',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_OCEANIC_TEXT_3',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Oriental
INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_ORIENTAL_1',			'TXT_KEY_IDEAL_JFD_ORIENTAL_DESC_1',		'TXT_KEY_IDEAL_JFD_ORIENTAL_HELP_1',		0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_ORIENTAL_TEXT_1',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);	

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_ORIENTAL_2',			'TXT_KEY_IDEAL_JFD_ORIENTAL_DESC_2',		'TXT_KEY_IDEAL_JFD_ORIENTAL_HELP_2',		0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_ORIENTAL_TEXT_2',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);	

INSERT INTO Policies	
		(Type,									Description,								Help,										GoldenAgeDurationMod,						GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_ORIENTAL_3',			'TXT_KEY_IDEAL_JFD_ORIENTAL_DESC_3',		'TXT_KEY_IDEAL_JFD_ORIENTAL_HELP_3',		20,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_ORIENTAL_TEXT_3',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--Pacific 
INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_PACIFIC_1',			'TXT_KEY_IDEAL_JFD_PACIFIC_DESC_1',			'TXT_KEY_IDEAL_JFD_PACIFIC_HELP_1',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_PACIFIC_TEXT_1',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_PACIFIC_2',			'TXT_KEY_IDEAL_JFD_PACIFIC_DESC_2',			'TXT_KEY_IDEAL_JFD_PACIFIC_HELP_2',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_PACIFIC_TEXT_2',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_PACIFIC_3',			'TXT_KEY_IDEAL_JFD_PACIFIC_DESC_3',			'TXT_KEY_IDEAL_JFD_PACIFIC_HELP_3',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_PACIFIC_TEXT_3',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

--Polar
INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_POLAR_1',			'TXT_KEY_IDEAL_JFD_POLAR_DESC_1',			'TXT_KEY_IDEAL_JFD_POLAR_HELP_1',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_POLAR_TEXT_1',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_POLAR_2',			'TXT_KEY_IDEAL_JFD_POLAR_DESC_2',			'TXT_KEY_IDEAL_JFD_POLAR_HELP_2',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_POLAR_TEXT_2',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_POLAR_3',			'TXT_KEY_IDEAL_JFD_POLAR_DESC_3',			'TXT_KEY_IDEAL_JFD_POLAR_HELP_3',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_POLAR_TEXT_3',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

--Saharan
INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_SAHARAN_1',			'TXT_KEY_IDEAL_JFD_SAHARAN_DESC_1',			'TXT_KEY_IDEAL_JFD_SAHARAN_HELP_1',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_SAHARAN_TEXT_1',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_SAHARAN_2',			'TXT_KEY_IDEAL_JFD_SAHARAN_DESC_2',			'TXT_KEY_IDEAL_JFD_SAHARAN_HELP_2',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_SAHARAN_TEXT_2',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_SAHARAN_3',			'TXT_KEY_IDEAL_JFD_SAHARAN_DESC_3',			'TXT_KEY_IDEAL_JFD_SAHARAN_HELP_3',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_SAHARAN_TEXT_3',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

--Semitic
INSERT INTO Policies	
		(Type,									Description,								Help,										DoublePietyRestingRateRecovery,				GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_SEMITIC_1',			'TXT_KEY_IDEAL_JFD_SEMITIC_DESC_1',			'TXT_KEY_IDEAL_JFD_SEMITIC_HELP_1',			1,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_SEMITIC_TEXT_1',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_SEMITIC_2',			'TXT_KEY_IDEAL_JFD_SEMITIC_DESC_2',			'TXT_KEY_IDEAL_JFD_SEMITIC_HELP_2',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_SEMITIC_TEXT_2',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_SEMITIC_3',			'TXT_KEY_IDEAL_JFD_SEMITIC_DESC_3',			'TXT_KEY_IDEAL_JFD_SEMITIC_HELP_3',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_SEMITIC_TEXT_3',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Steppe
INSERT INTO Policies	
		(Type,									Description,								Help,										DoublesMountedTrained,						GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_STEPPE_1',			'TXT_KEY_IDEAL_JFD_STEPPE_DESC_1',			'TXT_KEY_IDEAL_JFD_STEPPE_HELP_1',			1,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_STEPPE_TEXT_1',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										TradeRouteLandDistanceModifier,				TRSpeedBoost,					IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_STEPPE_2',			'TXT_KEY_IDEAL_JFD_STEPPE_DESC_2',			'TXT_KEY_IDEAL_JFD_STEPPE_HELP_2',			50,											1,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_STEPPE_TEXT_2',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										ClaimsTilesOnConquest,						GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_STEPPE_3',			'TXT_KEY_IDEAL_JFD_STEPPE_DESC_3',			'TXT_KEY_IDEAL_JFD_STEPPE_HELP_3',			3,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_STEPPE_TEXT_3',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Southern 
INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_SOUTHERN_1',			'TXT_KEY_IDEAL_JFD_SOUTHERN_DESC_1',		'TXT_KEY_IDEAL_JFD_SOUTHERN_HELP_1',		0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_SOUTHERN_TEXT_1',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);		

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_SOUTHERN_2',			'TXT_KEY_IDEAL_JFD_SOUTHERN_DESC_2',		'TXT_KEY_IDEAL_JFD_SOUTHERN_HELP_2',		0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_SOUTHERN_TEXT_2',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO Policies	
		(Type,									Description,								Help,										ConversionModifier,							NoReligionLossFromPiety,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_SOUTHERN_3',			'TXT_KEY_IDEAL_JFD_SOUTHERN_DESC_3',		'TXT_KEY_IDEAL_JFD_SOUTHERN_HELP_3',		-50,										1,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_SOUTHERN_TEXT_3',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

--Steppe
INSERT INTO Policies	
		(Type,									Description,								Help,										InternalTradeRouteYieldModifierCapital,		GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_TOTALITARIAN_1',		'TXT_KEY_IDEAL_JFD_TOTALITARIAN_DESC_1',	'TXT_KEY_IDEAL_JFD_TOTALITARIAN_HELP_1',	50,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_TOTALITARIAN_TEXT_1',	24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_TOTALITARIAN_2',		'TXT_KEY_IDEAL_JFD_TOTALITARIAN_DESC_2',	'TXT_KEY_IDEAL_JFD_TOTALITARIAN_HELP_2',	0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_TOTALITARIAN_TEXT_2',	24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)		
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_TOTALITARIAN_3',		'TXT_KEY_IDEAL_JFD_TOTALITARIAN_DESC_3',	'TXT_KEY_IDEAL_JFD_TOTALITARIAN_HELP_3',	0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_TOTALITARIAN_TEXT_3',	24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

--West African 
INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_WEST_AFRICAN_1',		'TXT_KEY_IDEAL_JFD_WEST_AFRICAN_DESC_1',	'TXT_KEY_IDEAL_JFD_WEST_AFRICAN_HELP_1',	0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_WEST_AFRICAN_TEXT_1',	24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_WEST_AFRICAN_2',		'TXT_KEY_IDEAL_JFD_WEST_AFRICAN_DESC_2',	'TXT_KEY_IDEAL_JFD_WEST_AFRICAN_HELP_2',	0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_WEST_AFRICAN_TEXT_2',	24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_WEST_AFRICAN_3',		'TXT_KEY_IDEAL_JFD_WEST_AFRICAN_DESC_3',	'TXT_KEY_IDEAL_JFD_WEST_AFRICAN_HELP_3',	0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_WEST_AFRICAN_TEXT_3',	24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Western 
INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_WESTERN_1',			'TXT_KEY_IDEAL_JFD_WESTERN_DESC_1',			'TXT_KEY_IDEAL_JFD_WESTERN_HELP_1',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_WESTERN_TEXT_1',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_WESTERN_2',			'TXT_KEY_IDEAL_JFD_WESTERN_DESC_2',			'TXT_KEY_IDEAL_JFD_WESTERN_HELP_2',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_WESTERN_TEXT_2',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_WESTERN_3',			'TXT_KEY_IDEAL_JFD_WESTERN_DESC_3',			'TXT_KEY_IDEAL_JFD_WESTERN_HELP_3',			0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_WESTERN_TEXT_3',			24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

--Woodlands 
INSERT INTO Policies	
		(Type,									Description,								Help,										TradeReligionModifier,						GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_WOODLANDS_1',		'TXT_KEY_IDEAL_JFD_WOODLANDS_DESC_1',		'TXT_KEY_IDEAL_JFD_WOODLANDS_HELP_1',		33,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_WOODLANDS_TEXT_1',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_WOODLANDS_2',		'TXT_KEY_IDEAL_JFD_WOODLANDS_DESC_2',		'TXT_KEY_IDEAL_JFD_WOODLANDS_HELP_2',		0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_WOODLANDS_TEXT_2',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO Policies	
		(Type,									Description,								Help,										GreatGeneralRateModifier,					GreatAdmiralRateModifier,		IsIdeal,	CultureCost,	PolicyBranchType,				Civilopedia,								PortraitIndex,	IconAtlas,			IconAtlasAchieved)
SELECT	'POLICY_IDEALS_JFD_WOODLANDS_3',		'TXT_KEY_IDEAL_JFD_WOODLANDS_DESC_3',		'TXT_KEY_IDEAL_JFD_WOODLANDS_HELP_3',		0,											0,								1,			10,				'POLICY_BRANCH_JFD_IDEALS',		'TXT_KEY_IDEAL_JFD_WOODLANDS_TEXT_3',		24,				'POLICY_ATLAS',		'POLICY_A_ATLAS'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	
------------------------------------------------------------
-- Policy_FreeBuildingWithBuildingClass
------------------------------------------------------------
INSERT INTO Policy_FreeBuildingWithBuildingClass	
		(PolicyType,						BuildingClassType,					BuildingType)
SELECT	'POLICY_IDEALS_JFD_ANDEAN_1',		'BUILDINGCLASS_MINT',				'BUILDING_JFD_ANDEAN_IDEAL_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_FreeBuildingWithBuildingClass	
		(PolicyType,						BuildingClassType,					BuildingType,					RequiresHillsOrMountains)
SELECT	'POLICY_IDEALS_JFD_ANDEAN_3',		'BUILDINGCLASS_SHRINE',				'BUILDING_JFD_ANDEAN_IDEAL_3',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_FreeBuildingWithBuildingClass	
		(PolicyType,						BuildingClassType,					BuildingType)
SELECT	'POLICY_IDEALS_JFD_CENTRAL_1',		'BUILDINGCLASS_CASTLE',				'BUILDING_JFD_CENTRAL_IDEAL_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO Policy_FreeBuildingWithBuildingClass	
		(PolicyType,						BuildingClassType,					BuildingType)
SELECT	'POLICY_IDEALS_JFD_PACIFIC_3',		'BUILDINGCLASS_MONUMENT',			'BUILDING_JFD_PACIFIC_IDEAL_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_FreeBuildingWithBuildingClass	
		(PolicyType,						BuildingClassType,					BuildingType)
SELECT	'POLICY_IDEALS_JFD_WEST_AFRICAN_1',	'BUILDINGCLASS_STONE_WORKS',		'BUILDING_JFD_WEST_AFRICAN_IDEAL_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_FreeBuildingWithPlotObject
------------------------------------------------------------
INSERT INTO Policy_FreeBuildingWithPlotObject
		(PolicyType,						BuildingType,						PlotType,			ReqsAdjacent)
SELECT	'POLICY_IDEALS_JFD_SEMITIC_3',		'BUILDING_JFD_SEMITIC_IDEAL_3',		'PLOT_MOUNTAIN',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_FreeBuildingWithWLTKD
------------------------------------------------------------
INSERT INTO Policy_FreeBuildingWithWLTKD	
		(PolicyType,						BuildingType)
SELECT	'POLICY_IDEALS_JFD_TOTALITARIAN_3',	'BUILDING_JFD_TOTALITARIAN_IDEAL_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_FreeBuildingClassWithBuildingClass
------------------------------------------------------------
INSERT INTO Policy_FreeBuildingClassWithBuildingClass	
		(PolicyType,						BuildingClassTypeReq,			BuildingClassType)
SELECT	'POLICY_IDEALS_JFD_IRANIAN_3',		'BUILDINGCLASS_AQUEDUCT',		'BUILDINGCLASS_GARDEN'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_FreeBuilding
------------------------------------------------------------
INSERT INTO Policy_FreeBuilding	
		(PolicyType,						BuildingClassType,				Count)
SELECT	'POLICY_IDEALS_JFD_WEST_AFRICAN_1',	'BUILDINGCLASS_STONE_WORKS',	2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_BuildingClassProductionModifiers
------------------------------------------------------------
INSERT INTO Policy_BuildingClassProductionModifiers	
		(PolicyType,						BuildingClassType,		ProductionModifier)
SELECT	'POLICY_IDEALS_JFD_TOTALITARIAN_2',	Type,					50
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_CONSTABLE', 'BUILDINGCLASS_POLICE_STATION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)		
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassProductionModifiers	
		(PolicyType,						BuildingClassType,		ProductionModifier)
SELECT	'POLICY_IDEALS_JFD_WESTERN_2',		Type,					33
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_FACTORY', 'BUILDINGCLASS_JFD_BLAST_FURNACE', 'BUILDINGCLASS_JFD_COAL_PLANT', 'BUILDINGCLASS_JFD_OIL_REFINERY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_UnitClassProductionModifiers
------------------------------------------------------------
INSERT INTO Policy_UnitClassProductionModifiers	
		(PolicyType,						UnitClassType,			ProductionModifier)
SELECT	'POLICY_IDEALS_JFD_EAST_INDIES_3',	'UNITCLASS_CARGO_SHIP',	50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_UnitClassProductionModifiers	
		(PolicyType,						UnitClassType,			ProductionModifier)
SELECT	'POLICY_IDEALS_JFD_PACIFIC_1',		'UNITCLASS_WORKBOAT',	50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_GoldenAgeYieldMod
------------------------------------------------------------
INSERT INTO Policy_GoldenAgeYieldMod
		(PolicyType,						YieldType,					Yield)
SELECT	'POLICY_IDEALS_JFD_ORIENTAL_3',		'YIELD_JFD_SOVEREIGNTY',	10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_BuildingClassGreatPeoplePointsChange
------------------------------------------------------------
INSERT INTO Policy_BuildingClassGreatPeoplePointsChange	
		(PolicyType,						BuildingClassType,			SpecialistType,				PointsChange)
SELECT	'POLICY_IDEALS_JFD_MESOAMERICAN_1',	'BUILDINGCLASS_TEMPLE',		'SPECIALIST_JFD_MONK',		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);		
------------------------------------------------------------
-- Policy_BuildingClassYieldChanges
------------------------------------------------------------
INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,			YieldType,					YieldChange)
SELECT	'POLICY_IDEALS_JFD_ANDEAN_2',		'BUILDINGCLASS_PALACE',		'YIELD_GOLDEN_AGE_POINTS',	10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,			YieldType,					YieldChange)
SELECT	'POLICY_IDEALS_JFD_BANTU_3',		Type,						'YIELD_DEFENSE',			3
FROM BuildingClasses WHERE MaxGlobalInstances = 1
AND Type IN (SELECT BuildingClass FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era IN ('ERA_ANCIENT', 'ERA_CLASSICAL', 'ERA_MEDIEVAL')))
AND EXISTS (SELECT Type FROM Yields WHERE Type = 'YIELD_DEFENSE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

CREATE TRIGGER JFD_SD_Ideals_BuildingClassYieldChanges
AFTER INSERT ON BuildingClasses 
WHEN NEW.MaxGlobalInstances = 1
AND NEW.Type IN (SELECT BuildingClass FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era IN ('ERA_ANCIENT', 'ERA_CLASSICAL', 'ERA_MEDIEVAL')))
AND EXISTS (SELECT Type FROM Yields WHERE Type = 'YIELD_DEFENSE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
BEGIN
	INSERT INTO Policy_BuildingClassYieldChanges
			(PolicyType,					BuildingClassType, 			YieldType,					YieldChange)
	VALUES	('POLICY_IDEALS_JFD_BANTU_3',	NEW.Type,					'YIELD_DEFENSE',			3);
END;

INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,			YieldType,					YieldChange)
SELECT	'POLICY_IDEALS_JFD_CLASSICAL_1',	Type,						'YIELD_JFD_DEVELOPMENT',	4
FROM BuildingClasses WHERE MaxPlayerInstances = 1
AND Type IN (SELECT BuildingClass FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era IN ('ERA_ANCIENT', 'ERA_CLASSICAL')))
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

CREATE TRIGGER JFD_SD_Ideals_BuildingClassYieldChanges2
AFTER INSERT ON BuildingClasses 
WHEN NEW.MaxPlayerInstances = 1
AND NEW.Type IN (SELECT BuildingClass FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era IN ('ERA_ANCIENT', 'ERA_CLASSICAL')))
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
BEGIN
	INSERT INTO Policy_BuildingClassYieldChanges
			(PolicyType,						BuildingClassType, 		YieldType,						YieldChange)
	VALUES	('POLICY_IDEALS_JFD_CLASSICAL_1', 	NEW.Type,				'YIELD_JFD_DEVELOPMENT',		4);
END;

INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,			YieldType,						YieldChange)
SELECT	'POLICY_IDEALS_JFD_CENTRAL_1',		'BUILDINGCLASS_CASTLE',		'YIELD_GREAT_GENERAL_POINTS',	2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,			YieldType,					YieldChange)
SELECT	'POLICY_IDEALS_JFD_HIMALAYAN_3',	'BUILDINGCLASS_MONASTERY',	'YIELD_FAITH',				2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);	

INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,			YieldType,					YieldChange)
SELECT	'POLICY_IDEALS_JFD_HIMALAYAN_3',	'BUILDINGCLASS_MONASTERY',	'YIELD_JFD_DEVELOPMENT',	2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);	

INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,			YieldType,					YieldChange)
SELECT	'POLICY_IDEALS_JFD_IRANIAN_3',		'BUILDINGCLASS_AQUEDUCT',	'YIELD_FOOD',				2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,			YieldType,					YieldChange)
SELECT	'POLICY_IDEALS_JFD_MESOAMERICAN_1',	'BUILDINGCLASS_TEMPLE',		'YIELD_SCIENCE',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);		

INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,			YieldType,					YieldChange)
SELECT	'POLICY_IDEALS_JFD_MESOPOTAMIC_1',	Type,						'YIELD_FAITH',				2
FROM BuildingClasses WHERE MaxGlobalInstances = 1
AND Type IN (SELECT BuildingClass FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_ANCIENT'))
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,			YieldType,					YieldChange)
SELECT	'POLICY_IDEALS_JFD_MESOPOTAMIC_1',	Type,						'YIELD_GOLD',				2
FROM BuildingClasses WHERE MaxGlobalInstances = 1
AND Type IN (SELECT BuildingClass FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_ANCIENT'))
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,			YieldType,					YieldChange)
SELECT	'POLICY_IDEALS_JFD_MESOPOTAMIC_1',	Type,						'YIELD_TOURISM',			2
FROM BuildingClasses WHERE MaxGlobalInstances = 1
AND Type IN (SELECT BuildingClass FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_ANCIENT'))
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,			YieldType,					YieldChange)
SELECT	'POLICY_IDEALS_JFD_MESOPOTAMIC_1',	Type,						'YIELD_CULTURE',			2
FROM BuildingClasses WHERE MaxGlobalInstances = 1
AND Type IN (SELECT BuildingClass FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_ANCIENT'))
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

CREATE TRIGGER JFD_SD_Ideals_BuildingClassYieldChanges3
AFTER INSERT ON BuildingClasses 
WHEN NEW.MaxGlobalInstances = 1
AND NEW.Type IN (SELECT BuildingClass FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era = 'ERA_ANCIENT'))
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
BEGIN
	INSERT INTO Policy_BuildingClassYieldChanges
			(PolicyType,							BuildingClassType, 		YieldType,					YieldChange)
	VALUES	('POLICY_IDEALS_JFD_MESOPOTAMIC_1',		NEW.Type,				'YIELD_FAITH',				2),
			('POLICY_IDEALS_JFD_MESOPOTAMIC_1',		NEW.Type,				'YIELD_GOLD',				2),
			('POLICY_IDEALS_JFD_MESOPOTAMIC_1',		NEW.Type,				'YIELD_TOURISM',			2),
			('POLICY_IDEALS_JFD_MESOPOTAMIC_1',		NEW.Type,				'YIELD_CULTURE',			2);
END;

INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,			YieldType,					YieldChange)
SELECT	'POLICY_IDEALS_JFD_ORIENTAL_1',		Type,						'YIELD_PRODUCTION',			2
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_CISTERN', 'BUILDINGCLASS_AQUEDUCT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);	

INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,			YieldType,						YieldChange)
SELECT	'POLICY_IDEALS_JFD_PACIFIC_3',		'BUILDINGCLASS_MONUMENT',	'YIELD_GREAT_ADMIRAL_POINTS',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,			YieldType,						YieldChange)
SELECT	'POLICY_IDEALS_JFD_PACIFIC_3',		'BUILDINGCLASS_MONUMENT',	'YIELD_GREAT_GENERAL_POINTS',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,			YieldType,						YieldChange)
SELECT	'POLICY_IDEALS_JFD_POLAR_3',		Type,						'YIELD_JFD_HEALTH',				1
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_SHRINE', 'BUILDINGCLASS_TEMPLE', 'BUILDINGCLASS_MONASTERY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,			YieldType,						YieldChange)
SELECT	'POLICY_IDEALS_JFD_POLAR_3',		Type,						'YIELD_JFD_CRIME',				-1
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_SHRINE', 'BUILDINGCLASS_TEMPLE', 'BUILDINGCLASS_MONASTERY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,							YieldType,					YieldChange)
SELECT	'POLICY_IDEALS_JFD_WESTERN_1',		'BUILDINGCLASS_JFD_GOVERNORS_MANSION',		'YIELD_GOLDEN_AGE_POINTS',	4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,							YieldType,					YieldChange)
SELECT	'POLICY_IDEALS_JFD_WESTERN_1',		'BUILDINGCLASS_JFD_GOVERNORS_MANSION',		'YIELD_GOLD',				3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,							YieldType,					YieldChange)
SELECT	'POLICY_IDEALS_JFD_WESTERN_1',		'BUILDINGCLASS_JFD_GOVERNORS_MANSION',		'YIELD_SCIENCE',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges	
		(PolicyType,						BuildingClassType,							YieldType,					YieldChange)
SELECT	'POLICY_IDEALS_JFD_WEST_AFRICAN_1',	'BUILDINGCLASS_STONE_WORKS',				'YIELD_JFD_DISEASE',		-1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_BuildingClassYieldModifiers
------------------------------------------------------------
INSERT INTO Policy_BuildingClassYieldModifiers	
		(PolicyType,						BuildingClassType,				YieldType,						YieldMod)
SELECT	'POLICY_IDEALS_JFD_IRANIAN_2',		'BUILDINGCLASS_PALACE',			'YIELD_JFD_CRIME',				-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldModifiers	
		(PolicyType,						BuildingClassType,				YieldType,						YieldMod)
SELECT	'POLICY_IDEALS_JFD_IRANIAN_2',		'BUILDINGCLASS_JFD_ASSEMBLY',	'YIELD_JFD_CRIME',				-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldModifiers	
		(PolicyType,						BuildingClassType,			YieldType,							YieldMod)
SELECT	'POLICY_IDEALS_JFD_ORIENTAL_1',		Type,						'YIELD_PRODUCTION',					5
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_CISTERN', 'BUILDINGCLASS_AQUEDUCT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);	
------------------------------------------------------------
-- Policy_BuildingClassYieldModifiers
------------------------------------------------------------
INSERT INTO Policy_BuildingClassYieldModifiers	
		(PolicyType,						BuildingClassType,				YieldType,						YieldMod)
SELECT	'POLICY_IDEALS_JFD_TOTALITARIAN_2',	Type,							'YIELD_JFD_LOYALTY',			10
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_CONSTABLE', 'BUILDINGCLASS_POLICE_STATION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)		
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_BuildingClassHappiness
------------------------------------------------------------
INSERT INTO Policy_BuildingClassHappiness	
		(PolicyType,						BuildingClassType,			Happiness)
SELECT	'POLICY_IDEALS_JFD_BANTU_3',		Type,						1
FROM BuildingClasses WHERE MaxGlobalInstances = 1
AND Type IN (SELECT BuildingClass FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era IN ('ERA_ANCIENT', 'ERA_CLASSICAL', 'ERA_MEDIEVAL')))
AND EXISTS (SELECT Type FROM Yields WHERE Type = 'YIELD_DEFENSE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

CREATE TRIGGER JFD_SD_Ideals_BuildingClassHappiness
AFTER INSERT ON BuildingClasses 
WHEN NEW.MaxGlobalInstances = 1
AND NEW.Type IN (SELECT BuildingClass FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era IN ('ERA_ANCIENT', 'ERA_CLASSICAL', 'ERA_MEDIEVAL')))
AND EXISTS (SELECT Type FROM Yields WHERE Type = 'YIELD_DEFENSE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
BEGIN
	INSERT INTO Policy_BuildingClassHappiness
			(PolicyType,							BuildingClassType, 		Happiness)
	VALUES	('POLICY_IDEALS_JFD_BANTU_3',			NEW.Type,				1);
END;

INSERT INTO Policy_BuildingClassHappiness	
		(PolicyType,						BuildingClassType,				Happiness)
SELECT	'POLICY_IDEALS_JFD_CLASSICAL_1',	Type,							1
FROM BuildingClasses WHERE MaxPlayerInstances = 1
AND Type IN (SELECT BuildingClass FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era IN ('ERA_ANCIENT', 'ERA_CLASSICAL')))
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

CREATE TRIGGER JFD_SD_Ideals_BuildingClassHappiness2
AFTER INSERT ON BuildingClasses 
WHEN NEW.MaxPlayerInstances = 1
AND NEW.Type IN (SELECT BuildingClass FROM Buildings WHERE PrereqTech IN (SELECT Type FROM Technologies WHERE Era IN ('ERA_ANCIENT', 'ERA_CLASSICAL')))
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
BEGIN
	INSERT INTO Policy_BuildingClassHappiness
			(PolicyType,						BuildingClassType, 			Happiness)
	VALUES	('POLICY_IDEALS_JFD_CLASSICAL_1', 	NEW.Type,					1);
END;

INSERT INTO Policy_BuildingClassHappiness	
		(PolicyType,						BuildingClassType,				Happiness)
SELECT	'POLICY_IDEALS_JFD_HIMALAYAN_3',	'BUILDINGCLASS_MONASTERY',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);	
------------------------------------------------------------
-- Policy_UnitCombatFreeExperiences
------------------------------------------------------------
INSERT INTO Policy_UnitCombatFreeExperiences	
		(PolicyType,						UnitCombatType,					FreeExperience,		FreeExperienceInstant)
SELECT	'POLICY_IDEALS_JFD_MESOAMERICAN_2',	'UNITCOMBAT_MELEE',				10,					10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_CapitalUnitCombatFreeExperiences
------------------------------------------------------------
INSERT INTO Policy_CapitalUnitCombatFreeExperiences	
		(PolicyType,						FreeExperience)
SELECT	'POLICY_IDEALS_JFD_EAST_INDIES_1',	20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_CapitalUnitCombatFreeMoves
------------------------------------------------------------
INSERT INTO Policy_CapitalUnitCombatFreeMoves	
		(PolicyType,						FreeMoves)
SELECT	'POLICY_IDEALS_JFD_EAST_INDIES_1',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_GreatWorkYieldChanges
------------------------------------------------------------
INSERT INTO Policy_GreatWorkYieldChanges	
		(PolicyType,						YieldType,						Yield)
SELECT	'POLICY_IDEALS_JFD_HIMALAYAN_2',	'YIELD_JFD_HEALTH',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Policy_GreatWorkYieldChanges	
		(PolicyType,						YieldType,						Yield)
SELECT	'POLICY_IDEALS_JFD_HIMALAYAN_2',	'YIELD_SCIENCE',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_MusicYieldChanges
------------------------------------------------------------
INSERT INTO Policy_MusicYieldChanges	
		(PolicyType,						YieldType,						Yield)
SELECT	'POLICY_IDEALS_JFD_NORTHERN_1',		'YIELD_CULTURE',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_MusicYieldChanges	
		(PolicyType,						YieldType,						Yield)
SELECT	'POLICY_IDEALS_JFD_NORTHERN_1',		'YIELD_TOURISM',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_LitYieldChanges
------------------------------------------------------------
INSERT INTO Policy_LitYieldChanges	
		(PolicyType,						YieldType,						Yield)
SELECT	'POLICY_IDEALS_JFD_NORTHERN_1',		'YIELD_CULTURE',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_LitYieldChanges	
		(PolicyType,						YieldType,						Yield)
SELECT	'POLICY_IDEALS_JFD_NORTHERN_1',		'YIELD_TOURISM',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_ArtYieldChanges
------------------------------------------------------------
INSERT INTO Policy_ArtYieldChanges	
		(PolicyType,						YieldType,						Yield)
SELECT	'POLICY_IDEALS_JFD_SOUTHERN_2',		'YIELD_CULTURE',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_ArtYieldChanges	
		(PolicyType,						YieldType,						Yield)
SELECT	'POLICY_IDEALS_JFD_SOUTHERN_2',		'YIELD_FAITH',					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_ArtYieldChanges	
		(PolicyType,						YieldType,						Yield)
SELECT	'POLICY_IDEALS_JFD_SOUTHERN_2',		'YIELD_SCIENCE',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_ArtYieldChanges	
		(PolicyType,						YieldType,						Yield)
SELECT	'POLICY_IDEALS_JFD_SOUTHERN_2',		'YIELD_GOLDEN_AGE_POINTS',		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_FeatureYieldChanges
------------------------------------------------------------
INSERT INTO Policy_FeatureYieldChanges	
		(PolicyType,						FeatureType,		YieldType,					Yield)
SELECT	'POLICY_IDEALS_JFD_ABORIGINAL_1',	Type,				'YIELD_FAITH',				2
FROM Features WHERE (NaturalWonder = 1 OR Type IN ('FEATURE_ATOLL', 'FEATURE_OASIS'))
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_FeatureYieldChanges	
		(PolicyType,						FeatureType,		YieldType,					Yield)
SELECT	'POLICY_IDEALS_JFD_OCEANIC_2',		'FEATURE_ATOLL',	Type,						1
FROM Yields WHERE Type IN ('YIELD_CULTURE', 'YIELD_SCIENCE', 'YIELD_GOLD', 'YIELD_TOURISM', 'YIELD_FAITH')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Policy_FeatureYieldChanges	
		(PolicyType,						FeatureType,		YieldType,					Yield)
SELECT	'POLICY_IDEALS_JFD_OCEANIC_2',		'FEATURE_ATOLL',	'YIELD_JFD_DEVELOPMENT',	10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_TerrainYieldChanges
------------------------------------------------------------
INSERT INTO Policy_TerrainYieldChanges	
		(PolicyType,						TerrainType,		YieldType,					Yield)
SELECT	'POLICY_IDEALS_JFD_POLAR_1',		'TERRAIN_SNOW',		'YIELD_GOLDEN_AGE_POINTS',	2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_FreePromotions
------------------------------------------------------------
INSERT INTO Policy_FreePromotions	
		(PolicyType,						PromotionType)
SELECT	'POLICY_IDEALS_JFD_BANTU_2',		'PROMOTION_JFD_BANTU_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_FreePromotions	
		(PolicyType,						PromotionType)
SELECT	'POLICY_IDEALS_JFD_BHARATA_2',		'PROMOTION_JFD_BHARATA_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Policy_FreePromotions	
		(PolicyType,						PromotionType,							IsLevy)
SELECT	'POLICY_IDEALS_JFD_IRANIAN_1',		'PROMOTION_JFD_IRANIAN_1',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE_LEVIES' AND Value = 1);

INSERT INTO Policy_FreePromotions	
		(PolicyType,						PromotionType,							UnitClassType)
SELECT	'POLICY_IDEALS_JFD_ISLAMIC_2',		'PROMOTION_JFD_ISLAMIC_2',				'UNITCLASS_MISSIONARY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_FreePromotions	
		(PolicyType,						PromotionType,							IsAll)
SELECT	'POLICY_IDEALS_JFD_GREAT_PLAINS_2',	'PROMOTION_JFD_GREAT_PLAINS_2',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_FreePromotions	
		(PolicyType,						PromotionType,							UnitClassType)
SELECT	'POLICY_IDEALS_JFD_KATUJE_1',		'PROMOTION_JFD_KATUJE_1',				Type
FROM UnitClasses WHERE Type IN ('UNITCLASS_ARCHER', 'UNITCLASS_COMPOSITE_BOWMAN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_FreePromotions	
		(PolicyType,						PromotionType)
SELECT	'POLICY_IDEALS_JFD_KATUJE_3',		'PROMOTION_JFD_KATUJE_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_FreePromotions	
		(PolicyType,						PromotionType,							IsAllCombat)
SELECT	'POLICY_IDEALS_JFD_NORTHERN_3',		'PROMOTION_JFD_NORTHERN_3',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_FreePromotions	
		(PolicyType,						PromotionType)
SELECT	'POLICY_IDEALS_JFD_OCEANIC_1',		'PROMOTION_SUPPLY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_FreePromotions	
		(PolicyType,						PromotionType)
SELECT	'POLICY_IDEALS_JFD_OCEANIC_3',		'PROMOTION_JFD_OCEANIC_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_FreePromotions	
		(PolicyType,						PromotionType,							IsAll)
SELECT	'POLICY_IDEALS_JFD_POLAR_1',		'PROMOTION_JFD_POLAR_1',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_FreePromotions	
		(PolicyType,						PromotionType,							UnitClassType)
SELECT	'POLICY_IDEALS_JFD_POLAR_2',		'PROMOTION_JFD_POLAR_2',				Type
FROM UnitClasses WHERE Type IN ('UNITCLASS_SETTLER', 'UNITCLASS_JFD_SLAVE', 'UNITCLASS_WORKER', 'UNITCLASS_JFD_WORKER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_FreePromotions	
		(PolicyType,						PromotionType,							UnitClassType)
SELECT	'POLICY_IDEALS_JFD_SEMITIC_2',		'PROMOTION_JFD_SEMITIC_2',				'UNITCLASS_MERCHANT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_FreePromotions	
		(PolicyType,						PromotionType)
SELECT	'POLICY_IDEALS_JFD_STEPPE_1',		'PROMOTION_JFD_STEPPE_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_FreePromotions	
		(PolicyType,						PromotionType,							IsMercenary)
SELECT	'POLICY_IDEALS_JFD_SOUTHERN_1',		'PROMOTION_JFD_SOUTHERN_1',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);

INSERT INTO Policy_FreePromotions	
		(PolicyType,						PromotionType)
SELECT	'POLICY_IDEALS_JFD_WESTERN_3',		'PROMOTION_JFD_WESTERN_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_FreePromotions	
		(PolicyType,						PromotionType)
SELECT	'POLICY_IDEALS_JFD_WOODLANDS_3',	Type
FROM UnitPromotions WHERE Type IN ('PROMOTION_SCOUTING_1', 'PROMOTION_SCOUTING_2', 'PROMOTION_SCOUTING_3')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_FreePromotionUnitCombats
------------------------------------------------------------
INSERT INTO Policy_FreePromotionUnitCombats	
		(PolicyType,						PromotionType,							UnitCombatType)
SELECT	'POLICY_IDEALS_JFD_ABORIGINAL_3',	'PROMOTION_SURVIVALISM_1',				Type
FROM UnitCombatInfos WHERE Type IN ('UNITCOMBAT_MELEE', 'UNITCOMBAT_ARCHER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_FreePromotionUnitCombats	
		(PolicyType,						PromotionType,							UnitCombatType)
SELECT	'POLICY_IDEALS_JFD_ABORIGINAL_3',	'PROMOTION_SURVIVALISM_2',				Type
FROM UnitCombatInfos WHERE Type IN ('UNITCOMBAT_MELEE', 'UNITCOMBAT_ARCHER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_FreePromotionUnitCombats	
		(PolicyType,						PromotionType,							UnitCombatType)
SELECT	'POLICY_IDEALS_JFD_MESOAMERICAN_2',	'PROMOTION_JFD_MESOAMERICAN_2',			'UNITCOMBAT_MELEE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_JFD_CrimeMods
------------------------------------------------------------
INSERT INTO Policy_JFD_CrimeMods	
		(PolicyType,						CrimeType,						CrimeMod)
SELECT	'POLICY_IDEALS_JFD_SAHARAN_3',		'CRIME_JFD_SCIENCE',			-100
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Policy_JFD_CrimeMods	
		(PolicyType,						CrimeType,						SpecialistCrimeMod)
SELECT	'POLICY_IDEALS_JFD_BHARATA_1',		NULL,							-100
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);	
------------------------------------------------------------
-- Policy_JFD_InvestmentMods
------------------------------------------------------------
INSERT INTO Policy_JFD_InvestmentMods	
		(PolicyType,						YieldType,						Yield,			EraModifier)
SELECT	'POLICY_IDEALS_JFD_SAHARAN_2',		'YIELD_PRODUCTION',				20,				25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_LoyaltyMods
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Policy_JFD_LoyaltyMods	
		(PolicyType,						ReligiousCitizenRevoltSentimentMod,		ReligiousCitizenWLTKDSentimentMod)
SELECT	'POLICY_IDEALS_JFD_EASTERN_2',		25,										25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Policy_JFD_LoyaltyMods	
		(PolicyType,						PuppetLoyaltyMod)
SELECT	'POLICY_IDEALS_JFD_MESOAMERICAN_3',	10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_PietyMods
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Policy_JFD_PietyMods	
		(PolicyType,						RestingRateChange)
SELECT	'POLICY_IDEALS_JFD_SEMITIC_1',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_SovereigntyMods
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Policy_JFD_SovereigntyMods	
		(PolicyType,						ReformBranchType,					ReformCostMod)
SELECT	'POLICY_IDEALS_JFD_EASTERN_3',		'REFORM_BRANCH_JFD_GOVERNMENT',		-100
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_JFD_SovereigntyMods	
		(PolicyType,						ReformBranchType,					ReformCostMod)
SELECT	'POLICY_IDEALS_JFD_EASTERN_3',		'REFORM_BRANCH_JFD_FOREIGN',		-100
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_ReligionYieldMod
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Policy_ReligionYieldMod	
		(PolicyType,						YieldType,						Yield)
SELECT	'POLICY_IDEALS_JFD_EASTERN_2',		'YIELD_JFD_LOYALTY',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Policy_ReligionYieldMod	
		(PolicyType,						YieldType,						Yield)
SELECT	'POLICY_IDEALS_JFD_EASTERN_2',		'YIELD_FAITH',					2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_ImprovementYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_ImprovementYieldChanges	
		(PolicyType,						ImprovementType,				YieldType,						Yield)
SELECT	'POLICY_IDEALS_JFD_BANTU_2',		'IMPROVEMENT_PASTURE',			'YIELD_GREAT_GENERAL_POINTS',	2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_ImprovementYieldChanges	
		(PolicyType,						ImprovementType,				YieldType,						Yield)
SELECT	'POLICY_IDEALS_JFD_BANTU_2',		'IMPROVEMENT_PASTURE',			'YIELD_PRODUCTION',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_ImprovementYieldChanges	
		(PolicyType,						ImprovementType,				YieldType,						Yield)
SELECT	'POLICY_IDEALS_JFD_ISLAMIC_1',		ImprovementType,				YieldType,						2
FROM Improvement_Yields WHERE ImprovementType IN ('IMPROVEMENT_ACADEMY', 'IMPROVEMENT_JFD_SANATORIUM')
AND YieldType != 'YIELD_JFD_DEVELOPMENT'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_ImprovementYieldChanges	
		(PolicyType,						ImprovementType,				YieldType,						Yield)
SELECT	'POLICY_IDEALS_JFD_ISLAMIC_1',		ImprovementType,				'YIELD_GOLDEN_AGE_POINTS',		3
FROM Improvement_Yields WHERE ImprovementType IN ('IMPROVEMENT_ACADEMY', 'IMPROVEMENT_JFD_SANATORIUM')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_ImprovementYieldChanges	
		(PolicyType,						ImprovementType,				YieldType,						Yield)
SELECT	'POLICY_IDEALS_JFD_MANDALA_1',		Type,							'YIELD_FOOD',					2
FROM Improvements WHERE Type IN ('IMPROVEMENT_JFD_VILLAGE', 'IMPROVEMENT_JFD_TOWN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);

INSERT INTO Policy_ImprovementYieldChanges	
		(PolicyType,						ImprovementType,				YieldType,						Yield)
SELECT	'POLICY_IDEALS_JFD_MANDALA_1',		Type,							'YIELD_DEFENSE',				3
FROM Improvements WHERE Type IN ('IMPROVEMENT_JFD_VILLAGE', 'IMPROVEMENT_JFD_TOWN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);

INSERT INTO Policy_ImprovementYieldChanges	
		(PolicyType,						ImprovementType,				YieldType,						Yield)
SELECT	'POLICY_IDEALS_JFD_PACIFIC_1',		'IMPROVEMENT_FISHING_BOATS',	'YIELD_JFD_DEVELOPMENT',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Policy_ImprovementYieldChanges	
		(PolicyType,						ImprovementType,				YieldType,						Yield)
SELECT	'POLICY_IDEALS_JFD_PACIFIC_1',		'IMPROVEMENT_FISHING_BOATS',	'YIELD_PRODUCTION',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Policy_ImprovementYieldChanges	
		(PolicyType,						ImprovementType,				YieldType,						Yield)
SELECT	'POLICY_IDEALS_JFD_POLAR_2',		'IMPROVEMENT_CAMP',				'YIELD_FOOD',					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_ResourceYieldChanges
------------------------------------------------------------
INSERT INTO Policy_ResourceYieldChanges	
		(PolicyType,						ResourceType,				YieldType,						Yield)
SELECT	'POLICY_IDEALS_JFD_GREAT_PLAINS_1',	ResourceType,				'YIELD_CULTURE',				2
FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_CAMP'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Policy_ResourceYieldChanges	
		(PolicyType,						ResourceType,				YieldType,						Yield)
SELECT	'POLICY_IDEALS_JFD_GREAT_PLAINS_1',	ResourceType,				'YIELD_JFD_DEVELOPMENT',		10
FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_CAMP'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Policy_ResourceYieldChanges	
		(PolicyType,						ResourceType,				YieldType,						Yield)
SELECT	'POLICY_IDEALS_JFD_WEST_AFRICAN_3',	Type,						'YIELD_CULTURE',				2
FROM Resources WHERE Type IN ('RESOURCE_IRON', 'RESOURCE_COPPER', 'RESOURCE_STONE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_ResourceYieldChanges	
		(PolicyType,						ResourceType,				YieldType,						Yield)
SELECT	'POLICY_IDEALS_JFD_WEST_AFRICAN_3',	Type,						'YIELD_TOURISM',				1
FROM Resources WHERE Type IN ('RESOURCE_IRON', 'RESOURCE_COPPER', 'RESOURCE_STONE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_WLTKDYieldMod
------------------------------------------------------------
INSERT INTO Policy_WLTKDYieldMod
		(PolicyType,						YieldType,						Yield)
SELECT	'POLICY_IDEALS_JFD_EAST_INDIES_2',	'YIELD_CULTURE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_WLTKDYieldMod
		(PolicyType,						YieldType,						Yield)
SELECT	'POLICY_IDEALS_JFD_GREAT_PLAINS_3',	'YIELD_JFD_HEALTH',				15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Policy_WLTKDYieldMod
		(PolicyType,						YieldType,						Yield)
SELECT	'POLICY_IDEALS_JFD_NORTHERN_2',		'YIELD_FOOD',					10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_YieldFromBorderGrowth
------------------------------------------------------------
INSERT INTO Policy_YieldFromBorderGrowth	
		(PolicyType,						YieldType,						Yield)
SELECT	'POLICY_IDEALS_JFD_ABORIGINAL_1',	'YIELD_CULTURE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_YieldGPExpend
------------------------------------------------------------
INSERT INTO Policy_YieldGPExpend	
		(PolicyType,						YieldType,						Yield)
SELECT	'POLICY_IDEALS_JFD_CLASSICAL_2',	Type,							25
FROM Yields WHERE Type IN ('YIELD_FAITH', 'YIELD_GOLDEN_AGE_POINTS', 'YIELD_CULTURE', 'YIELD_SCIENCE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_PlotYieldChanges
------------------------------------------------------------
INSERT INTO Policy_PlotYieldChanges	
		(PolicyType,						PlotType,			YieldType,					Yield)
SELECT	'POLICY_IDEALS_JFD_HIMALAYAN_1',	'PLOT_MOUNTAIN',	'YIELD_GOLDEN_AGE_POINTS',	4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_PlotYieldChanges	
		(PolicyType,						PlotType,			YieldType,					Yield)
SELECT	'POLICY_IDEALS_JFD_HIMALAYAN_1',	'PLOT_MOUNTAIN',	'YIELD_FAITH',				2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_PlotYieldChanges	
		(PolicyType,						PlotType,			YieldType,					Yield)
SELECT	'POLICY_IDEALS_JFD_SEMITIC_3',		'PLOT_MOUNTAIN',	'YIELD_PRODUCTION',			3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_SpecialistExtraYields
------------------------------------------------------------
INSERT INTO Policy_SpecialistExtraYields	
		(PolicyType,						YieldType,										Yield)
SELECT	'POLICY_IDEALS_JFD_ORIENTAL_2',		'YIELD_GOLDEN_AGE_POINTS',						2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);	

INSERT INTO Policy_SpecialistExtraYields	
		(PolicyType,						YieldType,										Yield)
SELECT	'POLICY_IDEALS_JFD_ORIENTAL_2',		'YIELD_JFD_DEVELOPMENT',						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);	
------------------------------------------------------------
-- Policy_SpecialistYieldChanges
------------------------------------------------------------
INSERT INTO Policy_SpecialistYieldChanges
		(PolicyType,						SpecialistType,		YieldType,					Yield)
SELECT	'POLICY_IDEALS_JFD_BHARATA_1',		SpecialistType,		YieldType,					1
FROM SpecialistYields WHERE Yield > 0
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);	

INSERT INTO Policy_SpecialistYieldChanges
		(PolicyType,						SpecialistType,		YieldType,					Yield)
SELECT	'POLICY_IDEALS_JFD_BHARATA_1',		Type,				'YIELD_CULTURE',			1
FROM Specialists WHERE CulturePerTurn > 0
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);	

INSERT INTO Policy_SpecialistYieldChanges
		(PolicyType,						SpecialistType,		YieldType,					Yield)
SELECT	'POLICY_IDEALS_JFD_CENTRAL_2',		Type,				'YIELD_GOLD',				2
FROM Specialists WHERE Type IN ('SPECIALIST_JFD_DIGNITARY', 'SPECIALIST_JFD_MAGISTRATE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);	

INSERT INTO Policy_SpecialistYieldChanges
		(PolicyType,						SpecialistType,		YieldType,					Yield)
SELECT	'POLICY_IDEALS_JFD_COLONIAL_3',		Type,				'YIELD_CULTURE',			1
FROM Specialists WHERE Type IN ('SPECIALIST_ARTIST', 'SPECIALIST_MUSICIAN', 'SPECIALIST_WRITER', 'SPECIALIST_JFD_DIRECTOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);	

INSERT INTO Policy_SpecialistYieldChanges
		(PolicyType,						SpecialistType,		YieldType,					Yield)
SELECT	'POLICY_IDEALS_JFD_COLONIAL_3',		Type,				'YIELD_TOURISM',			2
FROM Specialists WHERE Type IN ('SPECIALIST_ARTIST', 'SPECIALIST_MUSICIAN', 'SPECIALIST_WRITER', 'SPECIALIST_JFD_DIRECTOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_SpecialistSentimentChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_SpecialistSentimentChanges
		(PolicyType,						SpecialistType,		WLTKDSentimentChange)
SELECT	'POLICY_IDEALS_JFD_COLONIAL_3',		Type,				1
FROM Specialists WHERE Type IN ('SPECIALIST_ARTIST', 'SPECIALIST_MUSICIAN', 'SPECIALIST_WRITER', 'SPECIALIST_JFD_DIRECTOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);	
--------------------------------------------------------------------------------------------------------------------------
-- Policy_TradeRouteYieldChange
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_TradeRouteYieldChange	
		(PolicyType,						DomainType,			YieldType,					Yield)
SELECT	'POLICY_IDEALS_JFD_WOODLANDS_1',	'DOMAIN_LAND',		'YIELD_TOURISM',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_YieldFromBirthCapital
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_YieldFromBirthCapital	
		(PolicyType,						YieldType,				Yield)
SELECT	'POLICY_IDEALS_JFD_MESOPOTAMIC_3',	'YIELD_SCIENCE',		30
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_YieldFromBirth
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_YieldFromBirth	
		(PolicyType,						YieldType,				Yield)
SELECT	'POLICY_IDEALS_JFD_PACIFIC_2',		Type,					10
FROM YieldS WHERE Type IN ('YIELD_FOOD', 'YIELD_CULTURE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_YieldFromBirth	
		(PolicyType,						YieldType,				Yield)
SELECT	'POLICY_IDEALS_JFD_WEST_AFRICAN_2',	'YIELD_FAITH',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_YieldFromConstruction
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_YieldFromConstruction	
		(PolicyType,						YieldType,				Yield)
SELECT	'POLICY_IDEALS_JFD_WOODLANDS_2',	Type,					10
FROM YieldS WHERE Type IN ('YIELD_FOOD', 'YIELD_PRODUCTION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_YieldFromBuildingClassConstructed
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_YieldFromBuildingClassConstructed	
		(PolicyType,						BuildingClassType,		YieldType,			Yield)
SELECT	'POLICY_IDEALS_JFD_MANDALA_3',		Type,					'YIELD_CULTURE',	20
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_TEMPLE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Policy_YieldFromBuildingClassConstructed	
		(PolicyType,						BuildingClassType,		YieldType,			Yield)
SELECT	'POLICY_IDEALS_JFD_MANDALA_3',		Type,					'YIELD_CULTURE',	20
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_CATHEDRAL', 'BUILDINGCLASS_PAGODA', 'BUILDINGCLASS_MOSQUE', 'BUILDINGCLASS_JFD_CHAPTER_HOUSE', 'BUILDINGCLASS_JFD_MANDIR', 'BUILDINGCLASS_JFD_SYNAGOGUE', 'BUILDINGCLASS_JFD_DAOGUAN', 'BUILDINGCLASS_JFD_ALTAR', 'BUILDINGCLASS_JFD_TORII', 'BUILDINGCLASS_JFD_GURDWARA', 'BUILDINGCLASS_JFD_CHURCH')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Policy_YieldFromBuildingClassConstructed	
		(PolicyType,						BuildingClassType,		YieldType,			Yield)
SELECT	'POLICY_IDEALS_JFD_MANDALA_3',		Type,					'YIELD_FAITH',		20
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_TEMPLE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Policy_YieldFromBuildingClassConstructed	
		(PolicyType,						BuildingClassType,		YieldType,			Yield)
SELECT	'POLICY_IDEALS_JFD_MANDALA_3',		Type,					'YIELD_FAITH',		20
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_CATHEDRAL', 'BUILDINGCLASS_PAGODA', 'BUILDINGCLASS_MOSQUE', 'BUILDINGCLASS_JFD_CHAPTER_HOUSE', 'BUILDINGCLASS_JFD_MANDIR', 'BUILDINGCLASS_JFD_SYNAGOGUE', 'BUILDINGCLASS_JFD_DAOGUAN', 'BUILDINGCLASS_JFD_ALTAR', 'BUILDINGCLASS_JFD_TORII', 'BUILDINGCLASS_JFD_GURDWARA', 'BUILDINGCLASS_JFD_CHURCH')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_YieldFromUnitPromoted
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_YieldFromUnitPromoted	
		(PolicyType,						YieldType,				Yield)
SELECT	'POLICY_IDEALS_JFD_CENTRAL_3',		'YIELD_CULTURE',		25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_Flavors
--------------------------------------------------------------------------------------------------------------------------	
--Aboriginal
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_ABORIGINAL_1',	'FLAVOR_CULTURE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_ABORIGINAL_1',	'FLAVOR_EXPANSION',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_ABORIGINAL_2',	'FLAVOR_RELIGION',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_ABORIGINAL_3',	'FLAVOR_RECON',					20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Andean
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_ANDEAN_1',		'FLAVOR_GOLD',					20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_ANDEAN_2',		'FLAVOR_CULTURE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_ANDEAN_2',		'FLAVOR_PRODUCTION',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_ANDEAN_3',		'FLAVOR_RELIGION',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Bharata
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_BANTU_1',		'FLAVOR_RELIGION',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_BANTU_2',		'FLAVOR_PRODUCTION',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_BANTU_2',		'FLAVOR_GROWTH',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_BANTU_2',		'FLAVOR_MILITARY_TRAINING',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_BANTU_3',		'FLAVOR_CITY_DEFENSE',			20
WHERE EXISTS (SELECT Type FROM Yields WHERE Type = 'YIELD_DEFENSE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);		

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_BANTU_3',		'FLAVOR_HAPPINESS',				20
WHERE EXISTS (SELECT Type FROM Yields WHERE Type = 'YIELD_DEFENSE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);			

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_BANTU_3',		'FLAVOR_WONDER',				20
WHERE EXISTS (SELECT Type FROM Yields WHERE Type = 'YIELD_DEFENSE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

--Bharata
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_BHARATA_1',		'FLAVOR_RELIGION',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)		
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);	

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_BHARATA_1',		'FLAVOR_PRODUCTION',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)		
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);	

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_BHARATA_1',		'FLAVOR_SCIENCE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)		
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);	

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_BHARATA_1',		'FLAVOR_GOLD',					10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)		
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);	

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_BHARATA_1',		'FLAVOR_CULTURE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)		
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);	

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_BHARATA_1',		'FLAVOR_GROWTH',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)		
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);	

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_BHARATA_3',		'FLAVOR_RELIGION',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Central
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_CENTRAL_1',		'FLAVOR_CITY_DEFENSE',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_CENTRAL_1',		'FLAVOR_MILITARY_TRAINING',		20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_CENTRAL_3',		'FLAVOR_OFFENSE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_CENTRAL_3',		'FLAVOR_CULTURE',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Classical
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_CLASSICAL_1',	'FLAVOR_GROWTH',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_CLASSICAL_1',	'FLAVOR_HAPPINESS',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_CLASSICAL_2',	'FLAVOR_GREAT_PEOPLE',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_CLASSICAL_3',	'FLAVOR_MILITARY_TRAINING',		20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_CLASSICAL_3',	'FLAVOR_EXPANSION',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Central
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_COLONIAL_2',		'FLAVOR_CULTURE',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_COLONIAL_2',		'FLAVOR_HAPPINESS',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_COLONIAL_2',		'FLAVOR_EXPANSION',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_COLONIAL_3',		'FLAVOR_CULTURE',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);	

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_COLONIAL_3',		'FLAVOR_HAPPINESS',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);	

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_COLONIAL_3',		'FLAVOR_GROWTH',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);	

--East Indies
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_EAST_INDIES_1',	'FLAVOR_MILITARY_TRAINING',		20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_EAST_INDIES_2',	'FLAVOR_CULTURE',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_EAST_INDIES_3',	'FLAVOR_GOLD',					10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_EAST_INDIES_3',	'FLAVOR_I_TRADE_DESTINATION',	10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_EAST_INDIES_3',	'FLAVOR_I_TRADE_ORIGIN',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Eastern
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_EASTERN_1',		'FLAVOR_EXPANSION',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_EASTERN_1',		'FLAVOR_GROWTH',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_EASTERN_2',		'FLAVOR_RELIGION',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_EASTERN_2',		'FLAVOR_HAPPINESS',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_EASTERN_2',		'FLAVOR_EXPANSION',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_EASTERN_3',		'FLAVOR_CULTURE',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_EASTERN_3',		'FLAVOR_PRODUCTION',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--Great Plains
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_GREAT_PLAINS_1',	'FLAVOR_CULTURE',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_GREAT_PLAINS_1',	'FLAVOR_GROWTH',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_GREAT_PLAINS_2',	'FLAVOR_EXPANSION',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_GREAT_PLAINS_2',	'FLAVOR_MOBILE',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_GREAT_PLAINS_3',	'FLAVOR_GROWTH',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

--Himalayan
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_HIMALAYAN_1',	'FLAVOR_CULTURE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_HIMALAYAN_1',	'FLAVOR_PRODUCTION',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_HIMALAYAN_1',	'FLAVOR_RELIGION',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_HIMALAYAN_2',	'FLAVOR_CULTURE',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);	

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_HIMALAYAN_2',	'FLAVOR_SCIENCE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);	

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_HIMALAYAN_2',	'FLAVOR_GROWTH',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);	

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_HIMALAYAN_3',	'FLAVOR_HAPPINESS',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);	

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_HIMALAYAN_3',	'FLAVOR_GROWTH',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);	

--Islamic
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_ISLAMIC_1',		'FLAVOR_GREAT_PEOPLE',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_ISLAMIC_1',		'FLAVOR_GOLD',					10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_ISLAMIC_1',		'FLAVOR_SCIENCE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_ISLAMIC_1',		'FLAVOR_GROWTH',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_ISLAMIC_1',		'FLAVOR_CULTURE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_ISLAMIC_1',		'FLAVOR_PRODUCTION',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_ISLAMIC_1',		'FLAVOR_CITY_DEFENSE',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_ISLAMIC_2',		'FLAVOR_RELIGION',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_ISLAMIC_3',		'FLAVOR_GOLD',					10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_ISLAMIC_3',		'FLAVOR_I_TRADE_DESTINATION',	10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_ISLAMIC_3',		'FLAVOR_I_TRADE_ORIGIN',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Iranian
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_IRANIAN_1',		'FLAVOR_MILITARY_TRAINING',		20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE_LEVIES' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_IRANIAN_2',		'FLAVOR_GOLD',					10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_IRANIAN_2',		'FLAVOR_SCIENCE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_IRANIAN_2',		'FLAVOR_CULTURE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_IRANIAN_2',		'FLAVOR_RELIGION',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_IRANIAN_2',		'FLAVOR_PRODUCTION',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_IRANIAN_2',		'FLAVOR_GROWTH',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_IRANIAN_3',		'FLAVOR_GROWTH',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Katuje
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_KATUJE_1',		'FLAVOR_OFFENSE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_KATUJE_1',		'FLAVOR_RANGED',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_KATUJE_2',		'FLAVOR_GOLD',					20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_KATUJE_3',		'FLAVOR_RELIGION',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_KATUJE_3',		'FLAVOR_OFFENSE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

--Mandala
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_MANDALA_1',		'FLAVOR_GROWTH',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_MANDALA_1',		'FLAVOR_CITY_DEFENSE',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_MANDALA_2',		'FLAVOR_DIPLOMACY',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_MANDALA_2',		'FLAVOR_I_TRADE_DESTINATION',	10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_MANDALA_3',		'FLAVOR_RELIGION',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_MANDALA_3',		'FLAVOR_CULTURE',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

--Mesoamerican
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_MESOAMERICAN_1',	'FLAVOR_SCIENCE',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);	

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_MESOAMERICAN_1',	'FLAVOR_RELIGION',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);	

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_MESOAMERICAN_2',	'FLAVOR_OFFENSE',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_MESOAMERICAN_3',	'FLAVOR_EXPANSION',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_MESOAMERICAN_3',	'FLAVOR_HAPPINESS',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_MESOAMERICAN_3',	'FLAVOR_PRODUCTION',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

--Mesopotamic
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_MESOPOTAMIC_1',	'FLAVOR_WONDER',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_MESOPOTAMIC_1',	'FLAVOR_CULTURE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_MESOPOTAMIC_1',	'FLAVOR_RELIGION',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_MESOPOTAMIC_1',	'FLAVOR_GOLD',					10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_MESOPOTAMIC_2',	'FLAVOR_GROWTH',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_MESOPOTAMIC_2',	'FLAVOR_HAPPINESS',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_MESOPOTAMIC_3',	'FLAVOR_GROWTH',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_MESOPOTAMIC_3',	'FLAVOR_SCIENCE',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Northern
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_NORTHERN_1',		'FLAVOR_CULTURE',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_NORTHERN_2',		'FLAVOR_GROWTH',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_NORTHERN_3',		'FLAVOR_OFFENSE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_NORTHERN_3',		'FLAVOR_MILITARY_TRAINING',		20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Oceanic
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_OCEANIC_1',		'FLAVOR_MOBILE',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_OCEANIC_2',		'FLAVOR_GROWTH',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_OCEANIC_2',		'FLAVOR_PRODUCTION',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_OCEANIC_2',		'FLAVOR_RELIGION',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_OCEANIC_2',		'FLAVOR_GOLD',					10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_OCEANIC_2',		'FLAVOR_HAPPINESS',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_OCEANIC_2',		'FLAVOR_CULTURE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_OCEANIC_3',		'FLAVOR_CULTURE',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_OCEANIC_3',		'FLAVOR_RECON',					10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Oriental
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_ORIENTAL_1',		'FLAVOR_PRODUCTION',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);	

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_ORIENTAL_2',		'FLAVOR_CULTURE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);	

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_ORIENTAL_2',		'FLAVOR_PRODUCTION',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);	

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_ORIENTAL_3',		'FLAVOR_CULTURE',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_ORIENTAL_3',		'FLAVOR_PRODUCTION',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--Pacific
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_PACIFIC_1',		'FLAVOR_PRODUCTION',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_PACIFIC_1',		'FLAVOR_GROWTH',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_PACIFIC_2',		'FLAVOR_GROWTH',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_PACIFIC_2',		'FLAVOR_CULTURE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_PACIFIC_3',		'FLAVOR_CULTURE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_PACIFIC_3',		'FLAVOR_GREAT_PEOPLE',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_PACIFIC_3',		'FLAVOR_OFFENSE',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Polar
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_POLAR_1',		'FLAVOR_GOLD',					10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_POLAR_1',		'FLAVOR_PRODUCTION',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_POLAR_1',		'FLAVOR_CULTURE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_POLAR_2',		'FLAVOR_GROWTH',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_POLAR_2',		'FLAVOR_EXPANSION',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_POLAR_3',		'FLAVOR_GROWTH',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_POLAR_3',		'FLAVOR_RELIGION',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

--Saharan
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_SAHARAN_1',		'FLAVOR_MILITARY_TRAINING',		20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_SAHARAN_2',		'FLAVOR_GOLD',					10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_SAHARAN_2',		'FLAVOR_PRODUCTION',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_SAHARAN_3',		'FLAVOR_SCIENCE',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

--Semitic
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_SEMITIC_1',		'FLAVOR_RELIGION',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_SEMITIC_2',		'FLAVOR_GOLD',					20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_SEMITIC_2',		'FLAVOR_CULTURE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_SEMITIC_2',		'FLAVOR_PRODUCTION',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_SEMITIC_3',		'FLAVOR_PRODUCTION',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Steppe
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_STEPPE_1',		'FLAVOR_MOBILE',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_STEPPE_1',		'FLAVOR_MILITARY_TRAINING',		20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_STEPPE_2',		'FLAVOR_GOLD',					10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_STEPPE_2',		'FLAVOR_I_TRADE_DESTINATION',	10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_STEPPE_2',		'FLAVOR_I_TRADE_ORIGIN',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_STEPPE_3',		'FLAVOR_EXPANSION',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Southern
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_SOUTHERN_1',		'FLAVOR_OFFENSE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_SOUTHERN_1',		'FLAVOR_MILITARY_TRAINING',		20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_SOUTHERN_1',		'FLAVOR_GOLD',					20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_SOUTHERN_2',		'FLAVOR_CULTURE',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_SOUTHERN_2',		'FLAVOR_RELIGION',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_SOUTHERN_2',		'FLAVOR_SCIENCE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_SOUTHERN_3',		'FLAVOR_RELIGION',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

--Totalitarian
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_TOTALITARIAN_1',	'FLAVOR_PRODUCTION',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_TOTALITARIAN_1',	'FLAVOR_GOLD',					20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_TOTALITARIAN_1',	'FLAVOR_I_TRADE_ORIGIN',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_TOTALITARIAN_2',	'FLAVOR_ESPIONAGE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)		
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_TOTALITARIAN_2',	'FLAVOR_HAPPINESS',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)		
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_TOTALITARIAN_3',	'FLAVOR_MILITARY_TRAINING',		20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

--West African
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_WEST_AFRICAN_1',	'FLAVOR_CITY_DEFENSE',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_WEST_AFRICAN_1',	'FLAVOR_GOLD',					10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_WEST_AFRICAN_1',	'FLAVOR_GROWTH',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_WEST_AFRICAN_2',	'FLAVOR_RELIGION',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_WEST_AFRICAN_2',	'FLAVOR_CULTURE',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Western
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_WESTERN_1',		'FLAVOR_PRODUCTION',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_WESTERN_1',		'FLAVOR_EXPANSION',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_WESTERN_2',		'FLAVOR_PRODUCTION',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_WESTERN_3',		'FLAVOR_NAVAL',					20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_WESTERN_3',		'FLAVOR_GOLD',					10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Woodlands
INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_WOODLANDS_1',	'FLAVOR_RELIGION',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_WOODLANDS_1',	'FLAVOR_CULTURE',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_WOODLANDS_1',	'FLAVOR_I_TRADE_DESTINATION',	10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_WOODLANDS_2',	'FLAVOR_GROWTH',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_WOODLANDS_2',	'FLAVOR_PRODUCTION',			10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Policy_Flavors	
		(PolicyType,						FlavorType,						Flavor)
SELECT	'POLICY_IDEALS_JFD_WOODLANDS_3',	'FLAVOR_RECON',					20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================