-- JFD_PIT_ProgressUtils
-- Author: JFD
-- DateCreated: 2/7/2017 1:59:46 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFDLCUtils.lua");
--=======================================================================================================================
-- DEFINES
--=======================================================================================================================
local defineAIFreeBuildCharges = GameDefines["JFD_PIT_PROGRESS_AI_FREE_BUILD_CHARGES"]
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
--Player:GetGatewayTechCost
function Player.GetGatewayTechCost(eraType)
	local cost = 0
	for tech in GameInfo.Technologies("Era = '" .. EraType .. "' AND NOT Type IN ('TECH_JFD_CIVILIZATION', 'TECH_JFD_CIVIL_PLANNING', 'TECH_JFD_NOBILITY', 'TECH_JFD_PATRONAGE', 'TECH_EE_SOVEREIGNTY', 'TECH_INDUSTRIALIZATION', 'TECH_REPLACEABLE_PARTS')") do
		cost = cost + tech.Cost
	end
	return cost
end
------------------------------------------------------------------------------------------------------------------------
-- BUILD CHARGES 
------------------------------------------------------------------------------------------------------------------------
--Player:GetUnitBuildChargeCost
function Player.GetUnitBuildChargeCost(player, buildID, unitID)
	local buildInfo = GameInfo.Builds[buildID]
	local unitInfo = GameInfo.Units[unitID]
	local chargeCost = buildInfo.ChargeCost
	for row in GameInfo.Build_JFD_ChargeCosts("BuildType = '" .. buildInfo.Type .. "' AND (UnitType = '" .. unitInfo.Type .. "' or UnitType IS NULL)") do
		if ((not row.RequiresPolicy) or (row.RequiresPolicy and player:HasPolicy(GameInfoTypes[row.RequiresPolicy]))) then
			chargeCost = chargeCost + row.ChargeCost
		end
	end	
	return chargeCost
end

--Player:GetNumUnitBuildCharges
local unitClassWorkboatID = GameInfoTypes["UNITCLASS_WORKBOAT"]
function Player.GetNumUnitBuildCharges(player, unit, unitTypeID, skipMaxCharges)
	local unitInfo = GameInfo.Units[unitTypeID]
	local unitClass = unitInfo.Class
	local numCharges = 0
	local numChargesMax = 0
	for row in GameInfo.UnitClass_JFD_BuildCharges("UnitClassType = '" .. unitClass .. "'") do
		numChargesMax = row.NumCharges
	end
	for row in GameInfo.Unit_JFD_BuildCharges("UnitType = '" .. unitInfo.Type .. "'") do
		numChargesMax = numChargesMax + row.NumCharges
	end
	if unitClass == unitClassWorkboatID then
		for tech in GameInfo.Technologies("ExtraWorkBoatBuildCharges > 0") do
			if player:HasTech(tech.ID) then
				numChargesMax = numChargesMax + row.ExtraWorkBoatBuildCharges
			end
		end
	end
	if (numChargesMax > 0 and (not player:IsHuman())) then numChargesMax = numChargesMax + defineAIFreeBuildCharges end
	if numChargesMax > 0 then
		for promotion in GameInfo.UnitPromotions("IsBuildCharge = 1") do
			if unit:IsHasPromotion(promotion.ID) then
				numCharges = numCharges + 1
			end
		end
		if (not skipMaxCharges) then
			for row in GameInfo.Building_JFD_BuildCharges("(UnitClassType IS NULL OR UnitClassType = '" .. unitClass .. "')") do
				if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
					numChargesMax = numChargesMax + row.NumCharges
				end
			end
			for row in GameInfo.JFD_Reform_BuildCharges("(UnitClassType IS NULL OR UnitClassType = '" .. unitClass .. "')") do
				if player:HasReform(GameInfoTypes[row.ReformType]) then
					numChargesMax = numChargesMax + row.NumCharges
				end
			end
			for row in GameInfo.Policy_JFD_BuildCharges("(UnitClassType IS NULL OR UnitClassType = '" .. unitClass .. "')") do
				if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
					numChargesMax = numChargesMax + row.NumCharges
				end
			end
			for row in GameInfo.Trait_JFD_BuildCharges("(UnitClassType IS NULL OR UnitClassType = '" .. unitClass .. "')") do
				if player:HasTrait(GameInfoTypes[row.TraitType]) then
					numChargesMax = numChargesMax + row.NumCharges
				end
			end
			for row in GameInfo.UnitPromotions_JFD_BuildCharges() do
				if unit:HasPromotion(GameInfoTypes[row.PromotionType]) then
					numChargesMax = numChargesMax + row.NumCharges
				end
			end
		end
	end
	return numCharges, numChargesMax
end

--Player:ChangeNumUnitBuildCharges
function Player.ChangeNumUnitBuildCharges(player, unit, unitTypeID, numChargesChange)
	local numCharges = player:GetNumUnitBuildCharges(unit, unitTypeID, true)
	player:SetNumUnitBuildCharges(unit, unitTypeID, numCharges+numChargesChange)
end

--Player:SetNumUnitBuildCharges
function Player.SetNumUnitBuildCharges(player, unit, unitTypeID, numCharges)
	local unitInfo = GameInfo.Units[unitTypeID]
	for promotion in GameInfo.UnitPromotions("IsBuildCharge = 1") do
		if unit:IsHasPromotion(promotion.ID) then
			unit:SetHasPromotion(promotion.ID, false)
		end
	end
	for value = 1, numCharges do
		local promotionID = GameInfoTypes["PROMOTION_JFD_BUILD_CHARGE_" .. value]
		unit:SetHasPromotion(promotionID, true)
	end
end
--=======================================================================================================================
--=======================================================================================================================