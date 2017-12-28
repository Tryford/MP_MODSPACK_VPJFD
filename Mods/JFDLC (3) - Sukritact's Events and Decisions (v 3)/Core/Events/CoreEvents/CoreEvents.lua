-- Core Events
-- Author: Sukritact
--=======================================================================================================================

print("Core Events: loaded")

--=======================================================================================================================
-- General Events
--=======================================================================================================================
-- Comet Sighted
--------------------------------------------------------------------------------------------------------------------------
local Event_CometSighted = {}
	Event_CometSighted.Name = "TXT_KEY_EVENT_COMETSIGHTED"
	Event_CometSighted.Desc = "TXT_KEY_EVENT_COMETSIGHTED_DESC"
	Event_CometSighted.EventImage = "Event_Comet.dds"
	Event_CometSighted.Weight = 3
	Event_CometSighted.CanFunc = (
		function(pPlayer)			
			Event_CometSighted.Desc = "TXT_KEY_EVENT_COMETSIGHTED_DESC"
			if pPlayer:GetCurrentEra() > GameInfoTypes.ERA_RENAISSANCE then Event_CometSighted.Desc = "TXT_KEY_EVENT_COMETSIGHTED_DESC_2" end
			return true
		end
		)
	Event_CometSighted.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_CometSighted.Outcomes[1] = {}
	Event_CometSighted.Outcomes[1].Name = "TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_1"
	Event_CometSighted.Outcomes[1].Desc = "TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_NEGATIVE"
	Event_CometSighted.Outcomes[1].CanFunc = (
		function(pPlayer)			
			local iDelta = math.ceil(100 * iMod)
			Event_CometSighted.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_NEGATIVE", iDelta)
			if pPlayer:GetCurrentEra() > GameInfoTypes.ERA_RENAISSANCE then return false end
			return true
		end
		)
	Event_CometSighted.Outcomes[1].DoFunc = (
		function(pPlayer) 
			pPlayer:ChangeGoldenAgeProgressMeter(math.ceil(-100 * iMod))
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_COMETSIGHTED_NOTIFICATION_NEGATIVE"), Locale.ConvertTextKey(Event_CometSighted.Name))
		end
		)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_CometSighted.Outcomes[2] = {}
	Event_CometSighted.Outcomes[2].Name = "TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_2"
	Event_CometSighted.Outcomes[2].Desc = "TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_NEGATIVE"
	Event_CometSighted.Outcomes[2].CanFunc = (
		function(pPlayer)			
			local iDelta = math.ceil(100 * iMod)
			Event_CometSighted.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_NEGATIVE", iDelta)
			if pPlayer:GetCurrentEra() > GameInfoTypes.ERA_RENAISSANCE then return false end
			return true
		end
		)
	Event_CometSighted.Outcomes[2].DoFunc = (
		function(pPlayer) 
			pPlayer:ChangeGoldenAgeProgressMeter(math.ceil(-100 * iMod))
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_COMETSIGHTED_NOTIFICATION_NEGATIVE"), Locale.ConvertTextKey(Event_CometSighted.Name))
		end
		)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_CometSighted.Outcomes[3] = {}
	Event_CometSighted.Outcomes[3].Name = "TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_3"
	Event_CometSighted.Outcomes[3].Desc = "TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_NEGATIVE"
	Event_CometSighted.Outcomes[3].CanFunc = (
		function(pPlayer)			
			local iDelta = math.ceil(100 * iMod)
			Event_CometSighted.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_NEGATIVE", iDelta)
			if pPlayer:GetCurrentEra() > GameInfoTypes.ERA_RENAISSANCE then return false end
			return true
		end
		)
	Event_CometSighted.Outcomes[3].DoFunc = (
		function(pPlayer) 
			pPlayer:ChangeGoldenAgeProgressMeter(math.ceil(-100 * iMod))
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_COMETSIGHTED_NOTIFICATION_NEGATIVE"), Locale.ConvertTextKey(Event_CometSighted.Name))
		end
		)
	--=========================================================
	-- Outcome 4
	--=========================================================
	Event_CometSighted.Outcomes[4] = {}
	Event_CometSighted.Outcomes[4].Name = "TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_4"
	Event_CometSighted.Outcomes[4].Desc = "TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_POSITIVE"
	Event_CometSighted.Outcomes[4].CanFunc = (
		function(pPlayer)			
			local iDelta = math.ceil(100 * iMod)
			Event_CometSighted.Outcomes[4].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_POSITIVE", iDelta)
			if pPlayer:GetCurrentEra() > GameInfoTypes.ERA_RENAISSANCE then return true end
			return false
		end
		)
	Event_CometSighted.Outcomes[4].DoFunc = (
		function(pPlayer) 
			pPlayer:ChangeGoldenAgeProgressMeter(math.ceil(100 * iMod))
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_COMETSIGHTED_NOTIFICATION_POSITIVE"), Locale.ConvertTextKey(Event_CometSighted.Name))
		end
		)
	--=========================================================
	-- Outcome 5
	--=========================================================
	Event_CometSighted.Outcomes[5] = {}
	Event_CometSighted.Outcomes[5].Name = "TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_5"
	Event_CometSighted.Outcomes[5].Desc = "TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_POSITIVE"
	Event_CometSighted.Outcomes[5].CanFunc = (
		function(pPlayer)			
			local iDelta = math.ceil(100 * iMod)
			Event_CometSighted.Outcomes[5].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_POSITIVE", iDelta)
			if pPlayer:GetCurrentEra() > GameInfoTypes.ERA_RENAISSANCE then return true end
			return false
		end
		)
	Event_CometSighted.Outcomes[5].DoFunc = (
		function(pPlayer) 
			pPlayer:ChangeGoldenAgeProgressMeter(math.ceil(100 * iMod))
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_COMETSIGHTED_NOTIFICATION_POSITIVE"), Locale.ConvertTextKey(Event_CometSighted.Name))
		end
		)
	
tEvents.Event_CometSighted = Event_CometSighted
--------------------------------------------------------------------------------------------------------------------------
-- Artists Protest the Eiffel Tower
--------------------------------------------------------------------------------------------------------------------------
local Event_EiffelProtest = {}
	Event_EiffelProtest.Name = "TXT_KEY_EVENT_EIFFELPROTEST"
	Event_EiffelProtest.Desc = "TXT_KEY_EVENT_EIFFELPROTEST_DESC"
	Event_EiffelProtest.EventImage = "Event_Eiffel.dds"
	Event_EiffelProtest.Weight = 300
	Event_EiffelProtest.CanFunc = (
		function(pPlayer)	
			if load(pPlayer, "Event_EiffelProtest") == true then return false end
			
			Event_EiffelProtest.Data1 = nil
			for pCity in pPlayer:Cities() do
				if (pCity:IsHasBuilding(GameInfoTypes.BUILDING_EIFFEL_TOWER)) then
					Event_EiffelProtest.Data1 = pCity
					break
				end
			end
			
			if (Event_EiffelProtest.Data1 == nil) then return false end
			
			Event_EiffelProtest.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_EIFFELPROTEST_DESC", Event_EiffelProtest.Data1:GetName(), pPlayer:GetCivilizationAdjective())
			return true
		end
		)
	Event_EiffelProtest.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_EiffelProtest.Outcomes[1] = {}
	Event_EiffelProtest.Outcomes[1].Name = "TXT_KEY_EVENT_EIFFELPROTEST_OUTCOME_1"
	Event_EiffelProtest.Outcomes[1].Desc = "TXT_KEY_EVENT_OUTCOME_NOTHING"
	Event_EiffelProtest.Outcomes[1].CanFunc = (
		function(pPlayer)			
			return true
		end
		)
	Event_EiffelProtest.Outcomes[1].DoFunc = (
		function(pPlayer)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_EIFFELPROTEST_OUTCOME_1_NOTIFICATION"), Locale.ConvertTextKey(Event_EiffelProtest.Name))
			save(pPlayer, "Event_EiffelProtest", true)
		end
		)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_EiffelProtest.Outcomes[2] = {}
	Event_EiffelProtest.Outcomes[2].Name = "TXT_KEY_EVENT_EIFFELPROTEST_OUTCOME_2"
	Event_EiffelProtest.Outcomes[2].Desc = "TXT_KEY_EVENT_EIFFELPROTEST_OUTCOME_2_DESC"
	Event_EiffelProtest.Outcomes[2].CanFunc = (
		function(pPlayer, pCity)
			local iCost = math.ceil(250 * iMod)
			
			if (pPlayer:GetGold() < iCost) then	return false end
			if (pCity:IsHasBuilding(GameInfoTypes.BUILDING_BROADCAST_TOWER)) then return false end
			
			Event_EiffelProtest.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_EIFFELPROTEST_OUTCOME_2_DESC", iCost, pCity:GetName())
			return true
		end
		)
	Event_EiffelProtest.Outcomes[2].DoFunc = (
		function(pPlayer, pCity) 
			local iCost = math.ceil(250 * iMod)
			pPlayer:ChangeGold(-iCost)
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_BROADCAST_TOWER, 1)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_EIFFELPROTEST_OUTCOME_2_NOTIFICATION"), Locale.ConvertTextKey(Event_EiffelProtest.Name))
			save(pPlayer, "Event_EiffelProtest", true) 
		end
		)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_EiffelProtest.Outcomes[3] = {}
	Event_EiffelProtest.Outcomes[3].Name = "TXT_KEY_EVENT_EIFFELPROTEST_OUTCOME_3"
	Event_EiffelProtest.Outcomes[3].Desc = "TXT_KEY_EVENT_EIFFELPROTEST_OUTCOME_3_DESC"
	Event_EiffelProtest.Outcomes[3].CanFunc = (
		function(pPlayer, pCity)
			return true
		end
		)
	Event_EiffelProtest.Outcomes[3].DoFunc = (
		function(pPlayer, pCity) 
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_EIFFEL_TOWER, 0)
			InitUnitFromCity(pCity, GameInfoTypes.UNIT_ARTIST, 3)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_EIFFELPROTEST_OUTCOME_3_NOTIFICATION"), Locale.ConvertTextKey(Event_EiffelProtest.Name))
			save(pPlayer, "Event_EiffelProtest", true)
		end
		)
		
tEvents.Event_EiffelProtest = Event_EiffelProtest
--------------------------------------------------------------------------------------------------------------------------
-- Excellent Official
--------------------------------------------------------------------------------------------------------------------------
local Event_ExcellentOfficial = {}
	Event_ExcellentOfficial.Name = "TXT_KEY_EVENT_EXCELLENTOFFICIAL"
	Event_ExcellentOfficial.Desc = "TXT_KEY_EVENT_EXCELLENTOFFICIAL_DESC"
	Event_ExcellentOfficial.EventImage = "Event_Scroll.dds"
	Event_ExcellentOfficial.Weight = 5
	Event_ExcellentOfficial.CanFunc = (
		function(pPlayer)
			return true
		end
		)
	Event_ExcellentOfficial.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_ExcellentOfficial.Outcomes[1] = {}
	Event_ExcellentOfficial.Outcomes[1].Name = "TXT_KEY_EVENT_EXCELLENTOFFICIAL_OUTCOME_1"
	Event_ExcellentOfficial.Outcomes[1].Desc = "TXT_KEY_EVENT_EXCELLENTOFFICIAL_OUTCOME_1_DESC"
	Event_ExcellentOfficial.Outcomes[1].CanFunc = (
		function(pPlayer)
			return true
		end
		)
	Event_ExcellentOfficial.Outcomes[1].DoFunc = (
		function(pPlayer)
			pPlayer:ChangeNumResourceTotal(iMagistrate, 1)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_EXCELLENTOFFICIAL_OUTCOME_1_NOTIFICATION"), Locale.ConvertTextKey(Event_ExcellentOfficial.Name))
		end
		)
	
tEvents.Event_ExcellentOfficial = Event_ExcellentOfficial
--------------------------------------------------------------------------------------------------------------------------
--  Destitute Noble
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDDestituteNoble = {}
	Event_JFDDestituteNoble.Name = "TXT_KEY_EVENT_JFD_DESTITUTE_NOBLE"
	Event_JFDDestituteNoble.Desc = "TXT_KEY_EVENT_JFD_DESTITUTE_NOBLE_DESC"
	Event_JFDDestituteNoble.EventImage = "Event_Knight.dds"
	Event_JFDDestituteNoble.Weight = 5
	Event_JFDDestituteNoble.CanFunc = (
		function(pPlayer)			
			Event_JFDDestituteNoble.Desc = "TXT_KEY_EVENT_JFD_DESTITUTE_NOBLE_DESC"
			if pPlayer:GetCurrentEra() < GameInfoTypes["ERA_MEDIEVAL"] or pPlayer:GetCurrentEra() >= GameInfoTypes["ERA_INDUSTRIAL"] then return false end
			return true
		end
		)
	Event_JFDDestituteNoble.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDDestituteNoble.Outcomes[1] = {}
	Event_JFDDestituteNoble.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_DESTITUTE_NOBLE_OUTCOME_1"
	Event_JFDDestituteNoble.Outcomes[1].Desc = "TXT_KEY_EVENT_OUTCOME_NOTHING"
	Event_JFDDestituteNoble.Outcomes[1].CanFunc = (
		function(pPlayer)			
			Event_JFDDestituteNoble.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_OUTCOME_NOTHING")
			return true
		end
		)
	Event_JFDDestituteNoble.Outcomes[1].DoFunc = (
		function(pPlayer) 
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_DESTITUTE_NOBLE_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_DESTITUTE_NOBLE"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDDestituteNoble.Outcomes[2] = {}
	Event_JFDDestituteNoble.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_DESTITUTE_NOBLE_OUTCOME_2"
	Event_JFDDestituteNoble.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_DESTITUTE_NOBLE_OUTCOME_RESULT_2"
	Event_JFDDestituteNoble.Outcomes[2].CanFunc = (
		function(pPlayer)			
			local iGoldCost = math.ceil(98 * iMod)
			if pPlayer:GetGold() < iGoldCost then return false end
			
			Event_JFDDestituteNoble.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_DESTITUTE_NOBLE_OUTCOME_RESULT_2", iGoldCost)
			return true
		end
		)
	Event_JFDDestituteNoble.Outcomes[2].DoFunc = (
		function(pPlayer) 
			local iGoldCost = math.ceil(98 * iMod)
			pPlayer:ChangeGold(-iGoldCost)
			pPlayer:AddFreeUnit(GameInfoTypes[JFD_GetUniqueUnit(pPlayer, "UNITCLASS_GREAT_GENERAL")], GameInfoTypes["UNITAI_GENERAL"]) 
			
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_DESTITUTE_NOBLE_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_DESTITUTE_NOBLE"))
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFDDestituteNoble.Outcomes[3] = {}
	Event_JFDDestituteNoble.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_DESTITUTE_NOBLE_OUTCOME_3"
	Event_JFDDestituteNoble.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_DESTITUTE_NOBLE_OUTCOME_RESULT_3"
	Event_JFDDestituteNoble.Outcomes[3].CanFunc = (
		function(pPlayer)			
			local iGoldenAgeCost = math.ceil(33 * iMod)
			local iGoldReward = math.ceil(52 * iMod)
			if pPlayer:GetGoldenAgeProgressMeter() < iGoldenAgeCost then return false end
			
			Event_JFDDestituteNoble.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_DESTITUTE_NOBLE_OUTCOME_RESULT_3", iGoldenAgeCost, iGoldReward)
			return true
		end
		)
	Event_JFDDestituteNoble.Outcomes[3].DoFunc = (
		function(pPlayer)
			local iGoldenAgeCost = math.ceil(33 * iMod)
			local iGoldReward = math.ceil(52 * iMod)
			pPlayer:ChangeGoldenAgeProgressMeter(-iGoldenAgeCost)
			pPlayer:ChangeGold(iGoldReward) 
			
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_DESTITUTE_NOBLE_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_DESTITUTE_NOBLE"))
		end)

tEvents.Event_JFDDestituteNoble = Event_JFDDestituteNoble
--------------------------------------------------------------------------------------------------------------------------
-- The Guest Star
--------------------------------------------------------------------------------------------------------------------------
local Event_TheGuestStar = {}
	Event_TheGuestStar.Name = "TXT_KEY_EVENT_THEGUESTSTAR"
	Event_TheGuestStar.Desc = "TXT_KEY_EVENT_THEGUESTSTAR_DESC"
	Event_TheGuestStar.Weight = 0
	Event_TheGuestStar.CanFunc = (
		function(pPlayer)
			if math.abs(Game.GetGameTurnYear() - 1054) > 50 then return false end
			if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_EDUCATION)) then return false end
			return true
		end
		)
	Event_TheGuestStar.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_TheGuestStar.Outcomes[1] = {}
	Event_TheGuestStar.Outcomes[1].Name = "TXT_KEY_EVENT_THEGUESTSTAR_OUTCOME_1"
	Event_TheGuestStar.Outcomes[1].Desc = "TXT_KEY_EVENT_THEGUESTSTAR_OUTCOME_RESULT_1"
	Event_TheGuestStar.Outcomes[1].CanFunc = (
		function(pPlayer)
			return true
		end
		)
	Event_TheGuestStar.Outcomes[1].DoFunc = (
		function(pPlayer)
			pPlayer:AddFreeUnit(GameInfoTypes[JFD_GetUniqueUnit(pPlayer, "UNITCLASS_ARTIST")], GameInfoTypes["UNITAI_ARTIST"]) 
			pPlayer:AddFreeUnit(GameInfoTypes[JFD_GetUniqueUnit(pPlayer, "UNITCLASS_ARTIST")], GameInfoTypes["UNITAI_ARTIST"])
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_THEGUESTSTAR_NOTIFICATION"), Locale.ConvertTextKey(Event_TheGuestStar.Name))
		end
		)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_TheGuestStar.Outcomes[2] = {}
	Event_TheGuestStar.Outcomes[2].Name = "TXT_KEY_EVENT_THEGUESTSTAR_OUTCOME_2"
	Event_TheGuestStar.Outcomes[2].Desc = "TXT_KEY_EVENT_THEGUESTSTAR_OUTCOME_RESULT_2"
	Event_TheGuestStar.Outcomes[2].CanFunc = (
		function(pPlayer)
			return true
		end
		)
	Event_TheGuestStar.Outcomes[2].DoFunc = (
		function(pPlayer)
			pPlayer:AddFreeUnit(GameInfoTypes[JFD_GetUniqueUnit(pPlayer, "UNITCLASS_SCIENTIST")], GameInfoTypes["UNITAI_SCIENTIST"]) 
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_THEGUESTSTAR_NOTIFICATION"), Locale.ConvertTextKey(Event_TheGuestStar.Name))
		end
		)
	
tEvents.Event_TheGuestStar = Event_TheGuestStar
for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
	if GetRandom(1,3) == 3 then
		Events_ScheduleOnce(iPlayer, "Event_TheGuestStar", 1054, true)
	end
end
--------------------------------------------------------------------------------------------------------------------------
-- Solar Eclipse
--------------------------------------------------------------------------------------------------------------------------
local Event_SolarEclipse = {}
	Event_SolarEclipse.Name = "TXT_KEY_EVENT_SOLARECLIPSE"
	Event_SolarEclipse.Desc = "TXT_KEY_EVENT_SOLARECLIPSE_DESC"
	Event_SolarEclipse.EventImage = "Event_Eclipse.dds"
	Event_SolarEclipse.Weight = 5
	Event_SolarEclipse.CanFunc = (
		function(pPlayer)
			return (pPlayer:GetCurrentEra() < GameInfoTypes.ERA_INDUSTRIAL)
		end
		)
	Event_SolarEclipse.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_SolarEclipse.Outcomes[1] = {}
	Event_SolarEclipse.Outcomes[1].Name = "TXT_KEY_EVENT_SOLARECLIPSE_OUTCOME_1"
	Event_SolarEclipse.Outcomes[1].Desc = "TXT_KEY_EVENT_SOLARECLIPSE_OUTCOME_RESULT_1"
	Event_SolarEclipse.Outcomes[1].CanFunc = (
		function(pPlayer)
			local iReward = math.ceil(20 * iMod * (pPlayer:GetCurrentEra() + 1))
			Event_SolarEclipse.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_SOLARECLIPSE_OUTCOME_RESULT_1", iReward)
			return true
		end
		)
	Event_SolarEclipse.Outcomes[1].DoFunc = (
		function(pPlayer)
			local iReward = math.ceil(20 * iMod * (pPlayer:GetCurrentEra() + 1))
			pPlayer:ChangeFaith(iReward)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_SOLARECLIPSE_NOTIFICATION"), Locale.ConvertTextKey(Event_SolarEclipse.Name))
		end
		)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_SolarEclipse.Outcomes[2] = {}
	Event_SolarEclipse.Outcomes[2].Name = "TXT_KEY_EVENT_SOLARECLIPSE_OUTCOME_2"
	Event_SolarEclipse.Outcomes[2].Desc = "TXT_KEY_EVENT_SOLARECLIPSE_OUTCOME_RESULT_2"
	Event_SolarEclipse.Outcomes[2].Weight = 2
	Event_SolarEclipse.Outcomes[2].CanFunc = (
		function(pPlayer)
			local iReward = math.ceil(20 * iMod * (pPlayer:GetCurrentEra() + 1))
			Event_SolarEclipse.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_SOLARECLIPSE_OUTCOME_RESULT_2", iReward)
			return (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_OPTICS))
		end
		)
	Event_SolarEclipse.Outcomes[2].DoFunc = (
		function(pPlayer)
			local iReward = math.ceil(20 * iMod * (pPlayer:GetCurrentEra() + 1))
			LuaEvents.Sukritact_ChangeResearchProgress(pPlayer:GetID(), iReward)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_SOLARECLIPSE_NOTIFICATION"), Locale.ConvertTextKey(Event_SolarEclipse.Name))
		end
		)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_SolarEclipse.Outcomes[3] = {}
	Event_SolarEclipse.Outcomes[3].Name = "TXT_KEY_EVENT_SOLARECLIPSE_OUTCOME_3"
	Event_SolarEclipse.Outcomes[3].Desc = "TXT_KEY_EVENT_SOLARECLIPSE_OUTCOME_RESULT_3"
	Event_SolarEclipse.Outcomes[3].Weight = 3
	Event_SolarEclipse.Outcomes[3].CanFunc = (
		function(pPlayer)
			local iReward = math.ceil(20 * iMod * (pPlayer:GetCurrentEra() + 1))
			Event_SolarEclipse.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_SOLARECLIPSE_OUTCOME_RESULT_3", iReward)
			return (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_THEOLOGY))
		end
		)
	Event_SolarEclipse.Outcomes[3].DoFunc = (
		function(pPlayer)
			local iReward = math.ceil(20 * iMod * (pPlayer:GetCurrentEra() + 1))
			pPlayer:ChangeFaith(iReward)
			pPlayer:ChangeJONSCulture(iReward)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_SOLARECLIPSE_NOTIFICATION"), Locale.ConvertTextKey(Event_SolarEclipse.Name))
		end
		)
	--=========================================================
	-- Outcome 4
	--=========================================================
	Event_SolarEclipse.Outcomes[4] = {}
	Event_SolarEclipse.Outcomes[4].Name = "TXT_KEY_EVENT_SOLARECLIPSE_OUTCOME_4"
	Event_SolarEclipse.Outcomes[4].Desc = "TXT_KEY_EVENT_SOLARECLIPSE_OUTCOME_RESULT_4"
	Event_SolarEclipse.Outcomes[4].Weight = 4
	Event_SolarEclipse.Outcomes[4].CanFunc = (
		function(pPlayer)
			local iReward = math.ceil(20 * iMod * (pPlayer:GetCurrentEra() + 1))
			Event_SolarEclipse.Outcomes[4].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_SOLARECLIPSE_OUTCOME_RESULT_4", iReward)
			return (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_ASTRONOMY))
		end
		)
	Event_SolarEclipse.Outcomes[4].DoFunc = (
		function(pPlayer)
			local iReward = math.ceil(20 * iMod * (pPlayer:GetCurrentEra() + 1))
			LuaEvents.Sukritact_ChangeResearchProgress(pPlayer:GetID(), iReward)
			pPlayer:ChangeJONSCulture(iReward)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_SOLARECLIPSE_NOTIFICATION"), Locale.ConvertTextKey(Event_SolarEclipse.Name))
		end
		)
	--=========================================================
	-- Outcome 5
	--=========================================================
	Event_SolarEclipse.Outcomes[5] = {}
	Event_SolarEclipse.Outcomes[5].Name = "TXT_KEY_EVENT_SOLARECLIPSE_OUTCOME_5"
	Event_SolarEclipse.Outcomes[5].Desc = "TXT_KEY_EVENT_SOLARECLIPSE_OUTCOME_RESULT_5"
	Event_SolarEclipse.Outcomes[5].Weight = 4
	Event_SolarEclipse.Outcomes[5].CanFunc = (
		function(pPlayer)
			local iReward = math.ceil(50 * iMod * (pPlayer:GetCurrentEra() + 1))
			Event_SolarEclipse.Outcomes[5].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_SOLARECLIPSE_OUTCOME_RESULT_5", iReward)
			return (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_CIVIL_SERVICE)) and (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_IROQUOIS)
		end
		)
	Event_SolarEclipse.Outcomes[5].DoFunc = (
		function(pPlayer)
			local iReward = math.ceil(50 * iMod * (pPlayer:GetCurrentEra() + 1))
			pPlayer:ChangeFaith(iReward)
			pPlayer:ChangeJONSCulture(iReward)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_SOLARECLIPSE_NOTIFICATION"), Locale.ConvertTextKey(Event_SolarEclipse.Name))
		end
		)
		
tEvents.Event_SolarEclipse = Event_SolarEclipse
--------------------------------------------------------------------------------------------------------------------------
-- Successful Embassy
--------------------------------------------------------------------------------------------------------------------------
local Event_SuccessfulEmbassy = {}
	Event_SuccessfulEmbassy.Name = "TXT_KEY_EVENT_SUCESSFULEMBASSY"
	Event_SuccessfulEmbassy.Desc = "TXT_KEY_EVENT_SUCESSFULEMBASSY_DESC"
	Event_SuccessfulEmbassy.tInfluence = {10, 10, 20, 20, 30}
	Event_SuccessfulEmbassy.EventImage = "Event_Diplomat.dds"
	Event_SuccessfulEmbassy.Data1 = {}
	Event_SuccessfulEmbassy.Data2 = nil
	Event_SuccessfulEmbassy.Data3 = nil
	Event_SuccessfulEmbassy.Weight = 5
	Event_SuccessfulEmbassy.CanFunc = (
		function(pPlayer)
		
			Event_SuccessfulEmbassy.Data1 = {}
			for iCS, pCS in pairs(Players) do
				if (pCS:IsAlive() and pCS:IsMinorCiv() and Teams[pPlayer:GetTeam()]:IsHasMet(pCS:GetTeam()) and not(Teams[pPlayer:GetTeam()]:IsAtWar(pCS:GetTeam()))) then
					table.insert(Event_SuccessfulEmbassy.Data1, pCS)
				end
			end
			if #Event_SuccessfulEmbassy.Data1 < 1 then return false end
			
			Event_SuccessfulEmbassy.Data2 = Event_SuccessfulEmbassy.Data1[GetRandom(1, #Event_SuccessfulEmbassy.Data1)]
			Event_SuccessfulEmbassy.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_SUCESSFULEMBASSY_DESC", pPlayer:GetCivilizationShortDescription(), Event_SuccessfulEmbassy.Data2:GetCivilizationAdjectiveKey())
			return true
		end
		)
	Event_SuccessfulEmbassy.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_SuccessfulEmbassy.Outcomes[1] = {}
	Event_SuccessfulEmbassy.Outcomes[1].Name = "TXT_KEY_EVENT_SUCESSFULEMBASSY_OUTCOME_1"
	Event_SuccessfulEmbassy.Outcomes[1].Desc = "TXT_KEY_EVENT_SUCESSFULEMBASSY_OUTCOME_1_DESC"
	Event_SuccessfulEmbassy.Outcomes[1].CanFunc = (
		function(pPlayer)
			Event_SuccessfulEmbassy.Data3 = Event_SuccessfulEmbassy.tInfluence[GetRandom(1, #Event_SuccessfulEmbassy.tInfluence)]
			Event_SuccessfulEmbassy.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_SUCESSFULEMBASSY_OUTCOME_1_DESC", Event_SuccessfulEmbassy.Data3, Event_SuccessfulEmbassy.Data2:GetCivilizationShortDescription())
			return true
		end
		)
	Event_SuccessfulEmbassy.Outcomes[1].DoFunc = (
		function(pPlayer)
			Event_SuccessfulEmbassy.Data2:ChangeMinorCivFriendshipWithMajor(pPlayer:GetID(), Event_SuccessfulEmbassy.Data3)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_SUCESSFULEMBASSY_OUTCOME_1_NOTIFICATION", Event_SuccessfulEmbassy.Data2:GetCivilizationShortDescription()), Locale.ConvertTextKey(Event_SuccessfulEmbassy.Name))
		end
		)
	
tEvents.Event_SuccessfulEmbassy = Event_SuccessfulEmbassy
--------------------------------------------------------------------------------------------------------------------------
--  Great Artwork
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDGreatArtwork = {}
	Event_JFDGreatArtwork.Name = "TXT_KEY_EVENT_JFD_DEATH_OF_A_GREAT_ARTIST"
	Event_JFDGreatArtwork.Desc = "TXT_KEY_EVENT_JFD_DEATH_OF_A_GREAT_ARTIST_DESC"
	Event_JFDGreatArtwork.EventImage = "Event_Artist.dds"
	Event_JFDGreatArtwork.Weight = 5
	Event_JFDGreatArtwork.CanFunc = (
		function(pPlayer)			
			Event_JFDGreatArtwork.Desc = "TXT_KEY_EVENT_JFD_DEATH_OF_A_GREAT_ARTIST_DESC"
			if pPlayer:GetCurrentEra() == GameInfoTypes["ERA_ANCIENT"] then return false end
			return true
		end
		)
	Event_JFDGreatArtwork.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDGreatArtwork.Outcomes[1] = {}
	Event_JFDGreatArtwork.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_DEATH_OF_A_GREAT_ARTIST_OUTCOME_1"
	Event_JFDGreatArtwork.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_DEATH_OF_A_GREAT_ARTIST_OUTCOME_RESULT_1"
	Event_JFDGreatArtwork.Outcomes[1].CanFunc = (
		function(pPlayer)			
			local iGoldReward = math.ceil(120 * iMod)
			Event_JFDGreatArtwork.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_DEATH_OF_A_GREAT_ARTIST_OUTCOME_RESULT_1", iGoldReward)
			return true
		end
		)
	Event_JFDGreatArtwork.Outcomes[1].DoFunc = (
		function(pPlayer) 
			local iGoldReward = math.ceil(120 * iMod)
			pPlayer:ChangeGold(iGoldReward)
			
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_DEATH_OF_A_GREAT_ARTIST_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_DEATH_OF_A_GREAT_ARTIST"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDGreatArtwork.Outcomes[2] = {}
	Event_JFDGreatArtwork.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_DEATH_OF_A_GREAT_ARTIST_OUTCOME_2"
	Event_JFDGreatArtwork.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_DEATH_OF_A_GREAT_ARTIST_OUTCOME_RESULT_2"
	Event_JFDGreatArtwork.Outcomes[2].CanFunc = (
		function(pPlayer)
			local iCultureReward = math.ceil(44 * iMod)
			local iGoldCost = math.ceil(80 * iMod)
			Event_JFDGreatArtwork.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_DEATH_OF_A_GREAT_ARTIST_OUTCOME_RESULT_2", iGoldCost, iCultureReward)
			if pPlayer:GetGold() < iGoldCost then return false end
			return true
		end
		)
	Event_JFDGreatArtwork.Outcomes[2].DoFunc = (
		function(pPlayer) 
			local iCultureReward = math.ceil(44 * iMod)
			local iGoldCost = math.ceil(80 * iMod)
			pPlayer:ChangeJONSCulture(iCultureReward)
			pPlayer:ChangeGold(-iGoldCost)
			
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_DEATH_OF_A_GREAT_ARTIST_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_DEATH_OF_A_GREAT_ARTIST"))
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFDGreatArtwork.Outcomes[3] = {}
	Event_JFDGreatArtwork.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_DEATH_OF_A_GREAT_ARTIST_OUTCOME_3"
	Event_JFDGreatArtwork.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_DEATH_OF_A_GREAT_ARTIST_OUTCOME_RESULT_3"
	Event_JFDGreatArtwork.Outcomes[3].CanFunc = (
		function(pPlayer)			
			local iGoldCost = math.ceil(140 * iMod)
			Event_JFDGreatArtwork.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_DEATH_OF_A_GREAT_ARTIST_OUTCOME_RESULT_3", iGoldCost)
			if not pPlayer:HasAvailableGreatWorkSlot(GameInfoTypes["GREAT_WORK_SLOT_ART_ARTIFACT"]) then return false end
			if pPlayer:GetGold() < iGoldCost then return false end
			return true
		end
		)
	Event_JFDGreatArtwork.Outcomes[3].DoFunc = (
		function(pPlayer) 
			local iGoldCost = math.ceil(140 * iMod)
			pPlayer:ChangeGold(-iGoldCost) 
			pPlayer:InitUnit(GameInfoTypes["UNIT_ARTIST"], pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY()):PushMission(GameInfoTypes["MISSION_CREATE_GREAT_WORK"])
			
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_DEATH_OF_A_GREAT_ARTIST_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_DEATH_OF_A_GREAT_ARTIST"))
		end
		)
tEvents.Event_JFDGreatArtwork = Event_JFDGreatArtwork
-------------------------------------------------------------------------------------------------------------------------
--  Incompetent Diplomat
-------------------------------------------------------------------------------------------------------------------------
local Event_IncompetentDiplomat = {}
	Event_IncompetentDiplomat.Name = "TXT_KEY_EVENT_INCOMPETENTDIPLOMAT"
	Event_IncompetentDiplomat.Desc = "TXT_KEY_EVENT_INCOMPETENTDIPLOMAT_DESC"
	Event_IncompetentDiplomat.tInfluence = {10, 10, 10, 10, 20, 20, 30}
	Event_IncompetentDiplomat.EventImage = "Event_Diplomat.dds"
	Event_IncompetentDiplomat.Data1 = {}
	Event_IncompetentDiplomat.Data2 = nil
	Event_IncompetentDiplomat.Data3 = nil
	Event_IncompetentDiplomat.Weight = 3
	Event_IncompetentDiplomat.CanFunc = (
		function(pPlayer)
			Event_IncompetentDiplomat.Data1 = {}
			for iCS, pCS in pairs(Players) do
				if (pCS:IsAlive() and pCS:IsMinorCiv() and Teams[pPlayer:GetTeam()]:IsHasMet(pCS:GetTeam()) and not(Teams[pPlayer:GetTeam()]:IsAtWar(pCS:GetTeam()))) then
					table.insert(Event_IncompetentDiplomat.Data1, pCS)
				end
			end
			if #Event_IncompetentDiplomat.Data1 < 1 then return false end
			if not(GetStrongestMilitaryUnit(pPlayer, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")) then return end
			
			Event_IncompetentDiplomat.Data2 = Event_IncompetentDiplomat.Data1[GetRandom(1, #Event_IncompetentDiplomat.Data1)]
			Event_IncompetentDiplomat.Data3 = Event_IncompetentDiplomat.tInfluence[GetRandom(1, #Event_IncompetentDiplomat.tInfluence)]
			Event_IncompetentDiplomat.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_INCOMPETENTDIPLOMAT_DESC", Event_IncompetentDiplomat.Data2:GetCivilizationAdjectiveKey(), Event_IncompetentDiplomat.Data2:GetCivilizationShortDescription())
			return true
		end
		)
	Event_IncompetentDiplomat.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_IncompetentDiplomat.Outcomes[1] = {}
	Event_IncompetentDiplomat.Outcomes[1].Name = "TXT_KEY_EVENT_INCOMPETENTDIPLOMAT_OUTCOME_1"
	Event_IncompetentDiplomat.Outcomes[1].Desc = "TXT_KEY_EVENT_INCOMPETENTDIPLOMAT_OUTCOME_1_DESC"
	Event_IncompetentDiplomat.Outcomes[1].CanFunc = (
		function(pPlayer)
			Event_IncompetentDiplomat.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_INCOMPETENTDIPLOMAT_OUTCOME_1_DESC", Event_IncompetentDiplomat.Data3, Event_IncompetentDiplomat.Data2:GetCivilizationShortDescription())
			return true
		end
		)
	Event_IncompetentDiplomat.Outcomes[1].DoFunc = (
		function(pPlayer)
			Event_IncompetentDiplomat.Data2:ChangeMinorCivFriendshipWithMajor(pPlayer:GetID(), -Event_IncompetentDiplomat.Data3)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_INCOMPETENTDIPLOMAT_OUTCOME_1_NOTIFICATION", pPlayer:GetCivilizationAdjectiveKey(), Event_IncompetentDiplomat.Data2:GetCivilizationShortDescription()), Locale.ConvertTextKey(Event_IncompetentDiplomat.Name))
		end
		)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_IncompetentDiplomat.Outcomes[2] = {}
	Event_IncompetentDiplomat.Outcomes[2].Name = "TXT_KEY_EVENT_INCOMPETENTDIPLOMAT_OUTCOME_2"
	Event_IncompetentDiplomat.Outcomes[2].Desc = "TXT_KEY_EVENT_INCOMPETENTDIPLOMAT_OUTCOME_2_DESC"
	Event_IncompetentDiplomat.Outcomes[2].Weight = 2
	Event_IncompetentDiplomat.Outcomes[2].CanFunc = (
		function(pPlayer)
			local iReward = Event_IncompetentDiplomat.Data3
			local iCost = math.ceil(iReward * iMod)
			Event_IncompetentDiplomat.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_INCOMPETENTDIPLOMAT_OUTCOME_2_DESC", iCost, iReward, Event_IncompetentDiplomat.Data2:GetCivilizationShortDescription())
			return not(pPlayer:GetJONSCulture() < iCost)
		end
		)
	Event_IncompetentDiplomat.Outcomes[2].DoFunc = (
		function(pPlayer)
			local iReward = Event_IncompetentDiplomat.Data3
			local iCost = math.ceil(iReward * iMod)
			pPlayer:ChangeJONSCulture(-iCost)
			Event_IncompetentDiplomat.Data2:ChangeMinorCivFriendshipWithMajor(pPlayer:GetID(), Event_IncompetentDiplomat.Data3)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_INCOMPETENTDIPLOMAT_OUTCOME_2_NOTIFICATION", pPlayer:GetCivilizationAdjectiveKey(), Event_IncompetentDiplomat.Data2:GetCivilizationShortDescription()), Locale.ConvertTextKey(Event_IncompetentDiplomat.Name))	
		end
		)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_IncompetentDiplomat.Outcomes[3] = {}
	Event_IncompetentDiplomat.Outcomes[3].Name = "TXT_KEY_EVENT_INCOMPETENTDIPLOMAT_OUTCOME_3"
	Event_IncompetentDiplomat.Outcomes[3].Desc = "TXT_KEY_EVENT_INCOMPETENTDIPLOMAT_OUTCOME_3_DESC"
	Event_IncompetentDiplomat.Outcomes[3].CanFunc = (
		function(pPlayer)
			local iCost = Event_IncompetentDiplomat.Data3 * 2
			Event_IncompetentDiplomat.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_INCOMPETENTDIPLOMAT_OUTCOME_3_DESC", iCost, Event_IncompetentDiplomat.Data2:GetCivilizationShortDescription())
			return true
		end
		)
	Event_IncompetentDiplomat.Outcomes[3].DoFunc = (
		function(pPlayer)
			local iCost = Event_IncompetentDiplomat.Data3 * 2
			Event_IncompetentDiplomat.Data2:ChangeMinorCivFriendshipWithMajor(pPlayer:GetID(), -iCost)
			iUnit = GetStrongestMilitaryUnit(pPlayer, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")
			pPlayer:InitUnit(iUnit, pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY()) 
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_INCOMPETENTDIPLOMAT_OUTCOME_3_NOTIFICATION", pPlayer:GetCivilizationAdjectiveKey(), Event_IncompetentDiplomat.Data2:GetCivilizationShortDescription()), Locale.ConvertTextKey(Event_IncompetentDiplomat.Name))	
		end
		)
tEvents.Event_IncompetentDiplomat = Event_IncompetentDiplomat
-------------------------------------------------------------------------------------------------------------------------
--  Bountiful Harvest
-------------------------------------------------------------------------------------------------------------------------
local Event_BountifulHarvest = {}
	Event_BountifulHarvest.Name = "TXT_KEY_EVENT_BOUNTIFULHARVEST"
	Event_BountifulHarvest.Desc = "TXT_KEY_EVENT_BOUNTIFULHARVEST_DESC"
	Event_BountifulHarvest.EventImage = "Event_Harvest.dds"
	Event_BountifulHarvest.Data1 = nil
	Event_BountifulHarvest.Weight = 5
	Event_BountifulHarvest.CanFunc = (
		function(pPlayer)
			if pPlayer:GetNumCities() < 1 then return end
			
			local tCities = {}
			for pCity in pPlayer:Cities() do
				table.insert(tCities, pCity)
			end
			
			Event_BountifulHarvest.Data1 = tCities[GetRandom(1, #tCities)]
			Event_BountifulHarvest.Data2 = math.ceil(Event_BountifulHarvest.Data1:GrowthThreshold() * (GetRandom(10, 33) / 100))
			Event_BountifulHarvest.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_BOUNTIFULHARVEST_DESC", Event_BountifulHarvest.Data1:GetName())
			
			return true
		end
		)
	Event_BountifulHarvest.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_BountifulHarvest.Outcomes[1] = {}
	Event_BountifulHarvest.Outcomes[1].Name = "TXT_KEY_EVENT_BOUNTIFULHARVEST_OUTCOME_1"
	Event_BountifulHarvest.Outcomes[1].Desc = "TXT_KEY_EVENT_BOUNTIFULHARVEST_OUTCOME_1_DESC"
	Event_BountifulHarvest.Outcomes[1].CanFunc = (
		function(pPlayer)
			Event_BountifulHarvest.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_BOUNTIFULHARVEST_OUTCOME_1_DESC", Event_BountifulHarvest.Data2, Event_BountifulHarvest.Data1:GetName())
			return true
		end
		)
	Event_BountifulHarvest.Outcomes[1].DoFunc = (
		function(pPlayer)
			Event_BountifulHarvest.Data1:ChangeFood(Event_BountifulHarvest.Data2)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_BOUNTIFULHARVEST_OUTCOME_1_NOTIFICATION", Event_BountifulHarvest.Data1:GetName()), Locale.ConvertTextKey(Event_BountifulHarvest.Name))	
		end
		)
	
tEvents.Event_BountifulHarvest = Event_BountifulHarvest
--------------------------------------------------------------------------------------------------------------------------
--  Mercenary Services
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDMercenaryServices = {}
	Event_JFDMercenaryServices.Name = "TXT_KEY_EVENT_JFD_MERCENARY_SERVICES"
	Event_JFDMercenaryServices.Desc = "TXT_KEY_EVENT_JFD_MERCENARY_SERVICES_DESC"
	Event_JFDMercenaryServices.Weight = 5
	Event_JFDMercenaryServices.CanFunc = (
		function(pPlayer)			
			Event_JFDMercenaryServices.Desc = "TXT_KEY_EVENT_JFD_MERCENARY_SERVICES_DESC"
			if pPlayer:GetCurrentEra() == GameInfoTypes["ERA_ANCIENT"] then return false end
			if not(GetStrongestMilitaryUnit(pPlayer, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")) then return end
			return true
		end
		)
	Event_JFDMercenaryServices.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDMercenaryServices.Outcomes[1] = {}
	Event_JFDMercenaryServices.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_MERCENARY_SERVICES_OUTCOME_1"
	Event_JFDMercenaryServices.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_MERCENARY_SERVICES_OUTCOME_RESULT_1"
	Event_JFDMercenaryServices.Outcomes[1].CanFunc = (
		function(pPlayer)			
			local iCultureReward = math.ceil(100 * iMod)
			Event_JFDMercenaryServices.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MERCENARY_SERVICES_OUTCOME_RESULT_1", iCultureReward)
			return true
		end
		)
	Event_JFDMercenaryServices.Outcomes[1].DoFunc = (
		function(pPlayer) 
			local iCultureReward = math.ceil(100 * iMod)
			pPlayer:ChangeJONSCulture(iCultureReward)
			if GetRandom(1, 100) >= 50 then
				local unitID = GetStrongestMilitaryUnit(pPlayer, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")
				local unitOne = Players[63]:InitUnit(unitID, pPlayer:GetCapitalCity():GetX() + 1, pPlayer:GetCapitalCity():GetY() + 1):JumpToNearestValidPlot() 
				local unitTwo = Players[63]:InitUnit(unitID, pPlayer:GetCapitalCity():GetX() + 1, pPlayer:GetCapitalCity():GetY() + 1):JumpToNearestValidPlot() 
				unitOne:SetHasPromotion(GameInfoTypes["PROMOTION_DRILL_1"], true)
				unitOne:SetHasPromotion(GameInfoTypes["PROMOTION_DRILL_2"], true)
				unitTwo:SetHasPromotion(GameInfoTypes["PROMOTION_SHOCK_1"], true)
				unitTwo:SetHasPromotion(GameInfoTypes["PROMOTION_SHOCK_2"], true)
				JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_MERCENARY_SERVICES_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MERCENARY_SERVICES"))
			else
				JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_MERCENARY_SERVICES_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MERCENARY_SERVICES"))
			end
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDMercenaryServices.Outcomes[2] = {}
	Event_JFDMercenaryServices.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_MERCENARY_SERVICES_OUTCOME_2"
	Event_JFDMercenaryServices.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_MERCENARY_SERVICES_OUTCOME_RESULT_2"
	Event_JFDMercenaryServices.Outcomes[2].CanFunc = (
		function(pPlayer)
			local iGoldCost = math.ceil(300 * iMod)
			Event_JFDMercenaryServices.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MERCENARY_SERVICES_OUTCOME_RESULT_2")
			if pPlayer:GetGold() >= iGoldCost then return false end
			return true
		end
		)
	Event_JFDMercenaryServices.Outcomes[2].DoFunc = (
		function(pPlayer) 
			
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_MERCENARY_SERVICES_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MERCENARY_SERVICES"))
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFDMercenaryServices.Outcomes[3] = {}
	Event_JFDMercenaryServices.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_MERCENARY_SERVICES_OUTCOME_3"
	Event_JFDMercenaryServices.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_MERCENARY_SERVICES_OUTCOME_RESULT_3"
	Event_JFDMercenaryServices.Outcomes[3].CanFunc = (
		function(pPlayer)			
			local iGoldCost = math.ceil(300 * iMod)
			Event_JFDMercenaryServices.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MERCENARY_SERVICES_OUTCOME_RESULT_3", iGoldCost)
			if pPlayer:GetGold() < iGoldCost then return false end
			return true
		end
		)
	Event_JFDMercenaryServices.Outcomes[3].DoFunc = (
		function(pPlayer) 
			local iGoldCost = math.ceil(300 * iMod)
			local unitID = GetStrongestMilitaryUnit(pPlayer, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")
			local unitOne = pPlayer:InitUnit(unitID, pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY()) 
			local unitTwo = pPlayer:InitUnit(unitID, pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY()) 
			pPlayer:ChangeGold(-iGoldCost) 
			unitOne:ChangeLevel(2)
			unitTwo:ChangeLevel(2)
			unitOne:SetHasPromotion(GameInfoTypes["PROMOTION_DRILL_1"], true)
			unitOne:SetHasPromotion(GameInfoTypes["PROMOTION_DRILL_2"], true)
			unitTwo:SetHasPromotion(GameInfoTypes["PROMOTION_SHOCK_1"], true)
			unitTwo:SetHasPromotion(GameInfoTypes["PROMOTION_SHOCK_2"], true)
			
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_MERCENARY_SERVICES_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MERCENARY_SERVICES"))
		end
		)
		
--tEvents.Event_JFDMercenaryServices = Event_JFDMercenaryServices
--------------------------------------------------------------------------------------------------------------------------
--  Monstrous Beast
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDMonstrousBeast = {}
	Event_JFDMonstrousBeast.Name = "TXT_KEY_EVENT_JFD_MONSTROUS_BEAST"
	Event_JFDMonstrousBeast.Desc = "TXT_KEY_EVENT_JFD_MONSTROUS_BEAST_DESC"
	Event_JFDMonstrousBeast.EventImage = "Event_Beast.dds"
	Event_JFDMonstrousBeast.Weight = 5
	Event_JFDMonstrousBeast.CanFunc = (
		function(pPlayer)			
			Event_JFDMonstrousBeast.Desc = "TXT_KEY_EVENT_JFD_MONSTROUS_BEAST_DESC"
			
			return true
		end
		)
	Event_JFDMonstrousBeast.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDMonstrousBeast.Outcomes[1] = {}
	Event_JFDMonstrousBeast.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_MONSTROUS_BEAST_OUTCOME_1"
	Event_JFDMonstrousBeast.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_MONSTROUS_BEAST_OUTCOME_RESULT_1"
	Event_JFDMonstrousBeast.Outcomes[1].CanFunc = (
		function(pPlayer)			
			local iProductionReward = math.ceil((pPlayer:GetCapitalCity():GetYieldRate(GameInfoTypes["YIELD_PRODUCTION"]) * 1.5) * iMod)
			Event_JFDMonstrousBeast.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MONSTROUS_BEAST_OUTCOME_RESULT_1", iProductionReward)
			
			return true
		end
		)
	Event_JFDMonstrousBeast.Outcomes[1].DoFunc = (
		function(pPlayer) 
			local iProductionReward = math.ceil((pPlayer:GetCapitalCity():GetYieldRate(GameInfoTypes["YIELD_PRODUCTION"]) * 1.5) * iMod)
			pPlayer:GetCapitalCity():ChangeProduction(iProductionReward)
			
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_MONSTROUS_BEAST_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MONSTROUS_BEAST"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDMonstrousBeast.Outcomes[2] = {}
	Event_JFDMonstrousBeast.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_MONSTROUS_BEAST_OUTCOME_2"
	Event_JFDMonstrousBeast.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_MONSTROUS_BEAST_OUTCOME_RESULT_2"
	Event_JFDMonstrousBeast.Outcomes[2].CanFunc = (
		function(pPlayer)
			local iGoldCost = math.ceil(73 * iMod)
			Event_JFDMonstrousBeast.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MONSTROUS_BEAST_OUTCOME_RESULT_2", iGoldCost)
			if pPlayer:GetGold() < iGoldCost then return false end
			if not pPlayer:GetCapitalCity():GetGarrisonedUnit() then return false end
			
			return true
		end
		)
	Event_JFDMonstrousBeast.Outcomes[2].DoFunc = (
		function(pPlayer) 
			local iGoldCost = math.ceil(73 * iMod)
			pPlayer:ChangeGold(-iGoldCost)
			pPlayer:GetCapitalCity():GetGarrisonedUnit():ChangeExperience(10)
			
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_MONSTROUS_BEAST_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MONSTROUS_BEAST"))
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFDMonstrousBeast.Outcomes[3] = {}
	Event_JFDMonstrousBeast.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_MONSTROUS_BEAST_OUTCOME_3"
	Event_JFDMonstrousBeast.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_MONSTROUS_BEAST_OUTCOME_RESULT_3"
	Event_JFDMonstrousBeast.Outcomes[3].CanFunc = (
		function(pPlayer)			
			local iGoldenAgeReward = math.ceil(45 * iMod)
			Event_JFDMonstrousBeast.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MONSTROUS_BEAST_OUTCOME_RESULT_3", iGoldenAgeReward)
			
			return true
		end
		)
	Event_JFDMonstrousBeast.Outcomes[3].DoFunc = (
		function(pPlayer) 
			local iGoldenAgeReward = math.ceil(45 * iMod)
			pPlayer:ChangeGoldenAgeProgressMeter(iGoldenAgeReward) 
			
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_MONSTROUS_BEAST_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MONSTROUS_BEAST"))
		end
		)
	--=========================================================
	-- Outcome 4
	--=========================================================
	Event_JFDMonstrousBeast.Outcomes[4] = {}
	Event_JFDMonstrousBeast.Outcomes[4].Name = "TXT_KEY_EVENT_JFD_MONSTROUS_BEAST_OUTCOME_4"
	Event_JFDMonstrousBeast.Outcomes[4].Desc = "TXT_KEY_EVENT_JFD_MONSTROUS_BEAST_OUTCOME_RESULT_4"
	Event_JFDMonstrousBeast.Outcomes[4].CanFunc = (
		function(pPlayer)			
			local iCultureReward = math.ceil(67 * iMod)
			Event_JFDMonstrousBeast.Outcomes[4].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MONSTROUS_BEAST_OUTCOME_RESULT_4", iCultureReward)
			if not pPlayer:GetCapitalCity():IsHasBuilding(GameInfoTypes["BUILDING_THEATRE"]) then return false end
			
			return true
		end
		)
	Event_JFDMonstrousBeast.Outcomes[4].DoFunc = (
		function(pPlayer) 
			local iCultureReward = math.ceil(67 * iMod)
			if GetRandom(1, 100) >= 60 then
				pPlayer:ChangeJONSCulture(iCultureReward) 
				JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_MONSTROUS_BEAST_OUTCOME_RESULT_4_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MONSTROUS_BEAST"))
			else
				JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_MONSTROUS_BEAST_OUTCOME_RESULT_4_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MONSTROUS_BEAST"))
			end
		end
		)
tEvents.Event_JFDMonstrousBeast = Event_JFDMonstrousBeast
-------------------------------------------------------------------------------------------------------------------------
--  Struck Oil
-------------------------------------------------------------------------------------------------------------------------
local Event_StruckOil = {}
	Event_StruckOil.Name = "TXT_KEY_EVENT_STRUCKOIL"
	Event_StruckOil.Desc = "TXT_KEY_EVENT_STRUCKOIL_DESC"
	Event_StruckOil.Weight = 5
	Event_StruckOil.Data1 = nil
	Event_StruckOil.CanFunc = (
		function(pPlayer)
			if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_BIOLOGY)) then return false end
			
			local tPlots ={}
			local iPlayer = pPlayer:GetID()
			local iResource = GameInfoTypes.RESOURCE_OIL
			local iLandmark = GameInfoTypes.IMPROVEMENT_LANDMARK --This and anything higher are unique or great people improvements
			
			for pCity in pPlayer:Cities() do
				local pCentralPlot = pCity:Plot()
				for pPlot in PlotAreaSpiralIterator(pCentralPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					if ((pPlot:CanHaveResource(iResource, true)) and (pPlot:GetOwner() == iPlayer) and (pPlot:GetImprovementType() < iLandmark) and (pPlot:GetResourceType() == -1)) then
						local tPlot = {}
						tPlot.City = pCity
						tPlot.Plot = pPlot
						table.insert(tPlots, tPlot)
					end
				end
			end
			
			if #tPlots < 1 then return false end
			
			local tPlot = tPlots[GetRandom(1, #tPlots)]
			
			Event_StruckOil.Data1 = tPlot.City
			Event_StruckOil.Data2 = tPlot.Plot
			
			Event_StruckOil.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_STRUCKOIL_DESC", Event_StruckOil.Data1:GetName())
			
			return true
		end
		)
	Event_StruckOil.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_StruckOil.Outcomes[1] = {}
	Event_StruckOil.Outcomes[1].Name = "TXT_KEY_EVENT_STRUCKOIL_OUTCOME_1"
	Event_StruckOil.Outcomes[1].Desc = "TXT_KEY_EVENT_STRUCKOIL_OUTCOME_1_DESC"
	Event_StruckOil.Outcomes[1].CanFunc = (
		function(pPlayer)
			return true
		end
		)
	Event_StruckOil.Outcomes[1].DoFunc = (
		function(pPlayer)
			local pPlot = Event_StruckOil.Data2
			local iImprovement = pPlot:GetImprovementType()
			local iResource = GameInfoTypes.RESOURCE_OIL
			
			pPlot:SetImprovementType(-1)
			pPlot:SetResourceType(iResource, GetRandom(3, 6))
			pPlot:SetImprovementType(iImprovement)
			
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_STRUCKOIL_OUTCOME_1_NOTIFICATION", Event_StruckOil.Data1:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_STRUCKOIL"), false, pPlot:GetX(), pPlot:GetY())			
		end
		)
	
tEvents.Event_StruckOil = Event_StruckOil
-------------------------------------------------------------------------------------------------------------------------
--  Sandstorm
-------------------------------------------------------------------------------------------------------------------------
local Event_Sandstorm = {}
	Event_Sandstorm.Name = "TXT_KEY_EVENT_SANDSTORM"
	Event_Sandstorm.Desc = "TXT_KEY_EVENT_SANDSTORM_DESC"
	Event_Sandstorm.Weight = 3
	Event_Sandstorm.CanFunc = (
		function(pPlayer)
			if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_ARCHAEOLOGY)) then return false end
			
			local tPlots ={}
			local iPlayer = pPlayer:GetID()
			local iResource = GameInfoTypes.RESOURCE_ARTIFACTS
			local iDesert = GameInfoTypes.TERRAIN_DESERT
			local iLandmark = GameInfoTypes.IMPROVEMENT_LANDMARK --This and anything higher are unique or great people improvements
			
			for pCity in pPlayer:Cities() do
				local pCentralPlot = pCity:Plot()
				for pPlot in PlotAreaSpiralIterator(pCentralPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					local tPlot = {}
					if ((not pPlot:IsMountain()) and (pPlot:GetFeatureType() == -1) and (pPlot:GetTerrainType() == iDesert) and (pPlot:GetOwner() == iPlayer) and (pPlot:GetImprovementType() < iLandmark) and (pPlot:GetResourceType() == -1)) then
						local tPlot = {}
						tPlot.City = pCity
						tPlot.Plot = pPlot
						table.insert(tPlots, tPlot)
					end
				end
			end
			
			if #tPlots < 1 then return false end
			
			local tPlot = tPlots[GetRandom(1, #tPlots)]
			
			Event_Sandstorm.Data1 = tPlot.City
			Event_Sandstorm.Data2 = tPlot.Plot
			
			Event_Sandstorm.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_SANDSTORM_DESC", Event_Sandstorm.Data1:GetName())
			
			return true
		end
		)
	Event_Sandstorm.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_Sandstorm.Outcomes[1] = {}
	Event_Sandstorm.Outcomes[1].Name = "TXT_KEY_EVENT_SANDSTORM_OUTCOME_1"
	Event_Sandstorm.Outcomes[1].Desc = "TXT_KEY_EVENT_SANDSTORM_OUTCOME_1_DESC"
	Event_Sandstorm.Outcomes[1].CanFunc = (
		function(pPlayer)
			return true
		end
		)
	Event_Sandstorm.Outcomes[1].DoFunc = (
		function(pPlayer)
			local pPlot = Event_Sandstorm.Data2
			local iImprovement = pPlot:GetImprovementType()
			local iResource = GameInfoTypes.RESOURCE_ARTIFACTS
			
			pPlot:SetImprovementType(-1)
			pPlot:SetResourceType(iResource, 1)
			pPlot:SetImprovementType(iImprovement)
			pPlot:SetImprovementPillaged(true)
			
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_SANDSTORM_OUTCOME_1_NOTIFICATION", Event_Sandstorm.Data1:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_SANDSTORM"), false, pPlot:GetX(), pPlot:GetY())				
		end
		)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_Sandstorm.Outcomes[2] = {}
	Event_Sandstorm.Outcomes[2].Name = "TXT_KEY_EVENT_SANDSTORM_OUTCOME_2"
	Event_Sandstorm.Outcomes[2].Desc = "TXT_KEY_EVENT_SANDSTORM_OUTCOME_2_DESC"
	Event_Sandstorm.Outcomes[2].CanFunc = (
		function(pPlayer)
			local iCost = math.ceil(200 * iMod)
			Event_Sandstorm.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_SANDSTORM_OUTCOME_2_DESC", iCost)
			return not(pPlayer:GetGold() < iCost)
		end
		)
	Event_Sandstorm.Outcomes[2].DoFunc = (
		function(pPlayer)
			local iCost = math.ceil(200 * iMod)
			pPlayer:ChangeGold(-iCost)
			InitUnitFromCity(Event_Sandstorm.Data1, GameInfoTypes.UNIT_ARCHAEOLOGIST, 1)
			
			local pPlot = Event_Sandstorm.Data2
			local iImprovement = pPlot:GetImprovementType()
			local iResource = GameInfoTypes.RESOURCE_ARTIFACTS
			
			pPlot:SetImprovementType(-1)
			pPlot:SetResourceType(iResource, 1)
			pPlot:SetImprovementType(iImprovement)
			pPlot:SetImprovementPillaged(true)
			
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_SANDSTORM_OUTCOME_2_NOTIFICATION", Event_Sandstorm.Data1:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_SANDSTORM"), false, pPlot:GetX(), pPlot:GetY())				
		end
		)
	
--tEvents.Event_Sandstorm = Event_Sandstorm
-------------------------------------------------------------------------------------------------------------------------
--  Social Reforms
-------------------------------------------------------------------------------------------------------------------------
local Event_SocialReforms = {}
	Event_SocialReforms.Name = "TXT_KEY_EVENT_SOCIALREFORMS"
	Event_SocialReforms.Desc = "TXT_KEY_EVENT_SOCIALREFORMS_DESC"
	Event_SocialReforms.EventImage = "Event_Parliament.dds"
	Event_SocialReforms.Weight = 5
	Event_SocialReforms.CanFunc = (
		function(pPlayer)
			if pPlayer:GetCurrentEra() == GameInfoTypes["ERA_ANCIENT"] then return false end
			return true
		end
		)
	Event_SocialReforms.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_SocialReforms.Outcomes[1] = {}
	Event_SocialReforms.Outcomes[1].Name = "TXT_KEY_EVENT_SOCIALREFORMS_OUTCOME_1"
	Event_SocialReforms.Outcomes[1].Desc = "TXT_KEY_EVENT_OUTCOME_NOTHING"
	Event_SocialReforms.Outcomes[1].CanFunc = (
		function(pPlayer)
			return true
		end
		)
	Event_SocialReforms.Outcomes[1].DoFunc = (
		function(pPlayer)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_SOCIALREFORMS_OUTCOME_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_SOCIALREFORMS"))
		end
		)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_SocialReforms.Outcomes[2] = {}
	Event_SocialReforms.Outcomes[2].Name = "TXT_KEY_EVENT_SOCIALREFORMS_OUTCOME_2"
	Event_SocialReforms.Outcomes[2].Desc = "TXT_KEY_EVENT_SOCIALREFORMS_OUTCOME_2_DESC"
	Event_SocialReforms.Outcomes[2].CanFunc = (
		function(pPlayer)
			local iReward = math.ceil(0.15 * pPlayer:GetNextPolicyCost())
			Event_SocialReforms.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_SOCIALREFORMS_OUTCOME_2_DESC", iReward)
			return true
		end
		)
	Event_SocialReforms.Outcomes[2].DoFunc = (
		function(pPlayer)
		
			local iReward = math.ceil(0.15 * pPlayer:GetNextPolicyCost())
			pPlayer:ChangeJONSCulture(iReward)
			
			if GetRandom(0, 100) < 20 then
				pPlayer:ChangeAnarchyNumTurns(2)
				JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_SOCIALREFORMS_OUTCOME_2_NOTIFICATION_ALT2"), Locale.ConvertTextKey("TXT_KEY_EVENT_SOCIALREFORMS"))				
			else
				JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_SOCIALREFORMS_OUTCOME_2_NOTIFICATION_ALT1"), Locale.ConvertTextKey("TXT_KEY_EVENT_SOCIALREFORMS"))
			end
		end
		)
	
tEvents.Event_SocialReforms = Event_SocialReforms
-------------------------------------------------------------------------------------------------------------------------
-- Technological Breakthrough
-------------------------------------------------------------------------------------------------------------------------
local Event_TechnologicalBreakthrough = {}
	Event_TechnologicalBreakthrough.Name = "TXT_KEY_EVENT_TECHNOLOGICALBREAKTHROUGH"
	Event_TechnologicalBreakthrough.Desc = "TXT_KEY_EVENT_TECHNOLOGICALBREAKTHROUGH_DESC"
	Event_TechnologicalBreakthrough.Weight = 5
	Event_TechnologicalBreakthrough.CanFunc = (
		function(pPlayer)
			local iTech = pPlayer:GetCurrentResearch()
			if iTech == -1 then return false end
			if Teams[pPlayer:GetTeam()]:GetTeamTechs():HasTech(iTech) then return false end
			Event_TechnologicalBreakthrough.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TECHNOLOGICALBREAKTHROUGH_DESC", Locale.ConvertTextKey(GameInfo.Technologies[iTech].Description))
			return true
		end
		)
	Event_TechnologicalBreakthrough.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_TechnologicalBreakthrough.Outcomes[1] = {}
	Event_TechnologicalBreakthrough.Outcomes[1].Name = "TXT_KEY_EVENT_TECHNOLOGICALBREAKTHROUGH_OUTCOME_1"
	Event_TechnologicalBreakthrough.Outcomes[1].Desc = "TXT_KEY_EVENT_TECHNOLOGICALBREAKTHROUGH_OUTCOME_1_DESC"
	Event_TechnologicalBreakthrough.Outcomes[1].CanFunc = (
		function(pPlayer)
			local iTech = pPlayer:GetCurrentResearch()
			local iReward = math.ceil(0.05 * pPlayer:GetResearchCost(iTech))
			Event_TechnologicalBreakthrough.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TECHNOLOGICALBREAKTHROUGH_OUTCOME_1_DESC", iReward)
			return true
		end
		)
	Event_TechnologicalBreakthrough.Outcomes[1].DoFunc = (
		function(pPlayer)
			local iTech = pPlayer:GetCurrentResearch()
			local iReward = math.ceil(0.05 * pPlayer:GetResearchCost(iTech))
			
			local pTeamTech = Teams[pPlayer:GetTeam()]:GetTeamTechs()
			pTeamTech:ChangeResearchProgress(iTech, iReward, pPlayer:GetID())
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_TECHNOLOGICALBREAKTHROUGH_OUTCOME_1_NOTIFICATION", Locale.ConvertTextKey(GameInfo.Technologies[iTech].Description)), Locale.ConvertTextKey("TXT_KEY_EVENT_TECHNOLOGICALBREAKTHROUGH"))
		end
		)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_TechnologicalBreakthrough.Outcomes[2] = {}
	Event_TechnologicalBreakthrough.Outcomes[2].Name = "TXT_KEY_EVENT_TECHNOLOGICALBREAKTHROUGH_OUTCOME_2"
	Event_TechnologicalBreakthrough.Outcomes[2].Desc = "TXT_KEY_EVENT_TECHNOLOGICALBREAKTHROUGH_OUTCOME_2_DESC"
	Event_TechnologicalBreakthrough.Outcomes[2].CanFunc = (
		function(pPlayer)
			local iTech = pPlayer:GetCurrentResearch()
			local iReward = math.ceil(0.1 * pPlayer:GetResearchCost(iTech))
			Event_TechnologicalBreakthrough.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TECHNOLOGICALBREAKTHROUGH_OUTCOME_2_DESC", iReward)
			return true
		end
		)
	Event_TechnologicalBreakthrough.Outcomes[2].DoFunc = (
		function(pPlayer)
			local iTech = pPlayer:GetCurrentResearch()
			local iReward = math.ceil(0.1 * pPlayer:GetResearchCost(iTech))
			local sNotification = "TXT_KEY_EVENT_TECHNOLOGICALBREAKTHROUGH_OUTCOME_2_NOTIFICATION_ALT1"
			
			if GetRandom(0, 100) < 50 then
				sNotification = "TXT_KEY_EVENT_TECHNOLOGICALBREAKTHROUGH_OUTCOME_2_NOTIFICATION_ALT2"
				iReward = 0
			end
			
			local pTeamTech = Teams[pPlayer:GetTeam()]:GetTeamTechs()
			pTeamTech:ChangeResearchProgress(iTech, iReward, pPlayer:GetID())
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey(sNotification, Locale.ConvertTextKey(GameInfo.Technologies[iTech].Description)), Locale.ConvertTextKey("TXT_KEY_EVENT_TECHNOLOGICALBREAKTHROUGH"))
		end
		)
	
tEvents.Event_TechnologicalBreakthrough = Event_TechnologicalBreakthrough
-------------------------------------------------------------------------------------------------------------------------
-- Gift to the State
-------------------------------------------------------------------------------------------------------------------------
local Event_StateGift = {}
	Event_StateGift.Name = "TXT_KEY_EVENT_STATEGIFT"
	Event_StateGift.Desc = "TXT_KEY_EVENT_STATEGIFT_DESC"
	Event_StateGift.EventImage = "Event_Gold.dds"
	Event_StateGift.Weight = 5
	Event_StateGift.CanFunc = (
		function(pPlayer)
			return true
		end
		)
	Event_StateGift.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_StateGift.Outcomes[1] = {}
	Event_StateGift.Outcomes[1].Name = "TXT_KEY_EVENT_STATEGIFT_OUTCOME_1"
	Event_StateGift.Outcomes[1].Desc = "TXT_KEY_EVENT_STATEGIFT_OUTCOME_1_DESC"
	Event_StateGift.Outcomes[1].CanFunc = (
		function(pPlayer)
			local iGoldRate = pPlayer:CalculateGoldRate()
			if iGoldRate > 100 then iGoldRate = 100 end
			local iReward = math.ceil(iGoldRate * iMod * 10)
			local iAltReward = math.ceil(5 * iMod * 10)
			if iReward < iAltReward then iReward = iAltReward end
			
			Event_StateGift.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_STATEGIFT_OUTCOME_1_DESC", iReward)
			return true
		end
		)
	Event_StateGift.Outcomes[1].DoFunc = (
		function(pPlayer)
			local iGoldRate = pPlayer:CalculateGoldRate()
			if iGoldRate > 100 then iGoldRate = 100 end
			local iReward = math.ceil(iGoldRate * iMod * 10)
			local iAltReward = math.ceil(5 * iMod * 10)
			if iReward < iAltReward then iReward = iAltReward end
			
			pPlayer:ChangeGold(iReward)
			
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_STATEGIFT_OUTCOME_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_STATEGIFT"))
		end
		)
	
tEvents.Event_StateGift = Event_StateGift
-------------------------------------------------------------------------------------------------------------------------
-- Rebel Uprising
-------------------------------------------------------------------------------------------------------------------------
local Event_RebelUprising = {}
	Event_RebelUprising.Name = "TXT_KEY_EVENT_REBELUPRISING"
	Event_RebelUprising.Desc = "TXT_KEY_EVENT_REBELUPRISING_DESC"
	Event_RebelUprising.EventImage = "Event_Revolt.dds"
	Event_RebelUprising.Weight = 3
	Event_RebelUprising.Data1 = nil
	Event_RebelUprising.Data2 = nil
	Event_RebelUprising.CanFunc = (
		function(pPlayer)
			local iEra = pPlayer:GetCurrentEra()
			if (iEra < GameInfoTypes.ERA_CLASSICAL) or (iEra > (GameInfoTypes.ERA_INDUSTRIAL - 1)) then return end

			if pPlayer:GetNumCities() < 1 then return end
			local tCities = {}
			for pCity in pPlayer:Cities() do
				table.insert(tCities, pCity)
			end
			Event_RebelUprising.Data1 = tCities[GetRandom(1, #tCities)]
			Event_RebelUprising.Data2 = GetRandom(1, 2)

			print(Event_RebelUprising.Data1:GetName(), Event_RebelUprising.Data2)

			if not(GetStrongestMilitaryUnit(pPlayer, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")) then return end
			return true
		end
		)
	Event_RebelUprising.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_RebelUprising.Outcomes[1] = {}
	Event_RebelUprising.Outcomes[1].Name = "TXT_KEY_EVENT_REBELUPRISING_OUTCOME_1"
	Event_RebelUprising.Outcomes[1].Desc = "TXT_KEY_EVENT_REBELUPRISING_OUTCOME_1_DESC"
	Event_RebelUprising.Outcomes[1].CanFunc = (
		function(pPlayer)
			local pCity 	= Event_RebelUprising.Data1
			local iNumUnits = Event_RebelUprising.Data2

			Event_RebelUprising.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_REBELUPRISING_OUTCOME_1_DESC", iNumUnits, pCity:GetName())
			return true
		end
		)
	Event_RebelUprising.Outcomes[1].DoFunc = (
		function(pPlayer)
			local pCity 	= Event_RebelUprising.Data1
			local iNumUnits = Event_RebelUprising.Data2

			local iUnit = GetStrongestMilitaryUnit(pPlayer, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")
			for iKey = 1, iNumUnits do
				Players[63]:InitUnit(iUnit, pCity:GetX() + 1, pCity:GetY() + 1):JumpToNearestValidPlot() 
			end
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_REBELUPRISING_OUTCOME_1_NOTIFICATION", pCity:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_REBELUPRISING"))
		end
		)
	
tEvents.Event_RebelUprising = Event_RebelUprising
-------------------------------------------------------------------------------------------------------------------------
-- Exceptional Advisors
-------------------------------------------------------------------------------------------------------------------------
local Event_ExceptionalAdvisors = {}
	Event_ExceptionalAdvisors.Name = "TXT_KEY_EVENT_EXCEPTIONALADVISORS"
	Event_ExceptionalAdvisors.Desc = "TXT_KEY_EVENT_EXCEPTIONALADVISORS_DESC"

	Event_ExceptionalAdvisors.EventImage = "Event_Parliament.dds"
	Event_ExceptionalAdvisors.Weight = 5

	Event_ExceptionalAdvisors.Percentages = {10, 15, 20, 20, 25, 25, 30, 33}
	Event_ExceptionalAdvisors.Data1 = nil
	Event_ExceptionalAdvisors.Data2 = nil
	Event_ExceptionalAdvisors.Data3 = nil

	Event_ExceptionalAdvisors.CanFunc = (
		function(pPlayer)
			if pPlayer:GetNumCities() < 1 then return end

			local tAdvisors = {}
			for pCity in pPlayer:Cities() do
				for tSpecialist in GameInfo.Specialists() do
					local iSpecialist = tSpecialist.ID
					if pCity:GetSpecialistGreatPersonProgressTimes100(iSpecialist) > 0 then

						local sGPClass = tSpecialist.GreatPeopleUnitClass
						local tUnitClass = sGPClass and GameInfo.UnitClasses[sGPClass]

						if tUnitClass then
							table.insert(
								tAdvisors,
								{SpecialistID = tSpecialist.ID, UnitClass = tUnitClass.Type}
							)
						end

					end
				end
			end
			if #tAdvisors < 1 then return end

			local tSpecialist = tAdvisors[GetRandom(1, #tAdvisors)]
			local iSpecialist = tSpecialist.SpecialistID
			local iUnitClass = GameInfoTypes[tSpecialist.UnitClass]
			local sGreatPerson = JFD_GetUniqueUnit(pPlayer, tSpecialist.UnitClass)
			local tGreatPerson = GameInfo.Units[sGreatPerson]

			local iGreatestProgress = 0
			local pTargetCity = nil
			for pCity in pPlayer:Cities() do
				if pCity:GetSpecialistGreatPersonProgressTimes100(iSpecialist) > iGreatestProgress then
					iGreatestProgress = pCity:GetSpecialistGreatPersonProgressTimes100(iSpecialist)
					pTargetCity = pCity
				end
			end
			if not pTargetCity then return end

			local sName, _ =  string.gsub(Locale.ConvertTextKey(tGreatPerson.Description), "Great ", "")

			Event_ExceptionalAdvisors.Data1 = pTargetCity
			Event_ExceptionalAdvisors.Data2 = tGreatPerson
			Event_ExceptionalAdvisors.Data3 = math.ceil(Event_ExceptionalAdvisors.Percentages[GetRandom(1, #Event_ExceptionalAdvisors.Percentages)] * pTargetCity:GetSpecialistUpgradeThreshold(iUnitClass) * 0.01) * 100
			Event_ExceptionalAdvisors.Data4 = iSpecialist

			Event_ExceptionalAdvisors.Name = Locale.ConvertTextKey("TXT_KEY_EVENT_EXCEPTIONALADVISORS", sName)
			Event_ExceptionalAdvisors.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_EXCEPTIONALADVISORS_DESC", string.lower(sName))

			return true
		end
		)
	Event_ExceptionalAdvisors.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_ExceptionalAdvisors.Outcomes[1] = {}
	Event_ExceptionalAdvisors.Outcomes[1].Name = "TXT_KEY_EVENT_EXCEPTIONALADVISORS_OUTCOME_1"
	Event_ExceptionalAdvisors.Outcomes[1].Desc = "TXT_KEY_EVENT_EXCEPTIONALADVISORS_OUTCOME_1_DESC"
	Event_ExceptionalAdvisors.Outcomes[1].CanFunc = (
		function(pPlayer)

			local pTargetCity = Event_ExceptionalAdvisors.Data1
			local tGreatPerson = Event_ExceptionalAdvisors.Data2
			local iPoints = Event_ExceptionalAdvisors.Data3
			local sName =  Locale.ConvertTextKey(tGreatPerson.Description)

			Event_ExceptionalAdvisors.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_EXCEPTIONALADVISORS_OUTCOME_1_DESC", iPoints/100, sName, pTargetCity:GetName())
			return true
		end
		)
	Event_ExceptionalAdvisors.Outcomes[1].DoFunc = (
		function(pPlayer)

			local pTargetCity = Event_ExceptionalAdvisors.Data1
			local tGreatPerson = Event_ExceptionalAdvisors.Data2
			local iPoints = Event_ExceptionalAdvisors.Data3
			local sName, _ =  string.gsub(Locale.ConvertTextKey(tGreatPerson.Description), "Great ", "")
			local iSpecialist = Event_ExceptionalAdvisors.Data4

			pTargetCity:ChangeSpecialistGreatPersonProgressTimes100(iSpecialist, iPoints)	

			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_EXCEPTIONALADVISORS_OUTCOME_1_NOTIFICATION", string.lower(sName)), Locale.ConvertTextKey("TXT_KEY_EVENT_EXCEPTIONALADVISORS", sName))
		end
		)
	
tEvents.Event_ExceptionalAdvisors = Event_ExceptionalAdvisors
-------------------------------------------------------------------------------------------------------------------------
-- Corruption
-------------------------------------------------------------------------------------------------------------------------
local Event_Corruption = {}
	Event_Corruption.Name = "TXT_KEY_EVENT_CORRUPTION"
	Event_Corruption.Desc = "TXT_KEY_EVENT_CORRUPTION_DESC"
	Event_Corruption.EventImage = "Event_Gold.dds"
	Event_Corruption.Weight = 5
	Event_Corruption.CanFunc = (
		function(pPlayer)
			local iGoldRate = pPlayer:CalculateGoldRate()

			if iGoldRate < 0 then return end

			if iGoldRate > 100 then iGoldRate = 100 end
			local iCost = math.ceil(iGoldRate * iMod * 5)
			local iAltCost = math.ceil(5 * iMod * 5)
			if iCost < iAltCost then iCost = iAltCost end

			if pPlayer:GetGold() < iCost then return end

			return true
		end
		)
	Event_Corruption.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_Corruption.Outcomes[1] = {}
	Event_Corruption.Outcomes[1].Name = "TXT_KEY_EVENT_CORRUPTION_OUTCOME_1"
	Event_Corruption.Outcomes[1].Desc = "TXT_KEY_EVENT_CORRUPTION_OUTCOME_1_DESC"
	Event_Corruption.Outcomes[1].CanFunc = (
		function(pPlayer)
			local iGoldRate = pPlayer:CalculateGoldRate()
			if iGoldRate > 100 then iGoldRate = 100 end
			local iCost = math.ceil(iGoldRate * iMod * 5)
			local iAltCost = math.ceil(5 * iMod * 5)
			if iCost < iAltCost then iCost = iAltCost end

			Event_Corruption.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_CORRUPTION_OUTCOME_1_DESC", iCost)
			return true
		end
		)
	Event_Corruption.Outcomes[1].DoFunc = (
		function(pPlayer)
			local iGoldRate = pPlayer:CalculateGoldRate()
			if iGoldRate > 100 then iGoldRate = 100 end
			local iCost = math.ceil(iGoldRate * iMod * 5)
			local iAltCost = math.ceil(5 * iMod * 5)
			if iCost < iAltCost then iCost = iAltCost end

			pPlayer:ChangeGold(-iCost)

			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_CORRUPTION_OUTCOME_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_CORRUPTION"))
		end
		)
	
tEvents.Event_Corruption = Event_Corruption
-------------------------------------------------------------------------------------------------------------------------
-- Assassinated Official
-------------------------------------------------------------------------------------------------------------------------
local Event_AssassinatedOfficial = {}
	Event_AssassinatedOfficial.Name = "TXT_KEY_EVENT_ASSASSINATEDOFFICIAL"
	Event_AssassinatedOfficial.Desc = "TXT_KEY_EVENT_ASSASSINATEDOFFICIAL_DESC"
	Event_AssassinatedOfficial.EventImage = nil
	Event_AssassinatedOfficial.Weight = 3
	Event_AssassinatedOfficial.CanFunc = (
		function(pPlayer)
			if pPlayer:GetNumCities() < 1 then return end

			local tCities = {}
			for pCity in pPlayer:Cities() do
				table.insert(tCities, pCity)
			end
			Event_AssassinatedOfficial.Data1 = tCities[GetRandom(1, #tCities)]
			Event_AssassinatedOfficial.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_ASSASSINATEDOFFICIAL_DESC", Event_AssassinatedOfficial.Data1:GetName())

			return true
		end
		)
	Event_AssassinatedOfficial.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_AssassinatedOfficial.Outcomes[1] = {}
	Event_AssassinatedOfficial.Outcomes[1].Name = "TXT_KEY_EVENT_ASSASSINATEDOFFICIAL_OUTCOME_1"
	Event_AssassinatedOfficial.Outcomes[1].Desc = "TXT_KEY_EVENT_ASSASSINATEDOFFICIAL_OUTCOME_1_DESC"
	Event_AssassinatedOfficial.Outcomes[1].CanFunc = (
		function(pPlayer)
			local iTurns = math.ceil(1 * iGAMod)
			Event_AssassinatedOfficial.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_ASSASSINATEDOFFICIAL_OUTCOME_1_DESC", Event_AssassinatedOfficial.Data1:GetName(), iTurns)
			return true
		end
		)
	Event_AssassinatedOfficial.Outcomes[1].DoFunc = (
		function(pPlayer)
			local iTurns = math.ceil(1 * iGAMod)
			Event_AssassinatedOfficial.Data1:ChangeResistanceTurns(iTurns)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_ASSASSINATEDOFFICIAL_OUTCOME_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_ASSASSINATEDOFFICIAL"))
		end
		)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_AssassinatedOfficial.Outcomes[2] = {}
	Event_AssassinatedOfficial.Outcomes[2].Name = "TXT_KEY_EVENT_ASSASSINATEDOFFICIAL_OUTCOME_2"
	Event_AssassinatedOfficial.Outcomes[2].Desc = "TXT_KEY_EVENT_ASSASSINATEDOFFICIAL_OUTCOME_2_DESC"
	Event_AssassinatedOfficial.Outcomes[2].CanFunc = (
		function(pPlayer)
			local iCost = math.ceil(Event_AssassinatedOfficial.Data1:GetJONSCulturePerTurn() * 3 * iGAMod)

			if iCost < 1 then return end
			if pPlayer:GetJONSCulture() < iCost then return end

			Event_AssassinatedOfficial.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_ASSASSINATEDOFFICIAL_OUTCOME_2_DESC", iCost)
			return true
		end
		)
	Event_AssassinatedOfficial.Outcomes[2].DoFunc = (
		function(pPlayer)
			local iCost = math.ceil(Event_AssassinatedOfficial.Data1:GetJONSCulturePerTurn() * 3 * iGAMod)
			pPlayer:ChangeJONSCulture(-iCost)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_ASSASSINATEDOFFICIAL_OUTCOME_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_ASSASSINATEDOFFICIAL"))
		end
		)
	
tEvents.Event_AssassinatedOfficial = Event_AssassinatedOfficial
-------------------------------------------------------------------------------------------------------------------------
-- Cultural Development
-------------------------------------------------------------------------------------------------------------------------
-- GetValidRandomEntry
------------------------------
function GetValidRandomEntry(tTable, tScope)
	if not(tScope) then tScope = "GAME" end
	local tValid = {}
	local sEntry = nil

	for iKey, sVal in ipairs(tTable) do
		if not(load(tScope, sVal)) then
			table.insert(tValid, sVal)
		end
	end

	if #tValid < 1 then return end
	sEntry = tValid[GetRandom(1, #tValid)]

	return sEntry
end
------------------------------
-- GetValidCulturalDevelopment
------------------------------
function GetValidCulturalDevelopment(pPlayer)

	local iCiv = pPlayer:GetCivilizationType()
	local sCiv = GameInfo.Civilizations[iCiv].Type

	local tCivLines = {}
	local tCultLines = {}
	local tGeneralLines = {}
	local sCuDev = nil

	print("Finding CulDev line for:	", sCiv)
	for tRow in GameInfo.Events_CulturalDevelopments("CivilizationType = '" .. sCiv .. "'") do
		table.insert(tCivLines, tRow.Description)
	end
	sCuDev = GetValidRandomEntry(tCivLines)
	if sCuDev then return sCuDev end

	--CulDiv Support
	if GameInfo.Civilization_JFD_CultureTypes then
		local sCulture = nil
		for tRow in GameInfo.Civilization_JFD_CultureTypes("CivilizationType = '" .. sCiv .. "'") do
			sCulture = tRow.CultureType
			break
		end

		if sCulture then
			print("Finding CulDev line for:	", sCulture)
			for tRow in GameInfo.Events_CulturalDevelopments("CultureType = '" .. sCulture .. "'") do
				table.insert(tCultLines, tRow.Description)
			end
			sCuDev = GetValidRandomEntry(tCultLines)
		end
		if sCuDev then return sCuDev end
	end
	--End

	print("Finding general CulDev line")
	for tRow in GameInfo.Events_CulturalDevelopments("CultureType IS NULL AND CivilizationType IS NULL") do
		table.insert(tGeneralLines, tRow.Description)
	end
	sCuDev = GetValidRandomEntry(tGeneralLines)

	return sCuDev
end
------------------------------
-- Cultural Development
------------------------------
local Event_CulturalDevelopment = {}
	Event_CulturalDevelopment.Name = "TXT_KEY_EVENT_CULTURALDEVELOPMENT"
	Event_CulturalDevelopment.EventImage = nil
	Event_CulturalDevelopment.Weight = 5
	Event_CulturalDevelopment.CanFunc = (
		function(pPlayer)

			if pPlayer:GetNumCities() < 1 then return end
			local tCities = {}
			for pCity in pPlayer:Cities() do
				table.insert(tCities, pCity)
			end

			Event_CulturalDevelopment.Data1 = nil
			Event_CulturalDevelopment.Data2 = nil
			Event_CulturalDevelopment.Data1 = tCities[GetRandom(1, #tCities)]
			Event_CulturalDevelopment.Data2 = GetValidCulturalDevelopment(pPlayer)
			if not(Event_CulturalDevelopment.Data2) then return end
			
			Event_CulturalDevelopment.Desc = Locale.ConvertTextKey(Event_CulturalDevelopment.Data2, Event_CulturalDevelopment.Data1:GetName())			

			return true
		end
		)
	Event_CulturalDevelopment.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_CulturalDevelopment.Outcomes[1] = {}
	Event_CulturalDevelopment.Outcomes[1].Name = "TXT_KEY_EVENT_CULTURALDEVELOPMENT_OUTCOME_1"
	Event_CulturalDevelopment.Outcomes[1].Desc = "TXT_KEY_EVENT_CULTURALDEVELOPMENT_OUTCOME_1_DESC"
	Event_CulturalDevelopment.Outcomes[1].CanFunc = (
		function(pPlayer)
			local iTurns = math.ceil(20 * iGAMod)
			Event_CulturalDevelopment.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_CULTURALDEVELOPMENT_OUTCOME_1_DESC", Event_CulturalDevelopment.Data1:GetName(), iTurns)
			return true
		end
		)
	Event_CulturalDevelopment.Outcomes[1].DoFunc = (
		function(pPlayer)
			local iTurns = math.ceil(20 * iGAMod)
			Event_CulturalDevelopment.Data1:ChangeWeLoveTheKingDayCounter(iTurns)

			local sFlavor = Locale.ConvertTextKey(Event_CulturalDevelopment.Data2, Event_CulturalDevelopment.Data1:GetName())
			JFD_SendWorldEvent(pPlayer:GetID(), sFlavor)

			local sFlavor = Locale.ConvertTextKey("TXT_KEY_EVENT_CULTURALDEVELOPMENT_INFLUENTIAL", sFlavor)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", sFlavor, Locale.ConvertTextKey("TXT_KEY_EVENT_CULTURALDEVELOPMENT"))

			save("GAME", Event_CulturalDevelopment.Data2, true)
		end
		)
	
tEvents.Event_CulturalDevelopment = Event_CulturalDevelopment
--=======================================================================================================================
--=======================================================================================================================