-- JFD_ECUtils
-- Author: JFD
-- DateCreated: 8/28/2016 6:20:54 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("FLuaVector.lua")
include("PlotIterators.lua");
--=======================================================================================================================
-- UTILS
--=======================================================================================================================
-- SETTINGS
--------------------------------------------------------------------------------------------------------------------------
--JFD_GetUserSetting
function JFD_GetUserSetting(type)
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
--------------------------------------------------------------------------------------------------------------------------
-- MOD USE
--------------------------------------------------------------------------------------------------------------------------
--JFD_IsUsingCulDiv
function JFD_IsUsingCulDiv()
	local CulDivModID = "31a31d1c-b9d7-45e1-842c-23232d66cd47"
	--for _, mod in pairs(Modding.GetActivatedMods()) do
		--if (mod.ID == CulDivModID) then
			return true
		--end
	--end
	--return false
end

--JFD_IsUsingRTP
function JFD_IsUsingRTP()
	local RTPModID = "eea66053-7579-481a-bb8d-2f3959b59974"
	--for _, mod in pairs(Modding.GetActivatedMods()) do
		--if (mod.ID == RTPModID) then
			return true
		--end
	--end
	--return false
end
--------------------------------------------------------------------------------------------------------------------------
-- MATHS
--------------------------------------------------------------------------------------------------------------------------
--JFD_GetRandom
function JFD_GetRandom(lower, upper)
	return Game.Rand((upper + 2) - lower, "") + lower
end
-----------------------------------------------------------------------------------------------------------
-- UNITS
--------------------------------------------------------------------------------------------------------------------------
--GetStrongestMilitaryUnit (Sukritact)
function GetStrongestMilitaryUnit(pPlayer, bIgnoreResources, ...)
	local tUnit = {["ID"] = GameInfoTypes.UNIT_WARRIOR, ["Combat"] = 0}
	for iKey, sCombatType in pairs(arg) do
		for row in GameInfo.Units("CombatClass = \'" .. sCombatType .. "\'") do
			if pPlayer:CanTrain(row.ID, bIgnoreResources) and row.Combat > tUnit.Combat then
				tUnit = row
			end
		end
	end
	return tUnit.ID
end
----=======================================================================================================================
----=======================================================================================================================