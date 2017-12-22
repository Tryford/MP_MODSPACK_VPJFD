-- JFD_CID_Functions
-- Author: JFD
-- DateCreated: 9/6/2016 11:05:48 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_CIDUtils.lua")
include("JFD_CID_ProvincesUtils.lua")
include("JFD_RTPUtils.lua")
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingColoniesCore  = JFD_GetUserSetting("JFD_CID_COLONIES_CORE") == 1
local userSettingProvincesCore = JFD_GetUserSetting("JFD_CID_PROVINCES_CORE") == 1
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
-- INIT
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_InitPolicies
function JFD_CID_InitPolicies()
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local player = Players[playerID]
		if player:IsAlive() then
			local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
			for row in GameInfo.Civilization_FreePolicies("CivilizationType = '" .. civType .. "'") do
				player:GrantPolicy(GameInfoTypes[row.PolicyType], true)
			end
		end
	end
end
Events.LoadScreenClose.Add(JFD_CID_InitPolicies)
------------------------------------------------------------------------------------------------------------------------
-- MISSIONS
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_MissionPossible
local CUSTOM_MISSION_NO_ACTION		 = 0
local CUSTOM_MISSION_ACTION			 = 1
local CUSTOM_MISSION_DONE            = 2
local CUSTOM_MISSION_ACTION_AND_DONE = 3

local unitPromotionFortColonyID		 = GameInfoTypes["PROMOTION_JFD_FORT_COLONY"] 
function JFD_CID_MissionPossible(playerID, unitID, missionID, data1, data2, _, _, plotX, plotY, bTestVisible)
	if (not playerID) then return end
	if (not unitID) then return end
	if (not missionID) then return end
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	for row in GameInfo.Unit_Missions("UnitType = '" .. GameInfo.Units[unit:GetUnitType()].Type .. "' AND MissionType = '" .. GameInfo.Missions[missionID].Type .."'") do
		if unit:GetDamage() ~= 0 then return bTestVisible end
		if row.RequiredPolicy then
			if (not player:HasPolicy(GameInfoTypes[row.RequiredPolicy])) then return false end	
		end
		if row.RequiredTrait then
			if (not player:HasTrait(GameInfoTypes[row.RequiredTrait])) then return false end		
		end
		if row.IsReclaim then
			local unitPlot = Map.GetPlot(plotX, plotY)
			local plotCity = unitPlot:GetWorkingCity()
			if (not plotCity) then return bTestVisible end
			local currentOwnerID = plotCity:GetOwner()
			local originalOwnerID = plotCity:GetOriginalOwner()
			if (currentOwnerID == playerID or originalOwnerID ~= playerID or player:IsAtWarWith(originalOwnerID)) then return bTestVisible end		
		end	
		if row.RequiresCapital then
			local unitPlot = Map.GetPlot(plotX, plotY)
			local plotCity = unitPlot:GetPlotCity()
			if (not plotCity) then return bTestVisible end
			if (not plotCity:IsCapital()) then return bTestVisible end
		end
		if row.RequiresCity then
			local unitPlot = Map.GetPlot(plotX, plotY)
			if (not unitPlot:GetPlotCity()) then return bTestVisible end
		end
		if (userSettingColoniesCore and row.RequiresColonyPlot) then
			if (unit:GetDamage() ~= 0 or (not unit:HasPromotion(unitPromotionFortColonyID))) then return bTestVisible end
			local unitPlot = Map.GetPlot(plotX, plotY)
			if (unitPlot:IsTerrainCoast() or unitPlot:IsTerrainOcean() or unitPlot:IsTerrainMountain()) then return bTestVisible end
		end
		if row.RequiresGovernment then
			if (not player:HasGovernment()) then return false end
		end
		if row.RequiresOccupiedOrPuppet then
			local unitPlot = Map.GetPlot(plotX, plotY)
			local plotCity = unitPlot:GetPlotCity()
			if (not plotCity) then return bTestVisible end
			if (not plotCity:IsPuppet()) and (not plotCity:IsOccupied()) then return bTestVisible end
		end
		if (userSettingProvincesCore and row.RequiresUpgradeableProvince) then
			local unitPlot = Map.GetPlot(plotX, plotY)
			local plotCity = unitPlot:GetPlotCity()
			if (not plotCity) then return bTestVisible end
			if (not GameInfo.JFD_Provinces[JFD_GetProvinceID(playerID, plotCity)].UpgradeProvinceType) then return bTestVisible	end	
		end
		return true
	end
	for row in GameInfo.UnitClass_Missions("UnitClassType = '" .. GameInfo.Units[unit:GetUnitType()].Class .. "' AND MissionType = '" .. GameInfo.Missions[missionID].Type .."'") do
		if unit:GetDamage() ~= 0 then return bTestVisible end
		if row.RequiredPolicy then
			if (not player:HasPolicy(GameInfoTypes[row.RequiredPolicy])) then return false end	
		end
		if row.RequiredTrait then
			if (not player:HasTrait(GameInfoTypes[row.RequiredTrait])) then return false end		
		end
		if row.IsReclaim then
			local unitPlot = Map.GetPlot(plotX, plotY)
			local plotCity = unitPlot:GetWorkingCity()
			if (not plotCity) then return bTestVisible end
			local currentOwnerID = plotCity:GetOwner()
			local originalOwnerID = plotCity:GetOriginalOwner()
			if (currentOwnerID == playerID or originalOwnerID ~= playerID or player:IsAtWarWith(originalOwnerID)) then return bTestVisible end		
		end	
		if row.RequiresCapital then
			local unitPlot = Map.GetPlot(plotX, plotY)
			local plotCity = unitPlot:GetPlotCity()
			if (not plotCity) then return bTestVisible end
			if (not plotCity:IsCapital()) then return bTestVisible end
		end
		if row.RequiresCity then
			local unitPlot = Map.GetPlot(plotX, plotY)
			if (not unitPlot:GetPlotCity()) then return bTestVisible end
		end
		if (userSettingColoniesCore and row.RequiresColonyPlot) then
			if (unit:GetDamage() ~= 0 or (not unit:HasPromotion(unitPromotionFortColonyID))) then return bTestVisible end
			local unitPlot = Map.GetPlot(plotX, plotY)
			if (unitPlot:IsTerrainCoast() or unitPlot:IsTerrainOcean() or unitPlot:IsTerrainMountain()) then return bTestVisible end
		end
		if row.RequiresGovernment then
			if (not player:HasGovernment()) then return false end
		end
		if row.RequiresOccupiedOrPuppet then
			local unitPlot = Map.GetPlot(plotX, plotY)
			local plotCity = unitPlot:GetPlotCity()
			if (not plotCity) then return bTestVisible end
			if (not plotCity:IsPuppet()) and (not plotCity:IsOccupied()) then return bTestVisible end
		end
		if (userSettingProvincesCore and row.RequiresUpgradeableProvince) then
			local unitPlot = Map.GetPlot(plotX, plotY)
			local plotCity = unitPlot:GetPlotCity()
			if (not plotCity) then return bTestVisible end
			if (not GameInfo.JFD_Provinces[JFD_GetProvinceID(playerID, plotCity)].UpgradeProvinceType) then return bTestVisible	end	
		end
		return true
	end
	return false
end
GameEvents.CustomMissionPossible.Add(JFD_CID_MissionPossible)
------------------------------------------------------------------------------------------------------------------------
-- YIELDS
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_PlayerDoTurn
local buildingDefenseID = GameInfoTypes["BUILDING_JFD_DEFENSE"]
local yieldDefenseID    = GameInfoTypes["YIELD_DEFENSE"]
function JFD_CID_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if player:IsBarbarian() then return end
	if(not player:IsAlive()) then return end
	for city in player:Cities() do
		local numDefense = JFD_GetBaseFakeYield(city, yieldDefenseID)
		city:SetNumRealBuilding(buildingDefenseID, numDefense)
		for row in GameInfo.Policy_BuildingClassGreatPeoplePointsChange() do
			if city:HasBuildingClass(GameInfoTypes[row.BuildingClassType]) then
				city:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes[row.SpecialistType], (row.PointsChange*100))
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_CID_PlayerDoTurn)
--=======================================================================================================================
-- TSL
--=======================================================================================================================
include("CID_TableSaverLoader016.lua")
tableRoot = JFD_CID
tableName = "JFD_CID"
include("JFD_CID_TSLSerializerV3.lua")
TableLoad(tableRoot, tableName)
------------------------------------------------------------------------------------------------------------------------
-- TSL UTILITIES	
------------------------------------------------------------------------------------------------------------------------
-- OnModLoaded
function OnModLoaded() 
	local bNewGame = not TableLoad(tableRoot, tableName)
	TableSave(tableRoot, tableName)
end
OnModLoaded()
--=======================================================================================================================
--=======================================================================================================================
