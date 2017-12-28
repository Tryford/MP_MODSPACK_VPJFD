--==========================================================================================================================
-- IDEALS
--==========================================================================================================================
-- JFD_Ideals
-------------------------------------	
--Aboriginal
INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_ABORIGINAL_1',		'TXT_KEY_IDEAL_JFD_ABORIGINAL_DESC_1',		'TXT_KEY_IDEAL_JFD_ABORIGINAL_HELP_1',		'TXT_KEY_IDEAL_JFD_ABORIGINAL_HELP_1_REQ',		'ERA_ANCIENT',		'JFD_Aboriginal',		'POLICY_IDEALS_JFD_ABORIGINAL_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_ABORIGINAL_2',		'TXT_KEY_IDEAL_JFD_ABORIGINAL_DESC_2',		'TXT_KEY_IDEAL_JFD_ABORIGINAL_HELP_2',		'TXT_KEY_IDEAL_JFD_ABORIGINAL_HELP_2_REQ',		'ERA_MEDIEVAL',		'JFD_Aboriginal',		'POLICY_IDEALS_JFD_ABORIGINAL_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_ABORIGINAL_3',		'TXT_KEY_IDEAL_JFD_ABORIGINAL_DESC_3',		'TXT_KEY_IDEAL_JFD_ABORIGINAL_HELP_3',		'TXT_KEY_IDEAL_JFD_ABORIGINAL_HELP_3_REQ',		'ERA_MEDIEVAL',		'JFD_Aboriginal',		'POLICY_IDEALS_JFD_ABORIGINAL_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

--Andean
INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_ANDEAN_1',			'TXT_KEY_IDEAL_JFD_ANDEAN_DESC_1',			'TXT_KEY_IDEAL_JFD_ANDEAN_HELP_1',			'TXT_KEY_IDEAL_JFD_ANDEAN_HELP_1_REQ',			'ERA_RENAISSANCE',	'JFD_Andean',			'POLICY_IDEALS_JFD_ANDEAN_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_ANDEAN_2',			'TXT_KEY_IDEAL_JFD_ANDEAN_DESC_2',			'TXT_KEY_IDEAL_JFD_ANDEAN_HELP_2',			'TXT_KEY_IDEAL_JFD_ANDEAN_HELP_2_REQ',			'ERA_MEDIEVAL',		'JFD_Andean',			'POLICY_IDEALS_JFD_ANDEAN_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_ANDEAN_3',			'TXT_KEY_IDEAL_JFD_ANDEAN_DESC_3',			'TXT_KEY_IDEAL_JFD_ANDEAN_HELP_3',			'TXT_KEY_IDEAL_JFD_ANDEAN_HELP_3_REQ',			'ERA_MEDIEVAL',		'JFD_Andean',			'POLICY_IDEALS_JFD_ANDEAN_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

--Bantu
INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_BANTU_1',			'TXT_KEY_IDEAL_JFD_BANTU_DESC_1',			'TXT_KEY_IDEAL_JFD_BANTU_HELP_1',			'TXT_KEY_IDEAL_JFD_BANTU_HELP_1_REQ',			'ERA_ANCIENT',		'JFD_Bantu',			'POLICY_IDEALS_JFD_BANTU_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_BANTU_2',			'TXT_KEY_IDEAL_JFD_BANTU_DESC_2',			'TXT_KEY_IDEAL_JFD_BANTU_HELP_2',			'TXT_KEY_IDEAL_JFD_BANTU_HELP_2_REQ',			'ERA_MEDIEVAL',		'JFD_Bantu',			'POLICY_IDEALS_JFD_BANTU_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_BANTU_3',			'TXT_KEY_IDEAL_JFD_BANTU_DESC_3',			'TXT_KEY_IDEAL_JFD_BANTU_HELP_3',			'TXT_KEY_IDEAL_JFD_BANTU_HELP_3_REQ',			'ERA_MEDIEVAL',		'JFD_Bantu',			'POLICY_IDEALS_JFD_BANTU_3'
WHERE EXISTS (SELECT Type FROM Yields WHERE Type = 'YIELD_DEFENSE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

--Bharata
INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_BHARATA_1',			'TXT_KEY_IDEAL_JFD_BHARATA_DESC_1',			'TXT_KEY_IDEAL_JFD_BHARATA_HELP_1',			'TXT_KEY_IDEAL_JFD_BHARATA_HELP_1_REQ',			'ERA_RENAISSANCE',	'JFD_Bharata',			'POLICY_IDEALS_JFD_BHARATA_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);	

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_BHARATA_2',			'TXT_KEY_IDEAL_JFD_BHARATA_DESC_2',			'TXT_KEY_IDEAL_JFD_BHARATA_HELP_2',			'TXT_KEY_IDEAL_JFD_BHARATA_HELP_2_REQ',			'ERA_INDUSTRIAL',	'JFD_Bharata',			'POLICY_IDEALS_JFD_BHARATA_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);	

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_BHARATA_3',			'TXT_KEY_IDEAL_JFD_BHARATA_DESC_3',			'TXT_KEY_IDEAL_JFD_BHARATA_HELP_3',			'TXT_KEY_IDEAL_JFD_BHARATA_HELP_3_REQ',			'ERA_CLASSICAL',	'JFD_Bharata',			'POLICY_IDEALS_JFD_BHARATA_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

--Central
INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_CENTRAL_1',			'TXT_KEY_IDEAL_JFD_CENTRAL_DESC_1',			'TXT_KEY_IDEAL_JFD_CENTRAL_HELP_1',			'TXT_KEY_IDEAL_JFD_CENTRAL_HELP_1_REQ',			'ERA_MEDIEVAL',		'JFD_Central',			'POLICY_IDEALS_JFD_CENTRAL_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_CENTRAL_2',			'TXT_KEY_IDEAL_JFD_CENTRAL_DESC_2',			'TXT_KEY_IDEAL_JFD_CENTRAL_HELP_2',			'TXT_KEY_IDEAL_JFD_CENTRAL_HELP_2_REQ',			'ERA_RENAISSANCE',	'JFD_Central',			'POLICY_IDEALS_JFD_CENTRAL_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);	

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_CENTRAL_3',			'TXT_KEY_IDEAL_JFD_CENTRAL_DESC_3',			'TXT_KEY_IDEAL_JFD_CENTRAL_HELP_3',			'TXT_KEY_IDEAL_JFD_CENTRAL_HELP_3_REQ',			'ERA_RENAISSANCE',	'JFD_Central',			'POLICY_IDEALS_JFD_CENTRAL_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Classical
INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_CLASSICAL_1',		'TXT_KEY_IDEAL_JFD_CLASSICAL_DESC_1',		'TXT_KEY_IDEAL_JFD_CLASSICAL_HELP_1',		'TXT_KEY_IDEAL_JFD_CLASSICAL_HELP_1_REQ',		'ERA_CLASSICAL',	'JFD_Classical',		'POLICY_IDEALS_JFD_CLASSICAL_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_CLASSICAL_2',		'TXT_KEY_IDEAL_JFD_CLASSICAL_DESC_2',		'TXT_KEY_IDEAL_JFD_CLASSICAL_HELP_2',		'TXT_KEY_IDEAL_JFD_CLASSICAL_HELP_2_REQ',		'ERA_CLASSICAL',	'JFD_Classical',		'POLICY_IDEALS_JFD_CLASSICAL_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_CLASSICAL_3',		'TXT_KEY_IDEAL_JFD_CLASSICAL_DESC_3',		'TXT_KEY_IDEAL_JFD_CLASSICAL_HELP_3',		'TXT_KEY_IDEAL_JFD_CLASSICAL_HELP_3_REQ',		'ERA_CLASSICAL',	'JFD_Classical',		'POLICY_IDEALS_JFD_CLASSICAL_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

--Colonial
INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_COLONIAL_2',			'TXT_KEY_IDEAL_JFD_COLONIAL_DESC_2',		'TXT_KEY_IDEAL_JFD_COLONIAL_HELP_2',		'TXT_KEY_IDEAL_JFD_COLONIAL_HELP_2_REQ',		'ERA_INDUSTRIAL',	'JFD_Colonial',			'POLICY_IDEALS_JFD_COLONIAL_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_COLONIAL_3',			'TXT_KEY_IDEAL_JFD_COLONIAL_DESC_3',		'TXT_KEY_IDEAL_JFD_COLONIAL_HELP_3',		'TXT_KEY_IDEAL_JFD_COLONIAL_HELP_3_REQ',		'ERA_MODERN',		'JFD_Colonial',			'POLICY_IDEALS_JFD_COLONIAL_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

--East Indies
INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_EAST_INDIES_1',		'TXT_KEY_IDEAL_JFD_EAST_INDIES_DESC_1',		'TXT_KEY_IDEAL_JFD_EAST_INDIES_HELP_1',		'TXT_KEY_IDEAL_JFD_EAST_INDIES_HELP_1_REQ',		'ERA_MEDIEVAL',		'JFD_EastIndies',		'POLICY_IDEALS_JFD_EAST_INDIES_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_EAST_INDIES_2',		'TXT_KEY_IDEAL_JFD_EAST_INDIES_DESC_2',		'TXT_KEY_IDEAL_JFD_EAST_INDIES_HELP_2',		'TXT_KEY_IDEAL_JFD_EAST_INDIES_HELP_2_REQ',		'ERA_MEDIEVAL',		'JFD_EastIndies',		'POLICY_IDEALS_JFD_EAST_INDIES_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_EAST_INDIES_3',		'TXT_KEY_IDEAL_JFD_EAST_INDIES_DESC_3',		'TXT_KEY_IDEAL_JFD_EAST_INDIES_HELP_3',		'TXT_KEY_IDEAL_JFD_EAST_INDIES_HELP_3_REQ',		'ERA_RENAISSANCE',	'JFD_EastIndies',		'POLICY_IDEALS_JFD_EAST_INDIES_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Eastern
INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_EASTERN_1',			'TXT_KEY_IDEAL_JFD_EASTERN_DESC_1',			'TXT_KEY_IDEAL_JFD_EASTERN_HELP_1',			'TXT_KEY_IDEAL_JFD_EASTERN_HELP_1_REQ',			'ERA_RENAISSANCE',	'JFD_Eastern',			'POLICY_IDEALS_JFD_EASTERN_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_EASTERN_2',			'TXT_KEY_IDEAL_JFD_EASTERN_DESC_2',			'TXT_KEY_IDEAL_JFD_EASTERN_HELP_2',			'TXT_KEY_IDEAL_JFD_EASTERN_HELP_2_REQ',			'ERA_MEDIEVAL',		'JFD_Eastern',			'POLICY_IDEALS_JFD_EASTERN_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_EASTERN_3',			'TXT_KEY_IDEAL_JFD_EASTERN_DESC_3',			'TXT_KEY_IDEAL_JFD_EASTERN_HELP_3',			'TXT_KEY_IDEAL_JFD_EASTERN_HELP_3_REQ',			'ERA_INDUSTRIAL',	'JFD_Eastern',			'POLICY_IDEALS_JFD_EASTERN_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--Great Plains
INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_GREAT_PLAINS_1',		'TXT_KEY_IDEAL_JFD_GREAT_PLAINS_DESC_1',	'TXT_KEY_IDEAL_JFD_GREAT_PLAINS_HELP_1',	'TXT_KEY_IDEAL_JFD_GREAT_PLAINS_HELP_1_REQ',	'ERA_MEDIEVAL',		'JFD_GreatPlains',		'POLICY_IDEALS_JFD_GREAT_PLAINS_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_GREAT_PLAINS_2',		'TXT_KEY_IDEAL_JFD_GREAT_PLAINS_DESC_2',	'TXT_KEY_IDEAL_JFD_GREAT_PLAINS_HELP_2',	'TXT_KEY_IDEAL_JFD_GREAT_PLAINS_HELP_2_REQ',	'ERA_INDUSTRIAL',	'JFD_GreatPlains',		'POLICY_IDEALS_JFD_GREAT_PLAINS_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_GREAT_PLAINS_3',		'TXT_KEY_IDEAL_JFD_GREAT_PLAINS_DESC_3',	'TXT_KEY_IDEAL_JFD_GREAT_PLAINS_HELP_3',	'TXT_KEY_IDEAL_JFD_GREAT_PLAINS_HELP_3_REQ',	'ERA_MEDIEVAL',		'JFD_GreatPlains',		'POLICY_IDEALS_JFD_GREAT_PLAINS_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

--Himalayan
INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_HIMALAYAN_1',		'TXT_KEY_IDEAL_JFD_HIMALAYAN_DESC_1',		'TXT_KEY_IDEAL_JFD_HIMALAYAN_HELP_1',		'TXT_KEY_IDEAL_JFD_HIMALAYAN_HELP_1_REQ',		'ERA_MEDIEVAL',		'JFD_Himalayan',		'POLICY_IDEALS_JFD_HIMALAYAN_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_HIMALAYAN_2',		'TXT_KEY_IDEAL_JFD_HIMALAYAN_DESC_2',		'TXT_KEY_IDEAL_JFD_HIMALAYAN_HELP_2',		'TXT_KEY_IDEAL_JFD_HIMALAYAN_HELP_2_REQ',		'ERA_MEDIEVAL',		'JFD_Himalayan',		'POLICY_IDEALS_JFD_HIMALAYAN_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);		

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_HIMALAYAN_3',		'TXT_KEY_IDEAL_JFD_HIMALAYAN_DESC_3',		'TXT_KEY_IDEAL_JFD_HIMALAYAN_HELP_3',		'TXT_KEY_IDEAL_JFD_HIMALAYAN_HELP_3_REQ',		'ERA_RENAISSANCE',	'JFD_Himalayan',		'POLICY_IDEALS_JFD_HIMALAYAN_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);	

--Katuje
INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_KATUJE_1',			'TXT_KEY_IDEAL_JFD_KATUJE_DESC_1',			'TXT_KEY_IDEAL_JFD_KATUJE_HELP_1',			'TXT_KEY_IDEAL_JFD_KATUJE_HELP_1_REQ',			'ERA_CLASSICAL',	'JFD_Katuje',			'POLICY_IDEALS_JFD_KATUJE_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_KATUJE_2',			'TXT_KEY_IDEAL_JFD_KATUJE_DESC_2',			'TXT_KEY_IDEAL_JFD_KATUJE_HELP_2',			'TXT_KEY_IDEAL_JFD_KATUJE_HELP_2_REQ',			'ERA_MEDIEVAL',		'JFD_Katuje',			'POLICY_IDEALS_JFD_KATUJE_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_KATUJE_3',			'TXT_KEY_IDEAL_JFD_KATUJE_DESC_3',			'TXT_KEY_IDEAL_JFD_KATUJE_HELP_3',			'TXT_KEY_IDEAL_JFD_KATUJE_HELP_3_REQ',			'ERA_ANCIENT',		'JFD_Katuje',			'POLICY_IDEALS_JFD_KATUJE_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Islamic
INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_ISLAMIC_1',			'TXT_KEY_IDEAL_JFD_ISLAMIC_DESC_1',			'TXT_KEY_IDEAL_JFD_ISLAMIC_HELP_1',			'TXT_KEY_IDEAL_JFD_ISLAMIC_HELP_1_REQ',			'ERA_MEDIEVAL',		'JFD_Islamic',			'POLICY_IDEALS_JFD_ISLAMIC_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_ISLAMIC_2',			'TXT_KEY_IDEAL_JFD_ISLAMIC_DESC_2',			'TXT_KEY_IDEAL_JFD_ISLAMIC_HELP_2',			'TXT_KEY_IDEAL_JFD_ISLAMIC_HELP_2_REQ',			'ERA_MEDIEVAL',		'JFD_Islamic',			'POLICY_IDEALS_JFD_ISLAMIC_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_ISLAMIC_3',			'TXT_KEY_IDEAL_JFD_ISLAMIC_DESC_3',			'TXT_KEY_IDEAL_JFD_ISLAMIC_HELP_3',			'TXT_KEY_IDEAL_JFD_ISLAMIC_HELP_3_REQ',			'ERA_RENAISSANCE',	'JFD_Islamic',			'POLICY_IDEALS_JFD_ISLAMIC_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Iranian
INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_IRANIAN_1',			'TXT_KEY_IDEAL_JFD_IRANIAN_DESC_1',			'TXT_KEY_IDEAL_JFD_IRANIAN_HELP_1',			'TXT_KEY_IDEAL_JFD_IRANIAN_HELP_1_REQ',			'ERA_MEDIEVAL',		'JFD_Iranian',			'POLICY_IDEALS_JFD_IRANIAN_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE_LEVIES' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_IRANIAN_2',			'TXT_KEY_IDEAL_JFD_IRANIAN_DESC_2',			'TXT_KEY_IDEAL_JFD_IRANIAN_HELP_2',			'TXT_KEY_IDEAL_JFD_IRANIAN_HELP_2_REQ',			'ERA_CLASSICAL',	'JFD_Iranian',			'POLICY_IDEALS_JFD_IRANIAN_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_IRANIAN_3',			'TXT_KEY_IDEAL_JFD_IRANIAN_DESC_3',			'TXT_KEY_IDEAL_JFD_IRANIAN_HELP_3',			'TXT_KEY_IDEAL_JFD_IRANIAN_HELP_3_REQ',			'ERA_MEDIEVAL',		'JFD_Iranian',			'POLICY_IDEALS_JFD_IRANIAN_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Mandala
INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_MANDALA_1',			'TXT_KEY_IDEAL_JFD_MANDALA_DESC_1',			'TXT_KEY_IDEAL_JFD_MANDALA_HELP_1',			'TXT_KEY_IDEAL_JFD_MANDALA_HELP_1_REQ',			'ERA_MEDIEVAL',		'JFD_Mandala',			'POLICY_IDEALS_JFD_MANDALA_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_MANDALA_2',			'TXT_KEY_IDEAL_JFD_MANDALA_DESC_2',			'TXT_KEY_IDEAL_JFD_MANDALA_HELP_2',			'TXT_KEY_IDEAL_JFD_MANDALA_HELP_2_REQ',			'ERA_MEDIEVAL',		'JFD_Mandala',			'POLICY_IDEALS_JFD_MANDALA_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_MANDALA_3',			'TXT_KEY_IDEAL_JFD_MANDALA_DESC_3',			'TXT_KEY_IDEAL_JFD_MANDALA_HELP_3',			'TXT_KEY_IDEAL_JFD_MANDALA_HELP_3_REQ',			'ERA_RENAISSANCE',	'JFD_Mandala',			'POLICY_IDEALS_JFD_MANDALA_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

--Mesoamerican
INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_MESOAMERICAN_1',		'TXT_KEY_IDEAL_JFD_MESOAMERICAN_DESC_1',	'TXT_KEY_IDEAL_JFD_MESOAMERICAN_HELP_1',	'TXT_KEY_IDEAL_JFD_MESOAMERICAN_HELP_1_REQ',	'ERA_CLASSICAL',	'JFD_Mesoamerican',		'POLICY_IDEALS_JFD_MESOAMERICAN_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);	

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_MESOAMERICAN_2',		'TXT_KEY_IDEAL_JFD_MESOAMERICAN_DESC_2',	'TXT_KEY_IDEAL_JFD_MESOAMERICAN_HELP_2',	'TXT_KEY_IDEAL_JFD_MESOAMERICAN_HELP_2_REQ',	'ERA_MEDIEVAL',		'JFD_Mesoamerican',		'POLICY_IDEALS_JFD_MESOAMERICAN_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_MESOAMERICAN_3',		'TXT_KEY_IDEAL_JFD_MESOAMERICAN_DESC_3',	'TXT_KEY_IDEAL_JFD_MESOAMERICAN_HELP_3',	'TXT_KEY_IDEAL_JFD_MESOAMERICAN_HELP_3_REQ',	'ERA_MEDIEVAL',		'JFD_Mesoamerican',		'POLICY_IDEALS_JFD_MESOAMERICAN_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

--Mesopotamic
INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_MESOPOTAMIC_1',		'TXT_KEY_IDEAL_JFD_MESOPOTAMIC_DESC_1',		'TXT_KEY_IDEAL_JFD_MESOPOTAMIC_HELP_1',		'TXT_KEY_IDEAL_JFD_MESOPOTAMIC_HELP_1_REQ',		'ERA_ANCIENT',		'JFD_Mesopotamic',		'POLICY_IDEALS_JFD_MESOPOTAMIC_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_MESOPOTAMIC_2',		'TXT_KEY_IDEAL_JFD_MESOPOTAMIC_DESC_2',		'TXT_KEY_IDEAL_JFD_MESOPOTAMIC_HELP_2',		'TXT_KEY_IDEAL_JFD_MESOPOTAMIC_HELP_2_REQ',		'ERA_CLASSICAL',	'JFD_Mesopotamic',		'POLICY_IDEALS_JFD_MESOPOTAMIC_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_MESOPOTAMIC_3',		'TXT_KEY_IDEAL_JFD_MESOPOTAMIC_DESC_3',		'TXT_KEY_IDEAL_JFD_MESOPOTAMIC_HELP_3',		'TXT_KEY_IDEAL_JFD_MESOPOTAMIC_HELP_3_REQ',		'ERA_ANCIENT',		'JFD_Mesopotamic',		'POLICY_IDEALS_JFD_MESOPOTAMIC_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Northern
INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_NORTHERN_1',			'TXT_KEY_IDEAL_JFD_NORTHERN_DESC_1',		'TXT_KEY_IDEAL_JFD_NORTHERN_HELP_1',		'TXT_KEY_IDEAL_JFD_NORTHERN_HELP_1_REQ',		'ERA_MEDIEVAL',		'JFD_Northern',			'POLICY_IDEALS_JFD_NORTHERN_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_NORTHERN_2',			'TXT_KEY_IDEAL_JFD_NORTHERN_DESC_2',		'TXT_KEY_IDEAL_JFD_NORTHERN_HELP_2',		'TXT_KEY_IDEAL_JFD_NORTHERN_HELP_2_REQ',		'ERA_MEDIEVAL',		'JFD_Northern',			'POLICY_IDEALS_JFD_NORTHERN_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_NORTHERN_3',			'TXT_KEY_IDEAL_JFD_NORTHERN_DESC_3',		'TXT_KEY_IDEAL_JFD_NORTHERN_HELP_3',		'TXT_KEY_IDEAL_JFD_NORTHERN_HELP_3_REQ',		'ERA_MEDIEVAL',		'JFD_Northern',			'POLICY_IDEALS_JFD_NORTHERN_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Oceanic
INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_OCEANIC_1',			'TXT_KEY_IDEAL_JFD_OCEANIC_DESC_1',			'TXT_KEY_IDEAL_JFD_OCEANIC_HELP_1',			'TXT_KEY_IDEAL_JFD_OCEANIC_HELP_1_REQ',			'ERA_MEDIEVAL',		'JFD_Oceanic',			'POLICY_IDEALS_JFD_OCEANIC_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_OCEANIC_2',			'TXT_KEY_IDEAL_JFD_OCEANIC_DESC_2',			'TXT_KEY_IDEAL_JFD_OCEANIC_HELP_2',			'TXT_KEY_IDEAL_JFD_OCEANIC_HELP_2_REQ',			'ERA_RENAISSANCE',	'JFD_Oceanic',			'POLICY_IDEALS_JFD_OCEANIC_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_OCEANIC_3',			'TXT_KEY_IDEAL_JFD_OCEANIC_DESC_3',			'TXT_KEY_IDEAL_JFD_OCEANIC_HELP_3',			'TXT_KEY_IDEAL_JFD_OCEANIC_HELP_3_REQ',			'ERA_ANCIENT',		'JFD_Oceanic',			'POLICY_IDEALS_JFD_OCEANIC_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Oriental
INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_ORIENTAL_1',			'TXT_KEY_IDEAL_JFD_ORIENTAL_DESC_1',		'TXT_KEY_IDEAL_JFD_ORIENTAL_HELP_1',		'TXT_KEY_IDEAL_JFD_ORIENTAL_HELP_1_REQ',		'ERA_MEDIEVAL',		'JFD_Oriental',			'POLICY_IDEALS_JFD_ORIENTAL_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);	

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_ORIENTAL_2',			'TXT_KEY_IDEAL_JFD_ORIENTAL_DESC_2',		'TXT_KEY_IDEAL_JFD_ORIENTAL_HELP_2',		'TXT_KEY_IDEAL_JFD_ORIENTAL_HELP_2_REQ',		'ERA_RENAISSANCE',	'JFD_Oriental',			'POLICY_IDEALS_JFD_ORIENTAL_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);		

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_ORIENTAL_3',			'TXT_KEY_IDEAL_JFD_ORIENTAL_DESC_3',		'TXT_KEY_IDEAL_JFD_ORIENTAL_HELP_3',		'TXT_KEY_IDEAL_JFD_ORIENTAL_HELP_3_REQ',		'ERA_RENAISSANCE',	'JFD_Oriental',			'POLICY_IDEALS_JFD_ORIENTAL_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--Pacific
INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_PACIFIC_1',			'TXT_KEY_IDEAL_JFD_PACIFIC_DESC_1',			'TXT_KEY_IDEAL_JFD_PACIFIC_HELP_1',			'TXT_KEY_IDEAL_JFD_PACIFIC_HELP_1_REQ',			'ERA_MEDIEVAL',		'JFD_Pacific',			'POLICY_IDEALS_JFD_PACIFIC_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_PACIFIC_2',			'TXT_KEY_IDEAL_JFD_PACIFIC_DESC_2',			'TXT_KEY_IDEAL_JFD_PACIFIC_HELP_2',			'TXT_KEY_IDEAL_JFD_PACIFIC_HELP_2_REQ',			'ERA_RENAISSANCE',	'JFD_Pacific',			'POLICY_IDEALS_JFD_PACIFIC_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_PACIFIC_3',			'TXT_KEY_IDEAL_JFD_PACIFIC_DESC_3',			'TXT_KEY_IDEAL_JFD_PACIFIC_HELP_3',			'TXT_KEY_IDEAL_JFD_PACIFIC_HELP_3_REQ',			'ERA_CLASSICAL',	'JFD_Pacific',			'POLICY_IDEALS_JFD_PACIFIC_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Polar
INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_POLAR_1',			'TXT_KEY_IDEAL_JFD_POLAR_DESC_1',			'TXT_KEY_IDEAL_JFD_POLAR_HELP_1',			'TXT_KEY_IDEAL_JFD_POLAR_HELP_1_REQ',			'ERA_RENAISSANCE',	'JFD_Polar',			'POLICY_IDEALS_JFD_POLAR_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_POLAR_2',			'TXT_KEY_IDEAL_JFD_POLAR_DESC_2',			'TXT_KEY_IDEAL_JFD_POLAR_HELP_2',			'TXT_KEY_IDEAL_JFD_POLAR_HELP_2_REQ',			'ERA_CLASSICAL',	'JFD_Polar',			'POLICY_IDEALS_JFD_POLAR_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_POLAR_3',			'TXT_KEY_IDEAL_JFD_POLAR_DESC_3',			'TXT_KEY_IDEAL_JFD_POLAR_HELP_3',			'TXT_KEY_IDEAL_JFD_POLAR_HELP_3_REQ',			'ERA_MEDIEVAL',		'JFD_Polar',			'POLICY_IDEALS_JFD_POLAR_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

--Saharan
INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_SAHARAN_1',			'TXT_KEY_IDEAL_JFD_SAHARAN_DESC_1',			'TXT_KEY_IDEAL_JFD_SAHARAN_HELP_1',			'TXT_KEY_IDEAL_JFD_SAHARAN_HELP_1_REQ',			'ERA_MEDIEVAL',		'JFD_Saharan',			'POLICY_IDEALS_JFD_SAHARAN_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_SAHARAN_2',			'TXT_KEY_IDEAL_JFD_SAHARAN_DESC_2',			'TXT_KEY_IDEAL_JFD_SAHARAN_HELP_2',			'TXT_KEY_IDEAL_JFD_SAHARAN_HELP_2_REQ',			'ERA_RENAISSANCE',	'JFD_Saharan',			'POLICY_IDEALS_JFD_SAHARAN_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_SAHARAN_3',			'TXT_KEY_IDEAL_JFD_SAHARAN_DESC_3',			'TXT_KEY_IDEAL_JFD_SAHARAN_HELP_3',			'TXT_KEY_IDEAL_JFD_SAHARAN_HELP_3_REQ',			'ERA_MEDIEVAL',		'JFD_Saharan',			'POLICY_IDEALS_JFD_SAHARAN_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

--Semitic
INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_SEMITIC_1',			'TXT_KEY_IDEAL_JFD_SEMITIC_DESC_1',			'TXT_KEY_IDEAL_JFD_SEMITIC_HELP_1',			'TXT_KEY_IDEAL_JFD_SEMITIC_HELP_1_REQ',			'ERA_CLASSICAL',	'JFD_Semitic',			'POLICY_IDEALS_JFD_SEMITIC_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_SEMITIC_2',			'TXT_KEY_IDEAL_JFD_SEMITIC_DESC_2',			'TXT_KEY_IDEAL_JFD_SEMITIC_HELP_2',			'TXT_KEY_IDEAL_JFD_SEMITIC_HELP_2_REQ',			'ERA_RENAISSANCE',	'JFD_Semitic',			'POLICY_IDEALS_JFD_SEMITIC_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_SEMITIC_3',			'TXT_KEY_IDEAL_JFD_SEMITIC_DESC_3',			'TXT_KEY_IDEAL_JFD_SEMITIC_HELP_3',			'TXT_KEY_IDEAL_JFD_SEMITIC_HELP_3_REQ',			'ERA_MEDIEVAL',		'JFD_Semitic',			'POLICY_IDEALS_JFD_SEMITIC_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Steppe
INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_STEPPE_1',			'TXT_KEY_IDEAL_JFD_STEPPE_DESC_1',			'TXT_KEY_IDEAL_JFD_STEPPE_HELP_1',			'TXT_KEY_IDEAL_JFD_STEPPE_HELP_1_REQ',			'ERA_MEDIEVAL',		'JFD_Steppe',			'POLICY_IDEALS_JFD_STEPPE_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_STEPPE_2',			'TXT_KEY_IDEAL_JFD_STEPPE_DESC_2',			'TXT_KEY_IDEAL_JFD_STEPPE_HELP_2',			'TXT_KEY_IDEAL_JFD_STEPPE_HELP_2_REQ',			'ERA_RENAISSANCE',	'JFD_Steppe',			'POLICY_IDEALS_JFD_STEPPE_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_STEPPE_3',			'TXT_KEY_IDEAL_JFD_STEPPE_DESC_3',			'TXT_KEY_IDEAL_JFD_STEPPE_HELP_3',			'TXT_KEY_IDEAL_JFD_STEPPE_HELP_3_REQ',			'ERA_MEDIEVAL',		'JFD_Steppe',			'POLICY_IDEALS_JFD_STEPPE_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Southern
INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_SOUTHERN_1',			'TXT_KEY_IDEAL_JFD_SOUTHERN_DESC_1',		'TXT_KEY_IDEAL_JFD_SOUTHERN_HELP_1',		'TXT_KEY_IDEAL_JFD_SOUTHERN_HELP_1_REQ',		'ERA_RENAISSANCE',	'JFD_Southern',			'POLICY_IDEALS_JFD_SOUTHERN_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_SOUTHERN_2',			'TXT_KEY_IDEAL_JFD_SOUTHERN_DESC_2',		'TXT_KEY_IDEAL_JFD_SOUTHERN_HELP_2',		'TXT_KEY_IDEAL_JFD_SOUTHERN_HELP_2_REQ',		'ERA_RENAISSANCE',	'JFD_Southern',			'POLICY_IDEALS_JFD_SOUTHERN_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_SOUTHERN_3',			'TXT_KEY_IDEAL_JFD_SOUTHERN_DESC_3',		'TXT_KEY_IDEAL_JFD_SOUTHERN_HELP_3',		'TXT_KEY_IDEAL_JFD_SOUTHERN_HELP_3_REQ',		'ERA_RENAISSANCE',	'JFD_Southern',			'POLICY_IDEALS_JFD_SOUTHERN_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

--Totalitarian
INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_TOTALITARIAN_1',		'TXT_KEY_IDEAL_JFD_TOTALITARIAN_DESC_1',	'TXT_KEY_IDEAL_JFD_TOTALITARIAN_HELP_1',	'TXT_KEY_IDEAL_JFD_TOTALITARIAN_HELP_1_REQ',	'ERA_MODERN',		'JFD_Totalitarian',		'POLICY_IDEALS_JFD_TOTALITARIAN_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_TOTALITARIAN_2',		'TXT_KEY_IDEAL_JFD_TOTALITARIAN_DESC_2',	'TXT_KEY_IDEAL_JFD_TOTALITARIAN_HELP_2',	'TXT_KEY_IDEAL_JFD_TOTALITARIAN_HELP_2_REQ',	'ERA_MODERN',		'JFD_Totalitarian',		'POLICY_IDEALS_JFD_TOTALITARIAN_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)		
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_TOTALITARIAN_3',		'TXT_KEY_IDEAL_JFD_TOTALITARIAN_DESC_3',	'TXT_KEY_IDEAL_JFD_TOTALITARIAN_HELP_3',	'TXT_KEY_IDEAL_JFD_TOTALITARIAN_HELP_3_REQ',	'ERA_MODERN',		'JFD_Totalitarian',		'POLICY_IDEALS_JFD_TOTALITARIAN_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

--West African
INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_WEST_AFRICAN_1',		'TXT_KEY_IDEAL_JFD_WEST_AFRICAN_DESC_1',	'TXT_KEY_IDEAL_JFD_WEST_AFRICAN_HELP_1',	'TXT_KEY_IDEAL_JFD_WEST_AFRICAN_HELP_1_REQ',	'ERA_MEDIEVAL',		'JFD_WestAfrican',		'POLICY_IDEALS_JFD_WEST_AFRICAN_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_WEST_AFRICAN_2',		'TXT_KEY_IDEAL_JFD_WEST_AFRICAN_DESC_2',	'TXT_KEY_IDEAL_JFD_WEST_AFRICAN_HELP_2',	'TXT_KEY_IDEAL_JFD_WEST_AFRICAN_HELP_2_REQ',	'ERA_MEDIEVAL',		'JFD_WestAfrican',		'POLICY_IDEALS_JFD_WEST_AFRICAN_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_WEST_AFRICAN_3',		'TXT_KEY_IDEAL_JFD_WEST_AFRICAN_DESC_3',	'TXT_KEY_IDEAL_JFD_WEST_AFRICAN_HELP_3',	'TXT_KEY_IDEAL_JFD_WEST_AFRICAN_HELP_3_REQ',	'ERA_MEDIEVAL',		'JFD_WestAfrican',		'POLICY_IDEALS_JFD_WEST_AFRICAN_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Western
INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_WESTERN_1',			'TXT_KEY_IDEAL_JFD_WESTERN_DESC_1',			'TXT_KEY_IDEAL_JFD_WESTERN_HELP_1',			'TXT_KEY_IDEAL_JFD_WESTERN_HELP_1_REQ',			'ERA_INDUSTRIAL',	'JFD_Western',			'POLICY_IDEALS_JFD_WESTERN_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_WESTERN_2',			'TXT_KEY_IDEAL_JFD_WESTERN_DESC_2',			'TXT_KEY_IDEAL_JFD_WESTERN_HELP_2',			'TXT_KEY_IDEAL_JFD_WESTERN_HELP_2_REQ',			'ERA_INDUSTRIAL',	'JFD_Western',			'POLICY_IDEALS_JFD_WESTERN_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_WESTERN_3',			'TXT_KEY_IDEAL_JFD_WESTERN_DESC_3',			'TXT_KEY_IDEAL_JFD_WESTERN_HELP_3',			'TXT_KEY_IDEAL_JFD_WESTERN_HELP_3_REQ',			'ERA_RENAISSANCE',	'JFD_Western',			'POLICY_IDEALS_JFD_WESTERN_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

--Woodlands
INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_WOODLANDS_1',		'TXT_KEY_IDEAL_JFD_WOODLANDS_DESC_1',		'TXT_KEY_IDEAL_JFD_WOODLANDS_HELP_1',		'TXT_KEY_IDEAL_JFD_WOODLANDS_HELP_1_REQ',		'ERA_CLASSICAL',	'JFD_Woodlands',		'POLICY_IDEALS_JFD_WOODLANDS_1'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_WOODLANDS_2',		'TXT_KEY_IDEAL_JFD_WOODLANDS_DESC_2',		'TXT_KEY_IDEAL_JFD_WOODLANDS_HELP_2',		'TXT_KEY_IDEAL_JFD_WOODLANDS_HELP_2_REQ',		'ERA_RENAISSANCE',	'JFD_Woodlands',		'POLICY_IDEALS_JFD_WOODLANDS_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

INSERT INTO JFD_Ideals	
		(Type,							Description,								Help,										HelpReq,										MaxValidEra,		IdealTag,				PolicyType)
SELECT	'IDEAL_JFD_WOODLANDS_3',		'TXT_KEY_IDEAL_JFD_WOODLANDS_DESC_3',		'TXT_KEY_IDEAL_JFD_WOODLANDS_HELP_3',		'TXT_KEY_IDEAL_JFD_WOODLANDS_HELP_3_REQ',		'ERA_MEDIEVAL',		'JFD_Woodlands',		'POLICY_IDEALS_JFD_WOODLANDS_3'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	
------------------------------------------------------------
-- JFD_Ideals_BuildingRequirements
------------------------------------------------------------
INSERT INTO JFD_Ideals_BuildingRequirements	
		(IdealType,						BuildingClassType1,				RequiresNum,			RequiresHillsOrMountain,		CheckAllCities)
SELECT	'IDEAL_JFD_ANDEAN_3',			'BUILDINGCLASS_SHRINE',			4,						1,								1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);	

INSERT INTO JFD_Ideals_BuildingRequirements	
		(IdealType,						BuildingClassType1,				RequiresNum)
SELECT	'IDEAL_JFD_BANTU_3',			'BUILDINGCLASS_STONE_WORKS',	3
WHERE EXISTS (SELECT Type FROM Yields WHERE Type = 'YIELD_DEFENSE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_BuildingRequirements	
		(IdealType,						BuildingClassType1,				RequiresAllCities)
SELECT	'IDEAL_JFD_CENTRAL_1',			'BUILDINGCLASS_CASTLE',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);	

INSERT INTO JFD_Ideals_BuildingRequirements	
		(IdealType,						BuildingClassType1,				RequiresNum)
SELECT	'IDEAL_JFD_CENTRAL_1',			'BUILDINGCLASS_JFD_MANSION',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);	

INSERT INTO JFD_Ideals_BuildingRequirements	
		(IdealType,						BuildingClassType1,				RequiresNum)
SELECT	'IDEAL_JFD_EAST_INDIES_1',		'BUILDINGCLASS_JFD_MANOR',		3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);	

INSERT INTO JFD_Ideals_BuildingRequirements	
		(IdealType,						BuildingClassType1,				RequiresNum)
SELECT	'IDEAL_JFD_EAST_INDIES_2',		'BUILDINGCLASS_AMPHITHEATER',	3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);	

INSERT INTO JFD_Ideals_BuildingRequirements	
		(IdealType,						BuildingClassType1,				RequiresNum)
SELECT	'IDEAL_JFD_IRANIAN_3',			'BUILDINGCLASS_AQUEDUCT',		3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);	

INSERT INTO JFD_Ideals_BuildingRequirements	
		(IdealType,						BuildingClassType1,				RequiresNum,			RequiresTerrainType,			CheckAllCities)
SELECT	'IDEAL_JFD_ISLAMIC_3',			'BUILDINGCLASS_CARAVANSARY',	3,						'TERRAIN_DESERT',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_BuildingRequirements	
		(IdealType,						BuildingClassType1,				RequiresNum)
SELECT	'IDEAL_JFD_NORTHERN_3',			'BUILDINGCLASS_BARRACKS',		4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);	

INSERT INTO JFD_Ideals_BuildingRequirements	
		(IdealType,						BuildingClassType1,				BuildingClassType2,		RequiresNum,	RequiresOR,		RequiresAllCities)
SELECT	'IDEAL_JFD_ORIENTAL_1',			'BUILDINGCLASS_AQUEDUCT',		Type,					4,				1,				0
FROM BuildingClasses WHERE Type = 'BUILDINGCLASS_JFD_CISTERN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);	

INSERT INTO JFD_Ideals_BuildingRequirements	
		(IdealType,						BuildingClassType1,				RequiresNum,			RequiresAllCities)
SELECT	'IDEAL_JFD_PACIFIC_3',			'BUILDINGCLASS_MONUMENT',		2,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);	

INSERT INTO JFD_Ideals_BuildingRequirements	
		(IdealType,						BuildingClassType1,				RequiresNum,			RequiresConqueredCity,			CheckAllCities,		RequiresAllConqueredCities)
SELECT	'IDEAL_JFD_TOTALITARIAN_2',		'BUILDINGCLASS_JFD_JAIL',		6,						1,								1,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)		
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO JFD_Ideals_BuildingRequirements	
		(IdealType,						BuildingClassType1,				RequiresNum)
SELECT	'IDEAL_JFD_WEST_AFRICAN_1',		'BUILDINGCLASS_STONE_WORKS',	2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Ideals_BuildingRequirements	
		(IdealType,						BuildingClassType1,				RequiresNum,		RequiresAllCities)
SELECT	'IDEAL_JFD_WESTERN_2',			'BUILDINGCLASS_WORKSHOP',		5,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);	
------------------------------------------------------------
-- JFD_Ideals_CityRequirements
------------------------------------------------------------
INSERT INTO JFD_Ideals_CityRequirements	
		(IdealType,														RequiresNum,		RequiresHillRoadConnections)
SELECT	'IDEAL_JFD_ANDEAN_2',											3,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);	

INSERT INTO JFD_Ideals_CityRequirements	
		(IdealType,														RequiresNum,		RequiresStateReligion,		RequiresAllCities)
SELECT	'IDEAL_JFD_EASTERN_2',											4,					1,							1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO JFD_Ideals_CityRequirements	
		(IdealType,														RequiresNum,		RequiresTerrainType,		RequiresPantheon)
SELECT	'IDEAL_JFD_GREAT_PLAINS_3',										2,					'TERRAIN_PLAINS',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Ideals_CityRequirements	
		(IdealType,														RequiresNum,		RequiresMountainHolyCity)
SELECT	'IDEAL_JFD_HIMALAYAN_1',										1,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);	

INSERT INTO JFD_Ideals_CityRequirements	
		(IdealType,														RequiresNum,		RequiresConnections,		RequiresAllCities)
SELECT	'IDEAL_JFD_IRANIAN_2',											3,					1,							1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO JFD_Ideals_CityRequirements	
		(IdealType,														RequiresNum,		RequiresFeatureType,		RequiresAdjacent)
SELECT	'IDEAL_JFD_KATUJE_2',											4,					'FEATURE_JUNGLE',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_CityRequirements	
		(IdealType,														RequiresNum,		RequiresPuppetCapitals)
SELECT	'IDEAL_JFD_MESOAMERICAN_3',										2,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO JFD_Ideals_CityRequirements	
		(IdealType,														RequiresNum,		RequiresWLTKD)
SELECT	'IDEAL_JFD_NORTHERN_2',											1,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_CityRequirements	
		(IdealType,														RequiresNum,		RequiresConnections,		RequiresAllCities)
SELECT	'IDEAL_JFD_PACIFIC_2',											5,					1,							1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_CityRequirements	
		(IdealType,														RequiresNum,		RequiresFeatureType)
SELECT	'IDEAL_JFD_POLAR_1',											2,					'FEATURE_ICE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);	

INSERT INTO JFD_Ideals_CityRequirements	
		(IdealType,														RequiresNum,		RequiresPlotType,			RequiresAdjacent)
SELECT	'IDEAL_JFD_SEMITIC_3',											3,					'PLOT_MOUNTAIN',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);	

INSERT INTO JFD_Ideals_CityRequirements	
		(IdealType,														RequiresNum,		RequiresConquests)
SELECT	'IDEAL_JFD_STEPPE_3',											5,					1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);	

INSERT INTO JFD_Ideals_CityRequirements	
		(IdealType,														RequiresAllCities,	RequiresNumSpecialists)
SELECT	'IDEAL_JFD_ORIENTAL_2',											1,					2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_CityRequirements	
		(IdealType,														RequiresNum,		RequiresLoyaltyType,		RequiresAllCities)
SELECT	'IDEAL_JFD_TOTALITARIAN_3',										4,					'LOYALTY_JFD_PATRIOTIC',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO JFD_Ideals_CityRequirements	
		(IdealType,														RequiresNum,		RequiresColonies,			RequiresHighestNumColonies)
SELECT	'IDEAL_JFD_WESTERN_1',											3,					1,							1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

INSERT INTO JFD_Ideals_CityRequirements	
		(IdealType,														RequiresNum,		RequiresConnections,		RequiresAllCities)
SELECT	'IDEAL_JFD_WOODLANDS_2',										5,					1,							1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);
------------------------------------------------------------
-- JFD_Ideals_FeatureRequirements
------------------------------------------------------------
INSERT INTO JFD_Ideals_FeatureRequirements	
		(IdealType,						FeatureType1,					RequiresNum,			BypassOtherReqs)
SELECT	'IDEAL_JFD_ANDEAN_1',			'FEATURE_EL_DORADO',			1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);		

INSERT INTO JFD_Ideals_FeatureRequirements	
		(IdealType,						FeatureType1,					RequiresNum)
SELECT	'IDEAL_JFD_OCEANIC_2',			'FEATURE_ATOLL',				4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO JFD_Ideals_FeatureRequirements	
		(IdealType,						FeatureType1,					RequiresNum)
SELECT	'IDEAL_JFD_WOODLANDS_3',		'FEATURE_FOREST',				6
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);	
------------------------------------------------------------
-- JFD_Ideals_GlobalRequirements
------------------------------------------------------------
INSERT INTO JFD_Ideals_GlobalRequirements	
		(IdealType,														RequiresNum,			RequiresNaturalWonders)
SELECT	'IDEAL_JFD_ABORIGINAL_2',										1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_GlobalRequirements	
		(IdealType,														RequiresTechType)
SELECT	'IDEAL_JFD_BHARATA_2',											'TECH_CHEMISTRY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO JFD_Ideals_GlobalRequirements	
		(IdealType,														RequiresTechType)
SELECT	'IDEAL_JFD_BHARATA_3',											'TECH_WRITING'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_GlobalRequirements	
		(IdealType,														RequiresNum,			RequiresNationalWonders)
SELECT	'IDEAL_JFD_CLASSICAL_1',										7,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);	

INSERT INTO JFD_Ideals_GlobalRequirements	
		(IdealType,														RequiresNum,			RequiresSocialPolicyBranchesUnlocked)
SELECT	'IDEAL_JFD_COLONIAL_2',											4,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);	

INSERT INTO JFD_Ideals_GlobalRequirements	
		(IdealType,														RequiresNum,			RequiresTiles,	RequiresHighestNum)
SELECT	'IDEAL_JFD_EASTERN_1',											50,						1,				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_GlobalRequirements	
		(IdealType,														RequiresMaxSovereignty,	RequiresGovernment)
SELECT	'IDEAL_JFD_EASTERN_3',											1,						1	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO JFD_Ideals_GlobalRequirements	
		(IdealType,														RequiresStateReligion)
SELECT	'IDEAL_JFD_HIMALAYAN_3',										1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);	

INSERT INTO JFD_Ideals_GlobalRequirements	
		(IdealType,														RequiresNum,			RequiresPopulationConquered)
SELECT	'IDEAL_JFD_IRANIAN_1',											20,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE_LEVIES' AND Value = 1);

INSERT INTO JFD_Ideals_GlobalRequirements	
		(IdealType,														RequiresNum,			RequiresAllies)
SELECT	'IDEAL_JFD_MANDALA_2',											3,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_GlobalRequirements	
		(IdealType,														RequiresStateReligionOther)
SELECT	'IDEAL_JFD_MANDALA_3',											1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO JFD_Ideals_GlobalRequirements	
		(IdealType,														RequiresPantheon)
SELECT	'IDEAL_JFD_MESOAMERICAN_1',										1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);	

INSERT INTO JFD_Ideals_GlobalRequirements	
		(IdealType,														RequiresNum,			RequiresCapital,	RequiresWorldWonders,	RequiresPantheon)
SELECT	'IDEAL_JFD_MESOPOTAMIC_1',										1,						1,					1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_GlobalRequirements	
		(IdealType,														RequiresNum,			RequiresCapital,	RequiresPopulation,		RequiresHighestNum)
SELECT	'IDEAL_JFD_MESOPOTAMIC_2',										12,						1,					1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_GlobalRequirements	
		(IdealType,														RequiresNum,			RequiresTechnologies)
SELECT	'IDEAL_JFD_MESOPOTAMIC_3',										8,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_GlobalRequirements	
		(IdealType,														RequiresNum,			RequiresTilesDiscovered)
SELECT	'IDEAL_JFD_OCEANIC_1',											50,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_GlobalRequirements	
		(IdealType,														RequiresTechType)
SELECT	'IDEAL_JFD_OCEANIC_3',											'TECH_SAILING'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_GlobalRequirements	
		(IdealType,														RequiresGoldenAge,		RequiresGovernment)
SELECT	'IDEAL_JFD_ORIENTAL_3',											1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO JFD_Ideals_GlobalRequirements	
		(IdealType,														RequiresPantheon)
SELECT	'IDEAL_JFD_POLAR_3',											1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO JFD_Ideals_GlobalRequirements	
		(IdealType,														RequiresPietyLevel)
SELECT	'IDEAL_JFD_SEMITIC_1',											'PIETY_LEVEL_JFD_DEVOUT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

INSERT INTO JFD_Ideals_GlobalRequirements	
		(IdealType,														RequiresNum,			RequiresTradeRoutesDiffCiv)
SELECT	'IDEAL_JFD_STEPPE_2',											4,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);	

INSERT INTO JFD_Ideals_GlobalRequirements	
		(IdealType,														RequiresNum,			RequiresMercContracts)
SELECT	'IDEAL_JFD_SOUTHERN_1',											3,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);	

INSERT INTO JFD_Ideals_GlobalRequirements	
		(IdealType,														RequiresReligion,		RequiresNum,				RequiresHighestNum,			RequiresWorldFollowers)
SELECT	'IDEAL_JFD_SOUTHERN_3',											1,						20,							1,							1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);	

INSERT INTO JFD_Ideals_GlobalRequirements	
		(IdealType,														RequiresNum,			RequiresTradeRoutesInternal)
SELECT	'IDEAL_JFD_TOTALITARIAN_1',										5,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);	

INSERT INTO JFD_Ideals_GlobalRequirements	
		(IdealType,														RequiresNum,			RequiresPopulation,			RequiresPantheon)
SELECT	'IDEAL_JFD_WEST_AFRICAN_2',										12,						1,							1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_GlobalRequirements	
		(IdealType,														RequiresNum,			RequiresTradeRoutesDomain,	RequiresPantheon)
SELECT	'IDEAL_JFD_WOODLANDS_1',										2,						'DOMAIN_LAND',				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);
------------------------------------------------------------
-- JFD_Ideals_GreatWorkRequirements
------------------------------------------------------------
INSERT INTO JFD_Ideals_GreatWorkRequirements	
		(IdealType,						RequiresNum)
SELECT	'IDEAL_JFD_HIMALAYAN_2',		4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_GreatWorkRequirements	
		(IdealType,						RequiresGreatWorksType,			RequiresNum,			RequiresHighestNum)
SELECT	'IDEAL_JFD_SOUTHERN_2',			'GREAT_WORK_ART',				3,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);
------------------------------------------------------------
-- JFD_Ideals_ImprovementRequirements
------------------------------------------------------------
INSERT INTO JFD_Ideals_ImprovementRequirements	
		(IdealType,						ImprovementType1,				RequiresNum)
SELECT	'IDEAL_JFD_BANTU_2',			'IMPROVEMENT_PASTURE',			4
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);		

INSERT INTO JFD_Ideals_ImprovementRequirements	
		(IdealType,						ImprovementType1,				ImprovementType2,							RequiresNum,	RequiresOR)
SELECT	'IDEAL_JFD_ISLAMIC_1',			'IMPROVEMENT_ACADEMY',			'IMPROVEMENT_JFD_SANATORIUM',				3,				1	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);	

INSERT INTO JFD_Ideals_ImprovementRequirements	
		(IdealType,						ImprovementType1,				ImprovementType2,			RequiresNum,	RequiresOR,		RequiresAllCities)
SELECT	'IDEAL_JFD_MANDALA_1',			'IMPROVEMENT_JFD_VILLAGE',		'IMPROVEMENT_JFD_TOWN',		4,				1,				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);		

INSERT INTO JFD_Ideals_ImprovementRequirements	
		(IdealType,						ImprovementType1,				RequiresNum,	IsCapital)
SELECT	'IDEAL_JFD_SAHARAN_3',			'IMPROVEMENT_ACADEMY',			2,				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);	

INSERT INTO JFD_Ideals_ImprovementRequirements	
		(IdealType,						ImprovementType1,				RequiresNum,	RequiresOR)
SELECT	'IDEAL_JFD_POLAR_2',			'IMPROVEMENT_CAMP',				3,				2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);	
------------------------------------------------------------
-- JFD_Ideals_ReformRequirements
------------------------------------------------------------
INSERT INTO JFD_Ideals_ReformRequirements	
		(IdealType,						ReformType1,							ReformType2,									RequiresOR)
SELECT	'IDEAL_JFD_COLONIAL_2',			'REFORM_JFD_CONSTITUTION_CODIFIED',		'REFORM_JFD_CONSTITUTION_UNCODIFIED',			1	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);		
------------------------------------------------------------
-- JFD_Ideals_ResourceRequirements
------------------------------------------------------------
INSERT INTO JFD_Ideals_ResourceRequirements	
		(IdealType,						ResourceType1,					ResourceType2,				ResourceType3,			ResourceType4,			ResourceType5,			RequiresNum,	RequiresOR)
SELECT	'IDEAL_JFD_ANDEAN_1',			'RESOURCE_GOLD',				'RESOURCE_SILVER',			'RESOURCE_COPPER',		NULL,					NULL,					5,				1	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_ResourceRequirements	
		(IdealType,						ResourceType1,					ResourceType2,				ResourceType3,			ResourceType4,			ResourceType5,			RequiresNum,	RequiresOR)
SELECT	'IDEAL_JFD_EAST_INDIES_3',		'RESOURCE_SPICES',				'RESOURCE_PEPPER',			'RESOURCE_CLOVES',		'RESOURCE_NUTMEG',		'RESOURCE_JFD_GINGER',	4,				1	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_ResourceRequirements	
		(IdealType,						ResourceType1,					ResourceType2,				ResourceType3,			ResourceType4,			ResourceType5,			RequiresNum,	RequiresOR)
SELECT	'IDEAL_JFD_GREAT_PLAINS_1',		'RESOURCE_BISON',				'RESOURCE_TRUFFLES',		'RESOURCE_IVORY',		'RESOURCE_FUR',			'RESOURCE_DEER',		5,				1	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_ResourceRequirements	
		(IdealType,						ResourceType1,					ResourceType2,				ResourceType3,			ResourceType4,			ResourceType5,			RequiresNum,	RequiresHighestNum,		IncludesImport)
SELECT	'IDEAL_JFD_GREAT_PLAINS_2',		'RESOURCE_HORSE',				NULL,						NULL,					NULL,					NULL,					12,				0,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_ResourceRequirements	
		(IdealType,						ResourceType1,					ResourceType2,				ResourceType3,			ResourceType4,			ResourceType5,			RequiresNum,	RequiresHighestNum,		IncludesImport)
SELECT	'IDEAL_JFD_MESOAMERICAN_2',		'RESOURCE_JFD_SHACKLES',		NULL,						NULL,					NULL,					NULL,					40,				1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO JFD_Ideals_ResourceRequirements	
		(IdealType,						ResourceType1,					ResourceType2,				ResourceType3,			ResourceType4,			ResourceType5,			RequiresNum,	RequiresOR,				IncludesImport)
SELECT	'IDEAL_JFD_PACIFIC_1',			'RESOURCE_FISH',				'RESOURCE_CRAB',			'RESOURCE_WHALE',		'RESOURCE_MC_ORCA',		'RESOURCE_MC_SALMON',	5,				1,						0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

INSERT INTO JFD_Ideals_ResourceRequirements	
		(IdealType,						ResourceType1,					ResourceType2,				ResourceType3,			ResourceType4,			ResourceType5,			RequiresNum,	RequiresHighestNum,		IncludesImport)
SELECT	'IDEAL_JFD_STEPPE_1',			'RESOURCE_HORSE',				NULL,						NULL,					NULL,					NULL,					6,				1,						0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_ResourceRequirements	
		(IdealType,						ResourceType1,					ResourceType2,				ResourceType3,			ResourceType4,			ResourceType5,			RequiresNum,	RequiresOR,				IncludesImport)
SELECT	'IDEAL_JFD_WEST_AFRICAN_3',		'RESOURCE_STONE',				'RESOURCE_IRON',			'RESOURCE_COPPER',		NULL,					NULL,					4,				1,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);
------------------------------------------------------------
-- JFD_Ideals_SpecialistRequirements
------------------------------------------------------------
INSERT INTO JFD_Ideals_SpecialistRequirements	
		(IdealType,						SpecialistType1,				SpecialistType2,				SpecialistType3,		SpecialistType4,		CheckAllCities)
SELECT	'IDEAL_JFD_BHARATA_1',			'SPECIALIST_MERCHANT',			'SPECIALIST_JFD_MONK',			'SPECIALIST_ENGINEER',	'SPECIALIST_SCIENTIST',	1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)		
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);	

INSERT INTO JFD_Ideals_SpecialistRequirements	
		(IdealType,						SpecialistType1,				SpecialistType2,				RequiresNum,			RequiresOR)
SELECT	'IDEAL_JFD_CENTRAL_2',			'SPECIALIST_JFD_DIGNITARY',		'SPECIALIST_JFD_MAGISTRATE',	4,						1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);		

INSERT INTO JFD_Ideals_SpecialistRequirements	
		(IdealType,						SpecialistType1,				RequiresNum,					CheckAllCities)
SELECT	'IDEAL_JFD_HIMALAYAN_3',		'SPECIALIST_JFD_MONK',			1,								1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);	

INSERT INTO JFD_Ideals_SpecialistRequirements	
		(IdealType,						SpecialistType1,				RequiresNum,					RequiresHighestNum)
SELECT	'IDEAL_JFD_SEMITIC_2',			'SPECIALIST_MERCHANT',			4,								1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);	
------------------------------------------------------------
-- JFD_Ideals_UnitRequirements
------------------------------------------------------------
INSERT INTO JFD_Ideals_UnitRequirements	
		(IdealType,														RequiresNum,				RequiresPromotionType)
SELECT	'IDEAL_JFD_ABORIGINAL_3',										2,							'PROMOTION_SURVIVALISM_2'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_UnitRequirements	
		(IdealType,														RequiresHighestNum,			RequiresUnitCombatType)
SELECT	'IDEAL_JFD_BHARATA_2',											1,							'UNITCOMBAT_SIEGE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO JFD_Ideals_UnitRequirements	
		(IdealType,														RequiresNum,				RequiresHighestNum,				RequiresUnitClassType1)
SELECT	'IDEAL_JFD_CLASSICAL_3',										2,							1,								'UNITCLASS_GREAT_GENERAL'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_UnitRequirements	
		(IdealType,														RequiresNum,				RequiresLevel)
SELECT	'IDEAL_JFD_CENTRAL_3',											4,							5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_UnitRequirements	
		(IdealType,														RequiresNum,				RequiresLevel,					RequiresUnitCombatType)
SELECT	'IDEAL_JFD_KATUJE_1',											3,							4,								'UNITCOMBAT_ARCHER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_UnitRequirements	
		(IdealType,														RequiresNum,				RequiresUnitClassType1,			RequiresUnitClassType2)
SELECT	'IDEAL_JFD_NORTHERN_1',											3,							'UNITCLASS_GREAT_GENERAL',		'UNITCLASS_GREAT_ADMIRAL'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_UnitRequirements	
		(IdealType,														RequiresNum,				RequiresPromotionType)
SELECT	'IDEAL_JFD_SAHARAN_1',											4,							'PROMOTION_JFD_ENSLAVED'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

INSERT INTO JFD_Ideals_UnitRequirements	
		(IdealType,														RequiresNum,				RequiresNavalUnits,				RequiresHighestNum)
SELECT	'IDEAL_JFD_WESTERN_3',											10,							1,								1	
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);
------------------------------------------------------------
-- JFD_Ideals_YieldRequirements
------------------------------------------------------------
INSERT INTO JFD_Ideals_YieldRequirements	
		(IdealType,						YieldType,						RequiresHighestPerTurn,		RequiresMinimumPerTurn)
SELECT	'IDEAL_JFD_ABORIGINAL_1',		'YIELD_CULTURE',				0,							10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_YieldRequirements	
		(IdealType,						YieldType,						RequiresHighestPerTurn,		RequiresMinimumPerTurn)
SELECT	'IDEAL_JFD_BANTU_1',			'YIELD_FAITH',					1,							5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);

INSERT INTO JFD_Ideals_YieldRequirements	
		(IdealType,						YieldType,						RequiresHighestPerTurn,		RequiresMinimumPerTurn)
SELECT	'IDEAL_JFD_BHARATA_3',			'YIELD_FAITH',					0,							15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_YieldRequirements	
		(IdealType,						YieldType,						RequiresHighestPerTurn,		RequiresMinimumPerTurn)
SELECT	'IDEAL_JFD_CLASSICAL_2',		'YIELD_SCIENCE',				1,							25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_YieldRequirements	
		(IdealType,						YieldType,						RequiresHighestPerTurn,		RequiresMinimumPerTurn)
SELECT	'IDEAL_JFD_COLONIAL_3',			'YIELD_CULTURE',				1,							50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO JFD_Ideals_YieldRequirements	
		(IdealType,						YieldType,						RequiresMinimumStored)
SELECT	'IDEAL_JFD_HIMALAYAN_3',		'YIELD_FAITH',					300
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);	

INSERT INTO JFD_Ideals_YieldRequirements	
		(IdealType,						YieldType,						RequiresMinimumStored)
SELECT	'IDEAL_JFD_ISLAMIC_2',			'YIELD_FAITH',					500
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_YieldRequirements	
		(IdealType,						YieldType,						RequiresMinimumStored)
SELECT	'IDEAL_JFD_KATUJE_3',			'YIELD_FAITH',					120
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0);

INSERT INTO JFD_Ideals_YieldRequirements	
		(IdealType,						YieldType,						RequiresMinimumPerTurn)
SELECT	'IDEAL_JFD_MESOAMERICAN_1',		'YIELD_SCIENCE',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 1);	

INSERT INTO JFD_Ideals_YieldRequirements	
		(IdealType,						YieldType,						RequiresHighestPerTurn,		RequiresMinimumPerTurn)
SELECT	'IDEAL_JFD_POLAR_3',			'YIELD_FAITH',					0,							25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO JFD_Ideals_YieldRequirements	
		(IdealType,						YieldType,						RequiresHighestStored,		RequiresMinimumStored)
SELECT	'IDEAL_JFD_SAHARAN_2',			'YIELD_GOLD',					1,							2000
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE_NO_CONDITIONS' AND Value = 0)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================