-- JFD_RTP_Claims_Functions
-- Author: JFD
-- DateCreated: 12/18/2014 8:58:10 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("FLuaVector.lua")
include("IconSupport")
include("JFDLCUtils.lua")
include("JFD_RTP_ClaimsUtils.lua")
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingCIDLoyaltyCore					= (Game.GetUserSetting("JFD_CID_LOYALTY_CORE") == 1)
local userSettingCIDHappinessCore				= (Game.GetUserSetting("JFD_CID_HAPPINESS_CORE") == 1)
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local convertTextKey 			= Locale.ConvertTextKey

local resourceDignitariesID		= GameInfoTypes["RESOURCE_JFD_DIGNITARIES"]
local resourceMagistrateID 		= GameInfoTypes["RESOURCE_MAGISTRATES"]
local unitClassDignitaryID		= GameInfoTypes["UNITCLASS_JFD_GREAT_DIGNITARY"]
local unitClassMagistrateID		= GameInfoTypes["UNITCLASS_JFD_GREAT_MAGISTRATE"]
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- CLAIMS
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Claims_PlayerCanBuyOut
function JFD_RTP_Claims_PlayerCanBuyOut(playerID, cityStateID)
	if (not playerID) then return end
	local player = Players[playerID]
	return (player:GetNumResourceAvailable(resourceDignitariesID) >= 2)
end
GameEvents.PlayerCanBuyOut.Add(JFD_RTP_Claims_PlayerCanBuyOut)

--JFD_RTP_Claims_ClaimPushed
local buildingClaimedCityID = GameInfoTypes["BUILDING_JFD_CLAIMED_CITY"]
function JFD_RTP_Claims_ClaimPushed(playerID, minorPlayerID)
	local player = Players[playerID]
	local minorPlayer = Players[minorPlayerID]
	local claimID = player:GetMinorClaimID(minorPlayerID)
	local claimGoldCost, claimDignitaryCost, claimResistanceCost = player:GetClaimCost(minorPlayerID, claimID)
	player:ChangeGold(-claimGoldCost)
	player:ChangeNumResourceTotal(resourceDignitariesID, -claimDignitaryCost)
	for city in minorPlayer:Cities() do
		player:AcquireCity(city, false, true)
		local cityX = city:GetX()
		local cityY = city:GetY()
		local newCity = Map.GetPlot(cityX, cityY):GetPlotCity()
		newCity:ChangeResistanceTurns(-newCity:GetResistanceTurns())
		newCity:ChangeResistanceTurns(claimResistanceCost)
		newCity:SetOccupied(false)
		newCity:SetNumRealBuilding(buildingClaimedCityID, 1)
	end
	if player:IsHuman() then
		player:AddNotification(notificationBuyoutID, convertTextKey("TXT_KEY_NOTIFICATION_JFD_POLITICAL_CLAIM_DESC", player:GetCivilizationDescription(), minorPlayer:GetName()), convertTextKey("TXT_KEY_NOTIFICATION_JFD_POLITICAL_CLAIM_SHORT_DESC"), -1, -1)
	else
		JFD_SendWorldEvent(playerID, convertTextKey("TXT_KEY_NOTIFICATION_JFD_POLITICAL_CLAIM_DESC", player:GetCivilizationDescription(), minorPlayer:GetName()))
	end
end
LuaEvents.JFD_ClaimPushed.Add(JFD_RTP_Claims_ClaimPushed)

--JFD_RTP_Claims_PlayerBoughtOut
function JFD_RTP_Claims_PlayerBoughtOut(playerID, minorPlayerID)
	LuaEvents.JFD_ClaimPushed(playerID, minorPlayerID)
end
GameEvents.PlayerBoughtOut.Add(JFD_RTP_Claims_PlayerBoughtOut)
------------------------------------------------------------------------------------------------------------------------
-- CIVILIZATIONS
------------------------------------------------------------------------------------------------------------------------
local traitAustriaID = GameInfoTypes["TRAIT_JFD_AUSTRIA"]
local unitArtistID	 = GameInfoTypes["UNIT_ARTIST"]
local unitMusicianID = GameInfoTypes["UNIT_MUSICIAN"]
local unitWriterID	 = GameInfoTypes["UNIT_WRITER"]
--JFD_CID_Claims_Austra_UnitCreated
function JFD_CID_Claims_Austra_UnitCreated(playerID, unitID, unitTypeID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (not player:HasTrait(traitAustriaID)) then return end
	if (unitTypeID == unitArtistID or unitTypeID == unitMusicianID or unitTypeID == unitWriterID) then
		local hex = ToHexFromGrid(Vector2(plotX, plotY))
		player:ChangeNumResourceTotal(resourceDignitariesID, 1)
		if player:IsHuman() then
			Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+1[ENDCOLOR] [ICON_JFD_DIGNITARY]"), true)
			Events.GameplayFX(hex.x, hex.y, -1)
		end
	end
end
GameEvents.UnitCreated.Add(JFD_CID_Claims_Austra_UnitCreated)	
------------------------------------------------------------------------------------------------------------------------
-- GREAT PEOPLE
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Claims_GreatPersonExpended
function JFD_RTP_Claims_GreatPersonExpended(playerID, unitID, unitTypeID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsHuman()) then return end
	local unit = player:GetUnitByID(unitID) 
	if unit:GetUnitClassType() == unitClassDignitaryID then
		local hex = ToHexFromGrid(Vector2(plotX, plotY))
		Events.GameplayFX(hex.x, hex.y, -1) 
		Events.AudioPlay2DSound("AS2D_SOUND_JFD_GREAT_DIGNITARY")
	elseif unit:GetUnitClassType() == unitClassMagistrateID then
		local hex = ToHexFromGrid(Vector2(plotX, plotY))
		Events.GameplayFX(hex.x, hex.y, -1) 
		Events.AudioPlay2DSound("AS2D_SOUND_JFD_GREAT_MAGISTRATE")
	end
end
GameEvents.GreatPersonExpended.Add(JFD_RTP_Claims_GreatPersonExpended)

--JFD_RTP_Claims_CityAssimilated
function JFD_RTP_Claims_CityAssimilated(playerID, unit)
	local player = Players[playerID]
	local city = unit:GetPlot():GetPlotCity()
	if (not city) then return end
	city:ChangeResistanceTurns(-city:GetResistanceTurns())
	if userSettingCIDHappinessCore then
		if player:IsHuman() then
			local countyResistance = player:GetCityResistanceCounterDetails(city)
			if countyResistance > 0 then
				Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))), convertTextKey("[COLOR_POSITIVE_TEXT]-{1_Num}[ENDCOLOR] [ICON_RESISTANCE]", countyResistance), true)
			end
		end
		city:SetResistanceCounter(0)
	end
	if userSettingCIDLoyaltyCore then
		if player:IsHuman() then
			local countyLoyalty = player:GetCityLoyaltyCounterDetails(city, city:GetLoyaltyState())
			if countyLoyalty > 0 then
				Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))), convertTextKey("[COLOR_POSITIVE_TEXT]-{1_Num}[ENDCOLOR] [ICON_JFD_REVOLT]", countyLoyalty), true)
			end
		end
		city:SetLoyaltyCounter(0)
	end
	unit:greatperson()
end
LuaEvents.JFD_CityAssimilated.Add(JFD_RTP_Claims_CityAssimilated)

--JFD_RTP_Claims_CityReclaimed
-- function JFD_RTP_Claims_CityReclaimed(playerID, unit)
	-- local player = Players[playerID]
	-- local plotCity = unit:GetPlot():GetWorkingCity()
	-- player:AcquireCity(plotCity, false, true)
	-- unit:greatperson()
-- end
-- LuaEvents.JFD_CityReclaimed.Add(JFD_RTP_Claims_CityReclaimed)
-------------------
-- MISSION
-------------------
local missionAssimilateCityID	= GameInfoTypes["MISSION_JFD_ASSIMILATE_CITY"]
-- local missionReclaimCityID		= GameInfoTypes["MISSION_JFD_RECLAIM_CITY"]

--JFD_RTP_Claims_CustomMissionStart
function JFD_RTP_Claims_CustomMissionStart(playerID, unitID, missionID, data1, data2, flags, turn)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if missionID == missionAssimilateCityID then
		LuaEvents.JFD_CityAssimilated(playerID, unit)
		return CUSTOM_MISSION_ACTION
	end
	return CUSTOM_MISSION_NO_ACTION
end
GameEvents.CustomMissionStart.Add(JFD_RTP_Claims_CustomMissionStart)

--JFD_RTP_Claims_CustomMissionCompleted
function JFD_RTP_Claims_CustomMissionCompleted(playerID, unitID, missionID, data1, data2, flags, turn)
    local player = Players[playerID]
    if missionID == missionAssimilateCityID then return true end
	return false
end
GameEvents.CustomMissionCompleted.Add(JFD_RTP_Claims_CustomMissionCompleted)
--=======================================================================================================================
--=======================================================================================================================