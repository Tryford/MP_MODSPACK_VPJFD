-- JFD_RTP_Claims_AustriaFunctions
-- Author: JFD
-- DateCreated: 10/5/2015 3:10:41 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("FLuaVector.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- DIPLOMATIC MARRIAGE
----------------------------------------------------------------------------------------------------------------------------
local resourceDignitaryID = GameInfoTypes["RESOURCE_JFD_DIGNITARIES"]
local traitAustriaID	  = GameInfoTypes["TRAIT_JFD_AUSTRIA"]
local unitArtistID		  = GameInfoTypes["UNIT_ARTIST"]
local unitMusicianID	  = GameInfoTypes["UNIT_MUSICIAN"]
local unitWriterID		  = GameInfoTypes["UNIT_WRITER"]
-- JFD_CID_Claims_Austra_Dignitaries
function JFD_CID_Claims_Austra_Dignitaries(playerID, unitID, unitTypeID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (not player:HasTrait(traitAustriaID)) then return end
	if (unitTypeID == unitArtistID or unitTypeID == unitMusicianID or unitTypeID == unitWriterID) then
		local hex = ToHexFromGrid(Vector2(plotX, plotY))
		player:ChangeNumResourceTotal(resourceDignitaryID, 1)
		if player:IsHuman() then
			Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+2[ENDCOLOR] [ICON_JFD_DIGNITARY]"), true)
			Events.GameplayFX(hex.x, hex.y, -1)
		end
	end
end
GameEvents.UnitCreated.Add(JFD_CID_Claims_Austra_Dignitaries)	
--==========================================================================================================================
--==========================================================================================================================