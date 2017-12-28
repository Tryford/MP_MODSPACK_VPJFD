-- JFD_CID_Development_Functions
-- Author: JFD
-- DateCreated: 12/18/2014 8:58:10 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_CID_DevelopmentUtils.lua");
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingCIDDevelopmentCore 		  = (Game.GetUserSetting("JFD_CID_DEVELOPMENT_CORE") == 1)
local userSettingCIDDevelopmentCoreDefense    = (Game.GetUserSetting("JFD_CID_DEVELOPMENT_CORE_DEFENSE_EFFECT") == 1)
local userSettingCIDDevelopmentCoreProductionBuildings = (Game.GetUserSetting("JFD_CID_DEVELOPMENT_CORE_PRODUCTION_BONUS_BUILDINGS") == 1)
local userSettingCIDDevelopmentCoreProductionWonders   = (Game.GetUserSetting("JFD_CID_DEVELOPMENT_CORE_PRODUCTION_PENALTY_WONDERS") == 1)
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local activePlayerID = Game.GetActivePlayer()
local activePlayer   = Players[activePlayerID]
local mathFloor 	 = math.floor
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- DEVELOPMENT
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Development_PlayerDoTurn
local yieldCrimeID  	= GameInfoTypes["YIELD_JFD_CRIME"]
local yieldDiseaseID 	= GameInfoTypes["YIELD_JFD_DISEASE"]
local yieldHealthID  	= GameInfoTypes["YIELD_JFD_HEALTH"]
local yieldProductionID = GameInfoTypes["YIELD_PRODUCTION"]
function JFD_CID_Development_PlayerDoTurn(playerID)
	local player = Players[playerID]
	for city in player:Cities() do
		local productionBuildingID = city:GetProductionBuilding()
		local isWonder = false
		if productionBuildingID > -1 then isWonder = GameInfo.BuildingClasses[GameInfo.Buildings[productionBuildingID].BuildingClass].MaxGlobalInstances == 1 end
		local developmentRate = player:GetCityDevelopment(city)
		local yieldHappiness, yieldHealth, yieldBuildingProduction, yieldCrime, yieldDisease, yieldWonderProduction, yieldDefense = player:GetDevelopmentYields(city, developmentRate)
		yieldBuildingProduction  = mathFloor(yieldBuildingProduction)
		yieldDefense		 	 = mathFloor(yieldDefense)
		yieldDisease		 	 = mathFloor(yieldDisease)
		yieldHappiness	 		 = mathFloor(yieldHappiness)
		yieldHealth		 		 = mathFloor(yieldHealth)
		yieldWonderProduction	 = mathFloor(yieldWonderProduction)
		if developmentRate > 0 then
			city:SetYieldFromDevelopment(yieldDiseaseID, 0)
			city:SetYieldFromDevelopment(yieldCrimeID, yieldHappiness) --Happiness
			city:SetYieldFromDevelopment(yieldHealthID, yieldHealth)
			if userSettingCIDDevelopmentCoreDefense then
				city:SetYieldModifierFromDevelopment(yieldCrimeID, yieldDefense) --Defense	
			end
			if userSettingCIDDevelopmentCoreProductionBuildings then
				if (productionBuildingID > -1 and (not isWonder)) then
					city:SetYieldModifierFromDevelopment(yieldProductionID, yieldBuildingProduction)	
				else
					city:SetYieldModifierFromDevelopment(yieldProductionID, 0)	
				end
			end
			if player:IsHuman() then
				LuaEvents.JFD_Tutorial_PushTutorialPopup(playerID, "IsOnDevelopmentSurplus", city, nil, city:GetX(), city:GetY())
			end
		elseif developmentRate < 0 then
			city:SetYieldFromDevelopment(yieldDiseaseID, yieldDisease)
			city:SetYieldFromDevelopment(yieldCrimeID, 0) --Happiness
			city:SetYieldFromDevelopment(yieldHealthID, 0)
			if userSettingCIDDevelopmentCoreDefense then
				city:SetYieldModifierFromDevelopment(yieldCrimeID, yieldDefense) --Defense
			end
			if userSettingCIDDevelopmentCoreProductionWonders then
				if (productionBuildingID > -1 and isWonder) then
					city:SetYieldModifierFromDevelopment(yieldProductionID, yieldWonderProduction)	
				else
					city:SetYieldModifierFromDevelopment(yieldProductionID, 0)	
				end
			end
			if player:IsHuman() then
				LuaEvents.JFD_Tutorial_PushTutorialPopup(playerID, "IsOnDevelopmentDeficit", city, nil, city:GetX(), city:GetY())
			end
		else	
			city:SetYieldFromDevelopment(yieldDiseaseID, 0)
			city:SetYieldFromDevelopment(yieldCrimeID, 0) --Happiness
			city:SetYieldFromDevelopment(yieldHealthID, yieldHealth)
			if userSettingCIDDevelopmentCoreDefense then
				city:SetYieldModifierFromDevelopment(yieldCrimeID, 0) --Defense	
			end
			if (userSettingCIDDevelopmentCoreProductionBuildings or userSettingCIDDevelopmentCoreProductionWonders) then
				city:SetYieldModifierFromDevelopment(yieldProductionID, 0)	
			end
		end
	end
end
if userSettingCIDDevelopmentCore then
	GameEvents.PlayerDoTurn.Add(JFD_CID_Development_PlayerDoTurn)
end

--JFD_CID_Development_PlayerCityFounded
function JFD_CID_Development_PlayerCityFounded(playerID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (not player:IsHuman()) then return end
	local city = Map.GetPlot(plotX, plotY):GetPlotCity()
	local developmentRate = player:GetCityDevelopment(city)
	local yieldHappiness, yieldHealth, yieldBuildingProduction, yieldCrime, yieldDisease, yieldWonderProduction, yieldDefense = player:GetDevelopmentYields(city, developmentRate)
	yieldDefense		 	 = mathFloor(yieldDefense)
	yieldDisease		 	 = mathFloor(yieldDisease)
	yieldHappiness	 		 = mathFloor(yieldHappiness)
	yieldHealth		 		 = mathFloor(yieldHealth)
	if developmentRate > 0 then
		city:SetYieldFromDevelopment(yieldDiseaseID, 0)
		city:SetYieldFromDevelopment(yieldCrimeID, yieldHappiness) --Happiness
		city:SetYieldFromDevelopment(yieldHealthID, yieldHealth)
		if userSettingCIDDevelopmentCoreDefense then
			city:SetYieldModifierFromDevelopment(yieldCrimeID, yieldDefense) --Defense	
		end
	elseif developmentRate < 0 then
		city:SetYieldFromDevelopment(yieldDiseaseID, yieldDisease)
		city:SetYieldFromDevelopment(yieldCrimeID, 0) --Happiness
		city:SetYieldFromDevelopment(yieldHealthID, 0)
		if userSettingCIDDevelopmentCoreDefense then
			city:SetYieldModifierFromDevelopment(yieldCrimeID, yieldDefense) --Defense
		end
	else	
		city:SetYieldFromDevelopment(yieldDiseaseID, 0)
		city:SetYieldFromDevelopment(yieldCrimeID, 0) --Happiness
		city:SetYieldFromDevelopment(yieldHealthID, yieldHealth)
		if userSettingCIDDevelopmentCoreDefense then
			city:SetYieldModifierFromDevelopment(yieldCrimeID, 0) --Defense	
		end
	end
end
if userSettingCIDDevelopmentCore then
	GameEvents.PlayerCityFounded.Add(JFD_CID_Development_PlayerCityFounded)
end
--=======================================================================================================================
--=======================================================================================================================