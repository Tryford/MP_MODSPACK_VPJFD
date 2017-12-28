-- JFD_CID_Crimes_Functions
-- Author: JFD
-- DateCreated: 11/6/2015 8:07:59 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_CID_CrimesUtils.lua")
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingCIDCrimeCore				 = (Game.GetUserSetting("JFD_CID_CRIMES_CORE") == 1)
local userSettingCIDCrimeCoreOrganized		 = (Game.GetUserSetting("JFD_CID_CRIMES_CORE_ORGANIZED") == 1)
local userSettingCIDCrimeCoreOrganizedMinPop = Game.GetUserSetting("JFD_CID_CRIMES_CORE_ORGANIZED_MIN_POPULATION_THRESHOLD") 
local userSettingCIDCrimeResolution		     = (Game.GetUserSetting("JFD_CID_CRIMES_RESOLUTION_ADDITIONS_CRIMINAL_COURT") == 1)
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- CRIME
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Crimes_PlayerDoTurn
local yieldCrimeID	   = GameInfoTypes["YIELD_JFD_CRIME"]
local yieldHappinessID = GameInfoTypes["YIELD_HAPPINESS"]
function JFD_CID_Crimes_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	for city in player:Cities() do
		local crimes = Sukritact_GetCrimeValue(playerID, city)
		for _, crime in ipairs(crimes) do 
			local crimeID = nil
			local yieldID = crime.YieldID
			local yieldLosses = math.floor(crime.YieldLoss)
			if yieldID == yieldHappinessID then
				city:SetYieldFromCrime(yieldCrimeID, yieldLosses*-1)
			else
				city:SetYieldFromCrime(yieldID, yieldLosses*-1)
			end
		end
		--Organized Crimes
		local validOrganizedCrimeID = player:GetValidOrganizedCrimeID(city) or -1
		for row in GameInfo.JFD_OrganizedCrimes() do
			if yieldID == yieldHappinessID then
				city:SetYieldModifierFromCrime(yieldCrimeID, 0)	
			else
				city:SetYieldModifierFromCrime(GameInfoTypes[row.YieldType], 0)	
			end
		end
		if (city:GetPopulation() >= userSettingCIDCrimeCoreOrganizedMinPop and validOrganizedCrimeID > -1) then
			local organizedCrime = GameInfo.JFD_OrganizedCrimes[validOrganizedCrimeID]
			local organizedCrimeThreshold = player:GetOrganizedCrimeThreshold(city)
			local organizedCrimeMod = math.max((player:GetOrganizedCrimeValue(city, validOrganizedCrimeID)-organizedCrimeThreshold),0)
			if (not organizedCrime.CrimeType) then return end
			local crime = GameInfo.JFD_Crimes[organizedCrime.CrimeType]
			if organizedCrime.YieldType == "YIELD_HAPPINESS" then
				city:SetYieldModifierFromCrime(yieldCrimeID, (organizedCrimeMod*-1))
			else
				city:SetYieldModifierFromCrime(GameInfoTypes[organizedCrime.YieldType], (organizedCrimeMod*-1))
			end
			if city:GetOrganizedCrime() == -1 then
				LuaEvents.JFD_OrganizedCrimeEmerges(playerID, city, validOrganizedCrimeID)
				if player:IsHuman() then
					JFD_SendNotification(playerID, "NOTIFICATION_JFD_ORGANIZED_CRIME", Locale.ConvertTextKey("TXT_KEY_JFD_ORGANIZED_CRIME_EMERGES_NOTIFICATION", crime.IconString, crime.Description, city:GetName(), organizedCrime.NotificationDesc), Locale.ConvertTextKey("TXT_KEY_JFD_ORGANIZED_CRIME_EMERGES_NOTIFICATION_SHORT", city:GetName()), false, city:GetX(), city:GetY())
					Events.AudioPlay2DSound("AS2D_EVENT_NOTIFICATION_BAD")
				end
			end
			city:SetOrganizedCrime(validOrganizedCrimeID)
		else
			if city:GetOrganizedCrime() ~= -1 then
				local organizedCrime = GameInfo.JFD_OrganizedCrimes[city:GetOrganizedCrime()]
				local crime = GameInfo.JFD_Crimes[organizedCrime.CrimeType]
				if player:IsHuman() then
					JFD_SendNotification(playerID, "NOTIFICATION_JFD_ORGANIZED_CRIME", Locale.ConvertTextKey("TXT_KEY_JFD_ORGANIZED_CRIME_DISPERSES_NOTIFICATION", crime.IconString, crime.Description, city:GetName()), Locale.ConvertTextKey("TXT_KEY_JFD_ORGANIZED_CRIME_DISPERSES_NOTIFICATION_SHORT", city:GetName()), false, city:GetX(), city:GetY())
					Events.AudioPlay2DSound("AS2D_EVENT_NOTIFICATION_GOOD")
				end
				city:SetOrganizedCrime(-1)
			end
		end
	end
end
if userSettingCIDCrimeCore then
	GameEvents.PlayerDoTurn.Add(JFD_CID_Crimes_PlayerDoTurn)
end
--=======================================================================================================================
--=======================================================================================================================