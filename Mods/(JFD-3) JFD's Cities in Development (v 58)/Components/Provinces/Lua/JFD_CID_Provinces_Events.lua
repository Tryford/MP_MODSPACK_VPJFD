-- JFD_CID_Provinces_Events
-- Author: JFD
-- DateCreated: 1/8/2016 12:10:09 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_CID_ProvincesUtils.lua")
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
--------------------------------------------------------------------------------------------------------------------------
-- MOD CHECKS
--------------------------------------------------------------------------------------------------------------------------
local isUsingPiety = JFD_IsUsingRTP()
--=======================================================================================================================
-- EVENTS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local eraAncientID = GameInfoTypes["ERA_ANCIENT"]
local eraClassicalID = GameInfoTypes["ERA_CLASSICAL"]
--------------------------------------------------------------------------------------------------------------------------
-- Provinces: The Great Ball
--------------------------------------------------------------------------------------------------------------------------
local eventGreatBallCity = nil
local eventGreatBallDesc = "Ball"
local Event_JFD_CID_Provinces_GreatBall = {}
	Event_JFD_CID_Provinces_GreatBall.Name = "TXT_KEY_EVENT_JFD_CID_PROVINCES_GREAT_BALL"
	Event_JFD_CID_Provinces_GreatBall.Desc = "TXT_KEY_EVENT_JFD_CID_PROVINCES_GREAT_BALL_DESC"
	Event_JFD_CID_Provinces_GreatBall.EventImage = "Event_ProvincesBall.dds"
	Event_JFD_CID_Provinces_GreatBall.Weight = 10
	Event_JFD_CID_Provinces_GreatBall.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			if player:GetCurrentEra() == eraAncientID then
				eventGreatBallDesc = "Ceremony"
			elseif player:GetCurrentEra() == eraClassicalID then
				eventGreatBallDesc = "Orgy"
			end
			if (not eventGreatBallDesc) then return false end
			local cities = {}
			local count = 1
			for city in player:Cities() do
				if ((not city:IsCapital()) and city:GetWeLoveTheKingDayCounter() > 0) then
					 cities[count] = city
					 count = count + 1
				end
			end
			eventGreatBallCity = cities[GetRandom(1,#cities)]
			if (not eventGreatBallCity) then return false end
			local provinceID = JFD_GetProvinceID(playerID, eventGreatBallCity)
			local province = GameInfo.JFD_Provinces[provinceID]
			local provinceRuler = JFD_GetUniqueProvinceRulerTitle(playerID, eventGreatBallCity)
			if GetRandom(1,2) == 1 then
				provinceRuler = provinceRuler .. "_FEMININE"
			end
			Event_JFD_CID_Provinces_GreatBall.Name = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_PROVINCES_GREAT_BALL", eventGreatBallDesc)
			Event_JFD_CID_Provinces_GreatBall.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_PROVINCES_GREAT_BALL_DESC", eventGreatBallDesc, provinceRuler, eventGreatBallCity:GetName())
			return true
		end
		)
	Event_JFD_CID_Provinces_GreatBall.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CID_Provinces_GreatBall.Outcomes[1] = {}
	Event_JFD_CID_Provinces_GreatBall.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_CID_PROVINCES_GREAT_BALL_OUTCOME_1"
	Event_JFD_CID_Provinces_GreatBall.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_CID_PROVINCES_GREAT_BALL_OUTCOME_RESULT_1"
	Event_JFD_CID_Provinces_GreatBall.Outcomes[1].Weight = 5
	Event_JFD_CID_Provinces_GreatBall.Outcomes[1].CanFunc = (
		function(player)			
			Event_JFD_CID_Provinces_GreatBall.Outcomes[1].Name = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_PROVINCES_GREAT_BALL_OUTCOME_1", eventGreatBallDesc)
			Event_JFD_CID_Provinces_GreatBall.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_PROVINCES_GREAT_BALL_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFD_CID_Provinces_GreatBall.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			player:GetCapitalCity():ChangeWeLoveTheKingDayCounter(5)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CID_PROVINCES_GREAT_BALL_OUTCOME_RESULT_1_NOTIFICATION", eventGreatBallDesc, eventGreatBallCity:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_PROVINCES_GREAT_BALL", eventGreatBallDesc))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CID_Provinces_GreatBall.Outcomes[2] = {}
	Event_JFD_CID_Provinces_GreatBall.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_CID_PROVINCES_GREAT_BALL_OUTCOME_2"
	Event_JFD_CID_Provinces_GreatBall.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_CID_PROVINCES_GREAT_BALL_OUTCOME_RESULT_2"
	Event_JFD_CID_Provinces_GreatBall.Outcomes[2].Weight = 5
	Event_JFD_CID_Provinces_GreatBall.Outcomes[2].CanFunc = (
		function(player)			
			local goldenAgeReward = mathCeil(100*iMod)
			Event_JFD_CID_Provinces_GreatBall.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_PROVINCES_GREAT_BALL_OUTCOME_RESULT_2", eventGreatBallCity:GetName(), goldenAgeReward)
			return true
		end
		)
	Event_JFD_CID_Provinces_GreatBall.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldenAgeReward = mathCeil(100*iMod)
			eventGreatBallCity:ChangeWeLoveTheKingDayCounter(-eventGreatBallCity:GetWeLoveTheKingDayCounter())
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CID_PROVINCES_GREAT_BALL_OUTCOME_RESULT_2_NOTIFICATION", eventGreatBallDesc, eventGreatBallCity:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_PROVINCES_GREAT_BALL", eventGreatBallDesc))
		end)

tEvents.Event_JFD_CID_Provinces_GreatBall = Event_JFD_CID_Provinces_GreatBall
--------------------------------------------------------------------------------------------------------------------------
-- Provinces: Insane Ruler      
--------------------------------------------------------------------------------------------------------------------------
local eventInsaneRulerCity = nil
local Event_JFD_CID_Provinces_InsaneRuler = {}
	Event_JFD_CID_Provinces_InsaneRuler.Name = "TXT_KEY_EVENT_JFD_CID_PROVINCES_INSANE_RULER"
	Event_JFD_CID_Provinces_InsaneRuler.Desc = "TXT_KEY_EVENT_JFD_CID_PROVINCES_INSANE_RULER_DESC"
	Event_JFD_CID_Provinces_InsaneRuler.EventImage = "Event_ProvincesInsane.dds"
	Event_JFD_CID_Provinces_InsaneRuler.Weight = 10
	Event_JFD_CID_Provinces_InsaneRuler.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local goldenAgeCost = JFD_GetEraAdjustedValue(playerID, mathCeil(100*iMod))
			if player:GetGoldenAgeProgressMeter() < goldenAgeCost then return false end
			local cities = {}
			local count = 1
			for city in player:Cities() do
				if (not city:IsCapital()) then
					 cities[count] = city
					 count = count + 1
				end
			end
			eventInsaneRulerCity = cities[GetRandom(1,#cities)]
			if (not eventInsaneRulerCity) then return false end
			local provinceID = JFD_GetProvinceID(playerID, eventInsaneRulerCity)
			local province = GameInfo.JFD_Provinces[provinceID]
			local provinceRuler = JFD_GetUniqueProvinceRulerTitle(playerID, eventInsaneRulerCity)
			if GetRandom(1,2) == 1 then
				provinceRuler = provinceRuler .. "_FEMININE"
			end
			if (not provinceRuler) then return false end
			Event_JFD_CID_Provinces_InsaneRuler.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_PROVINCES_INSANE_RULER_DESC", provinceRuler, eventInsaneRulerCity:GetName())
			return true
		end
		)
	Event_JFD_CID_Provinces_InsaneRuler.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CID_Provinces_InsaneRuler.Outcomes[1] = {}
	Event_JFD_CID_Provinces_InsaneRuler.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_CID_PROVINCES_INSANE_RULER_OUTCOME_1"
	Event_JFD_CID_Provinces_InsaneRuler.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_CID_PROVINCES_INSANE_RULER_OUTCOME_RESULT_1"
	Event_JFD_CID_Provinces_InsaneRuler.Outcomes[1].Weight = 5
	Event_JFD_CID_Provinces_InsaneRuler.Outcomes[1].CanFunc = (
		function(player)			
			Event_JFD_CID_Provinces_InsaneRuler.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_PROVINCES_INSANE_RULER_OUTCOME_RESULT_1", eventInsaneRulerCity:GetName())
			return true
		end
		)
	Event_JFD_CID_Provinces_InsaneRuler.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			if eventInsaneRulerCity then
				eventInsaneRulerCity:ChangeResistanceTurns(1)
				eventInsaneRulerCity:ChangeWeLoveTheKingDayCounter(20)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CID_PROVINCES_INSANE_RULER_OUTCOME_RESULT_1_NOTIFICATION", eventInsaneRulerCity:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_PROVINCES_INSANE_RULER"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CID_Provinces_InsaneRuler.Outcomes[2] = {}
	Event_JFD_CID_Provinces_InsaneRuler.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_CID_PROVINCES_INSANE_RULER_OUTCOME_2"
	Event_JFD_CID_Provinces_InsaneRuler.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_CID_PROVINCES_INSANE_RULER_OUTCOME_RESULT_2"
	Event_JFD_CID_Provinces_InsaneRuler.Outcomes[2].Weight = 5
	Event_JFD_CID_Provinces_InsaneRuler.Outcomes[2].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local goldenAgeCost = JFD_GetEraAdjustedValue(playerID, mathCeil(100*iMod))
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil(50*iMod))
			Event_JFD_CID_Provinces_InsaneRuler.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_PROVINCES_INSANE_RULER_OUTCOME_RESULT_2", goldenAgeCost, cultureReward)
			return true
		end
		)
	Event_JFD_CID_Provinces_InsaneRuler.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldenAgeCost = JFD_GetEraAdjustedValue(playerID, mathCeil(100*iMod))
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil(50*iMod))
			player:ChangeJONSCulture(cultureReward)
			player:ChangeGoldenAgeProgressMeter(-goldenAgeCost)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CID_PROVINCES_INSANE_RULER_OUTCOME_RESULT_2_NOTIFICATION", eventInsaneRulerCity:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_PROVINCES_INSANE_RULER"))
		end)

tEvents.Event_JFD_CID_Provinces_InsaneRuler = Event_JFD_CID_Provinces_InsaneRuler
--------------------------------------------------------------------------------------------------------------------------
-- Provinces: Request for Support
--------------------------------------------------------------------------------------------------------------------------
local eventSupportCity = nil
local eventSupportYield = nil
local eventSupportYieldCost = nil
local Event_JFD_CID_Provinces_Support = {}
	Event_JFD_CID_Provinces_Support.Name = "TXT_KEY_EVENT_JFD_CID_PROVINCES_REQUEST"
	Event_JFD_CID_Provinces_Support.Desc = "TXT_KEY_EVENT_JFD_CID_PROVINCES_REQUEST_DESC"
	Event_JFD_CID_Provinces_Support.EventImage = "Event_ProvincesRequest.dds"
	Event_JFD_CID_Provinces_Support.Weight = 20
	Event_JFD_CID_Provinces_Support.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			eventSupportYieldCost = GetRandom(100,500)
			eventSupportYieldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(eventSupportYieldCost*iMod))
			if GetRandom(1,2) == 1 then
				eventSupportYield = "[ICON_GOLD]"
				if player:GetGold() < eventSupportYieldCost then return false end
			else
				eventSupportYield = "[ICON_PEACE]"
				if player:GetFaith() < eventSupportYieldCost then return false end
			end
			local goldenAgeCost = mathCeil(eventSupportYieldCost*0.5)
			local goldenAgeReward = mathCeil(eventSupportYieldCost*0.7)
			if player:GetGoldenAgeProgressMeter() < goldenAgeCost then return false end
			local cities = {}
			local count = 1
			for city in player:Cities() do
				if (not city:IsCapital()) then
					 cities[count] = city
					 count = count + 1
				end
			end
			eventSupportCity = cities[GetRandom(1,#cities)]
			if (not eventSupportCity) then return false end
			local provinceID = JFD_GetProvinceID(playerID, eventSupportCity)
			local province = GameInfo.JFD_Provinces[provinceID]
			local provinceGender = "his"
			local provinceRuler = JFD_GetUniqueProvinceRulerTitle(playerID, eventSupportCity)
			if GetRandom(1,2) == 1 then
				provinceRuler = provinceRuler .. "_FEMININE"
				provinceGender = "her"
			end
			Event_JFD_CID_Provinces_Support.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_PROVINCES_REQUEST_DESC", provinceGender, provinceRuler, eventSupportCity:GetName())
			return true
		end
		)
	Event_JFD_CID_Provinces_Support.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CID_Provinces_Support.Outcomes[1] = {}
	Event_JFD_CID_Provinces_Support.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_CID_PROVINCES_REQUEST_OUTCOME_1"
	Event_JFD_CID_Provinces_Support.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_CID_PROVINCES_REQUEST_OUTCOME_RESULT_1"
	Event_JFD_CID_Provinces_Support.Outcomes[1].Weight = 5
	Event_JFD_CID_Provinces_Support.Outcomes[1].CanFunc = (
		function(player)			
			local goldenAgeCost = mathCeil(eventSupportYieldCost*0.5)
			Event_JFD_CID_Provinces_Support.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_PROVINCES_REQUEST_OUTCOME_RESULT_1", goldenAgeCost)
			return true
		end
		)
	Event_JFD_CID_Provinces_Support.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldenAgeCost = mathCeil(eventSupportYieldCost*0.5)
			player:ChangeGoldenAgeProgressMeter(-goldenAgeCost)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CID_PROVINCES_REQUEST_OUTCOME_RESULT_1_NOTIFICATION", eventSupportCity:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_PROVINCES_REQUEST"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CID_Provinces_Support.Outcomes[2] = {}
	Event_JFD_CID_Provinces_Support.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_CID_PROVINCES_REQUEST_OUTCOME_2"
	Event_JFD_CID_Provinces_Support.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_CID_PROVINCES_REQUEST_OUTCOME_RESULT_2"
	Event_JFD_CID_Provinces_Support.Outcomes[2].Weight = 5
	Event_JFD_CID_Provinces_Support.Outcomes[2].CanFunc = (
		function(player)			
			local goldenAgeReward = mathCeil(eventSupportYieldCost*0.7)
			Event_JFD_CID_Provinces_Support.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_PROVINCES_REQUEST_OUTCOME_RESULT_2", eventSupportYieldCost, eventSupportYield, goldenAgeReward)
			return true
		end
		)
	Event_JFD_CID_Provinces_Support.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			if eventSupportYield == "[ICON_GOLD]" then
				player:ChangeGold(-eventSupportYieldCost)
			else
				player:ChangeFaith(-eventSupportYieldCost)
			end
			local goldenAgeReward = mathCeil(eventSupportYieldCost*0.7)
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CID_PROVINCES_REQUEST_OUTCOME_RESULT_2_NOTIFICATION", eventSupportCity:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_PROVINCES_REQUEST"))
		end)

tEvents.Event_JFD_CID_Provinces_Support = Event_JFD_CID_Provinces_Support
--------------------------------------------------------------------------------------------------------------------------
-- Provinces: Unsatisfied Ruler
--------------------------------------------------------------------------------------------------------------------------
local eventUnsatisfiedRulerCity = nil
local provinceBaronyID = GameInfoTypes["PROVINCE_JFD_BARONY"]
local Event_JFD_CID_Provinces_UnsatisfiedRuler = {}
	Event_JFD_CID_Provinces_UnsatisfiedRuler.Name = "TXT_KEY_EVENT_JFD_CID_PROVINCES_UNSATISFIED_RULER"
	Event_JFD_CID_Provinces_UnsatisfiedRuler.Desc = "TXT_KEY_EVENT_JFD_CID_PROVINCES_UNSATISFIED_RULER_DESC"
	Event_JFD_CID_Provinces_UnsatisfiedRuler.EventImage = "Event_UnsatisfiedGovernor.dds"
	Event_JFD_CID_Provinces_UnsatisfiedRuler.Weight = 5
	Event_JFD_CID_Provinces_UnsatisfiedRuler.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local goldCost = mathCeil(700*iMod)	
			if player:GetGold() < goldCost then return false end
			local cities = {}
			local count = 1
			for city in player:Cities() do
				if ((not city:IsCapital()) and JFD_GetProvinceID(playerID, city) == provinceBaronyID) then
					 cities[count] = city
					 count = count + 1
				end
			end
			eventUnsatisfiedRulerCity = cities[GetRandom(1,#cities)]
			if (not eventUnsatisfiedRulerCity) then return false end
			local province = GameInfo.JFD_Provinces[provinceBaronyID]
			local provinceRuler = JFD_GetUniqueProvinceRulerTitle(playerID, eventUnsatisfiedRulerCity)
			if GetRandom(1,2) == 1 then
				provinceRuler = provinceRuler .. "_FEMININE"
			end
			Event_JFD_CID_Provinces_UnsatisfiedRuler.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_PROVINCES_UNSATISFIED_RULER_DESC", provinceRuler, eventUnsatisfiedRulerCity:GetName())
			return true
		end
		)
	Event_JFD_CID_Provinces_UnsatisfiedRuler.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CID_Provinces_UnsatisfiedRuler.Outcomes[1] = {}
	Event_JFD_CID_Provinces_UnsatisfiedRuler.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_CID_PROVINCES_UNSATISFIED_RULER_OUTCOME_1"
	Event_JFD_CID_Provinces_UnsatisfiedRuler.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_CID_PROVINCES_UNSATISFIED_RULER_OUTCOME_RESULT_1"
	Event_JFD_CID_Provinces_UnsatisfiedRuler.Outcomes[1].Weight = 5
	Event_JFD_CID_Provinces_UnsatisfiedRuler.Outcomes[1].CanFunc = (
		function(player)		
			local goldCost = mathCeil(700*iMod)	
			local provinceID = JFD_GetProvinceID(playerID, eventUnsatisfiedRulerCity)
			local province = GameInfo.JFD_Provinces[provinceID]
			local upgradeProvince = GameInfo.JFD_Provinces[province.UpgradeProvinceType]
			Event_JFD_CID_Provinces_UnsatisfiedRuler.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_PROVINCES_UNSATISFIED_RULER_OUTCOME_RESULT_1", goldCost, eventUnsatisfiedRulerCity:GetName(), upgradeProvince.IconString, upgradeProvince.Description)
			return true
		end
		)
	Event_JFD_CID_Provinces_UnsatisfiedRuler.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = mathCeil(700*iMod)	
			local provinceID = JFD_GetProvinceID(playerID, eventUnsatisfiedRulerCity)
			local province = GameInfo.JFD_Provinces[provinceID]
			local upgradeProvince = GameInfo.JFD_Provinces[province.UpgradeProvinceType]
			player:ChangeGold(-goldCost)
			eventUnsatisfiedRulerCity:SetNumRealBuilding(GameInfoTypes[upgradeProvince.BuildingType], 1)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CID_PROVINCES_UNSATISFIED_RULER_OUTCOME_RESULT_1_NOTIFICATION", eventUnsatisfiedRulerCity:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_PROVINCES_UNSATISFIED_RULER"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CID_Provinces_UnsatisfiedRuler.Outcomes[2] = {}
	Event_JFD_CID_Provinces_UnsatisfiedRuler.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_CID_PROVINCES_UNSATISFIED_RULER_OUTCOME_2"
	Event_JFD_CID_Provinces_UnsatisfiedRuler.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_CID_PROVINCES_UNSATISFIED_RULER_OUTCOME_RESULT_2"
	Event_JFD_CID_Provinces_UnsatisfiedRuler.Outcomes[2].Weight = 5
	Event_JFD_CID_Provinces_UnsatisfiedRuler.Outcomes[2].CanFunc = (
		function(player)			
			Event_JFD_CID_Provinces_UnsatisfiedRuler.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_PROVINCES_UNSATISFIED_RULER_OUTCOME_RESULT_2", eventUnsatisfiedRulerCity:GetName())
			return true
		end
		)
	Event_JFD_CID_Provinces_UnsatisfiedRuler.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			if GetRandom(1,100) <= 25 then
				eventUnsatisfiedRulerCity:ChangeResistanceTurns(1)
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CID_PROVINCES_UNSATISFIED_RULER_OUTCOME_RESULT_2_ALT_NOTIFICATION", eventUnsatisfiedRulerCity:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_PROVINCES_UNSATISFIED_RULER"))
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CID_PROVINCES_UNSATISFIED_RULER_OUTCOME_RESULT_2_NOTIFICATION", eventUnsatisfiedRulerCity:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CID_PROVINCES_UNSATISFIED_RULER"))
			end
		end)

tEvents.Event_JFD_CID_Provinces_UnsatisfiedRuler = Event_JFD_CID_Provinces_UnsatisfiedRuler
--=======================================================================================================================
--=======================================================================================================================


