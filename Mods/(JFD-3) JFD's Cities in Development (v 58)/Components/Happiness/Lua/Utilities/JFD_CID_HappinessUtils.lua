-- JFD_CID_HealthUtils
-- Author: JFD
-- DateCreated: 11/3/2015 8:25:50 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_CIDUtilities.lua");
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
local defineCityUnhappiness   = GameDefines["UNHAPPINESS_PER_CITY"]
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingHappinessCore = JFD_GetUserSetting("JFD_CID_HAPPINESS_CORE") == 1
local userSettingHappinessCoreFirstNotificationRevoltTurns  = JFD_GetUserSetting("JFD_CID_HAPPINESS_CORE_NOTIFICATION_FIRST_RESISTANCE_TURNS")
local userSettingHappinessCoreSecondNotificationRevoltTurns = JFD_GetUserSetting("JFD_CID_HAPPINESS_CORE_NOTIFICATION_SECOND_RESISTANCE_TURNS")
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
--JFD_GetHappinessTotal
function JFD_GetHappinessTotal(playerID, city, returnsUnhappiness)
	if (not userSettingHappinessCore) then return city:GetLocalHappiness(), 0 end
	local player = Players[playerID]
	local totalHappiness = city:GetLocalHappiness()
	local totalHappinessGlobal = mathMax(player:GetHappiness(),0)
	totalHappiness = totalHappiness + JFD_Round(totalHappinessGlobal/player:GetNumCities(),1)
	local totalUnhappiness = 0
	if returnsUnhappiness then totalUnhappiness = JFD_Round((player:GetUnhappinessFromCityForUI(city)/100),1) end
	return JFD_Round(totalHappiness), JFD_Round(totalUnhappiness)
end

--JFD_GetExcessHappiness
function JFD_GetExcessHappiness(playerID, city, returnsUnhappiness)
	if (not userSettingHappinessCore) then return 0, 0 end
	local player = Players[playerID]
	local totalHappiness, totalUnhappiness = JFD_GetHappinessTotal(playerID, city, true)
	local excessHappiness = mathMax(totalHappiness-totalUnhappiness,0)
	local excessUnhappiness = 0
	if returnsUnhappiness then excessUnhappiness = (totalUnhappiness-totalHappiness) end
	return JFD_Round(excessHappiness), JFD_Round(excessUnhappiness)
end
----------------
-- PRODUCTION
----------------
--JFD_GetProductionTurnsLeft
local yieldProductionID = GameInfoTypes["YIELD_PRODUCTION"]
function JFD_GetProductionTurnsLeft(playerID, city)
	local prodTurnsLeft = city:GetProductionTurnsLeft()
	if (not userSettingHappinessCore) then return prodTurnsLeft end
	local player = Players[playerID]
	local excessHappiness = JFD_GetExcessHappiness(playerID, city)
	local cityProduction = city:GetYieldRate(yieldProductionID) 
	local cityNetProduction = cityProduction+excessHappiness 
	local productionTurnsLeft = JFD_Round((city:GetProductionNeeded()-city:GetProduction())/cityNetProduction)+1
	if productionTurnsLeft > 99 then productionTurnsLeft = 99 end
	if productionTurnsLeft < 1  then productionTurnsLeft = 1  end
	return productionTurnsLeft
end

--JFD_GetBuildingProductionTurnsLeft
function JFD_GetBuildingProductionTurnsLeft(playerID, city, buildingID, queueNum)
	local player = Players[playerID]
	if (not userSettingHappinessCore) then return city:GetBuildingProductionTurnsLeft(buildingID, queueNum) end
	local excessHappiness = JFD_GetExcessHappiness(playerID, city)
	local cityProduction = city:GetYieldRate(yieldProductionID) 
	local buildingCost = player:GetBuildingProductionNeeded(buildingID)
	local cityNetProduction = cityProduction+excessHappiness 
	local buildingTurnsLeft = JFD_Round(buildingCost/cityNetProduction)+1
	if buildingTurnsLeft > 99 then buildingTurnsLeft = 99 end
	if buildingTurnsLeft < 1  then buildingTurnsLeft = 1  end
	return buildingTurnsLeft
end

--JFD_GetProjectProductionTurnsLeft
function JFD_GetProjectProductionTurnsLeft(playerID, city, projectID, queueNum)
	local player = Players[playerID]
	if (not userSettingHappinessCore) then return city:GetProjectProductionTurnsLeft(projectID, queueNum) end
	local excessHappiness = JFD_GetExcessHappiness(playerID, city)
	local cityProduction = city:GetYieldRate(yieldProductionID) 
	local projectCost = player:GetProjectProductionNeeded(projectID)
	local cityNetProduction = cityProduction+excessHappiness 
	local projectTurnsLeft = JFD_Round(projectCost/cityNetProduction)+1
	if projectTurnsLeft > 99 then projectTurnsLeft = 99 end
	if projectTurnsLeft < 1  then projectTurnsLeft = 1  end
	return projectTurnsLeft
end

--JFD_GetUnitProductionTurnsLeft
function JFD_GetUnitProductionTurnsLeft(playerID, city, unitID, queueNum)
	local player = Players[playerID]
	if (not userSettingHappinessCore) then return city:GetUnitProductionTurnsLeft(unitID, queueNum) end
	local excessHappiness = JFD_GetExcessHappiness(playerID, city)
	local cityProduction = city:GetYieldRate(yieldProductionID) 
	local unitCost = player:GetUnitProductionNeeded(unitID)
	local cityNetProduction = cityProduction+excessHappiness 
	local unitTurnsLeft = JFD_Round(unitCost/cityNetProduction)+1
	if unitTurnsLeft > 99 then unitTurnsLeft = 99 end
	if unitTurnsLeft < 1  then unitTurnsLeft = 1  end
	return unitTurnsLeft
end
----------------
-- TEXT
----------------
-- JFD_GetHappinessTT
local buildingDevelopmentSurplusHappinessID = GameInfoTypes["BUILDING_JFD_DEVELOPMENT_SURPLUS_HAPPINESS"]
function JFD_GetHappinessTT(playerID, city)
	local player = Players[playerID]
	local totalHappiness, totalUnhappiness = JFD_GetHappinessTotal(playerID, city, true)
	local happinessTT = ""
	local unHappinessTT = ""
	--Global Happiness
	if userSettingHappinessCore then
		local totalHappinessGlobal = JFD_Round(player:GetHappiness()/player:GetNumCities(),1)
		if totalHappinessGlobal > 0 then	
			happinessTT = happinessTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_HAPPINESS_TT_GLOBAL_HAPPINESS", totalHappinessGlobal)
		end
	end
	--Development
	local happinessDevelopment = city:GetNumBuilding(buildingDevelopmentSurplusHappinessID)
	if happinessDevelopment > 0 then
		happinessTT = happinessTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_HAPPINESS_TT_FROM_DEVELOPMENT", happinessDevelopment)
	end
	--Crime
	local happinessCrime, strYieldFromCrime = JFD_GetRealCrimeLosses(city, GameInfoTypes["CRIME_JFD_HAPPINESS"])
	if happinessCrime > 0 then
		happinessTT = happinessTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey(strYieldFromCrime, happinessCrime)
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
		happinessTT = happinessTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_HAPPINESS_TT_BUILDINGS", happinessBuilding)
	end
	--Events
	--local happinessEvent = player:GetEventHappiness()
	--if happinessEvent ~= 0 then	
	--	if happinessEvent > 0 then happinessEvent = "+" .. happinessEvent end
	--	happinessTT = happinessTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_HAPPINESS_TT_EVENT", happinessEvent)
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
			happinessTT = happinessTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_HAPPINESS_TT_GARRISON", happinessGarrison)
		end
	end
	--Population
	if userSettingHappinessCore then
		unHappinessTT = unHappinessTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_UNHAPPINESS_TT_CITY", defineCityUnhappiness)
		local unhappinessPopulation = (player:GetUnhappinessFromCityForUI(city)/100)-defineCityUnhappiness
		if unhappinessPopulation > 0 then	
			unHappinessTT = unHappinessTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_CITYVIEW_JFD_UNHAPPINESS_TT_POPULATION", unhappinessPopulation)
		end
	end
	if userSettingHappinessCore then
		local resistanceCounter, resistanceThreshold, resistanceTurns = JFD_GetResistanceCounter(playerID, city, true, true)
		local resistanceTurnsHL = "[COLOR_JFD_UNHAPPINESS]"
		if totalHappiness > totalUnhappiness then
			resistanceTurns = 0
			resistanceTurnsHL = "[COLOR_JFD_HAPPINESS]"
		end
		return convertTextKey("TXT_KEY_JFD_CITYVIEW_HAPPINESS_COMP_TEXT_TT", unHappinessTT, totalUnhappiness, happinessTT, totalHappiness, resistanceCounter, resistanceThreshold, resistanceTurns, resistanceTurnsHL)
	else
		return convertTextKey("TXT_KEY_CITYVIEW_JFD_HAPPINESS_TT", happinessTT, totalHappiness)
	end
end
------------------------------------------------------------------------------------------------------------------------
-- RESISTANCE
------------------------------------------------------------------------------------------------------------------------
--JFD_GetResistanceCounter
local buildingUnhappinessID = GameInfoTypes["BUILDING_JFD_UNHAPPINESS"]
function JFD_GetResistanceCounter(playerID, city, resturnsThreshold, returnsTurns)
	local player = Players[playerID]
	local excessHappiness, excessUnhappiness = JFD_GetExcessHappiness(playerID, city, true)
	local totalHappiness = JFD_GetHappinessTotal(playerID, city)
	local resistanceCounter = city:GetNumBuilding(buildingUnhappinessID)
	local resistanceThreshold = 0
	if resturnsThreshold then
		resistanceThreshold = (totalHappiness*10)
		--Buildings
		for row in GameInfo.Building_JFD_HappinessMods() do
			if city:HasBuilding(GameInfoTypes[row.BuildingType]) then
				local resistanceMod = row.ResistanceMod
				local resistanceGlobalMod = row.GlobalResistanceMod
				if resistanceMod > 0 then
					resistanceThreshold = resistanceThreshold + ((resistanceThreshold*resistanceMod)/100)
				end
				if resistanceGlobalMod > 0 then
					resistanceThreshold = resistanceThreshold + ((resistanceThreshold*resistanceGlobalMod)/100)
				end
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
			if JFD_HasReform(playerID, GameInfoTypes[row.ReformType]) then
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
		resistanceTurns = mathMax(0,JFD_Round((resistanceCounter-resistanceThreshold)/excessUnhappiness)*-1)
	end
	return resistanceCounter, resistanceThreshold, resistanceTurns
end

--JFD_ChangeResistanceCounter
local buildingUnhappinessID = GameInfoTypes["BUILDING_JFD_UNHAPPINESS"]
function JFD_ChangeResistanceCounter(playerID, city, value)
	local player = Players[playerID]
	local resistanceCounter, resistanceThreshold, resistanceTurns = JFD_GetResistanceCounter(playerID, city, true, true)
	JFD_SetResistanceCounter(playerID, city, (resistanceCounter+value))
	resistanceTurns = (resistanceTurns-1)
	if resistanceCounter >= resistanceThreshold then
		local resistanceTurns = JFD_Round(value/2)
		city:ChangeResistanceTurns(resistanceTurns)
		city:SetNumRealBuilding(buildingUnhappinessID, 0)
		if player:IsHuman() then
			Events.AudioPlay2DSound("AS2D_SOUND_JFD_RESISTANCE")
			JFD_SendNotification(playerID, "NOTIFICATION_CITY_LOST", Locale.ConvertTextKey("TXT_KEY_JFD_CITY_RESISTANCE_NOTIFICATION", city:GetName()), Locale.ConvertTextKey("TXT_KEY_JFD_CITY_RESISTANCE_NOTIFICATION_SHORT", city:GetName()), false, city:GetX(), city:GetY())
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_CITY_RESISTANCE", player:GetCivilizationDescription()))
		end
	elseif (userSettingHappinessCoreFirstNotificationRevoltTurns > 0 and resistanceTurns == userSettingHappinessCoreFirstNotificationRevoltTurns) then
		JFD_SendNotification(playerID, "NOTIFICATION_CITY_LOST", Locale.ConvertTextKey("TXT_KEY_JFD_CITY_RESISTANCE_IMMINENT_NOTIFICATION", city:GetName(), resistanceTurns), Locale.ConvertTextKey("TXT_KEY_JFD_CITY_RESISTANCE_IMMINENT_NOTIFICATION_SHORT", city:GetName()), false, city:GetX(), city:GetY())
	elseif (userSettingHappinessCoreSecondNotificationRevoltTurns > 0 and resistanceTurns == userSettingHappinessCoreSecondNotificationRevoltTurns) then
		JFD_SendNotification(playerID, "NOTIFICATION_CITY_LOST", Locale.ConvertTextKey("TXT_KEY_JFD_CITY_RESISTANCE_IMMINENT_NOTIFICATION", city:GetName(), resistanceTurns), Locale.ConvertTextKey("TXT_KEY_JFD_CITY_RESISTANCE_IMMINENT_NOTIFICATION_SHORT", city:GetName()), false, city:GetX(), city:GetY())
	end
end

--JFD_SetResistanceCounter
function JFD_SetResistanceCounter(playerID, city, value)
	city:SetNumRealBuilding(buildingUnhappinessID, mathMax(0,value))
end
--=======================================================================================================================
--=======================================================================================================================