--JFD_CIDUtilities
-- Author: JFD
-- DateCreated: 12/7/2014 3:33:16 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("FLuaVector.lua")
include("PlotIterators.lua");
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
--JFD_IsUsingCBP
function JFD_IsUsingCBP()
	local cBPModID = "8411a7a8-dad3-4622-a18e-fcc18324c799"
	--for _, mod in pairs(Modding.GetActivatedMods()) do
		--if (mod.ID == cBPModID) then
			return true
		--end
	--end
	--return false
end

--JFD_IsUsingCIVDiplo
function JFD_IsUsingCIVDiplo()
	local civIVDiploModID = "c7bf7064-d1b1-4708-9e93-7a1560868582"
	--for _, mod in pairs(Modding.GetActivatedMods()) do
		--if (mod.ID == civIVDiploModID) then
			return true
		--end
	--end
	--return false
end

--JFD_IsUsingCulDiv
function JFD_IsUsingCulDiv()
	local culDivModID = "31a31d1c-b9d7-45e1-842c-23232d66cd47"
	--for _, mod in pairs(Modding.GetActivatedMods()) do
		--if (mod.ID == culDivModID) then
			return true
		--end
	--end
	--return false
end

--JFD_IsUsingEventsDecisions
function JFD_IsUsingEventsDecisions()
	local eventsDecisionsModID = "1f941088-b185-4159-865c-472df81247b2"
	--for _, mod in pairs(Modding.GetActivatedMods()) do
		--if (mod.ID == eventsDecisionsModID) then
			return false--true
		--end
	--end
end

--JFD_IsUsingEUI
function JFD_IsUsingEUI(isTopPanelCheck)
	local isUsingEUI = false
	if (isTopPanelCheck and ContextPtr:LookUpControl("/InGame/TopPanel/ClockOptionsPanel")) then
		return true
	elseif ContextPtr:LookUpControl("/InGame/CityView/CityInfoBG") then
		return true
	end
	return false
end

--JFD_IsUsingGreatWorksManager
function JFD_IsUsingGreatWorksManager()
	local greatWorksManagerModID = "230546ae-ac6b-4a16-bd25-98c3b402849b"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == greatWorksManagerModID) then
			return true
		end
	end
	return false
end

--JFD_IsUsingInfoAddict
function JFD_IsUsingInfoAddict()
	local infoAddictModID = "aec5d10d-f00f-4fc7-b330-c3a1e86c91c3"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == infoAddictModID) then
			return true
		end
	end
	return false
end

--JFD_IsUsingRTP
function JFD_IsUsingRTP()
	local RTPModID = "eea66053-7579-481a-bb8d-2f3959b59974"
	--for _, mod in pairs(Modding.GetActivatedMods()) do
		--if (mod.ID == RTPModID) then
			return true
		--end
	--end
	--return false
end

--JFD_IsUsingSuzerainty
function JFD_IsUsingSuzerainty()
	local suzModID = "c1871abe-b596-4028-a121-6568c154cb8d"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == suzModID) then
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
local mathCeil  = math.ceil
local mathFloor = math.floor
--------------------------------------------------------------------------------------------------------------------------
-- CID
--------------------------------------------------------------------------------------------------------------------------
-- COLONIES
----------------------
--JFD_IsCityColony
function JFD_IsCityColony(city)
	if city then
		return city:IsHasBuilding(GameInfoTypes["BUILDING_JFD_GOVERNORS_MANSION"])
	else
		return false
	end
end
----------------------
-- CRIMES
----------------------
--JFD_GetTotalRealCrimeLosses
function JFD_GetTotalRealCrimeLosses(city)
	local numLosses = 0
	for row in GameInfo.JFD_Crimes() do
		local buildingID = GameInfoTypes[row.BuildingType]
		numLosses = numLosses + city:GetNumBuilding(buildingID)
	end
	return numLosses
end

--JFD_GetRealCrimeLosses
function JFD_GetRealCrimeLosses(city, crimeID)
	if (userSettingCrimeCore and crimeID) then
		local crime = GameInfo.JFD_Crimes[crimeID]
		if crime then
			return city:GetNumBuilding(GameInfoTypes[crime.BuildingType]), crime.Help
		end
	end
	return 0, nil
end

--JFD_GetOrganizedCrimeID
function JFD_GetOrganizedCrimeID(playerID, city)
	for row in GameInfo.JFD_OrganizedCrimes() do
		if city:HasBuilding(GameInfoTypes[row.BuildingType]) then
			return row.ID
		end
	end	
	return -1
end

--JFD_HasRealOrganizedCrime
function JFD_HasRealOrganizedCrime(playerID, city, organizedCrimeID)
	return JFD_GetOrganizedCrimeID(playerID, city) == organizedCrimeID
end
----------------------
-- DEVELOPMENT
----------------------
--JFD_GetBuildingDevelopment
function JFD_GetBuildingDevelopment(buildingType)
	local activePlayerID = Game.GetActivePlayer()
	local activePlayer = Players[activePlayerID]
	local buildingClassType = GameInfo.Buildings[buildingType].BuildingClass
	local development = 0
	for row in GameInfo.Building_YieldChanges("BuildingType = '" .. buildingType .. "' AND YieldType = 'YIELD_JFD_DEVELOPMENT'") do
		local buildingID = GameInfoTypes[row.BuildingType]
		development = development + (row.Yield/10)
	end
	for row in GameInfo.Policy_BuildingClassYieldChanges("BuildingClassType = '" .. buildingClassType .. "' AND YieldType = 'YIELD_JFD_DEVELOPMENT'") do
		local policyID = GameInfoTypes[row.PolicyType]
		if activePlayer:HasPolicy(policyID) then
			development = development + (row.YieldChange/10)
		end
	end
	if GameInfoTypes then
		development = development + ((development*JFD_GetDevelopmentMods(activePlayerID))/100)
	end
	return development
end

--JFD_GetDevelopmentMods
function JFD_GetDevelopmentMods(playerID)
	local developmentBuildingMod = 0
	local developmentImprovementMod = 0
	--Buildings
	for row in GameInfo.Building_JFD_DevelopmentMods("DevelopmentBuildingMod <> 0 OR DevelopmentImprovementMod <> 0") do
		if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
			developmentBuildingMod	  = developmentBuildingMod    + row.DevelopmentBuildingMod
			developmentImprovementMod = developmentImprovementMod + row.DevelopmentImprovementMod
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
		if JFD_HasReform(playerID, GameInfoTypes[row.ReformType]) then
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
	return developmentBuildingMod, developmentImprovementMod
end
----------------------
-- LOYALTY
----------------------
--JFD_GetCityLoyaltyID
function JFD_GetCityLoyaltyID(playerID, city)
	for row in GameInfo.JFD_Loyalties() do
		if city:HasBuilding(GameInfoTypes[row.BuildingType]) then
			return row.ID
		end
	end
	return -1
end
----------------------
-- PROVINCES
----------------------
--JFD_GetProvinceID
local userSettingProvincesCore = JFD_GetUserSetting("JFD_CID_PROVINCES_CORE") == 1
function JFD_GetProvinceID(playerID, city)
	local player = Players[playerID]
	local provinceID = 1
	if (not city) then return provinceID end
	if (city:IsCapital() and userSettingProvincesCore) then return GameInfoTypes["PROVINCE_JFD_CAPITAL"] end
	for province in GameInfo.JFD_Provinces() do
		local buildingID = GameInfoTypes[province.BuildingType]
		if city:HasBuilding(buildingID) then
			provinceID = province.ID
		end
	end
	return provinceID
end
--------------------------------------------------------------------------------------------------------------------------
-- RTP
--------------------------------------------------------------------------------------------------------------------------
-- SOVEREIGNTY
----------------------
--JFD_HasReform
local userSettingSovereigntyCore = JFD_GetUserSetting("JFD_RTP_SOVEREIGNTY_CORE") == 1
function JFD_HasReform(playerID, reformID)
	local player = Players[playerID]
	if (not playerID) then return false end
	if (not reformID) then return false end
	if (not GameInfoTypes) then return false end
	if (not userSettingSovereigntyCore) then return false end
	local reform = GameInfo.JFD_Reforms[reformID]
	local policyID = GameInfo.Policies[reform.PolicyType].ID
	return player:HasPolicy(policyID)
end
--------------------------------------------------------------------------------------------------------------------------
-- E&D
--------------------------------------------------------------------------------------------------------------------------
-- DECISIONS
----------------------
--JFD_GetNumEnactableDecisions
function JFD_GetNumEnactableDecisions(playerID)
	local numDecisions = 0
	tDecisions = {}
	-- Retrieve latest cache for active player from EnactDecisionsPopup.lua
	LuaEvents.GetDecisionsTable(playerID, tDecisions)
	for sKey, tDecision in pairs(tDecisions) do
		if tDecision.Enactable then
			numDecisions = numDecisions + 1
		end
	end
	return numDecisions
end
--------------------------------------------------------------------------------------------------------------------------
-- SUZERAINTY
--------------------------------------------------------------------------------------------------------------------------
function GetCityStateIcon(pMinor)
	local sAtlas = "SUZERAINITY_DEFAULTMINOR_ATLAS"
	local iIndex = 1

	local tTrait = pMinor:GetSuzerainTraitTable()
	if tTrait and tTrait.IconAtlas and tTrait.PortraitIndex then
		return tTrait.IconAtlas, tTrait.PortraitIndex
	end
	-----------------
	-- Fallback if no icon found
	-----------------
	local iType = pMinor:GetMinorCivTrait()
	local tIcons = {
		[MinorCivTraitTypes.MINOR_CIV_TRAIT_CULTURED]		= 0,
		[MinorCivTraitTypes.MINOR_CIV_TRAIT_MARITIME]		= 1,
		[MinorCivTraitTypes.MINOR_CIV_TRAIT_MERCANTILE]		= 2,
		[MinorCivTraitTypes.MINOR_CIV_TRAIT_MILITARISTIC]	= 3,
		[MinorCivTraitTypes.MINOR_CIV_TRAIT_RELIGIOUS]		= 4,
	}
	iIndex = tIcons[iType] or iIndex

	return sAtlas, iIndex
end
--------------------------------------------------------------------------------------------------------------------------
-- CITIES
--------------------------------------------------------------------------------------------------------------------------
--JFD_GetCityID
function JFD_GetCityID(city)
	local cityID = city:GetX() .. city:GetY()
	return cityID
end

--JFD_IsAllowedPuppetPurchase 
function JFD_IsAllowedPuppetPurchase(city)
	for building in GameInfo.Buildings("AllowsPuppetPurchase > 0") do
		if city:HasBuilding(building.ID) then
			return true
		end
	end
	return false
end
--------------------------------------------------------------------------------------------------------------------------
-- YIELDS
--------------------------------------------------------------------------------------------------------------------------
--JFD_GetBaseFakeYield
function JFD_GetBaseFakeYield(city, yieldID)
	local player = Players[city:GetOwner()]
	local yieldType = GameInfo.Yields[yieldID].Type
	local yield = 0
	--Buildings
	for row in GameInfo.Policy_BuildingClassYieldChanges("YieldType = '" .. yieldType .. "'") do
		if (player:HasPolicy(GameInfoTypes[row.PolicyType]) and city:HasBuildingClass(GameInfoTypes[row.BuildingClassType])) then
			yield = yield + row.YieldChange
		end
	end
	--Improvements
	for row in GameInfo.Improvement_Yields("YieldType = '" .. yieldType .. "'") do
		local improvementID = GameInfoTypes[row.ImprovementType]
		if city:HasWorkedImprovement(improvementID) then
			yield = yield + (city:CountNumWorkedImprovement(improvementID)*row.Yield)
		end
	end
	for row in GameInfo.Policy_ImprovementYieldChanges("YieldType = '" .. yieldType .. "'") do
		local improvementID = GameInfoTypes[row.ImprovementType]
		if (player:HasPolicy(GameInfoTypes[row.PolicyType]) and city:HasWorkedImprovement(improvementID)) then
			yield = yield + (city:CountNumWorkedImprovement(improvementID)*row.Yield)
		end
	end
	return yield
end

--JFD_CalculateFakeYield
local definesHillDefense = GameDefines["CITY_STRENGTH_HILL_CHANGE"]
local yieldDefenseID     = GameInfo.Yields["YIELD_DEFENSE"].ID
local yieldDevelopmentID = GameInfo.Yields["YIELD_JFD_DEVELOPMENT"].ID
function JFD_CalculateFakeYield(playerID, yieldID, plot, improvementID)
	local player = Players[playerID]
	local yield = 0
	local yieldType = GameInfo.Yields[yieldID].Type
	if (not improvementID) then improvementID = plot:GetImprovementType() end
	if (improvementID and improvementID > -1) then
		for row in GameInfo.Improvement_Yields("ImprovementType = '" .. GameInfo.Improvements[improvementID].Type .. "' AND YieldType = '" .. yieldType .. "'") do
			yield = yield + row.Yield
		end
		if GameInfoTypes then
			for row in GameInfo.Policy_ImprovementYieldChanges("ImprovementType = '" .. GameInfo.Improvements[improvementID].Type .. "' AND YieldType = '" .. yieldType .. "'") do
				if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
					yield = yield + row.Yield
				end
			end
		end
	end
	if yieldID == yieldDefenseID then
		if (plot:IsCity() and plot:IsHills()) then
			yield = yield + (definesHillDefense/100)
		end
	end
	if (yieldID == yieldDevelopmentID and GameInfoTypes) then
		local featureID = plot:GetFeatureType()
		if featureID > -1 then
			for row in GameInfo.Policy_FeatureYieldChanges("YieldType = 'YIELD_JFD_DEVELOPMENT' AND FeatureType = '" .. GameInfo.Features[featureID].Type .. "'") do
				local policyID = GameInfoTypes[row.PolicyType]
				if player:HasPolicy(policyID) then
					local featureID = GameInfoTypes[row.FeatureType]
					yield = yield + row.Yield
				end
			end
		end
		local resourceID = plot:GetResourceType()
		if resourceID > -1 then
			for row in GameInfo.Policy_ResourceYieldChanges("YieldType = 'YIELD_JFD_DEVELOPMENT' AND ResourceType = '" .. GameInfo.Resources[resourceID].Type .. "'") do
				local policyID = GameInfoTypes[row.PolicyType]
				if player:HasPolicy(policyID) then
					local resourceID = GameInfoTypes[row.ResourceType]
					yield = yield + row.Yield
				end
			end
		end
		yield = yield/10
	end
	return yield
end
-------------------
-- DEFENSE
-------------------
--JFD_GetCityDefense
local definePopulationChange = GameDefines["CITY_STRENGTH_POPULATION_CHANGE"]
local defineUnitDivider		 = GameDefines["CITY_STRENGTH_UNIT_DIVISOR"]
local plotHillsID			 = GameInfo.Plots["PLOT_HILLS"].ID
function JFD_GetCityDefense(city, ignoresBase)
	local buildingDefenseID = GameInfo.Buildings["BUILDING_JFD_DEFENSE"].ID
	local cityDefense = 0
	if ignoresBase then
		cityDefense = JFD_GetBaseFakeYield(city, yieldDefenseID) + mathFloor(city:GetBuildingDefense()/100) + mathCeil(city:GetPopulation()*(25/definePopulationChange))
		local defenseHills = 0
		if city:IsOnPlotType(plotHillsID) then
			cityDefense = cityDefense + (definesHillDefense/100)
		end
		local defenseGarrison = 0
		local unitGarrison = city:GetGarrisonedUnit()
		if unitGarrison then
			defenseGarrison = unitGarrison:GetBaseCombatStrength() * 100 * (unitGarrison:GetMaxHitPoints() - (unitGarrison:GetDamage()/unitGarrison:GetMaxHitPoints()))
			defenseGarrison = (defenseGarrison/defineUnitDivider)
			defenseGarrison = mathCeil(defenseGarrison/100)
		end
		cityDefense = cityDefense + defenseGarrison
	else
		cityDefense = cityDefense + mathFloor(city:GetStrengthValue()/100) 
		cityDefense = cityDefense - (city:GetNumBuilding(buildingDefenseID))
		cityDefense = cityDefense + JFD_GetBaseFakeYield(city, yieldDefenseID)
	end
	return cityDefense
end

--JFD_GetCityDefenseTooltip 
function JFD_GetCityDefenseTooltip(city)
	local player = Players[city:GetOwner()]
	local defenseTT = "";
	--Base
	local defense = mathFloor(city:GetStrengthValue()/100) 
	local defenseBuilding = mathFloor(city:GetBuildingDefense()/100)
	local defenseHills = 0
	if city:IsOnPlotType(plotHillsID) then
		defenseHills = (definesHillDefense/100)
	end
	local defensePopulation = mathCeil(city:GetPopulation()*(25/definePopulationChange))
	local defenseGarrison = 0
	local unitGarrison = city:GetGarrisonedUnit()
	if unitGarrison then
		defenseGarrison = unitGarrison:GetBaseCombatStrength() * 100 * (unitGarrison:GetMaxHitPoints() - (unitGarrison:GetDamage()/unitGarrison:GetMaxHitPoints()))
		defenseGarrison = (defenseGarrison/defineUnitDivider)
		defenseGarrison = mathCeil(defenseGarrison/100)
	end
	local defensePlague = 0
	for building in GameInfo.Buildings("IsPlague = 1") do
		local buildingID = building.ID
		if city:HasBuilding(buildingID) then
			defensePlague = defensePlague + city:GetNumBuilding(buildingID)
		end
	end
	defense = defense - defenseBuilding
	defense = defense - defenseHills
	defense = defense - defenseGarrison
	defense = defense - defensePopulation
	defense = defense - defensePlague
	if defense ~= 0 then
		if defense > 0 then defense = "+" .. defense end
		defenseTT = defenseTT .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_JFD_DEFENSE_TT_FROM_BASE", defense)
	end
	--Population
	if defensePopulation ~= 0 then
		if defensePopulation > 0 then defensePopulation = "+" .. defensePopulation end
		defenseTT = defenseTT .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_JFD_DEFENSE_TT_FROM_POPULATION", defensePopulation)
	end
	--Garrison
	if defenseGarrison ~= 0 then
		if defenseGarrison > 0 then defenseGarrison = "+" .. defenseGarrison end
		defenseTT = defenseTT .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_JFD_DEFENSE_TT_FROM_GARRISON", defenseGarrison)
	end
	--Plague
	if defensePlague ~= 0 then
		defenseTT = defenseTT .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_JFD_DEFENSE_TT_FROM_PLAGUE", defensePlague)
	end
	--Buildings
	local defenseCrime = JFD_GetRealCrimeLosses(city, GameInfoTypes["CRIME_JFD_DEFENSE"])
	defenseBuilding = defenseBuilding + defenseCrime
	defenseBuilding = defenseBuilding - (city:GetNumBuilding(buildingDefenseID))
	for row in GameInfo.Policy_BuildingClassYieldChanges("YieldType = 'YIELD_DEFENSE'") do
		if (player:HasPolicy(GameInfoTypes[row.PolicyType]) and city:HasBuildingClass(GameInfoTypes[row.BuildingClassType])) then
			defenseBuilding = defenseBuilding + row.YieldChange
		end
	end
	if defenseBuilding ~= 0 then
		if defenseBuilding > 0 then defenseBuilding = "+" .. defenseBuilding end
		defenseTT = defenseTT .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_JFD_DEFENSE_TT_FROM_BUILDINGS", defenseBuilding)
	end
	--Terrain
	local defenseTerrain = JFD_GetBaseFakeYield(city, yieldDefenseID) + defenseHills
	if defenseTerrain ~= 0 then
		if defenseTerrain > 0 then defenseTerrain = "+" .. defenseTerrain end
		defenseTT = defenseTT .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_JFD_DEFENSE_TT_FROM_TERRAIN", defenseTerrain)
	end
	-- Crime
	if defenseCrime > 0 then
		defenseTT = defenseTT .. "[NEWLINE][ICON_BULLET]";
		defenseTT = defenseTT .. Locale.ConvertTextKey("TXT_KEY_DEFENSE_FROM_CRIME", defenseCrime);
	end
	local defenseTotal = JFD_GetCityDefense(city)
	return Locale.ConvertTextKey("TXT_KEY_JFD_CITYVIEW_DEFENSE_TEXT_TT", defenseTT, defenseTotal)
end
-------------------
-- HAPPINESS
-------------------
--GetCityHappinessTooltip (Gazebo)
function GetCityHappinessTooltip(pCity)
	local strHappinessBreakdown = "";
	if(pCity) then
		local iStarvingUnhappiness = pCity:GetUnhappinessFromStarving();
		local iPillagedUnhappiness = pCity:GetUnhappinessFromPillaged();
		local iGoldUnhappiness = pCity:GetUnhappinessFromGold();
		local iDefenseUnhappiness = pCity:GetUnhappinessFromDefense();
		local iConnectionUnhappiness = pCity:GetUnhappinessFromConnection();
		local iMinorityUnhappiness = pCity:GetUnhappinessFromMinority();
		local iScienceUnhappiness = pCity:GetUnhappinessFromScience();
		local iCultureUnhappiness = pCity:GetUnhappinessFromCulture();
		local iResistanceUnhappiness = 0;
		if(pCity:IsRazing()) then
			iResistanceUnhappiness = (pCity:GetPopulation() / 2);
		elseif(pCity:IsResistance()) then
			iResistanceUnhappiness = (pCity:GetPopulation() / 2);
		end
		local iOccupationUnhappiness = 0;
		if(pCity:IsOccupied() and not pCity:IsNoOccupiedUnhappiness()) then
			iOccupationUnhappiness = (pCity:GetPopulation() * GameDefines.UNHAPPINESS_PER_OCCUPIED_POPULATION);
		end
			
		local iTotalUnhappiness = iScienceUnhappiness + iCultureUnhappiness + iDefenseUnhappiness + iGoldUnhappiness + iConnectionUnhappiness + iPillagedUnhappiness + iStarvingUnhappiness + iMinorityUnhappiness + iOccupationUnhappiness + iResistanceUnhappiness;

		local iPuppetMod = 0;
		if(pCity:IsPuppet()) then
			iPuppetMod = Players[pCity:GetOwner()]:GetPuppetUnhappinessMod();
		end

		local iCapitalMod = 0;
		if(pCity:IsCapital()) then
			iCapitalMod = Players[pCity:GetOwner()]:GetCapitalUnhappinessModCBP();
		end

		local iThresholdAdditions = (pCity:getThresholdAdditions() - iCapitalMod);
		local iThresholdSubtractionsGold = pCity:getThresholdSubtractions(YieldTypes.YIELD_GOLD);
		local iThresholdSubtractionsDefense = pCity:getThresholdSubtractions(YieldTypes.YIELD_PRODUCTION);
		local iThresholdSubtractionsScience = pCity:getThresholdSubtractions(YieldTypes.YIELD_SCIENCE);
		local iThresholdSubtractionsCulture = pCity:getThresholdSubtractions(YieldTypes.YIELD_CULTURE);

		iThresholdSubtractionsGold = iThresholdAdditions + (iThresholdSubtractionsGold + (iPuppetMod * -1));
		iThresholdSubtractionsDefense = iThresholdAdditions + (iThresholdSubtractionsDefense + (iPuppetMod * -1));
		iThresholdSubtractionsScience = iThresholdAdditions + (iThresholdSubtractionsScience + (iPuppetMod * -1));
		iThresholdSubtractionsCulture = iThresholdAdditions + (iThresholdSubtractionsCulture + (iPuppetMod * -1));

		local iCultureYield = pCity:GetUnhappinessFromCultureYield() / 100;
		local iDefenseYield = pCity:GetUnhappinessFromDefenseYield() / 100;
		local iGoldYield = pCity:GetUnhappinessFromGoldYield() / 100;
		local iCultureNeeded = pCity:GetUnhappinessFromCultureNeeded() / 100;
		local iDefenseNeeded = pCity:GetUnhappinessFromDefenseNeeded() / 100;
		local iGoldNeeded = pCity:GetUnhappinessFromGoldNeeded() / 100;
		local iScienceYield = pCity:GetUnhappinessFromScienceYield() / 100;
		local iScienceNeeded = pCity:GetUnhappinessFromScienceNeeded() / 100;

		local iTotalHappiness = pCity:GetLocalHappiness();

		strHappinessBreakdown = Locale.ConvertTextKey("TXT_KEY_EO_CITY_LOCAL_HAPPINESS", iTotalHappiness);

		if (not OptionsManager.IsNoBasicHelp()) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_EO_CITY_LOCAL_HAPPINESS_EXPLANATION");
		end

		strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_EO_CITY_LOCAL_UNHAPPINESS", iTotalUnhappiness);
		
		-- Occupation tooltip
		if (iOccupationUnhappiness ~= 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_OCCUPATION_UNHAPPINESS", iOccupationUnhappiness);
		end
		-- Resistance tooltip
		if (iResistanceUnhappiness ~= 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_RESISTANCE_UNHAPPINESS", iResistanceUnhappiness);
		end
		-- Starving tooltip
		if (iStarvingUnhappiness ~= 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_STARVING_UNHAPPINESS", iStarvingUnhappiness);
		end
		-- Pillaged tooltip
		if (iPillagedUnhappiness ~= 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_PILLAGED_UNHAPPINESS", iPillagedUnhappiness);
		end
		-- Gold tooltip
		if (iGoldUnhappiness > 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_GOLD_UNHAPPINESS", iGoldUnhappiness, iGoldYield, iGoldNeeded);
		end
		if ((iGoldYield - iGoldNeeded) >= 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_GOLD_UNHAPPINESS_SURPLUS", (iGoldYield - iGoldNeeded));
		end
		-- Defense tooltip
		if (iDefenseUnhappiness > 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_DEFENSE_UNHAPPINESS", iDefenseUnhappiness, iDefenseYield, iDefenseNeeded);
		end
		if ((iDefenseYield - iDefenseNeeded) >= 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_DEFENSE_UNHAPPINESS_SURPLUS", (iDefenseYield - iDefenseNeeded));
		end
		-- Connection tooltip
		if (iConnectionUnhappiness ~= 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_CONNECTION_UNHAPPINESS", iConnectionUnhappiness);
		end
		-- Minority tooltip
		if (iMinorityUnhappiness ~= 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_MINORITY_UNHAPPINESS", iMinorityUnhappiness);
		end
		-- Science tooltip
		if (iScienceUnhappiness > 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_SCIENCE_UNHAPPINESS", iScienceUnhappiness, iScienceYield, iScienceNeeded);
		end
		if ((iScienceYield - iScienceNeeded) >= 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_SCIENCE_UNHAPPINESS_SURPLUS", (iScienceYield - iScienceNeeded));
		end
		-- Culture tooltip
		if (iCultureUnhappiness > 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_UNHAPPINESS", iCultureUnhappiness, iCultureYield, iCultureNeeded);
		end
		if ((iCultureYield - iCultureNeeded) >= 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_UNHAPPINESS_SURPLUS", (iCultureYield - iCultureNeeded));
		end

		if (not OptionsManager.IsNoBasicHelp()) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_EO_CITY_LOCAL_UNHAPPINESS_EXPLANATION");
		end

		strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_EO_CITY_GLOBAL_AVERAGE_MODS");

		if (iPuppetMod ~= 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_PUPPET_UNHAPPINESS_MOD", iPuppetMod);
		end

		if (iCapitalMod ~= 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_CAPITAL_UNHAPPINESS_MOD", iCapitalMod);
		end

		if(pCity:IsRazing()) then
			return strHappinessBreakdown;
		end
		if(pCity:IsOccupied() and not pCity:IsNoOccupiedUnhappiness()) then
			return strHappinessBreakdown;
		end

		if(iThresholdSubtractionsGold > 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_GLOBAL_AVERAGE_MOD_GOLD_POSITIVE", iThresholdSubtractionsGold);
		elseif(iThresholdSubtractionsGold < 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_GLOBAL_AVERAGE_MOD_GOLD", iThresholdSubtractionsGold);
		end

		if(iThresholdSubtractionsDefense > 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_GLOBAL_AVERAGE_MOD_DEFENSE_POSITIVE", iThresholdSubtractionsDefense);
		elseif(iThresholdSubtractionsDefense < 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_GLOBAL_AVERAGE_MOD_DEFENSE", iThresholdSubtractionsDefense);
		end

		if(iThresholdSubtractionsScience > 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_GLOBAL_AVERAGE_MOD_SCIENCE_POSITIVE", iThresholdSubtractionsScience);
		elseif(iThresholdSubtractionsScience < 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_GLOBAL_AVERAGE_MOD_SCIENCE", iThresholdSubtractionsScience);
		end

		if(iThresholdSubtractionsCulture > 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_GLOBAL_AVERAGE_MOD_CULTURE_POSITIVE", iThresholdSubtractionsCulture);
		elseif(iThresholdSubtractionsCulture < 0) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_GLOBAL_AVERAGE_MOD_CULTURE", iThresholdSubtractionsCulture);
		end

		if (not OptionsManager.IsNoBasicHelp()) then
			strHappinessBreakdown = strHappinessBreakdown .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_EO_CITY_GLOBAL_AVERAGE_MODS_EXPLANATION");
		end
	end
	return strHappinessBreakdown;
end
--------------------------------------------------------------------------------------------------------------------------
-- LEADERS
--------------------------------------------------------------------------------------------------------------------------
--JFD_GetLeaderFlavour
function JFD_GetLeaderFlavour(playerID, flavourType)
	local player = Players[playerID]
	if (not player) then return 5 end
	local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
	for row in GameInfo.Leader_Flavors("LeaderType = '" .. leaderType .. "' AND FlavorType = '" .. flavourType .. "'") do
		return row.Flavor
	end
	return 5
end

--JFD_GetTraitType
function JFD_GetTraitType(playerID)
	local player = Players[playerID]
	local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
	for row in GameInfo.Leader_Traits("LeaderType = '" .. leaderType .. "'") do
		return row.TraitType
	end	
end
--------------------------------------------------------------------------------------------------------------------------
-- RELIGION
--------------------------------------------------------------------------------------------------------------------------
local userSettingPietyCore = JFD_GetUserSetting("JFD_RTP_PIETY_CORE") == 1

--JFD_GetPlayerMajorityReligion
function JFD_GetPlayerMajorityReligion(pPlayer)
	local iMajorityReligion = -1
	for row in GameInfo.Religions() do
		local iReligion = row.ID
		if pPlayer:HasReligionInMostCities(iReligion) then
			iMajorityReligion = iReligion
			break
		end
	end
	return iMajorityReligion
end

--JFD_GetMainReligionID
function JFD_GetMainReligionID(playerID)
	local player = Players[playerID]
	local religionID = player:GetReligionCreatedByPlayer()
	if religionID <= 0 then religionID = JFD_GetPlayerMajorityReligion(player) end
	if (player:GetCapitalCity() and religionID <= 0) then religionID = player:GetCapitalCity():GetReligiousMajority() end
	if userSettingPietyCore then religionID = player:GetStateReligion() end
	return religionID
end
--------------------------------------------------------------------------------------------------------------------------
-- MATHS
--------------------------------------------------------------------------------------------------------------------------
--JFD_GetRandom
function JFD_GetRandom(lower, upper)
	return Game.Rand((upper + 2) - lower, "") + lower
end

--JFD_Round
function JFD_Round(num, idp)
	local mult = 10^(idp or 0)
	return mathFloor(num * mult + 0.5) / mult
end
--------------------------------------------------------------------------------------------------------------------------
-- NOTIFICATIONS
--------------------------------------------------------------------------------------------------------------------------
--JFD_SendNotification
function JFD_SendNotification(playerID, notificationType, description, descriptionShort, global, data1, data2, unitID, data3, metOnly, includesSerialMessage)
	local player = Players[playerID]
	local data1 = data1 or -1
	local data2 = data2 or -1
	local unitID = unitID or -1
	local data3 = data3 or -1
	local sendNotification = false
	local sendSerialMessage = false
	if global then
		if metOnly then
			if Teams[Game.GetActiveTeam()]:IsHasMet(player:GetTeam()) then
				sendNotification = true
			end
		else
			sendNotification = true
		end
	else
		if player:IsHuman() then
			if metOnly then
				if Teams[Game.GetActiveTeam()]:IsHasMet(player:GetTeam()) then
					sendNotification = true
				end
			else
				sendNotification = true
			end
		end
	end

	if sendNotification then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes[notificationType], description, descriptionShort, data1, data2, unitID, data3)
		if includesSerialMessage then
			Events.GameplayAlertMessage(description)
		end
	end
end   

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
-- TECHS
--------------------------------------------------------------------------------------------------------------------------
--JFD_IsTechnologyRequirementUnlocked
function JFD_IsTechnologyRequirementUnlocked(playerID, query)
	local player = Players[playerID]
	for row in GameInfo.Technologies_JFD_MiscEffects(query .. " > 0") do
		return player:HasTech(GameInfoTypes[row.TechType])
	end
	return false
end
--------------------------------------------------------------------------------------------------------------------------
-- UNITS
--------------------------------------------------------------------------------------------------------------------------
--GetStrongestLevyUnit (Sukritact)
function GetStrongestLevyUnit(pPlayer, ...)
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

--GetStrongestMilitaryUnit (Sukritact)
function GetStrongestMilitaryUnit(pPlayer, bIgnoreResources, ...)
	local tUnit = {["ID"] = GameInfoTypes.UNIT_WARRIOR, ["Combat"] = 0}
	for iKey, sCombatType in pairs(arg) do
		for row in GameInfo.Units("CombatClass = \'" .. sCombatType .. "\'") do
			if pPlayer:CanTrain(row.ID, bIgnoreResources) and row.Combat > tUnit.Combat then
				tUnit = row
			end
		end
	end
	return tUnit.ID
end

--JFD_AddPromotion
function JFD_AddPromotion(unit, promotionID, addsPromotion)
	if addsPromotion then
		if (not unit:IsHasPromotion(promotionID)) then
			unit:SetHasPromotion(promotionID, true)
		end
	else
		if unit:IsHasPromotion(promotionID) then
			unit:SetHasPromotion(promotionID, false)
		end
	end
end
----=======================================================================================================================
----=======================================================================================================================