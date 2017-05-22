-- JFD_RTP_Epithets_Events
-- Author: JFD
-- DateCreated: 1/22/2016 7:17:21 PM
--=======================================================================================================================
print("JFD's Epithets Events: loaded")
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("FLuaVector.lua");
include("JFD_RTP_EpithetsUtils.lua");
--=======================================================================================================================
-- Pagan Events
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local activePlayerID = Game.GetActivePlayer()
local activePlayer	 = Players[activePlayerID]
local eraClassicalID = GameInfoTypes["ERA_CLASSICAL"]
local eraMedievalID	 = GameInfoTypes["ERA_MEDIEVAL"]
local mathCeil 		 = math.ceil
--------------------------------------------------------------------------------------------------------------------------
--  Epithets: Cache of Treasures
--------------------------------------------------------------------------------------------------------------------------
local epithetFortunateID = GameInfoTypes["EPITHET_JFD_FORTUNATE"]
local Event_JFD_RTP_Epithets_CacheTreasure = {}
	Event_JFD_RTP_Epithets_CacheTreasure.Name = "TXT_KEY_EVENT_JFD_EPITHETS_CACHE_TREASURE"
	Event_JFD_RTP_Epithets_CacheTreasure.Desc = "TXT_KEY_EVENT_JFD_EPITHETS_CACHE_TREASURE_DESC"
	Event_JFD_RTP_Epithets_CacheTreasure.EventImage = 'Event_CacheTreasure.dds'
	Event_JFD_RTP_Epithets_CacheTreasure.Weight = 5
	Event_JFD_RTP_Epithets_CacheTreasure.CanFunc = (
		function(player)			
			if load(player, "Event_JFD_RTP_Epithets_CacheTreasure") == true then return false end
			Event_JFD_RTP_Epithets_CacheTreasure.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EPITHETS_CACHE_TREASURE_DESC")
			return true
		end
		)
	Event_JFD_RTP_Epithets_CacheTreasure.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RTP_Epithets_CacheTreasure.Outcomes[1] = {}
	Event_JFD_RTP_Epithets_CacheTreasure.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_EPITHETS_CACHE_TREASURE_OUTCOME_1"
	Event_JFD_RTP_Epithets_CacheTreasure.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_EPITHETS_CACHE_TREASURE_OUTCOME_RESULT_1"
	Event_JFD_RTP_Epithets_CacheTreasure.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local goldReward = JFD_GetEraAdjustedValue(playerID, mathCeil(50*iMod))
			Event_JFD_RTP_Epithets_CacheTreasure.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EPITHETS_CACHE_TREASURE_OUTCOME_RESULT_1", goldReward)
			return true
		end
		)
	Event_JFD_RTP_Epithets_CacheTreasure.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldReward = JFD_GetEraAdjustedValue(playerID, mathCeil(50*iMod))
			player:ChangeGold(goldReward)
			JFD_SetHasEpithet(playerID, epithetFortunateID, true, false)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_EPITHETS_CACHE_TREASURE_OUTCOME_RESULT_1_NOTIFICATION", player:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EPITHETS_CACHE_TREASURE"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_EPITHETS_CACHE_TREASURE_1", player:GetName()))
			save(player, "Event_JFD_RTP_Epithets_CacheTreasure", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RTP_Epithets_CacheTreasure.Outcomes[2] = {}
	Event_JFD_RTP_Epithets_CacheTreasure.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_EPITHETS_CACHE_TREASURE_OUTCOME_2"
	Event_JFD_RTP_Epithets_CacheTreasure.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_EPITHETS_CACHE_TREASURE_OUTCOME_RESULT_2"
	Event_JFD_RTP_Epithets_CacheTreasure.Outcomes[2].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil(20*iMod))
			Event_JFD_RTP_Epithets_CacheTreasure.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EPITHETS_CACHE_TREASURE_OUTCOME_RESULT_2", cultureReward)
			return true
		end
		)
	Event_JFD_RTP_Epithets_CacheTreasure.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil(20*iMod))
			player:ChangeJONSCulture(cultureReward)
			JFD_SetHasEpithet(playerID, epithetFortunateID, true, false)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_EPITHETS_CACHE_TREASURE_OUTCOME_RESULT_2_NOTIFICATION", player:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EPITHETS_CACHE_TREASURE"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_EPITHETS_CACHE_TREASURE_1", player:GetName(), player:GetCivilizationShortDescription()))
			save(player, "Event_JFD_RTP_Epithets_CacheTreasure", true)
		end)

tEvents.Event_JFD_RTP_Epithets_CacheTreasure = Event_JFD_RTP_Epithets_CacheTreasure
--------------------------------------------------------------------------------------------------------------------------
--  Epithets: Innocent Execution
--------------------------------------------------------------------------------------------------------------------------
local epithetFairID = GameInfoTypes["EPITHET_JFD_FAIR"]
local Event_JFD_RTP_Epithets_InnocentExecution = {}
	Event_JFD_RTP_Epithets_InnocentExecution.Name = "TXT_KEY_EVENT_JFD_EPITHETS_INNOCENT_EXECUTION"
	Event_JFD_RTP_Epithets_InnocentExecution.Desc = "TXT_KEY_EVENT_JFD_EPITHETS_INNOCENT_EXECUTION_DESC"
	Event_JFD_RTP_Epithets_InnocentExecution.EventImage = 'Event_InnocentExecution.dds'
	Event_JFD_RTP_Epithets_InnocentExecution.Weight = 5
	Event_JFD_RTP_Epithets_InnocentExecution.CanFunc = (
		function(player)			
			if player:GetCurrentEra() < eraClassicalID then return false end
			if load(player, "Event_JFD_RTP_Epithets_InnocentExecution") == true then return false end
			Event_JFD_RTP_Epithets_InnocentExecution.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EPITHETS_INNOCENT_EXECUTION_DESC")
			return true
		end
		)
	Event_JFD_RTP_Epithets_InnocentExecution.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RTP_Epithets_InnocentExecution.Outcomes[1] = {}
	Event_JFD_RTP_Epithets_InnocentExecution.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_EPITHETS_INNOCENT_EXECUTION_OUTCOME_1"
	Event_JFD_RTP_Epithets_InnocentExecution.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_EPITHETS_INNOCENT_EXECUTION_OUTCOME_RESULT_1"
	Event_JFD_RTP_Epithets_InnocentExecution.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local goldenAgeReward = JFD_GetEraAdjustedValue(playerID, mathCeil(50*iMod))
			Event_JFD_RTP_Epithets_InnocentExecution.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EPITHETS_INNOCENT_EXECUTION_OUTCOME_RESULT_1", goldenAgeReward)
			return true
		end
		)
	Event_JFD_RTP_Epithets_InnocentExecution.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldenAgeReward = JFD_GetEraAdjustedValue(playerID, mathCeil(50*iMod))
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_EPITHETS_INNOCENT_EXECUTION_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EPITHETS_INNOCENT_EXECUTION"))
			save(player, "Event_JFD_RTP_Epithets_InnocentExecution", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RTP_Epithets_InnocentExecution.Outcomes[2] = {}
	Event_JFD_RTP_Epithets_InnocentExecution.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_EPITHETS_INNOCENT_EXECUTION_OUTCOME_2"
	Event_JFD_RTP_Epithets_InnocentExecution.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_EPITHETS_INNOCENT_EXECUTION_OUTCOME_RESULT_2"
	Event_JFD_RTP_Epithets_InnocentExecution.Outcomes[2].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			Event_JFD_RTP_Epithets_InnocentExecution.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EPITHETS_INNOCENT_EXECUTION_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFD_RTP_Epithets_InnocentExecution.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil(30*iMod))
			player:GetCapitalCity():ChangeResistanceTurns(1)
			player:GetCapitalCity():ChangeWeLoveTheKingDayCounter(25)
			JFD_SetHasEpithet(playerID, epithetFairID, true, false)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_EPITHETS_INNOCENT_EXECUTION_OUTCOME_RESULT_2_NOTIFICATION", player:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EPITHETS_INNOCENT_EXECUTION"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_EPITHETS_INNOCENT_EXECUTION_2", player:GetName(), player:GetCivilizationShortDescription()))
			save(player, "Event_JFD_RTP_Epithets_InnocentExecution", true)
		end)

tEvents.Event_JFD_RTP_Epithets_InnocentExecution = Event_JFD_RTP_Epithets_InnocentExecution
--------------------------------------------------------------------------------------------------------------------------
--  Epithets: Spousal Rumours
--------------------------------------------------------------------------------------------------------------------------
local epithetChasteID = GameInfoTypes["EPITHET_JFD_CHASTE"]
local epithetHomosexualID = GameInfoTypes["EPITHET_JFD_HOMOSEXUAL"]
local Event_JFD_RTP_Epithets_SpousalRumours = {}
	Event_JFD_RTP_Epithets_SpousalRumours.Name = "TXT_KEY_EVENT_JFD_EPITHETS_SPOUSAL_RUMOURS"
	Event_JFD_RTP_Epithets_SpousalRumours.Desc = "TXT_KEY_EVENT_JFD_EPITHETS_SPOUSAL_RUMOURS_DESC"
	Event_JFD_RTP_Epithets_SpousalRumours.EventImage = 'Event_SpousalRumours.dds'
	Event_JFD_RTP_Epithets_SpousalRumours.Weight = 5
	Event_JFD_RTP_Epithets_SpousalRumours.CanFunc = (
		function(player)			
			if load(player, "Event_JFD_RTP_Epithets_SpousalRumours") == true then return false end
			if player:GetCurrentEra() < eraMedievalID then return false end
			if (not player:HasStateReligion()) then return false end
			Event_JFD_RTP_Epithets_SpousalRumours.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EPITHETS_SPOUSAL_RUMOURS_DESC")
			return true
		end
		)
	Event_JFD_RTP_Epithets_SpousalRumours.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RTP_Epithets_SpousalRumours.Outcomes[1] = {}
	Event_JFD_RTP_Epithets_SpousalRumours.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_EPITHETS_SPOUSAL_RUMOURS_OUTCOME_1"
	Event_JFD_RTP_Epithets_SpousalRumours.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_EPITHETS_SPOUSAL_RUMOURS_OUTCOME_RESULT_1"
	Event_JFD_RTP_Epithets_SpousalRumours.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
			Event_JFD_RTP_Epithets_SpousalRumours.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EPITHETS_SPOUSAL_RUMOURS_OUTCOME_RESULT_1", cultureReward)
			return true
		end
		)
	Event_JFD_RTP_Epithets_SpousalRumours.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
			player:ChangeJONSCulture(cultureReward)
			JFD_SetHasEpithet(playerID, epithetHomosexualID, true, false)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_EPITHETS_SPOUSAL_RUMOURS_OUTCOME_RESULT_1_NOTIFICATION", player:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EPITHETS_SPOUSAL_RUMOURS"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_EPITHETS_SPOUSAL_RUMOURS_1", player:GetName(), player:GetCivilizationShortDescription()))
			save(player, "Event_JFD_RTP_Epithets_SpousalRumours", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RTP_Epithets_SpousalRumours.Outcomes[2] = {}
	Event_JFD_RTP_Epithets_SpousalRumours.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_EPITHETS_SPOUSAL_RUMOURS_OUTCOME_2"
	Event_JFD_RTP_Epithets_SpousalRumours.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_EPITHETS_SPOUSAL_RUMOURS_OUTCOME_RESULT_2"
	Event_JFD_RTP_Epithets_SpousalRumours.Outcomes[2].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(5*iMod))
			Event_JFD_RTP_Epithets_SpousalRumours.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EPITHETS_SPOUSAL_RUMOURS_OUTCOME_RESULT_2", pietyReward)
			return true
		end
		)
	Event_JFD_RTP_Epithets_SpousalRumours.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(5*iMod))
			player:ChangePiety(pietyReward)
			JFD_SetHasEpithet(playerID, epithetChasteID, true, false)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_EPITHETS_SPOUSAL_RUMOURS_OUTCOME_RESULT_2_NOTIFICATION", player:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EPITHETS_SPOUSAL_RUMOURS"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_EPITHETS_SPOUSAL_RUMOURS_2", player:GetName(), player:GetCivilizationShortDescription()))
			save(player, "Event_JFD_RTP_Epithets_SpousalRumours", true)
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_RTP_Epithets_SpousalRumours.Outcomes[3] = {}
	Event_JFD_RTP_Epithets_SpousalRumours.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_EPITHETS_SPOUSAL_RUMOURS_OUTCOME_3"
	Event_JFD_RTP_Epithets_SpousalRumours.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_EPITHETS_SPOUSAL_RUMOURS_OUTCOME_RESULT_3"
	Event_JFD_RTP_Epithets_SpousalRumours.Outcomes[3].CanFunc = (
		function(player)			
			Event_JFD_RTP_Epithets_SpousalRumours.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EPITHETS_SPOUSAL_RUMOURS_OUTCOME_RESULT_3")
			return true
		end
		)
	Event_JFD_RTP_Epithets_SpousalRumours.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_EPITHETS_SPOUSAL_RUMOURS_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EPITHETS_SPOUSAL_RUMOURS"))
			save(player, "Event_JFD_RTP_Epithets_SpousalRumours", true)
		end)

tEvents.Event_JFD_RTP_Epithets_SpousalRumours = Event_JFD_RTP_Epithets_SpousalRumours
--=======================================================================================================================
--=======================================================================================================================
