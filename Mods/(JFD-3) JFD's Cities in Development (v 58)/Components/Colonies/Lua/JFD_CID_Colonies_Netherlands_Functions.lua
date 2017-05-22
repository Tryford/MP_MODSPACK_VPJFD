-- JFD_CID_Colonies_Netherlands_Functions
-- Author: JFD
-- DateCreated: 12/9/2015 8:26:52 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("JFD_CID_ColoniesUtils.lua")
--==========================================================================================================================
-- USER SETTINGS
--==========================================================================================================================
local userSettingColoniesNetherlands = JFD_GetUserSetting("JFD_CID_COLONIES_CIVILIZATION_CHANGES_NETHERLANDS") == 1
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
-- UTILITIES
----------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- DUTCH EAST INDIA COMPANY
----------------------------------------------------------------------------------------------------------------------------
-- JFD_CID_Colonies_Netherlands_DutchEastIndiaCompany_ColonyFounded
local traitNetherlandsID = GameInfoTypes["TRAIT_JFD_NETHERLANDS"]
local unitWorkerID		 = GameInfoTypes["UNIT_WORKER"]
function JFD_CID_Colonies_Netherlands_DutchEastIndiaCompany_ColonyFounded(playerID, city, isFort, plotX, plotY)
	local player = Players[playerID]
	local teamID = player:GetTeam()
	if (not player:IsAlive()) then return end
	if (not player:HasTrait(traitNetherlandsID)) then return end
	player:InitUnit(unitWorkerID, plotX, plotY)
	local cityID = city:GetID()
	local plot = Map.GetPlot(plotX, plotY)
	for adjacentPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
		if (adjacentPlot:GetOwner() == -1 and adjacentPlot:GetResourceType() > -1)  then
			adjacentPlot:SetOwner(playerID, cityID, true, true)
			adjacentPlot:SetRevealed(teamID, true)
		end
	end
end
if userSettingColoniesNetherlands then
	LuaEvents.JFD_ColonyFounded.Add(JFD_CID_Colonies_Netherlands_DutchEastIndiaCompany_ColonyFounded)
end
--==========================================================================================================================
--==========================================================================================================================