-- JFD_CID_InvestmentsUtils
-- Author: JFD
-- DateCreated: 2/20/2016 6:37:35 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFDLCUtils.lua");
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
local defineInvestmentBuildingBaseline = GameDefines["BALANCE_BUILDING_INVESTMENT_BASELINE"]
local defineInvestmentUnitBaseline     = GameDefines["BALANCE_UNIT_INVESTMENT_BASELINE"]
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- INVESTMENTS
------------------------------------------------------------------------------------------------------------------------
--Player:GetInvestmentValue
function Player.GetInvestmentValue(player, isBuilding, isWonder, isUnit)
	local investmentValue = defineInvestmentBuildingBaseline
	investmentValue = (investmentValue*-1)
	if isUnit   then investmentValue = defineInvestmentUnitBaseline end
	if isWonder then investmentValue = (investmentValue/2) 			end
	for row in GameInfo.Policies("InvestmentModifier <> 0") do
		local investmentMod = row.InvestmentModifier*-1
		if player:HasPolicy(row.ID) then
			investmentValue = investmentValue + ((investmentValue*investmentMod)/100)
		end
	end
	return Game.GetRound(investmentValue)
end
--=======================================================================================================================
--=======================================================================================================================