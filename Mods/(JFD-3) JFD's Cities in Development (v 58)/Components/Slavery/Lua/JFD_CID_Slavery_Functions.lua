-- JFD_CID_Slavery_Functions
-- Author: JFD
-- DateCreated: 2/21/2016 6:54:13 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_CID_HappinessUtils.lua")
include("JFD_CID_SlaveryUtils.lua")
--=======================================================================================================================
-- DEFINES
--=======================================================================================================================
local defineSlaveryMaxPerCivilianCapture = GameDefines["JFD_CID_SLAVERY_MAX_FROM_CIVILIAN_CAPTURE"]
local defineSlaveryMaxPerEncampment		 = GameDefines["JFD_CID_SLAVERY_MAX_FROM_ENCAMPMENT"]
local defineSlaveryMinPerCivilianCapture = GameDefines["JFD_CID_SLAVERY_MIN_FROM_CIVILIAN_CAPTURE"]
local defineSlaveryMinPerEncampment		 = GameDefines["JFD_CID_SLAVERY_MIN_FROM_ENCAMPMENT"]
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingHappinessCore			= JFD_GetUserSetting("JFD_CID_HAPPINESS_CORE") == 1
local userSettingSlaveryCore			= JFD_GetUserSetting("JFD_CID_SLAVERY_CORE") == 1
local userSettingSlaveryCoreEnslavement	= JFD_GetUserSetting("JFD_CID_SLAVERY_CORE_ENSLAVEMENT") == 1
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local mathCeil = math.ceil
------------------------------------------------------------------------------------------------------------------------
-- AI
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Slavery_PlayerDoTurnAI
local unitSlaveWorkerID = GameInfoTypes["UNIT_JFD_SLAVE"]
function JFD_CID_Slavery_PlayerDoTurnAI(playerID)
	local player = Players[playerID]
	local capital = player:GetCapitalCity()
	if (not capital) then return end
	if player:IsHuman() then return end
	if player:CalculateGoldRate() < 1 then return end
	if (not JFD_CanPurchaseSlaves(playerID)) then return end
	local numShackles = JFD_GetNumShackles(playerID)
	if numShackles == 0 then return end
	local flavourSlavery = JFD_GetLeaderFlavour(playerID, "FLAVOR_JFD_SLAVERY")
	if flavourSlavery == 0 then return end
	if JFD_GetRandom(1,10) < flavourSlavery then
		local unitID = GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")
		if (not unitID) then unitID = 0 end
		unitID = player:GetSpecificUnitType(GameInfo.Units[unitID].Class) 
		local shackleCost = JFD_GetShackleCost(playerID, unitID)
		if numShackles > shackleCost then
			for city in player:Cities() do
				if (not city:GetGarrisonedUnit()) then
					LuaEvents.JFD_CityPurchasedSlaveUnit(playerID, city, unitID, shackleCost)
				end
			end
		end
	end
	local flavourTileImprovement = JFD_GetLeaderFlavour(playerID, "FLAVOR_TILE_IMPROVEMNT")
	if JFD_GetRandom(1,10) < flavourTileImprovement then
		local unitID = unitSlaveWorkerID
		local shackleCost = JFD_GetShackleCost(playerID, unitID)
		if numShackles > shackleCost then
			LuaEvents.JFD_CityPurchasedSlaveUnit(playerID, capital, unitID, shackleCost)	
		end
	end
end
if userSettingSlaveryCore then
	GameEvents.PlayerDoTurn.Add(JFD_CID_Slavery_PlayerDoTurnAI)	
end

--JFD_CID_Slavery_CityCaptured
function JFD_CID_Slavery_CityCaptured(oldOwnerID, capital, plotX, plotY, newOwnerID, population, isConquest)
	local player = Players[newOwnerID]
	local city = Map.GetPlot(plotX, plotY):GetPlotCity()
	if (not city) then return end
	if userSettingHappinessCore then
		city:ChangeResistanceTurns(-city:GetResistanceTurns())
		JFD_ChangeResistanceCounter(newOwnerID, city, city:GetPopulation()*3)
	end
	if player:IsHuman() then return end
	if (not JFD_CanPurchaseSlaves(newOwnerID)) then return end
	local flavourSlavery = JFD_GetLeaderFlavour(playerID, "FLAVOR_JFD_SLAVERY")
	if JFD_GetRandom(1,100) >= flavourSlavery*10 then
		JFD_DoEnslaveCity(newOwnerID, city)
		if JFD_GetNumShackles(oldOwnerID) > 0 then
			local unitID = GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")
			if (not unitID) then unitID = 0 end
			unitID = player:GetSpecificUnitType(GameInfo.Units[unitID].Class) 
			LuaEvents.JFD_CityPurchasedSlaveUnit(newOwnerID, city, unitID, JFD_GetShackleCost(newOwnerID, unitID))
		end
	end
end
if userSettingSlaveryCore then
	GameEvents.CityCaptureComplete.Add(JFD_CID_Slavery_CityCaptured)	
end

--JFD_CID_Slavery_CityPuppeted
local buildingClaimedCityID = GameInfoTypes["BUILDING_JFD_CLAIMED_CITY"]
function JFD_CID_Slavery_CityPuppeted(playerID, cityID)
	local player = Players[playerID]
	local city = player:GetCityByID(cityID)
	if buildingClaimedCityID and city:IsHasBuilding(buildingClaimedCityID) then return end
	if city:GetOriginalOwner() == playerID then return end
	city:ChangeResistanceTurns(city:GetPopulation())
end
if (userSettingSlaveryCore and userSettingHappinessCore) then
	GameEvents.CityPuppeted.Add(JFD_CID_Slavery_CityPuppeted)	
end
------------------------------------------------------------------------------------------------------------------------
-- SLAVERY
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Slavery_EncampmentCleared
function JFD_CID_Slavery_EncampmentCleared(plotX, plotY, playerID)
	if (not JFD_CanPurchaseSlaves(playerID)) then return end
	local player = Players[playerID]
	local numShackles = JFD_GetRandom(defineSlaveryMinPerEncampment,defineSlaveryMaxPerEncampment)
	local numShacklesMod = JFD_GetShacklesMod(playerID, "EncampmentMod")
	if numShacklesMod > 0 then 
		numShackles = numShackles + ((numShackles*numShacklesMod)/100) 
	end
	if numShackles > 0 then 
		JFD_ChangeNumShackles(playerID, JFD_Round(numShackles)) 
	end
	if player:IsHuman() then
		local hex = ToHexFromGrid(Vector2(plotX, plotY))
		Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num} [ICON_JFD_SHACKLES] Slave(s)[ENDCOLOR]", numShackles), true)
	end
end
if userSettingSlaveryCore then
	GameEvents.BarbariansCampCleared.Add(JFD_CID_Slavery_EncampmentCleared)
	LuaEvents.JFD_TribeAnnexed.Add(JFD_CID_Slavery_EncampmentCleared)
end

-- JFD_CID_Slavery_PlayerDoTurn
function JFD_CID_Slavery_PlayerDoTurn(playerID)
	if (not JFD_CanPurchaseSlaves(playerID)) then return end
	local player = Players[playerID]
	local numShackles = 0
	for _, tradeRoute in ipairs(player:GetTradeRoutes()) do
		numShackles = numShackles + JFD_GetNumShacklesFromTradeRoute(tradeRoute, playerID, tradeRoute.ToCity)
	end
	local numShacklesMod = JFD_GetShacklesMod(playerID, "TradeRouteMod")
	if numShacklesMod > 0 then 
		numShackles = numShackles + ((numShackles*numShacklesMod)/100) 
	end
	if numShackles > 0 then 
		JFD_ChangeNumShackles(playerID, JFD_Round(numShackles)) 
	end
end
if userSettingSlaveryCore then
	GameEvents.PlayerDoTurn.Add(JFD_CID_Slavery_PlayerDoTurn)	
end

--JFD_CID_Slavery_UnitCaptured
function JFD_CID_Slavery_UnitCaptured(capturingPlayerID, capturingUnitID, capturedPlayerID, capturedUnitID, isKilled, reasonID)
	if capturedPlayerID == 63 then return end
	if (not JFD_CanPurchaseSlaves(capturingPlayerID)) then return end
	local player = Players[capturingPlayerID]
	local numShackles = JFD_GetRandom(defineSlaveryMinPerCivilianCapture,defineSlaveryMaxPerCivilianCapture) or 0
	local numShacklesMod = JFD_GetShacklesMod(capturingPlayerID, "CivilianCaptureMod")
	if (numShacklesMod > 0 and numShackles) then 
		numShackles = numShackles + ((numShackles*numShacklesMod)/100) 
	end
	if (numShackles and numShackles > 0) then 
		JFD_ChangeNumShackles(capturingPlayerID, JFD_Round(numShackles)) 
	end
	if player:IsHuman() then
		local unit = player:GetUnitByID(capturingUnitID)
		Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))), Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num} [ICON_JFD_SHACKLES] Shackle(s)[ENDCOLOR]", numShackles), true)
	end
end
if userSettingSlaveryCore then
	GameEvents.UnitCaptured.Add(JFD_CID_Slavery_UnitCaptured)	
end

--JFD_CID_Slavery_UnitCaptured
local unitSlaveWorkerID = GameInfoTypes["UNIT_JFD_SLAVE"]
function JFD_CID_Slavery_UnitCaptureType(playerID, unitID, unitTypeID, civID)
	local player = Players[playerID]
	if GameInfo.Units[unitTypeID].Capture == "UNITCLASS_WORKER" then
		return unitSlaveWorkerID
	elseif GameInfo.Units[unitTypeID].Capture then
		return GameInfo.Units[unitTypeID].Capture
	end
end
if userSettingSlaveryCore then
	--GameEvents.UnitCaptureType.Add(JFD_CID_Slavery_UnitCaptureType)	
end
----------------
-- RESOLUTION
----------------
--JFD_CID_Slavery_ResolutionPassed
local resolutionSlaveryID = GameInfoTypes["RESOLUTION_JFD_SLAVERY"]
function JFD_CID_Slavery_ResolutionPassed(resolutionID, choiceID, isEnacted, isPassed)
	if resolutionID ~= resolutionSlaveryID then return end
	if (not isPassed) then return end
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		if Players[playerID]:IsAlive() then
			JFD_ChangeNumShackles(playerID, -JFD_GetNumShackles(playerID))
		end
	end
end 
if userSettingSlaveryCore then
	GameEvents.ResolutionResult.Add(JFD_CID_Slavery_ResolutionPassed)	
end
----------------
-- UNITS
----------------
--JFD_CID_Slavery_PlayerCanTrain
function JFD_CID_Slavery_PlayerCanTrain(playerID, unitID)
	if unitID == unitSlaveWorkerID then
		local player = Players[playerID]
		if player:IsHuman() then 
			return false
		end
	end	
	return true
end	
if userSettingSlaveryCore then
	GameEvents.PlayerCanTrain.Add(JFD_CID_Slavery_PlayerCanTrain)	
end

--JFD_CID_Slavery_CityPurchasedSlaveUnit
local promotionEnslavedID = GameInfoTypes["PROMOTION_JFD_ENSLAVED"]
function JFD_CID_Slavery_CityPurchasedSlaveUnit(playerID, city, unitID, numShackles)
	local player = Players[playerID]
	JFD_ChangeNumShackles(playerID, -numShackles)
	local unitSlave = player:InitUnit(unitID, city:GetX(), city:GetY())
	if unitID and GameInfo.Units[unitID].Class ~= 'UNITCLASS_JFD_SLAVE' then
		unitSlave:SetName("Slave")
	end
	unitSlave:ChangeExperience(-unitSlave:GetExperience())
	unitSlave:SetHasPromotion(promotionEnslavedID, true)
	local numFreeXP = JFD_GetShacklesMod(playerID, "FreeExperience")
	if numFreeXP ~= 0 then
		unitSlave:ChangeExperience(numFreeXP)
	end	
	local numHPChange = JFD_GetShacklesMod(playerID, "MaxHPChange")
	if numHPChange ~= 0 then
		unitSlave:ChangeMaxHitPointsBase(numHPChange)
	end	
	if userSettingHappinessCore then
		JFD_ChangeResistanceCounter(playerID, city, numShackles)
		if player:IsHuman() then
			Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(city:GetX(), city:GetY()))), Locale.ConvertTextKey("[COLOR_JFD_UNHAPPINESS]+{1_Num}[ICON_HAPPINESS_4][ENDCOLOR]", numShackles), true)
		end
	end
end	
if userSettingSlaveryCore then
	LuaEvents.JFD_CityPurchasedSlaveUnit.Add(JFD_CID_Slavery_CityPurchasedSlaveUnit)
end
--=======================================================================================================================
--=======================================================================================================================
