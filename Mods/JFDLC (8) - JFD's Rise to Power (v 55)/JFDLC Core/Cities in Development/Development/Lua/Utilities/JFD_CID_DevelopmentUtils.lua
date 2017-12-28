-- JFD_CID_DevelopmentUtils
-- Author: JFD
-- DateCreated: 2/20/2016 6:37:35 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFDLCUtils.lua");
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
local defineDevelopmentBuildingProd  			= GameDefines["JFD_CID_DEVELOPMENT_BUILDING_PROD"] or 0
local defineDevelopmentCrime	   	 			= GameDefines["JFD_CID_DEVELOPMENT_CRIME"]
local defineDevelopmentDefense	   	 			= GameDefines["JFD_CID_DEVELOPMENT_DEFENSE"]
local defineDevelopmentDisease	   	 			= GameDefines["JFD_CID_DEVELOPMENT_DISEASE"]
local defineDevelopmentHappiness   	 			= GameDefines["JFD_CID_DEVELOPMENT_HAPPINESS"]
local defineDevelopmentHealth	   	 			= GameDefines["JFD_CID_DEVELOPMENT_HEALTH"]
local defineDevelopmentPerBuilding 	 			= GameDefines["JFD_CID_DEVELOPMENT_PER_BUILDING"]
local defineDevelopmentWonderProd  	 			= GameDefines["JFD_CID_DEVELOPMENT_WONDER_PROD"] or 0
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local convertTextKey 						    = Locale.ConvertTextKey
local mathFloor		 						    = math.floor
------------------------------------------------------------------------------------------------------------------------
-- DEVELOPMENT
------------------------------------------------------------------------------------------------------------------------
--Player:GetCityDevelopment
if Player then
	local specialistGovernorID = GameInfo.Specialists["SPECIALIST_JFD_GOVERNOR"].ID
	function Player.GetCityDevelopment(player, city, returnsTT)
		local developmentThreshold = city:GetPopulation()
		local developmentThresholdMod = 0
		local developmentThresholdTT = ""
		--Provinces
		local developmentThresholdProvinces = 0
		for row in GameInfo.JFD_Provinces() do
			if row.ID == player:GetProvinceLevelWeShouldBe(city) then
				developmentThresholdProvinces = developmentThresholdProvinces + row.DevelopmentThresholdMod
			end
		end
		if developmentThresholdProvinces ~= 0 then
			developmentThreshold = developmentThreshold + ((developmentThreshold*developmentThresholdProvinces)/100)
			if returnsTT then
				if developmentThresholdProvinces > 0 then developmentThresholdProvinces = "+" .. developmentThresholdProvinces end
				developmentThresholdTT = developmentThresholdTT .. convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_THRESHOLD_FROM_PROVINCES", developmentThresholdProvinces)
			end
		end
		--Buildings
		local developmentThresholdBuildings = 0
		for row in GameInfo.Building_JFD_DevelopmentMods("DevelopmentThresholdMod <> 0") do
			if row.IsGlobal then
				if player:HasBuilding(GameInfoTypes[row.BuildingType]) then 
					developmentThresholdBuildings = developmentThresholdBuildings + row.DevelopmentThresholdMod
				end
			else
				if city:HasBuilding(GameInfoTypes[row.BuildingType]) then
					developmentThresholdBuildings = developmentThresholdBuildings + row.DevelopmentThresholdMod
				end
			end
		end
		if developmentThresholdBuildings ~= 0 then
			developmentThreshold = developmentThreshold + ((developmentThreshold*developmentThresholdMod)/100)
			if returnsTT then
				if developmentThresholdBuildings > 0 then developmentThresholdBuildings = "+" .. developmentThresholdBuildings end
				developmentThresholdTT = developmentThresholdTT .. convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_THRESHOLD_FROM_BUILDINGS", developmentThresholdBuildings)
			end
		end
		--Policies
		local developmentThresholdPolicies = 0
		for row in GameInfo.Policy_JFD_DevelopmentMods("DevelopmentThresholdMod <> 0") do
			if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
				developmentThresholdPolicies = developmentThresholdPolicies + row.DevelopmentThresholdMod
			end
		end
		if developmentThresholdPolicies ~= 0 then
			developmentThreshold = developmentThreshold + ((developmentThreshold*developmentThresholdPolicies)/100)
			if returnsTT then
				if developmentThresholdPolicies > 0 then developmentThresholdPolicies = "+" .. developmentThresholdPolicies end
				developmentThresholdTT = developmentThresholdTT .. convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_THRESHOLD_FROM_POLICIES", developmentThresholdPolicies)
			end
		end
		--Reforms
		local developmentThresholdReforms = 0
		for row in GameInfo.JFD_Reform_DevelopmentMods("DevelopmentThresholdMod <> 0") do
			if player:HasReform(GameInfoTypes[row.ReformType]) then
				developmentThresholdReforms = developmentThresholdReforms + row.DevelopmentThresholdMod
			end
		end
		if developmentThresholdReforms ~= 0 then
			developmentThreshold = developmentThreshold + ((developmentThreshold*developmentThresholdReforms)/100)
			if returnsTT then
				if developmentThresholdReforms > 0 then developmentThresholdReforms = "+" .. developmentThresholdReforms end
				developmentThresholdTT = developmentThresholdTT .. convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_THRESHOLD_FROM_REFORMS", developmentThresholdReforms)
			end
		end
		--Traits
		local developmentThresholdTraits = 0
		for row in GameInfo.Trait_JFD_DevelopmentMods("DevelopmentThresholdMod <> 0") do
			if player:HasTrait(GameInfoTypes[row.TraitType]) then
				developmentThresholdTraits = developmentThresholdTraits + row.DevelopmentThresholdMod
			end
		end
		if developmentThresholdTraits ~= 0 then
			developmentThreshold = developmentThreshold + ((developmentThreshold*developmentThresholdTraits)/100)
			if returnsTT then
				if developmentThresholdTraits > 0 then developmentThresholdTraits = "+" .. developmentThresholdTraits end
				developmentThresholdTT = developmentThresholdTT .. convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_THRESHOLD_FROM_TRAITS", developmentThresholdTraits)
			end
		end
		--AI
		if (not player:IsHuman()) then
			developmentThreshold = developmentThreshold + ((developmentThreshold*-20)/100)
		end
		local developmentTotal = 0
		local developmentBuildingMod, developmentImprovementMod = player:GetDevelopmentModifers(city)
		local developmentTT = ""
		--Buildings
		local yieldBuildingProduction = 0
		for row in GameInfo.BuildingClass_JFD_DevelopmentMods("DevelopmentChange <> 0") do
			local buildingClassID = GameInfoTypes[row.BuildingClassType]
			local yield = (row.DevelopmentChange/10)
			yieldBuildingProduction = yieldBuildingProduction + (city:GetNumBuildingClass(buildingClassID)*yield)
		end
		for row in GameInfo.Building_YieldChanges("YieldType = 'YIELD_JFD_DEVELOPMENT'") do
			local buildingID = GameInfoTypes[row.BuildingType]
			local yield = (row.Yield/10)
			yieldBuildingProduction = yieldBuildingProduction + (city:GetNumBuilding(buildingID)*yield)
		end
		for row in GameInfo.Policy_BuildingClassYieldChanges("YieldType = 'YIELD_JFD_DEVELOPMENT'") do
			local policyID = GameInfoTypes[row.PolicyType]
			if player:HasPolicy(policyID) then
				local buildingID = player:GetSpecificBuildingType(row.BuildingClassType)
				local yield = (row.YieldChange/10)
				yieldBuildingProduction = yieldBuildingProduction + (city:GetNumBuilding(buildingID)*yield)
			end
		end
		yieldBuildingProduction = yieldBuildingProduction + ((yieldBuildingProduction*developmentBuildingMod)/100)
		developmentTotal = developmentTotal + yieldBuildingProduction
		if (returnsTT and yieldBuildingProduction ~= 0) then
			developmentTT = developmentTT .. convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_FROM_BUILDINGS", yieldBuildingProduction)
		end
		--Features
		local developmentFeatures = 0
		for row in GameInfo.Policy_FeatureYieldChanges("YieldType = 'YIELD_JFD_DEVELOPMENT'") do
			local policyID = GameInfoTypes[row.PolicyType]
			if player:HasPolicy(policyID) then
				local featureID = GameInfoTypes[row.FeatureType]
				local yield = (row.Yield/10)
				developmentFeatures = developmentFeatures + (city:CountNumWorkedFeature(featureID)*yield)
			end
		end
		developmentTotal = developmentTotal + developmentFeatures
		if (returnsTT and developmentFeatures ~= 0) then
			developmentTT = developmentTT .. convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_FROM_FEATURES", developmentFeatures)
		end
		--Improvements
		local developmentImprovements = 0
		for row in GameInfo.Improvement_Yields("YieldType = 'YIELD_JFD_DEVELOPMENT'") do
			local improvementID = GameInfoTypes[row.ImprovementType]
			local yield = (row.Yield/10)
			developmentImprovements = developmentImprovements + (city:CountNumWorkedImprovement(improvementID)*yield)
			developmentImprovements = developmentImprovements + ((developmentImprovements*developmentImprovementMod)/100)
		end
		developmentTotal = developmentTotal + developmentImprovements
		if (returnsTT and developmentImprovements ~= 0) then
			developmentTT = developmentTT .. convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_FROM_IMPROVEMENTS", developmentImprovements)
		end
		--Resources
		local developmentResources = 0
		for row in GameInfo.Policy_ResourceYieldChanges("YieldType = 'YIELD_JFD_DEVELOPMENT'") do
			local policyID = GameInfoTypes[row.PolicyType]
			if player:HasPolicy(policyID) then
				local resourceID = GameInfoTypes[row.ResourceType]
				local yield = (row.Yield/10)
				developmentResources = developmentResources + (city:CountNumWorkedResource(resourceID)*yield)
			end
		end
		developmentTotal = developmentTotal + developmentResources
		if (returnsTT and developmentResources ~= 0) then
			developmentTT = developmentTT .. convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_FROM_RESOURCES", developmentResources)
		end
		--Specialists
		local developmentSpecialists = player:GetTotalDevelopmentPerSpecialist(city)
		developmentTotal = developmentTotal + developmentSpecialists
		if (returnsTT and developmentSpecialists ~= 0) then
			developmentTT = developmentTT .. convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_FROM_SPECIALISTS", developmentSpecialists)
		end
		local developmentIcon = "[ICON_JFD_DEVELOPMENT_SURPLUS]"
		if developmentTotal < 0 then developmentTotal = 0 end
		local developmentRate = mathFloor(developmentThreshold-developmentTotal)
		if developmentRate ~= 0 then developmentRate = developmentRate*-1 end
		if returnsTT then	
			local yieldHappiness, yieldHealth, yieldBuilding, yieldCrime, yieldDisease, yieldWonderProduction, yieldDefense = player:GetDevelopmentYields(city, developmentRate)
			if developmentRate >= 0 then
				local developmentReward = convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_TT_SURPLUS_TT", yieldHappiness, yieldHealth, yieldDefense)
				if userSettingCIDDevelopmentCoreProductionBuildings then
					developmentReward = convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_TT_SURPLUS_BUILDINGS_TT", yieldHappiness, yieldHealth, yieldBuilding, yieldDefense)
				end
				return developmentRate, developmentTotal, Game.GetRound(developmentThreshold,2), convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_TT", developmentThreshold, developmentThresholdTT, developmentTT, developmentTotal, "[COLOR_POSITIVE_TEXT]", "+" .. developmentRate, "TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_TT_SURPLUS", developmentReward, developmentIcon)
			else
				developmentIcon = "[ICON_JFD_DEVELOPMENT_DEFICIT]"
				local developmentPenalty = convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_TT_DEFICIT_TT", yieldCrime, yieldDisease, yieldWonderProduction, yieldDefense)
				return developmentRate, developmentTotal, Game.GetRound(developmentThreshold,2), convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_TT", developmentThreshold, developmentThresholdTT, developmentTT, developmentTotal, "[COLOR_NEGATIVE_TEXT]", developmentRate, "TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_TT_DEFICIT", developmentPenalty, developmentIcon)
			end	
		else
			return developmentRate, Game.GetRound(developmentTotal), Game.GetRound(developmentThreshold,2)
		end
	end
	
	--Player:GetDevelopmentModifers
	function Player.GetDevelopmentModifers(player, city)
		local developmentBuildingMod = 0
		local developmentImprovementMod = 0
		--Buildings
		for row in GameInfo.Building_JFD_DevelopmentMods("DevelopmentBuildingMod <> 0 OR DevelopmentImprovementMod <> 0") do
			if row.IsGlobal then
				if player:HasBuilding(GameInfoTypes[row.BuildingType]) then 
					developmentBuildingMod	  = developmentBuildingMod    + row.DevelopmentBuildingMod
					developmentImprovementMod = developmentImprovementMod + row.DevelopmentImprovementMod
				end
			else
				if city:HasBuilding(GameInfoTypes[row.BuildingType]) then
					developmentBuildingMod	  = developmentBuildingMod    + row.DevelopmentBuildingMod
					developmentImprovementMod = developmentImprovementMod + row.DevelopmentImprovementMod
				end
			end
		end
		--Policies
		for row in GameInfo.Policy_JFD_DevelopmentMods("DevelopmentBuildingMod <> 0 OR DevelopmentImprovementMod <> 0") do
			if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
				developmentBuildingMod	  = developmentBuildingMod    + row.DevelopmentBuildingMod
				developmentImprovementMod = developmentImprovementMod + row.DevelopmentImprovementMod
			end
		end
		--Reforms
		for row in GameInfo.JFD_Reform_DevelopmentMods("DevelopmentBuildingMod <> 0 OR DevelopmentImprovementMod <> 0") do
			if player:HasReform(GameInfoTypes[row.ReformType]) then
				developmentBuildingMod	  = developmentBuildingMod    + row.DevelopmentBuildingMod
				developmentImprovementMod = developmentImprovementMod + row.DevelopmentImprovementMod
			end
		end
		--Traits
		for row in GameInfo.Trait_JFD_DevelopmentMods("DevelopmentBuildingMod <> 0 OR DevelopmentImprovementMod <> 0") do
			if player:HasTrait(GameInfoTypes[row.TraitType]) then
				developmentBuildingMod	  = developmentBuildingMod    + row.DevelopmentBuildingMod
				developmentImprovementMod = developmentImprovementMod + row.DevelopmentImprovementMod
			end
		end
		return developmentBuildingMod, developmentImprovementMod, developmentDistrictMod
	end
	-----------------
	-- BUILDINGS
	-----------------
	--Player:GetBuildingDevelopment
	function Player.GetBuildingDevelopment(player, buildingType, buildingClassType, city)
		local development = 0
		for row in GameInfo.BuildingClass_JFD_DevelopmentMods("BuildingClassType = '" .. buildingClassType .. "' AND DevelopmentChange <> 0") do
			development = development + (row.DevelopmentChange/10)
		end
		for row in GameInfo.Building_YieldChanges("BuildingType = '" .. buildingType .. "' AND YieldType = 'YIELD_JFD_DEVELOPMENT'") do
			development = development + (row.Yield/10)
		end
		for row in GameInfo.Policy_BuildingClassYieldChanges("BuildingClassType = '" .. buildingClassType .. "' AND YieldType = 'YIELD_JFD_DEVELOPMENT'") do
			local policyID = GameInfoTypes[row.PolicyType]
			if player:HasPolicy(policyID) then
				development = development + (row.YieldChange/10)
			end
		end
		local districtID = player:GetBuildingDistrictID(buildingType, buildingClassType)
		local districtMultiplier = player:GetDistrictDevelopmentMultipliers(city, districtID)
		if districtMultiplier ~= 0 then	development = (development * districtMultiplier) end
		if GameInfoTypes then development = development + ((development*player:GetDevelopmentModifers(city))/100) end
		return development
	end
	-----------------
	-- SPECIALISTS
	-----------------
	--Player:GetDevelopmentPerSpecialist
	function Player.GetDevelopmentPerSpecialist(player, city, specialistID)
		if (not city) then return end
		local developmentThisSpecialist = 0
		local specialist = GameInfo.Specialists[specialistID]
		local specialistType = specialist.Type
		if (specialistID == specialistGovernorID and city:GetProvinceLevel() > 0) then
			developmentThisSpecialist = developmentThisSpecialist + (GameInfo.JFD_Provinces[city:GetProvinceLevel()].GovernorDevelopmentYield/10)
		end
		--Buildings
		for row in GameInfo.Building_SpecialistYieldChanges("YieldType = 'YIELD_JFD_DEVELOPMENT' AND SpecialistType = '" .. specialistType .. "'") do
			if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
				developmentThisSpecialist = developmentThisSpecialist + (row.Yield/10)
			end
		end
		for row in GameInfo.Building_SpecialistYieldChangesLocal("YieldType = 'YIELD_JFD_DEVELOPMENT' AND SpecialistType = '" .. specialistType .. "'") do
			if city:HasBuilding(GameInfoTypes[row.BuildingType]) then
				developmentThisSpecialist = developmentThisSpecialist + (row.Yield/10)
			end
		end
		--Policies
		for row in GameInfo.Policy_SpecialistExtraYields("YieldType = 'YIELD_JFD_DEVELOPMENT'") do
			if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
				developmentThisSpecialist = developmentThisSpecialist + (row.Yield/10)
			end
		end	
		for row in GameInfo.Policy_SpecialistYieldChanges("YieldType = 'YIELD_JFD_DEVELOPMENT' AND SpecialistType = '" .. specialistType .. "'") do
			if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
				developmentThisSpecialist = developmentThisSpecialist + (row.Yield/10)
			end
		end	
		--Specialists
		for row in GameInfo.SpecialistYields("YieldType = 'YIELD_JFD_DEVELOPMENT' AND SpecialistType = '" .. specialistType .. "'") do
			developmentThisSpecialist = developmentThisSpecialist + (row.Yield/10)
		end	
		--Traits
		for row in GameInfo.Trait_SpecialistYieldChanges("YieldType = 'YIELD_JFD_DEVELOPMENT' AND SpecialistType = '" .. specialistType .. "'") do
			if player:HasTrait(GameInfoTypes[row.TraitType]) then
				developmentThisSpecialist = developmentThisSpecialist + (row.Yield/10)
			end
		end	
		return developmentThisSpecialist
	end
	
	--Player:GetTotalDevelopmentPerSpecialist
	function Player.GetTotalDevelopmentPerSpecialist(player, city)
		local developmentSpecialistsTotal = 0
		for specialist in GameInfo.Specialists() do
			developmentSpecialistsTotal = developmentSpecialistsTotal + (player:GetDevelopmentPerSpecialist(city, specialist.ID)*city:GetSpecialistCount(specialist.ID))
		end
		--Buildings
		for row in GameInfo.Building_JFD_DevelopmentMods("DevelopmentSpecialistMod <> 0") do
			if row.IsLocal then
				if city:HasBuilding(GameInfoTypes[row.BuildingType]) then
					developmentSpecialistsTotal = developmentSpecialistsTotal + ((developmentSpecialistsTotal*row.DevelopmentSpecialistMod)/100) 
				end
			else
				if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
					developmentSpecialistsTotal = developmentSpecialistsTotal + ((developmentSpecialistsTotal*row.SpecialistDevelopmentMod)/100) 
				end
			end
		end	
		--Policies
		for row in GameInfo.Policy_JFD_DevelopmentMods("DevelopmentSpecialistMod <> 0") do
			if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
				developmentSpecialistsTotal = developmentSpecialistsTotal + ((developmentSpecialistsTotal*row.DevelopmentSpecialistMod)/100) 
			end
		end	
		--Traits
		for row in GameInfo.Trait_JFD_DevelopmentMods("DevelopmentSpecialistMod <> 0") do
			if player:HasTrait(GameInfoTypes[row.TraitType]) then
				developmentSpecialistsTotal = developmentSpecialistsTotal + ((developmentSpecialistsTotal*row.DevelopmentSpecialistMod)/100) 
			end
		end	
		--Reforms
		for row in GameInfo.JFD_Reform_DevelopmentMods("DevelopmentSpecialistMod <> 0") do
			if player:HasReform(GameInfoTypes[row.ReformType]) then
				developmentSpecialistsTotal = developmentSpecialistsTotal + ((developmentSpecialistsTotal*row.DevelopmentSpecialistMod)/100) 
			end
		end	
		return developmentSpecialistsTotal
	end
end
-----------------
-- YIELDS
-----------------
--Player:GetDevelopmentYields
local policyDevelopmentHappinessID  = GameInfo.Policies["POLICY_REFORM_JFD_DEVELOPMENT_HAPPINESS"].ID
local policyDevelopmentHealthID		= GameInfo.Policies["POLICY_REFORM_JFD_DEVELOPMENT_HEALTH"].ID
if Player then
	function Player.GetDevelopmentYields(player, city, developmentRate, isReturnsCrime)
		if (not developmentRate) then developmentRate = player:GetCityDevelopment(city) end
		local yieldCrime 			    = defineDevelopmentCrime
		local yieldDefense 			    = defineDevelopmentDefense
		local yieldDisease 			    = defineDevelopmentDisease
		local yieldHappiness 		    = defineDevelopmentHappiness
		local yieldHealth 		        = defineDevelopmentHealth
		local yieldBuildingProduction 	= 0
		local yieldWonderProduction 	= 0
		if ((not isReturnsCrime) and developmentRate >= 0) then
			yieldDefense = yieldDefense * developmentRate
			yieldHappiness = yieldHappiness * developmentRate
			yieldHealth = yieldHealth * developmentRate
			yieldBuildingProduction = (defineDevelopmentBuildingProd*developmentRate)
		else
			yieldDefense = yieldDefense * developmentRate
			yieldCrime = yieldCrime * (developmentRate*-1)
			if (not isReturnsCrime) then
				yieldDisease = yieldDisease * (developmentRate*-1)
				if player:IsHuman() then yieldWonderProduction = (defineDevelopmentWonderProd*developmentRate) end
			end
		end
		if (not player:IsHuman()) then
			yieldHappiness 		    = (yieldHappiness/2)
			yieldHealth	 		    = (yieldHealth/2)
			yieldBuildingProduction = (yieldBuildingProduction/2)
			yieldCrime	 		    = (yieldCrime/2)
			yieldDefense		    = (yieldDefense/2)
			yieldDisease		    = (yieldDisease/2)
			yieldWonderProduction	= (yieldWonderProduction/2)
		end	
		if (policyDevelopmentHappinessID and player:HasPolicy(policyDevelopmentHappinessID)) then
			yieldHappiness = yieldHappiness * 2
			yieldHealth = 0
		elseif (policyDevelopmentHealthID and player:HasPolicy(policyDevelopmentHealthID)) then
			yieldHappiness = 0
			yieldHealth = yieldHealth * 2
		end
		if isReturnsCrime then
			return yieldCrime
		else
			return yieldHappiness, yieldHealth, yieldBuildingProduction, yieldCrime, yieldDisease, yieldWonderProduction, yieldDefense
		end
	end
end
------------------------------------------------------------------------------------------------------------------------
-- DISTRICTS
------------------------------------------------------------------------------------------------------------------------
if Player then
	--Player:GetBuildingDistrictID
	function Player.GetBuildingDistrictID(player, buildingType, buildingClassType)
		local districtID = 1
		for row in GameInfo.BuildingClass_JFD_District("BuildingClassType = '" .. buildingClassType .. "'") do
			districtID = GameInfoTypes[row.DistrictType]
		end
		for row in GameInfo.Building_JFD_District("BuildingType = '" .. buildingType .. "'") do
			districtID = GameInfoTypes[row.DistrictType]
		end
		return districtID
	end
	
	--Player:GetDistrictDevelopmentMultipliers
	function Player.GetDistrictDevelopmentMultipliers(player, city, districtID, includesBase, returnsTT)
		local district = GameInfo.JFD_Districts[districtID]
		local districtType = district.Type
		local districtMultiplier = 0
		local districtMultiplierTT = ""
		if includesBase then 
			districtMultiplier = (district.DevelopmentMultiplier/10)
			if returnsTT then
				districtMultiplierTT = districtMultiplierTT .. convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_MULTIPLIER_FROM_BASE", districtMultiplier)
			end
		end
		--Buildings
		local multipliersBuildings = 0 
		for row in GameInfo.Building_JFD_DevelopmentMods("DevelopmentDistrictMultiplier <> 0 AND DistrictType = '" .. districtType .. "'") do
			if row.IsGlobal then
				if player:HasBuilding(GameInfoTypes[row.BuildingType]) then 
					multipliersBuildings = multipliersBuildings + (row.DevelopmentDistrictMultiplier/10)
				end
			else
				if city:HasBuilding(GameInfoTypes[row.BuildingType]) then
					multipliersBuildings = multipliersBuildings + (row.DevelopmentDistrictMultiplier/10)
				end
			end
			if returnsTT then
				districtMultiplierTT = districtMultiplierTT .. convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_MULTIPLIER_FROM_BUILDINGS", multipliersBuildings)
			end
		end
		--Policies
		local multipliersPolicies = 0 
		for row in GameInfo.Policy_JFD_DevelopmentMods("DevelopmentDistrictMultiplier <> 0 AND DistrictType = '" .. districtType .. "'") do
			if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
				multipliersPolicies = multipliersPolicies + (row.DevelopmentDistrictMultiplier/10)
			end
			if returnsTT then
				districtMultiplierTT = districtMultiplierTT .. convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_MULTIPLIER_FROM_POLICIES", multipliersPolicies)
			end
		end
		--Reforms
		local multipliersReforms = 0 
		for row in GameInfo.JFD_Reform_DevelopmentMods("DevelopmentDistrictMultiplier <> 0 AND DistrictType = '" .. districtType .. "'") do
			if player:HasReform(GameInfoTypes[row.ReformType]) then
				multipliersReforms = multipliersReforms + (row.DevelopmentDistrictMultiplier/10)
			end
			if returnsTT then
				districtMultiplierTT = districtMultiplierTT .. convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_MULTIPLIER_FROM_REFORMS", multipliersReforms)
			end
		end
		--Traits
		local multipliersTraits = 0 
		for row in GameInfo.Trait_JFD_DevelopmentMods("DevelopmentDistrictMultiplier <> 0 AND DistrictType = '" .. districtType .. "'") do
			if player:HasTrait(GameInfoTypes[row.TraitType]) then
				multipliersTraits = multipliersTraits + (row.DevelopmentDistrictMultiplier/10)
			end
			if returnsTT then
				districtMultiplierTT = districtMultiplierTT .. convertTextKey("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_MULTIPLIER_FROM_TRAITS", multipliersTraits)
			end
		end
		districtMultiplier = districtMultiplier + multipliersBuildings + multipliersPolicies + multipliersReforms + multipliersTraits
		return districtMultiplier, districtMultiplierTT
	end
end
--=======================================================================================================================
--=======================================================================================================================