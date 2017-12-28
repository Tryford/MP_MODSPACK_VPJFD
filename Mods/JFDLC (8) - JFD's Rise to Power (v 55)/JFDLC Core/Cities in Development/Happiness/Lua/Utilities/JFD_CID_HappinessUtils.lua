-- JFD_CID_HappinessUtils
-- Author: JFD
-- DateCreated: 11/3/2015 8:25:50 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFDLCUtils.lua");
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
local defineCityUnhappiness    = GameDefines["UNHAPPINESS_PER_CITY"]
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingCIDCrimesCore    				     = (Game.GetUserSetting("JFD_CID_CRIMES_CORE") == 1)
local userSettingCIDHappinessCore	 			     = (Game.GetUserSetting("JFD_CID_HAPPINESS_CORE") == 1)
local userSettingCIDHappinessCoreExcessProductionMod = (Game.GetUserSetting("JFD_CID_HAPPINESS_CORE_EXCESS_INTO_PRODUCTION_MOD") == 1)
local userSettingCIDHappinessCoreExcessProductionRaw = (Game.GetUserSetting("JFD_CID_HAPPINESS_CORE_EXCESS_INTO_PRODUCTION_RAW") == 1)
local userSettingCIDHappinessCoreExcessProduction	 = (userSettingCIDHappinessCoreExcessProductionMod or userSettingCIDHappinessCoreExcessProductionRaw)
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local convertTextKey = Locale.ConvertTextKey
local mathMax		 = math.max
local mathMin		 = math.min
------------------------------------------------------------------------------------------------------------------------
-- HAPPINESS
------------------------------------------------------------------------------------------------------------------------
local yieldCrimeID 	 = GameInfoTypes["YIELD_JFD_CRIME"]

--Player:GetCityHappinessTotal
local organizedCrimeHappinessID = GameInfoTypes["CRIME_ORGANIZED_JFD_HAPPINESS"]
function Player.GetCityHappinessTotal(player, city, returnsUnhappiness, skipOCValue)
	local totalHappiness = city:GetLocalHappiness() 
	local totalHappinessGlobal = mathMax(player:GetHappiness(),0)
	totalHappiness = totalHappiness + Game.GetRound(totalHappinessGlobal/player:GetNumCities())
	totalHappiness = totalHappiness + city:GetYieldFromCrime(yieldCrimeID)*-1
	if (not skipOCValue) then totalHappiness = totalHappiness + ((totalHappiness*Game.GetRound(player:GetOrganizedCrimeValue(city, organizedCrimeHappinessID)*-1))/100) end
	local totalUnhappiness = 0
	if returnsUnhappiness then totalUnhappiness = Game.GetRound((player:GetUnhappinessFromCityForUI(city)/100)) + player:GetPublicOpinionUnhappiness() end
	return Game.GetRound(totalHappiness), Game.GetRound(totalUnhappiness)
end

--Player:GetCityExcessHappiness
function Player.GetCityExcessHappiness(player, city, returnsUnhappiness)
	if (not userSettingCIDHappinessCore) then return city:GetLocalHappiness(), 0 end
	local totalHappiness, totalUnhappiness = player:GetCityHappinessTotal(city, true, true)
	local excessHappiness = mathMax(totalHappiness-totalUnhappiness,0)
	local excessUnhappiness = 0
	if returnsUnhappiness then excessUnhappiness = (totalUnhappiness-totalHappiness) end
	return Game.GetRound(excessHappiness), Game.GetRound(excessUnhappiness)
end

--Player:GetCityExcessHappinessBonusProduction
function Player.GetCityExcessHappinessBonusProduction(player)
	local excessHappinessBonus = 0
	for row in GameInfo.Building_JFD_HappinessMods("HappinessToProductionMod <> 0") do
		if (((not row.IsLocal) and player:HasBuilding(GameInfoTypes[row.BuildingType])) or city:HasBuilding(GameInfoTypes[row.BuildingType])) then
			excessHappinessBonus = excessHappinessBonus + row.HappinessToProductionMod
		end
	end
	for row in GameInfo.Policy_JFD_HappinessMods("HappinessToProductionMod <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			excessHappinessBonus = excessHappinessBonus + row.HappinessToProductionMod
		end
	end
	for row in GameInfo.JFD_Reform_HappinessMods("HappinessToProductionMod <> 0") do
		if player:HasReform(GameInfoTypes[row.ReformType]) then
			excessHappinessBonus = excessHappinessBonus + row.HappinessToProductionMod
		end
	end
	for row in GameInfo.Trait_JFD_HappinessMods("HappinessToProductionMod <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			excessHappinessBonus = excessHappinessBonus + row.HappinessToProductionMod
		end
	end
	return excessHappinessBonus
end
----------------
-- TEXT
----------------
-- Player:GetCityHappinessTT
local buildingDevelopmentSurplusHappinessID = GameInfoTypes["BUILDING_JFD_DEVELOPMENT_SURPLUS_HAPPINESS"]
function Player.GetCityHappinessTT(player, city)
	local playerID = player:GetID()
	local totalHappiness, totalUnhappiness = player:GetCityHappinessTotal(city, true)
	local toolTipHappiness = ""
	local toolTipUnhappiness = ""
	local toolTipResistanceSentiment = nil
	--Development
	local happinessDevelopment = city:GetYieldFromDevelopment(yieldCrimeID)
	if happinessDevelopment > 0 then
		toolTipHappiness = toolTipHappiness .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_HAPPINESS_TT_FROM_DEVELOPMENT", happinessDevelopment)
	end
	--Crime
	if userSettingCIDCrimesCore then
		local crimeTT, crimeSpecificsTT, highestCrimeID = player:GetCityCrimeTT(city)
		if highestCrimeID == yieldCrimeID then
			local happinessCrime = city:GetYieldFromCrime(yieldCrimeID)
			if happinessCrime ~= 0 then
				toolTipHappiness = toolTipHappiness .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_HAPPINESS_TT_CRIME", happinessCrime)
			end
			local happinessCrimeMod = Game.GetRound(player:GetOrganizedCrimeValue(city, organizedCrimeHappinessID)*-1)
			if happinessCrimeMod ~= 0 then
				toolTipHappiness = toolTipHappiness .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_HAPPINESS_TT_CRIME", happinessCrimeMod .. "%")
			end
		end
	end
	--Global Happiness
	if userSettingCIDHappinessCore then
		local totalHappinessGlobal = Game.GetRound(player:GetHappiness()/player:GetNumCities(),1)
		if totalHappinessGlobal > 0 then	
			toolTipHappiness = toolTipHappiness .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_HAPPINESS_TT_GLOBAL_HAPPINESS", totalHappinessGlobal)
		end
	end
	--Buildings
	local happinessBuilding = 0
	for building in GameInfo.Buildings("Happiness <> 0 AND Type <> 'BUILDING_JFD_DEVELOPMENT_SURPLUS_HAPPINESS' AND Type <> 'BUILDING_CRIMES_JFD_HAPPINESS'") do
		if city:HasBuilding(building.ID) then
			happinessBuilding = happinessBuilding + (building.Happiness*city:GetNumBuilding(building.ID))
		end
	end
	if happinessBuilding ~= 0 then	
		happinessBuilding = mathMin(happinessBuilding, city:GetPopulation())
		toolTipHappiness = toolTipHappiness .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_HAPPINESS_TT_BUILDINGS", happinessBuilding)
	end
	--Events
	--local happinessEvent = player:GetEventHappiness()
	--if happinessEvent ~= 0 then	
	--	if happinessEvent > 0 then happinessEvent = "+" .. happinessEvent end
	--	toolTipHappiness = toolTipHappiness .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_HAPPINESS_TT_EVENT", happinessEvent)
	--end
	--Garrison
	if city:GetGarrisonedUnit() then
		local happinessGarrison = 0
		for policy in GameInfo.Policies("HappinessPerGarrisonedUnit <> 0") do
			if player:HasPolicy(policy.ID) then
				happinessGarrison = happinessGarrison + policy.HappinessPerGarrisonedUnit
			end
		end
		if happinessGarrison ~= 0 then	
			if happinessGarrison > 0 then happinessGarrison = "+" .. happinessGarrison end
			toolTipHappiness = toolTipHappiness .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_HAPPINESS_TT_GARRISON", happinessGarrison)
		end
	end
	--Population
	if userSettingCIDHappinessCore then
		toolTipUnhappiness = toolTipUnhappiness .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_UNHAPPINESS_TT_CITY", defineCityUnhappiness)
		local unhappinessPopulation = (player:GetUnhappinessFromCityForUI(city)/100)-defineCityUnhappiness
		if unhappinessPopulation > 0 then	
			toolTipUnhappiness = toolTipUnhappiness .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_UNHAPPINESS_TT_POPULATION", unhappinessPopulation)
		end
		local unhappinessIdeology = player:GetPublicOpinionUnhappiness()
		if unhappinessIdeology > 0 then	
			toolTipUnhappiness = toolTipUnhappiness .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_UNHAPPINESS_TT_IDEOLOGY", unhappinessIdeology)
		end
	end
	if userSettingCIDHappinessCore then
		local resistanceCounter, resistanceThreshold, resistanceTurns = player:GetCityResistanceCounterDetails(city, true, true)
		local resistanceTurnsHL = "[COLOR_UNHAPPINESS]"
		if totalHappiness > totalUnhappiness then
			resistanceTurns = 0
			resistanceTurnsHL = "[COLOR_HAPPINESS]"
		end
		toolTipResistanceSentiment = convertTextKey("TXT_KEY_CITYVIEW_JFD_HAPPINESS_RESISTANCE_SENTIMENT_TEXT_TT", resistanceTurnsHL, resistanceCounter, resistanceThreshold)
		if (resistanceTurns > 0 and (not city:IsResistance())) then
			toolTipResistanceSentiment = toolTipResistanceSentiment .. "[NEWLINE][NEWLINE]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_HAPPINESS_RESISTANCE_TURNS_TEXT_TT", resistanceTurnsHL, resistanceTurns)
		end
		if userSettingCIDHappinessCoreExcessProduction then
			return convertTextKey("TXT_KEY_CITYVIEW_JFD_HAPPINESS_CORE_TEXT_TT_PRODUCTION", toolTipUnhappiness, totalUnhappiness, toolTipHappiness, totalHappiness), toolTipResistanceSentiment
		else
			return convertTextKey("TXT_KEY_CITYVIEW_JFD_HAPPINESS_CORE_TEXT_TT", toolTipUnhappiness, totalUnhappiness, toolTipHappiness, totalHappiness), toolTipResistanceSentiment
		end
	else
		return convertTextKey("TXT_KEY_CITYVIEW_JFD_HAPPINESS_TT", toolTipHappiness, totalHappiness)
	end
end
------------------------------------------------------------------------------------------------------------------------
-- RESISTANCE
------------------------------------------------------------------------------------------------------------------------
--Player:GetCityResistanceCounterDetails
function Player.GetCityResistanceCounterDetails(player, city, returnsThreshold, returnsTurns)
	local excessHappiness, excessUnhappiness = player:GetCityExcessHappiness(city, true)
	local totalHappiness = player:GetCityHappinessTotal(city)
	local resistanceCounter = city:GetResistanceCounter()
	local resistanceThreshold = 0
	if returnsThreshold then
		resistanceThreshold = (totalHappiness*10)
		--Buildings
		for row in GameInfo.Building_JFD_HappinessMods("ResistanceMod <> 0") do
			if (((not row.IsLocal) and player:HasBuilding(GameInfoTypes[row.BuildingType])) or city:HasBuilding(GameInfoTypes[row.BuildingType])) then
				resistanceThreshold = resistanceThreshold + ((resistanceThreshold*row.ResistanceMod)/100)
			end
		end
		--Policies
		for row in GameInfo.Policy_JFD_HappinessMods() do
			if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
				resistanceThreshold = resistanceThreshold + ((resistanceThreshold*row.ResistanceMod)/100)
			end
		end
		--Reforms
		for row in GameInfo.JFD_Reform_HappinessMods() do
			if player:HasReform(GameInfoTypes[row.ReformType]) then
				resistanceThreshold = resistanceThreshold + ((resistanceThreshold*row.ResistanceMod)/100)
			end
		end
		--Traits
		for row in GameInfo.Trait_JFD_HappinessMods() do
			if player:HasTrait(GameInfoTypes[row.TraitType]) then
				resistanceThreshold = resistanceThreshold + ((resistanceThreshold*row.ResistanceMod)/100)
			end
		end
	end
	local resistanceTurns = 0
	if (returnsTurns and excessUnhappiness > 0) then
		resistanceTurns = mathMax(1, Game.GetRound((resistanceCounter-resistanceThreshold)/excessUnhappiness)*-1)
	end
	return resistanceCounter, resistanceThreshold, resistanceTurns
end
--=======================================================================================================================
--=======================================================================================================================