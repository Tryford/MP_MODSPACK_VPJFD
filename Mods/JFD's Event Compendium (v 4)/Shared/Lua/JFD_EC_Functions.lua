-- JFD_EC_Functions
-- Author: Deo-e
-- DateCreated: 4/8/2016 8:47:59 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_ECUtils.lua")
include("JFD_CulDivUtilities.lua")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local g_MinorPlayerID = nil
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
-- EVENTS
--------------------------------------------------------------------------------------------------------------------------
local missionGreatWorkID = GameInfoTypes["MISSION_CREATE_GREAT_WORK"]
-- JFD_EC_EventActivated
function JFD_EC_EventActivated(playerID, eventID)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local event = GameInfo.Events[eventID]
	--City-State
	if event.IsCityState then
		local minorPlayers = {}
		local count = 1
		for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			local otherPlayerTeamID = otherPlayer:GetTeam()
			if (otherPlayer:IsMinorCiv() and otherPlayer:IsAlive()) then
				if (playerTeam:IsHasMet(otherPlayerTeamID) and (not player:IsAtWar(otherPlayerID))) then
					minorPlayers[count] = otherPlayerID
					count = count + 1
				end
			end
		end
		g_MinorPlayerID = minorPlayers[JFD_GetRandom(1, #minorPlayers)]
	end
end
GameEvents.EventActivated.Add(JFD_EC_EventActivated)

-- JFD_EC_EventChoice
function JFD_EC_EventChoice(playerID, eventChoiceID)
	local player = Players[playerID]
	local capital = player:GetCapitalCity()
	local eventChoice = GameInfo.EventChoices[eventChoiceID]
	local cityStateInfluence = eventChoice.CityStateInfluence
	--Influence
	if (g_MinorPlayerID and cityStateInfluence ~= 0) then
		Players[g_MinorPlayerID]:ChangeMinorCivFriendshipWithMajor(playerID, cityStateInfluence)	
	end
	--Garrison Damage
	if eventChoice.GarrisonDamage ~= 0 then
		if eventChoice.CapitalEffectOnly then
			if capital:GetGarrisonedUnit() then
				capital:GetGarrisonedUnit():ChangeDamage(eventChoice.GarrisonDamage)
			end
		else
			for city in player:Cities() do
				if city:GetGarrisonedUnit() then
					city:GetGarrisonedUnit():ChangeDamage(eventChoice.GarrisonDamage)
				end
			end
		end
	end
	--Garrison XP
	if eventChoice.GarrisonXP ~= 0 then
		if eventChoice.CapitalEffectOnly then
			if capital:GetGarrisonedUnit() then
				capital:GetGarrisonedUnit():ChangeExperience(eventChoice.GarrisonXP)
			end
		else
			for city in player:Cities() do
				if city:GetGarrisonedUnit() then
					city:GetGarrisonedUnit():ChangeExperience(eventChoice.GarrisonXP)
				end
			end
		end
	end
	--Great Works
	for row in GameInfo.EventChoice_FreeGreatWorks("EventChoiceType = '" .. eventChoice.Type .. "'") do
		player:InitUnit(GameInfoTypes[row.UnitType], capital:GetX(), capital:GetY()):PushMission(missionGreatWorkID)
	end
	--Unit Damage
	if eventChoice.UnitDamage ~= 0 then
		for unit in player:Units() do
			unit:ChangeDamage(eventChoice.UnitDamage)
		end
	end
	--Unit XP
	if eventChoice.UnitXP ~= 0 then
		for unit in player:Units() do
			unit:ChangeExperience(eventChoice.UnitXP)
		end
	end
	--World Events
	for row in GameInfo.EventChoice_WorldEvents("EventChoiceType = '" .. eventChoice.Type .. "'") do
		if (row.IsCityState and g_MinorPlayerID) then
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey(row.Description, Players[g_MinorPlayerID]:GetCivilizationShortDescription(), player:GetCivilizationShortDescription(), player:GetCivilizationDescription(), player:GetName(), player:GetCivilizationAdjective()))
		else
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey(row.Description, player:GetCivilizationShortDescription(), player:GetCivilizationDescription(), player:GetName(), player:GetCivilizationAdjective()))
		end
	end
	g_MinorPlayerID = nil
end
GameEvents.EventChoiceActivated.Add(JFD_EC_EventChoice)
-----------------------
-- CAN TAKE
-----------------------
--JFD_EC_EventCanTake
function JFD_EC_EventCanTake(playerID, eventID)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local event = GameInfo.Events[eventID]
	--Active Research
	if event.RequiresActiveResearch then
		if player:GetCurrentResearch() == -1 then return false end
	end
	--City-State
	if event.IsCityState then
		if (not g_MinorPlayerID) then return false end
		--for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
		--	local otherPlayer = Players[otherPlayerID]
		--	if (otherPlayer:IsMinorCiv() and otherPlayer:IsAlive()) then
		--		if (playerTeam:IsHasMet(otherPlayer:GetTeam()) and (not player:IsAtWar(otherPlayerID))) then
		--			return true
		--		end
		--	end
		--end
		--return false
	end
	return true
end
GameEvents.EventCanTake.Add(JFD_EC_EventCanTake)

--JFD_EC_EventChoiceCanTake
function JFD_EC_EventChoiceCanTake(playerID, eventChoiceID)
	local player = Players[playerID]
	local eventChoice = GameInfo.EventChoices[eventChoiceID]
	--City-State
	if eventChoice.IsCityState then
		if (not g_MinorPlayerID) then return false end
		--for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
		--	local otherPlayer = Players[otherPlayerID]
		--	if (otherPlayer:IsMinorCiv() and otherPlayer:IsAlive()) then
		--		if (playerTeam:IsHasMet(otherPlayer:GetTeam()) and (not player:IsAtWar(otherPlayerID))) then
		--			return true
		--		end
		--	end
		--end
		--return false
	end
	--Great Work
	for row in GameInfo.EventChoice_FreeGreatWorks("EventChoiceType = '" .. eventChoice.Type .. "'") do
		return player:HasAvailableGreatWorkSlot(GameInfoTypes[row.GreatWorkSlot])
	end
	return true
end
GameEvents.EventChoiceCanTake.Add(JFD_EC_EventChoiceCanTake)
-----------------------
-- TEXT
-----------------------
--JFD_EC_EventStrings
function JFD_EC_EventStrings(playerID, cityID, event, tEventOverrideStrings)
	local player = Players[playerID]
	--Active Research
	if event.RequiresActiveResearch then
		local help = Locale.ConvertTextKey("TXT_KEY_" .. event.Type .. "_HELP", GameInfo.Technologies[player:GetCurrentResearch()].Description)
		table.insert(tEventOverrideStrings, {Description = nil, Help = help})
	end
	--City-State
	if event.IsCityState then
		if (not g_MinorPlayerID) then return end
		local help = Locale.ConvertTextKey("TXT_KEY_" .. event.Type .. "_HELP", Players[g_MinorPlayerID]:GetCivilizationShortDescription())
		table.insert(tEventOverrideStrings, {Description = nil, Help = help})
	end
end
LuaEvents.Event_OverrideTextStrings.Add(JFD_EC_EventStrings)

--JFD_EC_EventChoiceStrings
function JFD_EC_EventChoiceStrings(playerID, cityID, eventChoice, tEventChoiceOverrideStrings)
	local player = Players[playerID]
	if eventChoice.IsCityState then
		if (not g_MinorPlayerID) then return end
		local help = Locale.ConvertTextKey("TXT_KEY_" .. eventChoice.Type .. "_HELP", Players[g_MinorPlayerID]:GetCivilizationShortDescription())
		table.insert(tEventChoiceOverrideStrings, {Description = nil, Help = help})
	end
end
LuaEvents.EventChoice_OverrideTextStrings.Add(JFD_EC_EventChoiceStrings)
--------------------------------------------------------------------------------------------------------------------------
-- CITY EVENTS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_EC_CityEventChoice
function JFD_EC_CityEventChoice(playerID, cityID, eventChoice)
	local player = Players[playerID]
	local city = player:GetCityByID(cityID)
	local eventChoice = GameInfo.CityEventChoices[eventChoice]
	--Garrison Damage
	if eventChoice.GarrisonDamage ~= 0 then
		city:GetGarrisonedUnit():ChangeDamage(eventChoice.GarrisonDamage)
	end
	--Garrison XP
	if eventChoice.GarrisonXP ~= 0 then
		city:GetGarrisonedUnit():ChangeExperience(eventChoice.GarrisonXP)
	end
	--WLTKD
	if eventChoice.WLTKDTurnsAllCities > 0 then
		for city in player:Cities() do
			city:ChangeWeLoveTheKingDayCounter(eventChoice.WLTKDTurnsAllCities)
		end
	end	
	--World Events
	for row in GameInfo.CityEventChoice_WorldEvents("CityEventChoiceType = '" .. eventChoice.Type .. "'") do
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey(row.Description, player:GetCivilizationShortDescription(), city:GetName(), player:GetCivilizationDescription(), player:GetName(), player:GetCivilizationAdjective()))
	end
end
GameEvents.CityEventChoiceActivated.Add(JFD_EC_CityEventChoice)
-----------------------
-- CAN TAKE
-----------------------
-- JFD_EC_CityEventCanTake
function JFD_EC_CityEventCanTake(playerID, cityID, eventID)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local event = GameInfo.CityEvents[eventID]
	--Active Research
	if event.RequiresActiveResearch then
		if player:GetCurrentResearch() == -1 then return false end
	end
	return true
end
GameEvents.CityEventCanTake.Add(JFD_EC_CityEventCanTake)
--=======================================================================================================================
--=======================================================================================================================