-- JFD_CID_Health_Events
-- Author: JFD
-- DateCreated: 11/10/2015 1:25:07 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_CID_HealthUtils.lua")
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingHealthCore = JFD_GetUserSetting("JFD_CID_HEALTH_CORE") == 1
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILITIES
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetEraAdjustedValue
local mathCeil = math.ceil
function JFD_GetEraAdjustedValue(playerID, num)
	local player = Players[playerID]
	local currentEraID = player:GetCurrentEra()
	local eraMod = GameInfo.Eras[currentEraID].ResearchAgreementCost
	return mathCeil(num * eraMod/100)
end 

-- JFD_SendWorldEvent
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- EVENTS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local eraIndustrialID	   = GameInfoTypes["ERA_INDUSTRIAL"]
local eraMedievalID		   = GameInfoTypes["ERA_MEDIEVAL"]
local eraRenaissanceID	   = GameInfoTypes["ERA_RENAISSANCE"]
local resourceMagistrateID = GameInfoTypes["RESOURCE_MAGISTRATES"]
--------------------------------------------------------------------------------------------------------------------------
-- Health: Siege Sickness
--------------------------------------------------------------------------------------------------------------------------
local eventSiegeSicknessCity = nil
local Event_JFD_CID_Health_SiegePlague = {}
	Event_JFD_CID_Health_SiegePlague.Name = "TXT_KEY_EVENT_JFD_CID_HEALTH_SIEGE_PLAGUE"
	Event_JFD_CID_Health_SiegePlague.Desc = "TXT_KEY_EVENT_JFD_CID_HEALTH_SIEGE_PLAGUE_DESC"
	Event_JFD_CID_Health_SiegePlague.EventImage = "Event_SiegePlague.dds"
	Event_JFD_CID_Health_SiegePlague.Weight = 5
	Event_JFD_CID_Health_SiegePlague.CanFunc = (
		function(player)	
			local playerID = player:GetID()
			for city in player:Cities() do
				if (city:GetDamage() > city:GetMaxHitPoints()/2) then
					eventSiegeSicknessCity = city
					break
				end
			end
			if (not eventSiegeSicknessCity) then return false end
			Event_JFD_CID_Health_SiegePlague.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_HEALTH_SIEGE_PLAGUE_DESC", eventSiegeSicknessCity:GetName())
			return true
		end
		)
	Event_JFD_CID_Health_SiegePlague.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CID_Health_SiegePlague.Outcomes[1] = {}
	Event_JFD_CID_Health_SiegePlague.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_CID_HEALTH_SIEGE_PLAGUE_OUTCOME_1"
	Event_JFD_CID_Health_SiegePlague.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_CID_HEALTH_SIEGE_PLAGUE_OUTCOME_RESULT_1"
	Event_JFD_CID_Health_SiegePlague.Outcomes[1].Weight = 5
	Event_JFD_CID_Health_SiegePlague.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			Event_JFD_CID_Health_SiegePlague.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_HEALTH_SIEGE_PLAGUE_OUTCOME_RESULT_1", eventSiegeSicknessCity:GetName())
			return true
		end
		)
	Event_JFD_CID_Health_SiegePlague.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			JFD_ChangeNumPlagueTurns(eventSiegeSicknessCity, 10)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_HEALTH_SIEGE_PLAGUE_OUTCOME_RESULT_1_NOTIFICATION", eventSiegeSicknessCity:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_HEALTH_SIEGE_PLAGUE"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CID_Health_SiegePlague.Outcomes[2] = {}
	Event_JFD_CID_Health_SiegePlague.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_CID_HEALTH_SIEGE_PLAGUE_OUTCOME_2"
	Event_JFD_CID_Health_SiegePlague.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_CID_HEALTH_SIEGE_PLAGUE_OUTCOME_RESULT_2"
	Event_JFD_CID_Health_SiegePlague.Outcomes[2].Weight = 5
	Event_JFD_CID_Health_SiegePlague.Outcomes[2].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			if (not eventSiegeSicknessCity:GetGarrisonedUnit()) then return false end
			Event_JFD_CID_Health_SiegePlague.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_HEALTH_SIEGE_PLAGUE_OUTCOME_RESULT_2", eventSiegeSicknessCity:GetName())
			return true
		end
		)
	Event_JFD_CID_Health_SiegePlague.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			eventSiegeSicknessCity:GetGarrisonedUnit():Kill(-1)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_HEALTH_SIEGE_PLAGUE_OUTCOME_RESULT_2_NOTIFICATION", eventSiegeSicknessCity:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_HEALTH_SIEGE_PLAGUE"))
		end)

tEvents.Event_JFD_CID_Health_SiegePlague = Event_JFD_CID_Health_SiegePlague
--=======================================================================================================================
--=======================================================================================================================


