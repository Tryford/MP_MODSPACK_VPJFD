--=======================================================================================================================
-- BASE MENU ACTIONS
--=======================================================================================================================
-- Request Ecclesiastical Services
-------------------------------------------------
local L = Locale.ConvertTextKey

table.insert(g_Interactions.BaseMenu, {
	OnShow =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local pMinor = Players[iMinor]
			local pPlayer = Players[iActivePlayer]

			local bIsHide = not(pMinor:IsSuzerainTrait("SUZERAINTRAIT_MINOR_CIV_SUK_AVIGNON")) or tInfo.War
			tInstance.InteractionButton:SetHide(bIsHide)
			if bIsHide then return end
			
			local sLabel = L("TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_AVIGNON_LABEL")
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
				g_Interactions.Suk_Avignon = {}

				local tReligions = Suk_Avignon_GetReligionsInEmpire(iActivePlayer)
				for iReligion,_ in pairs(tReligions) do
					Suk_Avignon_GenerateInteraction(iReligion, GameInfoTypes.UNIT_MISSIONARY, iActivePlayer)
					Suk_Avignon_GenerateInteraction(iReligion, GameInfoTypes.UNIT_INQUISITOR, iActivePlayer)
				end
				table.insert(g_Interactions.Suk_Avignon, tBackInteraction)
				--------------------------------------------------------
				--------------------------------------------------------
			end

			tInstance.InteractionLabel:SetText(sLabel)
			tInstance.InteractionButton:SetToolTipString(L("TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_AVIGNON_TT"))
		end,

	OnClick =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local pMinor = Players[iMinor]
			local pPlayer = Players[iActivePlayer]		

			if (pMinor:GetAlly() ~= iActivePlayer or not(pPlayer:GetCapitalCity())) then return end
			g_CurrentMenu = "Suk_Avignon"
			OnDisplay()
		end,
		
	ID = "Suk_Avignon"

	}
)

function Suk_Avignon_GetReligionsInEmpire(iPlayer)
	local pPlayer = Players[iPlayer]
	local tReligions = {}

	for pCity in pPlayer:Cities() do
		local iReligion = pCity:GetReligiousMajority()
		if iReligion > GameInfoTypes.RELIGION_PANTHEON then
			tReligions[iReligion] = true
		end
	end

	return tReligions
end

function Suk_Avignon_GenerateInteraction(iReligion, iUnitType, iPlayer)

	local pPlayer = Players[iPlayer]
	local iCost = pPlayer:GetCapitalCity():GetUnitFaithPurchaseCost(iUnitType, true)
	if iCost < 1 then return end

	local sUnit = L(GameInfo.Units[iUnitType].Description)
	local sReligion = Game.GetReligionName(iReligion)

	local tInteraction = {
		OnShow =
			function (tInstance, iMinor, iActivePlayer, tInfo)
				local pPlayer = Players[iActivePlayer]
				local sLabel = L("TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_AVIGNON_BUY", sUnit, sReligion, iCost)

				if (pPlayer:GetGold() < iCost) then
					sLabel = "[COLOR_WARNING_TEXT]" .. sLabel .. "[ENDCOLOR]"
				end

				tInstance.InteractionLabel:SetText(sLabel)
			end,

		OnClick =
			function (tInstance, iMinor, iActivePlayer, tInfo)

				local pPlayer = Players[iActivePlayer]
				if not(pPlayer:GetGold() < iCost) then

					pPlayer:ChangeGold(-iCost)
					local pPlot = pPlayer:GetCapitalCity():Plot()
					local pUnit = pPlayer:InitUnit(iUnitType, pPlot:GetX(), pPlot:GetY())
					pUnit:JumpToNearestValidPlot()
					if pUnit then
						pUnit:SetReligion(iReligion)
					end
					
					g_CurrentMenu = "BaseMenu"
					OnDisplay()
				end

			end,
	}

	table.insert(g_Interactions.Suk_Avignon, tInteraction)
end
--=======================================================================================================================
--=======================================================================================================================