--==========================================================================================================================
-- POLICIES
--==========================================================================================================================
-- Policies
------------------------------------------------------------------------------------------------------------------------
DELETE FROM Policies WHERE Type IN ('POLICY_DECISIONS_OTTOMANKANUNI', 'POLICY_DECISIONS_VENETIANARSENALE', 'POLICY_DECISIONS_ESTATES_GENERAL', 'POLICY_DECISIONS_JAPANSHOGUNATE');

UPDATE Policies
SET Description = 'TXT_KEY_DECISIONS_JFD_ARABIA_PATRON_SCIENCES'
WHERE Type = 'POLICY_DECISIONS_ARABIAHOUSEOFWISDOM'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

UPDATE Policies 
SET UnitGoldMaintenanceMod = -5
WHERE Type = 'POLICY_DECISIONS_CHINAFUBINGZHI'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'SUK_DECISIONS_PIETY_RESOURCE_ADDITIONS_CLERICS' AND Value = 1);

UPDATE Policies 
SET UnitGoldMaintenanceMod = -15
WHERE Type = 'POLICY_DECISIONS_DENMARKTHING';

UPDATE Policies
SET MinorFriendshipMinimum = 5
WHERE Type = 'POLICY_DECISIONS_SIAMEMBASSIES';

UPDATE Policies
SET CityConnectionTradeRouteGoldModifier = 15
WHERE Type = 'POLICY_DECISIONS_INCANCHASQUIS';

UPDATE Policies
SET Description = 'TXT_KEY_DECISIONS_TRADEMAGISTRATE'
WHERE Type = 'POLICY_TRADEMAGISTRATE';

INSERT OR REPLACE INTO Policies 	
		(Type, 													AllowsEarlyLevies,	TRVisionBoost,	FreeTradeRoute,	GreatMusicianRateModifier,	NumExtraLevies,		TradeRouteLandDistanceModifier,	TradeRouteSeaDistanceModifier,	TradeReligionModifier,	Description)
VALUES	('POLICY_DECISIONS_JFD_FORMAL_WEIGHTS',					0,					0,				0,				0,							0,					0,								0,								0,						'TXT_KEY_DECISIONS_WEIGHTSFORMAL'),
		--Civ-specific
		('POLICY_DECISIONS_JFD_ARABIA_AMIR_AL_MUMININ',			0,					0,				0,				0,							0,					0,								0,								0,						'TXT_KEY_DECISIONS_JFD_ARABIA_AMIR_AL_MUMININ'),
		('POLICY_DECISIONS_JFD_ASSYRIA_ILKU_SERVICES',			1,					0,				0,				0,							0,					0,								0,								0,						'TXT_KEY_DECISIONS_JFD_ARABIA_AMIR_AL_MUMININ'),
		('POLICY_DECISIONS_JFD_BYZANTIUM_PORPHYROGENNETOS',		0,					0,				0,				0,							0,					0,								0,								0,						'TXT_KEY_DECISIONS_JFD_BYZANTIUM_PORPHYROGENNETOS'),
		('POLICY_DECISIONS_JFD_CELTS_TIN_TRADE',				0,					0,				0,				0,							0,					0,								25,								0,						'TXT_KEY_DECISIONS_JFD_CELTS_TIN_TRADE'),
		('POLICY_DECISIONS_JFD_CELTS_UILLEANN_PIPES',			0,					0,				0,				15,							0,					0,								0,								0,						'TXT_KEY_DECISIONS_JFD_CELTS_UILLEANN_PIPES'),
		('POLICY_DECISIONS_JFD_ETHIOPIA_SOLOMONIC_DYNASTY',		0,					0,				0,				0,							0,					0,								0,								25,						'TXT_KEY_DECISIONS_JFD_ETHIOPIA_SOLOMONIC_DYNASTY'),
		('POLICY_DECISIONS_JFD_JAPAN_CASTLE_TOWNS',				0,					0,				0,				0,							0,					0,								0,								0,						'TXT_KEY_DECISIONS_JFD_JAPAN_CASTLE_TOWNS'),
		('POLICY_DECISIONS_JFD_INDONESIA_SPICE_TRADE',			0,					0,				2,				0,							0,					0,								0,								0,						'TXT_KEY_DECISIONS_JFD_INDONESIA_SPICE_TRADE'),
		('POLICY_DECISIONS_JFD_IROQUOIS_LAW_PEACE',				0,					0,				0,				0,							0,					0,								0,								0,						'TXT_KEY_DECISIONS_JFD_IROQUOIS_LAW_OF_PEACE'),
		('POLICY_DECISIONS_JFD_MONGOLS_SILK_ROAD',				0,					1,				0,				0,							0,					50,								0,								0,						'TXT_KEY_DECISIONS_JFD_MONGOLS_SILK_ROAD'),
		('POLICY_DECISIONS_JFD_NETHERLANDS_MERCHANT_NAVY',		0,					0,				1,				0,							0,					0,								0,								0,						'TXT_KEY_DECISIONS_JFD_NETHERLANDS_MERCHANT_NAVY'),
		('POLICY_DECISIONS_JFD_NETHERLANDS_WISSELBANK',			0,					0,				0,				0,							0,					0,								0,								0,						'TXT_KEY_DECISIONS_JFD_NETHERLANDS_WISSELBANK'),
		('POLICY_DECISIONS_JFD_PORTUGAL_CASA_DA_INDIA',			0,					0,				0,				0,							0,					0,								0,								0,						'TXT_KEY_DECISIONS_JFD_PORTUGAL_CASA_DA_INDIA'),
		('POLICY_DECISIONS_JFD_POLYNESIA_RUNANGA',				0,					0,				0,				0,							0,					0,								0,								0,						'TXT_KEY_DECISIONS_JFD_POLYNESIA_RUNANGA'),
		('POLICY_DECISIONS_JFD_ROME_CONCRETE',					0,					0,				0,				0,							0,					0,								0,								0,						'TXT_KEY_DECISIONS_JFD_ROME_CONCRETE'),
		('POLICY_DECISIONS_JFD_SHOSHONE_TUKUDEKA',				0,					0,				0,				0,							0,					0,								0,								0,						'TXT_KEY_DECISIONS_JFD_SHOSHONE_TUKUDEKA'),
		('POLICY_DECISIONS_JFD_SPAIN_INQUISITION',				0,					0,				0,				0,							0,					0,								0,								0,						'TXT_KEY_DECISIONS_JFD_SPAIN_INQUISITION'),
		('POLICY_DECISIONS_JFD_SWEDEN_ORDINANCE_ALSNO',			0,					0,				0,				0,							0,					0,								0,								0,						'TXT_KEY_DECISIONS_JFD_SWEDEN_ORDINANCE_ALSNO'),
		('POLICY_DECISIONS_JFD_ZULU_AMABUTHO',					0,					0,				0,				0,							1,					0,								0,								0,						'TXT_KEY_DECISIONS_JFD_ZULU_AMABUTHO');
------------------------------------------------------------------------------------------------------------------------
-- Policy_BuildingClassYieldChanges
------------------------------------------------------------------------------------------------------------------------
DELETE FROM Policy_BuildingClassYieldChanges WHERE PolicyType = 'POLICY_DECISIONS_CHINAIMPERIALEXAM';
INSERT INTO Policy_BuildingClassYieldChanges 	
		(PolicyType, 											BuildingClassType,							YieldType,						YieldChange)
VALUES	('POLICY_DECISIONS_JFD_BYZANTIUM_PORPHYROGENNETOS',		'BUILDINGCLASS_PALACE',						'YIELD_GOLDEN_AGE_POINTS',		4),
		('POLICY_DECISIONS_JFD_JAPAN_CASTLE_TOWNS',				'BUILDINGCLASS_CASTLE',						'YIELD_DEFENSE',				3),
		('POLICY_DECISIONS_JFD_JAPAN_CASTLE_TOWNS',				'BUILDINGCLASS_CASTLE',						'YIELD_GOLD',					2),
		('POLICY_DECISIONS_JFD_ROME_CONCRETE',					'BUILDINGCLASS_STONE_WORKS',				'YIELD_CULTURE',				1),
		('POLICY_DECISIONS_JFD_ROME_CONCRETE',					'BUILDINGCLASS_STONE_WORKS',				'YIELD_PRODUCTION',				1),
		('POLICY_DECISIONS_PERSIASATRAPY',						'BUILDINGCLASS_BANK',						'YIELD_JFD_LOYALTY',			1);

INSERT INTO Policy_BuildingClassYieldChanges 	
		(PolicyType, 											BuildingClassType,							YieldType,						YieldChange)
SELECT	'POLICY_DECISIONS_ARABIAHOUSEOFWISDOM',					'BUILDINGCLASS_CARAVANSARY',				'YIELD_SCIENCE',				2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges 	
		(PolicyType, 											BuildingClassType,							YieldType,						YieldChange)
SELECT	'POLICY_DECISIONS_JFD_JAPAN_CASTLE_TOWNS',				'BUILDINGCLASS_CASTLE',						'YIELD_JFD_DEVELOPMENT',		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges 	
		(PolicyType, 											BuildingClassType,							YieldType,						YieldChange)
SELECT	'POLICY_DECISIONS_JFD_SPAIN_INQUISITION',				'BUILDINGCLASS_JFD_GRAND_INQUISITION',		'YIELD_FAITH',					2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_NATIONAL_WONDER_ADDITIONS_INQUISITION' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Policy_BuildingClassHappiness
------------------------------------------------------------------------------------------------------------------------
DELETE FROM Policy_BuildingClassHappiness WHERE PolicyType = 'POLICY_DECISIONS_PERSIASATRAPY';
------------------------------------------------------------------------------------------------------------------------
-- Policy_BuildingClassCultureChanges
------------------------------------------------------------------------------------------------------------------------
DELETE FROM Policy_BuildingClassCultureChanges WHERE PolicyType = 'POLICY_DECISIONS_AUSTRIANHOFKRIEGSRAT';
DELETE FROM Policy_BuildingClassCultureChanges WHERE PolicyType = 'POLICY_DECISIONS_CHINAIMPERIALEXAM';
------------------------------------------------------------------------------------------------------------------------
-- Policy_UnitCombatProductionModifiers
------------------------------------------------------------------------------------------------------------------------
DELETE FROM Policy_UnitCombatProductionModifiers WHERE PolicyType = 'POLICY_DECISIONS_AUSTRIANHOFKRIEGSRAT';

UPDATE Policy_UnitCombatProductionModifiers 
SET ProductionModifier = 15
WHERE PolicyType = 'POLICY_DECISIONS_CHINAFUBINGZHI';

UPDATE Policy_UnitCombatProductionModifiers 
SET ProductionModifier = 10
WHERE PolicyType = 'POLICY_DECISIONS_KOREANGUNPOWDER';

INSERT INTO Policy_UnitCombatProductionModifiers
		(PolicyType,									UnitCombatType,			ProductionModifier)
VALUES	('POLICY_DECISIONS_JFD_SWEDEN_ORDINANCE_ALSNO', 'UNITCOMBAT_MOUNTED',	10);
------------------------------------------------------------------------------------------------------------------------
-- Policy_HurryModifiers
------------------------------------------------------------------------------------------------------------------------
UPDATE Policy_HurryModifiers 
SET HurryCostModifier = -10
WHERE PolicyType = 'POLICY_DECISIONS_GERMANGUILDLAWS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_YieldModifiers
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_YieldModifiers
		(PolicyType,								YieldType,			Yield)
VALUES	('POLICY_DECISIONS_JFD_FORMAL_WEIGHTS',		'YIELD_GOLD',		20);
------------------------------------------------------------------------------------------------------------------------
-- Policy_UnitCombatFreeExperiences
------------------------------------------------------------------------------------------------------------------------
UPDATE Policy_UnitCombatFreeExperiences 
SET FreeExperience = 10
WHERE PolicyType = 'POLICY_DECISIONS_ENGLISHARMADA'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'SUK_DECISIONS_PIETY_RESOURCE_ADDITIONS_CLERICS' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_CivilizationNames
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_JFD_CivilizationNames
		(PolicyType,								CivilizationType,			ShortDescription,							Description,								Adjective)
VALUES	('POLICY_DECISIONS_AZTECFLOWERWAR',			'CIVILIZATION_AZTEC',		'TXT_KEY_CIV_JFD_TRIPLE_ALLIANCE_ADJ',		'TXT_KEY_CIV_JFD_TRIPLE_ALLIANCE_DESC',		'TXT_KEY_CIV_JFD_TRIPLE_ALLIANCE_SHORT_DESC');;
------------------------------------------------------------------------------------------------------------------------
-- Policy_BuildingClassProductionModifiers
------------------------------------------------------------------------------------------------------------------------
DELETE FROM Policy_BuildingClassProductionModifiers WHERE PolicyType = 'POLICY_DECISIONS_PERSIASATRAPY' AND BuildingClassType = 'BUILDINGCLASS_MARKET';
DELETE FROM Policy_BuildingClassProductionModifiers WHERE PolicyType = 'POLICY_DECISIONS_CHINAIMPERIALEXAM';
INSERT INTO Policy_BuildingClassProductionModifiers 	
		(PolicyType, 								BuildingClassType,				ProductionModifier)
VALUES	('POLICY_DECISIONS_JFD_ROME_CONCRETE',		'BUILDINGCLASS_STONE_WORKS',	50);
------------------------------------------------------------------------------------------------------------------------
-- Policy_BuildingClassYieldModifiers
------------------------------------------------------------------------------------------------------------------------
DELETE FROM Policy_BuildingClassYieldModifiers WHERE PolicyType = 'POLICY_DECISIONS_ARABIAHOUSEOFWISDOM'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges 				
		(PolicyType, 										BuildingClassType,							YieldType,		YieldChange)
SELECT	'POLICY_DECISIONS_JFD_PORTUGAL_CASA_DA_INDIA',		'BUILDINGCLASS_JFD_GOVERNORS_MANSION',		'YIELD_GOLD',	10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Policy_GoldenAgeYieldMod
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_GoldenAgeYieldMod 	
		(PolicyType, 										YieldType,							Yield)
VALUES	('POLICY_DECISIONS_JFD_IROQUOIS_LAW_PEACE',			'YIELD_CULTURE',					10);
------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_DevelopmentMods
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_JFD_DevelopmentMods 	
		(PolicyType, 										DistrictType,						DevelopmentDistrictMultiplier)
SELECT	'POLICY_DECISIONS_JFD_NETHERLANDS_WISSELBANK',		'BUILDINGCLASSCATEGORY_FINANCIAL',	0.1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_TalentsMods
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_JFD_TalentsMods 	
		(PolicyType, 										UnitClassType,						NumTalents)
SELECT	'POLICY_DECISIONS_CHINAIMPERIALEXAM',				'UNITCLASS_JFD_GREAT_DIGNITARY',	1	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_TALENTS_CORE' AND Value = 1);

INSERT INTO Policy_JFD_TalentsMods 	
		(PolicyType, 										UnitClassType,						NumTalents)
SELECT	'POLICY_DECISIONS_CHINAIMPERIALEXAM',				'UNITCLASS_JFD_GREAT_MAGISTRATE',	1	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_TALENTS_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_SovereigntyMods
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_JFD_SovereigntyMods
		(PolicyType,										ReformCooldownMod)
SELECT	'POLICY_DECISIONS_JFD_CODE_OF_LAWS',				-15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_JFD_SovereigntyMods
		(PolicyType,										ReformCostMod,					ReformBranchType)
SELECT	'POLICY_DECISIONS_JFD_POLYNESIA_RUNANGA',			-10,							'REFORM_BRANCH_JFD_MILITARY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Policy_ImprovementYieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_ImprovementYieldChanges 	
		(PolicyType, 										ImprovementType,				YieldType,						Yield)
VALUES	('POLICY_DECISIONS_JFD_SHOSHONE_TUKUDEKA',			'IMPROVEMENT_CAMP',				'YIELD_CULTURE',				1),
		('POLICY_DECISIONS_JFD_SHOSHONE_TUKUDEKA',			'IMPROVEMENT_CAMP',				'YIELD_FOOD',					1);
------------------------------------------------------------------------------------------------------------------------
-- Policy_SpecialistYieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_SpecialistYieldChanges 	
		(PolicyType, 										SpecialistType,					YieldType,						Yield)
SELECT	'POLICY_DECISIONS_AUSTRIANHABSBURG',				'SPECIALIST_JFD_DIGNITARY',		'YIELD_GOLDEN_AGE_POINTS',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Policy_SpecialistYieldChanges 	
		(PolicyType, 										SpecialistType,					YieldType,						Yield)
SELECT	'POLICY_DECISIONS_AUSTRIANHOFKRIEGSRAT',			'SPECIALIST_JFD_GENERAL',		'YIELD_GREAT_GENERAL_POINTS',	2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SUPPLY_SPECIALIST_ADDITIONS_GENERALS' AND Value = 1);

INSERT INTO Policy_SpecialistYieldChanges 	
		(PolicyType, 										SpecialistType,					YieldType,						Yield)
SELECT	'POLICY_DECISIONS_AUSTRIANHOFKRIEGSRAT',			'SPECIALIST_JFD_GENERAL',		'YIELD_PRODUCTION',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SUPPLY_SPECIALIST_ADDITIONS_GENERALS' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- Policy_TradeRouteYieldChange
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_TradeRouteYieldChange 	
		(PolicyType, 										YieldType,						Yield)
VALUES	('POLICY_DECISIONS_JFD_CELTS_TIN_TRADE',			'YIELD_CULTURE',				1);
--==========================================================================================================================
--==========================================================================================================================