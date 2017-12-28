-- JFD_CID_Colonies_Decisions
-- Author: JFD
-- DateCreated: 2/12/2016 5:42:26 PM
--=======================================================================================================================
-- DECISIONS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local speedMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100)
-------------------------------------------------------------------------------------------------------------------------
-- Colonies: Initiate De-Colonization
-------------------------------------------------------------------------------------------------------------------------
local eraModernID			 = GameInfoTypes["ERA_MODERN"]
local policyDecolonizationID = GameInfoTypes["POLICY_DECISIONS_JFD_DECOLONIZATION"]
local unitClassColonistID    = GameInfoTypes["UNITCLASS_JFD_COLONIST"]
local Decisions_JFD_CID_Colonies_Decolonization = {}
	Decisions_JFD_CID_Colonies_Decolonization.Name = "TXT_KEY_DECISIONS_JFD_CID_COLONIES_DECOLONIZATION"
	Decisions_JFD_CID_Colonies_Decolonization.Desc = "TXT_KEY_DECISIONS_JFD_CID_COLONIES_DECOLONIZATION_DESC"
	Decisions_JFD_CID_Colonies_Decolonization.CanFunc = (
	function(player)
		local playerID = player:GetID()
		if player:GetCurrentEra() < eraModernID	then return false, false end
		if player:HasPolicy(policyDecolonizationID) then
			Decisions_JFD_CID_Colonies_Decolonization.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_CID_COLONIES_DECOLONIZATION_ENACTED_DESC")
			return false, false, true
		end
		local numColonies = player:GetNumColonies()
		local costGold = Game.GetRound((300*speedMod)*numColonies)
		local costMagistrates = numColonies
		if (not player:IsHuman()) then costGold = Game.GetRound((100*speedMod)*numColonies) end
		Decisions_JFD_CID_Colonies_Decolonization.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_CID_COLONIES_DECOLONIZATION_DESC", costGold, costMagistrates)
		if player:GetGold() < costGold then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < costMagistrates then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_CID_Colonies_Decolonization.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local numColonies = player:GetNumColonies()
		local costGold = Game.GetRound((300*speedMod)*numColonies)
		local costMagistrates = numColonies
		if (not player:IsHuman()) then costGold = Game.GetRound((100*speedMod)*numColonies) end
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(iMagistrate, -costMagistrates)
		player:GrantPolicy(policyDecolonizationID, true)
		for city in player:Cities() do
			if city:IsColony() then 
				LuaEvents.JFD_WLTKDBegins(playerID(), city, city:GetX(), city:GetY(), 10, -1, true)
				LuaEvents.JFD_ColonyDecolonized(playerID, city, true)
			end
		end
		for unit in player:Units() do
			if unit:IsUnitClass(unitClassColonistID) then
				player:InitUnit(unitSettlerID, unit:GetX(), unit:GetY())
				unit:Kill(-1)
			end
		end
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_CID_COLONIES_DECOLONIZATION", player:GetName(), player:GetCivilizationDescription()))
	end
	)
tDecisions["Decisions_JFD_CID_Colonies_Decolonization"] = Decisions_JFD_CID_Colonies_Decolonization
--=======================================================================================================================
--=======================================================================================================================