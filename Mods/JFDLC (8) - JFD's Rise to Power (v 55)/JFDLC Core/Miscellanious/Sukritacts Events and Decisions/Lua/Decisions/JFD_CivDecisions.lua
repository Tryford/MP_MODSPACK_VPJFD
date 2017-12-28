-- Civ Specific Decisions
-- Author: Sukritact
--=======================================================================================================================

print("Civ Specific Decisions: loaded")

--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingsCIDColoniesCore		 	 = (Game.GetUserSetting("JFD_CID_COLONIES_CORE") == 1)
local userSettingsCIDInvestmentsCore		 = (Game.GetUserSetting("JFD_CID_INVESTMENTS_CORE") == 1)
local userSettingsCIDLoyaltyCore			 = (Game.GetUserSetting("JFD_CID_LOYALTY_CORE") == 1)
local userSettingsRTPClaimsCore 			 = (Game.GetUserSetting("JFD_RTP_CLAIMS_CORE") == 1)
local userSettingsRTPEpithetsCore 			 = (Game.GetUserSetting("JFD_RTP_EPITHETS_CORE") == 1)
local userSettingsRTPPietyInquisitionCore 	 = (Game.GetUserSetting("JFD_RTP_PIETY_NATIONAL_WONDER_ADDITIONS_INQUISITION") == 1)
local userSettingsRTPSovereigntyCore	 	 = (Game.GetUserSetting("JFD_RTP_SOVEREIGNTY_CORE") == 1)
local userSettingsRTPSupplyGenerals	 		 = (Game.GetUserSetting("JFD_RTP_SUPPLY_SPECIALIST_ADDITIONS_GENERALS") == 1)
local userSettingsPITInnovationsCore 		 = (Game.GetUserSetting("JFD_PIT_INNOVATIONS_CORE") == 1)
local userSettingsPITProgressCore 	 		 = (Game.GetUserSetting("JFD_PIT_PROGRESS_CORE") == 1)
local userSettingsSDTalentsCore 	 		 = (Game.GetUserSetting("JFD_SD_TALENTS_CORE") == 1)
--=======================================================================================================================
-- GLOBALS
--=======================================================================================================================
local defineMaxMajorCivs	= GameDefines["MAX_MAJOR_CIVS"]
local defineMaxMinorCivs	= GameDefines["MAX_MINOR_CIVS"]

local eraClassicalID		= GameInfoTypes["ERA_CLASSICAL"]
local eraIndustrialID		= GameInfoTypes["ERA_INDUSTRIAL"]
local eraMedievalID			= GameInfoTypes["ERA_MEDIEVAL"]
local eraModernID			= GameInfoTypes["ERA_MODERN"]
local eraRenaissanceID		= GameInfoTypes["ERA_RENAISSANCE"]
local eraEnlightenmentID	= GameInfoTypes["ERA_ENLIGHTENMENT"] or eraRenaissanceID

local resourceCaptainsID 	= GameInfoTypes["RESOURCE_JFD_CAPTAINS"]
local resourceClericsID 	= GameInfoTypes["RESOURCE_JFD_CLERICS"]
local resourceDignitariesID = GameInfoTypes["RESOURCE_JFD_DIGNITARIES"]
local resourceInventorsID   = GameInfoTypes["RESOURCE_JFD_INVENTORS"]
--=======================================================================================================================
-- CIV DECISIONS
--=======================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- America
--------------------------------------------------------------------------------------------------------------------------
local civilizationAmericaID = GameInfoTypes["CIVILIZATION_AMERICA"]
--------------------------------------------------------------------------------------------------------------------------
-- America: Emancipation Proclamation
--------------------------------------------------------------------------------------------------------------------------
local reformLabourEmancipatedID = GameInfoTypes["REFORM_JFD_LABOUR_EMANCIPATED"]
local Decisions_JFD_America_EmancipationProclamation = {}
	Decisions_JFD_America_EmancipationProclamation.Name = "TXT_KEY_DECISIONS_JFD_AMERICA_EMANCIPATION_PROCLAMATION"
	Decisions_JFD_America_EmancipationProclamation.Desc = "TXT_KEY_DECISIONS_JFD_AMERICA_EMANCIPATION_PROCLAMATION_DESC"
	Decisions_JFD_America_EmancipationProclamation.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_America_EmancipationProclamation, "CIVILIZATION_AMERICA")
	Decisions_JFD_America_EmancipationProclamation.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationAmericaID then return false, false end
		if load(player, "Decisions_JFD_America_EmancipationProclamation") == true then
			Decisions_JFD_America_EmancipationProclamation.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_AMERICA_EMANCIPATION_PROCLAMATION_ENACTED_DESC")
			return false, false, true
		end
		local numWLTKDTurns = Game.GetRound(20*iGAMod)
		local numResistance = 0
		for city in player:Cities() do
			if city:IsResistance() then
				numResistance = numResistance + 1
			end
		end
		Decisions_JFD_America_EmancipationProclamation.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_AMERICA_EMANCIPATION_PROCLAMATION_DESC", numResistance, numWLTKDTurns)
		if numResistance < 1 then return true, false end
		if (not player:HasGovernment()) then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < numResistance then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_America_EmancipationProclamation.DoFunc = (
	function(player)
		local numWLTKDTurns = Game.GetRound(20*iGAMod)
		player:SetHasReform(reformLabourEmancipatedID, true, true)
		local numResistance = 0
		for city in player:Cities() do
			if city:IsResistance() then
				numResistance = numResistance + 1
				LuaEvents.JFD_WLTKDBegins(player:GetID(), city, city:GetX(), city:GetY(), numWLTKDTurns, -1, true)
			end
		end
		player:ChangeNumResourceTotal(iMagistrate, -numResistance)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_AMERICA_EMANCIPATION_PROCLAMATION", player:GetName(), player:GetCivilizationDescription()))
		save(player, "Decisions_JFD_America_EmancipationProclamation", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationAmericaID, "Decisions_JFD_America_EmancipationProclamation", Decisions_JFD_America_EmancipationProclamation)
--------------------------------------------------------------------------------------------------------------------------
-- America: Encourage Continentalism
--------------------------------------------------------------------------------------------------------------------------
if resourceDignitariesID then
local Decisions_JFD_America_Continentalism = {}
	Decisions_JFD_America_Continentalism.Name = "TXT_KEY_DECISIONS_DECISIONS_JFD_AMERICA_CONTINENTALISM"
	Decisions_JFD_America_Continentalism.Desc = "TXT_KEY_DECISIONS_DECISIONS_JFD_AMERICA_CONTINENTALISM_DESC"
	Decisions_JFD_America_Continentalism.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_America_Continentalism, "CIVILIZATION_AMERICA")
	Decisions_JFD_America_Continentalism.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationAmericaID then return false, false end
		if load(player, "Decisions_JFD_America_Continentalism") == true then
			Decisions_JFD_America_Continentalism.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DECISIONS_JFD_AMERICA_CONTINENTALISM_ENACTED_DESC")
			return false, false, true
		end
		local costGold = Game.GetRound(iMod*300)
		Decisions_JFD_America_Continentalism.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DECISIONS_JFD_AMERICA_CONTINENTALISM_DESC", costGold)
		if player:GetNumPolicyBranchesFinished() < 1 then return true, false end
		if player:GetNumResourceAvailable(resourceDignitariesID, false) < 2 then return true, false end
		if player:GetGold() < costGold then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_America_Continentalism.DoFunc = (
	function(player)
		local costGold = Game.GetRound(iMod * 800)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(resourceDignitariesID, -2)
		save(player, "Decisions_JFD_America_Continentalism", true)
	end
	)
	
	Decisions_JFD_America_Continentalism.Monitors = {}
	Decisions_JFD_America_Continentalism.Monitors[GameEvents.PlayerCityFounded] = (
	function(playerID, plotX, plotY)
		local player = Players[playerID]
		if load(player, "Decisions_JFD_America_Continentalism") ~= true then return end
		local plot = Map.GetPlot(plotX, plotY)
		local city = plot:GetPlotCity()
		local cityID = city:GetID()
		local plots = {city:GetBuyablePlotList()}
		for plotID = 1,8 do
			local plots = {city:GetBuyablePlotList()}
			plots[1]:SetOwner(playerID, cityID, true, true)
		end
		if load(player, "bDecisions_JFD_America_Continentalism") ~= true then
			city:SetName("Baton Rouge")
			save(player, "bDecisions_JFD_America_Continentalism", true)
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationAmericaID, "Decisions_JFD_America_Continentalism", Decisions_JFD_America_Continentalism)
end
--------------------------------------------------------------------------------------------------------------------------
-- Arabia
--------------------------------------------------------------------------------------------------------------------------
local civilizationArabiaID = GameInfoTypes["CIVILIZATION_ARABIA"]
--------------------------------------------------------------------------------------------------------------------------
-- Arabia: Found the House of Wisdom
--------------------------------------------------------------------------------------------------------------------------
local policyDecisionsArabiaPatronSciencesID = GameInfoTypes["POLICY_DECISIONS_ARABIAHOUSEOFWISDOM"]
local techGuildsID 							= GameInfoTypes["TECH_GUILDS"]
if resourceDignitariesID then
local Decisions_JFD_Arabia_PatronSciences = {}
	Decisions_JFD_Arabia_PatronSciences.Name = "TXT_KEY_DECISIONS_JFD_ARABIA_PATRON_SCIENCES"
	Decisions_JFD_Arabia_PatronSciences.Desc = "TXT_KEY_DECISIONS_JFD_ARABIA_PATRON_SCIENCES_DESC"
	Decisions_JFD_Arabia_PatronSciences.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Arabia_PatronSciences, "CIVILIZATION_ARABIA")
	Decisions_JFD_Arabia_PatronSciences.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationArabiaID then return false, false end
		local govtTitleShort = Locale.ConvertTextKey(player:GetGovernmentShortDescription())
		if player:HasPolicy(policyDecisionsArabiaPatronSciencesID) then
			Decisions_JFD_Arabia_PatronSciences.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ARABIA_PATRON_SCIENCES_ENACTED_DESC", govtTitleShort)
			return false, false, true
		end
		local costGold = Game.GetRound(800*iMod)
		local numTradeUnits = 0
		for unit in player:Units() do if unit:IsTrade() then numTradeUnits = numTradeUnits + 1 end end
		local rewardScience = (Game.GetRound(40*iMod)*numTradeUnits)
		Decisions_JFD_Arabia_PatronSciences.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ARABIA_PATRON_SCIENCES_DESC", govtTitleShort, costGold, rewardScience)
		if player:GetNumResourceAvailable(resourceDignitariesID, false) < 2 then return true, false end
		if player:GetGold() < costGold then return true, false end
		if (not player:HasTech(techGuildsID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Arabia_PatronSciences.DoFunc = (
	function(player)
		local costGold = Game.GetRound(800*iMod)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(resourceDignitariesID, -2)
		local numTradeUnits = 0
		for unit in player:Units() do if unit:IsTrade() then numTradeUnits = numTradeUnits + 1 end end
		local rewardScience = (Game.GetRound(40*iMod)*numTradeUnits)
		LuaEvents.Sukritact_ChangeResearchProgress(player:GetID(), rewardScience)
		player:GrantPolicy(policyDecisionsArabiaPatronSciencesID, true)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ARABIA_PATRON_SCIENCES", player:GetName(), player:GetCivilizationShortDescription()))
	end
	)
		
Decisions_AddCivilisationSpecific(civilizationArabiaID, "Decisions_JFD_Arabia_PatronSciences", Decisions_JFD_Arabia_PatronSciences)
end
--------------------------------------------------------------------------------------------------------------------------
-- Arabia: The Rise of Saladin
--------------------------------------------------------------------------------------------------------------------------
local epithetDecisionsArabiaAmirAlmininID = GameInfoTypes["EPITHET_JFD_AMIR_AL_MUMININ"]
local policyDecisionsArabiaAmirAlmininID  = GameInfoTypes["POLICY_DECISIONS_JFD_ARABIA_AMIR_AL_MUMININ"]
if resourceClericsID then
local Decisions_JFD_Arabia_AmirAlMuminin = {}
	Decisions_JFD_Arabia_AmirAlMuminin.Name = "TXT_KEY_DECISIONS_JFD_ARABIA_AMIR_AL_MUMININ"
	Decisions_JFD_Arabia_AmirAlMuminin.Desc = "TXT_KEY_DECISIONS_JFD_ARABIA_AMIR_AL_MUMININ_DESC"
	Decisions_JFD_Arabia_AmirAlMuminin.Type = "Cleric"
	HookDecisionCivilizationIcon(Decisions_JFD_Arabia_AmirAlMuminin, "CIVILIZATION_ARABIA")
	Decisions_JFD_Arabia_AmirAlMuminin.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationArabiaID then return false, false end
		if (not userSettingsRTPEpithetsCore) then return end
		if player:HasPolicy(policyDecisionsArabiaAmirAlmininID) then
			local newXP = load(player, "Decisions_JFD_Arabia_AmirAlMuminin")
			local newXP2 =  Game.GetRound(newXP/3)
			Decisions_JFD_Arabia_AmirAlMuminin.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ARABIA_AMIR_AL_MUMININ_ENACTED_DESC", newXP2, newXP)
			return false, false, true
		end
		local costFaith = Game.GetRound(200*iMod)
		local newXP = 0
		local newXP2 = 0
		local note = ""
		local religiousUnity = 0
		local religionID = player:GetStateReligion()
		if religionID ~= nil then 
			religiousUnity = GetReligiousUnity(player, religionID)
			newXP = Game.GetRound((religiousUnity*100)/3)
			newXP2 = Game.GetRound(newXP/3)
			note = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ARABIA_AMIR_AL_MUMININ_NOTE", Game.GetRound(religiousUnity * 100))
		end
		Decisions_JFD_Arabia_AmirAlMuminin.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ARABIA_AMIR_AL_MUMININ_DESC", costFaith, newXP2, newXP, note)
		if player:GetFaith() < costFaith then return true, false end
		if religionID == nil then return true, false end
		if religiousUnity < 0.75 then return true, false end
		if player:GetCurrentEra() ~= eraMedievalID then return true, false end
		if Teams[player:GetTeam()]:GetAtWarCount(false) < 1 then return true, false end
		if player:GetNumResourceAvailable(resourceClericsID, false) < 1 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Arabia_AmirAlMuminin.DoFunc = (
	function(player)
		local costFaith = Game.GetRound(200*iMod)
		player:ChangeNumResourceTotal(resourceClericsID, -1)
		player:ChangeFaith(-costFaith)
		local religionID = player:GetStateReligion()
		local religiousUnity = GetReligiousUnity(player, religionID)
		local newXP = Game.GetRound((religiousUnity*100)/3)
		local newXP2 =  Game.GetRound(newXP/3)
		for unit in player:Units() do
			if unit:IsCombatUnit() then
				unit:ChangeExperience(newXP2)
			end
		end
		InitUnitFromCity(player:GetCapitalCity(), player:GetSpecificUnitType("UNITCLASS_GREAT_GENERAL", 1))
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ARABIA_AMIR_AL_MUMININ", player:GetName(), player:GetCivilizationShortDescription()))
		LuaEvents.JFD_RTP_Epithets_ShowChooseEpithetPopup(epithetDecisionsArabiaAmirAlmininID)
		save(player, "Decisions_JFD_Arabia_AmirAlMuminin", newXP)
	end
	)
	
	Decisions_JFD_Arabia_AmirAlMuminin.Monitors = {}
	Decisions_JFD_Arabia_AmirAlMuminin.Monitors[GameEvents.CityTrained] = (
	function(playerID, cityID, unitID)
		local player = Players[playerID]
		if (not player:HasPolicy(policyDecisionsArabiaAmirAlmininID)) then return end
		local newXP = load(player, "Decisions_JFD_Arabia_AmirAlMuminin")
		if (not newXP) then return end
		local unit = player:GetUnitByID(unitID)
		if unit:IsCombatUnit() then
			unit:ChangeExperience(newXP)
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationArabiaID, "Decisions_JFD_Arabia_AmirAlMuminin", Decisions_JFD_Arabia_AmirAlMuminin)
end
--------------------------------------------------------------------------------------------------------------------------
-- Assyria
--------------------------------------------------------------------------------------------------------------------------
local civilizationAssyriaID = GameInfoTypes["CIVILIZATION_ASSYRIA"]
--------------------------------------------------------------------------------------------------------------------------
-- Assyria: Issue Resettlement Orders
--------------------------------------------------------------------------------------------------------------------------
local techBronzeWorkingID = GameInfoTypes["TECH_BRONZE_WORKING"]
local Decisions_JFD_Assyria_SettlementOrders = {}
    Decisions_JFD_Assyria_SettlementOrders.Name = "TXT_KEY_DECISIONS_JFD_ASSYRIA_RESETTLEMENT_ORDERS"
	Decisions_JFD_Assyria_SettlementOrders.Desc = "TXT_KEY_DECISIONS_JFD_ASSYRIA_RESETTLEMENT_ORDERS_DESC"
	Decisions_JFD_Assyria_SettlementOrders.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Assyria_SettlementOrders, "CIVILIZATION_ASSYRIA")
	Decisions_JFD_Assyria_SettlementOrders.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationAssyriaID then return false, false end
		if load(player, "Decisions_JFD_Assyria_SettlementOrders") == true then
			Decisions_JFD_Assyria_SettlementOrders.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ASSYRIA_RESETTLEMENT_ORDERS_ENACTED_DESC")
			return false, false, true
		end
		Decisions_JFD_Assyria_SettlementOrders.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ASSYRIA_RESETTLEMENT_ORDERS_DESC")
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		local team = Teams[player:GetTeam()]
		if (not player:IsAtWar()) then return true, false end
		if (not team:IsHasTech(techBronzeWorkingID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Assyria_SettlementOrders.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		save(player, "Decisions_JFD_Assyria_SettlementOrders", true)
	end
	)
	
	Decisions_JFD_Assyria_SettlementOrders.Monitors = {}
	Decisions_JFD_Assyria_SettlementOrders.Monitors[GameEvents.CityCaptureComplete] =  (	
	function(playerID, isCapital, plotX, plotY, newOwnerID, population, isConquest)
		if not(isConquest) then return end
		local player = Players[newOwnerID]
		if load(player, "Decisions_JFD_Assyria_SettlementOrders") == true then
			local plot = Map.GetPlot(plotX, plotY)
			for adjacentPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				if (adjacentPlot:GetOwner() == newOwnerID) then
					if (adjacentPlot:GetImprovementType() ~= -1) then
						if (adjacentPlot:IsImprovementPillaged()) then
							adjacentPlot:SetImprovementPillaged(false)
						end
					end
				end
			end
		end
		
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationAssyriaID, "Decisions_JFD_Assyria_SettlementOrders", Decisions_JFD_Assyria_SettlementOrders)
--------------------------------------------------------------------------------------------------------------------------
-- Assyria: Call for Ilku Service
--------------------------------------------------------------------------------------------------------------------------
local policyDecisionsAssyriaIlkuServicesID = GameInfoTypes["POLICY_DECISIONS_JFD_ASSYRIA_ILKU_SERVICES"]
if resourceCaptainsID then
local Decisions_JFD_Assyria_IlkuService = {}
	Decisions_JFD_Assyria_IlkuService.Name = "TXT_KEY_DECISIONS_JFD_ASSYRIA_ILKU_SERVICE"
	Decisions_JFD_Assyria_IlkuService.Desc = "TXT_KEY_DECISIONS_JFD_ASSYRIA_ILKU_SERVICE_DESC"
	Decisions_JFD_Assyria_IlkuService.Type = "Civilization"
	Decisions_JFD_Assyria_IlkuService.Data1 = {}
	Decisions_JFD_Assyria_IlkuService.Data1.UNIT_ASSYRIAN_SIEGE_TOWER = nil
	HookDecisionCivilizationIcon(Decisions_JFD_Assyria_IlkuService, "CIVILIZATION_ASSYRIA")
	Decisions_JFD_Assyria_IlkuService.CanFunc = (
	function(player, units)
		if player:GetCivilizationType() ~= civilizationAssyriaID then return false, false end
		local govtTitle = player:GetGovernmentTitle()
		if player:HasPolicy(policyDecisionsAssyriaIlkuServicesID) then
			Decisions_JFD_Assyria_IlkuService.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ASSYRIA_ILKU_SERVICE_ENACTED_DESC", govtTitle)
			return false, false, true
		end
		Decisions_JFD_Assyria_IlkuService.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ASSYRIA_ILKU_SERVICE_DESC", govtTitle)
		if (player:GetNumResourceAvailable(resourceCaptainsID, false) < 2) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Assyria_IlkuService.DoFunc = (
	function(player, units)
		player:ChangeNumResourceTotal(resourceCaptainsID, -2)
		player:GrantPolicy(policyDecisionsAssyriaIlkuServicesID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationAssyriaID, "Decisions_JFD_Assyria_IlkuService", Decisions_JFD_Assyria_IlkuService)
end
--------------------------------------------------------------------------------------------------------------------------
-- Austria
--------------------------------------------------------------------------------------------------------------------------
local civilizationAustriaID = GameInfoTypes["CIVILIZATION_AUSTRIA"]
--------------------------------------------------------------------------------------------------------------------------
-- Austria: Found the Hofkriegsrat
--------------------------------------------------------------------------------------------------------------------------
local policyDecisionsHofkriegsrat = GameInfoTypes["POLICY_DECISIONS_AUSTRIANHOFKRIEGSRAT"]
if resourceCaptainsID then
local Decisions_AustrianHofkriegsrat = {}
	Decisions_AustrianHofkriegsrat.Name = "TXT_KEY_DECISIONS_AUSTRIA_JFD_HOFKRIEGSRAT"
	Decisions_AustrianHofkriegsrat.Desc = "TXT_KEY_DECISIONS_AUSTRIA_JFD_HOFKRIEGSRAT_DESC"
	Decisions_AustrianHofkriegsrat.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_AustrianHofkriegsrat, "CIVILIZATION_AUSTRIA")
	Decisions_AustrianHofkriegsrat.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationAustriaID then return false, false end
		if (not userSettingsRTPSupplyGenerals) then return false, false end
		if player:HasPolicy(policyDecisionsHofkriegsrat) then
			Decisions_AustrianHofkriegsrat.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_AUSTRIA_JFD_HOFKRIEGSRAT_ENACTED_DESC")
			return false, false, true
		end
		local costGold = Game.GetRound(400*iMod)
		Decisions_AustrianHofkriegsrat.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_AUSTRIA_JFD_HOFKRIEGSRAT_DESC", costGold)
		if player:GetGold() < costGold then return true, false end
		if player:GetNumResourceAvailable(resourceCaptainsID, false) < 2 then return true, false end
		if player:GetCurrentEra() < eraRenaissanceID then return true, false end
		return true, true
	end
	)
	
	Decisions_AustrianHofkriegsrat.DoFunc = (
	function(player)
		local costGold = Game.GetRound(400*iMod)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(resourceCaptainsID, -2)
		player:GrantPolicy(policyDecisionsHofkriegsrat, true)
	end
	)
		
Decisions_AddCivilisationSpecific(civilizationAustriaID, "Decisions_AustrianHofkriegsrat", Decisions_AustrianHofkriegsrat)
end
--------------------------------------------------------------------------------------------------------------------------
-- Austria: Tu Felix Austria Nube
--------------------------------------------------------------------------------------------------------------------------
local policyDecisionsTuFelixNubeID = GameInfoTypes["POLICY_DECISIONS_AUSTRIANHABSBURG"]
if resourceDignitariesID then
local Decisions_JFD_Austria_TuFelixNube = {}
    Decisions_JFD_Austria_TuFelixNube.Name = "TXT_KEY_DECISIONS_AUSTRIA_JFD_TU_FELIX_NUBE"
	Decisions_JFD_Austria_TuFelixNube.Desc = "TXT_KEY_DECISIONS_AUSTRIA_JFD_TU_FELIX_NUBE_DESC"
	Decisions_JFD_Austria_TuFelixNube.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Austria_TuFelixNube, "CIVILIZATION_AUSTRIA")
	Decisions_JFD_Austria_TuFelixNube.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationAustriaID then return false, false end
		if player:HasPolicy(policyDecisionsTuFelixNubeID) then
			Decisions_JFD_Austria_TuFelixNube.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_AUSTRIA_JFD_TU_FELIX_NUBE_ENACTED_DESC")
			return false, false, true
		end
		local costCulture = Game.GetRound(200*iMod)
		Decisions_JFD_Austria_TuFelixNube.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_AUSTRIA_JFD_TU_FELIX_NUBE_DESC", costCulture)
		if player:GetJONSCulture() < costCulture then return true, false end
		if player:GetNumPolicyBranchesFinished() < 1 then return true, false end
		if player:GetNumResourceAvailable(resourceDignitariesID, false) < 2 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Austria_TuFelixNube.DoFunc = (
	function(player)
		local costCulture = Game.GetRound(200*iMod)
		player:ChangeJONSCulture(-costCulture)
		player:ChangeNumResourceTotal(resourceDignitariesID, -2)
		player:GrantPolicy(policyDecisionsTuFelixNubeID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationAustriaID, "Decisions_JFD_Austria_TuFelixNube", Decisions_JFD_Austria_TuFelixNube)
end
--------------------------------------------------------------------------------------------------------------------------
-- Babylon
--------------------------------------------------------------------------------------------------------------------------
local civilizationBabylonID = GameInfoTypes["CIVILIZATION_BABYLON"]
--------------------------------------------------------------------------------------------------------------------------
-- Babylon: Collate the Star Catalogues
--------------------------------------------------------------------------------------------------------------------------
if resourceInventorsID then
local techCalendarID = GameInfoTypes["TECH_CALENDAR"]
local Decisions_JFD_Babylon_StarCatalogues = {}
    Decisions_JFD_Babylon_StarCatalogues.Name = "TXT_KEY_DECISIONS_JFD_BABYLON_STAR_CATALOGUES"
	Decisions_JFD_Babylon_StarCatalogues.Desc = "TXT_KEY_DECISIONS_JFD_BABYLON_STAR_CATALOGUES_DESC"
	Decisions_JFD_Babylon_StarCatalogues.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Babylon_StarCatalogues, "CIVILIZATION_BABYLON")
	Decisions_JFD_Babylon_StarCatalogues.CanFunc = (
	function(player)
		if (not userSettingsPITInnovationsCore) then return false, false end
		if player:GetCivilizationType() ~= civilizationBabylonID then return false, false end
		if load(player, "Decisions_JFD_Babylon_StarCatalogues") == true then
			Decisions_JFD_Babylon_StarCatalogues.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BABYLON_STAR_CATALOGUES_ENACTED_DESC")
			return false, false, true
		end
		local city = player:GetCapitalCity()
		if (not city) then return false, false end
		local costGold = player:GetEraAdjustedValue(Game.GetRound(200*iMod))
		Decisions_JFD_Babylon_StarCatalogues.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BABYLON_STAR_CATALOGUES_DESC", costGold)
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if player:GetGold() < costGold then return true, false end
		if (not player:HasTech(techCalendarID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Babylon_StarCatalogues.DoFunc = (
	function(player)
		local city = player:GetCapitalCity()
		local costGold = player:GetEraAdjustedValue(Game.GetRound(200*iMod))
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		local currentEraID = player:GetCurrentEra()
		player:DoRandomInnovation(currentEraID)
		save(player, "Decisions_JFD_Babylon_StarCatalogues", true)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BABYLON_STAR_CATALOGUES", player:GetName(), player:GetCivilizationShortDescription()))
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationBabylonID, "Decisions_JFD_Babylon_StarCatalogues", Decisions_JFD_Babylon_StarCatalogues)
end
--------------------------------------------------------------------------------------------------------------------------
-- Babylon: Construct the Ishtar Gate
--------------------------------------------------------------------------------------------------------------------------
if resourceInventorsID then
local buildingIshtarID = GameInfoTypes["BUILDING_DECISIONS_BABYLONGATES"]
local techMasonryID    = GameInfoTypes["TECH_MASONRY"]
local Decisions_JFD_Babylon_IshtarGates = {}
    Decisions_JFD_Babylon_IshtarGates.Name = "TXT_KEY_DECISIONS_JFD_BABYLON_ISHTAR_GATES"
	Decisions_JFD_Babylon_IshtarGates.Desc = "TXT_KEY_DECISIONS_JFD_BABYLON_ISHTAR_GATES_DESC"
	Decisions_JFD_Babylon_IshtarGates.Pedia = "TXT_KEY_DECISIONS_BUILDING_BABYLONGATES"
	Decisions_JFD_Babylon_IshtarGates.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Babylon_IshtarGates, "CIVILIZATION_BABYLON")
	Decisions_JFD_Babylon_IshtarGates.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationBabylonID then return false, false end
		if load(player, "Decisions_JFD_Babylon_IshtarGates") == true then
			Decisions_JFD_Babylon_IshtarGates.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BABYLON_ISHTAR_GATES_ENACTED_DESC")
			return false, false, true
		end
		local costGold = Game.GetRound(500*iMod)
		local rewardFaith = Game.GetRound(80*iMod)
		Decisions_JFD_Babylon_IshtarGates.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BABYLON_ISHTAR_GATES_DESC", costGold, rewardFaith)
		if player:GetNumResourceAvailable(resourceInventorsID, false) < 2 then return true, false end
		if player:GetGold() < costGold then return true, false end
		if (not player:HasTech(techMasonryID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Babylon_IshtarGates.DoFunc = (
	function(player)
		local city = player:GetCapitalCity()
		local costGold = Game.GetRound(500*iMod)
		local rewardFaith = Game.GetRound(80*iMod)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(resourceInventorsID, -2)
		player:ChangeFaith(rewardFaith)
		city:SetNumRealBuilding(buildingIshtarID, 1)
		save(player, "Decisions_JFD_Babylon_IshtarGates", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationBabylonID, "Decisions_JFD_Babylon_IshtarGates", Decisions_JFD_Babylon_IshtarGates)
end
--------------------------------------------------------------------------------------------------------------------------
-- Brazil
--------------------------------------------------------------------------------------------------------------------------
local civilizationBrazilID = GameInfoTypes["CIVILIZATION_BRAZIL"]
--------------------------------------------------------------------------------------------------------------------------
-- Brazil: Develop Ethanol Fuel
--------------------------------------------------------------------------------------------------------------------------
if resourceInventorsID then
local policyDecisionsBrazilEthanolFuelID = GameInfoTypes["POLICY_DECISIONS_BRAZILETHANOL"]
local resourceOilID 					 = GameInfoTypes["RESOURCE_OIL"]
local techCombustionID 					 = GameInfoTypes["TECH_COMBUSTION"]
local Decisions_JFD_Brazil_EthanolFuel = {}
    Decisions_JFD_Brazil_EthanolFuel.Name = "TXT_KEY_DECISIONS_JFD_BRAZIL_ETHANOL_FUEL"
	Decisions_JFD_Brazil_EthanolFuel.Desc = "TXT_KEY_DECISIONS_JFD_BRAZIL_ETHANOL_FUEL_DESC"
	Decisions_JFD_Brazil_EthanolFuel.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Brazil_EthanolFuel, "CIVILIZATION_BRAZIL")
	Decisions_JFD_Brazil_EthanolFuel.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationBrazilID then return false, false end
		if player:HasPolicy(policyDecisionsBrazilEthanolFuelID) then
			Decisions_JFD_Brazil_EthanolFuel.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BRAZIL_ETHANOL_FUEL_ENACTED_DESC")
			return false, false, true
		end
		local costGold = Game.GetRound(600*iMod)
		Decisions_JFD_Brazil_EthanolFuel.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BRAZIL_ETHANOL_FUEL_DESC", costGold)
		if player:GetGold() < costGold then return true, false end
		if player:GetNumResourceAvailable(resourceInventorsID, false) < 1 then return true, false end
		if (not player:HasTech(techCombustionID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Brazil_EthanolFuel.DoFunc = (
	function(player)
		local costGold = Game.GetRound(600*iMod)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(resourceInventorsID, -1)
		player:GrantPolicy(policyDecisionsBrazilEthanolFuelID, true)
		player:ChangeNumResourceTotal(resourceOilID, 3)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BRAZIL_ETHANOL_FUEL", player:GetCivilizationShortDescription()))
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationBrazilID, "Decisions_JFD_Brazil_EthanolFuel", Decisions_JFD_Brazil_EthanolFuel)
end
--------------------------------------------------------------------------------------------------------------------------
-- Brazil: Dispatch the Bandeirantes
--------------------------------------------------------------------------------------------------------------------------
local policyDecisionsBrazilBandeirantesID = GameInfoTypes["POLICY_DECISIONS_BRAZILBANDEIRANTES"]
local techGunpowderID					  = GameInfoTypes["TECH_GUNPOWDER"]
if resourceCaptainsID then
local Decisions_JFD_Brazil_Bandeirantes = {}
    Decisions_JFD_Brazil_Bandeirantes.Name = "TXT_KEY_DECISIONS_JFD_BRAZIL_BANDEIRANTES"
	Decisions_JFD_Brazil_Bandeirantes.Desc = "TXT_KEY_DECISIONS_JFD_BRAZIL_BANDEIRANTES_DESC"
	Decisions_JFD_Brazil_Bandeirantes.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Brazil_Bandeirantes, "CIVILIZATION_BRAZIL")
	Decisions_JFD_Brazil_Bandeirantes.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationBrazilID then return false, false end
		if player:HasPolicy(policyDecisionsBrazilBandeirantesID) then
			Decisions_JFD_Brazil_Bandeirantes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BRAZIL_BANDEIRANTES_ENACTED_DESC")
			return false, false, true
		end
		local costGold = Game.GetRound(500*iMod)
		Decisions_JFD_Brazil_Bandeirantes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BRAZIL_BANDEIRANTES_DESC", costGold)
		if player:GetGold() < costGold then	return true, false end
		if player:GetNumResourceAvailable(resourceCaptainsID, false) < 2 then return true, false end
		if (not player:HasTech(techGunpowderID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Brazil_Bandeirantes.DoFunc = (
	function(player)
		local costGold = Game.GetRound(500*iMod)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(resourceCaptainsID, -2)
		player:GrantPolicy(policyDecisionsBrazilBandeirantesID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationBrazilID, "Decisions_JFD_Brazil_Bandeirantes", Decisions_JFD_Brazil_Bandeirantes)
end
--------------------------------------------------------------------------------------------------------------------------
-- Byzantium
--------------------------------------------------------------------------------------------------------------------------
local civilizationByzantiumID = GameInfoTypes["CIVILIZATION_BYZANTIUM"]
--------------------------------------------------------------------------------------------------------------------------
-- Byzantium: Raise the Theodosian Wall 
--------------------------------------------------------------------------------------------------------------------------
local buildingTheodosianWallsID = GameInfoTypes["BUILDING_DECISIONS_BYZANTIUMWALLS"]
local buildingWallsID 			= GameInfoTypes["BUILDING_WALLS"]
if resourceInventorsID then
local Decisions_JFD_Byzantium_TheodosianWalls = {}
	Decisions_JFD_Byzantium_TheodosianWalls.Name = "TXT_KEY_DECISIONS_JFD_BYZANTIUM_THEODOSIAN_WALLS"
	Decisions_JFD_Byzantium_TheodosianWalls.Desc = "TXT_KEY_DECISIONS_JFD_BYZANTIUM_THEODOSIAN_WALLS_DESC"
	Decisions_JFD_Byzantium_TheodosianWalls.Pedia = "TXT_KEY_DECISIONS_BUILDING_BYZANTIUMWALLS"
	Decisions_JFD_Byzantium_TheodosianWalls.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Byzantium_TheodosianWalls, "CIVILIZATION_BYZANTIUM")
	Decisions_JFD_Byzantium_TheodosianWalls.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationByzantiumID then return false, false end
		local capital = player:GetCapitalCity()
		if (not capital) then return false, false end
		Decisions_JFD_Byzantium_TheodosianWalls.Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BYZANTIUM_THEODOSIAN_WALLS", capital:GetName())
		if load(player, "Decisions_JFD_Byzantium_TheodosianWalls") == true then
			Decisions_JFD_Byzantium_TheodosianWalls.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BYZANTIUM_THEODOSIAN_WALLS_ENACTED_DESC")
			return false, false, true
		end
		local costGold = Game.GetRound(300*iMod)
		Decisions_JFD_Byzantium_TheodosianWalls.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BYZANTIUM_THEODOSIAN_WALLS_DESC", costGold)
		if (not capital:HasBuilding(buildingWallsID)) then return true, false end
		if player:GetNumResourceAvailable(resourceInventorsID, false) < 2 then return true, false end
		if player:GetGold() < costGold then	return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Byzantium_TheodosianWalls.DoFunc = (
	function(player)
		local capital = player:GetCapitalCity()
		local costGold = Game.GetRound(300*iMod)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(resourceInventorsID, -2)
		capital:SetNumRealBuilding(buildingTheodosianWallsID, 1)
		save(player, "Decisions_JFD_Byzantium_TheodosianWalls", true)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BYZANTIUM_THEODOSIAN_WALLS", player:GetName(), capital:GetName()))
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationByzantiumID, "Decisions_JFD_Byzantium_TheodosianWalls", Decisions_JFD_Byzantium_TheodosianWalls)
end
--------------------------------------------------------------------------------------------------------------------------
-- Byzantium: Establish the Succession Laws of Porphyrogennetos
--------------------------------------------------------------------------------------------------------------------------
local policyDecisionsByzantiumPorphyrogennetosID = GameInfoTypes["POLICY_DECISIONS_JFD_BYZANTIUM_PORPHYROGENNETOS"]
local reformSuccessionHereditaryID				 = GameInfoTypes["REFORM_JFD_SUCCESSION_HEREDITARY"]
local Decisions_JFD_Byzantium_Porphyrogennetos = {}
	Decisions_JFD_Byzantium_Porphyrogennetos.Name = "TXT_KEY_DECISIONS_JFD_BYZANTIUM_PORPHYROGENNETOS"
	Decisions_JFD_Byzantium_Porphyrogennetos.Desc = "TXT_KEY_DECISIONS_JFD_BYZANTIUM_PORPHYROGENNETOS_DESC"
	Decisions_JFD_Byzantium_Porphyrogennetos.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Byzantium_Porphyrogennetos, "CIVILIZATION_BYZANTIUM")
	Decisions_JFD_Byzantium_Porphyrogennetos.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationByzantiumID then return false, false end
		if player:HasPolicy(policyDecisionsByzantiumPorphyrogennetosID) then
			Decisions_JFD_Byzantium_Porphyrogennetos.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BYZANTIUM_PORPHYROGENNETOS_ENACTED_DESC")
			return false, false, true
		end
		Decisions_JFD_Byzantium_Porphyrogennetos.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BYZANTIUM_PORPHYROGENNETOS_DESC")
		if (not player:HasGovernment()) then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		local eraID = player:GetCurrentEra()
		if eraID < eraClassicalID then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Byzantium_Porphyrogennetos.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:GrantPolicy(policyDecisionsByzantiumPorphyrogennetosID, true)
		player:SetHasReform(reformSuccessionHereditaryID, true, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationByzantiumID, "Decisions_JFD_Byzantium_Porphyrogennetos", Decisions_JFD_Byzantium_Porphyrogennetos)
--------------------------------------------------------------------------------------------------------------------------
-- Carthage
--------------------------------------------------------------------------------------------------------------------------
local civilizationCarthageID = GameInfoTypes["CIVILIZATION_CARTHAGE"]
--------------------------------------------------------------------------------------------------------------------------
-- Carthage: Dispatch Hanno’s Voyage
--------------------------------------------------------------------------------------------------------------------------
local techSailingID = GameInfoTypes["TECH_SAILING"]
if resourceCaptainsID then
local Decisions_JFD_Carthage_HannoVoyage = {}
	Decisions_JFD_Carthage_HannoVoyage.Name = "TXT_KEY_DECISIONS_JFD_CARTHAGE_HANNO_VOYAGE"
	Decisions_JFD_Carthage_HannoVoyage.Desc = "TXT_KEY_DECISIONS_JFD_CARTHAGE_HANNO_VOYAGE_DESC"
	Decisions_JFD_Carthage_HannoVoyage.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Carthage_HannoVoyage, "CIVILIZATION_CARTHAGE")
	Decisions_JFD_Carthage_HannoVoyage.CanFunc = (
	function(player, unitTypes)		
		if player:GetCivilizationType() ~= civilizationCarthageID then return false, false end
		local eraID = load(player, "Decisions_JFD_Carthage_HannoVoyage")
		local currentEraID = player:GetCurrentEra()
		if eraID ~= nil then
			if eraID < currentEraID then
				save(player, "Decisions_JFD_Carthage_HannoVoyage", nil)
			else
				Decisions_JFD_Carthage_HannoVoyage.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_CARTHAGE_HANNO_VOYAGE_ENACTED_DESC")
				return false, false, true
			end
		end
		local costGold = Game.GetRound(500*iMod)
		local unitID = GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_NAVALMELEE", "UNITCOMBAT_NAVALRANGED")
		Decisions_JFD_Carthage_HannoVoyage.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_CARTHAGE_HANNO_VOYAGE_DESC", costGold, GameInfo.Units[unitID].Description)
		if player:GetGold() < costGold then return true, false end
		if player:GetNumResourceAvailable(resourceCaptainsID, false) < 1 then return true, false end
		local cityTarget = nil
		for city in player:Cities() do 
			if city:IsCoastal() then cityTarget = city break end
		end
		if (not cityTarget) then return true, false end  
		if (not player:HasTech(techSailingID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Carthage_HannoVoyage.DoFunc = (
	function(player)
		local costGold = Game.GetRound(500*iMod)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(resourceCaptainsID, -1)
		local cityTarget = nil
		for city in player:Cities() do 
			if city:IsCoastal() then  cityTarget = city break end
		end
		local unitID = GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_NAVALMELEE", "UNITCOMBAT_NAVALRANGED")
		InitUnitFromCity(cityTarget, player:GetSpecificUnitType("UNITCLASS_SETTLER"), 1)
		InitUnitFromCity(cityTarget, unitID, 2)
		InitUnitFromCity(cityTarget, player:GetSpecificUnitType("UNITCLASS_GREAT_ADMIRAL"), 1)
		save(player, "Decisions_JFD_Carthage_HannoVoyage", player:GetCurrentEra())
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_CARTHAGE_HANNO_VOYAGE", player:GetName(), player:GetCivilizationShortDescription()))
	end
	)

Decisions_AddCivilisationSpecific(civilizationCarthageID, "Decisions_JFD_Carthage_HannoVoyage", Decisions_JFD_Carthage_HannoVoyage)
end
--------------------------------------------------------------------------------------------------------------------------
-- Carthage: Expand the Cothons
--------------------------------------------------------------------------------------------------------------------------
local buildingClassHarbourID		 		 = GameInfoTypes["BUILDINGCLASS_HARBOR"]
local policyDecisionsCarthageExpandCothonsID = GameInfoTypes["POLICY_DECISIONS_CARTHAGECOTHONS"]
local Decisions_JFD_Carthage_Cothons = {}
	Decisions_JFD_Carthage_Cothons.Name = "TXT_KEY_DECISIONS_JFD_CARTHAGE_COTHONS"
	Decisions_JFD_Carthage_Cothons.Desc = "TXT_KEY_DECISIONS_JFD_CARTHAGE_COTHONS_DESC"
	Decisions_JFD_Carthage_Cothons.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Carthage_Cothons, "CIVILIZATION_CARTHAGE")
	Decisions_JFD_Carthage_Cothons.Weight = nil
	Decisions_JFD_Carthage_Cothons.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationCarthageID then return false, false end
		local govtTitleShort = player:GetGovernmentShortDescription()
		if player:HasPolicy(policyDecisionsCarthageExpandCothonsID) then
			Decisions_JFD_Carthage_Cothons.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_CARTHAGE_COTHONS_ENACTED_DESC", govtTitleShort)
			return false, false, true
		end
		local numHarbours = player:GetBuildingClassCount(buildingClassHarbourID)
		local costGold = Game.GetRound((100*numHarbours)*iMod)
		Decisions_JFD_Carthage_Cothons.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_CARTHAGE_COTHONS_DESC", govtTitleShort, costGold)
		if numHarbours < 4 then return true, false end
		if player:GetGold() < costGold then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Carthage_Cothons.DoFunc = (
	function(player)
		local numHarbours = player:GetBuildingClassCount(buildingClassHarbourID)
		local costGold = Game.GetRound((100*numHarbours)*iMod)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:GrantPolicy(policyDecisionsCarthageExpandCothonsID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationCarthageID, "Decisions_JFD_Carthage_Cothons", Decisions_JFD_Carthage_Cothons)
--------------------------------------------------------------------------------------------------------------------------
-- China
--------------------------------------------------------------------------------------------------------------------------
local civilizationChinaID 	= GameInfoTypes["CIVILIZATION_CHINA"]
--------------------------------------------------------------------------------------------------------------------------
-- China: Establish the Imperial Exams
--------------------------------------------------------------------------------------------------------------------------
local policyDecisionsChinaImperialExamsID = GameInfoTypes["POLICY_DECISIONS_CHINAIMPERIALEXAM"]
local Decisions_JFD_China_ImperialExams = {}
    Decisions_JFD_China_ImperialExams.Name = "TXT_KEY_DECISIONS_JFD_CHINA_IMPERIAL_EXAMS"
	Decisions_JFD_China_ImperialExams.Desc = "TXT_KEY_DECISIONS_JFD_CHINA_IMPERIAL_EXAMS_DESC"
	Decisions_JFD_China_ImperialExams.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_China_ImperialExams, "CIVILIZATION_CHINA")
	Decisions_JFD_China_ImperialExams.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationChinaID then return false, false end
		if (not userSettingsRTPClaimsCore) then return false, false end
		if (not userSettingsSDTalentsCore) then return false, false end
		local govtTitleShort, govtTitleAdj = player:GetGovernmentShortDescription()
		if player:HasPolicy(policyDecisionsChinaImperialExamsID) then
			Decisions_JFD_China_ImperialExams.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_CHINA_IMPERIAL_EXAMS_ENACTED_DESC", govtTitleAdj)
			return false, false, true
		end
		local costGold = Game.GetRound(600*iMod)
		 Decisions_JFD_China_ImperialExams.Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_CHINA_IMPERIAL_EXAMS", govtTitleAdj)
		 Decisions_JFD_China_ImperialExams.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_CHINA_IMPERIAL_EXAMS_DESC", govtTitleAdj, costGold)
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		if player:GetGold() < costGold then	return true, false end
		if player:GetCurrentEra() < eraClassicalID then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_China_ImperialExams.DoFunc = (
	function(player)
		local costGold = Game.GetRound(600*iMod)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:GrantPolicy(policyDecisionsChinaImperialExamsID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationChinaID, "Decisions_JFD_China_ImperialExams", Decisions_JFD_China_ImperialExams)
--------------------------------------------------------------------------------------------------------------------------
-- China: Create the Fubing Zhi
--------------------------------------------------------------------------------------------------------------------------
local policyDecisionsChinaFubingZhiID = GameInfoTypes["POLICY_DECISIONS_CHINAFUBINGZHI"]
if resourceCaptainsID then
local Decisions_JFD_China_FubingZhi = {}
    Decisions_JFD_China_FubingZhi.Name = "TXT_KEY_DECISIONS_JFD_CHINA_FUBINGZHI"
	Decisions_JFD_China_FubingZhi.Desc = "TXT_KEY_DECISIONS_JFD_CHINA_FUBINGZHI_DESC"
	Decisions_JFD_China_FubingZhi.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_China_FubingZhi, "CIVILIZATION_CHINA")
	Decisions_JFD_China_FubingZhi.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationChinaID then return false, false end
		local leaderTitleShort = player:GetLeaderTitleShort()
		if player:HasPolicy(policyDecisionsChinaFubingZhiID) then
			Decisions_JFD_China_FubingZhi.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_CHINA_FUBINGZHI_ENACTED_DESC", leaderTitleShort)
			return false, false, true
		end
		local costGold = Game.GetRound(400*iMod)
		Decisions_JFD_China_FubingZhi.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_CHINA_FUBINGZHI_DESC", leaderTitleShort, costGold)
		if player:GetNumResourceAvailable(resourceCaptainsID, false) < 2 then return true, false end
		if player:GetGold() < costGold then	return true, false end		
		if player:GetCurrentEra() < eraClassicalID then return true, false end
		local numUnits = 0
		for unit in player:Units() do
			if unit:IsCombatUnit() then
				numUnits = numUnits + 1
			end
		end
		if numUnits < 5 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_China_FubingZhi.DoFunc = (
	function(player, unit)
		local costGold = Game.GetRound(400*iMod)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(resourceCaptainsID, -1)
		player:GrantPolicy(policyDecisionsChinaFubingZhiID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationChinaID, "Decisions_JFD_China_FubingZhi", Decisions_JFD_China_FubingZhi)
end
--------------------------------------------------------------------------------------------------------------------------
-- Denmark
--------------------------------------------------------------------------------------------------------------------------
local civilizationDenmarkID  = GameInfoTypes["CIVILIZATION_DENMARK"]
--------------------------------------------------------------------------------------------------------------------------
-- Denmark: Raid a City State
--------------------------------------------------------------------------------------------------------------------------
local unitCombatMeleeID = GameInfoTypes["UNITCOMBAT_MELEE"]
if resourceCaptainsID then
local Decisions_DenmarkRaid = {}
	Decisions_DenmarkRaid.Name = "TXT_KEY_DECISIONS_JFD_DENMARK_VIKING_RAID"
	Decisions_DenmarkRaid.Desc = "TXT_KEY_DECISIONS_JFD_DENMARK_VIKING_RAID_DESC"
	Decisions_DenmarkRaid.Type = "Civilization"
	Decisions_DenmarkRaid.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationDenmarkID then return false, false end
		if load(player, "Decisions_DenmarkRaid") == nil then
			save(player, "Decisions_DenmarkRaid", 0)
		end
		local tTable = {}
		local numChance = 35
		local city = player:GetCapitalCity()
		if city then
			local unitTarget = nil
			local plot = city:Plot()
			local numUnits = plot:GetNumUnits()
			for val = 0,(numUnits - 1) do
				local unit = plot:GetUnit(val)
				if unit:GetUnitCombatType() == unitCombatMeleeID then
					unitTarget = unit
					break
				end
			end
			tTable.Unit = unitTarget
			if unitTarget then
				numChance = numChance - (unitTarget:GetLevel() * 5)
			end
		end
		if numChance < 10 then numChance = 10 end
		if numChance == 35 then numChance = 30 end
		tTable.Chance = numChance
		for cityIDState, cityState in pairs(Players) do
			if cityState:IsEverAlive() and cityState:IsMinorCiv() and cityState:IsAlive() and (Teams[player:GetTeam()]:IsHasMet(cityState:GetTeam())) then
				local decision = "Decisions_DenmarkRaid" .. cityIDState
				local cityName = cityState:GetName()
				tTempDecisions[decision] = {}
				tTempDecisions[decision].Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_DENMARK_VIKING_RAID", cityName)
				tTempDecisions[decision].Desc = "TXT_KEY_DECISIONS_JFD_DENMARK_VIKING_RAID_DESC"
				tTempDecisions[decision].Data1 = cityState
				tTempDecisions[decision].Data2 = tTable
				tTempDecisions[decision].Weight = 0
				tTempDecisions[decision].Type = "Civilization"
				HookDecisionCivilizationIcon(tTempDecisions[decision], "CIVILIZATION_DENMARK")
				tTempDecisions[decision].CanFunc = (
				function(player, cityState, tTable)
					local decision = "Decisions_DenmarkRaid" .. cityState:GetID()
					local cityName = cityState:GetName()
					if load(player, decision) == true then
						tTempDecisions[decision].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_DENMARK_VIKING_RAID_ENACTED_DESC", cityName)
						return false, false, true
					end
					if player:GetCurrentEra() > eraMedievalID then return false, false end
					if load(player, "Decisions_DenmarkRaid") >= 8 then
						return false, false
					end
					local rewardGold = Game.GetRound((player:GetCurrentEra() + 1) * (75*iMod))
					tTempDecisions[decision].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_DENMARK_VIKING_RAID_DESC", cityName, tTable.Chance, rewardGold)
					if player:GetNumResourceAvailable(resourceCaptainsID, false) < 2 then return true, false end
					if (tTable.Unit == nil) then return true, false end
					return true, true
				end
				)
				
				tTempDecisions[decision].DoFunc = (
				function(player, cityState, tTable)
					local decision = "Decisions_DenmarkRaid" .. cityState:GetID()
					local rewardGold = Game.GetRound((player:GetCurrentEra() + 1) * 75*iMod)
					cityState:ChangeMinorCivFriendshipWithMajor(player:GetID(), -60)
					if GetRandom(1, 100) <= tTable.Chance then
						tTable.Unit:Kill()
					end
					player:ChangeGold(rewardGold)
					player:ChangeNumResourceTotal(resourceCaptainsID, -1)
					local numTimesEnacted = load(player, "Decisions_DenmarkRaid") + 1
					save(player, "Decisions_DenmarkRaid", numTimesEnacted)
					save(player, decision, true)
					JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_DENMARK_VIKING_RAID", player:GetName(), player:GetCivilizationShortDescription(), cityState:GetName()))
				end
				)
			end
		end
	end
	)

Decisions_AddCivilisationSpecific(civilizationDenmarkID, "Decisions_DenmarkRaid", Decisions_DenmarkRaid)
end
--------------------------------------------------------------------------------------------------------------------------
-- Denmark: Call the Thing
--------------------------------------------------------------------------------------------------------------------------
local policyDecisionsDenmarkFormaliseThingID = GameInfoTypes["POLICY_DECISIONS_DENMARKTHING"]
local Decisions_DenmarkThing = {}
	Decisions_DenmarkThing.Name = "TXT_KEY_DECISIONS_JFD_DENMARK_THING"
	Decisions_DenmarkThing.Desc = "TXT_KEY_DECISIONS_JFD_DENMARK_THING_DESC"
	HookDecisionCivilizationIcon(Decisions_DenmarkThing, "CIVILIZATION_DENMARK")
	Decisions_DenmarkThing.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationDenmarkID then return false, false end
		if player:HasPolicy(policyDecisionsDenmarkFormaliseThingID) then
			Decisions_DenmarkThing.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_DENMARK_THING_ENACTED_DESC")
			return false, false, true
		end
		local minSovereignty = 65
		Decisions_DenmarkThing.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_DENMARK_THING_DESC", minSovereignty)
		if (not player:HasGovernment()) then return true, false end
		if player:GetSovereignty() < minSovereignty then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		if player:GetCurrentEra() < eraMedievalID then return false, false end
		local numUnits = 0
		for unit in player:Units() do
			if unit:GetUnitCombatType() == unitCombatMeleeID then
				numUnits = numUnits + 1
			end
		end
		if numUnits < 8 then return true, false end
		return true, true
	end
	)
	
	Decisions_DenmarkThing.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:GrantPolicy(policyDecisionsDenmarkFormaliseThingID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationDenmarkID, "Decisions_DenmarkThing", Decisions_DenmarkThing)
--------------------------------------------------------------------------------------------------------------------------
-- Egypt
--------------------------------------------------------------------------------------------------------------------------
local civilizationEgyptID  = GameInfoTypes["CIVILIZATION_EGYPT"]
--------------------------------------------------------------------------------------------------------------------------
-- Egypt: Establish the Nomes
--------------------------------------------------------------------------------------------------------------------------
local Decisions_JFD_Egypt_Nomes = {}
	Decisions_JFD_Egypt_Nomes.Name = "TXT_KEY_DECISIONS_JFD_EGYPT_NOMES"
	Decisions_JFD_Egypt_Nomes.Desc = "TXT_KEY_DECISIONS_JFD_EGYPT_NOMES_DESC"
	Decisions_JFD_Egypt_Nomes.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Egypt_Nomes, "CIVILIZATION_EGYPT")
	Decisions_JFD_Egypt_Nomes.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationEgyptID then return false, false end
		local leaderTitleShort = player:GetLeaderTitleShort()
		if load(player, "Decisions_JFD_Egypt_Nomes") == true then
			Decisions_JFD_Egypt_Nomes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_EGYPT_NOMES_ENACTED_DESC", leaderTitleShort)
			return false, false, true
		end
		local cost = Game.GetRound(50*iMod)
		Decisions_JFD_Egypt_Nomes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_EGYPT_NOMES_DESC", cost, leaderTitleShort)
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if player:GetFaith() < cost then return true, false end
		if player:GetGold() < cost then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Egypt_Nomes.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		local cost = Game.GetRound(50*iMod)
		player:ChangeFaith(-cost)
		player:ChangeGold(-cost)
		save(player, "Decisions_JFD_Egypt_Nomes", true)
	end
	)

	Decisions_JFD_Egypt_Nomes.Monitors = {}
	Decisions_JFD_Egypt_Nomes.Monitors[LuaEvents.DecisionEnacted] =  (
	function(playerID, sDecision)
		local player = Players[playerID]
		if sDecision == "Decisions_JFD_Egypt_Nomarchs" or sDecision == "Decisions_JFD_Egypt_Pharaoh" then return end
		if player:GetCivilizationType() ~= civilizationEgyptID then return false, false end
		local decision = load(player, "Decisions_EgyptianEmpower")
		local reward = Game.GetRound((player:GetCurrentEra() + 1)*iMod * 75)
		if decision == "Decisions_JFD_Egypt_Pharaoh" then
			player:ChangeFaith(reward)
		elseif decision == "Decisions_JFD_Egypt_Nomarchs" then
			player:ChangeGold(reward)
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationEgyptID, "Decisions_JFD_Egypt_Nomes", Decisions_JFD_Egypt_Nomes)
--------------------------------------------------------------------------------------------------------------------------
-- Egypt: Establish the Nomes (Empower the Pharaoh)
--------------------------------------------------------------------------------------------------------------------------
local Decisions_JFD_Egypt_Pharaoh = {}
	Decisions_JFD_Egypt_Pharaoh.Name = "TXT_KEY_DECISIONS_JFD_EGYPT_PHAROAH"
	Decisions_JFD_Egypt_Pharaoh.Desc = "TXT_KEY_DECISIONS_JFD_EGYPT_PHAROAH_DESC"
	Decisions_JFD_Egypt_Pharaoh.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Egypt_Pharaoh, "CIVILIZATION_EGYPT")
	Decisions_JFD_Egypt_Pharaoh.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationEgyptID then return false, false end
		local leaderTitleShort = player:GetLeaderTitleShort()
		local govtTitleShort = player:GetGovernmentShortDescription()
		if load(player, "Decisions_JFD_Egypt_Nomes") ~= true then return false, false end
		local rewardFaith = Game.GetRound((player:GetCurrentEra() + 1)*iMod * 75)
		if load(player, "Decisions_EgyptianEmpower") == "Decisions_JFD_Egypt_Pharaoh" then
			Decisions_JFD_Egypt_Pharaoh.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_EGYPT_PHAROAH_ENACTED_DESC", govtTitleShort, leaderTitleShort, player:GetName(), rewardFaith)
			return false, false, true
		end
		Decisions_JFD_Egypt_Pharaoh.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_EGYPT_PHAROAH_DESC", govtTitleShort, leaderTitleShort, player:GetName(), rewardFaith)
		if (player:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Egypt_Pharaoh.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		save(player, "Decisions_EgyptianEmpower", "Decisions_JFD_Egypt_Pharaoh")
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationEgyptID, "Decisions_JFD_Egypt_Pharaoh", Decisions_JFD_Egypt_Pharaoh)
--------------------------------------------------------------------------------------------------------------------------
-- Egypt: Establish the Nomes (Empower the Nomarchs)
--------------------------------------------------------------------------------------------------------------------------
local Decisions_JFD_Egypt_Nomarchs = {}
	Decisions_JFD_Egypt_Nomarchs.Name = "TXT_KEY_DECISIONS_JFD_EGYPT_NOMARCHS"
	Decisions_JFD_Egypt_Nomarchs.Desc = "TXT_KEY_DECISIONS_JFD_EGYPT_NOMARCHS_DESC"
	Decisions_JFD_Egypt_Nomarchs.Type = "Civilization"
	Decisions_JFD_Egypt_Nomarchs.Weight = 0
	HookDecisionCivilizationIcon(Decisions_JFD_Egypt_Nomarchs, "CIVILIZATION_EGYPT")
	Decisions_JFD_Egypt_Nomarchs.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationEgyptID then return false, false end
		local leaderTitleShort = player:GetLeaderTitleShort()
		local govtTitleShort = player:GetGovernmentShortDescription()
		if load(player, "Decisions_JFD_Egypt_Nomes") ~= true then return false, false end
		local rewardGold = Game.GetRound((player:GetCurrentEra() + 1)*iMod * 75)
		if load(player, "Decisions_EgyptianEmpower") == "Decisions_JFD_Egypt_Nomarchs" then
			Decisions_JFD_Egypt_Nomarchs.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_EGYPT_NOMARCHS_ENACTED_DESC", leaderTitleShort, govtTitleShort, rewardGold)
			return false, false, true
		end
		Decisions_JFD_Egypt_Nomarchs.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_EGYPT_NOMARCHS_DESC", leaderTitleShort, govtTitleShort, rewardGold)
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Egypt_Nomarchs.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		save(player, "Decisions_EgyptianEmpower", "Decisions_JFD_Egypt_Nomarchs")
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationEgyptID, "Decisions_JFD_Egypt_Nomarchs", Decisions_JFD_Egypt_Nomarchs)
--------------------------------------------------------------------------------------------------------------------------
-- Egypt: Excavate the Valley of the Kings
--------------------------------------------------------------------------------------------------------------------------
local buildingHieroglyphsCultureID = GameInfoTypes["BUILDING_DECISIONS_EGYPTVALLEYOFTHEKINGS_C"]
local buildingHieroglyphsFaithID   = GameInfoTypes["BUILDING_DECISIONS_EGYPTVALLEYOFTHEKINGS_F"]
if resourceInventorsID then
local Decisions_JFD_Egypt_Hieroglyphs = {}
	Decisions_JFD_Egypt_Hieroglyphs.Name = "TXT_KEY_DECISIONS_JFD_EGYPT_HIEROGLYPHS"
	Decisions_JFD_Egypt_Hieroglyphs.Desc = "TXT_KEY_DECISIONS_JFD_EGYPT_HIEROGLYPHS_DESC"
	Decisions_JFD_Egypt_Hieroglyphs.Type = "Civilization"
	Decisions_JFD_Egypt_Hieroglyphs.Wonders = {}
	for tBuilding in GameInfo.Buildings() do

		local buildIDing = tBuilding.ID
		local sBuildingClass = tBuilding.BuildingClass

		if GameInfo.BuildingClasses[sBuildingClass].MaxGlobalInstances == 1 or GameInfo.BuildingClasses[sBuildingClass].MaxPlayerInstances == 1 then

			local numCulture = 0
			local numFaith = 0
			for row in GameInfo.Building_YieldChanges("YieldType = 'YIELD_CULTURE' OR YieldType = 'YEIDL_FAITH'") do
				if GameInfoTypes[row.BuildingType] == buildIDing then
					if row.YieldType == "YIELD_CULTURE" then
						numCulture = numCulture + row.Yield
					elseif row.YieldType == "YIELD_FAITH" then
						numFaith = numFaith + row.Yield
					end
				end
			end
			Decisions_JFD_Egypt_Hieroglyphs.Wonders[buildIDing] = {Culture = numCulture, Faith = numFaith}
		end
	end

	HookDecisionCivilizationIcon(Decisions_JFD_Egypt_Hieroglyphs, "CIVILIZATION_EGYPT")
	Decisions_JFD_Egypt_Hieroglyphs.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_EGYPT then return false, false end
		if load(player, "Decisions_JFD_Egypt_Hieroglyphs") == true then
			Decisions_JFD_Egypt_Hieroglyphs.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_EGYPT_HIEROGLYPHS_ENACTED_DESC")
			return false, false, true
		end
		local costGold = Game.GetRound(250*iMod)
		Decisions_JFD_Egypt_Hieroglyphs.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_EGYPT_HIEROGLYPHS_DESC", costGold)
		if player:GetGold() < costGold then return true, false end
		if player:GetNumResourceAvailable(resourceInventorsID, false) < 2 then return true, false end
		if (not player:HasTech(techMasonryID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Egypt_Hieroglyphs.DoFunc = (
	function(player)
		local costGold = Game.GetRound(250*iMod)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(resourceInventorsID, -2)
		Decisions_JFD_Egypt_Hieroglyphs.Monitors[GameEvents.PlayerDoTurn](player:GetID())
		save(player, "Decisions_JFD_Egypt_Hieroglyphs", true)
	end
	)

	Decisions_JFD_Egypt_Hieroglyphs.Monitors = {}
	Decisions_JFD_Egypt_Hieroglyphs.Monitors[GameEvents.PlayerDoTurn] =  (
	function(playerID)
		local player = Players[playerID]
		if load(player, "Decisions_JFD_Egypt_Hieroglyphs") == true then
			for city in player:Cities() do
				local currentProductionID = city:GetProductionBuilding()
				if Decisions_JFD_Egypt_Hieroglyphs.Wonders[currentProductionID] then
					city:SetNumRealBuilding(buildingHieroglyphsFaithID, Decisions_JFD_Egypt_Hieroglyphs.Wonders[currentProductionID].Faith)
					city:SetNumRealBuilding(buildingHieroglyphsCultureID, Decisions_JFD_Egypt_Hieroglyphs.Wonders[currentProductionID].Culture)
				else
					city:SetNumRealBuilding(buildingHieroglyphsFaithID, 0)
					city:SetNumRealBuilding(buildingHieroglyphsCultureID, 0)	
				end
			end
		end
	end
	)

	Decisions_JFD_Egypt_Hieroglyphs.Monitors[Events.SerialEventCityInfoDirty] =  (
	function()
		Decisions_JFD_Egypt_Hieroglyphs.Monitors[GameEvents.PlayerDoTurn](Game.GetActivePlayer())
	end
	)

Decisions_AddCivilisationSpecific(civilizationEgyptID, "Decisions_JFD_Egypt_Hieroglyphs", Decisions_JFD_Egypt_Hieroglyphs)
end
--------------------------------------------------------------------------------------------------------------------------
-- England
--------------------------------------------------------------------------------------------------------------------------
local civilizationEnglandID = GameInfoTypes["CIVILIZATION_ENGLAND"]
--------------------------------------------------------------------------------------------------------------------------
-- England: Patronise the Virginia Company
--------------------------------------------------------------------------------------------------------------------------
local techAstronomyID = GameInfoTypes["TECH_ASTRONOMY"]
if resourceDignitariesID then
local Decisions_JFD_England_VirginiaCompany = {}
	Decisions_JFD_England_VirginiaCompany.Name = "TXT_KEY_DECISIONS_JFD_ENGLAND_VIRGINIA_COMPANY"
	Decisions_JFD_England_VirginiaCompany.Desc = "TXT_KEY_DECISIONS_JFD_ENGLAND_VIRGINIA_COMPANY_DESC"
	Decisions_JFD_England_VirginiaCompany.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_England_VirginiaCompany, "CIVILIZATION_ENGLAND")
	Decisions_JFD_England_VirginiaCompany.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationEnglandID then return false, false end
		if load(player, "Decisions_JFD_England_VirginiaCompany") == true then
			Decisions_JFD_England_VirginiaCompany.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ENGLAND_VIRGINIA_COMPANY_ENACTED_DESC")
			return false, false, true
		end
		local costGold = Game.GetRound(800*iMod)
		Decisions_JFD_England_VirginiaCompany.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ENGLAND_VIRGINIA_COMPANY_DESC", costGold)
		if player:GetGold() < costGold then return true, false end
		if (not player:HasTech(techAstronomyID)) then return true, false end
		if player:GetNumResourceAvailable(resourceDignitariesID, false) < 2 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_England_VirginiaCompany.DoFunc = (
	function(player)
		local costGold = Game.GetRound(800*iMod)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(resourceDignitariesID, -2)
		save(player, "Decisions_JFD_England_VirginiaCompany", true)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ENGLAND_VIRGINIA_COMPANY", player:GetName(), player:GetCivilizationShortDescription()))
	end
	)
	
	Decisions_JFD_England_VirginiaCompany.Monitors = {}
	Decisions_JFD_England_VirginiaCompany.Monitors[GameEvents.PlayerCityFounded] = (
	function(playerID, plotX, plotY)
		local player = Players[playerID]
		if load(player, "Decisions_JFD_England_VirginiaCompany") ~= true then return end
		local plot = Map.GetPlot(plotX, plotY)
		local city = plot:GetPlotCity()
		local cityID = city:GetID()
		for adjacentPlot in PlotAreaSweepIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
			local resourceID = adjacentPlot:GetResourceType()
			local ownerID = adjacentPlot:GetOwner()
			if (resourceID ~= -1) and (ownerID == playerID or ownerID == -1) then
				if GameInfo.Resources[resourceID].ResourceClassType == "RESOURCECLASS_LUXURY" then
					local improvementID = GameInfoTypes.IMPROVEMENT_LANDMARK
					for row in GameInfo.Improvement_ResourceTypes("ResourceType = '" .. GameInfo.Resources[resourceID].Type .. "'") do
						if improvementID > GameInfoTypes[row.ImprovementType] then
							improvementID = GameInfoTypes[row.ImprovementType]
						end
					end
					if improvementID ~= -1 then
						adjacentPlot:SetOwner(playerID, cityID, true, true)
						local buildID = -1
						for row in GameInfo.Builds("ImprovementType = '" .. GameInfo.Improvements[improvementID].Type .. "'") do
							buildID = row.ID
							break
						end
						if buildID ~= -1 then
							if adjacentPlot:IsBuildRemovesFeature(buildID) then
								adjacentPlot:SetFeatureType(-1)
							end
							adjacentPlot:SetImprovementType(improvementID)
						end
					end
				end
			end
		end	
		
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationEnglandID, "Decisions_JFD_England_VirginiaCompany", Decisions_JFD_England_VirginiaCompany)
end
--------------------------------------------------------------------------------------------------------------------------
-- England: Create the Counter Armada
--------------------------------------------------------------------------------------------------------------------------
local domainSeaID						    = GameInfoTypes["DOMAIN_SEA"]
local policyDecisionsEnglandCounterArmadaID = GameInfoTypes["POLICY_DECISIONS_ENGLISHARMADA"]
if resourceCaptainsID then
local Decisions_JFD_England_CounterArmada = {}
	Decisions_JFD_England_CounterArmada.Name = "TXT_KEY_DECISIONS_JFD_ENGLAND_COUNTER_ARMADA"
	Decisions_JFD_England_CounterArmada.Desc = "TXT_KEY_DECISIONS_JFD_ENGLAND_COUNTER_ARMADA_DESC"
	Decisions_JFD_England_CounterArmada.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_England_CounterArmada, "CIVILIZATION_ENGLAND")
	Decisions_JFD_England_CounterArmada.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationEnglandID then return false, false end
		if player:HasPolicy(policyDecisionsEnglandCounterArmadaID) then
			Decisions_JFD_England_CounterArmada.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ENGLAND_COUNTER_ARMADA_ENACTED_DESC")
			return false, false, true
		end
		Decisions_JFD_England_CounterArmada.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ENGLAND_COUNTER_ARMADA_DESC")
		if (not player:GetCapitalCity()) then return true, false end
		if player:GetNumResourceAvailable(resourceCaptainsID, false) < 2 then return true, false end
		local numUnits = 0
		for unit in player:Units() do
			if (unit:GetDomainType() == domainSeaID and unit:IsCombatUnit()) then
				numUnits = numUnits + 1
				if numUnits >= 5 then break end
			end
		end
		if numUnits < 5 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_England_CounterArmada.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(resourceCaptainsID, -2)
		player:GrantPolicy(policyDecisionsEnglandCounterArmadaID, true)
		for unit in player:Units() do
			if (unit:GetDomainType() == domainSeaID and unit:IsCombatUnit()) then
				unit:ChangeExperience(10)
			end
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationEnglandID, "Decisions_JFD_England_CounterArmada", Decisions_JFD_England_CounterArmada)
end
--------------------------------------------------------------------------------------------------------------------------
-- Ethiopia
--------------------------------------------------------------------------------------------------------------------------
local civilizationEthiopiaID = GameInfoTypes["CIVILIZATION_ETHIOPIA"]
--------------------------------------------------------------------------------------------------------------------------
-- Ethiopia: Mint Aksumite coinage
--------------------------------------------------------------------------------------------------------------------------
local buildingSteleID				   = GameInfoTypes["BUILDING_STELE"]
local policyDecisionsEthiopiaCoinageID = GameInfoTypes["POLICY_DECISIONS_ETHIOPIACOINAGE"]
local techCurrencyID				   = GameInfoTypes["TECH_CURRENCY"]
local Decisions_JFD_Ethiopia_AksumiteCoinage = {}
    Decisions_JFD_Ethiopia_AksumiteCoinage.Name = "TXT_KEY_DECISIONS_JFD_ETHIOPIA_AKSUMITE_COINAGE"
	Decisions_JFD_Ethiopia_AksumiteCoinage.Desc = "TXT_KEY_DECISIONS_JFD_ETHIOPIA_AKSUMITE_COINAGE_DESC"
	Decisions_JFD_Ethiopia_AksumiteCoinage.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Ethiopia_AksumiteCoinage, "CIVILIZATION_ETHIOPIA")
	Decisions_JFD_Ethiopia_AksumiteCoinage.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationEthiopiaID then return false, false end
		local govtTitleShort = player:GetGovernmentShortDescription()
		if player:HasPolicy(policyDecisionsEthiopiaCoinageID) then
			Decisions_JFD_Ethiopia_AksumiteCoinage.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ETHIOPIA_AKSUMITE_COINAGE_ENACTED_DESC", govtTitleShort)
			return false, false, true
		end
		
		local costCulture = Game.GetRound(150*iMod)
		Decisions_JFD_Ethiopia_AksumiteCoinage.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ETHIOPIA_AKSUMITE_COINAGE_DESC", govtTitleShort, costCulture)
		if player:GetJONSCulture() < costCulture then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		if player:GetNumCities() > player:CountNumBuildings(buildingSteleID) then return true, false end
		if (not player:HasTech(techCurrencyID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Ethiopia_AksumiteCoinage.DoFunc = (
	function(player)
		local costCulture = Game.GetRound(150*iMod)
		player:ChangeJONSCulture(-costCulture)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:GrantPolicy(policyDecisionsEthiopiaCoinageID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationEthiopiaID, "Decisions_JFD_Ethiopia_AksumiteCoinage", Decisions_JFD_Ethiopia_AksumiteCoinage)
--------------------------------------------------------------------------------------------------------------------------
-- Ethiopia: Establish the Solomonic Dynasty
--------------------------------------------------------------------------------------------------------------------------
local epithetDecisionsEthiopiaConqueringLionID = GameInfoTypes["EPITHET_JFD_CONQUERING_LION"]
local techTheologyID 				  		   = GameInfoTypes["TECH_THEOLOGY"]
if resourceClericsID then
local Decisions_JFD_Ethiopia_SolomonicDynasty = {}
    Decisions_JFD_Ethiopia_SolomonicDynasty.Name = "TXT_KEY_DECISIONS_JFD_ETHIOPIA_SOLOMONIC_DYNASTY"
	Decisions_JFD_Ethiopia_SolomonicDynasty.Desc = "TXT_KEY_DECISIONS_JFD_ETHIOPIA_SOLOMONIC_DYNASTY_DESC"
	Decisions_JFD_Ethiopia_SolomonicDynasty.Type = "Cleric"
	HookDecisionCivilizationIcon(Decisions_JFD_Ethiopia_SolomonicDynasty, "CIVILIZATION_ETHIOPIA")
	Decisions_JFD_Ethiopia_SolomonicDynasty.CanFunc = (
	function(player)
		if (not userSettingsRTPEpithetsCore) then return false, false end
		if player:GetCivilizationType() ~= civilizationEthiopiaID then return false, false end
		if player:HasPolicy(policyDecisionsEthiopiaDynastyID) then
			Decisions_JFD_Ethiopia_SolomonicDynasty.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ETHIOPIA_SOLOMONIC_DYNASTY_ENACTED_DESC")
			return false, false, true
		end
		local costFaith = Game.GetRound(200*iMod)
		Decisions_JFD_Ethiopia_SolomonicDynasty.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ETHIOPIA_SOLOMONIC_DYNASTY_DESC", costFaith)		
		if player:GetFaith() < costFaith then return true, false end
		if player:GetNumResourceAvailable(resourceClericsID, false) < 2 then return true, false end
		if (not player:HasTech(techTheologyID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Ethiopia_SolomonicDynasty.DoFunc = (
	function(player)
		local costFaith = Game.GetRound(200*iMod)
		player:ChangeFaith(-costFaith)
		player:ChangeNumResourceTotal(resourceClericsID, -2)
		LuaEvents.JFD_RTP_Epithets_ShowChooseEpithetPopup(epithetDecisionsEthiopiaConqueringLionID)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ETHIOPIA_ESTABLISH_DYNASTY", player:GetName(), player:GetCivilizationShortDescription()))
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationEthiopiaID, "Decisions_JFD_Ethiopia_SolomonicDynasty", Decisions_JFD_Ethiopia_SolomonicDynasty)
end
--------------------------------------------------------------------------------------------------------------------------
-- France
--------------------------------------------------------------------------------------------------------------------------
local civilizationFranceID = GameInfoTypes["CIVILIZATION_FRANCE"]
--------------------------------------------------------------------------------------------------------------------------
-- France: Organise the Grande Armée
--------------------------------------------------------------------------------------------------------------------------
local policyDecisionsFranceGrandArmeeID = GameInfoTypes["POLICY_DECISIONS_FRANCEARMEE"]
local unitCombatGunID = GameInfoTypes["UNITCOMBAT_GUN"]
if resourceCaptainsID then
local Decisions_JFD_France_GrandArmee = {}
	Decisions_JFD_France_GrandArmee.Name = "TXT_KEY_DECISIONS_JFD_FRANCE_GRAND_ARMEE"
	Decisions_JFD_France_GrandArmee.Desc = "TXT_KEY_DECISIONS_JFD_FRANCE_GRAND_ARMEE_DESC"
	Decisions_JFD_France_GrandArmee.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_France_GrandArmee, "CIVILIZATION_FRANCE")
	Decisions_JFD_France_GrandArmee.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationFranceID then return false, false end
		local govtTitleShort = player:GetGovernmentShortDescription()
		if player:HasPolicy(policyDecisionsFranceGrandArmeeID) then
			Decisions_JFD_France_GrandArmee.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_FRANCE_GRAND_ARMEE_ENACTED_DESC", govtTitleShort)
			return false, false, true
		end
		Decisions_JFD_France_GrandArmee.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_FRANCE_GRAND_ARMEE_DESC", govtTitleShort)
		if (player:GetNumResourceAvailable(resourceCaptainsID, false) < 2) then return true, false end
		if (not player:HasTech(techGunpowderID)) then return true, false end
		local numUnits = 0
		for unit in player:Units() do
			if unit:GetUnitCombatType() == unitCombatGunID then
				numUnits = numUnits + 1
				if numUnits <= 8 then break end
			end
		end
		if numUnits < 8 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_France_GrandArmee.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(resourceCaptainsID, -2)
		player:GrantPolicy(policyDecisionsFranceGrandArmeeID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationFranceID, "Decisions_JFD_France_GrandArmee", Decisions_JFD_France_GrandArmee)
end
--------------------------------------------------------------------------------------------------------------------------
-- France: Revive the Estates-General
--------------------------------------------------------------------------------------------------------------------------
local Decisions_JFD_France_EstatesGeneral = {}
	Decisions_JFD_France_EstatesGeneral.Name = "TXT_KEY_DECISIONS_JFD_FRANCE_ESTATES_GENERAL"
	Decisions_JFD_France_EstatesGeneral.Desc = "TXT_KEY_DECISIONS_JFD_FRANCE_ESTATES_GENERAL_DESC"
	Decisions_JFD_France_EstatesGeneral.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_France_EstatesGeneral, "CIVILIZATION_FRANCE")
	Decisions_JFD_France_EstatesGeneral.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationFranceID then return false, false end
		local eraID = load(player, "Decisions_JFD_France_EstatesGeneral")
		local currentEraID = player:GetCurrentEra()
		if eraID ~= nil then
			if eraID < currentEraID then
				save(player, "Decisions_JFD_France_EstatesGeneral", nil)
			else
				Decisions_JFD_France_EstatesGeneral.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_FRANCE_ESTATES_GENERAL_ENACTED_DESC")
				return false, false, true
			end
		end
		Decisions_JFD_France_EstatesGeneral.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_FRANCE_ESTATES_GENERAL_DESC")
		if (not player:HasGovernment()) then return true, false end
		if (not player:HasLegislature()) then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		if player:GetNumResourceAvailable(resourceDignitariesID, false) < 2 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_France_EstatesGeneral.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(resourceDignitariesID, -2)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:SetGovernmentCooldown(0)
		local reformCooldown = Game.GetRound(player:GetReformCooldown()/2)
		player:ChangeReformCooldown(-reformCooldown)
		save(player, "Decisions_JFD_France_EstatesGeneral", player:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationFranceID, "Decisions_JFD_France_EstatesGeneral", Decisions_JFD_France_EstatesGeneral)
--------------------------------------------------------------------------------------------------------------------------
-- Germany
--------------------------------------------------------------------------------------------------------------------------
local civilizationGermanyID = GameInfoTypes["CIVILIZATION_GERMANY"]
--------------------------------------------------------------------------------------------------------------------------
-- Germany: Consolidate the German Confederation
--------------------------------------------------------------------------------------------------------------------------
local buildingGermanConfederationID  = GameInfoTypes["BUILDING_DECISIONS_GERMANCONFEDERATION"]
local buildingGermanConfederation2ID = GameInfoTypes["BUILDING_DECISIONS_GERMANCONFEDERATION2"]
local reformStructureFederationID	 = GameInfoTypes["REFORM_JFD_STRUCTURE_FEDERATION"]
local Decisions_JFD_German_Confederation = {}
	Decisions_JFD_German_Confederation.Name = "TXT_KEY_DECISIONS_JFD_GERMANY_CONFEDERATION"
	Decisions_JFD_German_Confederation.Desc = "TXT_KEY_DECISIONS_JFD_GERMANY_CONFEDERATION_DESC"
	Decisions_JFD_German_Confederation.Pedia = "TXT_KEY_DECISIONS_BUILDING_GERMANCONFEDERATION"
	Decisions_JFD_German_Confederation.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_German_Confederation, "CIVILIZATION_GERMANY")
	Decisions_JFD_German_Confederation.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationGermanyID then return false, false end
		local govtTitleShort = player:GetGovernmentShortDescription()
		if load(player, "Decisions_JFD_German_Confederation") == true then
		Decisions_JFD_German_Confederation.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_GERMANY_CONFEDERATION_ENACTED_DESC", govtTitleShort)
			return false, false, true
		end
		local costCulture = Game.GetRound(200*iMod)
		local costGold = Game.GetRound(800*iMod)
		Decisions_JFD_German_Confederation.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_GERMANY_CONFEDERATION_DESC", govtTitleShort, costGold, costCulture)
		if player:GetCurrentEra() < eraIndustrialID then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 4 then return true, false end
		if player:GetJONSCulture() < costCulture then return true, false end
		if player:GetGold() < costGold then return true, false end
		local numCityStates = 0
		for minorPlayerID, minorPlayer in pairs(Players) do
			if (minorPlayer:IsAlive() and minorPlayer:IsMinorCiv() and minorPlayer:GetAlly() == player:GetID()) then
				numCityStates = numCityStates + 1
				if numCityStates >= 4 then break end
			end
		end
		for city in player:Cities() do
			local originalOwnerID = city:GetOriginalOwner()
			local originalOwner = Players[originalOwnerID]
			if (originalOwner and originalOwner:IsMinorCiv()) then
				numCityStates = numCityStates + 1
				if numCityStates >= 4 then break end
			end	
		end
		if numCityStates < 4 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_German_Confederation.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -4)
		local costCulture = Game.GetRound(200*iMod)
		local costGold = Game.GetRound(800*iMod)
		player:ChangeJONSCulture(-costCulture)
		player:ChangeGold(-costGold)		
		player:GetCapitalCity():SetNumRealBuilding(buildingGermanConfederationID, 1)
		Decisions_JFD_German_Confederation.Monitors[GameEvents.PlayerDoTurn](player:GetID())
		player:SetHasReform(reformStructureFederationID, true, true)
		save(player, "Decisions_JFD_German_Confederation", true)
	end
	)

	Decisions_JFD_German_Confederation.Monitors = {}
	Decisions_JFD_German_Confederation.Monitors[GameEvents.PlayerDoTurn] =  (	
	function(playerID)
		local player = Players[playerID]
		if player:CountNumBuildings(buildingGermanConfederationID) > 0 then
			local city = player:GetCapitalCity()
			if (not city) then return end
			local numCityStates = 0
			for minorPlayerID, minorPlayer in pairs(Players) do
				if (minorPlayer:IsAlive() and minorPlayer:IsMinorCiv() and minorPlayer:GetAlly() == player:GetID()) then
					numCityStates = numCityStates + 1
				end
			end
			for city in player:Cities() do
				local originalOwnerID = city:GetOriginalOwner()
				local originalOwner = Players[originalOwnerID]
				if (originalOwner and originalOwner:IsMinorCiv()) then
					numCityStates = numCityStates + 1
					if numCityStates >= 4 then break end
				end	
			end
			city:SetNumRealBuilding(buildingGermanConfederation2ID, numCityStates)
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationGermanyID, "Decisions_JFD_German_Confederation", Decisions_JFD_German_Confederation)
--------------------------------------------------------------------------------------------------------------------------
-- Germany: Regulate the Zünfte
--------------------------------------------------------------------------------------------------------------------------
local policyDecisionsGermanyZunfteID = GameInfoTypes["POLICY_DECISIONS_GERMANGUILDLAWS"]
local Decisions_JFD_Germany_Zunfte = {}
	Decisions_JFD_Germany_Zunfte.Name = "TXT_KEY_DECISIONS_JFD_GERMANY_ZUNFTE"
	Decisions_JFD_Germany_Zunfte.Desc = "TXT_KEY_DECISIONS_JFD_GERMANY_ZUNFTE_DESC"
	Decisions_JFD_Germany_Zunfte.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Germany_Zunfte, "CIVILIZATION_GERMANY")
	Decisions_JFD_Germany_Zunfte.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationGermanyID then return false, false end
		if (not userSettingsCIDInvestmentsCore) then return end
		if player:HasPolicy(policyDecisionsGermanyZunfteID) then
			Decisions_JFD_Germany_Zunfte.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_GERMANY_ZUNFTE_ENACTED_DESC")
			return false, false, true
		end
		Decisions_JFD_Germany_Zunfte.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_GERMANY_ZUNFTE_DESC")
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		if (not player:HasTech(techGuildsID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Germany_Zunfte.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:GrantPolicy(policyDecisionsGermanyZunfteID, true)	
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationGermanyID, "Decisions_JFD_Germany_Zunfte", Decisions_JFD_Germany_Zunfte)
--------------------------------------------------------------------------------------------------------------------------
-- Greece
--------------------------------------------------------------------------------------------------------------------------
local civilizationGreeceID = GameInfoTypes["CIVILIZATION_GREECE"]
--------------------------------------------------------------------------------------------------------------------------
-- Greece: Develop the Phalanx formation
--------------------------------------------------------------------------------------------------------------------------
local techIronWorkingID  = GameInfoTypes["TECH_IRON_WORKING"]
local promotionPhalanxID = GameInfoTypes["PROMOTION_DECISIONS_GREECEPHALANX"]
local unitHopliteID 	 = GameInfoTypes["UNIT_GREEK_HOPLITE"]
local unitPikemanID 	 = GameInfoTypes["UNIT_PIKEMAN"]
if resourceCaptainsID then
local Decisions_JFD_Greece_Phalanx = {}
    Decisions_JFD_Greece_Phalanx.Name = "TXT_KEY_DECISIONS_JFD_GREECE_PHALANX"
	Decisions_JFD_Greece_Phalanx.Desc = "TXT_KEY_DECISIONS_JFD_GREECE_PHALANX_DESC"
	Decisions_JFD_Greece_Phalanx.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Greece_Phalanx, "CIVILIZATION_GREECE")
	Decisions_JFD_Greece_Phalanx.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationGreeceID then return false, false end
		if load(player, "Decisions_JFD_Greece_Phalanx") == true then
			Decisions_JFD_Greece_Phalanx.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_GREECE_PHALANX_ENACTED_DESC")
			return false, false, true
		end
		local costGold = Game.GetRound(400*iMod)
		Decisions_JFD_Greece_Phalanx.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_GREECE_PHALANX_DESC", costGold)
		if player:GetGold() < costGold then return true, false end
		if player:GetNumResourceAvailable(resourceCaptainsID, false) < 1 then return true, false end
		if (not player:HasTech(techIronWorkingID)) then return true, false end
		local numUnits = 0
		for unit in player:Units() do
			if unit:GetUnitType() == unitHopliteID then
				numUnits = numUnits + 1
				if numUnits >= 5 then break end
			end
		end
		if numUnits < 5 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Greece_Phalanx.DoFunc = (
	function(player)
		local costGold = Game.GetRound(400*iMod)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(resourceCaptainsID, -1)
		local hoplites = {}
		for unit in player:Units() do
			if unit:GetUnitType() == unitHopliteID then table.insert(hoplites, unit) end
		end
		for iKey, unit in ipairs(hoplites) do
			local newUnit = player:InitUnit(unitPikemanID, unit:GetX(), unit:GetY())
			newUnit:Convert(unit)
			newUnit:SetHasPromotion(promotionPhalanxID, true)
		end
		save(player, "Decisions_JFD_Greece_Phalanx", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationGreeceID, "Decisions_JFD_Greece_Phalanx", Decisions_JFD_Greece_Phalanx)
end
--------------------------------------------------------------------------------------------------------------------------
-- Greece: Rally the Philhellenes
--------------------------------------------------------------------------------------------------------------------------
if resourceDignitariesID then
local Decisions_JFD_Greece_Philhellenism = {}
    Decisions_JFD_Greece_Philhellenism.Name = "TXT_KEY_DECISIONS_JFD_GREECE_PHILHELLENISM"
	Decisions_JFD_Greece_Philhellenism.Desc = "TXT_KEY_DECISIONS_JFD_GREECE_PHILHELLENISM_DESC"
	Decisions_JFD_Greece_Philhellenism.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Greece_Philhellenism, "CIVILIZATION_GREECE")
	Decisions_JFD_Greece_Philhellenism.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationGreeceID then return false, false end
		if load(player, "Decisions_JFD_Greece_Philhellenism") == true then
			Decisions_JFD_Greece_Philhellenism.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_GREECE_PHILHELLENISM_ENACTED_DESC")
			return false, false, true
		end
		local costGold = Game.GetRound(600*iMod)
		Decisions_JFD_Greece_Philhellenism.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_GREECE_PHILHELLENISM_DESC", costGold)
		if player:GetGold() < costGold then return true, false end
		if player:GetNumResourceAvailable(resourceDignitariesID, false) < 2 then return true, false end
		if player:GetNumPolicyBranchesFinished() < 2 then return true, false end
		if player:GetCurrentEra() < eraIndustrialID then return true, false end
		local numAllies = 0
		for minorPlayerID, minorPlayer in pairs(Players) do
			if (minorPlayer:IsAlive() and minorPlayer:IsMinorCiv() and Teams[player:GetTeam()]:IsHasMet(minorPlayer:GetTeam())) then
				if minorPlayer:IsAllies(player:GetID()) then numAllies = numAllies + 1 end
				if numAllies >= 3 then break end
			end
		end
		if numAllies < 3 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Greece_Philhellenism.DoFunc = (
	function(player)
		local costGold = Game.GetRound(600*iMod)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(resourceDignitariesID, -2)
		save(player, "Decisions_JFD_Greece_Philhellenism", true)
	end
	)
	
	-- Main monitor func
	Decisions_JFD_Greece_Philhellenism.Monitors = {}
	Decisions_JFD_Greece_Philhellenism.Monitors[Events.WarStateChanged] =  (
	function(attackingPlayerID, defendingPlayerID, isAtWar)
	--For once we don't actually care who is the aggressor, so skip the check and allow it to run twice	
		if isAtWar then
			local playerAttacking = Players[attackingPlayerID]
			if (not playerAttacking:IsAtWar()) then return end
			--Check if defender contains any major civs
			local isMajor = false
			for playerID = 0, defineMaxMajorCivs-1, 1 do
				local player = Players[playerID]
				if player:GetTeam() == defendingPlayerID then isMajor = true end
			end
			if not(isMajor) then return end
			for playerID = 0, defineMaxMajorCivs-1, 1 do
				local player = Players[playerID]
				if player:GetTeam() == attackingPlayerID then Decisions_JFD_Greece_Philhellenism.PhilhellenismCheck(player) end
			end

		end
	end
	)
	
	--Define available Unit Types
	Decisions_JFD_Greece_Philhellenism.Data1 = {}
	for row in GameInfo.Units("CombatClass = 'UNITCOMBAT_MELEE' OR CombatClass = 'UNITCOMBAT_GUN'") do
		Decisions_JFD_Greece_Philhellenism.Data1[row.Type] = row.Combat
	end
	
	--Secondary monitor func
	Decisions_JFD_Greece_Philhellenism.PhilhellenismCheck = (
	function(player)
		if load(player, "Decisions_JFD_Greece_Philhellenism") ~= true then return end
		local numAllies = 0
		for minorPlayerID, minorPlayer in pairs(Players) do
			if (minorPlayer:IsAlive() and minorPlayer:IsMinorCiv() and Teams[player:GetTeam()]:IsHasMet(minorPlayer:GetTeam())) then
				if minorPlayer:IsAllies(player:GetID()) then numAllies = numAllies + 1 end
				if numAllies >= 3 then break end
			end
		end
		local unitIDType = nil
		for unitTypeID, combat in pairs(Decisions_JFD_Greece_Philhellenism.Data1) do
			if player:CanTrain(GameInfoTypes[unitTypeID]) then
				if unitIDType == nil then
					unitIDType = GameInfoTypes[unitTypeID]
				elseif combat > GameInfo.Units[unitIDType].Combat then
					unitIDType = GameInfoTypes[unitTypeID]
				end
			end
		end
		if unitIDType == nil then return end
		if numAllies < 1 then return end
		for num = 1, numAllies do
			local aiType = GameInfo.Units[unitIDType].DefaultUnitAI
			player:AddFreeUnit(unitIDType, GameInfoTypes[aiType])
		end
		if player:IsHuman() then
			Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_GREECE_PHILHELLENISM_NOTIFICATION"))
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationGreeceID, "Decisions_JFD_Greece_Philhellenism", Decisions_JFD_Greece_Philhellenism)
end
--------------------------------------------------------------------------------------------------------------------------
-- India
--------------------------------------------------------------------------------------------------------------------------
local civilizationIndiaID = GameInfoTypes["CIVILIZATION_INDIA"]
--------------------------------------------------------------------------------------------------------------------------
-- India: Found the House of Worship
--------------------------------------------------------------------------------------------------------------------------
local policyDecisionsIndiaHouseWorshipID = GameInfoTypes["POLICY_DECISIONS_INDIARELIGIONS"]
if resourceClericsID then
local Decisions_JFD_India_HouseOfWorship = {}
    Decisions_JFD_India_HouseOfWorship.Name = "TXT_KEY_DECISIONS_JFD_INDIA_HOUSE_WORSHIP"
	Decisions_JFD_India_HouseOfWorship.Desc = "TXT_KEY_DECISIONS_JFD_INDIA_HOUSE_WORSHIP_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_India_HouseOfWorship, "CIVILIZATION_INDIA")
	Decisions_JFD_India_HouseOfWorship.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationIndiaID then return false, false end
		if load(player, "Decisions_JFD_India_HouseOfWorship") == true then
			Decisions_JFD_India_HouseOfWorship.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_INDIA_HOUSE_WORSHIP_ENACTED_DESC")
			return false, false, true
		end
		local costFaith = Game.GetRound(100*iMod)
		Decisions_JFD_India_HouseOfWorship.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_INDIA_HOUSE_WORSHIP_DESC", costFaith)		
		if player:GetFaith() < costFaith then return true, false end
		if player:GetNumResourceAvailable(resourceClericsID, false) < 2 then return true, false end
		if GetNumReligionsinEmpire(player) < 2 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_India_HouseOfWorship.DoFunc = (
	function(player)
		local costFaith = Game.GetRound(100*iMod)
		player:ChangeFaith(-costFaith)
		player:ChangeNumResourceTotal(resourceClericsID, -2)
		player:GrandPolicy(policyDecisionsIndiaHouseWorshipID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationIndiaID, "Decisions_JFD_India_HouseOfWorship", Decisions_JFD_India_HouseOfWorship)
end
--------------------------------------------------------------------------------------------------------------------------
-- India: Standardise the Devanagari Script
--------------------------------------------------------------------------------------------------------------------------
if resourceClericsID then
local Decisions_JFD_India_DevangariScript = {}
    Decisions_JFD_India_DevangariScript.Name = "TXT_KEY_DECISIONS_JFD_INDIA_DEVANAGARI_SCRIPT"
	Decisions_JFD_India_DevangariScript.Desc = "TXT_KEY_DECISIONS_JFD_INDIA_DEVANAGARI_SCRIPT_DESC"
	Decisions_JFD_India_DevangariScript.Type = "Cleric"
	HookDecisionCivilizationIcon(Decisions_JFD_India_DevangariScript, "CIVILIZATION_INDIA")
	Decisions_JFD_India_DevangariScript.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationIndiaID then return false, false end
		if load(player, "Decisions_JFD_India_DevangariScript") == true then
			Decisions_JFD_India_DevangariScript.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_INDIA_DEVANAGARI_SCRIPT_ENACTED_DESC")
			return false, false, true
		end
		Decisions_JFD_India_DevangariScript.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_INDIA_DEVANAGARI_SCRIPT_DESC")
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if player:GetNumResourceAvailable(resourceClericsID, false) < 2 then return true, false end
		if player:GetCurrentEra() < eraMedievalID then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_India_DevangariScript.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeNumResourceTotal(resourceClericsID, -2)
		save(player, "Decisions_JFD_India_DevangariScript", true)
	end
	)
	
	Decisions_JFD_India_DevangariScript.Monitors = {}
	Decisions_JFD_India_DevangariScript.Monitors[GameEvents.SetPopulation] =  (
	function(plotX, plotY, oldPopuation, newPopulation)
		if newPopulation < oldPopuation then return end
		local plot = Map.GetPlot(plotX, plotY)
		local city = plot:GetPlotCity()
		local playerID = city:GetOwner()
		local player = Players[playerID]
		if (not load(player, "Decisions_JFD_India_DevangariScript")) then return end
		local reward = Game.GetRound(((newPopulation ^ 1.88) / 4)*iMod)
		LuaEvents.Sukritact_ChangeResearchProgress(player:GetID(), reward)
		player:ChangeJONSCulture(reward)
		if player:IsHuman() then
			Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_INDIA_DEVANAGARI_SCRIPT_NOTIFICATION", city:GetName(), reward))
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationIndiaID, "Decisions_JFD_India_DevangariScript", Decisions_JFD_India_DevangariScript)
end
--------------------------------------------------------------------------------------------------------------------------
-- Indonesia
--------------------------------------------------------------------------------------------------------------------------
local civilizationIndonesiaID = GameInfoTypes["CIVILIZATION_INDONESIA"]
--------------------------------------------------------------------------------------------------------------------------
-- Indonesia: Sumpah Palapa
--------------------------------------------------------------------------------------------------------------------------
local unitGreatGeneralID = GameInfoTypes["UNIT_GREAT_GENERAL"]
if resourceCaptainsID then
tDecisions_JFD_Indonesia_SumpahPalapa = {}
table.insert(tDecisions_JFD_Indonesia_SumpahPalapa, GameInfoTypes.PROMOTION_MYSTIC_BLADE)
for row in GameInfo.UnitPromotions_PostCombatRandomPromotion("PromotionType = 'PROMOTION_MYSTIC_BLADE'") do
	table.insert(tDecisions_JFD_Indonesia_SumpahPalapa, GameInfoTypes[row.NewPromotion])
end

local Decisions_JFD_Indonesia_SumpahPalapa = {}
	Decisions_JFD_Indonesia_SumpahPalapa.Name = "TXT_KEY_DECISIONS_JFD_INDONESIA_SUMPAH_PALAPA"
	Decisions_JFD_Indonesia_SumpahPalapa.Desc = "TXT_KEY_DECISIONS_JFD_INDONESIA_SUMPAH_PALAPA_DESC"
	Decisions_JFD_Indonesia_SumpahPalapa.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Indonesia_SumpahPalapa, "CIVILIZATION_INDONESIA")
	Decisions_JFD_Indonesia_SumpahPalapa.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationIndonesiaID then return false, false end
		local leaderTitleShort = player:GetLeaderTitleShort()
		local desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_INDONESIA_SUMPAH_PALAPA_DESC_PEACE", leaderTitleShort)
		if player:IsAtWar() then 
			local warList = ""
			for otherPlayerID = 0, defineMaxMajorCivs-1, 1 do
				local otherPlayer = Players[otherPlayerID]
				if otherPlayer:IsAtWarWith() then
					warList = warList .. player:GetCivilizationShortDescription() .. ", "
				end
			end
			desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_INDONESIA_SUMPAH_PALAPA_DESC_WAR", leaderTitleShort, warList)
		end
		if load(player, "Decisions_JFD_Indonesia_SumpahPalapa") == true then
			Decisions_JFD_Indonesia_SumpahPalapa.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_INDONESIA_SUMPAH_PALAPA_ENACTED_DESC", desc)
			return false, false, true
		end
		Decisions_JFD_Indonesia_SumpahPalapa.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_INDONESIA_SUMPAH_PALAPA_DESC", desc)
		if player:IsAtPeace() then return true, false end
		if player:GetNumResourceAvailable(resourceCaptainsID, false) < 2 then return true, false end
		local numMysticBlade = 0
		for unit in player:Units() do
			for _, promotionID in ipairs(tDecisions_JFD_Indonesia_SumpahPalapa) do
				if unit:IsHasPromotion(promotionID) then
					numMysticBlade = numMysticBlade + 1
					break
				end
			end
			if numMysticBlade >= 3 then break end
		end
		if numMysticBlade < 3 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Indonesia_SumpahPalapa.DoFunc = (
	function(player)
		local numMysticBlade = 0
		for unit in player:Units() do
			for _, promotionID in ipairs(tDecisions_JFD_Indonesia_SumpahPalapa) do
				if unit:IsHasPromotion(promotionID) then
					unit:ChangeExperience(15)
					break
				end
			end
		end
		local city = player:GetCapitalCity()
		InitUnitFromCity(city, unitGreatGeneralID, 1)
		player:ChangeNumResourceTotal(resourceCaptainsID, -2)
		save(player, "Decisions_JFD_Indonesia_SumpahPalapa", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationIndonesiaID, "Decisions_JFD_Indonesia_SumpahPalapa", Decisions_JFD_Indonesia_SumpahPalapa)
end
--------------------------------------------------------------------------------------------------------------------------
-- Indonesia: Take Control of the Spice Trade
--------------------------------------------------------------------------------------------------------------------------
local policyDescisionsIndonesiaSpiceTradeID = GameInfoTypes["POLICY_DECISIONS_JFD_INDONESIA_SPICE_TRADE"]
local unitCargoShipID 					 	= GameInfoTypes["UNIT_CARGO_SHIP"]
if (resourceDignitariesID and resourceInventorsID) then
local Decisions_JFD_Indonesia_SpiceTrade = {}
	Decisions_JFD_Indonesia_SpiceTrade.sSpice = ""
	Decisions_JFD_Indonesia_SpiceTrade.tListSpice = {}
	for row in GameInfo.Resources("CivilizationType = 'CIVILIZATION_INDONESIA'") do
		table.insert(Decisions_JFD_Indonesia_SpiceTrade.tListSpice, GameInfoTypes[row.Type])
		Decisions_JFD_Indonesia_SpiceTrade.sSpice = Decisions_JFD_Indonesia_SpiceTrade.sSpice .. "[NEWLINE][ICON_BULLET] " .. row.IconString .. " " .. Locale.ConvertTextKey(row.Description)
	end
	Decisions_JFD_Indonesia_SpiceTrade.Name = "TXT_KEY_DECISIONS_JFD_INDONESIA_SPICE_TRADE"
	Decisions_JFD_Indonesia_SpiceTrade.Desc = "TXT_KEY_DECISIONS_JFD_INDONESIA_SPICE_TRADE_DESC"
	Decisions_JFD_Indonesia_SpiceTrade.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Indonesia_SpiceTrade, "CIVILIZATION_INDONESIA")
	Decisions_JFD_Indonesia_SpiceTrade.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationIndonesiaID then return false, false end
		if player:HasPolicy(policyDescisionsIndonesiaSpiceTradeID) then
			Decisions_JFD_Indonesia_SpiceTrade.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_INDONESIA_SPICE_TRADE_ENACTED_DESC")
			return false, false, true
		end
		Decisions_JFD_Indonesia_SpiceTrade.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_INDONESIA_SPICE_TRADE_DESC", Decisions_JFD_Indonesia_SpiceTrade.sSpice)
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if player:GetNumResourceAvailable(resourceInventorsID, false) < 1 then return true, false end
		if player:GetNumResourceAvailable(resourceDignitariesID, false) < 1 then return true, false end
		if player:GetCapitalCity() == nil then return true, false end
		local numResources = 0
		for _, resourceID in ipairs(Decisions_JFD_Indonesia_SpiceTrade.tListSpice) do
			if (player:GetNumResourceAvailable(resourceID, false) > 0) then
				numResources = numResources + 1
				break
			end
		end
		if numResources < 1 then return true, false else return true, true end
	end
	)
	
	Decisions_JFD_Indonesia_SpiceTrade.DoFunc = (
	function(player)
		local city = player:GetCapitalCity()
		local plot = city:Plot()
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeNumResourceTotal(resourceDignitariesID, -1)
		player:ChangeNumResourceTotal(resourceInventorsID, -1)
		player:InitUnit(unitCargoShipID, plot:GetX(), plot:GetY())
		player:InitUnit(unitCargoShipID, plot:GetX(), plot:GetY())
		player:GrantPolicy(policyDescisionsIndonesiaSpiceTradeID, 1)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_INDONESIA_SPICE_TRADE", player:GetName(), player:GetCivilizationShortDescription()))
	end
	)
	
if #Decisions_JFD_Indonesia_SpiceTrade.tListSpice > 0 then 
	Decisions_AddCivilisationSpecific(civilizationIndonesiaID, "Decisions_JFD_Indonesia_SpiceTrade", Decisions_JFD_Indonesia_SpiceTrade)
end
end
--------------------------------------------------------------------------------------------------------------------------
-- Japan
--------------------------------------------------------------------------------------------------------------------------
local civilizationJapanID = GameInfoTypes["CIVILIZATION_JAPAN"]
--------------------------------------------------------------------------------------------------------------------------
-- Japan: Develop Castles Towns
--------------------------------------------------------------------------------------------------------------------------
local buildingCastleID 				    = GameInfoTypes["BUILDING_CASTLE"]
local policyDecisionsJapanCastleTownsID = GameInfoTypes["POLICY_DECISIONS_JFD_JAPAN_CASTLE_TOWNS"]
if resourceCaptainsID then
local Decisions_JFD_Japan_CastleTowns = {}
    Decisions_JFD_Japan_CastleTowns.Name = "TXT_KEY_DECISIONS_JFD_JAPAN_CASTLE_TOWNS"
	Decisions_JFD_Japan_CastleTowns.Desc = "TXT_KEY_DECISIONS_JFD_JAPAN_CASTLE_TOWNS_DESC"
	Decisions_JFD_Japan_CastleTowns.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Japan_CastleTowns, "CIVILIZATION_JAPAN")
	Decisions_JFD_Japan_CastleTowns.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationJapanID then return false, false end
		if player:HasPolicy(policyDecisionsJapanCastleTownsID) then
			Decisions_JFD_Japan_CastleTowns.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_JAPAN_CASTLE_TOWNS_ENACTED_DESC")
			return false, false, true
		end
		local numCastles = player:CountNumBuildings(buildingCastleID)
		local costGold = Game.GetRound((numCastles*125)*iMod)
		Decisions_JFD_Japan_CastleTowns.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_JAPAN_CASTLE_TOWNS_DESC", costGold)
		if player:GetGold() < costGold then return true, false end
		if player:GetNumResourceAvailable(resourceCaptainsID, false) < 1 then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if (numCastles/player:GetNumCities()) < 0.5 then return true, false end		
		return true, true
	end
	)
	
	Decisions_JFD_Japan_CastleTowns.DoFunc = (
	function(player)
		local costGold = Game.GetRound((numCastles*125)*iMod)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeNumResourceTotal(resourceCaptainsID, -1)
		player:GrantPolicy(policyDecisionsJapanCastleTownsID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationJapanID, "Decisions_JFD_Japan_CastleTowns", Decisions_JFD_Japan_CastleTowns)
end
--------------------------------------------------------------------------------------------------------------------------
-- Japan: Patronise the Theatres
--------------------------------------------------------------------------------------------------------------------------
local buildingAmphitheatreID 			   = GameInfoTypes["BUILDING_AMPHITHEATER"]
local buildingOperaHouseID 				   = GameInfoTypes["BUILDING_OPERA_HOUSE"]
local policyDecisionsJapanPatronTheatresID = GameInfoTypes["POLICY_DECISIONS_JAPANTHEATRE"]
local unitGreatMusicianID				   = GameInfoTypes["UNIT_MUSICIAN"]
if resourceDignitariesID then
local Decisions_JFD_Japan_PatronTheatres = {}
    Decisions_JFD_Japan_PatronTheatres.Name = "TXT_KEY_DECISIONS_JFD_JAPAN_PATRON_THEATRES"
	Decisions_JFD_Japan_PatronTheatres.Desc = "TXT_KEY_DECISIONS_JFD_JAPAN_PATRON_THEATRES_DESC"
	Decisions_JFD_Japan_PatronTheatres.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Japan_PatronTheatres, "CIVILIZATION_JAPAN")
	Decisions_JFD_Japan_PatronTheatres.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationJapanID then return false, false end
		if player:HasPolicy(policyDecisionsJapanPatronTheatresID) then
			Decisions_JFD_Japan_PatronTheatres.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_JAPAN_PATRON_THEATRES_ENACTED_DESC")
			return false, false, true
		end
		local costGold = Game.GetRound(500*iMod)
		Decisions_JFD_Japan_PatronTheatres.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_JAPAN_PATRON_THEATRES_DESC", costGold)
		if player:GetGold() < costGold then return true, false end		
		if player:GetNumResourceAvailable(resourceDignitariesID, false) < 2 then return true, false end
		if player:CountNumBuildings(buildingAmphitheatreID) < 1 then return true, false end
		if player:CountNumBuildings(buildingOperaHouseID) < 1 then return true, false end
		return true, true		
	end
	)
	
	Decisions_JFD_Japan_PatronTheatres.DoFunc = (
	function(player)
		local costGold = Game.GetRound(500*iMod)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(resourceDignitariesID, -2)
		player:GrantPolicy(policyDecisionsJapanPatronTheatresID, true)
		InitUnitFromCity(player:GetCapitalCity(), unitGreatMusicianID, 1)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationJapanID, "Decisions_JFD_Japan_PatronTheatres", Decisions_JFD_Japan_PatronTheatres)
end
--------------------------------------------------------------------------------------------------------------------------
-- Korea
--------------------------------------------------------------------------------------------------------------------------
local civilizationKoreaID = GameInfoTypes["CIVILIZATION_KOREA"]
--------------------------------------------------------------------------------------------------------------------------
-- Korea: Introduce Hangul
--------------------------------------------------------------------------------------------------------------------------
if resourceInventorsID then
local policyDecisionsKoreaHangulID = GameInfoTypes["POLICY_DECISIONS_KOREANHANGUL"]
local techWritingID				   = GameInfoTypes["TECH_WRITING"]
local Decisions_JFD_Korea_Hangul = {}
    Decisions_JFD_Korea_Hangul.Name = "TXT_KEY_DECISIONS_JFD_KOREAN_HANGUL"
	Decisions_JFD_Korea_Hangul.Desc = "TXT_KEY_DECISIONS_JFD_KOREAN_HANGUL_DESC"
	Decisions_JFD_Korea_Hangul.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Korea_Hangul, "CIVILIZATION_KOREA")
	Decisions_JFD_Korea_Hangul.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationKoreaID then return false, false end
		if player:HasPolicy(policyDecisionsKoreaHangulID) then
			Decisions_JFD_Korea_Hangul.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_KOREAN_HANGUL_ENACTED_DESC")
			return false, false, true
		end
		local costScience = Game.GetRound(30*iMod)
		Decisions_JFD_Korea_Hangul.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_KOREAN_HANGUL_DESC", costScience)
		if player:GetNumResourceAvailable(resourceInventorsID, false) < 3 then return true, false end
		if player:GetCurrentResearch() == -1 then return true, false end
		if player:GetResearchProgress(player:GetCurrentResearch()) < costScience then return true, false end
		if player:GetCurrentEra() < eraRenaissanceID then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Korea_Hangul.DoFunc = (
	function(player)
		local costScience = Game.GetRound(30*iMod)
		local teamTechs = Teams[player:GetTeam()]:GetTeamTechs()
		teamTechs:ChangeResearchProgress(player:GetCurrentResearch(), -costScience, player:GetID())
		player:ChangeNumResourceTotal(resourceInventorsID, -3)
		player:GrantPolicy(policyDecisionsKoreaHangulID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationKoreaID, "Decisions_JFD_Korea_Hangul", Decisions_JFD_Korea_Hangul)
end
--------------------------------------------------------------------------------------------------------------------------
-- Korea: Subsidise the development of Gunpowder Weaponry
--------------------------------------------------------------------------------------------------------------------------
local policyDecisionsKoreaGunpowderID = GameInfoTypes["POLICY_DECISIONS_KOREANGUNPOWDER"]
local techPhysicsID				      = GameInfoTypes["TECH_PHYSICS"]
local unitHwachaID				      = GameInfoTypes["UNIT_KOREAN_HWACHA"]
if resourceCaptainsID then
local Decisions_JFD_Korea_Gunpowder = {}
    Decisions_JFD_Korea_Gunpowder.Name = "TXT_KEY_DECISIONS_JFD_KOREAN_GUNPOWDER"
	Decisions_JFD_Korea_Gunpowder.Desc = "TXT_KEY_DECISIONS_JFD_KOREAN_GUNPOWDER_DESC"
	Decisions_JFD_Korea_Gunpowder.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Korea_Gunpowder, "CIVILIZATION_KOREA")
	Decisions_JFD_Korea_Gunpowder.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationKoreaID then return false, false end
		if player:HasPolicy(policyDecisionsKoreaGunpowderID) then
			Decisions_JFD_Korea_Gunpowder.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_KOREAN_GUNPOWDER_ENACTED_DESC")
			return false, false, true
		end
		local costGold = Game.GetRound(500*iMod)
		Decisions_JFD_Korea_Gunpowder.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_KOREAN_GUNPOWDER_DESC", costGold)
		if player:GetGold() < costGold then return true, false end
		if player:GetNumResourceAvailable(resourceCaptainsID, false) < 2 then return true, false end
		if (not player:HasTech(techPhysicsID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Korea_Gunpowder.DoFunc = (
	function(player)
		local costGold = Game.GetRound(500*iMod)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(resourceCaptainsID, -2)
		player:GrantPolicy(policyDecisionsKoreaGunpowderID, true)
		InitUnitFromCity(player:GetCapitalCity(), unitHwachaID, 2)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationKoreaID, "Decisions_JFD_Korea_Gunpowder", Decisions_JFD_Korea_Gunpowder)
end
--------------------------------------------------------------------------------------------------------------------------
-- Mongolia
--------------------------------------------------------------------------------------------------------------------------
local civilizationMongoliaID = GameInfoTypes["CIVILIZATION_MONGOL"]
--------------------------------------------------------------------------------------------------------------------------
-- Mongolia: Incorporate Subdued Peoples
--------------------------------------------------------------------------------------------------------------------------
local policyDecisionsMongolsSubduedPeoplesID = GameInfoTypes["POLICY_DECISIONS_MONGOLIAEXECUTION"]
if resourceCaptainsID then
local Decisions_JFD_Mongols_SubduedPeople = {}
    Decisions_JFD_Mongols_SubduedPeople.Name = "TXT_KEY_DECISIONS_JFD_MONGOLS_SUBDUED_PEOPLE"
	Decisions_JFD_Mongols_SubduedPeople.Desc = "TXT_KEY_DECISIONS_JFD_MONGOLS_SUBDUED_PEOPLE_DESC"
	Decisions_JFD_Mongols_SubduedPeople.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Mongols_SubduedPeople, "CIVILIZATION_MONGOL")
	Decisions_JFD_Mongols_SubduedPeople.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationMongoliaID then return false, false end
		local leaderTitleShort = player:GetLeaderTitleShort()
		if player:HasPolicy(policyDecisionsMongolsSubduedPeoplesID) then
			Decisions_JFD_Mongols_SubduedPeople.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_MONGOLS_SUBDUED_PEOPLE_ENACTED_DESC", leaderTitleShort)
			return false, false, true
		end
		Decisions_JFD_Mongols_SubduedPeople.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_MONGOLS_SUBDUED_PEOPLE_DESC", leaderTitleShort)
		if player:GetNumResourceAvailable(resourceCaptainsID, false) < 3 then return true, false end
		if player:GetCurrentEra() < eraMedievalID then return true, false end
		local hasConqueredCapital = false
		local playerID = player:GetID()
		for city in player:Cities() do
			if (city:IsOriginalCapital() and city:GetOriginalOwner() ~= playerID) then 
				hasConqueredCapital = true 
				break 
			end
		end
		if (not hasConqueredCapital) then return true, false end 
		return true, true
	end
	)
	
	Decisions_JFD_Mongols_SubduedPeople.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(resourceCaptainsID, -3)
		player:GrantPolicy(policyDecisionsMongolsSubduedPeoplesID, true)
		save(player, "Decisions_JFD_Mongols_SubduedPeople", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationMongoliaID, "Decisions_JFD_Mongols_SubduedPeople", Decisions_JFD_Mongols_SubduedPeople)
end
--------------------------------------------------------------------------------------------------------------------------
-- Mongolia: Establish the Yam
--------------------------------------------------------------------------------------------------------------------------
local policyDecisionsMongolsSilkRoadID = GameInfoTypes["POLICY_DECISIONS_JFD_MONGOLS_SILK_ROAD"]
local Decisions_JFD_Mongols_SilkRoad = {}
    Decisions_JFD_Mongols_SilkRoad.Name = "TXT_KEY_DECISIONS_JFD_MONGOLS_SILK_ROAD"
	Decisions_JFD_Mongols_SilkRoad.Desc = "TXT_KEY_DECISIONS_JFD_MONGOLS_SILK_ROAD_DESC"
	Decisions_JFD_Mongols_SilkRoad.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Mongols_SilkRoad, "CIVILIZATION_MONGOL")
	Decisions_JFD_Mongols_SilkRoad.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationMongoliaID then return false, false end
		if player:HasPolicy(policyDecisionsMongolsSilkRoadID) then
			Decisions_JFD_Mongols_SilkRoad.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_MONGOLS_SILK_ROAD_ENACTED_DESC")
			return false, false, true
		end
		local costCulture = Game.GetRound(100*iMod)
		Decisions_JFD_Mongols_SilkRoad.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_MONGOLS_SILK_ROAD_DESC", costCulture)
		if player:GetNumInternationalTradeRoutesUsed() < player:GetNumInternationalTradeRoutesAvailable() then return true, false end
		if player:GetJONSCulture() < costCulture then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		if player:GetNumCities() < 5 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Mongols_SilkRoad.DoFunc = (
	function(player)
		local costCulture = Game.GetRound(100*iMod)
		player:ChangeJONSCulture(-costCulture)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:GrantPolicy(policyDecisionsMongolsSilkRoadID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationMongoliaID, "Decisions_JFD_Mongols_SilkRoad", Decisions_JFD_Mongols_SilkRoad)
--------------------------------------------------------------------------------------------------------------------------
-- Morocco
--------------------------------------------------------------------------------------------------------------------------
local civilizationMoroccoID = GameInfoTypes["CIVILIZATION_MOROCCO"]
--------------------------------------------------------------------------------------------------------------------------
-- Morocco: Establish the Black Guard
--------------------------------------------------------------------------------------------------------------------------
local improvementKasbahID	 			 = GameInfoTypes["IMPROVEMENT_KASBAH"]
local policyDecisionsMoroccoBlackGuardID = GameInfoTypes["POLICY_DECISIONS_MOROCCOBLACKGUARD"]
if resourceCaptainsID then
local Decisions_JFD_Morocco_BlackGuard = {}
    Decisions_JFD_Morocco_BlackGuard.Name = "TXT_KEY_DECISIONS_JFD_MOROCCO_BLACK_GUARD"
	Decisions_JFD_Morocco_BlackGuard.Desc = "TXT_KEY_DECISIONS_JFD_MOROCCO_BLACK_GUARD_DESC"
	Decisions_JFD_Morocco_BlackGuard.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Morocco_BlackGuard, "CIVILIZATION_MOROCCO")
	Decisions_JFD_Morocco_BlackGuard.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationMoroccoID then return false, false end
		if player:HasPolicy(policyDecisionsMoroccoBlackGuardID) then
			Decisions_JFD_Morocco_BlackGuard.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_MOROCCO_BLACK_GUARD_ENACTED_DESC")
			return false, false, true
		end
		Decisions_JFD_Morocco_BlackGuard.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_MOROCCO_BLACK_GUARD_DESC")
		if player:GetNumResourceAvailable(resourceCaptainsID, false) < 3 then return true, false end
		if player:GetCurrentEra() < eraRenaissanceID then return true, false end
		if player:GetImprovementCount(improvementKasbahID) < 5 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Morocco_BlackGuard.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(resourceCaptainsID, -3)
		player:GrantPolicy(policyDecisionsMoroccoBlackGuardID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationMoroccoID, "Decisions_JFD_Morocco_BlackGuard", Decisions_JFD_Morocco_BlackGuard)
end
--------------------------------------------------------------------------------------------------------------------------
-- Morocco: Plunder Campaign
--------------------------------------------------------------------------------------------------------------------------
local policyDecisionsMoroccoPlunderCampaignID = GameInfoTypes["POLICY_DECISIONS_MOROCCOPLUNDER"]
if resourceCaptainsID then
local Decisions_JFD_Morocco_PlunderCampaign = {}
    Decisions_JFD_Morocco_PlunderCampaign.Name = "TXT_KEY_DECISIONS_JFD_MOROCCO_PLUNDER_CAMPAIGN"
	Decisions_JFD_Morocco_PlunderCampaign.Desc = "TXT_KEY_DECISIONS_JFD_MOROCCO_PLUNDER_CAMPAIGN_DESC"
	Decisions_JFD_Morocco_PlunderCampaign.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Morocco_PlunderCampaign, "CIVILIZATION_MOROCCO")
	Decisions_JFD_Morocco_PlunderCampaign.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationMoroccoID then return false, false end
		if player:HasPolicy(policyDecisionsMoroccoPlunderCampaignID) then
			Decisions_JFD_Morocco_PlunderCampaign.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_MOROCCO_PLUNDER_CAMPAIGN_ENACTED_DESC")
			return false, false, true
		end
		local costCulture = Game.GetRound(200*iMod)
		Decisions_JFD_Morocco_PlunderCampaign.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_MOROCCO_PLUNDER_CAMPAIGN_DESC", costCulture)
		if player:GetJONSCulture() < costCulture then return true, false end
		if player:GetNumResourceAvailable(resourceCaptainsID, false) < 2 then return true, false end
		if (not player:HasTech(techGunpowderID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Morocco_PlunderCampaign.DoFunc = (
	function(player)
		local costCulture = Game.GetRound(200*iMod)
		player:ChangeJONSCulture(-costCulture)
		player:ChangeNumResourceTotal(resourceCaptainsID, -2)
		player:GrantPolicy(policyDecisionsMoroccoPlunderCampaignID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationMoroccoID, "Decisions_JFD_Morocco_PlunderCampaign", Decisions_JFD_Morocco_PlunderCampaign)
end
--------------------------------------------------------------------------------------------------------------------------
-- Persia
--------------------------------------------------------------------------------------------------------------------------
local civilizationPersiaID = GameInfoTypes["CIVILIZATION_PERSIA"]
--------------------------------------------------------------------------------------------------------------------------
-- Persia: Reform the Satrapies
--------------------------------------------------------------------------------------------------------------------------
local buildingSatrapsCourtID 		   = GameInfoTypes["BUILDING_SATRAPS_COURT"]
local policyDecisionsPersiaSatrapiesID = GameInfoTypes["POLICY_DECISIONS_PERSIASATRAPY"]
local Decisions_JFD_Persia_Satrapies = {}
    Decisions_JFD_Persia_Satrapies.Name = "TXT_KEY_DECISIONS_JFD_PERSIA_SATRAPIES"
	Decisions_JFD_Persia_Satrapies.Desc = "TXT_KEY_DECISIONS_JFD_PERSIA_SATRAPIES_DESC"
	Decisions_JFD_Persia_Satrapies.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Persia_Satrapies, "CIVILIZATION_PERSIA")
	Decisions_JFD_Persia_Satrapies.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationPersiaID then return false, false end
		if (not userSettingsCIDLoyaltyCore) then return false, false end
		local govtTitleShort = player:GetGovernmentShortDescription()
		if player:HasPolicy(policyDecisionsPersiaSatrapiesID) then
			Decisions_JFD_Persia_Satrapies.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PERSIA_SATRAPIES_ENACTED_DESC")
			return false, false, true
		end
		Decisions_JFD_Persia_Satrapies.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PERSIA_SATRAPIES_DESC", govtTitleShort)
		if player:GetNumResourceAvailable(iMagistrate, false) < 3 then return true, false end
		if player:CountNumBuildings(buildingSatrapsCourtID) < player:GetNumCities() then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Persia_Satrapies.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -3)
		player:GrantPolicy(policyDecisionsPersiaSatrapiesID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationPersiaID, "Decisions_JFD_Persia_Satrapies", Decisions_JFD_Persia_Satrapies)
--------------------------------------------------------------------------------------------------------------------------
-- Persia: Create the Savaran Cavalry
--------------------------------------------------------------------------------------------------------------------------
local policyDecisionsPersiaSavaransID = GameInfoTypes["POLICY_DECISIONS_PERSIASAVARAN"]
local techHorsebackRidingID			  = GameInfoTypes["TECH_HORSEBACK_RIDING"]
if resourceCaptainsID then
local Decisions_JFD_Persia_Savarans = {}
    Decisions_JFD_Persia_Savarans.Name = "TXT_KEY_DECISIONS_JFD_PERSIA_SAVARANS"
	Decisions_JFD_Persia_Savarans.Desc = "TXT_KEY_DECISIONS_JFD_PERSIA_SAVARANS_DESC"
	Decisions_JFD_Persia_Savarans.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Persia_Savarans, "CIVILIZATION_PERSIA")
	Decisions_JFD_Persia_Savarans.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationPersiaID then return false, false end
		if player:HasPolicy(policyDecisionsPersiaSavaransID) then
			Decisions_JFD_Persia_Savarans.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PERSIA_SAVARANS_ENACTED_DESC")
			return false, false, true
		end
		local techDesc = "Horseback Riding"
		if userSettingsPITProgressCore then
			techDesc = "Stirrups"
		end
		local costGold = Game.GetRound(300*iMod)
		Decisions_JFD_Persia_Savarans.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PERSIA_SAVARANS_DESC", techDesc, costGold)
		if player:GetNumResourceAvailable(resourceCaptainsID, false) < 2 then return true, false end
		if player:GetGold() < costGold then	return true, false end
		if (not player:HasTech(techHorsebackRidingID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Persia_Savarans.DoFunc = (
	function(player)
		local costGold = Game.GetRound(300*iMod)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(resourceCaptainsID, -2)
		player:GrantPolicy(policyDecisionsPersiaSavaransID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationPersiaID, "Decisions_JFD_Persia_Savarans", Decisions_JFD_Persia_Savarans)
end
--------------------------------------------------------------------------------------------------------------------------
-- Poland
--------------------------------------------------------------------------------------------------------------------------
local civilizationPolandID = GameInfoTypes["CIVILIZATION_POLAND"]
--------------------------------------------------------------------------------------------------------------------------
-- Poland: Hold the Great Sjem
--------------------------------------------------------------------------------------------------------------------------
local buildingDecisionsPolandGreatSejmID = GameInfoTypes["BUILDING_DECISIONS_GREATSEJM"]
local Decisions_JFD_Poland_GreatSejm = {}
	Decisions_JFD_Poland_GreatSejm.Name = "TXT_KEY_DECISIONS_JFD_POLAND_GREAT_SEJM"
	Decisions_JFD_Poland_GreatSejm.Desc = "TXT_KEY_DECISIONS_JFD_POLAND_GREAT_SEJM_DESC"
	Decisions_JFD_Poland_GreatSejm.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Poland_GreatSejm, "CIVILIZATION_POLAND")
	Decisions_JFD_Poland_GreatSejm.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationPolandID then return false, false end
		if (not userSettingsRTPSovereigntyCore) then return false, false end
		local eraID = load(player, "Decisions_JFD_Poland_GreatSejm")
		local currentEraID = player:GetCurrentEra()
		if eraID ~= nil then
			if eraID < currentEraID then
				save(player, "Decisions_JFD_Poland_GreatSejm", nil)
			else
				Decisions_JFD_Poland_GreatSejm.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_POLAND_GREAT_SEJM_ENACTED_DESC")
				return false, false, true
			end
		end
		local minSovereignty = 65
		Decisions_JFD_Poland_GreatSejm.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_POLAND_GREAT_SEJM_DESC", minSovereignty)
		if (not player:HasGovernment()) then return true, false end
		if (not player:HasLegislature()) then return true, false end
		if player:GetSovereignty() < minSovereignty then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		if player:GetCurrentEra() < eraRenaissanceID then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Poland_GreatSejm.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:ChangeGovernmentCooldown(player:GetGovernmentCooldown())
		player:SetReformCooldown(0)
		save(player, "Decisions_JFD_Poland_GreatSejm", player:GetCurrentEra())
	end
	)

Decisions_AddCivilisationSpecific(civilizationPolandID, "Decisions_JFD_Poland_GreatSejm", Decisions_JFD_Poland_GreatSejm)
--------------------------------------------------------------------------------------------------------------------------
-- Poland: Establish the Jagiellonian University
--------------------------------------------------------------------------------------------------------------------------
local buildingJagiellonianUniversityID = GameInfoTypes["BUILDING_DECISIONS_POLANDUNIVERSITY"]
local buildingUniversityID 			   = GameInfoTypes["BUILDING_UNIVERSITY"]
if resourceDignitariesID then
local Decisions_JFD_Poland_JagiellonianUniversity = {}
	Decisions_JFD_Poland_JagiellonianUniversity.Name = "TXT_KEY_DECISIONS_JFD_POLAND_JAGIELLONIAN_UNIVERSITY"
	Decisions_JFD_Poland_JagiellonianUniversity.Desc = "TXT_KEY_DECISIONS_JFD_POLAND_JAGIELLONIAN_UNIVERSITY_DESC"
	Decisions_JFD_Poland_JagiellonianUniversity.Pedia = "TXT_KEY_DECISIONS_BUILDING_POLANDUNIVERSITY"
	Decisions_JFD_Poland_JagiellonianUniversity.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Poland_JagiellonianUniversity, "CIVILIZATION_POLAND")
	Decisions_JFD_Poland_JagiellonianUniversity.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationPolandID then return false, false end
		local govtTitleShort = player:GetGovernmentShortDescription()
		if load(player, "Decisions_JFD_Poland_JagiellonianUniversity") == true then
			Decisions_JFD_Poland_JagiellonianUniversity.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_POLAND_JAGIELLONIAN_UNIVERSITY_ENACTED_DESC", govtTitleShort)
			return false, false, true
		end
		local costGold = Game.GetRound(400*iMod)
		Decisions_JFD_Poland_JagiellonianUniversity.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_POLAND_JAGIELLONIAN_UNIVERSITY_DESC", govtTitleShort, costGold)
		if player:GetNumResourceAvailable(resourceDignitariesID, false) < 2 then return true, false end
		if player:GetGold() < costGold then return true, false end
		if player:GetCurrentEra() < eraMedievalID then return true, false end
		return true, true		
	end
	)
	
	Decisions_JFD_Poland_JagiellonianUniversity.DoFunc = (
	function(player)
		local capital = player:GetCapitalCity()
		local costGold = Game.GetRound(400*iMod)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(resourceDignitariesID, -2)
		capital:SetNumRealBuilding(buildingJagiellonianUniversityID, 1)
		save(player, "Decisions_JFD_Poland_JagiellonianUniversity", true)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_POLAND_JAGIELLONIAN_UNIVERSITY", player:GetName(), player:GetCivilizationShortDescription(), capital:GetName()))
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationPolandID, "Decisions_JFD_Poland_JagiellonianUniversity", Decisions_JFD_Poland_JagiellonianUniversity)
end
--------------------------------------------------------------------------------------------------------------------------
-- Polynesia
--------------------------------------------------------------------------------------------------------------------------
local civilizationPolynesiaID = GameInfoTypes["CIVILIZATION_POLYNESIA"]
--------------------------------------------------------------------------------------------------------------------------
-- Polynesia: Kānāwai Māmalahoe
--------------------------------------------------------------------------------------------------------------------------
local Decisions_JFD_Polynesia_SplinteredPaddle = {}
	Decisions_JFD_Polynesia_SplinteredPaddle.Name = "TXT_KEY_DECISIONS_JFD_POLYNESIA_SPLINTERED_PADDLE"
	Decisions_JFD_Polynesia_SplinteredPaddle.Desc = "TXT_KEY_DECISIONS_JFD_POLYNESIA_SPLINTERED_PADDLE_DESC"
	Decisions_JFD_Polynesia_SplinteredPaddle.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Polynesia_SplinteredPaddle, "CIVILIZATION_POLYNESIA")
	Decisions_JFD_Polynesia_SplinteredPaddle.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationPolynesiaID then return false, false end
		if load(player, "Decisions_JFD_Polynesia_SplinteredPaddle") == true then
			Decisions_JFD_Polynesia_SplinteredPaddle.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_POLYNESIA_SPLINTERED_PADDLE_ENACTED_DESC")
			return false, false, true
		end
		local numUnits = 0
		for unit in player:Units() do
			if unit:IsCombatUnit() then
				numUnits = numUnits + 1
				if numUnits >= 5 then break end
			end
		end
		local numUnits = player:GetNumMilitaryUnits()
		local costGold = Game.GetRound((20*numUnits)*iMod)
		local numTurns = Game.GetRound((numUnits*2)*iGAMod)
		Decisions_JFD_Polynesia_SplinteredPaddle.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_POLYNESIA_SPLINTERED_PADDLE_DESC", costGold, numTurns)
		if numUnits < 5 then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if player:GetGold() < costGold then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Polynesia_SplinteredPaddle.DoFunc = (
	function(player)
		local numUnits = player:GetNumMilitaryUnits()
		local costGold = Game.GetRound((20*numUnits)*iMod)
		local numTurns = Game.GetRound((numUnits*2)*iGAMod)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeGoldenAgeTurns(numTurns)
		save(player, "Decisions_JFD_Polynesia_SplinteredPaddle", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationPolynesiaID, "Decisions_JFD_Polynesia_SplinteredPaddle", Decisions_JFD_Polynesia_SplinteredPaddle)
--------------------------------------------------------------------------------------------------------------------------
-- Polynesia: Revive the Runanga
--------------------------------------------------------------------------------------------------------------------------
local policyDecisionsPolynesiaRunangaID = GameInfoTypes["POLICY_DECISIONS_JFD_POLYNESIA_RUNANGA"]
local promotionHakaID 					= GameInfoTypes["PROMOTION_HAKA_WAR_DANCE"]
if resourceCaptainsID then
local Decisions_JFD_Polynesia_Runanga = {}
	Decisions_JFD_Polynesia_Runanga.Name = "TXT_KEY_DECISIONS_JFD_POLYNESIA_RUNANGA"
	Decisions_JFD_Polynesia_Runanga.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_POLYNESIA_RUNANGA_DESC")
	Decisions_JFD_Polynesia_Runanga.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Polynesia_Runanga, "CIVILIZATION_POLYNESIA")
	Decisions_JFD_Polynesia_Runanga.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationPolynesiaID then return false, false end
		if player:HasPolicy(policyDecisionsPolynesiaRunangaID) then
			Decisions_JFD_Polynesia_Runanga.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_POLYNESIA_RUNANGA_ENACTED_DESC")
			return false, false, true
		end
		local minSovereignty = 65
		Decisions_JFD_Polynesia_Runanga.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_POLYNESIA_RUNANGA_DESC", minSovereignty)
		if (not player:IsAtWar()) then return true, false end
		if (not player:HasGovernment()) then return true, false end
		if player:GetSovereignty() < minSovereignty then return true, false end
		if player:GetNumResourceAvailable(resourceCaptainsID, false) < 2 then return true, false end
		local capital = player:GetCapitalCity()
		if (not capital) then return true, false end
		if (not capital:GetGarrisonedUnit()) then return true, false end
		if (not capital:GetGarrisonedUnit():IsHasPromotion(promotionHakaID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Polynesia_Runanga.DoFunc = (
	function(player)
		player:GetCapitalCity():GetGarrisonedUnit():Kill()
		player:ChangeNumResourceTotal(resourceCaptainsID, -2)
		player:GrantPolicy(policyDecisionsPolynesiaRunangaID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationPolynesiaID, "Decisions_JFD_Polynesia_Runanga", Decisions_JFD_Polynesia_Runanga)
end
--------------------------------------------------------------------------------------------------------------------------
-- Portugal
--------------------------------------------------------------------------------------------------------------------------
local civilizationPortugalID = GameInfoTypes["CIVILIZATION_PORTUGAL"]
--------------------------------------------------------------------------------------------------------------------------
-- Portugal: Institute the Casa da Índia
--------------------------------------------------------------------------------------------------------------------------
local buildingEICID						   = GameInfoTypes["BUILDING_JFD_EAST_INDIA_COMPANY"]
local policyDecisionsPortugalCasaDaIndiaID = GameInfoTypes["POLICY_DECISIONS_JFD_PORTUGAL_CASA_DA_INDIA"]
local Decisions_JFD_Portugal_CasaDaIndia = {}
    Decisions_JFD_Portugal_CasaDaIndia.Name = "TXT_KEY_DECISIONS_JFD_PORTUGAL_CASA_DA_INDIA"
	Decisions_JFD_Portugal_CasaDaIndia.Desc = "TXT_KEY_DECISIONS_JFD_PORTUGAL_CASA_DA_INDIA_DESC"
	Decisions_JFD_Portugal_CasaDaIndia.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Portugal_CasaDaIndia, "CIVILIZATION_PORTUGAL")
	Decisions_JFD_Portugal_CasaDaIndia.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationPortugalID then return false, false end
		if (not userSettingsCIDColoniesCore) then return false, false end
		if player:HasPolicy(policyDecisionsPortugalCasaDaIndiaID) then
			Decisions_JFD_Portugal_CasaDaIndia.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PORTUGAL_CASA_DA_INDIA_ENACTED_DESC")
			return false, false, true
		end
		if (not player:GetCapitalCity()) then return false, false end
		local numColonies = player:GetNumColonies()
		local costGold = Game.GetRound((100*numColonies)*iMod)
		Decisions_JFD_Portugal_CasaDaIndia.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PORTUGAL_CASA_DA_INDIA_DESC", costGold)
		if player:GetCurrentEra() < eraMedievalID then return true, false end
		if player:GetGold() < costGold then	return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		if numColonies < 3 then return true, false end
		return true, true		
	end
	)
	
	Decisions_JFD_Portugal_CasaDaIndia.DoFunc = (
	function(player)
		local numColonies = player:GetNumColonies()
		local costGold = Game.GetRound((100*numColonies)*iMod)
		player:costGold(-costGold)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:GrantPolicy(policyDecisionsPortugalCasaDaIndiaID)
		player:GetCapitalCity():SetNumRealBuilding(buildingEICID, 1)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationPortugalID, "Decisions_JFD_Portugal_CasaDaIndia", Decisions_JFD_Portugal_CasaDaIndia)
--------------------------------------------------------------------------------------------------------------------------
-- Portugal: Collect Trade Taxes
--------------------------------------------------------------------------------------------------------------------------
local improvementFeitoriaID = GameInfoTypes["IMPROVEMENT_FEITORIA"]
local Decisions_JFD_Portugal_TradeTaxes = {}
    Decisions_JFD_Portugal_TradeTaxes.Name = "TXT_KEY_DECISIONS_JFD_PORTUGAL_TRADE_TAXES"
	Decisions_JFD_Portugal_TradeTaxes.Desc = "TXT_KEY_DECISIONS_JFD_PORTUGAL_TRADE_TAXES_DESC"
	Decisions_JFD_Portugal_TradeTaxes.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Portugal_TradeTaxes, "CIVILIZATION_PORTUGAL")
	Decisions_JFD_Portugal_TradeTaxes.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationPortugalID then return false, false end
		local eraID = load(player, "Decisions_JFD_Portugal_TradeTaxes")
		local currentEraID = player:GetCurrentEra()
		if eraID ~= nil then
			if eraID < currentEraID then
				save(player, "Decisions_JFD_Portugal_TradeTaxes", nil)
			else
				Decisions_JFD_Portugal_TradeTaxes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PORTUGAL_TRADE_TAXES_ENACTED_DESC")
				return false, false, true
			end
		end
		local numFeitorias = player:GetImprovementCount(improvementFeitoriaID)
		local rewardGold = Game.GetRound((numFeitorias*iMod)*100)
		Decisions_JFD_Portugal_TradeTaxes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PORTUGAL_TRADE_TAXES_DESC", rewardGold)
		if numFeitorias < 3 then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Portugal_TradeTaxes.DoFunc = (
	function(player)
		local numFeitorias = player:GetImprovementCount(improvementFeitoriaID)
		local rewardGold = Game.GetRound((numFeitorias*iMod)*100)
		player:ChangeGold(rewardGold)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		save(player, "Decisions_JFD_Portugal_TradeTaxes", player:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationPortugalID, "Decisions_JFD_Portugal_TradeTaxes", Decisions_JFD_Portugal_TradeTaxes)
--------------------------------------------------------------------------------------------------------------------------
-- Rome
--------------------------------------------------------------------------------------------------------------------------
local civilizationRomeID = GameInfoTypes["CIVILIZATION_ROME"]
--------------------------------------------------------------------------------------------------------------------------
-- Rome: Introduce Concrete
--------------------------------------------------------------------------------------------------------------------------
local policyDecisionsRomeConcreteID = GameInfoTypes["POLICY_DECISIONS_JFD_ROME_CONCRETE"]
local techEngineeringID 			= GameInfoTypes["TECH_ENGINEERING"]
if resourceInventorsID then
local Decisions_JFD_Rome_Concrete = {}
	Decisions_JFD_Rome_Concrete.Name = "TXT_KEY_DECISIONS_JFD_ROME_CONCRETE"
	Decisions_JFD_Rome_Concrete.Desc = "TXT_KEY_DECISIONS_JFD_ROME_CONCRETE_DESC"
	Decisions_JFD_Rome_Concrete.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Rome_Concrete, "CIVILIZATION_ROME")
	Decisions_JFD_Rome_Concrete.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationRomeID then return false, false end
		if player:HasPolicy(policyDecisionsRomeConcreteID) then
			Decisions_JFD_Rome_Concrete.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ROME_CONCRETE_ENACTED_DESC")
			return false, false, true
		end
		local costGold = Game.GetRound(200*iMod)
		Decisions_JFD_Rome_Concrete.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ROME_CONCRETE_DESC", costGold)
		if player:GetNumResourceAvailable(resourceInventorsID, false) < 2 then return true, false end
		if (not player:HasTech(techEngineeringID)) then return true, false end
		if player:GetCurrentEra() < eraClassicalID then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Rome_Concrete.DoFunc = (
	function(player)
		local costGold = Game.GetRound(200*iMod)
		player:ChangeNumResourceTotal(resourceInventorsID, -2)
		local teamTechs = Teams[player:GetTeam()]:GetTeamTechs()
		player:ChangeGold(-costGold)
		player:GrantPolicy(policyDecisionsRomeConcreteID, true)
	end
	)

Decisions_AddCivilisationSpecific(civilizationRomeID, "Decisions_JFD_Rome_Concrete", Decisions_JFD_Rome_Concrete)
end
--------------------------------------------------------------------------------------------------------------------------
-- Rome: Panem et Circenses
--------------------------------------------------------------------------------------------------------------------------
local Decisions_JFD_Rome_PanemEtCircenses = {}
	Decisions_JFD_Rome_PanemEtCircenses.Name = "TXT_KEY_DECISIONS_JFD_ROME_PANEM_ET_CIRCENSES"
	Decisions_JFD_Rome_PanemEtCircenses.Desc = "TXT_KEY_DECISIONS_JFD_ROME_PANEM_ET_CIRCENSES_DESC"
	Decisions_JFD_Rome_PanemEtCircenses.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Rome_PanemEtCircenses, "CIVILIZATION_ROME")
	Decisions_JFD_Rome_PanemEtCircenses.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationRomeID then return false, false end
		local eraID = load(player, "Decisions_JFD_Rome_PanemEtCircenses")
		local currentEraID = player:GetCurrentEra()
		if eraID ~= nil then
			if eraID < currentEraID then
				save(player, "Decisions_JFD_Rome_PanemEtCircenses", nil)
			else
				Decisions_JFD_Rome_PanemEtCircenses.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ROME_PANEM_ET_CIRCENSES_ENACTED_DESC")
				return false, false, true
			end
		end
		local costGold = Game.GetRound((player:GetCurrentEra() + 1)*100*iMod)
		local numTurns = Game.GetRound(10*iGAMod)
		Decisions_JFD_Rome_PanemEtCircenses.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ROME_PANEM_ET_CIRCENSES_DESC", costGold, numTurns)
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if player:GetGold() < costGold then return true, false end
		if player:GetCurrentEra() < eraClassicalID then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Rome_PanemEtCircenses.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		local costGold = Game.GetRound((player:GetCurrentEra() + 1)*100*iMod)
		player:ChangeGold(-costGold)
		local numTurns = Game.GetRound(10*iGAMod)
		for city in player:Cities() do
			LuaEvents.JFD_WLTKDBegins(player:GetID(), city, city:GetX(), city:GetY(), numTurns, -1, true)
		end
		save(player, "Decisions_JFD_Rome_PanemEtCircenses", player:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationRomeID, "Decisions_JFD_Rome_PanemEtCircenses", Decisions_JFD_Rome_PanemEtCircenses)
--------------------------------------------------------------------------------------------------------------------------
-- Russia
--------------------------------------------------------------------------------------------------------------------------
local civilizationRussiaID = GameInfoTypes["CIVILIZATION_RUSSIA"]
--------------------------------------------------------------------------------------------------------------------------
-- Russia: Found the Streltsy
--------------------------------------------------------------------------------------------------------------------------
local unitMusketmanID = GameInfoTypes["UNIT_MUSKETMAN"]
if resourceCaptainsID then
local Decisions_JFD_Russia_Streltsy = {}
	Decisions_JFD_Russia_Streltsy.Name = "TXT_KEY_DECISIONS_JFD_RUSSIA_STRELTSY"
	Decisions_JFD_Russia_Streltsy.Desc = "TXT_KEY_DECISIONS_JFD_RUSSIA_STRELTSY_DESC"
	Decisions_JFD_Russia_Streltsy.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Russia_Streltsy, "CIVILIZATION_RUSSIA")
	Decisions_JFD_Russia_Streltsy.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationRussiaID then return false, false end
		if load(player, "Decisions_JFD_Russia_Streltsy") == true then
			Decisions_JFD_Russia_Streltsy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_RUSSIANSTRELTSY_ENACTED_DESC")
			return false, false, true
		end
		local costGold = Game.GetRound(500*iMod)
		Decisions_JFD_Russia_Streltsy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_STRELTSY_DESC", costGold)
		if player:GetGold() < costGold then return true, false end
		if player:GetNumResourceAvailable(resourceCaptainsID, false) < 2 then return true, false end
		if player:HasTech(techGunpowderID) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Russia_Streltsy.DoFunc = (
	function(player)
		local costGold = Game.GetRound(500*iMod)
		player:ChangeNumResourceTotal(resourceCaptainsID, -2)
		player:ChangeGold(-costGold)
		InitUnitFromCity(player:GetCapitalCity(), unitMusketmanID, 6)
		save(player, "Decisions_JFD_Russia_Streltsy", true)		
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationRussiaID, "Decisions_JFD_Russia_Streltsy", Decisions_JFD_Russia_Streltsy)
end
--------------------------------------------------------------------------------------------------------------------------
-- Russia: Unleash the Oprichniki (City-Based)
--------------------------------------------------------------------------------------------------------------------------
local buildingConstableID = GameInfoTypes["BUILDING_CONSTABLE"]
if resourceCaptainsID then
local Decisions_JFD_Russia_Oprichnina = {}
	Decisions_JFD_Russia_Oprichnina.Name = "TXT_KEY_DECISIONS_JFD_RUSSIA_OPRICHNINA"
	Decisions_JFD_Russia_Oprichnina.Desc = "TXT_KEY_DECISIONS_JFD_RUSSIA_OPRICHNINA_DESC"
	Decisions_JFD_Russia_Oprichnina.Type = "Civilization"
	Decisions_JFD_Russia_Oprichnina.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationRussiaID then return end
		--Generate Decisions
		for city in player:Cities() do
			if (city:IsHasBuilding(buildingConstableID) or city:IsCapital()) then
				local decision = "Decisions_JFD_Russia_Oprichnina" .. CompileCityID(city)
				local cityName = city:GetName()
				tTempDecisions[decision] = {}
				tTempDecisions[decision].Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_OPRICHNINA", cityName)
				tTempDecisions[decision].Desc = "TXT_KEY_DECISIONS_JFD_RUSSIA_OPRICHNINA_DESC"
				tTempDecisions[decision].Data1 = city
				tTempDecisions[decision].Weight = 0
				tTempDecisions[decision].Type = "Civilization"
				HookDecisionCivilizationIcon(tTempDecisions[decision], "CIVILIZATION_RUSSIA")
				tTempDecisions[decision].CanFunc = (
				function(player, city)
					local decision = "Decisions_JFD_Russia_Oprichnina" .. CompileCityID(city)
					local cityName = city:GetName()
					local population = city:GetPopulation()
					local rewardGold = Game.GetRound((population*30)*iMod)
					local rewardCulture = Game.GetRound((population*15)*iMod)
					if load(player, decision) == true then
						if city:IsCapital() then
							tTempDecisions[decision].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_OPRICHNINA_ENACTED_DESC", cityName) .. Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_OPRICHNINA_NOTE")
						else
							tTempDecisions[decision].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_OPRICHNINA_ENACTED_DESC", cityName)
						end
						return false, false, true
					end
					if city:IsCapital() then
						tTempDecisions[decision].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_OPRICHNINA_DESC", cityName, rewardGold, rewardCulture) .. Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_OPRICHNINA_NOTE")
					else
						tTempDecisions[decision].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_OPRICHNINA_DESC", cityName, rewardGold, rewardCulture)
					end
					if player:GetNumResourceAvailable(resourceCaptainsID, false) < 1 then return true, false end
					if (not city:IsHasBuilding(buildingConstableID)) then return true, false end
					return true, true
				end
				)
				
				tTempDecisions[decision].DoFunc = (
				function(player, city)
					local decision = "Decisions_JFD_Russia_Oprichnina" .. CompileCityID(city)
					local population = city:GetPopulation()
					local rewardGold = Game.GetRound((population*30)*iMod)
					local rewardCulture = Game.GetRound((population*15)*iMod)
					player:ChangeNumResourceTotal(resourceCaptainsID, -1)
					player:ChangeGold(rewardGold)
					player:ChangeJONSCulture(rewardCulture)
					save(player, decision, true)
					JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_RUSSIA_OPRICHNINA", player:GetName(), player:GetCivilizationAdjective(), city:GetName()))
				end
				)
				
			end
		end
		
		--End Generation
		return
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationRussiaID, "Decisions_JFD_Russia_Oprichnina", Decisions_JFD_Russia_Oprichnina)
end
--------------------------------------------------------------------------------------------------------------------------
-- Siam
--------------------------------------------------------------------------------------------------------------------------
local civilizationSiamID = GameInfoTypes["CIVILIZATION_SIAM"]
--------------------------------------------------------------------------------------------------------------------------
-- Siam: Create the Thai Alphabet
-------------------------------------------------------------------------------------------------------------------------
local buildingWatID = GameInfoTypes["BUILDING_WAT"]
if resourceInventorsID then
local Decisions_JFD_Siam_ThaiAlphabet = {}
	Decisions_JFD_Siam_ThaiAlphabet.Name = "TXT_KEY_DECISIONS_JFD_THAI_ALPHABET"
	Decisions_JFD_Siam_ThaiAlphabet.Desc = "TXT_KEY_DECISIONS_JFD_THAI_ALPHABET_DESC"
	Decisions_JFD_Siam_ThaiAlphabet.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Siam_ThaiAlphabet, "CIVILIZATION_SIAM")
	Decisions_JFD_Siam_ThaiAlphabet.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationSiamID then return end
		if load(player, "Decisions_JFD_Siam_ThaiAlphabet") == true then
			Decisions_JFD_Siam_ThaiAlphabet.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_THAI_ALPHABET_ENACTED_DESC")
			return false, false, true
		end
		local costCulture = Game.GetRound(250*iMod)
		Decisions_JFD_Siam_ThaiAlphabet.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_THAI_ALPHABET_DESC", costCulture)
		if player:GetJONSCulture() < costCulture then return true, false end
		if player:GetNumResourceAvailable(resourceInventorsID, false) < 1 then return true, false end
		if player:CountNumBuildings(buildingWatID) < player:GetNumCities() then return true, false end
		return true, false
	end
	)
	
	Decisions_JFD_Siam_ThaiAlphabet.DoFunc = (
	function(player)
		local costCulture = Game.GetRound(250)*iMod
		player:ChangeJONSCulture(-costCulture)
		player:ChangeNumResourceTotal(resourceInventorsID, -1)
		player:SetNumFreeTechs(player:GetNumFreeTechs()+1)
		save(player, "Decisions_JFD_Siam_ThaiAlphabet", true)
	end
	)

Decisions_AddCivilisationSpecific(civilizationSiamID, "Decisions_JFD_Siam_ThaiAlphabet", Decisions_JFD_Siam_ThaiAlphabet)
end
--------------------------------------------------------------------------------------------------------------------------
-- Siam: Send Out Embassies
--------------------------------------------------------------------------------------------------------------------------
local policyDecisionsSiamEmbassiesID = GameInfoTypes["POLICY_DECISIONS_SIAMEMBASSIES"]
if resourceDignitariesID then
local Decisions_JFD_Siam_Embassies = {}
	Decisions_JFD_Siam_Embassies.Name = "TXT_KEY_DECISIONS_JFD_SIAM_EMBASSIES"
	Decisions_JFD_Siam_Embassies.Desc = "TXT_KEY_DECISIONS_JFD_SIAM_EMBASSIES_DESC"
	Decisions_JFD_Siam_Embassies.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Siam_Embassies, "CIVILIZATION_SIAM")
	Decisions_JFD_Siam_Embassies.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationSiamID then return false, false end
		if player:HasPolicy(policyDecisionsSiamEmbassiesID) then
			Decisions_JFD_Siam_Embassies.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SIAM_EMBASSIES_ENACTED_DESC")
			return false, false, true
		end
		local numCityStates = 0
		for minorPlayerID = 0, defineMaxMinorCivs - 1 do 
			local minorCiv = Players[minorPlayerID]
			if (minorCiv:IsAlive() and minorCiv:IsMinorCiv() and Teams[player:GetTeam()]:IsHasMet(minorCiv:GetTeam())) then
				numCityStates = numCityStates + 1
			end
		end
		local costGold = Game.GetRound((numCityStates*100)*iMod)
		Decisions_JFD_Siam_Embassies.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SIAM_EMBASSIES_DESC", costGold)
		local currentEraID = player:GetCurrentEra()
		if currentEraID < eraRenaissanceID or currentEraID > eraIndustrialID then return true, false end
		if numCityStates < 4 then return true, false end
		if player:GetNumResourceAvailable(resourceDignitariesID, false) < 2 then return true, false end
		if player:GetGold() < costGold then return true, false end
		if player:IsAtWar() then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Siam_Embassies.DoFunc = (
	function(player, tCSSiam, tChance)
		local playerID = player:GetID()
		local costGold = Game.GetRound(numCityStates*100*iMod) 
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(resourceDignitariesID, -2)
		for minorPlayerID = 0, defineMaxMinorCivs - 1 do 
			local minorCiv = Players[minorPlayerID]
			if (minorCiv:IsAlive() and minorCiv:IsMinorCiv() and Teams[player:GetTeam()]:IsHasMet(minorCiv:GetTeam())) then
				minorCiv:ChangeMinorCivFriendshipWithMajor(playerID, GetRandom(10,40))
			end
		end
		player:GrantPolicy(policyDecisionsSiamEmbassiesID, true)
	end
	)

Decisions_AddCivilisationSpecific(civilizationSiamID, "Decisions_JFD_Siam_Embassies", Decisions_JFD_Siam_Embassies)
end
--------------------------------------------------------------------------------------------------------------------------
-- Songhai
--------------------------------------------------------------------------------------------------------------------------
local civilizationSonghaiID = GameInfoTypes["CIVILIZATION_SONGHAI"]
--------------------------------------------------------------------------------------------------------------------------
-- Songhai: Recruit Scholars for the Sankoré University
--------------------------------------------------------------------------------------------------------------------------
local techEducationID 							= GameInfoTypes["TECH_EDUCATION"]
local policyDecisionsSonghaiSankoreUniversityID = GameInfoTypes["POLICY_DECISIONS_SONGHAISANKORE"]
if resourceDignitariesID then
local Decisions_JFD_Songhai_SankoreUniversity = {}
    Decisions_JFD_Songhai_SankoreUniversity.Name = "TXT_KEY_DECISIONS_JFD_SONGHAI_SONKORE_UNIVERSITY"
	Decisions_JFD_Songhai_SankoreUniversity.Desc = "TXT_KEY_DECISIONS_JFD_SONGHAI_SANKORE_UNIVERSITY_DESC"
	Decisions_JFD_Songhai_SankoreUniversity.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Songhai_SankoreUniversity, "CIVILIZATION_SONGHAI")
	Decisions_JFD_Songhai_SankoreUniversity.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationSonghaiID then return false, false end
		if player:HasPolicy(policyDecisionsSonghaiSankoreUniversityID) then
			Decisions_JFD_Songhai_SankoreUniversity.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SONGHAI_SONKORE_UNIVERSITY_ENACTED_DESC")
			return false, false, true
		end
		local costCulture = Game.GetRound(100*iMod)
		local costGold = Game.GetRound(300*iMod)
		Decisions_JFD_Songhai_SankoreUniversity.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SONGHAI_SANKORE_UNIVERSITY_DESC", costCulture, costGold)
		if player:GetJONSCulture() < costCulture then return true, false end
		if player:GetGold() < costGold then	return true, false end
		if player:GetNumResourceAvailable(resourceDignitariesID, false) < 2 then return true, false end
		if (not player:HasTech(techEducationID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Songhai_SankoreUniversity.DoFunc = (
	function(player)
		local costCulture = Game.GetRound(100*iMod)
		local costGold = Game.GetRound(300*iMod)
		player:ChangeJONSCulture(-costCulture)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(resourceDignitariesID, -2)
		player:GrantPolicy(policyDecisionsSonghaiSankoreUniversityID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationSonghaiID, "Decisions_JFD_Songhai_SankoreUniversity", Decisions_JFD_Songhai_SankoreUniversity)
end
--------------------------------------------------------------------------------------------------------------------------
-- Songhai: Police our Trade Routes
--------------------------------------------------------------------------------------------------------------------------
if resourceCaptainsID then
local Decisions_JFD_Songhai_TradeRoutes = {}
    Decisions_JFD_Songhai_TradeRoutes.Name = "TXT_KEY_DECISIONS_JFD_SONGHAI_TRADE_ROUTES"
	Decisions_JFD_Songhai_TradeRoutes.Desc = "TXT_KEY_DECISIONS_JFD_SONGHAI_TRADE_ROUTES_DESC"
	Decisions_JFD_Songhai_TradeRoutes.Type = "Civilization"
	Decisions_JFD_Songhai_TradeRoutes.Data1 = {}
	Decisions_JFD_Songhai_TradeRoutes.Data1.Mounted = {}
	for row in GameInfo.Units("CombatClass = 'UNITCOMBAT_MOUNTED' OR CombatClass = 'UNITCOMBAT_ARMOR'") do
		Decisions_JFD_Songhai_TradeRoutes.Data1.Mounted[row.Type] = row.Combat
	end
	Decisions_JFD_Songhai_TradeRoutes.Data1.Melee = {}
	for row in GameInfo.Units("CombatClass = 'UNITCOMBAT_MELEE' OR CombatClass = 'UNITCOMBAT_GUN'") do
		Decisions_JFD_Songhai_TradeRoutes.Data1.Melee[row.Type] = row.Combat
	end
	HookDecisionCivilizationIcon(Decisions_JFD_Songhai_TradeRoutes, "CIVILIZATION_SONGHAI")
	Decisions_JFD_Songhai_TradeRoutes.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationSonghaiID then return false, false end
		local govtTitleShort = player:GetGovernmentShortDescription()
		local eraID = load(player, "Decisions_JFD_Songhai_TradeRoutes")
		local currentEraID = player:GetCurrentEra()
		if eraID ~= nil then
			if eraID < currentEraID then
				save(player, "Decisions_JFD_Songhai_TradeRoutes", nil)
			else
				Decisions_JFD_Songhai_TradeRoutes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SONGHAI_TRADE_ROUTES_ENACTED_DESC", govtTitleShort)
				return false, false, true
			end
		end
		local costGold = Game.GetRound(200*iMod) 		
		local unitID = GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_MOUNTED", "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN", "UNITCOMBAT_ARMOR")
		if (not unitID) then return false, false end
		local unitDesc = GameInfo.Units[unitID].Description
		Decisions_JFD_Songhai_TradeRoutes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SONGHAI_TRADE_ROUTES_DESC", govtTitleShort, costGold, unitDesc)
		if player:GetGold() < costGold then	return true, false end
		if player:GetNumResourceAvailable(resourceCaptainsID, false) < 2 then return true, false end
		if player:GetNumInternationalTradeRoutesUsed() < 2 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Songhai_TradeRoutes.DoFunc = (
	function(player, units)
		local costGold = Game.GetRound(200*iMod)
		local unitID = GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_MOUNTED", "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN", "UNITCOMBAT_ARMOR")
		InitUnitFromCity(player:GetCapitalCity(), unitID, player:GetNumInternationalTradeRoutesUsed())
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(resourceCaptainsID, -2)
		save(player, "Decisions_JFD_Songhai_TradeRoutes", player:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationSonghaiID, "Decisions_JFD_Songhai_TradeRoutes", Decisions_JFD_Songhai_TradeRoutes)
end
--------------------------------------------------------------------------------------------------------------------------
-- Spain
--------------------------------------------------------------------------------------------------------------------------
local civilizationSpainID = GameInfoTypes["CIVILIZATION_SPAIN"]
--------------------------------------------------------------------------------------------------------------------------
-- Spain: Fund Columbus's Expedition
--------------------------------------------------------------------------------------------------------------------------
local techAstronomyID    = GameInfoTypes["TECH_ASTRONOMY"]
local unitCaravelID      = GameInfoTypes["UNIT_CARAVEL"]
local unitGreatAdmiralID = GameInfoTypes["UNIT_GREAT_ADMIRAL"]
if resourceDignitariesID then
local Decisions_JFD_Spain_Columbus = {}
    Decisions_JFD_Spain_Columbus.ID = "Decisions_JFD_Spain_Columbus"
	Decisions_JFD_Spain_Columbus.Name = "TXT_KEY_DECISIONS_JFD_SPAIN_COLUMBUS"
	Decisions_JFD_Spain_Columbus.Desc = "TXT_KEY_DECISIONS_JFD_SPAIN_COLUMBUS_DESC"
	Decisions_JFD_Spain_Columbus.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Spain_Columbus, "CIVILIZATION_SPAIN")
	Decisions_JFD_Spain_Columbus.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationSpainID then return false, false end
		if load(player, "Decisions_JFD_Spain_Columbus") == true then
			Decisions_JFD_Spain_Columbus.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SPAIN_COLUMBUS_ENACTED_DESC")
			return false, false, true
		end
		local costGold = Game.GetRound(500*iMod)
		Decisions_JFD_Spain_Columbus.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SPAIN_COLUMBUS_DESC", costGold)
		if player:GetGold() < costGold then return true, false end
		if player:GetNumResourceAvailable(resourceDignitariesID) < 1 then return true, false end		
		if (not player:HasTech(techAstronomyID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Spain_Columbus.DoFunc = (
	function(player)
		local costGold = Game.GetRound(500*iMod)
		player:ChangeNumResourceTotal(resourceDignitariesID, -1)
		local unitCaravel = InitUnitFromCity(player:GetCapitalCity(), unitCaravelID, 2)
		unitCaravel[1]:SetName("Pinta")
		unitCaravel[2]:SetName("Niña")
		local unitGreatAdmiral = InitUnitFromCity(player:GetCapitalCity(), unitGreatAdmiralID, 1)
		unitGreatAdmiral[1]:SetName("Cristóbal Colón")
		player:ChangeGold(-costGold)
		save(player, "Decisions_JFD_Spain_Columbus", true)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SPAIN_COLUMBUS", player:GetName(), player:GetCivilizationShortDescription()))
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationSpainID, "Decisions_JFD_Spain_Columbus", Decisions_JFD_Spain_Columbus)
end
--------------------------------------------------------------------------------------------------------------------------
-- Spain: The Spanish Inquisition
--------------------------------------------------------------------------------------------------------------------------
local buildingInquisitionID = GameInfoTypes["BUILDING_JFD_GRAND_INQUISITION"]
local policyDecisionsSpainInquisitionID = GameInfoTypes["POLICY_DECISIONS_JFD_SPAIN_INQUISITION"]
if resourceClericsID then
local Decisions_JFD_Spain_Inquisition = {}
	Decisions_JFD_Spain_Inquisition.Name = "TXT_KEY_DECISIONS_JFD_SPAIN_INQUISITION"
	Decisions_JFD_Spain_Inquisition.Desc = "TXT_KEY_DECISIONS_JFD_SPAIN_INQUISITION_DESC"
	Decisions_JFD_Spain_Inquisition.Type = "Cleric"
	HookDecisionCivilizationIcon(Decisions_JFD_Spain_Inquisition, "CIVILIZATION_SPAIN")
	Decisions_JFD_Spain_Inquisition.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationSpainID then return false, false end
		if (not userSettingsRTPPietyInquisitionCore) then return false, false end
		if player:HasPolicy(policyDecisionsSpainInquisitionID) then
			Decisions_JFD_Spain_Inquisition.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SPAIN_INQUISITION_ENACTED_DESC")
			return false, false, true
		end
		local costFaith = Game.GetRound(400*iMod)
		local rewardPiety = Game.GetRound(20*iMod)
		Decisions_JFD_Spain_Inquisition.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SPAIN_INQUISITION_DESC", costFaith, rewardPiety)
		if player:GetFaith() < costFaith then return true, false end
		if player:GetNumResourceAvailable(resourceClericsID, false) < 2 then return true, false end		
		if (not player:HasStateReligion()) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Spain_Inquisition.DoFunc = (
	function(player)
		local costFaith = Game.GetRound(400*iMod)
		local rewardPiety = Game.GetRound(20*iMod)
		player:ChangeNumResourceTotal(resourceClericsID, -2)
		player:ChangePiety(rewardPiety)
		player:ChangeFaith(costFaith)
		player:GrantPolicy(policyDecisionsSpainInquisitionID, true)
		player:GetCapitalCity():SetNumRealBuilding(buildingInquisitionID, 1)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SPAIN_INQUISITION", player:GetName(), player:GetCivilizationShortDescription()))
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationSpainID, "Decisions_JFD_Spain_Inquisition", Decisions_JFD_Spain_Inquisition)
end
--------------------------------------------------------------------------------------------------------------------------
-- Sweden
--------------------------------------------------------------------------------------------------------------------------
local civilizationSwedenID = GameInfoTypes["CIVILIZATION_SWEDEN"]
--------------------------------------------------------------------------------------------------------------------------
-- Sweden: Indelningsverket
--------------------------------------------------------------------------------------------------------------------------
local policySwedenGustavusOrdinanceOfAlsnoID = GameInfoTypes["POLICY_DECISIONS_JFD_SWEDEN_ORDINANCE_ALSNO"]
local techMetallurgyID  					 = GameInfoTypes["TECH_METALLURGY"]
local unitGreatGeneralID 					 = GameInfoTypes["UNIT_GREAT_GENERAL"]
if resourceCaptainsID then
local Decisions_JFD_Sweden_OrdinanceAlsno = {}
	Decisions_JFD_Sweden_OrdinanceAlsno.Name = "TXT_KEY_DECISIONS_JFD_SWEDEN_ORDINANCE_ALSNO"
	Decisions_JFD_Sweden_OrdinanceAlsno.Desc = "TXT_KEY_DECISIONS_JFD_SWEDEN_ORDINANCE_ALSNO_DESC"
	Decisions_JFD_Sweden_OrdinanceAlsno.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Sweden_OrdinanceAlsno, "CIVILIZATION_SWEDEN")
	Decisions_JFD_Sweden_OrdinanceAlsno.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationSwedenID then return false, false end
		if player:HasPolicy(policyDecisionsSwedenGustavusOrdinanceOfAlsnoID) then
			Decisions_JFD_Sweden_OrdinanceAlsno.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SWEDEN_ORDINANCE_ALSNO_ENACTED_DESC")
			return false, false, true
		end
		Decisions_JFD_Sweden_OrdinanceAlsno.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SWEDEN_ORDINANCE_ALSNO_DESC")
		if player:GetNumResourceAvailable(resourceCaptainsID, false) < 2 then return true, false end
		if (not player:HasTech(techMetallurgyID)) then return true, false end
		return true, true
	end
	)

	Decisions_JFD_Sweden_OrdinanceAlsno.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(resourceCaptainsID, -2)
		InitUnitFromCity(player:GetCapitalCity(), unitGreatGeneralID, 1)
		player:GrantPolicy(policyDecisionsSwedenGustavusOrdinanceOfAlsnoID)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationSwedenID, "Decisions_JFD_Sweden_OrdinanceAlsno", Decisions_JFD_Sweden_OrdinanceAlsno)
end
--------------------------------------------------------------------------------------------------------------------------
-- Sweden: Call the Ståndsriksdagen
--------------------------------------------------------------------------------------------------------------------------
if resourceDignitariesID then
local Decisions_JFD_Sweden_Standsriksdagen = {}
	Decisions_JFD_Sweden_Standsriksdagen.Name = "TXT_KEY_DECISIONS_JFD_SWEDEN_STANDSRIKSDAGEN"
	Decisions_JFD_Sweden_Standsriksdagen.Desc = "TXT_KEY_DECISIONS_JFD_SWEDEN_STANDSRIKSDAGEN_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_Sweden_Standsriksdagen, "CIVILIZATION_SWEDEN")
	Decisions_JFD_Sweden_Standsriksdagen.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationSwedenID then return false, false end
		local govtTitleShort = player:GetGovernmentShortDescription()
		if load(player, "Decisions_JFD_Sweden_Standsriksdagen") == true then
			Decisions_JFD_Sweden_Standsriksdagen.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SWEDEN_STANDSRIKSDAGEN_ENACTED_DESC", govtTitleShort)
			return false, false, true
		end
		local costCulture = Game.GetRound(450*iMod)
		Decisions_JFD_Sweden_Standsriksdagen.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SWEDEN_STANDSRIKSDAGEN_DESC", govtTitleShort, costCulture)
		if player:GetCurrentEra() < eraRenaissanceID then return true, false end
		if player:GetJONSCulture() < costCulture then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if player:GetNumResourceAvailable(resourceDignitariesID, false) < 1 then return true, false end
		if (not player:IsGoldenAge())then return true, false end		
		return true, true
	end
	)
	
	Decisions_JFD_Sweden_Standsriksdagen.DoFunc = (
	function(player)
		local costCulture = Game.GetRound(450*iMod)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeNumResourceTotal(resourceDignitariesID, -1)
		player:ChangeJONSCulture(-costCulture)
		player:ChangeNumFreeGreatPeople(1)
		save(player, "Decisions_JFD_Sweden_Standsriksdagen", true)				
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationSwedenID, "Decisions_JFD_Sweden_Standsriksdagen", Decisions_JFD_Sweden_Standsriksdagen)
end
--=======================================================================================================================
--=======================================================================================================================