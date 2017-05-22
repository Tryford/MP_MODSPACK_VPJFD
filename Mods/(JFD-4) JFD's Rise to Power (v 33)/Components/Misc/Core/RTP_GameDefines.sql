--==========================================================================================================================		
-- CONCEPTS
--==========================================================================================================================	
-- Concepts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Concepts	
		(Type, 									Topic,													Description,											Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_CLAIMS',					'TXT_KEY_JFD_CLAIMS_HEADING1_TITLE',					'TXT_KEY_JFD_CLAIMS_HEADING1_TITLE',					'TXT_KEY_JFD_CLAIMS_HEADING1_BODY',						'FOREIGN',		'HEADER_RTP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,											Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_CLAIMS_CAUSES',			'TXT_KEY_JFD_CLAIMS_HEADING1_TITLE',					'TXT_KEY_JFD_CLAIMS_CAUSES_HEADING1_TITLE',				'TXT_KEY_JFD_CLAIMS_CAUSES_HEADING1_BODY',				'FOREIGN',		'HEADER_RTP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,											Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_EPITHETS',					'TXT_KEY_JFD_EPITHETS_HEADING1_TITLE',					'TXT_KEY_JFD_EPITHETS_HEADING1_TITLE',					'TXT_KEY_JFD_EPITHETS_HEADING1_BODY',					'FOREIGN',		'HEADER_RTP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,											Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_MERCENARIES',				'TXT_KEY_JFD_MERCENARIES_HEADING1_TITLE',				'TXT_KEY_JFD_MERCENARIES_HEADING1_TITLE',				'TXT_KEY_JFD_MERCENARIES_HEADING1_BODY',				'MILITARY',		'HEADER_RTP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,											Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_MERCENARIES_HOLY_ORDER',	'TXT_KEY_JFD_MERCENARIES_HEADING1_TITLE',				'TXT_KEY_JFD_MERCENARIES_HOLY_ORDER_HEADING1_TITLE',	'TXT_KEY_JFD_MERCENARIES_HOLY_ORDER_HEADING1_BODY',		'MILITARY',		'HEADER_RTP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,											Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_MERCENARIES_MUTINY',		'TXT_KEY_JFD_MERCENARIES_HEADING1_TITLE',				'TXT_KEY_JFD_MERCENARIES_MUTINY_HEADING1_TITLE',		'TXT_KEY_JFD_MERCENARIES_MUTINY_HEADING1_BODY',			'MILITARY',		'HEADER_RTP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,											Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_MERCENARIES_RATING',		'TXT_KEY_JFD_MERCENARIES_HEADING1_TITLE',				'TXT_KEY_JFD_MERCENARIES_RATING_HEADING1_TITLE',		'TXT_KEY_JFD_MERCENARIES_RATING_HEADING1_BODY',			'MILITARY',		'HEADER_RTP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);

INSERT INTO Concepts 
		(Type, 									Topic,													Description, 											Summary, 												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_PIETY',					'TXT_KEY_TOPIC_JFD_PIETY', 								'TXT_KEY_JFD_PIETY_HEADING1_TITLE',						'TXT_KEY_JFD_PIETY_HEADING1_BODY',						'ECONOMIC',		'HEADER_RTP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Concepts 
		(Type, 									Topic,													Description, 											Summary, 												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_PIETY_LEVEL',				'TXT_KEY_TOPIC_JFD_PIETY_LEVEL', 						'TXT_KEY_JFD_PIETY_LEVEL_HEADING1_TITLE',				'TXT_KEY_JFD_PIETY_LEVEL_HEADING1_BODY',				'ECONOMIC',		'HEADER_RTP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Concepts 
		(Type, 									Topic,													Description, 											Summary, 												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_PIETY_STATE_RELIGION',		'TXT_KEY_TOPIC_JFD_PIETY',								'TXT_KEY_JFD_PIETY_STATE_RELIGION_HEADING1_TITLE',		'TXT_KEY_JFD_PIETY_STATE_RELIGION_HEADING1_BODY',		'ECONOMIC',		'HEADER_RTP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Concepts 
		(Type, 									Topic,													Description, 											Summary, 												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_PIETY_SECULARIZATION',		'TXT_KEY_TOPIC_JFD_PIETY',								'TXT_KEY_JFD_PIETY_SECULARIZATION_HEADING1_TITLE',		'TXT_KEY_JFD_PIETY_SECULARIZATION_HEADING1_BODY',		'ECONOMIC',		'HEADER_RTP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,											Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SOVEREIGNTY',				'TXT_KEY_JFD_SOVEREIGNTY_HEADING1_TITLE',				'TXT_KEY_JFD_SOVEREIGNTY_HEADING1_TITLE',				'TXT_KEY_JFD_SOVEREIGNTY_HEADING1_BODY',				'ECONOMIC',		'HEADER_RTP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,											Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SOVEREIGNTY_LEGITIMACY',	'TXT_KEY_JFD_SOVEREIGNTY_LEGITIMACY_HEADING1_TITLE',	'TXT_KEY_JFD_SOVEREIGNTY_LEGITIMACY_HEADING1_TITLE',	'TXT_KEY_JFD_SOVEREIGNTY_LEGITIMACY_HEADING1_BODY',		'ECONOMIC',		'HEADER_RTP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_LEGITIMACY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,											Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SOVEREIGNTY_REFORMS',		'TXT_KEY_JFD_SOVEREIGNTY_REFORMS_HEADING1_TITLE',		'TXT_KEY_JFD_SOVEREIGNTY_REFORMS_HEADING1_TITLE',		'TXT_KEY_JFD_SOVEREIGNTY_REFORMS_HEADING1_BODY',		'ECONOMIC',		'HEADER_RTP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,											Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SOVEREIGNTY_ANARCHY',		'TXT_KEY_JFD_SOVEREIGNTY_ANARCHY_HEADING1_TITLE',		'TXT_KEY_JFD_SOVEREIGNTY_ANARCHY_HEADING1_TITLE',		'TXT_KEY_JFD_SOVEREIGNTY_ANARCHY_HEADING1_BODY',		'ECONOMIC',		'HEADER_RTP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,											Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SOVEREIGNTY_GOVERNMENT',	'TXT_KEY_JFD_SOVEREIGNTY_GOVERNMENT_HEADING1_TITLE',	'TXT_KEY_JFD_SOVEREIGNTY_GOVERNMENT_HEADING1_TITLE',	'TXT_KEY_JFD_SOVEREIGNTY_GOVERNMENT_HEADING1_BODY',		'ECONOMIC',		'HEADER_RTP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,											Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SOVEREIGNTY_LEGISLATURE',	'TXT_KEY_JFD_SOVEREIGNTY_LEGISLATURE_HEADING1_TITLE',	'TXT_KEY_JFD_SOVEREIGNTY_LEGISLATURE_HEADING1_TITLE',	'TXT_KEY_JFD_SOVEREIGNTY_LEGISLATURE_HEADING1_BODY',	'ECONOMIC',		'HEADER_RTP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,											Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SOVEREIGNTY_FACTIONS',		'TXT_KEY_JFD_SOVEREIGNTY_FACTIONS_HEADING1_TITLE',		'TXT_KEY_JFD_SOVEREIGNTY_FACTIONS_HEADING1_TITLE',		'TXT_KEY_JFD_SOVEREIGNTY_FACTIONS_HEADING1_BODY',		'ECONOMIC',		'HEADER_RTP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,											Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SOVEREIGNTY_DICTATORSHIP',	'TXT_KEY_JFD_SOVEREIGNTY_DICTATORSHIP_HEADING1_TITLE',	'TXT_KEY_JFD_SOVEREIGNTY_DICTATORSHIP_HEADING1_TITLE',	'TXT_KEY_JFD_SOVEREIGNTY_DICTATORSHIP_HEADING1_BODY',	'ECONOMIC',		'HEADER_RTP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,											Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SOVEREIGNTY_HOLY_ROME',	'TXT_KEY_JFD_SOVEREIGNTY_HOLY_ROME_HEADING1_TITLE',		'TXT_KEY_JFD_SOVEREIGNTY_HOLY_ROME_HEADING1_TITLE',		'TXT_KEY_JFD_SOVEREIGNTY_HOLY_ROME_HEADING1_BODY',		'ECONOMIC',		'HEADER_RTP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,											Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SOVEREIGNTY_MONARCHY',		'TXT_KEY_JFD_SOVEREIGNTY_MONARCHY_HEADING1_TITLE',		'TXT_KEY_JFD_SOVEREIGNTY_MONARCHY_HEADING1_TITLE',		'TXT_KEY_JFD_SOVEREIGNTY_MONARCHY_HEADING1_BODY',		'ECONOMIC',		'HEADER_RTP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,											Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SOVEREIGNTY_REPUBLIC',		'TXT_KEY_JFD_SOVEREIGNTY_REPUBLIC_HEADING1_TITLE',		'TXT_KEY_JFD_SOVEREIGNTY_REPUBLIC_HEADING1_TITLE',		'TXT_KEY_JFD_SOVEREIGNTY_REPUBLIC_HEADING1_BODY',		'ECONOMIC',		'HEADER_RTP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,											Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SOVEREIGNTY_THEOCRACY',	'TXT_KEY_JFD_SOVEREIGNTY_THEOCRACY_HEADING1_TITLE',		'TXT_KEY_JFD_SOVEREIGNTY_THEOCRACY_HEADING1_TITLE',		'TXT_KEY_JFD_SOVEREIGNTY_THEOCRACY_HEADING1_BODY',		'ECONOMIC',		'HEADER_RTP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Concepts	
		(Type, 									Topic,													Description,											Summary,												Advisor,		CivilopediaHeaderType)
SELECT	'CONCEPT_JFD_SOVEREIGNTY_PRIVY_COUNCIL','TXT_KEY_JFD_SOVEREIGNTY_PRIVY_COUNCIL_HEADING1_TITLE',	'TXT_KEY_JFD_SOVEREIGNTY_PRIVY_COUNCIL_HEADING1_TITLE',	'TXT_KEY_JFD_SOVEREIGNTY_PRIVY_COUNCIL_HEADING1_BODY',	'ECONOMIC',		'HEADER_RTP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--=======================================================================================================================
-- SUKRITACT_HOTKEYMANAGER
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS 
	Sukritact_HotkeyManager (
	LuaEventName		text	default NULL,
	Hotkey				text	default NULL, -- Refer to http://modiki.civfanatics.com/index.php?title=KeyType_(Civ5_Type) for a list of keys
	ShiftDown			boolean	default 0,
	CtrlDown			boolean	default 0,
	AltDown				boolean	default 0);

INSERT INTO Sukritact_HotkeyManager
		(LuaEventName, 										Hotkey,			ShiftDown,	CtrlDown,	AltDown)
VALUES	('JFD_RTP_Sovereignty_ShowGovernmentOverview',		'VK_F4',		0,			1,			0),
		('JFD_RTP_Mercenaries_ShowMercenaryOverview',		'VK_F6',		0,			1,			0);
--==========================================================================================================================
-- POLICIES
--==========================================================================================================================
-- Policies
-------------------------------------
UPDATE Policies
SET IsDummy = 1
WHERE PolicyBranchType IS NULL
AND NOT Type IN (SELECT FreePolicy FROM PolicyBranchTypes WHERE FreePolicy IS NOT NULL)
AND NOT Type IN (SELECT FreeFinishingPolicy FROM PolicyBranchTypes WHERE FreeFinishingPolicy IS NOT NULL);

CREATE TRIGGER JFDRTP_Misc_Policies
AFTER INSERT ON Policies
WHEN NEW.PolicyBranchType IS NULL
AND NOT NEW.Type IN (SELECT FreePolicy FROM PolicyBranchTypes WHERE FreePolicy != NOT NULL)
AND NOT NEW.Type IN (SELECT FreeFinishingPolicy FROM PolicyBranchTypes WHERE FreeFinishingPolicy != NOT NULL)
BEGIN
	UPDATE Policies
	SET IsDummy = 1
	WHERE Type = NEW.Type;
END;
--==========================================================================================================================
--==========================================================================================================================