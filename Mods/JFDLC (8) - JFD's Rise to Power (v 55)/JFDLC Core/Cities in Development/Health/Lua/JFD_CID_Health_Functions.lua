-- JFD_CID_Health_Functions
-- Author: JFD
-- DateCreated: 12/23/2015 8:22:41 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_CID_HealthUtils.lua")
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
local defineCIDHealthPlagueFoodConsumption	 				 = GameDefines["JFD_CID_HEALTH_PLAGUE_FOOD_CONSUMPTION"]
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingCIDHealthCore	 							 = (Game.GetUserSetting("JFD_CID_HEALTH_CORE") == 1)
local userSettingCIDHealthCoreExcessFoodMod					 = (Game.GetUserSetting("JFD_CID_HEALTH_CORE_EXCESS_INTO_FOOD_MOD") == 1)
local userSettingCIDHealthCoreExcessFoodRaw					 = (Game.GetUserSetting("JFD_CID_HEALTH_CORE_EXCESS_INTO_FOOD_RAW") == 1)
local userSettingCIDHealthCoreExcessFood					 = (userSettingCIDHealthCoreExcessFoodMod or userSettingCIDHealthCoreExcessFoodRaw)
local userSettingCIDHealthCoreNoEpidemicSettlers			 = (Game.GetUserSetting("JFD_CID_HEALTH_CORE_SETTLER_NO_PLAGUES") == 1)
local userSettingCIDHealthCoreFirstNotificationPlagueTurns	 = (Game.GetUserSetting("JFD_CID_HEALTH_CORE_FIRST_NOTIFICATION_PLAGUE_TURNS"))
local userSettingCIDHealthCoreSecondNotificationPlagueTurns  = (Game.GetUserSetting("JFD_CID_HEALTH_CORE_SECOND_NOTIFICATION_PLAGUE_TURNS"))
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local convertTextKey = Locale.ConvertTextKey

local yieldFoodID	 = YieldTypes.YIELD_FOOD
--=======================================================================================================================
-- AI FUNCTIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- GREAT PEOPLE
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Health_UnitCreatedAI
local unitClassGreatDoctorID = GameInfoTypes["UNITCLASS_JFD_GREAT_DOCTOR"]
function JFD_CID_Health_UnitCreatedAI(playerID, unitID, unitTypeID)
	local player = Players[playerID]
	if player:IsHuman() return end
	local unit = player:GetUnitByID(unitID) 
	if unit:GetUnitClassType() ~= unitClassGreatDoctorID then return end
	local plagueCity = nil
	local plagueCounter = 0
	for city in player:Cities() do
		if city:HasPlague() then
			local thisPlagueCounter = city:GetPlagueCounter()
			if thisPlagueCounter > plagueCounter then
				plagueCity = city
				plagueCounter = thisPlagueCounter
			end
		end
	end
	if plagueCity then
		LuaEvents.JFD_PlagueCured(playerID, unit, plagueCity)
	elseif Game.GetRandom(1,10) >= 5 then
		LuaEvents.JFD_PopulationGranted(playerID, unit)
	end
end
GameEvents.UnitCreated.Add(JFD_CID_Health_UnitCreatedAI)
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- HEALTH
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Health_PlayerDoTurn
function JFD_CID_Health_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	for city in player:Cities() do
		local excessHealth, excessDisease = player:GetCityExcessHealth(city, true)
		local excessHealthToFoodBonus = player:GetCityExcessHealthBonusFood(city)
		if excessHealthToFoodBonus > 0 then excessHealth = Game.GetRound((excessHealth*excessHealthToFoodBonus)/100) end
		if userSettingCIDHealthCoreExcessFoodMod then
			if excessHealth > excessDisease then
				city:SetYieldModifierFromHealth(yieldFoodID, excessHealth)
			else
				city:SetYieldModifierFromHealth(yieldFoodID, 0) 
				--city:SetYieldModifierFromHealth(yieldFoodID, -excessDisease) 
			end
		elseif userSettingCIDHealthCoreExcessFoodRaw then
			if excessHealth > excessDisease then
				city:SetYieldFromHealth(yieldFoodID, excessHealth)
			else
				city:SetYieldFromHealth(yieldFoodID, 0)
				--city:SetYieldFromHealth(yieldFoodID, -excessDisease)
			end
		end
		if (not city:HasPlague()) then
			local plagueCounter, plagueThreshold, plagueTurns = player:GetCityPlagueCounterDetails(city, true, true)
			if excessHealth > 0 then
				if plagueCounter > 0 then 
					city:ChangePlagueCounter(-excessHealth) 
				end
			elseif (excessDisease > 0 and excessDisease > excessHealth) then
				city:ChangePlagueCounter(excessDisease)
				plagueCounter, plagueThreshold, plagueTurns = player:GetCityPlagueCounterDetails(city, true, true)
				if plagueCounter >= plagueThreshold then
					city:ChangePlagueTurns(excessDisease+1)
					city:SetPlagueCounter(0)
					LuaEvents.JFD_PlagueBegins(playerID, player:GetCityPlagueTypeToSpawn(city), city, city:GetX(), city:GetY())
				elseif (userSettingCIDHealthCoreFirstNotificationPlagueTurns > 0 and plagueTurns == userSettingCIDHealthCoreFirstNotificationPlagueTurns) then
					JFD_SendNotification(playerID, "NOTIFICATION_JFD_PLAGUE", Locale.ConvertTextKey("TXT_KEY_JFD_CITY_PLAGUE_IMMINENT_NOTIFICATION", city:GetName(), plagueTurns), Locale.ConvertTextKey("TXT_KEY_JFD_CITY_PLAGUE_IMMINENT_NOTIFICATION_SHORT", city:GetName()), false, city:GetX(), city:GetY())
				elseif (userSettingCIDHealthCoreSecondNotificationPlagueTurns > 0 and plagueTurns == userSettingCIDHealthCoreSecondNotificationPlagueTurns) then
					JFD_SendNotification(playerID, "NOTIFICATION_JFD_PLAGUE", Locale.ConvertTextKey("TXT_KEY_JFD_CITY_PLAGUE_IMMINENT_NOTIFICATION", city:GetName(), plagueTurns), Locale.ConvertTextKey("TXT_KEY_JFD_CITY_PLAGUE_IMMINENT_NOTIFICATION_SHORT", city:GetName()), false, city:GetX(), city:GetY())
				end
			end
			city:SetAdditionalFood(0)
		else
			if city:GetPlagueTurns() == 0 then
				LuaEvents.JFD_PlagueEnds(playerID, city:GetPlagueType(), city, city:GetX(), city:GetY())
			else
				if excessDisease > 0 then
					city:ChangeDamage(excessDisease)
				end
			end
		end
	end
end
if userSettingCIDHealthCore then
	GameEvents.PlayerDoTurn.Add(JFD_CID_Health_PlayerDoTurn)
end

--JFD_CID_Health_PlayerFoundedCity
function JFD_CID_Health_PlayerCityFounded(playerID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (not player:IsHuman()) then return end
	local city = Map.GetPlot(plotX, plotY):GetPlotCity()
	local excessHealth, excessDisease = player:GetCityExcessHealth(city, true)
	local excessHealthToFoodBonus = player:GetCityExcessHealthBonusFood(city)
	if excessHealthToFoodBonus > 0 then excessHealth = Game.GetRound((excessHealth*excessHealthToFoodBonus)/100) end
	if userSettingCIDHealthCoreExcessFoodMod then
		if excessHealth > excessDisease then
			city:SetYieldModifierFromHealth(yieldFoodID, excessHealth)
		else
			city:SetYieldModifierFromHealth(yieldFoodID, 0) 
			--city:SetYieldModifierFromHealth(yieldFoodID, -excessDisease) 
		end
	elseif userSettingCIDHealthCoreExcessFoodRaw then
		if excessHealth > excessDisease then
			city:SetYieldFromHealth(yieldFoodID, excessHealth)
		else
			city:SetYieldFromHealth(yieldFoodID, 0)
			--city:SetYieldFromHealth(yieldFoodID, -excessDisease)
		end
	end
	if (not player:IsHuman()) then
		city:SetNumRealBuilding(player:GetSpecificBuildingType("BUILDINGCLASS_JFD_HERBALIST"), 1)
	end
end
if userSettingCIDHealthCore then
	GameEvents.PlayerCityFounded.Add(JFD_CID_Health_PlayerCityFounded)
end
------------------------------------------------------------------------------------------------------------------------
-- PLAGUE
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Health_PlagueBegins
local cityFocusFoodID      = CityAIFocusTypes["CITY_AI_FOCUS_TYPE_FOOD"]
local improvementPlagueID  = GameInfoTypes["IMPROVEMENT_JFD_PLAGUE"]
function JFD_CID_Health_PlagueBegins(playerID, plagueID, city, plotX, plotY, ignoresNotification)	
	if (not plagueID) then print("whoops! That plague is not real") end
	--if plagueID > 40 then plagueID = 40 end
	local player = Players[playerID]
	local plague = GameInfo.JFD_Plagues[plagueID]
	city:SetPlagueType(plagueID)
	city:SetAdditionalFood(defineCIDHealthPlagueFoodConsumption)
	Map.GetPlot(plotX, plotY):SetImprovementType(improvementPlagueID)
	if (not player:IsHuman()) then 
		city:SetFocusType(cityFocusFoodID) 
	else
		Events.AudioPlay2DSound("AS2D_SOUND_JFD_PLAGUE")
		if (not ignoresNotification) then
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_PLAGUE", Locale.ConvertTextKey("TXT_KEY_JFD_CITY_PLAGUE_NOTIFICATION", plague.IconString, plague.Description, city:GetName()), Locale.ConvertTextKey("TXT_KEY_JFD_CITY_PLAGUE_NOTIFICATION_SHORT", city:GetName()), false, plotX, plotY)
		end
		LuaEvents.JFD_Tutorial_PushTutorialPopup(playerID, "IsOnPlague", city, nil, plotX, plotY)
	end
	JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_CITY_PLAGUE", plague.IconString, plague.Description, player:GetCivilizationAdjective(), city:GetName()))
end
if userSettingCIDHealthCore then
	LuaEvents.JFD_PlagueBegins.Add(JFD_CID_Health_PlagueBegins)
end

--JFD_CID_Health_PlagueEnds
function JFD_CID_Health_PlagueEnds(playerID, plagueID, city, plotX, plotY)
	local player = Players[playerID]
	city:SetAdditionalFood(0)
	city:SetPlagueType(-1)
	Map.GetPlot(plotX, plotY):SetImprovementType(-1)
	if (player:IsHuman() and plagueID ~= -1) then
		local plague = GameInfo.JFD_Plagues[plagueID]
		JFD_SendNotification(playerID, "NOTIFICATION_JFD_PLAGUE", Locale.ConvertTextKey("TXT_KEY_JFD_CITY_PLAGUE_ENDS_NOTIFICATION", plague.IconString, plague.Description, city:GetName()), Locale.ConvertTextKey("TXT_KEY_JFD_CITY_PLAGUE_ENDS_NOTIFICATION_SHORT", city:GetName()), false, plotX, plotY)
	end
end
if userSettingCIDHealthCore then
	LuaEvents.JFD_PlagueEnds.Add(JFD_CID_Health_PlagueEnds)
end

--JFD_CID_Health_CityCanTrain
function JFD_CID_Health_CityCanTrain(playerID, cityID, unitID)
	local player = Players[playerID]
	local city = player:GetCityByID(cityID)
	if GameInfo.Units[unitID].Food then
		return (not city:HasPlague())
	end
	return true
end
if userSettingCIDHealthCoreNoEpidemicSettlers then
	GameEvents.CityCanTrain.Add(JFD_CID_Health_CityCanTrain)
end
-------------------
-- GREAT DOCTOR
-------------------
--JFD_CID_Health_PlaguedCured
function JFD_CID_Health_PlaguedCured(playerID, unit, city)
	local player = Players[playerID]
	for city in player:Cities() do
		if (player:IsHuman() and city:GetPlagueCounter() > 0) then
			Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(city:GetX(), city:GetY()))), convertTextKey("[COLOR_POSITIVE_TEXT]-{1_Num}[ENDCOLOR] [ICON_JFD_PLAGUE]", city:GetPlagueCounter()), true)
			city:SetPlagueCounter(0)
		end
		LuaEvents.JFD_PlagueEnds(playerID, city:GetPlagueType(), city, city:GetX(), city:GetY())
	end
	unit:greatperson()
end
LuaEvents.JFD_PlaguedCured.Add(JFD_CID_Health_PlaguedCured)

--JFD_CID_Health_PopulationGranted
function JFD_CID_Health_PopulationGranted(playerID, unit, city)
	local player = Players[playerID]
	for city in player:Cities() do
		city:ChangePopulation(1, true)
		if player:IsHuman() then
			Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(city:GetX(), city:GetY()))), convertTextKey("[COLOR_POSITIVE_TEXT]+1[ENDCOLOR] [ICON_CITIZEN]"), true)
		end
	end	
	unit:greatperson()
end
LuaEvents.JFD_PopulationGranted.Add(JFD_CID_Health_PopulationGranted)

--JFD_CID_Health_GreatPersonExpended
function JFD_CID_Health_GreatPersonExpended(playerID, unitID, unitTypeID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsHuman()) then return end
	local unit = player:GetUnitByID(unitID) 
	if unit:GetUnitClassType() ~= unitClassGreatDoctorID then return end
	local hex = ToHexFromGrid(Vector2(plotX, plotY))
	if player:IsHuman() and playerID == Game.GetActivePlayer() then
		Events.GameplayFX(hex.x, hex.y, -1) 
		Events.AudioPlay2DSound("AS2D_SOUND_JFD_DOCTOR")
	end
end
GameEvents.GreatPersonExpended.Add(JFD_CID_Health_GreatPersonExpended)

--JFD_CID_Health_MissionStart
local missionCurePlagueID = GameInfoTypes["MISSION_JFD_CURE_PLAGUE"]
local missionPopulationID = GameInfoTypes["MISSION_JFD_POPULATION"]
function JFD_CID_Health_MissionStart(playerID, unitID, missionID, data1, data2, flags, turn)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local city = unit:GetPlot():GetPlotCity()
	if (not city) then return end
	if missionID == missionCurePlagueID then
		LuaEvents.JFD_PlaguedCured(playerID, unit, city)
		return CUSTOM_MISSION_ACTION
	elseif missionID == missionPopulationID then
		LuaEvents.JFD_PopulationGranted(playerID, unit)
		return CUSTOM_MISSION_ACTION
	end
	return CUSTOM_MISSION_NO_ACTION
end
GameEvents.CustomMissionStart.Add(JFD_CID_Health_MissionStart)

--JFD_CID_Health_MissionComplete
function JFD_CID_Health_MissionComplete(playerID, unitID, missionID, data1, data2, flags, turn)
    local player = Players[playerID]
    if (missionID == missionPopulationID or missionID == missionPlagueID) then 
	return true end
	return false
end
GameEvents.CustomMissionCompleted.Add(JFD_CID_Health_MissionComplete)
--=======================================================================================================================
--=======================================================================================================================