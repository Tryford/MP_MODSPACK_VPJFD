--=======================================================================================================================
-- BASE MENU ACTIONS
--=======================================================================================================================
-- Exert Cultural Influence
-------------------------------------------------
local L = Locale.ConvertTextKey
local resourceDignitariesID	= GameInfoTypes["RESOURCE_JFD_DIGNITARIES"]

table.insert(g_Interactions.BaseMenu, {
	OnShow =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local pPlayer = Players[iActivePlayer]
			local pMinor = Players[iMinor]

			local bHide = (not(pPlayer:IsAllyHasSuzerainTrait("SUZERAINTRAIT_MINOR_CIV_SUK_SICAN"))) or tInfo.War
			local bSican = pMinor:IsSuzerainTrait("SUZERAINTRAIT_MINOR_CIV_SUK_SICAN")
			local sText = L("TXT_KEY_MINOR_CIV_SUK_SICAN_LABEL")

			if bSican then sText = "[COLOR_WARNING_TEXT]" .. sText .. "[ENDCOLOR]" end

			tInstance.InteractionLabel:SetText(sText)
			tInstance.InteractionButton:SetToolTipString(L("TXT_KEY_MINOR_CIV_SUK_SICAN_LABEL_TT"))
			tInstance.InteractionButton:SetHide(bHide)
		end,

	OnClick =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local pMinor = Players[iMinor]
			local bSican = pMinor:IsSuzerainTrait("SUZERAINTRAIT_MINOR_CIV_SUK_SICAN")

			if not bSican then
				g_CurrentMenu = "GiveMenu_SukSican"
				OnDisplay()
			end
		end,
		
	ID = "GiveMenu_SukSican"

	}
)
--=======================================================================================================================
-- GIVE MENU ACTIONS
--=======================================================================================================================

g_Interactions.GiveMenu_SukSican = {}


local iSmallSican =  150
local iMediumSican =  300
local iLargeSican = 600

tSicanReward = {}
tSicanReward[iLargeSican] = GameDefines["MINOR_GOLD_GIFT_LARGE"]
tSicanReward[iMediumSican] = GameDefines["MINOR_GOLD_GIFT_MEDIUM"]
tSicanReward[iSmallSican] = GameDefines["MINOR_GOLD_GIFT_SMALL"]
-------------------------------------------------
-- Small Gift
-------------------------------------------------
table.insert(g_Interactions.GiveMenu_SukSican, {
	OnShow =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local pMinor = Players[iMinor]
			local pPlayer = Players[tInfo.Player]

			local iCost = iSmallSican
			local iDignitariesCost = 1
			local iCulture = pPlayer:GetJONSCulture()
			local iFriendshipAmount = pMinor:GetFriendshipFromGoldGift(tInfo.Player, tSicanReward[iCost])

			local bGiftDisabled = (iCulture < iCost) or (pPlayer:GetNumResourceAvailable(resourceDignitariesID, false) < iDignitariesCost)

			local sText = L("TXT_KEY_MINOR_CIV_SUK_SICAN_GIFT", iCost, iFriendshipAmount, iDignitariesCost)
			if bGiftDisabled then  sText = "[COLOR_WARNING_TEXT]" .. sText .. "[ENDCOLOR]" end

			tInstance.InteractionLabel:SetText(sText)
			tInstance.InteractionButton:SetToolTipString(L("TXT_KEY_MINOR_CIV_SUK_SICAN_LABEL_TT"))
			tInstance.InteractionAnim:SetHide(bGiftDisabled)
		end,

	OnClick =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local pMinor = Players[iMinor]
			local pPlayer = Players[tInfo.Player]

			local iCost = iSmallSican
			local iDignitariesCost = 1
			local iCulture = pPlayer:GetJONSCulture()
			local iFriendshipAmount = pMinor:GetFriendshipFromGoldGift(tInfo.Player, tSicanReward[iCost])



			if (iCulture >= iCost) and (pPlayer:GetNumResourceAvailable(resourceDignitariesID, false) >= iDignitariesCost) then
				pPlayer:ChangeJONSCulture(-iCost)
				pPlayer:ChangeNumResourceTotal(resourceDignitariesID, -iDignitariesCost)
				pMinor:ChangeMinorCivFriendshipWithMajor(iActivePlayer, iFriendshipAmount)
				m_LastAction = "MESSAGE_SUK_SICAN_GIFT"
				g_CurrentMenu = "BaseMenu"
				OnDisplay()
			end

		end,
	
	}
)
-------------------------------------------------
-- Medium Gift
-------------------------------------------------
table.insert(g_Interactions.GiveMenu_SukSican, {
	OnShow =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local pMinor = Players[iMinor]
			local pPlayer = Players[tInfo.Player]

			local iCost = iMediumSican
			local iDignitariesCost = 1
			local iCulture = pPlayer:GetJONSCulture()
			local iFriendshipAmount = pMinor:GetFriendshipFromGoldGift(tInfo.Player, tSicanReward[iCost])

			local bGiftDisabled = (iCulture < iCost) or (pPlayer:GetNumResourceAvailable(resourceDignitariesID, false) < iDignitariesCost)

			local sText = L("TXT_KEY_MINOR_CIV_SUK_SICAN_GIFT", iCost, iFriendshipAmount, iDignitariesCost)
			if bGiftDisabled then sText = "[COLOR_WARNING_TEXT]" .. sText .. "[ENDCOLOR]" end

			tInstance.InteractionLabel:SetText(sText)
			tInstance.InteractionButton:SetToolTipString(L("TXT_KEY_MINOR_CIV_SUK_SICAN_LABEL_TT"))
			tInstance.InteractionAnim:SetHide(bGiftDisabled)
		end,

	OnClick =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local pMinor = Players[iMinor]
			local pPlayer = Players[tInfo.Player]

			local iCost = iMediumSican
			local iCulture = pPlayer:GetJONSCulture()
			local iFriendshipAmount = pMinor:GetFriendshipFromGoldGift(tInfo.Player, tSicanReward[iCost])



			if (iCulture >= iCost) and (pPlayer:GetNumResourceAvailable(resourceDignitariesID, false) >= iDignitariesCost) then
				pPlayer:ChangeJONSCulture(-iCost)
				pPlayer:ChangeNumResourceTotal(resourceDignitariesID, -iDignitariesCost)
				pMinor:ChangeMinorCivFriendshipWithMajor(iActivePlayer, iFriendshipAmount)
				m_LastAction = "MESSAGE_SUK_SICAN_GIFT"
				g_CurrentMenu = "BaseMenu"
				OnDisplay()
			end

		end,
	
	}
)
-------------------------------------------------
-- Large Gift
-------------------------------------------------
table.insert(g_Interactions.GiveMenu_SukSican, {
	OnShow =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local pMinor = Players[iMinor]
			local pPlayer = Players[tInfo.Player]

			local iCost = iLargeSican
			local iDignitariesCost = 1
			local iCulture = pPlayer:GetJONSCulture()
			local iFriendshipAmount = pMinor:GetFriendshipFromGoldGift(tInfo.Player, tSicanReward[iCost])

			local bGiftDisabled = (iCulture < iCost) or (pPlayer:GetNumResourceAvailable(resourceDignitariesID, false) < iDignitariesCost)

			local sText = L("TXT_KEY_MINOR_CIV_SUK_SICAN_GIFT", iCost, iFriendshipAmount, iDignitariesCost)
			if bGiftDisabled then sText = "[COLOR_WARNING_TEXT]" .. sText .. "[ENDCOLOR]" end

			tInstance.InteractionLabel:SetText(sText)
			tInstance.InteractionButton:SetToolTipString(L("TXT_KEY_MINOR_CIV_SUK_SICAN_LABEL_TT"))
			tInstance.InteractionAnim:SetHide(bGiftDisabled)
		end,

	OnClick =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local pMinor = Players[iMinor]
			local pPlayer = Players[tInfo.Player]

			local iCost = iLargeSican
			local iCulture = pPlayer:GetJONSCulture()
			local iFriendshipAmount = pMinor:GetFriendshipFromGoldGift(tInfo.Player, tSicanReward[iCost])



			if (iCulture >= iCost) and (pPlayer:GetNumResourceAvailable(resourceDignitariesID, false) >= iDignitariesCost) then
				pPlayer:ChangeJONSCulture(-iCost)
				pPlayer:ChangeNumResourceTotal(resourceDignitariesID, -iDignitariesCost)
				pMinor:ChangeMinorCivFriendshipWithMajor(iActivePlayer, iFriendshipAmount)
				m_LastAction = "MESSAGE_SUK_SICAN_GIFT"
				g_CurrentMenu = "BaseMenu"
				OnDisplay()
			end

		end,
	
	}
)
-------------------------------------------------
-- Back
-------------------------------------------------
table.insert(g_Interactions.GiveMenu_SukSican, tBackInteraction)
--=======================================================================================================================
--=======================================================================================================================