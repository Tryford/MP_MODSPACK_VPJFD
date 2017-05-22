-- JFD_RTP_EpithetsUtils
-- Author: JFD
-- DateCreated: 10/14/2015 7:38:08 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_RTPUtils.lua")
--=======================================================================================================================
-- GAMES DEFINES
--=======================================================================================================================
local defineDefaultGAPs = GameDefines["JFD_RTP_EPITHETS_DEFAULT_GOLDEN_AGE_POINTS"]
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local convertTextKey = Locale.ConvertTextKey
------------------------------------------------------------------------------------------------------------------------
-- EPITHETS
------------------------------------------------------------------------------------------------------------------------
--JFD_GetEpithetID
function JFD_GetEpithetID(playerID)
	local player = Players[playerID]
	for row in GameInfo.JFD_Epithets() do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			return row.ID
		end
	end
end

--JFD_HasAnyEpithet
function JFD_HasAnyEpithet(playerID)
	local player = Players[playerID]
	for row in GameInfo.JFD_Epithets() do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			return true
		end
	end
	return false
end

--JFD_HasEpithet
function JFD_HasEpithet(playerID, epithetID)
	local player = Players[playerID]
	local epithet = GameInfo.JFD_Epithets[epithetID]
	return player:HasPolicy(GameInfoTypes[epithet.PolicyType])
end

--JFD_SetHasEpithet
function JFD_SetHasEpithet(playerID, epithetID, setHasEpithet, sendNotification)
	local player = Players[playerID]
	if epithetID then
		local epithet = GameInfo.JFD_Epithets[epithetID]
		local policyID = GameInfoTypes[epithet.PolicyType]
		if setHasEpithet then
			player:GrantPolicy(policyID, true)
			local leaderName = JFD_GetDefaultLeaderName(playerID)
			--if Sovereignty --JFD_GetLeaderTitleShort(playerID)
			local epithetShortDesc, epithetDesc = JFD_GetEpithetDescription(playerID, epithetID)
			if sendNotification then
				if player:IsHuman() then
					Events.AudioPlay2DSound("AS2D_SOUND_JFD_EPITHET_ACCEPTED")
					JFD_SendNotification(playerID, "NOTIFICATION_JFD_EPITHET", Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_EPITHET", leaderName, epithetShortDesc), Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_EPITHET_SHORT"))
				else
					JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_EPITHET_OTHER", leaderName, epithetShortDesc), Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_EPITHET_SHORT"))
				end
			end
			for row in GameInfo.JFD_Epithets("ID <> '" .. epithetID .. "'") do
				JFD_SetHasEpithet(playerID, row.ID, false)
			end
			LuaEvents.JFD_EpithetGranted(playerID, epithetID)
		else
			player:RevokePolicy(policyID)
		end
	end
end
-------------
-- UI
-------------
--JFD_DoEpithet
function JFD_DoEpithet(playerID, epithetID, epithetChance)
	local player = Players[playerID]
	if (not epithetID) then return end
	if JFD_GetRandom(1,100) <= epithetChance then
		if player:IsHuman() then
			LuaEvents.JFD_RTP_Epithets_ShowChooseEpithetPopup(epithetID)
		else
			JFD_SetHasEpithet(playerID, epithetID, true)
		end
	end
end

--JFD_GetEpithetDescription
function JFD_GetEpithetDescription(playerID, epithetID)
	local player = Players[playerID]
	local epithet = GameInfo.JFD_Epithets[epithetID]
	local epithetShortDesc = epithet.ShortDescription
	if (epithet.HasFeminineAlt and JFD_IsLeaderFeminine(playerID)) then epithetShortDesc = epithetShortDesc .. "_FEMININE" end
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	for row in GameInfo.JFD_Epithet_CivilizationTitles("EpithetType = '" .. epithet.Type .. "' AND CivilizationType = '" .. civType .. "'") do
		epithetShortDesc = row.ShortDescription	
	end
	local religion = GameInfo.Religions[player:GetStateReligion()]
	if religion then
		for row in GameInfo.JFD_Epithet_ReligionTitles("EpithetType = '" .. epithet.Type .. "' AND ReligionType = '" .. religion.Type .. "'") do
			epithetShortDesc = row.ShortDescription	
		end
	end
	return epithetShortDesc, epithet.Description
end
--=======================================================================================================================
--=======================================================================================================================