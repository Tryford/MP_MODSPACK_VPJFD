-- JFDLC_Misc_Functions
-- Author: JFD
-- DateCreated: 4/18/2017 11:01:37 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFDLCUtils.lua")
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
local defineMiscInfluenceFromStallite   = GameDefines["JFDLC_MISC_INFLUENCE_FROM_STALLITE"]
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingMiscBuildingSounds 	= (Game.GetUserSetting("JFDLC_MISC_CIV_BUILDING_SOUNDS") == 1)
local userSettingMiscSatellites 		= (Game.GetUserSetting("JFDLC_MISC_SATELLITES") == 1)
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
-- BUILDINGS
------------------------------------------------------------------------------------------------------------------------
--JFDLC_Misc_CityConstructed
local buildingGrandInquisitionID = GameInfoTypes["BUILDING_JFD_GRAND_INQUISITION"]
local leaderIsabellaID	         = GameInfoTypes["LEADER_ISABELLA"]
function JFDLC_Misc_CityConstructed(playerID, cityID, buildingID)
	local player = Players[playerID]
	if (not player:IsHuman()) then return end
	local building = GameInfo.Buildings[buildingID]
	local buildingType = building.Type
	local buildingClass = building.BuildingClass
	local buildingAudio = "AS2D_BUILDING_JFD_GENERIC"
	for buildingClass in GameInfo.BuildingClass_ConstructionAudio("BuildingClassType = '" .. buildingClass .. "'") do
		buildingAudio = buildingClass.ConstructionAudio
	end
	for building in GameInfo.Building_ConstructionAudio("BuildingType = '" .. buildingType .. "'") do
		buildingAudio = building.ConstructionAudio
	end
	if (buildingID == buildingGrandInquisitionID and player:GetLeaderType() == leaderIsabellaID) then
		buildingAudio = "AS2D_BUILDING_JFD_SPANISH_INQUISITION"
	end
	if buildingAudio then
		Events.AudioPlay2DSound(buildingAudio)
	end
end
if userSettingMiscBuildingSounds then
	GameEvents.CityConstructed.Add(JFDLC_Misc_CityConstructed)
end

--JFDLC_Misc_NotificationAdded
local notificationProductionID = NotificationTypes["NOTIFICATION_PRODUCTION"]
function JFDLC_Misc_NotificationSound(notificationID, notificationType, headerText, summaryText)
	if ((not userSettingMiscBuildingSounds) and notificationType == notificationProductionID) then
		Events.AudioPlay2DSound("AS2D_BUILDING_JFD_GENERIC")
	end
end
Events.NotificationAdded.Add(JFDLC_Misc_NotificationAdded)
------------------------------------------------------------------------------------------------------------------------
-- SATELLITES
------------------------------------------------------------------------------------------------------------------------
--JFDLC_Misc_CityCaptureComplete
function JFD_CID_Misc_Satellites(oldOwnerID, capital, plotX, plotY, newOwnerID)
	local player = Players[newOwnerID]
	if player:IsHuman() then return end
	local otherPlayer = Players[oldOwnerID]
	if (not otherPlayer:IsMinorCiv()) then return end
	if JFD_GetRandom(1,100) <= player:GetFlavorValue("FLAVOR_DIPLOMACY") then
		local city = Map.GetPlot(plotX, plotY):GetPlotCity()
		if (not city) then return end
		LuaEvents.JFD_SatelliteInstalled(newOwnerID, oldOwnerID, city:GetID())
	end
end
if userSettingMiscSatellites then
	GameEvents.CityCaptureComplete.Add(JFDLC_Misc_CityCaptureComplete)	
end

--JFDLC_Misc_SatelliteInstalled
function JFDLC_Misc_SatelliteInstalled(playerID, minorPlayerID, cityID, city)
	local player = Players[playerID]
	local minorPlayer = Players[minorPlayerID]
	Network.SendLiberateMinor(minorPlayerID, cityID)
	minorPlayer:ChangeMinorCivFriendshipWithMajor(playerID, defineMiscInfluenceFromStallite)	
	city:ChangeResistanceTurns(-city:GetResistanceTurns())
	city:SetPuppet(false)
	city:SetProductionAutomated(false)
	if player:IsHuman() then
		JFD_SendNotification(playerID, "NOTIFICATION_MINOR", Locale.ConvertTextKey("TXT_KEY_JFD_SATELLITE_INSTALLED_NOTIFICATION", minorPlayer:GetCivilizationShortDescription()), Locale.ConvertTextKey("TXT_KEY_JFD_SATELLITE_INSTALLED_NOTIFICATION_SHORT"), false)
	else
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SATELLITE_INSTALLED", player:GetName(), player:GetCivilizationShortDescription(), minorPlayer:GetCivilizationShortDescription()))
	end
end
if userSettingMiscSatellites then
	LuaEvents.JFD_SatelliteInstalled.Add(JFDLC_Misc_SatelliteInstalled)	
end
--=======================================================================================================================
--=======================================================================================================================
