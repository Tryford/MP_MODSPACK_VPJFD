--==========================================================================================================================
-- USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 											text 										default NULL,
	Value 											integer 									default 1);
--==========================================================================================================================	
-- USER SETTINGS
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
		(Type,															Value)
VALUES	('JFD_CID_COMMUNITY_BALANCE_PATCH',								0), --Community Balance Patch (automatically switches on as needed).
		('JFD_CID_COMMUNITY_BALANCE_PATCH_COLONISTS',					1); --CBP Colonists and Pioneers always found Colonies.

UPDATE JFD_GlobalUserSettings
SET Value = 1
WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH'
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
VALUES	('JFD_CID_MISC_BUILD_CHARGES',									1), --Improvements are built ala Civ VI, using limited Worker Charges.
		('JFD_CID_MISC_BUILD_CHARGES_EXCLUDES_REMOVING',				1), --Removing Forest/Marsh/Jungle/Fallout doesn't expend Charges.
		('JFD_CID_MISC_CITY_DISTRICTS',									1), --Organizes Buildings in the City View according to 'Districts.'
		('JFD_CID_MISC_CIV_BUILDING_SOUNDS',							1), --Buildings completed trigger a sound effect.
		('JFD_CID_MISC_IMPROVEMENT_CHANGES_FORT',						1), --Changes to Forts (grants vision, reduces build time).
		('JFD_CID_MISC_RANKINGS_DROPDOWN',								0), --Enables Top Rankings to be viewed from the Dropdown.
		('JFD_CID_MISC_SATELLITES',										1),	--Enables 'Satelliting' of City-States.
		('JFD_CID_MISC_UI_QUEUE',										1), --Production Queue (Vanilla) is open by default.
		('JFD_CID_MISC_UNIT_LEVEL_UP_SOUND',							1); --Units ready for Promotion trigger a sound effect.
--==========================================================================================================================	
-- COLONIES
--==========================================================================================================================	
/*
--Cities founded a certain distance from your Capital or with a Colonist will become Colonies instead. 
--Colonies act not dissimilarly to puppets. However, unlike in a Puppet, you may still purchase Buildings, Tiles, and Units. 
--In addition, Colonies begin with 3 Population, extra Tiles, and a range of Buildings. 

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,															Value)
VALUES	('JFD_CID_COLONIES_CORE',										1),  --Core functionality.
		('JFD_CID_COLONIES_CORE_FORT_COLONIES',							1),  --Enables Fort Colonies to be established by Great Generals.
		('JFD_CID_COLONIES_CORE_MAGISTRATE_PURCHASES',					1),  --Enables Magistrates to be expended in Colonies for Buildings.
		('JFD_CID_COLONIES_BELIEF_ADDITIONS_MISSION_COLONIES',			1),  --New Mission Colonies Reformation Belief; Faith Purchase Civilian Units.
		('JFD_CID_COLONIES_CIVILIZATION_CHANGES_NETHERLANDS',			1),  --Changes to Dutch UA (claims tiles when founding Colonies).
		('JFD_CID_COLONIES_NATIONAL_WONDER_CHANGES_EIC',				1),  --Changes to East India Company; adds National Treasury.
		('JFD_CID_COLONIES_UNIT_ADDITIONS_COLONIST',					1),  --New Colonist unit; founds Colonies which begin with advanced infrastructure.
		('JFD_CID_COLONIES_UNIT_CHANGES_SETTLER',						1),  --Changes Settler to obsolete at Astronomy.
		('JFD_CID_COLONIES_WONDER_ADDITIONS_PENA',						1);  --Adds the Pena National Palace wonder (Culture, Faith, Gold on Colonies).

/*
DISTANCE SETTINGS
-------------
*/
--Distance before a city becomes a Colony.
--To add a custom world size, copy the format below with the name of that world size (Defaults to Standard otherwise).
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,															Value)
VALUES	('JFD_CID_COLONIES_DISTANCE_CORE',								1),  --Core functionality.
		('JFD_CID_COLONIES_DISTANCE_CORE_FORT',							0),  --Allows Forts to establish Fort Colonies if built outside your borders.
		('JFD_CID_COLONIES_DISTANCE_CORE_CITY_RADIUS',					0),  --How many tiles a City must be from another City before it becomes a Colony (0-3 disables).
		('JFD_CID_COLONIES_DISTANCE_CORE_NEW_CAPITAL',					1),  --First Colony is named after your Capital, with the prefix 'New.'
		('JFD_CID_COLONIES_DISTANCE_CORE_NUM_CITIES',					1),  --How many Cities required before a city becomes a Colony.
		('JFD_CID_COLONIES_DISTANCE_WORLDSIZE_HUGE',					20), --Huge Maps.
		('JFD_CID_COLONIES_DISTANCE_WORLDSIZE_LARGE',					15), --Large Maps.
		('JFD_CID_COLONIES_DISTANCE_WORLDSIZE_STANDARD',				14), --Standard Maps.
		('JFD_CID_COLONIES_DISTANCE_WORLDSIZE_SMALL',					12), --Small Maps.
		('JFD_CID_COLONIES_DISTANCE_WORLDSIZE_TINY',					10), --Tiny Maps.
		('JFD_CID_COLONIES_DISTANCE_WORLDSIZE_DUEL',					9);  --Duel Maps.
--==========================================================================================================================	
-- LOYALTY
--==========================================================================================================================	
/*
--Loyalty and Disloyalty are the measurement of a city's compliance to the empire. 

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,														Value)
VALUES	('JFD_CID_LOYALTY_CORE',									1),		--Core Loyalty functionality.
		('JFD_CID_LOYALTY_CORE_AI',									1),		--Core Loyalty functionality for the AI.
		('JFD_CID_LOYALTY_CORE_GLOBAL_MEASURE',						0),		--(With Rise to Power) Adds a Global measure of your Loyalty.
		('JFD_CID_LOYALTY_CORE_FIRST_NOTIFICATION_REVOLT_TURNS',	10),	--Turns before a Notification is send about impending Revolt (first time). 0 to disable.
		('JFD_CID_LOYALTY_CORE_SECOND_NOTIFICATION_REVOLT_TURNS',	5),		--Turns before a Notification is send about impending Revolt (second time). 0 to disable.
		('JFD_CID_LOYALTY_CORE_FIRST_NOTIFICATION_WLTKD_TURNS',		10),	--Turns before a Notification is send about impending WLTKD (first time). 0 to disable.
		('JFD_CID_LOYALTY_CORE_SECOND_NOTIFICATION_WLTKD_TURNS',	5),		--Turns before a Notification is send about impending WLTKD (second time). 0 to disable.
		('JFD_CID_LOYALTY_NATIONAL_WONDER_CHANGES_EIC',				1),		--Changes to the East India Company (reduces Disloyalty from distance).
		('JFD_CID_LOYALTY_POLICY_CHANGES_MILITARY_CASTE',			1),		--Changes to Military Caste (Loyalty from garrisons per Level).
		('JFD_CID_LOYALTY_TECH_ADDITIONS_NATIONALISM',				1),		--Adds Nationalism Tech to the Industrial Era.
		('JFD_CID_LOYALTY_WONDER_ADDITIONS_TRAFALGAR',				1);		--Adds Trafalgar Square (free Great Admiral, Loyalty from naval garrison).
--------------------------------------------------------------------------
/*
CORE LOYALTY SETTINGS
-------------
  3 = All Cities
  2 = Colonies, Puppets, and Occupied Cities
  1 = Only Colonies
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,														Value)
VALUES	('JFD_CID_LOYALTY_CITIES',									3);		--Determines what cities are affected by Loyalty.
--==========================================================================================================================	
-- CRIMES
--==========================================================================================================================	
/*
--Crimes is a revision of the Building Maintenance system. 
--In essence, Buildings now produce either Crime or Maintenance, and Crime, unlike Maintenance, can affect any yield that your city produces. 

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,														Value)
VALUES	('JFD_CID_CRIMES_CORE',										1),		--Core functionality.
		('JFD_CID_CRIMES_CORE_ALT_FONTS',							0),		--Uses alternative icons for Crimes/Organized Crimes by Hypereon.
		('JFD_CID_CRIMES_CORE_ORGANIZED',							1),		--Core functionality (Organized Crime).
		('JFD_CID_CRIMES_BUILDING_CHANGES_BURIAL_TOMB',				1),		--Changes to Burial Tomb (reduces Vandalism).
		('JFD_CID_CRIMES_BUILDING_CHANGES_MUD_PYRAMID',				1),		--Changes to Mud Pyramid Mosque (no Crime).
		('JFD_CID_CRIMES_BUILDING_CHANGES_NATIONAL_WONDERS',		0),		--National Wonders reduce Crime instead of Buildings.
		('JFD_CID_CRIMES_BUILDING_CHANGES_SATRAPS_COURT',			1),		--Changes to Satrap's Court (produces less Crime).
		('JFD_CID_CRIMES_POLICY_ADDITIONS_TENETS',					1),		--Adds Decriminalization, Secret Police, and Workers Council Ideological Tenets (reduces various Crimes).
		('JFD_CID_CRIMES_POLICY_CHANGES_REPUBLIC',					1),		--Changes to Republic (re-named Commonwealth; reduces Theft).
		('JFD_CID_CRIMES_POLICY_CHANGES_SCIENTIFIC_REVOLUTION',		1),		--Changes to Scientific Revolution (reduces Fraud).
		('JFD_CID_CRIMES_RESOLUTION_ADDITIONS_CRIMINAL_COURT',		1),		--Adds the International Criminal Court resolution (increases Organized Crime Threshold).
		('JFD_CID_CRIMES_WONDER_ADDITIONS_TOWER_LONDON',			1),		--Adds the Tower of London (eliminates Treason).
		('JFD_CID_CRIMES_WONDER_CHANGES_PENTAGON',					1),		--Changes the Pentagon (reduces Abduction and Violence).
		('JFD_CID_CRIMES_WONDER_CHANGES_UFFIZI',					1);		--Changes to Uffizi (eliminates Crime from Great Works in the city).
--==========================================================================================================================	
-- DEVELOPMENT
--==========================================================================================================================	
/*
--When a city has more Citizens than Buildings (excluding Wonders), it becomes Overpopulated.
--Overpopulation increases the maluses associated with Crime, Disease, and Unhappiness.
--Overpopulated cities also cannot build Wonders.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,														Value)
VALUES	('JFD_CID_DEVELOPMENT_CORE',								1),		--Core functionality.
		('JFD_CID_DEVELOPMENT_CORE_BUILDING_BONUS',					1),		--High Development boosts Building Production.
		('JFD_CID_DEVELOPMENT_CORE_GROWTH_PENALTY',					1),		--Disables the Growth penalty from Unhappiness.
		('JFD_CID_DEVELOPMENT_CORE_WONDER_PENALTY',					1);		--Low Development penalizes Wonder Production.
--==========================================================================================================================	
-- HAPPINESS
--==========================================================================================================================	
/*
--Happiness is the measurement of a city's attractiveness, and is used to offset Unhappiness, which may lead to Resistance, and to boost Production. 

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,															Value)
VALUES	('JFD_CID_HAPPINESS_CORE',										1),  --Core functionality. 
		('JFD_CID_HAPPINESS_CORE_CITY_BANNER_TURNS',					30), --Turns before impending Resistance shows on the City Banner.
		('JFD_CID_HAPPINESS_CORE_NOTIFICATION_FIRST_RESISTANCE_TURNS',	10), --Turns before a Notification is sent about impending Resistance (first time). 0 to disable.
		('JFD_CID_HAPPINESS_CORE_NOTIFICATION_SECOND_RESISTANCE_TURNS',	5),  --Turns before a Notification is sent about impending Resistance (second time). 0 to disable.
		('JFD_CID_HAPPINESS_BUILDING_CHANGES_PALACE',					1);	 --Changes the Palace (removes Production).
--==========================================================================================================================	
-- HEALTH
--==========================================================================================================================	
/*
--Health is the measurement of a city's viability for habitat, and is used to offset Disease, which may lead to a Plague, and to boost Food. 

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,														Value)
VALUES	('JFD_CID_HEALTH_CORE',										1),		--Core functionality. 
		('JFD_CID_HEALTH_CORE_CITY_BANNER_TURNS',					30),	--Turns before Disease shows on the City Banner.
		('JFD_CID_HEALTH_CORE_FIRST_NOTIFICATION_PLAGUE_TURNS',		10),	--Turns before a Notification is sent about impending Plague (first time).
		('JFD_CID_HEALTH_CORE_SECOND_NOTIFICATION_PLAGUE_TURNS',	5),		--Turns before a Notification is sent about impending Plague (second time).
		('JFD_CID_HEALTH_CORE_PLAGUE_EFFECT',						1),		--Enables the Plague effect (a smaller Fallout cloud) to hover over a plagued city.
		('JFD_CID_HEALTH_CORE_SETTLER_NO_PLAGUES',					1),		--Disables the ability to train Settlers during Plagues.
		('JFD_CID_HEALTH_BELIEF_ADDITIONS_HEALING_VAPORS',			1),		--Adds Healing Vapors as a pantheon belief (Health on Marsh and Flood Plains).
		('JFD_CID_HEALTH_BELIEF_ADDITIONS_GOD_MEDICINE',			1),		--Adds God of Medicine as a pantheon belief (Health on Herbalists).
		('JFD_CID_HEALTH_BELIEF_ADDITIONS_SHAMANISM',				1),		--Adds Shamanism as a follower belief (Doctors yield Health and Faith).
		('JFD_CID_HEALTH_BELIEF_CHANGES_ONE_WITH_NATURE',			1),		--Changes to One With Nature pantheon (Health, Faith on Natural Wonders).
		('JFD_CID_HEALTH_BUILDING_ADDITIONS_CISTERN',				1),		--Adds the Cistern (non-river based Health), and makes the Aqueduct river-dependent.
		('JFD_CID_HEALTH_BUILDING_ADDITIONS_GRAIN_SILO',			1),		--Adds the Grain Silo (Food) to replace the Hospital.
		('JFD_CID_HEALTH_BUILDING_CHANGES_FLOATING_GARDENS',		1),		--Changes Floating Gardens (Health).
		('JFD_CID_HEALTH_BUILDING_CHANGES_LONGHOUSE',				1),		--Changes to Longhouse (Health on Forests).
		('JFD_CID_HEALTH_BUILDING_CHANGES_MONASTERY',				1),		--Changes to Monastery (Health on Wine, Incense (Saffron with ExCE)).
		('JFD_CID_HEALTH_FEATURE_CHANGES_FOUNTAIN_YOUTH',			1),		--Changes to Fountain of Youth (Health, Happiness).
		('JFD_CID_HEALTH_FEATURE_CHANGES_LAKE_VICTORIA',			1),		--Changes to Lake Victoriah (Health, Food).
		('JFD_CID_HEALTH_POLICY_CHANGES_PIETY',						1),		--Changes to Piety Opener (purchase of Great Doctors with Faith).
		('JFD_CID_HEALTH_POLICY_CHANGES_ORGANIZED_RELIGION',		1),		--Changes to Organized Religion (+1 Health and +1 Faith on Shrines and Temples).
		('JFD_CID_HEALTH_POLICY_CHANGES_TRADITION',					1),		--Changes to Tradition Finisher (4 free Aqueducts OR Cisterns).
		('JFD_CID_HEALTH_POLICY_CHANGES_UNIVERSAL_HEALTHCARE',		1),		--Changes to Universal Healthcare (Disease from Population).
		('JFD_CID_HEALTH_TECH_ADDITIONS_MEDICINE',					1),		--Adds Medicine tech to Medieval Era, and moves Theology down.
		('JFD_CID_HEALTH_TECH_CHANGES_ANGKOR_WAT',					1),		--Moves Angkor Wat to Medicine
		('JFD_CID_HEALTH_TECH_CHANGES_GREAT_WALL',					1),		--Moves the Great Wall to Iron Working.
		('JFD_CID_HEALTH_TECH_CHANGES_GARDEN',						1),		--Moves the Garden to Medicine.
		('JFD_CID_HEALTH_UNIT_ADDITIONS_DOCTOR',					1),		--Adds the Great Doctor (does not preclude the Doctor specialist if disabled).
		('JFD_CID_HEALTH_WONDER_ADDITIONS_PONT_DU_GARD',			1),		--Adds the Pont du Gard wonder (more Food from Excess Health, free Aqueduct).
		('JFD_CID_HEALTH_WONDER_CHANGES_ALHAMBRA',					1),		--Changes to Alhmabra (Health, Great Doctor points).
		('JFD_CID_HEALTH_WONDER_CHANGES_ANGKOR_WAT',				1),		--Changes to Angkor Wat (Health, Great Doctor Points).
		('JFD_CID_HEALTH_WONDER_CHANGES_CHICHEN_ITZA',				1),		--Changes to Chichen Itza (Health).
		('JFD_CID_HEALTH_WONDER_CHANGES_GREAT_WALL',				1),		--Changes to Great Wall (Walls in all cities).
		('JFD_CID_HEALTH_WONDER_CHANGES_HANGING_GARDENS',			1),		--Changes to Hanging Gardens (Health, Great Doctor points, free Garden, Health on all Gardens).
		('JFD_CID_HEALTH_WONDER_CHANGES_TEMPLE_ARTEMIS',			1);		--Changes to Temple of Artemis (Health, Great Doctor Points).
--==========================================================================================================================	
-- INVESTMENTS
--==========================================================================================================================	
/*
--Investments are a replacement for 'rush-buying' Buildings and (TBD) mechanized Units with Gold. 
--When you spend Gold on a Building, it now reduces its Production cost instead of outright completing it.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,														Value)
VALUES	('JFD_CID_INVESTMENTS_CORE',								1),		--Core functionality. 
		('JFD_CID_INVESTMENTS_CORE_UI',								1),		--New Investment Button in Production Queue (non-EUI only).
		('JFD_CID_INVESTMENTS_POLICY_CHANGES_MERCANTILISM',			1),		--Changes to Mercantilism (Investments 15% more powerful).
		('JFD_CID_INVESTMENTS_WONDER_CHANGES_EIC',					1);		--Changes East India Company (overrides Colonies changes).
--==========================================================================================================================	
-- POWER
--==========================================================================================================================	
/*
--Power is a new Strategic Resource required and produced by certain Buildings. 
--Most late-game Buildings that do not produce Power will now require it. In addition, the Workshop requires Power.

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,														Value)
VALUES	('JFD_CID_POWER_CORE',										1),		--Core functionality.
		('JFD_CID_POWER_CORE_PRE_INDUSTRIAL',						1),		--Pre-Industrial Buildings (Workshop, Windmill, Watermill) interact with Power.
		('JFD_CID_POWER_BUILDING_ADDITIONS_BLAST_FURNACE',			1),		--Adds the Blast Furnace (Iron for Engineer Specialists).
		('JFD_CID_POWER_BUILDING_ADDITIONS_COAL_PLANT',				1),		--Adds the Coal Plant (consumes Coal for Power).
		('JFD_CID_POWER_BUILDING_ADDITIONS_HORSE_MILL',				1),		--Adds the Horse Mill (consumes Horses for Power).
		('JFD_CID_POWER_BUILDING_ADDITIONS_OIL_REFINERY',			1),		--Adds the Blast Furnace (consumes Oil for Power).
		('JFD_CID_POWER_BUILDING_ADDITIONS_WIND_FARM',				1),		--Adds the Wind Farm (Aluminum for Power).
		('JFD_CID_POWER_TECH_CHANGES_BIG_BEN',						1),		--Moves Big Ben to Rifling.
		('JFD_CID_POWER_UNIT_CHANGES_GATLING_GUN',					1),		--Moves the Gatling Gun to Rifling.
		('JFD_CID_POWER_WONDER_ADDITIONS_THREE_GORGES',				1);		--Adds Three Gorges Dam wonder (extra Power, free Hydro Plant).
--==========================================================================================================================	
-- PROVINCES
--==========================================================================================================================	
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
		(Type,														Value)
VALUES	('JFD_CID_PROVINCES_CORE',									1),		--Core functionality. 
		('JFD_CID_PROVINCES_CORE_BOMBARD_RANGE',					1),		--Changes City Bombard Range to upgrade with Provinces; Gunpowder unlocks Indirect Fire.
		('JFD_CID_PROVINCES_CORE_LEVIES',							1),		--Enables Population spending Units; Provinces spawn Units when war is declared against you.
		('JFD_CID_PROVINCES_CORE_LEVIES_AI',						1),		--Enables AI to receive additional Levies.
		('JFD_CID_PROVINCES_BELIEF_CHANGES_RELIGIOUS_SETTLEMENTS',	1),		--Changes to Religious Settlements pantheon belief (+1 Faith on TPs, Villages, and Towns).
		('JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_FORT',				1),		--New Improvement Upgrades: Fort > Citadel.
		('JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST',		1),		--New Improvement Upgrades: Trading Post > Village > Town.
		('JFD_CID_PROVINCES_POLICY_CHANGES_MOBILIZATION',			1),		--Changes to Mobilization (+1 Levy when conscripted).
		('JFD_CID_PROVINCES_TECH_CHANGES_OPEN_BORDERS',				1);		--Moves Open Borders to Guilds.
--==========================================================================================================================	
-- SLAVERY
--==========================================================================================================================	
/*
--Slavery is an alternative means of purchasing Units, 
--done so by expending the new Shackles resource, accumulated through conquest, trade, and clearing Barbarian Encampments. 

CORE SETTINGS
-------------
  1 = Enabled (Default)
  0 = Disabled 
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,														Value)
VALUES	('JFD_CID_SLAVERY_CORE',									1),		--Core functionality. 
		('JFD_CID_SLAVERY_CORE_ENSLAVEMENT',						1),		--Allows Enslavement of Cities for Shackles. Annexing no longer causes Resistance.
		('JFD_CID_SLAVERY_BELIEF_CHANGES_GOD_WAR',					1),		--Changes to God of War pantheon belief (boost num Shackles from clearing Barb. Encampments and Capturing Civilians).
		('JFD_CID_SLAVERY_NO_GOLD_PURCHASING',						1),		--Removes rush-buying of non-Mechanized Military Units with Gold. 
		('JFD_CID_SLAVERY_POLICY_CHANGES_CITIZENSHIP',				1),		--Changes to Citizenship (updates help text to reflect Worker/Peasant split).
		('JFD_CID_SLAVERY_RESOLUTION_ADDITIONS_HUMAN_RIGHTS',		1),		--Adds Declaration of Human Rights World Project (disables Shackles, gives Happiness).
		('JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER',				1),		--Adds the Slave Worker, and splits the Worker into the Peasant and the Worker. 
		('JFD_CID_SLAVERY_WONDER_ADDITIONS_STONE_TOWN',				1),		--Adds Stone Town wonder (increases Shackles from Trade Routes).
		('JFD_CID_SLAVERY_WONDER_CHANGES_PYRAMIDS',					1);		--Changes to Pyramids (updates help text to reflect Worker/Peasant split).
--==========================================================================================================================	
-- DO NOT MODIFY 
--==========================================================================================================================
--JFD_GlobalUserSettings
--------------------------
--Colonies
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_COLONIES_WONDER_ADDITIONS_PENA', 'JFD_CID_COLONIES_NATIONAL_WONDER_CHANGES_EIC', 'JFD_CID_COLONIES_RESOLUTION', 'JFD_CID_COLONIES_CORE_CITADEL', 'JFD_CID_COLONIES_CORE_FORT', 'JFD_CID_COLONIES_BELIEF_ADDITIONS_MISSION_COLONIES', 'JFD_CID_COLONIES_UNIT_ADDITIONS_COLONIST')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 0);

UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_COLONIES_BELIEF_ADDITIONS_MISSION_COLONIES')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_UNIT_ADDITIONS_COLONIST' AND Value = 0);

--Loyalty
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_LOYALTY_WONDER_ADDITIONS_TRAFALGAR', 'JFD_CID_LOYALTY_NATIONAL_WONDER_CHANGES_EIC', 'JFD_CID_COLONIES_WONDER_ADDITIONS_PENA', 'JFD_CID_LOYALTY_CORE_AI', 'JFD_CID_LOYALTY_POLICY_CHANGES_MILITARY_CASTE', 'JFD_CID_COLONIES_WONDER_ADDITIONS_PENA')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 0);

--Crimes
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_DEVELOPMENT_CORE', 'JFD_CID_CRIMES_POLICY_ADDITIONS_TENETS', 'JFD_CID_CRIMES_BUILDING_CHANGES_NATIONAL_WONDERS', 'JFD_CID_CRIMES_CORE_ORGANIZED', 'JFD_CID_CRIMES_BUILDING_CHANGES_BURIAL_TOMB', 'JFD_CID_CRIMES_BUILDING_CHANGES_MUD_PYRAMID', 'JFD_CID_CRIMES_WONDER_CHANGES_PENTAGON', 'JFD_CID_CRIMES_BUILDING_CHANGES_SATRAPS_COURT', 'JFD_CID_CRIMES_WONDER_ADDITIONS_TOWER_LONDON', 'JFD_CID_CRIMES_CIVILIZATION_CHANGES_INDIA')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 0);

UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_CRIMES_RESOLUTION_ADDITIONS_CRIMINAL_COURT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 0);

--Development
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_DEVELOPMENT_CORE_WONDER_PENALTY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 0);

--Investments
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_COLONIES_CORE_MAGISTRATE_PURCHASES', 'JFD_CID_INVESTMENTS_CORE_UI', 'JFD_CID_INVESTMENTS_POLICY_CHANGES_MERCANTILISM')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 0);

--Happiness
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_HAPPINESS_CORE_CITY_BANNER_TURNS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HAPPINESS_CORE' AND Value = 0);

--Health
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_CRIMES_CORE_ORGANIZED', 'JFD_CID_HEALTH_UNIT_ADDITIONS_DOCTOR', 'JFD_CID_HEALTH_CORE_PLAGUE_EFFECT', 'JFD_CID_DEVELOPMENT_CORE', 'JFD_CID_HEALTH_BUILDING_ADDITIONS_CISTERN', 'JFD_CID_HEALTH_CITY_BANNER_TURNS', 'JFD_CID_HEALTH_BUILDING_CHANGES_MONASTERY', 'JFD_CID_HEALTH_BUILDING_ADDITIONS_GRAIN_SILO', 'JFD_CID_HEALTH_BELIEF_ADDITIONS_GOD_MEDICINE', 'JFD_CID_HEALTH_BELIEF_ADDITIONS_SHAMANISM', 'JFD_CID_HEALTH_BELIEF_CHANGES_ONE_WITH_NATURE', 'JFD_CID_HEALTH_BUILDING_CHANGES_FLOATING_GARDENS', 'JFD_CID_HEALTH_BUILDING_CHANGES_LONGHOUSE', 'JFD_CID_HEALTH_FEATURE_CHANGES_FOUNTAIN_YOUTH', 'JFD_CID_HEALTH_WONDER_ADDITIONS_PONT_DU_GARD', 'JFD_CID_HEALTH_POLICY_CHANGES', 'JFD_CID_HEALTH_UNIT_ADDITIONS_DOCTOR', 'JFD_CID_HEALTH_WONDER_CHANGES_HANGING_GARDENS', 'JFD_CID_HEALTH_WONDER_CHANGES_CHICHEN_ITZA', 'JFD_CID_HEALTH_TECH_ADDITIONS_MEDICINE', 'JFD_CID_HEALTH_WONDER_CHANGES_ANGKOR_WAT', 'JFD_CID_HEALTH_WONDER_CHANGES_ALHAMBRA')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 0);

UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_HEALTH_TECH_CHANGES_ANGKOR_WAT', 'JFD_CID_HEALTH_TECH_CHANGES_GARDEN')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_TECH_ADDITIONS_MEDICINE' AND Value = 0);

--Misc
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_MISC_BUILD_CHARGES_EXCLUDES_REMOVING')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 0);

--Power
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_POWER_BUILDING_ADDITIONS_COAL_PLANT', 'JFD_CID_POWER_BUILDING_ADDITIONS_OIL_REFINERY', 'JFD_CID_POWER_CORE_PRE_INDUSTRIAL', 'JFD_CID_POWER_WONDER_ADDITIONS_THREE_GORGES', 'JFD_CID_POWER_BUILDING_ADDITIONS_WIND_FARM')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_POWER_CORE' AND Value = 0);

--Provinces
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST', 'JFD_CID_PROVINCES_CORE_BOMBARD_RANGE', 'JFD_CID_PROVINCES_CORE_LEVIES')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 0);

UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_PROVINCES_TECH_CHANGES_OPEN_BORDERS', 'JFD_CID_PROVINCES_POLICY_CHANGES_MOBILIZATION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE_LEVIES' AND Value = 0);

--Slavery
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_SLAVERY_CORE_ENSLAVEMENT', 'JFD_CID_SLAVERY_NO_GOLD_PURCHASING', 'JFD_CID_SLAVERY_BELIEF_CHANGES_GOD_WAR', 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 0);

UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 0);

UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_SLAVERY_POLICY_CHANGES_CITIZENSHIP')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 0);

UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_SLAVERY_WONDER_CHANGES_PYRAMIDS')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 0);

--CBP
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_HEALTH_BUILDING_ADDITIONS_CISTERN', 'JFD_CID_LOYALTY_TECH_ADDITIONS_NATIONALISM', 'JFD_CID_HEALTH_POLICY_CHANGES_TRADITION', 'JFD_CID_INVESTMENTS_POLICY_CHANGES_MERCANTILISM', 'JFD_CID_INVESTMENTS_CORE', 'JFD_CID_POWER_BUILDING_ADDITIONS_OIL_REFINERY', 'JFD_CID_POWER_BUILDING_ADDITIONS_WIND_FARM', 'JFD_CID_HEALTH_BUILDING_ADDITIONS_GRAIN_SILO', 'JFD_CID_HEALTH_BUILDING_CHANGES_MONASTERY', 'JFD_CID_COLONIES_UNIT_CHANGES_SETTLER', 'JFD_CID_HEALTH_TECH_CHANGES_ANGKOR_WAT', 'JFD_CID_HEALTH_TECH_CHANGES_GARDEN', 'JFD_CID_HEALTH_TECH_ADDITIONS_MEDICINE', 'JFD_CID_HEALTH_POLICY_CHANGES_UNIVERSAL_HEALTHCARE', 'JFD_CID_HEALTH_POLICY_CHANGES_PIETY', 'JFD_CID_HAPPINESS_CORE', 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST', 'JFD_CID_HEALTH_BELIEF_CHANGES_ONE_WITH_NATURE', 'JFD_CID_HEALTH_BELIEF_ADDITIONS_SHAMANISM', 'JFD_CID_HEALTH_BELIEF_ADDITIONS_GOD_MEDICINE', 'JFD_CID_CRIMES_BUILDING_CHANGES_BURIAL_TOMB', 'JFD_CID_CRIMES_BUILDING_CHANGES_MUD_PYRAMID', 'JFD_CID_CRIMES_BUILDING_CHANGES_SATRAPS_COURT', 'JFD_CID_CRIMES_CIVILIZATION_CHANGES_INDIA', 'JFD_CID_LOYALTY_POLICY_CHANGES_MILITARY_CASTE', 'JFD_CID_COLONIES_BELIEF_ADDITIONS_MISSION_COLONIES', 'JFD_CID_COLONIES_UNIT_ADDITIONS_COLONIST', 'JFD_CID_HEALTH_BELIEF_ADDITIONS_HEALING_VAPORS', 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COMMUNITY_BALANCE_PATCH' AND Value = 1);

--E&B
UPDATE JFD_GlobalUserSettings
SET Value = 0 
WHERE Type IN ('JFD_CID_COLONIES_CORE_MAGISTRATE_PURCHASES')
AND NOT EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');

--PIT
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type IN ('JFD_CID_HEALTH_TECH_ADDITIONS_MEDICINE', 'JFD_CID_LOYALTY_TECH_ADDITIONS_NATIONALISM')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_CORE' AND Value = 1);
--==========================================================================================================================	
--==========================================================================================================================	