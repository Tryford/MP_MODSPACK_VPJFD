-- JFD_CID_Happiness_Functions
-- Author: JFD
-- DateCreated: 12/23/2015 8:22:41 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_CID_HappinessUtils.lua")
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingCIDHappinessCore	 							    = (Game.GetUserSetting("JFD_CID_HAPPINESS_CORE") == 1)
local userSettingCIDHappinessCoreExcessProductionMod			    = (Game.GetUserSetting("JFD_CID_HAPPINESS_CORE_EXCESS_INTO_PRODUCTION_MOD") == 1)
local userSettingCIDHappinessCoreExcessProductionRaw			    = (Game.GetUserSetting("JFD_CID_HAPPINESS_CORE_EXCESS_INTO_PRODUCTION_RAW") == 1)
local userSettingCIDHappinessCoreFirstNotificationResistanceTurns  	= (Game.GetUserSetting("JFD_CID_HAPPINESS_CORE_NOTIFICATION_FIRST_RESISTANCE_TURNS"))
local userSettingCIDHappinessCoreSecondNotificationResistanceTurns 	= (Game.GetUserSetting("JFD_CID_HAPPINESS_CORE_NOTIFICATION_SECOND_RESISTANCE_TURNS"))
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local convertTextKey	= Locale.ConvertTextKey

local yieldProductionID = YieldTypes.YIELD_PRODUCTION
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- HAPPINESS
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Happiness_PlayerDoTurn
function JFD_CID_Happiness_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	if player:IsMinorCiv() then return end
	local isHuman = player:IsHuman()
	for city in player:Cities() do
		local excessHappiness, excessUnhappiness = player:GetCityExcessHappiness(city, true)
		local excessHappinessToProductionBonus = player:GetCityExcessHappinessBonusProduction()
		if excessHappinessToProductionBonus > 0 then excessHappiness = Game.GetRound((excessHappiness*excessHappinessToProductionBonus)/100) end
		if userSettingCIDHappinessCoreExcessProductionMod then
			if excessHappiness > excessUnhappiness then
				city:SetYieldModifierFromHappiness(yieldProductionID, excessHappiness)
			else
				city:SetYieldModifierFromHappiness(yieldProductionID, 0) 
				--city:SetYieldModifierFromHappiness(yieldProductionID, -excessUnhappiness) 
			end
		elseif userSettingCIDHappinessCoreExcessProductionRaw then
			if excessHappiness > excessUnhappiness then
				city:SetYieldFromHappiness(yieldProductionID, excessHappiness)
			else
				city:SetYieldFromHappiness(yieldProductionID, 0) 
				--city:SetYieldFromHappiness(yieldProductionID, -excessUnhappiness)
			end
		end
		if (not city:IsResistance()) then
			local resistanceCounter, resistanceThreshold, resistanceTurns = player:GetCityResistanceCounterDetails(city, true, true)
			if excessHappiness > 0 then
				if resistanceCounter > 0 then 
					city:ChangeResistanceCounter(-excessHappiness) 
				end
			elseif (excessUnhappiness > 0 and excessUnhappiness > excessHappiness) then
				city:ChangeResistanceCounter(excessUnhappiness)
				resistanceCounter, resistanceThreshold, resistanceTurns = player:GetCityResistanceCounterDetails(city, true, true)
				if resistanceCounter >= resistanceThreshold then
					city:ChangeResistanceTurns(excessUnhappiness)
					city:SetResistanceCounter(0)
					if player:IsHuman() then
						Events.AudioPlay2DSound("AS2D_SOUND_JFD_RESISTANCE")
						JFD_SendNotification(playerID, "NOTIFICATION_CITY_LOST", convertTextKey("TXT_KEY_JFD_CITY_RESISTANCE_NOTIFICATION", city:GetName()), convertTextKey("TXT_KEY_JFD_CITY_RESISTANCE_NOTIFICATION_SHORT", city:GetName()), false, city:GetX(), city:GetY())
						JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_CITY_RESISTANCE", player:GetCivilizationDescription()))
					end
				elseif (userSettingCIDHappinessCoreFirstNotificationResistanceTurns > 0 and resistanceTurns == userSettingCIDHappinessCoreFirstNotificationResistanceTurns) then
					JFD_SendNotification(playerID, "NOTIFICATION_CITY_LOST", convertTextKey("TXT_KEY_JFD_CITY_RESISTANCE_IMMINENT_NOTIFICATION", city:GetName(), resistanceTurns), convertTextKey("TXT_KEY_JFD_CITY_RESISTANCE_IMMINENT_NOTIFICATION_SHORT", city:GetName()), false, city:GetX(), city:GetY())
				elseif (userSettingCIDHappinessCoreSecondNotificationResistanceTurns > 0 and resistanceTurns == userSettingCIDHappinessCoreSecondNotificationResistanceTurns) then
					JFD_SendNotification(playerID, "NOTIFICATION_CITY_LOST", convertTextKey("TXT_KEY_JFD_CITY_RESISTANCE_IMMINENT_NOTIFICATION", city:GetName(), resistanceTurns), convertTextKey("TXT_KEY_JFD_CITY_RESISTANCE_IMMINENT_NOTIFICATION_SHORT", city:GetName()), false, city:GetX(), city:GetY())
				end
			end
		end
	end
end
if userSettingCIDHappinessCore then
	GameEvents.PlayerDoTurn.Add(JFD_CID_Happiness_PlayerDoTurn)
end

--JFD_CID_Happiness_PlayerFoundedCity
function JFD_CID_Happiness_PlayerCityFounded(playerID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (not player:IsHuman()) then return end
	local city = Map.GetPlot(plotX, plotY):GetPlotCity()
	local excessHappiness, excessUnhappiness = player:GetCityExcessHappiness(city, true)
	local excessHappinessToProductionBonus = player:GetCityExcessHappinessBonusProduction()
	if excessHappinessToProductionBonus > 0 then excessHappiness = Game.GetRound((excessHappiness*excessHappinessToProductionBonus)/100) end
	if userSettingCIDHappinessCoreExcessProductionMod then
		if excessHappiness > excessUnhappiness then
			city:SetYieldModifierFromHappiness(yieldProductionID, excessHappiness)
		else
			city:SetYieldModifierFromHappiness(yieldProductionID, 0) 
			--city:SetYieldModifierFromHappiness(yieldProductionID, -excessUnhappiness) 
		end
	elseif userSettingCIDHappinessCoreExcessProductionRaw then
		if excessHappiness > excessUnhappiness then
			city:SetYieldFromHappiness(yieldProductionID, excessHappiness)
		else
			city:SetYieldFromHappiness(yieldProductionID, 0) 
			--city:SetYieldFromHappiness(yieldProductionID, -excessUnhappiness)
		end
	end
end
if userSettingCIDHappinessCore then
	GameEvents.PlayerCityFounded.Add(JFD_CID_Happiness_PlayerCityFounded)
end
--=======================================================================================================================
--=======================================================================================================================