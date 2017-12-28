-- JFD_CulDivUtils
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
--Game.GetUserSetting
function Game.GetUserSetting(type)
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
local userSettingCulDivUnitDialogueDefault = (Game.GetUserSetting("JFD_CULDIV_CORE_UNIT_DIALOGUE_USE_DEFAULT") == 1)
--------------------------------------------------------------------------------------------------------------------------
-- MOD USE
--------------------------------------------------------------------------------------------------------------------------
--Game.IsModActive
function Game.IsModActive(modID)
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == modID then
			return true
		end
	end
	return false
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
--Player:GetEraAdjustedValue
local mathCeil = math.ceil
function Player.GetEraAdjustedValue(player, num)
	local modEra = GameInfo.Eras[player:GetCurrentEra()].ResearchAgreementCost
	return mathCeil(num*modEra/100)
end

--Game.GetRandom
function Game.GetRandom(lower, upper)
    return Game.Rand((upper + 2) - lower, "") + lower
end
	
--Game.GetRound
function Game.GetRound(num, idp)
	local mult = 10^(idp or 0)
	return math.floor(num * mult + 0.5) / mult
end
--------------------------------------------------------------------------------------------------------------------------
-- GENERAL
--------------------------------------------------------------------------------------------------------------------------
--Player:GetUniqueBuildingType
function Player.GetUniqueBuildingType(player, buldingClass)
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

--Player:GetUniqueUnitType
function Player.GetUniqueUnitType(player, unitClass)
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
--Player:GetCultureType
local artDefineAmericaID	 = GameInfoTypes["ARTSTYLE_SOUTH_AMERICA"]
local artDefineAsianID		 = GameInfoTypes["ARTSTYLE_ASIAN"]
local artDefineEuropeanID	 = GameInfoTypes["ARTSTYLE_EUROPEAN"]
local artDefineGraecoRomanID = GameInfoTypes["ARTSTYLE_GRECO_ROMAN"]
local artDefineMidEastID	 = GameInfoTypes["ARTSTYLE_MIDDLE_EAST"]
local artDefinePolynesianID  = GameInfoTypes["ARTSTYLE_POLYNESIAN"]
local artDefineCultureTypes = {}
	artDefineCultureTypes[artDefineAmericaID]	  = GameInfoTypes["CULTURE_JFD_GREAT_PLAINS"]
	artDefineCultureTypes[artDefineAsianID]		  = GameInfoTypes["CULTURE_JFD_ORIENTAL"]
	artDefineCultureTypes[artDefineEuropeanID]	  = GameInfoTypes["CULTURE_JFD_WESTERN"]
	artDefineCultureTypes[artDefineGraecoRomanID] = GameInfoTypes["CULTURE_JFD_CLASSICAL"]
	artDefineCultureTypes[artDefineMidEastID]	  = GameInfoTypes["CULTURE_JFD_ISLAMIC"]
	artDefineCultureTypes[artDefinePolynesianID]  = GameInfoTypes["CULTURE_JFD_OCEANIC"]
local cultureColonialID		= GameInfoTypes["CULTURE_JFD_COLONIAL"]
function Player.GetCultureType(player)
	local cultureID = nil 
	local subCultureID = nil
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
	for row in GameInfo.JFD_CultureType_SubCultures("CultureType = '" .. GameInfo.JFD_CultureTypes[cultureID].Type .. "'") do
		subCultureID = row.ShortDescription
	end
	return cultureID, subcultureID
end
-------------------
-- DIALOGUE
-------------------
--Player:GetUnitDialogueFile()
function Player.GetUnitDialogueFile(player, unit)
	local cultureID = player:GetCultureType()
	local soundFile = nil
	if userSettingCulDivUnitDialogueDefault then soundFile = GameInfo.JFD_CultureTypes[cultureID].UnitDialogueTag end
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	for row in GameInfo.Civilization_JFD_CultureTypes("CivilizationType = '" .. civType .. "' AND UnitDialogueTag IS NOT NULL") do
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
--Player:DoClaimNearbyLandsVisible
function Player.DoClaimNearbyLandsVisible(player, city, nearbyLandsClaim)
	local playerID = player:GetID()
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

--Player:DoShowNearbyLandsVisible
function Player.DoShowNearbyLandsVisible(player, nearbyLandsVisible)
	local playerID = player:GetID()
	local worldSize = Map.GetWorldSize()+1
	local distance = (nearbyLandsVisible * worldSize)
	local startingPlot = player:GetStartingPlot()
	local teamID = player:GetTeam()
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
			local getRandom = Game.GetRandom(1, #plots)
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
--------------------------------------------------------------------------------------------------------------------------
-- SPLASH SCREENS
--------------------------------------------------------------------------------------------------------------------------
--Player:GetCultureSplashScreenTag
function Player.GetCultureSplashScreenTag(player, eraType)
	local cultureID = player:GetCultureType()
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	local culture = GameInfo.JFD_CultureTypes[cultureID]
	local splashScreen = culture.SplashScreenTag
	local splashScreenTag = culture.Type
	for row in GameInfo.Civilization_JFD_CultureTypes("CivilizationType = '" .. civType .. "' AND SplashScreenTag IS NOT NULL") do
		splashScreenTag = row.SplashScreenTag
		break
	end
	if splashScreenTag then
		splashScreen = "Era_" .. splashScreenTag .. "_" .. eraType .. ".dds"
	elseif splashScreen then
		splashScreen = "Era_" .. splashScreen .. "_" .. eraType .. ".dds"
	end
	if (not splashScreen) then
		splashScreen = "ERA" .. "_" .. eraType .. ".dds"
	end
	return splashScreen
end

--Player:GetCultureDefeatScreenTag
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"]
local eraModernID   = GameInfoTypes["ERA_MODERN"]
function Player.GetCultureDefeatScreenTag(player)
	local cultureID = player:GetCultureType()
	local currentEraID = player:GetCurrentEra()
	local culture = GameInfo.JFD_CultureTypes[cultureID]
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	local defeatScreenEarly = culture.DefeatScreenEarly
	local defeatScreenMid = culture.DefeatScreenMid
	local defeatScreenLate = culture.DefeatScreenLate 
	for row in GameInfo.Civilization_JFD_CultureTypes("CivilizationType = '" .. civType .. "' AND DefeatScreenEarlyTag IS NOT NULL") do
		defeatScreenEarly = row.DefeatScreenEarlyTag
	end
	for row in GameInfo.Civilization_JFD_CultureTypes("CivilizationType = '" .. civType .. "' AND DefeatScreenMidTag IS NOT NULL") do
		defeatScreenMid = row.DefeatScreenMidTag
	end
	for row in GameInfo.Civilization_JFD_CultureTypes("CivilizationType = '" .. civType .. "' AND DefeatScreenLateTag IS NOT NULL") do
		defeatScreenLate = row.DefeatScreenLateTag
	end
	if currentEraID >= eraModernID then
		return defeatScreenLate or "Victory_Defeat.dds"
	elseif currentEraID >= eraMedievalID then
		return defeatScreenMid or "Victory_Defeat.dds"
	end
	return defeatScreenEarly or "Victory_Defeat.dds"
end
--------------------------------------------------------------------------------------------------------------------------
-- OUTDATED FUNCTIONS
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetCultureID(playerID)
	return Players[playerID]:GetCultureType()
end
--=======================================================================================================================
--=======================================================================================================================