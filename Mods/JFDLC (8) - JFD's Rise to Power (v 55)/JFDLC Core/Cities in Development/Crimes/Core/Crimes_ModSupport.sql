--==========================================================================================================================
-- COMMUNITY BALANCE PATCH
--==========================================================================================================================
-- Defines
------------------------
UPDATE Defines
SET Value = 0
WHERE Name = 'BALANCE_UNHAPPINESS_PER_SPECIALIST'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1);
------------------------
-- Buildings
------------------------
UPDATE Buildings
SET Cost = 140
WHERE Type = 'BUILDING_JFD_JAIL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1);

UPDATE Buildings
SET PrereqTech = 'TECH_CHIVALRY'
WHERE Type = 'BUILDING_JFD_TOWER_LONDON'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1);

UPDATE Buildings
SET NumPoliciesNeeded = 6
WHERE Type = 'BUILDING_JFD_TOWER_LONDON'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1);
------------------------
-- Building_JFD_CrimeMods
------------------------
--INSERT INTO Building_JFD_CrimeMods
--		(BuildingType,		CrimeType,				GlobalCrimeMod,	CrimeMod)
--SELECT	Type,				'CRIME_JFD_GOLD',		-5,				-10
--FROM Buildings WHERE Type = 'BUILDING_GREAT_COTHON'
--AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1);
------------------------
-- Building_JFD_HelpTexts
------------------------
--INSERT INTO Building_JFD_HelpTexts
--		(BuildingType,		HelpText,											IsWrittenFirst)
--SELECT	Type,				'TXT_KEY_WONDER_JFD_NATIONAL_TREASURY_HELP_CRIME',	1
--FROM Buildings WHERE Type = 'BUILDING_GREAT_COTHON'
--AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1);
------------------------
-- Policies
------------------------
UPDATE Policy_JFD_CrimeMods
SET PolicyType = 'POLICY_COLLECTIVE_RULE'
WHERE PolicyType = 'POLICY_REPUBLIC'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_POLICY_CHANGES_REPUBLIC' AND Value = 1);

UPDATE Policy_JFD_CrimeMods
SET PolicyType = 'POLICY_FREE_THOUGHT'
WHERE PolicyType = 'POLICY_SCIENTIFIC_REVOLUTION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_POLICY_CHANGES_SCIENTIFIC_REVOLUTION' AND Value = 1);

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]City Planning[ENDCOLOR][NEWLINE] Cities earn +10 [ICON_FOOD] Food and [ICON_CULTURE] Culture when they construct Buildings. Bonuses scale with Era. Reduces [ICON_JFD_CRIME_BLACK] Crime from [ICON_JFD_CRIME_PRODUCTION] Theft by 15% in all cities.'
WHERE Tag = 'TXT_KEY_POLICY_COLLECTIVE_RULE_HELP' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_POLICY_CHANGES_REPUBLIC' AND Value = 1);

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Free Thought[ENDCOLOR][NEWLINE]+3 [ICON_RESEARCH] Science and +2 [ICON_CULTURE] Culture from Villages, and -100% [ICON_HAPPINESS_3] Religious Unrest in all cities. Reduces [ICON_JFD_CRIME_BLACK] Crime from [ICON_JFD_CRIME_SCIENCE] Fraud by 15% in all cities.'
WHERE Tag = 'TXT_KEY_POLICY_FREE_THOUGHT_HELP' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_POLICY_CHANGES_SCIENTIFIC_REVOLUTION' AND Value = 1);
--==========================================================================================================================
-- JFD CITIES IN DEVELOPMENT
--==========================================================================================================================
-- Unit_BuildOnFound
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_BuildOnFound 	
		(UnitType, 						BuildingClassType)
SELECT	'UNIT_JFD_COLONIST', 			'BUILDINGCLASS_JFD_JAIL'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_UNIT_ADDITIONS_COLONIST' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Unit_BuildOnFound 	
		(UnitType, 						BuildingClassType)
SELECT	'UNIT_SPANISH_CONQUISTADOR', 	'BUILDINGCLASS_JFD_JAIL'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_UNIT_ADDITIONS_COLONIST' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
--==========================================================================================================================
-- SUKRITACT EVENTS & DECISIONS
--==========================================================================================================================
-- EventsAddin_Support
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) SELECT ('JFD_CID_Crimes_Events.lua')
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================