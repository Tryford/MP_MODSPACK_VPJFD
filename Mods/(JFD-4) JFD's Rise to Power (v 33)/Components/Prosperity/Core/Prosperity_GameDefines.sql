--==========================================================================================================================	
-- CONCEPTS
--==========================================================================================================================			
-- Concepts
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Concepts 
		(Type, 							Topic,					Description, 								Summary, 								AdvisorQuestion,			Advisor,	CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_PROSPERITY',		'TXT_KEY_TOPIC_GOLD',	'TXT_KEY_JFD_PROSPERITY_HEADING1_TITLE',	'TXT_KEY_JFD_PROSPERITY_HEADING1_BODY',	'TXT_KEY_GOLD_ADV_QUEST',	'ECONOMIC', 'HEADER_GOLD'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);
--==========================================================================================================================
-- CITY EVENTS
--==========================================================================================================================
-- CityEvents
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO CityEvents
		(Type,							Description,										Help,										CityEventArt,				NumChoices,	RandomChance,	EventCooldown)
SELECT	'CITY_EVENT_JFD_MIGRATION',		'TXT_KEY_CITY_EVENT_JFD_MIGRATION_DESCRIPTION',		'TXT_KEY_CITY_EVENT_JFD_MIGRATION_HELP',	'Event_Migration.dds',		1,			-1,				25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- CityEvent_ParentEvents
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO CityEvent_ParentEvents
		(CityEventType,					CityEventChoiceType)
SELECT	'CITY_EVENT_JFD_MIGRATION',		'CITY_EVENT_JFD_MIGRATION_CHOICE_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- CityEventChoices
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO CityEventChoices
		(Type,									Description,												Help)
SELECT	'CITY_EVENT_JFD_MIGRATION_CHOICE_1',	'TXT_KEY_CITY_EVENT_JFD_MIGRATION_DESCRIPTION_CHOICE_1',	'TXT_KEY_CITY_EVENT_JFD_MIGRATION_HELP_CHOICE_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- CityEventChoice_InstantYield
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO CityEventChoice_InstantYield
		(CityEventChoiceType,					YieldType,						Yield)
SELECT	'CITY_EVENT_JFD_MIGRATION_CHOICE_3',	'YIELD_POPULATION',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);
--==========================================================================================================================	
-- PROSPERITY LEVELS
--==========================================================================================================================			
-- JFD_ProsperityLevels
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO JFD_ProsperityLevels 
		(Type, 							Description, 								Help, 										Threshold,	PolicyType)
SELECT	'PROSPERITY_JFD_AFFLUENT',		'TXT_KEY_PROSPERITY_JFD_AFFLUENT_DESC',		'TXT_KEY_PROSPERITY_JFD_AFFLUENT_HELP',		0.8,		'POLICY_JFD_PROSPERITY_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_ProsperityLevels 
		(Type, 							Description, 								Help, 										Threshold,	PolicyType)
SELECT	'PROSPERITY_JFD_BALANCED',		'TXT_KEY_PROSPERITY_JFD_BALANCED_DESC',		'TXT_KEY_PROSPERITY_JFD_BALANCED_HELP',		0.4,		'POLICY_JFD_PROSPERITY_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_ProsperityLevels 
		(Type, 							Description, 								Help, 										Threshold,	PolicyType)
SELECT	'PROSPERITY_JFD_WEAK',			'TXT_KEY_PROSPERITY_JFD_WEAK_DESC',			'TXT_KEY_PROSPERITY_JFD_WEAK_HELP',			0.1,		'POLICY_JFD_PROSPERITY_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO JFD_ProsperityLevels 
		(Type, 							Description, 								Help, 										Threshold,	PolicyType)
SELECT	'PROSPERITY_JFD_DESTITUTE',		'TXT_KEY_PROSPERITY_JFD_DESTITUTE_DESC',	'TXT_KEY_PROSPERITY_JFD_DESTITUTE_HELP',	0.0,		'POLICY_JFD_PROSPERITY_4'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);
--==========================================================================================================================
-- POLICIES
--==========================================================================================================================
-- Policies
------------------------------------------------------------	
INSERT INTO Policies
		(Type,							Description,						CityGrowthMod,	ExtraHappinessPerLuxury,	GreatPeopleRateModifier,	PlotGoldCostMod)
SELECT	'POLICY_JFD_PROSPERITY_1',		'TXT_KEY_POLICY_JFD_PROSPERITY',	0,				3,							20,							20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,							Description,						CityGrowthMod,	ExtraHappinessPerLuxury,	GreatPeopleRateModifier,	PlotGoldCostMod)
SELECT	'POLICY_JFD_PROSPERITY_2',		'TXT_KEY_POLICY_JFD_PROSPERITY',	0,				2,							0,							0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,							Description,						CityGrowthMod,	ExtraHappinessPerLuxury,	GreatPeopleRateModifier,	PlotGoldCostMod)
SELECT	'POLICY_JFD_PROSPERITY_3',		'TXT_KEY_POLICY_JFD_PROSPERITY',	20,				1,							0,							-20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO Policies
		(Type,							Description,						CityGrowthMod,	ExtraHappinessPerLuxury,	GreatPeopleRateModifier,	PlotGoldCostMod)
SELECT	'POLICY_JFD_PROSPERITY_4',		'TXT_KEY_POLICY_JFD_PROSPERITY',	0,				0,							0,							0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);
------------------------------------------------------------
-- Policy_HurryModifiers
------------------------------------------------------------	
INSERT INTO Policy_HurryModifiers
		(PolicyType,					HurryType,		HurryCostModifier)
SELECT	'POLICY_JFD_PROSPERITY_1',		'HURRY_GOLD',	20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

INSERT INTO Policy_HurryModifiers
		(PolicyType,					HurryType,		HurryCostModifier)
SELECT	'POLICY_JFD_PROSPERITY_3',		'HURRY_GOLD',	-20
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
-- RESOURCES
--==========================================================================================================================
-- Resources
------------------------------------------------------------	
UPDATE Resources
SET Happiness = 1
WHERE Happiness > 1
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);

CREATE TRIGGER JFDRTP_Prosperity_Resources
AFTER INSERT ON Resources 
WHEN NEW.Happiness > 1
BEGIN
	UPDATE Resources
	SET Happiness = 1
	WHERE Type = NEW.Type
	AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);
END;
--==========================================================================================================================
-- TECHS
--==========================================================================================================================
-- Technologies_JFD_MiscEffects
--------------------------------------------------------------------------------------------------------------------------
UPDATE Technology_TradeRouteDomainExtraRange
SET TechType = 'TECH_ASTRONOMY'
WHERE TechType = 'TECH_COMPASS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_TECH_CHANGES_SEA_TRADE_RANGE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Technologies_JFD_MiscEffects
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Technologies_JFD_MiscEffects
		(TechType,				AllowCurrencies,	EffectToolTip)
SELECT	'TECH_CURRENCY',		1,					'TXT_KEY_JFD_ALLOWS_CURRENCIES'		
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1);
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- UnitClasses
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO UnitClasses 	
		(Type)
VALUES	('UNITCLASS_JFD_NOTIFICATION');
--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 					Class,							ShowInPedia, 	Cost,	FaithCost,	Description, 					PortraitIndex,	IconAtlas)									
VALUES	('UNIT_JFD_PROSPERITY',	'UNITCLASS_JFD_NOTIFICATION',	0,				-1,		-1,			'TXT_KEY_UNIT_JFD_PROSPERITY',	0,				'JFD_PROSPERITY_NOTIFICATION_ATLAS');
--==========================================================================================================================
--==========================================================================================================================

