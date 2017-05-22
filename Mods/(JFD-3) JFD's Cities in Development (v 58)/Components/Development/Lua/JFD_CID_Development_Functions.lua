-- JFD_CID_Development_Functions
-- Author: JFD
-- DateCreated: 12/18/2014 8:58:10 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("IconSupport")
include("JFD_CID_DevelopmentUtils.lua")
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingDevelopmentCore = JFD_GetUserSetting("JFD_CID_DEVELOPMENT_CORE") == 1
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local mathFloor = math.floor
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- DEVELOPMENT
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Development_DoTurn
local buildingDevelopmentDeficitCrimeID		= GameInfoTypes["BUILDING_JFD_DEVELOPMENT_DEFICIT_CRIME"]
local buildingDevelopmentDeficitDiseaseID	= GameInfoTypes["BUILDING_JFD_DEVELOPMENT_DEFICIT_DISEASE"]
local buildingDevelopmentDeficitWondersID	= GameInfoTypes["BUILDING_JFD_DEVELOPMENT_DEFICIT_WONDERS"]
local buildingDevelopmentSurplusBuildingsID = GameInfoTypes["BUILDING_JFD_DEVELOPMENT_SURPLUS_BUILDINGS"]
local buildingDevelopmentSurplusHappinessID = GameInfoTypes["BUILDING_JFD_DEVELOPMENT_SURPLUS_HAPPINESS"]
local buildingDevelopmentSurplusHealthID	= GameInfoTypes["BUILDING_JFD_DEVELOPMENT_SURPLUS_HEALTH"]
function JFD_CID_Development_DoTurn(playerID)
	local player = Players[playerID]
	for city in player:Cities() do
		local developmentRate = JFD_GetDevelopment(playerID, city)
		local developmentHappiness, developmentHealth, developmentBuildingBonus, developmentCrime, developmentDisease, developmentWonderPenalty = JFD_GetDevelopmentYields(playerID, city, JFD_GetDevelopment(playerID, city))
		developmentBuildingBonus = mathFloor(developmentBuildingBonus)
		developmentCrime		 = mathFloor(developmentCrime)
		developmentDisease		 = mathFloor(developmentDisease)
		developmentHappiness	 = mathFloor(developmentHappiness)
		developmentHealth		 = mathFloor(developmentHealth)
		developmentWonderPenalty = mathFloor(developmentWonderPenalty)
		if developmentRate > 0 then
			city:SetNumRealBuilding(buildingDevelopmentDeficitCrimeID, 0)
			city:SetNumRealBuilding(buildingDevelopmentDeficitDiseaseID, 0)
			city:SetNumRealBuilding(buildingDevelopmentDeficitWondersID, 0)
			city:SetNumRealBuilding(buildingDevelopmentSurplusBuildingsID, developmentBuildingBonus)
			city:SetNumRealBuilding(buildingDevelopmentSurplusHappinessID, developmentHappiness)
			city:SetNumRealBuilding(buildingDevelopmentSurplusHealthID, developmentHealth)
		elseif developmentRate < 0 then
			city:SetNumRealBuilding(buildingDevelopmentDeficitCrimeID, developmentCrime)
			city:SetNumRealBuilding(buildingDevelopmentDeficitDiseaseID, developmentDisease)
			city:SetNumRealBuilding(buildingDevelopmentDeficitWondersID, developmentWonderPenalty)
			city:SetNumRealBuilding(buildingDevelopmentSurplusBuildingsID, 0)
			city:SetNumRealBuilding(buildingDevelopmentSurplusHappinessID, 0)
			city:SetNumRealBuilding(buildingDevelopmentSurplusHealthID, 0)
		else	
			city:SetNumRealBuilding(buildingDevelopmentDeficitCrimeID, 0)
			city:SetNumRealBuilding(buildingDevelopmentDeficitDiseaseID, 0)
			city:SetNumRealBuilding(buildingDevelopmentDeficitWondersID, 0)
			city:SetNumRealBuilding(buildingDevelopmentSurplusBuildingsID, 0)
			city:SetNumRealBuilding(buildingDevelopmentSurplusHappinessID, 0)
			city:SetNumRealBuilding(buildingDevelopmentSurplusHealthID, 0)
		end
	end
end
if userSettingDevelopmentCore then
	GameEvents.PlayerDoTurn.Add(JFD_CID_Development_DoTurn)
end

-- JFD_CID_Overpopulation_CanConstruct
--function JFD_CID_Overpopulation_CanConstruct(playerID, cityID, buildingID)
--	local city = Players[playerID]:GetCityByID(cityID)
--	if JFD_IsCityOverpopulated(city) then
--		local building = GameInfo.Buildings[buildingID]
--		local buildingClass = GameInfo.BuildingClasses[building.BuildingClass]
--		if (buildingClass.MaxPlayerInstances > -1 or buildingClass.MaxGlobalInstances > -1) then
--			return false
--		end
--	end
--	return true
--end
--if userSettingOverpopulationCoreWonders then
--	GameEvents.CityCanConstruct.Add(JFD_CID_Overpopulation_CanConstruct)
--end
--=======================================================================================================================
--=======================================================================================================================