--==========================================================================================================================
-- DEFINES
--==========================================================================================================================
-- Defines
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_LOYALTY_AI_BONUS',						0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_LOYALTY_DEFAULT_FROM_CONNECTIONS',		5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_LOYALTY_DEFAULT_FROM_GARRISON',		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_LOYALTY_DEFAULT_FROM_ELIMINATION',		30
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_LOYALTY_DEFAULT_FROM_PUPPET',			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_LOYALTY_DEFAULT_FROM_SPY',				30
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_LOYALTY_DEFAULT_REVOLT_THRESHOLD',		100
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_LOYALTY_DEFAULT_WLTKD_THRESHOLD',		100
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_LOYALTY_RAZING_PENALTY',				3
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_LOYALTY_RESISTANCE_PENALTY',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_LOYALTY_STARVATION_PENALTY',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

INSERT INTO Defines
		(Name,											Value)
SELECT	'JFD_CID_LOYALTY_UNEMPLOYMENT_PENALTY',			2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);
--==========================================================================================================================	
-- POLICIES
--==========================================================================================================================			
-- Policies
--------------------------------------------------------------------------------------------------------------------------
UPDATE Policies
SET Help = 'TXT_KEY_POLICY_JFD_MILITARY_CASTE_HELP', JFD_LoyaltyGarrisonLevels = 1
WHERE Type = 'POLICY_MILITARY_CASTE' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_POLICY_CHANGES_MILITARY_CASTE' AND Value = 1);
----==========================================================================================================================
-- TEXT
----==========================================================================================================================	
-- Language_en_US
----------------------------------------------------------------------------------------------------------------------------	
UPDATE Language_en_US
SET Text = 'By turning the City into a [COLOR_POSITIVE_TEXT]Puppet[ENDCOLOR], it will generate Gold, Science, Culture, etc. for you, but you [COLOR_POSITIVE_TEXT]may not choose what it produces[ENDCOLOR] or customize the City.[NEWLINE][NEWLINE]It will contribute much less [ICON_HAPPINESS_4] than an Annexed City, and will not increase the cost of your Social Policies and Great People. It will also reduce [ICON_JFD_RED_FIST] Disloyalty from [ICON_CITIZEN] Population. If you choose this, you may later Annex the City at any point.[NEWLINE][NEWLINE]Puppeting this City will increase [ICON_HAPPINESS_4] Unhappiness by {1_Num}.'
WHERE Tag = 'TXT_KEY_POPUP_CITY_CAPTURE_INFO_PUPPET' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CITIES' AND Value > 1);

UPDATE Language_en_US
SET Text = 'Click to move {1_SpyRank} {2_SpyName} to a new location.[NEWLINE][NEWLINE]When a spy is directed to move to a new city, it takes a number of turns before it becomes fully effective.[NEWLINE][NEWLINE]If the spy is moving to its owner''s city, it will begin counter-espionage to uncover and kill enemy spies. It will also increase [ICON_JFD_BLUE_FIST] Loyalty in the city.[NEWLINE][NEWLINE]If a spy is moved to a city that is owned by a another civilization, the spy will begin trying to steal a technology from that civilization. A spy can only steal from a civilization that knows any technology that the spy''s owner does not. If the owner of the city has a spy defending the city, your spy has a chance of being discovered and killed. This may strain diplomatic relations![NEWLINE][NEWLINE]If the spy moves to a city that is a City-State, the spy will attempt to rig the elections to increase your influence over the city-state.'
WHERE Tag = 'TXT_KEY_EO_SPY_MOVE_TT' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CITIES' AND Value > 1);
--==========================================================================================================================
--==========================================================================================================================