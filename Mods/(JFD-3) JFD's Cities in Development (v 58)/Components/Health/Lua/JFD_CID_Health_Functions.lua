-- JFD_CID_Health_Functions
-- Author: JFD
-- DateCreated: 12/23/2015 8:22:41 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("IconSupport")
include("JFD_CIDUtilities.lua")
include("JFD_CID_HealthUtils.lua")
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
local definePlagueBarbarianChance   = GameDefines["JFD_CID_PLAGUE_BARBARIAN_CHANCE"]
local definePlagueFoodConsumption   = GameDefines["JFD_CID_PLAGUE_FOOD_CONSUMPTION"]
local definePlagueUnitDamagePerTurn = GameDefines["JFD_CID_PLAGUE_UNIT_DAMAGE_PER_TURN"]
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingHealthCore			= JFD_GetUserSetting("JFD_CID_HEALTH_CORE") == 1
local userSettingHealthCoreSettlers = JFD_GetUserSetting("JFD_CID_HEALTH_CORE_SETTLER_NO_PLAGUES") == 1
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local convertTextKey				= Locale.ConvertTextKey
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
-- AI
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Health_UnitCreated
local unitClassGreatDoctorID = GameInfoTypes["UNITCLASS_JFD_GREAT_DOCTOR"]
function JFD_CID_Health_GreatPersonCreated(playerID, unitID, unitTypeID)
	local player = Players[playerID]
	if player:IsHuman() then return end
	local unit = player:GetUnitByID(unitID) 
	if unit:GetUnitClassType() ~= unitClassGreatDoctorID then return end
	local plagueCity = nil
	local plagueCounter = 0
	for city in player:Cities() do
		if JFD_IsCityPlagued(city) then
			local thisPlagueCounter = JFD_GetPlagueCounter(playerID, city)
			if thisPlagueCounter > plagueCounter then
				plagueCity = city
				plagueCounter = thisPlagueCounter
			end
		end
	end
	if plagueCity then
		LuaEvents.JFD_PlagueCured(playerID, unit, plagueCity)
	elseif JFD_GetRandom(1,10) >= 5 then
		LuaEvents.JFD_PopulationGranted(playerID, unit)
	end
end
GameEvents.UnitCreated.Add(JFD_CID_Health_GreatPersonCreated)

--JFD_CID_Health_CityFounded
function JFD_CID_Health_CityFounded(playerID, plotX, plotY)
	local player = Players[playerID]
	if player:IsHuman() then return end
	local city = Map.GetPlot(plotX, plotY):GetPlotCity()
	if (not city) then return end
	local buildingID = player:GetSpecificBuildingType("BUILDINGCLASS_JFD_HERBALIST")
	city:SetNumRealBuilding(buildingID, 1)
end
if userSettingHealthCore then
	GameEvents.PlayerCityFounded.Add(JFD_CID_Health_CityFounded)	
end
------------------------------------------------------------------------------------------------------------------------
-- HEALTH
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Health_DoTurn
local buildingDiseaseID    = GameInfoTypes["BUILDING_JFD_DISEASE"]
local buildingHealthFoodID = GameInfoTypes["BUILDING_JFD_HEALTH_FOOD"]
local improvementPlagueID  = GameInfoTypes["IMPROVEMENT_JFD_PLAGUE"]
local promotionPlaguedID   = GameInfoTypes["PROMOTION_JFD_PLAGUED"]
function JFD_CID_Health_DoTurn(playerID)
	local player = Players[playerID]
	local isHuman = player:IsHuman()
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	for city in player:Cities() do
		local unit = city:GetGarrisonedUnit()
		if (not JFD_IsCityPlagued(city)) then
			local plot = Map.GetPlot(city:GetX(), city:GetY())
			if plot:HasImprovement(improvementPlagueID) then plot:SetImprovementType(-1) end
			local foodConsumption = city:GetAdditionalFood()
			if foodConsumption > 0 then city:SetAdditionalFood(0) end
			local excessHealth, excessDisease = JFD_GetExcessHealth(playerID, city, true)
			local healthToFoodMod = JFD_GetHealthToFoodMod(playerID, city)
			if healthToFoodMod > 0 then excessHealth = excessHealth + ((excessHealth*healthToFoodMod)/100) end	
			excessHealth = JFD_Round(excessHealth)
			if ((not city:IsForcedAvoidGrowth()) and excessHealth > 0) then
				if isHuman then
					city:ChangeFood(excessHealth)
				end
				JFD_ChangePlagueCounter(playerID, city, -excessHealth)
			elseif (excessDisease > 0 and excessDisease > excessHealth) then
				JFD_ChangePlagueCounter(playerID, city, excessDisease)
			end
			if (not isHuman) then
				if excessHealth > 0 then
					city:SetNumRealBuilding(buildingHealthFoodID, excessHealth)
				else
					if city:HasBuilding(buildingHealthFoodID) then
						city:SetNumRealBuilding(buildingHealthFoodID, 0)
					end
				end
			end
		else
			local plagueID = JFD_GetCityPlagueID(city)
			JFD_ChangeNumPlagueTurns(city, plagueID, -1)
		end
	end
end
if userSettingHealthCore then
	GameEvents.PlayerDoTurn.Add(JFD_CID_Health_DoTurn)
end
------------------------------------------------------------------------------------------------------------------------
-- PLAGUE
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Health_PlagueBegins
local buildingDiseaseID   = GameInfoTypes["BUILDING_JFD_DISEASE"]
local cityFocusFoodID     = CityAIFocusTypes["CITY_AI_FOCUS_TYPE_FOOD"]
local plagueBubonicID     = GameInfoTypes["PLAGUE_JFD_BUBONIC"]
local promotionPlaguedID  = GameInfoTypes["PROMOTION_JFD_PLAGUED"]
function JFD_CID_Health_PlagueBegins(playerID, plagueID, city, plotX, plotY, plagueTurns)
	if (not plagueID) then plagueID = plagueBubonicID end
	local player = Players[playerID]
	city:SetNumRealBuilding(buildingDiseaseID, 0, true)
	JFD_ChangeNumPlagueTurns(city, plagueID, plagueTurns)
	local plague = GameInfo.JFD_Plagues[plagueID]
	if player:IsHuman() then
		Events.AudioPlay2DSound("AS2D_SOUND_JFD_PLAGUE")
		JFD_SendNotification(playerID, "NOTIFICATION_JFD_PLAGUE", Locale.ConvertTextKey("TXT_KEY_JFD_CITY_PLAGUE_NOTIFICATION", plague.IconString, plague.Description, city:GetName()), Locale.ConvertTextKey("TXT_KEY_JFD_CITY_PLAGUE_NOTIFICATION_SHORT", city:GetName()), false, plotX, plotY)
	end
	JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_CITY_PLAGUE", plague.IconString, plague.Description, player:GetCivilizationAdjective(), city:GetName()))
	if (not player:IsHuman()) then city:SetFocusType(cityFocusFoodID) end
	city:SetAdditionalFood(definePlagueFoodConsumption)
	Map.GetPlot(plotX, plotY):SetImprovementType(improvementPlagueID)
	--JFD_ChangeNumPlagueTurns(city, -1)
	--local unit = city:GetGarrisonedUnit()
	--if (unit and (not unit:HasPromotion(promotionPlaguedID))) then
	--	unit:SetHasPromotion(promotionPlaguedID, true)
	--end
end
if userSettingHealthCore then
	LuaEvents.JFD_PlagueBegins.Add(JFD_CID_Health_PlagueBegins)
end

--JFD_CID_Health_CityCanTrain
function JFD_CID_Health_CityCanTrain(playerID, cityID, unitID)
	local player = Players[playerID]
	local city = player:GetCityByID(cityID)
	if JFD_IsCityPlagued(city) then
		if GameInfo.Units[unitID].Food then
			return false
		end
	end
	return true
end
if (userSettingHealthCore and userSettingHealthCoreSettlers) then
	GameEvents.CityCanTrain.Add(JFD_CID_Health_CityCanTrain)
end

--JFD_CID_Health_CityTrained
function JFD_CID_Health_CityTrained(playerID, cityID, unitID)
	local player = Players[playerID]
	local city = player:GetCityByID(cityID)
	if JFD_IsCityPlagued(city) then
		local unit = player:GetUnitByID(unitID)
		if (unit:IsPromotionValid(promotionPlaguedID) and (not unit:HasPromotion(promotionPlaguedID))) then
			unit:SetHasPromotion(promotionPlaguedID, true)
			unit:ChangeDamage(definePlagueUnitDamagePerTurn)
		end
	end
end
if userSettingHealthCore then
	--GameEvents.CityTrained.Add(JFD_CID_Health_CityTrained)
end

--JFD_CID_Health_UnitCreated
function JFD_CID_Health_UnitCreated(playerID, unitID)
	local player = Players[playerID]
	if (not player:IsBarbarian()) then return end
	if JFD_GetRandom(1,100) <= definePlagueBarbarianChance then
		local unit = player:GetUnitByID(unitID)
		if (not unit:HasPromotion(promotionPlaguedID)) then
			unit:SetHasPromotion(promotionPlaguedID, true)
		end
	end
end
if userSettingHealthCore then
	--GameEvents.UnitCreated.Add(JFD_CID_Health_UnitCreated)
end

--JFD_CID_Health_CanHavePromotion
local promotionCurePlagueID = GameInfoTypes["PROMOTION_JFD_CURE_PLAGUE"]
local promotionInstaHealID  = GameInfoTypes["PROMOTION_INSTA_HEAL"]
function JFD_CID_Health_CanHavePromotion(playerID, unitID, promotionID)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if promotionID == promotionInstaHealID then
		if unit:HasPromotion(promotionPlaguedID) then
			return false
		end
	end
	if promotionID == promotionCurePlagueID then
		if (not unit:HasPromotion(promotionPlaguedID)) then
			return false
		end
	end
	return true
end
if userSettingHealthCore then
	--GameEvents.CanHavePromotion.Add(JFD_CID_Health_CanHavePromotion)
end

--JFD_CID_Health_UnitPromoted
local promotionCurePlagueID = GameInfoTypes["PROMOTION_JFD_CURE_PLAGUE"]
function JFD_CID_Health_UnitPromoted(playerID, unitID, promotionID)
	local player = Players[playerID]
	if promotionID == promotionCurePlagueID then
		local unit = player:GetUnitByID(unitID)
		if unit:HasPromotion(promotionPlaguedID) then
			unit:SetHasPromotion(promotionPlaguedID, false)
		end
		unit:ChangeDamage(-50)
		unit:SetHasPromotion(promotionCurePlagueID, false)
	end
end
if userSettingHealthCore then
	--GameEvents.UnitPromoted.Add(JFD_CID_Health_UnitPromoted)
end
------------------------------------------------------------------------------------------------------------------------
-- GREAT PEOPLE
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Health_PlaguedCured
function JFD_CID_Health_PlaguedCured(playerID, unit, city)
	local player = Players[playerID]
	local plagueCounter = JFD_GetPlagueCounter(playerID, city)
	for city in player:Cities() do
		if (player:IsHuman() and JFD_IsCityPlagued(city)) then
			Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(city:GetX(), city:GetY()))), convertTextKey("[COLOR_POSITIVE_TEXT]-{1_Num}[ENDCOLOR] [ICON_JFD_PLAGUE]", plagueCounter), true)
		end
		JFD_SetPlagueCounter(playerID, city, 0)
		local plagueID = JFD_GetCityPlagueID(city)
		if plagueID then
			JFD_SetNumPlagueTurns(city, plagueID, 0)
		end
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
	if unit:GetUnitClassType() == unitClassGreatDoctorID then
		local hex = ToHexFromGrid(Vector2(plotX, plotY))
		if player:IsHuman() then 
			Events.GameplayFX(hex.x, hex.y, -1) 
			Events.AudioPlay2DSound("AS2D_SOUND_JFD_DOCTOR")
		end	
	end
end
GameEvents.GreatPersonExpended.Add(JFD_CID_Health_GreatPersonExpended)
-------------------
-- MISSION
-------------------
--JFD_CID_Health_MissionStart
local missionPlagueID    = GameInfoTypes["MISSION_JFD_CURE_PLAGUE"]
local missionPopulationID = GameInfoTypes["MISSION_JFD_POPULATION"]
function JFD_CID_Health_MissionStart(playerID, unitID, missionID, data1, data2, flags, turn)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local city = unit:GetPlot():GetPlotCity()
	if (not city) then return end
	if missionID == missionPlagueID then
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