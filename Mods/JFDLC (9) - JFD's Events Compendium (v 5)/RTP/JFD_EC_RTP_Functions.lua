-- EC_RTP_Epithets_Functions
-- Author: JFD
-- DateCreated: 8/27/2016 8:13:33 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_ECUtils.lua");
include("JFD_RTP_EpithetsUtils.lua");
include("JFD_PietyUtils.lua");
--=======================================================================================================================
-- MOD USE
--=======================================================================================================================
local isUsingRTP = JFD_IsUsingRTP()
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingEpithetsCore = JFD_GetUserSetting("JFD_RTP_EPITHETS_CORE") == 1
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local convertTextKey = Locale.ConvertTextKey
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
-- EPITHETS
--------------------------------------------------------------------------------------------------------------------------
--JFD_RPT_Epithets_EventChoice
function JFD_RPT_Epithets_EventChoice(playerID, eventChoiceID)
	local event = GameInfo.EventChoices[eventChoiceID]
	local eventEpithetID = GameInfoTypes[eventEpithet]
	if eventEpithetID then
		JFD_SetHasEpithet(playerID, eventEpithetID, true, false)
	end
end
if userSettingEpithetsCore then
	GameEvents.EventChoiceActivated.Add(JFD_RPT_Epithets_EventChoice)
end

--JFD_RPT_Epithets_CityEventChoice
function JFD_RPT_Epithets_CityEventChoice(playerID, cityID, eventChoiceID)
	local event = GameInfo.CityEventChoices[eventChoiceID]
	local eventEpithetID = GameInfoTypes[eventEpithet]
	if eventEpithetID then
		JFD_SetHasEpithet(playerID, eventEpithetID, true, false)
	end
end
if userSettingEpithetsCore then
	GameEvents.CityEventChoiceActivated.Add(JFD_RPT_Epithets_CityEventChoice)
end
--------------------------------------------------------------------------------------------------------------------------
-- PIETY
--------------------------------------------------------------------------------------------------------------------------
--JFD_RPT_Piety_EventChoice
function JFD_RPT_Piety_EventChoice(playerID, eventChoiceID)
	local player = Players[playerID]
	local currentEra = player:GetCurrentEra()
	if currentEra == 0 then currentEra = 1 end
	local event = GameInfo.EventChoices[eventChoiceID]
	local eventPiety = event.PietyYield
	if eventPiety ~= 0 then
		if event.EraScaling then eventPiety = (eventPiety*currentEra) end
		player:ChangePiety(eventPiety)
		if player:IsHuman() then
			local capital = player:GetCapitalCity()
			Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(capital:GetX(), capital:GetY()))), convertTextKey("[COLOR_JFD_PIETY]{1_Num}[ENDCOLOR] [ICON_JFD_PIETY]", eventPiety), true) 
		end
	end
end
if isUsingRTP then
	GameEvents.EventChoiceActivated.Add(JFD_RPT_Piety_EventChoice)
end

--JFD_RPT_Piety_CityEventChoice
function JFD_RPT_Piety_CityEventChoice(playerID, cityID, eventChoiceID)
	local player = Players[playerID]
	local currentEra = player:GetCurrentEra()
	if currentEra == 0 then currentEra = 1 end
	local event = GameInfo.CityEventChoices[eventChoiceID]
	local eventPiety = event.PietyYield
	if eventPiety ~= 0 then
		if event.EraScaling then eventPiety = (eventPiety*currentEra) end
		player:ChangePiety(eventPiety)
		if player:IsHuman() then
			local capital = player:GetCapitalCity()
			Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(capital:GetX(), capital:GetY()))), convertTextKey("[COLOR_JFD_PIETY]{1_Num}[ENDCOLOR] [ICON_JFD_PIETY]", eventPiety), true) 
		end
	end
end
if isUsingRTP then
	GameEvents.CityEventChoiceActivated.Add(JFD_RPT_Piety_CityEventChoice)
end
-------------
-- CAN TAKE
-------------
--JFD_RTP_Piety_EventCanTake
function JFD_RTP_Piety_EventCanTake(playerID, eventID)
	local player = Players[playerID]
	local event = GameInfo.Events[eventID]
	local eventPietyLevel = event.RequiredPietyLevel
	if eventPietyLevel then
		if (not player:HasStateReligion()) then return false end
		return JFD_GetPietyLevelID(playerID) >= GameInfoTypes[eventPietyLevel] 
	end
	return true
end
if isUsingRTP then
	GameEvents.EventCanTake.Add(JFD_RTP_Piety_EventCanTake)
end

--JFD_RTP_Piety_CityEventCanTake
function JFD_RTP_Piety_CityEventCanTake(playerID, cityID, cityEventID)
	local player = Players[playerID]
	local event = GameInfo.CityEvents[cityEventID]
	local eventPietyLevel = event.RequiredPietyLevel
	if eventPietyLevel then
		if (not player:HasStateReligion()) then return false end
		return JFD_GetPietyLevelID(playerID) >= GameInfoTypes[eventPietyLevel] 
	end
	return true
end
if isUsingRTP then
	GameEvents.CityEventCanTake.Add(JFD_RTP_Piety_CityEventCanTake)
end
-------------
-- TEXT
-------------
--JFD_RPT_Piety_EventChoiceStrings
function JFD_RPT_Piety_EventChoiceStrings(playerID, cityID, eventChoice, tChoiceOverrideStrings)
	local eventPiety = eventChoice.PietyYield
	if eventPiety ~= 0 then
		local player = Players[playerID]
		local currentEra = player:GetCurrentEra()
		if currentEra == 0 then currentEra = 1 end
		if eventChoice.EraScaling then eventPiety = (eventPiety*currentEra) end
		local yieldCost = 0
		local yieldCostText = null
		local yieldReward = 0
		local yieldRewardText = null
		for row in GameInfo.EventChoice_InstantYield("EventChoiceType = '" .. eventChoice.Type .. "'") do
			local yield = GameInfo.Yields[row.YieldType]
			yieldReward = row.Yield
			if eraScaling then yieldReward = (yieldReward*currentEra) end
			yieldReward = ((yieldReward*speedMod)/100)
			if yieldRewardText then yieldRewardText = yieldRewardText .. ", " end
			yieldRewardText = JFD_Round(yieldReward) .. " " .. yield.IconString .. " " .. Locale.ConvertTextKey(yield.Description)
		end
		for row in GameInfo.CityEventChoice_InstantYield("CityEventChoiceType = '" .. eventChoice.Type .. "'") do
			local yield = GameInfo.Yields[row.YieldType]
			yieldReward = row.Yield
			if eraScaling then yieldReward = (yieldReward*currentEra) end
			yieldReward = ((yieldReward*speedMod)/100)
			if yieldRewardText then yieldRewardText = yieldRewardText .. ", " end
			yieldRewardText = JFD_Round(yieldReward) .. " " .. yield.IconString .. " " .. Locale.ConvertTextKey(yield.Description)
		end
		for row in GameInfo.EventChoice_EventCostYield("EventChoiceType = '" .. eventChoice.Type .. "'") do
			local yield = GameInfo.Yields[row.YieldType]
			yieldCost = row.Yield
			if eraScaling then yieldCost = (yieldCost*currentEra) end
			yieldCost = ((yieldCost*speedMod)/100)
			if yieldCostText then yieldCostText = yieldCostText .. ", " end
			yieldCostText = JFD_Round(yieldCost) .. " " .. yield.IconString .. " " .. Locale.ConvertTextKey(yield.Description)
		end
		for row in GameInfo.CityEventChoice_EventCostYield("CityEventChoiceType = '" .. eventChoice.Type .. "'") do
			local yield = GameInfo.Yields[row.YieldType]
			yieldCost = row.Yield
			if eraScaling then yieldCost = (yieldCost*currentEra) end
			yieldCost = ((yieldCost*speedMod)/100)
			if yieldCostText then yieldCostText = yieldCostText .. ", " end
			yieldCostText = JFD_Round(yieldCost) .. " " .. yield.IconString .. " " .. Locale.ConvertTextKey(yield.Description)
		end
		if (not yieldCostText)   then yieldCostText = 0 end
		if (not yieldRewardText) then yieldRewardText = 0 end
		local help = Locale.ConvertTextKey("TXT_KEY_" .. eventChoice.Type .. "_HELP", yieldCostText, yieldRewardText, eventPiety .. " [ICON_JFD_PIETY] Piety")
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = help})
	end
end
if isUsingRTP then
	LuaEvents.EventChoice_OverrideTextStrings.Add(JFD_RPT_Piety_EventChoiceStrings)
end
--=======================================================================================================================
--=======================================================================================================================


