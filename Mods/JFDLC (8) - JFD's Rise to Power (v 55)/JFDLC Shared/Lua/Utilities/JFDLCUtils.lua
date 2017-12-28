-- JFDLCUtils
-- Author: JFD
-- DateCreated: 2/4/2017 8:05:03 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
if Game then
	include("JFDLC_GlobalDefines.lua");
	include("FLuaVector.lua")
	include("PlotIterators.lua")
	include("RouteConnections.lua")
end
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
-- SETTINGS
--------------------------------------------------------------------------------------------------------------------------
if Game then
	--Game.GetUserSetting
	function Game.GetUserSetting(type)
		for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
			return row.Value
		end
	end
end
--=======================================================================================================================
-- MOD UTILITIES
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
if Game then
	--Game.IsModActive
	function Game.IsModActive(modID)
		for _, mod in pairs(Modding.GetActivatedMods()) do
			if mod.ID == modID then
				return true
			end
		end
		return false
	end
	
	--Game.IsCBOActive
	function Game.IsCBOActive()
		return false --Game.IsModActive("8411a7a8-dad3-4622-a18e-fcc18324c799")
	end
	
	--Game.IsCIVDiploActive
	function Game.IsCIVDiploActive()
		return false --(Game.IsModActive("c7bf7064-d1b1-4708-9e93-7a1560868582") or Game.IsModActive("781d81cf-49e1-4acb-ae5f-b9e3713f98d3"))
	end
	
	--Game.IsEnlightenmentEraActive
	function Game.IsEnlightenmentEraActive()
		return true --Game.IsModActive("ce8aa614-7ef7-4a45-a179-5329869e8d6d")
	end
	
	--Game.IsEventsAndDecisionsActive
	function Game.IsEventsAndDecisionsActive()
		return true --Game.IsModActive("1f941088-b185-4159-865c-472df81247b2")
	end

	--Game.IsExtraVictoryConditionsActive
	function Game.IsExtraVictoryConditionsActive()
		return false --Game.IsModActive("4412ddf9-fa49-4262-b586-172581f8f573")
	end
	
	--Game.IsGreatWorksManagerActive
	function Game.IsGreatWorksManagerActive()
		return false --Game.IsModActive("230546ae-ac6b-4a16-bd25-98c3b402849b")
	end
	
	--Game.IsInfoAddictActive
	function Game.IsInfoAddictActive()
		return false --Game.IsModActive("aec5d10d-f00f-4fc7-b330-c3a1e86c91c3")
	end
	
	--Game.IsSuzeraintyActive
	function Game.IsSuzeraintyActive()
		return true --Game.IsModActive("c1871abe-b596-4028-a121-6568c154cb8d")
	end

	--Player:GetCityStateIcon
	function Player.GetCityStateIcon(pMinor)
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
end
--=======================================================================================================================
-- GENERAL UTILITIES
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local mathCeil  	  = math.ceil
local mathFloor 	  = math.floor
local mathMax   	  = math.max
local mathMin   	  = math.min
--------------------------------------------------------------------------------------------------------------------------
-- MATHS UTILS
--------------------------------------------------------------------------------------------------------------------------
if Game then
	--Game.GetRandom
	function Game.GetRandom(lower, upper)
		return Game.Rand((upper + 2) - lower, "") + lower
	end
	
	--Game.GetRound
	function Game.GetRound(num, idp)
		local mult = 10^(idp or 0)
		return mathFloor(num * mult + 0.5) / mult
	end

	--Player:GetEraAdjustedValue
	local mathCeil = math.ceil
	function Player.GetEraAdjustedValue(player, num)
		local modEra = GameInfo.Eras[player:GetCurrentEra()].ResearchAgreementCost
		return mathCeil(num*modEra/100)
	end

	--Game.TranslateDate
	function Game.TranslateDate(value)
		local date = "0 A.D."
		local era = "A.D."
		local realDate
		if value then
			if value < 0 then 
				realDate = value * -1
				era = "B.C."
			end
			date = value .. " " .. era
		end
		return date, value
	end
end
--=======================================================================================================================
-- GAMEPLAY UTILITIES
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
if Game then
	--Player:GetDiploListInfo
	function Player.GetDiploListInfo(player) 
		local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
		local civDesc = player:GetCivilizationShortDescription()
		local civTT = ""
		--Check for Policy-earned Names
		-- for row in GameInfo.Policy_JFD_CivilizationNames("CivilizationType = '" .. civType .. "'") do
			-- if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
				-- civDesc = row.ShortDescription
			-- end
		-- end
		civTT = player:GetCivilizationDescription() 
		civTT = civTT .. "[NEWLINE]" .. Locale.ConvertTextKey("{1_GovtDesc}", player:GetGovernmentShortDescription())
		civTT = civTT .. "[NEWLINE]---------" 
		--Government
		-- local governmentID = player:GetGovernment()
		--Culture
		local cultureID = player:GetCultureType()
		local culture = GameInfo.JFD_CultureTypes[cultureID]
		civTT = civTT .. "[NEWLINE]" .. Locale.ConvertTextKey("{1_FontIcon} {2_CultureDesc}", culture.FontIcon, culture.ShortDescription)
		--State Religion
		if player:IsPagan() then
			civTT = civTT .. "[NEWLINE][ICON_RELIGION_PANTHEON] " .. Locale.ConvertTextKey("TXT_KEY_JFD_NO_STATE_RELIGION_PAGAN")
		elseif player:HasSecularized() then
			civTT = civTT .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_JFD_NO_STATE_RELIGION_SECULAR")
		elseif player:HasStateReligion() then
			local religionID = player:GetStateReligion()
			if religionID > -1 then
				civTT = civTT .. "[NEWLINE]" .. Locale.ConvertTextKey("{1_FontIcon} {2_ReligionDesc}", GameInfo.Religions[religionID].IconString, Game.GetReligionName(religionID))
			end
		end	
		--Anthem
		--Currency
		-- local currencyID = player:GetCurrency()
		-- if currencyID > -1 then
			-- local currency = GameInfo.JFD_Currencies[currencyID]
			-- if currency then civTT = civTT .. "[NEWLINE]" .. Locale.ConvertTextKey("{1_FontIcon} {2_CurrencyDesc}", currency.IconString, currency.Description) end
		-- end
		--Dynasty
		--Script
		--Ideology
		local ideologyID = player:GetLateGamePolicyTree()
		if ideologyID > -1 then
			local ideology = GameInfo.PolicyBranchTypes[ideologyID]
			civTT = civTT .. "[NEWLINE]" .. Locale.ConvertTextKey("{1_FontIcon} {2_IdeologyDesc}", ideology.IconString, ideology.Description)
		end
		--Resources
		local leaderDesc = player:GetDefaultName()
		local leaderTT = player:GetLeaderTitle()
		return civDesc, civTT, leaderDesc, leaderTT
	end
	
	--Player:GetNumCityStateFriends
	function Player.GetNumCityStateFriends(player)
		local playerID = player:GetID()
		local numAllies = 0
		local numFriends = 0
		for minorPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
			local minorCiv = Players[minorPlayerID]
			if (minorCiv:GetCapitalCity() and minorCiv:IsAlive()) then
				if minorCiv:GetMinorCivFriendshipLevelWithMajor(playerID) == 1 then
					numFriends = numFriends + 1
				elseif minorCiv:GetMinorCivFriendshipLevelWithMajor(playerID) == 2 then
					numFriends = numFriends + 1
					numAllies = numAllies + 1
				end
			end
		end
		return numAllies, numFriends
	end

	--Player:GetTotalSpecialistCount
	function Player.GetTotalSpecialistCount(player, specialistID)
		local numSpecialists = 0
		for city in player:Cities() do
			numSpecialists = numSpecialists + city:GetSpecialistCount(specialistID)
		end	
		return numSpecialists
	end
end
--------------------------------------------------------------------------------------------------------------------------
-- CITY UTILS
--------------------------------------------------------------------------------------------------------------------------
if Game then
	--Player:CompileCityID (Sukritact)
	function Player.CompileCityID(player, city)
		local originalOwnerID = city:GetOriginalOwner()
		local turnFounded = city:GetGameTurnFounded()	--Used to Compile Unique City ID
		local cityID = (city:GetX() .. city:GetY() .. originalOwnerID .. turnFounded)
		return cityID
	end
	
	--Player:GetNumCitiesCreating
	function Player.GetNumCitiesCreating(player, processID)
		local numCities = 0
		for city in player:Cities() do
			if city:GetProductionProcess() == processID then
				numCities = numCities + 1
			end
		end
		return numCities
	end

	--Player:GetNumConqueredCities
	function Player.GetNumConqueredCities(player)
		local numCities = 0
		for city in player:Cities() do
			if city:GetOriginalOwner() ~= playerID then
				numCities = numCities + 1
			end
		end
		return numCities
	end	
	
	--Player:CanPuppetPurchase 
	function Player.CanPuppetPurchase(player, city)
		for building in GameInfo.Buildings("AllowsPuppetPurchase > 0") do
			if city:HasBuilding(building.ID) then
				return true
			end
		end
		return false
	end
end
--------------------------------------------------------------------------------------------------------------------------
-- LEADER UTILS
--------------------------------------------------------------------------------------------------------------------------
if Game then
	--Player:GetDefaultName
	function Player.GetDefaultName(player)
		local leader = GameInfo.Leaders[player:GetLeaderType()]
		local leaderName = leader.Description
		local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
		for row in GameInfo.Policy_JFD_LeaderName("LeaderType = '" .. leader.Type .. "'") do
			if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
				leaderName = row.Description
			end
		end
		return leaderName
	end

	--Player:GetFlavorValue
	function Player.GetFlavorValue(player, flavorType)
		local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
		for row in GameInfo.Leader_Flavors("LeaderType = '" .. leaderType .. "' AND FlavorType = '" .. flavorType .. "'") do
			return row.Flavor
		end
		return 5
	end	
	
	--Player:GetTraitType
	function Player.GetTraitType(player)
		local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
		for row in GameInfo.Leader_Traits("LeaderType = '" .. leaderType .. "'") do
			return row.TraitType
		end	
	end	

	--Player:HasTechnologyRequiredForUnlock
	function Player.HasTechnologyRequiredForUnlock(player, query)
		for row in GameInfo.Technologies_JFD_MiscEffects(query .. " > 0") do
			return player:HasTech(GameInfoTypes[row.TechType])
		end
		return false
	end

	--Player:IsCivilizationPlural
	function Player.IsCivilizationPlural(player)
		local civText = GameInfo.Civilizations[player:GetCivilizationType()].Description
		for row in DB.Query("SELECT Plurality FROM Language_en_US WHERE Tag = '" .. civText .. "' AND Plurality = '2'") do
			return true
		end
		return false
	end
	
	--Player:IsLeaderFeminine
	function Player.IsLeaderFeminine(player)
		local leaderText = GameInfo.Leaders[player:GetLeaderType()]
		for row in DB.Query("SELECT Gender FROM Language_en_US WHERE Tag = '" .. leaderText.Description .. "' AND Gender = 'feminine'") do
			return true
		end
		return false
	end
end
--------------------------------------------------------------------------------------------------------------------------
-- RELIGION UTILS
--------------------------------------------------------------------------------------------------------------------------
if Game then
	--Game.GetNumStateReligionFollowers
	function Game.GetNumStateReligionFollowers(religionID, skipsThisPlayerID)
		local numFollowers = 0
		local numMajorFollowers = 0
		local numMinorFollowers = 0
		for playerID = 0, GameDefines.MAX_CIV_PLAYERS - 1 do	
			local player = Players[playerID]
			if (player:IsAlive() and player:HasStateReligion() and skipsThisPlayerID ~= playerID) then
				if player:GetStateReligion() == religionID then
					if player:IsMinorCiv() then
						numMinorFollowers = numMinorFollowers + 1
					else
						numMajorFollowers = numMajorFollowers + 1
					end
					numFollowers = numFollowers + 1
				end
			end
		end
		return numFollowers, numMajorFollowers, numMinorFollowers
	end

	--Game.GetNumTotalFollowers
	function Game.GetNumTotalFollowers(religionID)
		local numFollowers = 0
		for playerID = 0, GameDefines.MAX_CIV_PLAYERS - 1 do	
			local player = Players[playerID]
			if player:IsAlive() then
				for city in player:Cities() do
					numFollowers = numFollowers + city:GetNumFollowers(religionID)
				end
			end
		end	
		return numFollowers
	end

	--Player:GetNumHolyCities
	function Player.GetNumHolyCities(player)
		local numHolyCities = 0
		for city in player:Cities() do
			if city:IsHolyCityAnyReligion() then
				numHolyCities = numHolyCities + 1
			end
		end
		return numHolyCities
	end

	--Player:GetNumTotalFollowers
	function Player.GetNumTotalFollowers(player, religionID)
		local numFollowers = 0
		if player:IsAlive() then
			for city in player:Cities() do
				numFollowers = numFollowers + city:GetNumFollowers(religionID)
			end
		end	
		return numFollowers
	end
end
--------------------------------------------------------------------------------------------------------------------------
-- UNIT UTILS
--------------------------------------------------------------------------------------------------------------------------
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
--------------------------------------------------------------------------------------------------------------------------
-- YIELD UTILS
--------------------------------------------------------------------------------------------------------------------------
if Game then
	--Player:GetHighestYield
	function Player.GetHighestYield(player, city)
		local highestYieldID = 0
		local highestYield = 0
		for row in GameInfo.Yields("ID >= 2 AND ID <= 5") do
			local yieldID = row.ID
			if city then
				if city:GetYieldRate(row.ID) > highestYield then
					highestYieldID = yieldID
					highestYield = city:GetYieldRate(yieldID)
				end
			elseif player:CalculateTotalYield(yieldID) > highestYield then
				highestYieldID = yieldID
				highestYield = player:CalculateTotalYield(yieldID)
			end
		end
		return highestYieldID, highestYield
	end

	--Player:GetStoredYield
	local yieldCultureID	 = GameInfo.Yields["YIELD_CULTURE"].ID
	local yieldFaithID		 = GameInfo.Yields["YIELD_FAITH"].ID
	local yieldGoldID		 = GameInfo.Yields["YIELD_GOLD"].ID
	local yieldGoldenAgeID   = GameInfo.Yields["YIELD_GOLDEN_AGE_POINTS"].ID
	local yieldSovereigntyID = GameInfo.Yields["YIELD_JFD_SOVEREIGNTY"].ID
	function Player.GetStoredYield(player, yieldID)
		local yield = 0
		if yieldID == yieldCultureID then
			yield = player:GetJONSCulture()
		elseif yieldID == yieldFaithID then
			yield = player:GetFaith()
		elseif yieldID == yieldGoldID then
			yield = player:GetGold()
		elseif yieldID == yieldGoldenAgeID then
			yield = player:GetGoldenAgeProgress()
		elseif yieldID == yieldSovereigntyID then
			yield = player:GetSovereignty()
		end
		return yield
	end

	--Player:GetTotalYieldRate
	function Player.GetTotalYieldRate(player, yieldID)
		local totalYield = 0
		for city in player:Cities() do
			totalYield = totalYield + city:GetYieldRate(yieldID)
		end	
		return totalYield
	end
-----------------
-- FAKE
-----------------
	--Player:GetBaseFakeYield
	function Player.GetBaseFakeYield(player, city, yieldID)
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

	--Player:CalculateFakeYield
	local definesHillDefense = GameDefines["CITY_STRENGTH_HILL_CHANGE"]
	local yieldDefenseID     = GameInfo.Yields["YIELD_DEFENSE"].ID
	local yieldDevelopmentID = GameInfo.Yields["YIELD_JFD_DEVELOPMENT"].ID
	function Player.CalculateFakeYield(player, yieldID, plot, improvementID)
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
-----------------
-- DEFENSE
-----------------
	--Player:GetCityDefense
	local definePopulationChange = GameDefines["CITY_STRENGTH_POPULATION_CHANGE"]
	local defineUnitDivider		 = GameDefines["CITY_STRENGTH_UNIT_DIVISOR"]
	local plotHillsID			 = GameInfo.Plots["PLOT_HILLS"].ID
	function Player.GetCityDefense(player, city, ignoresBase)
		local buildingDefenseID = GameInfo.Buildings["BUILDING_JFD_DEFENSE"].ID
		local cityDefense = 0
		if ignoresBase then
			cityDefense = player:GetBaseFakeYield(city, yieldDefenseID) + Game.GetRound(city:GetBuildingDefense()/100) + Game.GetRound(city:GetPopulation()*(25/definePopulationChange))
			local defenseHills = 0
			if city:IsOnPlotType(plotHillsID) then
				cityDefense = cityDefense + (definesHillDefense/100)
			end
			local defenseGarrison = 0
			local unitGarrison = city:GetGarrisonedUnit()
			if unitGarrison then
				defenseGarrison = unitGarrison:GetBaseCombatStrength() * 100 * (unitGarrison:GetMaxHitPoints() - (unitGarrison:GetDamage()/unitGarrison:GetMaxHitPoints()))
				defenseGarrison = (defenseGarrison/defineUnitDivider)
				defenseGarrison = Game.GetRound(defenseGarrison/100)
			end
			cityDefense = cityDefense + defenseGarrison
			local defenseFaith = 0
			for row in GameInfo.Beliefs("FaithToDefenseRate > 0") do
				if city:HasBelief(row.ID) then
					defenseFaith = ((city:GetYieldRate(yieldFaithID) * row.FaithToDefenseRate)/100)
				end
				break
			end
			cityDefense = cityDefense + defenseFaith
		else
			cityDefense = cityDefense + Game.GetRound(city:GetStrengthValue()/100) 
			cityDefense = cityDefense - (city:GetNumBuilding(buildingDefenseID))
			cityDefense = cityDefense + player:GetBaseFakeYield(city, yieldDefenseID)
		end
		return cityDefense
	end

	--Player:GetCityDefenseTooltip 
	local yieldCrimeID = GameInfo.Yields["YIELD_JFD_CRIME"].ID
	function Player.GetCityDefenseTooltip(player, city)
		local defenseTT = "";
		--Base
		local defense = Game.GetRound(city:GetStrengthValue()/100) 
		local defenseBuilding = Game.GetRound(city:GetBuildingDefense()/100)
		local defenseHills = 0
		if city:IsOnPlotType(plotHillsID) then
			defenseHills = (definesHillDefense/100)
		end
		local defensePopulation = Game.GetRound(city:GetPopulation()*(25/definePopulationChange))
		local defenseGarrison = 0
		local unitGarrison = city:GetGarrisonedUnit()
		if unitGarrison then
			defenseGarrison = unitGarrison:GetBaseCombatStrength() * 100 * (unitGarrison:GetMaxHitPoints() - (unitGarrison:GetDamage()/unitGarrison:GetMaxHitPoints()))
			defenseGarrison = (defenseGarrison/defineUnitDivider)
			defenseGarrison = mathCeil(defenseGarrison/100)
		end
		defense = defense - defenseBuilding
		defense = defense - defenseHills
		defense = defense - defenseGarrison
		defense = defense - defensePopulation
		if defense ~= 0 then
			if defense > 0 then defense = "+" .. defense end
			defenseTT = defenseTT .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_JFD_DEFENSE_TT_FROM_BASE", defense)
			--Development
			local defenseDevelopment = city:GetYieldModifierFromDevelopment(yieldCrimeID)
			if defenseDevelopment ~= 0 then
				if defenseDevelopment > 0 then defenseDevelopment = "+" .. defenseDevelopment end
				defenseTT = defenseTT .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_JFD_DEFENSE_TT_FROM_DEVELOPMENT", defenseDevelopment)
			end
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
		--Buildings
		-- local defenseCrime = JFD_GetRealCrimeLosses(city, GameInfoTypes["CRIME_JFD_DEFENSE"])
		-- defenseBuilding = defenseBuilding + defenseCrime
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
		local defenseTerrain = player:GetBaseFakeYield(city, yieldDefenseID) + defenseHills
		if defenseTerrain ~= 0 then
			if defenseTerrain > 0 then defenseTerrain = "+" .. defenseTerrain end
			defenseTT = defenseTT .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_JFD_DEFENSE_TT_FROM_TERRAIN", defenseTerrain)
		end
		--Beliefs
		local defenseFaith = 0
		for row in GameInfo.Beliefs("FaithToDefenseRate > 0") do
			if city:HasBelief(row.ID) then
				defenseFaith = ((city:GetYieldRate(yieldFaithID) * row.FaithToDefenseRate)/100)
				break
			end
		end
		if defenseFaith ~= 0 then
			if defenseFaith > 0 then defenseFaith = "+" .. defenseFaith end
			defenseTT = defenseTT .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_JFD_DEFENSE_TT_FROM_FAITH", defenseFaith)
		end
		-- Crime
		-- if defenseCrime > 0 then
			-- defenseTT = defenseTT .. "[NEWLINE][ICON_BULLET]";
			-- defenseTT = defenseTT .. Locale.ConvertTextKey("TXT_KEY_DEFENSE_FROM_CRIME", defenseCrime);
		-- end
		local defenseTotal = player:GetCityDefense(city)
		return Locale.ConvertTextKey("TXT_KEY_JFD_CITYVIEW_DEFENSE_TEXT_TT", defenseTT, defenseTotal)
	end
-----------------
-- FAITH
-----------------
	--Player:GetExtraFaithFromGAP
	function Player.GetExtraFaithFromGAP(player)
		local faith = 0
		local GAP = player:GetGoldenAgePointsPerTurn()
		for row in GameInfo.Belief_YieldPerGAP() do
			if player:HasBelief(GameInfoTypes[row.BeliefType]) then
				faith = Game.GetRound(GAP/row.Yield)
			end
		end
		return faith
	end
-----------------
-- HAPPINESS
-----------------
	--Player:GetCityHappinessTTForCBO
	function Player.GetCityHappinessTTForCBO(pPlayer, pCity)
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
				iPuppetMod = pPlayer:GetPuppetUnhappinessMod();
			end
	
			local iCapitalMod = 0;
			if(pCity:IsCapital()) then
				iCapitalMod = pPlayer:GetCapitalUnhappinessModCBP();
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
-----------------
-- GOLDEN AGES
-----------------
	--Player:GetCityGAP
	function Player.GetCityGAP(player, city)
		local GAP = city:GetYieldRate(yieldGoldenAgeID) + city:GetLocalHappiness()
		return GAP
	end
	
	--Player:GetBaseCityGAP
	function Player.GetBaseCityGAP(player, city)
		local GAP = city:GetBaseYieldRate(yieldGoldenAgeID) + city:GetLocalHappiness()
		return GAP
	end
	
	--Player:GetCityGAPTooltip
	function Player.GetCityGAPTooltip(player, city)
		local GAPTT = "";
		--Local Happiness
		local GAPLocalHappiness = city:GetLocalHappiness()
		if GAPLocalHappiness > 0 then
			if GAPLocalHappiness > 0 then GAPLocalHappiness = "+" .. GAPLocalHappiness end
			GAPTT = GAPTT .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_JFD_GAP_TT_FROM_LOCAL_HAPPINESS", GAPLocalHappiness)
		end
		--Buildings
		local GAPBuilding = city:GetBaseYieldRateFromBuildings(yieldGoldenAgeID)
		if GAPBuilding ~= 0 then
			if GAPBuilding > 0 then GAPBuilding = "+" .. GAPBuilding end
			GAPTT = GAPTT .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_JFD_GAP_TT_FROM_BUILDINGS", GAPBuilding)
		end
		--Religion
		local GAPReligion = city:GetBaseYieldRateFromReligion(yieldGoldenAgeID)
		if GAPReligion ~= 0 then
			if GAPReligion > 0 then GAPReligion = "+" .. GAPReligion end
			GAPTT = GAPTT .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_JFD_GAP_TT_FROM_RELIGION", GAPReligion)
		end
		--Specialists
		local GAPSpecialist = city:GetBaseYieldRateFromSpecialists(yieldGoldenAgeID)
		if GAPSpecialist ~= 0 then
			if GAPSpecialist > 0 then GAPSpecialist = "+" .. GAPSpecialist end
			GAPTT = GAPTT .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_JFD_GAP_TT_FROM_SPECIALISTS", GAPSpecialist)
		end
		--Terrain
		local GAPTerrain = city:GetBaseYieldRateFromTerrain(yieldGoldenAgeID) 
		if GAPTerrain ~= 0 then
			if GAPTerrain > 0 then GAPTerrain = "+" .. GAPTerrain end
			GAPTT = GAPTT .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_JFD_GAP_TT_FROM_TERRAIN", GAPTerrain)
		end
		--Units
		local GAPUnit = city:GetYieldFromUnitsInCity(yieldGoldenAgeID) 
		if GAPUnit ~= 0 then
			if GAPUnit > 0 then GAPUnit = "+" .. GAPUnit end
			GAPTT = GAPTT .. Locale.ConvertTextKey("TXT_KEY_YIELD_FROM_UNIT", GAPUnit, "[ICON_GOLDEN_AGE]")
		end
		--Crime
		local GAPCrime = city:GetYieldFromCrime(yieldGoldenAgeID)
		if GAPCrime ~= 0 then
			GAPTT = GAPTT .. "[NEWLINE][ICON_BULLET]";
			GAPTT = GAPTT .. Locale.ConvertTextKey("TXT_KEY_GAP_FROM_CRIME", GAPCrime);
		end
		local GAPCrimeMod = city:GetYieldModifierFromCrime(yieldGoldenAgeID)
		if GAPCrimeMod ~= 0 then
			GAPTT = GAPTT .. "[NEWLINE][ICON_BULLET]";
			GAPTT = GAPTT .. Locale.ConvertTextKey("TXT_KEY_GAP_FROM_CRIME", GAPCrimeMod .. "%");
		end
		--Modifier
		local GAPModifier = city:GetYieldRateModifier(yieldGoldenAgeID) + player:GetYieldRateModifier(yieldGoldenAgeID) + city:GetModFromWLTKD(yieldGoldenAgeID)
		for row in GameInfo.UnitPromotions_YieldModifiers("YieldType = 'YIELD_GOLDEN_AGE_POINTS'") do
			if city:IsWithinDistanceOfUnitPromotion(GameInfoTypes[row.PromotionType], 0, true, false) then
				GAPModifier = GAPModifier + row.Yield
			end
		end
		if GAPModifier ~= 0 then
			if GAPModifier > 0 then GAPModifier = "+" .. GAPModifier end
			GAPTT = GAPTT .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_JFD_GAP_TT_FROM_MODIFIERS", GAPModifier)
		end
		local GAPTotal = player:GetCityGAP(city)
		return Locale.ConvertTextKey("TXT_KEY_JFD_CITYVIEW_GAP_TEXT_TT", GAPTT, GAPTotal)
	end
	
	--GetExtraGAPFromHappiness
	function GetExtraGAPFromHappiness(playerID)
		local player = Players[playerID]
		local happiness = player:GetExcessHappiness()
		local GAP = 0
		for row in GameInfo.Policies("HappinessToGoldenAgePoints <> 0") do
			if player:HasPolicy(row.ID) then
				GAP = GAP + Game.GetRound((happiness*row.HappinessToGoldenAgePoints)/100)
			end
		end
		return GAP
	end

	--GetExtraGAPFromFaith
	function GetExtraGAPFromFaith(playerID)
		local player = Players[playerID]
		local faith = player:GetTotalFaithPerTurn()
		local GAP = 0
		for building in GameInfo.Buildings("FaithToGoldenAgePoints <> 0") do
			if player:HasBuilding(building.ID) then
				if ((not building.EffectRequiresPietyLevel) or player:GetPietyLevel() == GameInfoTypes[building.EffectRequiresPietyLevel]) then
					GAP = GAP + Game.GetRound((faith*building.FaithToGoldenAgePoints)/100)
				end
			end
		end
		return GAP
	end

	--Player:GetGoldenAgePointsPerTurn
	function Player.GetGoldenAgePointsPerTurn(player)
		local GAP = player:GetExcessHappiness() + player:GetGAPFromCities() + player:GetGAPFromTraits() + player:GetGAPFromReligion() + GetExtraGAPFromHappiness(player:GetID())
		return GAP
	end
-----------------
-- XP
-----------------
	--Player:GetCityXP
	local domainAirID = GameInfo.Domains["DOMAIN_AIR"].ID
	local domainLandID = GameInfo.Domains["DOMAIN_LAND"].ID
	local domainSeaID = GameInfo.Domains["DOMAIN_SEA"].ID
	function Player.GetCityXP(player, city)
		local XP = city:GetFreeExperience()
		local XPAir = city:GetDomainFreeExperience(domainAirID)
		local XPLand = city:GetDomainFreeExperience(domainLandID)
		local XPSea = city:GetDomainFreeExperience(domainSeaID)
		XPAir = XPAir + XP
		XPLand = XPLand + XP
		XPSea = XPSea + XP
		return XPAir, XPLand, XPSea
	end
	
	--Player:GetCityXPTooltip
	function Player.GetCityXPTooltip(player, city)
		local XPTT = ""
		return XPTT
	end
end
--=======================================================================================================================
-- NOTIFICATION UTILITIES
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
--JFD_SendNotification
function JFD_SendNotification(playerID, notificationType, description, descriptionShort, global, data1, data2, unitID, data3, metOnly, includesSerialMessage)
	local player = Players[playerID]
	local activePlayer = Players[Game.GetActivePlayer()]
	local team = Teams[Game.GetActiveTeam()]
	local data1 = data1 or -1
	local data2 = data2 or -1
	local unitID = unitID or -1
	local data3 = data3 or -1
	if global then
		if (metOnly and team:IsHasMet(player:GetTeam()) or (not metOnly)) then
			activePlayer:AddNotification(NotificationTypes[notificationType], description, descriptionShort, data1, data2, unitID, data3)
			if (includesSerialMessage and description) then Events.GameplayAlertMessage(description) end
		end
	else
		if (not player:IsHuman()) then return end
		if (metOnly and team:IsHasMet(player:GetTeam()) or (not metOnly)) then
			activePlayer:AddNotification(NotificationTypes[notificationType], description, descriptionShort, data1, data2, unitID, data3)
			if (includesSerialMessage and description) then Events.GameplayAlertMessage(description) end
		end
	end
end   

--JFD_SendWorldEvent
function JFD_SendWorldEvent(playerID, description, includeHuman)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not includeHuman) and player:IsHuman() then return end
	if (not playerTeam:IsHasMet(activePlayer:GetTeam())) then return end
	print("sending World Event", description)
	activePlayer:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
end 
--=======================================================================================================================
--=======================================================================================================================
