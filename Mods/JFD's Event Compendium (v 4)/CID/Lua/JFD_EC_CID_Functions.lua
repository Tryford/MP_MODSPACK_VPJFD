-- JFD_EC_CID_Functions
-- Author: JFD
-- DateCreated: 4/2/2016 8:12:11 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_ECUtils.lua")
include("JFD_CID_ColoniesUtils.lua")
include("JFD_CID_HappinessUtils.lua")
include("JFD_CID_LoyaltyUtils.lua")
include("JFD_CID_ProvincesUtils.lua")
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingColoniesCore  = JFD_GetUserSetting("JFD_CID_COLONIES_CORE") == 1
local userSettingHappinessCore = JFD_GetUserSetting("JFD_CID_HAPPINESS_CORE") == 1
local userSettingLoyaltyCore   = JFD_GetUserSetting("JFD_CID_LOYALTY_CORE") == 1
local userSettingProvincesCore = JFD_GetUserSetting("JFD_CID_PROVINCES_CORE") == 1
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local convertTextKey = Locale.ConvertTextKey
local speedMod       = GameInfo.GameSpeeds[Game.GetGameSpeedType()].GoldPercent
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
-- COLONIES: EVENTS
--------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Colonies_EventChoice
local eventChoiceColonialMigration2ID = GameInfoTypes["CITY_EVENT_JFD_COLONIES_MIGRATION_CHOICE_2"]
local eventChoiceColonialMission1ID   = GameInfoTypes["CITY_EVENT_JFD_COLONIES_MISSION_CHOICE_1"]
local unitMissionaryID				  = GameInfoTypes["UNIT_MISSIONARY"]
function JFD_CID_Colonies_EventChoice(playerID, cityID, cityEventChoiceID)
	if (not userSettingColoniesCore) then return end
	local player = Players[playerID]
	local city = player:GetCityByID(cityID)
	local currentEra = player:GetCurrentEra()
	if currentEra == 0 then currentEra = 1 end
	if cityEventChoiceID == eventChoiceColonialMigration2ID then
		local capital = player:GetCapitalCity()
		capital:ChangePopulation(1, true)
		if player:IsHuman() then
			local hex = ToHexFromGrid(Vector2(capital:GetX(), capital:GetY()))
			Events.GameplayFX(hex.x, hex.y, -1)
			Events.AddPopupTextEvent(HexToWorld(hex), convertTextKey("[COLOR_WHITE]+1 [ENDCOLOR] [ICON_CITIZEN]"), true) 
		end
	elseif cityEventChoiceID == eventChoiceColonialMission1ID then
		local religionID = player:GetStateReligion()
		if religionID <= 1 then religionID = player:GetMajorityReligion() end
		player:InitUnit(unitMissionaryID, city:GetX(), city:GetY()):SetReligion(religionID)
	end
end
if userSettingColoniesCore then
	GameEvents.CityEventChoiceActivated.Add(JFD_CID_Colonies_EventChoice)
end
--------------------------------------------------------------------------------------------------------------------------
-- HAPPINESS: EVENTS
--------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Happiness_EventChoice
function JFD_CID_Happiness_EventChoice(playerID, eventChoiceID)
	if (not userSettingHappinessCore) then return end
	local player = Players[playerID]
	local currentEra = player:GetCurrentEra()
	if currentEra == 0 then currentEra = 1 end
	local eventChoice = GameInfo.EventChoices[eventChoiceID]
	local eraScaling = eventChoice.EraScaling
	local resistanceCounter = eventChoice.ResistanceCounter
	if eventChoice.CapitalEffectOnly then
		local capital = player:GetCapitalCity()
		if eventChoice.ResetResistanceCounter then
			if player:IsHuman() then
				Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(capital:GetX(), capital:GetY()))), convertTextKey("[COLOR_POSITIVE_TEXT]-{1_Num}[ENDCOLOR] [ICON_RESISTANCE]", JFD_GetResistanceCounter(playerID, capital)), true) 
			end
			JFD_SetResistanceCounter(playerID, capital, 0)
		end	
		if resistanceCounter ~= 0 then
			if eraScaling then resistanceCounter = (resistanceCounter*currentEra) end
			JFD_ChangeResistanceCounter(playerID, capital, resistanceCounter)
			if player:IsHuman() then
				local hex = ToHexFromGrid(Vector2(capital:GetX(), capital:GetY()))
				Events.GameplayFX(hex.x, hex.y, -1)
				if resistanceCounter > 0 then
					Events.AddPopupTextEvent(HexToWorld(hex), convertTextKey("[COLOR_NEGATIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_RESISTANCE]", resistanceCounter), true) 
				else
					Events.AddPopupTextEvent(HexToWorld(hex), convertTextKey("[COLOR_POSITIVE_TEXT]-{1_Num}[ENDCOLOR] [ICON_RESISTANCE]", resistanceCounter), true) 
				end
			end
		end
	else
		for city in player:Cities() do
			if resetResistanceCounter then
				if player:IsHuman() then
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(city:GetX(), city:GetY()))), convertTextKey("[COLOR_POSITIVE_TEXT]-{1_Num}[ENDCOLOR] [ICON_RESISTANCE]", JFD_GetResistanceCounter(playerID, city)), true) 
				end
				JFD_SetResistanceCounter(playerID, city, 0)
			end
			if resistanceCounter ~= 0 then
				if eraScaling then resistanceCounter = (resistanceCounter*currentEra) end
				JFD_ChangeResistanceCounter(playerID, city, resistanceCounter)
				if player:IsHuman() then
					local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
					Events.GameplayFX(hex.x, hex.y, -1)
					if resistanceCounter > 0 then
						Events.AddPopupTextEvent(HexToWorld(hex), convertTextKey("[COLOR_NEGATIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_RESISTANCE]", resistanceCounter), true) 
					else
						Events.AddPopupTextEvent(HexToWorld(hex), convertTextKey("[COLOR_POSITIVE_TEXT]-{1_Num}[ENDCOLOR] [ICON_RESISTANCE]", resistanceCounter), true) 
					end
				end
			end
		end
	end
end
if userSettingHappinessCore then
	GameEvents.EventChoiceActivated.Add(JFD_CID_Happiness_EventChoice)
end

--JFD_CID_Happiness_CityEventChoice
function JFD_CID_Happiness_CityEventChoice(playerID, cityID, eventChoiceID)
	if (not userSettingHappinessCore) then return end
	local player = Players[playerID]
	local capital = player:GetCapitalCity()
	local currentEra = player:GetCurrentEra()
	if currentEra == 0 then currentEra = 1 end
	local city = player:GetCityByID(cityID)
	local eventChoice = GameInfo.CityEventChoices[eventChoiceID]
	local eraScaling  = eventChoice.EraScaling
	local resistanceCounter = eventChoice.ResistanceCounter
	if eventChoice.Type == "CITY_EVENT_JFD_COLONIES_PENAL_CHOICE_1" then
		JFD_SetResistanceCounter(playerID, capital, -resistanceCounter)
		if player:IsHuman() then
			Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(capital:GetX(), capital:GetY()))), convertTextKey("[COLOR_POSITIVE_TEXT]-{1_Num}[ENDCOLOR] [ICON_RESISTANCE]", resistanceCounter), true) 
		end
	end
	if eventChoice.IsBenefitsCapital then city = player:GetCapitalCity() end
	if eventChoice.ResetResistanceCounter then
		JFD_SetResistanceCounter(playerID, city, 0)
		if player:IsHuman() then
			local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
			Events.AddPopupTextEvent(HexToWorld(hex), convertTextKey("[COLOR_POSITIVE_TEXT]-{1_Num}[ENDCOLOR] [ICON_RESISTANCE]", JFD_GetResistanceCounter(playerID, city)), true) 
		end
	end
	if resistanceCounter ~= 0 then
		if eraScaling then resistanceCounter = (resistanceCounter*currentEra) end
		JFD_ChangeResistanceCounter(playerID, city, resistanceCounter)
		if player:IsHuman() then
			local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
			Events.GameplayFX(hex.x, hex.y, -1)
			if resistanceCounter > 0 then
				Events.AddPopupTextEvent(HexToWorld(hex), convertTextKey("[COLOR_WARNING_TEXT]+{1_Num}[ENDCOLOR] [ICON_RESISTANCE]", resistanceCounter), true) 
			else
				Events.AddPopupTextEvent(HexToWorld(hex), convertTextKey("[COLOR_POSITIVE_TEXT]{1_Num}[ENDCOLOR] [ICON_RESISTANCE]", resistanceCounter), true) 
			end
		end
	end
end
if userSettingHappinessCore then
	GameEvents.CityEventChoiceActivated.Add(JFD_CID_Happiness_CityEventChoice)
end
-------------
-- TEXT
-------------
--JFD_CID_Happiness_EventChoiceStrings
function JFD_CID_Happiness_EventChoiceStrings(playerID, cityID, eventChoice, tChoiceOverrideStrings)
	if (not userSettingHappinessCore) then return end
	local eraScaling = eventChoice.EraScaling
	local resistanceCounter = eventChoice.ResistanceCounter
	if resistanceCounter ~= 0 then
		local player = Players[playerID]
		local currentEra = player:GetCurrentEra()
		if currentEra == 0 then currentEra = 1 end
		if eraScaling then resistanceCounter = (resistanceCounter*currentEra) end
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
		local help = Locale.ConvertTextKey("TXT_KEY_" .. eventChoice.Type .. "_HELP", yieldCostText, yieldRewardText, resistanceCounter)
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = help})
	end
end
if userSettingHappinessCore then
	LuaEvents.EventChoice_OverrideTextStrings.Add(JFD_CID_Happiness_EventChoiceStrings)
end
--------------------------------------------------------------------------------------------------------------------------
-- LOYALTY: EVENTS
--------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Loyalty_EventChoice
function JFD_CID_Loyalty_EventChoice(playerID, eventChoiceID)
	local player = Players[playerID]
	local currentEra = player:GetCurrentEra()
	if currentEra == 0 then currentEra = 1 end
	local eventChoice = GameInfo.EventChoices[eventChoiceID]
	local eraScaling = eventChoice.EraScaling
	local revoltCounter = eventChoice.RevoltCounter
	local WLTKDCounter = eventChoice.WLTKDCounter
	if eventChoice.CapitalEffectOnly then
		local capital = player:GetCapitalCity()
		--Revolt
		if eventChoice.ResetRevoltCounter then
			if player:IsHuman() then
				Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(capital:GetX(), capital:GetY()))), convertTextKey("[COLOR_POSITIVE_TEXT]-{1_Num}[ENDCOLOR] [ICON_JFD_REVOLT]", JFD_GetLoyaltyCounter(playerID, capital)), true) 
			end
			JFD_SetLoyaltyCounter(playerID, capital, 0)
		end
		if revoltCounter ~= 0 then
			if eraScaling then revoltCounter = (revoltCounter*currentEra) end
			JFD_ChangeLoyaltyCounter(playerID, city, revoltCounter)
			if player:IsHuman() then
				local hex = ToHexFromGrid(Vector2(capital:GetX(), capital:GetY()))
				Events.GameplayFX(hex.x, hex.y, -1)
				if revoltCounter > 0 then
					Events.AddPopupTextEvent(HexToWorld(hex), convertTextKey("[COLOR_NEGATIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_JFD_REVOLT]", revoltCounter), true) 
				else
					Events.AddPopupTextEvent(HexToWorld(hex), convertTextKey("[COLOR_POSITIVE_TEXT]{1_Num}[ENDCOLOR] [ICON_JFD_REVOLT]", revoltCounter), true) 
				end
			end
		end
		--WLTKD
		if eventChoice.ResetWLTKDCounter then
			if player:IsHuman() then
				Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(capital:GetX(), capital:GetY()))), convertTextKey("[COLOR_NEGATIVE_TEXT]-{1_Num}[ENDCOLOR] [ICON_JFD_WLTKD]", JFD_GetLoyaltyCounter(playerID, city, nil, false, false, false, false, true)), true) 
			end
			JFD_SetLoyaltyCounter(playerID, capital, 0, true)
		end	
		if WLTKDCounter ~= 0 then
			if eraScaling then WLTKDCounter = (WLTKDCounter*currentEra) end
			JFD_ChangeLoyaltyCounter(playerID, city, WLTKDCounter, true)
			if player:IsHuman() then
				local hex = ToHexFromGrid(Vector2(capital:GetX(), capital:GetY()))
				Events.GameplayFX(hex.x, hex.y, -1)
				if WLTKDCounter > 0 then
					Events.AddPopupTextEvent(HexToWorld(hex), convertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_JFD_REVOLT]", WLTKDCounter), true) 
				else
					Events.AddPopupTextEvent(HexToWorld(hex), convertTextKey("[COLOR_NEGATIVE_TEXT]{1_Num}[ENDCOLOR] [ICON_JFD_REVOLT]", WLTKDCounter), true) 
				end
			end
		end
	else
		for city in player:Cities() do
			--Revolt
			if eventChoice.ResetRevoltCounter then
				if player:IsHuman() then
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(city:GetX(), city:GetY()))), convertTextKey("[COLOR_POSITIVE_TEXT]-{1_Num}[ENDCOLOR] [ICON_JFD_REVOLT]", JFD_GetLoyaltyCounter(playerID, city)), true) 
				end
				JFD_SetLoyaltyCounter(playerID, city, 0)
			end
			if revoltCounter ~= 0 then
				if eraScaling then revoltCounter = (revoltCounter*currentEra) end
				JFD_ChangeLoyaltyCounter(playerID, city, revoltCounter)
				if player:IsHuman() then
					local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
					Events.GameplayFX(hex.x, hex.y, -1)
					if revoltCounter > 0 then
						Events.AddPopupTextEvent(HexToWorld(hex), convertTextKey("[COLOR_NEGATIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_JFD_REVOLT]", revoltCounter), true) 
					else
						Events.AddPopupTextEvent(HexToWorld(hex), convertTextKey("[COLOR_POSITIVE_TEXT]{1_Num}[ENDCOLOR] [ICON_JFD_REVOLT]", revoltCounter), true) 
					end
				end
			end
			--WLTKD
			if eventChoice.ResetWLTKDCounter then
				if player:IsHuman() then
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(city:GetX(), city:GetY()))), convertTextKey("[COLOR_POSITIVE_TEXT]-{1_Num}[ENDCOLOR] [ICON_JFD_WLTKD]", JFD_GetLoyaltyCounter(playerID, city, nil, false, false, false, false, true)), true) 
				end
				JFD_SetLoyaltyCounter(playerID, city, 0)
			end
			if WLTKDCounter ~= 0 then
				if eraScaling then WLTKDCounter = (WLTKDCounter*currentEra) end
				JFD_ChangeLoyaltyCounter(playerID, city, WLTKDCounter, true)
				if player:IsHuman() then
					local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
					Events.GameplayFX(hex.x, hex.y, -1)
					if WLTKDCounter > 0 then
						Events.AddPopupTextEvent(HexToWorld(hex), convertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_JFD_WLTKD]", WLTKDCounter), true) 
					else
						Events.AddPopupTextEvent(HexToWorld(hex), convertTextKey("[COLOR_NEGATIVE_TEXT]{1_Num}[ENDCOLOR] [ICON_JFD_WLTKD]", WLTKDCounter), true) 
					end
				end
			end
		end
	end
end
if userSettingLoyaltyCore then
	GameEvents.EventChoiceActivated.Add(JFD_CID_Happiness_EventChoice)
end

--JFD_CID_Loyalty_CityEventChoice
function JFD_CID_Loyalty_CityEventChoice(playerID, cityID, eventChoiceID)
	local player = Players[playerID]
	local currentEra = player:GetCurrentEra()
	if currentEra == 0 then currentEra = 1 end
	local city = player:GetCityByID(cityID)
	local eventChoice = GameInfo.CityEventChoices[eventChoiceID]
	local eraScaling = eventChoice.EraScaling
	if eventChoice.IsBenefitsCapital then city = player:GetCapitalCity() end
	--Revolt
	if eventChoice.ResetRevoltCounter then
		if player:IsHuman() then
			local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
			Events.AddPopupTextEvent(HexToWorld(hex), convertTextKey("[COLOR_POSITIVE_TEXT]-{1_Num}[ENDCOLOR] [ICON_JFD_REVOLT]", JFD_GetLoyaltyCounter(playerID, city)), true) 
		end
		JFD_SetLoyaltyCounter(playerID, city, 0)
	end
	local revoltCounter = eventChoice.RevoltCounter
	if revoltCounter ~= 0 then
		if eraScaling then revoltCounter = (revoltCounter*currentEra) end
		JFD_ChangeLoyaltyCounter(playerID, city, revoltCounter)
		if player:IsHuman() then
			local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
			Events.GameplayFX(hex.x, hex.y, -1)
			if revoltCounter > 0 then
				Events.AddPopupTextEvent(HexToWorld(hex), convertTextKey("[COLOR_NEGATIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_JFD_REVOLT]", revoltCounter), true) 
			else
				Events.AddPopupTextEvent(HexToWorld(hex), convertTextKey("[COLOR_POSITIVE_TEXT]{1_Num}[ENDCOLOR] [ICON_JFD_REVOLT]", revoltCounter), true) 
			end
		end
	end
	--WLTKD
	if eventChoice.ResetWLTKDCounter then
		if player:IsHuman() then
			Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(city:GetX(), city:GetY()))), convertTextKey("[COLOR_NEGATIVE_TEXT]-{1_Num}[ENDCOLOR] [ICON_JFD_WLTKD]", JFD_GetLoyaltyCounter(playerID, city, nil, false, false, false, false, true)), true) 
		end
		JFD_SetLoyaltyCounter(playerID, city, 0, true)
	end
	local WLTKDCounter = eventChoice.WLTKDCounter
	if WLTKDCounter ~= 0 then
		if eraScaling then revoltCounter = (WLTKDCounter*currentEra) end
		JFD_ChangeLoyaltyCounter(playerID, city, WLTKDCounter, true)
		if player:IsHuman() then
			local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
			Events.GameplayFX(hex.x, hex.y, -1)
			if WLTKDCounter > 0 then
				Events.AddPopupTextEvent(HexToWorld(hex), convertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_JFD_WLTKD]", WLTKDCounter), true) 
			else
				Events.AddPopupTextEvent(HexToWorld(hex), convertTextKey("[COLOR_NEGATIVE_TEXT]{1_Num}[ENDCOLOR] [ICON_JFD_WLTKD]", WLTKDCounter), true) 
			end
		end
	end
end
if userSettingLoyaltyCore then
	GameEvents.CityEventChoiceActivated.Add(JFD_CID_Loyalty_CityEventChoice)
end
-------------
-- TEXT
-------------
--JFD_CID_Loyalty_EventChoiceStrings
function JFD_CID_Loyalty_EventChoiceStrings(playerID, cityID, eventChoice, tChoiceOverrideStrings)
	if (not userSettingLoyaltyCore) then return end
	local eraScaling = eventChoice.EraScaling
	local revoltCounter	= eventChoice.RevoltCounter
	local WLTKDCounter = eventChoice.WLTKDCounter
	if (revoltCounter ~= 0 or WLTKDCounter ~= 0) then
		local player = Players[playerID]
		local currentEra = player:GetCurrentEra()
		if currentEra == 0 then currentEra = 1 end
		if eraScaling then revoltCounter = (revoltCounter*currentEra) end
		if eraScaling then WLTKDCounter  = (WLTKDCounter*currentEra)  end
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
		local help = Locale.ConvertTextKey("TXT_KEY_" .. eventChoice.Type .. "_HELP", yieldCostText, yieldRewardText, revoltCounter, WLTKDCounter)
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = help})
	end
end
if userSettingLoyaltyCore then
	LuaEvents.EventChoice_OverrideTextStrings.Add(JFD_CID_Loyalty_EventChoiceStrings)
end
--------------------------------------------------------------------------------------------------------------------------
-- PROVINCES: EVENTS
--------------------------------------------------------------------------------------------------------------------------
local promotionLevyID			 = GameInfoTypes["PROMOTION_JFD_LEVY"]
local promotionLevyDefensiveID	 = GameInfoTypes["PROMOTION_JFD_LEVY_DEFENSIVE"]

--JFD_CID_Provinces_EventChoice
function JFD_CID_Provinces_EventChoice(playerID, eventChoiceID)
	local player = Players[playerID]
	local eventChoice = GameInfo.EventChoices[eventChoiceID]
	local eventChoiceLevyDamage = eventChoice.LeviesDamage
	local eventChoiceLevyXP = eventChoice.LeviesXP
	if (eventChoiceLevyDamage > 0 or eventChoiceLevyXP > 0) then
		for unit in player:Units() do
			if (unit:HasPromotion(promotionLevyID) or unit:HasPromotion(promotionLevyDefensiveID)) then
				if player:IsHuman() then 
					local unitX = unit:GetX()
					local unitY = unit:GetY()
					local hex = ToHexFromGrid(Vector2(unitX, unitY))
					Events.GameplayFX(hex.x, hex.y, -1)
					UI.LookAt(Map.GetPlot(unitX, unitY), 0) 
				end
				if eventChoiceLevyDamage > 0 then
					unit:ChangeDamage(eventChoiceLevyDamage)
				end
				if eventChoiceLevyXP > 0 then
					unit:ChangeExperience(eventChoiceLevyXP)
				end
				break
			end
		end
	end
end
if userSettingProvincesCore then
	GameEvents.EventChoiceActivated.Add(JFD_CID_Provinces_EventChoice)
end

--JFD_CID_Provinces_CityEventChoice
local eventChoiceGreatBall1ID   = GameInfoTypes["CITY_EVENT_JFD_PROVINCE_GREAT_BALL_CHOICE_1"]
local eventChoiceGreatBall2ID   = GameInfoTypes["CITY_EVENT_JFD_PROVINCE_GREAT_BALL_CHOICE_2"]
local eventChoiceHomosexual1ID  = GameInfoTypes["CITY_EVENT_JFD_PROVINCE_HOMOSEXUAL_CHOICE_1"]
local eventChoiceWarMachine1ID  = GameInfoTypes["CITY_EVENT_JFD_PROVINCE_WAR_MACHINE_CHOICE_1"]
local unitSiegeTowerID		    = GameInfoTypes["UNIT_ASSYRIAN_SIEGE_TOWER"]
function JFD_CID_Provinces_CityEventChoice(playerID, cityID, cityEventChoiceID)
	local player = Players[playerID]
	local city = player:GetCityByID(cityID)
	if cityEventChoiceID == eventChoiceGreatBall1ID then
		player:GetCapitalCity():ChangeWeLoveTheKingDayCounter(20)
	end
	if cityEventChoiceID == eventChoiceGreatBall2ID then
		city:ChangeWeLoveTheKingDayCounter(-city:GetWeLoveTheKingDayCounter())
	end
	if cityEventChoiceID == eventChoiceWarMachine1ID then
		player:InitUnit(unitSiegeTowerID, city:GetX(), city:GetY())
	end
end
if userSettingProvincesCore then
	GameEvents.CityEventChoiceActivated.Add(JFD_CID_Provinces_CityEventChoice)
end
-------------
-- CAN TAKE
-------------
--JFD_CID_Provinces_EventCanTake
function JFD_CID_Provinces_EventCanTake(playerID, eventID)
	local player = Players[playerID]
	local event = GameInfo.Events[eventID]
	if event.RequiresLevies then
		for unit in player:Units() do
			if (unit:HasPromotion(promotionLevyID) or unit:HasPromotion(promotionLevyDefensiveID)) then
				return true
			end
		end
		return false
	end
	return true
end
if userSettingProvincesCore then
	GameEvents.EventCanTake.Add(JFD_CID_Provinces_EventCanTake)
end
-------------
-- TEXT
-------------
--JFD_CID_Provinces_EventStrings
function JFD_CID_Provinces_EventStrings(playerID, cityID, event, tEventOverrideStrings)
	if event.IsProvince then
		local player = Players[playerID]
		local city = player:GetCityByID(cityID)
		local provinceRulerTitle = JFD_GetUniqueProvinceRulerTitle(playerID, city)
		if JFD_GetRandom(1,2) == 1 then provinceRulerTitle = provinceRulerTitle .. "_FEMININE" end
		local help = Locale.ConvertTextKey("TXT_KEY_" .. event.Type .. "_HELP", provinceRulerTitle, city:GetName())
		table.insert(tEventOverrideStrings, {Description = nil, Help = help})
	end
end
if userSettingProvincesCore then
	LuaEvents.Event_OverrideTextStrings.Add(JFD_CID_Provinces_EventStrings)
end

--JFD_CID_Provinces_EventChoiceStrings
function JFD_CID_Provinces_EventChoiceStrings(playerID, cityID, eventChoice, tChoiceOverrideStrings)
	local player = Players[playerID]
	local city = player:GetCityByID(cityID)
	local currentEra = player:GetCurrentEra()
	if currentEra == 0 then currentEra = 1 end
	if eventChoice.IsProvince then
		local provinceRulerTitle = JFD_GetUniqueProvinceRulerTitle(playerID, city)
		if JFD_GetRandom(1,2) == 1 then provinceRulerTitle = provinceRulerTitle .. "_FEMININE" end
		local help = Locale.ConvertTextKey("TXT_KEY_" .. eventChoice.Type .. "_HELP", provinceRulerTitle, city:GetName())
		table.insert(tChoiceOverrideStrings, {Description = nil, Help = help})
	end
end
if userSettingProvincesCore then
	LuaEvents.EventChoice_OverrideTextStrings.Add(JFD_CID_Provinces_EventChoiceStrings)
end
--=======================================================================================================================
--=======================================================================================================================