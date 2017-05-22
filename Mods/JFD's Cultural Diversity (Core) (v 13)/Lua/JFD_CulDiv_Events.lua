-- JFD_CulDiv_Events
-- Author: JFD
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_CulDivUtilities.lua")
--=======================================================================================================================
-- EVENTS
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local eraIndustrialID			= GameInfoTypes["ERA_INDUSTRIAL"]
local isUsingRTP				= JFD_IsUsingRTP()
local mathCeil					= math.ceil
local unitInquisitorID			= GameInfoTypes["UNIT_INQUISITOR"]
local unitMissionaryID			= GameInfoTypes["UNIT_MISSIONARY"]
local unitProphetID				= GameInfoTypes["UNIT_PROPHET"]

local cultureAndeanID			= GameInfoTypes['JFD_Andean']		
local cultureBantuID			= GameInfoTypes['JFD_Bantu']		
local cultureBharataID			= GameInfoTypes['JFD_Bharata']		
local cultureCentralID			= GameInfoTypes['JFD_Central']		
local cultureClassicalID		= GameInfoTypes['JFD_Classical']	
local cultureColonialID			= GameInfoTypes['JFD_Colonial']		
local cultureEasternID			= GameInfoTypes['JFD_Eastern']		
local cultureIslamicID			= GameInfoTypes['JFD_Islamic']		
local cultureKatujeID			= GameInfoTypes['JFD_Katuje']			
local cultureMandalaID			= GameInfoTypes['JFD_Mandala']		
local cultureMesoamericanID		= GameInfoTypes['JFD_Mesoamerican']	
local cultureMesopotamicID		= GameInfoTypes['JFD_Mesopotamic']	
local cultureNorthernID			= GameInfoTypes['JFD_Northern']	
local cultureOceanicID			= GameInfoTypes['JFD_Oceanic']		
local cultureOrientalID			= GameInfoTypes['JFD_Oriental']	
local culturePapalID			= GameInfoTypes['JFD_Papal']		
local culturePolarID			= GameInfoTypes['JFD_Polar']		
local cultureSahulID			= GameInfoTypes['JFD_Sahul']		
local cultureSemiticID			= GameInfoTypes['JFD_Semitic']		
local cultureSouthernID			= GameInfoTypes['JFD_Southern']		
local cultureSteppeID			= GameInfoTypes['JFD_Steppe']		
local cultureTotalitarianID		= GameInfoTypes['JFD_Totalitarian']	
local cultureTribalAmericanID	= GameInfoTypes['JFD_TribalAmerican']	
local cultureWestAfricanID		= GameInfoTypes['JFD_WestAfrican'] 	
local cultureWesternID			= GameInfoTypes['JFD_Western']

local userSettingMythicEvent 	= JFD_GetUserSetting("JFD_CULDIV_MYTHICAL_EVENT") == 1

print("JFD's CulDiv Events: loaded")
--------------------------------------------------------------------------------------------------------------------------
-- Mythic Creature
--------------------------------------------------------------------------------------------------------------------------
local chosenMyth 
local Event_JFD_CulDiv_MythicCreature = {}
	Event_JFD_CulDiv_MythicCreature.Name = "TXT_KEY_EVENT_JFD_CULDIV_MYTHICAL_BEAST"
	Event_JFD_CulDiv_MythicCreature.Desc = "TXT_KEY_EVENT_JFD_CULDIV_MYTHICAL_BEAST_DESC"
	Event_JFD_CulDiv_MythicCreature.EventImage = 'Event_MythicCreature.dds'
	Event_JFD_CulDiv_MythicCreature.Weight = 1
	Event_JFD_CulDiv_MythicCreature.CanFunc = (
		function(player)			
			if (not userSettingMythicEvent) then return false end
			if load(player, "Event_JFD_CulDiv_MythicCreature") == true then return false end
			local playerID = player:GetID()
			local cultureID = JFD_GetCultureID(playerID)
			local cultureType = GameInfo.JFD_CultureTypes[cultureID].Type
			local mythicalBeasts = {}
			local mythCount = 1
			for row in GameInfo.JFD_CultureType_MythicEvents("CultureType = '" .. cultureType .. "'") do
				mythicalBeasts[mythCount] = row.Description
				mythCount = mythCount + 1
			end	
			chosenMyth = mythicalBeasts[GetRandom(1,#mythicalBeasts)]
			if chosenMyth == nil then return false end
			local playerCities = {}
			local cityID = nil
			local cityCount = 1
			for city in player:Cities() do
				playerCities[cityCount] = city:GetID()
				cityCount = cityCount + 1
			end
			cityID = playerCities[GetRandom(1, #playerCities)]
			if cityID == nil then return false end
			local city = player:GetCityByID(cityID)
			local description = Locale.ConvertTextKey(chosenMyth .. "_DESC", city:GetName())
			Event_JFD_CulDiv_MythicCreature.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CULDIV_MYTHICAL_BEAST_DESC", description)
			return true
		end
		)
	Event_JFD_CulDiv_MythicCreature.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CulDiv_MythicCreature.Outcomes[1] = {}
	Event_JFD_CulDiv_MythicCreature.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_CULDIV_MYTHICAL_BEAST_OUTCOME_1"
	Event_JFD_CulDiv_MythicCreature.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_CULDIV_MYTHICAL_BEAST_OUTCOME_RESULT_1"
	Event_JFD_CulDiv_MythicCreature.Outcomes[1].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local button = chosenMyth .. "_BUTTON"
			local reward = JFD_GetEraAdjustedValue(playerID, mathCeil(50*iMod))
			Event_JFD_CulDiv_MythicCreature.Outcomes[1].Name = Locale.ConvertTextKey(button)
			Event_JFD_CulDiv_MythicCreature.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CULDIV_MYTHICAL_BEAST_OUTCOME_RESULT_1", reward)
			return true
		end
		)
	Event_JFD_CulDiv_MythicCreature.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local reward = JFD_GetEraAdjustedValue(playerID, mathCeil(50*iMod))
			player:ChangeGoldenAgeProgressMeter(reward)
			local notification = Locale.ConvertTextKey(chosenMyth .. "_NOTIFICATION")
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey(notification), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CULDIV_MYTHICAL_BEAST"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_CULDIV_MYTHICAL_BEAST", chosenMyth, player:GetCivilizationShortDescription())) 
			save(player, "Event_JFD_CulDiv_MythicCreature", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CulDiv_MythicCreature.Outcomes[2] = {}
	Event_JFD_CulDiv_MythicCreature.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_CULDIV_MYTHICAL_BEAST_OUTCOME_2"
	Event_JFD_CulDiv_MythicCreature.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_CULDIV_MYTHICAL_BEAST_OUTCOME_RESULT_2"
	Event_JFD_CulDiv_MythicCreature.Outcomes[2].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local reward = JFD_GetEraAdjustedValue(playerID, mathCeil(30*iMod))
			local rewardYield = "[ICON_PEACE] Faith"
			if isUsingRTP then
				if player:HasStateReligion() then
					reward = JFD_GetEraAdjustedValue(playerID, mathCeil(5*iMod))
					rewardYield = "[ICON_JFD_PIETY] Piety"
				end
			end
			Event_JFD_CulDiv_MythicCreature.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CULDIV_MYTHICAL_BEAST_OUTCOME_RESULT_2", reward, rewardYield)
			return true
		end
		)
	Event_JFD_CulDiv_MythicCreature.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local reward = JFD_GetEraAdjustedValue(playerID, mathCeil(30*iMod))
			if isUsingRTP then
				if player:HasStateReligion() then
					reward = JFD_GetEraAdjustedValue(playerID, mathCeil(5*iMod))
					player:ChangePiety(reward)
				else
					player:ChangeFaith(reward)
				end
			else
				player:ChangeFaith(reward)
			end		
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CULDIV_MYTHICAL_BEAST_NOTIFICATION", chosenMyth), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CULDIV_MYTHICAL_BEAST"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_CULDIV_MYTHICAL_BEAST", chosenMyth, player:GetCivilizationShortDescription())) 
			save(player, "Event_JFD_CulDiv_MythicCreature", true)
		end)

tEvents.Event_JFD_CulDiv_MythicCreature = Event_JFD_CulDiv_MythicCreature
--------------------------------------------------------------------------------------------------------------------------
-- Andean: Huacha
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_CulDiv_Andean = {}
	Event_JFD_CulDiv_Andean.Name = "TXT_KEY_EVENT_JFD_ANDEAN"
	Event_JFD_CulDiv_Andean.Desc = "TXT_KEY_EVENT_JFD_ANDEAN_DESC"
	Event_JFD_CulDiv_Andean.EventImage = 'Event_Andean.dds'
	Event_JFD_CulDiv_Andean.Weight = 2
	Event_JFD_CulDiv_Andean.CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local cultureID = JFD_GetCultureID(playerID)		
			if cultureID ~= cultureAndeanID then return false end
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(100*iMod))
			if player:GetGold() < goldCost then return false end
			return true
		end
		)
	Event_JFD_CulDiv_Andean.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CulDiv_Andean.Outcomes[1] = {}
	Event_JFD_CulDiv_Andean.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_ANDEAN_OUTCOME_1"
	Event_JFD_CulDiv_Andean.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_ANDEAN_OUTCOME_RESULT_1"
	Event_JFD_CulDiv_Andean.Outcomes[1].Weight = 2
	Event_JFD_CulDiv_Andean.Outcomes[1].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(100*iMod))
			local reward = JFD_GetEraAdjustedValue(playerID, mathCeil(55*iMod))
			local rewardYield = "[ICON_PEACE] Faith"
			if isUsingRTP then
				if player:HasStateReligion() then
					reward = JFD_GetEraAdjustedValue(playerID, mathCeil(8*iMod))
					rewardYield = "[ICON_JFD_PIETY] Piety"
				end
			end
			Event_JFD_CulDiv_Andean.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ANDEAN_OUTCOME_RESULT_1", goldCost, reward, rewardYield)
			return true
		end
		)
	Event_JFD_CulDiv_Andean.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(100*iMod))
			local reward = JFD_GetEraAdjustedValue(playerID, mathCeil(55*iMod))
			player:ChangeGold(-goldCost)
			if isUsingRTP then
				if player:HasStateReligion() then
					reward = JFD_GetEraAdjustedValue(playerID, mathCeil(8*iMod))
					player:ChangePiety(reward)
				end
			else
				player:ChangeFaith(reward)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ANDEAN_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ANDEAN"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CulDiv_Andean.Outcomes[2] = {}
	Event_JFD_CulDiv_Andean.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_ANDEAN_OUTCOME_2"
	Event_JFD_CulDiv_Andean.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_ANDEAN_OUTCOME_RESULT_2"
	Event_JFD_CulDiv_Andean.Outcomes[2].Weight = 3
	Event_JFD_CulDiv_Andean.Outcomes[2].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil(50*iMod))
			Event_JFD_CulDiv_Andean.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ANDEAN_OUTCOME_RESULT_2", faithReward)
			return true
		end
		)
	Event_JFD_CulDiv_Andean.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil(50*iMod))
			for city in player:Cities() do
				if GetRandom(1,10) <= 3 then
					city:ChangeResistanceTurns(1)
					JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ANDEAN_OUTCOME_RESULT_2_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ANDEAN"))	
				else
					JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ANDEAN_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ANDEAN"))
				end
			end
			player:ChangeFaith(faithReward)
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_CulDiv_Andean.Outcomes[3] = {}
	Event_JFD_CulDiv_Andean.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_ANDEAN_OUTCOME_3"
	Event_JFD_CulDiv_Andean.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_ANDEAN_OUTCOME_RESULT_3"
	Event_JFD_CulDiv_Andean.Outcomes[3].Weight = 1
	Event_JFD_CulDiv_Andean.Outcomes[3].CanFunc = (
		function(player)			
			Event_JFD_CulDiv_Andean.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ANDEAN_OUTCOME_RESULT_3")
			return true
		end
		)
	Event_JFD_CulDiv_Andean.Outcomes[3].DoFunc = (
		function(player) 
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ANDEAN_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ANDEAN"))
		end)

tEvents.Event_JFD_CulDiv_Andean = Event_JFD_CulDiv_Andean
--------------------------------------------------------------------------------------------------------------------------
-- Bantu: Great Migration
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_CulDiv_Bantu = {}
	Event_JFD_CulDiv_Bantu.Name = "TXT_KEY_EVENT_JFD_BANTU"
	Event_JFD_CulDiv_Bantu.Desc = "TXT_KEY_EVENT_JFD_BANTU_DESC"
	Event_JFD_CulDiv_Bantu.EventImage = 'Event_Bantu.dds'
	Event_JFD_CulDiv_Bantu.Weight = 2
	Event_JFD_CulDiv_Bantu.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local cultureID = JFD_GetCultureID(playerID)		
			if cultureID ~= cultureBantuID then return false end
			return true
		end
		)
	Event_JFD_CulDiv_Bantu.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CulDiv_Bantu.Outcomes[1] = {}
	Event_JFD_CulDiv_Bantu.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_BANTU_OUTCOME_1"
	Event_JFD_CulDiv_Bantu.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_BANTU_OUTCOME_RESULT_1"
	Event_JFD_CulDiv_Bantu.Outcomes[1].Weight = 2
	Event_JFD_CulDiv_Bantu.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFD_CulDiv_Bantu.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BANTU_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFD_CulDiv_Bantu.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			for city in player:Cities() do
				city:ChangePopulation(1, true)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BANTU_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BANTU"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BANTU", player:GetCivilizationDescription())) 
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CulDiv_Bantu.Outcomes[2] = {}
	Event_JFD_CulDiv_Bantu.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_BANTU_OUTCOME_2"
	Event_JFD_CulDiv_Bantu.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_BANTU_OUTCOME_RESULT_2"
	Event_JFD_CulDiv_Bantu.Outcomes[2].Weight = 3
	Event_JFD_CulDiv_Bantu.Outcomes[2].CanFunc = (
		function(player)		
			local playerID = player:GetID()
			local numCities = player:GetNumCities()
			local goldenAgeReward = JFD_GetEraAdjustedValue(playerID, mathCeil((numCities*100)*iMod))
			Event_JFD_CulDiv_Bantu.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BANTU_OUTCOME_RESULT_2", goldenAgeReward)
			return true
		end
		)
	Event_JFD_CulDiv_Bantu.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local numCities = player:GetNumCities()
			local goldenAgeReward = JFD_GetEraAdjustedValue(playerID, mathCeil((numCities*100)*iMod))
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BANTU_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey(Event_JFD_CulDiv_Bantu.Name))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BANTU", player:GetCivilizationDescription())) 
		end)

tEvents.Event_JFD_CulDiv_Bantu = Event_JFD_CulDiv_Bantu
--------------------------------------------------------------------------------------------------------------------------
-- Bharata: Spiritual Leader
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_CulDiv_Bharata = {}
    Event_JFD_CulDiv_Bharata.Name = "TXT_KEY_EVENT_JFD_BHARATA"
	Event_JFD_CulDiv_Bharata.Desc = "TXT_KEY_EVENT_JFD_BHARATA_DESC"
	Event_JFD_CulDiv_Bharata.EventImage = 'Event_Bharata.dds'
	Event_JFD_CulDiv_Bharata.Weight = 2
	Event_JFD_CulDiv_Bharata.CanFunc = (
		function(player)
			local playerID = player:GetID()
			local cultureID = JFD_GetCultureID(playerID)		
			if cultureID ~= cultureBharataID then return false end
			if player:GetCapitalCity():GetReligiousMajority() <= 0 then return false end
			return true
		end
		)
	Event_JFD_CulDiv_Bharata.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CulDiv_Bharata.Outcomes[1] = {}
	Event_JFD_CulDiv_Bharata.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_BHARATA_OUTCOME_1"
	Event_JFD_CulDiv_Bharata.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_BHARATA_OUTCOME_1_DESC"
	Event_JFD_CulDiv_Bharata.Outcomes[1].CanFunc = (
		function(player)
			Event_JFD_CulDiv_Bharata.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BHARATA_OUTCOME_1_DESC")
			return true
		end
		)
	Event_JFD_CulDiv_Bharata.Outcomes[1].DoFunc = (
		function(player)
			local playerID = player:GetID()
			local capital = player:GetCapitalCity()
			local capitalX = capital:GetX()
			local capitalY = capital:GetY()
			if (unitInquisitorID and unitMissionaryID) then
				player:InitUnit(unitInquisitorID, capitalX, capitalY)
				player:InitUnit(unitInquisitorID, capitalX, capitalY)
				player:InitUnit(unitMissionaryID, capitalX, capitalY)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BHARATA_OUTCOME_1_NOTIFICATION"), Locale.ConvertTextKey(Event_JFD_CulDiv_Bharata.Name))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BHARATA_1", player:GetName(), player:GetCivilizationDescription())) 
		end
		)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CulDiv_Bharata.Outcomes[2] = {}
	Event_JFD_CulDiv_Bharata.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_BHARATA_OUTCOME_2"
	Event_JFD_CulDiv_Bharata.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_BHARATA_OUTCOME_2_DESC"
	Event_JFD_CulDiv_Bharata.Outcomes[2].CanFunc = (
		function(player)
			Event_JFD_CulDiv_Bharata.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BHARATA_OUTCOME_2_DESC")
			return true
		end
		)
	Event_JFD_CulDiv_Bharata.Outcomes[2].DoFunc = (
		function(player)
			local playerID = player:GetID()
			local capital = player:GetCapitalCity()
			if (unitProphetID) then
				player:InitUnit(unitProphetID, capital:GetX(), capital:GetY())
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BHARATA_OUTCOME_2_NOTIFICATION"), Locale.ConvertTextKey(Event_JFD_CulDiv_Bharata.Name))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BHARATA_2", player:GetName(), player:GetCivilizationDescription())) 
		end
		)
tEvents.Event_JFD_CulDiv_Bharata = Event_JFD_CulDiv_Bharata
--------------------------------------------------------------------------------------------------------------------------
--  Central: Dynastic Union
--------------------------------------------------------------------------------------------------------------------------
local minorCivID = nil
local Event_JFD_CulDiv_Central = {}
	Event_JFD_CulDiv_Central.Name = "TXT_KEY_EVENT_JFD_CENTRAL"
	Event_JFD_CulDiv_Central.Desc = "TXT_KEY_EVENT_JFD_CENTRAL_DESC"
	Event_JFD_CulDiv_Central.EventImage = 'Event_Central.dds'
	Event_JFD_CulDiv_Central.Weight = 2
	Event_JFD_CulDiv_Central.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local cultureID = JFD_GetCultureID(playerID)		
			if cultureID ~= cultureCentralID then return false end
			local playerTeam = Teams[player:GetTeam()]
			local minorPlayers = {}
			local count = 1
			for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
				local otherPlayer = Players[otherPlayerID]
				local otherPlayerTeamID = otherPlayer:GetTeam()
				if (otherPlayer:IsMinorCiv() and otherPlayer:IsAlive()) then
					if playerTeam:IsHasMet(otherPlayerTeamID) then
						minorPlayers[count] = playerID
						count = count + 1
					end
				end
			end
			minorCivID = minorPlayers[GetRandom(1, #minorPlayers)]
			if (not minorCivID) then return false end
			Event_JFD_CulDiv_Central.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CENTRAL_DESC", Players[minorCivID]:GetName())
			return true
		end
		)
	Event_JFD_CulDiv_Central.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CulDiv_Central.Outcomes[1] = {}
	Event_JFD_CulDiv_Central.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_CENTRAL_OUTCOME_1"
	Event_JFD_CulDiv_Central.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_CENTRAL_OUTCOME_RESULT_1"
	Event_JFD_CulDiv_Central.Outcomes[1].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local influenceReward = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
			Event_JFD_CulDiv_Central.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CENTRAL_OUTCOME_RESULT_1", influenceReward, Players[minorCivID]:GetName())
			return true
		end
		)
	Event_JFD_CulDiv_Central.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local influenceReward = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
			if minorCivID then
				local minorPlayer = Players[minorCivID]
				minorPlayer:ChangeMinorCivFriendshipWithMajor(playerID, influenceReward)	
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CENTRAL_OUTCOME_RESULT_1_NOTIFICATION", minorPlayer:GetName()), Locale.ConvertTextKey(Event_JFD_CulDiv_Central.Name))
				JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_CENTRAL", player:GetCivilizationShortDescription(), minorPlayer:GetCivilizationDescription())) 
			end
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CulDiv_Central.Outcomes[2] = {}
	Event_JFD_CulDiv_Central.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_CENTRAL_OUTCOME_2"
	Event_JFD_CulDiv_Central.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_CENTRAL_OUTCOME_RESULT_2"
	Event_JFD_CulDiv_Central.Outcomes[2].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local influenceReward = JFD_GetEraAdjustedValue(playerID, mathCeil(3*iMod))
			Event_JFD_CulDiv_Central.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CENTRAL_OUTCOME_RESULT_2", influenceReward, Players[minorCivID]:GetName())
			return true
		end
		)
	Event_JFD_CulDiv_Central.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local influenceReward = JFD_GetEraAdjustedValue(playerID, mathCeil(3*iMod))
			if minorCivID then
				local minorPlayer = Players[minorCivID]
				minorPlayer:ChangeMinorCivFriendshipWithMajor(player:GetID(), influenceReward)	
				for city in player:Cities() do	
					city:ChangeWeLoveTheKingDayCounter(2)
				end
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CENTRAL_OUTCOME_RESULT_1_NOTIFICATION", minorPlayer:GetName()), Locale.ConvertTextKey(Event_JFD_CulDiv_Central.Name))
				JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_CENTRAL", player:GetCivilizationShortDescription(), minorPlayer:GetName())) 
			end
		end)

tEvents.Event_JFD_CulDiv_Central = Event_JFD_CulDiv_Central
--------------------------------------------------------------------------------------------------------------------------
--  Classical: Philosophical Debate
--------------------------------------------------------------------------------------------------------------------------
local debate = nil
local Event_JFD_CulDiv_Classical = {}
	Event_JFD_CulDiv_Classical.Name = "TXT_KEY_EVENT_JFD_CLASSICAL"
	Event_JFD_CulDiv_Classical.Desc = "TXT_KEY_EVENT_JFD_CLASSICAL_DESC"
	Event_JFD_CulDiv_Classical.EventImage = 'Event_Classical.dds'
	Event_JFD_CulDiv_Classical.Weight = 2
	Event_JFD_CulDiv_Classical.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local cultureID = JFD_GetCultureID(playerID)		
			if cultureID ~= cultureClassicalID then return false end
			debate = "TXT_KEY_EVENT_JFD_CLASSICAL_DESC_" .. GetRandom(1,20)
			Event_JFD_CulDiv_Classical.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CLASSICAL_DESC", debate)
			return true
		end
		)
	Event_JFD_CulDiv_Classical.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CulDiv_Classical.Outcomes[1] = {}
	Event_JFD_CulDiv_Classical.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_CLASSICAL_OUTCOME_1"
	Event_JFD_CulDiv_Classical.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_CLASSICAL_OUTCOME_RESULT_1"
	Event_JFD_CulDiv_Classical.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFD_CulDiv_Classical.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CLASSICAL_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFD_CulDiv_Classical.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			for unit in player:Units() do	
				if unit:IsCombatUnit() then
					unit:ChangeExperience(5)
				end
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CLASSICAL_OUTCOME_RESULT_1_NOTIFICATION", debate), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CLASSICAL"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_CLASSICAL", debate, player:GetCivilizationDescription())) 
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CulDiv_Classical.Outcomes[2] = {}
	Event_JFD_CulDiv_Classical.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_CLASSICAL_OUTCOME_2"
	Event_JFD_CulDiv_Classical.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_CLASSICAL_OUTCOME_RESULT_2"
	Event_JFD_CulDiv_Classical.Outcomes[2].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local goldenAgeReward = JFD_GetEraAdjustedValue(playerID, mathCeil(40*iMod))
			Event_JFD_CulDiv_Classical.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CLASSICAL_OUTCOME_RESULT_2", goldenAgeReward)
			return true
		end
		)
	Event_JFD_CulDiv_Classical.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldenAgeReward = JFD_GetEraAdjustedValue(playerID, mathCeil(40*iMod))
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CLASSICAL_OUTCOME_RESULT_1_NOTIFICATION", debate), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CLASSICAL"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_CLASSICAL", debate, player:GetCivilizationDescription())) 
		end)

tEvents.Event_JFD_CulDiv_Classical = Event_JFD_CulDiv_Classical
--------------------------------------------------------------------------------------------------------------------------
--  Colonial: Independence Day
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_CulDiv_Colonial = {}
	Event_JFD_CulDiv_Colonial.Name = "TXT_KEY_EVENT_JFD_COLONIAL"
	Event_JFD_CulDiv_Colonial.Desc = "TXT_KEY_EVENT_JFD_COLONIAL_DESC"
	Event_JFD_CulDiv_Colonial.EventImage = 'Event_Colonial.dds'
	Event_JFD_CulDiv_Colonial.Weight = 2
	Event_JFD_CulDiv_Colonial.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local cultureID = JFD_GetCultureID(playerID)		
			if cultureID ~= cultureColonialID then return false end
			return true
		end
		)
	Event_JFD_CulDiv_Colonial.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CulDiv_Colonial.Outcomes[1] = {}
	Event_JFD_CulDiv_Colonial.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_COLONIAL_OUTCOME_1"
	Event_JFD_CulDiv_Colonial.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_COLONIAL_OUTCOME_RESULT_1"
	Event_JFD_CulDiv_Colonial.Outcomes[1].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local goldenAgeReward = JFD_GetEraAdjustedValue(playerID, mathCeil(30*iMod))
			Event_JFD_CulDiv_Colonial.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_COLONIAL_OUTCOME_RESULT_1", goldenAgeReward)
			return true
		end
		)
	Event_JFD_CulDiv_Colonial.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldenAgeReward = JFD_GetEraAdjustedValue(playerID, mathCeil(30*iMod))
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
			for city in player:Cities() do
				city:ChangeWeLoveTheKingDayCounter(1)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_COLONIAL_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey(Event_JFD_CulDiv_Colonial.Name))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_COLONIAL", player:GetCivilizationDescription())) 
		end)

tEvents.Event_JFD_CulDiv_Colonial = Event_JFD_CulDiv_Colonial
--------------------------------------------------------------------------------------------------------------------------
--  Eastern: Great Assembly
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_CulDiv_Eastern = {}
	Event_JFD_CulDiv_Eastern.Name = "TXT_KEY_EVENT_JFD_EASTERN"
	Event_JFD_CulDiv_Eastern.Desc = "TXT_KEY_EVENT_JFD_EASTERN_DESC"
	Event_JFD_CulDiv_Eastern.EventImage = 'Event_Eastern.dds'
	Event_JFD_CulDiv_Eastern.Weight = 2
	Event_JFD_CulDiv_Eastern.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local cultureID = JFD_GetCultureID(playerID)		
			if cultureID ~= cultureEasternID then return false end
			return true
		end
		)
	Event_JFD_CulDiv_Eastern.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CulDiv_Eastern.Outcomes[1] = {}
	Event_JFD_CulDiv_Eastern.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_EASTERN_OUTCOME_1"
	Event_JFD_CulDiv_Eastern.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_EASTERN_OUTCOME_RESULT_1"
	Event_JFD_CulDiv_Eastern.Outcomes[1].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local numCities = player:GetNumCities()
			local goldenAgeReward = JFD_GetEraAdjustedValue(playerID, mathCeil((numCities*20)*iMod))
			Event_JFD_CulDiv_Eastern.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EASTERN_OUTCOME_RESULT_1", goldenAgeReward)
			return true
		end
		)
	Event_JFD_CulDiv_Eastern.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local numCities = player:GetNumCities()
			local goldenAgeReward = JFD_GetEraAdjustedValue(playerID, mathCeil((numCities*20)*iMod))
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_EASTERN_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EASTERN"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CulDiv_Eastern.Outcomes[2] = {}
	Event_JFD_CulDiv_Eastern.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_EASTERN_OUTCOME_2"
	Event_JFD_CulDiv_Eastern.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_EASTERN_OUTCOME_RESULT_2"
	Event_JFD_CulDiv_Eastern.Outcomes[2].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local numCities = player:GetNumCities()
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil((numCities*5)*iMod))
			Event_JFD_CulDiv_Eastern.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EASTERN_OUTCOME_RESULT_2", cultureReward)
			return true
		end
		)
	Event_JFD_CulDiv_Eastern.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local numCities = player:GetNumCities()
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil((numCities*5)*iMod))
			player:ChangeJONSCulture(cultureReward)
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_EASTERN", player:GetCivilizationDescription())) 
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_EASTERN_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EASTERN"))
		end)

tEvents.Event_JFD_CulDiv_Eastern = Event_JFD_CulDiv_Eastern
--------------------------------------------------------------------------------------------------------------------------
-- Islamic: Trade Monopoly
--------------------------------------------------------------------------------------------------------------------------
local unitMerchantID = GameInfoTypes["UNIT_MERCHANT"]
local Event_JFD_CulDiv_Islamic = {}
	Event_JFD_CulDiv_Islamic.Name = "TXT_KEY_EVENT_JFD_ISLAMIC"
	Event_JFD_CulDiv_Islamic.Desc = "TXT_KEY_EVENT_JFD_ISLAMIC_DESC"
	Event_JFD_CulDiv_Islamic.EventImage = 'Event_Islamic.dds'
	Event_JFD_CulDiv_Islamic.Weight = 2
	Event_JFD_CulDiv_Islamic.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local cultureID = JFD_GetCultureID(playerID)		
			if cultureID ~= cultureIslamicID then return false end
			if player:GetNumInternationalTradeRoutesUsed() == 0 then return false end
			return true
		end
		)
	Event_JFD_CulDiv_Islamic.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CulDiv_Islamic.Outcomes[1] = {}
	Event_JFD_CulDiv_Islamic.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_ISLAMIC_OUTCOME_1"
	Event_JFD_CulDiv_Islamic.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_ISLAMIC_OUTCOME_RESULT_1"
	Event_JFD_CulDiv_Islamic.Outcomes[1].Weight = 3
	Event_JFD_CulDiv_Islamic.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local numTradeRoutes = player:GetNumInternationalTradeRoutesUsed()
			local goldReward = JFD_GetEraAdjustedValue(playerID, mathCeil((numTradeRoutes*20)*iMod))
			Event_JFD_CulDiv_Islamic.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ISLAMIC_OUTCOME_RESULT_1", goldReward)
			return true
		end
		)
	Event_JFD_CulDiv_Islamic.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local numTradeRoutes = player:GetNumInternationalTradeRoutesUsed()
			local goldReward = JFD_GetEraAdjustedValue(playerID, mathCeil((numTradeRoutes*20)*iMod))
			player:ChangeGold(goldReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ISLAMIC_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ISLAMIC"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ISLAMIC", player:GetCivilizationDescription())) 
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CulDiv_Islamic.Outcomes[2] = {}
	Event_JFD_CulDiv_Islamic.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_ISLAMIC_OUTCOME_2"
	Event_JFD_CulDiv_Islamic.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_ISLAMIC_OUTCOME_RESULT_2"
	Event_JFD_CulDiv_Islamic.Outcomes[2].Weight = 2
	Event_JFD_CulDiv_Islamic.Outcomes[2].CanFunc = (
		function(player)			
			Event_JFD_CulDiv_Islamic.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ISLAMIC_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFD_CulDiv_Islamic.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local capital = player:GetCapitalCity()
			if unitMerchantID then
				player:InitUnit(unitMerchantID, capital:GetX(), capital:GetY())
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ISLAMIC_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ISLAMIC"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ISLAMIC", player:GetCivilizationDescription())) 
		end)

tEvents.Event_JFD_CulDiv_Islamic = Event_JFD_CulDiv_Islamic
--------------------------------------------------------------------------------------------------------------------------
-- Katuje: Great Hunt
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_CulDiv_Katuje = {}
    Event_JFD_CulDiv_Katuje.Name = "TXT_KEY_EVENT_JFD_KATUJE"
	Event_JFD_CulDiv_Katuje.Desc = "TXT_KEY_EVENT_JFD_KATUJE_DESC"
	Event_JFD_CulDiv_Katuje.Weight = 2
	Event_JFD_CulDiv_Katuje.CanFunc = (
		function(player)
			local playerID = player:GetID()
			local cultureID = JFD_GetCultureID(playerID)		
			if cultureID ~= cultureKatujeID then return false end
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(55*iMod))
			if player:GetGold() < goldCost then return false end
			return true
		end
		)
	Event_JFD_CulDiv_Katuje.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CulDiv_Katuje.Outcomes[1] = {}
	Event_JFD_CulDiv_Katuje.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_KATUJE_OUTCOME_1"
	Event_JFD_CulDiv_Katuje.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_KATUJE_OUTCOME_1_DESC"
	Event_JFD_CulDiv_Katuje.Outcomes[1].CanFunc = (
		function(player)
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(55*iMod))
			Event_JFD_CulDiv_Katuje.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_KATUJE_OUTCOME_1_DESC", goldCost)
			return true
		end
		)
	Event_JFD_CulDiv_Katuje.Outcomes[1].DoFunc = (
		function(player)
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(55*iMod))
			player:ChangeGold(-goldCost)
			local unitArcherID = GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_ARCHER")
			if unitArcherID then
				local unitClass = GameInfo.Units[unitArcherID].Class
				local unit = JFD_GetUniqueUnit(player, unitClass)
				if unit then
					local capital = player:GetCapitalCity()
					player:InitUnit(GameInfoTypes[unit], capital:GetX(), capital:GetY())
					player:InitUnit(GameInfoTypes[unit], capital:GetX(), capital:GetY())
				end
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_KATUJE_OUTCOME_1_NOTIFICATION"), Locale.ConvertTextKey(Event_JFD_CulDiv_Katuje.Name))
		end
		)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CulDiv_Katuje.Outcomes[2] = {}
	Event_JFD_CulDiv_Katuje.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_KATUJE_OUTCOME_2"
	Event_JFD_CulDiv_Katuje.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_KATUJE_OUTCOME_2_DESC"
	Event_JFD_CulDiv_Katuje.Outcomes[2].CanFunc = (
		function(player)
			Event_JFD_CulDiv_Katuje.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_KATUJE_OUTCOME_2_DESC")
			return true
		end
		)
	Event_JFD_CulDiv_Katuje.Outcomes[2].DoFunc = (
		function(player)
			local playerID = player:GetID()
			for city in player:Cities() do
				city:ChangeWeLoveTheKingDayCounter(5)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_KATUJE_OUTCOME_2_NOTIFICATION"), Locale.ConvertTextKey(Event_JFD_CulDiv_Katuje.Name))
		end
		)
	
tEvents.Event_JFD_CulDiv_Katuje = Event_JFD_CulDiv_Katuje
--------------------------------------------------------------------------------------------------------------------------
-- Mandala: White Elephant Found
--------------------------------------------------------------------------------------------------------------------------
local resourceWhiteElephantID = GameInfoTypes["RESOURCE_JFD_WHITE_ELEPHANT"]
local Event_JFD_CulDiv_Mandala = {}
    Event_JFD_CulDiv_Mandala.Name = "TXT_KEY_EVENT_JFD_MANDALA"
	Event_JFD_CulDiv_Mandala.Desc = "TXT_KEY_EVENT_JFD_MANDALA_DESC"
	Event_JFD_CulDiv_Mandala.EventImage = 'Event_Mandala.dds'
	Event_JFD_CulDiv_Mandala.Weight = 2
	Event_JFD_CulDiv_Mandala.CanFunc = (
		function(player)
			local playerID = player:GetID()
			local cultureID = JFD_GetCultureID(playerID)		
			if cultureID ~= cultureMandalaID then return false end
			return true
		end
		)
	Event_JFD_CulDiv_Mandala.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CulDiv_Mandala.Outcomes[1] = {}
	Event_JFD_CulDiv_Mandala.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_MANDALA_OUTCOME_1"
	Event_JFD_CulDiv_Mandala.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_MANDALA_OUTCOME_1_DESC"
	Event_JFD_CulDiv_Mandala.Outcomes[1].CanFunc = (
		function(player)
			Event_JFD_CulDiv_Mandala.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MANDALA_OUTCOME_1_DESC")
			return true
		end
		)
	Event_JFD_CulDiv_Mandala.Outcomes[1].DoFunc = (
		function(player)
			local playerID = player:GetID()
			if resourceWhiteElephantID then
				player:ChangeNumResourceTotal(resourceWhiteElephantID, 1)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MANDALA_OUTCOME_1_NOTIFICATION"), Locale.ConvertTextKey(Event_JFD_CulDiv_Mandala.Name))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_MANDALA_WHITEELEPHANT", player:GetCivilizationDescription())) 
		end
		)

tEvents.Event_JFD_CulDiv_Mandala = Event_JFD_CulDiv_Mandala
--------------------------------------------------------------------------------------------------------------------------
-- Mesoamerican: Human Captives
--------------------------------------------------------------------------------------------------------------------------
local warringPlayer
local Event_JFD_CulDiv_Mesoamerican = {}
	Event_JFD_CulDiv_Mesoamerican.Name = "TXT_KEY_EVENT_JFD_MESOAMERICAN"
	Event_JFD_CulDiv_Mesoamerican.Desc = "TXT_KEY_EVENT_JFD_MESOAMERICAN_DESC"
	Event_JFD_CulDiv_Mesoamerican.EventImage = 'Event_Mesoamerican.dds'
	Event_JFD_CulDiv_Mesoamerican.Weight = 2
	Event_JFD_CulDiv_Mesoamerican.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local cultureID = JFD_GetCultureID(playerID)		
			if cultureID ~= cultureMesoamericanID then return false end
			if player:GetCurrentEra() >= eraIndustrialID then return false end
			if Teams[player:GetTeam()]:GetAtWarCount(false) == 0 then return false end
			local teamID = player:GetTeam()
			local warringPlayers = {}
			local count = 1
			for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
				local otherPlayer = Players[playerID]
				local otherTeamID = otherPlayer:GetTeam()
				local otherTeam = Teams[otherTeamID]
				if (otherTeam:IsAtWar(teamID) and (not otherPlayer:IsBarbarian())) then
					warringPlayers[count] = otherPlayer
					count = count + 1
				end
			end
			warringPlayer = warringPlayers[JFD_GetRandom(1, #warringPlayers)]	
			if (not warringPlayer) then return false end
			Event_JFD_CulDiv_Mesoamerican.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MESOAMERICAN_DESC", warringPlayer:GetCivilizationAdjective())
			return true
		end
		)
	Event_JFD_CulDiv_Mesoamerican.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CulDiv_Mesoamerican.Outcomes[1] = {}
	Event_JFD_CulDiv_Mesoamerican.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_MESOAMERICAN_OUTCOME_1"
	Event_JFD_CulDiv_Mesoamerican.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_MESOAMERICAN_OUTCOME_RESULT_1"
	Event_JFD_CulDiv_Mesoamerican.Outcomes[1].Weight = 2
	Event_JFD_CulDiv_Mesoamerican.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local reward = JFD_GetEraAdjustedValue(playerID, mathCeil(60*iMod))
			local rewardYield = "[ICON_PEACE] Faith"
			if isUsingRTP then
				if player:HasStateReligion() then
					reward = JFD_GetEraAdjustedValue(playerID, mathCeil(8*iMod))
					rewardYield = "[ICON_JFD_PIETY] Piety"
				end
			end
			Event_JFD_CulDiv_Mesoamerican.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MESOAMERICAN_OUTCOME_RESULT_1", reward, rewardYield)
			return true
		end
		)
	Event_JFD_CulDiv_Mesoamerican.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local reward = JFD_GetEraAdjustedValue(playerID, mathCeil(60*iMod))
			if isUsingRTP then
				if player:HasStateReligion() then
					reward = JFD_GetEraAdjustedValue(playerID, mathCeil(8*iMod))
					player:ChangePiety(reward)
				end
			else
				player:ChangeFaith(reward)
			end
			if warringPlayer then
				JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_MESOAMERICAN_1", warringPlayer:GetCivilizationAdjective(), player:GetCivilizationAdjective())) 
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_MESOAMERICAN_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MESOAMERICAN"))
			end
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CulDiv_Mesoamerican.Outcomes[2] = {}
	Event_JFD_CulDiv_Mesoamerican.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_MESOAMERICAN_OUTCOME_2"
	Event_JFD_CulDiv_Mesoamerican.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_MESOAMERICAN_OUTCOME_RESULT_2"
	Event_JFD_CulDiv_Mesoamerican.Outcomes[2].Weight = 1
	Event_JFD_CulDiv_Mesoamerican.Outcomes[2].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local productionReward = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
			Event_JFD_CulDiv_Mesoamerican.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MESOAMERICAN_OUTCOME_RESULT_2", productionReward)
			return true
		end
		)
	Event_JFD_CulDiv_Mesoamerican.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local productionReward = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
			player:GetCapitalCity():ChangeProduction(productionReward)
			if warringPlayer then
				JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_MESOAMERICAN_2", warringPlayer:GetCivilizationAdjective(), player:GetCivilizationAdjective())) 
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_MESOAMERICAN_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MESOAMERICAN"))
			end
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_CulDiv_Mesoamerican.Outcomes[3] = {}
	Event_JFD_CulDiv_Mesoamerican.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_MESOAMERICAN_OUTCOME_3"
	Event_JFD_CulDiv_Mesoamerican.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_MESOAMERICAN_OUTCOME_RESULT_3"
	Event_JFD_CulDiv_Mesoamerican.Outcomes[3].Weight = 1
	Event_JFD_CulDiv_Mesoamerican.Outcomes[3].CanFunc = (
		function(player)			
			Event_JFD_CulDiv_Mesoamerican.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MESOAMERICAN_OUTCOME_RESULT_3")
			return true
		end
		)
	Event_JFD_CulDiv_Mesoamerican.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			for unit in player:Units() do
				if unit:IsCombatUnit() then
					unit:ChangeExperience(5)
				end
			end
			if warringPlayer then
				JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_MESOAMERICAN_3", warringPlayer:GetCivilizationAdjective(), player:GetCivilizationAdjective())) 
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_MESOAMERICAN_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MESOAMERICAN"))
			end
		end)

tEvents.Event_JFD_CulDiv_Mesoamerican = Event_JFD_CulDiv_Mesoamerican
--------------------------------------------------------------------------------------------------------------------------
-- Mesopotamic: Ceremonial Burial
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_CulDiv_Mesopotamic = {}
    Event_JFD_CulDiv_Mesopotamic.Name = "TXT_KEY_EVENT_JFD_MESOPOTAMIC"
	Event_JFD_CulDiv_Mesopotamic.Desc = "TXT_KEY_EVENT_JFD_MESOPOTAMIC_DESC"
	Event_JFD_CulDiv_Mesopotamic.EventImage = 'Event_Mesopotamic.dds'
	Event_JFD_CulDiv_Mesopotamic.Weight = 2
	Event_JFD_CulDiv_Mesopotamic.CanFunc = (
		function(player)
			local playerID = player:GetID()
			local cultureID = JFD_GetCultureID(playerID)		
			if cultureID ~= cultureMesopotamicID then return false end
			return true
		end
		)
	Event_JFD_CulDiv_Mesopotamic.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CulDiv_Mesopotamic.Outcomes[1] = {}
	Event_JFD_CulDiv_Mesopotamic.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_MESOPOTAMIC_OUTCOME_1"
	Event_JFD_CulDiv_Mesopotamic.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_MESOPOTAMIC_OUTCOME_1_DESC"
	Event_JFD_CulDiv_Mesopotamic.Outcomes[1].CanFunc = (
		function(player)
			local playerID = player:GetID()
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil(15*iMod))
			Event_JFD_CulDiv_Mesopotamic.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MESOPOTAMIC_OUTCOME_1_DESC", cultureReward)
			return true
		end
		)
	Event_JFD_CulDiv_Mesopotamic.Outcomes[1].DoFunc = (
		function(player)
			local playerID = player:GetID()
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil(15*iMod))
			player:ChangeJONSCulture(cultureReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MESOPOTAMIC_OUTCOME_1_NOTIFICATION"), Locale.ConvertTextKey(Event_JFD_CulDiv_Mesopotamic.Name))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_MESOPOTAMIC", player:GetCivilizationAdjective())) 
		end
		)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CulDiv_Mesopotamic.Outcomes[2] = {}
	Event_JFD_CulDiv_Mesopotamic.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_MESOPOTAMIC_OUTCOME_2"
	Event_JFD_CulDiv_Mesopotamic.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_MESOPOTAMIC_OUTCOME_2_DESC"
	Event_JFD_CulDiv_Mesopotamic.Outcomes[2].CanFunc = (
		function(player)
			local playerID = player:GetID()
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil(40*iMod))
			Event_JFD_CulDiv_Mesopotamic.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MESOPOTAMIC_OUTCOME_2_DESC", faithReward)
			return true
		end
		)
	Event_JFD_CulDiv_Mesopotamic.Outcomes[2].DoFunc = (
		function(player)
			local playerID = player:GetID()
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil(40*iMod))
			player:ChangeFaith(faithReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MESOPOTAMIC_OUTCOME_2_NOTIFICATION"), Locale.ConvertTextKey(Event_JFD_CulDiv_Mesopotamic.Name))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_MESOPOTAMIC", player:GetCivilizationAdjective())) 
		end
		)
tEvents.Event_JFD_CulDiv_Mesopotamic = Event_JFD_CulDiv_Mesopotamic
--------------------------------------------------------------------------------------------------------------------------
--  Northern: Midsummer's Day
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_CulDiv_Northern = {}
	Event_JFD_CulDiv_Northern.Name = "TXT_KEY_EVENT_JFD_NORTHERN"
	Event_JFD_CulDiv_Northern.Desc = "TXT_KEY_EVENT_JFD_NORTHERN_DESC"
	Event_JFD_CulDiv_Northern.EventImage = 'Event_Northern.dds'
	Event_JFD_CulDiv_Northern.Weight = 2
	Event_JFD_CulDiv_Northern.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local cultureID = JFD_GetCultureID(playerID)		
			if cultureID ~= cultureNorthernID then return false end		
			return true
		end
		)
	Event_JFD_CulDiv_Northern.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CulDiv_Northern.Outcomes[1] = {}
	Event_JFD_CulDiv_Northern.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_NORTHERN_OUTCOME_1"
	Event_JFD_CulDiv_Northern.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_NORTHERN_OUTCOME_RESULT_1"
	Event_JFD_CulDiv_Northern.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFD_CulDiv_Northern.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NORTHERN_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFD_CulDiv_Northern.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			for city in player:Cities() do	
				city:ChangeWeLoveTheKingDayCounter(3)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_NORTHERN_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NORTHERN"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_NORTHERN", player:GetCivilizationDescription())) 
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CulDiv_Northern.Outcomes[2] = {}
	Event_JFD_CulDiv_Northern.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_NORTHERN_OUTCOME_2"
	Event_JFD_CulDiv_Northern.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_NORTHERN_OUTCOME_RESULT_2"
	Event_JFD_CulDiv_Northern.Outcomes[2].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(30*iMod))
			if player:GetGold() < goldCost then return false end
			Event_JFD_CulDiv_Northern.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NORTHERN_OUTCOME_RESULT_2", goldCost)
			return true
		end
		)
	Event_JFD_CulDiv_Northern.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(30*iMod))
			player:ChangeGold(-goldCost)
			for city in player:Cities() do	
				city:ChangeWeLoveTheKingDayCounter(6)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_NORTHERN_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NORTHERN"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_NORTHERN", player:GetCivilizationDescription())) 
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_CulDiv_Northern.Outcomes[3] = {}
	Event_JFD_CulDiv_Northern.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_NORTHERN_OUTCOME_3"
	Event_JFD_CulDiv_Northern.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_NORTHERN_OUTCOME_RESULT_3"
	Event_JFD_CulDiv_Northern.Outcomes[3].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(75*iMod))
			if player:GetGold() < goldCostEraAdj then return false end
			Event_JFD_CulDiv_Northern.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NORTHERN_OUTCOME_RESULT_3", goldCost)
			return true
		end
		)
	Event_JFD_CulDiv_Northern.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(75*iMod))
			player:ChangeGold(-goldCost)
			for city in player:Cities() do	
				city:ChangeWeLoveTheKingDayCounter(12)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_NORTHERN_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NORTHERN"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_NORTHERN", player:GetCivilizationDescription())) 
		end)

tEvents.Event_JFD_CulDiv_Northern = Event_JFD_CulDiv_Northern
--------------------------------------------------------------------------------------------------------------------------
-- Oceanic: Wayfinders
--------------------------------------------------------------------------------------------------------------------------
tEvents.Event_JFD_CulDiv_Oceanic = nil
local unitOceanicSettlerID = GameInfoTypes["UNIT_JFD_SETTLER_OCEANIC"]
local Event_JFD_CulDiv_Oceanic = {}
	Event_JFD_CulDiv_Oceanic.Name = "TXT_KEY_EVENT_JFD_OCEANIC"
	Event_JFD_CulDiv_Oceanic.Desc = "TXT_KEY_EVENT_JFD_OCEANIC_DESC"
	Event_JFD_CulDiv_Oceanic.EventImage = 'Event_Oceanic.dds'
	Event_JFD_CulDiv_Oceanic.Weight = 2
	Event_JFD_CulDiv_Oceanic.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local cultureID = JFD_GetCultureID(playerID)		
			if cultureID ~= cultureOceanicID then return false end
			return true
		end
		)
	Event_JFD_CulDiv_Oceanic.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CulDiv_Oceanic.Outcomes[1] = {}
	Event_JFD_CulDiv_Oceanic.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_OCEANIC_OUTCOME_1"
	Event_JFD_CulDiv_Oceanic.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_OCEANIC_OUTCOME_RESULT_1"
	Event_JFD_CulDiv_Oceanic.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFD_CulDiv_Oceanic.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_OCEANIC_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFD_CulDiv_Oceanic.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local capital = player:GetCapitalCity()
			if unitOceanicSettlerID then
				player:InitUnit(unitOceanicSettlerID, capital:GetX(), capital:GetY())
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_OCEANIC_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_OCEANIC"))
		end)

tEvents.Event_JFD_CulDiv_Oceanic = Event_JFD_CulDiv_Oceanic
--------------------------------------------------------------------------------------------------------------------------
--  Oriental: Warrior's Service
--------------------------------------------------------------------------------------------------------------------------
local unitPromotionDrill1ID = GameInfoTypes["PROMOTION_DRILL_1"]
local unitPromotionDrill2ID = GameInfoTypes["PROMOTION_DRILL_2"]
local unitPromotionShock1ID = GameInfoTypes["PROMOTION_SHOCK_1"]
local unitPromotionShock2ID = GameInfoTypes["PROMOTION_SHOCK_2"]
local Event_JFD_CulDiv_Oriental = {}
	Event_JFD_CulDiv_Oriental.Name = "TXT_KEY_EVENT_JFD_ORIENTAL"
	Event_JFD_CulDiv_Oriental.Desc = "TXT_KEY_EVENT_JFD_ORIENTAL_DESC"
	Event_JFD_CulDiv_Oriental.Weight = 2
	Event_JFD_CulDiv_Oriental.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local cultureID = JFD_GetCultureID(playerID)		
			if cultureID ~= cultureOrientalID then return false end
			return true
		end
		)
	Event_JFD_CulDiv_Oriental.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CulDiv_Oriental.Outcomes[1] = {}
	Event_JFD_CulDiv_Oriental.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_ORIENTAL_OUTCOME_1"
	Event_JFD_CulDiv_Oriental.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_ORIENTAL_OUTCOME_RESULT_1"
	Event_JFD_CulDiv_Oriental.Outcomes[1].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local goldenAgeReward = JFD_GetEraAdjustedValue(playerID, mathCeil(125*iMod))
			Event_JFD_CulDiv_Oriental.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ORIENTAL_OUTCOME_RESULT_1", goldenAgeReward)
			return true
		end
		)
	Event_JFD_CulDiv_Oriental.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldenAgeReward = JFD_GetEraAdjustedValue(playerID, mathCeil(125*iMod))
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ORIENTAL_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ORIENTAL"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CulDiv_Oriental.Outcomes[2] = {}
	Event_JFD_CulDiv_Oriental.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_ORIENTAL_OUTCOME_2"
	Event_JFD_CulDiv_Oriental.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_ORIENTAL_OUTCOME_RESULT_2"
	Event_JFD_CulDiv_Oriental.Outcomes[2].CanFunc = (
		function(player)
			Event_JFD_CulDiv_Oriental.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ORIENTAL_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFD_CulDiv_Oriental.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local capital = player:GetCapitalCity()
			local unitToSpawnID = GetStrongestMilitaryUnit(player, false, "UNITCLASS_MELEE", "UNITCLASS_GUN")
			if unitToSpawnID then
				local unit = player:InitUnit(unitToSpawnID, capital:GetX(), capital:GetY())
				unit:ChangeLevel(3)
				unit:SetHasPromotion(unitPromotionShock1ID, true)
				unit:SetHasPromotion(unitPromotionShock2ID, true)
				unit:SetHasPromotion(unitPromotionDrill1ID, true)
				unit:SetHasPromotion(unitPromotionDrill2ID, true)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ORIENTAL_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ORIENTAL"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ORIENTAL", player:GetName(), player:GetCivilizationDescription())) 
		end)

tEvents.Event_JFD_CulDiv_Oriental = Event_JFD_CulDiv_Oriental
--------------------------------------------------------------------------------------------------------------------------
-- Polar: Ceremony
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_CulDiv_Polar = {}
    Event_JFD_CulDiv_Polar.Name = "TXT_KEY_EVENT_JFD_POLAR"
	Event_JFD_CulDiv_Polar.Desc = "TXT_KEY_EVENT_JFD_POLAR_DESC"
	Event_JFD_CulDiv_Polar.EventImage = 'Event_Polar.dds'
	Event_JFD_CulDiv_Polar.Weight = 2
	Event_JFD_CulDiv_Polar.CanFunc = (
		function(player)
			local playerID = player:GetID()
			local cultureID = JFD_GetCultureID(playerID)		
			if cultureID ~= culturePolarID then return false end
			Event_JFD_CulDiv_Polar.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_POLAR_DESC", player:GetCivilizationAdjective())
			return true
		end
		)
	Event_JFD_CulDiv_Polar.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CulDiv_Polar.Outcomes[1] = {}
	Event_JFD_CulDiv_Polar.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_POLAR_OUTCOME_1"
	Event_JFD_CulDiv_Polar.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_POLAR_OUTCOME_1_DESC"
	Event_JFD_CulDiv_Polar.Outcomes[1].CanFunc = (
		function(player)
			Event_JFD_CulDiv_Polar.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_POLAR_OUTCOME_1_DESC")
			return true
		end
		)
	Event_JFD_CulDiv_Polar.Outcomes[1].DoFunc = (
		function(player)
			local playerID = player:GetID()
			for city in player:Cities() do
				city:ChangeWeLoveTheKingDayCounter(5)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_POLAR_OUTCOME_1_NOTIFICATION"), Locale.ConvertTextKey(Event_JFD_CulDiv_Polar.Name))
		end
		)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CulDiv_Polar.Outcomes[2] = {}
	Event_JFD_CulDiv_Polar.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_POLAR_OUTCOME_2"
	Event_JFD_CulDiv_Polar.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_POLAR_OUTCOME_2_DESC"
	Event_JFD_CulDiv_Polar.Outcomes[2].CanFunc = (
		function(player)
			local playerID = player:GetID()
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil(40*iMod))
			Event_JFD_CulDiv_Polar.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_POLAR_OUTCOME_2_DESC", cultureReward)
			return true
		end
		)
	Event_JFD_CulDiv_Polar.Outcomes[2].DoFunc = (
		function(player)
			local playerID = player:GetID()
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil(40*iMod))
			player:ChangeJONSCulture(cultureReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_POLAR_OUTCOME_2_NOTIFICATION"), Locale.ConvertTextKey(Event_JFD_CulDiv_Polar.Name))
		end
		)
	
tEvents.Event_JFD_CulDiv_Polar = Event_JFD_CulDiv_Polar
--------------------------------------------------------------------------------------------------------------------------
-- Sahul: Ceremony
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_CulDiv_Sahul = {}
    Event_JFD_CulDiv_Sahul.Name = "TXT_KEY_EVENT_JFD_SAHUL"
	Event_JFD_CulDiv_Sahul.Desc = "TXT_KEY_EVENT_JFD_SAHUL_DESC"
	Event_JFD_CulDiv_Sahul.Weight = 2
	Event_JFD_CulDiv_Sahul.CanFunc = (
		function(player)
			local playerID = player:GetID()
			local cultureID = JFD_GetCultureID(playerID)		
			if cultureID ~= cultureSahulID then return false end
			return true
		end
		)
	Event_JFD_CulDiv_Sahul.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CulDiv_Sahul.Outcomes[1] = {}
	Event_JFD_CulDiv_Sahul.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_SAHUL_OUTCOME_1"
	Event_JFD_CulDiv_Sahul.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_SAHUL_OUTCOME_1_DESC"
	Event_JFD_CulDiv_Sahul.Outcomes[1].CanFunc = (
		function(player)
			local playerID = player:GetID()
			local goldenAgeReward = JFD_GetEraAdjustedValue(playerID, mathCeil(40*iMod))
			Event_JFD_CulDiv_Sahul.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SAHUL_OUTCOME_1_DESC", goldenAgeReward)
			return true
		end
		)
	Event_JFD_CulDiv_Sahul.Outcomes[1].DoFunc = (
		function(player)
			local playerID = player:GetID()
			local goldenAgeReward = JFD_GetEraAdjustedValue(playerID, mathCeil(40*iMod))
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SAHUL_OUTCOME_1_NOTIFICATION"), Locale.ConvertTextKey(Event_JFD_CulDiv_Sahul.Name))
		end
		)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CulDiv_Sahul.Outcomes[2] = {}
	Event_JFD_CulDiv_Sahul.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_SAHUL_OUTCOME_2"
	Event_JFD_CulDiv_Sahul.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_SAHUL_OUTCOME_2_DESC"
	Event_JFD_CulDiv_Sahul.Outcomes[2].CanFunc = (
		function(player)
			Event_JFD_CulDiv_Sahul.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SAHUL_OUTCOME_2_DESC")
			return true
		end
		)
	Event_JFD_CulDiv_Sahul.Outcomes[2].DoFunc = (
		function(player)
			for city in player:Cities() do
				city:ChangeWeLoveTheKingDayCounter(5)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SAHUL_OUTCOME_2_NOTIFICATION"), Locale.ConvertTextKey(Event_JFD_CulDiv_Sahul.Name))
		end
		)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_CulDiv_Sahul.Outcomes[3] = {}
	Event_JFD_CulDiv_Sahul.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_SAHUL_OUTCOME_3"
	Event_JFD_CulDiv_Sahul.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_SAHUL_OUTCOME_3_DESC"
	Event_JFD_CulDiv_Sahul.Outcomes[3].CanFunc = (
		function(player)
			local playerID = player:GetID()
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil(25*iMod))
			if Teams[player:GetTeam()]:GetAtWarCount(false) > 0 then return false end
			Event_JFD_CulDiv_Sahul.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SAHUL_OUTCOME_3_DESC", cultureRewardEraAdj)
			return true
		end
		)
	Event_JFD_CulDiv_Sahul.Outcomes[3].DoFunc = (
		function(player)
			local playerID = player:GetID()
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil(25*iMod))
			player:ChangeJONSCulture(cultureReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SAHUL_OUTCOME_3_NOTIFICATION"), Locale.ConvertTextKey(Event_JFD_CulDiv_Sahul.Name))
		end
		)
	
tEvents.Event_JFD_CulDiv_Sahul = Event_JFD_CulDiv_Sahul
--------------------------------------------------------------------------------------------------------------------------
-- Semitic: Chosen People
--------------------------------------------------------------------------------------------------------------------------
local unitSettlerID = GameInfoTypes["UNIT_SETTLER"]
local unitWorkerID	= GameInfoTypes["UNIT_WORKER"]
local Event_JFD_CulDiv_Semitic = {}
    Event_JFD_CulDiv_Semitic.Name = "TXT_KEY_EVENT_JFD_SEMITIC"
	Event_JFD_CulDiv_Semitic.Desc = "TXT_KEY_EVENT_JFD_SEMITIC_DESC"
	Event_JFD_CulDiv_Semitic.EventImage = 'Event_Semitic.dds'
	Event_JFD_CulDiv_Semitic.Weight = 2
	Event_JFD_CulDiv_Semitic.CanFunc = (
		function(player)
			local playerID = player:GetID()
			local cultureID = JFD_GetCultureID(playerID)		
			if cultureID ~= cultureSemiticID then return false end
			return true
		end
		)
	Event_JFD_CulDiv_Semitic.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CulDiv_Semitic.Outcomes[1] = {}
	Event_JFD_CulDiv_Semitic.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_SEMITIC_OUTCOME_1"
	Event_JFD_CulDiv_Semitic.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_SEMITIC_OUTCOME_1_DESC"
	Event_JFD_CulDiv_Semitic.Outcomes[1].CanFunc = (
		function(player)
			Event_JFD_CulDiv_Semitic.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SEMITIC_OUTCOME_1_DESC")
			return true
		end
		)
	Event_JFD_CulDiv_Semitic.Outcomes[1].DoFunc = (
		function(player)
			local playerID = player:GetID()
			local capitalX = player:GetCapitalCity():GetX()
			local capitalY = player:GetCapitalCity():GetY()
			if (unitSettlerID and unitWorkerID) then
				player:InitUnit(unitSettlerID, capitalX, capitalY)
				player:InitUnit(unitWorkerID, capitalX, capitalY)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SEMITIC_OUTCOME_1_NOTIFICATION"), Locale.ConvertTextKey(Event_JFD_CulDiv_Semitic.Name))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SEMITIC", player:GetCivilizationAdjective()))
		end
		)
	
tEvents.Event_JFD_CulDiv_Semitic = Event_JFD_CulDiv_Semitic
--------------------------------------------------------------------------------------------------------------------------
-- Southern: Political Philosopher
--------------------------------------------------------------------------------------------------------------------------
local unitWriterID = GameInfoTypes["UNIT_WRITER"]
local Event_JFD_CulDiv_Southern = {}
    Event_JFD_CulDiv_Southern.Name = "TXT_KEY_EVENT_JFD_SOUTHERN"
	Event_JFD_CulDiv_Southern.Desc = "TXT_KEY_EVENT_JFD_SOUTHERN_DESC"
	Event_JFD_CulDiv_Southern.EventImage = 'Event_Southern.dds'
	Event_JFD_CulDiv_Southern.Weight = 2
	Event_JFD_CulDiv_Southern.CanFunc = (
		function(player)
			local playerID = player:GetID()
			local cultureID = JFD_GetCultureID(playerID)		
			if cultureID ~= cultureSouthernID then return false end
			return true
		end
		)
	Event_JFD_CulDiv_Southern.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CulDiv_Southern.Outcomes[1] = {}
	Event_JFD_CulDiv_Southern.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_SOUTHERN_OUTCOME_1"
	Event_JFD_CulDiv_Southern.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_SOUTHERN_OUTCOME_1_DESC"
	Event_JFD_CulDiv_Southern.Outcomes[1].CanFunc = (
		function(player)
			local playerID = player:GetID()
			local goldenAgeReward = JFD_GetEraAdjustedValue(playerID, mathCeil(100*iMod))
			Event_JFD_CulDiv_Southern.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SOUTHERN_OUTCOME_1_DESC", goldenAgeRewardEraAdj)
			return true
		end
		)
	Event_JFD_CulDiv_Southern.Outcomes[1].DoFunc = (
		function(player)
			local playerID = player:GetID()
			local goldenAgeReward = JFD_GetEraAdjustedValue(playerID, mathCeil(100*iMod))
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SOUTHERN_OUTCOME_1_NOTIFICATION"), Locale.ConvertTextKey(Event_JFD_CulDiv_Southern.Name))
		end
		)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CulDiv_Southern.Outcomes[2] = {}
	Event_JFD_CulDiv_Southern.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_SOUTHERN_OUTCOME_2"
	Event_JFD_CulDiv_Southern.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_SOUTHERN_OUTCOME_2_DESC"
	Event_JFD_CulDiv_Southern.Outcomes[2].CanFunc = (
		function(player)
			Event_JFD_CulDiv_Southern.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SOUTHERN_OUTCOME_2_DESC")
			return true
		end
		)
	Event_JFD_CulDiv_Southern.Outcomes[2].DoFunc = (
		function(player)
			local playerID = player:GetID()
			local capital = player:GetCapitalCity()
			if unitWriterID then
				player:InitUnit(unitWriterID, capital:GetX(), capital:GetY())
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SOUTHERN_OUTCOME_2_NOTIFICATION"), Locale.ConvertTextKey(Event_JFD_CulDiv_Southern.Name))
		end
		)
	
tEvents.Event_JFD_CulDiv_Southern = Event_JFD_CulDiv_Southern
--------------------------------------------------------------------------------------------------------------------------
-- Steppe: Great Horde
--------------------------------------------------------------------------------------------------------------------------
local techHorsebackRidingID = GameInfoTypes["TECH_HORSEBACK_RIDING"]
local Event_JFD_CulDiv_Steppe = {}
	Event_JFD_CulDiv_Steppe.Name = "TXT_KEY_EVENT_JFD_STEPPE"
	Event_JFD_CulDiv_Steppe.Desc = "TXT_KEY_EVENT_JFD_STEPPE_DESC"
	Event_JFD_CulDiv_Steppe.EventImage = 'Event_Steppe.dds'
	Event_JFD_CulDiv_Steppe.Weight = 2
	Event_JFD_CulDiv_Steppe.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local cultureID = JFD_GetCultureID(playerID)		
			if cultureID ~= cultureSteppeID then return false end
			if player:GetCurrentEra() >= eraIndustrialID then return false end
			if Teams[player:GetTeam()]:GetAtWarCount(false) == 0 then return false end
			if (techHorsebackRidingID and (not Teams[player:GetTeam()]:IsHasTech(techHorsebackRidingID))) then return false end
			return true
		end
		)
	Event_JFD_CulDiv_Steppe.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CulDiv_Steppe.Outcomes[1] = {}
	Event_JFD_CulDiv_Steppe.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_STEPPE_OUTCOME_1"
	Event_JFD_CulDiv_Steppe.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_STEPPE_OUTCOME_RESULT_1"
	Event_JFD_CulDiv_Steppe.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFD_CulDiv_Steppe.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_STEPPE_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFD_CulDiv_Steppe.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local capitalX = player:GetCapitalCity():GetX()
			local capitalY = player:GetCapitalCity():GetY()
			local unitToSpawnID = GetStrongestMilitaryUnit(player, true, "UNITCOMBAT_MOUNTED")
			if (unitToSpawnID and unitGreatGeneralID) then
				player:ChangeNumResourceTotal(GameInfoTypes["RESOURCE_HORSE"], 3)
				player:InitUnit(unitToSpawnID, capitalX, capitalY):JumpToNearestValidPlot()
				player:InitUnit(unitToSpawnID, capitalX, capitalY):JumpToNearestValidPlot()
				player:InitUnit(unitToSpawnID, capitalX, capitalY):JumpToNearestValidPlot()
				local unitGreatGeneralID = GameInfoTypes[JFD_GetUniqueUnit(player, "UNITCLASS_GREAT_GENERAL")]
				player:InitUnit(unitGreatGeneralID, capitalX, capitalY):JumpToNearestValidPlot()
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_STEPPE_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_STEPPE"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_STEPPE", player:GetCivilizationAdjective(), player:GetName())) 	
		end)

tEvents.Event_JFD_CulDiv_Steppe = Event_JFD_CulDiv_Steppe
--------------------------------------------------------------------------------------------------------------------------
--  Totaitarian: Celebrations For Our Glorious Leader
--------------------------------------------------------------------------------------------------------------------------
local unitDomainLandID			= GameInfoTypes["DOMAIN_LAND"]
local unitPromotionExtraMovesID	= GameInfoTypes["PROMOTION_EXTRA_MOVES_I"]
local Event_JFD_CulDiv_Totalitarian = {}
	Event_JFD_CulDiv_Totalitarian.Name = "TXT_KEY_EVENT_JFD_TOLTALITARIAN"
	Event_JFD_CulDiv_Totalitarian.Desc = "TXT_KEY_EVENT_JFD_TOLTALITARIAN_DESC"
	Event_JFD_CulDiv_Totalitarian.EventImage = 'Event_Totalitarian.dds'
	Event_JFD_CulDiv_Totalitarian.Weight = 2
	Event_JFD_CulDiv_Totalitarian.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local cultureID = JFD_GetCultureID(playerID)		
			if cultureID ~= cultureTotalitarianID then return false end
			return true
		end
		)
	Event_JFD_CulDiv_Totalitarian.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CulDiv_Totalitarian.Outcomes[1] = {}
	Event_JFD_CulDiv_Totalitarian.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_TOLTALITARIAN_OUTCOME_1"
	Event_JFD_CulDiv_Totalitarian.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_TOLTALITARIAN_OUTCOME_RESULT_1"
	Event_JFD_CulDiv_Totalitarian.Outcomes[1].Weight = 2
	Event_JFD_CulDiv_Totalitarian.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFD_CulDiv_Totalitarian.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_TOLTALITARIAN_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFD_CulDiv_Totalitarian.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			for unit in player:Units() do	
				if (unit:GetDomainType() == unitDomainLandID and unitPromotionExtraMovesID) then
					unit:SetHasPromotion(unitPromotionExtraMovesID, true)
				end
			end
			for city in player:Cities() do
				if city:GetGarrisonedUnit() then
					city:ChangeWeLoveTheKingDayCounter(2)
				end
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_TOLTALITARIAN_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey(Event_JFD_CulDiv_Totalitarian.Name))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_TOLTALITARIAN", player:GetCivilizationShortDescription())) 
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CulDiv_Totalitarian.Outcomes[2] = {}
	Event_JFD_CulDiv_Totalitarian.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_TOLTALITARIAN_OUTCOME_2"
	Event_JFD_CulDiv_Totalitarian.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_TOLTALITARIAN_OUTCOME_RESULT_2"
	Event_JFD_CulDiv_Totalitarian.Outcomes[2].Weight = 0
	Event_JFD_CulDiv_Totalitarian.Outcomes[2].CanFunc = (
		function(player)	
			Event_JFD_CulDiv_Totalitarian.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_TOLTALITARIAN_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFD_CulDiv_Totalitarian.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			for city in player:Cities() do
				city:ChangePopulation(-100, true)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_TOLTALITARIAN_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey(Event_JFD_CulDiv_Totalitarian.Name))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_TOLTALITARIAN", player:GetCivilizationShortDescription())) 
		end)

tEvents.Event_JFD_CulDiv_Totalitarian = Event_JFD_CulDiv_Totalitarian
--------------------------------------------------------------------------------------------------------------------------
-- Tribal-American: War Chief
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_CulDiv_TribalAmerican = {}
	Event_JFD_CulDiv_TribalAmerican.Name = "TXT_KEY_EVENT_JFD_TRIBAL_AMERICAN"
	Event_JFD_CulDiv_TribalAmerican.Desc = "TXT_KEY_EVENT_JFD_TRIBAL_AMERICAN_DESC"
	Event_JFD_CulDiv_TribalAmerican.EventImage = 'Event_TribalAmerican.dds'
	Event_JFD_CulDiv_TribalAmerican.Weight = 2
	Event_JFD_CulDiv_TribalAmerican.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local cultureID = JFD_GetCultureID(playerID)		
			if cultureID ~= cultureTribalAmericanID then return false end
			return true
		end
		)
	Event_JFD_CulDiv_TribalAmerican.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CulDiv_TribalAmerican.Outcomes[1] = {}
	Event_JFD_CulDiv_TribalAmerican.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_TRIBAL_AMERICAN_OUTCOME_1"
	Event_JFD_CulDiv_TribalAmerican.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_TRIBAL_AMERICAN_OUTCOME_RESULT_1"
	Event_JFD_CulDiv_TribalAmerican.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFD_CulDiv_TribalAmerican.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_TRIBAL_AMERICAN_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFD_CulDiv_TribalAmerican.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local capital = player:GetCapitalCity()
			local unitGreatGeneral = JFD_GetUniqueUnit(player, "UNITCLASS_GREAT_GENERAL")
			local unitGreatGeneralID = GameInfoTypes[unitGreatGeneral]
			if unitGreatGeneralID then
				player:InitUnit(unitGreatGeneralID, capital:GetX(), capital:GetY())
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_TRIBAL_AMERICAN_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_TRIBAL_AMERICAN"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_TRIBAL_AMERICAN", player:GetCivilizationAdjective())) 
		end)

tEvents.Event_JFD_CulDiv_TribalAmerican = Event_JFD_CulDiv_TribalAmerican
--------------------------------------------------------------------------------------------------------------------------
-- West African: Precious Luxury
--------------------------------------------------------------------------------------------------------------------------
local resourceCopperID	= GameInfoTypes["RESOURCE_COPPER"]
local resourceGemsID	= GameInfoTypes["RESOURCE_GEMS"]
local resourceGoldID	= GameInfoTypes["RESOURCE_GOLD"]
local resourceSaltID	= GameInfoTypes["RESOURCE_SALT"]
local westAfricanCityID
local luxuries = {}
	luxuries[1] = resourceCopperID
	luxuries[2] = resourceGemsID
	luxuries[3] = resourceGoldID
	luxuries[4] = resourceSaltID
local luxuryID = nil
local Event_JFD_CulDiv_WestAfrican = {}
	Event_JFD_CulDiv_WestAfrican.Name = "TXT_KEY_EVENT_JFD_WEST_AFRICAN"
	Event_JFD_CulDiv_WestAfrican.Desc = "TXT_KEY_EVENT_JFD_WEST_AFRICAN_DESC"
	Event_JFD_CulDiv_WestAfrican.EventImage = 'Event_WestAfrican.dds'
	Event_JFD_CulDiv_WestAfrican.Weight = 2
	Event_JFD_CulDiv_WestAfrican.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local cultureID = JFD_GetCultureID(playerID)		
			if cultureID ~= cultureWestAfricanID then return false end
			local cities = {}
			local count = 1
			for city in player:Cities() do
				cities[count] = city:GetID()
				count = count + 1
			end
			westAfricanCityID = cities[JFD_GetRandom(1, #cities)]
			if (not westAfricanCityID) then return false end
			luxuryID = luxuries[JFD_GetRandom(1,4)]
			if (not luxuryID) then return false end
			local luxuryDescription = GameInfo.Resources[luxuryID].Description
			Event_JFD_CulDiv_WestAfrican.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_WEST_AFRICAN_DESC", luxuryDescription, player:GetCityByID(westAfricanCityID):GetName())
			return true
		end
		)
	Event_JFD_CulDiv_WestAfrican.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CulDiv_WestAfrican.Outcomes[1] = {}
	Event_JFD_CulDiv_WestAfrican.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_WEST_AFRICAN_OUTCOME_1"
	Event_JFD_CulDiv_WestAfrican.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_WEST_AFRICAN_OUTCOME_RESULT_1"
	Event_JFD_CulDiv_WestAfrican.Outcomes[1].Weight = 2
	Event_JFD_CulDiv_WestAfrican.Outcomes[1].CanFunc = (
		function(player)	
			if (luxuryID and westAfricanCityID) then
				local cityName = player:GetCityByID(westAfricanCityID):GetName()
				local luxuryDescription = GameInfo.Resources[luxuryID].Description
				Event_JFD_CulDiv_WestAfrican.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_WEST_AFRICAN_OUTCOME_RESULT_1", luxuryDescription, cityName)
				return true
			end
		end
		)
	Event_JFD_CulDiv_WestAfrican.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			if (luxuryID and westAfricanCityID) then
				local city = player:GetCityByID(westAfricanCityID)
				local cityName = city:GetName()
				local luxuryDescription = GameInfo.Resources[luxuryID].Description
				Sukritact_PlaceResource(Map.GetPlot(city:GetX(), city:GetY()), luxuryID, 1, nil, true)
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_WEST_AFRICAN_OUTCOME_RESULT_1_NOTIFICATION", luxuryDescription, cityName), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_WEST_AFRICAN"), city:GetX(), city:GetY())
				JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_WEST_AFRICAN", luxuryDescription, player:GetCivilizationAdjective(), cityName)) 
			end
		end)
	
tEvents.Event_JFD_CulDiv_WestAfrican = Event_JFD_CulDiv_WestAfrican
--------------------------------------------------------------------------------------------------------------------------
--  Western: Colonial Investors
--------------------------------------------------------------------------------------------------------------------------
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local Event_JFD_CulDiv_Western = {}
	Event_JFD_CulDiv_Western.Name = "TXT_KEY_EVENT_JFD_WESTERN"
	Event_JFD_CulDiv_Western.Desc = "TXT_KEY_EVENT_JFD_WESTERN_DESC"
	Event_JFD_CulDiv_Western.EventImage = 'Event_Western.dds'
	Event_JFD_CulDiv_Western.Weight = 2
	Event_JFD_CulDiv_Western.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local cultureID = JFD_GetCultureID(playerID)		
			if cultureID ~= cultureWesternID then return false end
			if player:GetCurrentEra() < eraRenaissanceID then return false end
			local goldReward = mathCeil(100*iMod)
			local goldRewardEraAdj = JFD_GetEraAdjustedValue(playerID, goldReward)
			local cultureCost = mathCeil((goldRewardEraAdj*40)/100)
			if player:GetJONSCulture() < cultureCost then return false end
			return true
		end
		)
	Event_JFD_CulDiv_Western.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CulDiv_Western.Outcomes[1] = {}
	Event_JFD_CulDiv_Western.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_WESTERN_OUTCOME_1"
	Event_JFD_CulDiv_Western.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_WESTERN_OUTCOME_RESULT_1"
	Event_JFD_CulDiv_Western.Outcomes[1].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local goldReward = JFD_GetEraAdjustedValue(playerID, mathCeil(100*iMod))
			local cultureCost = mathCeil((goldReward*40)/100)
			Event_JFD_CulDiv_Western.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_WESTERN_OUTCOME_RESULT_1", goldReward, cultureCost)
			return true
		end
		)
	Event_JFD_CulDiv_Western.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local capital = player:GetCapitalCity()
			local goldReward = JFD_GetEraAdjustedValue(playerID, mathCeil(100*iMod))
			local cultureCost = mathCeil((goldReward*40)/100)
			if unitSettlerID then
				player:ChangeGold(goldReward)
				player:InitUnit(unitSettlerID, capital:GetX(), capital:GetY())
			end
			player:ChangeJONSCulture(-cultureCost)
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_WESTERN", player:GetName())) 
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_WESTERN_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey(Event_JFD_CulDiv_Western.Name))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CulDiv_Western.Outcomes[2] = {}
	Event_JFD_CulDiv_Western.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_WESTERN_OUTCOME_2"
	Event_JFD_CulDiv_Western.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_WESTERN_OUTCOME_RESULT_2"
	Event_JFD_CulDiv_Western.Outcomes[2].CanFunc = (
		function(player)
			Event_JFD_CulDiv_Western.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_WESTERN_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFD_CulDiv_Western.Outcomes[2].DoFunc = (
		function(player) 
		end)

tEvents.Event_JFD_CulDiv_Western = Event_JFD_CulDiv_Western
--=======================================================================================================================
--=======================================================================================================================


