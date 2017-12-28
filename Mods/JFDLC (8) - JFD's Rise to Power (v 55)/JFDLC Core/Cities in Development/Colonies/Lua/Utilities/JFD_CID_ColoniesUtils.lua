-- JFD_CID_ColoniesUtils
-- Author: JFD
-- DateCreated: 10/1/2015 5:07:18 PM
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
local defineCIDDecolonizationGoldReq 		= GameDefines["JFD_CID_COLONIES_DEFAULT_DECOLONIZATION_GOLD_COST"]
local defineCIDDecolonizationMagistrateReq  = GameDefines["JFD_CID_COLONIES_DEFAULT_DECOLONIZATION_MAGISTRATE_COST"]
local defineCIDDecolonizationPopReq  		= GameDefines["JFD_CID_COLONIES_DEFAULT_DECOLONIZATION_POP_REQ"]
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFDLCUtils.lua");
include("JFD_CulDivUtilities.lua");
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
--Core Settings
local userSettingCIDColoniesCore 				= (Game.GetUserSetting("JFD_CID_COLONIES_CORE") == 1)
local userSettingCIDColoniesCoreFort 			= (Game.GetUserSetting("JFD_CID_COLONIES_CORE_FORT_COLONIES") == 1)
local userSettingCIDColoniesCoreNewCapital		= (Game.GetUserSetting("JFD_CID_COLONIES_DISTANCE_CORE_NEW_CAPITAL") == 1)
local userSettingCIDColoniesBelief 				= (Game.GetUserSetting("JFD_CID_COLONIES_BELIEF_ADDITIONS_MISSION_COLONIES") == 1)
local userSettingCrimesCore 					= (Game.GetUserSetting("JFD_CID_CRIMES_CORE") == 1)
local userSettingCIDProvincesCore				= (Game.GetUserSetting("JFD_CID_PROVINCES_CORE") == 1)

--Distance Settings
local userSettingCIDColoniesDistanceCore 		= (Game.GetUserSetting("JFD_CID_COLONIES_DISTANCE_CORE") == 1)
local userSettingCIDColoniesDistanceForts		= (Game.GetUserSetting("JFD_CID_COLONIES_DISTANCE_CORE_FORT") == 1)
local userSettingCIDColoniesDistanceNumCities	= (Game.GetUserSetting("JFD_CID_COLONIES_DISTANCE_CORE_NUM_CITIES"))
local userSettingCIDColoniesDistanceRadius		= (Game.GetUserSetting("JFD_CID_COLONIES_DISTANCE_CORE_CITY_RADIUS"))
local worldSizeQuery							= ("JFD_CID_COLONIES_DISTANCE_" .. GameInfo.Worlds[Map.GetWorldSize()].Type)
local userSettingCIDColoniesDistance			= (Game.GetUserSetting(worldSizeQuery))

local isUsingED									= Game.IsEventsAndDecisionsActive()
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local activePlayer 								= Players[Game.GetActivePlayer()]
local convertTextKey 							= Locale.ConvertTextKey
local speedMod									= ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100)

local buildingGovernorsMansionID				= GameInfoTypes["BUILDING_JFD_GOVERNORS_MANSION"]
local resourceMagistratesID						= GameInfoTypes["RESOURCE_MAGISTRATES"]
------------------------------------------------------------------------------------------------------------------------
-- COLONIES
------------------------------------------------------------------------------------------------------------------------
--Player:GetNumColonies
function Player.GetNumColonies(player)
	local numColonies = 0
	for city in player:Cities() do
		if city:IsColony() then
			numColonies = numColonies + 1
		end
	end
	return numColonies
end	

--Player:CanFoundColonies
local policyDecolonizationID = GameInfoTypes["POLICY_DECISIONS_JFD_DECOLONIZATION"]
function Player.CanFoundColonies(player)
	if (not player:GetCapitalCity()) then return false end
	if player:GetNumCities() < userSettingCIDColoniesDistanceNumCities then return false end
	if (policyDecolonizationID and player:HasPolicy(policyDecolonizationID)) then return false end
	return true
end	
--------------------
-- PLOT
--------------------
--Player:GetUnitDistance
function Player.GetUnitDistance(player, unit)
	local capital = player:GetCapitalCity()
	if (not capital) then return 0, 0 end
	local plot = unit:GetPlot()
	local distance = Map.PlotDistance(plot:GetX(), plot:GetY(), capital:GetX(), capital:GetY())
	return distance, userSettingCIDColoniesDistance
end

--Player:IsPlotFoundsColony
function Player.IsPlotFoundsColony(player, plot, isCaptureCheck, isBypassesOwnerCheck)
	local capital = player:GetCapitalCity()
	if (not plot) then return false end
	if (not isBypassesOwnerCheck) then
		if (not isCaptureCheck) and plot:GetOwner() ~= -1 then return false end
		if (not isCaptureCheck) and plot:GetPlotCity() then return false end
		if (not isCaptureCheck) and plot:IsCityRadius() ~= 0 then return false end
	end
	if userSettingCIDColoniesDistanceCore then
		if Map.PlotDistance(plot:GetX(), plot:GetY(), capital:GetX(), capital:GetY()) < userSettingCIDColoniesDistance then return false end
	end
	if userSettingCIDColoniesDistanceRadius > 0 then
		for adjacentPlot in PlotAreaSweepIterator(plot, userSettingCIDColoniesDistanceRadius, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
			if adjacentPlot:IsCity() then return false end
		end
	end
	return true
end
--------------------
-- FOUNDING
--------------------
--Player:InitColony
local buildingAssemblyID = GameInfoTypes["BUILDING_JFD_ASSEMBLY"]
local provinceColonyID   = GameInfoTypes["PROVINCE_JFD_COLONY"]
function Player.InitColony(player, city, unit, plotX, plotY)
	local playerID = player:GetID()
	local plot = Map.GetPlot(plotX, plotY)
	if (not city) then city = player:InitCity(plotX, plotY) end
	city:SetColony(true)
	city:SetPuppet(true)
	city:SetProductionAutomated(true)
	local nameColony = player:GetColonyName()
	--if isFort then
	--	local fortPrefix = convertTextKey("TXT_KEY_CITY_JFD_COLONY_NAME_FORT")
	--	local fortSuffix = nil
	--	if isUsingCulDiv then
	--		local cultureID = player:GetCultureType()
	--		local cultureType = GameInfo.JFD_CultureTypes[cultureID].Type
	--		for row in GameInfo.Civilization_JFD_ColonialCityNames("FortPrefix IS NOT NULL AND CultureType = '" .. cultureType .. "'") do
	--			fortPrefix = convertTextKey(row.FortPrefix)
	--		end
	--		for row in GameInfo.Civilization_JFD_ColonialCityNames("FortSuffix IS NOT NULL AND CultureType = '" .. cultureType .. "'") do
	--			fortPrefix = nil
	--			fortSuffix = convertTextKey(row.FortSuffix)
	--		end
	--	end
	--	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	--	for row in GameInfo.Civilization_JFD_ColonialCityNames("FortPrefix IS NOT NULL AND CivilizationType = '" .. civType .. "'") do
	--		fortPrefix = convertTextKey(row.FortPrefix)
	--	end
	--	for row in GameInfo.Civilization_JFD_ColonialCityNames("FortSuffix IS NOT NULL AND CivilizationType = '" .. civType .. "'") do
	--		fortPrefix = nil
	--		fortSuffix = convertTextKey(row.FortSuffix)
	--	end
	--	if fortPrefix then nameColony = fortPrefix .. " " .. nameColony  end
	--	if fortSuffix then nameColony = nameColony .. fortSuffix  end
	--	plot:SetImprovementType(improvementID)
	--	if unit then unit:greatperson() end
	--end
	if plot:IsTerrainSnow() then nameColony = nameColony .. " " .. convertTextKey("TXT_KEY_CITY_JFD_COLONY_NAME_STATION")  end
	if nameColony then
		city:SetName(nameColony)
		if player:IsHuman() then
			Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_JFD_COLONY_ESTABLISHED_MSG", nameColony))
		end	
	end
	city:SetNumRealBuilding(buildingGovernorsMansionID, 1)
	if userSettingCIDProvincesCore then
		city:SetNumRealBuilding(buildingAssemblyID, 0)
		city:SetProvinceLevel(provinceColonyID)
	end
	for row in GameInfo.Beliefs("MissionaryOnColony = 1") do
		if player:HasBelief(row.ID) then
			local religionID = player:GetStateReligion()	
			if religionID <= 0 then religionID = player:GetMajorityReligion() end
			local unitMissionaryID = player:GetSpecificUnitType("UNITCLASS_MISSIONARY")
			local unitMissionary = player:InitUnit(unitMissionaryID, plotX, plotY)
			unitMissionary:SetReligion(religionID)
			unitMissionary:SetSpreadsLeft(2)
			unitMissionary:SetConversionStrength(1000)
		end
	end
	LuaEvents.JFD_ColonyFounded(playerID, city, isFort, plotX, plotY)
	if player:IsHuman() then
		LuaEvents.JFD_Tutorial_PushTutorialPopup(playerID, "IsOnColonyFounded", city, nil, plotX, plotY)
	end
end
--------------------
-- DECOLONIZATION
--------------------
--Player:CanDecolonize
function Player.CanDecolonize(player, city)
	local cityPopulation = city:GetPopulation()
	local canAssimilate = false
	local requiredPopulation = defineCIDDecolonizationPopReq
	local costGold = ((defineCIDDecolonizationGoldReq*cityPopulation)*speedMod)
	local costMagistrates = Game.GetRound(defineCIDDecolonizationMagistrateReq*(cityPopulation/5))
	if costMagistrates == 0 then costMagistrates = 1 end
	for row in GameInfo.Building_JFD_ColonyMods() do
		if (((not row.IsLocal) and player:HasBuilding(GameInfoTypes[row.BuildingType])) or city:HasBuilding(GameInfoTypes[row.BuildingType])) then
			requiredPopulation = requiredPopulation + Game.GetRound((requiredPopulation*row.AssimilatePopulationReqMod)/100)
			costGold = costGold + ((costGold*row.AssimilateGoldReqMod)/100)
		end
	end
	for row in GameInfo.Policy_JFD_ColonyMods() do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			requiredPopulation = requiredPopulation + ((requiredPopulation*row.AssimilatePopulationReqMod)/100)
			costGold = costGold + ((costGold*row.AssimilateGoldReqMod)/100)
		end
	end
	for row in GameInfo.JFD_Reform_ColonyMods() do
		if player:HasReform(GameInfoTypes[row.ReformType]) then
			requiredPopulation = requiredPopulation + ((requiredPopulation*row.AssimilatePopulationReqMod)/100)
			costGold = costGold + ((costGold*row.AssimilateGoldReqMod)/100)
		end
	end
	for row in GameInfo.Trait_JFD_ColonyMods() do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			requiredPopulation = requiredPopulation + ((requiredPopulation*row.AssimilatePopulationReqMod)/100)
			costGold = costGold + ((costGold*row.AssimilateGoldReqMod)/100)
		end
	end
	costGold = Game.GetRound(costGold)
	if city:GetPopulation() >= requiredPopulation then
		if (player:GetGold() >= costGold and (isUsingED and player:GetNumResourceAvailable(resourceMagistratesID, false) >= costMagistrates) or (not isUsingED)) then
			return true, requiredPopulation, costGold, costMagistrates
		end
	end
	return false, Game.GetRound(requiredPopulation), costGold, costMagistrates
end
--------------------
-- TEXT
--------------------
--Player:IsColonyNameValid
function Player.IsColonyNameValid(player, nameColony)
	for city in player:Cities() do
		if city:GetNameKey() == nameColony then
			return false
		end
	end
	return true
end

-- Player:GetColonyName
function Player.GetColonyName(player)
	if userSettingCIDColoniesCoreNewCapital then
		if player:GetNumColonies() == 0 then return convertTextKey("TXT_KEY_CITY_JFD_COLONY_NAME_NEW") .. " " .. convertTextKey(player:GetCapitalCity():GetName()) end
	end
	local validCityNames = {}
	local count = 1
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	--Check civ-specific colony names
	for row in GameInfo.Civilization_JFD_ColonialCityNames("CivilizationType = '" .. civType .. "' AND ColonyName IS NOT NULL") do
		local nameColony = row.ColonyName
		if player:IsColonyNameValid(nameColony) then
			validCityNames[count] = nameColony
			count = count + 1
		end		
	end
	if #validCityNames > 0 then
		if #validCityNames == 1 then return convertTextKey(validCityNames[1]) end
		local randomCityName = Game.GetRandom(1,#validCityNames)
		if randomCityName > #validCityNames then randomCityName = #validCityNames end
		return convertTextKey(validCityNames[randomCityName])
	end
	--Check civ-specific language families
	for row in GameInfo.Civilization_JFD_ColonialCityNames("CivilizationType = '" .. civType .. "' AND LinguisticType IS NOT NULL") do
		for secondRow in GameInfo.Civilization_JFD_ColonialCityNames("LinguisticType = '" .. row.LinguisticType .. "' AND ColonyName IS NOT NULL") do
			local nameColony = secondRow.ColonyName
			if player:IsColonyNameValid(nameColony) then
				validCityNames[count] = nameColony
				count = count + 1
			end		
		end
	end
	if #validCityNames > 0 then
		if #validCityNames == 1 then return convertTextKey(validCityNames[1]) end
		local randomCityName = Game.GetRandom(1,#validCityNames)
		if randomCityName > #validCityNames then randomCityName = #validCityNames end
		return convertTextKey(validCityNames[randomCityName])
	end
	--Check culture-specific language families
	if isUsingCulDiv then
		local cultureID = player:GetCultureType()
		local cultureType = GameInfo.JFD_CultureTypes[cultureID].Type
		for row in GameInfo.Civilization_JFD_ColonialCityNames("CultureType = '" .. cultureType .. "' AND LinguisticType IS NOT NULL") do
			for secondRow in GameInfo.Civilization_JFD_ColonialCityNames("LinguisticType = '" .. row.LinguisticType .. "' AND ColonyName IS NOT NULL") do
				local nameColony = secondRow.ColonyName
				if player:IsColonyNameValid(nameColony) then
					validCityNames[count] = nameColony
					count = count + 1
				end		
			end
		end
	end
	if #validCityNames > 0 then
		if #validCityNames then return validCityNames[1] end
		local randomCityName = Game.GetRandom(1,#validCityNames)
		if randomCityName > #validCityNames then randomCityName = #validCityNames end
		return convertTextKey(validCityNames[randomCityName])
	end
	--Check standard cities
	for row in GameInfo.Civilization_CityNames("CivilizationType = '" .. civType .. "'") do
		local nameColony = row.ColonyName
		if player:IsColonyNameValid(nameColony) then
			validCityNames[count] = nameColony
			count = count + 1
		end
	end
	if #validCityNames > 0 then
		if #validCityNames == 1 then return convertTextKey("TXT_KEY_CITY_JFD_COLONY_NAME_NEW") .. " " ..  convertTextKey(validCityNames[1]) end
		return convertTextKey("TXT_KEY_CITY_JFD_COLONY_NAME_NEW") .. " " ..  convertTextKey(validCityNames[Game.GetRandom(1,#validCityNames)])
	end
end
--=======================================================================================================================
--=======================================================================================================================