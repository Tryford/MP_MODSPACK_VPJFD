-- JFD_CID_Crimes_Functions
-- Author: JFD
-- DateCreated: 11/6/2015 8:07:59 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("IconSupport")
include("JFD_CIDUtilities.lua")
include("JFD_CID_CrimesUtils.lua")
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingCrimeCore			= JFD_GetUserSetting("JFD_CID_CRIMES_CORE") == 1
local userSettingCrimeCoreOrganized = JFD_GetUserSetting("JFD_CID_CRIMES_CORE_ORGANIZED") == 1
local userSettingCrimeResolution    = JFD_GetUserSetting("JFD_CID_CRIMES_RESOLUTION_ADDITIONS_CRIMINAL_COURT") == 1
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local activePlayerID 				= Game.GetActivePlayer()
local activePlayer 					= Players[activePlayerID]
local activePlayerTeam 				= Teams[activePlayer:GetTeam()]
local convertTextKey 				= Locale.ConvertTextKey
local mathFloor 					= math.floor
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
-- CRIME
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Crimes
function JFD_CID_Crimes(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	for city in player:Cities() do
		local crimes = Sukritact_GetCrimeValue(playerID, city)
		for _, crime in ipairs(crimes) do 
			local crimeID = nil
			local yieldID = crime.YieldID
			local yieldLosses = mathFloor(crime.YieldLoss)
			for row in GameInfo.Yields_JFD_CrimeTypes("YieldType = '" .. GameInfo.Yields[yieldID].Type .. "'") do
				crimeID = GameInfoTypes[row.CrimeType]
				break
			end
			local crime = GameInfo.JFD_Crimes[crimeID]
			city:SetNumRealBuilding(GameInfoTypes[crime.BuildingType], yieldLosses, true)
		end
	end
end
if userSettingCrimeCore then
	GameEvents.PlayerDoTurn.Add(JFD_CID_Crimes)
end
------------------------------------------------------------------------------------------------------------------------
-- ORGANIZED CRIME
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Crimes_OrganizedCrimes
function JFD_CID_Crimes_OrganizedCrimes(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	for city in player:Cities() do
		for organizedCrime in GameInfo.JFD_OrganizedCrimes() do
			local buildingID = GameInfoTypes[organizedCrime.BuildingType]
			local organizedCrimeID = organizedCrime.ID
			if JFD_HasOrganizedCrime(playerID, city, organizedCrimeID) then
				if (not city:IsHasBuilding(buildingID)) then
					city:SetNumRealBuilding(buildingID, 1, true)
					LuaEvents.JFD_OrganizedCrimeEmerges(playerID, city, organizedCrimeID)
					if player:IsHuman() then
						JFD_SendNotification(activePlayerID, "NOTIFICATION_SPY_WAS_KILLED", Locale.ConvertTextKey(organizedCrime.NotificationDesc, city:GetName()), Locale.ConvertTextKey(organizedCrime.NotificationShortDesc, city:GetName()), false, city:GetX(), city:GetY())
						Events.AudioPlay2DSound("AS2D_EVENT_NOTIFICATION_BAD")
					end
				end
			else
				if city:HasBuilding(buildingID) then
					city:SetNumRealBuilding(buildingID, 0)
				end
			end
		end
	end
end
if userSettingCrimeCoreOrganized then
	GameEvents.PlayerDoTurn.Add(JFD_CID_Crimes_OrganizedCrimes)
end
--=======================================================================================================================
--=======================================================================================================================