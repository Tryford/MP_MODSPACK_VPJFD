-- JFD_EC_Civilizations_Functions
-- Author: JFD
-- DateCreated: 4/2/2016 8:12:11 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_ECUtils.lua")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local convertTextKey  = Locale.ConvertTextKey
local playerBarbarian = Players[63]
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
-- CIVILIZATIONS: EVENTS
--------------------------------------------------------------------------------------------------------------------------
--JFD_Civilizations_CityEventChoice
local eventChoiceDeseretWagonTrains1ID = GameInfoTypes["CITY_EVENT_JFD_DESERET_WAGON_TRAINS_CHOICE_1"]
function JFD_Civilizations_CityEventChoice(playerID, cityID, eventChoiceID)
	local player = Players[playerID]
	local city = player:GetCityByID(cityID)
	--Deseret
	if eventChoiceID == eventChoiceDeseretWagonTrains1ID then
		if JFD_GetRandom(1,10) <= 5 then
			city:ChangePopulation(1)
			JFD_SendNotification(playerID, "NOTIFICATION_EVENT_CHOICE_CITY_FIN", Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_CITY_EVENT_JFD_DESERET_WAGON_TRAINS_CHOICE_1", city:GetName()), Locale.ConvertTextKey("TXT_KEY_CITY_EVENT_JFD_DESERET_WAGON_TRAINS_DESCRIPTION"))
		else
			local unitID = GetStrongestMilitaryUnit(playerID, true, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")
			playerBarbarian:InitUnit(unitID, city:GetX(), city:GetY()+1)
			playerBarbarian:InitUnit(unitID, city:GetX()+1, city:GetY())
			JFD_SendNotification(playerID, "NOTIFICATION_EVENT_CHOICE_CITY_FIN", Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_CITY_EVENT_JFD_DESERET_WAGON_TRAINS_CHOICE_1_ALT", city:GetName()), Locale.ConvertTextKey("TXT_KEY_CITY_EVENT_JFD_DESERET_WAGON_TRAINS_DESCRIPTION"))
		end		
	end
end
GameEvents.CityEventChoiceActivated.Add(JFD_Civilizations_CityEventChoice)
--=======================================================================================================================
--=======================================================================================================================