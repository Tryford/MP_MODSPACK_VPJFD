-- JFD_CID_Misc_Utils
-- Author: JFD
-- DateCreated: 1/28/2017 6:48:16 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
--=======================================================================================================================
-- DEFINES
--=======================================================================================================================
local defineAIFreeBuildCharges = GameDefines["JFD_CID_AI_FREE_BUILD_CHARGES"]
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- BUILD CHARGES 
------------------------------------------------------------------------------------------------------------------------
--JFD_GetNumBuildCharges
function JFD_GetNumBuildCharges(playerID, unit, unitTypeID, skipMaxCharges)
	local player = Players[playerID]
	local unitInfo = GameInfo.Units[unitTypeID]
	local numCharges = 0
	local numChargesMax = 0
	if (not player:IsHuman()) then numChargesMax = numChargesMax + defineAIFreeBuildCharges end
	for row in GameInfo.Unit_JFD_BuildCharges("UnitType = '" .. unitInfo.Type .. "'") do
		numChargesMax = row.NumCharges
	end
	if numChargesMax > 0 then
		for promotion in GameInfo.UnitPromotions("IsBuildCharge = 1") do
			if unit:IsHasPromotion(promotion.ID) then
				numCharges = numCharges + 1
			end
		end
		if (not skipMaxCharges) then
			for row in GameInfo.Building_JFD_BuildCharges() do
				if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
					numChargesMax = numChargesMax + row.NumCharges
				end
			end
			for row in GameInfo.Policy_JFD_BuildCharges() do
				if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
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

--JFD_ChangeNumBuildCharges
function JFD_ChangeNumBuildCharges(playerID, unit, unitTypeID, numChargesChange)
	local numCharges = JFD_GetNumBuildCharges(playerID, unit, unitTypeID, true)
	JFD_SetNumBuildCharges(playerID, unit, unitTypeID, numCharges+numChargesChange)
end

--JFD_SetNumBuildCharges
function JFD_SetNumBuildCharges(playerID, unit, unitTypeID, numCharges)
	local player = Players[playerID]
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