-- JFD_EC_Misc_Functions
-- Author: JFD
-- DateCreated: 4/2/2016 8:12:11 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_ECUtils.lua");
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local convertTextKey = Locale.ConvertTextKey
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
-- TEXT
-------------
--JFD_CID_Misc_EventStrings
function JFD_CID_Misc_EventStrings(playerID, cityID, event, tOverrideStrings)
	if event.Type == "CITY_EVENT_JFD_MISC_EIFFEL_TOWER" then
		local player = Players[playerID]
		local city = player:GetCityByID(cityID)
		local help = Locale.ConvertTextKey("TXT_KEY_CITY_EVENT_JFD_MISC_EIFFEL_TOWER_HELP", city:GetName(), player:GetCivilizationAdjective())
		table.insert(tOverrideStrings, {Description = nil, Help = help})
	end
end
LuaEvents.Event_OverrideTextStrings.Add(JFD_CID_Misc_EventStrings)
--=======================================================================================================================
--=======================================================================================================================