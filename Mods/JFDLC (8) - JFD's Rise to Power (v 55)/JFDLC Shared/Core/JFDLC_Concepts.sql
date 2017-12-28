--==========================================================================================================================		
-- CONCEPTS
--==========================================================================================================================	
-- Concepts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_CLAIMS',					'TXT_KEY_JFD_CLAIMS_HEADING1_TITLE',					'TXT_KEY_JFD_CLAIMS_HEADING1_TITLE',						'TXT_KEY_JFD_CLAIMS_HEADING1_BODY',						'FOREIGN',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_CLAIMS_CAUSES',			'TXT_KEY_JFD_CLAIMS_HEADING1_TITLE',					'TXT_KEY_JFD_CLAIMS_CAUSES_HEADING1_TITLE',					'TXT_KEY_JFD_CLAIMS_CAUSES_HEADING1_BODY',				'FOREIGN',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_CRIME',					'TXT_KEY_JFD_CRIME_HEADING1_TITLE',						'TXT_KEY_JFD_CRIME_HEADING1_TITLE',							'TXT_KEY_JFD_CRIME_HEADING1_BODY',						'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_CRIME_COUNTERACTION',		'TXT_KEY_JFD_CRIME_COUNTERACTION_HEADING1_TITLE',		'TXT_KEY_JFD_CRIME_COUNTERACTION_HEADING1_TITLE',			'TXT_KEY_JFD_CRIME_COUNTERACTION_HEADING1_BODY',		'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_CRIME_ORGANIZED',			'TXT_KEY_JFD_CRIME_ORGANIZED_HEADING1_TITLE',			'TXT_KEY_JFD_CRIME_ORGANIZED_HEADING1_TITLE',				'TXT_KEY_JFD_CRIME_ORGANIZED_HEADING1_BODY',			'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_COLONIES',					'TXT_KEY_JFD_COLONIES_HEADING1_TITLE',					'TXT_KEY_JFD_COLONIES_HEADING1_TITLE',						'TXT_KEY_JFD_COLONIES_HEADING1_BODY',					'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_COLONIES_INTEGRATION',		'TXT_KEY_JFD_COLONIES_HEADING1_TITLE',					'TXT_KEY_JFD_COLONIES_INTEGRATION_HEADING1_TITLE',			'TXT_KEY_JFD_COLONIES_INTEGRATION_HEADING1_BODY',		'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_DECISIONS',				'TXT_KEY_JFD_DECISIONS_HEADING1_TITLE',					'TXT_KEY_JFD_DECISIONS_HEADING1_TITLE',						'TXT_KEY_JFD_DECISIONS_HEADING1_BODY',					'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_DECISIONS_ADMINISTRATORS',	'TXT_KEY_JFD_DECISIONS_HEADING1_TITLE',					'TXT_KEY_JFD_DECISIONS_ADMINISTRATORS_HEADING1_TITLE',		'TXT_KEY_JFD_DECISIONS_ADMINISTRATORS_HEADING1_BODY',	'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_DEVELOPMENT',				'TXT_KEY_JFD_DEVELOPMENT_HEADING1_TITLE',				'TXT_KEY_JFD_DEVELOPMENT_HEADING1_TITLE',					'TXT_KEY_JFD_DEVELOPMENT_HEADING1_BODY',				'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_DEVELOPMENT_INCREASE',		'TXT_KEY_JFD_DEVELOPMENT_INCREASE_HEADING1_TITLE',		'TXT_KEY_JFD_DEVELOPMENT_INCREASE_HEADING1_TITLE',			'TXT_KEY_JFD_DEVELOPMENT_INCREASE_HEADING1_BODY',		'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_EPITHETS',					'TXT_KEY_JFD_EPITHETS_HEADING1_TITLE',					'TXT_KEY_JFD_EPITHETS_HEADING1_TITLE',						'TXT_KEY_JFD_EPITHETS_HEADING1_BODY',					'FOREIGN',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_HAPPINESS',				'TXT_KEY_JFD_HAPPINESS_HEADING1_TITLE',					'TXT_KEY_JFD_HAPPINESS_HEADING1_TITLE',						'TXT_KEY_JFD_HAPPINESS_HEADING1_BODY',					'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HAPPINESS_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_HAPPINESS_INCREASE',		'TXT_KEY_JFD_HAPPINESS_INCREASE_HEADING1_TITLE',		'TXT_KEY_JFD_HAPPINESS_INCREASE_HEADING1_TITLE',			'TXT_KEY_JFD_HAPPINESS_INCREASE_HEADING1_BODY',			'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HAPPINESS_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_HAPPINESS_RESISTANCE',		'TXT_KEY_JFD_HAPPINESS_RESISTANCE_HEADING1_TITLE',		'TXT_KEY_JFD_HAPPINESS_RESISTANCE_HEADING1_TITLE',			'TXT_KEY_JFD_HAPPINESS_RESISTANCE_HEADING1_BODY',		'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HAPPINESS_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_HEALTH',					'TXT_KEY_JFD_HEALTH_HEADING1_TITLE',					'TXT_KEY_JFD_HEALTH_HEADING1_TITLE',						'TXT_KEY_JFD_HEALTH_HEADING1_BODY',						'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_HEALTH_INCREASE',			'TXT_KEY_JFD_HEALTH_INCREASE_HEADING1_TITLE',			'TXT_KEY_JFD_HEALTH_INCREASE_HEADING1_TITLE',				'TXT_KEY_JFD_HEALTH_INCREASE_HEADING1_BODY',			'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_HEALTH_PLAGUE',			'TXT_KEY_JFD_HEALTH_PLAGUE_HEADING1_TITLE',				'TXT_KEY_JFD_HEALTH_PLAGUE_HEADING1_TITLE',					'TXT_KEY_JFD_HEALTH_PLAGUE_HEADING1_BODY',				'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_IDEALS',					'TXT_KEY_JFD_IDEALS_HEADING1_TITLE',					'TXT_KEY_JFD_IDEALS_HEADING1_TITLE',						'TXT_KEY_JFD_IDEALS_HEADING1_BODY',						'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_INNOVATIONS',				'TXT_KEY_JFD_INNOVATIONS_HEADING1_TITLE',				'TXT_KEY_JFD_INNOVATIONS_HEADING1_TITLE',					'TXT_KEY_JFD_INNOVATIONS_HEADING1_BODY',				'SCIENCE',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_INVESTMENTS',				'TXT_KEY_JFD_INVESTMENTS_HEADING1_TITLE',				'TXT_KEY_JFD_INVESTMENTS_HEADING1_TITLE',					'TXT_KEY_JFD_INVESTMENTS_HEADING1_BODY',				'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_LOYALTY',					'TXT_KEY_JFD_LOYALTY_HEADING1_TITLE',					'TXT_KEY_JFD_LOYALTY_HEADING1_TITLE',						'TXT_KEY_JFD_LOYALTY_HEADING1_BODY',					'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_LOYALTY_INCREASING',		'TXT_KEY_JFD_LOYALTY_INCREASING_HEADING1_TITLE',		'TXT_KEY_JFD_LOYALTY_INCREASING_HEADING1_TITLE',			'TXT_KEY_JFD_LOYALTY_INCREASING_HEADING1_BODY',			'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_LOYALTY_SENTIMENT',		'TXT_KEY_JFD_LOYALTY_SENTIMENT_HEADING1_TITLE',			'TXT_KEY_JFD_LOYALTY_SENTIMENT_HEADING1_TITLE',				'TXT_KEY_JFD_LOYALTY_SENTIMENT_HEADING1_BODY',			'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_LOYALTY_REVOLT',			'TXT_KEY_JFD_LOYALTY_REVOLT_HEADING1_TITLE',			'TXT_KEY_JFD_LOYALTY_REVOLT_HEADING1_TITLE',				'TXT_KEY_JFD_LOYALTY_REVOLT_HEADING1_BODY',				'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_LOYALTY_WLTKD',			'TXT_KEY_JFD_LOYALTY_WLTKD_HEADING1_TITLE',				'TXT_KEY_JFD_LOYALTY_WLTKD_HEADING1_TITLE',					'TXT_KEY_JFD_LOYALTY_WLTKD_HEADING1_BODY',				'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_MERCENARIES',				'TXT_KEY_JFD_MERCENARIES_HEADING1_TITLE',				'TXT_KEY_JFD_MERCENARIES_HEADING1_TITLE',					'TXT_KEY_JFD_MERCENARIES_HEADING1_BODY',				'MILITARY',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_MERCENARIES_HOLY_ORDER',	'TXT_KEY_JFD_MERCENARIES_HEADING1_TITLE',				'TXT_KEY_JFD_MERCENARIES_HOLY_ORDER_HEADING1_TITLE',		'TXT_KEY_JFD_MERCENARIES_HOLY_ORDER_HEADING1_BODY',		'MILITARY',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_MERCENARIES_MUTINY',		'TXT_KEY_JFD_MERCENARIES_HEADING1_TITLE',				'TXT_KEY_JFD_MERCENARIES_MUTINY_HEADING1_TITLE',			'TXT_KEY_JFD_MERCENARIES_MUTINY_HEADING1_BODY',			'MILITARY',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_MERCENARIES_RATING',		'TXT_KEY_JFD_MERCENARIES_HEADING1_TITLE',				'TXT_KEY_JFD_MERCENARIES_RATING_HEADING1_TITLE',			'TXT_KEY_JFD_MERCENARIES_RATING_HEADING1_BODY',			'MILITARY',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_MISC_SATELLITES',			'TXT_KEY_JFD_MISC_SATELLITES_HEADING1_TITLE',			'TXT_KEY_JFD_MISC_SATELLITES_HEADING1_TITLE',				'TXT_KEY_JFD_MISC_SATELLITES_HEADING1_BODY',			'FOREIGN',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFDLC_MISC_SATELLITES' AND Value = 1);

INSERT INTO Concepts 
		(Type, 									Topic,													Description, 												Summary, 												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_PIETY',					'TXT_KEY_TOPIC_JFD_PIETY', 								'TXT_KEY_JFD_PIETY_HEADING1_TITLE',							'TXT_KEY_JFD_PIETY_HEADING1_BODY',						'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Concepts 
		(Type, 									Topic,													Description, 												Summary, 												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_PIETY_LEVEL',				'TXT_KEY_TOPIC_JFD_PIETY_LEVEL', 						'TXT_KEY_JFD_PIETY_LEVEL_HEADING1_TITLE',					'TXT_KEY_JFD_PIETY_LEVEL_HEADING1_BODY',				'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Concepts 
		(Type, 									Topic,													Description, 												Summary, 												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_PIETY_STATE_RELIGION',		'TXT_KEY_TOPIC_JFD_PIETY',								'TXT_KEY_JFD_PIETY_STATE_RELIGION_HEADING1_TITLE',			'TXT_KEY_JFD_PIETY_STATE_RELIGION_HEADING1_BODY',		'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Concepts 
		(Type, 									Topic,													Description, 												Summary, 												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_PIETY_SECULARIZATION',		'TXT_KEY_TOPIC_JFD_PIETY',								'TXT_KEY_JFD_PIETY_SECULARIZATION_HEADING1_TITLE',			'TXT_KEY_JFD_PIETY_SECULARIZATION_HEADING1_BODY',		'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_POWER',					'TXT_KEY_JFD_POWER_HEADING1_TITLE',						'TXT_KEY_JFD_POWER_HEADING1_TITLE',							'TXT_KEY_JFD_POWER_HEADING1_BODY',						'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_PROGRESS_BUILD_CHARGES',	'TXT_KEY_JFD_PROGRESS_BUILD_CHARGES_HEADING1_TITLE',	'TXT_KEY_JFD_PROGRESS_BUILD_CHARGES_HEADING1_TITLE',		'TXT_KEY_JFD_PROGRESS_BUILD_CHARGES_HEADING1_BODY',		'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_PROVINCES',				'TXT_KEY_JFD_PROVINCES_HEADING1_TITLE',					'TXT_KEY_JFD_PROVINCES_HEADING1_TITLE',						'TXT_KEY_JFD_PROVINCES_HEADING1_BODY',					'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_PROVINCES_UPGRADE',		'TXT_KEY_JFD_PROVINCES_UPGRADE_HEADING1_TITLE',			'TXT_KEY_JFD_PROVINCES_UPGRADE_HEADING1_TITLE',				'TXT_KEY_JFD_PROVINCES_UPGRADE_HEADING1_BODY',			'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_PROVINCES_LEVIES',			'TXT_KEY_JFD_PROVINCES_LEVIES_HEADING1_TITLE',			'TXT_KEY_JFD_PROVINCES_LEVIES_HEADING1_TITLE',				'TXT_KEY_JFD_PROVINCES_LEVIES_HEADING1_BODY',			'MILITARY',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SLAVERY',					'TXT_KEY_JFD_SLAVERY_HEADING1_TITLE',					'TXT_KEY_JFD_SLAVERY_HEADING1_TITLE',						'TXT_KEY_JFD_SLAVERY_HEADING1_BODY',					'MILITARY',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SLAVERY_SHACKLES',			'TXT_KEY_JFD_SLAVERY_SHACKLES_HEADING1_TITLE',			'TXT_KEY_JFD_SLAVERY_SHACKLES_HEADING1_TITLE',				'TXT_KEY_JFD_SLAVERY_SHACKLES_HEADING1_BODY',			'MILITARY',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SOVEREIGNTY',				'TXT_KEY_JFD_SOVEREIGNTY_HEADING1_TITLE',				'TXT_KEY_JFD_SOVEREIGNTY_HEADING1_TITLE',					'TXT_KEY_JFD_SOVEREIGNTY_HEADING1_BODY',				'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SOVEREIGNTY_LEGITIMACY',	'TXT_KEY_JFD_SOVEREIGNTY_LEGITIMACY_HEADING1_TITLE',	'TXT_KEY_JFD_SOVEREIGNTY_LEGITIMACY_HEADING1_TITLE',		'TXT_KEY_JFD_SOVEREIGNTY_LEGITIMACY_HEADING1_BODY',		'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_LEGITIMACY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SOVEREIGNTY_REFORMS',		'TXT_KEY_JFD_SOVEREIGNTY_REFORMS_HEADING1_TITLE',		'TXT_KEY_JFD_SOVEREIGNTY_REFORMS_HEADING1_TITLE',			'TXT_KEY_JFD_SOVEREIGNTY_REFORMS_HEADING1_BODY',		'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SOVEREIGNTY_ANARCHY',		'TXT_KEY_JFD_SOVEREIGNTY_ANARCHY_HEADING1_TITLE',		'TXT_KEY_JFD_SOVEREIGNTY_ANARCHY_HEADING1_TITLE',			'TXT_KEY_JFD_SOVEREIGNTY_ANARCHY_HEADING1_BODY',		'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SOVEREIGNTY_GOVERNMENT',	'TXT_KEY_JFD_SOVEREIGNTY_GOVERNMENT_HEADING1_TITLE',	'TXT_KEY_JFD_SOVEREIGNTY_GOVERNMENT_HEADING1_TITLE',		'TXT_KEY_JFD_SOVEREIGNTY_GOVERNMENT_HEADING1_BODY',		'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SOVEREIGNTY_LEGISLATURE',	'TXT_KEY_JFD_SOVEREIGNTY_LEGISLATURE_HEADING1_TITLE',	'TXT_KEY_JFD_SOVEREIGNTY_LEGISLATURE_HEADING1_TITLE',		'TXT_KEY_JFD_SOVEREIGNTY_LEGISLATURE_HEADING1_BODY',	'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SOVEREIGNTY_FACTIONS',		'TXT_KEY_JFD_SOVEREIGNTY_FACTIONS_HEADING1_TITLE',		'TXT_KEY_JFD_SOVEREIGNTY_FACTIONS_HEADING1_TITLE',			'TXT_KEY_JFD_SOVEREIGNTY_FACTIONS_HEADING1_BODY',		'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SOVEREIGNTY_DICTATORSHIP',	'TXT_KEY_JFD_SOVEREIGNTY_DICTATORSHIP_HEADING1_TITLE',	'TXT_KEY_JFD_SOVEREIGNTY_DICTATORSHIP_HEADING1_TITLE',		'TXT_KEY_JFD_SOVEREIGNTY_DICTATORSHIP_HEADING1_BODY',	'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SOVEREIGNTY_HOLY_ROME',	'TXT_KEY_JFD_SOVEREIGNTY_HOLY_ROME_HEADING1_TITLE',		'TXT_KEY_JFD_SOVEREIGNTY_HOLY_ROME_HEADING1_TITLE',			'TXT_KEY_JFD_SOVEREIGNTY_HOLY_ROME_HEADING1_BODY',		'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SOVEREIGNTY_MONARCHY',		'TXT_KEY_JFD_SOVEREIGNTY_MONARCHY_HEADING1_TITLE',		'TXT_KEY_JFD_SOVEREIGNTY_MONARCHY_HEADING1_TITLE',			'TXT_KEY_JFD_SOVEREIGNTY_MONARCHY_HEADING1_BODY',		'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SOVEREIGNTY_REPUBLIC',		'TXT_KEY_JFD_SOVEREIGNTY_REPUBLIC_HEADING1_TITLE',		'TXT_KEY_JFD_SOVEREIGNTY_REPUBLIC_HEADING1_TITLE',			'TXT_KEY_JFD_SOVEREIGNTY_REPUBLIC_HEADING1_BODY',		'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SOVEREIGNTY_SHOGUNATE',	'TXT_KEY_JFD_SOVEREIGNTY_SHOGUNATE_HEADING1_TITLE',		'TXT_KEY_JFD_SOVEREIGNTY_SHOGUNATE_HEADING1_TITLE',			'TXT_KEY_JFD_SOVEREIGNTY_SHOGUNATE_HEADING1_BODY',		'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SOVEREIGNTY_THEOCRACY',	'TXT_KEY_JFD_SOVEREIGNTY_THEOCRACY_HEADING1_TITLE',		'TXT_KEY_JFD_SOVEREIGNTY_THEOCRACY_HEADING1_TITLE',			'TXT_KEY_JFD_SOVEREIGNTY_THEOCRACY_HEADING1_BODY',		'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SOVEREIGNTY_PRIVY_COUNCIL','TXT_KEY_JFD_SOVEREIGNTY_PRIVY_COUNCIL_HEADING1_TITLE',	'TXT_KEY_JFD_SOVEREIGNTY_PRIVY_COUNCIL_HEADING1_TITLE',		'TXT_KEY_JFD_SOVEREIGNTY_PRIVY_COUNCIL_HEADING1_BODY',	'ECONOMIC',		'HEADER_JFDLC'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,												Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SUZEREINTY',				'TXT_KEY_JFD_SUZEREINTY_HEADING1_TITLE',				'TXT_KEY_JFD_SUZERAINTY_HEADING1_TITLE',					'TXT_KEY_JFD_SUZEREINTY_HEADING1_BODY',					'FOREIGN',		'HEADER_JFDLC'
WHERE EXISTS (SELECT Type FROM Policies WHERE Type = 'POLICY_MINOR_CIV_SUK_KUK');
--==========================================================================================================================
--==========================================================================================================================