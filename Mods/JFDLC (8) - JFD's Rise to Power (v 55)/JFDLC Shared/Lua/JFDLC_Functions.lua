-- JFDLC_Functions
-- Author: JFD
-- DateCreated: 2/7/2017 1:38:06 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFDLCUtils.lua")
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
-- SETTINGS
--------------------------------------------------------------------------------------------------------------------------
local userSettingLevelUpSound = (Game.GetUserSetting("JFDLC_MISC_UNIT_LEVEL_UP_SOUND") == 1)
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local activePlayerID				= Game.GetActivePlayer()
local activePlayer					= Players[activePlayerID]
local mathMin						= math.min

local gameSpeed						= GameInfo.GameSpeeds[Game.GetGameSpeedType()]
local gameSpeedMod					= (gameSpeed.BuildPercent/100)
local gameSpeedType 				= gameSpeed.Type 

local promotionEnslavedID			= GameInfoTypes["PROMOTION_JFD_ENSLAVED"]
local promotionLevyID				= GameInfoTypes["PROMOTION_JFD_LEVY"]

local unitClassMissionaryID			= GameInfoTypes["UNITCLASS_MISSIONARY"]
local unitCombatMountedID			= GameInfoTypes["UNITCOMBAT_MOUNTED"]
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- JFDLC
------------------------------------------------------------------------------------------------------------------------
--JFDLC_LoadScreenClose
function JFDLC_LoadScreenClose()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		local title = Modding.GetModProperty(mod.ID, mod.Version, "Name");
		title = Locale.TruncateString(title, 100, true);
		print(mod.ID, title, ": Active")
	end	
end
Events.LoadScreenClose.Add(JFDLC_LoadScreenClose)

--JFDLC_PlayerDoTurn
local buildingDefenseID = GameInfoTypes["BUILDING_JFD_DEFENSE"]
local plotHillsID	 	= GameInfoTypes["PLOT_HILLS"]
local plotMountainID 	= GameInfoTypes["PLOT_MOUNTAIN"]
local yieldDefenseID    = GameInfoTypes["YIELD_DEFENSE"]
function JFDLC_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if player:IsMinorCiv() then return end
	if player:IsBarbarian() then return end
	local extraFaithFromGAP = player:GetExtraFaithFromGAP()
	if extraFaithFromGAP ~= 0 then 
		player:ChangeFaith(extraFaithFromGAP)
	end
	local extraGAPFromHappiness = GetExtraGAPFromHappiness(playerID)
	if extraGAPFromHappiness ~= 0 then 
		player:ChangeGoldenAgeProgressMeter(extraGAPFromHappiness)
	end
	local extraGAPFromFaith = GetExtraGAPFromFaith(playerID)
	if extraGAPFromFaith ~= 0 then 
		player:ChangeGoldenAgeProgressMeter(extraGAPFromFaith)
	end
	for city in player:Cities() do
		local numDefense = player:GetBaseFakeYield(city, yieldDefenseID)
		city:SetNumRealBuilding(buildingDefenseID, numDefense)
		if city:IsResistance() then
			for row in GameInfo.Beliefs("HalvesResistance = 1") do
				if player:HasBelief(row.ID) then
					city:ChangeResistanceTurns(-1)
				end
			end
		end
		for row in GameInfo.Policy_BuildingClassGreatPeoplePointsChange() do
			if (player:HasPolicy(GameInfoTypes[row.PolicyType]) and city:HasBuildingClass(GameInfoTypes[row.BuildingClassType])) then
				city:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes[row.SpecialistType], (row.PointsChange*100))
			end
		end
		for row in GameInfo.Policy_FreeBuildingWithBuildingClass() do
			local buildingID = nil
			local buildingClassID = nil
			if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
				if row.RequiresHillsOrMountains then
					if (city:IsOnPlotType(plotHillsID) or city:IsOnPlotType(plotMountainID)) then
						buildingID = GameInfoTypes[row.BuildingType]
						buildingClassID = GameInfoTypes[row.BuildingClassType]
					end
				else
					buildingID = GameInfoTypes[row.BuildingType]
					buildingClassID = GameInfoTypes[row.BuildingClassType]	
				end
				if (buildingID and buildingClassID) then
					if city:HasBuildingClass(buildingClassID) then
						if (not city:HasBuilding(buildingID)) then
							city:SetNumRealBuilding(buildingID, 1)
						end
					else
						if city:HasBuilding(buildingID) then
							city:SetNumRealBuilding(buildingID, 0)
						end
					end
				end
			end
		end	
		for row in GameInfo.Policy_FreeBuildingClassWithBuildingClass() do
			local buildingID = nil
			local buildingClassID = nil
			if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
				buildingID = player:GetSpecificBuildingType(row.BuildingClassType)
				buildingClassID = GameInfoTypes[row.BuildingClassTypeReq]	
				if (buildingID and buildingClassID) then
					if city:HasBuildingClass(buildingClassID) then
						if (not city:HasBuilding(buildingID)) then
							city:SetNumRealBuilding(buildingID, 1)
						end
					else
						if city:HasBuilding(buildingID) then
							city:SetNumRealBuilding(buildingID, 0)
						end
					end
				end
			end
		end	
		for row in GameInfo.Policy_FreeBuildingWithPlotObject() do
			if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
				local canHaveBuilding = false
				local featureID = GameInfoTypes[row.FeatureType]
				local improvementID = GameInfoTypes[row.ImprovementType]
				local plotID = GameInfoTypes[row.PlotType]
				local resourceID = GameInfoTypes[row.ResourceType]
				local terrainID = GameInfoTypes[row.TerrainType]
				local reqsAdjacent = row.ReqsAdjacent
				if featureID then
					if reqsAdjacent then canHaveBuilding = city:IsAdjacentToFeature(featureID) else canHaveBuilding = city:HasFeature(featureID) end
				end
				if improvementID then
					if reqsAdjacent then canHaveBuilding = city:IsAdjacentToImprovement(improvementID) else canHaveBuilding = city:HasImprovement(improvementID) end
				end
				if plotID then
					if reqsAdjacent then canHaveBuilding = city:IsAdjacentToPlotType(plotID) else canHaveBuilding = city:HasPlot(plotID) end
				end
				if resourceID then
					if reqsAdjacent then canHaveBuilding = city:IsAdjacentToResource(resourceID) else canHaveBuilding = city:HasResource(resourceID) end
				end
				if terrainID then
					if reqsAdjacent then canHaveBuilding = city:IsAdjacentToTerrain(terrainID) else canHaveBuilding = city:HasTerrain(terrainID) end
				end
				if canHaveBuilding then
					local buildingID = GameInfoTypes[row.BuildingType]
					if (not city:HasBuilding(buildingID)) then
						city:SetNumRealBuilding(buildingID, 1)
					end
				else
					if city:HasBuilding(buildingID) then
						city:SetNumRealBuilding(buildingID, 0)
					end
				end
			end
		end
		if city:GetWeLoveTheKingDayCounter() > 0 then
			for row in GameInfo.Policy_FreeBuildingWithWLTKD() do
				if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
					local buildingID = GameInfoTypes[row.BuildingType]
					if (not city:HasBuilding(buildingID)) then
						city:SetNumRealBuilding(buildingID, 1)
					end
				end
			end	
		else
			for row in GameInfo.Policy_FreeBuildingWithWLTKD() do
				local buildingID = GameInfoTypes[row.BuildingType]
				if city:HasBuilding(buildingID) then
					city:SetNumRealBuilding(buildingID, 0)
				end
			end	
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFDLC_PlayerDoTurn)

--JFDLC_CityBoughtPlot
local notificationCityTileID = NotificationTypes["NOTIFICATION_CITY_TILE"]
function JFDLC_CityBoughtPlot(playerID, cityID, plotX, plotY, isGold, isCulture)
	if (not isCulture) then return end
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (not player:IsHuman()) then return end
	local city = player:GetCityByID(cityID)
	player:AddNotification(notificationCityTileID, Locale.ConvertTextKey("TXT_KEY_JFD_TILE_ACQUIRED_NOTIFICATION", city:GetName()), Locale.ConvertTextKey("TXT_KEY_JFD_TILE_ACQUIRED_NOTIFICATION_SHORT", city:GetName()), plotX, plotY)
end
GameEvents.CityBoughtPlot.Add(JFDLC_CityBoughtPlot)
------------------------------------------------------------------------------------------------------------------------
-- BUILDINGS
------------------------------------------------------------------------------------------------------------------------
--JFDLC_CityConstructed
local unitPromotionDaVinciID = GameInfoTypes["PROMOTION_JFD_DA_VINCI"]
function JFDLC_CityConstructed(playerID, cityID, buildingID)
	local player = Players[playerID]
	local city = player:GetCityByID(cityID)
	local building = GameInfo.Buildings[buildingID]
	local buildingClass = GameInfo.BuildingClasses[building.BuildingClass]
	if (buildingClass.MaxGlobalInstances == 1 and building.PrereqTech) then LuaEvents.JFD_RefreshDisplayOfSpecificTech(GameInfo.Technologies[building.PrereqTech], true) end
	if building.FreeProphetHasReformation then
		for row in GameInfo.Policies("AddReformationBelief = 1") do
			if player:HasPolicy(row.ID) then
				local unitID = player:GetSpecificUnitType("UNITCLASS_PROPHET")
				player:InitUnit(unitID, city:GetX(), city:GetY())
				break
			end
		end
	end
	if building.FreeUnitCombatUpgrades then
		local unitCombatID = GameInfoTypes[building.FreeUnitCombatUpgrades]
		for unit in player:Units() do
			if unit:GetUnitCombatType() == unitCombatID then
				--local unitUpgradeID = unit:GetUpgradeUnitType()
				--unit:UpgradeTo(unitUpgradeID, true)
				local unitUpgradeID = unit:GetUpgradeUnitType()
				if (unitUpgradeID and (not unit:IsHasPromotion(unitPromotionDaVinciID))) then
					local newUnit = player:InitUnit(unitUpgradeID, unit:GetX(), unit:GetY())
					newUnit:Convert(unit)
					newUnit:SetHasPromotion(unitPromotionDaVinciID, true)
				end
			end
		end	
	end
	if building.GrantsPantheon then
		player:ChangeFaith(Game.GetMinimumFaithNextPantheon())
	end
	for row in GameInfo.Policy_YieldFromBuildingClassConstructed("BuildingClassType = '" .. building.BuildingClass .. "'") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			local yieldType = row.YieldType
			local rewardYield = row.Yield
			local eraMod = (player:GetCurrentEra()*30)
			if eraMod > 0 then
				rewardYield = rewardYield + ((rewardYield*eraMod)/100)
			end
			if yieldType == "YIELD_CULTURE" then
				player:ChangeJONSCulture(rewardYield)
			elseif yieldType == "YIELD_FAITH" then
				player:ChangeFaith(rewardYield)
			elseif yieldType == "YIELD_GOLDEN_AGE_POINTS" then
				player:ChangeGoldenAgeProgressMeter(rewardYield)
			elseif yieldType == "YIELD_PRODUCTION" then
				city:ChangeProduction(rewardYield)
			elseif yieldType == "YIELD_JFD_PIETY" then
				player:ChangePiety(rewardYield)
			elseif yieldType == "YIELD_FOOD" then
				city:ChangeFood(rewardYield)
			end
			local yield = GameInfo.Yields[yieldType]
			if player:IsHuman() then
				local hex = ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))
				Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("{3_Color}+{1_Num}[ENDCOLOR] {2_Desc}", rewardYield, yield.IconString, yield.ColorString), true)
			end	
		end
	end
end
GameEvents.CityConstructed.Add(JFDLC_CityConstructed)

--JFDLC_CityCanConstruct
function JFDLC_CityCanConstruct(playerID, cityID, buildingID)
	local player = Players[playerID]
	local cityID = player:GetCityByID(cityID)
	local building = GameInfo.Buildings[buildingID]
	if building.IsNotCapital then
		return (not city:IsCapital())
	end	
	return true
end
GameEvents.CityCanConstruct.Add(JFDLC_CityCanConstruct)

--JFDLC_CityBuildingsIsBuildingSellable
function JFDLC_CityBuildingsIsBuildingSellable(playerID, buildingID)
	return (not GameInfo.Buildings[buildingID].CannotBeSold)
end
GameEvents.CityBuildingsIsBuildingSellable.Add(JFDLC_CityBuildingsIsBuildingSellable)
------------------------------------------------------------------------------------------------------------------------
-- CITIES
------------------------------------------------------------------------------------------------------------------------
--JFDLC_CityBeginsWLTKD
function JFDLC_CityBeginsWLTKD(playerID, plotX, plotY, WLTKDTurns)
	local player = Players[playerID]
	local city = Map.GetPlot(plotX, plotY):GetPlotCity()
	if (not city) then return end
	LuaEvents.JFD_WLTKDBegins(playerID, city, city:GetX(), city:GetY(), WLTKDTurns, -1, true)
end
GameEvents.CityBeginsWLTKD.Add(JFDLC_CityBeginsWLTKD)

--JFDLC_CityCaptureComplete
function JFDLC_CityCaptureComplete(oldOwnerID, capital, plotX, plotY, newOwnerID)
	local player = Players[newOwnerID]
	local plot = Map.GetPlot(plotX, plotY)
	local city = plot:GetPlotCity()
	if city:GetOriginalOwner() == newOwnerID then return end
	for row in GameInfo.Policies("ClaimsTilesOnConquest > 0") do
		if player:HasPolicy(row.ID) then
			for loopPlot in PlotAreaSweepIterator(plot, row.ClaimsTilesOnConquest, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				if loopPlot:GetOwner() == -1 then
					loopPlot:SetOwner(playerID, city:GetID(), true, true)
					loopPlot:SetRevealed(player:GetTeam(), true)
				end
			end	
		end
	end
end
GameEvents.CityCaptureComplete.Add(JFDLC_CityCaptureComplete)

--JFDLC_CityConnected
function JFDLC_CityConnected(playerID, plotX, plotY, toPlotX, toPlotY, isDirect)
	if isDirect then return false end
	local player = Players[playerID]
	local plot = Map.GetPlot(plotX, plotY)
	local toPlot = Map.GetPlot(toPlotX, toPlotY)
	for policy in GameInfo.Policies("FeatureConnections IS NOT NULL") do
		if player:HasPolicy(policy.ID) then
			local featureID = GameInfoTypes[policy.FeatureConnections]
			if (plot:IsAdjacentToFeature(featureID) and toPlot:IsAdjacentToFeature(featureID)) then
				return true
			end	
		end	
	end
	return false
end
GameEvents.CityConnected.Add(JFDLC_CityConnected)

--JFDLC_CityConnections
function JFDLC_CityConnections(playerID, isDirect)
	if isDirect then return false end
	local player = Players[playerID]
	for policy in GameInfo.Policies("FeatureConnections IS NOT NULL") do
		if player:HasPolicy(policy.ID) then
			return true
		end
	end
	return false
end
GameEvents.CityConnections.Add(JFDLC_CityConnections)

--JFDLC_WLTKDBegins
function JFDLC_WLTKDBegins(playerID, city, plotX, plotY, WLTKDTurns)
	local player = Players[playerID]
	if (not city) then return end
	for row in GameInfo.Policies("WLTKDModifier <> 0") do
		if player:HasPolicy(row.ID) then
			local newTurns = ((WLTKDTurns*row.WLTKDModifier)/100)
			city:ChangeWeLoveTheKingDayCounter(newTurns)
		end
	end
end
LuaEvents.JFD_WLTKDBegins.Add(JFDLC_WLTKDBegins)
------------------------------------------------------------------------------------------------------------------------
-- MISSIONS
------------------------------------------------------------------------------------------------------------------------
--JFDLC_CustomMissionPossible
local CUSTOM_MISSION_NO_ACTION		 = 0
local CUSTOM_MISSION_ACTION			 = 1
local CUSTOM_MISSION_DONE            = 2
local CUSTOM_MISSION_ACTION_AND_DONE = 3
function JFDLC_CustomMissionPossible(playerID, unitID, missionID, data1, data2, _, _, plotX, plotY, bTestVisible)
	if ((not playerID) or (not unitID) or (not missionID)) then return end
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local unitInfo = GameInfo.Units[unit:GetUnitType()]
	local unitPlot = Map.GetPlot(plotX, plotY)
	local missionType = GameInfo.Missions[missionID].Type
	local isMissionPossible = false
	for row in GameInfo.Unit_Missions("UnitType = '" .. unitInfo.Type .. "' AND MissionType = '" .. missionType .."'") do
		isMissionPossible = true
		if row.RequiresBeliefType then
			if (not player:HasBelief(GameInfoTypes[row.RequiresBeliefType])) then 
				isMissionPossible = false
			end
		end
		if row.RequiresPromotionType then
			if (not unit:HasPromotion(GameInfoTypes[row.RequiresPromotionType])) then 
				isMissionPossible = false
			end
		end
	end
	for row in GameInfo.UnitClass_Missions("UnitClassType = '" .. unitInfo.Class .. "' AND MissionType = '" .. missionType .."'") do
		isMissionPossible = true
		if row.RequiresBeliefType then
			if (not player:HasBelief(GameInfoTypes[row.RequiresBeliefType])) then 
				isMissionPossible = false
			end
		end
		if row.RequiresPromotionType then
			if (not unit:HasPromotion(GameInfoTypes[row.RequiresPromotionType])) then 
				isMissionPossible = false
			end
		end
	end
	local city = unitPlot:GetPlotCity()
	if isMissionPossible then
		for row in GameInfo.Mission_Conditions("MissionType = '" .. missionType .."'") do
			if row.RequiresCity then
				if (not city) then return bTestVisible end
			end
			if row.RequiresEnhancedReligionToBeVisible then
				if (not player:HasEnhancedReligion()) then return false end
			end
			if row.RequiresHolyCity then
				if (not city) then return bTestVisible end
				if (not city:IsHolyCityAnyReligion()) then return bTestVisible end 
			end
			if row.RequiresGovernment then
				if (not player:HasGovernment()) then return bTestVisible end
			end
			if row.RequiresNotPolicyType then
				if player:HasPolicy(GameInfoTypes[row.RequiresNotPolicyType]) then return end
			end	
			if row.RequiresStateReligion then
				if (not player:HasStateReligion()) then return bTestVisible end
			end
			if row.RequiresUnitFullSpreads then
				if (unitInfo.ReligionSpreads > 0 and unitInfo.ReligionSpreads ~= unit:GetSpreadsLeft()) then return bTestVisible end
				if unit:GetDamage() ~= 0 then return bTestVisible end
			end
			if row.RequiresUnitFullHP then
				if unit:GetDamage() ~= 0 then return bTestVisible end
			end
		end
	end
	return isMissionPossible
end
GameEvents.CustomMissionPossible.Add(JFDLC_CustomMissionPossible)
------------------------------------------------------------------------------------------------------------------------
-- NOTIFICATIONS
------------------------------------------------------------------------------------------------------------------------
--JFDLC_Misc_NotificationSound
function JFDLC_Misc_NotificationSound(notificationType, notificationID, headerText, summaryText)
	for row in GameInfo.Notificaton_AudioSoundFiles("AudioSoundFile IS NOT NULL") do
		if NotificationTypes[row.NotificationType] == notificationID then
			Events.AudioPlay2DSound(row.AudioSoundFile)
		end
	end
end
Events.NotificationAdded.Add(JFDLC_Misc_NotificationSound)
------------------------------------------------------------------------------------------------------------------------
-- PLAYERS
------------------------------------------------------------------------------------------------------------------------
--JFDLC_GetReligionToFound
function JFDLC_GetReligionToFound(playerID, religionID, isAlreadyFounded)
	local player = Players[playerID]
	if isAlreadyFounded then
		local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
		local religionType = GameInfo.Religions[religionID].Type
		local altReligionID = nil
		for row in GameInfo.Civilization_Religions("CivilizationType = '" .. civType .. "' AND ReligionType IS NOT '" .. religionType .. "'") do
			altReligionID = GameInfoTypes[row.ReligionType]
			if (not Game.AnyoneHasReligion(altReligionID)) then
				religionID = altReligionID
				break
			end
		end
		if (not altReligionID) then
			for row in GameInfo.Religion_SchismReligions("ReligionType IS '" .. religionType .. "'") do
				altReligionID = GameInfoTypes[row.SchismReligionType]
				if (not Game.AnyoneHasReligion(altReligionID)) then
					religionID = altReligionID
					break
				end
			end
		end
	end
	return religionID
end
GameEvents.GetReligionToFound.Add(JFDLC_GetReligionToFound)

--JFDLC_LoadScreenClose
function JFDLC_LoadScreenClose()
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
Events.LoadScreenClose.Add(JFDLC_LoadScreenClose)
------------------------------------------------------------------------------------------------------------------------
-- POLICIES
------------------------------------------------------------------------------------------------------------------------
--JFDLC_PlayerAdoptsPolicyBranch
function JFDLC_PlayerAdoptsPolicyBranch(playerID, policyID)
	local player = Players[playerID]
	local capital = player:GetCapitalCity()
	if (not capital) then return end
	local policy = GameInfo.Policies[policyID]
	if policy.CapitalWLTKDTurns then
		local turnsWLTKD = Game.GetRound(policy.CapitalWLTKDTurns*gameSpeedMod)
		LuaEvents.JFD_WLTKDBegins(playerID, capital, capital:GetX(), capital:GetY(), turnsWLTKD, -1, true)
	end	
end
GameEvents.PlayerAdoptsPolicyBranch.Add(JFDLC_PlayerAdoptsPolicyBranch)

--JFDLC_PlayerAdoptsPolicy
function JFDLC_PlayerAdoptsPolicy(playerID, policyID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if player:IsMinorCiv() then return end
	if player:IsBarbarian() then return end
	local policy = GameInfo.Policies[policyID]
	local policyType = policy.Type
	local capital = player:GetCapitalCity()
	if (not capital) then return end
	if policy.CapitalWLTKDTurns then
		local turnsWLTKD = Game.GetRound(policy.CapitalWLTKDTurns*gameSpeedMod)
		LuaEvents.JFD_WLTKDBegins(playerID, capital, capital:GetX(), capital:GetY(), turnsWLTKD, -1, true)
	end	
	for city in player:Cities() do
		for row in GameInfo.Policy_FreeBuildingWithBuildingClass() do
			local buildingID = nil
			local buildingClassID = nil
			if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
				if row.RequiresHillsOrMountains then
					if (city:IsOnPlotType(plotHillsID) or city:IsOnPlotType(plotMountainID)) then
						buildingID = GameInfoTypes[row.BuildingType]
						buildingClassID = GameInfoTypes[row.BuildingClassType]
					end
				else
					buildingID = GameInfoTypes[row.BuildingType]
					buildingClassID = GameInfoTypes[row.BuildingClassType]	
				end
				if (buildingID and buildingClassID) then
					if city:HasBuildingClass(buildingClassID) then
						if (not city:HasBuilding(buildingID)) then
							city:SetNumRealBuilding(buildingID, 1)
						end
					else
						if city:HasBuilding(buildingID) then
							city:SetNumRealBuilding(buildingID, 0)
						end
					end
				end
			end
		end	
		for row in GameInfo.Policy_FreeBuildingClassWithBuildingClass() do
			local buildingID = nil
			local buildingClassID = nil
			if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
				buildingID = player:GetSpecificBuildingType(row.BuildingClassType)
				buildingClassID = GameInfoTypes[row.BuildingClassTypeReq]	
				if (buildingID and buildingClassID) then
					if city:HasBuildingClass(buildingClassID) then
						if (not city:HasBuilding(buildingID)) then
							city:SetNumRealBuilding(buildingID, 1)
						end
					else
						if city:HasBuilding(buildingID) then
							city:SetNumRealBuilding(buildingID, 0)
						end
					end
				end
			end
		end	
		if city:GetWeLoveTheKingDayCounter() > 0 then
			for row in GameInfo.Policy_FreeBuildingWithWLTKD() do
				if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
					local buildingID = GameInfoTypes[row.BuildingType]
					if (not city:HasBuilding(buildingID)) then
						city:SetNumRealBuilding(buildingID, 1)
					end
				end
			end	
		else
			for row in GameInfo.Policy_FreeBuildingWithWLTKD() do
				local buildingID = GameInfoTypes[row.BuildingType]
				if city:HasBuilding(buildingID) then
					city:SetNumRealBuilding(buildingID, 0)
				end
			end	
		end
		for row in GameInfo.Policy_FreeBuildingWithPlotObject() do
			if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
				local canHaveBuilding = false
				local featureID = GameInfoTypes[row.FeatureType]
				local improvementID = GameInfoTypes[row.ImprovementType]
				local plotID = GameInfoTypes[row.PlotType]
				local resourceID = GameInfoTypes[row.ResourceType]
				local terrainID = GameInfoTypes[row.TerrainType]
				local reqsAdjacent = row.ReqsAdjacent
				if featureID then
					if reqsAdjacent then canHaveBuilding = city:IsAdjacentToFeature(featureID) else canHaveBuilding = city:HasFeature(featureID) end
				end
				if improvementID then
					if reqsAdjacent then canHaveBuilding = city:IsAdjacentToImprovement(improvementID) else canHaveBuilding = city:HasImprovement(improvementID) end
				end
				if plotID then
					if reqsAdjacent then canHaveBuilding = city:IsAdjacentToPlotType(plotID) else canHaveBuilding = city:HasPlot(plotID) end
				end
				if resourceID then
					if reqsAdjacent then canHaveBuilding = city:IsAdjacentToResource(resourceID) else canHaveBuilding = city:HasResource(resourceID) end
				end
				if terrainID then
					if reqsAdjacent then canHaveBuilding = city:IsAdjacentToTerrain(terrainID) else canHaveBuilding = city:HasTerrain(terrainID) end
				end
				local buildingID = GameInfoTypes[row.BuildingType]
				if canHaveBuilding then
					if (not city:HasBuilding(buildingID)) then
						city:SetNumRealBuilding(buildingID, 1)
					end
				else
					if city:HasBuilding(buildingID) then
						city:SetNumRealBuilding(buildingID, 0)
					end
				end
			end
		end
		if policy.ClaimsTilesOnConquest > 0 then
			if city:GetOriginalOwner() ~= playerID then
				local plot = Map.GetPlot(city:GetX(), city:GetY())
				for loopPlot in PlotAreaSweepIterator(plot, policy.ClaimsTilesOnConquest, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					if loopPlot:GetOwner() == -1 then
						loopPlot:SetOwner(playerID, city:GetID(), true, true)
						loopPlot:SetRevealed(player:GetTeam(), true)
					end
				end
			end
		end
	end
	for unit in player:Units() do
		local unitClass = GameInfo.UnitClasses[unit:GetUnitClassType()]
		local unitCombat = GameInfo.UnitCombatInfos[unit:GetUnitCombatType()]
		if policy.RemovesUnwelcomeEvangelist then
			if unit:IsHasPromotion(promotionUnwelcomeEvangelistID) then
				unit:SetHasPromotion(promotionUnwelcomeEvangelistID, false)
			end
		end
		for row in GameInfo.Policy_FreePromotions("PolicyType = '" .. policyType .. "' AND IsAll = 1") do
			local promotionID = GameInfoTypes[row.PromotionType]
			if (not unit:IsHasPromotion(promotionID)) then
				unit:SetHasPromotion(promotionID, true)
			end
		end
		for row in GameInfo.Policy_FreePromotions("PolicyType = '" .. policyType .. "' AND IsAllCombat = 1") do
			local promotionID = GameInfoTypes[row.PromotionType]
			if ((not unit:IsHasPromotion(promotionID)) and unit:IsCombatUnit()) then
				unit:SetHasPromotion(promotionID, true)
			end
		end
		for row in GameInfo.Policy_FreePromotions("PolicyType = '" .. policyType .. "' AND IsLevy = 1") do
			local promotionID = GameInfoTypes[row.PromotionType]
			if unit:IsHasPromotion(promotionLevyID) and (not unit:IsHasPromotion(promotionID)) then
				unit:SetHasPromotion(promotionID, true)
			end
		end
		for row in GameInfo.Policy_FreePromotions("PolicyType = '" .. policyType .. "' AND IsMercenary = 1") do
			local promotionID = GameInfoTypes[row.PromotionType]
			if unit:IsSpecificContractUnit(contractID) and (not unit:IsHasPromotion(promotionID)) then
				unit:SetHasPromotion(promotionID, true)
			end
		end
		for row in GameInfo.Policy_FreePromotions("PolicyType = '" .. policyType .. "' AND IsSlave = 1") do
			local promotionID = GameInfoTypes[row.PromotionType]
			if unit:IsHasPromotion(promotionEnslavedID) and (not unit:IsHasPromotion(promotionID)) then
				unit:SetHasPromotion(promotionID, true)
			end
		end
		for row in GameInfo.Policy_FreePromotions("PolicyType = '" .. policyType .. "' AND UnitClassType ='" .. unitClass.Type .. "'") do
			local promotionID = GameInfoTypes[row.PromotionType]
			if (not unit:IsHasPromotion(promotionID)) then
				unit:SetHasPromotion(promotionID, true)
			end
		end
		if unitCombat then
			for row in GameInfo.Policy_FreePromotionUnitCombats("PolicyType = '" .. policyType .. "' AND UnitCombatType ='" .. unitCombat.Type .. "'") do
				local promotionID = GameInfoTypes[row.PromotionType]
				if (not unit:IsHasPromotion(promotionID)) then
					unit:SetHasPromotion(promotionID, true)
				end
			end	
		end
	end
end
GameEvents.PlayerAdoptPolicy.Add(JFDLC_PlayerAdoptsPolicy)
------------------------------------------------------------------------------------------------------------------------
-- PROCESSES
------------------------------------------------------------------------------------------------------------------------
--JFDLC_CanMaintain
function JFDLC_CanMaintain(playerID, cityID, processID)
	local player = Players[playerID]
	local process = GameInfo.Processes[processID]
	local city = player:GetCityByID(cityID)
	if process.RequiresCoast then
		return city:IsCoastal()
	end	
	return true
end
GameEvents.CityCanMaintain.Add(JFDLC_CanMaintain)
------------------------------------------------------------------------------------------------------------------------
-- PROMOTIONS
------------------------------------------------------------------------------------------------------------------------
--JFDLC_CanHavePromotion
function JFDLC_CanHavePromotion(playerID, unitID, promotionID)
	local player = Players[playerID]
	local promotion = GameInfo.UnitPromotions[promotionID]
	if promotion.PolicyPrereq then
		return player:HasPolicy(GameInfoTypes[promotion.PolicyPrereq])
	end	
	return true
end
GameEvents.CanHavePromotion.Add(JFDLC_CanHavePromotion)
------------------------------------------------------------------------------------------------------------------------
-- RELIGIONS
------------------------------------------------------------------------------------------------------------------------
--JFDLC_ReligionCanHaveBelief
function JFDLC_ReligionCanHaveBelief(playerID, religionID, beliefID)
	local player = Players[playerID] or activePlayer
	local belief = GameInfo.Beliefs[beliefID]
	if belief.Follower then
		if (belief.IsNoAI and (not player:IsHuman())) then
			return false
		elseif belief.RequiresEnhancement then
			return (player:GetReligionCreatedByPlayer() > 0)
		elseif belief.RequiresFounding then
			return (player:GetReligionCreatedByPlayer() <= 0)
		end
	end
	return true
end
GameEvents.ReligionCanHaveBelief.Add(JFDLC_ReligionCanHaveBelief)

--JFDLC_ReligionFounded
function JFDLC_ReligionFounded(playerID, holyCityID, religionID, belief1, belief2, belief3, belief4, belief5)
	local player = Players[playerID]
	for belief in GameInfo.Beliefs("AdditionalPantheonBelief = 1") do
		if player:HasBelief(belief.ID) then
			if player:IsHuman() then
				LuaEvents.JFD_SetEndTurnBlocking(EndTurnBlockingTypes.ENDTURN_BLOCKING_FOUND_PANTHEON)
				JFD_SendNotification(playerID, "NOTIFICATION_PANTHEON_FOUNDED_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_SECOND_PANTHEON_FOUND_NOTIFICATION_TEXT"), convertTextKey("TXT_KEY_JFD_SECOND_PANTHEON_FOUND_NOTIFICATION_TEXT_SHORT"), true)
			else
				local availablePantheonBeliefs = {};
				local availablePantheonBeliefsNum = 1
				for _,beliefID in ipairs(Game.GetAvailablePantheonBeliefs()) do
					availablePantheonBeliefs[availablePantheonBeliefsNum] = beliefID
					availablePantheonBeliefsNum = availablePantheonBeliefsNum + 1
				end
				local randomBelief = Game.GetRandom(1,#availablePantheonBeliefs)
				if randomBelief > availablePantheonBeliefsNum then randomBelief = availablePantheonBeliefsNum end
				local beliefID = availablePantheonBeliefs[randomBelief]
				LuaEvents.JFD_AddPantheonBelief(playerID, beliefID)
			end
		end
	end
end
GameEvents.ReligionFounded.Add(JFDLC_ReligionFounded)

--JFDLC_AddPantheonBelief
function JFDLC_AddPantheonBelief(playerID, beliefID)
	Game.EnhancePantheon(playerID, beliefID)
	if playerID ~= activePlayerID then return end
	Events.AudioPlay2DSound("AS2D_JFD_DRUIDISM")
end
LuaEvents.JFD_AddPantheonBelief.Add(JFDLC_AddPantheonBelief)
------------------------------------------------------------------------------------------------------------------------
-- TECHNOLOGIES
------------------------------------------------------------------------------------------------------------------------
--JFDLC_TeamTechResearched
function JFDLC_TeamTechResearched(teamID, techID)
	local tech = GameInfo.Technologies[techID]
	for row in GameInfo.Technologies_JFD_FreeUnitTypes("TechType = '" .. tech.Type .. "'") do
		if ((row.IsFirst and Game.CountKnownTechNumTeams(techID) == 1)) then
			LuaEvents.JFD_RefreshDisplayOfSpecificTech(tech, true)		
		end
	end
end
GameEvents.TeamTechResearched.Add(JFDLC_TeamTechResearched)	
------------------------------------------------------------------------------------------------------------------------
-- UNITS
------------------------------------------------------------------------------------------------------------------------
--JFDLC_ContractStarted
function JFDLC_ContractStarted(playerID, contractID, contractDuration, contractMaintenance)
	local player = Players[playerID]
	for row in GameInfo.Policy_FreePromotions("IsMercenary = 1") do
		local promotionID = GameInfoTypes[row.PromotionType]
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			for unit in player:Units() do
				if unit:IsSpecificContractUnit(contractID) and (not unit:IsHasPromotion(promotionID)) then
					unit:SetHasPromotion(promotionID, true)
				end
			end
		end
	end
end	
GameEvents.ContractStarted.Add(JFDLC_ContractStarted)

--JFDLC_CityPurchasedLevyUnit
function JFDLC_CityPurchasedLevyUnit(playerID, city, unitID, numPopulation)
	local player = Players[playerID]
	for row in GameInfo.Policy_FreePromotions("IsLevy = 1") do
		local promotionID = GameInfoTypes[row.PromotionType]
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			for unit in player:Units() do
				if unit:IsHasPromotion(promotionLevyID) and (not unit:IsHasPromotion(promotionID)) then
					unit:SetHasPromotion(promotionID, true)
				end
			end
		end
	end
end	
LuaEvents.JFD_CityPurchasedLevyUnit.Add(JFDLC_CityPurchasedLevyUnit)

--JFDLC_CityPurchasedLevyUnit
function JFDLC_CityPurchasedSlaveUnit(playerID, city, unitID, numShackles)
	local player = Players[playerID]
	for row in GameInfo.Policy_FreePromotions("IsSlave = 1") do
		local promotionID = GameInfoTypes[row.PromotionType]
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			for unit in player:Units() do
				if unit:IsHasPromotion(promotionEnslavedID) and (not unit:IsHasPromotion(promotionID)) then
					unit:SetHasPromotion(promotionID, true)
				end
			end
		end
	end
end	
LuaEvents.JFD_CityPurchasedSlaveUnit.Add(JFDLC_CityPurchasedSlaveUnit)

--JFDLC_UnitCreated
function JFDLC_UnitCreated(playerID, unitID)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local plot = unit:GetPlot()
	local unitTypeID = unit:GetUnitType()
	local unitCombat = GameInfo.UnitCombatInfos[unit:GetUnitCombatType()]
	local unitClass = GameInfo.UnitClasses[unit:GetUnitClassType()]
	if (not plot) then return end
	for policy in GameInfo.Policies("RemovesUnwelcomeEvangelist = 1") do
		if player:HasPolicy(policy.ID) then
			if unit:IsHasPromotion(promotionUnwelcomeEvangelistID) then
				unit:SetHasPromotion(promotionUnwelcomeEvangelistID, false)
			end	
		end
	end
	for row in GameInfo.Policy_FreePromotions("IsAll = 1") do
		local promotionID = GameInfoTypes[row.PromotionType]
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			if (not unit:IsHasPromotion(promotionID)) then
				unit:SetHasPromotion(promotionID, true)
			end
		end
	end	
	for row in GameInfo.Policy_FreePromotions("IsAllCombat = 1") do
		local promotionID = GameInfoTypes[row.PromotionType]
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			if ((not unit:IsHasPromotion(promotionID)) and unit:IsCombatUnit()) then
				unit:SetHasPromotion(promotionID, true)
			end
		end
	end	
	for row in GameInfo.Policy_FreePromotions("UnitClassType ='" .. unitClass.Type .. "'") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			local promotionID = GameInfoTypes[row.PromotionType]
			if (not unit:IsHasPromotion(promotionID)) then
				unit:SetHasPromotion(promotionID, true)
			end
		end
	end
	if unitCombat then
		for row in GameInfo.Policy_FreePromotionUnitCombats("UnitCombatType ='" .. unitCombat.Type .. "'") do
			if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
				local promotionID = GameInfoTypes[row.PromotionType]
				if (not unit:IsHasPromotion(promotionID)) then
					unit:SetHasPromotion(promotionID, true)
				end
			end
		end	
	end
	local city = plot:GetPlotCity()
	if (not city) then return end
	if city:IsCapital() then
		for row in GameInfo.Policy_CapitalUnitCombatFreeExperiences() do
			if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
				if ((not row.UnitCombatType) or (unit:GetUnitCombatType() == GameInfoTypes[row.UnitCombatType])) then
					if unit:IsCombatUnit() then
						unit:ChangeExperience(row.FreeExperience)
					end
				end
			end
		end
		for row in GameInfo.Policy_CapitalUnitCombatFreeMoves() do
			if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
				if ((not row.UnitCombatType) or (unit:GetUnitCombatType() == GameInfoTypes[row.UnitCombatType])) then
					unit:ChangeMoves(row.FreeMoves*60)
				end
			end
		end
	end
	for row in GameInfo.Policy_UnitCombatFreeExperiencesPerGreatWork() do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			if ((not row.UnitCombatType) or (unit:GetUnitCombatType() == GameInfoTypes[row.UnitCombatType])) then
				local rewardXP = city:GetNumGreatWorkSlots(GameInfoTypes[row.GreatWorkSlotType])
				if (rewardXP > 0 and unit:IsCombatUnit()) then
					unit:ChangeExperience(rewardXP)
				end
			end
		end
	end
end
GameEvents.UnitCreated.Add(JFDLC_UnitCreated)

--JFDLC_CityTrained
function JFDLC_CityTrained(playerID, cityID, unitID, isGold, isFaith)
	local player = Players[playerID]
	local city = player:GetCityByID(cityID)
	local unit = player:GetUnitByID(unitID)
	local unitTypeID = unit:GetUnitType()
	local unitClass = GameInfo.UnitClasses[unit:GetUnitClassType()]
	local unitCombatID = unit:GetUnitCombatType()
	local unitCombat = GameInfo.UnitCombatInfos[unitCombatID]
	if (unit:IsCombatUnit() and unitCombat) then
		if unitCombatID == unitCombatMountedID then
			for row in GameInfo.Policies("DoublesMountedTrained = 1") do
				if player:HasPolicy(row.ID) then
					if player:CanTrain(unitTypeID) then
						player:InitUnit(unitTypeID, city:GetX(), city:GetY())
					end	
				end
			end
		end
		if isFaith then
			for row in GameInfo.Beliefs("ExperienceOnFaithPurchase > 0") do
				local beliefID = GameInfoTypes[row.Type]
				if city:HasBelief(beliefID) then
					unit:ChangeExperience(row.ExperienceOnFaithPurchase)
				end
			end
			for row in GameInfo.Buildings("FreePromotionOnFaithPurchase IS NOT NULL") do
				local promotionID = GameInfoTypes[row.FreePromotionOnFaithPurchase]
				if player:HasBuilding(row.ID) then
					if ((not unit:IsHasPromotion(promotionID)) and unit:IsCombatUnit()) then
						unit:SetHasPromotion(promotionID, true)
					end
				end
			end
			for row in GameInfo.Policy_FreePromotions("IsFaithPurchase = 1 AND (UnitCombatType IS NULL OR UnitCombatType = '" .. unitCombat.Type .. "')") do
				local promotionID = GameInfoTypes[row.PromotionType]
				if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
					if ((not unit:IsHasPromotion(promotionID)) and unit:IsCombatUnit()) then
						unit:SetHasPromotion(promotionID, true)
					end
				end
			end
			for row in GameInfo.Belief_FreePromotions("IsCombatOnly = 1 AND (UnitClassType = '" .. unitClass.Type .. "' OR DomainType = '" .. GameInfo.Domains[unit:GetDomainType()].Type .. "' OR CombatType = '" .. unitCombat.Type .. "')") do
				local beliefID = GameInfoTypes[row.BeliefType]
				if city:HasBelief(beliefID) then
					if (row.IsCombatOnly and unit:IsCombatUnit()) or (row.IsCivilianOnly and (not unit:IsCombatUnit())) or ((not row.IsCivilianOnly) and (not row.IsCombatOnly)) then
						if ((row.RequiresFaithPurchase and isFaith) or (not row.RequiresFaithPurchase)) then
							if row.Removes then
								unit:SetHasPromotion(GameInfoTypes[row.PromotionType], false)
							else
								unit:SetHasPromotion(GameInfoTypes[row.PromotionType], true)
							end
						end
					end
				end
			end
		end
	end
	if (not unit:IsCombatUnit()) then
		for row in GameInfo.Belief_FreePromotions("IsCombatOnly = 0 AND (UnitClassType = '" .. unitClass.Type .. "' OR DomainType = '" .. GameInfo.Domains[unit:GetDomainType()].Type .. "')") do
			local beliefID = GameInfoTypes[row.BeliefType]
			if city:HasBelief(beliefID) then
				if ((row.RequiresFaithPurchase and isFaith) or (not row.RequiresFaithPurchase)) then
					if row.Removes then
						unit:SetHasPromotion(GameInfoTypes[row.PromotionType], false)
					else
						unit:SetHasPromotion(GameInfoTypes[row.PromotionType], true)
					end
				end
			end
		end
	end
	if unit:GetUnitClassType() == unitClassMissionaryID then
		for belief in GameInfo.Beliefs("NumExtraMissionarySpreads > 0") do
			if city:HasBelief(belief.ID) then
				unit:SetSpreadsLeft(unit:GetSpreadsLeft()+row.NumExtraMissionarySpreads)
			end
		end
	end
end
GameEvents.CityTrained.Add(JFDLC_CityTrained)

--JFDLC_GreatPersonExpended
function JFDLC_GreatPersonExpended(playerID, unitID, unitTypeID, plotX, plotY)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	for row in GameInfo.UnitPromotions("GATurnsExpended > 0") do
		if unit:IsHasPromotion(row.ID) then
			player:ChangeGoldenAgeTurns(row.GATurnsExpended)
		end
	end
end
GameEvents.GreatPersonExpended.Add(JFDLC_GreatPersonExpended)

--JFDLC_UnitPromoted
function JFDLC_UnitPromoted(playerID, unitID, promotionID)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local unitLevel = unit:GetLevel()
	for row in GameInfo.Policy_YieldFromUnitPromoted() do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			local levelMod = (unitLevel*10)
			local yieldType = row.YieldType
			local yieldInfo = GameInfo.Yields[yieldType]
			local rewardYield = row.Yield
			if levelMod > 0 then rewardYield = rewardYield + ((rewardYield*levelMod)/100) end
			if yieldType == "YIELD_CULTURE" then
				player:ChangeJONSCulture(rewardYield)
			elseif yieldType == "YIELD_FAITH" then
				player:ChangeFaith(rewardYield)
			elseif yieldType == "YIELD_GOLDEN_AGE_POINTS" then
				player:ChangeGoldenAgeProgressMeter(rewardYield)
			elseif yieldType == "YIELD_PRODUCTION" then
				city:ChangeProduction(rewardYield)
			elseif yieldType == "YIELD_JFD_PIETY" then
				player:ChangePiety(rewardYield)
			elseif yieldType == "YIELD_FOOD" then
				city:ChangeFood(rewardYield)
			end
			if player:IsHuman() then
				local hex = ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))
				Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("{3_Color}+{1_Num}[ENDCOLOR] {2_Desc}", rewardYield, yieldInfo.IconString, yieldInfo.ColorString), true)
			end	
		end
	end
end
GameEvents.UnitPromoted.Add(JFDLC_UnitPromoted)
--=======================================================================================================================
-- TSL
--=======================================================================================================================
include("TableSaverLoader016.lua")
tableRoot = JFDLC
tableName = "JFDLC"
include("JFDLC_TSLSerializerV3.lua")
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