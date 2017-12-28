-- Suzerainity_CityState_Utils.lua
-- Author: Sukrit
-- DateCreated: 12/19/2016 6:22:04 PM
--=======================================================================================================================
-- GENERAL UTILITIES
--=======================================================================================================================
-- GLOBALS
-------------------------------------------------------------------------------------------------------------------------
local tSuk_SuzerainityTraits = {}
local tSuk_CityStatesWithTraits = {}

for iPlayer, pPlayer in ipairs(Players) do
	if (pPlayer:IsMinorCiv()) then

		local iMinor = pPlayer:GetMinorCivType()
		local sMinor = GameInfo.MinorCivilizations[iMinor].Type
		for tRow in GameInfo.Suk_SuzerainTraits("MinorCivType = '" .. sMinor .. "'") do
			tSuk_SuzerainityTraits[iPlayer] = tRow
			tSuk_CityStatesWithTraits[iPlayer] = pPlayer
			break
		end

	end
end
-------------------------------------------------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------------------------------------------------

-- Player:GetSuzerainTraitTable()
function Player.GetSuzerainTraitTable(pSelf)
	local iPlayer = pSelf:GetID()
	return tSuk_SuzerainityTraits[iPlayer]
end

-- Player:GetSuzerainTrait()
function Player.GetSuzerainTrait(pSelf)
	local tTrait = pSelf:GetSuzerainTraitTable()
	if not tTrait then return end

	return tTrait.ID
end

-- Player:GetSuzerainTraitType()
function Player.GetSuzerainTraitType(pSelf)
	local tTrait = pSelf:GetSuzerainTraitTable()
	if not tTrait then return end

	return tTrait.Type
end

-- Player:IsSuzerainTrait()
	-- provide ID number or Type string
function Player.IsSuzerainTrait(pSelf, sTrait)

	local sMyTrait = pSelf:GetSuzerainTraitType()
	if not sMyTrait then return false end

	local tTrait = GameInfo.Suk_SuzerainTraits[sTrait]
	if not tTrait then return end

	return sMyTrait == tTrait.Type
end

-- Player:IsAllyHasSuzerainTrait()
	-- provide ID number or Type string
function Player.IsAllyHasSuzerainTrait(pSelf, sTrait)
	if (pSelf:IsMinorCiv() or pSelf:IsBarbarian()) then return false end

	local iPlayer = pSelf:GetID()

	for iMinor, pMinor in pairs(tSuk_CityStatesWithTraits) do
		if pMinor:IsSuzerainTrait(sTrait) then
			if pMinor:IsAllies(iPlayer) then
				return true
			end
		end
	end

	return false
end	
-------------------------------------------------------------------------------------------------------------------------
-- Old Version, These are more thorough, but less efficient 
-- Instead, let's just cache this stuff at game start
-------------------------------------------------------------------------------------------------------------------------
--[[
-- Player:GetSuzerainTraitTable()
function Player.GetSuzerainTraitTable(pSelf)
	if not(pSelf:IsMinorCiv()) then return end

	local iMinor = pSelf:GetMinorCivType()
	local sMinor = GameInfo.MinorCivilizations[iMinor].Type

	for tRow in GameInfo.Suk_SuzerainTraits("MinorCivType = '" .. sMinor .. "'") do
		return tRow
	end

	return
end

-- Player:GetSuzerainTrait()
function Player.GetSuzerainTrait(pSelf)
	if not(pSelf:IsMinorCiv()) then return end

	local tTrait = pSelf:GetSuzerainTraitTable()
	if not tTrait then return end

	return tTrait.ID
end

-- Player:GetSuzerainTraitType()
function Player.GetSuzerainTraitType(pSelf)
	if not(pSelf:IsMinorCiv()) then return end

	local tTrait = pSelf:GetSuzerainTraitTable()
	if not tTrait then return end

	return tTrait.Type
end

-- Player:IsSuzerainTrait()
	-- provide ID number or Type string
function Player.IsSuzerainTrait(pSelf, sType)
	if not(pSelf:IsMinorCiv()) then return false end

	if not(GameInfo.Suk_SuzerainTraits[sType]) then return false end

	local sMyTrait = pSelf:GetSuzerainTraitType()
	if not sMyTrait then return false end

	return sType == GameInfo.Suk_SuzerainTraits[sType].Type
end

-- Player:IsAllyHasSuzerainTrait()
	-- provide ID number or Type string
function Player.IsAllyHasSuzerainTrait(pSelf, sType)
	if (pSelf:IsMinorCiv() or pSelf:IsBarbarian()) then return false end

	local iPlayer = pSelf:GetID()

	for iMinor, pMinor in ipairs(Players) do
		if pMinor:IsSuzerainTrait(sType) then
			if pMinor:IsAllies(iPlayer) then
				return true
			end
		end
	end

	return false
end	
]]
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------