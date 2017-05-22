-- Interactions_Suk_Claims
-- Author: Deo-e
-- DateCreated: 1/31/2017 1:32:24 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_RTP_ClaimsUtils.lua")
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingClaimsCoreClaims = JFD_GetUserSetting("JFD_RTP_CLAIMS_CORE_CLAIMS") == 1
--=======================================================================================================================
-- BASE MENU ACTIONS
--=======================================================================================================================
-- Push Claim
-------------------------------------------------
local convertTextKey = Locale.ConvertTextKey

table.insert(g_Interactions.BaseMenu, {
	OnShow =
		function (tInstance, minorID, playerID, tInfo)
			local player = Players[playerID]
			local minorPlayer = Players[minorID]
			if userSettingClaimsCoreClaims and (not player:IsAtWarWith(minorPlayerID)) then
				local minorPlayerPop = minorPlayer:GetTotalPopulation() or 0
				local iPushClaimCost = minorPlayer:GetBuyoutCost(playerID)
				local numCauses, causesTT = JFD_GetClaimCauses(playerID, minorID, true)
				local claimID = JFD_GetMinorClaimID(playerID, minorID)
				local claim = GameInfo.JFD_Claims[claimID]
				local claimDesc = convertTextKey("TXT_KEY_POP_CSTATE_JFD_PUSH_CLAIM", claim.Description)
				local claimHelpCauses = convertTextKey(claim.CausesHelp, numCauses, causesTT)
				local claimGoldCost, claimDignitaryCost, claimResistanceCost = JFD_GetClaimCost(playerID, minorID, claimID)
				local claimHelp = convertTextKey(claim.Help, claimDignitaryCost, claimGoldCost, claimResistanceCost, claimHelpCauses)
				local canPushClaim = JFD_CanPushMinorClaim(playerID, minorID, claimID)
				if (not canPushClaim) then
					tInstance.InteractionButton:SetDisabled(true)
					claimDesc = "[COLOR_WARNING_TEXT]" .. claimDesc .. "[ENDCOLOR]"
				else
					tInstance.InteractionButton:SetDisabled(false)
				end
				tInstance.InteractionButton:SetHide(false)
				tInstance.InteractionLabel:SetText(claimDesc)
				tInstance.InteractionButton:LocalizeAndSetToolTip("TXT_KEY_POP_CSTATE_JFD_PUSH_CLAIM_TT", claimHelp)
			else
				tInstance.InteractionButton:SetHide(true)
			end
		end,

	OnClick =
		function (tInstance, minorID, playerID, tInfo)
			LuaEvents.JFD_ClaimPushed(playerID, minorID)
		end,
		
	ID = "PushClaim"

	}
)
if userSettingClaimsCoreClaims then
	for _, interaction in pairs(g_Interactions.BaseMenu) do
		if interaction.ID == "AustriaUA" then
			table.remove(g_Interactions.BaseMenu, _)
		end
	end
end
--=======================================================================================================================
--=======================================================================================================================