--==========================================================================================================================
-- WHOWARD's DLL
--==========================================================================================================================
-- CustomModOptions
------------------------------------------------------------
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('BALANCE_CORE_EVENTS', 1);
--==========================================================================================================================
-- EVENTS
--==========================================================================================================================
-- Events
--------------------------------------------------------------------------------------------------------------------------
ALTER TABLE Events			  ADD IsCityState				boolean										default 0;
ALTER TABLE Events			  ADD IsProvince				boolean										default 0;
ALTER TABLE Events			  ADD RequiresActiveResearch	boolean										default 0;
ALTER TABLE Events			  ADD RequiredCulture			text										default NULL;
ALTER TABLE Events			  ADD RequiresLevies			boolean										default 0;
ALTER TABLE Events			  ADD RequiredPietyLevel		text										default NULL;
ALTER TABLE Events			  ADD RequiresSlaves			boolean										default 0;
ALTER TABLE Events			  ADD RequiresTribe				boolean										default 0;
--------------------------------------------------------------------------------------------------------------------------
-- EventChoices
--------------------------------------------------------------------------------------------------------------------------
ALTER TABLE EventChoices	  ADD CityStateInfluence		integer  									default 0;
ALTER TABLE EventChoices	  ADD EventEpithet				text										default NULL;
ALTER TABLE EventChoices	  ADD GarrisonDamage			integer  									default 0;
ALTER TABLE EventChoices	  ADD GarrisonXP				integer  									default 0;
ALTER TABLE EventChoices	  ADD IsBenefitsCapital			boolean										default 0;
ALTER TABLE EventChoices	  ADD IsCityState				boolean										default 0;
ALTER TABLE EventChoices	  ADD IsProvince				boolean										default 0;
ALTER TABLE EventChoices	  ADD LeviesDamage				integer  									default 0;
ALTER TABLE EventChoices	  ADD LeviesXP					integer  									default 0;
ALTER TABLE EventChoices	  ADD PietyYield				integer  									default 0;
ALTER TABLE EventChoices      ADD ResistanceCounter			integer  									default 0;
ALTER TABLE EventChoices      ADD ResetResistanceCounter	boolean										default 0;
ALTER TABLE EventChoices	  ADD RevoltCounter				integer  									default 0;
ALTER TABLE EventChoices	  ADD ResetRevoltCounter		boolean										default 0;
ALTER TABLE EventChoices	  ADD WLTKDCounter				integer  									default 0;
ALTER TABLE EventChoices	  ADD ResetWLTKDCounter			boolean										default 0;
ALTER TABLE EventChoices	  ADD UnitDamage				integer  									default 0;
ALTER TABLE EventChoices	  ADD UnitXP					integer  									default 0;
--------------------------------------------------------------------------------------------------------------------------
-- EventChoice_FreeGreatWorks
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
EventChoice_FreeGreatWorks (
    EventChoiceType											text    REFERENCES EventChoices(Type)		default NULL,
	GreatWorkSlot											text	REFERENCES GreatWorkSlots(Type)		default NULL,
    UnitType												text	REFERENCES Units(Type)				default NULL);
--------------------------------------------------------------------------------------------------------------------------
-- EventChoice_WorldEvents
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
EventChoice_WorldEvents (
    EventChoiceType											text    REFERENCES EventChoices(Type)		default NULL,
    Description												text										default NULL,
	IsCityState												boolean										default 0);
--------------------------------------------------------------------------------------------------------------------------
-- CityEvents
--------------------------------------------------------------------------------------------------------------------------
ALTER TABLE CityEvents		  ADD IsCityState				boolean										default 0;
ALTER TABLE CityEvents		  ADD IsProvince				boolean										default 0;
ALTER TABLE CityEvents		  ADD RequiresActiveResearch	boolean										default 0;
ALTER TABLE CityEvents		  ADD RequiredCulture			text										default NULL;
ALTER TABLE CityEvents		  ADD RequiredPietyLevel		text										default NULL;
ALTER TABLE CityEvents		  ADD RequiresTribe				boolean										default 0;
--------------------------------------------------------------------------------------------------------------------------
-- CityEventChoices
--------------------------------------------------------------------------------------------------------------------------
ALTER TABLE CityEventChoices  ADD EventEpithet				text										default NULL;
ALTER TABLE CityEventChoices  ADD GarrisonDamage			integer  									default 0;
ALTER TABLE CityEventChoices  ADD GarrisonXP				integer  									default 0;
ALTER TABLE CityEventChoices  ADD IsBenefitsCapital			boolean										default 0;
ALTER TABLE CityEventChoices  ADD IsCityState				boolean										default 0;
ALTER TABLE CityEventChoices  ADD IsProvince				boolean										default 0;
ALTER TABLE CityEventChoices  ADD PlagueCounter				integer  									default 0;
ALTER TABLE CityEventChoices  ADD PlagueTurns				integer  									default 0;
ALTER TABLE CityEventChoices  ADD PietyYield				integer  									default 0;
ALTER TABLE CityEventChoices  ADD ResetPlagueCounter		boolean										default 0;
ALTER TABLE CityEventChoices  ADD ResistanceCounter			integer  									default 0;
ALTER TABLE CityEventChoices  ADD ResetResistanceCounter	boolean										default 0;
ALTER TABLE CityEventChoices  ADD RevoltCounter				integer  									default 0;
ALTER TABLE CityEventChoices  ADD ResetRevoltCounter		boolean										default 0;
ALTER TABLE CityEventChoices  ADD WLTKDCounter				integer  									default 0;
ALTER TABLE CityEventChoices  ADD ResetWLTKDCounter			boolean										default 0;
ALTER TABLE CityEventChoices  ADD WLTKDTurnsAllCities		integer										default 0;
--------------------------------------------------------------------------------------------------------------------------
-- CityEventChoice_WorldEvents
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
CityEventChoice_WorldEvents (
    CityEventChoiceType										text    REFERENCES CityEventChoices(Type)	default NULL,
    Description												text										default NULL);
--==========================================================================================================================
--==========================================================================================================================