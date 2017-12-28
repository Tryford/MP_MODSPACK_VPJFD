-- JFD_SD_Talents_Functions
-- Author: JFD
-- DateCreated: 2/7/2017 1:33:10 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_SD_TalentsUtils.lua")
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
-- SETTINGS
--------------------------------------------------------------------------------------------------------------------------
local userSettingSDTalentsCore  = (Game.GetUserSetting("JFD_SD_TALENTS_CORE") == 1)
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local activePlayerID 		 = Game.GetActivePlayer()
local activePlayer	 		 = Players[activePlayerID]
local mathMin		 		 = math.min

local resourceInventorsID 	 = GameInfoTypes["RESOURCE_JFD_INVENTORS"]
local unitClassArtistID		 = GameInfoTypes["UNITCLASS_ARTIST"]
local unitClassDirectorID 	 = GameInfoTypes["UNITCLASS_JFD_DIRECTOR"] or -1
local unitClassDoctorID 	 = GameInfoTypes["UNITCLASS_JFD_DOCTOR"] or -1
local unitClassEntertainerID = GameInfoTypes["UNITCLASS_JFD_ENTERTAINER"] or -1
local unitClassMerchantID 	 = GameInfoTypes["UNITCLASS_MERCHANT"]
local unitClassMusicianID 	 = GameInfoTypes["UNITCLASS_MUSICIAN"]
local unitClassScientistID   = GameInfoTypes["UNITCLASS_SCIENTIST"]
local unitClassWriterID		 = GameInfoTypes["UNITCLASS_WRITER"]
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
-- TALENTS
------------------------------------------------------------------------------------------------------------------------
--JFD_SD_Talents_UnitCreated
function JFD_PIT_Progress_UnitCreated(playerID, unitID, unitTypeID)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local unitInfo = GameInfo.Units[unitTypeID].Type
	local numTalents, numTalentsMax = player:GetNumUnitTalents(unit, unitTypeID)
	if numTalentsMax > 0 then
		for value = 1, numTalentsMax do
			local promotionID = GameInfoTypes["PROMOTION_JFD_TALENT_" .. value]
			unit:SetHasPromotion(promotionID, true)
		end
	end
end
if userSettingSDTalentsCore then
	GameEvents.UnitCreated.Add(JFD_SD_Talents_UnitCreated)
end

--JFD_SD_TalentsUnitUpgraded
function JFD_SD_TalentsUnitUpgraded(playerID, unitID, newUnitID)
	local player = Players[playerID]
	local unit = player:GetUnitByID(newUnitID)
	local unitTypeID = unit:GetUnitType()
	local numTalents, numTalentsMax = player:GetNumUnitTalents(unit, unitTypeID)
	if numTalents <= numTalentsMax then
		local newUnit = player:InitUnit(unitTypeID, unit:GetX(), unit:GetY())
		newUnit:FinishMoves()
		unit:Kill(-1)
	end	
end
if userSettingSDTalentsCore then
	GameEvents.UnitUpgraded.Add(JFD_SD_TalentsUnitUpgraded)
end
--=======================================================================================================================
--=======================================================================================================================