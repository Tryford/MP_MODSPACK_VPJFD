-- JFD_CID_SlaveryUtils
-- Author: JFD
-- DateCreated: 11/3/2015 8:25:50 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_CIDUtilities.lua");
include("JFD_CID_ColoniesUtils.lua")
include("JFD_CID_HappinessUtils.lua")
include("JFD_RTP_SovereigntyUtils.lua")
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
local defineSlaveryPerCSTradeRoute	    = GameDefines["JFD_CID_SLAVERY_FROM_CS_TRADE_ROUTE"]
local defineSlaveryPerTradeRoute	    = GameDefines["JFD_CID_SLAVERY_FROM_TRADE_ROUTE"]
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingColoniesCore			= JFD_GetUserSetting("JFD_CID_COLONIES_CORE") == 1
local userSettingHappinessCore			= JFD_GetUserSetting("JFD_CID_HAPPINESS_CORE") == 1
local userSettingLoyaltyCore			= JFD_GetUserSetting("JFD_CID_LOYALTY_CORE") == 1
local userSettingSlaveryCore			= JFD_GetUserSetting("JFD_CID_SLAVERY_CORE") == 1
local userSettingSlaveryCoreEnslavement	= JFD_GetUserSetting("JFD_CID_SLAVERY_CORE_ENSLAVEMENT") == 1
local userSettingSovereigntyCore		= JFD_GetUserSetting("JFD_RTP_SOVEREIGNTY_CORE") == 1
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local resourceShacklesID = GameInfoTypes["RESOURCE_JFD_SHACKLES"]
------------------------------------------------------------------------------------------------------------------------
-- SLAVERY
------------------------------------------------------------------------------------------------------------------------
--JFD_DoEnslaveCity
function JFD_DoEnslaveCity(playerID, city)
	local numSlaves, numPop, numResistanceTurns = JFD_GetNumShacklesFromCity(playerID, city) 
	JFD_ChangeNumShackles(playerID, numSlaves)
	city:ChangePopulation(-numPop, true)
	if userSettingHappinessCore then
		city:ChangeResistanceTurns(numResistanceTurns)
	end
end
--------------------
-- SHACKLES
--------------------
--JFD_ChangeNumShackles
function JFD_ChangeNumShackles(playerID, change)
	Players[playerID]:ChangeNumResourceTotal(resourceShacklesID, change)
end

--JFD_GetNumShackles
function JFD_GetNumShackles(playerID)
	if (not playerID) then return 0 end
	return Players[playerID]:GetNumResourceAvailable(resourceShacklesID, true)
end
--------------------
-- MODS
--------------------
--JFD_GetShacklesMod
function JFD_GetShacklesMod(playerID, query)
	if (not query) then return end
	local player = Players[playerID]
	local numSlavesMod = 0
	local queries = {}
	for row in GameInfo.Belief_JFD_SlaveryMods(query .. " <> 0") do
		if player:HasBelief(GameInfoTypes[row.BeliefType]) then
			queries["CaptureMod"]			= row.CaptureMod
			queries["CivilianCaptureMod"]	= row.CivilianCaptureMod
			queries["EncampmentMod"]		= row.EncampmentMod
			queries["FreeExperience"]		= row.FreeExperience
			queries["MaxHPChange"]			= row.MaxHPChange
			queries["TradeRouteMod"]		= row.TradeRouteMod
			queries["ShackleCostMod"]		= row.ShackleCostMod
			numSlavesMod = numSlavesMod		+ queries[query]
		end
	end
	for row in GameInfo.Building_JFD_SlaveryMods(query .. " <> 0") do
		if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
			queries["CaptureMod"]			= row.CaptureMod
			queries["CivilianCaptureMod"]	= row.CivilianCaptureMod
			queries["EncampmentMod"]		= row.EncampmentMod
			queries["FreeExperience"]		= row.FreeExperience
			queries["MaxHPChange"]			= row.MaxHPChange
			queries["TradeRouteMod"]		= row.TradeRouteMod
			queries["ShackleCostMod"]		= row.ShackleCostMod
			numSlavesMod = numSlavesMod		+ queries[query]
		end
	end
	for row in GameInfo.Policy_JFD_SlaveryMods(query .. " <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			queries["CaptureMod"]			= row.CaptureMod
			queries["CivilianCaptureMod"]	= row.CivilianCaptureMod
			queries["EncampmentMod"]		= row.EncampmentMod
			queries["FreeExperience"]		= row.FreeExperience
			queries["MaxHPChange"]			= row.MaxHPChange
			queries["TradeRouteMod"]		= row.TradeRouteMod
			queries["ShackleCostMod"]		= row.ShackleCostMod
			numSlavesMod = numSlavesMod		+ queries[query]
		end
	end
	for row in GameInfo.JFD_Reform_SlaveryMods(query .. " <> 0") do
		if JFD_HasReform(playerID, GameInfoTypes[row.ReformType]) then
			queries["CaptureMod"]			= row.CaptureMod
			queries["CivilianCaptureMod"]	= row.CivilianCaptureMod
			queries["EncampmentMod"]		= row.EncampmentMod
			queries["FreeExperience"]		= row.FreeExperience
			queries["MaxHPChange"]			= row.MaxHPChange
			queries["TradeRouteMod"]		= row.TradeRouteMod
			queries["ShackleCostMod"]		= row.ShackleCostMod
			numSlavesMod = numSlavesMod		+ queries[query]
		end
	end
	for row in GameInfo.Trait_JFD_SlaveryMods(query .. " <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			queries["CaptureMod"]			= row.CaptureMod
			queries["CivilianCaptureMod"]	= row.CivilianCaptureMod
			queries["EncampmentMod"]		= row.EncampmentMod
			queries["FreeExperience"]		= row.FreeExperience
			queries["MaxHPChange"]			= row.MaxHPChange
			queries["TradeRouteMod"]		= row.TradeRouteMod
			queries["ShackleCostMod"]		= row.ShackleCostMod
			numSlavesMod = numSlavesMod		+ queries[query]
		end
	end
	return numSlavesMod
end
--------------------
-- SOURCES
--------------------
--JFD_GetNumShacklesFromCity
function JFD_GetNumShacklesFromCity(playerID, city)
	local player = Players[playerID]
	local cityPop = city:GetPopulation()
	local numShackles = cityPop
	local numShacklesMod = JFD_GetShacklesMod(playerID, "CaptureMod")
	numShackles = numShackles + ((numShackles*numShacklesMod)/100)
	numShackles = JFD_Round(numShackles)
	local numResistanceTurns = cityPop
	return JFD_Round(numShackles), JFD_Round((cityPop*33)/100), numResistanceTurns
end

--JFD_GetNumShacklesFromTradeRoute
local minorTraitMilitaristicID = MinorCivTraitTypes["MINOR_CIV_TRAIT_MILITARISTIC"]
function JFD_GetNumShacklesFromTradeRoute(tradeRoute, playerID, city)
	local player = Players[playerID]
	local city   = city
	if tradeRoute then 
		player = Players[tradeRoute.ToID]
		city   = tradeRoute.ToCity
	end
	local numShackles = 0
	if (city:IsPuppet() or city:IsOccupied()) then
		numShackles = numShackles + (city:GetPopulation()*defineSlaveryPerTradeRoute)
	elseif player:GetMinorCivTrait() == minorTraitMilitaristicID then
		numShackles = numShackles + (city:GetPopulation()*defineSlaveryPerCSTradeRoute)
	end
	return JFD_Round(numShackles)
end
--------------------
-- SLAVES
--------------------
--JFD_CanPurchaseSlaves
local resolutionSlaveryID = GameInfoTypes["RESOLUTION_JFD_SLAVERY"]
function JFD_CanPurchaseSlaves(playerID)
	local player = Players[playerID]
	if ((not player:IsHuman()) and JFD_GetLeaderFlavour(playerID, "FLAVOR_JFD_SLAVERY") == 0) then 
		return false 
	end
	if (resolutionSlaveryID and Game.IsResolutionPassed(resolutionSlaveryID, -1)) then
		return false
	end
	return true
end

--JFD_GetShackleCost
function JFD_GetShackleCost(playerID, unitID)
	local player = Players[playerID]
	if (not player) then return end
	local shackleCost = 0
	if unitID then 
		local unit = GameInfo.Units[unitID]
		if unit then shackleCost = unit.ShackleCost  + (unit.ShackleCostPerEra*player:GetCurrentEra()) end 
	end
	local shackleCostMod = JFD_GetShacklesMod(playerID, "ShackleCostMod")
	if shackleCostMod ~= 0 then 
		shackleCost = shackleCost + ((shackleCost*shackleCostMod)/100) 
	end
	return JFD_Round(shackleCost)
end

--JFD_IsPurchaseOnlySlave
local reformLabourEmancipatedID = GameInfoTypes["REFORM_JFD_LABOUR_EMANCIPATED"]
function JFD_IsPurchaseOnlySlave(playerID, unit)
	if unit.IsPurchaseOnlySlave then
		if userSettingSovereigntyCore then
			if JFD_HasReform(playerID, reformLabourEmancipatedID) then return false end
		end
		return true
	end
	return false
end
--------------------
-- TEXT
--------------------
--JFD_GetEnslaveTT
function JFD_GetEnslaveTT(playerID, city)
	local player = Players[playerID]
	local numSlaves, numPop, numResistance = JFD_GetNumShacklesFromCity(playerID, city) 
	local plot = Map.GetPlot(city:GetX(), city:GetY())
	if (userSettingColoniesCore and JFD_IsPlotFoundsColony(playerID, plot, true)) then
		return Locale.ConvertTextKey("TXT_KEY_POPUP_JFD_ENSLAVE_CITY_TT", numSlaves, numPop, numResistance, "TXT_KEY_POPUP_JFD_ENSLAVE_CITY_TT_COLONIZE")
	else
		return Locale.ConvertTextKey("TXT_KEY_POPUP_JFD_ENSLAVE_CITY_TT", numSlaves, numPop, numResistance, "TXT_KEY_POPUP_JFD_ENSLAVE_CITY_TT_ANNEX")
	end
end
--=======================================================================================================================
--=======================================================================================================================