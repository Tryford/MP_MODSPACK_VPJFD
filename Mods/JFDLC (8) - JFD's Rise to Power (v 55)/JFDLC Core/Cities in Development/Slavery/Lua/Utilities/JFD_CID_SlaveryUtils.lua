-- JFD_CID_SlaveryUtils
-- Author: JFD
-- DateCreated: 11/3/2015 8:25:50 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFDLCUtils.lua");
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
local defineCIDSlaveryMaxPerEncampment	= GameDefines["JFD_CID_SLAVERY_MAX_FROM_ENCAMPMENT"]
local defineCIDSlaveryMinPerEncampment	= GameDefines["JFD_CID_SLAVERY_MIN_FROM_ENCAMPMENT"]
local defineCIDSlaveryPerCSTradeRoute	= GameDefines["JFD_CID_SLAVERY_FROM_CS_TRADE_ROUTE"]
local defineCIDSlaveryPerTradeRoute	    = GameDefines["JFD_CID_SLAVERY_FROM_TRADE_ROUTE"]
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local resourceShacklesID				= GameInfoTypes["RESOURCE_JFD_SHACKLES"]
------------------------------------------------------------------------------------------------------------------------
-- SLAVERY
------------------------------------------------------------------------------------------------------------------------
--Player:ChangeNumShackles
function Player.ChangeNumShackles(player, num)
	player:ChangeNumResourceTotal(resourceShacklesID, num)
end	

--Player:GetNumShackles
function Player.GetNumShackles(player)
	return player:GetNumResourceAvailable(resourceShacklesID, true) or 0
end	

--Player:GetNumShacklesFromCity
function Player.GetNumShacklesFromCity(player, city)
	local numShackles = city:GetPopulation()
	for row in GameInfo.Belief_JFD_SlaveryMods("CaptureMod <> 0") do
		if player:HasBelief(GameInfoTypes[row.BeliefType]) then
			numShackles = numShackles + ((numShackles*row.CaptureMod)/100) 
		end
	end
	for row in GameInfo.Building_JFD_SlaveryMods("CaptureMod <> 0") do
		if (((not row.IsLocal) and player:HasBuilding(GameInfoTypes[row.BuildingType])) or city:HasBuilding(GameInfoTypes[row.BuildingType])) then
			numShackles = numShackles + ((numShackles*row.CaptureMod)/100) 
		end
	end
	for row in GameInfo.Policy_JFD_SlaveryMods("CaptureMod <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			numShackles = numShackles + ((numShackles*row.CaptureMod)/100) 
		end
	end
	for row in GameInfo.JFD_Reform_SlaveryMods("CaptureMod <> 0") do
		if player:HasReform(GameInfoTypes[row.ReformType]) then
			numShackles = numShackles + ((numShackles*row.CaptureMod)/100) 
		end
	end
	for row in GameInfo.Trait_JFD_SlaveryMods("CaptureMod <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			numShackles = numShackles + ((numShackles*row.CaptureMod)/100) 
		end
	end
	return Game.GetRound(numShackles)
end

--Player:GetNumShacklesFromTradeRoute
-- local minorTraitMilitaristicID = MinorCivTraitTypes["MINOR_CIV_TRAIT_MILITARISTIC"]
function Player.GetNumShacklesFromTradeRoute(player, city, tradeRoute)
	if tradeRoute then 
		player = Players[tradeRoute.ToID]
		city = tradeRoute.ToCity
	end
	local numShackles = 0
	if city:IsOccupied() then
		numShackles = numShackles + (city:GetPopulation()*defineCIDSlaveryPerTradeRoute)
	-- elseif (player:GetMinorCivTrait() == minorTraitMilitaristicID) then
		-- numShackles = numShackles + (city:GetPopulation()*defineCIDSlaveryPerCSTradeRoute)
	end
	for row in GameInfo.Belief_JFD_SlaveryMods("TradeRouteMod <> 0") do
		if player:HasBelief(GameInfoTypes[row.BeliefType]) then
			numShackles = numShackles + ((numShackles*row.TradeRouteMod)/100) 
		end
	end
	for row in GameInfo.Building_JFD_SlaveryMods("TradeRouteMod <> 0") do
		if (((not row.IsLocal) and player:HasBuilding(GameInfoTypes[row.BuildingType])) or city:HasBuilding(GameInfoTypes[row.BuildingType])) then
			numShackles = numShackles + ((numShackles*row.TradeRouteMod)/100) 
		end
	end
	for row in GameInfo.Policy_JFD_SlaveryMods("TradeRouteMod <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			numShackles = numShackles + ((numShackles*row.TradeRouteMod)/100) 
		end
	end
	for row in GameInfo.JFD_Reform_SlaveryMods("TradeRouteMod <> 0") do
		if player:HasReform(GameInfoTypes[row.ReformType]) then
			numShackles = numShackles + ((numShackles*row.TradeRouteMod)/100) 
		end
	end
	for row in GameInfo.Trait_JFD_SlaveryMods("TradeRouteMod <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			numShackles = numShackles + ((numShackles*row.TradeRouteMod)/100) 
		end
	end
	return Game.GetRound(numShackles)
end

--Player:GetNumShacklesFromBarbarianCampCleared
function Player.GetNumShacklesFromBarbarianCampCleared(player)
	if (not player:CanPurchaseSlaves()) then return 0 end
	local isAllowsBarbarianCampShackles = false
	for row in GameInfo.Policies("AllowsBarbarianCampShackles = 1") do
		if player:HasPolicy(row.ID) then 
			isAllowsBarbarianCampShackles = true
			break
		end
	end	
	if (not isAllowsBarbarianCampShackles) then return 0 end
	local numShackles = Game.GetRandom(defineCIDSlaveryMinPerEncampment,defineCIDSlaveryMaxPerEncampment)
	for row in GameInfo.Belief_JFD_SlaveryMods("EncampmentMod <> 0") do
		if player:HasBelief(GameInfoTypes[row.BeliefType]) then
			numShackles = numShackles + ((numShackles*row.EncampmentMod)/100) 
		end
	end
	for row in GameInfo.Building_JFD_SlaveryMods("EncampmentMod <> 0") do
		if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
			numShackles = numShackles + ((numShackles*row.EncampmentMod)/100) 
		end
	end
	for row in GameInfo.Policy_JFD_SlaveryMods("EncampmentMod <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			numShackles = numShackles + ((numShackles*row.EncampmentMod)/100) 
		end
	end
	for row in GameInfo.JFD_Reform_SlaveryMods("EncampmentMod <> 0") do
		if player:HasReform(GameInfoTypes[row.ReformType]) then
			numShackles = numShackles + ((numShackles*row.EncampmentMod)/100) 
		end
	end
	for row in GameInfo.Trait_JFD_SlaveryMods("EncampmentMod <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			numShackles = numShackles + ((numShackles*row.EncampmentMod)/100) 
		end
	end
	return Game.GetRound(numShackles)
end
--------------------
-- SLAVES
--------------------
--Player:CanPurchaseSlaves
local resolutionSlaveryID = GameInfoTypes["RESOLUTION_JFD_SLAVERY"]
function Player.CanPurchaseSlaves(player)
	local flavourSlavery = player:GetFlavorValue("FLAVOR_JFD_SLAVERY")
	if (not player:IsHuman()) then
		return (player:GetFlavorValue("FLAVOR_JFD_SLAVERY") ~= 0)
	end
	if (resolutionSlaveryID and Game) then
		return (not Game.IsResolutionPassed(resolutionSlaveryID, -1))
	end
	return true
end

--Player:GetUnitShackleCost
function Player.GetUnitShackleCost(player, unitID)
	local unit = GameInfo.Units[unitID]
	if (not unit) then return 0 end
	local shackleCost = unit.ShackleCost
	local shackleCostPerEra = unit.ShackleCostPerEra
	if shackleCostPerEra > 0 then shackleCost = shackleCost + (shackleCostPerEra*player:GetCurrentEra()) end
	for row in GameInfo.Belief_JFD_SlaveryMods("ShackleCostMod <> 0") do
		if player:HasBelief(GameInfoTypes[row.BeliefType]) then
			shackleCost = shackleCost + ((shackleCost*row.ShackleCostMod)/100) 
		end
	end
	for row in GameInfo.Building_JFD_SlaveryMods("ShackleCostMod <> 0") do
		if (((not row.IsLocal) and player:HasBuilding(GameInfoTypes[row.BuildingType])) or city:HasBuilding(GameInfoTypes[row.BuildingType])) then
			shackleCost = shackleCost + ((shackleCost*row.ShackleCostMod)/100) 
		end
	end
	for row in GameInfo.Policy_JFD_SlaveryMods("ShackleCostMod <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			shackleCost = shackleCost + ((shackleCost*row.ShackleCostMod)/100) 
		end
	end
	for row in GameInfo.JFD_Reform_SlaveryMods("ShackleCostMod <> 0") do
		if player:HasReform(GameInfoTypes[row.ReformType]) then
			shackleCost = shackleCost + ((shackleCost*row.ShackleCostMod)/100) 
		end
	end
	for row in GameInfo.Trait_JFD_SlaveryMods("ShackleCostMod <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			shackleCost = shackleCost + ((shackleCost*row.ShackleCostMod)/100) 
		end
	end
	return Game.GetRound(shackleCost)
end

--Player:IsUnitShacklePurchaseOnly
local reformLabourEmancipatedID = GameInfoTypes["REFORM_JFD_LABOUR_EMANCIPATED"]
function Player.IsUnitShacklePurchaseOnly(player, unitID)
	local unit = GameInfo.Units[unitID]
	if unit.IsPurchaseOnlySlave then
		return (not player:HasReform(reformLabourEmancipatedID))
	end
	return false
end
--------------------
-- TEXT
--------------------
--Player:GetEnslavementTT
function Player.GetEnslavementTT(player, city, numUnhappiness)
	local numSlaves, numPop = player:GetNumShacklesFromCity(city) 
	local plot = Map.GetPlot(city:GetX(), city:GetY())
	return Locale.ConvertTextKey("TXT_KEY_POPUP_JFD_ENSLAVE_CITY_TT_ANNEX", numSlaves, numPop, numPop, numUnhappiness)
end
--=======================================================================================================================
--=======================================================================================================================