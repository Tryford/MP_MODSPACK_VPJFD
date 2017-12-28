-- JFD_PIT_Progress_Functions
-- Author: JFD
-- DateCreated: 2/7/2017 1:33:10 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_PIT_ProgressUtils.lua")
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
-- SETTINGS
--------------------------------------------------------------------------------------------------------------------------
local userSettingPITProgressCoreFirstGP   = (Game.GetUserSetting("JFD_PIT_PROGRESS_CORE_FIRST_FREE_GREAT_PEOPLE") == 1)
local userSettingPITProgressBuildCharges  = (Game.GetUserSetting("JFD_PIT_PROGRESS_BUILD_CHARGES") == 1)
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local activePlayerID = Game.GetActivePlayer()
local activePlayer	 = Players[activePlayerID]
local mathMin		 = math.min
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
-- PROGRESS
------------------------------------------------------------------------------------------------------------------------
--JFD_PIT_Progress_TeamTechResearched
function JFD_PIT_Progress_TeamTechResearched(teamID, techID)
	local team = Teams[teamID]
	local playerID = team:GetLeaderID()
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local capital = player:GetCapitalCity()
	if (not capital) then return end
	local teamTechs = team:GetTeamTechs()
	local tech = GameInfo.Technologies[techID]
	for row in GameInfo.Technologies_JFD_FreeUnitTypes("TechType = '" .. tech.Type .. "'") do
		local techID = GameInfoTypes[row.TechType]
		local unitID = GameInfoTypes[row.UnitType]
		if row.UnitClassType then
			unitID = player:GetSpecificUnitType(row.UnitClassType)
		end
		if ((row.IsFirst and Game.CountKnownTechNumTeams(techID) == 1) or (not row.IsFirst)) then
			player:InitUnit(unitID, capital:GetX(), capital:GetY())
			if player:IsHuman() then
				local unitDesc = GameInfo.Units[unitID].Description
				JFD_SendNotification(playerID, "NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER", Locale.ConvertTextKey("TXT_KEY_JFD_TECH_FIRST_TO_FREE_NOTIFICATION", unitDesc, GameInfo.Technologies[techID].Description), Locale.ConvertTextKey("TXT_KEY_JFD_TECH_FIRST_TO_FREE_NOTIFICATION_SHORT", unitDesc), false, capital:GetX(), capital:GetY(), unitID)
			end	
		end
	end
end
if userSettingPITProgressCoreFirstGP then
	GameEvents.TeamTechResearched.Add(JFD_PIT_Progress_TeamTechResearched)	
end
------------------------------------------------------------------------------------------------------------------------
-- BUILD CHARGES
------------------------------------------------------------------------------------------------------------------------
--JFD_PIT_Progress_UnitCreated
function JFD_PIT_Progress_UnitCreated(playerID, unitID, unitTypeID)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local unitInfo = GameInfo.Units[unitTypeID].Type
	local numCharges, numChargesMax = player:GetNumUnitBuildCharges(unit, unitTypeID)
	if numChargesMax > 0 then
		for value = 1, numChargesMax do
			local promotionID = GameInfoTypes["PROMOTION_JFD_BUILD_CHARGE_" .. value]
			unit:SetHasPromotion(promotionID, true)
		end
	end
end
if userSettingPITProgressBuildCharges then
	GameEvents.UnitCreated.Add(JFD_PIT_Progress_UnitCreated)
end

--JFD_PIT_Progress_UnitUpgraded
function JFD_PIT_Progress_UnitUpgraded(playerID, unitID, newUnitID)
	local player = Players[playerID]
	local unit = player:GetUnitByID(newUnitID)
	local unitTypeID = unit:GetUnitType()
	local numCharges, numChargesMax = player:GetNumUnitBuildCharges(unit, unitTypeID)
	if (numChargesMax > 0 and numCharges <= numChargesMax) then
		local newUnit = player:InitUnit(unitTypeID, unit:GetX(), unit:GetY())
		newUnit:FinishMoves()
		newUnit:Convert(unit)
	end	
end
if userSettingPITProgressBuildCharges then
	GameEvents.UnitUpgraded.Add(JFD_PIT_Progress_UnitUpgraded)
end

--JFD_PIT_Progress_PlayerBuilt
function JFD_PIT_Progress_PlayerBuilt(playerID, unitID, plotX, plotY, buildID)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local unitTypeID = unit:GetUnitType()
	local unitInfo = GameInfo.Units[unitTypeID]
	local build = GameInfo.Builds[buildID]
	for row in GameInfo.Build_JFD_ChargeExcludes("BuildType = '" .. build.Type .. "'") do
		if ((not row.RequiresPolicy) or (row.RequiresPolicy and player:HasPolicy(GameInfoTypes[row.RequiresPolicy]))) then
			return
		end
	end
	local chargeCost = player:GetUnitBuildChargeCost(buildID, unitTypeID)
	if chargeCost <= 0 then return end
	local numCharges = player:GetNumUnitBuildCharges(unit, unitTypeID)
	if numCharges > 1 then
		player:ChangeNumUnitBuildCharges(unit, unitTypeID, -chargeCost)
		if player:IsHuman() then
			local unitAction = build.ActionAnimation
			SetUnitActionCodeDebug(playerID, unitID, unitAction)
			Events.AudioPlay2DSound("AS2D_UNIT_JFD_BUILD")
		end
	else
		if player:IsHuman() then
			local unitAction = build.ActionAnimation
			SetUnitActionCodeDebug(playerID, unitID, 1200)
			Events.AudioPlay2DSound("AS2D_UNIT_JFD_BUILD_FIN")
		end
		unit:Kill(true, -1)
	end
	LuaEvents.JFD_WorkerChargeExpended(playerID, unitID, plotX, plotY)
end
if userSettingPITProgressBuildCharges then
	GameEvents.PlayerBuilt.Add(JFD_PIT_Progress_PlayerBuilt)
end
------------------------------------------------------------------------------------------------------------------------
-- GREAT PEOPLE
------------------------------------------------------------------------------------------------------------------------
local unitClassDirectorID = GameInfoTypes["UNITCLASS_JFD_GREAT_DIRECTOR"]

--JFD_PIT_Progress_GreatPersonExpended
function JFD_PIT_Progress_GreatPersonExpended(playerID, unitID, unitTypeID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsHuman()) then return end
	local unit = player:GetUnitByID(unitID) 
	if unit:GetUnitClassType() == unitClassDirectorID then
		local hex = ToHexFromGrid(Vector2(plotX, plotY))
		Events.GameplayFX(hex.x, hex.y, -1) 
		Events.AudioPlay2DSound("AS2D_SOUND_JFD_GREAT_DIRECTOR")
	end
end
GameEvents.GreatPersonExpended.Add(JFD_PIT_Progress_GreatPersonExpended)
-------------------
-- MISSION
-------------------
local missionFilmFestivalID	= GameInfoTypes["MISSION_JFD_HOST_FILM_FESTIVAL"]

--JFD_PIT_Progress_CustomMissionStart
function JFD_PIT_Progress_CustomMissionStart(playerID, unitID, missionID, data1, data2, flags, turn)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if missionID == missionFilmFestivalID then
		player:ChangeNumFreeGreatPeople(1)
		unit:greatperson()
		return CUSTOM_MISSION_ACTION
	end
	return CUSTOM_MISSION_NO_ACTION
end
GameEvents.CustomMissionStart.Add(JFD_PIT_Progress_CustomMissionStart)

--JFD_PIT_Progress_CustomMissionCompleted
function JFD_PIT_Progress_CustomMissionCompleted(playerID, unitID, missionID, data1, data2, flags, turn)
    local player = Players[playerID]
	if missionID == missionFilmFestivalID then 
	return true end
	return false
end
GameEvents.CustomMissionCompleted.Add(JFD_PIT_Progress_CustomMissionCompleted)
--=======================================================================================================================
--=======================================================================================================================