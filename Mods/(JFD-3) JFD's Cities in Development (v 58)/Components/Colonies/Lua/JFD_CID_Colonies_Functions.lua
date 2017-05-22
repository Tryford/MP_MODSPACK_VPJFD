-- JFD_CID_Colonies_Functions
-- Author: JFD
-- DateCreated: 12/18/2014 8:58:10 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("IconSupport")
include("JFD_CID_ColoniesUtils.lua")
include("JFD_CID_LoyaltyUtils.lua")
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
--Core Settings
local userSettingColoniesCore 				= JFD_GetUserSetting("JFD_CID_COLONIES_CORE") == 1
local userSettingColoniesCoreFort 			= JFD_GetUserSetting("JFD_CID_COLONIES_CORE_FORT_COLONIES") == 1
local userSettingColoniesBelief 			= JFD_GetUserSetting("JFD_CID_COLONIES_BELIEF_ADDITIONS_MISSION_COLONIES") == 1

--Distance Settings
local userSettingColoniesDistanceCore 		= JFD_GetUserSetting("JFD_CID_COLONIES_DISTANCE_CORE") == 1
local userSettingColoniesDistanceForts		= JFD_GetUserSetting("JFD_CID_COLONIES_DISTANCE_CORE_FORT") == 1
local userSettingColoniesDistanceNumCities  = JFD_GetUserSetting("JFD_CID_COLONIES_DISTANCE_CORE_NUM_CITIES")
local worldSizeQuery						= "JFD_CID_COLONIES_DISTANCE_" .. GameInfo.Worlds[Map.GetWorldSize()].Type
local userSettingColoniesDistance			= JFD_GetUserSetting(worldSizeQuery)
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local activePlayerID 						= Game.GetActivePlayer()
local convertTextKey						= Locale.ConvertTextKey
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local beliefMissionColoniesID				= GameInfoTypes["BELIEF_JFD_MISSION_COLONIES"]
local buildingGovernorsMansionID			= GameInfoTypes["BUILDING_JFD_GOVERNORS_MANSION"]
local policyDecolonizationID				= GameInfoTypes["POLICY_DECISIONS_JFD_DECOLONIZATION"]
local unitClassGreatGeneralID				= GameInfoTypes["UNITCLASS_GREAT_GENERAL"]
local unitPromotionColonistID				= GameInfoTypes["PROMOTION_JFD_COLONIAL_SETTLER"] 
local unitPromotionFortColonyID				= GameInfoTypes["PROMOTION_JFD_FORT_COLONY"] 
------------------------------------------------------------------------------------------------------------------------
-- AI
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Colonies_PlayerDoTurn_AI
local eraIndustrialID = GameInfoTypes["ERA_INDUSTRIAL"]
function JFD_CID_Colonies_PlayerDoTurn_AI(playerID)
	local player = Players[playerID]
	if player:IsBarbarian() then return end
	if player:IsHuman() then return end
	if player:GetNumCities() == 1 then return end
	if player:GetCurrentEra() < eraIndustrialID then return end
	local flavourDecolonizaton = JFD_GetLeaderFlavour(playerID, "FLAVOR_JFD_DECOLONIZATION")
	if flavourDecolonizaton == 0 then return end
	if JFD_GetRandom(1,10) > flavourDecolonizaton then return end
	for city in player:Cities() do
		if JFD_IsCityColony(city) then
			if JFD_CanAssimilateColony(playerID, city) then
				LuaEvents.JFD_ColonyDecolonized(playerID, city, false)
			end 
		end
	end
end
if userSettingColoniesCore then
	GameEvents.PlayerDoTurn.Add(JFD_CID_Colonies_PlayerDoTurn_AI)
end
------------------------------------------------------------------------------------------------------------------------
-- COLONIES
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Colonies_CanSell
function JFD_CID_Colonies_CanSell(playerID, buildingID)
	if buildingID == buildingGovernorsMansionID then return false end
	return true
end
if userSettingColoniesCore then
	GameEvents.CityBuildingsIsBuildingSellable.Add(JFD_CID_Colonies_CanSell)
end

--JFD_CID_Colonies_CanConstruct
function JFD_CID_Colonies_CanConstruct(playerID, cityID, buildingID)
	local city = Players[playerID]:GetCityByID(cityID)
	if city:IsPuppet() then
		local building = GameInfo.Buildings[buildingID]
		local buildingClass = GameInfo.BuildingClasses[building.BuildingClass]
		if (buildingClass.MaxPlayerInstances > -1 or buildingClass.MaxGlobalInstances > -1) then
			return false
		end
	end
	return true
end
if userSettingColoniesCore then
	GameEvents.CityCanConstruct.Add(JFD_CID_Colonies_CanConstruct)
end

--JFD_CID_Colonies_CanCreate
function JFD_CID_Colonies_CanCreate(playerID, cityID)
	local city = Players[playerID]:GetCityByID(cityID)
	return (not JFD_IsCityColony(city))
end
if userSettingColoniesCore then
	GameEvents.CityCanCreate.Add(JFD_CID_Colonies_CanCreate)
end

--JFD_CID_Colonies_CityCanTrain
function JFD_CID_Colonies_CityCanTrain(playerID, cityID, unitID)
	local player = Players[playerID]
	local city = player:GetCityByID(cityID)
	if JFD_IsCityColony(city) then
		local unit = GameInfo.Units[unitID]
		return (unit.Class ~= 'UNITCLASS_SETTLER' and unit.Class ~= 'UNITCLASS_JFD_COLONIST')
	end
	return true
end
if userSettingColoniesCore then
	GameEvents.CityCanTrain.Add(JFD_CID_Colonies_CityCanTrain)
end

--JFD_CID_Colonies_PlayerCanTrain
function JFD_CID_Colonies_PlayerCanTrain(playerID, unitID)
	local player = Players[playerID]
	local unit = GameInfo.Units[unitID]
	if (unit.Class == 'UNITCLASS_JFD_COLONIST' and player:HasPolicy(policyDecolonizationID)) then
		return false
	end	
	return true
end
if userSettingColoniesCore then
	GameEvents.PlayerCanTrain.Add(JFD_CID_Colonies_PlayerCanTrain)
end
-----------------
-- SETTLEMENT
-----------------
--JFD_CID_Colonies_UnitMoved
local buildFortID		  = GameInfoTypes["BUILD_FORT"] 
local unitClassColonistID = GameInfoTypes["UNITCLASS_JFD_COLONIST"] 
function JFD_CID_Colonies_UnitMoved(playerID, unitID, plotX, plotY)
	if playerID ~= activePlayerID then return end
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local unitInfo = GameInfo.Units[unit:GetUnitType()]
	local plot = Map.GetPlot(plotX, plotY)
	if (unit and plot and (not unit:IsUnitClass(unitClassColonistID))) then
		if ((unit:IsFound() or unit:IsFoundAbroad()) and (unitInfo.FoundMid == 0 and unitInfo.FoundLate == 0)) then
			if JFD_IsPlotFoundsColony(playerID, plot) then
				JFD_AddPromotion(unit, unitPromotionColonistID, true)
			else
				JFD_AddPromotion(unit, unitPromotionColonistID, false)
			end		
		elseif (userSettingColoniesCoreFort or userSettingColoniesDistanceForts) then
			if (unit:IsUnitClass(unitClassGreatGeneralID) or unit:CanBuild(plot, buildFortID)) then
				if JFD_IsPlotFoundsColony(playerID, plot) then
					JFD_AddPromotion(unit, unitPromotionFortColonyID, true)
				else
					JFD_AddPromotion(unit, unitPromotionFortColonyID, false)
				end
			end
		end	
	end
end	
if (userSettingColoniesCore and userSettingColoniesDistanceCore) then
	GameEvents.UnitSetXY.Add(JFD_CID_Colonies_UnitMoved)
end

--JFD_CID_Colonies_CityFounded
function JFD_CID_Colonies_CityFounded(playerID, unitID, unitTypeID, plotX, plotY)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local plot = Map.GetPlot(plotX, plotY)
	if (plot and unit and unit:HasPromotion(unitPromotionColonistID)) then
		local city = plot:GetPlotCity()
		if (not city) then return end
		JFD_DoEstablishColony(playerID, city, nil, false, nil, plotX, plotY, player:HasBelief(beliefMissionColoniesID))
	end
end
if userSettingColoniesCore then
	GameEvents.UnitCityFounded.Add(JFD_CID_Colonies_CityFounded)
end

--JFD_CID_Colonies_BuildFinished
local improvementFortID	= GameInfoTypes["IMPROVEMENT_FORT"]
function JFD_CID_Colonies_BuildFinished(playerID, plotX, plotY, improvementID) 
	local player = Players[playerID]
	if improvementID == improvementFortID then
		local plot = Map.GetPlot(plotX, plotY)
		if JFD_IsPlotFoundsColony(playerID, plot) then
			JFD_DoEstablishColony(playerID, nil, nil, true, improvementFortID, plotX, plotY, player:HasBelief(beliefMissionColoniesID))
		end
	end
end
if (userSettingColoniesDistanceForts and userSettingColoniesDistance > 0) then
	GameEvents.BuildFinished.Add(JFD_CID_Colonies_BuildFinished)
end

--JFD_CID_Colonies_CityCaptured
local buildingManorID = GameInfoTypes["BUILDING_JFD_MANOR"]
function JFD_CID_Colonies_CityCaptured(oldOwnerID, capital, plotX, plotY, newOwnerID)
	local plot = Map.GetPlot(plotX, plotY)
	local city = plot:GetPlotCity()
	if (not city) then return end
	--if (buildingManorID and city:HasBuilding(buildingManorID)) then return end
	if JFD_IsPlotFoundsColony(newOwnerID, plot, true) then
		city:SetNumRealBuilding(buildingGovernorsMansionID, 1)
	end
end
if userSettingColoniesCore then
	GameEvents.CityCaptureComplete.Add(JFD_CID_Colonies_CityCaptured)	
end
-----------------
-- DECOLONIZATION
-----------------
--JFD_CID_Colonies_ColonyDecolonized
local buildingManorID = GameInfoTypes["BUILDING_JFD_MANOR"]
function JFD_CID_Colonies_ColonyDecolonized(playerID, city, isDecolonization) 
	local player = Players[playerID]
	if (not isDecolonization) then
		local canAssimilate, popReq, goldCost = JFD_CanAssimilateColony(playerID, city)
		player:ChangeGold(-goldCost)
	end
	city:SetNumRealBuilding(buildingGovernorsMansionID, 0)
	local noAnnexing = false
	for row in GameInfo.Traits("NoAnnexing > 0") do
		if player:HasTrait(row.ID) then
			noAnnexing = true
			break
		end
	end
	if (not noAnnexing) then
		city:SetPuppet(false)
		city:SetProductionAutomated(false)
	end
	--city:SetNumRealBuilding(buildingDrillAcademyID, 0)
	if buildingManorID then city:SetNumRealBuilding(buildingManorID, 1) end
	if player:IsHuman() then
		JFD_SendNotification(playerID, "NOTIFICATION_CAPITAL_RECOVERED", Locale.ConvertTextKey("TXT_KEY_JFD_ASSIMILATE_COLONY_NOTIFICATION", city:GetName()), Locale.ConvertTextKey("TXT_KEY_JFD_ASSIMILATE_COLONY_NOTIFICATION_SHORT", city:GetName()), false, city:GetX(), city:GetY())
	end
end
LuaEvents.JFD_ColonyDecolonized.Add(JFD_CID_Colonies_ColonyDecolonized)
-----------------
-- MAGISTRATES
-----------------
--JFD_CID_Colonies_CityPurchasedMagistrateBuilding
function JFD_CID_Colonies_CityPurchasedMagistrateBuilding(playerID, city, buildingID, magistrateCost) 
	local player = Players[playerID]
	city:SetNumRealBuilding(buildingID, 1)
	JFD_ChangeNumMagistrates(playerID, -magistrateCost)
end
LuaEvents.JFD_CityPurchasedMagistrateBuilding.Add(JFD_CID_Colonies_CityPurchasedMagistrateBuilding)
------------------------------------------------------------------------------------------------------------------------
-- MISSIONS
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Colonies_MissionStart
local CUSTOM_MISSION_NO_ACTION		 = 0
local CUSTOM_MISSION_ACTION			 = 1
local CUSTOM_MISSION_DONE            = 2
local CUSTOM_MISSION_ACTION_AND_DONE = 3

local improvementCitadelID			 = GameInfoTypes["IMPROVEMENT_CITADEL"]
local missionFortColonyID			 = GameInfoTypes["MISSION_JFD_FORT_COLONY"]
function JFD_CID_Colonies_MissionStart(playerID, unitID, missionID, data1, data2, flags, turn)
	if missionID == missionFortColonyID then
		local player = Players[playerID]
		local unit = player:GetUnitByID(unitID)
		JFD_DoEstablishColony(playerID, nil, unit, true, improvementCitadelID, unit:GetX(), unit:GetY(), player:HasBelief(beliefMissionColoniesID))
		return CUSTOM_MISSION_ACTION
	end
	return CUSTOM_MISSION_NO_ACTION
end
if userSettingColoniesCoreFort then
	GameEvents.CustomMissionStart.Add(JFD_CID_Colonies_MissionStart)
end

--JFD_CID_Colonies_MissionComplete
function JFD_CID_Colonies_MissionComplete(playerID, unitID, missionID, data1, data2, flags, turn)
    if (missionID == missionFortColonyID) then return true end
	return false
end
if userSettingColoniesCoreFort then
	GameEvents.CustomMissionCompleted.Add(JFD_CID_Colonies_MissionComplete)
end
--=======================================================================================================================
--=======================================================================================================================