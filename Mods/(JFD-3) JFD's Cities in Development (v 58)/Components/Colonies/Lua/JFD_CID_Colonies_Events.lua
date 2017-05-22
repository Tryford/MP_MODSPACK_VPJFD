-- JFD_CID_Colonies_Events
-- Author: JFD
-- DateCreated: 3/24/2016 11:32:05 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_CID_ColoniesUtils.lua")
include("JFD_CID_HealthUtils.lua")
include("JFD_CID_LoyaltyUtils.lua")
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingColoniesCore = JFD_GetUserSetting("JFD_CID_COLONIES_CORE") == 1
local userSettingHealthCore   = JFD_GetUserSetting("JFD_CID_HEALTH_CORE") == 1
local userSettingLoyaltyCore  = JFD_GetUserSetting("JFD_CID_LOYALTY_CORE") == 1
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
-- Colonies: Colonial Assembly
--------------------------------------------------------------------------------------------------------------------------
local eventColoniesColonialAssemblyColony = nil
local Event_JFD_CID_Colonies_ColonialAssembly = {}
	Event_JFD_CID_Colonies_ColonialAssembly.Name = "TXT_KEY_EVENT_JFD_CID_COLONIES_COLONIAL_ASSEMBLY"
	Event_JFD_CID_Colonies_ColonialAssembly.Desc = "TXT_KEY_EVENT_JFD_CID_COLONIES_COLONIAL_ASSEMBLY_DESC"
	Event_JFD_CID_Colonies_ColonialAssembly.Weight = 10
	Event_JFD_CID_Colonies_ColonialAssembly.CanFunc = (
		function(player)	
			local playerID = player:GetID()
			Event_JFD_CID_Colonies_ColonialAssembly.Weight = (JFD_GetNumColonies(playerID)*3)
			local colonies = {}
			local count = 1
			for city in player:Cities() do
				if JFD_IsCityColony(city) then
					 colonies[count] = city
					 count = count + 1
				end
			end
			eventColoniesColonialAssemblyColony = colonies[GetRandom(1,#colonies)]
			if (not eventColoniesColonialAssemblyColony) then return false end
			Event_JFD_CID_Colonies_ColonialAssembly.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_COLONIES_COLONIAL_ASSEMBLY_DESC", eventColoniesColonialAssemblyColony:GetName())
			return true
		end
		)
	Event_JFD_CID_Colonies_ColonialAssembly.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CID_Colonies_ColonialAssembly.Outcomes[1] = {}
	Event_JFD_CID_Colonies_ColonialAssembly.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_CID_COLONIES_COLONIAL_ASSEMBLY_OUTCOME_1"
	Event_JFD_CID_Colonies_ColonialAssembly.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_CID_COLONIES_COLONIAL_ASSEMBLY_OUTCOME_RESULT_1"
	Event_JFD_CID_Colonies_ColonialAssembly.Outcomes[1].Weight = 5
	Event_JFD_CID_Colonies_ColonialAssembly.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local revoltCounter = JFD_GetRevoltCounter(playerID, eventColoniesColonialAssemblyColony)
			Event_JFD_CID_Colonies_ColonialAssembly.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_COLONIES_COLONIAL_ASSEMBLY_OUTCOME_RESULT_1", eventColoniesColonialAssemblyColony:GetName(), revoltCounter)
			return true
		end
		)
	Event_JFD_CID_Colonies_ColonialAssembly.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local revoltCounter = JFD_GetRevoltCounter(playerID, eventColoniesColonialAssemblyColony)
			eventColoniesColonialAssemblyColony:ChangeResistanceTurns(1)
			JFD_ChangeRevoltCounter(playerID, eventColoniesColonialAssemblyColony, revoltCounter)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CID_COLONIES_COLONIAL_ASSEMBLY_OUTCOME_RESULT_1_NOTIFICATION", eventColoniesColonialAssemblyColony:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_COLONIES_COLONIAL_ASSEMBLY"))
		end)
	----=========================================================
	---- Outcome 2
	----=========================================================
	Event_JFD_CID_Colonies_ColonialAssembly.Outcomes[2] = {}
	Event_JFD_CID_Colonies_ColonialAssembly.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_CID_COLONIES_COLONIAL_ASSEMBLY_OUTCOME_2"
	Event_JFD_CID_Colonies_ColonialAssembly.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_CID_COLONIES_COLONIAL_ASSEMBLY_OUTCOME_RESULT_2"
	Event_JFD_CID_Colonies_ColonialAssembly.Outcomes[2].Weight = 5
	Event_JFD_CID_Colonies_ColonialAssembly.Outcomes[2].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local revoltCost = 50
			local goldenAgeReward = mathCeil(40*iMod)
			local loyaltyID = JFD_GetCityLoyaltyID(playerID, eventColoniesColonialAssemblyColony)
			local loyalty = GameInfo.JFD_Loyalties[loyaltyID]
			local revoltCounter = JFD_GetRevoltCounter(playerID, eventColoniesColonialAssemblyColony)
			Event_JFD_CID_Colonies_ColonialAssembly.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_COLONIES_COLONIAL_ASSEMBLY_OUTCOME_RESULT_2", eventColoniesColonialAssemblyColony:GetName(), revoltCost, loyalty.Description, revoltCounter, goldenAgeReward)
			return true
		end
		)
	Event_JFD_CID_Colonies_ColonialAssembly.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local revoltCost = 50
			local goldenAgeReward = mathCeil(40*iMod)
			JFD_ChangeRevoltCounter(playerID, eventColoniesColonialAssemblyColony, revoltCost)
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CID_COLONIES_COLONIAL_ASSEMBLY_OUTCOME_RESULT_2_NOTIFICATION", eventColoniesColonialAssemblyColony:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_COLONIES_COLONIAL_ASSEMBLY"))
		end)
if (userSettingColoniesCore and userSettingLoyaltyCore) then
	tEvents.Event_JFD_CID_Colonies_ColonialAssembly = Event_JFD_CID_Colonies_ColonialAssembly
end
--------------------------------------------------------------------------------------------------------------------------
-- Colonies: Colonial Migration
--------------------------------------------------------------------------------------------------------------------------
local eventColoniesColonialMigrationColony = nil
local Event_JFD_CID_Colonies_ColonialMigration = {}
	Event_JFD_CID_Colonies_ColonialMigration.Name = "TXT_KEY_EVENT_JFD_CID_COLONIES_COLONIAL_MIGRATION"
	Event_JFD_CID_Colonies_ColonialMigration.Desc = "TXT_KEY_EVENT_JFD_CID_COLONIES_COLONIAL_MIGRATION_DESC"
	Event_JFD_CID_Colonies_ColonialMigration.Weight = 10
	Event_JFD_CID_Colonies_ColonialMigration.CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, (100*iMod))
			Event_JFD_CID_Colonies_ColonialMigration.Weight = (JFD_GetNumColonies(playerID)*3)
			if player:GetGold() < goldCost then return false end
			local colonies = {}
			local count = 1
			for city in player:Cities() do
				if JFD_IsCityColony(city) then
					 colonies[count] = city
					 count = count + 1
				end
			end
			eventColoniesColonialMigrationColony = colonies[GetRandom(1,#colonies)]
			if (not eventColoniesColonialMigrationColony) then return false end
			Event_JFD_CID_Colonies_ColonialMigration.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_COLONIES_COLONIAL_MIGRATION_DESC", eventColoniesColonialMigrationColony:GetName())
			return true
		end
		)
	Event_JFD_CID_Colonies_ColonialMigration.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CID_Colonies_ColonialMigration.Outcomes[1] = {}
	Event_JFD_CID_Colonies_ColonialMigration.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_CID_COLONIES_COLONIAL_MIGRATION_OUTCOME_1"
	Event_JFD_CID_Colonies_ColonialMigration.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_CID_COLONIES_COLONIAL_MIGRATION_OUTCOME_RESULT_1"
	Event_JFD_CID_Colonies_ColonialMigration.Outcomes[1].Weight = 5
	Event_JFD_CID_Colonies_ColonialMigration.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, (100*iMod))
			Event_JFD_CID_Colonies_ColonialMigration.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_COLONIES_COLONIAL_MIGRATION_OUTCOME_RESULT_1", goldCost, eventColoniesColonialMigrationColony:GetName(), player:GetCapitalCity():GetPopulation())
			return true
		end
		)
	Event_JFD_CID_Colonies_ColonialMigration.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, (100*iMod))
			player:ChangeGold(-goldCost)
			player:GetCapitalCity():ChangePopulation(1,true)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CID_COLONIES_COLONIAL_MIGRATION_OUTCOME_RESULT_1_NOTIFICATION", eventColoniesColonialMigrationColony:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_COLONIES_COLONIAL_MIGRATION"))
		end)
	----=========================================================
	---- Outcome 2
	----=========================================================
	Event_JFD_CID_Colonies_ColonialMigration.Outcomes[2] = {}
	Event_JFD_CID_Colonies_ColonialMigration.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_CID_COLONIES_COLONIAL_MIGRATION_OUTCOME_2"
	Event_JFD_CID_Colonies_ColonialMigration.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_CID_COLONIES_COLONIAL_MIGRATION_OUTCOME_RESULT_2"
	Event_JFD_CID_Colonies_ColonialMigration.Outcomes[2].Weight = 5
	Event_JFD_CID_Colonies_ColonialMigration.Outcomes[2].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local plagueCost = JFD_GetEraAdjustedValue(playerID, 50)
			local plagueThreshold = JFD_GetPlagueThreshold(playerID, eventColoniesColonialMigrationColony)
			local statusDesc = "[COLOR_JFD_DISEASE][ICON_JFD_DISEASE] Diseased[ENDCOLOR]"
			if JFD_GetHealthExcess(playerID, eventColoniesColonialMigrationColony) >= JFD_GetDiseaseExcess(playerID, eventColoniesColonialMigrationColony) then
				statusDesc = "[COLOR_JFD_HEALTH][ICON_JFD_HEALTH] Healthy[ENDCOLOR]"
			end
			local plagueCounter = JFD_GetPlagueCounter(playerID, eventColoniesColonialMigrationColony)
			Event_JFD_CID_Colonies_ColonialMigration.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_COLONIES_COLONIAL_MIGRATION_OUTCOME_RESULT_2", eventColoniesColonialMigrationColony:GetName(), plagueCost, plagueCounter, statusDesc, eventColoniesColonialMigrationColony:GetPopulation(), plagueThreshold)
			return true
		end
		)
	Event_JFD_CID_Colonies_ColonialMigration.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local plagueCost = JFD_GetEraAdjustedValue(playerID, 50)
			JFD_ChangePlagueCounter(playerID, eventColoniesColonialMigrationColony, plagueCost)
			eventColoniesColonialMigrationColony:ChangePopulation(1, true)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CID_COLONIES_COLONIAL_MIGRATION_OUTCOME_RESULT_2_NOTIFICATION", eventColoniesColonialMigrationColony:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_COLONIES_COLONIAL_MIGRATION"))
		end)
if (userSettingColoniesCore and userSettingHealthCore) then
	tEvents.Event_JFD_CID_Colonies_ColonialMigration = Event_JFD_CID_Colonies_ColonialMigration
end
--=======================================================================================================================
--=======================================================================================================================


