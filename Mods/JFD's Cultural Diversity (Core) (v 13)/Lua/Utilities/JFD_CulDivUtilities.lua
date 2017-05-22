-- JFD_CulDivFunctionUtilities
-- Author: JFD
-- DateCreated: 9/22/2014 11:18:48 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("FLuaVector.lua")
include("IconSupport")
include("PlotIterators.lua")
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
-- SETTINGS
--------------------------------------------------------------------------------------------------------------------------
--JFD_GetUserSetting
function JFD_GetUserSetting(type)
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
local userSettingCrimeCore = JFD_GetUserSetting("JFD_CID_CRIMES_CORE") == 1
--------------------------------------------------------------------------------------------------------------------------
-- MOD USE
--------------------------------------------------------------------------------------------------------------------------
--IsCPDLL
function IsCPDLL()
	--for _, mod in pairs(Modding.GetActivatedMods()) do
		--if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		--end
	--end
	--return false
end
local isCPDLL = IsCPDLL()

--JFD_IsUsingRTP
function JFD_IsUsingRTP()
	--for _, mod in pairs(Modding.GetActivatedMods()) do
		--if (mod.ID == "eea66053-7579-481a-bb8d-2f3959b59974") then
			return true
		--end
	--end
	--return false
end
--=======================================================================================================================
-- GENERAL UTILITIES
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local activePlayerID = Game.GetActivePlayer()
local activePlayer	 = Players[activePlayerID]
--------------------------------------------------------------------------------------------------------------------------
-- MATHS
--------------------------------------------------------------------------------------------------------------------------
--JFD_GetEraAdjustedValue
local mathCeil = math.ceil
function JFD_GetEraAdjustedValue(playerID, num)
	local player = Players[playerID]
	local currentEraID = player:GetCurrentEra()
	local eraMod = GameInfo.Eras[currentEraID].ResearchAgreementCost
	return mathCeil(num * eraMod/100)
end

--JFD_GetRandom
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 2) - lower, "") + lower
end
--------------------------------------------------------------------------------------------------------------------------
-- NOTIFICATIONS
--------------------------------------------------------------------------------------------------------------------------
--JFD_SendWorldEvent
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--------------------------------------------------------------------------------------------------------------------------
-- GENERAL
--------------------------------------------------------------------------------------------------------------------------
--JFD_GetUniqueBuilding
function JFD_GetUniqueBuilding(player, buldingClass)
	local buldingType = nil
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	for uniqueBuilding in GameInfo.Civilization_BuildingClassOverrides{CivilizationType = civType, BuildingClassType = buldingClass} do
		buldingType = uniqueBuilding.BuildingType
		break
	end
	if (buldingType == nil) then
		buldingType = GameInfo.BuildingClasses[buldingClass].DefaultBuilding
	end
	return buldingType
end

--JFD_GetUniqueUnit
function JFD_GetUniqueUnit(player, unitClass)
	local unitType = nil
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	for uniqueUnit in GameInfo.Civilization_UnitClassOverrides{CivilizationType = civType, UnitClassType = unitClass} do
		unitType = uniqueUnit.UnitType
		break
	end
	if (unitType == nil) then
		unitType = GameInfo.UnitClasses[unitClass].DefaultUnit
	end
	return unitType
end
--=======================================================================================================================
-- CULDIV UTILS
--=======================================================================================================================
-- CULDIV
--------------------------------------------------------------------------------------------------------------------------
--JFD_GetCultureID
local artDefineAmericaID	 = GameInfoTypes["ARTSTYLE_SOUTH_AMERICA"]
local artDefineAsianID		 = GameInfoTypes["ARTSTYLE_ASIAN"]
local artDefineEuropeanID	 = GameInfoTypes["ARTSTYLE_EUROPEAN"]
local artDefineGraecoRomanID = GameInfoTypes["ARTSTYLE_GRECO_ROMAN"]
local artDefineMidEastID	 = GameInfoTypes["ARTSTYLE_MIDDLE_EAST"]
local artDefinePolynesianID  = GameInfoTypes["ARTSTYLE_POLYNESIAN"]
local artDefineCultureTypes = {}
	artDefineCultureTypes[artDefineAmericaID]	  = GameInfoTypes["JFD_TribalAmerican"]
	artDefineCultureTypes[artDefineAsianID]		  = GameInfoTypes["JFD_Oriental"]
	artDefineCultureTypes[artDefineEuropeanID]	  = GameInfoTypes["JFD_Western"]
	artDefineCultureTypes[artDefineGraecoRomanID] = GameInfoTypes["JFD_Classical"]
	artDefineCultureTypes[artDefineMidEastID]	  = GameInfoTypes["JFD_Islamic"]
	artDefineCultureTypes[artDefinePolynesianID]  = GameInfoTypes["JFD_Oceanic"]
local cultureColonialID		= GameInfoTypes["CULTURE_JFD_COLONIAL"]
function JFD_GetCultureID(playerID)
	local player = Players[playerID]
	local cultureID = nil 
	if (not player:IsMinorCiv()) then
		local civilization = GameInfo.Civilizations[player:GetCivilizationType()]
		for row in GameInfo.Civilization_JFD_CultureTypes("CivilizationType = '" .. civilization.Type .. "'") do
			cultureID = GameInfoTypes[row.CultureType]
			if (not cultureID) then
				for culture in GameInfo.JFD_CultureTypes("LowerType = '" .. row.CultureType .. "'") do
					cultureID = culture.ID
					break
				end
			end
		end
		if (not cultureID) then cultureID = artDefineCultureTypes[GameInfoTypes[civilization.ArtStyleType]] end
	else
		local minorCivilization = GameInfo.MinorCivilizations[player:GetMinorCivType()]
		for row in GameInfo.MinorCivilization_JFD_CultureTypes("MinorCivilizationType = '" .. minorCivilization.Type .. "'") do
			cultureID = GameInfoTypes[row.CultureType]
			if (not cultureID) then
				for culture in GameInfo.JFD_CultureTypes("LowerType = '" .. row.CultureType .. "'") do
					cultureID = culture.ID
					break
				end
			end
		end
		if (not cultureID) then cultureID = artDefineCultureTypes[GameInfoTypes[minorCivilization.ArtStyleType]] end
	end
	if (not cultureID) then cultureID = cultureColonialID end
	return cultureID
end
-------------------
-- DIALOGUE
-------------------
--JFD_GetSoundFile()
local userSettingMercenariesCore	 = JFD_GetUserSetting("JFD_RTP_MERCENARIES_CORE") == 1
local userSettingUnitDialogueDefault = JFD_GetUserSetting("JFD_CULDIV_CORE_UNIT_DIALOGUE_USE_DEFAULT") == 1
function JFD_GetSoundFile(playerID, unit)
	local player = Players[Game.GetActivePlayer()]
	local soundFile = nil
	local cultureID = JFD_GetCultureID(playerID)
	if userSettingUnitDialogueDefault then soundFile = GameInfo.JFD_CultureTypes[cultureID].UnitDialogueTag end
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	for row in GameInfo.Civilization_JFD_CultureTypes("CivilizationType = '" .. civType .. "'") do
		soundFile = row.UnitDialogueTag
	end
	for row in GameInfo.UnitPromotions_JFD_UnitDialogues() do
		local promotionID = GameInfoTypes[row.PromotionType]
		if unit:IsHasPromotion(promotionID) then
			soundFile = row.UnitDialogue
		end
	end
	return soundFile
end
-------------------
-- STARTING BONUSES
-------------------
--JFD_ClaimNearbyLandsVisible
function JFD_ClaimNearbyLandsVisible(playerID, city, nearbyLandsClaim)
	local player = Players[playerID]
	local playerTeam = player:GetTeam()
	local plot = Map.GetPlot(city:GetX(), city:GetY())
	if (not plot) then return end
	local cityID = city:GetID()
	for adjacentPlot in PlotAreaSweepIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
		if adjacentPlot:GetOwner() == -1  then
			adjacentPlot:SetOwner(playerID, cityID, true, true)
			adjacentPlot:SetRevealed(playerTeam, true)
		end
	end
end

--JFD_ShowNearbyLandsVisible
function JFD_ShowNearbyLandsVisible(playerID, nearbyLandsVisible)
	local worldSize = Map.GetWorldSize()+1
	local distance = (nearbyLandsVisible * worldSize)
	local startingPlot = Players[playerID]:GetStartingPlot()
	local teamID = Players[playerID]:GetTeam()
	for i = 0, Map.GetNumPlots() - 1, 1 do
		local plot = Map.GetPlotByIndex(i)
		if (startingPlot and plot) then
			local plotX = plot:GetX()
			local plotY = plot:GetY()
			local startingPlotX = startingPlot:GetX()
			local startingPlotY = startingPlot:GetY()
			if Map.PlotDistance(startingPlotX, startingPlotY, plotX, plotY) <= distance then
				plot:SetRevealed(teamID, true)
			end
		end
	end
end

--Sukritact_PlaceResource
local resourceGoldID = GameInfoTypes["RESOURCE_GOLD"]
local terrainCoastalID = GameInfoTypes["TERRAIN_COAST"]
local terrainOceanID   = GameInfoTypes["TERRAIN_OCEAN"]
function Sukritact_PlaceResource(plot, resourceID, resourceQuantity, improvementType, isHills)
	local plots = {}
	local count = 1
    for loopPlot in PlotAreaSpiralIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		plots[count] = loopPlot
		count=count+1
    end
    for iVal = 1, resourceQuantity do
		local isPlaced = false
		while (not(isPlaced)) and #plots > 0 do
			local getRandom = JFD_GetRandom(1, #plots)
			local plot = plots[getRandom]
			if plot then
				if (plot:GetFeatureType() == -1 and plot:GetResourceType() == -1 and plot:GetTerrainType() ~= terrainCoastalID and plot:GetTerrainType() ~= terrainOceanID and (not plot:IsMountain())) then
					local isHills = (resourceID == resourceGoldID)
					if isHills and plot:IsHills() then
						plot:SetResourceType(resourceID, resourceQuantity)
						if improvementType then
							plot:SetImprovementType(GameInfoTypes[improvementType])
						end
					else
						plot:SetResourceType(resourceID, resourceQuantity)
						if improvementType then
							plot:SetImprovementType(GameInfoTypes[improvementType])
						end
					end
					isPlaced = true
				end
			end
			table.remove(plots, getRandom)
		end
	end
end
-------------------
-- SPLASH SCREENS
-------------------
--JFD_GetCultureSplashScreen
function JFD_GetCultureSplashScreen(era)
	local player = Players[activePlayerID]
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	local cultureID = JFD_GetCultureID(activePlayerID)
	local culture = GameInfo.JFD_CultureTypes[cultureID]
	local splashScreen = culture.SplashScreenTag
	local splashScreenTag = culture.Type
	for row in GameInfo.Civilization_JFD_CultureTypes("CivilizationType = '" .. civType .. "'") do
		splashScreenTag = row.SplashScreenTag
		break
	end
	if splashScreenTag then
		splashScreen = "Era_" .. splashScreenTag .. "_" .. era .. ".dds"
	elseif splashScreen then
		splashScreen = "Era_" .. splashScreen .. "_" .. era .. ".dds"
	end
	if (not splashScreen) then
		splashScreen = "ERA" .. "_" .. era .. ".dds"
	end
	return splashScreen
end

--JFD_GetCultureDefeatScreen
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"]
local eraModernID   = GameInfoTypes["ERA_MODERN"]
function JFD_GetCultureDefeatScreen()
	local player = Players[activePlayerID]
	local currentEraID = player:GetCurrentEra()
	local cultureID = JFD_GetCultureID(activePlayerID)
	local culture = GameInfo.JFD_CultureTypes[cultureID]
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	local defaultScreen = nil
	for row in GameInfo.Civilization_JFD_CultureTypes("CivilizationType = '" .. civType .. "'") do
		defaultScreen = row.DefeatScreenEarlyTag
		if currentEraID >= eraModernID then
			defaultScreen = row.DefeatScreenLateTag
		elseif currentEraID >= eraMedievalID then
			defaultScreen = row.DefeatScreenMidTag
		end
	end
	if (not defaultScreen) then
		defaultScreen = culture.DefeatScreenEarly
		if currentEraID >= eraModernID then
			defaultScreen = culture.DefeatScreenLate 
		elseif currentEraID >= eraMedievalID then
			defaultScreen = culture.DefeatScreenMid
		end
	end
	return defaultScreen or "Victory_Defeat.dds"
end
--=======================================================================================================================
--=======================================================================================================================