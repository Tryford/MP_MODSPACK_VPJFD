-- JFD_CID_DevelopmentUtils
-- Author: JFD
-- DateCreated: 2/20/2016 6:37:35 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_CIDUtilities.lua");
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
local defineDevelopmentBuildingProd  = GameDefines["JFD_CID_DEVELOPMENT_BUILDING_PROD"]
local defineDevelopmentCrime	   	 = GameDefines["JFD_CID_DEVELOPMENT_CRIME"]
local defineDevelopmentDisease	   	 = GameDefines["JFD_CID_DEVELOPMENT_DISEASE"]
local defineDevelopmentHappiness   	 = GameDefines["JFD_CID_DEVELOPMENT_HAPPINESS"]
local defineDevelopmentHealth	   	 = GameDefines["JFD_CID_DEVELOPMENT_HEALTH"]
local defineDevelopmentPerBuilding 	 = GameDefines["JFD_CID_DEVELOPMENT_PER_BUILDING"]
local defineDevelopmentWonderProd  	 = GameDefines["JFD_CID_DEVELOPMENT_WONDER_PROD"]
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingDevelopmentCoreBuildingBonus = JFD_GetUserSetting("JFD_CID_DEVELOPMENT_CORE_BUILDING_BONUS") == 1
local userSettingDevelopmentCoreWonderPenalty = JFD_GetUserSetting("JFD_CID_DEVELOPMENT_CORE_WONDER_PENALTY") == 1
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local convertTextKey				= Locale.ConvertTextKey
local mathFloor						= math.floor
------------------------------------------------------------------------------------------------------------------------
-- DEVELOPMENT
------------------------------------------------------------------------------------------------------------------------
--JFD_GetDevelopmentPerSpecialist
function JFD_GetDevelopmentPerSpecialist(playerID, city, specialistID)
	local player = Players[playerID]
	local developmentPerSpecialist = 0
	for row in GameInfo.Policy_SpecialistExtraYields("YieldType = 'YIELD_JFD_DEVELOPMENT'") do
		local policyID = GameInfoTypes[row.PolicyType]
		if player:HasPolicy(policyID) then
			local yield = (row.Yield/10)
			developmentPerSpecialist = developmentPerSpecialist + yield
		end
	end
	if specialistID then
		for row in GameInfo.Policy_SpecialistYieldChanges("YieldType = 'YIELD_JFD_DEVELOPMENT' AND SpecialistType = '" .. GameInfo.Specialists[specialistID].Type .. "'") do
			local policyID = GameInfoTypes[row.PolicyType]
			if player:HasPolicy(policyID) then
				local yield = (row.Yield/10)
				developmentPerSpecialist = developmentPerSpecialist + yield
			end
		end
	end
	return developmentPerSpecialist
end

--JFD_GetDevelopment
function JFD_GetDevelopment(playerID, city, returnsTT)
	local player = Players[playerID]
	local developmentThreshold = city:GetPopulation()
	local developmentThresholdMod = 0
	local developmentThresholdTT = ""
	--Provinces
	local developmentThresholdFromProvinces = 0
	for row in GameInfo.JFD_Province_DevelopmentMods() do
		if GameInfoTypes[row.ProvinceType] == JFD_GetProvinceID(playerID, city) then
			developmentThresholdFromProvinces = developmentThresholdFromProvinces + row.DevelopmentThresholdMod
		end
	end
	if developmentThresholdFromProvinces ~= 0 then
		developmentThreshold = developmentThreshold + ((developmentThreshold*developmentThresholdFromProvinces)/100)
		if returnsTT then
			if developmentThresholdFromProvinces > 0 then developmentThresholdFromProvinces = "+" .. developmentThresholdFromProvinces end
			developmentThresholdTT = developmentThresholdTT .. convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_THRESHOLD_FROM_PROVINCES", developmentThresholdFromProvinces)
		end
	end
	--Buildings
	local developmentThresholdFromBuildings = 0
	for row in GameInfo.Building_JFD_DevelopmentMods("DevelopmentThresholdMod <> 0") do
		if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
			developmentThresholdFromBuildings = developmentThresholdFromBuildings + row.DevelopmentThresholdMod
		end
	end
	if developmentThresholdFromBuildings ~= 0 then
		developmentThreshold = developmentThreshold + ((developmentThreshold*developmentThresholdMod)/100)
		if returnsTT then
			if developmentThresholdFromBuildings > 0 then developmentThresholdFromBuildings = "+" .. developmentThresholdFromBuildings end
			developmentThresholdTT = developmentThresholdTT .. convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_THRESHOLD_FROM_BUILDINGS", developmentThresholdFromBuildings)
		end
	end
	--Policies
	local developmentThresholdFromPolicies = 0
	for row in GameInfo.Policy_JFD_DevelopmentMods("DevelopmentThresholdMod <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			developmentThresholdFromPolicies = developmentThresholdFromPolicies + row.DevelopmentThresholdMod
		end
	end
	if developmentThresholdFromPolicies ~= 0 then
		developmentThreshold = developmentThreshold + ((developmentThreshold*developmentThresholdFromPolicies)/100)
		if returnsTT then
			if developmentThresholdFromPolicies > 0 then developmentThresholdFromPolicies = "+" .. developmentThresholdFromPolicies end
			developmentThresholdTT = developmentThresholdTT .. convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_THRESHOLD_FROM_POLICIES", developmentThresholdFromPolicies)
		end
	end
	--Reforms
	local developmentThresholdFromReforms = 0
	for row in GameInfo.JFD_Reform_DevelopmentMods("DevelopmentThresholdMod <> 0") do
		if JFD_HasReform(playerID, GameInfoTypes[row.ReformType]) then
			developmentThresholdFromReforms = developmentThresholdFromReforms + row.DevelopmentThresholdMod
		end
	end
	if developmentThresholdFromReforms ~= 0 then
		developmentThreshold = developmentThreshold + ((developmentThreshold*developmentThresholdFromReforms)/100)
		if returnsTT then
			if developmentThresholdFromReforms > 0 then developmentThresholdFromReforms = "+" .. developmentThresholdFromReforms end
			developmentThresholdTT = developmentThresholdTT .. convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_THRESHOLD_FROM_REFORMS", developmentThresholdFromReforms)
		end
	end
	--Traits
	local developmentThresholdFromTraits = 0
	for row in GameInfo.Trait_JFD_DevelopmentMods("DevelopmentThresholdMod <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			developmentThresholdFromTraits = developmentThresholdFromTraits + row.DevelopmentThresholdMod
		end
	end
	if developmentThresholdFromTraits ~= 0 then
		developmentThreshold = developmentThreshold + ((developmentThreshold*developmentThresholdFromTraits)/100)
		if returnsTT then
			if developmentThresholdFromTraits > 0 then developmentThresholdFromTraits = "+" .. developmentThresholdFromTraits end
			developmentThresholdTT = developmentThresholdTT .. convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_THRESHOLD_FROM_TRAITS", developmentThresholdFromTraits)
		end
	end
	--AI
	if (not player:IsHuman()) then
		developmentThreshold = developmentThreshold + ((developmentThreshold*-20)/100)
	end
	local developmentTotal = 0
	local developmentBuildingMod, developmentImprovementMod = JFD_GetDevelopmentMods(playerID, city)
	local developmentTT = ""
	--Buildings
	local developmentFromBuildings = 0
	for row in GameInfo.Building_YieldChanges("YieldType = 'YIELD_JFD_DEVELOPMENT'") do
		local buildingID = GameInfoTypes[row.BuildingType]
		local yield = (row.Yield/10)
		developmentFromBuildings = developmentFromBuildings + (city:GetNumBuilding(buildingID)*yield)
		developmentFromBuildings = developmentFromBuildings + ((developmentFromBuildings*developmentBuildingMod)/100)
	end
	for row in GameInfo.Policy_BuildingClassYieldChanges("YieldType = 'YIELD_JFD_DEVELOPMENT'") do
		local policyID = GameInfoTypes[row.PolicyType]
		if player:HasPolicy(policyID) then
			local buildingID = player:GetSpecificBuildingType(row.BuildingClassType)
			local yield = (row.YieldChange/10)
			developmentFromBuildings = developmentFromBuildings + (city:GetNumBuilding(buildingID)*yield)
			developmentFromBuildings = developmentFromBuildings + ((developmentFromBuildings*developmentBuildingMod)/100)
		end
	end
	developmentTotal = developmentTotal + developmentFromBuildings
	if (returnsTT and developmentFromBuildings ~= 0) then
		developmentTT = developmentTT .. convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_FROM_BUILDINGS", developmentFromBuildings)
	end
	--Features
	local developmentFromFeatures = 0
	for row in GameInfo.Policy_FeatureYieldChanges("YieldType = 'YIELD_JFD_DEVELOPMENT'") do
		local policyID = GameInfoTypes[row.PolicyType]
		if player:HasPolicy(policyID) then
			local featureID = GameInfoTypes[row.FeatureType]
			local yield = (row.Yield/10)
			developmentFromFeatures = developmentFromFeatures + (city:CountNumWorkedFeature(featureID)*yield)
		end
	end
	developmentTotal = developmentTotal + developmentFromFeatures
	if (returnsTT and developmentFromFeatures ~= 0) then
		developmentTT = developmentTT .. convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_FROM_FEATURES", developmentFromFeatures)
	end
	--Improvements
	local developmentFromImprovements = 0
	for row in GameInfo.Improvement_Yields("YieldType = 'YIELD_JFD_DEVELOPMENT'") do
		local improvementID = GameInfoTypes[row.ImprovementType]
		local yield = (row.Yield/10)
		developmentFromImprovements = developmentFromImprovements + (city:CountNumWorkedImprovement(improvementID)*yield)
		developmentFromImprovements = developmentFromImprovements + ((developmentFromImprovements*developmentImprovementMod)/100)
	end
	developmentTotal = developmentTotal + developmentFromImprovements
	if (returnsTT and developmentFromImprovements ~= 0) then
		developmentTT = developmentTT .. convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_FROM_IMPROVEMENTS", developmentFromImprovements)
	end
	--Resources
	local developmentFromResources = 0
	for row in GameInfo.Policy_ResourceYieldChanges("YieldType = 'YIELD_JFD_DEVELOPMENT'") do
		local policyID = GameInfoTypes[row.PolicyType]
		if player:HasPolicy(policyID) then
			local resourceID = GameInfoTypes[row.ResourceType]
			local yield = (row.Yield/10)
			developmentFromResources = developmentFromResources + (city:CountNumWorkedResource(resourceID)*yield)
		end
	end
	developmentTotal = developmentTotal + developmentFromResources
	if (returnsTT and developmentFromResources ~= 0) then
		developmentTT = developmentTT .. convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_FROM_RESOURCES", developmentFromResources)
	end
	--Specialists
	local developmentFromSpecialists = 0
	for row in GameInfo.Specialists() do
		local numSpecialist = city:GetSpecialistCount(row.ID)
		if numSpecialist > 0 then
			developmentFromSpecialists = developmentFromSpecialists + (numSpecialist*JFD_GetDevelopmentPerSpecialist(playerID, city, row.ID))
		end
	end
	developmentTotal = developmentTotal + developmentFromSpecialists
	if (returnsTT and developmentFromSpecialists ~= 0) then
		developmentTT = developmentTT .. convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_FROM_SPECIALISTS", developmentFromSpecialists)
	end
	local developmentIcon = "[ICON_JFD_DEVELOPMENT_SURPLUS]"
	if developmentTotal < 0 then developmentTotal = 0 end
	local developmentRate = mathFloor(developmentThreshold-developmentTotal)
	if developmentRate ~= 0 then developmentRate = developmentRate*-1 end
	if returnsTT then	
		if developmentRate >= 0 then
			local developmentHappiness, developmentHealth, developmentBuilding, developmentCrime, developmentDisease = JFD_GetDevelopmentYields(playerID, city, developmentRate)
			local developmentReward = convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_TT_SURPLUS_TT", developmentHappiness, developmentHealth, developmentBuilding)
			return developmentRate, developmentTotal, JFD_Round(developmentThreshold,2), convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_TT", developmentThreshold, developmentThresholdTT, developmentTT, developmentTotal, "[COLOR_POSITIVE_TEXT]", "+" .. developmentRate, "TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_TT_SURPLUS", developmentReward, developmentIcon)
		else
			developmentIcon = "[ICON_JFD_DEVELOPMENT_DEFICIT]"
			local developmentHappiness, developmentHealth, developmentBuilding, developmentCrime, developmentDisease, developmentWonders = JFD_GetDevelopmentYields(playerID, city, developmentRate)
			local developmentPenalty = convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_TT_DEFICIT_TT", developmentCrime, developmentDisease, developmentWonders)
			return developmentRate, developmentTotal, JFD_Round(developmentThreshold,2), convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_TT", developmentThreshold, developmentThresholdTT, developmentTT, developmentTotal, "[COLOR_NEGATIVE_TEXT]", developmentRate, "TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_TT_DEFICIT", developmentPenalty, developmentIcon)
		end	
	else
		return developmentRate, JFD_Round(developmentTotal), JFD_Round(developmentThreshold,2)
	end
end
-----------------
-- YIELDS
-----------------
--JFD_GetDevelopmentYields
local policyDevelopmentHappinessID  = GameInfoTypes["POLICY_REFORM_JFD_DEVELOPMENT_HAPPINESS"]
local policyDevelopmentHealthID		= GameInfoTypes["POLICY_REFORM_JFD_DEVELOPMENT_HEALTH"]
function JFD_GetDevelopmentYields(playerID, city, developmentRate)
	local player = Players[playerID]
	local developmentCrime = defineDevelopmentCrime
	local developmentDisease = defineDevelopmentDisease
	local developmentHappiness = defineDevelopmentHappiness
	local developmentHealth = defineDevelopmentHealth
	local developmentBuildings = 0
	local developmentWonders = 0
	if developmentRate >= 0 then
		developmentHappiness = developmentHappiness * developmentRate
		developmentHealth	 = developmentHealth    * developmentRate
		if userSettingDevelopmentCoreBuildingBonus then developmentBuildings = defineDevelopmentBuildingProd * developmentRate end
	else
		developmentCrime   = developmentCrime   * (developmentRate*-1)
		developmentDisease = developmentDisease * (developmentRate*-1)
		if (userSettingDevelopmentCoreWonderPenalty and player:IsHuman()) then developmentWonders = defineDevelopmentWonderProd * (developmentRate*-1) end
	end
	if (not player:IsHuman()) then
		developmentHappiness = (developmentHappiness/2)
		developmentHealth	 = (developmentHealth/2)
		developmentBuildings = (developmentBuildings/2)
		developmentCrime	 = (developmentCrime/2)
		developmentDisease	 = (developmentDisease/2)
		developmentWonders	 = (developmentWonders/2)
	end	
	if (policyDevelopmentHappinessID and player:HasPolicy(policyDevelopmentHappinessID)) then
		developmentHappiness = developmentHappiness * 2
		developmentHealth = 0
	elseif (policyDevelopmentHealthID and player:HasPolicy(policyDevelopmentHealthID)) then
		developmentHappiness = 0
		developmentHealth = developmentHealth * 2
	end
	return developmentHappiness, developmentHealth, developmentBuildings, developmentCrime, developmentDisease, developmentWonders
end
--=======================================================================================================================
--=======================================================================================================================