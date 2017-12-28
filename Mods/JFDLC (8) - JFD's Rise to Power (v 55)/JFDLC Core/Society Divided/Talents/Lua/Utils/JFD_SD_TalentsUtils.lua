-- JFD_SD_TalentsUtils
-- Author: JFD
-- DateCreated: 2/7/2017 1:59:46 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFDLCUtils.lua");
--=======================================================================================================================
-- DEFINES
--=======================================================================================================================
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- MISSIONS
------------------------------------------------------------------------------------------------------------------------
--Player:GetMissionTalentCost
function Player.GetMissionTalentCost(player, buildID, unitID)
	local buildInfo = GameInfo.Builds[buildID]
	local unitInfo = GameInfo.Units[unitID]
	local talentCost = mission.TalentCost
	if mission.TalentCostIsMax then 
		local unit = player:GetUnitByID(unitID)
		local unitTypeID = unit:GetUnitType()
		local numTalents, numTalentsMax = player:GetNumTalents(unit, unitTypeID, true, false)
		return numTalentsMax end
	for row in GameInfo.Mission_JFD_TalentCosts("BuildType = '" .. buildInfo.Type .. "' AND (UnitType = '" .. unitInfo.Type .. "' or UnitType IS NULL)") do
		if ((not row.RequiresPolicy) or (row.RequiresPolicy and player:HasPolicy(GameInfoTypes[row.RequiresPolicy]))) then
			talentCost = talentCost + row.TalentCost
		end
	end	
	return talentCost
end
------------------------------------------------------------------------------------------------------------------------
-- UNITS
------------------------------------------------------------------------------------------------------------------------
--Player:GetNumTalents
function Player.GetNumTalents(player, unit, unitTypeID, skipMinCost, skipMaxCost)
	local unitInfo = GameInfo.Units[unitTypeID]
	local unitClass = unitInfo.Class
	local numTalents = 0
	local numTalentsMax = 0
	for row in GameInfo.UnitClass_JFD_Talents("UnitClassType = '" .. unitClass .. "'") do
		numTalentsMax = row.NumTalents
	end
	for row in GameInfo.Unit_JFD_Talents("UnitType = '" .. unitInfo.Type .. "'") do
		numTalentsMax = numTalentsMax + row.NumTalents
	end
	if (numTalentsMax > 0 and (not player:IsHuman())) then numTalentsMax = numTalentsMax + defineAIFreeBuildCharges end
	if numTalentsMax > 0 then
		if (not skipMinCost) then
			for promotion in GameInfo.UnitPromotions("IsTalent = 1") do
				if unit:IsHasPromotion(promotion.ID) then
					numTalents = numTalents + 1
				end
			end
		end
		if (not skipMaxCost) then
			for row in GameInfo.Building_JFD_TalentMods("UnitClassType IS NULL OR UnitClassType = '" .. unitClass .. "'") do
				if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
					numTalentsMax = numTalentsMax + row.NumTalents
				end
			end
			for row in GameInfo.JFD_Reform_TalentMods("UnitClassType IS NULL OR UnitClassType = '" .. unitClass .. "'") do
				if player:HasReform(GameInfoTypes[row.ReformType]) then
					numTalentsMax = numTalentsMax + row.NumTalents
				end
			end
			for row in GameInfo.Policy_JFD_TalentMods("UnitClassType IS NULL OR UnitClassType = '" .. unitClass .. "'") do
				if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
					numTalentsMax = numTalentsMax + row.NumTalents
				end
			end
			for row in GameInfo.Trait_JFD_TalentMods("UnitClassType IS NULL OR UnitClassType = '" .. unitClass .. "'") do
				if player:HasTrait(GameInfoTypes[row.TraitType]) then
					numTalentsMax = numTalentsMax + row.NumTalents
				end
			end
			for row in GameInfo.UnitPromotions_JFD_TalentMods() do
				if unit:HasPromotion(GameInfoTypes[row.PromotionType]) then
					numTalentsMax = numTalentsMax + row.NumTalents
				end
			end
		end
	end
	return numTalents, numTalentsMax
end

--Player:ChangeNumTalents
function Player.ChangeNumTalents(player, unit, unitTypeID, numTalentsChange)
	local numTalents = player:GetNumTalents(unit, unitTypeID, true)
	player:SetNumTalents(unit, unitTypeID, numTalents+numTalentsChange)
end

--Player:SetNumTalents
function Player.SetNumTalents(player, unit, unitTypeID, numTalents)
	local unitInfo = GameInfo.Units[unitTypeID]
	for promotion in GameInfo.UnitPromotions("IsTalent = 1") do
		if unit:IsHasPromotion(promotion.ID) then
			unit:SetHasPromotion(promotion.ID, false)
		end
	end
	for value = 1, numTalents do
		local promotionID = GameInfoTypes["PROMOTION_JFD_TALENT_" .. value]
		unit:SetHasPromotion(promotionID, true)
	end
end
--=======================================================================================================================
--=======================================================================================================================