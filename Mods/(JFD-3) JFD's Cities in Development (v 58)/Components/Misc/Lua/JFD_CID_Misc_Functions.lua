-- JFD_CID_Misc_Functions
-- Author: JFD
-- DateCreated: 11/5/2015 12:05:30 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_CIDUtilities.lua")
include("JFD_CID_Misc_Utils.lua")
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingBuildCharges   = JFD_GetUserSetting("JFD_CID_MISC_BUILD_CHARGES") == 1
local userSettingBuildingSounds = JFD_GetUserSetting("JFD_CID_MISC_CIV_BUILDING_SOUNDS") == 1
local userSettingLevelUpSound   = JFD_GetUserSetting("JFD_CID_MISC_UNIT_LEVEL_UP_SOUND") == 1
local userSettingMiscSatellites = JFD_GetUserSetting("JFD_CID_MISC_SATELLITES") == 1
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
-- BUILD CHARGES
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Misc_UnitCreated
function JFD_CID_Misc_UnitCreated(playerID, unitID, unitTypeID)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local unitInfo = GameInfo.Units[unitTypeID].Type
	local numCharges, numChargesMax = JFD_GetNumBuildCharges(playerID, unit, unitTypeID)
	if numChargesMax > 0 then
		for value = 1, numChargesMax do
			local promotionID = GameInfoTypes["PROMOTION_JFD_BUILD_CHARGE_" .. value]
			unit:SetHasPromotion(promotionID, true)
		end
	end
end
if userSettingBuildCharges then
	GameEvents.UnitCreated.Add(JFD_CID_Misc_UnitCreated)
end

--JFD_CID_Misc_PlayerBuilt
function JFD_CID_Misc_PlayerBuilt(playerID, unitID, plotX, plotY, buildID)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local unitTypeID = unit:GetUnitType()
	local build = GameInfo.Builds[buildID]
	local chargeCost = build.ChargeCost
	for row in GameInfo.Build_JFD_ChargeExcludes("BuildType = '" .. build.Type .. "'") do
		if ((not row.RequiresPolicy) or (row.RequiresPolicy and player:HasPolicy(GameInfoTypes[row.RequiresPolicy]))) then
			return
		end
	end
	for row in GameInfo.Build_JFD_ExtraChargeCost("BuildType = '" .. build.Type .. "'") do
		if ((not row.RequiresPolicy) or (row.RequiresPolicy and player:HasPolicy(GameInfoTypes[row.RequiresPolicy]))) then
			chargeCost = chargeCost + row.ExtraChargeCost
		end
	end	
	local numCharges = JFD_GetNumBuildCharges(playerID, unit, unitTypeID)
	if numCharges > 1 then
		JFD_ChangeNumBuildCharges(playerID, unit, unitTypeID, -chargeCost)
		if player:IsHuman() then
			--local hex = ToHexFromGrid(Vector2(plotX, plotY))
			--Events.GameplayFX(hex.x, hex.y, -1)
			Events.AudioPlay2DSound("AS2D_UNIT_JFD_BUILD")
			local unitAction = build.ActionAnimation
			SetUnitActionCodeDebug(playerID, unitID, unitAction)
		end
	else
		if player:IsHuman() then
			--local hex = ToHexFromGrid(Vector2(plotX, plotY))
			--Events.GameplayFX(hex.x, hex.y, -1)
			Events.AudioPlay2DSound("AS2D_UNIT_JFD_BUILD_FIN")
			local unitAction = build.ActionAnimation
			SetUnitActionCodeDebug(playerID, unitID, 1200)
		end
		unit:Kill(true, -1)
	end
end
if userSettingBuildCharges then
	GameEvents.PlayerBuilt.Add(JFD_CID_Misc_PlayerBuilt)
end
------------------------------------------------------------------------------------------------------------------------
-- BUILDINGS
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Misc_BuildingSounds
local buildingGrandInquisitionID = GameInfoTypes["BUILDING_JFD_GRAND_INQUISITION"]
local civilizationCastileID      = GameInfoTypes["CIVILIZATION_JFD_CASTILE"]
local civilizationSpainID	     = GameInfoTypes["CIVILIZATION_SPAIN"]
function JFD_CID_Misc_BuildingSounds(playerID, cityID, buildingID)
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
	if (buildingID == buildingGrandInquisitionID and (player:GetCivilizationType() == civilizationSpainID or player:GetCivilizationType() == civilizationCastileID)) then
		buildingAudio = "AS2D_BUILDING_JFD_SPANISH_INQUISITION"
	end
	if buildingAudio then
		Events.AudioPlay2DSound(buildingAudio)
	end
end
if userSettingBuildingSounds then
	GameEvents.CityConstructed.Add(JFD_CID_Misc_BuildingSounds)
end

--JFD_CID_Misc_NotificationSound
local notificationEventChoiceID		= NotificationTypes["NOTIFICATION_EVENT_CHOICE"]
local notificationEventChoiceCityID = NotificationTypes["NOTIFICATION_EVENT_CHOICE_CITY"]
local notificationMinorBoughtID		= NotificationTypes["NOTIFICATION_MINOR_BUYOUT"]
local notificationProductionID		= NotificationTypes["NOTIFICATION_PRODUCTION"]
local notificationUnitPromotionID	= NotificationTypes["NOTIFICATION_UNIT_PROMOTION"]
function JFD_CID_Misc_NotificationSound(notificationID, notificationType, headerText, summaryText)
	if ((not userSettingBuildingSounds) and notificationType == notificationProductionID) then
		Events.AudioPlay2DSound("AS2D_BUILDING_JFD_GENERIC")
	end
	if notificationType == notificationMinorBoughtID then
		Events.AudioPlay2DSound("AS2D_MISC_JFD_MARRIAGE")
	end
	if (userSettingLevelUpSound and notificationType == notificationUnitPromotionID) then
		Events.AudioPlay2DSound("AS2D_UNIT_JFD_PROMOTED")
	end
	if (notificationType == notificationEventChoiceID or notificationType == notificationEventChoiceCityID) then
		Events.AudioPlay2DSound("AS2D_EVENT_JFD_EVENT")
	end
end
Events.NotificationAdded.Add(JFD_CID_Misc_NotificationSound)
------------------------------------------------------------------------------------------------------------------------
-- SATELLITES
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Misc_Satellites
function JFD_CID_Misc_Satellites(oldOwnerID, capital, plotX, plotY, newOwnerID)
	local player = Players[newOwnerID]
	if player:IsHuman() then return end
	local otherPlayer = Players[oldOwnerID]
	if (not otherPlayer:IsMinorCiv()) then return end
	local influenceFlavor = JFD_GetLeaderFlavour(newOwnerID, "FLAVOR_DIPLOMACY")
	if JFD_GetRandom(1,100) <= influenceFlavor then
		local city = Map.GetPlot(plotX, plotY):GetPlotCity()
		if (not city) then return end
		LuaEvents.JFD_SatelliteInstalled(newOwnerID, oldOwnerID, city:GetID())
	end
end
if userSettingMiscSatellites then
	GameEvents.CityCaptureComplete.Add(JFD_CID_Misc_Satellites)	
end

--JFD_CID_Misc_SatelliteInstalled
function JFD_CID_Misc_SatelliteInstalled(playerID, minorPlayerID, cityID, city)
	local player = Players[playerID]
	local minorPlayer = Players[minorPlayerID]
	Network.SendLiberateMinor(minorPlayerID, cityID)
	minorPlayer:ChangeMinorCivFriendshipWithMajor(playerID, defineInfluenceFromStallite)	
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
	LuaEvents.JFD_SatelliteInstalled.Add(JFD_CID_Misc_SatelliteInstalled)	
end
--=======================================================================================================================
--=======================================================================================================================
