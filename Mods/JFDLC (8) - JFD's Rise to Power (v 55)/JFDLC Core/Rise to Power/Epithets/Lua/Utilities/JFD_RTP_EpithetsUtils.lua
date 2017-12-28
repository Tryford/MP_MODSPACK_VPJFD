-- JFD_RTP_EpithetsUtils
-- Author: JFD
-- DateCreated: 10/14/2015 7:38:08 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFDLCUtils.lua")
--=======================================================================================================================
-- GAMES DEFINES
--=======================================================================================================================
local defineDefaultGAPs = GameDefines["JFD_RTP_EPITHETS_DEFAULT_GOLDEN_AGE_POINTS"]
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local convertTextKey    = Locale.ConvertTextKey
------------------------------------------------------------------------------------------------------------------------
-- EPITHETS
------------------------------------------------------------------------------------------------------------------------
--Player:GetEpithetType
function Player.GetEpithetType(player)
for row in GameInfo.JFD_Epithets() do
	if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
		return row.ID
	end
end
end

--Player:GetEpithetDescription
function Player.GetEpithetDescription(player, epithetID)
	local epithet = GameInfo.JFD_Epithets[epithetID]
	return epithet.Description
end

--Player:GetEpithetShortDescription
function Player.GetEpithetShortDescription(player, epithetID)
	local epithet = GameInfo.JFD_Epithets[epithetID]
	local epithetShortDesc = epithet.ShortDescription
	if (epithet.HasFeminineAlt and player:IsLeaderFeminine()) then epithetShortDesc = epithetShortDesc .. "_FEMININE" end
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	for row in GameInfo.JFD_Epithet_CivilizationTitles("EpithetType = '" .. epithet.Type .. "' AND CivilizationType = '" .. civType .. "'") do
		epithetShortDesc = row.ShortDescription	
	end
	if player:HasStateReligion() then
		local religionType = GameInfo.Religions[player:GetStateReligion()].Type
		for row in GameInfo.JFD_Epithet_ReligionTitles("EpithetType = '" .. epithet.Type .. "' AND ReligionType = '" .. religionType .. "'") do
			epithetShortDesc = row.ShortDescription	
		end
	end
	return epithetShortDesc
end

--Player:HasAnyEpithet
function Player.HasAnyEpithet(player)
	return player:GetEpithetType()
end

--Player:HasEpithet
function Player.HasEpithet(player, epithetID)
	return player:HasPolicy(GameInfoTypes[GameInfo.JFD_Epithets[epithetID].PolicyType])
end

--Player:DoTestEpithetChance
function Player.DoTestEpithetChance(player, epithetID, epithetChance)
	if (not epithetID) then return end
	if Game.GetRandom(1,100) <= epithetChance then
		if player:IsHuman() then
			LuaEvents.JFD_RTP_Epithets_ShowChooseEpithetPopup(epithetID)
		else
			player:SetHasEpithet(epithetID, true)
		end
	end
end

--Player:SetHasEpithet
function Player.SetHasEpithet(player, epithetID, isAdding, isSendNotification)
	local epithet = GameInfo.JFD_Epithets[epithetID]
	local policyID = GameInfoTypes[epithet.PolicyType]
	if isAdding then
		player:GrantPolicy(policyID, true)
		local leaderName = player:GetDefaultName()
		local epithetDesc = player:GetEpithetDescription(epithetID)
		local epithetShortDesc = player:GetEpithetShortDescription(epithetID)	
		if isSendNotification then
			if player:IsHuman() then
				Events.AudioPlay2DSound("AS2D_SOUND_JFD_EPITHET_ACCEPTED")
				JFD_SendNotification(player:GetID(), "NOTIFICATION_JFD_EPITHET", Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_EPITHET", leaderName, epithetShortDesc), Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_EPITHET_SHORT"))
			else
				JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_EPITHET_OTHER", leaderName, epithetShortDesc), Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_EPITHET_SHORT"))
			end
		end
		for row in GameInfo.JFD_Epithets("ID <> '" .. epithetID .. "'") do
			player:SetHasEpithet(row.ID, false)
		end
		LuaEvents.JFD_EpithetGranted(playerID, epithetID)
		if player:IsHuman() then
			LuaEvents.JFD_Tutorial_PushTutorialPopup(player:GetID(), "IsOnEpithet")
		end
		for row in GameInfo.JFD_Epithet_SovereigntyMods("EpithetType = '" .. epithet.Type .. "'") do
			local cooldownChange = player:GetReformCooldown() + ((player:GetReformCooldown()*row.ReformCooldownMod)/100)
			player:SetReformCooldown(cooldownChange)
		end
	else
		player:RevokePolicy(policyID)
	end
end
--=======================================================================================================================
--=======================================================================================================================