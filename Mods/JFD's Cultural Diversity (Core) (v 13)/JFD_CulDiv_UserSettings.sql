--==========================================================================================================================	
-- USER SETTINGS
--==========================================================================================================================	
--Modular Features that can be toggled on and off and then back on.
--------------------------------------------------------------------------
/*
GENERAL SETTINGS
--1 = Enabled (Default)
--0 = Disabled 
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,												Value)
VALUES	('JFD_CULDIV_CORE_STARTING_BONUSES',				1), --Enables unique starting bonuses for each Culture.
		('JFD_CULDIV_ARCHITECTURE_CHANGES',					1), --Enables Cities to retain their artstyle upon Capture.
		('JFD_CULDIV_ARCHITECTURE_CHANGES_BRAZIL',			1), --Change City Artstyle from South American to Graeco-Roman.
		('JFD_CULDIV_ARCHITECTURE_CHANGES_HUNS',			1), --Change City Artstyle from Asian to European.
		('JFD_CULDIV_ARCHITECTURE_CHANGES_INDIA',			1), --Change City Artstyle from Asian to Mid-East.
		('JFD_CULDIV_ARCHITECTURE_CHANGES_OTTOMANS',		1), --Change City Artstyle from Mid-East to Graeco-Roman.
		('JFD_CULDIV_ARCHITECTURE_CHANGES_PORTUGAL_SPAIN',	1), --Change City Artstyle from European to Graeco-Roman.
		('JFD_CULDIV_ARCHITECTURE_CHANGES_ZULU',			1), --Change City Artstyle from Mid-East to South American.
		('JFD_CULDIV_EMBARKATION_CHANGES',					1), --Enables culture-specific embarkation graphics.
		('JFD_CULDIV_MYTHICAL_EVENT',						1), --Enables a 'Mythical Creature' Event with Sukritact's E&D.
		('JFD_CULDIV_SOUNDTRACK_ADDON',						0);	--Disable this if you're not using the Soundtrack Addon - this will ensure vanilla tracks are preserved.
--------------------------------------------------------------------------
/*
UNIT DIALOGUE SETTINGS
--1 = Enabled (Default)
--0 = Disabled 
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,												Value)
VALUES	('JFD_CULDIV_CORE_UNIT_DIALOGUE',					1), --Enables Units to speak when selected/ordered.
		('JFD_CULDIV_CORE_UNIT_DIALOGUE_USE_DEFAULT',		1), --Enables Cultures to use a Default soundset where support is not present.
		('JFD_CULDIV_CORE_UNIT_DIALOGUE_NOT_MECHANICAL',	1), --Disables dialogue for Mechanized Units (Tanks, Ships, Planes, etc.)
		('JFD_CULDIV_CORE_UNIT_DIALOGUE_ACTION_CHANCE',		20),--Chance to fire on unit action (e.g. Garrison, Build).
		('JFD_CULDIV_CORE_UNIT_DIALOGUE_MOVE_CHANCE',		20),--Chance to fire on unit movement (only first).
		('JFD_CULDIV_CORE_UNIT_DIALOGUE_SELECTION_CHANCE',	20);--Chance to fire on unit selection.
--==========================================================================================================================	
--==========================================================================================================================	