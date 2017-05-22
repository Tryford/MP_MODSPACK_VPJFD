-- JFD_CID_Colonies_Decisions
-- Author: JFD
-- DateCreated: 2/12/2016 5:42:26 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_CID_ColoniesUtils.lua")
--=======================================================================================================================
-- DECISIONS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local mathCeil = math.ceil
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
		local costGold = mathCeil(500*JFD_GetNumColonies(playerID))
		Decisions_JFD_CID_Colonies_Decolonization.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_CID_COLONIES_DECOLONIZATION_DESC", costGold)
		if player:GetGold() < costGold then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_CID_Colonies_Decolonization.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local costGold = mathCeil(500*JFD_GetNumColonies(playerID))
		if (not player:IsHuman()) then costGold = mathCeil(100*JFD_GetNumColonies(playerID)) end
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:GrantPolicy(policyDecolonizationID, true)
		for city in player:Cities() do
			if JFD_IsCityColony(city) then 
				LuaEvents.JFD_ColonyDecolonized(playerID, city, true)
				city:ChangeWeLoveTheKingDayCounter(20)
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