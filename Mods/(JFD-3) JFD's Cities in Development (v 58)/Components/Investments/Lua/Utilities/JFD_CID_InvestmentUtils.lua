-- JFD_CID_InvestmentUtils
-- Author: JFD
-- DateCreated: 2/20/2016 6:37:35 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_CIDUtilities.lua");
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
--JFD_GetInvestmentValue
function JFD_GetInvestmentValue(playerID, isUnit, isWonder, isUnit)
	local player = Players[playerID]
	local investmentValue = defineInvestmentBuildingBaseline
	investmentValue = (investmentValue*-1)
	if isUnit   then investmentValue = defineInvestmentUnitBaseline end
	if isWonder then investmentValue = (investmentValue/2) end
	for row in GameInfo.Policies("InvestmentModifier <> 0") do
		local investmentMod = row.InvestmentModifier*-1
		if player:HasPolicy(row.ID) then
			investmentValue = investmentValue + ((investmentValue*investmentMod)/100)
		end
	end
	return JFD_Round(investmentValue)
end
------------------------------------------------------------------------------------------------------------------------
-- INVESTMENTS: PRODUCTION
------------------------------------------------------------------------------------------------------------------------
-- JFD_GetInvestmentProduction
function JFD_GetInvestmentProduction(playerID, city)
	local player = Players[playerID]
	local currentEraID = player:GetCurrentEra()
	local investmentProduction = 0
	local isCityColony = JFD_IsCityColony(city)
	local eraModifier = 0 
	--Buildings
	for row in GameInfo.Building_JFD_InvestmentProduction() do
		if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
			if isCityColony then
				investmentProduction = investmentProduction + row.ColonyProduction
			else
				investmentProduction = investmentProduction + row.Production
			end
			eraModifier = eraModifier + row.EraModifier
		end
	end
	--Policies
	for row in GameInfo.Policy_JFD_InvestmentProduction() do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			if isCityColony then
				investmentProduction = investmentProduction + row.ColonyProduction
			else
				investmentProduction = investmentProduction + row.Production
			end
			eraModifier = eraModifier + row.EraModifier
		end
	end
	--Reforms
	for row in GameInfo.JFD_Reform_InvestmentProduction() do
		if JFD_HasReform(playerID, GameInfoTypes[row.ReformType]) then
			if isCityColony then
				investmentProduction = investmentProduction + row.ColonyProduction
			else
				investmentProduction = investmentProduction + row.Production
			end
			eraModifier = eraModifier + row.EraModifier
		end
	end
	--Traits
	for row in GameInfo.Trait_JFD_InvestmentProduction() do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			if isCityColony then
				investmentProduction = investmentProduction + row.ColonyProduction
			else
				investmentProduction = investmentProduction + row.Production
			end
			eraModifier = eraModifier + row.EraModifier
		end
	end
	if eraModifier > 0 then
		for num = 1, currentEraID do
			investmentProduction = investmentProduction + ((investmentProduction*eraModifier)/100)
		end
	end
	return JFD_Round(investmentProduction)
end
--=======================================================================================================================
--=======================================================================================================================