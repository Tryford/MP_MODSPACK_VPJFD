--==========================================================================================================================
-- USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 											text 										default NULL,
	Value 											integer 									default 1);
--------------------------------------------------------------------------	
-- Modular Features that can be toggled on and off and then back on.
--------------------------------------------------------------------------
/*
Allows support for various third-party mods. 
  1 = Enabled (Default)
  0 = Disabled
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,															Value)
VALUES	('JFD_RTP_COMMUNITY_BALANCE_PATCH',								0), --Community Balance Patch (automatically switches on as needed).
		('JFD_RTP_COMMUNITY_BALANCE_PATCH_RELIGIOUS_BUILDINGS',			1); --Overrides CBP's Religious Buildings with Piety's.

UPDATE JFD_GlobalUserSettings
SET Value = 1
WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH'
AND EXISTS (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WELL');
--==========================================================================================================================	
-- MISC
--==========================================================================================================================	
/*
CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,															Value)
VALUES	('JFD_RTP_MISC_CLOCK',											1); --Adds the current time to the Top Panel.
--==========================================================================================================================	
-- CLAIMS
--==========================================================================================================================	
/*
CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,															Value)
VALUES	('JFD_RTP_CLAIMS_CORE',											1), --Core functionality (Dignitary/Magistrate stuff). 
		('JFD_RTP_CLAIMS_CORE_CLAIMS',									1), --Adds ability to peacefully annex CSs with Claims.
		('JFD_RTP_CLAIMS_CORE_PTP_THRESHOLD',							1), --Must be in the top 60% of Military Powers in order to Pledge to Protect.
		('JFD_RTP_CLAIMS_CORE_CULTURE_CAUSE',							0), --Adds Cause based on same Culture Type.
		('JFD_RTP_CLAIMS_BUILDING_CHANGES_FORGES',						1), --Changes to the Forge (Production on Copper and Iron).
		('JFD_RTP_CLAIMS_BUILDING_CHANGES_WINDMILL',					1), --Changes to the Windmill (10% Food; no Building Production).
		('JFD_RTP_CLAIMS_GREAT_PERSON_CHANGES',							1), --Changes to Great Dignitary/Magistrate/Merchant/Engineer/Scientist (separates counters).
		('JFD_RTP_CLAIMS_POLICY_CHANGES_LIBERTY_OPENER',				1), --Changes to Liberty Opener (unlocks Forum Romanum, Great Magistrate faith purchases).
		('JFD_RTP_CLAIMS_POLICY_CHANGES_PATRONAGE_FINISHER',			1), --Changes to Patronage Finisher (Great Dignitary faith purchases).
		('JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS',					1), --Adds Code of Laws Tech to the Medieval Era.
		('JFD_RTP_CLAIMS_TECH_ADDITIONS_JURISPRUDENCE',					1), --Adds Jurisprudence Tech to the Medieval Era.
		('JFD_RTP_CLAIMS_TECH_ADDITIONS_NOBILITY',						1), --Adds Nobility Tech to the Medieval Era.
		('JFD_RTP_CLAIMS_WONDER_ADDITIONS_FORUM',						1), --Adds the Forum Romanum (Magistrate Court in all cities).
		('JFD_RTP_CLAIMS_WONDER_ADDITIONS_WESTMINSTER',					1), --Adds Westminster Abbey (Faith and Culture during WLTKD).
		('JFD_RTP_CLAIMS_WONDER_CHANGES_BIG_BEN',						1), --Changes to Big Ben (Great Magistrate Points).
		('JFD_RTP_CLAIMS_WONDER_CHANGES_FORBIDDEN_PALACE',				1); --Changes to Forbidden Palace (Great Magistrate Points).
--==========================================================================================================================	
-- EPITHETS
--==========================================================================================================================	
-- Modular Features that can be toggled on and off and then back on.
--------------------------------------------------------------------------
/*CORE SETTINGS
---------------
  1 = Enabled (Default)
  0 = Disabled
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,															Value)
VALUES	('JFD_RTP_EPITHETS_CORE',										1); --Core functionality.
--==========================================================================================================================	
-- MERCENARIES
--==========================================================================================================================	
-- Modular Features that can be toggled on and off and then back on.
--------------------------------------------------------------------------
/*CORE SETTINGS
---------------
  1 = Enabled (Default)
  0 = Disabled
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,															Value)
VALUES	('JFD_RTP_MERCENARIES_CORE',									1), --Core functionality.
		('JFD_RTP_MERCENARIES_CORE_AI_CAP',								2), --Number of concurrent Contracts the AI is allowed to take out.
		('JFD_RTP_MERCENARIES_CORE_DEFAULT_UNIT_COUNT',					3), --Likelihood of default units being tied to a Contract over unique units (3 == 3x).
		('JFD_RTP_MERCENARIES_CORE_FIRST_NOTIFICATION_TURNS',			10),--Turns before a Notification is send about impending Contract expiration (first time). 0 to disable.
		('JFD_RTP_MERCENARIES_CORE_SECOND_NOTIFICATION_TURNS',			5),	--Turns before a Notification is send about impending Contract expiration (second time). 0 to disable.
		('JFD_RTP_MERCENARIES_RELIGIOUS',								1), --Enables Holy Order contracts (that cost Piety).
		('JFD_RTP_MERCENARIES_RESOLUTION_ADDITIONS',					1), --Adds Ban Mercenaries Resolution.
		('JFD_RTP_MERCENARIES_POLICY_CHANGES',							1), --Changes to Mercenary Army (Reduced Contract cost).
		('JFD_RTP_MERCENARIES_TECH_ADDITIONS',							1), --Adds Mercenaries Technology to the Classical Era.
		('JFD_RTP_MERCENARIES_TECH_CHANGES_TERRACOTTA',					1), --Moves Terracotta Army to Mercenaries.
		('JFD_RTP_MERCENARIES_WONDER_ADDITIONS_JIAUGYUAN',				1); --Adds Jiayuguan Fort (Extends Contract length).
--==========================================================================================================================	
-- PIETY
--==========================================================================================================================
/*
CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type, 															Value)
VALUES	('JFD_RTP_PIETY_CORE', 											1), --Core functionality.
		--('JFD_RTP_PIETY_CORE_LOSS_FROM_OTHER_CITIES', 					1), --For Founders, Piety also decays based upon how many cities not following your SR of Civilizations that are.
		('JFD_RTP_PIETY_CORE_PRESSURE_HALF', 							0), --Halves religious pressure emanated by cities.
		('JFD_RTP_PIETY_CORE_PRESSURE_NONE', 							0), --Disables religious pressure emanated by cities.
		('JFD_RTP_PIETY_BELIEF_ADDITIONS_EVANGELISM',					1), --Adds Evangelism (Enhancer, Missionaries have no sight penalty or Unwelcome Evangelist promotion).
		('JFD_RTP_PIETY_BELIEF_ADDITIONS_WAR_CLERICS',					1), --Adds War Clerics (Reformation, Missionaries heal and Inquisitor reduce CS for nearby units).
		('JFD_RTP_PIETY_BELIEF_CHANGES_DEFENDER_FAITH',					1),	--Changes to Defender of Faith (bonus vs. Other Religions in your lands).
		('JFD_RTP_PIETY_BELIEF_CHANGES_FAITH_PURCHASES',				1), --Allows Faith purchasing of Pre-Renaissance Units regardless of Beliefs. Also updates Religious Fervour to enable Renaissance Era and Enlightenment Era purchases.
		('JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER',						1),	--Changes to Follower Beliefs (various).
		('JFD_RTP_PIETY_BELIEF_CHANGES_JUST_WAR',						1),	--Changes to Just War (bonus vs. Other Religions in their lands).
		('JFD_RTP_PIETY_BUILDING_CHANGES_MONASTERY', 					1), --Changes to the Monastery (becomes a standard upgrade to the Temple).
		('JFD_RTP_PIETY_CIVILIZATION_CHANGES', 							1), --Changes to my custom civilizations.
		('JFD_RTP_PIETY_CIVILIZATION_CHANGES_AZTECS', 					1), --Changes to Aztec UA (Capital WLTKD whilst Devout, Piety from Kills).
		('JFD_RTP_PIETY_GREAT_PROPHET_ARTIFACTS', 						1), --When devout, Great Prophets may be expended for Relics.
		('JFD_RTP_PIETY_GREAT_WORK_FAITH_YIELDS',						0), --Changes certain Great Works to yield Faith instead of Culture (Daoguans, Mandirs, Mosques, Solomon's Temple, Cologne Cathedral) (Disabled with CBP) (Off by default because the TT still displays Culture)
		('JFD_RTP_PIETY_PANTHEON_CHANGES',								1), --Makes Pantheon costs static (does not increase as Civilizations found Pantheons).
		('JFD_RTP_PIETY_POLICY_CHANGES',								1), --Changes to Piety Social Policies (various).
		('JFD_RTP_PIETY_RELIGION_ADDITIONS_HERMETICISM',				1), --Adds Hermeticism Religion.
		('JFD_RTP_PIETY_RESOLUTION_ADDITIONS_SECULARIZATION',			1), --Adds Enforce Secularization Resolution.
		('JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK', 					1), --Adds the Monk Specialist (2 at Monastery; produces Faith and Great Prophet Points).
		('JFD_RTP_PIETY_TECH_ADDITIONS_MYSTICISM', 						1), --Adds Mysticism Tech to the Ancient Era.
		('JFD_RTP_PIETY_TECH_ADDITIONS_PRIESTHOOD', 					1), --Adds Priesthood Tech to the Classical Era.
		('JFD_RTP_PIETY_TECH_ADDITIONS_RELIGIOUS_ORDERS', 				1), --Adds Religious Orders Tech to the Medieval Era.
		('JFD_RTP_PIETY_TECH_CHANGES_GARDEN', 							1), --Moves the Garden to Philosophy.
		('JFD_RTP_PIETY_TECH_CHANGES_GRAND_TEMPLE', 					1), --Moves the Grand Temple to Priesthood.
		('JFD_RTP_PIETY_TECH_CHANGES_HAGIA_SOPHIA', 					1), --Moves the Hagia Sophia to Drama and Poetry.
		('JFD_RTP_PIETY_WONDER_ADDITIONS_ABU_SIMBEL',					1), --Adds Abu Simbel (replicates God-King effect).
		('JFD_RTP_PIETY_WONDER_ADDITIONS_BUDDHAS_BAMIYAN',				1), --Adds the Buddhas of Bamiyan (allows SR early, +25% Piety).
		('JFD_RTP_PIETY_WONDER_ADDITIONS_COLOGNE_CATHEDRAL',			1), --Adds Cologne Cathedral (Culture and Faith on Religious buildings).
		('JFD_RTP_PIETY_WONDER_ADDITIONS_DOME_ROCK',					1), --Adds the Dome of the Rock (Piety from Conquests).
		('JFD_RTP_PIETY_WONDER_ADDITIONS_INQUISITION',					1), --Adds the Grand Inqusition National Wonder (+25% Piety).
		('JFD_RTP_PIETY_WONDER_ADDITIONS_PANTHEON',						1), --Adds the Pantheon (second pantheon belief).
		('JFD_RTP_PIETY_WONDER_ADDITIONS_SOLOMONS_TEMPLE',				1), --Adds Solomons Temple (free Great Prophet).
		('JFD_RTP_PIETY_WONDER_ADDITIONS_TODAI',						1), --Adds Todai Ji Temple (GAP from kills).
		('JFD_RTP_PIETY_WONDER_ADDITIONS_TEMPLE_HEAVEN',				1), --Adds the Temple of Heaven (Faith into GAP when Devout, extra Faith and Food during GAs).
		('JFD_RTP_PIETY_WONDER_CHANGES_BOROBUDUR',						1), --Changes to Borobudur (icon by Sukritact).
		('JFD_RTP_PIETY_WONDER_CHANGES_DJENNE',							1), --Changes to Mosque of Djenne (Great Prophet Points).
		('JFD_RTP_PIETY_WONDER_CHANGES_HAGIA_SOPHIA',					1), --Changes to Hagia Sophia (+1 Faith from Great Works, Great Engineer points).
		('JFD_RTP_PIETY_WONDER_CHANGES_GRAND_TEMPLE',					1), --Changes to the Grand Temple (+5 Faith (down from +8)).
		('JFD_RTP_PIETY_WONDER_CHANGES_STONEHENGE',						1); --Changes to Stonehenge (free Shrine Great Prophet Points).
--=========================================================================================================================	
-- PROSPERITY
--==========================================================================================================================
/*
CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,															Value)
VALUES	('JFD_RTP_PROSPERITY_CORE',										0), -- Core Prosperity functionality. (TBD, Do Not Enable OR YOU WILL BECOME RETROCITY)
		('JFD_RTP_PROSPERITY_CORE_FICTIONAL_CURRENCIES',				0), -- Enables fictional Currencies
		('JFD_RTP_PROSPERITY_TECH_CHANGES_SEA_TRADE_RANGE',				0), -- Moves Compass' Sea Trade Route Range bonus to Astronomy.
		('JFD_RTP_PROSPERITY_WONDER_ADDITIONS_GRAND_CANAL',				0); -- Adds Grand Canal wonder to Compass.
--==========================================================================================================================	
-- SOVEREIGNTY
--==========================================================================================================================
/*
CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,															Value)
VALUES  ('JFD_RTP_SOVEREIGNTY_CORE',									1), --Core functionality.
		('JFD_RTP_SOVEREIGNTY_ALT_FONTS_ESTATES',						0), --Uses alternative icons for Political Parties (Liberals, Socialists, etc.) by Hypereon.
		('JFD_RTP_SOVEREIGNTY_ALT_FONTS_PARTIES',						0), --Uses alternative icons for Estates (Nobility, Clergy, etc.) by Hypereon.
		('JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DOGES_PALACE',			1), --Adds Doge's Palace (10% Sov. when Trade Routes in all cities, requires Republic).
		('JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DUR_SHARRIKUN',			1),	--Adds Sargon's Palace (choose a govt. immediately).
		('JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_HOFBURG_PALACE',			1),	--Adds Hofburg Palace ().
		('JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_ST_PETERS',				1),	--Adds Verailles (10% Sov. when Devout, requires Theocracy).
		('JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_VERSAILLES',				1);	--Adds Verailles (10% Sov. when Great Work in all cities, requires Monarchy).
--==========================================================================================================================	
-- DO NOT MODIFY 
--==========================================================================================================================
--JFD_GlobalUserSettings
--------------------------
--Claims
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_RTP_CLAIMS_CORE_CLAIMS', 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_WESTMINSTER', 'JFD_RTP_CLAIMS_POLICY_CHANGES_LIBERTY_OPENER', 'JFD_RTP_CLAIMS_POLICY_CHANGES_PATRONAGE_FINISHER', 'JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS', 'JFD_RTP_CLAIMS_TECH_ADDITIONS_JURISPRUDENCE', 'JFD_RTP_CLAIMS_TECH_ADDITIONS_NOBILITY', 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_FORUM', 'JFD_RTP_CLAIMS_WONDER_CHANGES_BIG_BEN', 'JFD_RTP_CLAIMS_WONDER_CHANGES_FORBIDDEN_PALACE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 0);

--Piety
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_RTP_PIETY_TECH_ADDITIONS_RELIGIOUS_ORDERS', 'JFD_RTP_MERCENARIES_RELIGIOUS', 'JFD_RTP_PIETY_CORE_LOSS_FROM_OTHER_CITIES', 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER', 'JFD_RTP_PIETY_CIVILIZATION_CHANGES_AZTECS', 'JFD_RTP_PIETY_POLICY_CHANGES', 'JFD_RTP_PIETY_RESOLUTION_ADDITIONS_SECULARIZATION', 'JFD_RTP_PIETY_WONDER_ADDITIONS_BUDDHAS_BAMIYAN', 'JFD_RTP_PIETY_WONDER_ADDITIONS_DOME_ROCK', 'JFD_RTP_PIETY_WONDER_ADDITIONS_INQUISITION', 'JFD_RTP_PIETY_WONDER_ADDITIONS_TEMPLE_HEAVEN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 0);

--Mercenaries
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_RTP_MERCENARIES_POLICY_CHANGES', 'JFD_RTP_MERCENARIES_TECH_ADDITIONS', 'JFD_RTP_MERCENARIES_WONDER_CHANGES', 'JFD_RTP_MERCENARIES_UNITS_ADDITIONS_BLACK_RIDERS', 'JFD_RTP_MERCENARIES_UNITS_ADDITIONS_VARANGIAN', 'JFD_RTP_MERCENARIES_UNITS_CHANGES_PRIVATEER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 0);

--Prosperity
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_RTP_PROSPERITY_CORE_FICTIONAL_CURRENCIES', 'JFD_RTP_PROSPERITY_WONDER_ADDITIONS_GRAND_CANAL')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 0);

--Sovereignty
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_VERSAILLES', 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_ST_PETERS', 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_REICHSTAG', 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_PYRAMID_MOON', 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DUR_SHARRIKUN', 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DOGES_PALACE', 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_TRAFALGAR', 'JFD_RTP_CLAIMS_BUILDING_CHANGES_FORGES', 'JFD_RTP_SOVEREIGNTY_TECH_CHANGES_POLICE_STATION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 0);

--CBP
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_RTP_MERCENARIES_POLICY_CHANGES', 'JFD_RTP_PIETY_TECH_ADDITIONS_MYSTICISM', 'JFD_RTP_PIETY_WONDER_CHANGES_DJENNE', 'JFD_RTP_PIETY_BELIEF_ADDITIONS_EVANGELISM', 'JFD_RTP_CLAIMS_BUILDING_CHANGES_FORGES', 'JFD_RTP_CLAIMS_BUILDING_CHANGES_WINDMILL', 'JFD_RTP_CLAIMS_TECH_ADDITIONS_NOBILITY', 'JFD_RTP_MERCENARIES_UNITS_CHANGES_PRIVATEER', 'JFD_RTP_PIETY_WONDER_CHANGES_HAGIA_SOPHIA', 'JFD_RTP_PIETY_WONDER_CHANGES_STONEHENGE', 'JFD_RTP_CLAIMS_POLICY_CHANGES_LIBERTY_OPENER', 'JFD_RTP_CLAIMS_POLICY_CHANGES_PATRONAGE_FINISHER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);

--PIT
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_RTP_SOVEREIGNTY_TECH_CHANGES_POLICE_STATION', 'JFD_RTP_PROSPERITY_TECH_CHANGES_SEA_TRADE_RANGE', 'JFD_RTP_PIETY_TECH_ADDITIONS_PRIESTHOOD', 'JFD_RTP_PIETY_TECH_ADDITIONS_RELIGIOUS_ORDERS', 'JFD_RTP_PIETY_TECH_CHANGES_GARDEN', 'JFD_RTP_PIETY_TECH_CHANGES_GRAND_TEMPLE', 'JFD_RTP_MERCENARIES_TECH_ADDITIONS', 'JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS', 'JFD_RTP_CLAIMS_TECH_ADDITIONS_JURISPRUDENCE', 'JFD_RTP_CLAIMS_TECH_ADDITIONS_NOBILITY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_CORE' AND Value = 1);
--==========================================================================================================================	
--==========================================================================================================================	