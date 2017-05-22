-- JFD_RTP_Piety_Decisions
-- Author: JFD
-- DateCreated: 7/7/2014 7:22:45 AM
--=======================================================================================================================
-- Includes
--=======================================================================================================================
include("FLuaVector");
include("IconSupport");
include("JFD_PietyUtils.lua");
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- Globals
-------------------------------------------------------------------------------------------------------------------------
local activeTeam		= Teams[Game.GetActiveTeam()]
local eraIndustrialID	= GameInfoTypes["ERA_INDUSTRIAL"]
local eraRenaissanceID	= GameInfoTypes["ERA_RENAISSANCE"]
local mathCeil			= math.ceil

print("JFD's Piety Decisions: loaded")
--=======================================================================================================================
-- PAGAN DECISION
--=======================================================================================================================
-- Pagan: Perform Sacred Mysteries
-------------------------------------------------------------------------------------------------------------------------
local beliefAncestorWorshipID = GameInfoTypes["BELIEF_ANCESTOR_WORSHIP"]
local beliefFertilityRitesID  = GameInfoTypes["BELIEF_FERTILITY_RITES"]
local beliefOneWithNatureID	  = GameInfoTypes["BELIEF_ONE_WITH_NATURE"] 
local beliefOralTraditionID	  = GameInfoTypes["BELIEF_ORAL_TRADITION"]
local beliefSacredWaterID	  = GameInfoTypes["BELIEF_SACRED_WATERS"]
local Decisions_RTP_Piety_SacredMysteries = {}
	Decisions_RTP_Piety_SacredMysteries.Name = "TXT_KEY_DECISIONS_JFD_PERFORM_SACRED_MYSTERIES"
	Decisions_RTP_Piety_SacredMysteries.Desc = "TXT_KEY_DECISIONS_JFD_PERFORM_RITES_OF_REVERANCE"
	Decisions_RTP_Piety_SacredMysteries.Type = "TXT_KEY_DECISIONS_JFD_PERFORM_RITES_OF_REVERANCE_DESC"
	Decisions_RTP_Piety_SacredMysteries.CanFunc = (
	function(player)
		local playerID = player:GetID()
		if (not player:IsPagan()) then return false, false end
		HookDecisionReligionIcon(Decisions_RTP_Piety_SacredMysteries, "RELIGION_PANTHEON")
		local currentEra = player:GetCurrentEra()
		local pantheonBeliefID = player:GetBeliefInPantheon()
		local beliefName = GameInfo.Beliefs[pantheonBeliefID].ShortDescription
		local shortDescription = "TXT_KEY_DECISIONS_JFD_PERFORM_SACRED_MYSTERIES"
		local description = "TXT_KEY_DECISIONS_JFD_PERFORM_SACRED_MYSTERIES_DESC"
		if pantheonBeliefID == beliefAncestorWorshipID then
			beliefName = "TXT_KEY_BELIEF_ANCESTOR_WORSHIP_SHORT" 
			shortDescription = "TXT_KEY_DECISIONS_JFD_PERFORM_RITES_OF_REVERANCE"
			description = "TXT_KEY_DECISIONS_JFD_PERFORM_RITES_OF_REVERANCE_DESC"
		elseif pantheonBeliefID == beliefFertilityRitesID then
			beliefName = "TXT_KEY_BELIEF_FERTILITY_RITES_SHORT" 
			shortDescription = "TXT_KEY_DECISIONS_JFD_PERFORM_FERTILITY_RITES"
			description = "TXT_KEY_DECISIONS_JFD_PERFORM_FERTILITY_RITES_DESC"
		elseif pantheonBeliefID == beliefOneWithNatureID then
			beliefName = "TXT_KEY_BELIEF_ONE_WITH_NATURE_SHORT" 
			shortDescription = "TXT_KEY_DECISIONS_JFD_PERFORM_NATURE_CEREMONIES"
			description = "TXT_KEY_DECISIONS_JFD_PERFORM_NATURE_CEREMONIES_DESC"
		elseif pantheonBeliefID == beliefOralTraditionID then
			beliefName = "TXT_KEY_BELIEF_ORAL_TRADITION_SHORT" 
			shortDescription = "TXT_KEY_DECISIONS_JFD_PERFORM_ORAL_TRADITION"
			description = "TXT_KEY_DECISIONS_JFD_PERFORM_ORAL_TRADITION_DESC"
		elseif pantheonBeliefID == beliefSacredWaterID then
			beliefName = "TXT_KEY_BELIEF_SACRED_WATERS_SHORT" 
			shortDescription = "TXT_KEY_DECISIONS_JFD_PERFORM_RIVER_CEREMONIES"
			description = "TXT_KEY_DECISIONS_JFD_PERFORM_RIVER_CEREMONIES_DESC"
		end
		local enactedDesc = Locale.ConvertTextKey(description) .. Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PAGAN_ENACTED_REWARD")
		local era = load(player, "Decisions_RTP_Piety_SacredMysteries")
		if era ~= nil then
			if era < currentEra then
				save(player, "Decisions_RTP_Piety_SacredMysteries", nil)
			else
				Decisions_RTP_Piety_SacredMysteries.Desc = Locale.ConvertTextKey(enactedDesc)
				return false, false, true
			end
		end
		local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil(65*iMod))
		local yieldCost = mathCeil(faithReward*0.3)
		local costDesc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PAGAN_COST_GENERIC", yieldCost)
		local rewardDesc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PAGAN_REWARD", faithReward)
		if beliefName then costDesc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PAGAN_COST", beliefName, yieldCost) end
		Decisions_RTP_Piety_SacredMysteries.Name = Locale.ConvertTextKey(shortDescription)
		Decisions_RTP_Piety_SacredMysteries.Desc = Locale.ConvertTextKey(description) .. costDesc .. rewardDesc
		local capitalCity = player:GetCapitalCity()
		if capitalCity:GetFood() < yieldCost then return true, false end
		if capitalCity:GetProduction() < yieldCost then return true, false end
		return true, true
	end
	)
	
	Decisions_RTP_Piety_SacredMysteries.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil(65*iMod))
		local yieldCost = mathCeil(faithReward*0.3)
		local capitalCity = player:GetCapitalCity()
		capitalCity:ChangeFood(-yieldCost)
		capitalCity:ChangeProduction(-yieldCost)
		player:ChangeFaith(faithReward)
		local currentEra = player:GetCurrentEra()
		save(player, "Decisions_RTP_Piety_SacredMysteries", currentEra)
		if player:IsHuman() then
			Events.AudioPlay2DSound("AS2D_JFD_DRUIDISM")
		end
	end
	)

tDecisions["Decisions_RTP_Piety_SacredMysteries"] = Decisions_RTP_Piety_SacredMysteries	
-- =======================================================================================================================
-- GENERIC STATE RELIGION DECISIONS
--=======================================================================================================================
-- Devout//Virtuous: Expel Religious Minorities
-------------------------------------------------------------------------------------------------------------------------
local civilisationSpainID = GameInfoTypes["CIVILIZATION_SPAIN"]
local pietyLevelNeutralID = GameInfoTypes["PIETY_LEVEL_JFD_NEUTRAL"]
local Decisions_RTP_Piety_ExpelMinorities = {}
	Decisions_RTP_Piety_ExpelMinorities.Name = "TXT_KEY_DECISIONS_JFD_EXPEL_MINORITIES"
	Decisions_RTP_Piety_ExpelMinorities.Desc = "TXT_KEY_DECISIONS_JFD_EXPEL_MINORITIES_DESC"
	Decisions_RTP_Piety_ExpelMinorities.Weight = 5
	Decisions_RTP_Piety_ExpelMinorities.Type = "Religious"
	Decisions_RTP_Piety_ExpelMinorities.CanFunc = (
	function(player)
		local playerID = player:GetID()
		if player:GetCivilizationType() == civilisationSpainID 	then return false, false end
		if (not player:HasStateReligion()) then return false, false end
		if load(player, "Decisions_RTP_Piety_ExpelMinorities") == true then
		Decisions_RTP_Piety_ExpelMinorities.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_EXPEL_MINORITIES_ENACTED_DESC")
			return false, false, true
		end
		local stateReligionID = player:GetStateReligion()
		HookDecisionReligionIcon(Decisions_RTP_Piety_ExpelMinorities, GameInfo.Religions[stateReligionID].Type)
		local pietyReward = JFD_GetPietyYield(playerID, mathCeil(40*iMod))
		local goldCost = mathCeil((120*iMod)+(player:GetTotalPopulation()*7)*iMod)
		Decisions_RTP_Piety_ExpelMinorities.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_EXPEL_MINORITIES_DESC", goldCost, pietyReward)
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if player:GetGold() < goldCost then return true, false end
		local pietyLevelID = JFD_GetPietyLevelID(playerID)
		if pietyLevelID < pietyLevelNeutralID then return true, false end
		return true, true
	end
	)
	
	Decisions_RTP_Piety_ExpelMinorities.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local pietyReward = JFD_GetPietyYield(playerID, mathCeil(40*iMod))
		local goldCost = mathCeil((120*iMod)+(player:GetTotalPopulation()*7)*iMod)
		player:ChangeGold(-goldCost)
		player:ChangePiety(pietyReward)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		local stateReligionID = player:GetStateReligion()
		for city in player:Cities() do
			for religion in GameInfo.Religions("ID <> '" .. stateReligionID .. "'") do
				city:ConvertPercentFollowers(-1, religion.ID, 100)
			end
		end
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_EXPEL_RELIGIOUS_MINORITIES", player:GetName(), player:GetCivilizationDescription())) 
		save(player, "Decisions_RTP_Piety_ExpelMinorities", true)
	end
	)
	
tDecisions["Decisions_RTP_Piety_ExpelMinorities"] = Decisions_RTP_Piety_ExpelMinorities	
-------------------------------------------------------------------------------------------------------------------------
-- Heretical: Declare Repentance
-------------------------------------------------------------------------------------------------------------------------
local Decisions_RTP_Piety_DeclareRepentance = {}
	Decisions_RTP_Piety_DeclareRepentance.Name = "TXT_KEY_DECISIONS_JFD_DECLARE_REPENTANCE"
	Decisions_RTP_Piety_DeclareRepentance.Desc = "TXT_KEY_DECISIONS_JFD_DECLARE_REPENTANCE_DESC"
	Decisions_RTP_Piety_DeclareRepentance.Type = "Religious"
	Decisions_RTP_Piety_DeclareRepentance.CanFunc = (
	function(player)
		local playerID = player:GetID()
		if (not player:HasStateReligion()) then return false, false end
		local stateReligionID = player:GetStateReligion()
		if load(player, "Decisions_RTP_Piety_DeclareRepentance") == stateReligionID then return false, false end
		local pietyLevelID = JFD_GetPietyLevelID(playerID)
		if pietyLevelID >= pietyLevelNeutralID then return false, false end
		HookDecisionReligionIcon(Decisions_RTP_Piety_DeclareRepentance, GameInfo.Religions[stateReligionID].Type)
		local faithCost = mathCeil(300*iMod)
		local pietyReward = JFD_GetPietyYield(playerID, 100)
		Decisions_RTP_Piety_DeclareRepentance.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_DECLARE_REPENTANCE_DESC", faithCost, pietyReward)
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if player:GetFaith() < faithCost then return true, false end
		return true, true
	end
	)
	
	Decisions_RTP_Piety_DeclareRepentance.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local faithCost = mathCeil(300*iMod)
		local pietyReward = JFD_GetPietyYield(playerID, 100)
		player:ChangeFaith(-faithCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangePiety(pietyReward)
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_DECLARE_REPENTANCE", player:GetName(), player:GetCivilizationShortDescription())) 
		save(player, "Decisions_RTP_Piety_DeclareRepentance", player:GetStateReligion())
	end
	)

tDecisions["Decisions_RTP_Piety_DeclareRepentance"] = Decisions_RTP_Piety_DeclareRepentance	
--=======================================================================================================================
--=======================================================================================================================