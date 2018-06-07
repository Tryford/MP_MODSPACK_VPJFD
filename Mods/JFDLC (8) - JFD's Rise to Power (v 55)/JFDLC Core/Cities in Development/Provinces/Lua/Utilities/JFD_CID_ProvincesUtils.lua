-- JFD_CID_ProvincesUtils
-- Author: JFD
-- DateCreated: 11/3/2015 8:25:50 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFDLCUtils.lua");
include("JFDLC_GlobalDefines.lua");
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
local defineCIDProvinceCityCostMod 			= GameDefines["JFD_CID_PROVINCES_CITY_COST_MOD"]
local defineCIDProvinceLevyMinPop 			= GameDefines["JFD_CID_PROVINCES_LEVY_MIN_POP"]
local defineCIDProvincesLeviesPurchaseCost 	= GameDefines["JFD_CID_PROVINCES_LEVY_COST_POP"]
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingCIDCrimeOrganizedCore	    = (Game.GetUserSetting("JFD_CID_CRIMES_CORE_ORGANIZED") == 1)
local userSettingCIDLoyaltyCore			 	=(Game.GetUserSetting("JFD_CID_LOYALTY_CORE") == 1)
local userSettingCIDProvincesCore			=(Game.GetUserSetting("JFD_CID_PROVINCES_CORE") == 1)
local userSettingCIDProvincesCoreLevies	 	=(Game.GetUserSetting("JFD_CID_PROVINCES_CORE_LEVIES") == 1)
local userSettingCIDProvincesCoreLeviesAI   =(Game.GetUserSetting("JFD_CID_PROVINCES_CORE_LEVIES_AI") == 1)
local userSettingCIDProvincesTPs			=(Game.GetUserSetting("JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST") == 1)
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local convertTextKey 						= Locale.ConvertTextKey

local loyaltyRebelliousID	 				= GameInfoTypes["LOYALTY_JFD_REBELLIOUS"]
local loyaltySeparatistID	 				= GameInfoTypes["LOYALTY_JFD_SEPARATIST"]

local policyLeviesReservedID 				= GameInfoTypes["POLICY_REFORM_JFD_LEVIES_RESERVE"]
	
local provinceBaronyID  					= GameInfoTypes["PROVINCE_JFD_BARONY"]
local provinceCapitalID 					= GameInfoTypes["PROVINCE_JFD_CAPITAL"]
local provinceCountyID  					= GameInfoTypes["PROVINCE_JFD_COUNTY"]
local provinceDuchyID  						= GameInfoTypes["PROVINCE_JFD_DUCHY"]
------------------------------------------------------------------------------------------------------------------------
-- PROVINCES
------------------------------------------------------------------------------------------------------------------------
--Player:GetProvinceLevelWeShouldBe
function Player.GetProvinceLevelWeShouldBe(player, city)
	local provinceID = city:GetProvinceLevel()
	if provinceID <= 0 then 
		for provinces in GameInfo.JFD_Provinces() do
			if city:HasBuilding(GameInfoTypes[BuildingType]) then
				provinceID = row.ID
			end
		end
	end
	return provinceID
end

--Player:GetProvinceUpgradeRequirements
function Player.GetProvinceUpgradeRequirements(player, city, provinceID)
	if (not provinceID) then provinceID = player:GetProvinceLevelWeShouldBe(city) end
	local province = GameInfo.JFD_Provinces[provinceID]
	if (province.UpgradeProvinceType == nil) then return 0,0 end
	local provinceUpgrade = GameInfo.JFD_Provinces[province.UpgradeProvinceType]
	local hasConnection = player:IsCapitalConnectedToCity(city)
	local hasConnectionViaSP = false
	for building in GameInfo.Buildings("RemovesProvincesConnectionReq = 1") do
		if player:HasBuilding(building.ID) then
			hasConnection = true
			hasConnectionViaSP = true
			break
		end
	end
	local numCitiesMod=0
	if provinceUpgrade~=nil and provinceUpgrade.BuildingType~=nil then
	 numCitiesMod = (player:CountNumBuildings(GameInfoTypes[provinceUpgrade.BuildingType])*defineCIDProvinceCityCostMod)
	end
	for row in GameInfo.Building_JFD_ProvinceMods("ProvinceCityModMod <> 0") do
		if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
			numCitiesMod = numCitiesMod + ((numCitiesMod*row.ProvinceCityModMod)/100)
		end
	end
	for row in GameInfo.Policy_JFD_ProvinceMods("ProvinceCityModMod <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			numCitiesMod = numCitiesMod + ((numCitiesMod*row.ProvinceCityModMod)/100)
		end
	end
	for row in GameInfo.JFD_Reform_ProvinceMods("ProvinceCityModMod <> 0") do
		if player:HasReform(GameInfoTypes[row.ReformType]) then
			numCitiesMod = numCitiesMod + ((numCitiesMod*row.ProvinceCityModMod)/100)
		end
	end
	for row in GameInfo.Trait_JFD_ProvinceMods("ProvinceCityModMod <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			numCitiesMod = numCitiesMod + ((numCitiesMod*row.ProvinceCityModMod)/100)
		end
	end
	local numImprovementReq = Game.GetRound(provinceUpgrade.NumImprovementRequired + numCitiesMod)
	local numPopulationReq  = Game.GetRound(provinceUpgrade.NumPopulationRequired + numCitiesMod)
	for row in GameInfo.Building_JFD_ProvinceMods("ProvinceImprovementReqMod <> 0") do
		if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
			numImprovementReq = numImprovementReq + ((numImprovementReq*row.ProvinceImprovementReqMod)/100)
		end
	end
	for row in GameInfo.Building_JFD_ProvinceMods("ProvincePopulationReqMod <> 0") do
		if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
			numPopulationReq = numPopulationReq + ((numPopulationReq*row.ProvincePopulationReqMod)/100)
		end
	end
	for row in GameInfo.Policy_JFD_ProvinceMods("ProvinceImprovementReqMod <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			numImprovementReq = numImprovementReq + ((numImprovementReq*row.ProvinceImprovementReqMod)/100)
		end
	end
	for row in GameInfo.Policy_JFD_ProvinceMods("ProvincePopulationReqMod <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			numPopulationReq = numPopulationReq + ((numPopulationReq*row.ProvincePopulationReqMod)/100)
		end
	end
	for row in GameInfo.JFD_Reform_ProvinceMods("ProvinceImprovementReqMod <> 0") do
		if player:HasReform(GameInfoTypes[row.ReformType]) then
			numImprovementReq = numImprovementReq + ((numImprovementReq*row.ProvinceImprovementReqMod)/100)
		end
	end
	for row in GameInfo.JFD_Reform_ProvinceMods("ProvincePopulationReqMod <> 0") do
		if player:HasReform(GameInfoTypes[row.ReformType]) then
			numPopulationReq = numPopulationReq + ((numPopulationReq*row.ProvincePopulationReqMod)/100)
		end
	end
	for row in GameInfo.Trait_JFD_ProvinceMods("ProvinceImprovementReqMod <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			numImprovementReq = numImprovementReq + ((numImprovementReq*row.ProvinceImprovementReqMod)/100)
		end
	end
	for row in GameInfo.Trait_JFD_ProvinceMods("ProvincePopulationReqMod <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			numPopulationReq = numPopulationReq + ((numPopulationReq*row.ProvincePopulationReqMod)/100)
		end
	end
	return Game.GetRound(numImprovementReq), Game.GetRound(numPopulationReq), city:CountNumImprovedPlots(), city:GetPopulation(), hasConnection, hasConnectionViaSP, provinceUpgrade
end
--------------------
-- TEXT
--------------------
--Player:GetProvinceInfoTT
function Player.GetProvinceInfoTT(player, city, provinceID)
	if (not provinceID) then provinceID = player:GetProvinceLevelWeShouldBe(city) end
	local provinceTT = ""
	local provinceSimpleTT = ""
	local province = GameInfo.JFD_Provinces[provinceID]
	local provinceBonusTT = ""
	local provinceBombardRange	 = province.BombardRange
	local provinceBorderMod 	 = province.BorderModifier
	local provinceDevelopmentMod = province.DevelopmentThresholdMod
	local provinceNumUnits 		 = province.NumUnitsSpawned
	local provinceNumUnitsXP 	 = province.NumUnitsXP
	local provinceOCMod 		 = province.OrganizedCrimeMod
	if provinceBombardRange > 0 then
		provinceBonusTT = provinceBonusTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_PROVINCE_JFD_EFFECT_BOMBARD", provinceBombardRange)
	end
	if provinceBorderMod ~= 0 then
		provinceBonusTT = provinceBonusTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_PROVINCE_JFD_EFFECT_TILES", provinceBorderMod)
	end
	if provinceDevelopmentMod ~= 0 then
		provinceBonusTT = provinceBonusTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_PROVINCE_JFD_EFFECT_DEVELOPMENT", provinceDevelopmentMod)
	end
	if (provinceOCMod ~= 0 and userSettingCIDCrimeOrganizedCore) then
		provinceBonusTT = provinceBonusTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_PROVINCE_JFD_EFFECT_ORGANIZED_CRIMES_MOD", provinceOCMod)
	end
	if province.IsTownBonus then
		provinceBonusTT = provinceBonusTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_PROVINCE_JFD_EFFECT_TOWNS")
	end
	if province.IsVillageBonus then
		provinceBonusTT = provinceBonusTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_PROVINCE_JFD_EFFECT_VILLAGES")
	end
	if userSettingCIDProvincesCoreLevies then
		if (not player:HasPolicy(policyLeviesReservedID)) then
			if provinceNumUnits > 0 then
				local unitID = player:GetStrongestLevyUnit("UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")
				if (not unitID) then unitID = 0 end
				unitID = player:GetSpecificUnitType(GameInfo.Units[unitID].Class) 
				provinceBonusTT = provinceBonusTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_PROVINCE_JFD_EFFECT_LEVIES", provinceNumUnits, GameInfo.Units[unitID].Description)
			end
		end
		if provinceNumUnitsXP > 0 then
			provinceBonusTT = provinceBonusTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_PROVINCE_JFD_EFFECT_LEVIES_XP", provinceNumUnitsXP)
		end
	end
	if province.UpgradeProvinceType then
		local reqImpr, reqPop, cityImpr, cityPop = player:GetProvinceUpgradeRequirements(city, provinceID)
		provinceTT = convertTextKey("TXT_KEY_CITYVIEW_JFD_PROVINCE_TT", province.IconString, province.Description, provinceBonusTT, province.BuildingDescription, reqPop, cityPop, reqImpr, cityImpr)
	else
		provinceTT = convertTextKey("TXT_KEY_CITYVIEW_JFD_PROVINCE_TT_FIN", province.IconString, province.Description, provinceBonusTT)
	end
	provinceSimpleTT = convertTextKey("TXT_KEY_CITYVIEW_JFD_PROVINCE_TEXT", province.IconString, province.Description)
	if userSettingCIDLoyaltyCore then provinceTT = provinceTT .. "[NEWLINE]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_PROVINCE_TT_LOYALTY") end
	return provinceSimpleTT, provinceTT
end
--------------------
-- NAME
--------------------
--Player:GetProvinceName
function Player.GetProvinceName(player, city)
	local cityID = player:CompileCityID(city)
	--if JFDLC_ProvinceName[cityID] then 
		--return JFDLC_ProvinceName[cityID] -- Depends on TSL
	--end
	return city:GetName()
end

--Player:SetProvinceName
function Player.SetProvinceName(player, city, provinceName)
	local cityID = player:CompileCityID(city)
	--JFDLC_ProvinceName[cityID] = {}
	--JFDLC_ProvinceName[cityID] = provinceName -- Depends on TSL
end
--------------------
-- TITLE
--------------------
--Player:GetUniqueProvinceTitle
local improvementCitadelID = GameInfoTypes["IMPROVEMENT_CITADEL"]
local improvementFortID	   = GameInfoTypes["IMPROVEMENT_FORT"]
local governmentRepublicID = GameInfoTypes["GOVERNMENT_JFD_REPUBLIC"]
local policyRepublicID	   = GameInfoTypes["POLICY_REPUBLIC"]
function Player.GetUniqueProvinceTitle(player, city, provinceID)
	if (not provinceID) then provinceID = player:GetProvinceLevelWeShouldBe(city) end
	if city:IsCapital() then provinceID = provinceDuchyID end
	local province = GameInfo.JFD_Provinces[provinceID]
	local provinceDesc = province.Description 
	local provinceDescReligious = provinceDesc
	if (city:IsOnImprovement(improvementCitadelID) or city:IsOnImprovement(improvementFortID)) then
		if province.DescriptionAlt then provinceDesc = province.DescriptionAlt end
	end
	if player:HasGovernment() then
		for row in GameInfo.JFD_Government_ProvinceTitles("DefaultTitle = '" .. provinceDesc .. "' AND GovernmentType = '" .. GameInfo.JFD_Governments[player:GetGovernment()].Type .. "'") do
			if row.ReligionType then	
				if player:GetStateReligion() == GameInfoTypes[row.ReligionType] then
					return row.UniqueTitle
				end
			else
				provinceDesc = row.UniqueTitle
			end
		end
	end
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	for row in GameInfo.Civilization_JFD_ProvinceTitles("DefaultTitle = '" .. provinceDesc .. "' AND CivilizationType = '" .. civType .. "'") do
		return row.UniqueTitle
	end
	local cultureType = GameInfo.JFD_CultureTypes[player:GetCultureType()].Type
	for row in GameInfo.JFD_CultureType_ProvinceTitles("DefaultTitle = '" .. provinceDesc .. "' AND CultureType = '" .. cultureType .. "'") do
		return row.UniqueTitle
	end
	return provinceDesc
end

--Player:GetUniqueProvinceRulerTitle
function Player.GetUniqueProvinceRulerTitle(player, city, provinceID)
	if (not provinceID) then provinceID = player:GetProvinceLevelWeShouldBe(city) end
	local provinceID = city:GetProvinceLevel()
	if city:IsCapital() then provinceID = provinceDuchyID end
	local province = GameInfo.JFD_Provinces[provinceID]
	local provinceRuler = province.DefaultRulerTitle
	local provinceRulerReligious = provinceRuler
	if (city:IsOnImprovement(improvementCitadelID) or city:IsOnImprovement(improvementFortID)) then
		provinceRuler = province.DefaultRulerTitleAlt 
	end
	if (not player:HasGovernment()) then return provinceRuler end
	--if player:GetGovernment() ~= governmentRepublicID) then
		for row in GameInfo.JFD_Government_ProvinceTitles("DefaultTitle = '" .. provinceRuler .. "' AND GovernmentType = '" .. GameInfo.JFD_Governments[player:GetGovernment()].Type .. "'") do
			if row.ReligionType then	
				if player:GetStateReligion() == GameInfoTypes[row.ReligionType] then
					provinceRulerReligious = row.UniqueTitle
				end
			else
				provinceDesc = row.UniqueTitle
			end
		end
		local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
		for row in GameInfo.Civilization_JFD_ProvinceTitles("DefaultTitle = '" .. provinceRuler .. "' AND CivilizationType = '" .. civType .. "'") do
			provinceRuler = row.UniqueTitle
		end
		local cultureType = GameInfo.JFD_CultureTypes[player:GetCultureType()].Type
		for row in GameInfo.JFD_CultureType_ProvinceTitles("DefaultTitle = '" .. provinceRuler .. "' AND CultureType = '" .. cultureType .. "'") do
			provinceRuler = row.UniqueTitle
		end
		if uniqueDescReligious then return provinceRulerReligious end
	--end
	return provinceRuler
end

--Player:GetProvinceTitle
function Player.GetProvinceTitle(player, city, provinceID)
	if (not provinceID) then provinceID = player:GetProvinceLevelWeShouldBe(city) end
	local provinceTitle = ""
	local province = GameInfo.JFD_Provinces[provinceID]
	provinceTitle = convertTextKey("TXT_KEY_CITYVIEW_JFD_PROVINCE", province.IconString, player:GetUniqueProvinceTitle(city, provinceID), player:GetProvinceName(city))
	return provinceTitle
end
------------------------------------------------------------------------------------------------------------------------
-- LEVIES
------------------------------------------------------------------------------------------------------------------------
--Player:GetStrongestLevyUnit (Sukritact)
function Player.GetStrongestLevyUnit(pPlayer, ...)
	local tUnit = {["ID"] = GameInfoTypes.UNIT_WARRIOR, ["Combat"] = 0}
	for iKey, sCombatType in pairs(arg) do
		for pUnit in GameInfo.Units("CombatClass = \'" .. sCombatType .. "\'") do
			if pPlayer:CanTrain(pUnit.ID, bIgnoreResourceRequirement) and pUnit.Combat > tUnit.Combat then
				local bHasResourceReq = false
				for row in GameInfo.Unit_ResourceQuantityRequirements("UnitType = '" .. pUnit.Type .. "'") do
					bHasResourceReq = true
				end
				if (not bHasResourceReq) then tUnit = pUnit end
			end
		end
	end
	return tUnit.ID
end

--Player:CanPurchaseLevies
function Player.CanPurchaseLevies(player, city)
	if (policyLeviesReservedID and player:HasPolicy(policyLeviesReservedID)) then
		return false 
	end	
	for row in GameInfo.Policies("AllowsEarlyLevies = 1") do
		if player:HasPolicy(row.ID) then return true end
	end
	return player:HasTechnologyRequiredForUnlock("AllowLevies")
end

--Player:GetUnitLevyCost
function Player.GetUnitLevyCost(player, unitID)
	local unit = GameInfo.Units[unitID]
	if unit.Cost <= 0 then return 0 end
	if unit.Mechanized then return 0 end
	if unit.MoveRate == 'WHEELED'then return 0 end
	if (unit.CombatClass == 'UNITCOMBAT_MELEE' or unit.CombatClass == 'UNITCOMBAT_GUN') then
		return defineCIDProvincesLeviesPurchaseCost
	end
	return 0
end
------------------------------------------------------------------------------------------------------------------------
-- GOVERNORS
------------------------------------------------------------------------------------------------------------------------
--Player:GetCityGovernorDetails
function Player.GetCityGovernorDetails(player, city, buildingType, returnDevelopmentYield)
	local province = GameInfo.JFD_Provinces[GameInfo.Buildings[buildingType].ProvinceUpgradeType]
	if returnDevelopmentYield then return province.GovernorDevelopmentYield end
	return player:GetUniqueProvinceRulerTitle(city, province.ID), province.GovernorDevelopmentYield
end
--=======================================================================================================================
--=======================================================================================================================