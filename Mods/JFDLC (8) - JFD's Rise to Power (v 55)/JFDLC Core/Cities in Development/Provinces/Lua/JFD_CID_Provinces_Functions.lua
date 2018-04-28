-- JFD_CID_Provinces_Functions
-- Author: JFD
-- DateCreated: 12/29/2015 9:45:58 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_CID_ProvincesUtils.lua")
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingsCIDLoyaltyCore			 = (Game.GetUserSetting("JFD_CID_LOYALTY_CORE") == 1)
local userSettingCIDProvincesCore			 = (Game.GetUserSetting("JFD_CID_PROVINCES_CORE") == 1)
local userSettingCIDProvincesBombardRange    = (Game.GetUserSetting("JFD_CID_PROVINCES_CORE_BOMBARD_RANGE") == 1)
local userSettingCIDProvincesBombardIndirect = (Game.GetUserSetting("JFD_CID_PROVINCES_TECH_CHANGES_GUNPOWDER") == 1)
local userSettingCIDProvincesLevies		 	 = (Game.GetUserSetting("JFD_CID_PROVINCES_CORE_LEVIES") == 1)
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local provinceBaronyID  = GameInfoTypes["PROVINCE_JFD_BARONY"]
local provinceCapitalID = GameInfoTypes["PROVINCE_JFD_CAPITAL"]
local provinceCountyID  = GameInfoTypes["PROVINCE_JFD_COUNTY"]
local provinceDuchyID   = GameInfoTypes["PROVINCE_JFD_DUCHY"]
--=======================================================================================================================
-- AI FUNCTIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- PROVINCES
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Provinces_PlayerDoTurnAI
-- local buildingManorID	 = GameInfoTypes["BUILDING_JFD_MANOR"]
-- local buildingMansionID	 = GameInfoTypes["BUILDING_JFD_MANSION"]
-- function JFD_CID_Provinces_PlayerDoTurnAI(playerID, cityID, buildingID)
	-- local player = Players[playerID]
	-- if player:IsHuman() then return end
	-- if player:CalculateGoldRate() < 1 then return end
	-- if (not player:IsAtWar()) then return end
	-- local levyCost = player:GetUnitLevyCost(unitID)
	-- for city in player:Cities() do
		-- if (not city:GetGarrisonedUnit()) then
			-- if city:GetPopulation() > levyCost then
				-- LuaEvents.JFD_CityPurchasedLevyUnit(playerID, city, unitID, 1)
			-- end
		-- end
	-- end
-- end
-- if userSettingCIDProvincesLevies then
	--GameEvents.PlayerDoTurn.Add(JFD_CID_Provinces_PlayerDoTurnAI)
-- end
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- PROVINCES
------------------------------------------------------------------------------------------------------------------------
local buildingAssemblyID = GameInfoTypes["BUILDING_JFD_ASSEMBLY"]

--JFD_CID_Provinces_CanConstruct
function JFD_CID_Provinces_CityCanConstruct(playerID, cityID, buildingID)
	local player = Players[playerID]
	local city = player:GetCityByID(cityID)
	local building = GameInfo.Buildings[buildingID]
	local connectionReq = building.RequiresConnection
	if (connectionReq and (not player:IsCapitalConnectedToCity(city))) then return false end
	if (building.IsProvince and building.ProvinceUpgradeType) then
		if city:IsCapital() then return false end
		local province = GameInfo.JFD_Provinces[building.ProvinceUpgradeType]
		if (city:GetPopulation() < province.NumPopulationRequired and city:CountNumImprovedPlots() < province.NumImprovementRequired) then 
			return false 
		end
	end
	return true
end
if userSettingCIDProvincesCore then
	GameEvents.CityCanConstruct.Add(JFD_CID_Provinces_CityCanConstruct)
end

--JFD_CID_Provinces_CityConstructed
function JFD_CID_Provinces_CityConstructed(playerID, cityID, buildingID)
	local player = Players[playerID]
	local city = player:GetCityByID(cityID)
	local building = GameInfo.Buildings[buildingID]
	if building.ProvinceUpgradeType then
		city:SetProvinceLevel(GameInfoTypes[building.ProvinceUpgradeType])
	end
end
if userSettingCIDProvincesCore then
	GameEvents.CityConstructed.Add(JFD_CID_Provinces_CityConstructed)	
end

--JFD_CID_Provinces_SerialEventCityCreated
function JFD_CID_Provinces_SerialEventCityCreated(hex, playerID, cityID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local city = player:GetCityByID(cityID)
	if (not city) then return end
	if city:IsColony() then return end
	local provinceID = player:GetProvinceLevelWeShouldBe(city)
	city:SetProvinceLevel(provinceID)
end
if userSettingCIDProvincesCore then
	Events.SerialEventCityCreated.Add(JFD_CID_Provinces_SerialEventCityCreated)	
end

--JFD_CID_Provinces_PlayerCityFounded
function JFD_CID_Provinces_PlayerCityFounded(playerID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local city = Map.GetPlot(plotX, plotY):GetPlotCity()
	if (not city) then return end
	if city:IsColony() then return end
	if city:IsCapital() then
		city:SetProvinceLevel(provinceCapitalID)
	else
		city:SetProvinceLevel(provinceBaronyID)
		city:SetNumRealBuilding(buildingAssemblyID, 1)
	end
end
if userSettingCIDProvincesCore then
	GameEvents.PlayerCityFounded.Add(JFD_CID_Provinces_PlayerCityFounded)	
end

--JFD_CID_Provinces_CityCaptureComplete
function JFD_CID_Provinces_CityCaptureComplete(oldOwnerID, capital, plotX, plotY, newOwnerID, population, isConquest)
	local player = Players[newOwnerID]
	local city = Map.GetPlot(plotX, plotY):GetPlotCity()
	if (not city) then return end
	if capital then
		if (not city:IsColony()) then
			city:SetProvinceLevel(provinceBaronyID)
			city:SetNumRealBuilding(buildingAssemblyID, 1)
		end
	else
		if city:GetProvinceLevel() > 0 then return end
		for building in GameInfo.Buildings("ProvinceUpgradeType IS NOT NULL") do
			if city:HasBuilding(building.ID) then
				city:SetProvinceLevel(GameInfoTypes[building.ProvinceUpgradeType])
			end
		end
	end
end
if userSettingCIDProvincesCore then
	GameEvents.CityCaptureComplete.Add(JFD_CID_Provinces_CityCaptureComplete)	
end

--JFD_CID_Provinces_PlayerDoTurn
function JFD_CID_Provinces_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	for city in player:Cities() do
		if city:GetProvinceLevel() <= 0 then 
			for building in GameInfo.Buildings("ProvinceUpgradeType IS NOT NULL") do
				if city:HasBuilding(building.ID) then
					city:SetProvinceLevel(GameInfoTypes[building.ProvinceUpgradeType])
				end
			end
		end
	end
end
if userSettingCIDProvincesCore then
	GameEvents.PlayerDoTurn.Add(JFD_CID_Provinces_PlayerDoTurn)	
end

-- GameEvent.ProvinceLevelChanged(playerID, cityID, oldProvinceLevelID, newProvinceLevelID)
------------------
-- BOMBARD RANGE
------------------
--Whoward:
local gTeamRange = {}
local gBombardTechs = {}
local gCityRange = {}
local gBombardBuildings = {}
local gDefaultRange = GameDefines.MAX_CITY_ATTACK_RANGE * ((GameDefines.CAN_CITY_USE_INDIRECT_FIRE == 1) and -1 or 1)
function Initialise()
	for row in DB.Query("SELECT ID, BombardIndirect FROM Technologies WHERE BombardIndirect > 0 ORDER BY BombardIndirect ASC") do
		local iTech = row.ID
		local iRange = ((row.BombardIndirect == 1) and -1 or 1)
		gBombardTechs[iTech] = iRange
		for iTeam = 0, GameDefines.MAX_CIV_TEAMS-1, 1 do
			if (Teams[iTeam]:IsHasTech(iTech)) then
				gTeamRange[iTeam] = iRange
			end
		end
	end
	for row in DB.Query("SELECT ID, BombardRange FROM Buildings WHERE BombardRange > 0 ORDER BY BombardRange ASC") do
		local iBuilding = row.ID
		local iRange = row.BombardRange
		gBombardBuildings[iBuilding] = iRange
		for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
			for pCity in Players[iPlayer]:Cities() do
				if pCity:IsHasBuilding(iBuilding) then
					gCityRange[pCity] = iRange
				end
			end
		end
	end
end

function OnTechResearched(iTeam, iTech, iChange)
	if (iChange == 1 and gBombardTechs[iTech]) then
	   gTeamRange[iTeam] = gBombardTechs[iTech]
	end
end
GameEvents.TeamTechResearched.Add(OnTechResearched)

function OnCityConstructed(iPlayer, iCity, iBuilding)
	if gBombardBuildings[iBuilding] then
		local pCity = Players[iPlayer]:GetCityByID(iCity)
		gCityRange[pCity] = gBombardBuildings[iBuilding]
	end
end
GameEvents.CityConstructed.Add(OnCityConstructed)

function OnNewTurn(iPlayer)
	for pCity in Players[iPlayer]:Cities() do
		if pCity:IsCapital() then
			gCityRange[pCity] = 3
		else
			for pBuilding in GameInfo.Buildings("BombardRange > 0") do
				if pCity:IsHasBuilding(pBuilding.ID) then
					gCityRange[pCity] = pBuilding.BombardRange
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(OnNewTurn)

--FD_CID_Provinces_BombardRange
function JFD_CID_Provinces_BombardRange(playerID, cityID)
	local player = Players[playerID]
	local city = player:GetCityByID(cityID)
	local bombardRange = gCityRange[city] or 1
	local indirectRange = gTeamRange[player:GetTeam()] or 1
	return (bombardRange*indirectRange) or gDefaultRange
end
if userSettingCIDProvincesBombardRange then
	Initialise()
	GameEvents.GetBombardRange.Add(JFD_CID_Provinces_BombardRange)
end
------------------------------------------------------------------------------------------------------------------------
-- LEVIES
------------------------------------------------------------------------------------------------------------------------
local notificationGreatPersonID = NotificationTypes["NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER"]

--JFD_CID_Provinces_DeclareWar
local loyaltyRebelliousID	    = GameInfoTypes["LOYALTY_JFD_REBELLIOUS"]
local loyaltySeparatistID	    = GameInfoTypes["LOYALTY_JFD_SEPARATIST"]
local policyLeviesReservedID    = GameInfoTypes["POLICY_REFORM_JFD_LEVIES_RESERVE"]
function JFD_CID_Provinces_DeclareWar(teamID, otherTeamID)
	local team = Teams[teamID]
	local otherTeam = Teams[otherTeamID]
	if otherTeam:GetAtWarCount(true) > 1 then return end
	local attackingPlayerID = team:GetLeaderID()
	local attackingPlayer = Players[attackingPlayerID]
	if attackingPlayer:IsMinorCiv() then return end
	local playerID = otherTeam:GetLeaderID()
	local player = Players[playerID]
	if player:HasPolicy(policyLeviesReservedID) then return end
	local cityList = ""
	local unitID = nil
	for city in player:Cities() do
		if ((userSettingsCIDLoyaltyCore and ((not city:HasLoyaltyState(loyaltyRebelliousID)) and (not city:HasLoyaltyState(loyaltySeparatistID)))) or (not userSettingsCIDLoyaltyCore)) then
			local provinceID = city:GetProvinceLevel()
			local province = GameInfo.JFD_Provinces[provinceID]
			if province.NumUnitsSpawned > 0 then
				unitID = player:GetStrongestLevyUnit("UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")
				if (not unitID) then return end
				local unitClass = GameInfo.Units[unitID].Class
				unitID = player:GetSpecificUnitType(unitClass) 
				LuaEvents.JFD_CityPurchasedLevyUnit(playerID, city, unitID, nil, true)
				cityList = cityList .. "[NEWLINE][ICON_BULLET]" .. city:GetName()
			end
		end
	end
	if player:IsHuman() then
		local capital = player:GetCapitalCity()
		local hex = ToHexFromGrid(Vector2(capital:GetX(), capital:GetY()))
		Events.GameplayFX(hex.x, hex.y, -1)
		player:AddNotification(notificationGreatPersonID, Locale.ConvertTextKey("TXT_KEY_JFD_PROVINCES_LEVIES_RAISED_NOTIFICATION", cityList), Locale.ConvertTextKey("TXT_KEY_JFD_PROVINCES_LEVIES_RAISED_NOTIFICATION_SHORT"), capital:GetX(), capital:GetY(), unitID)
	end	
end
if userSettingCIDProvincesLevies then
	GameEvents.DeclareWar.Add(JFD_CID_Provinces_DeclareWar)
end

--JFD_CID_Provinces_MakePeace
local promotionLevyDefensiveID			 = GameInfoTypes["PROMOTION_JFD_LEVY_DEFENSIVE"]
local promotionLevyFrontlineDefensiveID  = GameInfoTypes["PROMOTION_JFD_LEVY_FRONTLINE_DEFENSIVE"]
function JFD_CID_Provinces_MakePeace(teamID, otherTeamID)
	local team = Teams[teamID]
	local playerID = team:GetLeaderID()
	local player = Players[playerID]
	if (not player:IsAtWarAnyMajor()) then 
		local numLevies = 0
		for unit in player:Units() do
			if (unit:HasPromotion(promotionLevyDefensiveID) or unit:HasPromotion(promotionLevyFrontlineDefensiveID)) then
				numLevies = numLevies + 1
				unit:Kill(-1)
			end
		end
		if (player:IsHuman() and numLevies > 0) then
			JFD_SendNotification(playerID, notificationGreatPersonID, Locale.ConvertTextKey("TXT_KEY_JFD_PROVINCES_LEVIES_DISBAND_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_JFD_PROVINCES_LEVIES_DISBAND_NOTIFICATION_SHORT"), nil, nil, unitID)
		end
	end
	local otherTeam = Teams[otherTeamID]
	local otherPlayerID = otherTeam:GetLeaderID()
	local otherPlayer = Players[otherPlayerID]
	if (not otherPlayer:IsAtWarAnyMajor()) then
		local numLevies = 0
		for unit in otherPlayer:Units() do
			if (unit:HasPromotion(promotionLevyDefensiveID) or unit:HasPromotion(promotionLevyFrontlineDefensiveID)) then
				numLevies = numLevies + 1
				unit:Kill(-1)
			end
		end
		if (otherPlayer:IsHuman() and numLevies > 0) then
			JFD_SendNotification(otherPlayerID, notificationGreatPersonID, Locale.ConvertTextKey("TXT_KEY_JFD_PROVINCES_LEVIES_DISBAND_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_JFD_PROVINCES_LEVIES_DISBAND_NOTIFICATION_SHORT"), nil, nil, unitID)
		end
	end
end
if userSettingCIDProvincesLevies then
	GameEvents.MakePeace.Add(JFD_CID_Provinces_MakePeace)
end

--JFD_CID_Provinces_CityPurchasedLevyUnit
local policyLeviesFrontlineID   		= GameInfoTypes["POLICY_REFORM_JFD_LEVIES_FRONTLINE"]
local promotionLevyID					= GameInfoTypes["PROMOTION_JFD_LEVY"]
local promotionLevyFrontlineID			= GameInfoTypes["PROMOTION_JFD_LEVY_FRONTLINE"]
local promotionLevyDefensiveID  		= GameInfoTypes["PROMOTION_JFD_LEVY_DEFENSIVE"]
local promotionLevyFrontlineDefensiveID = GameInfoTypes["PROMOTION_JFD_LEVY_FRONTLINE_DEFENSIVE"]
function JFD_CID_Provinces_CityPurchasedLevyUnit(playerID, city, unitID, numPop, isDefensive)
	local player = Players[playerID]
	local provinceID = city:GetProvinceLevel()
	local province = GameInfo.JFD_Provinces[provinceID]
	local unit = GameInfo.Units[unitID]
	local numUnits = province.NumUnitsSpawned
	if (not isDefensive) then numUnits = 1 end
	if (userSettingCIDProvincesCoreLeviesAI and (not player:IsHuman())) then numUnits = province.NumUnitsSpawnedAI end
	for row in GameInfo.Policies("NumExtraLevies > 0") do
		if player:HasPolicy(row.ID) then
			numUnits = numUnits + row.NumExtraLevies
		end
	end
	for row in GameInfo.Unit_JFD_ProvinceMods("NumExtraLevies > 0 AND UnitType = '" .. unit.Type .. "'") do
		numUnits = numUnits + row.NumExtraLevies
	end
	for value = 1, numUnits do
		local unitXP = Game.GetRound((city:GetProductionExperience()*province.NumUnitsXP)/100)
		local unitLevy = player:InitUnit(unitID, city:GetX(), city:GetY())
		unitLevy:JumpToNearestValidPlot()
		unitLevy:SetName(Locale.ConvertTextKey("TXT_KEY_PROMOTION_JFD_LEVY"))
		unitLevy:ChangeExperience(unitXP)
		local promotionID = promotionLevyID
		local promotionDefensiveID = promotionLevyDefensiveID
		if player:HasPolicy(policyLeviesFrontlineID) then
			promotionID = promotionLevyFrontlineID
			promotionDefensiveID = promotionLevyFrontlineDefensiveID
		end
		if (not isDefensive) then
			city:ChangePopulation(-numPop, true)
			unitLevy:SetHasPromotion(promotionID, true)
		else
			unitLevy:SetHasPromotion(promotionDefensiveID, true)
		end
		-- Buildings
		for row in GameInfo.Building_JFD_ProvinceMods("LevyFreeExperience <> 0") do
			if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
				unitLevy:ChangeExperience(row.LevyFreeExperience)
			end
		end
		for row in GameInfo.Building_JFD_ProvinceMods("LevyMaxHPChange <> 0") do
			if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
				unitLevy:ChangeMaxHitPointsBase(row.LevyMaxHPChange)
			end
		end
		-- Policies
		for row in GameInfo.Policy_JFD_ProvinceMods("LevyFreeExperience <> 0") do
			if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
				unitLevy:ChangeExperience(row.LevyFreeExperience)
			end
		end
		for row in GameInfo.Policy_JFD_ProvinceMods("LevyMaxHPChange <> 0") do
			if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
				unitLevy:ChangeMaxHitPointsBase(row.LevyMaxHPChange)
			end
		end
		-- Reforms
		for row in GameInfo.JFD_Reform_ProvinceMods("LevyFreeExperience <> 0") do
			if player:HasReform(GameInfoTypes[row.ReformType]) then
				unitLevy:ChangeExperience(row.LevyFreeExperience)
			end
		end
		for row in GameInfo.JFD_Reform_ProvinceMods("LevyMaxHPChange <> 0") do
			if player:HasReform(GameInfoTypes[row.ReformType]) then
				unitLevy:ChangeMaxHitPointsBase(row.LevyMaxHPChange)
			end
		end
		-- Traits
		for row in GameInfo.Trait_JFD_ProvinceMods("LevyFreeExperience <> 0") do
			if player:HasTrait(GameInfoTypes[row.TraitType]) then
				unitLevy:ChangeExperience(row.LevyFreeExperience)
			end
		end
		for row in GameInfo.Trait_JFD_ProvinceMods("LevyMaxHPChange <> 0") do
			if player:HasTrait(GameInfoTypes[row.TraitType]) then
				unitLevy:ChangeMaxHitPointsBase(row.LevyMaxHPChange)
			end
		end
		-- Units
		for row in GameInfo.Unit_JFD_ProvinceMods("LevyFreeExperience <> 0 AND UnitType = '" .. unit.Type .. "'") do
			unitLevy:ChangeExperience(row.LevyFreeExperience)
		end
		for row in GameInfo.Unit_JFD_ProvinceMods("LevyMaxHPChange <> 0 AND UnitType = '" .. unit.Type .. "'") do
			unitLevy:ChangeMaxHitPointsBase(row.LevyMaxHPChange)
		end
	end
end
if userSettingCIDProvincesLevies then
	LuaEvents.JFD_CityPurchasedLevyUnit.Add(JFD_CID_Provinces_CityPurchasedLevyUnit)
end
------------------------------------------------------------------------------------------------------------------------
-- GREAT PEOPLE
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Provinces_JFD_ProvinceUpgraded
-- function JFD_CID_Provinces_JFD_ProvinceUpgraded(playerID, unit, city)
	-- local player = Players[playerID]
	-- local provinceID = city:GetProvinceLevel()
	-- local province = GameInfo.JFD_Provinces[provinceID]
	-- local upgradeProvince = GameInfo.JFD_Provinces[province.UpgradeProvinceType]
	-- city:SetNumRealBuilding(GameInfoTypes[upgradeProvince.BuildingType], 1)
	-- unit:greatperson()
-- end
-- LuaEvents.JFD_ProvinceUpgraded.Add(JFD_CID_Provinces_JFD_ProvinceUpgraded)
-------------------
-- MISSIONS
-------------------
-- local missionUpgradeProvinceID		 = GameInfoTypes["MISSION_JFD_UPGRADE_PROVINCE"]
-- local CUSTOM_MISSION_NO_ACTION		 = 0
-- local CUSTOM_MISSION_ACTION			 = 1
-- local CUSTOM_MISSION_DONE            = 2
-- local CUSTOM_MISSION_ACTION_AND_DONE = 3

-- JFD_CID_Provinces_MissionStart
-- function JFD_CID_Provinces_MissionStart(playerID, unitID, missionID, data1, data2, flags, turn)
	-- local player = Players[playerID]
	-- if missionID == missionUpgradeProvinceID then
		-- local unit = player:GetUnitByID(unitID)
		-- local unitPlot = unit:GetPlot()
		-- LuaEvents.JFD_ProvinceUpgraded(playerID, unit, unitPlot:GetPlotCity())
		-- return CUSTOM_MISSION_ACTION
	-- end
	-- return CUSTOM_MISSION_NO_ACTION
-- end
-- GameEvents.CustomMissionStart.Add(JFD_CID_Provinces_MissionStart)

-- JFD_CID_Provinces_MissionComplete
-- function JFD_CID_Provinces_MissionComplete(playerID, unitID, missionID, data1, data2, flags, turn)
    -- if (missionID == missionUpgradeProvinceID) then return true end
	-- return false
-- end
-- GameEvents.CustomMissionCompleted.Add(JFD_CID_Provinces_MissionComplete)
--=======================================================================================================================
--=======================================================================================================================