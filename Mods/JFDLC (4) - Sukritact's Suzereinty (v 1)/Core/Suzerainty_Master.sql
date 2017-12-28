--==========================================================================================================================
-- WHOWARD/GAZEBO's DLL
--==========================================================================================================================
-- CustomModOptions
------------------------------------------------------------
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_MINORS', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_UNIT_CREATED', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('BALANCE_CORE_POLICIES', 1); 
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('BUGFIX_DUMMY_POLICIES', 1); 
--==========================================================================================================================
-- SUZERAINTY UI ADDINS
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS 
	SuzerainUI_AddinSupport (
	FileName													text														default NULL);
--==========================================================================================================================
-- CS DIALOGUE
--==========================================================================================================================
-- Suk_MinorDialogue
-- The following MessageTypes are the defaults, you are free to create your own however:
--
-- MESSAGE_FIRST_GREETING
-- MESSAGE_GREETING
-- MESSAGE_BULLIED_GOLD
-- MESSAGE_BULLIED_UNIT
-- MESSAGE_GOLD_GIFT
-- MESSAGE_AT_WAR
-- MESSAGE_AT_WAR_WARMONGER
-- MESSAGE_MAKE_PEACE
-- MESSAGE_PLEDGE_PROTECTION
-- MESSAGE_REVOKE_PROTECTION
--
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Suk_MinorDialogue (
	MessageType  												text														default NULL,
	Message  													text 														default NULL,	
	MinorCivType  												text 		REFERENCES MinorCivilizations(Type) 			default NULL,
	MinorCivTrait												text		REFERENCES MinorCivTraits(Type)					default NULL,
	MinorCivPersonality											text 		 												default NULL,
	IsFriends													boolean 		 											default NULL,
	IsAllied													boolean 		 											default NULL,
	IsProtected													boolean 		 											default NULL,
	IsFirstToMeet												boolean 		 											default NULL,
	Bias														integer														default 1);
--==========================================================================================================================
-- SUZERAIN TRAITS
--==========================================================================================================================
-- Suk_SuzerainTraits
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Suk_SuzerainTraits (
	ID  														integer 													primary key autoincrement,
	Type  														text 		UNIQUE											default NULL,	
	MinorCivType  												text 		REFERENCES MinorCivilizations(Type) 			default NULL,
	Description													text														default NULL,
	IconAtlas													text 		REFERENCES IconTextureAtlases(Atlas) 			default NULL,
	PortraitIndex												integer														default NULL,
	BackgroundImage												text														default NULL);
--------------------------------------------------------------------------------------------------------------------------	
-- Suk_SuzerainTrait_FreePolicies
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Suk_SuzerainTrait_FreePolicies (
	SuzerainTraitType  											text 		REFERENCES Suk_SuzerainTraits(Type) 			default NULL,
	PolicyType  												text 		REFERENCES Policies(Type) 						default NULL);
--------------------------------------------------------------------------------------------------------------------------	
-- Suk_SuzerainTrait_FreeBuildings
-- Warning: This ignores building requirements.
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Suk_SuzerainTrait_FreeBuildings (
	SuzerainTraitType  											text 		REFERENCES Suk_SuzerainTraits(Type) 			default NULL,
	BuildingType  												text 		REFERENCES Buildings(Type) 						default NULL);
--------------------------------------------------------------------------------------------------------------------------	
-- Suk_SuzerainTrait_FreePromotions
-- All promotions added to this table MUST be CS exclusive
-- They will be removed from ALL units when an alliance is lost regardless of whether the unit had the promotion before being allied.

-- This table will only check if unit is the correct CombatType under UnitPromotions_UnitCombats
-- or if the unit is the correct Type under UnitPromotions_CivilianUnitType
-- All other requirements and prohibitions are ignored
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Suk_SuzerainTrait_FreePromotions (
	SuzerainTraitType  											text 		REFERENCES Suk_SuzerainTraits(Type) 			default NULL,
	PromotionType  												text 		REFERENCES UnitPromotions(Type) 				default NULL);	
--==========================================================================================================================
--==========================================================================================================================