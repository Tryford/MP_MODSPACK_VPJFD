-- JFD_RTP_Mercenaries_Functions
-- Author: JFD
-- DateCreated: 8/27/2015 5:24:57 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("CommonBehaviors")
include("IconSupport.lua")
include("InfoTooltipInclude.lua")
include("InstanceManager.lua")
include("JFD_RTPUtils.lua")
include("JFD_RTP_MercenariesUtils.lua")
include("JFD_RTP_SovereigntyUtils.lua")
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingMercenariesCore					= JFD_GetUserSetting("JFD_RTP_MERCENARIES_CORE") == 1
local userSettingMercenariesCoreAICap				= JFD_GetUserSetting("JFD_RTP_MERCENARIES_CORE_AI_CAP")
local userSettingMercenariesCoreFirstNotification	= JFD_GetUserSetting("JFD_RTP_MERCENARIES_CORE_FIRST_NOTIFICATION_TURNS")
local userSettingMercenariesCoreSecondNotification	= JFD_GetUserSetting("JFD_RTP_MERCENARIES_CORE_SECOND_NOTIFICATION_TURNS")
local userSettingPietyReligiousOrders				= JFD_GetUserSetting("JFD_RTP_PIETY_TECH_ADDITIONS_RELIGIOUS_ORDERS") == 1
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local activePlayerID 			   = Game.GetActivePlayer()
local activePlayer	 			   = Players[activePlayerID]
local activeTeamID   			   = Game.GetActiveTeam()
local activeTeam	 			   = Teams[activeTeamID]
local convertTextKey 			   = Locale.ConvertTextKey
local playerBarbarian			   = Players[63]
local speedMod 					   = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100)
local defineMercenariesExtendTurns = JFD_Round(GameDefines["JFD_RTP_MERCENARIES_DEFAULT_EXTENSION_TURNS"]*speedMod)
--=======================================================================================================================
-- AI FUNCTIONS
--=======================================================================================================================
-- CONTRACTS
------------------
--JFD_RTP_Mercenaries_AIDoTurn
function JFD_RTP_Mercenaries_AIDoTurn(playerID)
	local player = Players[playerID]
	if player:IsHuman() then return end
	if player:IsBarbarian() then return end
	if (not player:IsAlive()) then return end
	if (not player:IsAtWar()) then return end
	if (not JFD_CanTakeContracts(playerID)) then return end
	if player:GetNumActivePlayerContracts() >= userSettingMercenariesCoreAICap then return end
	if player:GetNumMilitaryUnits()	> (activePlayer:GetNumMilitaryUnits()*2) then return end
	if player:CalculateGoldRate() < 5 then return end
	local flavourMercenary = 5	
	if (not player:IsMinorCiv()) then
		flavourMercenary = JFD_GetLeaderFlavour(playerID, "FLAVOR_JFD_MERCENARY") 
	end	
	if JFD_GetRandom(1,10) <= flavourMercenary then	
		local validContracts = {}
		local count = 1
		for _, v in ipairs(Game.GetInactiveContractUnitList()) do
			local contract = {ID = v.Contract, UnitID = v.Unit, NumUnit = v.NumUnits}
			if JFD_CanHaveContract(playerID, contract.ID, contract.UnitID) then
				validContracts[count] = contract.ID
				count = count + 1
			end
		end
		if #validContracts > 0 then
			local contractToTakeID = validContracts[JFD_GetRandom(1,#validContracts)]
			if contractToTakeID then player:StartContract(contractToTakeID) end
		end
	end
end
if userSettingMercenariesCore then
	GameEvents.PlayerDoTurn.Add(JFD_RTP_Mercenaries_AIDoTurn)
end
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
-- CONTRACTS
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Piety_TeamTechResearched
function JFD_RTP_Mercenaries_TeamTechResearched(teamID, techID)
	local playerID = Teams[teamID]:GetLeaderID()
	local player = Players[playerID]
	local techType = GameInfo.Technologies[techID].Type
	if player:IsBarbarian() then return end
	if (not player:IsHuman()) then return end
	for row in GameInfo.Technologies_JFD_MiscEffects("TechType = '" .. techType .. "' AND AllowMercenaryContracts == 1") do
		JFD_SendNotification(playerID, "NOTIFICATION_JFD_MERCENARY", convertTextKey("TXT_KEY_JFD_CONTRACTS_AVAILABLE_NOTIFICATION_TEXT"), convertTextKey("TXT_KEY_JFD_CONTRACTS_AVAILABLE_NOTIFICATION_SHORT_TEXT"), true)
		break
	end
end
if userSettingMercenariesCore then
	GameEvents.TeamTechResearched.Add(JFD_RTP_Mercenaries_TeamTechResearched)
end
------------------
-- STATS
------------------
--JFD_RTP_Mercenaries_GetContractDuration
function JFD_RTP_Mercenaries_GetContractDuration(playerID, contractID)
	local player = Players[playerID]
	local contract = GameInfo.Contracts[contractID]
	local contractDuraction = contract.ContractTurns
	--Buildings
	for row in GameInfo.Building_JFD_ContractMods("TurnsMod <> 0") do
		if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
			contractDuraction = contractDuraction + (contractDuraction*row.TurnsMod/100)
		end
	end
	--Policies
	for row in GameInfo.Policy_JFD_ContractMods("TurnsMod <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			contractDuraction = contractDuraction + (contractDuraction*row.TurnsMod/100)
		end
	end
	--Reforms
	for row in GameInfo.JFD_Reform_ContractMods("TurnsMod <> 0") do
		if JFD_HasReform(playerID, GameInfoTypes[row.ReformType]) then
			contractDuraction = contractDuraction + (contractDuraction*row.TurnsMod/100)
		end
	end
	--Traits
	for row in GameInfo.Trait_JFD_ContractMods("TurnsMod <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			contractDuraction = contractDuraction + (contractDuraction*row.TurnsMod/100)
		end
	end
	return JFD_Round(contractDuraction*speedMod)
end
if userSettingMercenariesCore then
	GameEvents.GetContractDuration.Add(JFD_RTP_Mercenaries_GetContractDuration)
end

--JFD_RTP_Mercenaries_GetContractMaintenance
function JFD_RTP_Mercenaries_GetContractMaintenance(playerID, contractID)
	local player = Players[playerID]
	local contract = GameInfo.Contracts[contractID]
	local contractMaintenance = contract.Maintenance
	--Buildings
	for row in GameInfo.Building_JFD_ContractMods("MaintenanceMod <> 0") do
		if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
			contractMaintenance = contractMaintenance + (contractMaintenance*row.MaintenanceMod/100)
		end
	end
	--Policies
	for row in GameInfo.Policy_JFD_ContractMods("MaintenanceMod <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			contractMaintenance = contractMaintenance + (contractMaintenance*row.MaintenanceMod/100)
		end
	end
	--Reforms
	for row in GameInfo.JFD_Reform_ContractMods("MaintenanceMod <> 0") do
		if JFD_HasReform(playerID, GameInfoTypes[row.ReformType]) then
			contractMaintenance = contractMaintenance + (contractMaintenance*row.MaintenanceMod/100)
		end
	end
	--Traits
	for row in GameInfo.Trait_JFD_ContractMods("MaintenanceMod <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			contractMaintenance = contractMaintenance + (contractMaintenance*row.MaintenanceMod/100)
		end
	end
	return contractMaintenance
end
if userSettingMercenariesCore then
	GameEvents.GetContractMaintenance.Add(JFD_RTP_Mercenaries_GetContractMaintenance)
end

--JFD_RTP_Mercenaries_ContractsUpdated
function JFD_RTP_Mercenaries_ContractsUpdated()
	for contract in GameInfo.Contracts() do
		local contractID = contract.ID
		local unitID = nil
		local unitCount = contract.UnitCount
		if Game.IsContractAvailable(contractID) then
			unitID = JFD_RTP_Mercenaries_GetContractUnit(contractID)
		end
		for unit in GameInfo.Units("Cost > 0 AND (Combat > 0 OR RangedCombat > 0)") do
			if Game.GetContractUnits(contractID, unit.ID) > 0 then return end
		end
		if unitID then Game.SetContractUnits(contractID, unitID, unitCount) end
	end
end
if userSettingMercenariesCore then
	GameEvents.TeamSetEra.Add(JFD_RTP_Mercenaries_ContractsUpdated)
end
------------------
-- FUNCTIONS
------------------
--JFD_RTP_Mercenaries_ContractedStarted
local promotionEnslavedID 			= GameInfoTypes["PROMOTION_JFD_ENSLAVED"]
local promotionMercenaryID 			= GameInfoTypes["PROMOTION_JFD_MERCENARY"]
local promotionMercenaryIgnoreGGID 	= GameInfoTypes["PROMOTION_JFD_MERCENARY_IGNORE_GG"]
function JFD_RTP_Mercenaries_ContractedStarted(playerID, contractID, contractDuration, contractMaintenance)
	local player = Players[playerID]
	local capital = player:GetCapitalCity()
	local contract = GameInfo.Contracts[contractID]
	local contractCost = JFD_GetContractCost(playerID, contractID)
	local contractRating = contract.Rating
	local contractPromotionID = GameInfoTypes[contract.PromotionType]
	local contractYieldText = contract.YieldText
	if contractYieldText == "[ICON_GOLD]" 			then player:ChangeGold(-contractCost)
	elseif contractYieldText == "[ICON_PEACE]" 		then player:ChangeFaith(-contractCost)
	elseif contractYieldText == "[ICON_JFD_PIETY]" 	then player:ChangePiety(-contractCost)
	end
	for unit in player:Units() do
		if unit:IsSpecificContractUnit(contractID) then
			unit:SetHasPromotion(contractPromotionID, true)
			unit:SetHasPromotion(promotionMercenaryID, true)
			unit:SetHasPromotion(promotionMercenaryIgnoreGGID, true)
			if promotionEnslavedID then
				unit:SetHasPromotion(promotionEnslavedID, true)
			end
			unit:SetName(convertTextKey(contract.Description))
			unit:ChangeLevel(contractRating)
			unit:SetExperience(0)
			for value = 1, contractRating do
				local contractRatingPromotion = "PROMOTION_JFD_MERCENARY_" .. value
				local contractRatingPromotionID = GameInfoTypes[contractRatingPromotion]
				unit:SetHasPromotion(contractRatingPromotionID, true)
			end
		end
	end
	if player:IsHuman() then
		local capital = player:GetCapitalCity()
		if contract.PurchaseDing then Events.AudioPlay2DSound(contract.PurchaseDing) end
		Events.AudioPlay2DSound("AS2D_SOUND_JFD_CONTRACT_STARTED")
		JFD_SendNotification(playerID, "NOTIFICATION_JFD_MERCENARY", convertTextKey("TXT_KEY_JFD_CONTRACTS_NOTIFICATION_NEW_CONTRACT", contract.Description, contractDuration), convertTextKey("TXT_KEY_JFD_CONTRACTS_NOTIFICATION_CONTRACT_SHORT"), false, capital:GetX(), capital:GetY())
	end
end
if userSettingMercenariesCore then
	GameEvents.ContractStarted.Add(JFD_RTP_Mercenaries_ContractedStarted)
end

--JFD_RTP_Mercenaries_ContractExtended
function JFD_RTP_Mercenaries_ContractExtended(playerID, contractID)
	local player = Players[playerID]
	local contract = GameInfo.Contracts[contractID]
	local contractCost, contractCostBreak, contractCostExtend = JFD_GetContractCost(playerID, contractID)
	local contractYieldText = contract.YieldText
	if contractYieldText == "[ICON_GOLD]" 			then player:ChangeGold(-contractCostExtend)
	elseif contractYieldText == "[ICON_PEACE]" 		then player:ChangeFaith(-contractCostExtend)
	elseif contractYieldText == "[ICON_JFD_PIETY]" 	then player:ChangePiety(-contractCostExtend)
	end
	player:ChangeContractTurns(contractID, defineMercenariesExtendTurns)
	if player:IsHuman() then
		if contract.PurchaseDing then Events.AudioPlay2DSound(contract.PurchaseDing) end
		JFD_SendNotification(playerID, "NOTIFICATION_JFD_MERCENARY", convertTextKey("TXT_KEY_JFD_CONTRACTS_NOTIFICATION_EXTENDED_CONTRACT", contract.Description, player:GetContractTurnsRemaining(contractID)), convertTextKey("TXT_KEY_JFD_CONTRACTS_NOTIFICATION_CONTRACT_SHORT"), false)
	end
end
if userSettingMercenariesCore then
	LuaEvents.JFD_ContractExtended.Add(JFD_RTP_Mercenaries_ContractExtended)
end

--JFD_RTP_Mercenaries_ContractBroken
function JFD_RTP_Mercenaries_ContractBroken(playerID, contractID)
	local player = Players[playerID]
	local contract = GameInfo.Contracts[contractID]
	local contractCost, contractCostBreak, contractCostExtend = JFD_GetContractCost(playerID, contractID)
	local contractYieldText = contract.YieldText
	if contractYieldText == "[ICON_GOLD]" 			then player:ChangeGold(-contractCostBreak)
	elseif contractYieldText == "[ICON_PEACE]" 		then player:ChangeFaith(-contractCostBreak)
	elseif contractYieldText == "[ICON_JFD_PIETY]" 	then player:ChangePiety(-contractCostBreak)
	end
	if JFD_GetRandom(1,100) <= contract.MutinyChance then
		LuaEvents.JFD_ContractUnitsDisband(playerID, contractID, true)
	else
		player:EndContract(contractID)
		player:DisbandContractUnits(contractID)
		if contract.PurchaseDing then Events.AudioPlay2DSound(contract.PurchaseDing) end
	end
end
if userSettingMercenariesCore then
	LuaEvents.JFD_ContractBroken.Add(JFD_RTP_Mercenaries_ContractBroken)
end

--JFD_RTP_Mercenaries_ContractedEnded
local promotionEnslavedID 			= GameInfoTypes["PROMOTION_JFD_ENSLAVED"]
local promotionMercenaryID 			= GameInfoTypes["PROMOTION_JFD_MERCENARY"]
local promotionMercenaryIgnoreGGID 	= GameInfoTypes["PROMOTION_JFD_MERCENARY_IGNORE_GG"]
function JFD_RTP_Mercenaries_ContractedEnded(playerID, contractID)
	local player = Players[playerID]
	local contract = GameInfo.Contracts[contractID]
	player:DisbandContractUnits(contractID)
	if player:IsHuman() then
		JFD_SendNotification(playerID, "NOTIFICATION_JFD_MERCENARY", convertTextKey("TXT_KEY_JFD_CONTRACTS_NOTIFICATION_FINISH_CONTRACT", contract.Description), convertTextKey("TXT_KEY_JFD_CONTRACTS_NOTIFICATION_FINISH_CONTRACT_SHORT"), false)
	end
end
if userSettingMercenariesCore then
	GameEvents.ContractEnded.Add(JFD_RTP_Mercenaries_ContractedEnded)
end
------------------
-- DISBAND
------------------
--JFD_RTP_Mercenaries_ContractUnitsDisband
function JFD_RTP_Mercenaries_ContractUnitsDisband(playerID, contractID, isMutiny)
	local player = Players[playerID]
	local contract = GameInfo.Contracts[contractID]
	local contractPromotionID = GameInfoTypes[contract.PromotionType]
	if isMutiny then
		local unitID = nil
		for unit in player:Units() do
			if unit:IsSpecificContractUnit(contractID) then
				unitID = unit:GetUnitType()
				local unitX = unit:GetX()
				local unitY = unit:GetY()
				if Map.GetPlot(unitX, unitY):IsCity() then unitX = unitX + 1 end
				local barbarianUnit = playerBarbarian:InitUnit(unitID, unitX, unitY)
				--barbarianUnit:JumpToNearestValidPlot()
				barbarianUnit:SetHasPromotion(contractPromotionID, true)
				local contractRating = contract.Rating
				for value = 1, contractRating do
					local contractRatingPromotion = "PROMOTION_JFD_MERCENARY_" .. contractRating
					local contractRatingPromotionID = GameInfoTypes[contractRatingPromotion]
					barbarianUnit:SetHasPromotion(contractRatingPromotionID, true)
				end
				unit:Kill(63)
			end
		end	
		if player:IsHuman() then
			if contract.PurchaseDing then Events.AudioPlay2DSound(contract.PurchaseDing) end
			Events.AudioPlay2DSound("AS2D_INTERFACE_ENEMY_IN_TERRITORY")
			JFD_SendNotification(playerID, "NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_CONTRACTS_NOTIFICATION_CONTRACT_MUTINY", contract.Description), convertTextKey("TXT_KEY_JFD_CONTRACTS_NOTIFICATION_CONTRACT_MUTINY_SHORT"), false, -1, -1, unitID)
		end
	else
		if player:IsHuman() then
			Events.AudioPlay2DSound("AS2D_SOUND_JFD_CONTRACT_DEFAULTED")
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_MERCENARY", convertTextKey("TXT_KEY_JFD_CONTRACTS_NOTIFICATION_CONTRACT_DISBANDS", contract.Description), convertTextKey("TXT_KEY_JFD_CONTRACTS_NOTIFICATION_CONTRACT_DISBANDS_SHORT"), false, -1, -1)	
		end
	end
	player:EndContract(contractID)
end
if userSettingMercenariesCore then
	LuaEvents.JFD_ContractUnitsDisband.Add(JFD_RTP_Mercenaries_ContractUnitsDisband)
end
------------------
-- DO TURN
------------------
--JFD_RTP_Mercenaries_PlayerDoTurn
function JFD_RTP_Mercenaries_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if player:IsBarbarian() then return end
	if (not player:IsAlive()) then return end
	for contract in GameInfo.Contracts() do
		local contractID = contract.ID
		if player:PlayerHasContract(contractID) then
			if player:IsHuman() then
				local turns = player:GetContractTurnsRemaining(contractID)
				if turns == userSettingMercenariesCoreFirstNotification then
					JFD_SendNotification(playerID, "NOTIFICATION_JFD_MERCENARY", convertTextKey("TXT_KEY_JFD_CONTRACTS_NOTIFICATION_IMMINENT_FINISH_CONTRACT", contract.Description, turns), convertTextKey("TXT_KEY_JFD_CONTRACTS_NOTIFICATION_IMMINENT_FINISH_CONTRACT_SHORT"), false, -1, -1)
				elseif turns == userSettingMercenariesCoreSecondNotification then
					JFD_SendNotification(playerID, "NOTIFICATION_JFD_MERCENARY", convertTextKey("TXT_KEY_JFD_CONTRACTS_NOTIFICATION_IMMINENT_FINISH_CONTRACT", contract.Description, turns), convertTextKey("TXT_KEY_JFD_CONTRACTS_NOTIFICATION_IMMINENT_FINISH_CONTRACT_SHORT"), false, -1, -1)
				end
			end
			if (player:GetGold() <= 0 and player:CalculateGoldRate() <= 0) then
				local contractChance = JFD_GetRandom(1,100)
				if contract.MutinyChance >= contractChance then
					LuaEvents.JFD_ContractUnitsDisband(playerID, contractID, true)
				elseif contract.DisbandChance >= contractChance then
					LuaEvents.JFD_ContractUnitsDisband(playerID, contractID)
				end
			end
		end
	end
end
if userSettingMercenariesCore then
	GameEvents.PlayerDoTurn.Add(JFD_RTP_Mercenaries_PlayerDoTurn)
end
------------------
-- UNITS
------------------
--JFD_RTP_Mercenaries_CanTrain
local unitGalleyID = GameInfoTypes["UNIT_GALLEY"]
function JFD_RTP_Mercenaries_CanTrain(playerID, unitID)
	local player = Players[playerID]
	if (unitID == unitGalleyID and playerID ~= 63) then
		return false
	elseif (unitID == unitGalleyID and (not userSettingMercenariesCore)) then
		return false
	else
		return (not GameInfo.Units[unitID].JFD_OnlyMercenary)
	end
	return true
end
GameEvents.PlayerCanTrain.Add(JFD_RTP_Mercenaries_CanTrain)

--JFD_RTP_Mercenaries_CanHavePromotion
function JFD_RTP_Mercenaries_CanHavePromotion(playerID, unitID, promotionID)
	local player = Players[playerID]
	return (not player:GetUnitByID(unitID):IsContractUnit())
end
if userSettingMercenariesCore then
	GameEvents.CanHavePromotion.Add(JFD_RTP_Mercenaries_CanHavePromotion)
end

--JFD_RTP_Mercenaries_CanHaveUpgrade
function JFD_RTP_Mercenaries_CanHaveUpgrade(playerID, unitID)
	local player = Players[playerID]
	return (not player:GetUnitByID(unitID):IsContractUnit())
end
if userSettingMercenariesCore then
	GameEvents.CanHaveAnyUpgrade.Add(JFD_RTP_Mercenaries_CanHaveUpgrade)
end
------------------------------------------------------------------------------------------------------------------------
-- UI
------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
-----------------
local g_CurrentTab 			= "MercenaryContracts"
local g_ContractSelectedID 	= nil
local g_UnitSelectedID 		= nil
local g_UnitClassSelectedID = nil
-----------------
-- CHOOSE TABS
-----------------
g_Tabs = {
	["MercenaryContracts"] = {
		Button = Controls.ButtonMercenaryContracts,
		Panel = Controls.MercenaryContractsPanel,
		SelectHighlight = Controls.IconMercenaryContractsHL,
	},
	["CurrentContracts"] = {
		Button = Controls.ButtonCurrentContracts,
		Panel = Controls.CurrentContractsPanel,
		SelectHighlight = Controls.IconCurrentContractsHL,
	},
}
IconHookup(0, 64, "EXPANSIONPATCH_POLICY_ATLAS", 			Controls.IconMercenaryContracts)
IconHookup(0, 64, "EXPANSIONPATCH_POLICY_ACHIEVED_ATLAS", 	Controls.IconMercenaryContractsHL)
IconHookup(8, 64, "POLICY_ATLAS_EXP2", 						Controls.IconCurrentContracts)
IconHookup(8, 64, "POLICY_A_ATLAS_EXP2", 					Controls.IconCurrentContractsHL)
-----------------
-- SORT FUNCTIONS
-----------------
local g_CurrentSortOption = 1
local g_CurrentSortDirection = "asc"
local g_MercenaryContractsShowOnly = "ShowAll"
function SortByContractCivilization(a, b)
	if g_CurrentSortDirection == "asc" then
		return a.CivilizationDesc > b.CivilizationDesc
	else
		return a.CivilizationDesc < b.CivilizationDesc
	end
end
function SortByContractName(a, b)
	if g_CurrentSortDirection == "asc" then
		return Locale.Compare(a.ContractDesc, b.ContractDesc) < 0
	else
		return Locale.Compare(a.ContractDesc, b.ContractDesc) > 0
	end
end
function SortByContractRating(a, b)
	if g_CurrentSortDirection == "asc" then
		return a.ContractRating > b.ContractRating
	else
		return a.ContractRating < b.ContractRating
	end
end
function SortByContractTurns(a, b)
	if g_CurrentSortDirection == "asc" then
		return a.ContractTurns > b.ContractTurns
	else
		return a.ContractTurns < b.ContractTurns
	end
end
function SortByUnitClassDesc(a, b)
	if g_CurrentSortDirection == "asc" then
		return Locale.Compare(a.UnitClassDesc, b.UnitClassDesc) < 0
	else                                                              
		return Locale.Compare(a.UnitClassDesc, b.UnitClassDesc) > 0
	end
end
g_SortOptions = {}
	g_SortOptions["MercenaryContracts"] = {
	{"TXT_KEY_CONTRACT_OVERVIEW_JFD_ALL_SHOW_ONLY",				"ShowAll"},
	{"TXT_KEY_CONTRACT_OVERVIEW_JFD_AIR_SHOW_ONLY",				"ShowOnlyAir"},
	{"TXT_KEY_CONTRACT_OVERVIEW_JFD_EXPEDITION_SHOW_ONLY",		"ShowOnlyExpedition"},
	{"TXT_KEY_CONTRACT_OVERVIEW_JFD_RELIGIOUS_SHOW_ONLY",		"ShowOnlyHolyOrders"},
	{"TXT_KEY_CONTRACT_OVERVIEW_JFD_MELEE_SHOW_ONLY",			"ShowOnlyMelee"},
	{"TXT_KEY_CONTRACT_OVERVIEW_JFD_MERCENARIES_SHOW_ONLY",		"ShowOnlyMercenaries"},
	{"TXT_KEY_CONTRACT_OVERVIEW_JFD_MOUNTED_SHOW_ONLY",			"ShowOnlyMounted"},
	{"TXT_KEY_CONTRACT_OVERVIEW_JFD_NAVAL_SHOW_ONLY",			"ShowOnlyNaval"},
	{"TXT_KEY_CONTRACT_OVERVIEW_JFD_RANGED_SHOW_ONLY",			"ShowOnlyRanged"},
	{"TXT_KEY_CONTRACT_OVERVIEW_JFD_SIEGE_SHOW_ONLY",			"ShowOnlySiege"},}
	g_SortOptions["CurrentContracts"] = {
	{"TXT_KEY_CONTRACT_OVERVIEW_JFD_CIVILIZATION_SORT",			SortByContractCivilization},
	{"TXT_KEY_CONTRACT_OVERVIEW_JFD_CONTRACT_SORT",				SortByContractName},
	{"TXT_KEY_CONTRACT_OVERVIEW_JFD_TURNS_LEFT_SORT",			SortByContractTurns},}

local g_MercSortByPulldown = Controls.MercSortByPullDown
g_MercSortByPulldown:ClearEntries()
for i, v in ipairs(g_SortOptions["MercenaryContracts"]) do
	local Sort_ControlTable = {}
	g_MercSortByPulldown:BuildEntry("InstanceOne", Sort_ControlTable)
	Sort_ControlTable.Button:LocalizeAndSetText(v[1])
	Sort_ControlTable.Button:RegisterCallback(Mouse.eLClick, 
	function()
		g_MercSortByPulldown:GetButton():LocalizeAndSetText(v[1])
		g_MercenaryContractsShowOnly = v[2]
		g_ContractSelectedID = nil
		g_UnitClassSelectedID = nil
		JFD_RTP_Mercenaries_PopulateUnitClasses()
		JFD_RTP_Mercenaries_PopulateContracts()
	end)
end
g_MercSortByPulldown:CalculateInternals()
g_MercSortByPulldown:GetButton():LocalizeAndSetText(g_SortOptions["MercenaryContracts"][g_CurrentSortOption][1])

local g_CurrentSortByPulldown = Controls.CurrentSortByPullDown
g_CurrentSortByPulldown:ClearEntries()
for i, v in ipairs(g_SortOptions["CurrentContracts"]) do
	local Sort_ControlTable = {}
	g_CurrentSortByPulldown:BuildEntry("InstanceOne", Sort_ControlTable)
	Sort_ControlTable.Button:LocalizeAndSetText(v[1])
	Sort_ControlTable.Button:RegisterCallback(Mouse.eLClick, 
	function()
		g_CurrentSortByPulldown:GetButton():LocalizeAndSetText(v[1])
		g_CurrentSortOption = i
		g_CurrentSortDirection = "asc"
		JFD_RTP_Mercenaries_PopulateCurrentContracts()
	end)
	Sort_ControlTable.Button:RegisterCallback(Mouse.eRClick, 
	function()
		g_CurrentSortByPulldown:GetButton():LocalizeAndSetText(v[1])
		g_CurrentSortOption = i
		g_CurrentSortDirection = "desc"
		JFD_RTP_Mercenaries_PopulateCurrentContracts()
	end)
end
g_CurrentSortByPulldown:CalculateInternals()
g_CurrentSortByPulldown:GetButton():LocalizeAndSetText(g_SortOptions["CurrentContracts"][g_CurrentSortOption][1])	
-----------------
-- PEDIA CALLBACK (EUI)
-----------------
CivilopediaControl = "/FrontEnd/MainMenu/Other/Civilopedia"

local getPedia

local function getPediaB(...)
	Events.SearchForPediaEntry(...)
end

local function getPediaA(...)
	UIManager:QueuePopup(LookUpControl(CivilopediaControl), PopupPriority.eUtmost)
	getPedia = getPediaB
	getPedia(...)
end

getPedia = CivilopediaControl and getPediaA
-----------------
-----------------
local showOnlyMyContracts	 = false
local showOnlyWarContracts	 = false
local showAffordedContracts	 = false
local showDetailedontracts	 = false

-- Used for Piano Keys
local ltBlue = {19/255,32/255,46/255,120/255}
local dkBlue = {12/255,22/255,30/255,120/255}

local currentContractsManager	= InstanceManager:new("CurrentContractsInstance",		"CurrentContractsButton",		Controls.CurrentStack)
local mercenaryContractsManager = InstanceManager:new("MercenaryContractsInstance", 	"MercenaryContractsButton", 	Controls.MercenaryContractsStack)
local mercenaryPromotionsStack	= InstanceManager:new("MercenaryPromotionInstance",		"MercenaryPromotionContainer",	Controls.MercenaryPromotionStack)
local mercenaryUnitsManager 	= InstanceManager:new("MercenaryUnitsInstance", 		"MercenaryUnitsButton", 		Controls.MercenaryUnitsStack)

-- JFD_RTP_Mercenaries_UpdateDisplays
function JFD_RTP_Mercenaries_UpdateDisplays()
	JFD_RTP_Mercenaries_PopulateContractOverview()
	JFD_RTP_Mercenaries_PopulateCurrentContracts()
	JFD_RTP_Mercenaries_PopulateContracts()
	JFD_RTP_Mercenaries_PopulateUnitClasses()
end

-- JFD_RTP_Mercenaries_ResetContractOverview
function JFD_RTP_Mercenaries_ResetContractOverview()
	g_ContractSelectedID  = nil
	g_UnitSelectedID 	  = nil
	g_UnitClassSelectedID = nil
	mercenaryContractsManager:ResetInstances()
	mercenaryPromotionsStack:ResetInstances()
	Controls.Rating:SetHide(true)
	Controls.Help:SetHide(true)
	Controls.Pedia:SetHide(true)
	Controls.Button1:SetHide(true)
	Controls.Button2:SetHide(true)
	Controls.Button3:SetHide(true)
	Controls.Desc:LocalizeAndSetText("TXT_KEY_JFD_CONTRACT_OVERVIEW_DESC")
	Controls.OverviewFrame:LocalizeAndSetToolTip(nil)
	IconHookup(0, 128, "JFD_POUAKAI_MERCENARY_TECH_ATLAS", Controls.OverviewIcon)
end

--JFD_RTP_Mercenaries_PopulateUnitClasses
local mercenaryContractsUnitCombats = {}
	mercenaryContractsUnitCombats["ShowOnlyAir"] 		 = {"UNITCOMBAT_BOMBER", 	 "UNITCOMBAT_FIGHTER", 		"UNITCOMBAT_HELICOPTER"}
	mercenaryContractsUnitCombats["ShowOnlyExpedition"]  = {"UNITCOMBAT_RECON", 	 "UNITCOMBAT_CIVILIAN", 	'UNITCOMBAT_GREAT_PEOPLE'}
	mercenaryContractsUnitCombats["ShowOnlyMelee"] 		 = {"UNITCOMBAT_MELEE", 	 "UNITCOMBAT_GUN"}
	mercenaryContractsUnitCombats["ShowOnlyMercenaries"] = {"UNITCOMBAT_MELEE", 	 "UNITCOMBAT_GUN",			"UNITCOMBAT_NAVALRANGED", 	"UNITCOMBAT_NAVALMELEE"}
	mercenaryContractsUnitCombats["ShowOnlyMounted"] 	 = {"UNITCOMBAT_RECON",  	 "UNITCOMBAT_MOUNTED",	 	"UNITCOMBAT_ARMOR"}
	mercenaryContractsUnitCombats["ShowOnlyNaval"] 		 = {"UNITCOMBAT_NAVALMELEE", "UNITCOMBAT_NAVALRANGED", 	"UNITCOMBAT_CARRIER", "UNITCOMBAT_SUBMARINE"}
	mercenaryContractsUnitCombats["ShowOnlyRanged"] 	 = {"UNITCOMBAT_ARCHER", 	 "UNITCOMBAT_SIEGE"}
	mercenaryContractsUnitCombats["ShowOnlySiege"] 		 = {"UNITCOMBAT_SIEGE"}
local resolutionMercenariesID = GameInfoTypes["RESOLUTION_JFD_MERCENARIES"]
function JFD_RTP_Mercenaries_PopulateUnitClasses()
	g_CurrentTab = "MercenaryContracts"
	if (resolutionMercenariesID and Game.IsResolutionPassed(resolutionMercenariesID, -1)) then
		mercenaryUnitsManager:ResetInstances()
		Controls.NoUnitsStack:LocalizeAndSetText("TXT_KEY_CONTRACT_OVERVIEW_JFD_MERCENARY_BANNED")
		Controls.NoUnitsStack:SetHide(false)
	else
		if JFD_CanTakeContracts(activePlayerID, false) then
			mercenaryUnitsManager:ResetInstances()
			local mercenaryUnitClassInfos = {}
			for _, v in ipairs(Game.GetInactiveContractUnitList()) do
				local contract = {ID = v.Contract, UnitID = v.Unit, NumUnit = v.NumUnits}
				local contractID = contract.ID
				local contractInfo = GameInfo.Contracts[contractID]
				local unitID = contract.UnitID
				local unit = GameInfo.Units[unitID]	
				local unitClass = GameInfo.UnitClasses[unit.Class]
				local unitCombat = unit.CombatClass
				local unitClassHasContract = false
				local insertIntoTable = true
				for _, class in ipairs(mercenaryUnitClassInfos) do
					if class.UnitClassID == unitClass.ID then							
						insertIntoTable = false
						break
					end
				end
				if insertIntoTable then
					if g_MercenaryContractsShowOnly ~= "ShowAll" then
						if g_MercenaryContractsShowOnly == "ShowOnlyHolyOrders" then
							local canHaveContract, canShowContract = JFD_CanHaveContract(activePlayerID, contractID, unitID)
							if ((not contractInfo.IsHolyOrder) or (not JFD_CanTakeContracts(activePlayerID, true)) or (not canShowContract)) then
								insertIntoTable = false
							else
								insertIntoTable = true
							end
						elseif (g_MercenaryContractsShowOnly == "ShowOnlyMercenaries" and (not unit.JFD_OnlyMercenary)) then
							insertIntoTable = false
						else
							for _,combatClass in pairs(mercenaryContractsUnitCombats[g_MercenaryContractsShowOnly]) do
								if (combatClass == "UNITCOMBAT_SIEGE" and (unit.IsSiege or unitCombat == combatClass)) then
									insertIntoTable = true
									break
								elseif (combatClass == "UNITCOMBAT_MOUNTED" and (unit.IsMounted == 1 or unitCombat == combatClass)) then
									insertIntoTable = true
									break
								elseif (unit.CombatClass == combatClass and (not unit.IsSiege)) then
									insertIntoTable = true
									break
								else
									insertIntoTable = false
								end
							end
						end
					end
				end
				if insertIntoTable then
					table.insert(mercenaryUnitClassInfos, {
					UnitClassID = unitClass.ID,
					UnitClassDesc = unitClass.Description,
					UnitID = unit.ID,});
				end
			end 
			if(#mercenaryUnitClassInfos > 0) then
				table.sort(mercenaryUnitClassInfos, SortByUnitClassDesc)
				for _,unitInfo in ipairs(mercenaryUnitClassInfos) do
					local unitInstance = mercenaryUnitsManager:GetInstance()
					local unitID = unitInfo.UnitID
					local unit = GameInfo.Units[unitID]
					local unitClassID = unitInfo.UnitClassID
					local unitClass = GameInfo.UnitClasses[unitClassID]
					local unitDefault = GameInfo.Units[unitClass.DefaultUnit]
					IconHookup(unitDefault.PortraitIndex, 64, unitDefault.IconAtlas, unitInstance.UnitIconBG)
					unitInstance.MercenaryUnitBox:SetColorVal(unpack(dkBlue))
					if g_UnitClassSelectedID == unitClassID then
						unitInstance.MercenaryUnitBoxHL:SetHide(false)
					else
						unitInstance.MercenaryUnitBoxHL:SetHide(true)
					end
					unitInstance.MercenaryUnitsDesc:LocalizeAndSetText(unitClass.Description)
					unitInstance.MercenaryUnitsButton:RegisterCallback(Mouse.eLClick, 
					function()
						g_UnitClassSelectedID = unitClassID
						JFD_RTP_Mercenaries_PopulateUnitClasses()
						JFD_RTP_Mercenaries_PopulateContracts()
					end)
				end
				Controls.NoUnitsStack:SetHide(true)
			else
				if g_MercenaryContractsShowOnly == "ShowOnlyHolyOrders" then
					Controls.NoUnitsStack:LocalizeAndSetText("TXT_KEY_CONTRACT_OVERVIEW_JFD_AVAILABLE_NONE_HOLY_ORDERS")
				else
					Controls.NoUnitsStack:LocalizeAndSetText("TXT_KEY_CONTRACT_OVERVIEW_JFD_AVAILABLE_NONE")
				end
				Controls.NoUnitsStack:SetHide(false)
			end
			Controls.MercenaryUnitsStack:CalculateSize()
			Controls.MercenaryUnitsStack:ReprocessAnchoring()
			Controls.UnitscrollPanel:CalculateInternalSize()
		else
			Controls.NoUnitsStack:LocalizeAndSetText("TXT_KEY_CONTRACT_OVERVIEW_JFD_MERCENARY_DISABLED")
			Controls.NoUnitsStack:SetHide(false)
		end
	end
	Controls.NoUnitsStack:ReprocessAnchoring()
end
g_Tabs["MercenaryContracts"].RefreshContent = JFD_RTP_Mercenaries_PopulateContracts

--JFD_RTP_Mercenaries_PopulateContracts
function JFD_RTP_Mercenaries_PopulateContracts()
	mercenaryContractsManager:ResetInstances()
	if g_UnitClassSelectedID then
		local mercenaryContracts = {}
		for _, v in ipairs(Game.GetInactiveContractUnitList()) do
			local contract = {ID = v.Contract, UnitID = v.Unit, NumUnit = v.NumUnits}
			local contractID = contract.ID
			local contractUnitID = contract.UnitID
			local contractUnit = GameInfo.Units[contractUnitID]
			local contractUnitClassID = GameInfoTypes[contractUnit.Class]
			if contractUnitClassID == g_UnitClassSelectedID then
				local contractInfo = GameInfo.Contracts[contractID]
				local canHaveContract, canShowContract = JFD_CanHaveContract(activePlayerID, contractID, contractUnitID)
				local contractCost = JFD_GetContractCost(activePlayerID, contractID, contractUnitID)
				local contractDesc = contract.Description
				if (showAffordedContracts and (not canHaveContract)) then canShowContract = false end
				if (g_MercenaryContractsShowOnly == "ShowOnlyHolyOrders" and (not contractInfo.IsHolyOrder)) then canShowContract = false end
				if canShowContract then
					table.insert(mercenaryContracts, {
					ContractID = contractID,
					ContractCost = contractCost,
					ContractRating = contractInfo.Rating,
					UnitID = contractUnitID,});
				end
			end
		end
		if(#mercenaryContracts > 0) then
			table.sort(mercenaryContracts, SortByContractRating)
			for _,contract in ipairs(mercenaryContracts) do
				local contractInstance = mercenaryContractsManager:GetInstance()
				local contractID = contract.ContractID
				local contractInfo = GameInfo.Contracts[contractID]
				local contractCost = contract.ContractCost
				local contractMaintenance = contractInfo.Maintenance
				local contractRating = contractInfo.Rating
				local contractYieldText = contractInfo.YieldText
				local contractUnitID = contract.UnitID
				local contractUnit = GameInfo.Units[contractUnitID]
				local contractUnitCount = Game.GetContractUnits(contractID, contractUnitID)
				local contractUnitLevel = contractRating
				local canHaveContract, canSeeContract, disabledTT = JFD_CanHaveContract(activePlayerID, contractID, contractUnitID, false, false, true)
				local contractRatingText = ""
				for value = 1, contractRating do
					contractRatingText = contractRatingText .. "[ICON_CAPITAL]"
				end
				if (not canHaveContract) then
					contractInstance.MercenaryContractsBox:SetColorVal(unpack(dkBlue))
					contractInstance.MercenaryContractsDisable:SetHide(false)
					if disabledTT then contractInstance.MercenaryContractsBox:SetToolTipString(disabledTT) end
				else
					contractInstance.MercenaryContractsBox:SetColorVal(unpack(ltBlue))
					contractInstance.MercenaryContractsDisable:SetHide(true)
					contractInstance.MercenaryContractsBox:SetToolTipString(nil)
				end
				local contractNameText 	  = "[COLOR_UNIT_TEXT]" .. convertTextKey(contractInfo.Description) .. "[ENDCOLOR]" .. " (" .. contractRatingText ..")"
				local contractDetailsText = convertTextKey(contractUnit.Description) .. " (" .. contractCost .. contractYieldText .. ")"
				if showDetailedontracts then
					contractNameText 	= "[COLOR_UNIT_TEXT]" .. convertTextKey(contractInfo.Description) .. "[ENDCOLOR]" .. " (" .. contractRatingText ..")" .. " (" .. Locale.ConvertTextKey("TXT_KEY_JFD_CONTRACT_OVERVIEW_MAINTENANCE_PER_TURN_LABEL", contractMaintenance) .. ")"
					contractDetailsText = contractUnitCount .. "x " .. "Lv. " .. contractUnitLevel .. " " .. convertTextKey(contractUnit.Description) .. " (" .. contractCost .. contractYieldText ..")"
				end
				contractInstance.MercenaryContractsBoxHL:SetHide(true)
				contractInstance.MercenaryContractsName:SetText(contractNameText)
				contractInstance.MercenaryContractsDetails:SetText(contractDetailsText)
				if g_ContractSelectedID == contractID then
					contractInstance.MercenaryContractsBoxHL:SetHide(false)
				else
					contractInstance.MercenaryContractsBoxHL:SetHide(true)
				end
				contractInstance.MercenaryContractsButton:RegisterCallback(Mouse.eLClick, 
				function()
					g_ContractSelectedID = contractID
					g_UnitSelectedID = contractUnitID
					JFD_RTP_Mercenaries_PopulateContractOverview()
					JFD_RTP_Mercenaries_PopulateContracts()
				end)
			end
			Controls.NoMercenaryContractsStack:SetHide(true)
		else
			Controls.NoMercenaryContractsStack:LocalizeAndSetText("TXT_KEY_CONTRACT_OVERVIEW_JFD_MERCENARY_SELECTION")
			Controls.NoMercenaryContractsStack:SetHide(false)
		end
		Controls.MercenaryContractsStack:CalculateSize()
		Controls.MercenaryContractsStack:ReprocessAnchoring()
		Controls.MercenaryContractsScrollPanel:CalculateInternalSize()
	else
		Controls.NoMercenaryContractsStack:LocalizeAndSetText("TXT_KEY_CONTRACT_OVERVIEW_JFD_MERCENARY_NO_SELECTION")
		Controls.NoMercenaryContractsStack:SetHide(false)
	end
end	
g_Tabs["MercenaryContracts"].RefreshContent = JFD_RTP_Mercenaries_PopulateContracts

--JFD_RTP_Mercenaries_PopulateContractOverview
function JFD_RTP_Mercenaries_PopulateContractOverview()
	ContextPtr:SetHide(false)
	--Populate Contract Overview
	mercenaryPromotionsStack:ResetInstances()
	if (not g_ContractSelectedID) or (not g_UnitClassSelectedID) or (not g_UnitSelectedID) then
		JFD_RTP_Mercenaries_ResetContractOverview()
	else
		local contract = GameInfo.Contracts[g_ContractSelectedID]
		local contractPediaText = ("-----------------" .. "[NEWLINE]" .. convertTextKey(contract.Civilopedia))
		if g_UnitSelectedID then
			local contractCost, contractCostBreak, contractCostExtend = JFD_GetContractCost(activePlayerID, g_ContractSelectedID, g_UnitSelectedID)
			local contractUnit = GameInfo.Units[g_UnitSelectedID]
			local contractYieldText = contract.YieldText
			local overviewText = JFD_GetContractOverviewText(activePlayerID, g_ContractSelectedID, g_UnitSelectedID)
			IconHookup(contractUnit.PortraitIndex, 128, contractUnit.IconAtlas, Controls.OverviewIcon)
			Controls.OverviewFrame:LocalizeAndSetToolTip(GetHelpTextForUnit(g_UnitSelectedID, true))
			local contractRatingText = "" 
			for value = 1, contract.Rating do
				contractRatingText = contractRatingText .. "[ICON_CAPITAL]"
			end
			Controls.Desc:SetText("[COLOR_UNIT_TEXT]" .. Locale.ToUpper(contract.Description) .. "[ENDCOLOR]")
			Controls.Rating:SetHide(false)
			Controls.Rating:SetText(contractRatingText)
			Controls.Help:SetHide(false)
			Controls.Help:SetText(overviewText)
			Controls.Pedia:SetHide(false)
			Controls.Pedia:SetText(contractPediaText)
			for value = 1, 1 do
				local promotionInstance = mercenaryPromotionsStack:GetInstance()
				local unitPromotion = GameInfo.UnitPromotions[contract.PromotionType]
				IconHookup(unitPromotion.PortraitIndex, 32, unitPromotion.IconAtlas, promotionInstance.MercenaryPromotionImage)
				promotionInstance.MercenaryPromotionContainer:SetToolTipString(convertTextKey(unitPromotion.Description) .. "[NEWLINE][NEWLINE]" .. convertTextKey(unitPromotion.Help))	
			end
			for row in GameInfo.Unit_FreePromotions("UnitType = '" .. contractUnit.Type .. "'") do
				local promotionInstance = mercenaryPromotionsStack:GetInstance()
				local unitPromotion = GameInfo.UnitPromotions[row.PromotionType]
				IconHookup(unitPromotion.PortraitIndex, 32, unitPromotion.IconAtlas, promotionInstance.MercenaryPromotionImage)
				promotionInstance.MercenaryPromotionContainer:SetToolTipString(convertTextKey(unitPromotion.Description) .. "[NEWLINE][NEWLINE]" .. convertTextKey(unitPromotion.Help))	
			end
			if contractUnit.Combat > 0 then
				for value = 1, contract.Rating do
					local promotionInstance = mercenaryPromotionsStack:GetInstance()
					local contractPromotionID = GameInfoTypes["PROMOTION_JFD_MERCENARY_" .. value]
					local unitPromotion = GameInfo.UnitPromotions[contractPromotionID]
					IconHookup(unitPromotion.PortraitIndex, 32, unitPromotion.IconAtlas, promotionInstance.MercenaryPromotionImage)
					promotionInstance.MercenaryPromotionContainer:SetToolTipString(convertTextKey(unitPromotion.Description) .. "[NEWLINE][NEWLINE]" .. convertTextKey(unitPromotion.Help))	
				end
			end
			if activePlayer:PlayerHasContract(g_ContractSelectedID) then
				local canBreakContract, canExtendContract = JFD_CanHaveContract(activePlayerID, g_ContractSelectedID, g_UnitSelectedID, true, true)
				local breakContractText  = convertTextKey("TXT_KEY_JFD_CONTRACT_BUTTON_FIRE",   contractCostBreak, contractYieldText)
				local extendContractText = convertTextKey("TXT_KEY_JFD_CONTRACT_BUTTON_EXTEND", defineMercenariesExtendTurns, contractCostExtend, contractYieldText)
				Controls.Button1:SetHide(true)
				Controls.Button2:SetHide(false)
				Controls.Button3:SetHide(false)
				if canBreakContract then
					Controls.Button2:SetDisabled(false)
					Controls.Button2Disable:SetHide(true)
				else
					breakContractText = "[COLOR_FADING_NEGATIVE_TEXT]" .. breakContractText .. "[ENDCOLOR]"
					Controls.Button2:SetDisabled(true)
					Controls.Button2Disable:SetHide(false)
				end
				Controls.Button2:SetText(breakContractText)
				Controls.Button2:LocalizeAndSetToolTip("TXT_KEY_JFD_CONTRACT_BUTTON_FIRE_TT", contract.MutinyChance)
				if canExtendContract then
					Controls.Button3:SetDisabled(false)
					Controls.Button3Disable:SetHide(true)
				else
					extendContractText = "[COLOR_FADING_NEGATIVE_TEXT]" .. extendContractText .. "[ENDCOLOR]"
					Controls.Button3:SetDisabled(true)
					Controls.Button3Disable:SetHide(false)
				end
				Controls.Button3:SetText(extendContractText)
				Controls.Button3:LocalizeAndSetToolTip("TXT_KEY_JFD_CONTRACT_BUTTON_EXTEND_TT", defineMercenariesExtendTurns)
			else
				if Game.IsContractActive(g_ContractSelectedID) then
					Controls.Button1:SetHide(true)
				else
					local canHaveSelectedContract = JFD_CanHaveContract(activePlayerID, g_ContractSelectedID, g_UnitSelectedID)
					local buttonText = convertTextKey("TXT_KEY_JFD_CONTRACT_BUTTON_HIRE", contractCost, contractYieldText)
					local buttonTT   = convertTextKey("TXT_KEY_JFD_CONTRACT_BUTTON_HIRE_TT")
					if (not canHaveSelectedContract) then
						buttonText = "[COLOR_FADING_NEGATIVE_TEXT]" .. buttonText .. "[ENDCOLOR]"
						buttonTT   = convertTextKey("TXT_KEY_JFD_CONTRACT_BUTTON_HIRE_TT_DISABLED")
					end
					Controls.Button1:SetHide(false)
					Controls.Button1:SetDisabled(not canHaveSelectedContract)
					Controls.Button1Disable:SetHide(canHaveSelectedContract)
					Controls.Button1:SetText(buttonText)
					Controls.Button1:LocalizeAndSetToolTip(buttonTT)
				end
				Controls.Button2:SetHide(true)
				Controls.Button3:SetHide(true)
			end
		end
	end
end

--JFD_RTP_Mercenaries_PopulateCurrentContracts
local defineMaxMinorCivs = GameDefines["MAX_MINOR_CIVS"]
function JFD_RTP_Mercenaries_PopulateCurrentContracts()
	g_CurrentTab = "CurrentContracts"
	currentContractsManager:ResetInstances()
	local currentContracts = {}
	for _, v in ipairs(Game.GetActiveContractUnitList()) do
		local contract = {ID = v.Contract, UnitID = v.Unit, NumUnit = v.NumUnits}
		local insertIntoTable = true
		for playerID = 0, defineMaxMinorCivs - 1 do
			local player = Players[playerID]
			if (player:IsAlive() and player:PlayerHasContract(contract.ID)) then
				if (showOnlyMyContracts and playerID ~= activePlayerID) then
					insertIntoTable = false
				end
				if (showOnlyWarContracts and (not activePlayer:IsAtWarWith(playerID))) then
					insertIntoTable = false
				end
				if insertIntoTable then
					table.insert(currentContracts, {
					ContractID 		 = contract.ID,
					ContractDesc 	 = Locale.ConvertTextKey(GameInfo.Contracts[contract.ID].Description),
					PlayerID 		 = playerID,
					CivilizationDesc = Locale.Lookup(player:GetCivilizationDescription()),
					ContractTurns 	 = player:GetContractTurnsRemaining(contract.ID),
					ContractUnitID	 = contract.UnitID});
				end
			end
		end
	end
	if(#currentContracts > 0) then
		table.sort(currentContracts, g_SortOptions["CurrentContracts"][g_CurrentSortOption][2])
		for _,contract in ipairs(currentContracts) do
			local contractInstance = currentContractsManager:GetInstance()
			local contractID = contract.ContractID
			local contractInfo = GameInfo.Contracts[contractID]
			local contractDesc = contract.ContractDesc
			local contractTurns = contract.ContractTurns
			local contractPlayerID = contract.PlayerID
			local contractPlayer = Players[contractPlayerID]
			local contractUnitID = contract.ContractUnitID
			local contractUnitClassID = GameInfo.Units[contractUnitID].Class
			if (not activeTeam:IsHasMet(contractPlayer:GetTeam())) then contractID = -1 end
			CivIconHookup(contractPlayerID, 32, contractInstance.CivIcon, contractInstance.CivIconBG, contractInstance.CivIconShadow, false, true)
			if (contractPlayerID == activePlayerID or activePlayer:HasEmbassyWith(contractPlayerID)) then
				contractInstance.CurrentContractsName:SetText("[COLOR_UNIT_TEXT]" 			.. contractDesc .. "[ENDCOLOR] (" .. Locale.ConvertTextKey("TXT_KEY_JFD_CONTRACT_OVERVIEW_TURNS_LABEL", contractTurns) .. ")")
				contractInstance.CurrentContractsName:LocalizeAndSetToolTip("TXT_KEY_JFD_CONTRACT_OVERVIEW_CURRENT_OWNER_TT", contractDesc, contractTurns, contractPlayer:GetCivilizationShortDescription())
				contractInstance.CurrentContractsBox:SetHide(false)
			else
				contractInstance.CurrentContractsName:LocalizeAndSetText("[COLOR_UNIT_TEXT]" .. contractDesc .. "[ENDCOLOR]")
				contractInstance.CurrentContractsName:SetToolTipString("[COLOR_UNIT_TEXT]" 			.. contractDesc .. "[ENDCOLOR] ([COLOR_POSITIVE_TEXT]" .. contractPlayer:GetCivilizationShortDescription() .. "[ENDCOLOR])")
				contractInstance.CurrentContractsBox:SetHide(true)
			end
			contractInstance.CurrentContractsBoxHL:SetHide(true)
			if g_ContractSelectedID == contractID then
				contractInstance.CurrentContractsBoxHL:SetHide(false)
			else
				contractInstance.CurrentContractsBoxHL:SetHide(true)
			end
			contractInstance.CurrentContractsButton:RegisterCallback(Mouse.eLClick, 
			function()
				g_ContractSelectedID = contractID
				g_UnitSelectedID = contractUnitID
				g_UnitClassSelectedID = contractUnitClassID
				JFD_RTP_Mercenaries_PopulateContractOverview()
				JFD_RTP_Mercenaries_PopulateCurrentContracts()
			end)
		end
		Controls.NoContracts:SetHide(true)
	else
		Controls.NoContracts:LocalizeAndSetText("TXT_KEY_CONTRACT_OVERVIEW_JFD_CURRENT_NONE")
		Controls.NoContracts:SetHide(false)
	end				
	Controls.CurrentStack:CalculateSize()
	Controls.CurrentStack:ReprocessAnchoring()
	Controls.CurrentScrollPanel:CalculateInternalSize()
end
g_Tabs["CurrentContracts"].RefreshContent = JFD_RTP_Mercenaries_PopulateCurrentContracts
---------------------------
-- OPTIONS
---------------------------
--JFD_RTP_Mercenaries_ShowOnlyAfforded
function JFD_RTP_Mercenaries_ShowOnlyAfforded(isChecked)
	showAffordedContracts = isChecked
	JFD_RTP_Mercenaries_PopulateContracts()
	JFD_RTP_Mercenaries_PopulateUnitClasses()
end
if userSettingMercenariesCore then
	Controls.ShowAffordCheckMerc:RegisterCheckHandler(JFD_RTP_Mercenaries_ShowOnlyAfforded)
	Controls.ShowAffordCheckLoan:RegisterCheckHandler(JFD_RTP_Mercenaries_ShowOnlyAfforded)
end

--JFD_RTP_Mercenaries_ShowDetail
function JFD_RTP_Mercenaries_ShowDetail(isChecked)
	showDetailedontracts = isChecked
	JFD_RTP_Mercenaries_PopulateContracts()
	JFD_RTP_Mercenaries_PopulateUnitClasses()
end
if userSettingMercenariesCore then
	Controls.ShowDetailCheckMerc:RegisterCheckHandler(JFD_RTP_Mercenaries_ShowDetail)
	Controls.ShowDetailCheckLoan:RegisterCheckHandler(JFD_RTP_Mercenaries_ShowDetail)
end

--JFD_RTP_Mercenaries_OnShowAllContracts
function JFD_RTP_Mercenaries_OnShowAllContracts(isChecked)
	showOnlyMyContracts = isChecked
	JFD_RTP_Mercenaries_PopulateCurrentContracts()
end
if userSettingMercenariesCore then
	Controls.ShowAllCheck:RegisterCheckHandler(JFD_RTP_Mercenaries_OnShowAllContracts)
end

--JFD_RTP_Mercenaries_OnShowWarContracts
function JFD_RTP_Mercenaries_OnShowWarContracts(isChecked)
	showOnlyWarContracts = isChecked
	JFD_RTP_Mercenaries_PopulateCurrentContracts()
end
if userSettingMercenariesCore then
	Controls.ShowWarCheck:RegisterCheckHandler(JFD_RTP_Mercenaries_OnShowWarContracts)
end
---------------------------
-- CONTRACT
---------------------------
--JFD_RTP_Mercenaries_StartContract
local isBreaking  = false
local isHiring    = true
local isExtending = true
function JFD_RTP_Mercenaries_StartContract()
	isBreaking  = false
	isHiring    = true
	isExtending = false
	Controls.Confirm:SetHide(false)
	Controls.LabelConfirm:LocalizeAndSetText("TXT_KEY_CONTRACT_OVERVIEW_CONFIRM_JFD_CONTRACT_HIRE")
end
if userSettingMercenariesCore then
	Controls.Button1:RegisterCallback(Mouse.eLClick, JFD_RTP_Mercenaries_StartContract)
end

--JFD_RTP_Mercenaries_EndContract
function JFD_RTP_Mercenaries_EndContract()
	isBreaking  = true
	isHiring    = false
	isExtending = false
	Controls.Confirm:SetHide(false)
	Controls.LabelConfirm:LocalizeAndSetText("TXT_KEY_CONTRACT_OVERVIEW_CONFIRM_JFD_CONTRACT_FIRE")
end
if userSettingMercenariesCore then
	Controls.Button2:RegisterCallback(Mouse.eLClick, JFD_RTP_Mercenaries_EndContract)
end

--JFD_RTP_Mercenaries_ExtendContract
function JFD_RTP_Mercenaries_ExtendContract()
	isBreaking  = false
	isHiring    = false
	isExtending = true
	Controls.Confirm:SetHide(false)
	Controls.LabelConfirm:LocalizeAndSetText("TXT_KEY_CONTRACT_OVERVIEW_CONFIRM_JFD_CONTRACT_EXTEND")
end
if userSettingMercenariesCore then
	Controls.Button3:RegisterCallback(Mouse.eLClick, JFD_RTP_Mercenaries_ExtendContract)
end

--JFD_RTP_Mercenaries_OnYes
function JFD_RTP_Mercenaries_OnYes()
	Controls.Confirm:SetHide(true)
	if isHiring then
		activePlayer:StartContract(g_ContractSelectedID)
	elseif isBreaking then
		LuaEvents.JFD_ContractBroken(activePlayerID, g_ContractSelectedID)
	elseif isExtending then
		LuaEvents.JFD_ContractExtended(activePlayerID, g_ContractSelectedID)
	end
	JFD_RTP_Mercenaries_UpdateDisplays()
end
if userSettingMercenariesCore then
	Controls.ConfirmYes:RegisterCallback(Mouse.eLClick, JFD_RTP_Mercenaries_OnYes)
end

--JFD_RTP_Mercenaries_OnNo
function JFD_RTP_Mercenaries_OnNo()
	Controls.Confirm:SetHide(true)
end
if userSettingMercenariesCore then
	Controls.ConfirmNo:RegisterCallback(Mouse.eLClick, JFD_RTP_Mercenaries_OnNo)
end

--JFD_RTP_Mercenaries_OnClose
function JFD_RTP_Mercenaries_OnClose()
	ContextPtr:SetHide(true)
end
if userSettingMercenariesCore then
	Controls.CloseButton:RegisterCallback(Mouse.eLClick, JFD_RTP_Mercenaries_OnClose)
end
----------------------------------------------------------------
-- 'Active' (local human) player has changed
----------------------------------------------------------------
function OnActivePlayerChanged()
	JFD_RTP_Mercenaries_OnClose()
end
if userSettingMercenariesCore then
	Events.GameplaySetActivePlayer.Add(OnActivePlayerChanged)
end
--------------------------------------------------------------------
function InputHandler(uiMsg, wParam, lParam)
	if (uiMsg == KeyEvents.KeyDown) then
		if (wParam == Keys.VK_ESCAPE) then
			JFD_RTP_Mercenaries_OnClose()
			return true
		end
	end
end
ContextPtr:SetHide(true)
-- Register tabbing behavior and assign global TabSelect routine.
if userSettingMercenariesCore then
	ContextPtr:SetInputHandler(InputHandler)
	TabSelect = RegisterTabBehavior(g_Tabs, g_Tabs["MercenaryContracts"]);
end
------------------------------------------------------------------------------------------------------------------------
-- DROP-DOWN
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Mercenaries_ShowMercenaryOverview
function JFD_RTP_Mercenaries_ShowMercenaryOverview()
	JFD_RTP_Mercenaries_UpdateDisplays()
end
LuaEvents.JFD_RTP_Mercenaries_ShowMercenaryOverview.Add(JFD_RTP_Mercenaries_ShowMercenaryOverview)

-- OnAdditionalInformationDropdownGatherEntries 
function OnAdditionalInformationDropdownGatherEntries(additionalEntries)
	table.insert(additionalEntries,
	{text = Locale.ConvertTextKey("TXT_KEY_JFD_CONTRACTS_OVERVIEW_DROPDOWN"), 
	art = "DC45_Mercenaries.dds",
    call = JFD_RTP_Mercenaries_UpdateDisplays})
end
if userSettingMercenariesCore then
	LuaEvents.AdditionalInformationDropdownGatherEntries.Add(OnAdditionalInformationDropdownGatherEntries)
	LuaEvents.RequestRefreshAdditionalInformationDropdownEntries()
end
------------------------------------------------------------------------------------------------------------------------
-- INIT
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Mercenaries_LoadScreenClose
function JFD_RTP_Mercenaries_LoadScreenClose()
	if JFD_CanTakeContracts(activePlayerID) then
		local isNewGame = true
		for _, contract in ipairs(Game.GetInactiveContractUnitList()) do
			if contract then
				isNewGame = false
				break
			end
		end
		if isNewGame then
			JFD_RTP_Mercenaries_ContractsUpdated()
		end
	end
end
if userSettingMercenariesCore then
	Events.LoadScreenClose.Add(JFD_RTP_Mercenaries_LoadScreenClose)
end
--=======================================================================================================================
--=======================================================================================================================