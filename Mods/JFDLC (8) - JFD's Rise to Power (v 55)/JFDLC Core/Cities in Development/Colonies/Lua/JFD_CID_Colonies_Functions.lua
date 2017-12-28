-- JFD_CID_Colonies_Functions
-- Author: JFD
-- DateCreated: 12/18/2014 8:58:10 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("IconSupport")
include("JFD_CID_ColoniesUtils.lua")
--include("JFD_CID_LoyaltyUtils.lua")
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingCIDColoniesCore 				= (Game.GetUserSetting("JFD_CID_COLONIES_CORE") == 1)
local userSettingCIDColoniesCoreFort 			= (Game.GetUserSetting("JFD_CID_COLONIES_CORE_FORT_COLONIES") == 1)
local userSettingCIDColoniesBelief 				= (Game.GetUserSetting("JFD_CID_COLONIES_BELIEF_ADDITIONS_MISSION_COLONIES") == 1)
local userSettingCIDColoniesNetherlands			= (Game.GetUserSetting("JFD_CID_COLONIES_CIVILIZATION_CHANGES_NETHERLANDS") == 1)
local userSettingCIDProvincesCore				= (Game.GetUserSetting("JFD_CID_PROVINCES_CORE") == 1)

--Distance Settings
local userSettingCIDColoniesDistanceCore 		= (Game.GetUserSetting("JFD_CID_COLONIES_DISTANCE_CORE") == 1)
local userSettingCIDColoniesDistanceForts		= (Game.GetUserSetting("JFD_CID_COLONIES_DISTANCE_CORE_FORT") == 1)
local userSettingCIDColoniesDistanceNumCities  	= (Game.GetUserSetting("JFD_CID_COLONIES_DISTANCE_CORE_NUM_CITIES"))
local worldSizeQuery							= ("JFD_CID_COLONIES_DISTANCE_" .. GameInfo.Worlds[Map.GetWorldSize()].Type)
local userSettingCIDColoniesDistance			= (Game.GetUserSetting(worldSizeQuery))

local isUsingED									= Game.IsEventsAndDecisionsActive()
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local activePlayerID 			 = Game.GetActivePlayer()
local convertTextKey			 = Locale.ConvertTextKey
								 
local buildingAssemblyID 		 = GameInfoTypes["BUILDING_JFD_ASSEMBLY"]
local buildingGovernorsMansionID = GameInfoTypes["BUILDING_JFD_GOVERNORS_MANSION"]
local resourceMagistratesID		 = GameInfoTypes["RESOURCE_MAGISTRATES"]
local provinceColonyID   		 = GameInfoTypes["PROVINCE_JFD_COLONY"]
local unitPromotionColonistID	 = GameInfoTypes["PROMOTION_JFD_COLONIAL_SETTLER"] 
--=======================================================================================================================
-- AI FUNCTIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- COLONIES
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Colonies_PlayerDoTurnAI
local eraIndustrialID = GameInfoTypes["ERA_INDUSTRIAL"]
function JFD_CID_Colonies_PlayerDoTurnAI(playerID)
	local player = Players[playerID]
	if player:IsHuman() then return end
	if player:IsBarbarian() then return end
	if (not player:CanFoundColonies()) then return end
	if player:GetNumCities() == 1 then return end
	if player:GetCurrentEra() < eraIndustrialID then return end
	local flavourDecolonizaton = player:GetFlavorValue("FLAVOR_JFD_DECOLONIZATION")
	if flavourDecolonizaton == 0 then return end
	if Game.GetRandom(1,10) > flavourDecolonizaton then return end
	for city in player:Cities() do
		if city:IsColony() then
			if player:CanDecolonize(city) then
				LuaEvents.JFD_ColonyDecolonized(playerID, city, false)
			end 
		end
	end
end
if userSettingCIDColoniesCore then
	GameEvents.PlayerDoTurn.Add(JFD_CID_Colonies_PlayerDoTurnAI)
end
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- COLONIES
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Colonies_CityCanConstruct
function JFD_CID_Colonies_CityCanConstruct(playerID, cityID, buildingID)
	local city = Players[playerID]:GetCityByID(cityID)
	if city:IsPuppet() then
		local building = GameInfo.Buildings[buildingID]
		local buildingClass = GameInfo.BuildingClasses[building.BuildingClass]
		if (buildingClass.MaxPlayerInstances == 1 or buildingClass.MaxGlobalInstances == 1) then
			return false 
		end
	end
	return true
end
if userSettingCIDColoniesCore then
	GameEvents.CityCanConstruct.Add(JFD_CID_Colonies_CityCanConstruct)
end

--JFD_CID_Colonies_CityCanCreate
function JFD_CID_Colonies_CityCanCreate(playerID, cityID)
	local city = Players[playerID]:GetCityByID(cityID)
	return (not city:IsColony())
end
if userSettingCIDColoniesCore then
	GameEvents.CityCanCreate.Add(JFD_CID_Colonies_CityCanCreate)
end

--JFD_CID_Colonies_CityCanTrain
function JFD_CID_Colonies_CityCanTrain(playerID, cityID, unitID)
	local player = Players[playerID]
	local city = player:GetCityByID(cityID)
	if city:IsColony() then
		local unit = GameInfo.Units[unitID]
		return (unit.Class ~= 'UNITCLASS_SETTLER' and unit.Class ~= 'UNITCLASS_JFD_COLONIST')
	end
	return true
end
if userSettingCIDColoniesCore then
	GameEvents.CityCanTrain.Add(JFD_CID_Colonies_CityCanTrain)
end

--JFD_CID_Colonies_PlayerCanTrain
function JFD_CID_Colonies_PlayerCanTrain(playerID, unitID)
	local player = Players[playerID]
	local unit = GameInfo.Units[unitID]
	if unit.Class == 'UNITCLASS_JFD_COLONIST' then
		return player:CanFoundColonies()
	end	
	return true
end
if userSettingCIDColoniesCore then
	GameEvents.PlayerCanTrain.Add(JFD_CID_Colonies_PlayerCanTrain)
end
-----------------
-- FOUNDING
-----------------
--JFD_CID_Colonies_UnitCityFounded
function JFD_CID_Colonies_UnitCityFounded(playerID, unitID, unitTypeID, plotX, plotY)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local plot = Map.GetPlot(plotX, plotY)
	if (not plot) then return end
	if (not unit) then return end
	local city = plot:GetPlotCity()
	if (not city) then return end
	if player:IsHuman() and (not unit:HasPromotion(unitPromotionColonistID)) then
		Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_JFD_CITY_ESTABLISHED_MSG", city:GetName()))
	end	
	if (not unit:HasPromotion(unitPromotionColonistID)) then return end
	player:InitColony(city, unit, plotX, plotY)
end
if userSettingCIDColoniesCore then
	GameEvents.UnitCityFounded.Add(JFD_CID_Colonies_UnitCityFounded)
end

--JFD_CID_Colonies_CityCaptureComplete
local buildingManorID = GameInfoTypes["BUILDING_JFD_MANOR"]
function JFD_CID_Colonies_CityCaptureComplete(oldOwnerID, capital, plotX, plotY, newOwnerID)
	local player = Players[newOwnerID]
	local plot = Map.GetPlot(plotX, plotY)
	local city = plot:GetPlotCity()
	if (not city) then return end
	--if (buildingManorID and city:HasBuilding(buildingManorID)) then return end
	if (not player:CanFoundColonies()) then return end
	if player:IsMinorCiv() then return false end
	if player:IsPlotFoundsColony(plot, true) then
		city:SetColony(true)
		city:SetNumRealBuilding(buildingGovernorsMansionID, 1)
		if userSettingCIDProvincesCore then
			city:SetNumRealBuilding(buildingAssemblyID, 0)
			city:SetProvinceLevel(provinceColonyID)
		end
	end
end
if userSettingCIDColoniesCore then
	GameEvents.CityCaptureComplete.Add(JFD_CID_Colonies_CityCaptureComplete)	
end

--JFD_CID_Colonies_UnitMoved
local unitClassColonistID = GameInfoTypes["UNITCLASS_JFD_COLONIST"] 
function JFD_CID_Colonies_UnitMoved(playerID, unitID, plotX, plotY)
	if playerID ~= activePlayerID then return end
	local player = Players[playerID]
	if player:IsMinorCiv() then return false end
	if (not player:CanFoundColonies()) then return end
	local unit = player:GetUnitByID(unitID)
	if (not unit) then return end
	local unitInfo = GameInfo.Units[unit:GetUnitType()]
	local plot = Map.GetPlot(plotX, plotY)
	if unit:IsUnitClass(unitClassColonistID) then return end
	if ((unit:IsFound() or unit:IsFoundAbroad()) and (unitInfo.FoundMid == 0 and unitInfo.FoundLate == 0)) then
		if player:IsPlotFoundsColony(plot) then
			if (not unit:IsHasPromotion(unitPromotionColonistID)) then
				unit:SetHasPromotion(unitPromotionColonistID, true)
			end
		else
			if unit:IsHasPromotion(unitPromotionColonistID) then
				unit:SetHasPromotion(unitPromotionColonistID, false)
			end
		end		
	end	
end	
if (userSettingCIDColoniesCore and userSettingCIDColoniesDistanceCore) then
	GameEvents.UnitSetXY.Add(JFD_CID_Colonies_UnitMoved)
end
-----------------
-- DECOLONIZATION
-----------------
--JFD_CID_Colonies_ColonyDecolonized
local buildingAssemblyID = GameInfoTypes["BUILDING_JFD_ASSEMBLY"]
local buildingManorID    = GameInfoTypes["BUILDING_JFD_MANOR"]
local provinceCountyID   = GameInfoTypes["PROVINCE_JFD_COUNTY"]
function JFD_CID_Colonies_ColonyDecolonized(playerID, city, isDecision) 
	local player = Players[playerID]
	if (not isDecision) then
		local canAssimilate, requiredPopulation, costGold, costMagistrates = player:CanDecolonize(city)
		player:ChangeGold(-costGold)
		if isUsingED then
			player:ChangeNumResourceTotal(resourceMagistratesID, -costMagistrates)
		end
	end
	city:SetColony(false)
	city:SetNumRealBuilding(buildingGovernorsMansionID, 0)
	if (not player:MayNotAnnex()) then
		city:SetPuppet(false)
		city:SetProductionAutomated(false)
	end
	if userSettingCIDProvincesCore then
		city:SetNumRealBuilding(buildingAssemblyID, 1)
		city:SetNumRealBuilding(buildingManorID, 1)
		city:SetProvinceLevel(provinceCountyID)
	end
	if player:IsHuman() then
		Events.AudioPlay2DSound("AS2D_SOUND_JFD_DECOLONIZATION")
		JFD_SendNotification(playerID, "NOTIFICATION_CAPITAL_RECOVERED", Locale.ConvertTextKey("TXT_KEY_JFD_ASSIMILATE_COLONY_NOTIFICATION", city:GetName()), Locale.ConvertTextKey("TXT_KEY_JFD_ASSIMILATE_COLONY_NOTIFICATION_SHORT", city:GetName()), false, city:GetX(), city:GetY())
	end
end
LuaEvents.JFD_ColonyDecolonized.Add(JFD_CID_Colonies_ColonyDecolonized)
------------------------------------------------------------------------------------------------------------------------
-- CIVILIZATIONS
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Colonies_Netherlands_DutchEastIndiaCompany_ColonyFounded
local traitNetherlandsID = GameInfoTypes["TRAIT_JFD_NETHERLANDS"]
local unitWorkerID		 = GameInfoTypes["UNIT_WORKER"]
function JFD_CID_Colonies_Netherlands_DutchEastIndiaCompany_ColonyFounded(playerID, city, isFort, plotX, plotY)
	local player = Players[playerID]
	local teamID = player:GetTeam()
	if (not player:IsAlive()) then return end
	if (not player:HasTrait(traitNetherlandsID)) then return end
	player:InitUnit(unitWorkerID, plotX, plotY)
	local cityID = city:GetID()
	local plot = Map.GetPlot(plotX, plotY)
	for adjacentPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
		if (adjacentPlot:GetOwner() == -1 and adjacentPlot:GetResourceType() > -1)  then
			adjacentPlot:SetOwner(playerID, cityID, true, true)
			adjacentPlot:SetRevealed(teamID, true)
		end
	end
end
if userSettingCIDColoniesNetherlands then
	LuaEvents.JFD_ColonyFounded.Add(JFD_CID_Colonies_Netherlands_DutchEastIndiaCompany_ColonyFounded)
end
--=======================================================================================================================
--=======================================================================================================================