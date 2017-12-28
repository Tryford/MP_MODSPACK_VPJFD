--==========================================================================================================================
-- POLICIES
--==========================================================================================================================
-- Policies
------------------------------------------------------------	
INSERT INTO Policies
		(Type,							Description,						CityGrowthMod,	ExtraHappinessPerLuxury,	GreatPeopleRateModifier,	PlotGoldCostMod)
SELECT	'POLICY_JFD_PROSPERITY_1',		'TXT_KEY_POLICY_JFD_PROSPERITY',	0,				0,							0,							20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,							Description,						CityGrowthMod,	ExtraHappinessPerLuxury,	GreatPeopleRateModifier,	PlotGoldCostMod)
SELECT	'POLICY_JFD_PROSPERITY_2',		'TXT_KEY_POLICY_JFD_PROSPERITY',	0,				0,							0,							0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,							Description,						CityGrowthMod,	ExtraHappinessPerLuxury,	GreatPeopleRateModifier,	PlotGoldCostMod)
SELECT	'POLICY_JFD_PROSPERITY_3',		'TXT_KEY_POLICY_JFD_PROSPERITY',	0,				0,							0,							-20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,							Description,						CityGrowthMod,	ExtraHappinessPerLuxury,	GreatPeopleRateModifier,	PlotGoldCostMod)
SELECT	'POLICY_JFD_PROSPERITY_4',		'TXT_KEY_POLICY_JFD_PROSPERITY',	0,				0,							0,							0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_HurryModifiers
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Policy_HurryModifiers
		(PolicyType,					HurryType,		HurryCostModifier)
SELECT	'POLICY_JFD_PROSPERITY_1',		'HURRY_GOLD',	20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO Policy_HurryModifiers
		(PolicyType,					HurryType,		HurryCostModifier)
SELECT	'POLICY_JFD_PROSPERITY_3',		'HURRY_GOLD',	-20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_YieldModifiers
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Policy_YieldModifiers
		(PolicyType,					YieldType,					Yield)
SELECT	'POLICY_JFD_PROSPERITY_1',		'YIELD_GOLDEN_AGE_POINTS',	100
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO Policy_YieldModifiers
		(PolicyType,					YieldType,					Yield)
SELECT	'POLICY_JFD_PROSPERITY_2',		'YIELD_GOLDEN_AGE_POINTS',	50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO Policy_YieldModifiers
		(PolicyType,					YieldType,					Yield)
SELECT	'POLICY_JFD_PROSPERITY_3',		'YIELD_GOLDEN_AGE_POINTS',	0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_ContractModifiers
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_JFD_ContractMods
		(PolicyType,					CostMod)
SELECT	'POLICY_JFD_PROSPERITY_1',		20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type='JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO Policy_JFD_ContractMods
		(PolicyType,					CostMod)
SELECT	'POLICY_JFD_PROSPERITY_3',		-20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type='JFD_RTP_PROSPERITY_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================