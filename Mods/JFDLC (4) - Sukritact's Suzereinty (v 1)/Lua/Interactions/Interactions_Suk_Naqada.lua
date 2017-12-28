--=======================================================================================================================
-- BASE MENU ACTIONS
--=======================================================================================================================
-- Comission Pithouse
-------------------------------------------------

local L = Locale.ConvertTextKey
local iMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100)
local iPurchaseCostMod = 3.7
local iBaseCost = 200
local sUnitClass = "UNITCLASS_ARCHAEOLOGIST"

table.insert(g_Interactions.BaseMenu, {
	OnShow =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local pMinor = Players[iMinor]
			local pPlayer = Players[iActivePlayer]

			local bIsHide = not(pMinor:IsSuzerainTrait("SUZERAINTRAIT_MINOR_CIV_SUK_NAQADA")) or tInfo.War
			tInstance.InteractionButton:SetHide(bIsHide)
			if bIsHide then return end

			-- Get Archaeologist Info
			local iUnit = pPlayer:GetSpecificUnitType(sUnitClass)
			local tUnit = GameInfo.Units[iUnit]
			local sUnit = L(tUnit.Description)
			local sTech = tUnit.PrereqTech
			local iCost = tUnit.Cost; if iCost < 1 then iCost = iBaseCost end
			iCost = math.ceil(iCost * iPurchaseCostMod * iMod)
			
			local bTech = (sTech == nil) or pPlayer:HasTech(GameInfoTypes[sTech])

			local sLabel = L("TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_NAQADA_BUY", sUnit, iCost)
			if (pMinor:GetAlly() ~= iActivePlayer or not(pPlayer:GetCapitalCity()) or (pPlayer:GetGold() < iCost) or not bTech) then
				sLabel = "[COLOR_WARNING_TEXT]" .. sLabel .. "[ENDCOLOR]"
				tInstance.InteractionAnim:SetHide(true)
				tInstance.InteractionButton:SetDisabled(true)
				if not bTech and not(pMinor:GetAlly() ~= iActivePlayer) then
					tInstance.InteractionButton:SetToolTipString(L("TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_NAQADA_REQUIRES_TECH", sUnit))
				end
			else
				tInstance.InteractionAnim:SetHide(false)
				tInstance.InteractionButton:SetDisabled(false)
			end

			tInstance.InteractionLabel:SetText(sLabel)
		end,

	OnClick =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local pMinor = Players[iMinor]
			local pPlayer = Players[iActivePlayer]		

			-- Get Archaeologist Info
			local iUnit = pPlayer:GetSpecificUnitType(sUnitClass)
			local tUnit = GameInfo.Units[iUnit]
			local sUnit = L(tUnit.Description)
			local sTech = tUnit.PrereqTech
			local iCost = tUnit.Cost; if iCost < 1 then iCost = iBaseCost end
			iCost = math.ceil(iCost * iPurchaseCostMod * iMod)
			
			local bTech = (sTech == nil) or pPlayer:HasTech(GameInfoTypes[sTech])
			if (pMinor:GetAlly() ~= iActivePlayer or not(pPlayer:GetCapitalCity()) or (pPlayer:GetGold() < iCost) or not bTech) then return end

			pPlayer:ChangeGold(-iCost)
			local pPlot = pPlayer:GetCapitalCity():Plot()
			local pUnit = pPlayer:InitUnit(iUnit, pPlot:GetX(), pPlot:GetY())
			pUnit:JumpToNearestValidPlot()

			OnDisplay()
		end,
		
	ID = "Suk_Naqada"

	}
)
--=======================================================================================================================
--=======================================================================================================================