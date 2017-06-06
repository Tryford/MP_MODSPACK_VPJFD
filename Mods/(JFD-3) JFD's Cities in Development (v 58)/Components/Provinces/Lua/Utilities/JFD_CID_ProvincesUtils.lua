-- JFD_CID_ProvincesUtils
-- Author: JFD
-- DateCreated: 11/3/2015 8:25:50 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_CIDUtilities.lua");
--include("JFD_CID_GlobalDefines.lua");
include("JFD_CulDivUtilities.lua");
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
local defineProvinceLevyMinPop = GameDefines["JFD_PROVINCES_LEVY_MIN_POP"]
--=======================================================================================================================
-- MOD USE
--=======================================================================================================================
local isUsingCulDiv = JFD_IsUsingCulDiv()
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingLoyaltyCore			 = JFD_GetUserSetting("JFD_CID_LOYALTY_CORE") == 1
local userSettingProvincesCore			 = JFD_GetUserSetting("JFD_CID_PROVINCES_CORE") == 1
local userSettingProvincesCoreLevies	 = JFD_GetUserSetting("JFD_CID_PROVINCES_CORE_LEVIES") == 1
local userSettingProvincesCoreLeviesAI   = JFD_GetUserSetting("JFD_CID_PROVINCES_CORE_LEVIES_AI") == 1
local userSettingProvincesTPs			 = JFD_GetUserSetting("JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST") == 1
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local convertTextKey = Locale.ConvertTextKey
local mathFloor		 = math.floor
------------------------------------------------------------------------------------------------------------------------
-- PROVINCES
------------------------------------------------------------------------------------------------------------------------
--JFD_GetProvinceUpgradeRequirements
function JFD_GetProvinceUpgradeRequirements(playerID, city)
	local player = Players[playerID]
	local provinceID = JFD_GetProvinceID(playerID, city)
	local province = GameInfo.JFD_Provinces[provinceID]
	local numImprovementReq = province.NumImprovementRequired
	local numPopulationReq  = province.NumPopulationRequired
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
		if JFD_HasReform(playerID, GameInfoTypes[row.ReformType]) then
			numImprovementReq = numImprovementReq + ((numImprovementReq*row.ProvinceImprovementReqMod)/100)
		end
	end
	for row in GameInfo.JFD_Reform_ProvinceMods("ProvincePopulationReqMod <> 0") do
		if JFD_HasReform(playerID, GameInfoTypes[row.ReformType]) then
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
	return JFD_Round(numImprovementReq), JFD_Round(numPopulationReq), city:CountNumImprovedPlots(), city:GetPopulation()
end
--------------------
-- TEXT
--------------------
--JFD_GetProvinceInfoTT
local loyaltyRebelliousID	 = GameInfoTypes["LOYALTY_JFD_REBELLIOUS"]
local loyaltySeparatistID	 = GameInfoTypes["LOYALTY_JFD_SEPARATIST"]
local policyLeviesReservedID = GameInfoTypes["POLICY_REFORM_JFD_LEVIES_RESERVE"]
function JFD_GetProvinceInfoTT(playerID, city)
	local player = Players[playerID]
	local provinceTT = ""
	local provinceID = JFD_GetProvinceID(playerID, city)
	local province = GameInfo.JFD_Provinces[provinceID]
	local provinceDesc = JFD_GetProvinceTitle(playerID, city, province.Description)
	local provinceBonusTT = ""
	local provinceBombardRange	= province.BombardRange
	local provinceBorderMod 	= province.BorderModifier
	local provinceNumUnits 		= province.NumUnitsSpawned
	local provinceNumUnitsXP 	= province.NumUnitsXP
	if provinceBombardRange > 0 then
		provinceBonusTT = provinceBonusTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_PROVINCE_JFD_EFFECT_BOMBARD", provinceBombardRange)
	end
	if provinceBorderMod ~= 0 then
		provinceBonusTT = provinceBonusTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_PROVINCE_JFD_EFFECT_TILES", provinceBorderMod)
	end
	for row in GameInfo.JFD_Province_DevelopmentMods("ProvinceType = '" .. province.Type .. "'") do
		provinceBonusTT = provinceBonusTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_PROVINCE_JFD_EFFECT_DEVELOPMENT", row.DevelopmentThresholdMod)
		break
	end
	if province.IsTownBonus then
		provinceBonusTT = provinceBonusTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_PROVINCE_JFD_EFFECT_TOWNS")
	end
	if province.IsVillageBonus then
		provinceBonusTT = provinceBonusTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_PROVINCE_JFD_EFFECT_VILLAGES")
	end
	if (not player:HasPolicy(policyLeviesReservedID)) then
		if provinceNumUnits > 0 then
			local unitID = GetStrongestLevyUnit(player, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")
			if (not unitID) then unitID = 0 end
			unitID = player:GetSpecificUnitType(GameInfo.Units[unitID].Class) 
			provinceBonusTT = provinceBonusTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_PROVINCE_JFD_EFFECT_LEVIES", provinceNumUnits, GameInfo.Units[unitID].Description)
		end
	end
	if provinceNumUnitsXP > 0 then
		provinceBonusTT = provinceBonusTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_PROVINCE_JFD_EFFECT_LEVIES_XP", provinceNumUnitsXP)
	end
	if province.UpgradeProvinceType then
		local reqImpr, reqPop, cityImpr, cityPop = JFD_GetProvinceUpgradeRequirements(playerID, city)
		provinceTT = convertTextKey("TXT_KEY_CITYVIEW_JFD_PROVINCE_TT", province.IconString, province.Description, provinceBonusTT, province.BuildingDescription, reqPop, cityPop, reqImpr, cityImpr)
	else
		provinceTT = convertTextKey("TXT_KEY_CITYVIEW_JFD_PROVINCE_TT_FIN", province.IconString, province.Description, provinceBonusTT)
	end
	if userSettingLoyaltyCore then provinceTT = provinceTT .. "[NEWLINE]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_PROVINCE_TT_LOYALTY") end
	return provinceTT
end
--------------------
-- NAME
--------------------
--JFD_GetProvinceName
function JFD_GetProvinceName(city)
	local cityID = JFD_GetCityID(city)
	--if JFD_CID[cityID] then 
		--return JFD_CID[cityID].ProvinceName 
	--end
	return city:GetName()
end

--JFD_SetProvinceName
function JFD_SetProvinceName(city, provinceName)
	local cityID = JFD_GetCityID(city)
	--JFD_CID[cityID] = {}
	--JFD_CID[cityID].ProvinceName = provinceName
end
--------------------
-- TITLE
--------------------
--JFD_GetUniqueProvinceTitle
local improvementCitadelID = GameInfoTypes["IMPROVEMENT_CITADEL"]
local improvementFortID	   = GameInfoTypes["IMPROVEMENT_FORT"]
local governmentRepublicID = GameInfoTypes["GOVERNMENT_JFD_REPUBLIC"]
local policyRepublicID	   = GameInfoTypes["POLICY_REPUBLIC"]
local provinceColonyID	   = GameInfoTypes["PROVINCE_JFD_COLONY"]
local provinceDuchyID	   = GameInfoTypes["PROVINCE_JFD_DUCHY"]
function JFD_GetUniqueProvinceTitle(playerID, city)
	local player = Players[playerID]
	local provinceID = JFD_GetProvinceID(playerID, city)
	if city:IsCapital() then provinceID = provinceDuchyID end
	local province = GameInfo.JFD_Provinces[provinceID]
	local provinceDesc = province.Description 
	local provinceDescReligious = provinceDesc
	if (city:IsOnImprovement(improvementCitadelID) or city:IsOnImprovement(improvementFortID)) then
		if province.DescriptionAlt then provinceDesc = province.DescriptionAlt end
	end
	for row in GameInfo.Policy_JFD_ProvinceTitles("DefaultTitle = '" .. provinceDesc .. "'") do
		local policyID = GameInfoTypes[row.PolicyType]
		if player:HasPolicy(policyID) then
			if row.ReligionType then
				local religionID = GameInfoTypes[row.ReligionType]
				if (player:GetStateReligion() == religionID or player:GetMajorityReligion() == religionID) then
					return row.UniqueTitle
				end
			end
			provinceDesc = row.UniqueTitle
		end
	end
	local governmentID = player:GetGovernment()
	if player:HasGovernment() then
		for row in GameInfo.JFD_Government_ProvinceTitles("DefaultTitle = '" .. provinceDesc .. "' AND GovernmentType = '" .. GameInfo.JFD_Governments[governmentID].Type .. "'") do
			if row.ReligionType then	
				local religionID = GameInfoTypes[row.ReligionType]
				if (player:GetStateReligion() == religionID or player:GetMajorityReligion() == religionID) then
					return row.UniqueTitle
				end
			end
			provinceDesc = row.UniqueTitle
		end
	end
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	for row in GameInfo.Civilization_JFD_ProvinceTitles("DefaultTitle = '" .. provinceDesc .. "' AND CivilizationType = '" .. civType .. "'") do
		return row.UniqueTitle
	end
	if isUsingCulDiv then
		local cultureType = GameInfo.JFD_CultureTypes[JFD_GetCultureID(playerID)].Type
		for row in GameInfo.JFD_CultureType_ProvinceTitles("DefaultTitle = '" .. provinceDesc .. "' AND CultureType = '" .. cultureType .. "'") do
			return row.UniqueTitle
		end
	end
	return provinceDesc
end

--JFD_GetUniqueProvinceRulerTitle
function JFD_GetUniqueProvinceRulerTitle(playerID, city)
	local player = Players[playerID]
	local provinceID = JFD_GetProvinceID(playerID, city)
	if city:IsCapital() then provinceID = provinceDuchyID end
	local province = GameInfo.JFD_Provinces[provinceID]
	local provinceRuler = province.DefaultRulerTitle
	local provinceRulerReligious = provinceRuler
	if (city:IsOnImprovement(improvementCitadelID) or city:IsOnImprovement(improvementFortID)) then
		provinceRuler = province.DefaultRulerTitleAlt 
	end
	for row in GameInfo.Policy_JFD_ProvinceTitles("DefaultTitle = '" .. provinceRuler .. "'") do
		local policyID = GameInfoTypes[row.PolicyType]
		if player:HasPolicy(policyID) then
			if row.ReligionType then
				local religionID = GameInfoTypes[row.ReligionType]
				if (player:GetStateReligion() == religionID or player:GetMajorityReligion() == religionID) then
					provinceDescReligious = row.UniqueTitle
				end
			else
				provinceDesc = row.UniqueTitle
			end
		end
	end
	for row in GameInfo.Policy_JFD_ProvinceTitles("DefaultTitle = '" .. provinceRuler .. "'") do
		local policyID = GameInfoTypes[row.PolicyType]
		if player:HasPolicy(policyID) then
			if row.ReligionType then
				local religionID = GameInfoTypes[row.ReligionType]
				if (player:GetStateReligion() == religionID or player:GetMajorityReligion() == religionID) then
					provinceRulerReligious = row.UniqueTitle
				end
			else
				provinceRuler = row.UniqueTitle
			end
		end
	end
	if (not player:HasGovernment()) then return provinceRuler end
	local governmentID = player:GetGovernment()
	if ((not player:HasPolicy(policyRepublicID)) and governmentID ~= governmentRepublicID) then
		for row in GameInfo.JFD_Government_ProvinceTitles("DefaultTitle = '" .. provinceRuler .. "' AND GovernmentType = '" .. GameInfo.JFD_Governments[governmentID].Type .. "'") do
			if row.ReligionType then	
				local religionID = GameInfoTypes[row.ReligionType]
				if (player:GetStateReligion() == religionID or player:GetMajorityReligion() == religionID) then
					provinceRulerReligious = row.UniqueTitle
				end
			end
			provinceRuler = row.UniqueTitle
		end
		local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
		for row in GameInfo.Civilization_JFD_ProvinceTitles("DefaultTitle = '" .. provinceRuler .. "' AND CivilizationType = '" .. civType .. "'") do
			provinceRuler = row.UniqueTitle
		end
		if isUsingCulDiv then
			local cultureType = GameInfo.JFD_CultureTypes[JFD_GetCultureID(playerID)].Type
			for row in GameInfo.JFD_CultureType_ProvinceTitles("DefaultTitle = '" .. provinceRuler .. "' AND CultureType = '" .. cultureType .. "'") do
				provinceRuler = row.UniqueTitle
			end
		end
		if uniqueDescReligious then return provinceRulerReligious end
		return provinceRuler
	end
end

--JFD_GetProvinceTitle
function JFD_GetProvinceTitle(playerID, city)
	local player = Players[playerID]
	local provinceTitle = ""
	local provinceID = JFD_GetProvinceID(playerID, city)
	local province = GameInfo.JFD_Provinces[provinceID]
	provinceTitle = convertTextKey("TXT_KEY_CITYVIEW_JFD_PROVINCE", province.IconString, JFD_GetUniqueProvinceTitle(playerID, city), JFD_GetProvinceName(city))
	return provinceTitle
end
------------------------------------------------------------------------------------------------------------------------
-- LEVIES
------------------------------------------------------------------------------------------------------------------------
--JFD_CanPurchaseLevies
function JFD_CanPurchaseLevies(playerID, city)
	local player = Players[playerID]
	if (policyLeviesReservedID and player:HasPolicy(policyLeviesReservedID)) then
		return false 
	end	
	return JFD_IsTechnologyRequirementUnlocked(playerID, "AllowLevies")
end

--JFD_GetLevyCost
local defineLeviesPurchaseCost = GameDefines["JFD_PROVINCES_LEVY_COST_POP"]
function JFD_GetLevyCost(playerID, unitID)
	local unit = GameInfo.Units[unitID]
	if unit.Cost <= 0 then return 0 end
	if unit.Mechanized then return 0 end
	if unit.MoveRate == 'WHEELED'then return 0 end
	if (unit.CombatClass == 'UNITCOMBAT_MELEE' or unit.CombatClass == 'UNITCOMBAT_GUN') then
		return defineLeviesPurchaseCost
	end
	return 0
end
--=======================================================================================================================
--=======================================================================================================================