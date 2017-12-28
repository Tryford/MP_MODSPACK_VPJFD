-- GameplayUtilities.lua
-- Set of common gameplay methods used by multiple UI's and scripts.
------------------------------------------------------------------------------
--	Copyright (c) 2009-2010 Firaxis Games, Inc. All rights reserved.
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFDLCUtils.lua");
--=======================================================================================================================
--=======================================================================================================================

GameplayUtilities = {};

local userSettingRTPEpithetCore = (Game.GetUserSetting("JFD_RTP_EPITHETS_CORE") == 1)
-----------------------------------------------------
-- Returns the formal name and title of a leader.
-- This will make use of any custom names and civ descriptions
-- as well as dominant policy branches.
-----------------------------------------------------
function GameplayUtilities.GetLocalizedLeaderTitle(player)

	local playerID = player:GetID();
	local civID = player:GetCivilizationType();
	local civ = GameInfo.Civilizations[civID];
	
	local name;
	
	local nickName = player:GetNickName();
	if(nickName and #nickName > 0 and Game:IsNetworkMultiPlayer()) then
		name = nickName;
	elseif(PreGame.GetLeaderName(playerID) ~= "") then
		name = PreGame.GetLeaderName(playerID);
	else 
		local leaderID = player:GetLeaderType();
		local leaderInfo = GameInfo.Leaders[leaderID];
		name = leaderInfo.Description;
	end
	
	local civDescription;
	
	local civShortDescription = PreGame.GetCivilizationShortDescription(playerID);
	if(civShortDescription and #civShortDescription > 0) then
		civDescription = civShortDescription;
	else	
		civDescription = civ.ShortDescription;
	end
	
	-- Policy-based title
	local strInfo;
    local iDominantBranch = player:GetDominantPolicyBranchForTitle();
	if userSettingRTPEpithetCore then
		local epithetID = player:GetEpithetType()
		if epithetID then
			local epithetShortDesc = player:GetEpithetShortDescription(epithetID)
			strInfo = Locale.ConvertTextKey("TXT_KEY_LEADER_OF_CIV_EPITHET", name, epithetShortDesc, civDescription);
		else
			strInfo = Locale.ConvertTextKey("TXT_KEY_LEADER_OF_CIV", name, civDescription);
		end
	elseif (iDominantBranch ~= -1) then
		local strTitle = GameInfo.PolicyBranchTypes[iDominantBranch].Title;
		strInfo = Locale.ConvertTextKey(strTitle, name, civDescription);
	else
		strInfo = Locale.ConvertTextKey("TXT_KEY_LEADER_OF_CIV", name, civDescription);
	end
	
	return strInfo;
end