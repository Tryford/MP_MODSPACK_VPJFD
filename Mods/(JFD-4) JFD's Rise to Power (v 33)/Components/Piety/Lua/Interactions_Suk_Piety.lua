--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_PietyUtils.lua")
--=======================================================================================================================
-- BASE MENU ACTIONS
--=======================================================================================================================
-- Grant Indulgences
-------------------------------------------------
local convertTextKey = Locale.ConvertTextKey

table.insert(g_Interactions.BaseMenu, {
	OnShow =
		function (tInstance, minorID, playerID, tInfo)
			local player = Players[playerID]
			local minorPlayer = Players[minorID]
			local text = nil
			local toolTip = nil
			local isHide = true
			local isDisabled = true
			if player:HasStateReligion() then
				local stateReligionID = player:GetStateReligion()
				local minorStateReligionID = minorPlayer:GetStateReligion()
				if (minorStateReligionID > 0 and (stateReligionID == minorStateReligionID and playerID == Game.GetFounder(stateReligionID,-1))) and (not tInfo.War) then
					text = convertTextKey("TXT_KEY_JFD_SHOW_PIETY_GIFTS_BUTTON")
					toolTip = convertTextKey("TXT_KEY_JFD_SHOW_PIETY_GIFTS_BUTTON_TT", GameInfo.Religions[stateReligionID].IconString, Game.GetReligionName(stateReligionID))
					isDisabled = false
				else
					text = "[COLOR_WARNING_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_JFD_SHOW_PIETY_GIFTS_BUTTON") .. "[ENDCOLOR]"
					toolTip = convertTextKey("TXT_KEY_JFD_SHOW_PIETY_GIFTS_BUTTON_TT", GameInfo.Religions[stateReligionID].IconString, Game.GetReligionName(stateReligionID))
				end
				isHide = false
			end
			tInstance.InteractionLabel:SetText(text)
			tInstance.InteractionButton:SetToolTipString(toolTip)
			tInstance.InteractionButton:SetHide(isHide)
			tInstance.InteractionButton:SetDisabled(isDisabled)
		end,

	OnClick =
		function (tInstance, minorID, playerID, tInfo)
			g_CurrentMenu = "GiveMenu_Piety"
			OnDisplay()
		end,
		
	ID = "GiveMenu_Piety"

	}
)
--=======================================================================================================================
-- GIVE MENU ACTIONS
--=======================================================================================================================

g_Interactions.GiveMenu_Piety = {}


local iMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].GoldGiftMod)/100)
local mathCeil = math.ceil
local pietyGiftLarge 		= GameDefines["MINOR_JFD_PIETY_GIFT_LARGE"]
local pietyGiftLargeReward 	= GameDefines["MINOR_JFD_PIETY_GIFT_LARGE_REWARD"]
local pietyGiftMedium 		= GameDefines["MINOR_JFD_PIETY_GIFT_MEDIUM"]
local pietyGiftMediumReward = GameDefines["MINOR_JFD_PIETY_GIFT_MEDIUM_REWARD"]
local pietyGiftSmall 		= GameDefines["MINOR_JFD_PIETY_GIFT_SMALL"]
local pietyGiftSmallReward 	= GameDefines["MINOR_JFD_PIETY_GIFT_SMALL_REWARD"]
if pietyGiftLarge then
	pietyGiftLarge 			= mathCeil(pietyGiftLarge*iMod)
	pietyGiftLargeReward 	= mathCeil(pietyGiftLargeReward*iMod)
	pietyGiftMedium 		= mathCeil(pietyGiftMedium*iMod)
	pietyGiftMediumReward 	= mathCeil(pietyGiftMediumReward*iMod)
	pietyGiftSmall 			= mathCeil(pietyGiftSmall*iMod)
	pietyGiftSmallReward 	= mathCeil(pietyGiftSmallReward*iMod)
end

local thresholdAllies  = GameDefines["FRIENDSHIP_THRESHOLD_ALLIES"]
local thresholdFriends = GameDefines["FRIENDSHIP_THRESHOLD_FRIENDS"]
-------------------------------------------------
-- Small Gift
-------------------------------------------------
table.insert(g_Interactions.GiveMenu_Piety, {
	OnShow =
		function (tInstance, minorID, playerID, tInfo)
			local player = Players[playerID]
			local minorPlayer = Players[minorID]
			local influence = minorPlayer:GetMinorCivFriendshipWithMajor(playerID)
			local piety = player:GetPiety()
			local isDisabled = (piety < pietyGiftSmall)
			local text = convertTextKey("TXT_KEY_JFD_PIETY_GIFT_SMALL", pietyGiftSmall, pietyGiftSmallReward)
			local toolTip = convertTextKey("TXT_KEY_JFD_PIETY_GIFT_STATUS_TT", thresholdFriends, thresholdAllies, influence) .. "[NEWLINE][NEWLINE]" .. convertTextKey("TXT_KEY_JFD_PIETY_GIFT_TT")
			if isDisabled then text = "[COLOR_WARNING_TEXT]" .. text .. "[ENDCOLOR]" end
			tInstance.InteractionLabel:SetText(text)
			tInstance.InteractionButton:SetToolTipString(toolTip)
			tInstance.InteractionAnim:SetHide(isDisabled)
		end,

	OnClick =
		function (tInstance, minorID, playerID, tInfo)
			local player = Players[playerID]
			local minorPlayer = Players[minorID]
			local piety = player:GetPiety()
			if piety >= pietyGiftSmall then
				player:ChangePiety(-pietyGiftSmall)
				Events.AudioPlay2DSound("AS2D_INTERFACE_FAITH_PURCHASE")
				minorPlayer:ChangeMinorCivFriendshipWithMajor(playerID, pietyGiftSmallReward)
				m_LastAction = "MESSAGE_JFD_PIETY_GIFT"
				g_CurrentMenu = "BaseMenu"
				OnDisplay()
			end

		end,
	
	}
)
-------------------------------------------------
-- Medium Gift
-------------------------------------------------
table.insert(g_Interactions.GiveMenu_Piety, {
	OnShow =
		function (tInstance, minorID, playerID, tInfo)
			local player = Players[playerID]
			local minorPlayer = Players[minorID]
			local influence = minorPlayer:GetMinorCivFriendshipWithMajor(playerID)
			local piety = player:GetPiety()
			local isDisabled = (piety < pietyGiftMedium)
			local text = convertTextKey("TXT_KEY_JFD_PIETY_GIFT_MEDIUM", pietyGiftMedium, pietyGiftMediumReward)
			local toolTip = convertTextKey("TXT_KEY_JFD_PIETY_GIFT_STATUS_TT", thresholdFriends, thresholdAllies, influence) .. "[NEWLINE][NEWLINE]" .. convertTextKey("TXT_KEY_JFD_PIETY_GIFT_TT")
			if isDisabled then text = "[COLOR_WARNING_TEXT]" .. text .. "[ENDCOLOR]" end
			tInstance.InteractionLabel:SetText(text)
			tInstance.InteractionButton:SetToolTipString(toolTip)
			tInstance.InteractionAnim:SetHide(isDisabled)
		end,

	OnClick =
		function (tInstance, minorID, playerID, tInfo)
			local player = Players[playerID]
			local minorPlayer = Players[minorID]
			local piety = player:GetPiety()
			if piety >= pietyGiftMedium then
				player:ChangePiety(-pietyGiftMedium)
				Events.AudioPlay2DSound("AS2D_INTERFACE_FAITH_PURCHASE")
				minorPlayer:ChangeMinorCivFriendshipWithMajor(playerID, pietyGiftMediumReward)
				m_LastAction = "MESSAGE_JFD_PIETY_GIFT"
				g_CurrentMenu = "BaseMenu"
				OnDisplay()
			end

		end,
	
	}
)
-------------------------------------------------
-- Large Gift
-------------------------------------------------
table.insert(g_Interactions.GiveMenu_Piety, {
	OnShow =
		function (tInstance, minorID, playerID, tInfo)
			local player = Players[playerID]
			local minorPlayer = Players[minorID]
			local influence = minorPlayer:GetMinorCivFriendshipWithMajor(playerID)
			local piety = player:GetPiety()
			local isDisabled = (piety < pietyGiftLarge)
			local text = convertTextKey("TXT_KEY_JFD_PIETY_GIFT_LARGE", pietyGiftLarge, pietyGiftLargeReward)
			local toolTip = convertTextKey("TXT_KEY_JFD_PIETY_GIFT_STATUS_TT", thresholdFriends, thresholdAllies, influence) .. "[NEWLINE][NEWLINE]" .. convertTextKey("TXT_KEY_JFD_PIETY_GIFT_TT")
			if isDisabled then text = "[COLOR_WARNING_TEXT]" .. text .. "[ENDCOLOR]" end
			tInstance.InteractionLabel:SetText(text)
			tInstance.InteractionButton:SetToolTipString(toolTip)
			tInstance.InteractionAnim:SetHide(isDisabled)
		end,

	OnClick =
		function (tInstance, minorID, playerID, tInfo)
			local player = Players[playerID]
			local minorPlayer = Players[minorID]
			local piety = player:GetPiety()
			if piety >= pietyGiftLarge then
				player:ChangePiety(-pietyGiftLarge)
				Events.AudioPlay2DSound("AS2D_INTERFACE_FAITH_PURCHASE")
				minorPlayer:ChangeMinorCivFriendshipWithMajor(playerID, pietyGiftLargeReward)
				m_LastAction = "MESSAGE_JFD_PIETY_GIFT"
				g_CurrentMenu = "BaseMenu"
				OnDisplay()
			end

		end,
	
	}
)
-------------------------------------------------
-- Back
-------------------------------------------------
table.insert(g_Interactions.GiveMenu_Piety, tBackInteraction)
--=======================================================================================================================
--=======================================================================================================================