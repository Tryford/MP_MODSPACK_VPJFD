-- JFD_CID_Investments_Functions
-- Author: JFD
-- DateCreated: 3/25/2016 11:25:52 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_CIDUtilities.lua")
include("JFD_CID_InvestmentUtils.lua")
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingInvestmentsCore = JFD_GetUserSetting("JFD_CID_INVESTMENTS_CORE") == 1
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
-- INVESTMENTS
------------------------------------------------------------------------------------------------------------------------
-- JFD_CID_Investments_Invested
function JFD_CID_Investments_Invested(playerID, cityID, itemClassID, value)
	local player = Players[playerID]
	local city = player:GetCityByID(cityID)
	local investmentProduction = JFD_GetInvestmentProduction(playerID, city)
	if investmentProduction > 0 then
		city:ChangeProduction(investmentProduction)
		if player:IsHuman() then
			Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(city:GetX(), city:GetY()))), Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_PRODUCTION]", investmentProduction), true)
		end
	end
end
if userSettingInvestmentsCore then
	GameEvents.CityInvestedBuilding.Add(JFD_CID_Investments_Invested)	
	GameEvents.CityInvestedUnit.Add(JFD_CID_Investments_Invested)	
end
--=======================================================================================================================
--=======================================================================================================================
