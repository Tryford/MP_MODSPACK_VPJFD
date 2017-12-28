--=======================================================================================================================
-- BASE MENU ACTIONS
--=======================================================================================================================
-- Comission Pithouse
-------------------------------------------------
local L = Locale.ConvertTextKey
local iMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100)

table.insert(g_Interactions.BaseMenu, {
	OnShow =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local pMinor = Players[iMinor]
			local pPlayer = Players[iActivePlayer]

			local bIsHide = not(pMinor:IsSuzerainTrait("SUZERAINTRAIT_MINOR_CIV_SUK_MESA_VERDE")) or tInfo.War
			tInstance.InteractionButton:SetHide(bIsHide)
			if bIsHide then return end
			
			local sLabel = L("TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_MESA_VERDE_LABEL")
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
				g_Interactions.Suk_MesaVerde = {}

				for pCity in pPlayer:Cities() do
					Suk_MesaVerde_GenerateInteraction(pCity)
				end
				table.insert(g_Interactions.Suk_MesaVerde, tBackInteraction)
				--------------------------------------------------------
				--------------------------------------------------------
			end

			tInstance.InteractionLabel:SetText(sLabel)
			tInstance.InteractionButton:SetToolTipString(L("TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_MESA_VERDE_TT"))
		end,

	OnClick =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local pMinor = Players[iMinor]
			local pPlayer = Players[iActivePlayer]		

			if (pMinor:GetAlly() ~= iActivePlayer or not(pPlayer:GetCapitalCity())) then return end
			g_CurrentMenu = "Suk_MesaVerde"
			OnDisplay()
		end,
		
	ID = "Suk_MesaVerde"

	}
)


function Suk_MesaVerde_GenerateInteraction(pCity)

	local iPlayer = pCity:GetOwner()
	local pPlayer = Players[iPlayer]
	local iCost = math.ceil(iMod * 300)
	local iBuilding = GameInfoTypes.BUILDING_MINOR_CIV_SUK_MESA_VERDE
	if iCost < 1 then return end
	if pCity:IsHasBuilding(iBuilding) then return end

	local tInteraction = {
		OnShow =
			function (tInstance, iMinor, iActivePlayer, tInfo)
				local pPlayer = Players[iActivePlayer]
				local sLabel = L("TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_MESA_VERDE_LABEL2", pCity:GetName(), iCost)
				local sTT = L("TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_MESA_VERDE_TT")

				if (pPlayer:GetGold() < iCost) then
					sLabel = "[COLOR_WARNING_TEXT]" .. sLabel .. "[ENDCOLOR]"
				end

				tInstance.InteractionLabel:SetText(sLabel)
				tInstance.InteractionLabel:SetToolTipString(sTT)
			end,

		OnClick =
			function (tInstance, iMinor, iActivePlayer, tInfo)

				local pPlayer = Players[iActivePlayer]
				if not(pPlayer:GetGold() < iCost) then

					pPlayer:ChangeGold(-iCost)
					pCity:SetNumRealBuilding(iBuilding, 1)
					pCity:ChangePopulation(1, true)
					
					g_CurrentMenu = "BaseMenu"
					OnDisplay()
				end

			end,
	}

	table.insert(g_Interactions.Suk_MesaVerde, tInteraction)
end
--=======================================================================================================================
--=======================================================================================================================