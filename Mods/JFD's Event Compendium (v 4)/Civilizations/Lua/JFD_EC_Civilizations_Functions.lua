-- JFD_EC_Civilizations_Functions
-- Author: JFD
-- DateCreated: 4/2/2016 8:12:11 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local convertTextKey = Locale.ConvertTextKey
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
-- CIVILIZATIONS: EVENTS
--------------------------------------------------------------------------------------------------------------------------
--JFD_Civilizations_CityEventChoice
local eventChoiceBhutanMonk1ID = GameInfoTypes["CITY_EVENT_JFD_BHUTAN_MONK_CHOICE_1"]
local unitMonkID = GameInfoTypes["UNIT_DECISIONS_JFD_BHUTAN_MONK"]
function JFD_Civilizations_CityEventChoice(playerID, cityID, eventChoiceID)
	local player = Players[playerID]
	local city = player:GetCityByID(cityID)
	if eventChoiceID == eventChoiceBhutanMonk1ID then
		player:InitUnit(unitMonkID, city:GetX(), city:GetY())
	end
end
--GameEvents.CityEventChoiceActivated.Add(JFD_Civilizations_CityEventChoice)
--=======================================================================================================================
--=======================================================================================================================