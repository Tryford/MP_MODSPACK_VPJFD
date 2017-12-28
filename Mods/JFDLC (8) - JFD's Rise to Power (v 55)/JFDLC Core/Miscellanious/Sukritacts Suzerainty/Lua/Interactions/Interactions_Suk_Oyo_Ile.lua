--=======================================================================================================================
-- BASE MENU ACTIONS
--=======================================================================================================================
-- Purchase Resources
-------------------------------------------------
local L = Locale.ConvertTextKey
local iMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100)
local resourceDignitariesID	= GameInfoTypes["RESOURCE_JFD_DIGNITARIES"]

table.insert(g_Interactions.BaseMenu, {
	OnShow =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local pMinor = Players[iMinor]
			local pPlayer = Players[iActivePlayer]

			local bIsHide = not(pMinor:IsSuzerainTrait("SUZERAINTRAIT_MINOR_CIV_SUK_OYO_ILE")) or tInfo.War
			tInstance.InteractionButton:SetHide(bIsHide)
			if bIsHide then return end
			
			local sLabel = L("TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_OYO_ILE_LABEL")
			if (pMinor:GetAlly() ~= iActivePlayer or not(pPlayer:GetCapitalCity())) then
				sLabel = "[COLOR_WARNING_TEXT]" .. sLabel .. "[ENDCOLOR]"
				tInstance.InteractionAnim:SetHide(true)
				tInstance.InteractionButton:SetDisabled(true)
			else
				tInstance.InteractionAnim:SetHide(false)
				tInstance.InteractionButton:SetDisabled(false)
				--------------------------------------------------------
				-- Unfortunately, we have to generate the buttons here
				--------------------------------------------------------
				g_Interactions.Suk_Oyo = {}


				local tHorses = Suk_ResourceInteraction_GenerateInteraction(iActivePlayer, GameInfoTypes.RESOURCE_HORSE, 0, 300)
				if tHorses then table.insert(g_Interactions.Suk_Oyo, tHorses) end
				--print(tHorses)

				local tIron = Suk_ResourceInteraction_GenerateInteraction(iActivePlayer, GameInfoTypes.RESOURCE_IRON, 0, 300)
				--print(tIron)
				if tIron then table.insert(g_Interactions.Suk_Oyo, tIron) end

				table.insert(g_Interactions.Suk_Oyo, tBackInteraction)
				--------------------------------------------------------
				--------------------------------------------------------
			end

			tInstance.InteractionLabel:SetText(sLabel)
			tInstance.InteractionButton:SetToolTipString(L("TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_OYO_ILE_TT"))
		end,

	OnClick =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local pMinor = Players[iMinor]
			local pPlayer = Players[iActivePlayer]		

			if (pMinor:GetAlly() ~= iActivePlayer or not(pPlayer:GetCapitalCity())) then return end
			g_CurrentMenu = "Suk_Oyo"
			OnDisplay()
		end,
		
	ID = "Suk_Oyo"

	}
)

function Suk_ResourceInteraction_GenerateInteraction(iPlayer, iResourceType, iBaseCost, iCopyCost, iCopiesPerPurchase)

	local pPlayer = Players[iPlayer]
	local iCopies = pPlayer:GetNumResourceTotal(iResourceType, false) + 1

	local iCost = math.ceil((iBaseCost + (iCopies * iCopyCost)) * iMod)
	local iDignitariesCost = 1
	if iCost < 1 then return end

	local tResource = GameInfo.Resources[iResourceType]
	local sResource = tResource.IconString .. " " .. Locale.ConvertTextKey(tResource.Description)
	if not iCopiesPerPurchase then iCopiesPerPurchase = 1 end

	local tInteraction = {
		OnShow =
			function (tInstance, iMinor, iActivePlayer, tInfo)
				local pPlayer = Players[iActivePlayer]
				local sLabel = L("TXT_KEY_SUZERAINTRAIT_PURCHASE_RESOURCE", iCopiesPerPurchase, sResource, iCost, iDignitariesCost)

				if (pPlayer:GetGold() < iCost) or pPlayer:GetNumResourceAvailable(resourceDignitariesID, false) < iDignitariesCost) then
					sLabel = "[COLOR_WARNING_TEXT]" .. sLabel .. "[ENDCOLOR]"
				end

				tInstance.InteractionLabel:SetText(sLabel)
			end,

		OnClick =
			function (tInstance, iMinor, iActivePlayer, tInfo)

				local pPlayer = Players[iActivePlayer]
				if not(pPlayer:GetGold() < iCost) and not(pPlayer:GetNumResourceAvailable(resourceDignitariesID, false) < iDignitariesCost) then

					pPlayer:ChangeGold(-iCost)
					pPlayer:ChangeNumResourceTotal(resourceDignitariesID, -iDignitariesCost)
					pPlayer:ChangeNumResourceTotal(iResourceType, iCopiesPerPurchase)
					
					g_CurrentMenu = "BaseMenu"
					OnDisplay()
				end

			end,
	}

	return tInteraction
end