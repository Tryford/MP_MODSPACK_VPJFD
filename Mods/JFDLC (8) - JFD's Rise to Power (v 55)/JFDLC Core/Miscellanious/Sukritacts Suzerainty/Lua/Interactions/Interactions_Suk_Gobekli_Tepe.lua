--=======================================================================================================================
-- BASE MENU ACTIONS
--=======================================================================================================================
-- Commission Temple
-------------------------------------------------
local L = Locale.ConvertTextKey

local tGobekli_ValidBuildings = {}
for tRow in GameInfo.Belief_BuildingClassFaithPurchase() do
	
	local tBuildingClass = GameInfo.BuildingClasses[tRow.BuildingClassType]
	if tBuildingClass then
		
		local tBuilding = GameInfo.Buildings[tBuildingClass.DefaultBuilding]
		if tBuilding then
			if (tBuilding.Cost < 0) and (tBuilding.FaithCost > 0) and (tBuilding.UnlockedByBelief == true) and (tBuilding.PrereqTech == nil) then
				table.insert(tGobekli_ValidBuildings, tRow.BuildingClassType)
			end
		end
	end
end

table.insert(tGobekli_ValidBuildings, "BUILDINGCLASS_SHRINE")
table.insert(tGobekli_ValidBuildings, "BUILDINGCLASS_TEMPLE")
table.insert(tGobekli_ValidBuildings, "BUILDINGCLASS_MONASTERY")

local resourceDignitariesID	= GameInfoTypes["RESOURCE_JFD_DIGNITARIES"]
-------------------------------------------------
-- GetRandom
-------------------------------------------------
local GetRandom = function (lower, upper)
    return (Game.Rand((upper + 1) - lower, "")) + lower
end
-------------------------------------------------
-------------------------------------------------
table.insert(g_Interactions.BaseMenu, {
	OnShow =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local pMinor = Players[iMinor]
			local pPlayer = Players[iActivePlayer]

			local bIsHide = not(pMinor:IsSuzerainTrait("SUZERAINTRAIT_MINOR_CIV_SUK_GOBEKLI_TEPE")) or tInfo.War
			tInstance.InteractionButton:SetHide(bIsHide)
			if bIsHide then return end
			
			local sLabel = L("TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_GOBEKLI_TEPE_LABEL")
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
				local iCost = pPlayer:GetCapitalCity():GetBuildingFaithPurchaseCost(GameInfoTypes.BUILDING_CATHEDRAL)
				local iDignitariesCost = 1
				g_Interactions.Suk_Gobekli = {}
				
				for pCity in pPlayer:Cities() do
					Suk_Gobekli_GenerateInteraction(pCity, iCost, iDignitariesCost)
				end
				table.insert(g_Interactions.Suk_Gobekli, tBackInteraction)
				--------------------------------------------------------
				--------------------------------------------------------
			end

			tInstance.InteractionLabel:SetText(sLabel)
		end,

	OnClick =
		function (tInstance, iMinor, iActivePlayer, tInfo)

			local pMinor = Players[iMinor]
			local pPlayer = Players[iActivePlayer]		

			if (pMinor:GetAlly() ~= iActivePlayer or not(pPlayer:GetCapitalCity())) then return end
			g_CurrentMenu = "Suk_Gobekli"
			OnDisplay()
		end,
		
	ID = "Suk_Gobekli"

	}
)

function Suk_Gobekli_GenerateInteraction(pCity, iCost, iDignitariesCost)

	local iPlayer = pCity:GetOwner()
	local pPlayer = Players[iPlayer]
	local sCity = pCity:GetName()
	local tBuildings = {}
	local sBuildings = ""

	for _,sBuildingClass in pairs(tGobekli_ValidBuildings) do
		local iBuilding =  pPlayer:GetSpecificBuildingType(sBuildingClass)

		if not(pCity:IsHasBuilding(iBuilding)) then
			local tBuilding = GameInfo.Buildings[iBuilding]

			table.insert(tBuildings, iBuilding)
			sBuildings = sBuildings .. "[NEWLINE][ICON_BULLET]" .. L(tBuilding.Description)
		end
	end

	local tInteraction = {
		OnShow =
			function (tInstance, iMinor, iActivePlayer, tInfo)
				local pPlayer = Players[iActivePlayer]
				local sLabel = L("TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_GOBEKLI_TEPE_BUY", sCity, iCost, iDignitariesCost)

				if (pPlayer:GetFaith() < iCost or pPlayer:GetNumResourceAvailable(resourceDignitariesID, false) < iDignitariesCost) then
					sLabel = "[COLOR_WARNING_TEXT]" .. sLabel .. "[ENDCOLOR]"
				end

				tInstance.InteractionLabel:SetText(sLabel)
				tInstance.InteractionButton:SetToolTipString(L("TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_GOBEKLI_TEPE_TT", sCity, sBuildings))
			end,

		OnClick =
			function (tInstance, iMinor, iActivePlayer, tInfo)

				local pPlayer = Players[iActivePlayer]
				if not(pPlayer:GetFaith() < iCost) and not(pPlayer:GetNumResourceAvailable(resourceDignitariesID, false) < iDignitariesCost) then

					pPlayer:ChangeFaith(-iCost)
					pPlayer:ChangeNumResourceTotal(resourceDignitariesID, -iDignitariesCost)
					local iBuilding = tBuildings[GetRandom(1, #tBuildings)]
					local tBuilding = GameInfo.Buildings[iBuilding]
					local sBuilding = L(tBuilding.Description)

					pCity:SetNumRealBuilding(iBuilding, 1) 
					if iPlayer == Game.GetActivePlayer() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L('TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_GOBEKLI_TEPE_NOTIFICATION_DESC', sBuilding, sCity), L('TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_GOBEKLI_TEPE_NOTIFICATION', sBuilding));	
					end

					g_CurrentMenu = "BaseMenu"
					OnDisplay()
				end

			end,
	}

	table.insert(g_Interactions.Suk_Gobekli, tInteraction)
end
--=======================================================================================================================
--=======================================================================================================================