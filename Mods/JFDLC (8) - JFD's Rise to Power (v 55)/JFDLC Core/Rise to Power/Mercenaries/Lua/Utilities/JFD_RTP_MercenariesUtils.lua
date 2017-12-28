-- JFD_RTP_Mercenaries_Utils
-- Author: JFD
-- DateCreated: 9/22/2014 11:18:48 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFDLCUtils.lua")
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
local defineRTPContractBreakCost 					= GameDefines["JFD_RTP_MERCENARIES_DEFAULT_BREAK_COST"]
local defineRTPContractExtensionCost 				= GameDefines["JFD_RTP_MERCENARIES_DEFAULT_EXTENSION_COST"]
local defineRTPContractExtraCostPerLevel  			= GameDefines["JFD_RTP_MERCENARIES_EXTRA_COST_PER_LEVEL"]
local defineRTPContractExtraCostPerUnit  			= GameDefines["JFD_RTP_MERCENARIES_EXTRA_COST_PER_UNIT"]
local defineRTPContractProductionToGoldCost			= GameDefines["JFD_RTP_MERCENARIES_PRODUCTION_TO_GOLD_COST"]
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
local userSettingRTPMercenariesCoreDefaultUnitCount = (Game.GetUserSetting("JFD_RTP_MERCENARIES_CORE_DEFAULT_UNIT_COUNT"))
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local activePlayerID 	= Game.GetActivePlayer()
local activePlayer	 	= Players[activePlayerID]
local convertTextKey 	= Locale.ConvertTextKey
local handicapID 	 	= Game.GetHandicapType()
local handicapMod	 	= GameInfo.HandicapInfos[handicapID].AIUnitCostPercent
local playerBarbarianID = 63
local playerBarbarian 	= Players[playerBarbarianID]
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
-- MERCENARIES
--------------------------------------------------------------------------------------------------------------------------
--Player:CanTakeContracts
local resolutionMercenariesID = GameInfoTypes["RESOLUTION_JFD_MERCENARIES"]
function Player.CanTakeContracts(player, isHolyOrders)
	if (resolutionMercenariesID and Game.IsResolutionPassed(resolutionMercenariesID, -1)) then return false end
	if isHolyOrders then
		return player:HasTechnologyRequiredForUnlock("AllowHolyOrders")
	else
		return player:HasTechnologyRequiredForUnlock("AllowMercenaryContracts")
	end
end
--------------------------------------------------------------------------------------------------------------------------
-- CONTRACT
--------------------------------------------------------------------------------------------------------------------------
--Player:CanHaveContract
local reformSlaveryEmancipationID = GameInfoTypes["POLICY_REFORM_JFD_LABOUR_EMANCIPATED"]
function Player.CanHaveContract(player, contractID, unitID, isBreak, isExtend, returnsDisabledTT)
	local playerID = player:GetID()
	if isBreak or isExtend then
		local contractCost, contractCostBreak, contractCostExtend = player:GetContractCosts(contractID)
		local canBreak  = (player:GetGold() >= contractCostBreak)
		local canExtend = (player:GetGold() >= contractCostExtend)
		return (player:GetGold() >= contractCostBreak), (player:GetGold() >= contractCostExtend)
	else
		if Game.IsContractActive(contractID) then return false, false end
		local contract = GameInfo.Contracts[contractID]
		--Holy Order
		if contract.IsHolyOrder then
			if (not player:CanTakeContracts(true)) then return false, false end
		end
		--Religion Prereq
		local prereqReligion = contract.PrereqReligion
		if prereqReligion then
			if GameInfoTypes[prereqReligion] ~= player:GetStateReligion() then return false, false end
			local prereqPietyLevel = contract.PrereqPietyLevel
			if prereqPietyLevel then
				if player:GetPietyLevel() ~= GameInfoTypes[prereqPietyLevel] then 
					return false, true, Locale.ConvertTextKey("TXT_KEY_CONTRACT_OVERVIEW_JFD_MERCENARY_DISABLED_PIETY_LEVEL_TT", GameInfo.JFD_PietyLevels[prereqPietyLevel].Description) 
				end
			end
		end
		--Religion Founded Prereq
		local prereqReligionFounded = contract.RequiresReligionFounded
		if prereqReligionFounded then
			if (not Game.AnyoneHasReligion(GameInfoTypes[prereqReligionFounded])) then return false, false end
		end
		--Civilization Prereq
		local prereqCiv = contract.PrereqCiv
		if prereqCiv then
			if player:GetCivilizationType() ~= GameInfoTypes[prereqCiv] then return false, false end
		end
		--Era Prereq
		local currentEraID = player:GetCurrentEra()
		local obsoleteEraID = GameInfoTypes[contract.ObsoleteEra]
		if (obsoleteEraID and currentEraID >= obsoleteEraID) then  return false, false end
		local prereqEraID = GameInfoTypes[contract.PrereqEra]
		if (prereqEraID and currentEraID < prereqEraID) then  return false, false end
		--Coast Prereq
		if (not unitID) then return false, false end
		if GameInfo.Units[unitID].Domain == "DOMAIN_SEA" then
			local hasCoast = false
			for city in player:Cities() do
				if city:IsCoastal() then
					hasCoast = true
					break
				end
			end
			if (not hasCoast) then return false, true, Locale.ConvertTextKey("TXT_KEY_CONTRACT_OVERVIEW_JFD_MERCENARY_DISABLED_COAST_TT") end
		end
		--Policy Prereq
		for row in GameInfo.Policy_ContractUnlocks("ContractType = '" .. contract.Type .. "'") do
			if (not player:HasPolicy(GameInfoTypes[row.PolicyType])) then
				return false, false, nil
			end
		end
		--Costs
		local contractCost = player:GetContractCosts(contractID, unitID)
		local contractYieldText = contract.YieldText
		if contractYieldText == "[ICON_PEACE]" then
			if player:GetFaith() < contractCost then return false, true, Locale.ConvertTextKey("TXT_KEY_CONTRACT_OVERVIEW_JFD_MERCENARY_DISABLED_FAITH_TT", contractCost) end
		elseif contractYieldText == "[ICON_JFD_PIETY]" then
			if player:GetPiety() < contractCost then return false, true, Locale.ConvertTextKey("TXT_KEY_CONTRACT_OVERVIEW_JFD_MERCENARY_DISABLED_PIETY_TT", contractCost) end
		else
			if player:GetGold() < contractCost then return false, true, Locale.ConvertTextKey("TXT_KEY_CONTRACT_OVERVIEW_JFD_MERCENARY_DISABLED_GOLD_TT", contractCost) end
		end
		return true, true, nil
	end
end
------------
-- UNIT
------------
--Player:GetContractUnit
function Player.GetContractUnit(player, contractID)
	local eraID = player:GetCurrentEra()
	local contract = GameInfo.Contracts[contractID]
	if (not contract) then return nil end
	local contractPrereqEraID   = GameInfoTypes[contract.PrereqEra]
	local contractObsoleteEraID = GameInfoTypes[contract.ObsoleteEra]
	if (eraID < contractPrereqEraID or (contractObsoleteEraID and eraID >= contractObsoleteEraID)) then return nil end
	local contractUnitID = GameInfoTypes[contract.UnitType]
	if (not contractUnitID) then
		local units = {}
		local count = 1
		for row in GameInfo.Contract_UnitClasses("ContractType = '" .. contract.Type .. "'") do
			local cultureType = row.CultureType
			for unit in GameInfo.Units("CannotBeMerc = 0 AND IsPurchaseOnlyMerc = 0 AND Class = '" .. row.UnitClassType .. "'") do
				local prereqTech = unit.PrereqTech or "TECH_AGRICULTURE"
				local prereqTechEraID = GameInfoTypes[GameInfo.Technologies[prereqTech].Era]
				if (prereqTechEraID == eraID or prereqTechEraID == (eraID-1)) then
					if (isUsingCulDiv and cultureType) then
						local unitID = GameInfoTypes[GameInfo.UnitClasses[row.UnitClassType].DefaultUnit]
						if unit.ID ~= unitID then
							for row2 in GameInfo.Civilization_UnitClassOverrides("UnitType = '" .. unit.Type .. "'") do
								local civilizationType = row2.CivilizationType
								if Game.GetCivilizationPlayer(GameInfoTypes[civilizationType]) == -1 then
									for row3 in GameInfo.Civilization_JFD_CultureTypes("CivilizationType = '" .. civilizationType .. "' AND CultureType = '" .. cultureType .. "'") do
										units[count] = unit.ID
										count = count + 1	
									end
								end
							end
						else
							if (not row.UseOnlyCultureType) then
								for value = 1, userSettingRTPMercenariesCoreDefaultUnitCount do
									units[count] = unit.ID
									count = count + 1	
								end
							end
						end
					else
						for value = 1, userSettingRTPMercenariesCoreDefaultUnitCount do
							units[count] = unit.ID
							count = count + 1	
						end
					end
				end
			end
		end
		contractUnitID = units[Game.GetRandom(1,#units)]
		for row in GameInfo.Contract_UnitCombats("ContractType = '" .. contract.Type .. "'") do
			local cultureType = row.CultureType
			if row.UnitCombatType == "UNITCOMBAT_SIEGE" then
				for unit in GameInfo.Units("CannotBeMerc = 0 AND IsPurchaseOnlyMerc = 0 AND CombatClass = '" .. row.UnitCombatType .. "' AND IsSiege = 1") do
					units[count] = unit.ID
					count = count + 1	
				end
			end
			for unit in GameInfo.Units("PrereqTech IS NOT 'null' AND CannotBeMerc = 0 AND IsPurchaseOnlyMerc = 0 AND CombatClass = '" .. row.UnitCombatType .. "' AND IsSiege = 0") do
				local prereqTech = unit.PrereqTech or "TECH_AGRICULTURE"
				local prereqTechEraID = GameInfoTypes[GameInfo.Technologies[prereqTech].Era]
				if (prereqTechEraID == eraID or prereqTechEraID == (eraID-1)) then
					if (isUsingCulDiv and cultureType) then
						local unitID = GameInfoTypes[GameInfo.UnitClasses[unit.Class].DefaultUnit]
						if unit.ID ~= unitID then
							for row2 in GameInfo.Civilization_UnitClassOverrides("UnitType = '" .. unit.Type .. "'") do
								local civilizationType = row2.CivilizationType
								if Game.GetCivilizationPlayer(GameInfoTypes[civilizationType]) == -1 then
									for row3 in GameInfo.Civilization_JFD_CultureTypes("CivilizationType = '" .. civilizationType .. "' AND CultureType = '" .. cultureType .. "'") do
										units[count] = unit.ID
										count = count + 1	
									end
								end
							end
						else
							if (not row.UseOnlyCultureType) then
								for value = 1, userSettingRTPMercenariesCoreDefaultUnitCount do
									units[count] = unit.ID
									count = count + 1	
								end
							end 	
						end     	
					else
						for value = 1, userSettingRTPMercenariesCoreDefaultUnitCount do
							units[count] = unit.ID
							count = count + 1	
						end
					end
				end
			end
			contractUnitID = units[Game.GetRandom(1,#units)]
		end		
	end
	return contractUnitID
end
------------
-- COST
------------
--Player:GetContractCosts
function Player.GetContractCosts(player, contractID, unitID)
	local contract = GameInfo.Contracts[contractID]
	local contractCost = 0
	local contractBreakCost = 0
	local contractExtendCost = 0
	local contractRating = contract.Rating
	local contractYieldText = contract.YieldText
	local unitCount = contract.UnitCount
	if (not unitID) then
		for unit in GameInfo.Units("Cost > 0 AND Combat > 0") do
			if Game.GetContractUnits(contractID, unit.ID) > 0 then
				unitID = unit.ID
				break
			end
		end		
	end
	if (not unitID) then return 0, 0, 0 end
	if contractYieldText == "[ICON_PEACE]" then
		contractCost = Game.GetFaithCost(unitID)
	elseif contractYieldText == "[ICON_JFD_PIETY]" then
		contractCost = contract.PietyCost
	else 
		contractCost = player:GetUnitProductionNeeded(unitID)*defineRTPContractProductionToGoldCost
	end
	if (not contract.IsHolyOrder) then
		for value = 1, unitCount do
			contractCost = contractCost + ((contractCost*defineRTPContractExtraCostPerUnit)/100)
		end
		for value = 1, contractRating do
			contractCost = contractCost + ((contractCost*defineRTPContractExtraCostPerLevel)/100)
		end
	end
	--Buildings
	for row in GameInfo.Building_JFD_ContractMods("CostMod <> 0") do
		if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
			contractCost = contractCost + ((contractCost*row.CostMod)/100)
		end
	end
	--Policies
	for row in GameInfo.Policy_JFD_ContractMods("CostMod <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			contractCost = contractCost + ((contractCost*row.CostMod)/100)
		end
	end
	--Reforms
	for row in GameInfo.JFD_Reform_ContractMods("CostMod <> 0") do
		if player:HasReform(GameInfoTypes[row.ReformType]) then
			contractCost = contractCost + ((contractCost*row.CostMod)/100)
		end
	end
	--Traits
	for row in GameInfo.Trait_JFD_ContractMods("CostMod <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			contractCost = contractCost + ((contractCost*row.CostMod)/100)
		end
	end
	if (not player:IsHuman()) then contractCost = ((contractCost*handicapMod)/100) end
	return Game.GetRound(contractCost), Game.GetRound((contractCost*defineRTPContractBreakCost)/100), Game.GetRound((contractCost*defineRTPContractExtensionCost)/100)
end
------------
-- TEXT
------------
--Player:GetContractOverview
function Player.GetContractOverview(player, contractID, unitID)
	local contract = GameInfo.Contracts[contractID]
	local contractUnitCount = Game.GetContractUnits(contractID, unitID)
	local contractUnitLevel = contract.Rating
	local contractOverviewText = Locale.ConvertTextKey("TXT_KEY_JFD_CONTRACT_OVERVIEW_MAINTENANCE_LABEL", contract.Maintenance)
	local unit = GameInfo.Units[unitID]
	if unit.Domain == "DOMAIN_SEA" then
		local hasCoast = false
		for city in player:Cities() do
			if city:IsCoastal() then
				hasCoast = true
				break
			end
		end
		if (not hasCoast) then
			contractOverviewText = contractOverviewText .. Locale.ConvertTextKey("TXT_KEY_JFD_CONTRACT_OVERVIEW_REQ_COAST_LABEL")
		end
	end
	if contract.PrereqReligion then
		local religionID = GameInfoTypes[contract.PrereqReligion]
		if (religionID and religionID > -1) then
			contractOverviewText = contractOverviewText .. Locale.ConvertTextKey("TXT_KEY_JFD_CONTRACT_OVERVIEW_REQ_LABEL", GameInfo.Religions[religionID].IconString, Game.GetReligionName(religionID))
		end
	end
	contractOverviewText = contractOverviewText .. "[NEWLINE]" .. contractUnitCount .. "x " .. convertTextKey(unit.Description) .. " (" .. Locale.ConvertTextKey("TXT_KEY_JFD_CONTRACT_OVERVIEW_UNIT_LEVEL_LABEL", contractUnitLevel) .. ")"
	return contractOverviewText
end
------------
-- OLD UTILS
------------
--JFD_IsUnitMercenary
function JFD_IsUnitMercenary(playerID, unitID)
	local player = Players[playerID]
	return player:GetUnitByID(unitID):IsContractUnit()
end	
--=======================================================================================================================
--=======================================================================================================================