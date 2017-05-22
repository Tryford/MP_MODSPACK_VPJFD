-- JFD_RTP_Claims_Functions
-- Author: JFD
-- DateCreated: 12/18/2014 8:58:10 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("IconSupport")
include("JFD_RTPUtils.lua")
include("JFD_RTP_ClaimsUtils.lua")
include("JFD_CID_ColoniesUtils.lua")
include("JFD_CID_HappinessUtils.lua")
include("JFD_CID_LoyaltyUtils.lua")
include("JFD_CID_ProvincesUtils.lua")
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingColoniesCore			= JFD_GetUserSetting("JFD_CID_COLONIES_CORE")
local userSettingLoyaltyCore			= JFD_GetUserSetting("JFD_CID_LOYALTY_CORE")
local userSettingHappinessCore			= JFD_GetUserSetting("JFD_CID_HAPPINESS_CORE")
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
local defineDefaultExpendedDignitaries	= GameDefines["JFD_RTP_DEFAULT_EXPENDED_DIGNITARIES"]
local defineDefaultExpendedMagistrates	= GameDefines["JFD_RTP_DEFAULT_EXPENDED_MAGISTRATES"]
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local convertTextKey 			        = Locale.ConvertTextKey
--=======================================================================================================================
-- AI FUNCTIONS
--=======================================================================================================================
-- GREAT PEOPLE
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Claims_GreatPersonCreated
function JFD_RTP_Claims_GreatPersonCreated(playerID, unitID, unitTypeID)
	local player = Players[playerID]
	if player:IsHuman() then return end
	local unit = player:GetUnitByID(unitID) 
	if unit:GetUnitClassType() == unitClassDignitaryID then
		if player:GetNumResourceAvailable(resourceDignitariesID, false) <= 2 then
			LuaEvents.JFD_DignitariesGranted(playerID, unit)
		end
	elseif unit:GetUnitClassType() == unitClassMagistrateID then
		if userSettingProvincesCore then
			if player:GetNumResourceAvailable(resourceMagistratesID, false) <= 2 then
				LuaEvents.JFD_MagistratesGranted(playerID, unit)
			else
				local city = nil
				local cityPop = 0
				for otherCity in player:Cities() do
					if otherCity:GetPopulation() > cityPop then
						local provinceID = JFD_GetProvinceID(playerID, city)
						if GameInfo.JFD_Provinces[provinceID].UpgradeProvinceType then
							city = otherCity
							cityPop = otherCity:GetPopulation()
						end					
					end
				end
				if city then LuaEvents.JFD_ProvinceUpgraded(playerID, unit, otherCity) end
			end
		else
			LuaEvents.JFD_MagistratesGranted(playerID, unit)
		end
	end
end
GameEvents.UnitCreated.Add(JFD_RTP_Claims_GreatPersonCreated)
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
-- CLAIMS
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Claims_PlayerCanBuyOut
local resourceDignitariesID	= GameInfoTypes["RESOURCE_JFD_DIGNITARIES"]
function JFD_RTP_Claims_PlayerCanBuyOut(playerID, cityStateID)
	local player = Players[playerID]
	if player:GetNumResourceAvailable(resourceDignitariesID) < 2 then 
		return false
	end
	return true
end
GameEvents.PlayerCanBuyOut.Add(JFD_RTP_Claims_PlayerCanBuyOut)

--JFD_RTP_Claims_ClaimPushed
local buildingClaimedCityID = GameInfoTypes["BUILDING_JFD_CLAIMED_CITY"]
local notificationBuyoutID  = NotificationTypes["NOTIFICATION_MINOR_BUYOUT"]
function JFD_RTP_Claims_ClaimPushed(playerID, minorPlayerID)
	local player = Players[playerID]
	local minorPlayer = Players[minorPlayerID]
	local claimID = JFD_GetMinorClaimID(playerID, minorPlayerID)
	local claimGoldCost, claimDignitaryCost, claimResistanceCost = JFD_GetClaimCost(playerID, minorPlayerID, claimID)
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
local notificationBuyoutID  = NotificationTypes["NOTIFICATION_MINOR_BUYOUT"]
function JFD_RTP_Claims_PlayerBoughtOut(playerID, minorPlayerID)
	LuaEvent.JFD_ClaimPushed(playerID, minorPlayerID)
end
GameEvents.PlayerBoughtOut.Add(JFD_RTP_Claims_PlayerBoughtOut)
-----------------
-- NOTIFICATION
-----------------
--JFD_RTP_Claims_NotificationAdded
local notificationMinorBoughtID = NotificationTypes["NOTIFICATION_MINOR_BUYOUT"]
function JFD_RTP_Claims_NotificationAdded(notificationID, notificationType, headerText, summaryText)
	if notificationType == notificationMinorBoughtID then
		Events.AudioPlay2DSound("AS2D_MISC_JFD_MARRIAGE")
	end
end
Events.NotificationAdded.Add(JFD_RTP_Claims_NotificationAdded)
------------------------------------------------------------------------------------------------------------------------
-- GREAT PEOPLE
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Claims_CityAssimilated
function JFD_RTP_Claims_CityAssimilated(playerID, unit)
	local player = Players[playerID]
	local city = unit:GetPlot():GetPlotCity()
	if (not city) then return end
	local buildingCourthouseID = player:GetSpecificBuildingType("BUILDINGCLASS_COURTHOUSE")
	if city:IsOccupied() then
		city:SetOccupied(false)
		city:SetNumRealBuilding(buildingCourthouseID, 1)
	else
		if (userSettingColoniesCore and JFD_IsCityColony(city)) then
			LuaEvents.JFD_ColonyDecolonized(playerID, city, false)
		else
			city:SetPuppet(false)
			city:SetProductionAutomated(false)
			city:SetOccupied(false)
			city:SetNumRealBuilding(buildingCourthouseID, 1)
		end
	end
	city:ChangeResistanceTurns(-city:GetResistanceTurns())
	if userSettingHappinessCore then
		if player:IsHuman() then
			local resistanceCounter = JFD_GetResistanceCounter(playerID, city)
			if resistanceCounter > 0 then
				Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))), convertTextKey("[COLOR_POSITIVE_TEXT]-{1_Num}[ENDCOLOR] [ICON_RESISTANCE]", resistanceCounter), true)
			end
		end
		JFD_SetResistanceCounter(playerID, city, 0)
	end
	if userSettingLoyaltyCore then
		if player:IsHuman() then
			local loyaltyCounter = JFD_GetLoyaltyCounter(playerID, city)
			if loyaltyCounter > 0 then
				Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))), convertTextKey("[COLOR_POSITIVE_TEXT]-{1_Num}[ENDCOLOR] [ICON_JFD_REVOLT]", loyaltyCounter), true)
			end
		end
		JFD_SetLoyaltyCounter(playerID, city, 0)
	end
	unit:greatperson()
end
LuaEvents.JFD_CityAssimilated.Add(JFD_RTP_Claims_CityAssimilated)

--JFD_RTP_Claims_CityReclaimed
function JFD_RTP_Claims_CityReclaimed(playerID, unit)
	local player = Players[playerID]
	local plotCity = unit:GetPlot():GetWorkingCity()
	player:AcquireCity(plotCity, false, true)
	unit:greatperson()
end
LuaEvents.JFD_CityReclaimed.Add(JFD_RTP_Claims_CityReclaimed)

--JFD_RTP_Claims_DignitariesGranted
local resourceDignitaryID = GameInfoTypes["RESOURCE_JFD_DIGNITARIES"]
function JFD_RTP_Claims_DignitariesGranted(playerID, unit)
	local player = Players[playerID]
	local numDignitaries = defineDefaultExpendedDignitaries
	--Buildings
	for row in GameInfo.Building_JFD_ClaimMods("DignitaryChange <> 0") do
		if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
			numDignitaries = numDignitaries + row.DignitaryChange
		end
	end
	--Policies
	local numCausesFromPolicies = 0
	for row in GameInfo.Policy_JFD_ClaimMods("DignitaryChange <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			numDignitaries = numDignitaries + row.DignitaryChange
		end
	end
	--Reforms
	local numCausesFromReforms = 0
	for row in GameInfo.JFD_Reform_ClaimMods("DignitaryChange <> 0") do
		if JFD_HasReform(playerID, GameInfoTypes[row.ReformType]) then
			numDignitaries = numDignitaries + row.DignitaryChange
		end
	end
	--Traits
	local numCausesFromTraits = 0
	for row in GameInfo.Trait_JFD_ClaimMods("DignitaryChange <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			numDignitaries = numDignitaries + row.DignitaryChange
		end
	end
	player:ChangeNumResourceTotal(resourceDignitaryID, numDignitaries)
	if player:IsHuman() then
		Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))), convertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_JFD_DIGNITARY]", numDignitaries), true)
	end
	unit:greatperson()
end
LuaEvents.JFD_DignitariesGranted.Add(JFD_RTP_Claims_DignitariesGranted)

--JFD_RTP_Claims_MagistratesGranted
local resourceMagistrateID = GameInfoTypes["RESOURCE_MAGISTRATES"]
function JFD_RTP_Claims_MagistratesGranted(playerID, unit)
	local player = Players[playerID]
	local numMagistrates = defineDefaultExpendedMagistrates
	--Buildings
	for row in GameInfo.Building_JFD_ClaimMods("MagistrateChange <> 0") do
		if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
			numMagistrates = numMagistrates + row.MagistrateChange
		end
	end
	--Policies
	local numCausesFromPolicies = 0
	for row in GameInfo.Policy_JFD_ClaimMods("MagistrateChange <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			numMagistrates = numMagistrates + row.MagistrateChange
		end
	end
	--Reforms
	local numCausesFromReforms = 0
	for row in GameInfo.JFD_Reform_ClaimMods("MagistrateChange <> 0") do
		if JFD_HasReform(playerID, GameInfoTypes[row.ReformType]) then
			numMagistrates = numMagistrates + row.MagistrateChange
		end
	end
	--Traits
	local numCausesFromTraits = 0
	for row in GameInfo.Trait_JFD_ClaimMods("MagistrateChange <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			numMagistrates = numMagistrates + row.MagistrateChange
		end
	end
	player:ChangeNumResourceTotal(resourceMagistrateID, numMagistrates)
	if player:IsHuman() then
		Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))), convertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_MAGISTRATES]", numMagistrates), true)
	end
	unit:greatperson()
end
LuaEvents.JFD_MagistratesGranted.Add(JFD_RTP_Claims_MagistratesGranted)

--JFD_RTP_Claims_GreatPersonExpended
local unitClassDignitaryID  = GameInfoTypes["UNITCLASS_JFD_GREAT_DIGNITARY"]
local unitClassMagistrateID = GameInfoTypes["UNITCLASS_JFD_GREAT_MAGISTRATE"]
function JFD_RTP_Claims_GreatPersonExpended(playerID, unitID, unitTypeID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsHuman()) then return end
	local unit = player:GetUnitByID(unitID) 
	if unit:GetUnitClassType() == unitClassDignitaryID then
		local hex = ToHexFromGrid(Vector2(plotX, plotY))
		if player:IsHuman() then 
			Events.GameplayFX(hex.x, hex.y, -1) 
			Events.AudioPlay2DSound("AS2D_SOUND_JFD_GREAT_DIGNITARY")
		end	
	elseif unit:GetUnitClassType() == unitClassMagistrateID then
		local hex = ToHexFromGrid(Vector2(plotX, plotY))
		if player:IsHuman() then 
			Events.GameplayFX(hex.x, hex.y, -1) 
			Events.AudioPlay2DSound("AS2D_SOUND_JFD_GREAT_MAGISTRATE")
		end	
	end
end
GameEvents.GreatPersonExpended.Add(JFD_RTP_Claims_GreatPersonExpended)
-------------------
-- MISSION
-------------------
--JFD_RTP_Claims_MissionStart
local missionAssimilateCityID	= GameInfoTypes["MISSION_JFD_ASSIMILATE_CITY"]
local missionDignitariesID		= GameInfoTypes["MISSION_JFD_DIGNITARIES"]
local missionMagistratesID		= GameInfoTypes["MISSION_JFD_MAGISTRATES"]
local missionReclaimCityID		= GameInfoTypes["MISSION_JFD_RECLAIM_CITY"]
function JFD_RTP_Claims_MissionStart(playerID, unitID, missionID, data1, data2, flags, turn)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if missionID == missionDignitariesID then
		LuaEvents.JFD_DignitariesGranted(playerID, unit)
		return CUSTOM_MISSION_ACTION
	elseif missionID == missionMagistratesID then
		LuaEvents.JFD_MagistratesGranted(playerID, unit)
		return CUSTOM_MISSION_ACTION
	elseif missionID == missionAssimilateCityID then
		LuaEvents.JFD_CityAssimilated(playerID, unit)
		return CUSTOM_MISSION_ACTION
	elseif missionID == missionReclaimCityID then
		LuaEvents.JFD_CityReclaimed(playerID, unit)
		return CUSTOM_MISSION_ACTION
	end
	return CUSTOM_MISSION_NO_ACTION
end
GameEvents.CustomMissionStart.Add(JFD_RTP_Claims_MissionStart)

--JFD_RTP_Claims_MissionComplete
function JFD_RTP_Claims_MissionComplete(playerID, unitID, missionID, data1, data2, flags, turn)
    local player = Players[playerID]
    if (missionID == missionAssimilateCityID 
	or missionID == missionDignitariesID 
	or missionID == missionMagistratesID
	or missionID == missionReclaimCityID) then 
	return true end
	return false
end
GameEvents.CustomMissionCompleted.Add(JFD_RTP_Claims_MissionComplete)
--=======================================================================================================================
--=======================================================================================================================