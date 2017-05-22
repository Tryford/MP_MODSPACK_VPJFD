-- JFD_CID_ColoniesUtils
-- Author: JFD
-- DateCreated: 10/1/2015 5:07:18 PM
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
local defineDecolonizationGoldReq = GameDefines["JFD_CID_DEFAULT_DECOLONIZATION_GOLD"]
local defineDecolonizationPopReq  = GameDefines["JFD_CID_DEFAULT_DECOLONIZATION_POP"]
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_CIDUtilities.lua");
include("JFD_CulDivUtilities.lua");
--=======================================================================================================================
-- MOD CHECKS
--=======================================================================================================================
local isUsingCulDiv = JFD_IsUsingCulDiv()
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
--Core Settings
local userSettingColoniesCore 				= JFD_GetUserSetting("JFD_CID_COLONIES_CORE") == 1
local userSettingColoniesCoreFort 			= JFD_GetUserSetting("JFD_CID_COLONIES_CORE_FORT_COLONIES") == 1
local userSettingColoniesCoreMagistrates	= JFD_GetUserSetting("JFD_CID_COLONIES_CORE_MAGISTRATE_PURCHASES") == 1
local userSettingColoniesCoreNewCapital     = JFD_GetUserSetting("JFD_CID_COLONIES_DISTANCE_CORE_NEW_CAPITAL") == 1
local userSettingColoniesBelief 			= JFD_GetUserSetting("JFD_CID_COLONIES_BELIEF_ADDITIONS_MISSION_COLONIES") == 1
local userSettingCrimesCore 				= JFD_GetUserSetting("JFD_CID_CRIMES_CORE") == 1

--Distance Settings
local userSettingColoniesDistanceCore 		= JFD_GetUserSetting("JFD_CID_COLONIES_DISTANCE_CORE") == 1
local userSettingColoniesDistanceForts		= JFD_GetUserSetting("JFD_CID_COLONIES_DISTANCE_CORE_FORT") == 1
local userSettingColoniesDistanceNumCities  = JFD_GetUserSetting("JFD_CID_COLONIES_DISTANCE_CORE_NUM_CITIES")
local userSettingColoniesDistanceRadius		= JFD_GetUserSetting("JFD_CID_COLONIES_DISTANCE_CORE_CITY_RADIUS")
local worldSizeQuery						= "JFD_CID_COLONIES_DISTANCE_" .. GameInfo.Worlds[Map.GetWorldSize()].Type
local userSettingColoniesDistance			= JFD_GetUserSetting(worldSizeQuery)
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local activePlayer 							= Players[Game.GetActivePlayer()]
local convertTextKey 						= Locale.ConvertTextKey
local mathFloor								= math.floor
local speedMod								= ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100)

local buildingDrillAcademyID				= GameInfoTypes["BUILDING_JFD_DRILL_ACADEMY"]
local buildingGovernorsMansionID			= GameInfoTypes["BUILDING_JFD_GOVERNORS_MANSION"]
local resourceMagistratesID					= GameInfoTypes["RESOURCE_MAGISTRATES"]
------------------------------------------------------------------------------------------------------------------------
-- COLONIES
------------------------------------------------------------------------------------------------------------------------
--JFD_GetNumColonies
function JFD_GetNumColonies(playerID)
	return Players[playerID]:CountNumBuildings(buildingGovernorsMansionID)
end	

--JFD_GetUnitDistanceStats
function JFD_GetUnitDistanceStats(unit)
	local capital = activePlayer:GetCapitalCity()
	if (not capital) then return 0, 0 end
	local plot = unit:GetPlot()
	local distance = Map.PlotDistance(plot:GetX(), plot:GetY(), capital:GetX(), capital:GetY())
	local distanceThreshold = userSettingColoniesDistance
	return distance, distanceThreshold
end

--JFD_IsPlotFoundsColony
local policyDecolonizationID = GameInfoTypes["POLICY_DECISIONS_JFD_DECOLONIZATION"]
function JFD_IsPlotFoundsColony(playerID, plot, isCaptureCheck)
	local player = Players[playerID]
	local capital = player:GetCapitalCity()
	if plot:GetOwner() ~= -1 and plot:GetOwner() ~= playerID then return false end
	if player:IsMinorCiv()								 then return false end
	if (not capital)									 then return false end
	if player:HasPolicy(policyDecolonizationID)			 then return false end
	if (not isCaptureCheck) and plot:GetPlotCity()		 then return false end
	if (not isCaptureCheck) and plot:IsCityRadius() ~= 0 then return false end
	if player:GetNumCities() < userSettingColoniesDistanceNumCities then return false end
	if userSettingColoniesDistanceCore then
		if Map.PlotDistance(plot:GetX(), plot:GetY(), capital:GetX(), capital:GetY()) < userSettingColoniesDistance then return false end
	end
	if userSettingColoniesDistanceRadius > 0 then
		for adjacentPlot in PlotAreaSweepIterator(plot, userSettingColoniesDistanceRadius, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
			if adjacentPlot:IsCity() then return false end
		end
	end
	return true
end

--JFD_DoEstablishColony
local unitMissionaryID = GameInfoTypes["UNIT_MISSIONARY"]
function JFD_DoEstablishColony(playerID, city, unit, isFort, improvementID, plotX, plotY, isMissions)
	local player = Players[playerID]
	local plot = Map.GetPlot(plotX, plotY)
	if (not city) then city = player:InitCity(plotX, plotY) end
	city:SetPuppet(true)
	city:SetProductionAutomated(true)
	local colonyName = JFD_GetColonyName(playerID)
	if isFort then
		local fortPrefix = convertTextKey("TXT_KEY_CITY_JFD_COLONY_NAME_FORT")
		local fortSuffix = nil
		if isUsingCulDiv then
			local cultureID = JFD_GetCultureID(playerID)
			if cultureID then
				local cultureType = GameInfo.JFD_CultureTypes[cultureID].Type
				for row in GameInfo.Civilization_JFD_ColonialCityNames("FortPrefix IS NOT NULL AND CultureType = '" .. cultureType .. "'") do
					fortPrefix = convertTextKey(row.FortPrefix)
				end
				for row in GameInfo.Civilization_JFD_ColonialCityNames("FortSuffix IS NOT NULL AND CultureType = '" .. cultureType .. "'") do
					fortPrefix = nil
					fortSuffix = convertTextKey(row.FortSuffix)
				end
			end
		end
		local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
		for row in GameInfo.Civilization_JFD_ColonialCityNames("FortPrefix IS NOT NULL AND CivilizationType = '" .. civType .. "'") do
			fortPrefix = convertTextKey(row.FortPrefix)
		end
		for row in GameInfo.Civilization_JFD_ColonialCityNames("FortSuffix IS NOT NULL AND CivilizationType = '" .. civType .. "'") do
			fortPrefix = nil
			fortSuffix = convertTextKey(row.FortSuffix)
		end
		if fortPrefix then colonyName = fortPrefix .. " " .. colonyName  end
		if fortSuffix then colonyName = colonyName .. fortSuffix  end
		plot:SetImprovementType(improvementID)
		if unit then unit:greatperson() end
	end
	if plot:IsTerrainSnow() then colonyName = colonyName .. " " .. convertTextKey("TXT_KEY_CITY_JFD_COLONY_NAME_STATION")  end
	if colonyName then
		city:SetName(colonyName)
		if player:IsHuman() then
			Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_JFD_COLONY_ESTABLISHED_MSG", colonyName))
		end	
	end
	city:SetNumRealBuilding(buildingGovernorsMansionID, 1)
	if isMissions then
		local religionID = player:GetStateReligion()
		if religionID <= 0 then religionID = player:GetMajorityReligion() end
		local unitMissionary = player:InitUnit(unitMissionaryID, plotX, plotY)
		unitMissionary:SetReligion(religionID)
		unitMissionary:SetSpreadsLeft(2)
		unitMissionary:SetConversionStrength(1000)
	end
	LuaEvents.JFD_ColonyFounded(playerID, city, isFort, plotX, plotY)
end
--------------------
-- MAGISTRATES
--------------------
--JFD_CanMagistratePurchase
function JFD_CanMagistratePurchase(playerID, city)
	if (not userSettingColoniesCoreMagistrates) then return false end
	local player = Players[playerID]
	if JFD_IsCityColony(city) then return true end
	return false
end

--JFD_GetMagistrateCost
function JFD_GetMagistrateCost(playerID, buildingID)
	if buildingID == -1 then return 0 end
	local player = Players[playerID]
	local building = GameInfo.Buildings[buildingID]
	local cost = 0
	if (not userSettingCrimesCore) then cost = building.GoldMaintenance end
	for row in GameInfo.Building_YieldChanges("BuildingType = '" .. building.Type .. "' AND YieldType = 'YIELD_JFD_CRIME'") do
		cost = row.Yield
		break
	end
	if cost <= 0 then cost = building.GoldMaintenance end
	if cost <= 0 then cost = 1 end
	return cost
end

--JFD_ChangeNumMagistrates
function JFD_ChangeNumMagistrates(playerID, change)
	Players[playerID]:ChangeNumResourceTotal(resourceMagistratesID, change)
end

--JFD_GetNumMagistrates
function JFD_GetNumMagistrates(playerID)
	if (not playerID) then return 0 end
	return Players[playerID]:GetNumResourceAvailable(resourceMagistratesID, true)
end
--------------------
-- ASSIMILATION
--------------------
--JFD_CanAssimilateColony
function JFD_CanAssimilateColony(playerID, city)
	local player = Players[playerID]
	local canAssimilate = false
	local populationNeeded = defineDecolonizationPopReq
	local goldCost = ((defineDecolonizationGoldReq*city:GetPopulation())*speedMod)
	for row in GameInfo.Building_JFD_ColonyMods() do
		if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
			populationNeeded = populationNeeded + ((populationNeeded*row.AssimilatePopulationReqMod)/100)
			goldCost		 = goldCost			+ ((goldCost*row.AssimilateGoldReqMod)/100)
		end
	end
	for row in GameInfo.Policy_JFD_ColonyMods() do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			populationNeeded = populationNeeded + ((populationNeeded*row.AssimilatePopulationReqMod)/100)
			goldCost		 = goldCost			+ ((goldCost*row.AssimilateGoldReqMod)/100)
		end
	end
	for row in GameInfo.JFD_Reform_ColonyMods() do
		if JFD_HasReform(playerID, GameInfoTypes[row.ReformType]) then
			populationNeeded = populationNeeded + ((populationNeeded*row.AssimilatePopulationReqMod)/100)
			goldCost		 = goldCost			+ ((goldCost*row.AssimilateGoldReqMod)/100)
		end
	end
	for row in GameInfo.Trait_JFD_ColonyMods() do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			populationNeeded = populationNeeded + ((populationNeeded*row.AssimilatePopulationReqMod)/100)
			goldCost		 = goldCost			+ ((goldCost*row.AssimilateGoldReqMod)/100)
		end
	end
	if city:GetPopulation() >= populationNeeded then
		if player:GetGold() >= goldCost then
			return true, populationNeeded, goldCost
		end
	end
	return false, mathFloor(populationNeeded), mathFloor(goldCost)
end
--------------------
-- TEXT
--------------------
-- JFD_IsColonyNameUsed
function JFD_IsValidColonyName(player, colonyName)
	for city in player:Cities() do
		if city:GetNameKey() == colonyName then
			return false
		end
	end
	return true
end

-- JFD_GetColonyName
function JFD_GetColonyName(playerID)
	local player = Players[playerID]
	if userSettingColoniesCoreNewCapital then
		if JFD_GetNumColonies(playerID) == 0 then return convertTextKey("TXT_KEY_CITY_JFD_COLONY_NAME_NEW") .. " " .. convertTextKey(player:GetCapitalCity():GetName()) end
	end
	local validCityNames = {}
	local count = 1
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	--Check civ-specific colony names
	for row in GameInfo.Civilization_JFD_ColonialCityNames("CivilizationType = '" .. civType .. "' AND ColonyName IS NOT NULL") do
		local colonyName = row.ColonyName
		if JFD_IsValidColonyName(player, colonyName) then
			validCityNames[count] = colonyName
			count = count + 1
		end		
	end
	if #validCityNames > 0 then
		return convertTextKey(validCityNames[JFD_GetRandom(1,#validCityNames)])
	end
	--Check civ-specific language families
	for row in GameInfo.Civilization_JFD_ColonialCityNames("CivilizationType = '" .. civType .. "' AND LinguisticType IS NOT NULL") do
		for secondRow in GameInfo.Civilization_JFD_ColonialCityNames("LinguisticType = '" .. row.LinguisticType .. "' AND ColonyName IS NOT NULL") do
			local colonyName = secondRow.ColonyName
			if JFD_IsValidColonyName(player, colonyName) then
				validCityNames[count] = colonyName
				count = count + 1
			end		
		end
	end
	if #validCityNames > 0 then
		return convertTextKey(validCityNames[JFD_GetRandom(1,#validCityNames)])
	end
	--Check culture-specific language families
	if isUsingCulDiv then
		local cultureID = JFD_GetCultureID(playerID)
		if cultureID then
			local cultureType = GameInfo.JFD_CultureTypes[cultureID].Type
			for row in GameInfo.Civilization_JFD_ColonialCityNames("CultureType = '" .. cultureType .. "' AND LinguisticType IS NOT NULL") do
				for secondRow in GameInfo.Civilization_JFD_ColonialCityNames("LinguisticType = '" .. row.LinguisticType .. "' AND ColonyName IS NOT NULL") do
					local colonyName = secondRow.ColonyName
					if JFD_IsValidColonyName(player, colonyName) then
						validCityNames[count] = colonyName
						count = count + 1
					end		
				end
			end
		end
	end
	if #validCityNames > 0 then
		return convertTextKey(validCityNames[JFD_GetRandom(1,#validCityNames)])
	end
	--Check standard cities
	for row in GameInfo.Civilization_CityNames("CivilizationType = '" .. civType .. "'") do
		local colonyName = row.ColonyName
		if JFD_IsValidColonyName(player, colonyName) then
			validCityNames[count] = colonyName
			count = count + 1
		end
	end
	if #validCityNames > 0 then
		return convertTextKey("TXT_KEY_CITY_JFD_COLONY_NAME_NEW") .. " " ..  convertTextKey(validCityNames[JFD_GetRandom(1,#validCityNames)])
	end
end
--=======================================================================================================================
--=======================================================================================================================