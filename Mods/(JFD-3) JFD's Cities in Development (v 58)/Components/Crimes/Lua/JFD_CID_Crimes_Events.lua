-- JFD_CID_Crimes_Events
-- Author: JFD
-- DateCreated: 11/10/2015 1:25:07 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_CID_CrimesUtils.lua")
include("JFD_CID_HappinessUtils.lua")
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingHappinessCore = JFD_GetUserSetting("JFD_CID_HAPPINESS_CORE") == 1
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILITIES
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetCrimeCity
function JFD_GetCrimeCity(player, crimeID, isOrganizedCrime)
	local cities = {}
	local count = 1
	if isOrganizedCrime then
		for city in player:Cities() do
			if JFD_IsOrganizedCrime(player:GetID(), city, crimeID) then
				cities[count] = city
				count = count + 1
			end
		end
	else
		local yieldID = GameInfoTypes[GameInfo.JFD_Crimes[crimeID].YieldType]
		for city in player:Cities() do
			if Sukritact_GetCrimeValue(player:GetID(), city, nil, yieldID) >= 30 then
				cities[count] = city
				count = count + 1
			end
		end
	end
	return cities[GetRandom(1,#cities)]
end

-- JFD_GetEraAdjustedValue
local mathCeil = math.ceil
function JFD_GetEraAdjustedValue(playerID, num)
	local player = Players[playerID]
	local currentEraID = player:GetCurrentEra()
	local eraMod = GameInfo.Eras[currentEraID].ResearchAgreementCost
	return mathCeil(num * eraMod/100)
end 

-- JFD_IsLeaderFeminine
function JFD_IsLeaderFeminine(playerID)
	local player = Players[playerID]
	local leaderText = GameInfo.Leaders[player:GetLeaderType()]
	for row in DB.Query("SELECT Gender FROM Language_en_US WHERE Tag = '" .. leaderText.Description .. "' AND Gender = 'feminine'") do
		return true
	end
	return false
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
-- Crimes: Abduction
--------------------------------------------------------------------------------------------------------------------------
local crimeAbductionID = GameInfoTypes["CRIME_JFD_TOURISM"]
local eventAbductionCity = nil
local eventAbductionCityState = nil
local Event_JFD_CID_Crimes_Abduction = {}
	Event_JFD_CID_Crimes_Abduction.Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_ABDUCTION"
	Event_JFD_CID_Crimes_Abduction.Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_ABDUCTION_DESC"
	Event_JFD_CID_Crimes_Abduction.EventImage = "Event_Abduction.dds"
	Event_JFD_CID_Crimes_Abduction.Weight = 5
	Event_JFD_CID_Crimes_Abduction.CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local playerTeam = Teams[player:GetTeam()]
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(140*iMod))
			if player:GetGold() < goldCost then return false end
			eventAbductionCity = JFD_GetCrimeCity(player, crimeAbductionID, false)
			if (not eventAbductionCity) then return false end
			local minorPlayers = {}
			local count = 1
			for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
				local otherPlayer = Players[otherPlayerID]
				local otherPlayerTeamID = otherPlayer:GetTeam()
				if (otherPlayer:IsMinorCiv() and otherPlayer:IsAlive()) then
					if playerTeam:IsHasMet(otherPlayerTeamID) then
						minorPlayers[count] = Players[otherPlayerID]
						count = count + 1
					end
				end
			end
			eventAbductionCityState = minorPlayers[GetRandom(1, #minorPlayers)]
			if (not eventAbductionCityState) then return false end
			Event_JFD_CID_Crimes_Abduction.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_ABDUCTION_DESC", eventAbductionCityState:GetName(), eventAbductionCity:GetName())
			return true
		end
		)
	Event_JFD_CID_Crimes_Abduction.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CID_Crimes_Abduction.Outcomes[1] = {}
	Event_JFD_CID_Crimes_Abduction.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_ABDUCTION_OUTCOME_1"
	Event_JFD_CID_Crimes_Abduction.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_ABDUCTION_OUTCOME_RESULT_1"
	Event_JFD_CID_Crimes_Abduction.Outcomes[1].Weight = 5
	Event_JFD_CID_Crimes_Abduction.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local influenceCost = JFD_GetEraAdjustedValue(playerID, mathCeil(20*iMod))
			Event_JFD_CID_Crimes_Abduction.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_ABDUCTION_OUTCOME_RESULT_1", eventAbductionCityState:GetName(), influenceCost)
			return true
		end
		)
	Event_JFD_CID_Crimes_Abduction.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local influenceCost = JFD_GetEraAdjustedValue(playerID, mathCeil(20*iMod))
			eventAbductionCityState:ChangeMinorCivFriendshipWithMajor(playerID, -influenceCost)	
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CRIMES_ABDUCTION_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_ABDUCTION"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENT_CRIMES_ABDUCTION", eventAbductionCityState:GetName(), player:GetCivilizationAdjective(), eventAbductionCity:GetName())) 
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CID_Crimes_Abduction.Outcomes[2] = {}
	Event_JFD_CID_Crimes_Abduction.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_ABDUCTION_OUTCOME_2"
	Event_JFD_CID_Crimes_Abduction.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_ABDUCTION_OUTCOME_RESULT_2"
	Event_JFD_CID_Crimes_Abduction.Outcomes[2].Weight = 5
	Event_JFD_CID_Crimes_Abduction.Outcomes[2].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(140*iMod))
			local influenceCost = JFD_GetEraAdjustedValue(playerID, mathCeil(8*iMod))
			Event_JFD_CID_Crimes_Abduction.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_ABDUCTION_OUTCOME_RESULT_2", eventAbductionCityState:GetName(), influenceCost, goldCost)
			return true
		end
		)
	Event_JFD_CID_Crimes_Abduction.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(140*iMod))
			local influenceCost = JFD_GetEraAdjustedValue(playerID, mathCeil(8*iMod))
			eventAbductionCityState:ChangeMinorCivFriendshipWithMajor(playerID, -influenceCost)	
			player:ChangeGold(-goldCost)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CRIMES_ABDUCTION_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_ABDUCTION"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENT_CRIMES_ABDUCTION", eventAbductionCityState:GetName(), player:GetCivilizationAdjective(), eventAbductionCity:GetName())) 
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_CID_Crimes_Abduction.Outcomes[3] = {}
	Event_JFD_CID_Crimes_Abduction.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_ABDUCTION_OUTCOME_3"
	Event_JFD_CID_Crimes_Abduction.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_ABDUCTION_OUTCOME_RESULT_3"
	Event_JFD_CID_Crimes_Abduction.Outcomes[3].Weight = 5
	Event_JFD_CID_Crimes_Abduction.Outcomes[3].CanFunc = (
		function(player)	
			Event_JFD_CID_Crimes_Abduction.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_ABDUCTION_OUTCOME_RESULT_3", eventAbductionCity:GetName())
			return true
		end
		)
	Event_JFD_CID_Crimes_Abduction.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			eventAbductionCity:ChangeResistanceTurns(2)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CRIMES_ABDUCTION_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_ABDUCTION"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENT_CRIMES_ABDUCTION", eventAbductionCityState:GetName(), player:GetCivilizationAdjective(), eventAbductionCity:GetName())) 
		end)

tEvents.Event_JFD_CID_Crimes_Abduction = Event_JFD_CID_Crimes_Abduction
--------------------------------------------------------------------------------------------------------------------------
-- Crimes: Corruption
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_CID_Crimes_Corruption = {}
	Event_JFD_CID_Crimes_Corruption.Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_CORRUPTION"
	Event_JFD_CID_Crimes_Corruption.Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_CORRUPTION_DESC"
	Event_JFD_CID_Crimes_Corruption.EventImage = "Event_Corruption.dds"
	Event_JFD_CID_Crimes_Corruption.Weight = 5
	Event_JFD_CID_Crimes_Corruption.CanFunc = (
		function(player)			
			if player:GetNumResourceAvailable(resourceMagistrateID, false) < 1 then return false end
			return true
		end
		)
	Event_JFD_CID_Crimes_Corruption.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CID_Crimes_Corruption.Outcomes[1] = {}
	Event_JFD_CID_Crimes_Corruption.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_CORRUPTION_OUTCOME_1"
	Event_JFD_CID_Crimes_Corruption.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_CORRUPTION_OUTCOME_RESULT_1"
	Event_JFD_CID_Crimes_Corruption.Outcomes[1].Weight = 5
	Event_JFD_CID_Crimes_Corruption.Outcomes[1].CanFunc = (
		function(player)			
			local goldReward = mathCeil(200*iMod)
			Event_JFD_CID_Crimes_Corruption.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_CORRUPTION_OUTCOME_RESULT_1", goldReward)
			return true
		end
		)
	Event_JFD_CID_Crimes_Corruption.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldReward = mathCeil(200*iMod)
			player:ChangeNumResourceTotal(resourceMagistrateID, -1)
			player:ChangeGold(goldReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CRIMES_CORRUPTION_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_CORRUPTION"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CID_Crimes_Corruption.Outcomes[2] = {}
	Event_JFD_CID_Crimes_Corruption.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_CORRUPTION_OUTCOME_2"
	Event_JFD_CID_Crimes_Corruption.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_CORRUPTION_OUTCOME_RESULT_2"
	Event_JFD_CID_Crimes_Corruption.Outcomes[2].Weight = 5
	Event_JFD_CID_Crimes_Corruption.Outcomes[2].CanFunc = (
		function(player)			
			local goldenAgeCost = ((player:GetGoldenAgeProgressMeter()*30)/100)
			Event_JFD_CID_Crimes_Corruption.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_CORRUPTION_OUTCOME_RESULT_2", goldenAgeCost)
			return true
		end
		)
	Event_JFD_CID_Crimes_Corruption.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldenAgeCost = ((player:GetGoldenAgeProgressMeter()*30)/100)
			player:ChangeGoldenAgeProgressMeter(-goldenAgeCost)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CRIMES_CORRUPTION_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_CORRUPTION"))
		end)

tEvents.Event_JFD_CID_Crimes_Corruption = Event_JFD_CID_Crimes_Corruption
--------------------------------------------------------------------------------------------------------------------------
-- Crimes: Fraud
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_CID_Crimes_Fraud = {}
	Event_JFD_CID_Crimes_Fraud.Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_FRAUD"
	Event_JFD_CID_Crimes_Fraud.Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_FRAUD_DESC"
	Event_JFD_CID_Crimes_Fraud.EventImage = "Event_Fraud.dds"
	Event_JFD_CID_Crimes_Fraud.Weight = 5
	Event_JFD_CID_Crimes_Fraud.CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local currentResearchID = 	player:GetCurrentResearch()	
			if currentResearchID <= 0 then return false end
			if player:GetCurrentEra() < eraRenaissanceID then return false end
			local scienceCost = JFD_GetEraAdjustedValue(playerID, mathCeil(40*iMod))
			local teamTechs = Teams[player:GetTeam()]:GetTeamTechs()
			if teamTechs:GetResearchProgress(currentResearchID) < scienceCost then return false end
			return true
		end
		)
	Event_JFD_CID_Crimes_Fraud.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CID_Crimes_Fraud.Outcomes[1] = {}
	Event_JFD_CID_Crimes_Fraud.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_FRAUD_OUTCOME_1"
	Event_JFD_CID_Crimes_Fraud.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_FRAUD_OUTCOME_RESULT_1"
	Event_JFD_CID_Crimes_Fraud.Outcomes[1].Weight = 5
	Event_JFD_CID_Crimes_Fraud.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local scienceCost = JFD_GetEraAdjustedValue(playerID, mathCeil(40*iMod))
			local goldenAgeReward = JFD_GetEraAdjustedValue(playerID, mathCeil(100*iMod))
			Event_JFD_CID_Crimes_Fraud.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_FRAUD_OUTCOME_RESULT_1", scienceCost, goldenAgeReward)
			return true
		end
		)
	Event_JFD_CID_Crimes_Fraud.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local scienceCost = JFD_GetEraAdjustedValue(playerID, mathCeil(40*iMod))
			local goldenAgeReward = JFD_GetEraAdjustedValue(playerID, mathCeil(100*iMod))
			local teamTechs = Teams[player:GetTeam()]:GetTeamTechs()
			teamTechs:ChangeResearchProgress(player:GetCurrentResearch(), -scienceCost)
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CRIMES_FRAUD_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_FRAUD"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CID_Crimes_Fraud.Outcomes[2] = {}
	Event_JFD_CID_Crimes_Fraud.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_FRAUD_OUTCOME_2"
	Event_JFD_CID_Crimes_Fraud.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_FRAUD_OUTCOME_RESULT_2"
	Event_JFD_CID_Crimes_Fraud.Outcomes[2].Weight = 5
	Event_JFD_CID_Crimes_Fraud.Outcomes[2].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil(70*iMod))
			Event_JFD_CID_Crimes_Fraud.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_FRAUD_OUTCOME_RESULT_2", cultureReward)
			return true
		end
		)
	Event_JFD_CID_Crimes_Fraud.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil(70*iMod))
			player:ChangeJONSCulture(cultureReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CRIMES_FRAUD_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_FRAUD"))
		end)

tEvents.Event_JFD_CID_Crimes_Fraud = Event_JFD_CID_Crimes_Fraud
--------------------------------------------------------------------------------------------------------------------------
-- Crimes: Heresy
--------------------------------------------------------------------------------------------------------------------------
local crimeHeresyID = GameInfoTypes["CRIME_JFD_FAITH"]
local eventHeresyCity = nil
local Event_JFD_CID_Crimes_Heresy = {}
	Event_JFD_CID_Crimes_Heresy.Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_HERESY"
	Event_JFD_CID_Crimes_Heresy.Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_HERESY_DESC"
	Event_JFD_CID_Crimes_Heresy.EventImage = "Event_Heresy.dds"
	Event_JFD_CID_Crimes_Heresy.Weight = 5
	Event_JFD_CID_Crimes_Heresy.CanFunc = (
		function(player)	
			local playerID = player:GetID()
			if isUsingPiety then
				if (not player:HasStateReligion()) then return false end
			end
			eventHeresyCity = JFD_GetCrimeCity(player, crimeHeresyID, false)
			if (not eventHeresyCity) then return false end
			local cost = JFD_GetEraAdjustedValue(playerID, mathCeil(45*iMod))
			if isUsingPiety then
				cost = JFD_GetEraAdjustedValue(playerID, mathCeil(7*iMod))
				if player:GetPiety() < cost then return false end
			else
				if player:GetFaith() < cost then return false end
			end
			Event_JFD_CID_Crimes_Heresy.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_HERESY_DESC", eventHeresyCity:GetName())
			return true
		end
		)
	Event_JFD_CID_Crimes_Heresy.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CID_Crimes_Heresy.Outcomes[1] = {}
	Event_JFD_CID_Crimes_Heresy.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_HERESY_OUTCOME_1"
	Event_JFD_CID_Crimes_Heresy.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_HERESY_OUTCOME_RESULT_1"
	Event_JFD_CID_Crimes_Heresy.Outcomes[1].Weight = 5
	Event_JFD_CID_Crimes_Heresy.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local reward = JFD_GetEraAdjustedValue(playerID, mathCeil(45*iMod))
			local rewardYield = "[ICON_PEACE] Faith"
			if isUsingPiety then
				reward = JFD_GetEraAdjustedValue(playerID, mathCeil(7*iMod))
				rewardYield = "[ICON_JFD_PIETY] Piety"
			end
			Event_JFD_CID_Crimes_Heresy.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_HERESY_OUTCOME_RESULT_1", eventHeresyCity:GetName(), reward, rewardYield)
			return true
		end
		)
	Event_JFD_CID_Crimes_Heresy.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local reward = JFD_GetEraAdjustedValue(playerID, mathCeil(45*iMod))
			local rewardYield = "[ICON_PEACE] Faith"
			if isUsingPiety then
				reward = JFD_GetEraAdjustedValue(playerID, mathCeil(7*iMod))
				player:ChangePiety(-reward)
			else
				player:ChangeFaith(-reward)
			end
			if GetRandom(1,10) <= 3 then
				eventHeresyCity:ChangeResistanceTurns(3)
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CRIMES_HERESY_OUTCOME_RESULT_1_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_HERESY"))
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CRIMES_HERESY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_HERESY"))
			end
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CID_Crimes_Heresy.Outcomes[2] = {}
	Event_JFD_CID_Crimes_Heresy.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_HERESY_OUTCOME_2"
	Event_JFD_CID_Crimes_Heresy.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_HERESY_OUTCOME_RESULT_2"
	Event_JFD_CID_Crimes_Heresy.Outcomes[2].Weight = 5
	Event_JFD_CID_Crimes_Heresy.Outcomes[2].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil(60*iMod))
			local cost = JFD_GetEraAdjustedValue(playerID, mathCeil(45*iMod))
			local costYield = "[ICON_PEACE] Faith"
			if isUsingPiety then
				cost = JFD_GetEraAdjustedValue(playerID, mathCeil(7*iMod))
				costYield = "[ICON_JFD_PIETY] Piety"
			end
			Event_JFD_CID_Crimes_Heresy.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_HERESY_OUTCOME_RESULT_2", cost, costYield, cultureReward)
			return true
		end
		)
	Event_JFD_CID_Crimes_Heresy.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil(60*iMod))
			local cost = JFD_GetEraAdjustedValue(playerID, mathCeil(45*iMod))
			if isUsingPiety then
				cost = JFD_GetEraAdjustedValue(playerID, mathCeil(7*iMod))
				player:ChangePiety(-cost)
			else
				player:ChangeFaith(-cost)
			end
			player:ChangeJONSCulture(cultureReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CRIMES_HERESY_OUTCOME_RESULT_2_NOTIFICATION", eventHeresyCity:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_HERESY"))
		end)

tEvents.Event_JFD_CID_Crimes_Heresy = Event_JFD_CID_Crimes_Heresy
--------------------------------------------------------------------------------------------------------------------------
-- Crimes: Theft
--------------------------------------------------------------------------------------------------------------------------
local crimeTheftID = GameInfoTypes["CRIME_JFD_PRODUCTION"]
local eventTheftResourceID = nil
local Event_JFD_CID_Crimes_Theft = {}
	Event_JFD_CID_Crimes_Theft.Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_THEFT"
	Event_JFD_CID_Crimes_Theft.Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_THEFT_DESC"
	Event_JFD_CID_Crimes_Theft.EventImage = "Event_Theft.dds"
	Event_JFD_CID_Crimes_Theft.Weight = 5
	Event_JFD_CID_Crimes_Theft.CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(150*iMod))
			if player:GetGold() < goldCost then return false end
			local resourceCost = JFD_GetEraAdjustedValue(playerID, 1)
			local resources = {}
			local count = 1
			for row in GameInfo.Resources("Type = 'RESOURCE_IRON' OR Type = 'RESOURCE_HORSE' OR ResourceClassType = 'RESOURCECLASS_MODERN'") do
				if player:GetNumResourceAvailable(row.ID, true) >= resourceCost then
					resources[count] = row.ID
					count = count + 1
				end
			end
			eventTheftResourceID = resources[GetRandom(1, #resources)]
			if (not eventTheftResourceID) then return false end
			Event_JFD_CID_Crimes_Theft.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_THEFT_DESC", GameInfo.Resources[eventTheftResourceID].IconString, GameInfo.Resources[eventTheftResourceID].Description)
			return true
		end
		)
	Event_JFD_CID_Crimes_Theft.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CID_Crimes_Theft.Outcomes[1] = {}
	Event_JFD_CID_Crimes_Theft.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_THEFT_OUTCOME_1"
	Event_JFD_CID_Crimes_Theft.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_THEFT_OUTCOME_RESULT_1"
	Event_JFD_CID_Crimes_Theft.Outcomes[1].Weight = 5
	Event_JFD_CID_Crimes_Theft.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(150*iMod))
			Event_JFD_CID_Crimes_Theft.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_THEFT_OUTCOME_RESULT_1", goldCost)
			return true
		end
		)
	Event_JFD_CID_Crimes_Theft.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(150*iMod))
			player:ChangeGold(-goldCost)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CRIMES_THEFT_OUTCOME_RESULT_1_NOTIFICATION", GameInfo.Resources[eventTheftResourceID].IconString, GameInfo.Resources[eventTheftResourceID].Description), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_THEFT"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CID_Crimes_Theft.Outcomes[2] = {}
	Event_JFD_CID_Crimes_Theft.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_THEFT_OUTCOME_2"
	Event_JFD_CID_Crimes_Theft.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_THEFT_OUTCOME_RESULT_2"
	Event_JFD_CID_Crimes_Theft.Outcomes[2].Weight = 5
	Event_JFD_CID_Crimes_Theft.Outcomes[2].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local resourceCost = JFD_GetEraAdjustedValue(playerID, 1)
			Event_JFD_CID_Crimes_Theft.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_THEFT_OUTCOME_RESULT_2", resourceCost, GameInfo.Resources[eventTheftResourceID].IconString, GameInfo.Resources[eventTheftResourceID].Description)
			return true
		end
		)
	Event_JFD_CID_Crimes_Theft.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local resourceCost = JFD_GetEraAdjustedValue(playerID, 1)
			player:ChangeNumResourceTotal(eventTheftResourceID, -resourceCost)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CRIMES_THEFT_OUTCOME_RESULT_2_NOTIFICATION", GameInfo.Resources[eventTheftResourceID].IconString, GameInfo.Resources[eventTheftResourceID].Description), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_THEFT"))
		end)

tEvents.Event_JFD_CID_Crimes_Theft = Event_JFD_CID_Crimes_Theft
--------------------------------------------------------------------------------------------------------------------------
-- Crimes: Treason
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_CID_Crimes_Treason = {}
	Event_JFD_CID_Crimes_Treason.Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_TREASON"
	Event_JFD_CID_Crimes_Treason.Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_TREASON_DESC"
	Event_JFD_CID_Crimes_Treason.EventImage = "Event_Treason.dds"
	Event_JFD_CID_Crimes_Treason.Weight = 5
	Event_JFD_CID_Crimes_Treason.CanFunc = (
		function(player)	
			local playerID = player:GetID()
			if (not userSettingHappinessCore) then return false end
			Event_JFD_CID_Crimes_Treason.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_TREASON_DESC")
			return true
		end
		)
	Event_JFD_CID_Crimes_Treason.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CID_Crimes_Treason.Outcomes[1] = {}
	Event_JFD_CID_Crimes_Treason.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_TREASON_OUTCOME_1"
	Event_JFD_CID_Crimes_Treason.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_TREASON_OUTCOME_RESULT_1"
	Event_JFD_CID_Crimes_Treason.Outcomes[1].Weight = 5
	Event_JFD_CID_Crimes_Treason.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local resistanceCounter, resistanceThreshold = JFD_GetResistanceCounter(playerID, city, true)
			resistanceThreshold = (resistanceThreshold*20)/100
			Event_JFD_CID_Crimes_Treason.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_TREASON_OUTCOME_RESULT_1", resistanceCost)
			return true
		end
		)
	Event_JFD_CID_Crimes_Treason.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local resistanceCounter, resistanceThreshold = JFD_GetResistanceCounter(playerID, city, true)
			resistanceThreshold = (resistanceThreshold*20)/100
			JFD_ChangeResistanceCounter(playerID, player:GetCapitalCity(), resistanceCost)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CRIMES_TREASON_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_TREASON"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CID_Crimes_Treason.Outcomes[2] = {}
	Event_JFD_CID_Crimes_Treason.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_TREASON_OUTCOME_2"
	Event_JFD_CID_Crimes_Treason.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_TREASON_OUTCOME_RESULT_2"
	Event_JFD_CID_Crimes_Treason.Outcomes[2].Weight = 5
	Event_JFD_CID_Crimes_Treason.Outcomes[2].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			Event_JFD_CID_Crimes_Treason.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_TREASON_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFD_CID_Crimes_Treason.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			if GetRandom(1,10) <= 5 then
				player:GetCapitalCity():ChangeResistanceTurns(1)
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CRIMES_TREASON_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_TREASON"))
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CRIMES_TREASON_OUTCOME_RESULT_2_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_TREASON"))
			end
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_CID_Crimes_Treason.Outcomes[3] = {}
	Event_JFD_CID_Crimes_Treason.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_TREASON_OUTCOME_3"
	Event_JFD_CID_Crimes_Treason.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_TREASON_OUTCOME_RESULT_3"
	Event_JFD_CID_Crimes_Treason.Outcomes[3].Weight = 5
	Event_JFD_CID_Crimes_Treason.Outcomes[3].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local resistanceReward = JFD_GetResistanceCounter(playerID, player:GetCapitalCity())
			Event_JFD_CID_Crimes_Treason.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_TREASON_OUTCOME_RESULT_3", resistanceReward)
			return true
		end
		)
	Event_JFD_CID_Crimes_Treason.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			JFD_SetResistanceCounter(playerID, player:GetCapitalCity(),0)
			player:GetCapitalCity():ChangeResistanceTurns(1)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CRIMES_TREASON_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_TREASON"))
		end)

tEvents.Event_JFD_CID_Crimes_Treason = Event_JFD_CID_Crimes_Treason
--------------------------------------------------------------------------------------------------------------------------
-- Crimes: Vandalism
--------------------------------------------------------------------------------------------------------------------------
local buildingClassMonumentID = GameInfoTypes["BUILDINGCLASS_MONUMENT"]
local crimeVandalismID = GameInfoTypes["CRIME_JFD_CULTURE"]
local eventVandalismCity = nil
local Event_JFD_CID_Crimes_Vandalism = {}
	Event_JFD_CID_Crimes_Vandalism.Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_VANDALISM"
	Event_JFD_CID_Crimes_Vandalism.Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_VANDALISM_DESC"
	Event_JFD_CID_Crimes_Vandalism.EventImage = "Event_Vandalism.dds"
	Event_JFD_CID_Crimes_Vandalism.Weight = 5
	Event_JFD_CID_Crimes_Vandalism.CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(150*iMod))
			if player:GetGold() < goldCost then return false end
			eventVandalismCity = JFD_GetCrimeCity(player, crimeVandalismID, false)
			if (not eventVandalismCity) then return false end
			if (not eventVandalismCity:HasBuildingClass(buildingClassMonumentID)) then return false end
			if JFD_IsLeaderFeminine(playerID) then Event_JFD_CID_Crimes_Vandalism.EventImage = "Event_VandalismAlt.dds" end
			Event_JFD_CID_Crimes_Vandalism.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_VANDALISM_DESC", eventVandalismCity:GetName())
			return true
		end
		)
	Event_JFD_CID_Crimes_Vandalism.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CID_Crimes_Vandalism.Outcomes[1] = {}
	Event_JFD_CID_Crimes_Vandalism.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_VANDALISM_OUTCOME_1"
	Event_JFD_CID_Crimes_Vandalism.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_VANDALISM_OUTCOME_RESULT_1"
	Event_JFD_CID_Crimes_Vandalism.Outcomes[1].Weight = 5
	Event_JFD_CID_Crimes_Vandalism.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local productionReward = JFD_GetEraAdjustedValue(playerID, mathCeil(20*iMod))
			local buildingMonumentID = player:GetSpecificBuildingType("BUILDINGCLASS_MONUMENT")
			Event_JFD_CID_Crimes_Vandalism.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_VANDALISM_OUTCOME_RESULT_1", GameInfo.Buildings[buildingMonumentID].Description, productionReward, eventVandalismCity:GetName())
			return true
		end
		)
	Event_JFD_CID_Crimes_Vandalism.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local buildingMonumentID = player:GetSpecificBuildingType("BUILDINGCLASS_MONUMENT")
			local productionReward = JFD_GetEraAdjustedValue(playerID, mathCeil(20*iMod))
			eventVandalismCity:ChangeProduction(productionReward)
			eventVandalismCity:SetNumRealBuilding(buildingMonumentID, 0)
			eventVandalismCity:SetNumFreeBuilding(buildingMonumentID, 0)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CRIMES_VANDALISM_OUTCOME_RESULT_1_NOTIFICATION", eventVandalismCity:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_VANDALISM"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CID_Crimes_Vandalism.Outcomes[2] = {}
	Event_JFD_CID_Crimes_Vandalism.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_VANDALISM_OUTCOME_2"
	Event_JFD_CID_Crimes_Vandalism.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_VANDALISM_OUTCOME_RESULT_2"
	Event_JFD_CID_Crimes_Vandalism.Outcomes[2].Weight = 5
	Event_JFD_CID_Crimes_Vandalism.Outcomes[2].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(150*iMod))
			local wLTKDTurns = JFD_GetEraAdjustedValue(playerID, mathCeil(5*iMod))
			Event_JFD_CID_Crimes_Vandalism.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_VANDALISM_OUTCOME_RESULT_2", goldCost, eventVandalismCity:GetName(), wLTKDTurns)
			return true
		end
		)
	Event_JFD_CID_Crimes_Vandalism.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(150*iMod))
			local wLTKDTurns = JFD_GetEraAdjustedValue(playerID, mathCeil(5*iMod))
			player:ChangeGold(-goldCost)
			eventVandalismCity:ChangeWeLoveTheKingDayCounter(5)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CRIMES_VANDALISM_OUTCOME_RESULT_2_NOTIFICATION", eventVandalismCity:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_VANDALISM"))
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_CID_Crimes_Vandalism.Outcomes[3] = {}
	Event_JFD_CID_Crimes_Vandalism.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_VANDALISM_OUTCOME_3"
	Event_JFD_CID_Crimes_Vandalism.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_VANDALISM_OUTCOME_RESULT_3"
	Event_JFD_CID_Crimes_Vandalism.Outcomes[3].Weight = 5
	Event_JFD_CID_Crimes_Vandalism.Outcomes[3].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(30*iMod))
			Event_JFD_CID_Crimes_Vandalism.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_VANDALISM_OUTCOME_RESULT_3", goldCost)
			return true
		end
		)
	Event_JFD_CID_Crimes_Vandalism.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(30*iMod))
			player:ChangeGold(-goldCost)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CRIMES_VANDALISM_OUTCOME_RESULT_3_NOTIFICATION", eventVandalismCity:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_VANDALISM"))
		end)

tEvents.Event_JFD_CID_Crimes_Vandalism = Event_JFD_CID_Crimes_Vandalism
--------------------------------------------------------------------------------------------------------------------------
-- Crimes: Violence
--------------------------------------------------------------------------------------------------------------------------
local crimeViolenceID = GameInfoTypes["CRIME_JFD_FOOD"]
local eventViolenceCity = nil
local Event_JFD_CID_Crimes_Violence = {}
	Event_JFD_CID_Crimes_Violence.Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_VIOLENCE"
	Event_JFD_CID_Crimes_Violence.Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_VIOLENCE_DESC"
	Event_JFD_CID_Crimes_Violence.EventImage = "Event_Violence.dds"
	Event_JFD_CID_Crimes_Violence.Weight = 5
	Event_JFD_CID_Crimes_Violence.CanFunc = (
		function(player)	
			eventViolenceCity = JFD_GetCrimeCity(player, crimeViolenceID, false)
			if (not eventViolenceCity) then return false end
			local goldCost = mathCeil(eventViolenceCity:GetPopulation()*(125*iMod))
			if player:GetGold() < goldCost then return false end
			Event_JFD_CID_Crimes_Violence.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_VIOLENCE_DESC", eventViolenceCity:GetName())
			return true
		end
		)
	Event_JFD_CID_Crimes_Violence.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CID_Crimes_Violence.Outcomes[1] = {}
	Event_JFD_CID_Crimes_Violence.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_VIOLENCE_OUTCOME_1"
	Event_JFD_CID_Crimes_Violence.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_VIOLENCE_OUTCOME_RESULT_1"
	Event_JFD_CID_Crimes_Violence.Outcomes[1].Weight = 5
	Event_JFD_CID_Crimes_Violence.Outcomes[1].CanFunc = (
		function(player)			
			Event_JFD_CID_Crimes_Violence.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_VIOLENCE_OUTCOME_RESULT_1", eventViolenceCity:GetName())
			return true
		end
		)
	Event_JFD_CID_Crimes_Violence.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			eventViolenceCity:ChangeResistanceTurns(3)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CRIMES_VIOLENCE_OUTCOME_RESULT_1_NOTIFICATION", eventViolenceCity:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_VIOLENCE"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENT_CRIMES_VIOLENCE_1", player:GetCivilizationAdjective(), eventViolenceCity:GetName()))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CID_Crimes_Violence.Outcomes[2] = {}
	Event_JFD_CID_Crimes_Violence.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_VIOLENCE_OUTCOME_2"
	Event_JFD_CID_Crimes_Violence.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_VIOLENCE_OUTCOME_RESULT_2"
	Event_JFD_CID_Crimes_Violence.Outcomes[2].Weight = 5
	Event_JFD_CID_Crimes_Violence.Outcomes[2].CanFunc = (
		function(player)	
			if (not eventViolenceCity:GetGarrisonedUnit()) then return false end
			if eventViolenceCity:GetPopulation() < 2 then return false end
			Event_JFD_CID_Crimes_Violence.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_VIOLENCE_OUTCOME_RESULT_2", eventViolenceCity:GetName())
			return true
		end
		)
	Event_JFD_CID_Crimes_Violence.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			eventViolenceCity:ChangePopulation(-1,true)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CRIMES_VIOLENCE_OUTCOME_RESULT_2_NOTIFICATION", eventViolenceCity:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_VIOLENCE"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENT_CRIMES_VIOLENCE_2", player:GetCivilizationAdjective(), eventViolenceCity:GetName()))
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_CID_Crimes_Violence.Outcomes[3] = {}
	Event_JFD_CID_Crimes_Violence.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_VIOLENCE_OUTCOME_3"
	Event_JFD_CID_Crimes_Violence.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_VIOLENCE_OUTCOME_RESULT_3"
	Event_JFD_CID_Crimes_Violence.Outcomes[3].Weight = 5
	Event_JFD_CID_Crimes_Violence.Outcomes[3].CanFunc = (
		function(player)			
			local goldCost = mathCeil(eventViolenceCity:GetPopulation()*(125*iMod))
			Event_JFD_CID_Crimes_Violence.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_VIOLENCE_OUTCOME_RESULT_3", goldCost)
			return true
		end
		)
	Event_JFD_CID_Crimes_Violence.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = mathCeil(eventViolenceCity:GetPopulation()*(125*iMod))
			player:ChangeGold(-goldCost)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CRIMES_VIOLENCE_OUTCOME_RESULT_3_NOTIFICATION", eventViolenceCity:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_VIOLENCE"))
		end)

tEvents.Event_JFD_CID_Crimes_Violence = Event_JFD_CID_Crimes_Violence
--------------------------------------------------------------------------------------------------------------------------
-- Organized Crimes: Anarchist Student
--------------------------------------------------------------------------------------------------------------------------
local buildingClassUniversityID = GameInfoTypes["BUILDINGCLASS_UNIVERSITY"]
local crimeVandalismID = GameInfoTypes["CRIME_JFD_VANDALISM"]
local eventAnarchistCity = nil
local Event_JFD_CID_Crimes_Anarchism = {}
	Event_JFD_CID_Crimes_Anarchism.Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_ANARCHISTS"
	Event_JFD_CID_Crimes_Anarchism.Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_ANARCHISTS_DESC"
	Event_JFD_CID_Crimes_Anarchism.EventImage = "Event_Anarchism.dds"
	Event_JFD_CID_Crimes_Anarchism.Weight = 5
	Event_JFD_CID_Crimes_Anarchism.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			if player:GetCurrentEra() < eraMedievalID then return false end
			local cultureCost = JFD_GetEraAdjustedValue(playerID, mathCeil(50*iMod))
			if player:GetJONSCulture() < cultureCost then return false end
			local cities = {}
			local count = 1
			for city in player:Cities() do
				if city:HasBuildingClass(buildingClassUniversityID) then
					cities[count] = city
					count = count + 1
				end
			end
			eventAnarchistCity = cities[GetRandom(1,#cities)]
			if (not eventAnarchistCity) then return false end
			Event_JFD_CID_Crimes_Anarchism.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_ANARCHISTS_DESC", eventAnarchistCity:GetName())
			return true
		end
		)
	Event_JFD_CID_Crimes_Anarchism.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CID_Crimes_Anarchism.Outcomes[1] = {}
	Event_JFD_CID_Crimes_Anarchism.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_ANARCHISTS_OUTCOME_1"
	Event_JFD_CID_Crimes_Anarchism.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_ANARCHISTS_OUTCOME_RESULT_1"
	Event_JFD_CID_Crimes_Anarchism.Outcomes[1].Weight = 5
	Event_JFD_CID_Crimes_Anarchism.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil(50*iMod))
			Event_JFD_CID_Crimes_Anarchism.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_ANARCHISTS_OUTCOME_RESULT_1", eventAnarchistCity:GetName(), cultureReward)
			return true
		end
		)
	Event_JFD_CID_Crimes_Anarchism.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil(50*iMod))
			if GetRandom(1,10) <= 3 then
				eventAnarchistCity:ChangeResistanceTurns(1)
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CRIMES_ANARCHISTS_OUTCOME_RESULT_1_ALT_NOTIFICATION", eventAnarchistCity:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_ANARCHISTS"))
			else
				player:ChangeJONSCulture(cultureReward)
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CRIMES_ANARCHISTS_OUTCOME_RESULT_1_NOTIFICATION", eventAnarchistCity:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_ANARCHISTS"))
			end
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CID_Crimes_Anarchism.Outcomes[2] = {}
	Event_JFD_CID_Crimes_Anarchism.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_ANARCHISTS_OUTCOME_2"
	Event_JFD_CID_Crimes_Anarchism.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_ANARCHISTS_OUTCOME_RESULT_2"
	Event_JFD_CID_Crimes_Anarchism.Outcomes[2].Weight = 5
	Event_JFD_CID_Crimes_Anarchism.Outcomes[2].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local cultureCost = JFD_GetEraAdjustedValue(playerID, mathCeil(25*iMod))
			Event_JFD_CID_Crimes_Anarchism.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_ANARCHISTS_OUTCOME_RESULT_2", cultureCost)
			return true
		end
		)
	Event_JFD_CID_Crimes_Anarchism.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local cultureCost = JFD_GetEraAdjustedValue(playerID, mathCeil(25*iMod))
			player:ChangeJONSCulture(-cultureCost)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CRIMES_ANARCHISTS_OUTCOME_RESULT_2_NOTIFICATION", eventAnarchistCity:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_ANARCHISTS"))
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_CID_Crimes_Anarchism.Outcomes[3] = {}
	Event_JFD_CID_Crimes_Anarchism.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_ANARCHISTS_OUTCOME_3"
	Event_JFD_CID_Crimes_Anarchism.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_ANARCHISTS_OUTCOME_RESULT_3"
	Event_JFD_CID_Crimes_Anarchism.Outcomes[3].Weight = 5
	Event_JFD_CID_Crimes_Anarchism.Outcomes[3].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local cultureCost = JFD_GetEraAdjustedValue(playerID, mathCeil(50*iMod))
			local goldenAgeReward = JFD_GetEraAdjustedValue(playerID, mathCeil(75*iMod))
			Event_JFD_CID_Crimes_Anarchism.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_ANARCHISTS_OUTCOME_RESULT_3", cultureCost, goldenAgeReward)
			return true
		end
		)
	Event_JFD_CID_Crimes_Anarchism.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local cultureCost = JFD_GetEraAdjustedValue(playerID, mathCeil(50*iMod))
			local goldenAgeReward = JFD_GetEraAdjustedValue(playerID, mathCeil(75*iMod))
			player:ChangeJONSCulture(-cultureCost)
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CRIMES_ANARCHISTS_OUTCOME_RESULT_3_NOTIFICATION", eventAnarchistCity:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_ANARCHISTS"))
		end)

tEvents.Event_JFD_CID_Crimes_Anarchism = Event_JFD_CID_Crimes_Anarchism
--------------------------------------------------------------------------------------------------------------------------
-- Organized Crimes: Terrorist Attack
--------------------------------------------------------------------------------------------------------------------------
local eventTerroristCity = nil
local eventTerroristBuildingID = nil
local organizedCrimeTerrorismID = GameInfoTypes["CRIME_ORGANIZED_JFD_TERRORISTS"]
local Event_JFD_CID_Crimes_Terrorism = {}
	Event_JFD_CID_Crimes_Terrorism.Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_TERRORISTS"
	Event_JFD_CID_Crimes_Terrorism.Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_TERRORISTS_DESC"
	Event_JFD_CID_Crimes_Terrorism.EventImage = "Event_Terrorism.dds"
	Event_JFD_CID_Crimes_Terrorism.Weight = 5
	Event_JFD_CID_Crimes_Terrorism.CanFunc = (
		function(player)			
			if player:GetCurrentEra() < eraIndustrialID then return false end
			local goldCost = mathCeil(1000*iMod)
			if player:GetGold() < goldCost then return false end
			eventTerroristCity = JFD_GetCrimeCity(player, organizedCrimeTerrorismID, true)
			if (not eventTerroristCity) then return false end
			local building1ID = nil
			local buildings = {}
			local buildingsCount = 1
			for building in GameInfo.Buildings("Cost > 0") do
				if eventTerroristCity:HasBuilding(building.ID) then
					buildings[buildingsCount] = building.ID
					buildingsCount = buildingsCount + 1
				end
			end
			building1ID = buildings[GetRandom(1,#buildings)]
			eventTerroristBuildingID = buildings[GetRandom(1,#buildings)]
			if (not building1ID) then return false end
			if (not eventTerroristBuildingID) then return false end
			if building1ID == eventTerroristBuildingID then return false end
			Event_JFD_CID_Crimes_Terrorism.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_TERRORISTS_DESC", GameInfo.Buildings[building1ID].Description, eventTerroristCity:GetName(), GameInfo.Buildings[eventTerroristBuildingID].Description)
			return true
		end
		)
	Event_JFD_CID_Crimes_Terrorism.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CID_Crimes_Terrorism.Outcomes[1] = {}
	Event_JFD_CID_Crimes_Terrorism.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_TERRORISTS_OUTCOME_1"
	Event_JFD_CID_Crimes_Terrorism.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_TERRORISTS_OUTCOME_RESULT_1"
	Event_JFD_CID_Crimes_Terrorism.Outcomes[1].Weight = 5
	Event_JFD_CID_Crimes_Terrorism.Outcomes[1].CanFunc = (
		function(player)			
			local goldCost = mathCeil(1000*iMod)
			Event_JFD_CID_Crimes_Terrorism.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_TERRORISTS_OUTCOME_RESULT_1", goldCost, eventTerroristCity:GetName())
			return true
		end
		)
	Event_JFD_CID_Crimes_Terrorism.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = mathCeil(1000*iMod)
			player:ChangeGold(-goldCost)
			local buildingPoliceStationID = player:GetSpecificBuildingType("BUILDINGCLASS_POLICE_STATION")
			eventTerroristCity:SetNumFreeBuilding(buildingPoliceStationID, 1)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CRIMES_TERRORISTS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_TERRORISTS"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENT_CRIMES_TERRORISTS", player:GetCivilizationAdjective(), eventTerroristCity:GetName()))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CID_Crimes_Terrorism.Outcomes[2] = {}
	Event_JFD_CID_Crimes_Terrorism.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_CID_CRIMES_TERRORISTS_OUTCOME_2"
	Event_JFD_CID_Crimes_Terrorism.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_CID_CRIMES_TERRORISTS_OUTCOME_RESULT_2"
	Event_JFD_CID_Crimes_Terrorism.Outcomes[2].Weight = 5
	Event_JFD_CID_Crimes_Terrorism.Outcomes[2].CanFunc = (
		function(player)			
			Event_JFD_CID_Crimes_Terrorism.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_TERRORISTS_OUTCOME_RESULT_2", GameInfo.Buildings[eventTerroristBuildingID].Description)
			return true
		end
		)
	Event_JFD_CID_Crimes_Terrorism.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			if GetRandom(1,10) <= 3 then
				eventTerroristCity:SetNumFreeBuilding(eventTerroristBuildingID, 0)
				eventTerroristCity:SetNumRealBuilding(eventTerroristBuildingID, 0)
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CRIMES_TERRORISTS_OUTCOME_RESULT_2_ALT_NOTIFICATION", GameInfo.Buildings[building1ID].Description), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_TERRORISTS"))
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CRIMES_TERRORISTS_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_CRIMES_TERRORISTS"))
			end
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENT_CRIMES_TERRORISTS", player:GetCivilizationAdjective(), eventTerroristCity:GetName()))
		end)

tEvents.Event_JFD_CID_Crimes_Terrorism = Event_JFD_CID_Crimes_Terrorism
--=======================================================================================================================
--=======================================================================================================================


