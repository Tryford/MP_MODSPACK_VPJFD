-- JFD_CID_Happiness_Functions
-- Author: JFD
-- DateCreated: 12/23/2015 8:22:41 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("IconSupport")
include("JFD_CIDUtilities.lua")
include("JFD_CID_HappinessUtils.lua")
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingHappinessCore = JFD_GetUserSetting("JFD_CID_HAPPINESS_CORE") == 1
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
-- HAPPINESS
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Happiness_PlayerDoTurn
local buildingHappinessProductionID = GameInfoTypes["BUILDING_JFD_HAPPINESS_PRODUCTION"]
function JFD_CID_Happiness_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	local isHuman = player:IsHuman()
	for city in player:Cities() do
		local excessHappiness, excessUnhappiness = JFD_GetExcessHappiness(playerID, city, true)
		if (isHuman and city:GetCurrentProductionDifferenceTimes100(false, false) > 0) then
			if excessHappiness > 0 then
				city:ChangeProduction(excessHappiness)
				JFD_ChangeResistanceCounter(playerID, city, -excessHappiness)
			elseif (excessUnhappiness > 0 and excessUnhappiness > excessHappiness) then
				JFD_ChangeResistanceCounter(playerID, city, excessUnhappiness)
			end
		else
			--excessHappiness = excessHappiness - 6
			if excessHappiness > 0 then
				city:SetNumRealBuilding(buildingHappinessProductionID, excessHappiness)
			else
				if city:HasBuilding(buildingHappinessProductionID) then
					city:SetNumRealBuilding(buildingHappinessProductionID, 0)
				end
			end
		end
	end
end
if userSettingHappinessCore then
	GameEvents.PlayerDoTurn.Add(JFD_CID_Happiness_PlayerDoTurn)
end
--=======================================================================================================================
--=======================================================================================================================