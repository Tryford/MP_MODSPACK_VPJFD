-- JFD_RTP_Piety_AztecFunctions
-- Author: JFD
-- DateCreated: 10/2/2015 9:58:53 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("JFD_PietyUtils.lua")
include("JFD_RTPUtils.lua")
--==========================================================================================================================
-- USER SETTINGS
--==========================================================================================================================
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- MOD CHECKS
--------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- SACRIFICIAL CAPTIVES
----------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Piety_SacrificialCaptives_UnitPrekill
local traitAztecsID = GameInfoTypes["TRAIT_JFD_AZTECS"]
function JFD_RTP_Piety_SacrificialCaptives_UnitPrekill(playerID, unitID, unitTypeID, plotX, plotY, isDelay, killingPlayerID)
	if (playerID == -1 or killingPlayerID == -1) then return end
	if playerID == killingPlayerID then return end
	if (not isDelay) then return end
	local player = Players[killingPlayerID]
	if (not player:HasTrait(traitAztecsID)) then return end
	if (not player:HasStateReligion()) then return end
	local unit = Players[playerID]:GetUnitByID(unitID)
	local pietyReward = JFD_GetPietyYield(killingPlayerID, unit:GetLevel())
	if pietyReward > 0 then
		player:ChangePiety(pietyReward)
		if player:IsHuman() then
			local hex = ToHexFromGrid(Vector2(plotX, plotY))
			Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_JFD_PIETY]+{1_Num}[ENDCOLOR] [ICON_JFD_PIETY]", pietyReward), true)
		end
	end
end
GameEvents.UnitPrekill.Add(JFD_RTP_Piety_SacrificialCaptives_UnitPrekill)

--JFD_RTP_Piety_Aztec_SacrificialCaptives_PlayerDoTurn
local pietyLevelDevoutID = GameInfoTypes["PIETY_LEVEL_JFD_DEVOUT"]
function JFD_RTP_Piety_Aztec_SacrificialCaptives_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if (not player:HasTrait(traitAztecsID)) then return end
	if (not player:HasStateReligion()) then return end
	if JFD_GetPietyLevelID(playerID) == pietyLevelDevoutID then
		local playerCapital = player:GetCapitalCity()
		if playerCapital:GetWeLoveTheKingDayCounter() == 0 then
			playerCapital:ChangeWeLoveTheKingDayCounter(2)
		elseif playerCapital:GetWeLoveTheKingDayCounter() == 1 then
			playerCapital:ChangeWeLoveTheKingDayCounter(1)
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_RTP_Piety_Aztec_SacrificialCaptives_PlayerDoTurn)
--==========================================================================================================================
--==========================================================================================================================