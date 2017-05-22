-- JFD_RTP_Piety_Events
-- Author: JFD
-- DateCreated: 7/22/2014 2:12:09 PM
--=======================================================================================================================
print("JFD's Piety Events: loaded")
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("FLuaVector.lua");
include("JFD_PietyUtils.lua");
--=======================================================================================================================
-- Pagan Events
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local activePlayerID 	= Game.GetActivePlayer()
local activePlayer		= Players[activePlayerID]
local eraRenaissanceID 	= GameInfoTypes["ERA_RENAISSANCE"]
local eraModernID 		= GameInfoTypes["ERA_MODERN"]
local mathCeil 			= math.ceil
--------------------------------------------------------------------------------------------------------------------------
--  Pagan: Bad Omen
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_RTP_Piety_BadOmen = {}
	Event_JFD_RTP_Piety_BadOmen.Name = "TXT_KEY_EVENT_JFD_BAD_OMEN_PIETY"
	Event_JFD_RTP_Piety_BadOmen.Desc = "TXT_KEY_EVENT_JFD_BAD_OMEN_PIETY_DESC"
	Event_JFD_RTP_Piety_BadOmen.Weight = 10
	Event_JFD_RTP_Piety_BadOmen.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			if (not player:IsPagan()) then return false end
			local badOmen = "TXT_KEY_EVENT_JFD_BAD_OMEN_PIETY_" .. GetRandom(1, 5) .. "_DESC"
			Event_JFD_RTP_Piety_BadOmen.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAD_OMEN_PIETY_DESC", badOmen)
			return true
		end
		)
	Event_JFD_RTP_Piety_BadOmen.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RTP_Piety_BadOmen.Outcomes[1] = {}
	Event_JFD_RTP_Piety_BadOmen.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_BAD_OMEN_PIETY_OUTCOME_1"
	Event_JFD_RTP_Piety_BadOmen.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_BAD_OMEN_PIETY_OUTCOME_RESULT_1"
	Event_JFD_RTP_Piety_BadOmen.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local faithCost = JFD_GetEraAdjustedValue(playerID, mathCeil(15*iMod))
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil(25*iMod))
			if player:GetFaith() < faithCost then return false end
			Event_JFD_RTP_Piety_BadOmen.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAD_OMEN_PIETY_OUTCOME_RESULT_1", faithCost, faithReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_BadOmen.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local faithCost = JFD_GetEraAdjustedValue(playerID, mathCeil(15*iMod))
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil(25*iMod))
			player:ChangeFaith(-faithCost)
			if GetRandom(1, 100) <= 30 then
				player:ChangeFaith(faithReward)
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BAD_OMEN_PIETY_OUTCOME_RESULT_1_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAD_OMEN_PIETY"))
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BAD_OMEN_PIETY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAD_OMEN_PIETY"))
			end
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RTP_Piety_BadOmen.Outcomes[2] = {}
	Event_JFD_RTP_Piety_BadOmen.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_BAD_OMEN_PIETY_OUTCOME_1"
	Event_JFD_RTP_Piety_BadOmen.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_BAD_OMEN_PIETY_OUTCOME_RESULT_2"
	Event_JFD_RTP_Piety_BadOmen.Outcomes[2].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local growthCost = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil(25*iMod))
			if player:GetCapitalCity():GetFood() < growthCost then return false end
			Event_JFD_RTP_Piety_BadOmen.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAD_OMEN_PIETY_OUTCOME_RESULT_2", growthCost, faithReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_BadOmen.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local growthCost = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil(25*iMod))
			player:GetCapitalCity():ChangeFood(-growthCost)
			if GetRandom(1, 100) <= 90 then
				player:ChangeFaith(faithReward)
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BAD_OMEN_PIETY_OUTCOME_RESULT_1_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAD_OMEN_PIETY"))
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BAD_OMEN_PIETY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAD_OMEN_PIETY"))
			end
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_RTP_Piety_BadOmen.Outcomes[3] = {}
	Event_JFD_RTP_Piety_BadOmen.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_BAD_OMEN_PIETY_OUTCOME_1"
	Event_JFD_RTP_Piety_BadOmen.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_BAD_OMEN_PIETY_OUTCOME_RESULT_3"
	Event_JFD_RTP_Piety_BadOmen.Outcomes[3].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local cultureCost = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil(25*iMod))
			if player:GetJONSCulture() < cultureCost then return false end
			Event_JFD_RTP_Piety_BadOmen.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAD_OMEN_PIETY_OUTCOME_RESULT_3", cultureCost, faithReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_BadOmen.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local cultureCost = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil(25*iMod))
			player:ChangeJONSCulture(-cultureCost)
			if GetRandom(1, 100) <= 70 then
				player:ChangeFaith(faithReward)
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BAD_OMEN_PIETY_OUTCOME_RESULT_1_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAD_OMEN_PIETY"))
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BAD_OMEN_PIETY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAD_OMEN_PIETY"))
			end
		end)
	--=========================================================
	-- Outcome 4
	--=========================================================
	Event_JFD_RTP_Piety_BadOmen.Outcomes[4] = {}
	Event_JFD_RTP_Piety_BadOmen.Outcomes[4].Name = "TXT_KEY_EVENT_JFD_BAD_OMEN_PIETY_OUTCOME_1"
	Event_JFD_RTP_Piety_BadOmen.Outcomes[4].Desc = "TXT_KEY_EVENT_JFD_BAD_OMEN_PIETY_OUTCOME_RESULT_4"
	Event_JFD_RTP_Piety_BadOmen.Outcomes[4].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(40*iMod))
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil(25*iMod))
			if player:GetGold() < goldCost then return false end
			Event_JFD_RTP_Piety_BadOmen.Outcomes[4].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAD_OMEN_PIETY_OUTCOME_RESULT_4", goldCost, faithReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_BadOmen.Outcomes[4].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(40*iMod))
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil(25*iMod))
			player:ChangeGold(-goldCost)
			if GetRandom(1, 100) <= 30 then
				player:ChangeFaith(faithReward)
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BAD_OMEN_PIETY_OUTCOME_RESULT_1_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAD_OMEN_PIETY"))
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BAD_OMEN_PIETY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAD_OMEN_PIETY"))
			end
		end)

tEvents.Event_JFD_RTP_Piety_BadOmen = Event_JFD_RTP_Piety_BadOmen
--------------------------------------------------------------------------------------------------------------------------
--  Pagan: Good Omen
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_RTP_Piety_GoodOmen = {}
	Event_JFD_RTP_Piety_GoodOmen.Name = "TXT_KEY_EVENT_JFD_GOOD_OMEN_PIETY"
	Event_JFD_RTP_Piety_GoodOmen.Desc = "TXT_KEY_EVENT_JFD_GOOD_OMEN_PIETY_DESC"
	Event_JFD_RTP_Piety_GoodOmen.Weight = 10
	Event_JFD_RTP_Piety_GoodOmen.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			if (not player:IsPagan()) then return false end
			local goodOmen = "TXT_KEY_EVENT_JFD_GOOD_OMEN_PIETY_" .. GetRandom(1,5) .. "_DESC"
			Event_JFD_RTP_Piety_GoodOmen.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GOOD_OMEN_PIETY_DESC", goodOmen)
			return true
		end
		)
	Event_JFD_RTP_Piety_GoodOmen.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RTP_Piety_GoodOmen.Outcomes[1] = {}
	Event_JFD_RTP_Piety_GoodOmen.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_GOOD_OMEN_PIETY_OUTCOME_1"
	Event_JFD_RTP_Piety_GoodOmen.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_GOOD_OMEN_PIETY_OUTCOME_RESULT_1"
	Event_JFD_RTP_Piety_GoodOmen.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local goldenAgeReward = JFD_GetEraAdjustedValue(playerID, mathCeil(50*iMod))
			Event_JFD_RTP_Piety_GoodOmen.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GOOD_OMEN_PIETY_OUTCOME_RESULT_1", goldenAgeReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_GoodOmen.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldenAgeReward = JFD_GetEraAdjustedValue(playerID, mathCeil(50*iMod))
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_GOOD_OMEN_PIETY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GOOD_OMEN_PIETY"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RTP_Piety_GoodOmen.Outcomes[2] = {}
	Event_JFD_RTP_Piety_GoodOmen.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_GOOD_OMEN_PIETY_OUTCOME_2"
	Event_JFD_RTP_Piety_GoodOmen.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_GOOD_OMEN_PIETY_OUTCOME_RESULT_2"
	Event_JFD_RTP_Piety_GoodOmen.Outcomes[2].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil(30*iMod))
			Event_JFD_RTP_Piety_GoodOmen.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GOOD_OMEN_PIETY_OUTCOME_RESULT_2", faithReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_GoodOmen.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil(30*iMod))
			player:ChangeFaith(faithReward)
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_GOOD_OMEN_PIETY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GOOD_OMEN_PIETY"))
		end)
	
tEvents.Event_JFD_RTP_Piety_GoodOmen = Event_JFD_RTP_Piety_GoodOmen
--------------------------------------------------------------------------------------------------------------------------
--  Pagan: Heathen Guard
--------------------------------------------------------------------------------------------------------------------------
local eventHeathenGuardPlayer
local unitPromotionDefendNearCapitalID 	= GameInfoTypes["PROMOTION_DEFEND_NEAR_CAPITAL"]
local Event_JFD_RTP_Piety_HeathenGuard = {}
	Event_JFD_RTP_Piety_HeathenGuard.Name = "TXT_KEY_EVENT_JFD_HEATHEN_GUARD_PIETY"
	Event_JFD_RTP_Piety_HeathenGuard.Desc = "TXT_KEY_EVENT_JFD_HEATHEN_GUARD_PIETY_DESC"
	Event_JFD_RTP_Piety_HeathenGuard.EventImage = 'Event_HeathenGuard.dds'
	Event_JFD_RTP_Piety_HeathenGuard.Weight = 10
	Event_JFD_RTP_Piety_HeathenGuard.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			if (not player:IsPagan()) then return false end
			local garrisonedUnit = player:GetCapitalCity():GetGarrisonedUnit()
			if (not garrisonedUnit) then return false end
			if garrisonedUnit:IsHasPromotion(unitPromotionDefendNearCapitalID) then return false end
			local players = {}
			local count = 1
			for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
				local otherPlayer = Players[otherPlayerID]
				if (otherPlayer:IsAlive() and otherPlayerID ~= playerID and Teams[player:GetTeam()]:IsHasMet(otherPlayer:GetTeam())) then
					players[count] = otherPlayer
					count = count + 1
				end
			end
			eventHeathenGuardPlayer = players[GetRandom(1, #players)]
			if (not eventHeathenGuardPlayer) then return false end
			Event_JFD_RTP_Piety_HeathenGuard.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HEATHEN_GUARD_PIETY_DESC", eventHeathenGuardPlayer:GetName(), eventHeathenGuardPlayer:GetCivilizationShortDescription())
			return true
		end
		)
	Event_JFD_RTP_Piety_HeathenGuard.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RTP_Piety_HeathenGuard.Outcomes[1] = {}
	Event_JFD_RTP_Piety_HeathenGuard.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_HEATHEN_GUARD_PIETY_OUTCOME_1"
	Event_JFD_RTP_Piety_HeathenGuard.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_HEATHEN_GUARD_PIETY_OUTCOME_RESULT_1"
	Event_JFD_RTP_Piety_HeathenGuard.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local garrisonedUnit = player:GetCapitalCity():GetGarrisonedUnit()
			local goldReward = JFD_GetEraAdjustedValue(playerID, mathCeil((33*garrisonedUnit:GetLevel())*iMod))
			Event_JFD_RTP_Piety_HeathenGuard.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HEATHEN_GUARD_PIETY_OUTCOME_RESULT_1", goldReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_HeathenGuard.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local garrisonedUnit = player:GetCapitalCity():GetGarrisonedUnit()
			local goldReward = JFD_GetEraAdjustedValue(playerID, mathCeil((33*garrisonedUnit:GetLevel())*iMod))
			local capitalX = eventHeathenGuardPlayer:GetCapitalCity():GetX()
			local capitalY = eventHeathenGuardPlayer:GetCapitalCity():GetY()
			eventHeathenGuardPlayer:InitUnit(garrisonedUnit:GetUnitType(), capitalX, capitalY):ChangeLevel(garrisonedUnit:GetLevel())
			player:ChangeGold(goldReward)
			garrisonedUnit:Kill(false, -1)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_HEATHEN_GUARD_PIETY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HEATHEN_GUARD_PIETY"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RTP_Piety_HeathenGuard.Outcomes[2] = {}
	Event_JFD_RTP_Piety_HeathenGuard.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_HEATHEN_GUARD_PIETY_OUTCOME_2"
	Event_JFD_RTP_Piety_HeathenGuard.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_HEATHEN_GUARD_PIETY_OUTCOME_RESULT_2"
	Event_JFD_RTP_Piety_HeathenGuard.Outcomes[2].CanFunc = (
		function(player)			
			Event_JFD_RTP_Piety_HeathenGuard.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HEATHEN_GUARD_PIETY_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFD_RTP_Piety_HeathenGuard.Outcomes[2].DoFunc = (
		function(player) 
			local garrisonedUnit = player:GetCapitalCity():GetGarrisonedUnit()
			garrisonedUnit:SetHasPromotion(unitPromotionDefendNearCapitalID, true)
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_HEATHEN_GUARD_PIETY_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HEATHEN_GUARD_PIETY"))
		end)
	
tEvents.Event_JFD_RTP_Piety_HeathenGuard = Event_JFD_RTP_Piety_HeathenGuard
--------------------------------------------------------------------------------------------------------------------------
-- Pagan: Call for State Religion
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_RTP_Piety_CallStateReligion = {}
	Event_JFD_RTP_Piety_CallStateReligion.Name = "TXT_KEY_EVENT_JFD_CALL_FOR_STATE_RELIGION_PIETY"
	Event_JFD_RTP_Piety_CallStateReligion.Desc = "TXT_KEY_EVENT_JFD_CALL_FOR_STATE_RELIGION_PIETY_DESC"
	Event_JFD_RTP_Piety_CallStateReligion.EventImage = 'Event_CallStateReligion.dds'
	Event_JFD_RTP_Piety_CallStateReligion.Weight = 10
	Event_JFD_RTP_Piety_CallStateReligion.CanFunc = (
		function(player)			
			if player:HasStateReligion() then return false end
			if player:GetMajorityReligion() <= 0 then return false end
			if player:GetCurrentEra() >= eraRenaissanceID then return false end
			Event_JFD_RTP_Piety_CallStateReligion.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CALL_FOR_STATE_RELIGION_PIETY_DESC", Game.GetReligionName(player:GetMajorityReligion()))
			return true
		end
		)
	Event_JFD_RTP_Piety_CallStateReligion.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RTP_Piety_CallStateReligion.Outcomes[1] = {}
	Event_JFD_RTP_Piety_CallStateReligion.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_CALL_FOR_STATE_RELIGION_PIETY_OUTCOME_1"
	Event_JFD_RTP_Piety_CallStateReligion.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_CALL_FOR_STATE_RELIGION_PIETY_OUTCOME_RESULT_1"
	Event_JFD_RTP_Piety_CallStateReligion.Outcomes[1].CanFunc = (
		function(player)
			Event_JFD_RTP_Piety_CallStateReligion.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CALL_FOR_STATE_RELIGION_PIETY_OUTCOME_RESULT_1", Game.GetReligionName(player:GetMajorityReligion()))
			return true
		end
		)
	Event_JFD_RTP_Piety_CallStateReligion.Outcomes[1].DoFunc = (
		function(player) 
			player:SetStateReligion(player:GetMajorityReligion())
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RTP_Piety_CallStateReligion.Outcomes[2] = {}
	Event_JFD_RTP_Piety_CallStateReligion.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_CALL_FOR_STATE_RELIGION_PIETY_OUTCOME_2"
	Event_JFD_RTP_Piety_CallStateReligion.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_CALL_FOR_STATE_RELIGION_PIETY_OUTCOME_RESULT_2"
	Event_JFD_RTP_Piety_CallStateReligion.Outcomes[2].CanFunc = (
		function(player)	
			Event_JFD_RTP_Piety_CallStateReligion.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CALL_FOR_STATE_RELIGION_PIETY_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFD_RTP_Piety_CallStateReligion.Outcomes[2].DoFunc = (
		function(player) 
		end)
	
tEvents.Event_JFD_RTP_Piety_CallStateReligion = Event_JFD_RTP_Piety_CallStateReligion
--=======================================================================================================================
-- Generic Religious Events
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local eraIndustrialID	= GameInfoTypes["ERA_INDUSTRIAL"]
local eraMedievalID 	= GameInfoTypes["ERA_MEDIEVAL"]
local eraRenaissanceID 	= GameInfoTypes["ERA_RENAISSANCE"]
local mathCeil 			= math.ceil
local mathFloor 		= math.floor
local playerBarbarianID = Players[63]
local religionID		= nil
--------------------------------------------------------------------------------------------------------------------------
--  Religion: Apocalyptic Threat
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_RTP_Piety_Apocalypse = {}
	Event_JFD_RTP_Piety_Apocalypse.Name = "TXT_KEY_EVENT_JFD_APOCALYPTIC_THREAT_PIETY"
	Event_JFD_RTP_Piety_Apocalypse.Desc = "TXT_KEY_EVENT_JFD_APOCALYPTIC_THREAT_PIETY_DESC"
	Event_JFD_RTP_Piety_Apocalypse.EventImage = 'Event_Apocalypse.dds'
	Event_JFD_RTP_Piety_Apocalypse.Weight = 5
	Event_JFD_RTP_Piety_Apocalypse.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			if (not player:HasStateReligion()) then return false end
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(10 * iMod))
			if player:GetPiety() < pietyCost then return false end
			Event_JFD_RTP_Piety_Apocalypse.Weight = JFD_GetPietyEventWeight(playerID, true)
			return true
		end
		)
	Event_JFD_RTP_Piety_Apocalypse.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RTP_Piety_Apocalypse.Outcomes[1] = {}
	Event_JFD_RTP_Piety_Apocalypse.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_APOCALYPTIC_THREAT_PIETY_OUTCOME_1"
	Event_JFD_RTP_Piety_Apocalypse.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_APOCALYPTIC_THREAT_PIETY_OUTCOME_RESULT_1"
	Event_JFD_RTP_Piety_Apocalypse.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(9*iMod))
			local faithCost = JFD_GetEraAdjustedValue(playerID, mathCeil(47*iMod))
			if player:GetFaith() < faithCost then return false end
			Event_JFD_RTP_Piety_Apocalypse.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_APOCALYPTIC_THREAT_PIETY_OUTCOME_RESULT_1", faithCost, pietyReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_Apocalypse.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local stateReligionID = JFD_GetStateReligion(playerID)
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(9*iMod))
			local faithCost = JFD_GetEraAdjustedValue(playerID, mathCeil(47*iMod))
			player:ChangePiety(pietyReward)
			player:ChangeFaith(-faithCost)
			ConvertPlayerReligion(player, stateReligionID, 33)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_APOCALYPTIC_THREAT_PIETY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_APOCALYPTIC_THREAT_PIETY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_APOCALYPTIC_THREAT_1", player:GetCivilizationDescription())) 
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RTP_Piety_Apocalypse.Outcomes[2] = {}
	Event_JFD_RTP_Piety_Apocalypse.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_APOCALYPTIC_THREAT_PIETY_OUTCOME_2"
	Event_JFD_RTP_Piety_Apocalypse.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_APOCALYPTIC_THREAT_PIETY_OUTCOME_RESULT_2"
	Event_JFD_RTP_Piety_Apocalypse.Outcomes[2].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(76*iMod))
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil((30*iMod)*pietyLevelMod))
			if player:GetGold() < goldCost then return false end
			Event_JFD_RTP_Piety_Apocalypse.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_APOCALYPTIC_THREAT_PIETY_OUTCOME_RESULT_2", goldCost, pietyReward, faithReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_Apocalypse.Outcomes[2].DoFunc = (
		function(player)
			local playerID = player:GetID()
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(76*iMod))
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil((30*iMod)*pietyLevelMod))
			player:ChangeGold(-goldCost) 
			player:ChangePiety(pietyReward)
			player:ChangeFaith(faithReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_APOCALYPTIC_THREAT_PIETY_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_APOCALYPTIC_THREAT_PIETY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_APOCALYPTIC_THREAT_2", player:GetName(), player:GetCivilizationShortDescription())) 
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_RTP_Piety_Apocalypse.Outcomes[3] = {}
	Event_JFD_RTP_Piety_Apocalypse.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_APOCALYPTIC_THREAT_PIETY_OUTCOME_3"
	Event_JFD_RTP_Piety_Apocalypse.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_APOCALYPTIC_THREAT_PIETY_OUTCOME_RESULT_3"
	Event_JFD_RTP_Piety_Apocalypse.Outcomes[3].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(8*iMod))
			if player:GetPiety() < pietyCost then return false end
			Event_JFD_RTP_Piety_Apocalypse.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_APOCALYPTIC_THREAT_PIETY_OUTCOME_RESULT_3", pietyCost)
			return true
		end
		)
	Event_JFD_RTP_Piety_Apocalypse.Outcomes[3].DoFunc = (
		function(player)
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(8*iMod))
			player:ChangePiety(-pietyCost)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_APOCALYPTIC_THREAT_PIETY_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_APOCALYPTIC_THREAT_PIETY"))
		end)

tEvents.Event_JFD_RTP_Piety_Apocalypse = Event_JFD_RTP_Piety_Apocalypse
--------------------------------------------------------------------------------------------------------------------------
--  Religion: Philosopher Questions Religious Doctrine
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_RTP_Piety_Philosopher = {}
	Event_JFD_RTP_Piety_Philosopher.Name = "TXT_KEY_EVENT_JFD_PHILOSOPHER_QUESTIONS_RELIGION_PIETY"
	Event_JFD_RTP_Piety_Philosopher.Desc = "TXT_KEY_EVENT_JFD_PHILOSOPHER_QUESTIONS_RELIGION_PIETY_DESC"
	Event_JFD_RTP_Piety_Philosopher.EventImage = 'Event_Philosopher.dds'
	Event_JFD_RTP_Piety_Philosopher.Weight = 5
	Event_JFD_RTP_Piety_Philosopher.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			if (not player:HasStateReligion()) then return false end
			Event_JFD_RTP_Piety_Philosopher.Weight = JFD_GetPietyEventWeight(playerID, true)
			return true
		end
		)
	Event_JFD_RTP_Piety_Philosopher.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RTP_Piety_Philosopher.Outcomes[1] = {}
	Event_JFD_RTP_Piety_Philosopher.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_PHILOSOPHER_QUESTIONS_RELIGION_PIETY_OUTCOME_1"
	Event_JFD_RTP_Piety_Philosopher.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_PHILOSOPHER_QUESTIONS_RELIGION_PIETY_OUTCOME_RESULT_1"
	Event_JFD_RTP_Piety_Philosopher.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(16 * iMod))
			if player:GetPiety() < pietyCost then return false end
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil((20*iMod)*pietyLevelMod))
			Event_JFD_RTP_Piety_Philosopher.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PHILOSOPHER_QUESTIONS_RELIGION_PIETY_OUTCOME_RESULT_1", pietyCost, cultureReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_Philosopher.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(16*iMod))
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil((20*iMod)*pietyLevelMod))
			player:ChangePiety(-pietyCost)
			player:ChangeJONSCulture(cultureReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_PHILOSOPHER_QUESTIONS_RELIGION_PIETY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PHILOSOPHER_QUESTIONS_RELIGION_PIETY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_PHILOSOPHER_QUESTIONS_RELIGION_1", player:GetCivilizationAdjective(), player:GetName(), player:GetCivilizationShortDescription()))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RTP_Piety_Philosopher.Outcomes[2] = {}
	Event_JFD_RTP_Piety_Philosopher.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_PHILOSOPHER_QUESTIONS_RELIGION_PIETY_OUTCOME_2"
	Event_JFD_RTP_Piety_Philosopher.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_PHILOSOPHER_QUESTIONS_RELIGION_PIETY_OUTCOME_RESULT_2"
	Event_JFD_RTP_Piety_Philosopher.Outcomes[2].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
			if player:GetPiety() < pietyCost then return false end
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil((30*iMod)*pietyLevelMod))
			Event_JFD_RTP_Piety_Philosopher.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PHILOSOPHER_QUESTIONS_RELIGION_PIETY_OUTCOME_RESULT_2", pietyCost, faithReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_Philosopher.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil((30*iMod)*pietyLevelMod))
			player:ChangePiety(-pietyCost)
			player:ChangeFaith(faithReward)
			if GetRandom(1, 2) == 1 then
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_PHILOSOPHER_QUESTIONS_RELIGION_PIETY_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PHILOSOPHER_QUESTIONS_RELIGION_PIETY"))
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_PHILOSOPHER_QUESTIONS_RELIGION_PIETY_OUTCOME_RESULT_2_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PHILOSOPHER_QUESTIONS_RELIGION_PIETY"))
			end		
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_PHILOSOPHER_QUESTIONS_RELIGION_2", player:GetCivilizationAdjective(), player:GetName(), player:GetCivilizationShortDescription()))
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_RTP_Piety_Philosopher.Outcomes[3] = {}
	Event_JFD_RTP_Piety_Philosopher.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_PHILOSOPHER_QUESTIONS_RELIGION_PIETY_OUTCOME_3"
	Event_JFD_RTP_Piety_Philosopher.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_PHILOSOPHER_QUESTIONS_RELIGION_PIETY_OUTCOME_RESULT_3"
	Event_JFD_RTP_Piety_Philosopher.Outcomes[3].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local cultureCost = JFD_GetEraAdjustedValue(playerID, mathCeil(68*iMod))
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil((30*iMod)*pietyLevelMod))
			if player:GetJONSCulture() < cultureCost then return false end
			Event_JFD_RTP_Piety_Philosopher.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PHILOSOPHER_QUESTIONS_RELIGION_PIETY_OUTCOME_RESULT_3", cultureCost, pietyReward, faithReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_Philosopher.Outcomes[3].DoFunc = (
		function(player)
			local playerID = player:GetID()
			local cultureCost = JFD_GetEraAdjustedValue(playerID, mathCeil(68*iMod))
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil((30*iMod)*pietyLevelMod))
			player:ChangeJONSCulture(-cultureCost) 
			player:ChangeFaith(faithReward)
			player:ChangePiety(pietyReward)
			if GetRandom(1, 100) <= 50 then 
				local stateReligionID = JFD_GetStateReligion(playerID)
				for city in player:Cities() do
					city:ConvertPercentFollowers(stateReligionID, -1, 20)
				end
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_PHILOSOPHER_QUESTIONS_RELIGION_PIETY_OUTCOME_RESULT_3_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PHILOSOPHER_QUESTIONS_RELIGION_PIETY"))
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_PHILOSOPHER_QUESTIONS_RELIGION_PIETY_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PHILOSOPHER_QUESTIONS_RELIGION_PIETY"))
			end
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_PHILOSOPHER_QUESTIONS_RELIGION_3", player:GetCivilizationAdjective(), player:GetCivilizationDescription())) 
		end)

tEvents.Event_JFD_RTP_Piety_Philosopher = Event_JFD_RTP_Piety_Philosopher
--------------------------------------------------------------------------------------------------------------------------
--  Religion: Religious Corruption
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_RTP_Piety_Corruption = {}
	Event_JFD_RTP_Piety_Corruption.Name = "TXT_KEY_EVENT_JFD_RELIGIOUS_CORRUPTION_PIETY"
	Event_JFD_RTP_Piety_Corruption.Desc = "TXT_KEY_EVENT_JFD_RELIGIOUS_CORRUPTION_PIETY_DESC"
	Event_JFD_RTP_Piety_Corruption.Weight = 5
	Event_JFD_RTP_Piety_Corruption.EventImage = 'Event_Corruption.dds'
	Event_JFD_RTP_Piety_Corruption.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local currentEraID = player:GetCurrentEra()
			if currentEraID < eraMedievalID or currentEraID >= eraModernID then return false end
			if (not player:HasStateReligion()) then return false end
			Event_JFD_RTP_Piety_Corruption.Weight = JFD_GetPietyEventWeight(playerID, true)
			return true
		end
		)
	Event_JFD_RTP_Piety_Corruption.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RTP_Piety_Corruption.Outcomes[1] = {}
	Event_JFD_RTP_Piety_Corruption.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_RELIGIOUS_CORRUPTION_PIETY_OUTCOME_1"
	Event_JFD_RTP_Piety_Corruption.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_RELIGIOUS_CORRUPTION_PIETY_OUTCOME_RESULT_1"
	Event_JFD_RTP_Piety_Corruption.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(20*iMod))
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(176*iMod))
			if player:GetGold() < goldCost then return false end
			Event_JFD_RTP_Piety_Corruption.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RELIGIOUS_CORRUPTION_PIETY_OUTCOME_RESULT_1", goldCost, pietyReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_Corruption.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(20*iMod))
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(176*iMod))
			player:ChangePiety(pietyReward)
			player:ChangeGold(-goldCost)
			if GetRandom(1, 2) == 1 then
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_RELIGIOUS_CORRUPTION_PIETY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RELIGIOUS_CORRUPTION_PIETY"))
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_RELIGIOUS_CORRUPTION_PIETY_OUTCOME_RESULT_1_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RELIGIOUS_CORRUPTION_PIETY"))
			end
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_RELIGIOUS_CORRUPTION_1", player:GetName(), player:GetCivilizationShortDescription(), player:GetCivilizationAdjective()))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RTP_Piety_Corruption.Outcomes[2] = {}
	Event_JFD_RTP_Piety_Corruption.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_RELIGIOUS_CORRUPTION_PIETY_OUTCOME_2"
	Event_JFD_RTP_Piety_Corruption.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_RELIGIOUS_CORRUPTION_PIETY_OUTCOME_RESULT_2"
	Event_JFD_RTP_Piety_Corruption.Outcomes[2].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(9*iMod))
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local goldReward = JFD_GetEraAdjustedValue(playerID, mathCeil((30*iMod)*pietyLevelMod))
			if player:GetPiety() < pietyCost then return false end
			Event_JFD_RTP_Piety_Corruption.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RELIGIOUS_CORRUPTION_PIETY_OUTCOME_RESULT_2", pietyCost, goldReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_Corruption.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(9*iMod))
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local goldReward = JFD_GetEraAdjustedValue(playerID, mathCeil((30*iMod)*pietyLevelMod))
			player:ChangePiety(-pietyCost)
			player:ChangeGold(goldReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_RELIGIOUS_CORRUPTION_PIETY_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RELIGIOUS_CORRUPTION_PIETY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_RELIGIOUS_CORRUPTION_2", player:GetName(), player:GetCivilizationShortDescription(), player:GetCivilizationAdjective()))
		end)
	
tEvents.Event_JFD_RTP_Piety_Corruption = Event_JFD_RTP_Piety_Corruption
--------------------------------------------------------------------------------------------------------------------------
--  Religion: Court Heretic
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_RTP_Piety_CourtHeretic = {}
	Event_JFD_RTP_Piety_CourtHeretic.Name = "TXT_KEY_EVENT_JFD_COURT_HERETIC_PIETY"
	Event_JFD_RTP_Piety_CourtHeretic.Desc = "TXT_KEY_EVENT_JFD_COURT_HERETIC_PIETY_DESC"
	Event_JFD_RTP_Piety_CourtHeretic.Weight = 5
	Event_JFD_RTP_Piety_CourtHeretic.EventImage = 'Event_CourtHeretic.dds'
	Event_JFD_RTP_Piety_CourtHeretic.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local currentEraID = player:GetCurrentEra()
			if currentEraID < eraMedievalID or currentEraID >= eraModernID then return false end
			if (not player:HasStateReligion()) then return false end
			local demon = "Demons"
			if GetRandom(1, 100) <= 5 then demon = "Daedra" end
			Event_JFD_RTP_Piety_CourtHeretic.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_COURT_HERETIC_PIETY_DESC", demon)
			Event_JFD_RTP_Piety_CourtHeretic.Weight = JFD_GetPietyEventWeight(playerID, true)
			return true
		end
		)
	Event_JFD_RTP_Piety_CourtHeretic.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RTP_Piety_CourtHeretic.Outcomes[1] = {}
	Event_JFD_RTP_Piety_CourtHeretic.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_COURT_HERETIC_PIETY_OUTCOME_1"
	Event_JFD_RTP_Piety_CourtHeretic.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_COURT_HERETIC_PIETY_OUTCOME_RESULT_1"
	Event_JFD_RTP_Piety_CourtHeretic.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local pietyCost = mathCeil(40 * iMod)
			if player:GetPiety() < pietyCost then return false end
			Event_JFD_RTP_Piety_CourtHeretic.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_COURT_HERETIC_PIETY_OUTCOME_RESULT_1", pietyCost)
			return true
		end
		)
	Event_JFD_RTP_Piety_CourtHeretic.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyCost = mathCeil(40 * iMod)
			player:ChangePiety(-pietyCost)
			player:ChangeNumResourceTotal(iMagistrate, 1)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_COURT_HERETIC_PIETY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_COURT_HERETIC_PIETY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_COURT_HERETIC_PIETY_1", player:GetName(), player:GetCivilizationShortDescription()))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RTP_Piety_CourtHeretic.Outcomes[2] = {}
	Event_JFD_RTP_Piety_CourtHeretic.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_COURT_HERETIC_PIETY_OUTCOME_2"
	Event_JFD_RTP_Piety_CourtHeretic.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_COURT_HERETIC_PIETY_OUTCOME_RESULT_2"
	Event_JFD_RTP_Piety_CourtHeretic.Outcomes[2].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(22*iMod))
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(63*iMod))
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil((78*iMod)*pietyLevelMod))
			if player:GetPiety() < pietyCost then return false end
			Event_JFD_RTP_Piety_CourtHeretic.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_COURT_HERETIC_PIETY_OUTCOME_RESULT_2", goldCost, pietyCost, faithReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_CourtHeretic.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(22*iMod))
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(63*iMod))
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil((78*iMod)*pietyLevelMod))
			player:ChangePiety(-pietyCost)
			player:ChangeGold(-goldCost)
			player:ChangeFaith(faithReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_COURT_HERETIC_PIETY_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_COURT_HERETIC_PIETY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_COURT_HERETIC_PIETY_2", player:GetName(), player:GetCivilizationShortDescription()))
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_RTP_Piety_CourtHeretic.Outcomes[3] = {}
	Event_JFD_RTP_Piety_CourtHeretic.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_COURT_HERETIC_PIETY_OUTCOME_3"
	Event_JFD_RTP_Piety_CourtHeretic.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_COURT_HERETIC_PIETY_OUTCOME_RESULT_3"
	Event_JFD_RTP_Piety_CourtHeretic.Outcomes[3].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local faithCost = JFD_GetEraAdjustedValue(playerID, mathCeil(66*iMod))
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(12*iMod))
			if player:GetFaith() < faithCost then return false end
			Event_JFD_RTP_Piety_CourtHeretic.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_COURT_HERETIC_PIETY_OUTCOME_RESULT_3", faithCost, pietyReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_CourtHeretic.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local faithCost = JFD_GetEraAdjustedValue(playerID, mathCeil(66*iMod))
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(12*iMod))
			player:ChangePiety(pietyReward)
			player:ChangeFaith(-faithCost)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_COURT_HERETIC_PIETY_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_COURT_HERETIC_PIETY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_COURT_HERETIC_PIETY_3", player:GetName(), player:GetCivilizationShortDescription()))
		end)
	
tEvents.Event_JFD_RTP_Piety_CourtHeretic = Event_JFD_RTP_Piety_CourtHeretic
--------------------------------------------------------------------------------------------------------------------------
-- Religion: Pagan Uprising
--------------------------------------------------------------------------------------------------------------------------
local unitPromotionPrizeShipsID = GameInfoTypes["PROMOTION_PRIZE_SHIPS"]
local Event_JFD_RTP_Piety_PaganUprising = {}
	Event_JFD_RTP_Piety_PaganUprising.Name = "TXT_KEY_EVENT_JFD_PAGAN_UPRISING_PIETY"
	Event_JFD_RTP_Piety_PaganUprising.Desc = "TXT_KEY_EVENT_JFD_PAGAN_UPRISING_PIETY_DESC"
	Event_JFD_RTP_Piety_PaganUprising.EventImage = 'Event_PaganUprising.dds'
	Event_JFD_RTP_Piety_PaganUprising.Weight = 5
	Event_JFD_RTP_Piety_PaganUprising.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local currentEraID = player:GetCurrentEra()
			if currentEraID < eraMedievalID or currentEraID >= eraModernID then return false end
			if (not player:HasStateReligion()) then return false end
			return true
		end
		)
	Event_JFD_RTP_Piety_PaganUprising.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RTP_Piety_PaganUprising.Outcomes[1] = {}
	Event_JFD_RTP_Piety_PaganUprising.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_PAGAN_UPRISING_PIETY_OUTCOME_1"
	Event_JFD_RTP_Piety_PaganUprising.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_PAGAN_UPRISING_PIETY_OUTCOME_RESULT_1"
	Event_JFD_RTP_Piety_PaganUprising.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local pietyReward = JFD_GetPietyPercent(playerID, 10, true)
			Event_JFD_RTP_Piety_PaganUprising.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PAGAN_UPRISING_PIETY_OUTCOME_RESULT_1", pietyReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_PaganUprising.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyReward = JFD_GetPietyPercent(playerID, 10, true)
			local capitalX = player:GetCapitalCity():GetX()
			local capitalY = player:GetCapitalCity():GetY() + 1
			player:ChangePiety(pietyReward)
			
			local unitToSpawnID = GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")
			if unitToSpawnID then
				local unitOne = playerBarbarianID:InitUnit(unitToSpawnID, capitalX, capitalY)
				local unitTwo = playerBarbarianID:InitUnit(unitToSpawnID, capitalX, capitalY)
				if (unitOne and unitTwo) then
					unitOne:JumpToNearestValidPlot()
					unitTwo:JumpToNearestValidPlot()
					unitOne:SetHasPromotion(unitPromotionPrizeShipsID, true)
					unitTwo:SetHasPromotion(unitPromotionPrizeShipsID, true)
					unitOne:SetName("Wretched Pagan")
					unitTwo:SetName("Mean-spirited Pagan")
				end
			end	
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_PAGAN_UPRISING_PIETY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PAGAN_UPRISING_PIETY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_PAGAN_UPRISING", player:GetCivilizationDescription())) 
		end)
	
tEvents.Event_JFD_RTP_Piety_PaganUprising = Event_JFD_RTP_Piety_PaganUprising
--------------------------------------------------------------------------------------------------------------------------
--  Religion: Witchcraft
--------------------------------------------------------------------------------------------------------------------------
local buildingGrandInquisitionID = GameInfoTypes["BUILDING_JFD_GRAND_INQUISITION"]
local Event_JFD_RTP_Piety_Witchcraft = {}
	Event_JFD_RTP_Piety_Witchcraft.Name = "TXT_KEY_EVENT_JFD_WITCHCRAFT_PIETY"
	Event_JFD_RTP_Piety_Witchcraft.Desc = "TXT_KEY_EVENT_JFD_WITCHCRAFT_PIETY_DESC"
	Event_JFD_RTP_Piety_Witchcraft.EventImage = 'Event_Witchcraft.dds'
	Event_JFD_RTP_Piety_Witchcraft.Weight = 5
	Event_JFD_RTP_Piety_Witchcraft.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local currentEraID = player:GetCurrentEra()
			if (currentEraID < eraMedievalID or currentEraID >= eraModernID) then return false end
			if (not player:HasStateReligion()) then return false end
			if player:GetCurrentResearch() <= -1 then return false end
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(20*iMod))
			if player:GetPiety() < pietyCost then return false end
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(206*iMod))
			if player:GetGold() < goldCost then return false end
			local cultureCost = JFD_GetEraAdjustedValue(playerID, mathCeil(43*iMod))
			if player:GetJONSCulture() < cultureCost then return false end
			Event_JFD_RTP_Piety_Witchcraft.Weight = JFD_GetPietyEventWeight(playerID, true)
			return true
		end
		)
	Event_JFD_RTP_Piety_Witchcraft.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RTP_Piety_Witchcraft.Outcomes[1] = {}
	Event_JFD_RTP_Piety_Witchcraft.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_WITCHCRAFT_PIETY_OUTCOME_1"
	Event_JFD_RTP_Piety_Witchcraft.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_WITCHCRAFT_PIETY_OUTCOME_RESULT_1"
	Event_JFD_RTP_Piety_Witchcraft.Outcomes[1].CanFunc = (
		function(player)			
			if load(player, "Event_JFD_RTP_Piety_Witchcraft") == true then return false end
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(20*iMod))
			Event_JFD_RTP_Piety_Witchcraft.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_WITCHCRAFT_PIETY_OUTCOME_RESULT_1", pietyCost)
			return true
		end
		)
	Event_JFD_RTP_Piety_Witchcraft.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(20*iMod))
			player:ChangePiety(-pietyCost)
			local reward = JFD_GetEraAdjustedValue(playerID, mathCeil((GetRandom(10,25)*iMod)*pietyLevelMod))
			local yieldType = "TXT_KEY_JFD_SCIENCE"
			local getRandom = GetRandom(1, 4)
			if getRandom == 1 or getRandom == 2 then 
				reward = JFD_GetEraAdjustedValue(playerID, mathCeil((GetRandom(20,150)*iMod)*pietyLevelMod))
				player:ChangeGold(reward) 
				yieldType = "TXT_KEY_JFD_GOLD" 
			elseif getRandom == 3 then 
				reward = JFD_GetEraAdjustedValue(playerID, mathCeil((GetRandom(20, 50)*iMod)*pietyLevelMod))
				player:ChangeJONSCulture(reward) 
				yieldType = "TXT_KEY_JFD_CULTURE"
			else  
				LuaEvents.Sukritact_ChangeResearchProgress(playerID, reward)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_WITCHCRAFT_PIETY_OUTCOME_RESULT_1_NOTIFICATION", reward, yieldType), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_WITCHCRAFT_PIETY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_WITCHCRAFT_1", player:GetName(), player:GetCivilizationShortDescription()))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RTP_Piety_Witchcraft.Outcomes[2] = {}
	Event_JFD_RTP_Piety_Witchcraft.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_WITCHCRAFT_PIETY_OUTCOME_2"
	Event_JFD_RTP_Piety_Witchcraft.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_WITCHCRAFT_PIETY_OUTCOME_RESULT_2"
	Event_JFD_RTP_Piety_Witchcraft.Outcomes[2].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			if player:HasBuilding(buildingGrandInquisitionID) then return false end
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(206*iMod))
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(18*iMod))
			Event_JFD_RTP_Piety_Witchcraft.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_WITCHCRAFT_PIETY_OUTCOME_RESULT_2", goldCost, pietyReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_Witchcraft.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(206*iMod))
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(18*iMod))
			player:ChangePiety(pietyReward)
			player:ChangeGold(-goldCost)
			player:GetCapitalCity():SetNumRealBuilding(buildingGrandInquisitionID,1)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_WITCHCRAFT_PIETY_OUTCOME_RESULT_2_NOTIFICATION", player:GetCivilizationAdjective()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_WITCHCRAFT_PIETY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_WITCHCRAFT_2", player:GetName(), player:GetCivilizationDescription()))
			save(player, "Event_JFD_RTP_Piety_Witchcraft", true)	
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_RTP_Piety_Witchcraft.Outcomes[3] = {}
	Event_JFD_RTP_Piety_Witchcraft.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_WITCHCRAFT_PIETY_OUTCOME_3"
	Event_JFD_RTP_Piety_Witchcraft.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_WITCHCRAFT_PIETY_OUTCOME_RESULT_3"
	Event_JFD_RTP_Piety_Witchcraft.Outcomes[3].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local cultureCost = JFD_GetEraAdjustedValue(playerID, mathCeil(43*iMod))
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil(((cultureCost*1.9)*iMod)*pietyLevelMod))
			Event_JFD_RTP_Piety_Witchcraft.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_WITCHCRAFT_PIETY_OUTCOME_RESULT_3", cultureCost, faithReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_Witchcraft.Outcomes[3].DoFunc = (
		function(player)
			local playerID = player:GetID()
			local cultureCost = JFD_GetEraAdjustedValue(playerID, mathCeil(43 * iMod))
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil(((cultureCost*1.9)*iMod)*pietyLevelMod))
			player:ChangeJONSCulture(-cultureCost) 
			player:ChangeFaith(faithReward)
			if GetRandom(1, 2) == 1 then
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_WITCHCRAFT_PIETY_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_WITCHCRAFT_PIETY"))
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_WITCHCRAFT_PIETY_OUTCOME_RESULT_3_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_WITCHCRAFT_PIETY"))
			end
		end)

tEvents.Event_JFD_RTP_Piety_Witchcraft = Event_JFD_RTP_Piety_Witchcraft
--------------------------------------------------------------------------------------------------------------------------
--  Religion: Religious Diaspora
--------------------------------------------------------------------------------------------------------------------------
local eventDiasporaReligionID
local Event_JFD_RTP_Piety_Diaspora = {}
	Event_JFD_RTP_Piety_Diaspora.Name = "TXT_KEY_EVENT_JFD_RELIGIOUS_DIASPORA_PIETY"
	Event_JFD_RTP_Piety_Diaspora.Desc = "TXT_KEY_EVENT_JFD_RELIGIOUS_DIASPORA_PIETY_DESC"
	Event_JFD_RTP_Piety_Diaspora.EventImage = 'Event_Diaspora.dds'
	Event_JFD_RTP_Piety_Diaspora.Weight = 5
	Event_JFD_RTP_Piety_Diaspora.CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local currentEraID = player:GetCurrentEra()
			if currentEraID < eraMedievalID or currentEraID >= eraModernID then return false end
			if (not player:HasStateReligion()) then return false end
			Event_JFD_RTP_Piety_Diaspora.Weight = JFD_GetPietyEventWeight(playerID)
			local stateReligionID = player:GetStateReligion()
			local religions = {}
			local count = 1
			for religion in GameInfo.Religions("ID <> '" .. stateReligionID .. "'") do
				local religionID = religion.ID
				if Game.GetHolyCityForReligion(religionID, -1) then
					religions[count] = religionID
					count = count + 1
				end
			end
			eventDiasporaReligionID = religions[GetRandom(1, #religions)]
			if (not eventDiasporaReligionID) then return false end
			Event_JFD_RTP_Piety_Diaspora.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RELIGIOUS_DIASPORA_PIETY_DESC", Game.GetReligionName(eventDiasporaReligionID))
			return true
		end
		)
	Event_JFD_RTP_Piety_Diaspora.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RTP_Piety_Diaspora.Outcomes[1] = {}
	Event_JFD_RTP_Piety_Diaspora.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_RELIGIOUS_DIASPORA_PIETY_OUTCOME_1"
	Event_JFD_RTP_Piety_Diaspora.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_RELIGIOUS_DIASPORA_PIETY_OUTCOME_RESULT_1"
	Event_JFD_RTP_Piety_Diaspora.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(11*iMod))
			if player:GetPiety() < pietyCost then return false end
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local goldReward = JFD_GetEraAdjustedValue(playerID, mathCeil((104* iMod)*pietyLevelMod))
			Event_JFD_RTP_Piety_Diaspora.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RELIGIOUS_DIASPORA_PIETY_OUTCOME_RESULT_1", pietyCost, Game.GetReligionName(eventDiasporaReligionID), goldReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_Diaspora.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(11*iMod))
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local goldReward = JFD_GetEraAdjustedValue(playerID, mathCeil((104* iMod)*pietyLevelMod))
			JFD_ChangePiety(player:GetID(), -pietyCost)
			player:ChangeGold(goldReward)
			ConvertPlayerReligion(player, eventDiasporaReligionID, 10)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_RELIGIOUS_DIASPORA_PIETY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RELIGIOUS_DIASPORA_PIETY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_RELIGIOUS_DIASPORA_1", Game.GetReligionName(eventDiasporaReligionID), player:GetName(), player:GetCivilizationDescription())) 
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RTP_Piety_Diaspora.Outcomes[2] = {}
	Event_JFD_RTP_Piety_Diaspora.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_RELIGIOUS_DIASPORA_PIETY_OUTCOME_2"
	Event_JFD_RTP_Piety_Diaspora.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_RELIGIOUS_DIASPORA_PIETY_OUTCOME_RESULT_2"
	Event_JFD_RTP_Piety_Diaspora.Outcomes[2].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local goldenAgeCost = mathCeil(((player:GetGoldenAgeProgressMeter()*20)/100)*iMod)
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(12*iMod))
			if player:GetGoldenAgeProgressMeter() < goldenAgeCost then return false end
			Event_JFD_RTP_Piety_Diaspora.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RELIGIOUS_DIASPORA_PIETY_OUTCOME_RESULT_2", goldenAgeCost, pietyReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_Diaspora.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldenAgeCost = mathCeil(((player:GetGoldenAgeProgressMeter()*20)/100)*iMod)
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(12*iMod))
			player:ChangePiety(pietyReward)
			player:ChangeGoldenAgeProgressMeter(-goldenAgeCost)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_RELIGIOUS_DIASPORA_PIETY_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RELIGIOUS_DIASPORA_PIETY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_RELIGIOUS_DIASPORA_2", Game.GetReligionName(eventDiasporaReligionID), player:GetName(), player:GetCivilizationDescription())) 
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_RTP_Piety_Diaspora.Outcomes[3] = {}
	Event_JFD_RTP_Piety_Diaspora.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_RELIGIOUS_DIASPORA_PIETY_OUTCOME_3"
	Event_JFD_RTP_Piety_Diaspora.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_RELIGIOUS_DIASPORA_PIETY_OUTCOME_RESULT_3"
	Event_JFD_RTP_Piety_Diaspora.Outcomes[3].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(12*iMod))
			if player:GetPiety() < pietyCost then return false end
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil((34*iMod)*pietyLevelMod))
			Event_JFD_RTP_Piety_Diaspora.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RELIGIOUS_DIASPORA_PIETY_OUTCOME_RESULT_3", pietyCost, Game.GetReligionName(eventDiasporaReligionID), cultureReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_Diaspora.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(12*iMod))
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil((34*iMod)*pietyLevelMod))
			player:ChangePiety(-pietyCost)
			player:ChangeJONSCulture(cultureReward)
			ConvertPlayerReligion(player, eventDiasporaReligionID, 10)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_RELIGIOUS_DIASPORA_PIETY_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RELIGIOUS_DIASPORA_PIETY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_RELIGIOUS_DIASPORA_2", Game.GetReligionName(eventDiasporaReligionID), player:GetName(), player:GetCivilizationShortDescription())) 
		end)

tEvents.Event_JFD_RTP_Piety_Diaspora = Event_JFD_RTP_Piety_Diaspora
--------------------------------------------------------------------------------------------------------------------------
--  Religion: Voice of God
--------------------------------------------------------------------------------------------------------------------------
local unitPromotionMedicID = GameInfoTypes["PROMOTION_MEDIC"]
local Event_JFD_RTP_Piety_VoiceOfGod = {}
	Event_JFD_RTP_Piety_VoiceOfGod.Name = "TXT_KEY_EVENT_JFD_VOICE_OF_GOD_PIETY"
	Event_JFD_RTP_Piety_VoiceOfGod.Desc = "TXT_KEY_EVENT_JFD_VOICE_OF_GOD_PIETY_DESC"
	Event_JFD_RTP_Piety_VoiceOfGod.EventImage = 'Event_VoiceOfGod.dds'
	Event_JFD_RTP_Piety_VoiceOfGod.Weight = 5
	Event_JFD_RTP_Piety_VoiceOfGod.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local currentEraID = player:GetCurrentEra()
			if currentEraID < eraMedievalID or currentEraID >= eraModernID then return false end
			if (not player:HasStateReligion()) then return false end
			local faithCost = JFD_GetEraAdjustedValue(playerID, mathCeil(34*iMod))
			if player:GetFaith() < faithCost then return false end
			Event_JFD_RTP_Piety_VoiceOfGod.Weight = JFD_GetPietyEventWeight(playerID)
			return true
		end
		)
	Event_JFD_RTP_Piety_VoiceOfGod.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RTP_Piety_VoiceOfGod.Outcomes[1] = {}
	Event_JFD_RTP_Piety_VoiceOfGod.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_VOICE_OF_GOD_PIETY_OUTCOME_1"
	Event_JFD_RTP_Piety_VoiceOfGod.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_VOICE_OF_GOD_PIETY_OUTCOME_RESULT_1"
	Event_JFD_RTP_Piety_VoiceOfGod.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(8*iMod))
			local faithCost = JFD_GetEraAdjustedValue(playerID, mathCeil(34*iMod))
			if player:GetFaith() < faithCost then return false end
			Event_JFD_RTP_Piety_VoiceOfGod.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_VOICE_OF_GOD_PIETY_OUTCOME_RESULT_1", faithCost, pietyReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_VoiceOfGod.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(8*iMod))
			local faithCost = JFD_GetEraAdjustedValue(playerID, mathCeil(34*iMod))
			player:ChangePiety(pietyReward)
			player:ChangeFaith(-faithCost)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_VOICE_OF_GOD_PIETY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_VOICE_OF_GOD_PIETY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_VOICE_OF_GOD_1", player:GetCivilizationDescription())) 
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RTP_Piety_VoiceOfGod.Outcomes[2] = {}
	Event_JFD_RTP_Piety_VoiceOfGod.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_VOICE_OF_GOD_PIETY_OUTCOME_2"
	Event_JFD_RTP_Piety_VoiceOfGod.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_VOICE_OF_GOD_PIETY_OUTCOME_RESULT_2"
	Event_JFD_RTP_Piety_VoiceOfGod.Outcomes[2].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(15*iMod))
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil((37*iMod)*pietyLevelMod))
			if player:GetPiety() < pietyCost then return false end
			Event_JFD_RTP_Piety_VoiceOfGod.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_VOICE_OF_GOD_PIETY_OUTCOME_RESULT_2", pietyCost, faithReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_VoiceOfGod.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(15*iMod))
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil((37*iMod)*pietyLevelMod))
			JFD_ChangePiety(playerID, -pietyCost)
			player:ChangeFaith(faithReward)
			local unitToSpawnID = player:GetSpecificUnitType("UNITCLASS_GREAT_GENERAL")
			if unitToSpawnID then
				local capitalX = player:GetCapitalCity():GetX()
				local capitalY = player:GetCapitalCity():GetY()
				player:InitUnit(unitToSpawnID, capitalX, capitalY):SetHasPromotion(unitPromotionMedicID, true)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_VOICE_OF_GOD_PIETY_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_VOICE_OF_GOD_PIETY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_VOICE_OF_GOD_2", player:GetName(), player:GetCivilizationShortDescription())) 
		end)
	
tEvents.Event_JFD_RTP_Piety_VoiceOfGod = Event_JFD_RTP_Piety_VoiceOfGod
--------------------------------------------------------------------------------------------------------------------------
--  Religion: Temple Destroyed
--------------------------------------------------------------------------------------------------------------------------
local buildingClassTempleID = GameInfoTypes["BUILDINGCLASS_TEMPLE"]
local eventTempleDestroyedCityID
local Event_JFD_RTP_Piety_TempleDestruction = {}
	Event_JFD_RTP_Piety_TempleDestruction.Name = "TXT_KEY_EVENT_JFD_TEMPLE_DESTROYED_PIETY"
	Event_JFD_RTP_Piety_TempleDestruction.Desc = "TXT_KEY_EVENT_JFD_TEMPLE_DESTROYED_PIETY_DESC"
	Event_JFD_RTP_Piety_TempleDestruction.EventImage = 'Event_TempleDestruction.dds'
	Event_JFD_RTP_Piety_TempleDestruction.Weight = 5
	Event_JFD_RTP_Piety_TempleDestruction.CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local currentEraID = player:GetCurrentEra()
			if currentEraID < eraMedievalID or currentEraID >= eraModernID then return false end
			if (not player:HasStateReligion()) then return false end
			Event_JFD_RTP_Piety_TempleDestruction.Weight = JFD_GetPietyEventWeight(playerID, true)
			local cities = {}
			local count = 1
			for city in player:Cities() do
				if city:IsHasBuildingClass(buildingClassTempleID) then
					cities[count] = city:GetID()
					count = count + 1
				end
			end
			eventTempleDestroyedCityID = cities[GetRandom(1, #cities)]
			if (not eventTempleDestroyedCityID) then return false end
			local city = player:GetCityByID(eventTempleDestroyedCityID)
			Event_JFD_RTP_Piety_TempleDestruction.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_TEMPLE_DESTROYED_PIETY_DESC", city:GetName())
			return true
		end
		)
	Event_JFD_RTP_Piety_TempleDestruction.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RTP_Piety_TempleDestruction.Outcomes[1] = {}
	Event_JFD_RTP_Piety_TempleDestruction.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_TEMPLE_DESTROYED_PIETY_OUTCOME_1"
	Event_JFD_RTP_Piety_TempleDestruction.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_TEMPLE_DESTROYED_PIETY_OUTCOME_RESULT_1"
	Event_JFD_RTP_Piety_TempleDestruction.Outcomes[1].CanFunc = (
		function(player)			
			local goldCost = mathCeil(200*iMod)
			if player:GetGold() < goldCost then return false end
			Event_JFD_RTP_Piety_TempleDestruction.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_TEMPLE_DESTROYED_PIETY_OUTCOME_RESULT_1", goldCost)
			return true
		end
		)
	Event_JFD_RTP_Piety_TempleDestruction.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = mathCeil(200*iMod)
			local city = player:GetCityByID(eventTempleDestroyedCityID)
			player:ChangeGold(-goldCost)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_TEMPLE_DESTROYED_PIETY_OUTCOME_RESULT_1_NOTIFICATION", city:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_TEMPLE_DESTROYED_PIETY"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RTP_Piety_TempleDestruction.Outcomes[2] = {}
	Event_JFD_RTP_Piety_TempleDestruction.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_TEMPLE_DESTROYED_PIETY_OUTCOME_2"
	Event_JFD_RTP_Piety_TempleDestruction.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_TEMPLE_DESTROYED_PIETY_OUTCOME_RESULT_2"
	Event_JFD_RTP_Piety_TempleDestruction.Outcomes[2].CanFunc = (
		function(player)			
			local city = player:GetCityByID(eventTempleDestroyedCityID)
			Event_JFD_RTP_Piety_TempleDestruction.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_TEMPLE_DESTROYED_PIETY_OUTCOME_RESULT_2", city:GetName())
			return true
		end
		)
	Event_JFD_RTP_Piety_TempleDestruction.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local city = player:GetCityByID(eventTempleDestroyedCityID)
			local buildingTempleID = player:GetSpecificBuildingType("BUILDINGCLASS_TEMPLE")
			JFD_RemoveBuilding(playerID, city, buildingTempleID)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_TEMPLE_DESTROYED_PIETY_OUTCOME_RESULT_2_NOTIFICATION", city:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_TEMPLE_DESTROYED_PIETY"))
		end)
		
tEvents.Event_JFD_RTP_Piety_TempleDestruction = Event_JFD_RTP_Piety_TempleDestruction
--------------------------------------------------------------------------------------------------------------------------
-- Religion: Miracles
--------------------------------------------------------------------------------------------------------------------------
local eventMiraclesCityID
local Event_JFD_RTP_Piety_Miracles = {}
	Event_JFD_RTP_Piety_Miracles.Name = "TXT_KEY_EVENT_JFD_MIRACLES_PIETY"
	Event_JFD_RTP_Piety_Miracles.Desc = "TXT_KEY_EVENT_JFD_MIRACLES_PIETY_DESC"
	Event_JFD_RTP_Piety_Miracles.EventImage = 'Event_Miracles.dds'
	Event_JFD_RTP_Piety_Miracles.Weight = 7
	Event_JFD_RTP_Piety_Miracles.CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local currentEraID = player:GetCurrentEra()
			if currentEraID < eraMedievalID or currentEraID >= eraModernID then return false end
			if (not player:HasStateReligion()) then return false end
			Event_JFD_RTP_Piety_Miracles.Weight = JFD_GetPietyEventWeight(playerID)
			local cities = {}
			local eventMiraclesCityID = nil
			local count = 1
			for city in player:Cities() do
				cities[count] = city:GetID()
				count = count + 1
			end
			eventMiraclesCityID = cities[GetRandom(1, #cities)]
			if (not eventMiraclesCityID) then return false end
			local city = player:GetCityByID(eventMiraclesCityID)
			local buildingName = nil
			for building in GameInfo.Buildings("Cost > 0") do
				if city:IsHasBuilding(building.ID) then
					buildingName = building.Description
				end
			end
			if (not buildingName) then return false end
			Event_JFD_RTP_Piety_Miracles.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MIRACLES_PIETY_DESC", city:GetName(), buildingName)
			return true
		end
		)
	Event_JFD_RTP_Piety_Miracles.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RTP_Piety_Miracles.Outcomes[1] = {}
	Event_JFD_RTP_Piety_Miracles.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_MIRACLES_PIETY_OUTCOME_1"
	Event_JFD_RTP_Piety_Miracles.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_MIRACLES_PIETY_OUTCOME_RESULT_1"
	Event_JFD_RTP_Piety_Miracles.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(12 * iMod))
			if player:GetPiety() < pietyCost then return false end
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil(29 * iMod * pietyLevelMod))
			Event_JFD_RTP_Piety_Miracles.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MIRACLES_PIETY_OUTCOME_RESULT_1", pietyCost, faithReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_Miracles.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(12 * iMod))
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil(29 * iMod * pietyLevelMod))
			player:ChangePiety(-pietyCost)
			player:ChangeFaith(faithReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_MIRACLES_PIETY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MIRACLES_PIETY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_MIRACLES_1", player:GetName(), player:GetCivilizationDescription())) 
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RTP_Piety_Miracles.Outcomes[2] = {}
	Event_JFD_RTP_Piety_Miracles.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_MIRACLES_PIETY_OUTCOME_2"
	Event_JFD_RTP_Piety_Miracles.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_MIRACLES_PIETY_OUTCOME_RESULT_2"
	Event_JFD_RTP_Piety_Miracles.Outcomes[2].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
			if player:GetPiety() < pietyCost then return false end
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local goldReward = JFD_GetEraAdjustedValue(playerID, mathCeil((47*iMod)*pietyLevelMod))
			Event_JFD_RTP_Piety_Miracles.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MIRACLES_PIETY_OUTCOME_RESULT_2", pietyCost, goldReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_Miracles.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local goldReward = JFD_GetEraAdjustedValue(playerID, mathCeil((47*iMod)*pietyLevelMod))
			JFD_ChangePiety(playerID, -pietyCost)
			player:ChangeGold(goldReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_MIRACLES_PIETY_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MIRACLES_PIETY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_MIRACLES_1", player:GetName(), player:GetCivilizationDescription())) 
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_RTP_Piety_Miracles.Outcomes[3] = {}
	Event_JFD_RTP_Piety_Miracles.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_MIRACLES_PIETY_OUTCOME_3"
	Event_JFD_RTP_Piety_Miracles.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_MIRACLES_PIETY_OUTCOME_RESULT_3"
	Event_JFD_RTP_Piety_Miracles.Outcomes[3].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local faithCost = JFD_GetEraAdjustedValue(playerID, mathCeil(44*iMod))
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(12*iMod))
			if player:GetFaith() < faithCost then return false end
			Event_JFD_RTP_Piety_Miracles.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MIRACLES_PIETY_OUTCOME_RESULT_3", faithCost, pietyReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_Miracles.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local faithCost = JFD_GetEraAdjustedValue(playerID, mathCeil(44*iMod))
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(12*iMod))
			player:ChangePiety(pietyReward)
			player:ChangeFaith(-faithCost)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_MIRACLES_PIETY_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MIRACLES_PIETY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_MIRACLES_3", player:GetName(), player:GetCivilizationDescription())) 
		end)
	
tEvents.Event_JFD_RTP_Piety_Miracles = Event_JFD_RTP_Piety_Miracles
--------------------------------------------------------------------------------------------------------------------------
--  Religion: Relic Peddler
--------------------------------------------------------------------------------------------------------------------------
local greatWorkArtifactID = GameInfoTypes["GREAT_WORK_SLOT_ART_ARTIFACT"]
local greatWorkType 
local Event_JFD_RTP_Piety_Peddler = {}
	Event_JFD_RTP_Piety_Peddler.Name = "TXT_KEY_EVENT_JFD_RELIC_PEDDLER_PIETY"
	Event_JFD_RTP_Piety_Peddler.Desc = "TXT_KEY_EVENT_JFD_RELIC_PEDDLER_PIETY_DESC"
	Event_JFD_RTP_Piety_Peddler.EventImage = 'Event_Peddler.dds'
	Event_JFD_RTP_Piety_Peddler.Weight = 5
	Event_JFD_RTP_Piety_Peddler.CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local currentEraID = player:GetCurrentEra()
			if currentEraID < eraMedievalID or currentEraID >= eraModernID then return false end
			if (not player:HasStateReligion()) then return false end
			if (not player:HasAvailableGreatWorkSlot(greatWorkArtifactID)) then return false end
			Event_JFD_RTP_Piety_Peddler.Weight = JFD_GetPietyEventWeight(playerID)
			greatWorkType = "GREAT_WORK_JFD_RELIC_" .. GetRandom(1,100)
			greatWorkTypeName = "TXT_KEY_ARTIFACT_" .. greatWorkType
			Event_JFD_RTP_Piety_Peddler.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RELIC_PEDDLER_PIETY_DESC", greatWorkTypeName)
			return true
		end
		)
	Event_JFD_RTP_Piety_Peddler.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RTP_Piety_Peddler.Outcomes[1] = {}
	Event_JFD_RTP_Piety_Peddler.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_RELIC_PEDDLER_PIETY_OUTCOME_1"
	Event_JFD_RTP_Piety_Peddler.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_RELIC_PEDDLER_PIETY_OUTCOME_RESULT_1"
	Event_JFD_RTP_Piety_Peddler.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(200*iMod))
			if player:GetGold() < goldCost then return false end
			Event_JFD_RTP_Piety_Peddler.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RELIC_PEDDLER_PIETY_OUTCOME_RESULT_1", goldCost)
			return true
		end
		)
	Event_JFD_RTP_Piety_Peddler.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(200*iMod))
			player:ChangeGold(-goldCost)
			if GetRandom(1,100) <= 80 then
				local greatWorkIndexID = Game.CreateGreatWork(GameInfoTypes[greatWorkType], playerID, player:GetCurrentEra(), "Unknown Origin")
				local city = player:GetCityOfClosestGreatWorkSlot(player:GetCapitalCity():GetX(), player:GetCapitalCity():GetY(), greatWorkArtifactID)
				local building = GameInfo.Buildings[player:GetBuildingOfClosestGreatWorkSlot(city:GetX(), city:GetY(), greatWorkArtifactID)]
				local buildingClass = building.BuildingClass
				local buildingClassID = GameInfoTypes[buildingClass]
				local buildingClassSlotIndex = 0
				if (city:GetNumGreatWorksInBuilding(buildingClassID) >= 1 and building.GreatWorkCount == 2) then
					buildingClassSlotIndex = 1
				elseif (city:GetNumGreatWorksInBuilding(buildingClassID) >= 2 and building.GreatWorkCount == 3) then
					buildingClassSlotIndex = 2
				elseif (city:GetNumGreatWorksInBuilding(buildingClassID) >= 3 and building.GreatWorkCount == 4) then
					buildingClassSlotIndex = 3
				end
				if buildingClassID then city:SetBuildingGreatWork(buildingClassID, buildingClassSlotIndex, greatWorkIndexID) end
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_RELIC_PEDDLER_PIETY_OUTCOME_RESULT_1_NOTIFICATION", greatWorkTypeName), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RELIC_PEDDLER_PIETY"))
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_RELIC_PEDDLER_PIETY_OUTCOME_RESULT_1_ALT_NOTIFICATION", greatWorkTypeName), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RELIC_PEDDLER_PIETY"))
			end
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RTP_Piety_Peddler.Outcomes[2] = {}
	Event_JFD_RTP_Piety_Peddler.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_RELIC_PEDDLER_PIETY_OUTCOME_2"
	Event_JFD_RTP_Piety_Peddler.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_RELIC_PEDDLER_PIETY_OUTCOME_RESULT_2"
	Event_JFD_RTP_Piety_Peddler.Outcomes[2].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(12 * iMod))
			Event_JFD_RTP_Piety_Peddler.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RELIC_PEDDLER_PIETY_OUTCOME_RESULT_2", pietyReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_Peddler.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(12 * iMod))
			player:ChangePiety(pietyReward)			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_RELIC_PEDDLER_PIETY_OUTCOME_RESULT_2_NOTIFICATION", greatWorkTypeName), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_RELIC_PEDDLER_PIETY"))
		end)
	
tEvents.Event_JFD_RTP_Piety_Peddler = Event_JFD_RTP_Piety_Peddler
--------------------------------------------------------------------------------------------------------------------------
--  Religion: Homosexual Priest
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_RTP_Piety_HomoPriest = {}
	Event_JFD_RTP_Piety_HomoPriest.Name = "TXT_KEY_EVENT_JFD_HOMOSEXUAL_PRIEST_PIETY"
	Event_JFD_RTP_Piety_HomoPriest.Desc = "TXT_KEY_EVENT_JFD_HOMOSEXUAL_PRIEST_PIETY_DESC"
	Event_JFD_RTP_Piety_HomoPriest.EventImage = 'Event_StSebastian.dds'
	Event_JFD_RTP_Piety_HomoPriest.Weight = 5
	Event_JFD_RTP_Piety_HomoPriest.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local currentEraID = player:GetCurrentEra()
			if currentEraID < eraMedievalID or currentEraID >= eraModernID then return false end
			if (not player:HasStateReligion()) then return false end
			return true
		end
		)
	Event_JFD_RTP_Piety_HomoPriest.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RTP_Piety_HomoPriest.Outcomes[1] = {}
	Event_JFD_RTP_Piety_HomoPriest.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_HOMOSEXUAL_PRIEST_PIETY_OUTCOME_1"
	Event_JFD_RTP_Piety_HomoPriest.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_HOMOSEXUAL_PRIEST_PIETY_OUTCOME_RESULT_1"
	Event_JFD_RTP_Piety_HomoPriest.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
			if player:GetPiety() < pietyCost then return false end
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil((24*iMod)*pietyLevelMod))
			Event_JFD_RTP_Piety_HomoPriest.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HOMOSEXUAL_PRIEST_PIETY_OUTCOME_RESULT_1", pietyCost, cultureReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_HomoPriest.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil((24*iMod)*pietyLevelMod))
			JFD_ChangePiety(playerID, -pietyCost)
			player:ChangeJONSCulture(cultureReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_HOMOSEXUAL_PRIEST_PIETY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HOMOSEXUAL_PRIEST_PIETY"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RTP_Piety_HomoPriest.Outcomes[2] = {}
	Event_JFD_RTP_Piety_HomoPriest.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_HOMOSEXUAL_PRIEST_PIETY_OUTCOME_2"
	Event_JFD_RTP_Piety_HomoPriest.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_HOMOSEXUAL_PRIEST_PIETY_OUTCOME_RESULT_2"
	Event_JFD_RTP_Piety_HomoPriest.Outcomes[2].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local cultureCost = JFD_GetEraAdjustedValue(playerID, mathCeil(22*iMod))
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(8*iMod))
			if player:GetJONSCulture() < cultureCost then return false end
			Event_JFD_RTP_Piety_HomoPriest.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HOMOSEXUAL_PRIEST_PIETY_OUTCOME_RESULT_2", cultureCost, pietyReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_HomoPriest.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local cultureCost = JFD_GetEraAdjustedValue(playerID, mathCeil(22*iMod))
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(8*iMod))
			JFD_ChangePiety(playerID, pietyReward)
			player:ChangeJONSCulture(-cultureCost)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_HOMOSEXUAL_PRIEST_PIETY_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HOMOSEXUAL_PRIEST_PIETY"))
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_RTP_Piety_HomoPriest.Outcomes[3] = {}
	Event_JFD_RTP_Piety_HomoPriest.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_HOMOSEXUAL_PRIEST_PIETY_OUTCOME_3"
	Event_JFD_RTP_Piety_HomoPriest.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_HOMOSEXUAL_PRIEST_PIETY_OUTCOME_RESULT_3"
	Event_JFD_RTP_Piety_HomoPriest.Outcomes[3].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(12*iMod))
			if player:GetPiety() < pietyCost then return false end
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil((36*iMod)*pietyLevelMod))
			Event_JFD_RTP_Piety_HomoPriest.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HOMOSEXUAL_PRIEST_PIETY_OUTCOME_RESULT_3", pietyCost, faithReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_HomoPriest.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(12*iMod))
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil((36*iMod)*pietyLevelMod))
			player:ChangePiety(-pietyCost)
			player:ChangeFaith(faithReward)
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_HOMOSEXUAL_PRIEST_PIETY_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HOMOSEXUAL_PRIEST_PIETY"))
		end)
	
tEvents.Event_JFD_RTP_Piety_HomoPriest = Event_JFD_RTP_Piety_HomoPriest
--------------------------------------------------------------------------------------------------------------------------
-- Religion: Benedictine Monk
--------------------------------------------------------------------------------------------------------------------------
local buildingMonasteryID 	= GameInfoTypes["BUILDING_MONASTERY"]
local buildingClassShrineID = GameInfoTypes["BUILDINGCLASS_SHRINE"]
local Event_JFD_RTP_Piety_BenedictineMonk = {}
	Event_JFD_RTP_Piety_BenedictineMonk.Name = "TXT_KEY_EVENT_JFD_BENEDICTINE_MONK"
	Event_JFD_RTP_Piety_BenedictineMonk.Desc = "TXT_KEY_EVENT_JFD_BENEDICTINE_MONK_DESC"
	Event_JFD_RTP_Piety_BenedictineMonk.EventImage = 'Event_BenedictineMonk.dds'
	Event_JFD_RTP_Piety_BenedictineMonk.Weight = 5
	Event_JFD_RTP_Piety_BenedictineMonk.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			if load(player, "Event_JFD_RTP_Piety_BenedictineMonk") == true then return false end
			local currentEraID = player:GetCurrentEra()
			if currentEraID < eraMedievalID or currentEraID >= eraModernID then return false end
			if (not player:HasStateReligion()) then return false end
			if player:GetBuildingClassCount(buildingClassShrineID) < player:GetNumCities() then return false end
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(13*iMod))
			Event_JFD_RTP_Piety_BenedictineMonk.Weight = JFD_GetPietyEventWeight(playerID)
			return true
		end
		)
	Event_JFD_RTP_Piety_BenedictineMonk.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RTP_Piety_BenedictineMonk.Outcomes[1] = {}
	Event_JFD_RTP_Piety_BenedictineMonk.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_BENEDICTINE_MONK_OUTCOME_1"
	Event_JFD_RTP_Piety_BenedictineMonk.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_BENEDICTINE_MONK_OUTCOME_RESULT_1"
	Event_JFD_RTP_Piety_BenedictineMonk.Outcomes[1].Weight = 5
	Event_JFD_RTP_Piety_BenedictineMonk.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(13*iMod))
			if player:GetPiety() < pietyCost then return false end 
			Event_JFD_RTP_Piety_BenedictineMonk.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BENEDICTINE_MONK_OUTCOME_RESULT_1", pietyCost)
			return true
		end
		)
	Event_JFD_RTP_Piety_BenedictineMonk.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(13*iMod))
			player:ChangePiety(-pietyCost)
			player:GetCapitalCity():SetNumFreeBuilding(buildingMonasteryID, 1)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BENEDICTINE_MONK_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BENEDICTINE_MONK"))
			save(player, "Event_JFD_RTP_Piety_BenedictineMonk", true)	
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RTP_Piety_BenedictineMonk.Outcomes[2] = {}
	Event_JFD_RTP_Piety_BenedictineMonk.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_BENEDICTINE_MONK_OUTCOME_2"
	Event_JFD_RTP_Piety_BenedictineMonk.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_BENEDICTINE_MONK_OUTCOME_RESULT_2"
	Event_JFD_RTP_Piety_BenedictineMonk.Outcomes[2].Weight = 3
	Event_JFD_RTP_Piety_BenedictineMonk.Outcomes[2].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(15*iMod))
			Event_JFD_RTP_Piety_BenedictineMonk.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BENEDICTINE_MONK_OUTCOME_RESULT_2", pietyReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_BenedictineMonk.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(15*iMod))
			player:ChangePiety(pietyReward)
			save(player, "Event_JFD_RTP_Piety_BenedictineMonk", true)	
		end)
	
tEvents.Event_JFD_RTP_Piety_BenedictineMonk = Event_JFD_RTP_Piety_BenedictineMonk
--------------------------------------------------------------------------------------------------------------------------
-- Religion: Pagan Festival
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_RTP_Piety_PaganFestival = {}
	Event_JFD_RTP_Piety_PaganFestival.Name = "TXT_KEY_EVENT_JFD_PAGAN_FESTIVAL"
	Event_JFD_RTP_Piety_PaganFestival.Desc = "TXT_KEY_EVENT_JFD_PAGAN_FESTIVAL_DESC"
	Event_JFD_RTP_Piety_PaganFestival.EventImage = 'Event_PaganFestival.dds'
	Event_JFD_RTP_Piety_PaganFestival.Weight = 5
	Event_JFD_RTP_Piety_PaganFestival.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local currentEraID = player:GetCurrentEra()
			if currentEraID < eraMedievalID or currentEraID >= eraModernID then return false end
			if (not player:HasStateReligion()) then return false end
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
			return true
		end
		)
	Event_JFD_RTP_Piety_PaganFestival.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RTP_Piety_PaganFestival.Outcomes[1] = {}
	Event_JFD_RTP_Piety_PaganFestival.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_PAGAN_FESTIVAL_OUTCOME_1"
	Event_JFD_RTP_Piety_PaganFestival.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_PAGAN_FESTIVAL_OUTCOME_RESULT_1"
	Event_JFD_RTP_Piety_PaganFestival.Outcomes[1].Weight = 5
	Event_JFD_RTP_Piety_PaganFestival.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
			if player:GetPiety() < pietyCost then return false end 
			Event_JFD_RTP_Piety_PaganFestival.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PAGAN_FESTIVAL_OUTCOME_RESULT_1", pietyCost)
			return true
		end
		)
	Event_JFD_RTP_Piety_PaganFestival.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
			player:ChangePiety(-pietyCost)
			for city in player:Cities() do
				city:ChangeWeLoveTheKingDayCounter(2)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_PAGAN_FESTIVAL_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PAGAN_FESTIVAL"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_PAGAN_FESTIVAL_1", player:GetName(), player:GetCivilizationDescription())) 
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RTP_Piety_PaganFestival.Outcomes[2] = {}
	Event_JFD_RTP_Piety_PaganFestival.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_PAGAN_FESTIVAL_OUTCOME_2"
	Event_JFD_RTP_Piety_PaganFestival.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_PAGAN_FESTIVAL_OUTCOME_RESULT_2"
	Event_JFD_RTP_Piety_PaganFestival.Outcomes[2].Weight = 3
	Event_JFD_RTP_Piety_PaganFestival.Outcomes[2].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(15*iMod))
			Event_JFD_RTP_Piety_PaganFestival.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PAGAN_FESTIVAL_OUTCOME_RESULT_2", pietyReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_PaganFestival.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(15*iMod))
			player:ChangePiety(pietyReward)
			if GetRandom(1,100) <= 30 then
				player:GetCapitalCity():ChangeResistanceTurns(1)
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_PAGAN_FESTIVAL_OUTCOME_RESULT_2_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PAGAN_FESTIVAL"))
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_PAGAN_FESTIVAL_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PAGAN_FESTIVAL"))
			end
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_PAGAN_FESTIVAL_2", player:GetName(), player:GetCivilizationDescription())) 
		end)
	
tEvents.Event_JFD_RTP_Piety_PaganFestival = Event_JFD_RTP_Piety_PaganFestival
--------------------------------------------------------------------------------------------------------------------------
-- Religion: Holy Order
--------------------------------------------------------------------------------------------------------------------------
local buildingChapterHouseID = GameInfoTypes["BUILDING_JFD_CHAPTER_HOUSE"]
local eventHolyOrderName 	
local eventHolyOrderNames = {}
		eventHolyOrderNames[1] = "Teutonic Knights"
		eventHolyOrderNames[2] = "Knights Hospitaller"
		eventHolyOrderNames[3] = "Knights Templar"
		eventHolyOrderNames[4] = "Order of the Dragon"
local Event_JFD_RTP_Piety_HolyOrder = {}
	Event_JFD_RTP_Piety_HolyOrder.Name = "TXT_KEY_EVENT_JFD_HOLY_ORDER_PIETY"
	Event_JFD_RTP_Piety_HolyOrder.Desc = "TXT_KEY_EVENT_JFD_HOLY_ORDER_PIETY_DESC"
	Event_JFD_RTP_Piety_HolyOrder.EventImage = 'Event_HolyOrder.dds'
	Event_JFD_RTP_Piety_HolyOrder.Weight = 10
	Event_JFD_RTP_Piety_HolyOrder.CanFunc = (
		function(player)
			local playerID = player:GetID()
			if load(player, "Event_JFD_RTP_Piety_HolyOrder") == true then return false end	
			local currentEraID = player:GetCurrentEra()
			if currentEraID < eraMedievalID or currentEraID >= eraModernID then return false end
			if (not player:HasStateReligion()) then return false end
			Event_JFD_RTP_Piety_HolyOrder.Weight = JFD_GetPietyEventWeight(playerID)
			if JFD_GetPietyLevelID(playerID) < 1 then return false end
			eventHolyOrderName = eventHolyOrderNames[GetRandom(1,4)]
			Event_JFD_RTP_Piety_HolyOrder.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HOLY_ORDER_PIETY_DESC", eventHolyOrderName, Game.GetReligionName(JFD_GetStateReligion(player:GetID())))
			return true
		end
		)
	Event_JFD_RTP_Piety_HolyOrder.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RTP_Piety_HolyOrder.Outcomes[1] = {}
	Event_JFD_RTP_Piety_HolyOrder.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_HOLY_ORDER_PIETY_OUTCOME_1"
	Event_JFD_RTP_Piety_HolyOrder.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_HOLY_ORDER_PIETY_OUTCOME_RESULT_1"
	Event_JFD_RTP_Piety_HolyOrder.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local faithCost = JFD_GetEraAdjustedValue(playerID, mathCeil(50 * iMod))
			local goldCost 	= JFD_GetEraAdjustedValue(playerID, mathCeil(100 * iMod))
			if player:GetFaith() < faithCost then return false end 
			if player:GetGold()  < goldCost  then return false end 
			Event_JFD_RTP_Piety_HolyOrder.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HOLY_ORDER_PIETY_OUTCOME_RESULT_1", faithCost, goldCost)
			return true
		end
		)
	Event_JFD_RTP_Piety_HolyOrder.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local faithCost = JFD_GetEraAdjustedValue(playerID, mathCeil(50 * iMod))
			local goldCost	= JFD_GetEraAdjustedValue(playerID, mathCeil(100 * iMod))
			player:ChangeFaith(-faithCost)
			player:ChangeGold(-goldCost)
			for city in player:Cities() do
				city:SetNumFreeBuilding(buildingChapterHouseID, 1)
			end
			local stateReligionID = player:GetStateReligion()
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_HOLY_ORDER_PIETY_OUTCOME_RESULT_1_NOTIFICATION", eventHolyOrderName, Game.GetReligionName(stateReligionID)), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HOLY_ORDER_PIETY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_HOLY_ORDER_1", eventHolyOrderName, Game.GetReligionName(stateReligionID)), player:GetCivilizationShortDescription()) 
			save(player, "Event_JFD_RTP_Piety_HolyOrder", true)	
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RTP_Piety_HolyOrder.Outcomes[2] = {}
	Event_JFD_RTP_Piety_HolyOrder.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_HOLY_ORDER_PIETY_OUTCOME_2"
	Event_JFD_RTP_Piety_HolyOrder.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_HOLY_ORDER_PIETY_OUTCOME_RESULT_2"
	Event_JFD_RTP_Piety_HolyOrder.Outcomes[2].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
			if player:GetPiety() < pietyCost then return false end
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil((65*iMod)*pietyLevelMod))
			Event_JFD_RTP_Piety_HolyOrder.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HOLY_ORDER_PIETY_OUTCOME_RESULT_2", pietyCost, faithReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_HolyOrder.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil((65*iMod)*pietyLevelMod))
			player:ChangePiety(-pietyCost)
			player:ChangeFaith(faithReward)
			local stateReligionID = player:GetStateReligion()
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_HOLY_ORDER_PIETY_OUTCOME_RESULT_2_NOTIFICATION", eventHolyOrderName, Game.GetReligionName(stateReligionID)), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HOLY_ORDER_PIETY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_HOLY_ORDER_2", eventHolyOrderName, Game.GetReligionName(stateReligionID)), player:GetName(), player:GetCivilizationShortDescription())
			save(player, "Event_JFD_RTP_Piety_HolyOrder", true)	
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_RTP_Piety_HolyOrder.Outcomes[3] = {}
	Event_JFD_RTP_Piety_HolyOrder.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_HOLY_ORDER_PIETY_OUTCOME_3"
	Event_JFD_RTP_Piety_HolyOrder.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_HOLY_ORDER_PIETY_OUTCOME_RESULT_3"
	Event_JFD_RTP_Piety_HolyOrder.Outcomes[3].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			Event_JFD_RTP_Piety_HolyOrder.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HOLY_ORDER_PIETY_OUTCOME_RESULT_3")
			return true
		end
		)
	Event_JFD_RTP_Piety_HolyOrder.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local stateReligionID = player:GetStateReligion()
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_HOLY_ORDER_PIETY_OUTCOME_RESULT_3_NOTIFICATION", eventHolyOrderName, Game.GetReligionName(stateReligionID)), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HOLY_ORDER_PIETY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_HOLY_ORDER_2", eventHolyOrderName, Game.GetReligionName(stateReligionID)), player:GetName(), player:GetCivilizationShortDescription())
			save(player, "Event_JFD_RTP_Piety_HolyOrder", true)	
		end)
	
tEvents.Event_JFD_RTP_Piety_HolyOrder = Event_JFD_RTP_Piety_HolyOrder
--------------------------------------------------------------------------------------------------------------------------
-- Religion: Call for Secularisation
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_RTP_Piety_CallSecularization = {}
	Event_JFD_RTP_Piety_CallSecularization.Name = "TXT_KEY_EVENT_JFD_CALL_FOR_SECULARISATION_PIETY"
	Event_JFD_RTP_Piety_CallSecularization.Desc = "TXT_KEY_EVENT_JFD_CALL_FOR_SECULARISATION_PIETY_DESC"
	Event_JFD_RTP_Piety_CallSecularization.EventImage = 'Event_ClergyConcerned.dds'
	Event_JFD_RTP_Piety_CallSecularization.Weight = 5
	Event_JFD_RTP_Piety_CallSecularization.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local currentEraID = player:GetCurrentEra()
			if currentEraID < eraMedievalID or currentEraID >= eraModernID then return false end
			if (not player:HasStateReligion()) then return false end
			Event_JFD_RTP_Piety_CallSecularization.Weight = JFD_GetPietyEventWeight(playerID, true)
			return true
		end
		)
	Event_JFD_RTP_Piety_CallSecularization.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RTP_Piety_CallSecularization.Outcomes[1] = {}
	Event_JFD_RTP_Piety_CallSecularization.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_CALL_FOR_SECULARISATION_PIETY_OUTCOME_1"
	Event_JFD_RTP_Piety_CallSecularization.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_CALL_FOR_SECULARISATION_PIETY_OUTCOME_RESULT_1"
	Event_JFD_RTP_Piety_CallSecularization.Outcomes[1].CanFunc = (
		function(player)			
			local pietyReward = JFD_GetPietyPercent(player:GetID(), 100, true)
			Event_JFD_RTP_Piety_CallSecularization.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CALL_FOR_SECULARISATION_PIETY_OUTCOME_RESULT_1", pietyReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_CallSecularization.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyReward = JFD_GetPietyPercent(playerID, 100, true)
			player:GetCapitalCity():ChangeResistanceTurns(1)
			player:ChangePiety(pietyReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CALL_FOR_SECULARISATION_PIETY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CALL_FOR_SECULARISATION_PIETY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_CALL_FOR_SECULARISATION_1", player:GetName(), player:GetCivilizationShortDescription(), player:GetCivilizationAdjective())) 
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RTP_Piety_CallSecularization.Outcomes[2] = {}
	Event_JFD_RTP_Piety_CallSecularization.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_CALL_FOR_SECULARISATION_PIETY_OUTCOME_2"
	Event_JFD_RTP_Piety_CallSecularization.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_CALL_FOR_SECULARISATION_PIETY_OUTCOME_RESULT_2"
	Event_JFD_RTP_Piety_CallSecularization.Outcomes[2].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil((70*iMod)*pietyLevelMod))
			Event_JFD_RTP_Piety_CallSecularization.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CALL_FOR_SECULARISATION_PIETY_OUTCOME_RESULT_2", cultureReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_CallSecularization.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyLevelMod = JFD_GetPietyLevelMod(playerID)
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil((70*iMod)*pietyLevelMod))
			player:GetCapitalCity():ChangeResistanceTurns(1)
			player:ChangeJONSCulture(cultureReward)
			player:SetHasSecularized(true)			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CALL_FOR_SECULARISATION_PIETY_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CALL_FOR_SECULARISATION_PIETY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_CALL_FOR_SECULARISATION_2", player:GetName(), player:GetCivilizationShortDescription(), player:GetCivilizationAdjective())) 
		end)
	
tEvents.Event_JFD_RTP_Piety_CallSecularization = Event_JFD_RTP_Piety_CallSecularization
--------------------------------------------------------------------------------------------------------------------------
-- Religion: Clergy Concerned 1
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_RTP_Piety_ClergyConcerned1 = {}
	Event_JFD_RTP_Piety_ClergyConcerned1.Name = "TXT_KEY_EVENT_JFD_CLERGY_CONCERNED_1_PIETY"
	Event_JFD_RTP_Piety_ClergyConcerned1.Desc = "TXT_KEY_EVENT_JFD_CLERGY_CONCERNED_1_PIETY_DESC"
	Event_JFD_RTP_Piety_ClergyConcerned1.EventImage = 'Event_ClergyConcerned.dds'
	Event_JFD_RTP_Piety_ClergyConcerned1.Weight = 5
	Event_JFD_RTP_Piety_ClergyConcerned1.CanFunc = (
		function(player)
			local playerID = player:GetID()
			local currentEraID = player:GetCurrentEra()
			if currentEraID < eraMedievalID or currentEraID >= eraModernID then return false end
			if (not player:HasStateReligion()) then return false end
			Event_JFD_RTP_Piety_ClergyConcerned1.Weight = JFD_GetPietyEventWeight(playerID, true)
			local stateReligionID = player:GetStateReligion()
			if GetReligiousUnity(player, stateReligionID) >= 50 then return false end
			if player:GetMajorityReligion() == stateReligionID then return false end
			if player:GetMajorityReligion() <= 0 then return false end
			return true
		end
		)
	Event_JFD_RTP_Piety_ClergyConcerned1.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RTP_Piety_ClergyConcerned1.Outcomes[1] = {}
	Event_JFD_RTP_Piety_ClergyConcerned1.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_CLERGY_CONCERNED_1_PIETY_OUTCOME_1"
	Event_JFD_RTP_Piety_ClergyConcerned1.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_CLERGY_CONCERNED_1_PIETY_OUTCOME_RESULT_1"
	Event_JFD_RTP_Piety_ClergyConcerned1.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
			local cultureCost = JFD_GetEraAdjustedValue(playerID, mathCeil(46*iMod))
			if player:GetJONSCulture() < cultureCost then return false end
			Event_JFD_RTP_Piety_ClergyConcerned1.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CLERGY_CONCERNED_1_PIETY_OUTCOME_RESULT_1", cultureCost, pietyReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_ClergyConcerned1.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
			local cultureCost = JFD_GetEraAdjustedValue(playerID, mathCeil(46*iMod))
			player:ChangeJONSCulture(-cultureCost)
			player:ChangePiety(pietyReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CLERGY_CONCERNED_1_PIETY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CLERGY_CONCERNED_2_PIETY"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RTP_Piety_ClergyConcerned1.Outcomes[2] = {}
	Event_JFD_RTP_Piety_ClergyConcerned1.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_CLERGY_CONCERNED_1_PIETY_OUTCOME_2"
	Event_JFD_RTP_Piety_ClergyConcerned1.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_CLERGY_CONCERNED_1_PIETY_OUTCOME_RESULT_2"
	Event_JFD_RTP_Piety_ClergyConcerned1.Outcomes[2].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(20*iMod))
			if player:GetPiety() < pietyCost then return false end 
			local stateReligionName = Game.GetReligionName(GetPlayerMajorityReligion(player))
			Event_JFD_RTP_Piety_ClergyConcerned1.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CLERGY_CONCERNED_1_PIETY_OUTCOME_RESULT_2", pietyCost, stateReligionName)
			return true
		end
		)
	Event_JFD_RTP_Piety_ClergyConcerned1.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(20 * iMod))
			player:ChangePiety(-pietyCost)
			player:SetStateReligion(player:GetMajorityReligion())
			local stateReligionName = Game.GetReligionName(player:GetMajorityReligion())
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CLERGY_CONCERNED_1_PIETY_OUTCOME_RESULT_2_NOTIFICATION", stateReligionName), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CLERGY_CONCERNED_1_PIETY"))
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_RTP_Piety_ClergyConcerned1.Outcomes[3] = {}
	Event_JFD_RTP_Piety_ClergyConcerned1.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_CLERGY_CONCERNED_1_PIETY_OUTCOME_3"
	Event_JFD_RTP_Piety_ClergyConcerned1.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_CLERGY_CONCERNED_1_PIETY_OUTCOME_RESULT_3"
	Event_JFD_RTP_Piety_ClergyConcerned1.Outcomes[3].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local faithCost = JFD_GetEraAdjustedValue(playerID, mathCeil(70*iMod))
			local goldCost 	= JFD_GetEraAdjustedValue(playerID, mathCeil(120*iMod))
			if player:GetGold() < goldCost 	 then return false end
			if player:GetFaith() < faithCost then return false end
			Event_JFD_RTP_Piety_ClergyConcerned1.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CLERGY_CONCERNED_1_PIETY_OUTCOME_RESULT_3", faithCost, goldCost)
			return true
		end
		)
	Event_JFD_RTP_Piety_ClergyConcerned1.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local faithCost = JFD_GetEraAdjustedValue(playerID, mathCeil(70*iMod))
			local goldCost 	= JFD_GetEraAdjustedValue(playerID, mathCeil(120*iMod))
			player:ChangeFaith(-faithCost)
			player:Changegold(-goldCost)
			ConvertPlayerReligion(player, player:GetStateReligion(), 50)
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CLERGY_CONCERNED_1_PIETY_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CLERGY_CONCERNED_1_PIETY"))
		end)
	
tEvents.Event_JFD_RTP_Piety_ClergyConcerned1 = Event_JFD_RTP_Piety_ClergyConcerned1
--------------------------------------------------------------------------------------------------------------------------
-- Religion: Clergy Concerned 2
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_RTP_Piety_ClergyConcerned2 = {}
	Event_JFD_RTP_Piety_ClergyConcerned2.Name = "TXT_KEY_EVENT_JFD_CLERGY_CONCERNED_2_PIETY"
	Event_JFD_RTP_Piety_ClergyConcerned2.Desc = "TXT_KEY_EVENT_JFD_CLERGY_CONCERNED_2_PIETY_DESC"
	Event_JFD_RTP_Piety_ClergyConcerned2.EventImage = 'Event_ClergyConcerned.dds'
	Event_JFD_RTP_Piety_ClergyConcerned2.Weight = 5
	Event_JFD_RTP_Piety_ClergyConcerned2.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local currentEraID = player:GetCurrentEra()
			if currentEraID < eraMedievalID or currentEraID >= eraModernID then return false end
			if (not player:HasStateReligion()) then return false end
			local faithCost = JFD_GetEraAdjustedValue(playerID, mathCeil(50*iMod))
			if player:GetFaith() < faithCost then return false end
			Event_JFD_RTP_Piety_ClergyConcerned2.Weight = JFD_GetPietyEventWeight(playerID, true)
			if JFD_GetPietyLevelID(playerID) >= 3 then return false end
			return true
		end
		)
	Event_JFD_RTP_Piety_ClergyConcerned2.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RTP_Piety_ClergyConcerned2.Outcomes[1] = {}
	Event_JFD_RTP_Piety_ClergyConcerned2.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_CLERGY_CONCERNED_2_PIETY_OUTCOME_1" 
	Event_JFD_RTP_Piety_ClergyConcerned2.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_CLERGY_CONCERNED_2_PIETY_OUTCOME_RESULT_1"
	Event_JFD_RTP_Piety_ClergyConcerned2.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(20*iMod))
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil(46*iMod))
			if player:GetPiety() < pietyCost then return false end
			Event_JFD_RTP_Piety_ClergyConcerned2.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CLERGY_CONCERNED_2_PIETY_OUTCOME_RESULT_1", pietyCost, cultureReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_ClergyConcerned2.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(20*iMod))
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil(46*iMod))
			player:ChangeJONSCulture(cultureReward)
			player:ChangePiety(-pietyCost)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CLERGY_CONCERNED_2_PIETY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CLERGY_CONCERNED_2_PIETY"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RTP_Piety_ClergyConcerned2.Outcomes[2] = {}
	Event_JFD_RTP_Piety_ClergyConcerned2.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_CLERGY_CONCERNED_2_PIETY_OUTCOME_2"
	Event_JFD_RTP_Piety_ClergyConcerned2.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_CLERGY_CONCERNED_2_PIETY_OUTCOME_RESULT_2"
	Event_JFD_RTP_Piety_ClergyConcerned2.Outcomes[2].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local faithCost = JFD_GetEraAdjustedValue(playerID, mathCeil(50*iMod))
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
			Event_JFD_RTP_Piety_ClergyConcerned2.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CLERGY_CONCERNED_2_PIETY_OUTCOME_RESULT_2", faithCost, pietyReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_ClergyConcerned2.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local faithCost = JFD_GetEraAdjustedValue(playerID, mathCeil(50*iMod))
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
			player:ChangeFaith(-faithCost)
			player:ChangePiety(pietyReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CLERGY_CONCERNED_2_PIETY_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CLERGY_CONCERNED_2_PIETY"))
		end)
	
tEvents.Event_JFD_RTP_Piety_ClergyConcerned2 = Event_JFD_RTP_Piety_ClergyConcerned2
--------------------------------------------------------------------------------------------------------------------------
-- Religion: Fog From Hell
--------------------------------------------------------------------------------------------------------------------------
local eventFogFromHellCityID
local featureFalloutID = GameInfoTypes["FEATURE_FALLOUT"]
local Event_JFD_RTP_Piety_HellFog = {}
	Event_JFD_RTP_Piety_HellFog.Name = "TXT_KEY_EVENT_JFD_FOG_FROM_HELL_PIETY"
	Event_JFD_RTP_Piety_HellFog.Desc = "TXT_KEY_EVENT_JFD_FOG_FROM_HELL_PIETY_DESC"
	Event_JFD_RTP_Piety_HellFog.EventImage = 'Event_HellFog.dds'
	Event_JFD_RTP_Piety_HellFog.Weight = 5
	Event_JFD_RTP_Piety_HellFog.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local currentEraID = player:GetCurrentEra()
			if currentEraID < eraMedievalID or currentEraID >= eraModernID then return false end
			if (not player:HasStateReligion()) then return false end
			Event_JFD_RTP_Piety_HellFog.Weight = JFD_GetPietyEventWeight(playerID, true)
			local cities = {}
			local count = 1
			for city in player:Cities() do
				cities[count] = city:GetID()
				count = count + 1
			end
			eventFogFromHellCityID = cities[GetRandom(1, #cities)]
			if (not eventFogFromHellCityID) then return false end
			local city = player:GetCityByID(eventFogFromHellCityID)
			local faithCost = JFD_GetEraAdjustedValue(playerID, mathCeil(50*iMod))
			if player:GetFaith() < faithCost then return false end
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(65*iMod))
			if player:GetGold() < goldCost then return false end
			Event_JFD_RTP_Piety_HellFog.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FOG_FROM_HELL_PIETY_DESC", city:GetName())
			return true
		end
		)
	Event_JFD_RTP_Piety_HellFog.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RTP_Piety_HellFog.Outcomes[1] = {}
	Event_JFD_RTP_Piety_HellFog.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_FOG_FROM_HELL_PIETY_OUTCOME_1"
	Event_JFD_RTP_Piety_HellFog.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_FOG_FROM_HELL_PIETY_OUTCOME_RESULT_1"
	Event_JFD_RTP_Piety_HellFog.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local faithCost = JFD_GetEraAdjustedValue(playerID, mathCeil(50*iMod))
			if player:GetFaith() < faithCost then return false end
			Event_JFD_RTP_Piety_HellFog.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FOG_FROM_HELL_PIETY_OUTCOME_RESULT_1", faithCost)
			return true
		end
		)
	Event_JFD_RTP_Piety_HellFog.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local faithCost = JFD_GetEraAdjustedValue(playerID, mathCeil(50*iMod))
			player:ChangeFaith(-faithCost)
			if GetRandom(1,10) <= 3 then
				local city = player:GetCityByID(eventFogFromHellCityID)
				local cityPlot = Map.GetPlot(city:GetX(), city:GetY())
				cityPlot:SetFeatureType(featureFalloutID)
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_FOG_FROM_HELL_PIETY_OUTCOME_RESULT_1_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FOG_FROM_HELL_PIETY"))
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_FOG_FROM_HELL_PIETY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FOG_FROM_HELL_PIETY"))
			end
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RTP_Piety_HellFog.Outcomes[2] = {}
	Event_JFD_RTP_Piety_HellFog.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_FOG_FROM_HELL_PIETY_OUTCOME_2"
	Event_JFD_RTP_Piety_HellFog.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_FOG_FROM_HELL_PIETY_OUTCOME_RESULT_2"
	Event_JFD_RTP_Piety_HellFog.Outcomes[2].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(65*iMod))
			if player:GetGold() < goldCost then return false end
			Event_JFD_RTP_Piety_HellFog.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FOG_FROM_HELL_PIETY_OUTCOME_RESULT_2", goldCost)
			return true
		end
		)
	Event_JFD_RTP_Piety_HellFog.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(65*iMod))
			player:ChangeGold(-goldCost)
			if GetRandom(1,10) <= 3 then
				local city = player:GetCityByID(eventFogFromHellCityID)
				local cityPlot = Map.GetPlot(city:GetX(), city:GetY())
				cityPlot:SetFeatureType(featureFalloutID)
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_FOG_FROM_HELL_PIETY_OUTCOME_RESULT_2_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FOG_FROM_HELL_PIETY"))
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_FOG_FROM_HELL_PIETY_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FOG_FROM_HELL_PIETY"))
			end
		end)
	
tEvents.Event_JFD_RTP_Piety_HellFog = Event_JFD_RTP_Piety_HellFog
--------------------------------------------------------------------------------------------------------------------------
-- Religion: Hagia Sophia
--------------------------------------------------------------------------------------------------------------------------
local buildingConversionID = nil
local buildingHagiaSophiaID = GameInfoTypes["BUILDING_HAGIA_SOPHIA"]
local buildingMonasteryID = GameInfoTypes["BUILDING_MONASTERY"]
local Event_JFD_RTP_Piety_HagiaSophia = {}
	Event_JFD_RTP_Piety_HagiaSophia.Name = "TXT_KEY_EVENT_JFD_HAGIA_SOPHIA_PIETY"
	Event_JFD_RTP_Piety_HagiaSophia.Desc = "TXT_KEY_EVENT_JFD_HAGIA_SOPHIA_PIETY_DESC"
	Event_JFD_RTP_Piety_HagiaSophia.EventImage = 'Event_HagiaSophia.dds'
	Event_JFD_RTP_Piety_HagiaSophia.Weight = 10
	Event_JFD_RTP_Piety_HagiaSophia.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local currentEraID = player:GetCurrentEra()
			if (not player:HasBuilding(buildingHagiaSophiaID)) then return false end
			if (not player:HasStateReligion()) then return false end
			for city in player:Cities() do 
				if (city:HasBuilding(buildingHagiaSophiaID) and city:GetOriginalOwner() == playerID) then return false end
			end
			local religionID = player:GetStateReligion()
			local hasBuildingBelief = false
			for row in GameInfo.Belief_BuildingClassFaithPurchase() do
				local beliefID = GameInfoTypes[row.BeliefType]
				if player:HasBelief(beliefID) then
					buildingConversionID = player:GetSpecificBuildingType(row.BuildingClassType)
					break
				end
			end
			if (not buildingConversionID) then return false end
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(25*iMod))
			if player:GetGold() < goldCost then return false end
			Event_JFD_RTP_Piety_HagiaSophia.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HAGIA_SOPHIA_PIETY_DESC")
			return true
		end
		)
	Event_JFD_RTP_Piety_HagiaSophia.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RTP_Piety_HagiaSophia.Outcomes[1] = {}
	Event_JFD_RTP_Piety_HagiaSophia.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_HAGIA_SOPHIA_PIETY_OUTCOME_1"
	Event_JFD_RTP_Piety_HagiaSophia.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_HAGIA_SOPHIA_PIETY_OUTCOME_RESULT_1"
	Event_JFD_RTP_Piety_HagiaSophia.Outcomes[1].CanFunc = (
		function(player)			
			Event_JFD_RTP_Piety_HagiaSophia.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HAGIA_SOPHIA_PIETY_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFD_RTP_Piety_HagiaSophia.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_HAGIA_SOPHIA_PIETY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HAGIA_SOPHIA_PIETY"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RTP_Piety_HagiaSophia.Outcomes[2] = {}
	Event_JFD_RTP_Piety_HagiaSophia.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_HAGIA_SOPHIA_PIETY_OUTCOME_2"
	Event_JFD_RTP_Piety_HagiaSophia.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_HAGIA_SOPHIA_PIETY_OUTCOME_RESULT_2"
	Event_JFD_RTP_Piety_HagiaSophia.Outcomes[2].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local building = GameInfo.Buildings[buildingConversionID]
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(25*iMod))
			local cityName = nil
			for city in player:Cities() do
				if (city:HasBuilding(buildingHagiaSophiaID)) then
					cityName = city:GetName()
					break
				end
			end
			Event_JFD_RTP_Piety_HagiaSophia.Outcomes[2].Name = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HAGIA_SOPHIA_PIETY_OUTCOME_2", building.Description)
			Event_JFD_RTP_Piety_HagiaSophia.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HAGIA_SOPHIA_PIETY_OUTCOME_RESULT_2", goldCost, building.Description, cityName)
			return true
		end
		)
	Event_JFD_RTP_Piety_HagiaSophia.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local building = GameInfo.Buildings[buildingConversionID]
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(25*iMod))
			player:ChangeGold(-goldCost)
			for city in player:Cities() do
				if (city:HasBuilding(buildingHagiaSophiaID)) then
					city:SetNumFreeBuilding(buildingMonasteryID, 0)
					city:SetNumFreeBuilding(building.ID, 1)
					break
				end
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_HAGIA_SOPHIA_PIETY_OUTCOME_RESULT_2_NOTIFICATION", building.Description), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HAGIA_SOPHIA_PIETY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_HAGIA_SOPHIA_1", player:GetName(), player:GetCivilizationShortDescription(), building.Description)) 
		end)
	
tEvents.Event_JFD_RTP_Piety_HagiaSophia = Event_JFD_RTP_Piety_HagiaSophia
--------------------------------------------------------------------------------------------------------------------------
--  Religion: Book Burning
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_RTP_Piety_BookBurning = {}
	Event_JFD_RTP_Piety_BookBurning.Name = "TXT_KEY_EVENT_JFD_BOOK_BURNING_PIETY"
	Event_JFD_RTP_Piety_BookBurning.Desc = "TXT_KEY_EVENT_JFD_BOOK_BURNING_PIETY_DESC"
	Event_JFD_RTP_Piety_BookBurning.EventImage = 'Event_BookBurning.dds'
	Event_JFD_RTP_Piety_BookBurning.Weight = 10
	Event_JFD_RTP_Piety_BookBurning.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			if (not player:HasStateReligion()) then return false end
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(5*iMod))
			if player:GetPiety() < pietyCost then return false end
			local cultureCost = JFD_GetEraAdjustedValue(playerID, mathCeil(25*iMod))
			if player:GetJONSCulture() < cultureCost then return false end
			return true
		end
		)
	Event_JFD_RTP_Piety_BookBurning.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RTP_Piety_BookBurning.Outcomes[1] = {}
	Event_JFD_RTP_Piety_BookBurning.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_BOOK_BURNING_PIETY_OUTCOME_1"
	Event_JFD_RTP_Piety_BookBurning.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_BOOK_BURNING_PIETY_OUTCOME_RESULT_1"
	Event_JFD_RTP_Piety_BookBurning.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(7*iMod))
			local cultureCost = JFD_GetEraAdjustedValue(playerID, mathCeil(25*iMod))
			Event_JFD_RTP_Piety_BookBurning.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BOOK_BURNING_PIETY_OUTCOME_RESULT_1", cultureCost, pietyReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_BookBurning.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(7*iMod))
			local cultureCost = JFD_GetEraAdjustedValue(playerID, mathCeil(25*iMod))
			player:ChangePiety(pietyReward)
			player:ChangeJONSCulture(-cultureCost)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BOOK_BURNING_PIETY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BOOK_BURNING_PIETY"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RTP_Piety_BookBurning.Outcomes[2] = {}
	Event_JFD_RTP_Piety_BookBurning.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_BOOK_BURNING_PIETY_OUTCOME_2"
	Event_JFD_RTP_Piety_BookBurning.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_BOOK_BURNING_PIETY_OUTCOME_RESULT_2"
	Event_JFD_RTP_Piety_BookBurning.Outcomes[2].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(5*iMod))
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil(25*iMod))
			Event_JFD_RTP_Piety_BookBurning.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BOOK_BURNING_PIETY_OUTCOME_RESULT_2", pietyCost, cultureReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_BookBurning.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyCost = JFD_GetEraAdjustedValue(playerID, mathCeil(5*iMod))
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil(25*iMod))
			player:ChangePiety(-pietyCost)
			player:ChangeJONSCulture(cultureReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BOOK_BURNING_PIETY_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BOOK_BURNING_PIETY"))
		end)

tEvents.Event_JFD_RTP_Piety_BookBurning = Event_JFD_RTP_Piety_BookBurning
--------------------------------------------------------------------------------------------------------------------------
-- Religion: Rosicrucian Manifestos
--------------------------------------------------------------------------------------------------------------------------
local beliefAscetismID 			 = GameInfoTypes["BELIEF_ASCETISM"]
local beliefInitiationRightsID 	 = GameInfoTypes["BELIEF_INITIATION_RITES"]
local beliefMessangerOfTheGodsID = GameInfoTypes["BELIEF_MESSENGER_GODS"]
local religionHermeticismID 	 = GameInfoTypes["RELIGION_HERMETICISM"]
local religionHermeticismCity	 = nil
local Event_JFD_RTP_Piety_RosicrucianManifestos = {}
	Event_JFD_RTP_Piety_RosicrucianManifestos.Name = "TXT_KEY_EVENT_JFD_ROSICRUCIAN_MANIFESTOS_PIETY"
	Event_JFD_RTP_Piety_RosicrucianManifestos.Desc = "TXT_KEY_EVENT_JFD_ROSICRUCIAN_MANIFESTOS_PIETY_DESC"
	Event_JFD_RTP_Piety_RosicrucianManifestos.EventImage = 'Event_RosicrucianManifestos.dds'
	Event_JFD_RTP_Piety_RosicrucianManifestos.Weight = 5
	Event_JFD_RTP_Piety_RosicrucianManifestos.CanFunc = (
		function(player)			
			if Game.AnyoneHasReligion(religionHermeticismID) then return false end
			if player:GetCurrentEra() < eraRenaissanceID then return false end
			if (not player:HasStateReligion()) then return false end
			local pietyLoss = mathCeil(30*iMod)
			if player:GetPiety() < pietyLoss then return false end
			local validCities = {}
			local count = 1
			for city in player:Cities() do
				if (not city:IsCapital()) then
					validCities[count] = city
					count = count + 1
				end
			end
			religionHermeticismCity = validCities[GetRandom(1,#validCities)]
			if (not religionHermeticismCity) then return false end
			Event_JFD_RTP_Piety_RosicrucianManifestos.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ROSICRUCIAN_MANIFESTOS_PIETY_DESC", religionHermeticismCity:GetName())
			return true
		end
		)
	Event_JFD_RTP_Piety_RosicrucianManifestos.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RTP_Piety_RosicrucianManifestos.Outcomes[1] = {}
	Event_JFD_RTP_Piety_RosicrucianManifestos.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_ROSICRUCIAN_MANIFESTOS_PIETY_OUTCOME_1"
	Event_JFD_RTP_Piety_RosicrucianManifestos.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_ROSICRUCIAN_MANIFESTOS_PIETY_OUTCOME_RESULT_1"
	Event_JFD_RTP_Piety_RosicrucianManifestos.Outcomes[1].CanFunc = (
		function(player)			
			local pietyCost = mathCeil(30*iMod)
			Event_JFD_RTP_Piety_RosicrucianManifestos.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ROSICRUCIAN_MANIFESTOS_PIETY_OUTCOME_RESULT_1", pietyCost, religionHermeticismCity:GetName())
			return true
		end
		)
	Event_JFD_RTP_Piety_RosicrucianManifestos.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyCost = mathCeil(30*iMod)
			player:ChangePiety(-pietyCost)
			Game.FoundReligion(63, religionHermeticismID, nil, beliefInitiationRightsID, beliefMessangerOfTheGodsID, beliefAscetismID, -1, religionHermeticismCity)
			Events.AudioPlay2DSound("AS2D_JFD_HELLENISM")
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ROSICRUCIAN_MANIFESTOS_PIETY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ROSICRUCIAN_MANIFESTOS_PIETY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ROSICRUCIAN_MANIFESTOS_PIETY_1", player:GetName(), player:GetCivilizationShortDescription())) 
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RTP_Piety_RosicrucianManifestos.Outcomes[2] = {}
	Event_JFD_RTP_Piety_RosicrucianManifestos.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_ROSICRUCIAN_MANIFESTOS_PIETY_OUTCOME_2"
	Event_JFD_RTP_Piety_RosicrucianManifestos.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_ROSICRUCIAN_MANIFESTOS_PIETY_OUTCOME_RESULT_2"
	Event_JFD_RTP_Piety_RosicrucianManifestos.Outcomes[2].CanFunc = (
		function(player)			
			local pietyCost = mathCeil(30*iMod)
			local cultureReward = mathCeil(80*iMod)
			Event_JFD_RTP_Piety_RosicrucianManifestos.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ROSICRUCIAN_MANIFESTOS_PIETY_OUTCOME_RESULT_2", pietyCost, cultureReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_RosicrucianManifestos.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local pietyCost = mathCeil(30*iMod)
			local cultureReward = mathCeil(80*iMod)
			player:ChangePiety(-pietyCost)
			player:ChangeJONSCulture(cultureReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ROSICRUCIAN_MANIFESTOS_PIETY_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ROSICRUCIAN_MANIFESTOS_PIETY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ROSICRUCIAN_MANIFESTOS_PIETY_2", player:GetName(), player:GetCivilizationShortDescription())) 
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_RTP_Piety_RosicrucianManifestos.Outcomes[3] = {}
	Event_JFD_RTP_Piety_RosicrucianManifestos.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_ROSICRUCIAN_MANIFESTOS_PIETY_OUTCOME_3"
	Event_JFD_RTP_Piety_RosicrucianManifestos.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_ROSICRUCIAN_MANIFESTOS_PIETY_OUTCOME_RESULT_3"
	Event_JFD_RTP_Piety_RosicrucianManifestos.Outcomes[3].CanFunc = (
		function(player)			
			local cultureLoss = mathCeil(30*iMod)
			local pietyReward = mathCeil(50*iMod)
			Event_JFD_RTP_Piety_RosicrucianManifestos.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ROSICRUCIAN_MANIFESTOS_PIETY_OUTCOME_RESULT_3", cultureLoss, pietyReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_RosicrucianManifestos.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local cultureLoss = mathCeil(30*iMod)
			local pietyReward = mathCeil(50*iMod)
			player:ChangePiety(pietyReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ROSICRUCIAN_MANIFESTOS_PIETY_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ROSICRUCIAN_MANIFESTOS_PIETY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ROSICRUCIAN_MANIFESTOS_PIETY_3", player:GetName(), player:GetCivilizationShortDescription())) 
		end)
		
tEvents.Event_JFD_RTP_Piety_RosicrucianManifestos = Event_JFD_RTP_Piety_RosicrucianManifestos
--------------------------------------------------------------------------------------------------------------------------
-- Religion: Schism
--------------------------------------------------------------------------------------------------------------------------
local maxActiveReligions = GameInfo.Worlds[Map.GetWorldSize()].MaxActiveReligions
local religionSchismID = nil
local religionSchismCity = nil
local religionSchismFounderID = nil
local Event_JFD_RTP_Piety_Schism = {}
	Event_JFD_RTP_Piety_Schism.Name = "TXT_KEY_EVENT_JFD_SCHISM_PIETY"
	Event_JFD_RTP_Piety_Schism.Desc = "TXT_KEY_EVENT_JFD_SCHISM_PIETY_DESC"
	Event_JFD_RTP_Piety_Schism.EventImage = 'Event_Schism.dds'
	Event_JFD_RTP_Piety_Schism.Weight = 5
	Event_JFD_RTP_Piety_Schism.CanFunc = (
		function(player)	
			if Game.GetNumReligionsFounded() >= (maxActiveReligions+2) then return false end
			if player:GetCurrentEra() < eraRenaissanceID then return false end
			if (not player:HasStateReligion()) then return false end
			if JFD_GetPietyLevelID(player:GetID()) >= 4 then return false end
			local stateReligionID = player:GetStateReligion()
			local stateReligion = GameInfo.Religions[stateReligionID].Type
			local religionSchisms = {}
			local religionSchismsCount = 1
			for row in GameInfo.Religion_SchismReligions("ReligionType = '" .. stateReligion .. "'") do
				local schismReligionID = GameInfoTypes[row.SchismReligionType]
				if (not Game.AnyoneHasReligion(schismReligionID)) then
					religionSchisms[religionSchismsCount] = schismReligionID
					religionSchismsCount = religionSchismsCount + 1
				end
			end
			religionSchismID = religionSchisms[GetRandom(1,#religionSchisms)]
			if (not religionSchismID) then
				for row in GameInfo.Religions() do
					local schismReligionID = row.ID
					if (not Game.AnyoneHasReligion(row.ID)) then
						religionSchisms[religionSchismsCount] = schismReligionID
						religionSchismsCount = religionSchismsCount + 1
					end	
				end
			end
			religionSchismID = religionSchisms[GetRandom(1,#religionSchisms)]
			if (not religionSchismID) then return false end
			local religionFounders = {}
			local founderCount = 1
			for otherPlayerID = 0, GameDefines.MAX_CIV_PLAYERS - 1 do	
				local otherPlayer = Players[otherPlayerID]
				if (otherPlayer:IsAlive() and otherPlayer:IsMinorCiv() and (not otherPlayer:HasReligion()) and otherPlayer:GetStateReligion() == stateReligionID) then
					religionFounders[founderCount] = otherPlayerID
					founderCount = founderCount + 1
				end
			end
			religionSchismFounderID = religionFounders[GetRandom(1,#religionFounders)]
			if (not religionSchismFounderID) then return false end
			religionSchismCity = Players[religionSchismFounderID]:GetCapitalCity()
			Event_JFD_RTP_Piety_Schism.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SCHISM_PIETY_DESC", Players[religionSchismFounderID]:GetName(), Game.GetReligionName(religionSchismID))
			return true
		end
		)
	Event_JFD_RTP_Piety_Schism.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RTP_Piety_Schism.Outcomes[1] = {}
	Event_JFD_RTP_Piety_Schism.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_SCHISM_PIETY_OUTCOME_1"
	Event_JFD_RTP_Piety_Schism.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_SCHISM_PIETY_OUTCOME_RESULT_1"
	Event_JFD_RTP_Piety_Schism.Outcomes[1].CanFunc = (
		function(player)			
			Event_JFD_RTP_Piety_Schism.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SCHISM_PIETY_OUTCOME_RESULT_1", Players[religionSchismFounderID]:GetName(), Game.GetReligionName(religionSchismID))
			return true
		end
		)
	Event_JFD_RTP_Piety_Schism.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local religionID = player:GetStateReligion()
			local pietyCost = mathCeil(30*iMod)
			local beliefPantheonID = nil
			local beliefFounderID = nil
			local beliefFollower1ID = nil
			local beliefFollower2ID = nil
			local beliefEnhancerID = nil
			for _, beliefID in ipairs(Game.GetBeliefsInReligion(religionID)) do
				local belief = GameInfo.Beliefs[beliefID]
				if belief.Pantheon then
					beliefPantheonID = beliefID
				elseif belief.Founder then
					beliefFounderID = beliefID
				end
			end
			local beliefFollowers1 = {}
			local beliefFollowers2 = {}
			local beliefEnhancers = {}
			local beliefFollower1Count = 1
			local beliefFollower2Count = 1
			local beliefEnhancerCount = 1
			for belief in GameInfo.Beliefs("Follower > 0 AND JFD_RequiresFounding > 0") do
				beliefFollowers1[beliefFollower1Count] = belief.ID
				beliefFollower1Count = beliefFollower1Count + 1
			end
			for belief in GameInfo.Beliefs("Follower > 0 AND JFD_RequiresEnhancement > 0") do
				beliefFollowers2[beliefFollower2Count] = belief.ID
				beliefFollower2Count = beliefFollower2Count + 1
			end
			for belief in GameInfo.Beliefs("Enhancer > 0") do
				beliefEnhancers[beliefEnhancerCount] = belief.ID
				beliefEnhancerCount = beliefEnhancerCount + 1
			end
			beliefFollower1ID = beliefFollowers1[GetRandom(1,#beliefFollowers1)]
			beliefFollower2ID = beliefFollowers2[GetRandom(1,#beliefFollowers2)]
			beliefEnhancerID = beliefEnhancers[GetRandom(1,#beliefEnhancers)]
			Game.FoundReligion(religionSchismFounderID, religionSchismID, nil, beliefPantheonID, beliefFounderID, beliefFollower1ID, -1, religionSchismCity)
			Game.EnhanceReligion(religionSchismFounderID, religionSchismID, beliefFollower2ID, beliefEnhancerID)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SCHISM_PIETY_OUTCOME_RESULT_1_NOTIFICATION", Game.GetReligionName(religionID), Game.GetReligionName(religionSchismID), Players[religionSchismFounderID]:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SCHISM_PIETY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SCHISM_PIETY_1", Game.GetReligionName(religionID), Players[religionSchismFounderID]:GetCivilizationAdjective(), Game.GetReligionName(religionSchismID), Players[religionSchismFounderID]:GetName())) 
		end)
		
tEvents.Event_JFD_RTP_Piety_Schism = Event_JFD_RTP_Piety_Schism
--------------------------------------------------------------------------------------------------------------------------
-- Religion: Bodhisattva
--------------------------------------------------------------------------------------------------------------------------
local religionBuddhismID = GameInfoTypes["RELIGION_BUDDHISM"]
if GameInfoTypes["RELIGION_MAHAYANA"] then
	religionBuddhismID = GameInfoTypes["RELIGION_MAHAYANA"]
end
local Event_JFD_RTP_Piety_Bodhisattva = {}
	Event_JFD_RTP_Piety_Bodhisattva.Name = "TXT_KEY_EVENT_JFD_BODHISATTVA_PIETY"
	Event_JFD_RTP_Piety_Bodhisattva.Desc = "TXT_KEY_EVENT_JFD_BODHISATTVA_PIETY_DESC"
	Event_JFD_RTP_Piety_Bodhisattva.EventImage = 'Event_Bodhisattva.dds'
	Event_JFD_RTP_Piety_Bodhisattva.Weight = 5
	Event_JFD_RTP_Piety_Bodhisattva.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			if (not Game.AnyoneHasReligion(religionBuddhismID)) then return false end
			if (not player:HasStateReligion()) then return false end
			if player:GetStateReligion() == religionBuddhismID then return false end
			if Game.GetFounder(religionBuddhismID, -1) == playerID then return false end
			Event_JFD_RTP_Piety_Bodhisattva.Weight = JFD_GetPietyEventWeight(playerID, false)
			local faithCost = JFD_GetEraAdjustedValue(playerID, mathCeil(50*iMod))
			if player:GetFaith() < faithCost then return false end
			Event_JFD_RTP_Piety_Bodhisattva.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BODHISATTVA_PIETY_DESC")
			return true
		end
		)
	Event_JFD_RTP_Piety_Bodhisattva.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_RTP_Piety_Bodhisattva.Outcomes[1] = {}
	Event_JFD_RTP_Piety_Bodhisattva.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_BODHISATTVA_PIETY_OUTCOME_1"
	Event_JFD_RTP_Piety_Bodhisattva.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_BODHISATTVA_PIETY_OUTCOME_RESULT_1"
	Event_JFD_RTP_Piety_Bodhisattva.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local stateReligionID = player:GetStateReligion()
			Event_JFD_RTP_Piety_Bodhisattva.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BODHISATTVA_PIETY_OUTCOME_RESULT_1", Game.GetReligionName(stateReligionID), Game.GetReligionName(religionBuddhismID))
			return true
		end
		)
	Event_JFD_RTP_Piety_Bodhisattva.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local capital = player:GetCapitalCity()
			local stateReligionID = player:GetStateReligion()
			capital:ConvertPercentFollowers(religionBuddhismID, stateReligionID, 100)
			Teams[player:GetTeam()]:Meet(Players[Game.GetFounder(religionBuddhismID, -1)]:GetTeam())
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_EVENT_JFD_BODHISATTVA_PIETY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BODHISATTVA_PIETY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BODHISATTVA_1", player:GetName(), player:GetCivilizationShortDescription()))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_RTP_Piety_Bodhisattva.Outcomes[2] = {}
	Event_JFD_RTP_Piety_Bodhisattva.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_BODHISATTVA_PIETY_OUTCOME_2"
	Event_JFD_RTP_Piety_Bodhisattva.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_BODHISATTVA_PIETY_OUTCOME_RESULT_2"
	Event_JFD_RTP_Piety_Bodhisattva.Outcomes[2].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local faithCost = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
			Event_JFD_RTP_Piety_Bodhisattva.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BODHISATTVA_PIETY_OUTCOME_RESULT_2", faithCost)
			return true
		end
		)
	Event_JFD_RTP_Piety_Bodhisattva.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local faithCost = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
			player:ChangeFaith(-faithCost)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_EVENT_JFD_BODHISATTVA_PIETY_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BODHISATTVA_PIETY"))
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_RTP_Piety_Bodhisattva.Outcomes[3] = {}
	Event_JFD_RTP_Piety_Bodhisattva.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_BODHISATTVA_PIETY_OUTCOME_3"
	Event_JFD_RTP_Piety_Bodhisattva.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_BODHISATTVA_PIETY_OUTCOME_RESULT_3"
	Event_JFD_RTP_Piety_Bodhisattva.Outcomes[3].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local faithCost = JFD_GetEraAdjustedValue(playerID, mathCeil(25*iMod))
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(4*iMod))
			Event_JFD_RTP_Piety_Bodhisattva.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BODHISATTVA_PIETY_OUTCOME_RESULT_3", faithCost, pietyReward)
			return true
		end
		)
	Event_JFD_RTP_Piety_Bodhisattva.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local faithCost = JFD_GetEraAdjustedValue(playerID, mathCeil(25*iMod))
			local pietyReward = JFD_GetEraAdjustedValue(playerID, mathCeil(4*iMod))
			player:ChangeFaith(-faithCost)
			player:ChangePiety(pietyReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_EVENT_JFD_BODHISATTVA_PIETY_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BODHISATTVA_PIETY"))
		end)
	
tEvents.Event_JFD_RTP_Piety_Bodhisattva = Event_JFD_RTP_Piety_Bodhisattva
--=======================================================================================================================
-- Civ Specific Events
--=======================================================================================================================
-- Israel: Bathsheba
--------------------------------------------------------------------------------------------------------------------------
tEvents.Event_JFD_Leugi_Israel_Bathseba = nil

local Event_JFD_Leugi_Israel_Bathseba = {}
	Event_JFD_Leugi_Israel_Bathseba.Name = "TXT_KEY_EVENT_ISRAEL_BATHSEBA"
	Event_JFD_Leugi_Israel_Bathseba.Desc = "TXT_KEY_EVENT_ISRAEL_BATHSEBA_DESC"
	Event_JFD_Leugi_Israel_Bathseba.Weight = 8
	Event_JFD_Leugi_Israel_Bathseba.CanFunc = (
		function(pPlayer)
			-- Check if the event fired before			
			if load(pPlayer, "Event_JFD_Leugi_Israel_Bathseba") == true then return false end
			--
			-- Check the Civ
			if pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_LEUGI_ISRAEL"] then return false end
			-- Check State Religion
			if (not player:HasStateReligion()) then return false end
			-- Check minimum faith
			local iMinFaith = math.ceil((MinFaithNathan) * iMod)
			if (pPlayer:GetFaith() < iMinFaith) then return false end
			--
			-- Fire the Event! (if chances are met)
			return true
		end
		)
	Event_JFD_Leugi_Israel_Bathseba.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_Leugi_Israel_Bathseba.Outcomes[1] = {}
	Event_JFD_Leugi_Israel_Bathseba.Outcomes[1].Name = "TXT_KEY_EVENT_ISRAEL_BATHSEBA_OUTCOME_1"
	Event_JFD_Leugi_Israel_Bathseba.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_PIETY_ISRAEL_BATHSEBA_OUTCOME_RESULT_1"
	Event_JFD_Leugi_Israel_Bathseba.Outcomes[1].Weight = 10
	Event_JFD_Leugi_Israel_Bathseba.Outcomes[1].CanFunc = (
		function(pPlayer)			
			-- Create Description			
			local iPietyReward = math.ceil(20 * iMod)
			Event_JFD_Leugi_Israel_Bathseba.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PIETY_ISRAEL_BATHSEBA_OUTCOME_RESULT_1", iPietyReward)
			return true
		end
		)
	Event_JFD_Leugi_Israel_Bathseba.Outcomes[1].DoFunc = (
		function(pPlayer) 
			-- Remove all Faith
			pPlayer:SetFaith(0);
			-- Remove Golden Age
			pPlayer:SetGoldenAgeProgressMeter(0)
			local GoldenAgeTurns = pPlayer:GetGoldenAgeTurns()
			pPlayer:ChangeGoldenAgeTurns(-GoldenAgeTurns)
			-- Grant the Great Prophet
			InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_PROPHET, 1)
			-- Grant the Piety
			local iPietyReward = math.ceil(20 * iMod)
			player:ChangePiety(iPietyReward)
			-- Save the event
			save(pPlayer, "Event_JFD_Leugi_Israel_Bathseba", true)
			-- Send the notification
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_ISRAEL_BATHSEBA_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_ISRAEL_BATHSEBA"))
			Event_JFD_Leugi_Israel_Bathseba.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_ISRAEL_BATHSEBA_DESC")
			for _, nPlayer in pairs(Players) do
				if (nPlayer:IsAlive()) then
					local pteamID = pPlayer:GetTeam();
					local pTeam = Teams[pteamID];
					local notifyteamID = nPlayer:GetTeam();
					local nTeam = Teams[notifyteamID];
					if (nTeam:IsHasMet(pTeam)) then
						if nPlayer:IsHuman() then
							Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_EVENT_ISRAEL_BATHSEBA_OTHERS_ALERT"))
						end
					end
				end
			end
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_Leugi_Israel_Bathseba.Outcomes[2] = {}
	Event_JFD_Leugi_Israel_Bathseba.Outcomes[2].Name = "TXT_KEY_EVENT_ISRAEL_BATHSEBA_OUTCOME_2"
	Event_JFD_Leugi_Israel_Bathseba.Outcomes[2].Desc = "TXT_KEY_EVENT_ISRAEL_BATHSEBA_OUTCOME_RESULT_2"
	Event_JFD_Leugi_Israel_Bathseba.Outcomes[2].Weight = 0
	Event_JFD_Leugi_Israel_Bathseba.Outcomes[2].CanFunc = (
		function(pPlayer)			
			-- Create Description			
			Event_JFD_Leugi_Israel_Bathseba.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_ISRAEL_BATHSEBA_OUTCOME_RESULT_2", NathanUnhappinessCost)
			return true
		end
		)
	Event_JFD_Leugi_Israel_Bathseba.Outcomes[2].DoFunc = (
		function(pPlayer) 
			-- Generate Unhappiness
			iActualUnhappiness = NathanUnhappinessCost * 100
			pPlayer:ChangeUnhappinessFromUnits(iActualUnhappiness)
			-- Save the event
			save(pPlayer, "Event_JFD_Leugi_Israel_Bathseba", true)
			-- Send the notification
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_ISRAEL_BATHSEBA_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_ISRAEL_BATHSEBA"))
			Event_JFD_Leugi_Israel_Bathseba.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_ISRAEL_BATHSEBA_DESC")
			for _, nPlayer in pairs(Players) do
				if (nPlayer:IsAlive()) then
					local pteamID = pPlayer:GetTeam();
					local pTeam = Teams[pteamID];
					local notifyteamID = nPlayer:GetTeam(); 
					local nTeam = Teams[notifyteamID];
					if (nTeam:IsHasMet(pTeam)) then
						if nPlayer:IsHuman() then
							Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_EVENT_ISRAEL_BATHSEBA_OTHERS_ALERT"))
						end
					end
				end
			end
		end)
		
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_Leugi_Israel_Bathseba.Outcomes[3] = {}
	Event_JFD_Leugi_Israel_Bathseba.Outcomes[3].Name = "TXT_KEY_EVENT_ISRAEL_BATHSEBA_OUTCOME_3"
	Event_JFD_Leugi_Israel_Bathseba.Outcomes[3].Desc = "TXT_KEY_EVENT_ISRAEL_BATHSEBA_OUTCOME_RESULT_3"
	Event_JFD_Leugi_Israel_Bathseba.Outcomes[3].Weight = 5
	Event_JFD_Leugi_Israel_Bathseba.Outcomes[3].CanFunc = (
		function(pPlayer)	
			-- Get Gold Cost
			local iGoldCost = math.ceil((BribeCostNathan) * iMod)		
			-- Create Description			
			Event_JFD_Leugi_Israel_Bathseba.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_ISRAEL_BATHSEBA_OUTCOME_RESULT_3", iGoldCost)
			if pPlayer:GetGold() < iGoldCost then return false end
			return true
		end
		)
	Event_JFD_Leugi_Israel_Bathseba.Outcomes[3].DoFunc = (
		function(pPlayer) 
			-- Get Gold Cost
			local iGoldCost = math.ceil((BribeCostNathan) * iMod)	
			pPlayer:ChangeGold(-iGoldCost);
			-- Roll the dice!
			rNum = (Game.Rand(3, "Randomness!"))
			if rNum == 0 then
				-- Grant the Great Prophet
				InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_PROPHET, 1)
			else
				-- Remove all Faith
				pPlayer:SetFaith(0);
			end
			-- Save the event
			save(pPlayer, "Event_JFD_Leugi_Israel_Bathseba", true)
			-- Send the notification
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_ISRAEL_BATHSEBA_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_ISRAEL_BATHSEBA"))
			Event_JFD_Leugi_Israel_Bathseba.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_ISRAEL_BATHSEBA_DESC")
			for _, nPlayer in pairs(Players) do
				if (nPlayer:IsAlive()) then
					local pteamID = pPlayer:GetTeam();
					local pTeam = Teams[pteamID];
					local notifyteamID = nPlayer:GetTeam();
					local nTeam = Teams[notifyteamID];
					if (nTeam:IsHasMet(pTeam)) then
						if nPlayer:IsHuman() then
							Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_EVENT_ISRAEL_BATHSEBA_OTHERS_ALERT"))
						end
					end
				end
			end
		end)

Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_LEUGI_ISRAEL"], "Event_JFD_Leugi_Israel_Bathseba", Event_JFD_Leugi_Israel_Bathseba)
--=======================================================================================================================
--=======================================================================================================================
