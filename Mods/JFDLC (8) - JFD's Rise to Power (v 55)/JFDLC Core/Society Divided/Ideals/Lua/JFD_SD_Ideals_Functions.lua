-- JFD_SocietyDivided_Functions
-- Author: JFD
-- DateCreated: 10/12/2015 3:33:41 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("IconSupport")
include("JFD_SD_IdealsUtils.lua")
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingSDIdealsCore = (Game.GetUserSetting("JFD_SD_IDEALS_CORE") == 1)
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local modGAPercent = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].GoldenAgePercent)/100)
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- IDEALS
------------------------------------------------------------------------------------------------------------------------
--JFD_SD_Ideals_LoadScreenClose
local policyBranchIdealsID = GameInfoTypes["POLICY_BRANCH_JFD_IDEALS"]
function JFD_SD_Ideals_LoadScreenClose()
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local player = Players[playerID]
		if (player:IsAlive() and (not player:IsMinorCiv())) then
			if (not player:IsPolicyBranchUnlocked(policyBranchIdealsID)) then
				player:SetPolicyBranchUnlocked(policyBranchIdealsID, true)
			end
		end
	end 
end
if userSettingSDIdealsCore then
	Events.LoadScreenClose.Add(JFD_SD_Ideals_LoadScreenClose)
end

--JFD_SD_Ideals_PlayerCanAdoptPolicy
function JFD_SD_Ideals_PlayerCanAdoptPolicy(playerID, policyID)
	local player = Players[playerID]
	local policy = GameInfo.Policies[policyID]
	if policy.IsIdeal then
		local idealTag = player:GetCultureIdealTag()
		for ideal in GameInfo.JFD_Ideals("IdealTag = '" .. idealTag .. "' AND PolicyType = '" .. policy.Type .. "'") do
			if (not player:IsHuman()) then
				if player:GetCurrentEra() < GameInfoTypes[ideal.MaxValidEra] then return false end
			end
			return true
		end
		return false
	end
	return true
end
if userSettingSDIdealsCore then
	GameEvents.PlayerCanAdoptPolicy.Add(JFD_SD_Ideals_PlayerCanAdoptPolicy)
end

--JFD_SD_Ideals_PlayerAdoptsPolicy
function JFD_SD_Ideals_PlayerAdoptsPolicy(playerID, policyID)
	local player = Players[playerID]
	local policy = GameInfo.Policies[policyID]
	if policy.IsIdeal then
		if player:GetNumIdeals() == 3 then
			player:ChangeGoldenAgeTurns(12*modGAPercent)
			if player:IsHuman() then Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_IDEAL_COMPLETION_MESSAGE")) end
		end
	end
end
if userSettingSDIdealsCore then
	GameEvents.PlayerAdoptPolicy.Add(JFD_SD_Ideals_PlayerAdoptsPolicy)
end
--=======================================================================================================================
--=======================================================================================================================