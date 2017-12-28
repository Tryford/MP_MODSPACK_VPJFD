-- JFD_CID_Slavery_Functions
-- Author: JFD
-- DateCreated: 2/21/2016 6:54:13 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_CID_SlaveryUtils.lua")
--=======================================================================================================================
-- DEFINES
--=======================================================================================================================
local defineCIDSlaveryMaxPerCivilianCapture  = GameDefines["JFD_CID_SLAVERY_MAX_FROM_CIVILIAN_CAPTURE"]
local defineCIDSlaveryMaxPerEncampment		 = GameDefines["JFD_CID_SLAVERY_MAX_FROM_ENCAMPMENT"]
local defineCIDSlaveryMinPerCivilianCapture  = GameDefines["JFD_CID_SLAVERY_MIN_FROM_CIVILIAN_CAPTURE"]
local defineCIDSlaveryMinPerEncampment		 = GameDefines["JFD_CID_SLAVERY_MIN_FROM_ENCAMPMENT"]
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingCIDHappinessCore			 = (Game.GetUserSetting("JFD_CID_HAPPINESS_CORE") == 1)
local userSettingCIDSlaveryCore			     = (Game.GetUserSetting("JFD_CID_SLAVERY_CORE") == 1)
local userSettingCIDSlaveryCoreEnslavement	 = (Game.GetUserSetting("JFD_CID_SLAVERY_CORE_ENSLAVEMENT") == 1)
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local promotionEnslavedID = GameInfoTypes["PROMOTION_JFD_ENSLAVED"]
local unitSlaveWorkerID   = GameInfoTypes["UNIT_JFD_SLAVE"]
--=======================================================================================================================
-- AI FUNCTIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- SLAVERY
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Slavery_CityCapturedAI
function JFD_CID_Slavery_CityCapturedAI(oldOwnerID, capital, plotX, plotY, newOwnerID, population, isConquest)
	local player = Players[newOwnerID]
	if player:IsHuman() then return end
	local city = Map.GetPlot(plotX, plotY):GetPlotCity()
	if (not city) then return end
	if (not player:CanPurchaseSlaves()) then return end
	local numShackles = player:GetNumShacklesFromCity(city)
	player:ChangeNumShackles(numShackles)
	local flavourSlavery = player:GetFlavorValue("FLAVOR_JFD_SLAVERY")
	if Game.GetRandom(1,100) < (flavourSlavery*10) then return end
	local unitID = GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")
	unitID = player:GetSpecificUnitType(GameInfo.Units[unitID].Class) 
	local shacklesCost = player:GetUnitShackleCost(unitID)
	if player:GetNumShackles() < shacklesCost then return end
	LuaEvents.JFD_CityPurchasedSlaveUnit(newOwnerID, city, unitID, shacklesCost)
end
if userSettingCIDSlaveryCore then
	GameEvents.CityCaptureComplete.Add(JFD_CID_Slavery_CityCapturedAI)	
end
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- SLAVERY
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Slavery_BarbariansCampCleared
function JFD_CID_Slavery_BarbariansCampCleared(plotX, plotY, playerID)
	local player = Players[playerID]
	local numShackles = player:GetNumShacklesFromBarbarianCampCleared()
	if numShackles <= 0 then return end
	player:ChangeNumShackles(numShackles) 
	if player:IsHuman() then
		local hex = ToHexFromGrid(Vector2(plotX, plotY))
		Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num} [ICON_JFD_SHACKLES] Slave(s)[ENDCOLOR]", numShackles), true)
		LuaEvents.JFD_Tutorial_PushTutorialPopup(playerID, "IsOnShackles", nil, nil, plotX, plotY)
	end
end
if userSettingCIDSlaveryCore then
	GameEvents.BarbariansCampCleared.Add(JFD_CID_Slavery_BarbariansCampCleared)
	LuaEvents.JFD_TribeAnnexed.Add(JFD_CID_Slavery_BarbariansCampCleared)
end

-- JFD_CID_Slavery_PlayerDoTurn
function JFD_CID_Slavery_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local numShackles = player:GetNumShackles()
	if numShackles < 0 then player:ChangeNumShackles(numShackles*-1) end
	if (not player:CanPurchaseSlaves()) then return end
	local numShackles = 0
	for _, tradeRoute in ipairs(player:GetTradeRoutes()) do
		numShackles = numShackles + player:GetNumShacklesFromTradeRoute(tradeRoute.ToCity, tradeRoute)
	end
	player:ChangeNumShackles(Game.GetRound(numShackles)) 
	local capital = player:GetCapitalCity()
	if player:IsHuman() then return end
	if player:CalculateGoldRate() < 1 then return end
	local flavourSlavery = player:GetFlavorValue("FLAVOR_JFD_SLAVERY")
	if Game.GetRandom(1,10) > flavourSlavery then return end
	local unitID = GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")
	if (not unitID) then unitID = 0 end
	unitID = player:GetSpecificUnitType(GameInfo.Units[unitID].Class) 
	local numShackles = player:GetNumShackles()
	local shacklesCost = player:GetUnitShackleCost(unitID)
	for city in player:Cities() do
		if (not city:GetGarrisonedUnit()) then
			if numShackles >= shacklesCost then
				LuaEvents.JFD_CityPurchasedSlaveUnit(playerID, city, unitID, shacklesCost)
			end
		end
	end
	local unitID = unitSlaveWorkerID
	if numShackles > shacklesCost then
		LuaEvents.JFD_CityPurchasedSlaveUnit(playerID, capital, unitID, shacklesCost)	
	end
end
if userSettingCIDSlaveryCore then
	GameEvents.PlayerDoTurn.Add(JFD_CID_Slavery_PlayerDoTurn)	
end

--JFD_CID_Slavery_UnitPrekill
function JFD_CID_Slavery_UnitPrekill(playerKilledID, unitID, unitType, plotX, plotY, isDelay, playerID)
	if (not isDelay) then return end
	if (not playerID) then return end
	if (not playerKilledID) then return end
	if playerID == playerKilledID then return end
	local player = Players[playerID]
	if (not player) then return end
	local killedPlayer = Players[playerKilledID]
	if (not killedPlayer:IsBarbarian()) then return end
	if (not player:IsAlive()) then return end
	if (not player:CanPurchaseSlaves()) then return end
	local randomDivider = Game.GetRandom(1,4)
	local numShackles = (GameInfo.Units[unitType].ShackleCost/randomDivider)
	for row in GameInfo.Belief_JFD_SlaveryMods("BarbarianMod <> 0") do
		if player:HasBelief(GameInfoTypes[row.BeliefType]) then
			numShackles = numShackles + ((numShackles*row.BarbarianMod)/100) 
		end
	end
	for row in GameInfo.Building_JFD_SlaveryMods("BarbarianMod <> 0") do
		if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
			numShackles = numShackles + ((numShackles*row.BarbarianMod)/100) 
		end
	end
	for row in GameInfo.Policy_JFD_SlaveryMods("BarbarianMod <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			numShackles = numShackles + ((numShackles*row.BarbarianMod)/100) 
		end
	end
	for row in GameInfo.JFD_Reform_SlaveryMods("BarbarianMod <> 0") do
		if player:HasReform(GameInfoTypes[row.ReformType]) then
			numShackles = numShackles + ((numShackles*row.BarbarianMod)/100) 
		end
	end
	for row in GameInfo.Trait_JFD_SlaveryMods("BarbarianMod <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			numShackles = numShackles + ((numShackles*row.BarbarianMod)/100) 
		end
	end
	numShackles = Game.GetRound(numShackles)
	player:ChangeNumShackles(numShackles)
	if (player:IsHuman() and numShackles > 0) then
		local hex = ToHexFromGrid(Vector2(plotX, plotY))
		Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num} [ICON_JFD_SHACKLES][ENDCOLOR]", numShackles), true)
		LuaEvents.JFD_Tutorial_PushTutorialPopup(playerID, "IsOnShackles", nil, nil, plotX, plotY)
	end
end
if userSettingCIDSlaveryCore then
	GameEvents.UnitPrekill.Add(JFD_CID_Slavery_UnitPrekill)	
end
----------------
-- RESOLUTION
----------------
--JFD_CID_Slavery_ResolutionPassed
local resolutionSlaveryID = GameInfoTypes["RESOLUTION_JFD_SLAVERY"]
function JFD_CID_Slavery_ResolutionPassed(resolutionID, proposerID, choiceID, isEnacted, isPassed)
	if resolutionID ~= resolutionSlaveryID then return end
	if (not isPassed) then return end
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local player = Players[playerID]
		if player:IsAlive() then
			local numShackles = player:GetNumShackles()
			player:ChangeGoldenAgeProgressMeter(numShackles*10)
			player:ChangeNumShackles(-numShackles)
			if player:IsHuman() then
				local capital = player:GetCapitalCity()
				local hex = ToHexFromGrid(Vector2(capital:GetX(), capital:GetY()))
				Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num} [ICON_GOLDEN_AGE][ENDCOLOR]", numShackles), true)
			end
			for unit in player:Units() do
				if unit:HasPromotion(promotionEnslavedID) then
					unit:SetHasPromotion(promotionEnslavedID, false)
					unit:SetName("Free")
				end
			end
		end
	end
end 
if userSettingCIDSlaveryCore then
	GameEvents.ResolutionResult.Add(JFD_CID_Slavery_ResolutionPassed)	
end
----------------
-- UNITS
----------------
--JFD_CID_Slavery_PlayerCanTrain
function JFD_CID_Slavery_PlayerCanTrain(playerID, unitID)
	if unitID == unitSlaveWorkerID then
		local player = Players[playerID]
		return (not player:IsHuman())
	end	
	return true
end	
if userSettingCIDSlaveryCore then
	GameEvents.PlayerCanTrain.Add(JFD_CID_Slavery_PlayerCanTrain)	
end

--JFD_CID_Slavery_CityPurchasedSlaveUnit
function JFD_CID_Slavery_CityPurchasedSlaveUnit(playerID, city, unitID, numShackles)
	local player = Players[playerID]
	player:ChangeNumShackles(-numShackles)
	local unitSlave = player:InitUnit(unitID, city:GetX(), city:GetY())
	unitSlave:SetName("Slave")
	unitSlave:ChangeExperience(-unitSlave:GetExperience())
	unitSlave:SetHasPromotion(promotionEnslavedID, true)
	local numFreeXP = 0
	local numFreeHP = 0
	for row in GameInfo.Belief_JFD_SlaveryMods("FreeExperience <> 0 OR MaxHPChange <> 0") do
		if player:HasBelief(GameInfoTypes[row.BeliefType]) then
			numFreeXP = numFreeXP + row.FreeExperience
			numFreeHP = numFreeHP + row.MaxHPChange
		end
	end
	for row in GameInfo.Building_JFD_SlaveryMods("FreeExperience <> 0 OR MaxHPChange <> 0") do
		if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
			numFreeXP = numFreeXP + row.FreeExperience
			numFreeHP = numFreeHP + row.MaxHPChange
		end
	end
	for row in GameInfo.Policy_JFD_SlaveryMods("FreeExperience <> 0 OR MaxHPChange <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			numFreeXP = numFreeXP + row.FreeExperience
			numFreeHP = numFreeHP + row.MaxHPChange
		end
	end
	for row in GameInfo.JFD_Reform_SlaveryMods("FreeExperience <> 0 OR MaxHPChange <> 0") do
		if player:HasReform(GameInfoTypes[row.ReformType]) then
			numFreeXP = numFreeXP + row.FreeExperience
			numFreeHP = numFreeHP + row.MaxHPChange
		end
	end
	for row in GameInfo.Trait_JFD_SlaveryMods("FreeExperience <> 0 OR MaxHPChange <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			numFreeXP = numFreeXP + row.FreeExperience
			numFreeHP = numFreeHP + row.MaxHPChange
		end
	end
	if numFreeXP ~= 0 then unitSlave:ChangeExperience(numFreeXP) end	
	if numFreeHP ~= 0 then unitSlave:ChangeMaxHitPointsBase(numFreeHP) end	
	if userSettingCIDHappinessCore then
		city:ChangeResistanceCounter(numShackles)
		if player:IsHuman() then
			Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(city:GetX(), city:GetY()))), Locale.ConvertTextKey("[COLOR_UNHAPPINESS]+{1_Num}[ICON_RESISTANCE][ENDCOLOR]", numShackles), true)
		end
	end
end	
if userSettingCIDSlaveryCore then
	LuaEvents.JFD_CityPurchasedSlaveUnit.Add(JFD_CID_Slavery_CityPurchasedSlaveUnit)
end
--=======================================================================================================================
--=======================================================================================================================
