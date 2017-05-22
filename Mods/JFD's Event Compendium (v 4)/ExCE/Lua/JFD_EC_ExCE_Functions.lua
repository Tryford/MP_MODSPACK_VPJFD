-- JFD_EC_ExCE_Functions
-- Author: JFD
-- DateCreated: 4/4/2016 3:39:48 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_ECUtils.lua")
include("JFD_ExCE_TribesUtils.lua")
--=======================================================================================================================
-- EXPLORATION: EVENTS
--=======================================================================================================================
-- EXPLORATION: VOYAGER
--------------------------------------------------------------------------------------------------------------------------
--JFD_ExCE_Exploraton_EventChoice
local eventChoiceVoyager2ID = GameInfoTypes["PLAYER_EVENT_JFD_EXPLORATION_VENTURER_CHOICE_2"]
local promotionVenturerID   = GameInfoTypes["PROMOTION_EVENTS_JFD_VENTURER"]
function JFD_ExCE_Exploraton_EventChoice(playerID, eventChoiceID)
	if eventChoiceID == eventChoiceVoyager2ID then
		local player = Players[playerID]
		local unitID = GetStrongestMilitaryUnit(player, true, "UNITCOMBAT_RECON") or 0
		local capital = player:GetCapitalCity()
		player:InitUnit(unitID, capital:GetX(), capital:GetY()):SetHasPromotion(promotionVenturerID, true)
	end
end
GameEvents.EventChoiceActivated.Add(JFD_ExCE_Exploraton_EventChoice)

--JFD_ExCE_Exploraton_EventChoiceStrings
function JFD_ExCE_Exploraton_EventChoiceStrings(playerID, cityID, eventChoice, tOverrideStrings)
	if eventChoice.Type == "PLAYER_EVENT_JFD_EXPLORATION_VENTURER_CHOICE_2" then
		local player = Players[playerID]
		local currentEra = player:GetCurrentEra()
		if currentEra == 0 then currentEra = 1 end
		local goldCost = 0 
		for row in GameInfo.EventChoice_MinimumStartYield("EventChoiceType = 'PLAYER_EVENT_JFD_EXPLORATION_VENTURER_CHOICE_2'") do
			goldCost = (row.Yield)*currentEra
			break
		end
		local unitID = GetStrongestMilitaryUnit(player, true, "UNITCOMBAT_RECON") or 0
		local help = Locale.ConvertTextKey("TXT_KEY_PLAYER_EVENT_JFD_EXPLORATION_VENTURER_CHOICE_2_HELP", goldCost, GameInfo.Units[unitID].Description)
		table.insert(tOverrideStrings, {Description = nil, Help = help})
	end
end
LuaEvents.EventChoice_OverrideTextStrings.Add(JFD_ExCE_Exploraton_EventChoiceStrings)
--=======================================================================================================================
-- TRIBE: EVENTS
--=======================================================================================================================
-- TRIBES: CORE
--------------------------------------------------------------------------------------------------------------------------
--JFD_ExCE_Tribes_CityEventCanTake
--function JFD_ExCE_Tribes_CityEventCanTake(playerID, cityID, cityEventID)
--	local player = Players[playerID]
--	local cityEvent = GameInfo.CityEvents[cityEventID]
--	if cityEvent.RequiresTribe then
--		local city = player:GetCityByID(cityID)
--		for building in GameInfo.Buildings("JFD_TribeType IS NOT NULL") do
--			if city:HasBuilding(building.ID) then
--				return true
--			end
--		end	
--		return false
--	end
--	return true
--end
--GameEvents.CityEventCanTake.Add(JFD_ExCE_Tribes_CityEventCanTake)
--
----JFD_ExCE_Tribes_EventStrings
--function JFD_ExCE_Tribes_EventStrings(playerID, cityID, event, tEventOverrideStrings)
--	if event.RequiresTribe then
--		local player = Players[playerID]
--		local city = player:GetCityByID(cityID)
--		if (not city) then return end
--		if event.RequiresTribe then
--			for building in GameInfo.Buildings("JFD_TribeType IS NOT NULL") do
--				if city:HasBuilding(building.ID) then
--					local tribe = GameInfo.JFD_Tribes[building.JFD_TribeType]
--					local help = Locale.ConvertTextKey("TXT_KEY_" .. event.Type .. "_HELP", tribe.Description, city:GetName())
--					table.insert(tChoiceOverrideStrings, {Description = nil, Help = help})
--					break
--				end
--			end
--		end
--	end
--end  
--LuaEvents.Event_OverrideTextStrings.Add(JFD_ExCE_Tribes_EventStrings)
--
----JFD_ExCE_Tribes_CityEventChoice
--local eventChoicePoorCrops1ID  = GameInfoTypes["CITY_EVENT_JFD_TRIBES_POOR_CROPS_CHOICE_1"]
--local eventChoicePoorCrops2ID  = GameInfoTypes["CITY_EVENT_JFD_TRIBES_POOR_CROPS_CHOICE_2"]
--local eventChoicePoorCrops3ID  = GameInfoTypes["CITY_EVENT_JFD_TRIBES_POOR_CROPS_CHOICE_3"]
--function JFD_ExCE_Tribes_CityEventChoice(playerID, cityID, cityEventChoiceID)
--	local player = Players[playerID]
--	local city = player:GetCityByID(cityID)
--	if cityEventChoiceID == eventChoicePoorCrops1ID then
--		
--	end
--end
--GameEvents.CityEventChoiceActivated.Add(JFD_ExCE_Tribes_CityEventChoice)
--=======================================================================================================================
--=======================================================================================================================