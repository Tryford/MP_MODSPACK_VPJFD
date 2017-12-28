--==========================================================================================================================
-- SUKRITACT EVENTS & DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
DELETE FROM DecisionsAddin_Support WHERE FileName IN ('CoreDecisions.lua', 'CivDecisions.lua', 'ReligiousDecisions.lua');

INSERT INTO DecisionsAddin_Support 
		(FileName) 
SELECT  'JFD_CoreDecisions.lua'
WHERE EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');

INSERT INTO DecisionsAddin_Support 
		(FileName) 
SELECT  'JFD_CivDecisions2.lua'
WHERE EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');

INSERT INTO DecisionsAddin_Support 
		(FileName) 
SELECT  'JFD_ReligiousDecisions.lua'
WHERE EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');

INSERT INTO DecisionsAddin_Support 
		(FileName) 
SELECT  'JFD_ReligiousDecisions.lua'
WHERE EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');
--==========================================================================================================================
-- CURRENCY SYSTEMS
--==========================================================================================================================
-- Decision_JFD_CurrencySystems
--------------------------------------------------------------------------------------------------------------------------	
--==========================================================================================================================
-- WRITING SYSTEMS
--==========================================================================================================================
-- JFD_WritingSystems
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO JFD_WritingSystems
		(Type, 										IsUnique,	Description, 									Help, 											PolicyType,									IconString, IconAtlas,								PortraitIndex)
VALUES 	('WRITING_SYSTEM_JFD_ARABIC_DESC', 			0,			'TXT_KEY_WRITING_SYSTEM_JFD_ARABIC_DESC', 		'TXT_KEY_WRITING_SYSTEM_JFD_ARABIC_HELP', 		'POLICY_WRITING_SYSTEM_JFD_ARABIC', 		'', 		'JFD_DECISIONS_WRITING_SYSTEMS_ATLAS', 	0),
		('WRITING_SYSTEM_JFD_BRAHMI_DESC', 			0,			'TXT_KEY_WRITING_SYSTEM_JFD_BRAHMI_DESC', 		'TXT_KEY_WRITING_SYSTEM_JFD_BRAHMI_HELP', 		'POLICY_WRITING_SYSTEM_JFD_BRAHMI', 		'', 		'JFD_DECISIONS_WRITING_SYSTEMS_ATLAS', 	1),
		('WRITING_SYSTEM_JFD_CUNIEFORM_DESC', 		0,			'TXT_KEY_WRITING_SYSTEM_JFD_CUNIEFORM_DESC', 	'TXT_KEY_WRITING_SYSTEM_JFD_CUNIEFORM_HELP', 	'POLICY_WRITING_SYSTEM_JFD_CUNIEFORM', 		'', 		'JFD_DECISIONS_WRITING_SYSTEMS_ATLAS', 	3),
		('WRITING_SYSTEM_JFD_CYRILLIC_DESC', 		0,			'TXT_KEY_WRITING_SYSTEM_JFD_CYRILLIC_DESC', 	'TXT_KEY_WRITING_SYSTEM_JFD_CYRILLIC_HELP', 	'POLICY_WRITING_SYSTEM_JFD_CYRILLIC', 		'', 		'JFD_DECISIONS_WRITING_SYSTEMS_ATLAS', 	4),
		('WRITING_SYSTEM_JFD_DEVANAGARI_DESC', 		1,			'TXT_KEY_WRITING_SYSTEM_JFD_DEVANAGARI_DESC', 	'TXT_KEY_WRITING_SYSTEM_JFD_DEVANAGARI_HELP', 	'POLICY_WRITING_SYSTEM_JFD_DEVANAGARI', 	'', 		'JFD_DECISIONS_WRITING_SYSTEMS_ATLAS', 	4),
		('WRITING_SYSTEM_JFD_HANGUL_DESC', 			1,			'TXT_KEY_WRITING_SYSTEM_JFD_HANGUL_DESC', 		'TXT_KEY_WRITING_SYSTEM_JFD_HANGUL_HELP', 		'POLICY_WRITING_SYSTEM_JFD_HANGUL', 		'', 		'JFD_DECISIONS_WRITING_SYSTEMS_ATLAS', 	5),
		('WRITING_SYSTEM_JFD_HANZI_DESC', 			0,			'TXT_KEY_WRITING_SYSTEM_JFD_HANZI_DESC', 		'TXT_KEY_WRITING_SYSTEM_JFD_HANZI_HELP', 		'POLICY_WRITING_SYSTEM_JFD_HANZI', 			'', 		'JFD_DECISIONS_WRITING_SYSTEMS_ATLAS', 	7),
		('WRITING_SYSTEM_JFD_HEBREW_DESC', 			0,			'TXT_KEY_WRITING_SYSTEM_JFD_HEBREW_DESC', 		'TXT_KEY_WRITING_SYSTEM_JFD_HEBREW_HELP', 		'POLICY_WRITING_SYSTEM_JFD_HEBREW', 		'', 		'JFD_DECISIONS_WRITING_SYSTEMS_ATLAS', 	5),
		('WRITING_SYSTEM_JFD_HEIROGLYPHS_DESC', 	0,			'TXT_KEY_WRITING_SYSTEM_JFD_HEIROGLYPHS_DESC', 	'TXT_KEY_WRITING_SYSTEM_JFD_HEIROGLYPHS_HELP', 	'POLICY_WRITING_SYSTEM_JFD_HEIROGLYPHS', 	'', 		'JFD_DECISIONS_WRITING_SYSTEMS_ATLAS', 	2),
		('WRITING_SYSTEM_JFD_LATIN_DESC', 			0,			'TXT_KEY_WRITING_SYSTEM_JFD_LATIN_DESC', 		'TXT_KEY_WRITING_SYSTEM_JFD_LATIN_HELP', 		'POLICY_WRITING_SYSTEM_JFD_LATIN', 			'', 		'JFD_DECISIONS_WRITING_SYSTEMS_ATLAS', 	6),
		('WRITING_SYSTEM_JFD_QUECHUA_DESC', 		0,			'TXT_KEY_WRITING_SYSTEM_JFD_QUECHUA_DESC', 		'TXT_KEY_WRITING_SYSTEM_JFD_QUECHUA_HELP', 		'POLICY_WRITING_SYSTEM_JFD_QUECHUA', 		'', 		'JFD_DECISIONS_WRITING_SYSTEMS_ATLAS', 	8),
		('WRITING_SYSTEM_JFD_RUNIC_DESC', 			0,			'TXT_KEY_WRITING_SYSTEM_JFD_RUNIC_DESC', 		'TXT_KEY_WRITING_SYSTEM_JFD_RUNIC_HELP', 		'POLICY_WRITING_SYSTEM_JFD_RUNIC', 			'', 		'JFD_DECISIONS_WRITING_SYSTEMS_ATLAS', 	9),
		('WRITING_SYSTEM_JFD_THAI_DESC', 			1,			'TXT_KEY_WRITING_SYSTEM_JFD_THAI_DESC', 		'TXT_KEY_WRITING_SYSTEM_JFD_THAI_HELP', 		'POLICY_WRITING_SYSTEM_JFD_THAI', 			'', 		'JFD_DECISIONS_WRITING_SYSTEMS_ATLAS', 	9);
--------------------------------------------------------------------------------------------------------------------------
-- Policies
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Policies
		(Type, 										Description)
VALUES 	('POLICY_WRITING_SYSTEM_JFD_ARABIC', 		'TXT_KEY_WRITING_SYSTEM_JFD_ARABIC_DESC'),
		('POLICY_WRITING_SYSTEM_JFD_BRAHMI', 		'TXT_KEY_WRITING_SYSTEM_JFD_BRAHMI_DESC'),
		('POLICY_WRITING_SYSTEM_JFD_CUNIEFORM', 	'TXT_KEY_WRITING_SYSTEM_JFD_CUNIEFORM_DESC'),
		('POLICY_WRITING_SYSTEM_JFD_CYRILLIC', 		'TXT_KEY_WRITING_SYSTEM_JFD_CYRILLIC_DESC'),
		('POLICY_WRITING_SYSTEM_JFD_HEBREW', 		'TXT_KEY_WRITING_SYSTEM_JFD_HEBREW_DESC'),
		('POLICY_WRITING_SYSTEM_JFD_HEIROGLYPHS', 	'TXT_KEY_WRITING_SYSTEM_JFD_HEIROGLYPHS_DESC'),
		('POLICY_WRITING_SYSTEM_JFD_QUECHUA', 		'TXT_KEY_WRITING_SYSTEM_JFD_QUECHUA_DESC'),
		('POLICY_WRITING_SYSTEM_JFD_LATIN', 		'TXT_KEY_WRITING_SYSTEM_JFD_LATIN_DESC'),
		('POLICY_WRITING_SYSTEM_JFD_HANZI', 		'TXT_KEY_WRITING_SYSTEM_JFD_HANZI_DESC'),
		('POLICY_WRITING_SYSTEM_JFD_RUNIC', 		'TXT_KEY_WRITING_SYSTEM_JFD_RUNIC_DESC');
--==========================================================================================================================
--==========================================================================================================================