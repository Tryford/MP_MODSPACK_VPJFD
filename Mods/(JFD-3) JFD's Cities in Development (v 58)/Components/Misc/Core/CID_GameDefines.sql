--==========================================================================================================================		
-- CONCEPTS
--==========================================================================================================================	
-- Concepts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Concepts	
		(Type, 									Topic,												Description,										Summary,											Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_COLONIES',					'TXT_KEY_JFD_COLONIES_HEADING1_TITLE',				'TXT_KEY_JFD_COLONIES_HEADING1_TITLE',				'TXT_KEY_JFD_COLONIES_HEADING1_BODY',				'ECONOMIC',		'HEADER_CID'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,												Description,										Summary,											Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_COLONIES_FORT',			'TXT_KEY_JFD_COLONIES_FORT_HEADING1_TITLE',			'TXT_KEY_JFD_COLONIES_FORT_HEADING1_TITLE',			'TXT_KEY_JFD_COLONIES_FORT_HEADING1_BODY',			'ECONOMIC',		'HEADER_CID'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE_FORT_COLONIES' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,												Description,										Summary,											Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_CRIME',					'TXT_KEY_JFD_CRIME_HEADING1_TITLE',					'TXT_KEY_JFD_CRIME_HEADING1_TITLE',					'TXT_KEY_JFD_CRIME_HEADING1_BODY',					'ECONOMIC',		'HEADER_CID'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,												Description,										Summary,											Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_CRIME_COUNTERACTION',		'TXT_KEY_JFD_CRIME_COUNTERACTION_HEADING1_TITLE',	'TXT_KEY_JFD_CRIME_COUNTERACTION_HEADING1_TITLE',	'TXT_KEY_JFD_CRIME_COUNTERACTION_HEADING1_BODY',	'ECONOMIC',		'HEADER_CID'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,												Description,										Summary,											Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_CRIME_ORGANIZED',			'TXT_KEY_JFD_CRIME_ORGANIZED_HEADING1_TITLE',		'TXT_KEY_JFD_CRIME_ORGANIZED_HEADING1_TITLE',		'TXT_KEY_JFD_CRIME_ORGANIZED_HEADING1_BODY',		'ECONOMIC',		'HEADER_CID'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,												Description,										Summary,											Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_DEVELOPMENT',				'TXT_KEY_JFD_DEVELOPMENT_HEADING1_TITLE',			'TXT_KEY_JFD_DEVELOPMENT_HEADING1_TITLE',			'TXT_KEY_JFD_DEVELOPMENT_HEADING1_BODY',			'ECONOMIC',		'HEADER_CID'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,												Description,										Summary,											Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_DEVELOPMENT_INCREASE',		'TXT_KEY_JFD_DEVELOPMENT_INCREASE_HEADING1_TITLE',	'TXT_KEY_JFD_DEVELOPMENT_INCREASE_HEADING1_TITLE',	'TXT_KEY_JFD_DEVELOPMENT_INCREASE_HEADING1_BODY',	'ECONOMIC',		'HEADER_CID'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,												Description,										Summary,											Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_HAPPINESS',				'TXT_KEY_JFD_HAPPINESS_HEADING1_TITLE',				'TXT_KEY_JFD_HAPPINESS_HEADING1_TITLE',				'TXT_KEY_JFD_HAPPINESS_HEADING1_BODY',				'ECONOMIC',		'HEADER_CID'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HAPPINESS_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,												Description,										Summary,											Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_HAPPINESS_INCREASE',		'TXT_KEY_JFD_HAPPINESS_INCREASE_HEADING1_TITLE',	'TXT_KEY_JFD_HAPPINESS_INCREASE_HEADING1_TITLE',	'TXT_KEY_JFD_HAPPINESS_INCREASE_HEADING1_BODY',		'ECONOMIC',		'HEADER_CID'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HAPPINESS_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,												Description,										Summary,											Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_HAPPINESS_RESISTANCE',		'TXT_KEY_JFD_HAPPINESS_RESISTANCE_HEADING1_TITLE',	'TXT_KEY_JFD_HAPPINESS_RESISTANCE_HEADING1_TITLE',	'TXT_KEY_JFD_HAPPINESS_RESISTANCE_HEADING1_BODY',	'ECONOMIC',		'HEADER_CID'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HAPPINESS_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,												Description,										Summary,											Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_HEALTH',					'TXT_KEY_JFD_HEALTH_HEADING1_TITLE',				'TXT_KEY_JFD_HEALTH_HEADING1_TITLE',				'TXT_KEY_JFD_HEALTH_HEADING1_BODY',					'ECONOMIC',		'HEADER_CID'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,												Description,										Summary,											Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_HEALTH_INCREASE',			'TXT_KEY_JFD_HEALTH_INCREASE_HEADING1_TITLE',		'TXT_KEY_JFD_HEALTH_INCREASE_HEADING1_TITLE',		'TXT_KEY_JFD_HEALTH_INCREASE_HEADING1_BODY',		'ECONOMIC',		'HEADER_CID'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,												Description,										Summary,											Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_HEALTH_PLAGUE',			'TXT_KEY_JFD_HEALTH_PLAGUE_HEADING1_TITLE',			'TXT_KEY_JFD_HEALTH_PLAGUE_HEADING1_TITLE',			'TXT_KEY_JFD_HEALTH_PLAGUE_HEADING1_BODY',			'ECONOMIC',		'HEADER_CID'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,												Description,										Summary,											Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_INVESTMENTS',				'TXT_KEY_JFD_INVESTMENTS_HEADING1_TITLE',			'TXT_KEY_JFD_INVESTMENTS_HEADING1_TITLE',			'TXT_KEY_JFD_INVESTMENTS_HEADING1_BODY',			'ECONOMIC',		'HEADER_CID'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,												Description,										Summary,											Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_LOYALTY',					'TXT_KEY_JFD_LOYALTY_HEADING1_TITLE',				'TXT_KEY_JFD_LOYALTY_HEADING1_TITLE',				'TXT_KEY_JFD_LOYALTY_HEADING1_BODY',				'ECONOMIC',		'HEADER_CID'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,												Description,										Summary,											Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_LOYALTY_INCREASING',		'TXT_KEY_JFD_LOYALTY_INCREASING_HEADING1_TITLE',	'TXT_KEY_JFD_LOYALTY_INCREASING_HEADING1_TITLE',	'TXT_KEY_JFD_LOYALTY_INCREASING_HEADING1_BODY',		'ECONOMIC',		'HEADER_CID'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,												Description,										Summary,											Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_MISC_BUILD_CHARGES',		'TXT_KEY_JFD_MISC_BUILD_CHARGES_HEADING1_TITLE',	'TXT_KEY_JFD_MISC_BUILD_CHARGES_HEADING1_TITLE',	'TXT_KEY_JFD_MISC_BUILD_CHARGES_HEADING1_BODY',		'ECONOMIC',		'HEADER_CID'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,												Description,										Summary,											Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_MISC_SATELLITES',			'TXT_KEY_JFD_MISC_SATELLITES_HEADING1_TITLE',		'TXT_KEY_JFD_MISC_SATELLITES_HEADING1_TITLE',		'TXT_KEY_JFD_MISC_SATELLITES_HEADING1_BODY',		'FOREIGN',		'HEADER_CID'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_SATELLITES' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,												Description,										Summary,											Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_POWER',					'TXT_KEY_JFD_POWER_HEADING1_TITLE',					'TXT_KEY_JFD_POWER_HEADING1_TITLE',					'TXT_KEY_JFD_POWER_HEADING1_BODY',					'ECONOMIC',		'HEADER_CID'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,												Description,										Summary,											Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_PROVINCES',				'TXT_KEY_JFD_PROVINCES_HEADING1_TITLE',				'TXT_KEY_JFD_PROVINCES_HEADING1_TITLE',				'TXT_KEY_JFD_PROVINCES_HEADING1_BODY',				'ECONOMIC',		'HEADER_CID'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,												Description,										Summary,											Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_PROVINCES_UPGRADE',		'TXT_KEY_JFD_PROVINCES_UPGRADE_HEADING1_TITLE',		'TXT_KEY_JFD_PROVINCES_UPGRADE_HEADING1_TITLE',		'TXT_KEY_JFD_PROVINCES_UPGRADE_HEADING1_BODY',		'ECONOMIC',		'HEADER_CID'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,												Description,										Summary,											Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_PROVINCES_LEVIES',			'TXT_KEY_JFD_PROVINCES_LEVIES_HEADING1_TITLE',		'TXT_KEY_JFD_PROVINCES_LEVIES_HEADING1_TITLE',		'TXT_KEY_JFD_PROVINCES_LEVIES_HEADING1_BODY',		'MILITARY',		'HEADER_CID'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,												Description,										Summary,											Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SLAVERY',					'TXT_KEY_JFD_SLAVERY_HEADING1_TITLE',				'TXT_KEY_JFD_SLAVERY_HEADING1_TITLE',				'TXT_KEY_JFD_SLAVERY_HEADING1_BODY',				'MILITARY',		'HEADER_CID'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,												Description,										Summary,											Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SLAVERY_SHACKLES',			'TXT_KEY_JFD_SLAVERY_SHACKLES_HEADING1_TITLE',		'TXT_KEY_JFD_SLAVERY_SHACKLES_HEADING1_TITLE',		'TXT_KEY_JFD_SLAVERY_SHACKLES_HEADING1_BODY',		'MILITARY',		'HEADER_CID'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);
--==========================================================================================================================
-- DEFINES
--==========================================================================================================================
-- Defines
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Defines
		(Name,									Value)
SELECT	'JFD_CID_AI_FREE_BUILD_CHARGES',		2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1);

INSERT INTO Defines
		(Name,									Value)
SELECT	'JFD_CID_INFLUENCE_FROM_STALLITE',		150
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_SATELLITES' AND Value = 1);
--==========================================================================================================================
-- SPECIALISTS
--==========================================================================================================================
-- Specialists
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Specialists
SET FontIcon = '[ICON_GREAT_ARTIST]'
WHERE Type = 'SPECIALIST_ARTIST';

UPDATE Specialists
SET FontIcon = '[ICON_GREAT_ENGINEER]'
WHERE Type = 'SPECIALIST_ENGINEER';

UPDATE Specialists
SET FontIcon = '[ICON_GREAT_MERCHANT]'
WHERE Type = 'SPECIALIST_MERCHANT';

UPDATE Specialists
SET FontIcon = '[ICON_GREAT_MUSICIAN]'
WHERE Type = 'SPECIALIST_MUSICIAN';

UPDATE Specialists
SET FontIcon = '[ICON_GREAT_SCIENTIST]'
WHERE Type = 'SPECIALIST_SCIENTIST';

UPDATE Specialists
SET FontIcon = '[ICON_GREAT_WRITER]'
WHERE Type = 'SPECIALIST_WRITER';
--==========================================================================================================================
-- YIELDS
--==========================================================================================================================
-- Yields
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Yields
		(Type,						Description,						IconString,					IsFake,		MinCity,	AIWeightPercent,	ImageTexture)
VALUES	('YIELD_DEFENSE',			'TXT_KEY_YIELD_JFD_DEFENSE',		'[ICON_STRENGTH]',			1,			0,			80,					'YieldAtlas_128_Defense.dds'),
		('YIELD_HAPPINESS',			'TXT_KEY_YIELD_JFD_HAPPINESS',		'[ICON_HAPPINESS_1]',		1,			0,			80,					NULL),
		('YIELD_JFD_DEVELOPMENT',	'TXT_KEY_YIELD_JFD_DEVELOPMENT',	'[ICON_JFD_DEVELOPMENT]',	1,			0,			80,					'YieldAtlas_128_Development.dds');		
--==========================================================================================================================
--==========================================================================================================================