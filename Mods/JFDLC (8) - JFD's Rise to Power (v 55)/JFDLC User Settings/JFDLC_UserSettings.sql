--==========================================================================================================================
-- USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 											text 										default NULL,
	Value 											integer 									default 1);
	
/*ABOUT THIS FILE

This file contains changes and additions to the game that you can toggle. Not all things are possible to disable whilst maintaing both the stability of the mod, but as much flexibility has been given to the user as possible. Mechanical additions and changes are located at the beginning, other additions and changes (Buildings, Policies, Wonders, etc.) are located at the end.

Compatibility with the Community Balance Overhaul is automatic. Do not adjust anything unless you know what you're doing!
--==========================================================================================================================	
-- CBO COMPATIBILITY 
--==========================================================================================================================	
-- Modular Features that can be toggled on and off and then back on.
--------------------------------------------------------------------------
/*
Allows support for various third-party mods. 
  1 = Enabled (Default)
  0 = Disabled
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,																Value)
VALUES	('JFDLC_MISC_COMMUNITY_BALANCE_PATCH',								0), --Community Balance Patch (automatically switches on as needed).
		('JFD_CID_COMMUNITY_BALANCE_PATCH',									0), --Community Balance Patch for CID (automatically switches on as needed).
		('JFD_CID_COMMUNITY_BALANCE_PATCH_COLONISTS',						1), --CBP Colonists and Pioneers always found Colonies.
		('JFD_EXCE_COMMUNITY_BALANCE_PATCH',								0), --Community Balance Patch for ExCE (automatically switches on as needed).
		('JFD_EXCE_NO_MORE_CIVILIAN_TRAFFIC_JAMS',							1), --Pazyryk's NMCTJs
		('JFD_PIT_COMMUNITY_BALANCE_PATCH',									0), --Community Balance Patch for PIT (automatically switches on as needed).
		('JFD_RTP_COMMUNITY_BALANCE_PATCH',									0), --Community Balance Patch for RTP (automatically switches on as needed).
		('JFD_RTP_COMMUNITY_BALANCE_PATCH_RELIGIOUS_BUILDINGS',				1), --Overrides CBP's Religious Buildings with Piety's.
		('JFD_SD_COMMUNITY_BALANCE_PATCH',									0); --Community Balance Patch for SD (automatically switches on as needed).

UPDATE JFD_GlobalUserSettings
SET Value = 1
WHERE Type IN ('JFDLC_MISC_COMMUNITY_BALANCE_PATCH', 'JFD_CID_COMMUNITY_BALANCE_PATCH', 'JFD_EXCE_COMMUNITY_BALANCE_PATCH', 'JFD_PIT_COMMUNITY_BALANCE_PATCH', 'JFD_RTP_COMMUNITY_BALANCE_PATCH', 'JFD_SD_COMMUNITY_BALANCE_PATCH')
AND EXISTS (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WELL');
--==========================================================================================================================	
-- CORE
--==========================================================================================================================
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
		(Type,																Value)
VALUES	('JFDLC_MISC_CIV_BUILDING_SOUNDS',									1), --Triggers a sound effect on completion of a Building (ala Civ IV).
		('JFDLC_MISC_CHANGES_GOLDEN_AGE_POINTS',							1), --Changes Golden Age Points/GAP to Prestige. Purely nominal.
		('JFDLC_MISC_RANKINGS_DROPDOWN',									0), --Enables Top Rankings to be viewed from the Dropdown.
		('JFDLC_MISC_SATELLITES',											1),	--Enables 'Satelliting' of City-States.
		('JFDLC_MISC_TECH_GRADIANT',										1),	--Tech Icon begins faded, unfades as you research it.
		('JFDLC_MISC_TOP_PANEL_CLOCK',										1),	--Adds the current time to the Top Panel.
		('JFDLC_MISC_UNIT_LEVEL_UP_SOUND', 									1), --Triggers a sound effect when a unit levels up (ala Civ IV).
		('JFDLC_MISC_UI_QUEUE',												1); --Production Queue is open by default.
--========================================================================	
-- CITIES IN DEVELOPMENT (CID): COLONIES
--========================================================================	
/*
Colonies are cities that have been founded a certain distance from your Capital or with a Colonist. 
Colonies act similarly to puppet cities, in that you cannot control their production, but you may still purchase items in them.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,																Value)
VALUES	('JFD_CID_COLONIES_CORE',											1);  --Core functionality.
		
/*
DISTANCE SETTINGS
-------------
*/
--Distance before a city becomes a Colony.
--To add a custom world size, copy the format below with the name of that world size (Defaults to Standard otherwise).
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,																Value)
VALUES	('JFD_CID_COLONIES_DISTANCE_CORE',									1),  --Core functionality.
		('JFD_CID_COLONIES_DISTANCE_CORE_CITY_RADIUS',						0),  --How many tiles a City must be from another City before it becomes a Colony (0-3 disables).
		('JFD_CID_COLONIES_DISTANCE_CORE_NEW_CAPITAL',						1),  --First Colony is named after your Capital, with the prefix 'New.'
		('JFD_CID_COLONIES_DISTANCE_CORE_NUM_CITIES',						1),  --How many Cities required before a city becomes a Colony.
		('JFD_CID_COLONIES_DISTANCE_WORLDSIZE_HUGE',						20), --Huge Maps.
		('JFD_CID_COLONIES_DISTANCE_WORLDSIZE_LARGE',						15), --Large Maps.
		('JFD_CID_COLONIES_DISTANCE_WORLDSIZE_STANDARD',					14), --Standard Maps.
		('JFD_CID_COLONIES_DISTANCE_WORLDSIZE_SMALL',						12), --Small Maps.
		('JFD_CID_COLONIES_DISTANCE_WORLDSIZE_TINY',						10), --Tiny Maps.
		('JFD_CID_COLONIES_DISTANCE_WORLDSIZE_DUEL',						9);  --Duel Maps.
--========================================================================	
-- CITIES IN DEVELOPMENT (CID): CRIMES
--========================================================================	
/*
Crime is a consequence of your city's development and replaces Building Maintenance in many instances. 
As Crime grows, it will reduce a city's yields, depending upon how those yields are apportioned - so if you're producing a lot of Gold, you'll also be producing a lot of Corruption, in turn costing you Gold.
Organized Crime is the consequence of too much of two specific Crimes. 
When two Crimes reach 50%, they will band together to form an Organized Crime. An Organized Crime will reduce your yields further.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,																Value)
VALUES	('JFD_CID_CRIMES_CORE',												1),		--Core functionality.
		('JFD_CID_CRIMES_CORE_ORGANIZED',									1),		--Core functionality (Organized Crime).
		('JFD_CID_CRIMES_CORE_ORGANIZED_MIN_POPULATION_THRESHOLD',			1);		--Organized Crime will not appear until a city has reached this Population (value == Population).
--========================================================================	
-- CITIES IN DEVELOPMENT (CID): DEVELOPMENT
--========================================================================	
/*
Development is the measurement of a city's capacity to support its Population. 
You must have at least as much Development as your Population Threshold, otherwise the city will have increased Crime and Disease, and decreased Wonder Production. 
However, going beyond this Population Threshold will increase the city's Happiness, Health, and Building Production.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,																Value)
VALUES	('JFD_CID_DEVELOPMENT_CORE',										1),	 --Core functionality.
		('JFD_CID_DEVELOPMENT_CORE_DEFENSE_EFFECT',							1),	 --Development boosts/penalizes City Defense.
		('JFD_CID_DEVELOPMENT_CORE_GROWTH_PENALTY',							1),	 --Disables the Growth penalty from Unhappiness.
		('JFD_CID_DEVELOPMENT_CORE_PRODUCTION_BONUS_BUILDINGS',				0),	 --High Development boosts Building Production.
		('JFD_CID_DEVELOPMENT_CORE_PRODUCTION_PENALTY_WONDERS',				1),	 --Low Development penalizes Wonder Production.
		('JFD_CID_DEVELOPMENT_CORE_DISTRICTS',								1);	 --Organizes Buildings in the City View according to 'Districts.' These Districts determine Development value of Buildings.
--========================================================================	
-- CITIES IN DEVELOPMENT (CID): HAPPINESS
--========================================================================	
/*
Happiness is the measurement of a city's appeal and is used to offset Unhappiness. 
When a city has more Happiness than Unhappiness, that Happiness contributes to positive Production

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,																Value)
VALUES	('JFD_CID_HAPPINESS_CORE',											1),  --Core functionality. 
		('JFD_CID_HAPPINESS_CORE_CITY_BANNER_TURNS',						30), --Turns before Resistance countdown shows on the City Banner.
		('JFD_CID_HAPPINESS_CORE_EXCESS_INTO_PRODUCTION_MOD',				1),  --Excess Happiness contributes to a Production Modifier.
		('JFD_CID_HAPPINESS_CORE_EXCESS_INTO_PRODUCTION_RAW',				0),  --Excess Happiness contributes to Production.
		('JFD_CID_HAPPINESS_CORE_NOTIFICATION_FIRST_RESISTANCE_TURNS',		10), --Turns before a Notification is sent about impending Resistance (first time). 0 to disable.
		('JFD_CID_HAPPINESS_CORE_NOTIFICATION_SECOND_RESISTANCE_TURNS',		5);  --Turns before a Notification is sent about impending Resistance (second time). 0 to disable.
--========================================================================	
-- CITIES IN DEVELOPMENT (CID): HEALTH
--========================================================================	
/*
Health is the measurement of a city's habitability and is used to offset Disease. 
When a city has more Health than Disease, that Health contributes directly toward Food
Disease is the opposite to Health. 
When a city has more Disease than Health, it may enter a period of Plague after too long. 

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,																Value)
VALUES	('JFD_CID_HEALTH_CORE',												1),		--Core functionality.
		('JFD_CID_HEALTH_CORE_CITY_BANNER_TURNS',							30),	--Turns before Plague countdown shows on the City Banner.
		('JFD_CID_HEALTH_CORE_PLAGUE_EFFECT',								1),		--Enables the Plague effect (a smaller Fallout cloud) to hover over a plagued city.
		('JFD_CID_HEALTH_CORE_EXCESS_INTO_FOOD_MOD',						1),		--Excess Health contributes to a Food Modifier.
		('JFD_CID_HEALTH_CORE_EXCESS_INTO_FOOD_RAW',						0),		--Excess Health contributes to Food.
		('JFD_CID_HEALTH_CORE_SETTLER_NO_PLAGUES',							1),		--Disables the ability to train Settlers during Plagues.
		('JFD_CID_HEALTH_CORE_FIRST_NOTIFICATION_PLAGUE_TURNS',				10),	--Turns before a Notification is sent about impending Plague (first time).
		('JFD_CID_HEALTH_CORE_SECOND_NOTIFICATION_PLAGUE_TURNS',			5);		--Turns before a Notification is sent about impending Plague (second time).
--========================================================================	
-- CITIES IN DEVELOPMENT (CID): INVESTMENTS
--========================================================================	
/*
Investments replaces Gold-rushing Buildings. 
Instead, you use gold to 'Invest' in a Building or Wonder, thereby reducing its base Production cost.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,																Value)
VALUES	('JFD_CID_INVESTMENTS_CORE',										1),		--Core functionality.
		('JFD_CID_INVESTMENTS_CORE_UI',										1);		--Adds an Invest button in Production Queue.
--========================================================================	
-- CITIES IN DEVELOPMENT (CID): LOYALTY
--========================================================================	
/*
Loyalty is how much a city respects being a part of your civilization and is based upon whether a city is more Loyal than it is Disloyal.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,																Value)
VALUES	('JFD_CID_LOYALTY_CORE',											1),		--Core functionality.
		('JFD_CID_LOYALTY_CORE_XP_BUILDINGS',								1),		--XP Buildings, not Defensive, yield Loyalty.
		('JFD_CID_LOYALTY_CORE_AI',											1),		--Core functionality for the AI.
		('JFD_CID_LOYALTY_CORE_FIRST_NOTIFICATION_REVOLT_TURNS',			10),	--Turns before a Notification is send about impending Revolt (first time). 0 to disable.
		('JFD_CID_LOYALTY_CORE_SECOND_NOTIFICATION_REVOLT_TURNS',			5),		--Turns before a Notification is send about impending Revolt (second time). 0 to disable.
		('JFD_CID_LOYALTY_CORE_FIRST_NOTIFICATION_WLTKD_TURNS',				10),	--Turns before a Notification is send about impending WLTKD (first time). 0 to disable.
		('JFD_CID_LOYALTY_CORE_SECOND_NOTIFICATION_WLTKD_TURNS',			5);		--Turns before a Notification is send about impending WLTKD (second time). 0 to disable.
		
----------------------------------------------------------------------------
--/*
--CORE LOYALTY SETTINGS
---------------
--  3 = All Cities
--  2 = Colonies, Puppets, and Occupied Cities
--  1 = Only Colonies
--*/
----------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,																Value)
VALUES	('JFD_CID_LOYALTY_CITIES',											3);		--Determines what cities are affected by Loyalty.
--========================================================================	
-- CITIES IN DEVELOPMENT (CID): POWER
--========================================================================	
/*
Power is a new Strategic Resource that many late-game Buildings require before they can be constructed.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,																Value)
VALUES	('JFD_CID_POWER_CORE',												1),		--Core functionality.
		('JFD_CID_POWER_CORE_PRE_INDUSTRIAL',								1);		--Pre-Industrial Buildings (Workshop, Windmill, Watermill) require or produce Power.		
--========================================================================	
-- CITIES IN DEVELOPMENT (CID): PROVINCES
--========================================================================	
/*
--Provinces are a measurement of a city's development. They determine Bombard Range and how affective your Levies are.
--They also increase the rate at which a city's borders may expand and the Gold output of Towns and Villages.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,																Value)
VALUES	('JFD_CID_PROVINCES_CORE',											1),		--Core functionality. 
		('JFD_CID_PROVINCES_CORE_BOMBARD_RANGE',							1),		--Changes City Bombard Range to upgrade with Provinces; Gunpowder unlocks Indirect Fire.
		('JFD_CID_PROVINCES_CORE_LEVIES',									1),		--Enables Population spending Units; Provinces spawn Units when war is declared against you.
		('JFD_CID_PROVINCES_CORE_LEVIES_AI',								1);		--Enables AI to receive additional Levies.
--========================================================================	
-- CITIES IN DEVELOPMENT (CID): SLAVERY
--========================================================================	
/*
Slavery is a method of purchasing Military Units outright. 
These Units are often very cheap, however, they earn only 50% of the normal XP from combat. 
They also cost much more to upgrade.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,																Value)
VALUES	('JFD_CID_SLAVERY_CORE',											1),		--Core functionality.
		('JFD_CID_SLAVERY_CORE_NO_GOLD_PURCHASING',							1);		--Disables Gold-rushing of Non-Mechanized Military Units.
--========================================================================		
-- PROGRESS IN TIME (PIT): EDIFICES
--========================================================================	
/*

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/
--------------------------------------------------------------------------
--INSERT INTO JFD_GlobalUserSettings
--		(Type,																Value)
--VALUES	('JFD_PIT_EDIFICES_ADDITIONS_COLOSSUS',								1), --Turns the Colossus into an Edifice.
--		('JFD_PIT_EDIFICES_ADDITIONS_CRISTO_REDENTOR',						1), --Turns Cristo Redentor into an Edifice.
--		('JFD_PIT_EDIFICES_ADDITIONS_NEUSCHWANSTEIN',						0), --Turns Neuschwanstein into an Edifice.
--		('JFD_PIT_EDIFICES_ADDITIONS_ORACLE',								1), --Turns the Oracle into an Edifice.
--		('JFD_PIT_EDIFICES_ADDITIONS_RED_FORT',								1); --Turns the Red Fort into an Edifice.
		--('JFD_PIT_EDIFICES_ADDITIONS_STATUE_LIBERTY',						1); --Turns the Statue of Liberty into an Edifice.
--========================================================================		
-- PROGRESS IN TIME (PIT): INNOVATIONS
--========================================================================	
/*
CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,																Value)
VALUES	('JFD_PIT_INNOVATIONS_CORE', 										1), --Enables unique ways in which to boost progress toward Techs (ala Civ VI).
		('JFD_PIT_INNOVATIONS_CORE_ERA_RESTRICTIONS', 						1); --Techs can only be researched one Era ahead of your current. This includes receiving the Innovation bonus.
--========================================================================	
-- PROGRESS IN TIME (PIT): PROGRESS
--========================================================================	
/*
CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,																Value)
VALUES	('JFD_PIT_PROGRESS_CORE',											0), --Overhauls the Tech Tree. PiT requires all Technology additions throughout JFDLC and EE (UNIMPLEMENTED).
		('JFD_PIT_PROGRESS_CORE_FIRST_FREE_GREAT_PEOPLE',					1), --Some Techs reward a free Great Person for the first founder.
		--('JFD_PIT_PROGRESS_CORE_FREE_STARTING_TECH',						1), --Enables you to begin with a free starting tech of your choice (UNIMPLEMENTED).
		--('JFD_PIT_PROGRESS_CORE_UNIQUE_MISC_ICONS',							1), --Changes the generic star to unique icons for misc effects on the Tech Tree.
		('JFD_PIT_PROGRESS_BUILD_CHARGES',									1), --Improvements are built using limited Charges which when used up expend the builder (ala Civ VI).
		('JFD_PIT_PROGRESS_BUILD_CHARGES_EXCLUDES_REMOVING',				1); --Removing Forest/Marsh/Jungle/Fallout doesn't expend Charges.
--========================================================================	
-- RISE TO POWER (RTP): CLAIMS
--========================================================================	
/*
Claims are a means for annexing City-States peacefully, through the expenditure of Dignitaries and Gold. 
Claiming a City-State in this way puts that City-State and its city and units under your control, without incurring a warmonger penalty and (to a degree) resistance.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,																Value)
VALUES	('JFD_RTP_CLAIMS_CORE',												1), --Core functionality (Dignitary/Magistrate additions). 
		('JFD_RTP_CLAIMS_CORE_CLAIMS',										1), --Core functionality (Claims).
		('JFD_RTP_CLAIMS_CORE_PTP_THRESHOLD',								1), --Makes it so that you must be in the top 60% of Military Powers in order to Pledge to Protect.
		('JFD_RTP_CLAIMS_CORE_CULTURE_CAUSE',								0); --Adds a Cause based on having the same Culture Type.		
--========================================================================		
-- RISE TO POWER (RTP): EPITHETS
--========================================================================	
-- Modular Features that can be toggled on and off and then back on.
--------------------------------------------------------------------------
/*
Epithets are rewards that you may acquire by pursuing particular conditions. 
For instance, constructing Wonders may award you the epithet of 'the Builder,' with the chance increasing the more you build Wonders.

CORE SETTINGS
---------------
  1 = Enabled (Default)
  0 = Disabled
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,																Value)
VALUES	('JFD_RTP_EPITHETS_CORE',											1); --Core functionality.
--========================================================================	
-- RISE TO POWER (RTP): MERCENARIES
--========================================================================	
-- Modular Features that can be toggled on and off and then back on.
--------------------------------------------------------------------------
/*
Mercenaries are units that can be hired via Contract for a limited number of turns. 
Some of these units come in groups, whereas others begin with increased stats. 
Sometimes, unique units are also available to hire.

CORE SETTINGS
---------------
  1 = Enabled (Default)
  0 = Disabled
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,																Value)
VALUES	('JFD_RTP_MERCENARIES_CORE',										1), --Core functionality.
		('JFD_RTP_MERCENARIES_CORE_AI_CAP',									2), --Number of concurrent Contracts the AI is allowed to take out.
		('JFD_RTP_MERCENARIES_CORE_DEFAULT_UNIT_COUNT',						3), --Likelihood of default units being tied to a Contract over unique units (3 == 3x).
		('JFD_RTP_MERCENARIES_CORE_FIRST_NOTIFICATION_TURNS',				10),--Turns before a Notification is send about impending Contract expiration (first time). 0 to disable.
		('JFD_RTP_MERCENARIES_CORE_SECOND_NOTIFICATION_TURNS',				5),	--Turns before a Notification is send about impending Contract expiration (second time). 0 to disable.
		('JFD_RTP_MERCENARIES_CORE_RELIGIOUS',								1); --Enables Holy Order contracts, which cost Piety instead of Gold.		
--========================================================================	
-- RISE TO POWER (RTP): PIETY
--========================================================================
/*
Piety is the measurement of your adherence to your religion. 
Piety is needed to ensure a healthy religion; that your people continue to follow it and well. 
As time and the number of adherents of your State Religion go on, your Piety will fall. 
It is your duty to maintain it.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type, 																Value)
VALUES	('JFD_RTP_PIETY_CORE', 												1), --Core functionality.
		('JFD_RTP_PIETY_CORE_PRESSURE_HALF', 								0), --Halves religious pressure emanated by cities.
		('JFD_RTP_PIETY_CORE_PRESSURE_NONE', 								0), --Disables religious pressure emanated by cities.
		('JFD_RTP_PIETY_CORE_PANTHEON_CHANGES',								1); --Makes Pantheon costs static (does not increase as Civilizations found Pantheons).
--========================================================================	
-- RISE TO POWER (RTP): PROSPERITY
--========================================================================
/*
CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,																Value)
VALUES	('JFD_RTP_PROSPERITY_CORE',											0); -- Core Prosperity functionality. (TBD, Do Not Enable OR YOU WILL BECOME RETROCITY)
		--('JFD_RTP_PROSPERITY_CORE_FICTIONAL_CURRENCIES',					0), -- Enables fictional Currencies
--========================================================================	
-- RISE TO POWER (RTP): SOVEREIGNTY
--========================================================================
/*
Sovereignty is the measurement of your ability to govern your civilization. 
Sovereignty is needed to pass Political Reforms, although it is not expended in doing so; 
simply, you will need a minimum amount of Sovereignty before you can pass a Political Reform.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,																Value)
VALUES  ('JFD_RTP_SOVEREIGNTY_CORE',										1), --Core functionality.
		('JFD_RTP_SOVEREIGNTY_CORE_ALT_FONTS_ESTATES',						0), --Uses alternative icons for Political Parties (Liberals, Socialists, etc.) by Hypereon.
		('JFD_RTP_SOVEREIGNTY_CORE_ALT_FONTS_PARTIES',						0); --Uses alternative icons for Estates (Nobility, Clergy, etc.) by Hypereon.		
--========================================================================	
-- RISE TO POWER (RTP): SUPPLY
--========================================================================	
/*
CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/
--------------------------------------------------------------------------
--========================================================================		
-- SOCIETY DIVIDED (SD): IDEALS
--========================================================================	
/*
Ideals are unique Social Policies specific to your Culture. 
They often require certain, time-sensitive conditions to be met before they can be unlocked. 
These Policies still require Culture to be adopted.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,																Value)
VALUES	('JFD_SD_IDEALS_CORE', 												1), --Core functionality.
		('JFD_SD_IDEALS_CORE_NO_CONDITIONS', 								0); --Disables conditions tied to Ideals, turning them into exclusive but otherwise standard Social Policies.
--========================================================================	
-- SOCIETY DIVIDED (SD): SOCIETY
--========================================================================	
/*
CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/
--------------------------------------------------------------------------
--INSERT INTO JFD_GlobalUserSettings
--		(Type,															Value)
--VALUES	('JFD_SD_SOCIETY_CORE', 										1); --Overhauls Social Policies.
--========================================================================		
-- SOCIETY DIVIDED (SD): TALENTS
--========================================================================	
/*
CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/
--------------------------------------------------------------------------
--INSERT INTO JFD_GlobalUserSettings
		--(Type,																Value)
--VALUES	--('JFD_SD_TALENTS_CORE', 											1), --Core functionality.
--==========================================================================================================================	
-- BELIEFS
--==========================================================================================================================
/*
List of Belief changes and additions throughout JFDLC.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/ 
--------------------------------------------------------------------------
INSERT OR REPLACE INTO JFD_GlobalUserSettings
		(Type,																	Value)
VALUES	('JFD_CID_COLONIES_BELIEF_ADDITIONS_MISSION_COLONIES',					1), --Mission Colonies (Reformation) allows Faith purchasing of Civilian Units.
		('JFD_CID_HEALTH_BELIEF_ADDITIONS_HEALING_VAPORS',						1),	--Healing Vapors (Pantheon) grants Health on Marsh and Flood Plains.
		('JFD_CID_HEALTH_BELIEF_ADDITIONS_GOD_MEDICINE',						1),	--God of Medicine (Pantheon) grants Health on Herbalists.
		('JFD_CID_HEALTH_BELIEF_ADDITIONS_SHAMANISM',							1),	--Shamanism (Follower) grants Health and Faith on Doctors.
		('JFD_CID_HEALTH_BELIEF_CHANGES_ONE_WITH_NATURE',						1),	--One With Nature (Pantheon) now grants Health and Faith on Natural Wonders.
		('JFD_CID_PROVINCES_BELIEF_CHANGES_RELIGIOUS_SETTLEMENTS',				1),	--Religious Settlements (Pantheon) now yield +1 Faith on Trading Posts, Villages, and Towns.
		('JFD_CID_SLAVERY_BELIEF_CHANGES_GOD_WAR',								1),	--God of War (Pantheon) now increases Shackles gained from killing Barbarians. Changes the original God of War to Human Sacrifices.
		--Pantheons
		('JFD_RTP_PIETY_BELIEF_ADDITIONS_AUSPICIOUS',							1),	--Auspicious Signs (Pantheon) increases GAP and Faith on Lotus.
		('JFD_RTP_PIETY_BELIEF_ADDITIONS_CEREMONIAL_ROBES',						1),	--Ceremonial Robes (Pantheon) increases Culture on Silk, Cotton, and Saffron.
		('JFD_RTP_PIETY_BELIEF_ADDITIONS_GOD_FORGE',							1), --God of the Forge (Pantheon) increases Quantity of and Faith on Iron.
		('JFD_RTP_PIETY_BELIEF_ADDITIONS_GOD_HORSES',							1), --God of Horses (Pantheon) increases Quantity of and Faith on Horses.
		('JFD_RTP_PIETY_BELIEF_ADDITIONS_GODDESS_HARVEST',						1), --Goddess of Harvest (Pantheon) increases Food on Maize, Rice, and Wheat.
		('JFD_RTP_PIETY_BELIEF_ADDITIONS_GODDESS_HEARTH',						1), --Goddess of the Hearth (Pantheon) increases Food on Olives, Truffles, and Salt.
		('JFD_RTP_PIETY_BELIEF_ADDITIONS_GODDESS_STRATEGY',						1), --Goddess of Strategy (Pantheon) increases City Ranged Combat and grants faith from kills within 4 tiles.
		('JFD_RTP_PIETY_BELIEF_ADDITIONS_GOD_LUCK',								1), --God of Luck (Pantheon) increases Gold on Fish and Pearls.
		('JFD_RTP_PIETY_BELIEF_ADDITIONS_HOLIDAYS',								1),	--Religious Holidays (Pantheon) increases Faith on Sugar, Ginger, and Spices.
		('JFD_RTP_PIETY_BELIEF_ADDITIONS_MEDITATION',							1),	--Meditation (Pantheon) increases Happiness and GAP on Shrines.
		('JFD_RTP_PIETY_BELIEF_ADDITIONS_PURIFICATION',							1),	--Purification Rituals (Pantheon) increases Faith on Incense, Perfume, and Tobacco.
		('JFD_RTP_PIETY_BELIEF_ADDITIONS_RELIGIOUS_HOLIDAYS',					1),	--Religious Holidays (Pantheon) increases Culture on Cinnamon, Vanilla, and Cocoa.
		('JFD_RTP_PIETY_BELIEF_ADDITIONS_SACRED_GROVES',						1), --Sacred Groves (Pantheon) increases Faith and Culture on Cedar and Oak.
		('JFD_RTP_PIETY_BELIEF_ADDITIONS_SACRED_MEDICINES',						1), --Sacred Medicines (Pantheon) increases Faith on Opium, Tea, and Ginger.
		('JFD_RTP_PIETY_BELIEF_ADDITIONS_STAR_GAZING',							1), --Star-Gazing (Pantheon) increases Science and Faith on Mountains.
		('JFD_RTP_PIETY_BELIEF_CHANGES_DANCE_AURORA',							1),	--Dance of the Aurora (Pantheon) now yields GAP on unforested Tundra tiles as well.
		('JFD_RTP_PIETY_BELIEF_CHANGES_DESERT_FOLKLORE',						1),	--Desert Folklore (Pantheon) now only applies to unimproved Desert tiles.
		('JFD_RTP_PIETY_BELIEF_CHANGES_FAITH_HEALERS',							1), --Faith Healers (Pantheon) now yields Health equal to 10% of the city's Faith.
		('JFD_RTP_PIETY_BELIEF_CHANGES_FERTILITY_RITES',						1), --Fertility Rites (Pantheon) now yields Faith from growth.
		('JFD_RTP_PIETY_BELIEF_CHANGES_GOD_CRAFTSMEN',							1),	--God of Craftsmen (Pantheon) now yields Faith from constructing Buildings.
		('JFD_RTP_PIETY_BELIEF_CHANGES_GODDESS_FESTIVALS',						1),	--Goddess of Festivals (Pantheon) now called God of Festivals, and now yields Culture on Feathers, Wine, and Dyes.
		('JFD_RTP_PIETY_BELIEF_CHANGES_GOD_KING',								1),	--God-King (Pantheon) now includes Golden Age Points.
		('JFD_RTP_PIETY_BELIEF_CHANGES_GODDESS_HUNT',							1),	--Goddess of the Hunt (Pantheon) now yields Production and Great General Points on Furs, Bison, and Deer.
		('JFD_RTP_PIETY_BELIEF_CHANGES_GOD_SEA',								1),	--God of the Sea (Pantheon) now yields Production and Great Admiral Points on Coral, Crab, and Whales.
		('JFD_RTP_PIETY_BELIEF_CHANGES_GODDESS_PROTECTION',						1),	--Goddess of Protection (Pantheon) now converts 20% Faith to City Defense.
		('JFD_RTP_PIETY_BELIEF_CHANGES_HUMAN_SACRIFICES',						1),	--Human Sacrifices (Pantheon) now called Ritual Sacrifices, and now yields Faith on Obsidian, Ivory, and Jade.
		('JFD_RTP_PIETY_BELIEF_CHANGES_MONUMENT_GODS',							1),	--Monuments to the Gods (Pantheon) now grants Faith during Wonder construction.
		('JFD_RTP_PIETY_BELIEF_CHANGES_OPEN_SKY',								1),	--God of the Open Sky(Pantheon) now yields Culture and Faith on Sheep and Cow.
		('JFD_RTP_PIETY_BELIEF_CHANGES_RELIGIOUS_IDOLS',						1),	--Religious Idols (Pantheon) now yields +1 Faith on Copper, Gold, and Silver.
		('JFD_RTP_PIETY_BELIEF_CHANGES_SACRED_PATH',							1),	--Sacred Path (Pantheon) now yields +2 GAP on Forest and Jungle.
		('JFD_RTP_PIETY_BELIEF_CHANGES_SACRED_WATERS',							1),	--Sacred Waters (Pantheon) now also heals units adjacent to the city.
		('JFD_RTP_PIETY_BELIEF_CHANGES_STONE_CIRCLES',							1),	--Stone Circles (Pantheon) now yields +2 Faith on Marble and Stone.
		('JFD_RTP_PIETY_BELIEF_CHANGES_SUN_GOD',								1),	--Sun God (Pantheon) now yields Food on Citrus, Coffee, and Sugar.
		('JFD_RTP_PIETY_BELIEF_CHANGES_TEARS_OF_GODS',							1),	--Tears of the Gods (Pantheon) now yields +2 GAP on Amber, Lapis Lazuli, and Gems.
		--Other Beliefs
		('JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS',					1), --Adds a new Follower belief choice for Missionary-specific Beliefs. Replaces Theodora's UA to allow picking Beliefs even when taken by other Religions.
		-- ('JFD_RTP_PIETY_BELIEF_ADDITIONS_EVANGELISM',						1), --Evangelism (Enhancer) eliminates the penalties for Missionaries.
		-- ('JFD_RTP_PIETY_BELIEF_ADDITIONS_WAR_CLERICS',						1), --War Clerics (Reformation) allows Missionaries to heal nearby units and Inquisitor to reduce the CS of nearby units.
		('JFD_RTP_PIETY_BELIEF_CHANGES_JUST_WAR',								1),	--Just War (Enhancer) now grants a bonus vs. Other Religions in their lands.
		('JFD_RTP_PIETY_BELIEF_CHANGES_DEFENDER_FAITH',							1),	--Defender of the Faith (Enhancer) now grants a bonus vs. Other Religions in your lands.
		('JFD_RTP_PIETY_BELIEF_CHANGES_FAITH_PURCHASES',						1), --Allows Faith purchasing of Pre-Renaissance Units regardless of Beliefs. Also updates Religious Fervour to enable Renaissance Era and Enlightenment Era purchases.
		('JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER',								1),	--Various changes to the Follower Beliefs based on Piety generation.
		('JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER',								1); --Various changes to the Founder Beliefs.
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================
/*
List of Building changes and additions throughout JFDLC.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/ 
--------------------------------------------------------------------------
INSERT OR REPLACE INTO JFD_GlobalUserSettings
		(Type,																	Value)
VALUES	('JFD_CID_CRIMES_BUILDING_CHANGES_BURIAL_TOMB',							1),	--Burial Tomb now reduces Vandalism.
		('JFD_CID_CRIMES_BUILDING_CHANGES_MUD_PYRAMID',							1),	--Mud Pyramid Mosque now has no Crime.
		('JFD_CID_CRIMES_BUILDING_CHANGES_SATRAPS_COURT',						1),	--Satrap's Court now has less Crime.
		('JFD_CID_HEALTH_BUILDING_ADDITIONS_CISTERN',							1),	--Cistern yields Health and requires no River, and makes the Aqueduct yield Health and require a River.
		('JFD_CID_HEALTH_BUILDING_ADDITIONS_GRAIN_SILO',						1),	--Grain Silo yields Food.
		('JFD_CID_HEALTH_BUILDING_CHANGES_FLOATING_GARDENS',					1),	--Floating Garden now yields Health.
		('JFD_CID_HEALTH_BUILDING_CHANGES_LONGHOUSE',							1),	--Longhouse now yields Health on Forests.
		('JFD_CID_HEALTH_BUILDING_CHANGES_MONASTERY',							1),	--Monastery now yield Health on Wine and Incense.
		('JFD_CID_POWER_BUILDING_ADDITIONS_BLAST_FURNACE',						1),	--Blast Furnace requires Iron and has an Engineer specialist.
		('JFD_CID_POWER_BUILDING_ADDITIONS_COAL_PLANT',							1),	--Coal Plant requires Coal and produces Power.
		('JFD_CID_POWER_BUILDING_ADDITIONS_HORSE_MILL',							1),	--Horse Mill requires Horses and produces Power.
		('JFD_CID_POWER_BUILDING_ADDITIONS_OIL_REFINERY',						1),	--Blast Furnace requires Oil and produces Power.
		('JFD_CID_POWER_BUILDING_ADDITIONS_WIND_FARM',							1),	--Wind Farm requires Aluminum and produces Power.
		('JFD_EXCE_EXPLORATION_BUILDING_CHANGES_FACTORY',						1), --Factory now yields +1 Production on Rubber and Sulphur.
		('JFD_EXCE_EXPLORATION_BUILDING_CHANGES_GRANARY',						1), --Granary now yields +1 Food on Bison.
		('JFD_EXCE_EXPLORATION_BUILDING_CHANGES_MONASTERY',						1), --Monastery now yields +1 Faith and +1 Culture on Saffron.
		('JFD_EXCE_EXPLORATION_BUILDING_CHANGES_WATERMILL',						1), --Granary now yields +1 Food on Rice and Maize.
		('JFD_PIT_PROGRESS_BUILDING_CHANGES_CULTURE_LINE',						1), --Broadcast Towers now require Opera Houses, and Museums now require Galleries.
		('JFD_PIT_PROGRESS_BUILDING_CHANGES_MINT',								1), --Mint now buildable anywhere and yields +1 Gold on Copper.
		('JFD_RTP_CLAIMS_BUILDING_CHANGES_FORGES',								1), --Forge now yields Production on Copper and Iron.
		('JFD_RTP_CLAIMS_BUILDING_CHANGES_WINDMILL',							1), --Windmill now yields Food instead of Production.
		('JFD_RTP_PIETY_BUILDING_CHANGES_MONASTERY', 							1); --Monastery now becomes a standard upgrade to the Temple.
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================
/*
List of Civilization changes and additions throughout JFDLC.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/ 
--------------------------------------------------------------------------
INSERT OR REPLACE INTO JFD_GlobalUserSettings
		(Type,																	Value)
VALUES	('JFD_CID_COLONIES_CIVILIZATION_CHANGES_NETHERLANDS',					1), --Netherlands now claim additional tiles when founding a Colony in addition to existing effect.
		('JFD_EXCE_EXPLORATION_CIVILIZATION_CHANGES_INCA',						1), --Inca can now found Cities on Mountains, beginning with a free Mint in these cities in addition to existing effect.
		('JFD_PIT_INNOVATIONS_CIVILIZATION_CHANGES_KOREA',						1), --Korea now yields +1 Science from Specialists and receives a random Innovation Specialist building is built in the Capital.
		('JFD_RTP_PIETY_CIVILIZATION_CHANGES_AZTECS', 							1); --Aztecs now earn Piety from kills and to have a perpetual WLTKD in the Capital when Devout.
--==========================================================================================================================	
-- (SUKRITACT'S) DECISIONS
--==========================================================================================================================	
/*
CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,																	Value)
VALUES	('SUK_DECISIONS_RTP_PIETY_RESOURCE_ADDITIONS_CLERICS',					1), --Clerics are a Magistrate-like resource for enacting religion-based Decisions.
		('SUK_DECISIONS_RTP_SUPPLY_RESOURCE_ADDITIONS_CAPTAINS',				1), --Captains are a Magistrate-like resource for enacting military-based Decisions.
		('SUK_DECISIONS_SD_TALENTS_RESOURCE_ADDITIONS_INVENTORS',				1); --Inventors are a Magistrate-like resource for enacting some Decisions.
--==========================================================================================================================	
-- FEATURES
--==========================================================================================================================
/*
List of Feature changes and additions throughout JFDLC.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/ 
--------------------------------------------------------------------------
INSERT OR REPLACE INTO JFD_GlobalUserSettings
		(Type,																	Value)
VALUES	('JFD_CID_HEALTH_FEATURE_CHANGES_FOUNTAIN_YOUTH',						1),	--Fountain of Youth now yields Health.
		('JFD_CID_HEALTH_FEATURE_CHANGES_LAKE_VICTORIA',						1);	--Lake Victoria now yields Health.
--==========================================================================================================================	
-- GOOD HUTS
--==========================================================================================================================
/*
List of Goody Hut changes and additions throughout JFDLC.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/ 
--------------------------------------------------------------------------
INSERT OR REPLACE INTO JFD_GlobalUserSettings
		(Type,																	Value)
VALUES	('JFD_EXCE_EXPLORATION_ANCIENT_RUINS_ADDITIONS_GOLDEN_AGE',				1), --Goody Huts may now grant Golden Age Points.
		('JFD_EXCE_EXPLORATION_ANCIENT_RUINS_ADDITIONS_PRODUCTION',				1), --Goody Huts may now grant Production for nearest city.
		('JFD_EXCE_EXPLORATION_ANCIENT_RUINS_ADDITIONS_TILES',					1); --Goody Huts may now grant tiles for nearest city.
--==========================================================================================================================	
-- GREAT PEOPLE
--==========================================================================================================================
/*
List of Great People changes and additions throughout JFDLC.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/ 
--------------------------------------------------------------------------
INSERT OR REPLACE INTO JFD_GlobalUserSettings
		(Type,																	Value)
VALUES	('JFD_CID_HEALTH_GREAT_PEOPLE_ADDITIONS_DOCTOR',						1),	--Great Doctors can cure Epidemics and increase Population.
		('JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR',					1),	--Great Director, Great Works of Film, Director's Guild, and the Cinema building are a late counterpart to Artists, Musicians, and Writers, and respective Great Works and Buildings.
		('JFD_RTP_CLAIMS_GREAT_PERSON_CHANGES',									1), --Changes Dignitary/Magistrate/Merchant/Engineer/Scientist Points to accumulate separately.
		('JFD_RTP_PIETY_GREAT_PEOPLE_CHANGES_PROPHET', 							1), --Great Prophets can no longer be used to spread Religion. 
		('JFD_RTP_PIETY_GREAT_WORK_FAITH_YIELDS',								0); --Changes certain Great Works to yield Faith instead of Culture (Daoguans, Mandirs, Mosques, Solomon's Temple, Cologne Cathedral) (Off by default because the TT still displays Culture),
		--('JFD_SD_TALENTS_GREAT_PEOPLE_CHANGES_ADMIRAL',							1); --Gives the Great Admiral a new icon and model for pre-Renaissance eras.
--==========================================================================================================================	
-- IMPROVEMENTS
--==========================================================================================================================
/*
List of Improvement changes and additions throughout JFDLC.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/ 
--------------------------------------------------------------------------
INSERT OR REPLACE INTO JFD_GlobalUserSettings
		(Type,																	Value)
VALUES	('JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_FORT',							1),	--Adds new Improvement upgrades after extended periods of working: Fort > Citadel.
		('JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST',					1);	--Adds new Improvement upgrades after extended periods of working: TP > Village > Town.
		--('JFD_PIT_PROGRESS_IMPROVEMENT_ADDITIONS_WHALING_BOATS',				1), --Whaling Boats improve Whales instead of Fishing Boats.
--==========================================================================================================================	
-- POLICIES
--==========================================================================================================================
/*
List of Policies changes and additions throughout JFDLC.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/ 
--------------------------------------------------------------------------
INSERT OR REPLACE INTO JFD_GlobalUserSettings
		(Type,																	Value)
VALUES	('JFD_CID_COLONIES_POLICY_CHANGES_NAVIGATION_SCHOOL',					1), --Navigation School now speeds up Great Admirals and Colonists (both generation and movement).
		('JFD_CID_CRIMES_POLICY_ADDITIONS_TENETS',								1),	--Decriminalization, Secret Police, and Workers Council are Ideological Tenets that reduce various Crimes.
		('JFD_CID_CRIMES_POLICY_CHANGES_REPUBLIC',								1),	--Republic now reduces Theft and is renamed to Popular Assembly.
		('JFD_CID_CRIMES_POLICY_CHANGES_SCIENTIFIC_REVOLUTION',					1),	--Scientific Revolution now reduces Fraud.
		('JFD_CID_HEALTH_POLICY_CHANGES_PIETY',									1),	--Piety Opener now allows purchasing Great Doctors with Faith.
		('JFD_CID_HEALTH_POLICY_CHANGES_ORGANIZED_RELIGION',					1),	--Organized Religion now yields Health on Shrines and Temples.
		('JFD_CID_HEALTH_POLICY_CHANGES_TRADITION',								1),	--Tradition Finisher now grants free Aqueducts OR Cisterns.
		('JFD_CID_HEALTH_POLICY_CHANGES_UNIVERSAL_HEALTHCARE',					1),	--Universal Healthcare now reduces Disease from Population.
		('JFD_CID_LOYALTY_POLICY_CHANGES_MILITARY_CASTE',						1),	--Military Caste now increases Loyalty from garrisons per their Level.
		('JFD_CID_INVESTMENTS_POLICY_CHANGES_MERCANTILISM',						1),	--Mercantilism now increases Investments value by 15%.
		('JFD_CID_PROVINCES_POLICY_CHANGES_MOBILIZATION',						1),	--Mobilization now grants one additional Levy when conscripted.
		('JFD_CID_SLAVERY_POLICY_CHANGES_HONOR_FINISHER',					    1),	--Honor Finisher now grants Shackles from clearing Encampments.
		('JFD_EXCE_EXPLORATION_POLICY_CHANGES',									1), --Various changes to the Exploration Policy Tree.
		('JFD_PIT_POLICY_CHANGES_SECULARISM',									1), --Secularism now yields +1 Science from Specialists.
		('JFD_RTP_CLAIMS_POLICY_CHANGES_LIBERTY_OPENER',						1), --Liberty Opener now unlocks the Forum Romanum and to allows Faith purchasing of Great Magistrates.
		('JFD_RTP_CLAIMS_POLICY_CHANGES_PATRONAGE_FINISHER',					1), --Patronage Opener now allows Faith purchasing of Great Dignitaries.
		('JFD_RTP_MERCENARIES_POLICY_CHANGES_MERCENARY_ARMY',					1), --Mercenary Army now reduces Contract costs.
		('JFD_RTP_PIETY_POLICY_CHANGES',										1); --Various changes to the Piety tree.
--==========================================================================================================================	
-- PROCESSES
--==========================================================================================================================
/*
List of Process changes and additions throughout JFDLC.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/ 
--------------------------------------------------------------------------
INSERT OR REPLACE INTO JFD_GlobalUserSettings
		(Type,																	Value)
VALUES	('JFD_PIT_PROGRESS_PROCESSES_ADDITIONS',								1); --Production to Faith/Defense/Food/Tourism/GAP/Culture Processes.
--==========================================================================================================================	
-- RELIGION
--==========================================================================================================================
/*
List of Religion changes and additions throughout JFDLC.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/ 
--------------------------------------------------------------------------
INSERT OR REPLACE INTO JFD_GlobalUserSettings
		(Type,																	Value)
VALUES	('JFD_RTP_PIETY_RELIGION_ADDITIONS_HERMETICISM',						1), --Adds Hermeticism as a Religion.
		('JFD_RTP_PIETY_RELIGION_ADDITIONS_TLATEOMATILIZTLI',					1); --Adds Tlateomatiliztli as a Religion.
--==========================================================================================================================	
-- RESOLUTIONS
--==========================================================================================================================
/*
List of Resolution changes and additions throughout JFDLC.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/ 
--------------------------------------------------------------------------
INSERT OR REPLACE INTO JFD_GlobalUserSettings
		(Type,																	Value)
VALUES	--('JFD_CID_CRIMES_RESOLUTION_ADDITIONS_CRIMINAL_COURT',				0),	--International Criminal Court increases the Organized Crime Threshold in all cities.
		('JFD_CID_SLAVERY_RESOLUTION_ADDITIONS_HUMAN_RIGHTS',					1),	--Declaration of Human Rights World Project disables Shackles and awards Golden Age Points.
		('JFD_RTP_MERCENARIES_RESOLUTION_ADDITIONS',							1), --Ban Mercenaries forbids Mercenary Contracts.
		('JFD_RTP_PIETY_RESOLUTION_ADDITIONS_SECULARIZATION',					1); --Enforce Secularization forces all State Religions to secularize.
--==========================================================================================================================	
-- RESOURCES
--==========================================================================================================================
/*
List of Resource changes and additions throughout JFDLC.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/ 
--------------------------------------------------------------------------
INSERT OR REPLACE INTO JFD_GlobalUserSettings
		(Type,																	Value)
VALUES	('JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS',						1), --Cedar, Ginger, Lotus, Maize, Oak, Rice, Rubber, Sulfur are new Bonus Resources.
		('JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY',						1), --Feathers, Obsidian, Manuscripts, Opium, Saffron are new Luxury Resources.
		('JFD_EXCE_EXPLORATION_RESOURCE_CHANGES_BANANA',						1), --Banana now yields +1 Production, +1 Production from Plantation.
		('JFD_EXCE_EXPLORATION_RESOURCE_CHANGES_SPICES',						1); --Spice is now called Cinnamon.
--==========================================================================================================================	
-- SPECIALISTS
--==========================================================================================================================
/*
List of Specialist changes and additions throughout JFDLC.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/ 
--------------------------------------------------------------------------
INSERT OR REPLACE INTO JFD_GlobalUserSettings
		(Type,																	Value)
VALUES	('JFD_CID_CRIMES_SPECIALIST_ADDITIONS_OFFICER',							1),	--Adds the Officer Specialist to Constabularies, and Police Stations, which reduce Crime.
		--('JFD_CID_LOYALTY_SPECIALIST_ADDITIONS_ARISTOCRAT',					0),	--Adds the Aristocrat Specialist to Castles, Arsenals, and Military Bases, which increase Loyalty.
		('JFD_CID_PROVINCES_SPECIALIST_ADDITIONS_GOVERNOR',						1),	--Adds the Governor Specialist to each Province level Building, which increases Development.
		('JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK', 							1); --Adds the Monk Specialist to the Monastery, which yields Faith and Great Prophet Points.
		--('JFD_RTP_SUPPLY_SPECIALIST_ADDITIONS_ADMIRALS',						1), --Adds Admiral Specialists to Harbours, Seaports, and Drydocks, which increase Unit Supply.
		--('JFD_RTP_SUPPLY_SPECIALIST_ADDITIONS_GENERALS',						1); --Adds General Specialists to Barracks, Armories, and Military Academies, which increase Unit Supply.
--==========================================================================================================================	
-- TECHNOLOGIES
--==========================================================================================================================
/*
List of Technology changes and additions throughout JFDLC.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/ 
--------------------------------------------------------------------------
INSERT OR REPLACE INTO JFD_GlobalUserSettings
		(Type,																	Value)
VALUES	('JFD_CID_HEALTH_TECH_ADDITIONS_MEDICINE',								1),	--Adds Medicine to Medieval Era.
		('JFD_CID_HEALTH_TECH_CHANGES_ANGKOR_WAT',								1),	--Angkor Wat now unlocks at Medicine
		('JFD_CID_HEALTH_TECH_CHANGES_GREAT_WALL',								1),	--Great Wall now unlocks at Iron Working.
		('JFD_CID_HEALTH_TECH_CHANGES_GARDEN',									1),	--Garden now unlocks at Medicine.
		('JFD_CID_LOYALTY_TECH_ADDITIONS_NATIONALISM',							1),	--Adds Nationalism to the Industrial Era.
		('JFD_CID_PROVINCES_TECH_CHANGES_OPEN_BORDERS',							1),	--Open Borders now unlocks at Guilds.
		('JFD_EXCE_EXPLORATION_TECH_ADDITIONS_EMBARKATION',						1), --Half Embark cost is now unlocked at Navigation and No Embark cost at Rocketry.
		('JFD_EXCE_EXPLORATION_TECH_CHANGES_SCOUT',								1), --Scout is now unlocked at Trapping.
		('JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS',							1), --Adds Code of Laws to the Medieval Era.
		('JFD_RTP_CLAIMS_TECH_ADDITIONS_JURISPRUDENCE',							1), --Adds Jurisprudence to the Medieval Era.
		('JFD_RTP_CLAIMS_TECH_ADDITIONS_NOBILITY',								1), --Adds Nobility to the Medieval Era.
		('JFD_RTP_MERCENARIES_TECH_ADDITIONS',									1), --Adds Mercenaries to the Classical Era.
		('JFD_RTP_MERCENARIES_TECH_CHANGES_TERRACOTTA',							1), --Terracotta Army is now unlocked at Mercenaries.
		('JFD_RTP_PIETY_TECH_ADDITIONS_MYSTICISM', 								1), --Adds Mysticism to the Ancient Era.
		('JFD_RTP_PIETY_TECH_ADDITIONS_PRIESTHOOD', 							1), --Adds Priesthood to the Classical Era.
		('JFD_RTP_PIETY_TECH_ADDITIONS_RELIGIOUS_ORDERS', 						1), --Adds Religious Orders to the Medieval Era.
		('JFD_RTP_PROSPERITY_TECH_CHANGES_SEA_TRADE_RANGE',						0); --Compass' Sea Trade Route Range bonus is moved to Astronomy.
--==========================================================================================================================	
-- TERRAINS
--==========================================================================================================================
/*
List of Terrain changes and additions throughout JFDLC.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/ 
--------------------------------------------------------------------------
INSERT OR REPLACE INTO JFD_GlobalUserSettings
		(Type,																	Value)
VALUES	('JFD_EXCE_EXPLORATION_TERRAIN_CHANGES_DESERT',							1); --Farms can no longer be built on desert without a source of fresh water (like Snow).
--==========================================================================================================================	
-- UNIT PROMOTIONS
--==========================================================================================================================
/*
List of Promotion changes and additions throughout JFDLC.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/ 
--------------------------------------------------------------------------
INSERT OR REPLACE INTO JFD_GlobalUserSettings
		(Type,																	Value)
VALUES	('JFD_EXCE_EXPLORATION_PROMOTION_ADDITIONS_INTREPID',					1), --Intrepid Adventurer doubles movement in Forest, Jungle, and Marsh for Recon Units.
		('JFD_EXCE_EXPLORATION_PROMOTION_ADDITIONS_RECON_XP',					1), --Reconnaissance allows Recon Units to earn XP from uncovering Fog of War and Natural Wonders.
		('JFD_EXCE_EXPLORATION_PROMOTION_ADDITIONS_TACTICS',					1), --Tactics increases for Recon Units bonus vs. cities for adjacent units adjacent.
		('JFD_EXCE_EXPLORATION_PROMOTION_CHANGES_IGNORE_TERRAIN',				1), --Ignore Terrain Cost promotion now allows units to cross Mountains and Ice.
		('JFD_PIT_PROGRESS_PROMOTION_ADDITIONS_NAVAL_PENALTY',					1); --Adds Penalty vs. Naval Units to Mounted Ranged units.
-------------
/*
Settings for Reconnaissance Promotion

RECON XP SETTINGS
-------------
*/ 
--------------------------------------------------------------------------
UPDATE Defines SET Value = 20	WHERE Name = 'BALANCE_SCOUT_XP_RANDOM_VALUE';   --Chance for a Recon Unit to gain XP from uncovering each tile.
UPDATE Defines SET Value = 100	WHERE Name = 'BALANCE_SCOUT_XP_MAXIMUM';	    --Max. XP a Recon Unit can gain from exploring.
UPDATE Defines SET Value = 10	WHERE Name = 'BALANCE_SCOUT_XP_NATURAL_WONDER'; --XP gained from discovering a Natural Wonder.	
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
/*
List of Unit changes and additions throughout JFDLC.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/ 
--------------------------------------------------------------------------
INSERT OR REPLACE INTO JFD_GlobalUserSettings
		(Type,																	Value)
VALUES	('JFD_CID_COLONIES_UNIT_ADDITIONS_COLONIST',							1), --Colonist can found Colonies which begin with advanced infrastructure.
		('JFD_CID_COLONIES_UNIT_CHANGES_SETTLER',								1), --Settler now obsoletes at Astronomy.
		('JFD_CID_POWER_UNIT_CHANGES_GATLING_GUN',								1),	--Gatling Gun now unlocked at Rifling.
		('JFD_CID_SLAVERY_UNIT_ADDITIONS_LABOURER',								1),	--Labourer works faster than the Worker but requires Shackles to purchase.
		('JFD_EXCE_EXPLORATION_UNIT_ADDITIONS_RECON_LINE',						1), --Explorer and Adventurer are upgrades to the Scout.
		('JFD_EXCE_EXPLORATION_UNIT_ADDITIONS_AIRSHIP',							0), --Airship as an upgrade to the Adventurer.
		('JFD_EXCE_EXPLORATION_UNIT_CHANGES_CARAVEL',							1), --Caravel now earns XP from uncovering Fog of War.
		('JFD_EXCE_EXPLORATION_UNIT_CHANGES_TRIREME',							1), --Trireme now has one less movement.
		('JFD_PIT_PROGRESS_UNIT_ADDITIONS_GALLEY',								1), --Galley is an early Ranged Naval Unit.
		('JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED',						1), --Mounted Crossbowman, Pistolier, and Dragoon are ranged Mounted Units.
		('JFD_PIT_PROGRESS_UNIT_ADDITIONS_SLINGER',								1), --Slinger is a basic ranged unit before the Archer.
		('JFD_PIT_PROGRESS_UNIT_CHANGES_PEASANT',								1), --Worker is now split between the (early) Peasant and (late) Worker.
		('JFD_PIT_PROGRESS_UNIT_CHANGES_UPGRADES',								1); --Alternative upgrade paths for Warrior (Spearman), Pikeman (Musketman), Crossbowman (Musketman), and Lancer (Cuirassier). Thanks to Whoward.
--==========================================================================================================================	
-- VICTORIES
--==========================================================================================================================
/*
List of Victory changes and additions throughout JFDLC.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/ 
--------------------------------------------------------------------------
INSERT OR REPLACE INTO JFD_GlobalUserSettings
		(Type,																	Value)
VALUES	--('JFD_RTP_PIETY_VICTORY_ADDITIONS_RELIGIOUS',					1), --Adds a Religious Victory based on that by Barbarian_King.
		('JFD_SD_SOCIETY_VICTORY_CHANGES_CULTURAL',								1); --Cultural Victory now requires an Ideology and Content Public Opinion.
--==========================================================================================================================	
-- WONDERS
--==========================================================================================================================
/*
List of Wonder changes and additions throughout JFDLC.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/ 
--------------------------------------------------------------------------
INSERT OR REPLACE INTO JFD_GlobalUserSettings
		(Type,																	Value)
VALUES	('JFD_CID_COLONIES_NATIONAL_WONDER_CHANGES_EIC',						1), --East India Company now increases Gold from Colonies. Adds National Treasury to take over extra Gold from Trade Routes.
		('JFD_CID_LOYALTY_NATIONAL_WONDER_CHANGES_EIC',							1),	--East India Company now reduces Disloyalty from distance to the Capital (takes priority over the above).
		('JFD_CID_PROVINCES_NATIONAL_WONDER_ADDITIONS_SUMMER_PALACE',			1), --Summer Palace decreases effect of Cities on Province upgrade requirements.
		('JFD_PIT_PROGRESS_NATIONAL_WONDER_CHANGES_NATIONAL_TREASURY',			1),	--National Treasury now requires Banks and is unlocked at Banking.
		('JFD_RTP_PIETY_NATIONAL_WONDER_ADDITIONS_INQUISITION',					1), --The Grand Inqusition National Wonder increases Piety from all sources.
		('JFD_RTP_PIETY_NATIONAL_WONDER_CHANGES_GRAND_TEMPLE',					1), --Grand Temple now yields +5 Faith instead of +8. Grand Temple is now unlocked at Priesthood.
		('JFD_CID_COLONIES_WONDER_ADDITIONS_PENA_PALACE',						1), --Pena National Palace increases Gold, Culture, and Faith on Colonies.
		('JFD_CID_CRIMES_WONDER_ADDITIONS_TOWER_LONDON',						1),	--Tower of London eliminates Treason in the city.
		('JFD_CID_CRIMES_WONDER_CHANGES_PENTAGON',								1),	--Pentagon reduces Abduction and Violence in the city.
		('JFD_CID_CRIMES_WONDER_CHANGES_UFFIZI',								1),	--Uffizi eliminates all Crime from Great Works in the city.
		('JFD_CID_HEALTH_WONDER_ADDITIONS_PONT_DU_GARD',						1),	--Pont du Gard wonder grants a free Aqueduct and increases Food from Health by 20%.
		('JFD_CID_HEALTH_WONDER_CHANGES_ALHAMBRA',								1),	--Alhmabra now yields Great Doctor Points.
		('JFD_CID_HEALTH_WONDER_CHANGES_ANGKOR_WAT',							1),	--Angkor Wat now yields Great Doctor Points and Health on Holy Sites.
		('JFD_CID_HEALTH_WONDER_CHANGES_CHICHEN_ITZA',							1),	--Chichen Itza now yields Health.
		('JFD_CID_HEALTH_WONDER_CHANGES_HANGING_GARDENS',						1),	--Hanging Gardens now yields Great Doctor Points, Health, grants a free Garden, and to increase Health on all Gardens.
		('JFD_CID_HEALTH_WONDER_CHANGES_MOSQUE_DJENNE',							1),	--Great Mosque of Djenne now unlocked at Medicine.
		('JFD_CID_HEALTH_WONDER_CHANGES_TEMPLE_ARTEMIS',						1),	--Temple of Artemis now yields Health and Great Doctor Points.
		('JFD_CID_POWER_WONDER_ADDITIONS_THREE_GORGES',							1),	--Three Gorges Dam grants a free Hydro Plant and Power.
		('JFD_CID_POWER_WONDER_CHANGES_BIG_BEN',								1),	--Big Ben now unlocks at Rifling.
		('JFD_CID_SLAVERY_WONDER_ADDITIONS_STONE_TOWN',							1),	--Stone Town wonder increases Shackles from Trade Routes.
		('JFD_EXCE_EXPLORATION_WONDER_ADDITIONS_BELEM_TOWER',					1), --Belem Tower wonder grants a free Great Admiral, and Defense and Sight for Embarked Units.
		('JFD_PIT_INNOVATIONS_WONDER_ADDITIONS_YELLOW_CRANE',					1), --Yellow Crane Tower allows an additional Innovation on all techs.
		--('JFD_PIT_PROGRESS_WONDER_ADDITIONS_CHARTRES',						1), --Chartres Cathedral, TBD
		('JFD_PIT_PROGRESS_WONDER_ADDITIONS_DA_VINCI',							1), --Leonardo's Workshop upgrades all Siege Units for free.
		('JFD_CID_DEVELOPMENT_WONDER_ADDITIONS_EL_TAJIN',							1), --El Tajin reduces the Development Population threshold in all cities.
		('JFD_PIT_PROGRESS_WONDER_ADDITIONS_GOBEKLI',							1), --Gobleki Tepi immediately grants a Pantheon.
		('JFD_PIT_PROGRESS_WONDER_ADDITIONS_GREAT_ZIGGURAT',					1), --Great Ziggurat grants an Innovation for all Ancient Era techs.
		--('JFD_PIT_PROGRESS_WONDER_ADDITIONS_HAWA_MADAL',						1), --Hawa Mahal, TBD 
		('JFD_PIT_PROGRESS_WONDER_ADDITIONS_HOLLYWOOD',							1), --Hollywood grants a free Great Director and 3 Great Works of Film slots.
		--('JFD_PIT_PROGRESS_WONDER_ADDITIONS_MAHAVEDA',						1), --Mahadeva Temple, TBD 
		('JFD_PIT_PROGRESS_WONDER_ADDITIONS_ST_BASILS',							1), --St. Basil's Cathedral grants a Reformation Belief. Original wonder is now Motherland Calls.
		--('JFD_PIT_PROGRESS_WONDER_ADDITIONS_ST_MARKS',						1), --St. Mark's Basilica, TBD 
		('JFD_PIT_PROGRESS_WONDER_ADDITIONS_VENETIAN_ARSENAL',					1), --The Venetian Arsenal increases Naval Production and grants 2 free Galleasses.
		--('JFD_PIT_PROGRESS_WONDER_CHANGES_GREAT_PEOPLE_POINTS',				1), --Adds and changes various Great People Points on Wonders.
		('JFD_PIT_PROGRESS_WONDER_CHANGES_GREAT_WALL',							1),	--Great Wall now provides free Walls in all cities.
		('JFD_PIT_PROGRESS_WONDER_CHANGES_MOTHERLAND_CALLS',					1),	--Motherland Calls/Kremlin now comes with a pre-filled Great Work of Film.
		('JFD_RTP_CLAIMS_WONDER_ADDITIONS_FORUM',								1), --Forum Romanum grants a Magistrate's Court in all cities.
		('JFD_RTP_CLAIMS_WONDER_ADDITIONS_WESTMINSTER',							1), --Westminster Abbey increases Faith and Culture during WLTKD.
		('JFD_RTP_CLAIMS_WONDER_CHANGES_BIG_BEN',								1), --Big Ben now yields Great Magistrate Points.
		('JFD_RTP_CLAIMS_WONDER_CHANGES_FORBIDDEN_PALACE',						1), --Forbidden Palace to yield Great Magistrate Points.
		('JFD_RTP_MERCENARIES_WONDER_ADDITIONS_JIAUGYUAN',						1), --Jiayuguan Fort wonder, which extends length of new Contracts.
		('JFD_RTP_PIETY_WONDER_ADDITIONS_ABU_SIMBEL',							1), --Abu Simbel replicates the God-King pantheon effects.
		('JFD_RTP_PIETY_WONDER_ADDITIONS_BUDDHAS_BAMIYAN',						1), --The Buddhas of Bamiyan increase Piety from all sources.
		('JFD_RTP_PIETY_WONDER_ADDITIONS_COLOGNE_CATHEDRAL',					1), --Cologne Cathedral grants Tourism and Culture on religious buildings.
		('JFD_RTP_PIETY_WONDER_ADDITIONS_DOME_ROCK',							1), --The Dome of the Rock grants Piety from Conquests and eliminates the Piety penatly from attacking Civs of your State Religion.
		('JFD_RTP_PIETY_WONDER_ADDITIONS_PANTHEON',								1), --The Pantheon grants the second most popular pantheon belief in your cities.
		('JFD_RTP_PIETY_WONDER_ADDITIONS_SOLOMONS_TEMPLE',						1), --Solomons Temple grants a free Great Prophet.
		('JFD_RTP_PIETY_WONDER_ADDITIONS_TODAI',								1), --Todai Ji Temple grants GAP from kills for units purchased with Faith.
		('JFD_RTP_PIETY_WONDER_ADDITIONS_TEMPLE_HEAVEN',						1), --Temple of Heaven grants extra Food and Faith during Golden Ages.
		('JFD_RTP_PIETY_WONDER_CHANGES_BOROBUDUR',								1), --Borobudur now uses a new icon by Sukritact.
		('JFD_RTP_PIETY_WONDER_CHANGES_DJENNE',									1), --Mosque of Djenne now yields Great Prophet Points
		('JFD_RTP_PIETY_WONDER_CHANGES_HAGIA_SOPHIA',							1), --Hagia Sophia now has 1 Great Work of Art slot, increases Monk Faith by +1 in the city, and yields Great Engineer Points. Hagia Sophia is now unlocked at Drama and Poetry.
		('JFD_RTP_PIETY_WONDER_CHANGES_STONEHENGE',								1), --Stonehenge now grants a free Shrine and yields Great Prophet Points.
		--('JFD_RTP_PROSPERITY_WONDER_ADDITIONS_GRAND_CANAL',						0), --Adds Grand Canal wonder to Compass.
		('JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_AMER_FORT',						1), --Amer Fort grants a free Castle and increases CS in friendly territory (reqires Himeji Castle changes).
		('JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DOGES_PALACE',					1), --Doge's Palace grants Sovereignty with Trade Routes.
		('JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DUR_SHARRIKUN',					1),	--Sargon's Palace allowss you to choose a Government immediately, and allows Production Trade Routes to be made in any city.
		('JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_HOFBURG_PALACE',					1),	--Hofburg Palace unlocks the Holy Roman Empire government.
		('JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_ST_PETERS',						1),	--St. Peter's Basilica grants Sovereignty with Devout Piety.
		('JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_VERSAILLES',						1),	--Verailles grants Sovereignty with Great Works.
		('JFD_RTP_SOVEREIGNTY_WONDER_CHANGES_HIMEJI_CASTLE',					0),	--Himeji Castle now unlocks the Shogunate government (DO NOT ENABLE).
		('JFD_SD_TALENTS_WONDER_ADDITIONS_TRAFALGAR',							1);	--Trafalgar Square grants a free Great Admiral and increases Talents for Great Admirals.
--==========================================================================================================================	
-- DO NOT MODIFY 
--==========================================================================================================================
--COMMUNITY BALANCE OVERHAUL
--------------------------
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_HAPPINESS_CORE', 'JFD_CID_HEALTH_BUILDING_ADDITIONS_CISTERN', 'JFD_CID_LOYALTY_TECH_ADDITIONS_NATIONALISM', 'JFD_CID_HEALTH_POLICY_CHANGES_TRADITION', 'JFD_CID_INVESTMENTS_POLICY_CHANGES_MERCANTILISM', 'JFD_CID_POWER_BUILDING_ADDITIONS_OIL_REFINERY', 'JFD_CID_POWER_BUILDING_ADDITIONS_WIND_FARM', 'JFD_CID_HEALTH_BUILDING_ADDITIONS_GRAIN_SILO', 'JFD_CID_HEALTH_BUILDING_CHANGES_MONASTERY', 'JFD_CID_COLONIES_UNIT_CHANGES_SETTLER', 'JFD_CID_HEALTH_TECH_CHANGES_ANGKOR_WAT', 'JFD_CID_HEALTH_TECH_CHANGES_GARDEN', 'JFD_CID_HEALTH_TECH_ADDITIONS_MEDICINE', 'JFD_CID_HEALTH_POLICY_CHANGES_UNIVERSAL_HEALTHCARE', 'JFD_CID_HEALTH_POLICY_CHANGES_PIETY', 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST', 'JFD_CID_HEALTH_BELIEF_CHANGES_ONE_WITH_NATURE', 'JFD_CID_HEALTH_BELIEF_ADDITIONS_SHAMANISM', 'JFD_CID_HEALTH_BELIEF_ADDITIONS_GOD_MEDICINE', 'JFD_CID_CRIMES_BUILDING_CHANGES_BURIAL_TOMB', 'JFD_CID_CRIMES_BUILDING_CHANGES_MUD_PYRAMID', 'JFD_CID_CRIMES_BUILDING_CHANGES_SATRAPS_COURT', 'JFD_CID_LOYALTY_POLICY_CHANGES_MILITARY_CASTE', 'JFD_CID_COLONIES_BELIEF_ADDITIONS_MISSION_COLONIES', 'JFD_CID_COLONIES_UNIT_ADDITIONS_COLONIST', 'JFD_CID_HEALTH_BELIEF_ADDITIONS_HEALING_VAPORS', 'JFD_CID_SLAVERY_UNIT_ADDITIONS_LABOURER', 'JFD_CID_COLONIES_POLICY_CHANGES_NAVIGATION_SCHOOL')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1);

UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_PIT_POLICY_CHANGES_SECULARISM', 'JFD_PIT_PROGRESS_PROCESSES_ADDITIONS', 'JFD_EXCE_EXPLORATION_BUILDING_CHANGES_FACTORY', 'JFD_EXCE_EXPLORATION_BUILDING_CHANGES_GRANARY', 'JFD_EXCE_EXPLORATION_BUILDING_CHANGES_MONASTERY' ,'JFD_PIT_PROGRESS_WONDER_CHANGES_GREAT_WALL', 'JFD_PIT_PROGRESS_BUILDING_CHANGES_CULTURE_LINE', 'JFD_PIT_INNOVATIONS_CORE', 'JFD_PIT_PROGRESS_IMPROVEMENT_CHANGES_WHALING_BOATS', 'JFD_PIT_PROGRESS_BUILDING_CHANGES_MINT', 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_GALLEY', 'JFD_EXCE_EXPLORATION_WONDER_ADDITIONS_BELEM_TOWER', 'JFD_EXCE_EXPLORATION_PROMOTION_ADDITIONS_INTREPID', 'JFD_EXCE_EXPLORATION_PROMOTION_ADDITIONS_RECON_XP', 'JFD_EXCE_EXPLORATION_PROMOTION_ADDITIONS_TACTICS', 'JFD_EXCE_EXPLORATION_UNIT_ADDITIONS_AIRSHIP', 'JFD_EXCE_EXPLORATION_UNIT_CHANGES_CARAVEL', 'JFD_EXCE_EXPLORATION_CIVILIZATION_CHANGES_INCA', 'JFD_EXCE_EXPLORATION_TECH_CHANGES_SCOUT', 'JFD_EXCE_EXPLORATION_POLICY_CHANGES', 'JFD_EXCE_EXPLORATION_UNIT_CHANGES_TRIREME', 'JFD_EXCE_EXPLORATION_TERRAIN_CHANGES_DESERT', 'JFD_EXCE_EXPLORATION_ANCIENT_RUINS_ADDITIONS_GOLDEN_AGE', 'JFD_EXCE_EXPLORATION_ANCIENT_RUINS_ADDITIONS_PRODUCTION', 'JFD_EXCE_EXPLORATION_ANCIENT_RUINS_ADDITIONS_TILES')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_COMMUNITY_BALANCE_PATCH' AND Value = 1);

UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_PIT_PROGRESS_WONDER_CHANGES_GREAT_WALL', 'JFD_PIT_INNOVATIONS_CORE', 'JFD_PIT_PROGRESS_IMPROVEMENT_CHANGES_WHALING_BOATS', 'JFD_PIT_PROGRESS_BUILDING_CHANGES_MINT', 'JFD_PIT_PROGRESS_BUILDING_CHANGES_CULTURE_LINE', 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_GALLEY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_COMMUNITY_BALANCE_PATCH' AND Value = 1);

UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_RTP_MERCENARIES_POLICY_CHANGES', 'JFD_RTP_PIETY_TECH_ADDITIONS_MYSTICISM', 'JFD_RTP_PIETY_WONDER_CHANGES_DJENNE', 'JFD_RTP_PIETY_BELIEF_ADDITIONS_EVANGELISM', 'JFD_RTP_CLAIMS_BUILDING_CHANGES_FORGES', 'JFD_RTP_CLAIMS_BUILDING_CHANGES_WINDMILL', 'JFD_RTP_CLAIMS_TECH_ADDITIONS_NOBILITY', 'JFD_RTP_PIETY_WONDER_CHANGES_HAGIA_SOPHIA', 'JFD_RTP_PIETY_WONDER_CHANGES_STONEHENGE', 'JFD_RTP_CLAIMS_POLICY_CHANGES_LIBERTY_OPENER', 'JFD_RTP_CLAIMS_POLICY_CHANGES_PATRONAGE_FINISHER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH' AND Value = 1);
--------------------------
--ENLIGHTENMENT ERA
--------------------------
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_PIT_PROGRESS_CORE')
AND NOT EXISTS (SELECT Type FROM Technologies WHERE Type = 'TECH_EE_IMPERIALISM');

UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_PIT_PROGRESS_BUILDING_CHANGES_CULTURE_LINE')
AND NOT EXISTS (SELECT Type FROM Technologies WHERE Type = 'TECH_EE_IMPERIALISM');
--------------------------
--EVENTS & DECISIONS
--------------------------
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('SUK_DECISIONS_RTP_SUPPLY_RESOURCE_ADDITIONS_CAPTAINS', 'SUK_DECISIONS_RTP_PIETY_RESOURCE_ADDITIONS_CLERICS', 'SUK_DECISIONS_SD_TALENTS_RESOURCE_ADDITIONS_INVENTORS')
AND NOT EXISTS (SELECT Type FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');
--------------------------
--CID: COLONIES
--------------------------
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_COLONIES_WONDER_ADDITIONS_PENA_PALACE', 'JFD_CID_COLONIES_NATIONAL_WONDER_CHANGES_EIC', 'JFD_CID_COLONIES_BELIEF_ADDITIONS_MISSION_COLONIES', 'JFD_CID_COLONIES_UNIT_ADDITIONS_COLONIST', 'JFD_CID_COLONIES_POLICY_CHANGES_NAVIGATION_SCHOOL')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 0);

UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_COLONIES_BELIEF_ADDITIONS_MISSION_COLONIES', 'JFD_CID_COLONIES_POLICY_CHANGES_NAVIGATION_SCHOOL')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_UNIT_ADDITIONS_COLONIST' AND Value = 0);
--------------------------
--CID: CRIME
--------------------------
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_CRIMES_SPECIALIST_ADDITIONS_OFFICER', 'JFD_CID_DEVELOPMENT_CORE', 'JFD_CID_CRIMES_POLICY_ADDITIONS_TENETS', 'JFD_CID_CRIMES_BUILDING_CHANGES_NATIONAL_WONDERS', 'JFD_CID_CRIMES_CORE_ORGANIZED', 'JFD_CID_CRIMES_BUILDING_CHANGES_BURIAL_TOMB', 'JFD_CID_CRIMES_BUILDING_CHANGES_MUD_PYRAMID', 'JFD_CID_CRIMES_WONDER_CHANGES_PENTAGON', 'JFD_CID_CRIMES_BUILDING_CHANGES_SATRAPS_COURT', 'JFD_CID_CRIMES_WONDER_ADDITIONS_TOWER_LONDON', 'JFD_CID_CRIMES_CIVILIZATION_CHANGES_INDIA')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 0);

UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_CRIMES_RESOLUTION_ADDITIONS_CRIMINAL_COURT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 0);
--------------------------
--CID: DEVELOPMENT
--------------------------
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_PROVINCES_SPECIALIST_ADDITIONS_GOVERNOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 0);
--------------------------
--CID: HAPPINESS
--------------------------
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_HAPPINESS_CORE_EXCESS_INTO_PRODUCTION_MOD', 'JFD_CID_HAPPINESS_CORE_EXCESS_INTO_PRODUCTION_RAW', 'JFD_CID_HAPPINESS_CORE_CITY_BANNER_TURNS', 'JFD_CID_HAPPINESS_CORE_NOTIFICATION_FIRST_RESISTANCE_TURNS', 'JFD_CID_HAPPINESS_CORE_NOTIFICATION_SECOND_RESISTANCE_TURNS', 'JFD_CID_HAPPINESS_BUILDING_CHANGES_PALACE', 'JFD_CID_HEALTH_WONDER_CHANGES_MOSQUE_DJENNE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HAPPINESS_CORE' AND Value = 0);

UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_HAPPINESS_CORE_EXCESS_INTO_PRODUCTION_MOD')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HAPPINESS_CORE_EXCESS_INTO_PRODUCTION_RAW' AND Value = 1);

UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_HAPPINESS_CORE_EXCESS_INTO_PRODUCTION_RAW')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HAPPINESS_CORE_EXCESS_INTO_PRODUCTION_MOD' AND Value = 1);
--------------------------
--CID: HEALTH
--------------------------
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_HEALTH_CORE_EXCESS_INTO_FOOD_MOD', 'JFD_CID_HEALTH_CORE_EXCESS_INTO_FOOD_RAW', 'JFD_CID_HEALTH_CORE_SETTLER_NO_PLAGUES', 'JFD_CID_HEALTH_CORE_CITY_BANNER_TURNS', 'JFD_CID_CRIMES_CORE_ORGANIZED', 'JFD_CID_HEALTH_GREAT_PEOPLE_ADDITIONS_DOCTOR', 'JFD_CID_HEALTH_CORE_PLAGUE_EFFECT', 'JFD_CID_DEVELOPMENT_CORE', 'JFD_CID_HEALTH_BUILDING_ADDITIONS_CISTERN', 'JFD_CID_HEALTH_BUILDING_CHANGES_MONASTERY', 'JFD_CID_HEALTH_BUILDING_ADDITIONS_GRAIN_SILO', 'JFD_CID_HEALTH_BELIEF_ADDITIONS_GOD_MEDICINE', 'JFD_CID_HEALTH_BELIEF_ADDITIONS_SHAMANISM', 'JFD_CID_HEALTH_BELIEF_CHANGES_ONE_WITH_NATURE', 'JFD_CID_HEALTH_BUILDING_CHANGES_FLOATING_GARDENS', 'JFD_CID_HEALTH_BUILDING_CHANGES_LONGHOUSE', 'JFD_CID_HEALTH_FEATURE_CHANGES_FOUNTAIN_YOUTH', 'JFD_CID_HEALTH_WONDER_ADDITIONS_PONT_DU_GARD', 'JFD_CID_HEALTH_POLICY_CHANGES', 'JFD_CID_HEALTH_GREAT_PEOPLE_ADDITIONS_DOCTOR', 'JFD_CID_HEALTH_WONDER_CHANGES_HANGING_GARDENS', 'JFD_CID_HEALTH_WONDER_CHANGES_CHICHEN_ITZA', 'JFD_CID_HEALTH_TECH_ADDITIONS_MEDICINE', 'JFD_CID_HEALTH_WONDER_CHANGES_ANGKOR_WAT', 'JFD_CID_HEALTH_WONDER_CHANGES_ALHAMBRA', 'JFD_CID_HEALTH_CORE_FIRST_NOTIFICATION_PLAGUE_TURNS', 'JFD_CID_HEALTH_CORE_SECOND_NOTIFICATION_PLAGUE_TURNS', 'JFD_CID_HEALTH_BELIEF_ADDITIONS_HEALING_VAPORS', 'JFD_CID_HEALTH_FEATURE_CHANGES_LAKE_VICTORIA', 'JFD_CID_HEALTH_WONDER_CHANGES_TEMPLE_ARTEMIS', 'JFD_CID_HAPPINESS_CORE', 'JFD_CID_HEALTH_BUILDING_ADDITIONS_CISTERN', 'JFD_CID_LOYALTY_TECH_ADDITIONS_NATIONALISM', 'JFD_CID_HEALTH_POLICY_CHANGES_TRADITION', 'JFD_CID_INVESTMENTS_POLICY_CHANGES_MERCANTILISM', 'JFD_CID_POWER_BUILDING_ADDITIONS_OIL_REFINERY', 'JFD_CID_POWER_BUILDING_ADDITIONS_WIND_FARM', 'JFD_CID_HEALTH_BUILDING_ADDITIONS_GRAIN_SILO', 'JFD_CID_HEALTH_BUILDING_CHANGES_MONASTERY', 'JFD_CID_COLONIES_UNIT_CHANGES_SETTLER', 'JFD_CID_HEALTH_TECH_CHANGES_ANGKOR_WAT', 'JFD_CID_HEALTH_TECH_CHANGES_GARDEN', 'JFD_CID_HEALTH_TECH_ADDITIONS_MEDICINE', 'JFD_CID_HEALTH_POLICY_CHANGES_UNIVERSAL_HEALTHCARE', 'JFD_CID_HEALTH_POLICY_CHANGES_PIETY', 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST', 'JFD_CID_HEALTH_BELIEF_CHANGES_ONE_WITH_NATURE', 'JFD_CID_HEALTH_BELIEF_ADDITIONS_SHAMANISM', 'JFD_CID_HEALTH_BELIEF_ADDITIONS_GOD_MEDICINE', 'JFD_CID_CRIMES_BUILDING_CHANGES_BURIAL_TOMB', 'JFD_CID_CRIMES_BUILDING_CHANGES_MUD_PYRAMID', 'JFD_CID_CRIMES_BUILDING_CHANGES_SATRAPS_COURT', 'JFD_CID_LOYALTY_POLICY_CHANGES_MILITARY_CASTE', 'JFD_CID_COLONIES_BELIEF_ADDITIONS_MISSION_COLONIES', 'JFD_CID_COLONIES_UNIT_ADDITIONS_COLONIST', 'JFD_CID_HEALTH_BELIEF_ADDITIONS_HEALING_VAPORS', 'JFD_CID_SLAVERY_UNIT_ADDITIONS_LABOURER', 'JFD_CID_COLONIES_POLICY_CHANGES_NAVIGATION_SCHOOL', 'JFD_CID_SLAVERY_BELIEF_CHANGES_GOD_WAR', 'JFD_RTP_MERCENARIES_POLICY_CHANGES_MERCENARY_ARMY', 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER', 'JFD_RTP_PIETY_TECH_ADDITIONS_MYSTICISM', 'JFD_RTP_PIETY_WONDER_CHANGES_DJENNE', 'JFD_RTP_PIETY_BELIEF_ADDITIONS_EVANGELISM', 'JFD_RTP_CLAIMS_BUILDING_CHANGES_FORGES', 'JFD_RTP_CLAIMS_BUILDING_CHANGES_WINDMILL', 'JFD_RTP_CLAIMS_TECH_ADDITIONS_NOBILITY', 'JFD_RTP_PIETY_WONDER_CHANGES_HAGIA_SOPHIA', 'JFD_RTP_PIETY_WONDER_CHANGES_STONEHENGE', 'JFD_RTP_CLAIMS_POLICY_CHANGES_LIBERTY_OPENER', 'JFD_RTP_CLAIMS_POLICY_CHANGES_PATRONAGE_FINISHER' ,'JFD_RTP_PIETY_BELIEF_ADDITIONS_CEREMONIAL_ROBES', 'JFD_RTP_PIETY_BELIEF_ADDITIONS_GOD_FORGE', 'JFD_RTP_PIETY_BELIEF_ADDITIONS_GOD_HORSES', 'JFD_RTP_PIETY_BELIEF_ADDITIONS_GODDESS_HARVEST', 'JFD_RTP_PIETY_BELIEF_ADDITIONS_GODDESS_HEARTH', 'JFD_RTP_PIETY_BELIEF_ADDITIONS_GODDESS_STRATEGY', 'JFD_RTP_PIETY_BELIEF_ADDITIONS_GOD_LUCK', 'JFD_RTP_PIETY_BELIEF_ADDITIONS_HOLIDAYS', 'JFD_RTP_PIETY_BELIEF_ADDITIONS_MEDITATION', 'JFD_RTP_PIETY_BELIEF_ADDITIONS_PURIFICATION', 'JFD_RTP_PIETY_BELIEF_ADDITIONS_RELIGIOUS_HOLIDAYS', 'JFD_RTP_PIETY_BELIEF_ADDITIONS_SACRED_GROVES', 'JFD_RTP_PIETY_BELIEF_ADDITIONS_SACRED_MEDICINES', 'JFD_RTP_PIETY_BELIEF_ADDITIONS_STAR_GAZING', 'JFD_RTP_PIETY_BELIEF_CHANGES_DANCE_AURORA', 'JFD_RTP_PIETY_BELIEF_CHANGES_DESERT_FOLKLORE', 'JFD_RTP_PIETY_BELIEF_CHANGES_FAITH_HEALERS', 'JFD_RTP_PIETY_BELIEF_CHANGES_FERTILITY_RITES', 'JFD_RTP_PIETY_BELIEF_CHANGES_GOD_CRAFTSMEN', 'JFD_RTP_PIETY_BELIEF_CHANGES_GODDESS_FESTIVALS', 'JFD_RTP_PIETY_BELIEF_CHANGES_GOD_KING', 'JFD_RTP_PIETY_BELIEF_CHANGES_GODDESS_HUNT', 'JFD_RTP_PIETY_BELIEF_CHANGES_GOD_SEA', 'JFD_RTP_PIETY_BELIEF_CHANGES_GODDESS_PROTECTION', 'JFD_RTP_PIETY_BELIEF_CHANGES_HUMAN_SACRIFICES', 'JFD_RTP_PIETY_BELIEF_CHANGES_OPEN_SKY', 'JFD_RTP_PIETY_BELIEF_CHANGES_SUN_GOD', 'JFD_RTP_PIETY_BELIEF_ADDITIONS_AUSPICIOUS', 'JFD_RTP_PIETY_BELIEF_CHANGES_SACRED_PATH', 'JFD_RTP_PIETY_BELIEF_CHANGES_SACRED_WATERS', 'JFD_RTP_PIETY_BELIEF_CHANGES_HUMAN_SACRIFICES', 'JFD_RTP_PIETY_BELIEF_CHANGES_MONUMENT_GODS', 'JFD_RTP_PIETY_BELIEF_CHANGES_RELIGIOUS_IDOLS', 'JFD_RTP_PIETY_BELIEF_CHANGES_STONE_CIRCLES', 'JFD_RTP_PIETY_BELIEF_CHANGES_TITHE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 0);

UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_HEALTH_TECH_CHANGES_ANGKOR_WAT', 'JFD_CID_HEALTH_TECH_CHANGES_GARDEN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_TECH_ADDITIONS_MEDICINE' AND Value = 0);

UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_HEALTH_CORE_EXCESS_INTO_FOOD_MOD')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE_EXCESS_INTO_FOOD_RAW' AND Value = 1);

UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_HEALTH_CORE_EXCESS_INTO_FOOD_RAW')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE_EXCESS_INTO_FOOD_MOD' AND Value = 1);
--------------------------
--CID: INVESTMENTS
--------------------------
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_INVESTMENTS_CORE_UI', 'JFD_CID_INVESTMENTS_POLICY_CHANGES_MERCANTILISM')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 0);
--------------------------
--CID: LOYALTY
--------------------------
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_LOYALTY_SPECIALIST_ADDITIONS_ARISTOCRAT', 'JFD_CID_LOYALTY_NATIONAL_WONDER_CHANGES_EIC', 'JFD_CID_COLONIES_WONDER_ADDITIONS_PENA_PALACE', 'JFD_CID_LOYALTY_CORE_AI', 'JFD_CID_LOYALTY_POLICY_CHANGES_MILITARY_CASTE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 0);
--------------------------
--CID: PROVINCES
--------------------------
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_PROVINCES_NATIONAL_WONDER_ADDITIONS_SUMMER_PALACE', 'JFD_CID_PROVINCES_SPECIALIST_ADDITIONS_GOVERNOR', 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST', 'JFD_CID_PROVINCES_CORE_BOMBARD_RANGE', 'JFD_CID_PROVINCES_CORE_LEVIES')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 0);

UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_PROVINCES_TECH_CHANGES_OPEN_BORDERS', 'JFD_CID_PROVINCES_POLICY_CHANGES_MOBILIZATION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE_LEVIES' AND Value = 0);
--------------------------
--CID: POWER
--------------------------
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_POWER_BUILDING_ADDITIONS_COAL_PLANT', 'JFD_CID_POWER_BUILDING_ADDITIONS_OIL_REFINERY', 'JFD_CID_POWER_CORE_PRE_INDUSTRIAL', 'JFD_CID_POWER_WONDER_ADDITIONS_THREE_GORGES', 'JFD_CID_POWER_BUILDING_ADDITIONS_WIND_FARM')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_CORE' AND Value = 0);
----------------------------
--CID: SLAVERY
--------------------------
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_SLAVERY_POLICY_CHANGES_HONOR_FINISHER', 'JFD_CID_SLAVERY_BELIEF_CHANGES_GOD_WAR', 'JFD_CID_SLAVERY_UNIT_ADDITIONS_LABOURER', 'JFD_CID_SLAVERY_RESOLUTION_ADDITIONS_HUMAN_RIGHTS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 0);
--------------------------
--EXCE: EXPLORATION
--------------------------
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_EXCE_EXPLORATION_UNIT_ADDITIONS_AIRSHIP')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_UNIT_ADDITIONS_RECON_LINE' AND Value = 0);

UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_EXCE_EXPLORATION_WONDER_ADDITIONS_BELEM_TOWER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_POLICY_CHANGES' AND Value = 0);

UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_EXCE_EXPLORATION_BUILDING_CHANGES_GRANARY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_BONUS' AND Value = 0);
--------------------------
--PIT: INNOVATIONS
--------------------------
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_PIT_INNOVATIONS_WONDER_ADDITIONS_YELLOW_CRANE')
AND NOT EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);
--------------------------
--PIT: PROGRESS
--------------------------
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_PIT_PROGRESS_CORE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type IN ('JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS', 'JFD_RTP_CLAIMS_TECH_ADDITIONS_JURISPRUDENCE', 'JFD_RTP_CLAIMS_TECH_ADDITIONS_NOBILITY', 'JFD_RTP_MERCENARIES_TECH_ADDITIONS', 'JFD_RTP_PIETY_TECH_ADDITIONS_MYSTICISM', 'JFD_RTP_PIETY_TECH_ADDITIONS_PRIESTHOOD', 'JFD_RTP_PIETY_TECH_ADDITIONS_RELIGIOUS_ORDERS', 'JFD_CID_HEALTH_TECH_ADDITIONS_MEDICINE', 'JFD_CID_LOYALTY_TECH_ADDITIONS_NATIONALISM') AND Value = 0);

UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_PIT_PROGRESS_CORE_FIRST_FREE_GREAT_PEOPLE', 'JFD_PIT_PROGRESS_CORE_FIRST_FREE_GREAT_PEOPLE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_CORE' AND Value = 0);

UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_DEVELOPMENT_WONDER_ADDITIONS_EL_TAJIN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 0);

UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_PIT_PROGRESS_WONDER_ADDITIONS_GREAT_ZIGGURAT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 0);

UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_PIT_PROGRESS_WONDER_ADDITIONS_HOLLYWOOD', 'JFD_PIT_PROGRESS_WONDER_CHANGES_MOTHERLAND_CALLS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_GREAT_PEOPLE_ADDITIONS_DIRECTOR' AND Value = 0);

UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_PIT_PROGRESS_BUILD_CHARGES_EXCLUDES_REMOVING')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 0);

UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_PIT_PROGRESS_PROMOTION_ADDITIONS_NAVAL_PENALTY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_UNIT_ADDITIONS_MOUNTED_RANGED' AND Value = 0);
--------------------------
--RTP: CLAIMS
--------------------------
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_RTP_CLAIMS_CORE_CLAIMS', 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_WESTMINSTER', 'JFD_RTP_CLAIMS_POLICY_CHANGES_LIBERTY_OPENER', 'JFD_RTP_CLAIMS_POLICY_CHANGES_PATRONAGE_FINISHER', 'JFD_RTP_CLAIMS_TECH_ADDITIONS_CODE_OF_LAWS', 'JFD_RTP_CLAIMS_TECH_ADDITIONS_JURISPRUDENCE', 'JFD_RTP_CLAIMS_TECH_ADDITIONS_NOBILITY', 'JFD_RTP_CLAIMS_WONDER_ADDITIONS_FORUM', 'JFD_RTP_CLAIMS_WONDER_CHANGES_BIG_BEN', 'JFD_RTP_CLAIMS_WONDER_CHANGES_FORBIDDEN_PALACE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 0);
--------------------------
--RTP: MERCENARIES
--------------------------
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_RTP_MERCENARIES_POLICY_CHANGES_MERCENARY_ARMY', 'JFD_RTP_MERCENARIES_TECH_ADDITIONS', 'JFD_RTP_MERCENARIES_WONDER_CHANGES')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 0);
--------------------------
--RTP: SOVEREIGNTY
--------------------------
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_VERSAILLES', 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_ST_PETERS', 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_HOFBURG_PALACE', 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DUR_SHARRIKUN', 'JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_DOGES_PALACE', 'JFD_RTP_CLAIMS_BUILDING_CHANGES_FORGES', 'JFD_RTP_SOVEREIGNTY_TECH_CHANGES_POLICE_STATION', 'JFD_RTP_SOVEREIGNTY_WONDER_CHANGES_HIMEJI_CASTLE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 0);

UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_RTP_SOVEREIGNTY_WONDER_ADDITIONS_AMER_FORT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_WONDER_CHANGES_HIMEJI_CASTLE' AND Value = 0);
--------------------------
--RTP: PIETY
--------------------------
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_RTP_PIETY_TECH_ADDITIONS_RELIGIOUS_ORDERS', 'JFD_RTP_PIETY_BELIEF_CHANGES_FOUNDER', 'JFD_RTP_MERCENARIES_CORE_RELIGIOUS', 'JFD_RTP_PIETY_CORE_LOSS_FROM_OTHER_CITIES', 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER', 'JFD_RTP_PIETY_CIVILIZATION_CHANGES_AZTECS', 'JFD_RTP_PIETY_POLICY_CHANGES', 'JFD_RTP_PIETY_RESOLUTION_ADDITIONS_SECULARIZATION', 'JFD_RTP_PIETY_WONDER_ADDITIONS_BUDDHAS_BAMIYAN', 'JFD_RTP_PIETY_WONDER_ADDITIONS_DOME_ROCK', 'JFD_RTP_PIETY_NATIONAL_WONDER_ADDITIONS_INQUISITION', 'JFD_RTP_PIETY_WONDER_ADDITIONS_TEMPLE_HEAVEN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 0);

UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_PIT_PROGRESS_WONDER_ADDITIONS_MAHAVEDA')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_BELIEF_CHANGES_FOLLOWER' AND Value = 0);

UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_RTP_PIETY_WONDER_CHANGES_HAGIA_SOPHIA')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_SPECIALIST_ADDITIONS_MONK' AND Value = 0);
-------------
--SD: SOCIETY
-------------
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_SD_SOCIETY_CORE')
AND NOT EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);
-------------
--SD: TALENTS
-------------
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_SD_TALENTS_WONDER_ADDITIONS_TRAFALGAR')
AND NOT EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_TALENTS_CORE' AND Value = 1);
--==========================================================================================================================	
--==========================================================================================================================	