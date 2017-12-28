--==========================================================================================================================
-- POLICY BRANCHES
--==========================================================================================================================
-- PolicyBranchTypes
-------------------------------------
UPDATE PolicyBranchTypes 
SET Title = 'TXT_KEY_JFD_AUTOCRACY_TITLE_EPITHET'
WHERE Type = 'POLICY_BRANCH_AUTOCRACY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 0);

UPDATE PolicyBranchTypes 
SET Title = 'TXT_KEY_JFD_AESTHETICS_TITLE_EPITHET'
WHERE Type = 'POLICY_BRANCH_AESTHETICS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 0);

UPDATE PolicyBranchTypes 
SET Title = 'TXT_KEY_JFD_COMMERCE_TITLE_EPITHET'
WHERE Type = 'POLICY_BRANCH_COMMERCE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 0);

UPDATE PolicyBranchTypes 
SET Title = 'TXT_KEY_JFD_EXPLORATION_TITLE_EPITHET'
WHERE Type = 'POLICY_BRANCH_EXPLORATION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 0);

UPDATE PolicyBranchTypes 
SET Title = 'TXT_KEY_JFD_HONOR_TITLE_EPITHET'
WHERE Type = 'POLICY_BRANCH_HONOR'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 0);

UPDATE PolicyBranchTypes 
SET Title = 'TXT_KEY_JFD_FREEDOM_TITLE_EPITHET'
WHERE Type = 'POLICY_BRANCH_FREEDOM'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 0);

UPDATE PolicyBranchTypes 
SET Title = 'TXT_KEY_JFD_LIBERTY_TITLE_EPITHET'
WHERE Type = 'POLICY_BRANCH_LIBERTY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 0);

UPDATE PolicyBranchTypes 
SET Title = 'TXT_KEY_JFD_ORDER_TITLE_EPITHET'
WHERE Type = 'POLICY_BRANCH_ORDER'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 0);

UPDATE PolicyBranchTypes 
SET Title = 'TXT_KEY_JFD_PATRONAGE_TITLE_EPITHET'
WHERE Type = 'POLICY_BRANCH_PATRONAGE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 0);

UPDATE PolicyBranchTypes 
SET Title = 'TXT_KEY_JFD_PIETY_TITLE_EPITHET'
WHERE Type = 'POLICY_BRANCH_PIETY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 0);

UPDATE PolicyBranchTypes 
SET Title = 'TXT_KEY_JFD_RATIONALISM_TITLE_EPITHET'
WHERE Type = 'POLICY_BRANCH_RATIONALISM'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 0);

UPDATE PolicyBranchTypes 
SET Title = 'TXT_KEY_JFD_TRADITION_TITLE_EPITHET'
WHERE Type = 'POLICY_BRANCH_TRADITION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 0);
--==========================================================================================================================
-- POLICIES
--==========================================================================================================================
-- Policies
-------------------------------------
INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_AFFLUENT',		'TXT_KEY_EPITHET_JFD_AFFLUENT_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_AUGUSTUS',		'TXT_KEY_EPITHET_JFD_AUGUSTUS_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_BLESSED',		'TXT_KEY_EPITHET_JFD_BLESSED_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_BELOVED',		'TXT_KEY_EPITHET_JFD_BELOVED_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_BOLD',			'TXT_KEY_EPITHET_JFD_BOLD_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_BUILDER',		'TXT_KEY_EPITHET_JFD_BUILDER_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description,									WorkerSpeedModifier)
SELECT	'POLICY_EPITHET_JFD_COMMONER',		'TXT_KEY_EPITHET_JFD_COMMONER_SHORT_DESC',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_CONQUEROR',		'TXT_KEY_EPITHET_JFD_CONQUEROR_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_CRUSADER',		'TXT_KEY_EPITHET_JFD_CRUSADER_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description,									AfraidMinorPerTurnInfluence)
SELECT	'POLICY_EPITHET_JFD_CRUEL',			'TXT_KEY_EPITHET_JFD_CRUEL_SHORT_DESC',			200
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_DIPLOMAT',		'TXT_KEY_EPITHET_JFD_DIPLOMAT_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);	

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_ENGINEERING',	'TXT_KEY_EPITHET_JFD_ENGINEERING_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description,									GoldenAgeDurationMod)
SELECT	'POLICY_EPITHET_JFD_ENLIGHTENED',	'TXT_KEY_EPITHET_JFD_ENLIGHTENED_SHORT_DESC',	15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_EXPLORER',		'TXT_KEY_EPITHET_JFD_EXPLORER_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_GREAT',			'TXT_KEY_EPITHET_JFD_GREAT_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_GREEK',			'TXT_KEY_EPITHET_JFD_GREEK_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_HEALER',		'TXT_KEY_EPITHET_JFD_HEALER_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_HOLY',			'TXT_KEY_EPITHET_JFD_HOLY_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_JUST',			'TXT_KEY_EPITHET_JFD_JUST_SHORT_DESC'
WHERE EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_LAWGIVER',		'TXT_KEY_EPITHET_JFD_LAWGIVER_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description,									MinorFriendshipMinimum)
SELECT	'POLICY_EPITHET_JFD_LIBERATOR',		'TXT_KEY_EPITHET_JFD_LIBERATOR_SHORT_DESC',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description,									ConversionModifier)
SELECT	'POLICY_EPITHET_JFD_LIONHEART',		'TXT_KEY_EPITHET_JFD_LIONHEART_SHORT_DESC',		-20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description,									PlotGoldCostMod)
SELECT	'POLICY_EPITHET_JFD_MAGNANIMOUS',	'TXT_KEY_EPITHET_JFD_MAGNANIMOUS_SHORT_DESC',	-20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_MAGNIFICENT',	'TXT_KEY_EPITHET_JFD_MAGNIFICENT_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_MAHARAJ',		'TXT_KEY_EPITHET_JFD_MAHARAJ_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_MERCENARY',		'TXT_KEY_EPITHET_JFD_MERCENARY_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_MONK',			'TXT_KEY_EPITHET_JFD_MONK_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_NAVIGATOR',		'TXT_KEY_EPITHET_JFD_NAVIGATOR_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_NOBLE',			'TXT_KEY_EPITHET_JFD_NOBLE_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description,									PolicyCostModifier)
SELECT	'POLICY_EPITHET_JFD_PHILOSOPHER',	'TXT_KEY_EPITHET_JFD_PHILOSOPHER_SHORT_DESC',	-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_PIOUS',			'TXT_KEY_EPITHET_JFD_PIOUS_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_REDEEMER',		'TXT_KEY_EPITHET_JFD_REDEEMER_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_REFORMER',		'TXT_KEY_EPITHET_JFD_REFORMER_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);	

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_SCHOLAR',		'TXT_KEY_EPITHET_JFD_SCHOLAR_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_SLAVER',		'TXT_KEY_EPITHET_JFD_SLAVER_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);	

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_SLAYER',		'TXT_KEY_EPITHET_JFD_SLAYER_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_SOLDIER',		'TXT_KEY_EPITHET_JFD_SOLDIER_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE_LEVIES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);	

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_SUN_KING',		'TXT_KEY_EPITHET_JFD_SUN_KING_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_VERSAILLES' OR Type = 'BUILDING_JFD_VERSAILLES');

INSERT INTO Policies
		(Type,								Description,									RazingSpeedBonus)
SELECT	'POLICY_EPITHET_JFD_TERRIBLE',		'TXT_KEY_EPITHET_JFD_TERRIBLE_SHORT_DESC',		15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_WISE',			'TXT_KEY_EPITHET_JFD_WISE_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_EPITHET_JFD_ZEALOT',		'TXT_KEY_EPITHET_JFD_ZEALOT_SHORT_DESC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);
-------------------------------------
-- Policy_YieldFromBarbarianKills
-------------------------------------
INSERT INTO Policy_YieldFromBarbarianKills
		(PolicyType,							YieldType,					Yield)
SELECT	'POLICY_EPITHET_JFD_SLAYER',			'YIELD_GOLDEN_AGE_POINTS',	100
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);	
-------------------------------------
-- Policy_JFD_PietyMods
-------------------------------------
INSERT INTO Policy_JFD_PietyMods
		(PolicyType,							PietyYieldMod)
SELECT	'POLICY_EPITHET_JFD_PIOUS',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);	
-------------------------------------
-- Policy_JFD_ProvinceMods
-------------------------------------
INSERT INTO Policy_JFD_ProvinceMods
		(PolicyType,							LevyFreeExperience)
SELECT	'POLICY_EPITHET_JFD_SOLDIER',			15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE_LEVIES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);	
-------------------------------------
-- Policy_JFD_SlaveryMods
-------------------------------------
INSERT INTO Policy_JFD_SlaveryMods
		(PolicyType,							BarbarianMod,		CaptureMod,		EncampmentMod,		TradeRouteMod)
SELECT	'POLICY_EPITHET_JFD_SLAVER',			15,					15,				15,					15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);	
-------------------------------------
-- Policy_SpecialistYieldChanges
-------------------------------------
INSERT INTO Policy_SpecialistYieldChanges
		(PolicyType,							SpecialistType,			YieldType,			Yield)
SELECT	'POLICY_EPITHET_JFD_JUST',				Type,					'YIELD_PRODUCTION', 1
FROM Specialists WHERE Type = 'SPECIALIST_JFD_MAGISTRATE'
AND EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policy_SpecialistYieldChanges
		(PolicyType,							SpecialistType,			YieldType,			Yield)
SELECT	'POLICY_EPITHET_JFD_NOBLE',				Type,					'YIELD_CULTURE',	1
FROM Specialists WHERE Type = 'SPECIALIST_JFD_DIGNITARY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);
-------------------------------------
-- Policy_BuildingClassProductionModifiers
-------------------------------------
INSERT INTO Policy_BuildingClassProductionModifiers
		(PolicyType,							BuildingClassType,		ProductionModifier)
SELECT	'POLICY_EPITHET_JFD_SCHOLAR',			Type,					10
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_LIBRARY', 'BUILDINGCLASS_UNIVERSITY', 'BUILDINGCLASS_PUBLIC_SCHOOL')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);
-------------------------------------
-- Policy_BuildingClassHappiness
-------------------------------------
INSERT INTO Policy_BuildingClassHappiness
		(PolicyType,							BuildingClassType,		Happiness)
SELECT	'POLICY_EPITHET_JFD_BELOVED',			'BUILDINGCLASS_PALACE',	2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);
-------------------------------------
-- Policy_BuildingClassYieldChanges
-------------------------------------
INSERT INTO Policy_BuildingClassYieldChanges
		(PolicyType,							BuildingClassType,		YieldType,				YieldChange)
SELECT	'POLICY_EPITHET_JFD_AUGUSTUS',			Type,					'YIELD_PRODUCTION',		1
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_CIRCUS_MAXIMUS', 'BUILDINGCLASS_HEROIC_EPIC', 'BUILDINGCLASS_NATIONAL_EPIC', 'BUILDINGCLASS_NATIONAL_COLLEGE', 'BUILDINGCLASS_GRAND_TEMPLE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges
		(PolicyType,							BuildingClassType,		YieldType,					YieldChange)
SELECT	'POLICY_EPITHET_JFD_BUILDER',			Type,					'YIELD_TOURISM',			1
FROM BuildingClasses WHERE MaxGlobalInstances = 1
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges
		(PolicyType,							BuildingClassType,			YieldType,					YieldChange)
SELECT	'POLICY_EPITHET_JFD_CONQUEROR',			'BUILDINGCLASS_COURTHOUSE',	'YIELD_GOLDEN_AGE_POINTS',	2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

CREATE TRIGGER JFDRTP_Epithets_Policy_BuildingClassYieldChanges
AFTER INSERT ON BuildingClasses
WHEN NEW.MaxGlobalInstances = 1
BEGIN
	INSERT INTO Policy_BuildingClassYieldChanges
			(PolicyType,						BuildingClassType,		YieldType,				YieldChange)
	SELECT	'POLICY_EPITHET_JFD_BUILDER',		Type,					'YIELD_TOURISM',		1
	FROM BuildingClasses WHERE Type = NEW.Type
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);
END;

INSERT INTO Policy_BuildingClassYieldChanges
		(PolicyType,							BuildingClassType,		YieldType,				YieldChange)
SELECT	'POLICY_EPITHET_JFD_GREEK',				Type,					'YIELD_SCIENCE',		1
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_TEMPLE_ARTEMIS', 'BUILDINGCLASS_STATUE_ZEUS', 'BUILDINGCLASS_GREAT_LIBRARY', 'BUILDINGCLASS_GREAT_LIGHTHOUSE', 'BUILDINGCLASS_ORACLE', 'BUILDINGCLASS_PARTHENON')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges
		(PolicyType,							BuildingClassType,		YieldType,				YieldChange)
SELECT	'POLICY_EPITHET_JFD_LAWGIVER',			Type,					'YIELD_CULTURE',		1
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_MAGISTRATE_COURT', 'BUILDINGCLASS_JFD_HIGH_COURT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges
		(PolicyType,							BuildingClassType,		YieldType,				YieldChange)
SELECT	'POLICY_EPITHET_JFD_HOLY',				'BUILDINGCLASS_PALACE',	'YIELD_FAITH',			4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges
		(PolicyType,							BuildingClassType,		YieldType,				YieldChange)
SELECT	'POLICY_EPITHET_JFD_MAHARAJ',			Type,					'YIELD_GOLD',			1
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_BOROBUDUR', 'BUILDINGCLASS_ANGKOR_WAT', 'BUILDINGCLASS_TAJ_MAHAL', 'BUILDINGCLASS_WAT_PHRA_KAEW', 'BUILDINGCLASS_RED_FORT', 'BUILDING_JFD_BUDDHAS_BAMIYAN', 'BUILDING_JFD_TODAI')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges
		(PolicyType,							BuildingClassType,		YieldType,				YieldChange)
SELECT	'POLICY_EPITHET_JFD_MAHARAJ',			Type,					'YIELD_FAITH',			1
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_BOROBUDUR', 'BUILDINGCLASS_ANGKOR_WAT', 'BUILDINGCLASS_TAJ_MAHAL', 'BUILDINGCLASS_WAT_PHRA_KAEW', 'BUILDINGCLASS_RED_FORT', 'BUILDING_JFD_BUDDHAS_BAMIYAN', 'BUILDING_JFD_TODAI')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges
		(PolicyType,							BuildingClassType,		YieldType,				YieldChange)
SELECT	'POLICY_EPITHET_JFD_MONK',				Type,					'YIELD_FAITH',			2
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_MONASTERY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_JFD_HealthMods
------------------------------------------------------------	
INSERT INTO Policy_JFD_HealthMods
		(PolicyType,							PlagueMod)
SELECT	'POLICY_EPITHET_JFD_HEALER',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_JFD_PietyMods
------------------------------------------------------------
INSERT INTO Policy_JFD_PietyMods
		(PolicyType,							PietyYieldMod,		IsEpithet)
SELECT	'POLICY_EPITHET_JFD_CRUSADER',			10,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policy_JFD_PietyMods
		(PolicyType,							PietyYieldMod,		IsEpithet)
SELECT	'POLICY_EPITHET_JFD_REDEEMER',			10,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);
-------------------------------------
-- Policy_FeatureYieldChanges
-------------------------------------
INSERT INTO Policy_FeatureYieldChanges
		(PolicyType,							FeatureType,		YieldType,			Yield)
SELECT	'POLICY_EPITHET_JFD_EXPLORER',			Type,				'YIELD_TOURISM',	2
FROM Features WHERE NaturalWonder = 1
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);
-------------------------------------
-- Policy_GoldenAgeYieldMod
-------------------------------------
INSERT INTO Policy_GoldenAgeYieldMod
		(PolicyType,							YieldType,			Yield)
SELECT	'POLICY_EPITHET_JFD_SUN_KING',			'YIELD_CULTURE',	10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)		
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_VERSAILLES' OR Type = 'BUILDING_JFD_VERSAILLES');		
-------------------------------------
-- Policy_GoldenAgeGreatPersonRateModifier
-------------------------------------
INSERT INTO Policy_GoldenAgeGreatPersonRateModifier
		(PolicyType,							GreatPersonType,	Modifier)
SELECT	'POLICY_EPITHET_JFD_MAGNIFICENT',		Type,				10
FROM GreatPersons WHERE Specialist IS NOT NULL
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

CREATE TRIGGER JFDRTP_Epithets_Policy_GoldenAgeGreatPersonRateModifier
AFTER INSERT ON GreatPersons
BEGIN
	INSERT INTO Policy_GoldenAgeGreatPersonRateModifier
			(PolicyType,						GreatPersonType,	Modifier)
	SELECT	'POLICY_EPITHET_JFD_MAGNIFICENT',	Type,				10
	FROM GreatPersons WHERE Type = NEW.Type AND Specialist IS NOT NULL
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);
END;
-------------------------------------
-- Policy_ImprovementYieldChanges
-------------------------------------
INSERT INTO Policy_ImprovementYieldChanges
		(PolicyType,						ImprovementType,				YieldType,			Yield)
SELECT	'POLICY_EPITHET_JFD_AFFLUENT',		'IMPROVEMENT_CUSTOMS_HOUSE',	'YIELD_GOLD',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policy_ImprovementYieldChanges
		(PolicyType,						ImprovementType,				YieldType,			Yield)
SELECT	'POLICY_EPITHET_JFD_BLESSED',		'IMPROVEMENT_HOLY_SITE',		'YIELD_FAITH',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policy_ImprovementYieldChanges
		(PolicyType,						ImprovementType,				YieldType,			Yield)
SELECT	'POLICY_EPITHET_JFD_ENGINEERING',	'IMPROVEMENT_MANUFACTORY',		'YIELD_PRODUCTION',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policy_ImprovementYieldChanges
		(PolicyType,						ImprovementType,				YieldType,			Yield)
SELECT	'POLICY_EPITHET_JFD_WISE',			'IMPROVEMENT_ACADEMY',			'YIELD_SCIENCE',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);
-------------------------------------
-- Policy_JFD_ContractMods
-------------------------------------
INSERT INTO Policy_JFD_ContractMods
		(PolicyType,						MaintenanceMod)
SELECT	'POLICY_EPITHET_JFD_MERCENARY',		-15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);
-------------------------------------
-- Policy_FreePromotions
-------------------------------------
INSERT INTO Policy_FreePromotions
		(PolicyType,						PromotionType)
SELECT	'POLICY_EPITHET_JFD_BOLD',			'PROMOTION_JFD_BOLD'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policy_FreePromotions
		(PolicyType,						PromotionType)
SELECT	'POLICY_EPITHET_JFD_GREAT',			'PROMOTION_JFD_GREAT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policy_FreePromotions
		(PolicyType,						PromotionType)
SELECT	'POLICY_EPITHET_JFD_NAVIGATOR',		'PROMOTION_JFD_NAVIGATOR'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Policy_FreePromotions
		(PolicyType,						PromotionType)
SELECT	'POLICY_EPITHET_JFD_ZEALOT',		'PROMOTION_JFD_ZEALOT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);
--========================================================================================================================================================================
--========================================================================================================================================================================