-- JFD_EC_CID_Functions
-- Author: JFD
-- DateCreated: 4/2/2016 8:12:11 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_ECUtils.lua")
include("JFD_CulDivUtilities.lua")
--=======================================================================================================================
-- MOD USE
--=======================================================================================================================
local isUsingCulDiv = JFD_IsUsingCulDiv()
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local convertTextKey = Locale.ConvertTextKey
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
-- CULDIV: EVENTS
--------------------------------------------------------------------------------------------------------------------------
--JFD_CulDiv_CityEventCanTake
function JFD_CulDiv_CityEventCanTake(playerID, cityID, eventID)
	local player = Players[playerID]
	local event = GameInfo.CityEvents[eventID]
	if event.RequiredCulture then
		if JFD_GetCultureID(playerID) ~= GameInfoTypes[event.RequiredCulture] then
			return false
		end
	end
	return true
end
if isUsingCulDiv then
	GameEvents.CityEventCanTake.Add(JFD_CulDiv_CityEventCanTake)
end

--JFD_CulDiv_EventCanTake
function JFD_CulDiv_EventCanTake(playerID, eventID)
	local player = Players[playerID]
	local event = GameInfo.Events[eventID]
	if event.RequiredCulture then
		if JFD_GetCultureID(playerID) ~= GameInfoTypes[event.RequiredCulture] then
			return false
		end
	end
	return true
end
if isUsingCulDiv then
	GameEvents.EventCanTake.Add(JFD_CulDiv_EventCanTake)
end
--------------------------------------------------------------------------------------------------------------------------
-- CULDIV: SHARED EVENTS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_CulDiv_Shared_EventOverride
local chosenMyth = nil
function JFD_CulDiv_Shared_EventOverride(playerID, cityID, event, tEventOverrideStrings)
	local player = Players[playerID]
	local city = player:GetCityByID(cityID)
	if event.Type == "CITY_EVENT_JFD_CULDIV_MYTHIC_BEAST" then
		local mythicBeasts = {}
		local count = 1
		local cultureID = JFD_GetCultureID(playerID)
		for row in GameInfo.JFD_CultureType_MythicEvents("CultureType = '" .. GameInfo.JFD_CultureTypes[cultureID].Type .. "'") do
			mythicBeasts[count] = row.Description
			count = count + 1
		end	
		chosenMyth = mythicBeasts[JFD_GetRandom(1,#mythicBeasts)]
		local help = Locale.ConvertTextKey(chosenMyth .. "_DESC", city:GetName())
		table.insert(tEventOverrideStrings, {Description = nil, Help = help})
	end
end
if isUsingCulDiv then
	LuaEvents.Event_OverrideTextStrings.Add(JFD_CulDiv_Shared_EventOverride)
end

-- JFD_CulDiv_Shared_EventChoiceOverride
function JFD_CulDiv_Shared_EventChoiceOverride(playerID, cityID, event, tChoiceOverrideStrings)
	local player = Players[playerID]
	if event.Type == "CITY_EVENT_JFD_CULDIV_MYTHIC_BEAST_CHOICE_1" then
		local description = Locale.ConvertTextKey(chosenMyth .. "_BUTTON", city:GetName())
		table.insert(tChoiceOverrideStrings, {Description = description, Help = nil})
	end
end
if isUsingCulDiv then
	LuaEvents.EventChoice_OverrideTextStrings.Add(JFD_CulDiv_Shared_EventChoiceOverride)
end
--------------------------------------------------------------------------------------------------------------------------
-- CULDIV: CLASSICAL EVENTS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_CulDiv_Classical
function JFD_CulDiv_Classical(playerID, cityID, event, tEventOverrideStrings)
	local player = Players[playerID]
	if event.Type == "CITY_EVENT_JFD_CULDIV_CLASSICAL_PHILOSOPHY" then
		local help = Locale.ConvertTextKey("TXT_KEY_CITY_EVENT_JFD_CULDIV_CLASSICAL_PHILOSOPHY_HELP", "TXT_KEY_CITY_EVENT_JFD_CULVDIV_CLASSICAL_PHILOSOPHY_DEBATE_" .. JFD_GetRandom(1,20))
		table.insert(tEventOverrideStrings, {Description = nil, Help = help})
	end
end
if isUsingCulDiv then
	LuaEvents.Event_OverrideTextStrings.Add(JFD_CulDiv_Classical)
end
--------------------------------------------------------------------------------------------------------------------------
-- CULDIV: MESOAMERICAN EVENTS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_CulDiv_Mesoamerican
local eventChoiceMesoamerican1ID = GameInfoTypes["PLAYER_EVENT_JFD_CULDIV_MESOAMERICAN_WAR_CAPTIVES_CHOICE_1"]
local eventChoiceMesoamerican2ID = GameInfoTypes["PLAYER_EVENT_JFD_CULDIV_MESOAMERICAN_WAR_CAPTIVES_CHOICE_2"]
local eventChoiceMesoamerican3ID = GameInfoTypes["PLAYER_EVENT_JFD_CULDIV_MESOAMERICAN_WAR_CAPTIVES_CHOICE_3"]
function JFD_CulDiv_Mesoamerican(playerID, eventChoiceID)
	local player = Players[playerID]
	local eventChoice = GameInfo.EventChoices[eventChoiceID]
	if (eventChoiceID == eventChoiceMesoamerican1ID or eventChoiceID == eventChoiceMesoamerican2ID or eventChoiceID == eventChoiceMesoamerican3ID) then
		for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			if (otherPlayer:IsAlive() and otherPlayer:IsAtWarWith(playerID) and (not otherPlayer:IsBarbarian())) then
				JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_" .. eventChoice.Type, Players[otherPlayerID]:GetCivilizationAdjective(), player:GetCivilizationAdjective()))
				break
			end
		end
	end
end 
if isUsingCulDiv then
	GameEvents.EventChoiceActivated.Add(JFD_CulDiv_Mesoamerican)
end
--=======================================================================================================================
--=======================================================================================================================