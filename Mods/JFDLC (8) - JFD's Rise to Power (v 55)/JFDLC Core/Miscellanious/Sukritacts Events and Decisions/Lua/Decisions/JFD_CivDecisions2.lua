-- Civ Specific Decisions
-- Author: Sukritact
--=======================================================================================================================

print("Civ Specific Decisions: loaded")

--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingsCIDInvestmentsCore		 = (Game.GetUserSetting("JFD_CID_INVESTMENTS_CORE") == 1)
local userSettingsRTPEpithetsCore 			 = (Game.GetUserSetting("JFD_RTP_EPITHETS_CORE") == 1)
local userSettingsRTPPietyInquisitionCore 	 = (Game.GetUserSetting("JFD_RTP_PIETY_NATIONAL_WONDER_ADDITIONS_INQUISITION") == 1)
local userSettingsPITInnovationsCore 		 = (Game.GetUserSetting("JFD_PIT_INNOVATIONS_CORE") == 1)
local userSettingsPITProgressCore 	 		 = (Game.GetUserSetting("JFD_PIT_PROGRESS_CORE") == 1)
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
-- The Aztecs
--------------------------------------------------------------------------------------------------------------------------
local civilizationAztecsID = GameInfoTypes["CIVILIZATION_AZTEC"]
--------------------------------------------------------------------------------------------------------------------------
-- Aztecs: Form the Imperial Jaguars and Eagles
--------------------------------------------------------------------------------------------------------------------------
local promotionJaguarID = GameInfoTypes["PROMOTION_JAGUAR"]
if resourceCaptainsID then
	local Decisions_JFD_Aztecs_Jaguars_Eagles = {}
		Decisions_JFD_Aztecs_Jaguars_Eagles.Name = "TXT_KEY_DECISIONS_AZTECS_JAGUARS_AND_EAGLES"
		Decisions_JFD_Aztecs_Jaguars_Eagles.Desc = "TXT_KEY_DECISIONS_AZTECS_JAGUARS_AND_EAGLES_DESC"
		Decisions_JFD_Aztecs_Jaguars_Eagles.Type = "Civilization"
		HookDecisionCivilizationIcon(Decisions_JFD_Aztecs_Jaguars_Eagles, "CIVILIZATION_AZTEC")
		Decisions_JFD_Aztecs_Jaguars_Eagles.CanFunc = (
		function(player)
			----if player:GetCivilizationType() ~= civilizationAztecsID then return false, false end
			local govtTitleShort, govtAdj = player:GetGovernmentShortDescription()
			local leaderTitleShort = player:GetLeaderTitleShort()
			if load(player, "Decisions_JFD_Aztecs_Jaguars_Eagles") == true then
				Decisions_JFD_Aztecs_Jaguars_Eagles.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_AZTECS_JAGUARS_AND_EAGLES_ENACTED_DESC", govtTitleShort, leaderTitleShort)
				return false, false, true
			end
			Decisions_JFD_Aztecs_Jaguars_Eagles.Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_AZTECS_JAGUARS_AND_EAGLES", govtAdj)
			Decisions_JFD_Aztecs_Jaguars_Eagles.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_AZTECS_JAGUARS_AND_EAGLES_DESC", govtTitleShort, leaderTitleShort)
			if player:GetNumResourceAvailable(resourceCaptainsID, false) < 2 then return true, false end
			local numUnits = 0
			for unit in player:Units() do
				if unit:IsHasPromotion(promotionJaguarID) then
					numUnits = numUnits + 1
					if numUnits >= 5 then break end
				end
			end
			if numUnits < 5 then return true, false end
			return true, true
		end
		)
		
		Decisions_JFD_Aztecs_Jaguars_Eagles.DoFunc = (
		function(player)
			player:ChangeNumResourceTotal(resourceCaptainsID, -2)
			for unit in player:Units() do
				if unit:IsHasPromotion(promotionJaguarID) then
					unit:ChangeExperience(30)
				end
			end
			save(player, "Decisions_JFD_Aztecs_Jaguars_Eagles", true)
		end
		)
		
Decisions_AddCivilisationSpecific(civilizationAztecsID, "Decisions_JFD_Aztecs_Jaguars_Eagles", Decisions_JFD_Aztecs_Jaguars_Eagles)
end
--------------------------------------------------------------------------------------------------------------------------
-- Aztecs: Create the Tripple Alliance
--------------------------------------------------------------------------------------------------------------------------
local policyDecisionsAztecTripleAllianceID = GameInfoTypes["POLICY_DECISIONS_AZTECFLOWERWAR"]
local techCivilServiceID				   = GameInfoTypes["TECH_CIVIL_SERVICE"]
if resourceDignitariesID then
	local Decisions_JFD_Aztec_TripleAlliance = {}
		Decisions_JFD_Aztec_TripleAlliance.Name = "TXT_KEY_DECISIONS_JFD_AZTECS_TRIPLE_ALLIANCE"
		Decisions_JFD_Aztec_TripleAlliance.Desc = "TXT_KEY_DECISIONS_JFD_AZTECS_TRIPLE_ALLIANCE_DESC"
		Decisions_JFD_Aztec_TripleAlliance.Type = "Civilization"
		HookDecisionCivilizationIcon(Decisions_JFD_Aztec_TripleAlliance, "CIVILIZATION_AZTEC")
		Decisions_JFD_Aztec_TripleAlliance.CanFunc = (
		function(player)
			----if player:GetCivilizationType() ~= civilizationAztecsID then return false, false end
			if player:HasPolicy(policyDecisionsAztecTripleAllianceID) then
				Decisions_JFD_Aztec_TripleAlliance.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_AZTECS_TRIPLE_ALLIANCE_ENACTED_DESC")
				return false, false, true
			end
			local costGold = Game.GetRound(300*iMod)
			Decisions_JFD_Aztec_TripleAlliance.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_AZTECS_TRIPLE_ALLIANCE_DESC", costGold)
			local numAlliedOrIntimidatedMinors = 0
			for otherPlayerID = 0, defineMaxMinorCivs - 1 do
				local otherPlayer = Players[otherPlayerID]
				if otherPlayer:IsAllies(player:GetID()) or otherPlayer:CanMajorBullyGold(player:GetID()) then
					numAlliedOrIntimidatedMinors = numAlliedOrIntimidatedMinors + 1
					if numAlliedOrIntimidatedMinors >= 3 then break end
				end
			end
			if numAlliedOrIntimidatedMinors < 3 then return true, false end
			if player:GetGold() < costGold then return true, false end
			if player:GetNumResourceAvailable(resourceDignitariesID, false) < 2 then return true, false end
			if (not player:HasTech(techCivilServiceID)) then return true, false end
			return true, true
		end
		)
		
		Decisions_JFD_Aztec_TripleAlliance.DoFunc = (
		function(player)
			local playerID = player:GetID()
			local costGold = Game.GetRound(300*iMod)
			player:ChangeGold(-costGold)
			player:ChangeNumResourceTotal(resourceDignitariesID, -2)
			player:GrantPolicy(policyDecisionsAztecTripleAllianceID, true)
			PreGame.SetCivilizationAdjective(playerID, "TXT_KEY_CIV_JFD_TRIPLE_ALLIANCE_ADJ")
			PreGame.SetCivilizationDescription(playerID, "TXT_KEY_CIV_JFD_TRIPLE_ALLIANCE_DESC")
			PreGame.SetCivilizationShortDescription(playerID, "TXT_KEY_CIV_JFD_TRIPLE_ALLIANCE_SHORT_DESC")
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_AZTECS_TRIPLE_ALLIANCE", player:GetName()))
		end
		)
		
Decisions_AddCivilisationSpecific(civilizationAztecsID, "Decisions_JFD_Aztec_TripleAlliance", Decisions_JFD_Aztec_TripleAlliance)
end
--------------------------------------------------------------------------------------------------------------------------
-- The Celts
--------------------------------------------------------------------------------------------------------------------------
local civilizationCeltsID = GameInfoTypes["CIVILIZATION_CELTS"]
--------------------------------------------------------------------------------------------------------------------------
-- Celts: Capitalise on the Tin trade
--------------------------------------------------------------------------------------------------------------------------
if resourceInventorsID then
local policyDecisionsCeltsTinTradeID = GameInfoTypes["POLICY_DECISIONS_JFD_CELTS_TIN_TRADE"]
local Decisions_JFD_Celts_TinTrade = {}
    Decisions_JFD_Celts_TinTrade.Name = "TXT_KEY_DECISIONS_JFD_CELTS_TIN_TRADE"
	Decisions_JFD_Celts_TinTrade.Desc = "TXT_KEY_DECISIONS_JFD_CELTS_TIN_TRADE_DESC"
	Decisions_JFD_Celts_TinTrade.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Celts_TinTrade, "CIVILIZATION_CELTS")
	Decisions_JFD_Celts_TinTrade.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationCeltsID then return false, false end
		if player:HasPolicy(policyDecisionsCeltsTinTradeID) then
			Decisions_JFD_Celts_TinTrade.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_CELTS_TIN_TRADE_ENACTED_DESC")
			return false, false, true
		end
		Decisions_JFD_Celts_TinTrade.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_CELTS_TIN_TRADE_DESC")
		if player:GetNumResourceAvailable(resourceInventorsID, false) < 2 then return true, false end
		if player:GetNumInternationalTradeRoutesUsed() < 2 then return true, false end
		if (not player:HasTech(techBronzeWorkingID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Celts_TinTrade.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(resourceInventorsID)
		player:GrantPolicy(policyDecisionsCeltsTinTradeID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationCeltsID, "Decisions_JFD_Celts_TinTrade", Decisions_JFD_Celts_TinTrade)
end
--------------------------------------------------------------------------------------------------------------------------
-- Celts: Refine the Uilleann pipes
--------------------------------------------------------------------------------------------------------------------------
if resourceInventorsID then
local buildingAmphitheatreID = GameInfoTypes["BUILDING_AMPHITHEATER"]
local buildingCeilidhHallID  = GameInfoTypes["BUILDING_CEILIDH_HALL"]
local policyDecisionsCeltsUilleanPipesID = GameInfoTypes["POLICY_DECISIONS_JFD_CELTS_UILLEANN_PIPES"]
local Decisions_JFD_Celts_UilleannPipes = {}
    Decisions_JFD_Celts_UilleannPipes.Name = "TXT_KEY_DECISIONS_JFD_CELTS_UILLEANN_PIPES"
	Decisions_JFD_Celts_UilleannPipes.Desc = "TXT_KEY_DECISIONS_JFD_CELTS_UILLEANN_PIPES_DESC"
	Decisions_JFD_Celts_UilleannPipes.Type = "Civilization"
	Decisions_JFD_Celts_UilleannPipes.Weight = (function(player) if (player:CountNumBuildings(buildingCeilidhHallID)/player:GetNumCities() < 0.5) then return false else return true end end)
	HookDecisionCivilizationIcon(Decisions_JFD_Celts_UilleannPipes, "CIVILIZATION_CELTS")
	Decisions_JFD_Celts_UilleannPipes.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationCeltsID then return false, false end
		if player:HasPolicy(policyDecisionsCeltsUilleanPipesID) then
			Decisions_JFD_Celts_UilleannPipes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_CELTS_UILLEANN_PIPES_ENACTED_DESC")
			return false, false, true
		end
		local costGold = Game.GetRound(500*iMod)
		local rewardCulture = Game.GetRound((player:CountNumBuildings(buildingAmphitheatreID) + player:CountNumBuildings(buildingCeilidhHallID))*(50*iMod))
		if rewardCulture < Game.GetRound(50*iMod) then rewardCulture = Game.GetRound(50*iMod) end
		Decisions_JFD_Celts_UilleannPipes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_CELTS_UILLEANN_PIPES_DESC", costGold, rewardCulture)
		if player:GetNumResourceAvailable(resourceInventorsID, false) < 2 then return true, false end
		if player:GetGold() < costGold then return true, false end
		if player:CountNumBuildings(buildingCeilidhHallID) < 1 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Celts_UilleannPipes.DoFunc = (
	function(player)
		local costGold = Game.GetRound(800*iMod)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(resourceInventorsID, -2)
		local rewardCulture = Game.GetRound((player:CountNumBuildings(buildingAmphitheatreID) + player:CountNumBuildings(buildingCeilidhHallID))*(50*iMod))
		player:ChangeJONSCulture(rewardCulture)
		player:GrantPolicy(policyDecisionsCeltsUilleanPipesID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationCeltsID, "Decisions_JFD_Celts_UilleannPipes", Decisions_JFD_Celts_UilleannPipes)
end
--------------------------------------------------------------------------------------------------------------------------
-- The Huns
--------------------------------------------------------------------------------------------------------------------------
local civilizationHunsID = GameInfoTypes["CIVILIZATION_HUNS"]
--------------------------------------------------------------------------------------------------------------------------
-- Huns: Demand Ransom
--------------------------------------------------------------------------------------------------------------------------
if resourceCaptainsID then
local Decisions_JFD_Huns_Ransom = {}
    Decisions_JFD_Huns_Ransom.Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_HUNS_RANSOM")
	Decisions_JFD_Huns_Ransom.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_HUNS_RANSOM_DESC")
	Decisions_JFD_Huns_Ransom.Type = "Civilization"
	Decisions_JFD_Huns_Ransom.Weight = 0
	HookDecisionCivilizationIcon(Decisions_JFD_Huns_Ransom, "CIVILIZATION_HUNS")
	Decisions_JFD_Huns_Ransom.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationHunsID then return false, false end
		local team = Teams[player:GetTeam()]
		local tUnitLocations = {}
		if team:GetAtWarCount(true) > 0 then
			for unit in player:Units() do
				if unit:IsCombatUnit() then
					local ownerID = unit:GetPlot():GetOwner()
					if tUnitLocations[ownerID] == nil then
						tUnitLocations[ownerID] = 1
					else
						tUnitLocations[ownerID] = tUnitLocations[ownerID] + 1
					end
				end
			end
		end
		
		local numEnacted = load(player, "Decisions_JFD_Huns_Ransom_Num")
		if numEnacted == nil then
			numEnacted = 0
			save(player, "Decisions_JFD_Huns_Ransom_Num", numEnacted)
		end
		local isMaxEnacted = (numEnacted >= 3)
		
		--Generate Decisions
		for playerID = 0, defineMaxMajorCivs-1, 1 do
			if playerID ~= player:GetID() then
				local otherPlayer = Players[playerID]
				if (otherPlayer:IsEverAlive() and otherPlayer:IsAlive() and team:IsHasMet(otherPlayer:GetTeam())) then
					local decision = "Decisions_JFD_Huns_Ransom" .. playerID
					local tData = {}
						tData.Civ = playerID
						tData.Name = otherPlayer:GetName()
						tData.Units = tUnitLocations[playerID]
					
					tTempDecisions[decision] = {}
					tTempDecisions[decision].Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_HUNS_RANSOM", tData.Name)
					tTempDecisions[decision].Desc = "TXT_KEY_DECISIONS_JFD_HUNS_RANSOM_DESC"
					tTempDecisions[decision].Data1 = tData
					tTempDecisions[decision].Data2 = isMaxEnacted
					tTempDecisions[decision].Weight = 0
					tTempDecisions[decision].Type = "Civilization"
					HookDecisionCivilizationIcon(tTempDecisions[decision], "CIVILIZATION_HUNS")
					tTempDecisions[decision].CanFunc = (
					function(player, tData, isMaxEnacted)
						local cityName = tData.Name	
						if load(player, decision) == true then
							tTempDecisions[decision].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_HUNS_RANSOM_ENACTED_DESC", cityName)
							return false, false, true
						end
						
						if isMaxEnacted then return false, false end
						
						local team = Teams[player:GetTeam()]
						local otherPlayerID = tData.Civ
						local otherPlayer = Players[otherPlayerID]
						local otherPlayerIDTeam = otherPlayer:GetTeam()
						local decision = "Decisions_JFD_Huns_Ransom" .. otherPlayerID
						local numUnits = tData.Units
						local rewardGold = Game.GetRound(150*iMod)
						if (numUnits ~= nil and numUnits > 0) then
							rewardGold = Game.GetRound(numUnits*(100*iMod))
						else 
							numUnits = 0
						end
						tTempDecisions[decision].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_HUNS_RANSOM_DESC", cityName, rewardGold)
						if (not player:IsAtWarWith(otherPlayerID)) then return true, false end
						if (not otherPlayer:IsWillAcceptPeaceWithPlayer(player:GetID())) then
							tTempDecisions[decision].Desc = tTempDecisions[decision].Desc .. Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_HUNS_RANSOM_NOT_WILLING", cityName)
							return true, false
						end
						if numUnits < 1 then return true, false end
						if player:GetNumResourceAvailable(resourceCaptainsID, false) < 2 then return true, false end
						if player:GetMilitaryMight() < otherPlayer:GetMilitaryMight() then return true, false end
						if player:IsPeaceBlocked(otherPlayerIDTeam)  then return true, false end
						return true, true
					end
					)
					
					tTempDecisions[decision].DoFunc = (
					function(player, tData)
						for eEvent, fFunc in pairs(Decisions_JFD_Huns_Ransom.Monitors) do
							eEvent.Remove(fFunc)
							eEvent.Add(fFunc)
						end
						save("GAME", "Decisions_JFD_Huns_Ransom_Monitors", true)		
						local playerID = player:GetID()
						local team = Teams[player:GetTeam()]
						local otherPlayerID = tData.Civ
						local otherPlayer = Players[otherPlayerID]
						local otherPlayerIDTeam = otherPlayer:GetTeam()
						local decision = "Decisions_JFD_Huns_Ransom" .. otherPlayerID
						local numUnits = tData.Units
						local rewardGold = Game.GetRound(numUnits*(100*iMod))
						player:ChangeNumResourceTotal(resourceCaptainsID, -2)
						player:ChangeGold(rewardGold)
						team:MakePeace(otherPlayerIDTeam)
						team:SetPermanentWarPeace(otherPlayerIDTeam, true)
						local tVal = {["P1"] = player:GetTeam(), ["P2"] = otherPlayerIDTeam, ["Turns"] =  Game.GetGameTurn() + GameInfo.GameSpeeds[Game.GetGameSpeedType()].PeaceDealDuration}
						table.insert(Decisions_JFD_Huns_Ransom.Table, tVal)
						save("Game", "Decisions_JFD_Huns_Ransom_Table", Decisions_JFD_Huns_Ransom.SerialiseSchedule(Decisions_JFD_Huns_Ransom.Table))
						for unit in player:Units() do
							local plot = unit:GetPlot()
							if plot:GetTeam() == otherPlayerIDTeam then unit:JumpToNearestValidPlot() end
						end					
						local numEnacted = load(player, "Decisions_JFD_Huns_Ransom_Num")
						save(player, "Decisions_JFD_Huns_Ransom_Num", (numEnacted + 1))
						save(player, decision, true)
						JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SPAIN_INQUISITION", player:GetName(), player:GetCivilizationShortDescription(), otherPlayer:GetName(), otherPlayer:GetCivilizationShortDescription()))
					end
					)
				end
			end
		end
		--End Generation
		if isMaxEnacted then return false, false end
		return true, false
	end
	)
	
	Decisions_JFD_Huns_Ransom.SerialiseSchedule = (
	function(tTable)
		local sStr = ""
		for iKey, tVal in ipairs(tTable) do
			sStr = sStr .. tVal.P1 .. "_%player2_" .. tVal.P2 .. "_%turn_" .. tVal.Turns .. "_%newline_"
		end
		return sStr
	end	
	)
	Decisions_JFD_Huns_Ransom.DeserialiseEventSchedule = (
	function(sStr)
		local tTable = {}
		while string.find(sStr, "_%%newline_") do
			local iS, iE = string.find(sStr, "_%%newline_")
			local sEntry = string.sub(sStr, 0, iS-1)
			
			local iSE, iEE = string.find(sEntry, "_%%player2_")
			local iSN, iEN = string.find(sEntry, "_%%turn_")
			
			local tVal = {["P1"] = tonumber(string.sub(sEntry, 0, iSE-1)), ["P2"] = tonumber(string.sub(sEntry, iEE+1, iSN-1)), ["Turns"] =  tonumber(string.sub(sEntry, iEN+1))}
			table.insert(tTable, tVal)
			
			sStr = string.sub(sStr, iE+1)
		end
		return tTable
	end
	)
	Decisions_JFD_Huns_Ransom.Initialise = (
	function()
		if Decisions_JFD_Huns_Ransom.Table == nil then
			local sData = load("Game", "Decisions_JFD_Huns_Ransom_Table")
			if sData then
				Decisions_JFD_Huns_Ransom.Table = Decisions_JFD_Huns_Ransom.DeserialiseEventSchedule(sData)
			else
				Decisions_JFD_Huns_Ransom.Table = {}
			end
		end
	end
	)
	
	Decisions_JFD_Huns_Ransom.Monitors = {}
	Decisions_JFD_Huns_Ransom.Monitors[GameEvents.PlayerDoTurn] =  (	
	function(playerID)
		if playerID ~= 0 then return end
		Decisions_JFD_Huns_Ransom.Initialise()
		for iKey, tData in ipairs(Decisions_JFD_Huns_Ransom.Table) do
			if tData.Turns <= Game.GetGameTurn() then
				Teams[tData.P1]:SetPermanentWarPeace(tData.P2, false)
				table.remove(Decisions_JFD_Huns_Ransom.Table, iKey)
				save("Game", "Decisions_JFD_Huns_Ransom_Table", Decisions_JFD_Huns_Ransom.SerialiseSchedule(Decisions_JFD_Huns_Ransom.Table))
			end
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationHunsID, "Decisions_JFD_Huns_Ransom", Decisions_JFD_Huns_Ransom)
end
--------------------------------------------------------------------------------------------------------------------------
-- Huns: Refine the Recurve Bow
--------------------------------------------------------------------------------------------------------------------------
local policyDecisionsHunsRecurveBowID = GameInfoTypes["POLICY_DECISIONS_HUNSRECURVEBOW"]
local techWheelID 					  = GameInfoTypes["TECH_THE_WHEEL"]
if resourceInventorsID then
local Decisions_JFD_Huns_RecurveBow = {}
    Decisions_JFD_Huns_RecurveBow.Name = "TXT_KEY_DECISIONS_JFD_HUNS_RECURVE_BOW"
	Decisions_JFD_Huns_RecurveBow.Desc = "TXT_KEY_DECISIONS_JFD_HUNS_RECURVE_BOW_DESC"
	Decisions_JFD_Huns_RecurveBow.Type = "Civilization"
	Decisions_JFD_Huns_RecurveBow.Data1 = {}
	for row in GameInfo.Units("CombatClass = 'UNITCOMBAT_ARCHER'") do
		Decisions_JFD_Huns_RecurveBow.Data1[row.Type] = row.Combat
	end
	HookDecisionCivilizationIcon(Decisions_JFD_Huns_RecurveBow, "CIVILIZATION_HUNS")
	Decisions_JFD_Huns_RecurveBow.CanFunc = (
	function(player, unitTypes)
		if player:GetCivilizationType() ~= civilizationHunsID then return false, false end
		if player:HasPolicy(policyDecisionsHunsRecurveBowID) then
			Decisions_JFD_Huns_RecurveBow.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_HUNS_RECURVE_BOW_ENACTED_DESC")
			return false, false, true
		end
		local costGold = Game.GetRound(450*iMod)
		local unitID = GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_ARCHER")
		if (not unitID) then return false, false end
		Decisions_JFD_Huns_RecurveBow.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_HUNS_RECURVE_BOW_DESC", costGold, GameInfo.Units[unitID].Description)
		if player:GetGold() < costGold then return true, false end		
		if player:GetNumResourceAvailable(resourceInventorsID, false) < 2 then return true, false end
		if (not player:HasTech(techWheelID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Huns_RecurveBow.DoFunc = (
	function(player, unitTypes)
		local costGold = Game.GetRound(450*iMod)
		player:ChangeNumResourceTotal(resourceInventorsID, -2)
		player:ChangeGold(-costGold)
		player:GrantPolicy(policyDecisionsHunsRecurveBowID, true)
		local unitID = GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_ARCHER")
		InitUnitFromCity(player:GetCapitalCity(), unitID, 1) 
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationHunsID, "Decisions_JFD_Huns_RecurveBow", Decisions_JFD_Huns_RecurveBow)
end
--------------------------------------------------------------------------------------------------------------------------
-- The Inca
--------------------------------------------------------------------------------------------------------------------------
local civilizationIncaID = GameInfoTypes["CIVILIZATION_INCA"]
--------------------------------------------------------------------------------------------------------------------------
-- Inca: Hire Quipucamayocs
--------------------------------------------------------------------------------------------------------------------------
local improvementFarmID 	   = GameInfoTypes["IMPROVEMENT_FARM"]
local improvementTerraceFarmID = GameInfoTypes["IMPROVEMENT_TERRACE_FARM"]
local techMathematicsID		   = GameInfoTypes["TECH_MATHEMATICS"]
local Decisions_JFD_Inca_Quipucamayocs = {}
    Decisions_JFD_Inca_Quipucamayocs.Name = "TXT_KEY_DECISIONS_JFD_INCA_QUIPUCAMAYOCS"
	Decisions_JFD_Inca_Quipucamayocs.Desc = "TXT_KEY_DECISIONS_JFD_INCA_QUIPUCAMAYOCS_DESC"
	Decisions_JFD_Inca_Quipucamayocs.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Inca_Quipucamayocs, "CIVILIZATION_INCA")
	Decisions_JFD_Inca_Quipucamayocs.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationIncaID then return false, false end
		local govtShortTitle = player:GetGovernmentShortDescription()
		local eraID = load(player, "Decisions_JFD_Inca_Quipucamayocs")
		local currentEraID = player:GetCurrentEra()
		if eraID ~= nil then
			if eraID < currentEraID then
				save(player, "Decisions_JFD_Inca_Quipucamayocs", nil)
			else
				Decisions_JFD_Inca_Quipucamayocs.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_INCA_QUIPUCAMAYOCS_ENACTED_DESC", govtShortTitle)
				return false, false, true
			end
		end
		local rewardGold = Game.GetRound((iMod*50)*(player:GetImprovementCount(improvementTerraceFarmID)+player:GetImprovementCount(improvementFarmID)))
		Decisions_JFD_Inca_Quipucamayocs.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_INCA_QUIPUCAMAYOCS_DESC", govtShortTitle, rewardGold)
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if (not player:HasTech(techMathematicsID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Inca_Quipucamayocs.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		local rewardGold = Game.GetRound((iMod*50)*(player:GetImprovementCount(improvementTerraceFarmID)+player:GetImprovementCount(improvementFarmID)))
		player:ChangeGold(rewardGold)
		save(player, "Decisions_JFD_Inca_Quipucamayocs", player:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationIncaID, "Decisions_JFD_Inca_Quipucamayocs", Decisions_JFD_Inca_Quipucamayocs)
--------------------------------------------------------------------------------------------------------------------------
-- Inca: Establish the Chasqui System
--------------------------------------------------------------------------------------------------------------------------
local policyDecisionsIncaChasquiID = GameInfoTypes["POLICY_DECISIONS_INCANCHASQUIS"]
local Decisions_JFD_Inca_Chasquis = {}
	Decisions_JFD_Inca_Chasquis.Name = "TXT_KEY_DECISIONS_JFD_INCA_CHASQUIS"
	Decisions_JFD_Inca_Chasquis.Desc = "TXT_KEY_DECISIONS_JFD_INCA_CHASQUIS_DESC"
	Decisions_JFD_Inca_Chasquis.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Inca_Chasquis, "CIVILIZATION_INCA")
	Decisions_JFD_Inca_Chasquis.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationIncaID then return false, false end
		local govtTitle = player:GetCivilizationDescription()
		if player:HasPolicy(policyDecisionsIncaChasquiID) then
			Decisions_JFD_Inca_Chasquis.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_INCA_CHASQUIS_ENACTED_DESC", govtTitle)
			return false, false, true
		end
		Decisions_JFD_Inca_Chasquis.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_INCA_CHASQUIS_DESC", govtTitle)
		for city in player:Cities() do
			if (not player:IsCapitalConnectedToCity(city)) then return true, false end
		end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Inca_Chasquis.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:GrantPolicy(policyDecisionsIncaChasquiID, true)		
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationIncaID, "Decisions_JFD_Inca_Chasquis", Decisions_JFD_Inca_Chasquis)
--------------------------------------------------------------------------------------------------------------------------
-- The Iroquois
--------------------------------------------------------------------------------------------------------------------------
local civilizationIroquoisID = GameInfoTypes["CIVILIZATION_IROQUOIS"]
--------------------------------------------------------------------------------------------------------------------------
-- Iroquois: Ratify the Gayanashagowa
--------------------------------------------------------------------------------------------------------------------------
local policyDecisionsIroquoisLawOfPeaceID = GameInfoTypes["POLICY_DECISIONS_JFD_IROQUOIS_LAW_PEACE"]
local reformConstitutionCodifiedID 		  = GameInfoTypes["REFORM_JFD_CONSTITUTION_CODIFIED"]
if resourceDignitariesID then
local Decisions_JFD_Iroquois_LawOfPeace = {}
	Decisions_JFD_Iroquois_LawOfPeace.Name = "TXT_KEY_DECISIONS_JFD_IROQUOIS_LAW_OF_PEACE"
	Decisions_JFD_Iroquois_LawOfPeace.Desc = "TXT_KEY_DECISIONS_JFD_IROQUOIS_LAW_OF_PEACE_DESC"
	Decisions_JFD_Iroquois_LawOfPeace.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Iroquois_LawOfPeace, "CIVILIZATION_IROQUOIS")
	Decisions_JFD_Iroquois_LawOfPeace.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationIroquoisID then return false, false end
		local govtTitle = player:GetCivilizationDescription()
		if player:HasPolicy(policyDecisionsIroquoisLawOfPeaceID) then
			Decisions_JFD_Iroquois_LawOfPeace.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_IROQUOIS_LAW_OF_PEACE_ENACTED_DESC", govtTitle)
			return false, false, true
		end
		local minSovereignty = 65
		Decisions_JFD_Iroquois_LawOfPeace.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_IROQUOIS_LAW_OF_PEACE_DESC", govtTitle, minSovereignty)
		if (not player:HasGovernment()) then return true, false end
		if player:GetSovereignty() < minSovereignty then return true, false end
		if player:GetNumResourceAvailable(resourceDignitariesID, false) < 2 then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		for city in player:Cities() do
			if (not city:IsCapital()) then
				if (not player:IsCapitalConnectedToCity(city)) then return true, false end
			end
		end
		if player:GetNumCities() < 3 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Iroquois_LawOfPeace.DoFunc = (
	function(player)
		local numTurns = Game.GetRound(12*iGAMod)
		player:ChangeNumResourceTotal(resourceDignitariesID, -2)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeGoldenAgeTurns(numTurns)
		player:GrantPolicy(policyDecisionsIroquoisLawOfPeaceID, true)
		player:SetHasReform(reformConstitutionCodifiedID, true, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationIroquoisID, "Decisions_JFD_Iroquois_LawOfPeace", Decisions_JFD_Iroquois_LawOfPeace)
end
--------------------------------------------------------------------------------------------------------------------------
-- Iroquois: Call a Mourning War
--------------------------------------------------------------------------------------------------------------------------
if resourceCaptainsID then
local Decisions_JFD_Iroquois_MourningWar = {}
	Decisions_JFD_Iroquois_MourningWar.Name = "TXT_KEY_DECISIONS_JFD_IROQUOIS_MOURNING_WAR"
	Decisions_JFD_Iroquois_MourningWar.Desc = "TXT_KEY_DECISIONS_JFD_IROQUOIS_MOURNING_WAR_DESC"
	Decisions_JFD_Iroquois_MourningWar.Type = "Civilization"
	Decisions_JFD_Iroquois_MourningWar.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationIroquoisID then return false, false end
		if load(player, "Decisions_JFD_Iroquois_MourningWar") == nil then
			save(player, "Decisions_JFD_Iroquois_MourningWar", 0)
		end
		local tTable = {}
		local numChance = 40
		local city = player:GetCapitalCity()
		if city then
			local unitTarget = nil
			local plot = city:Plot()
			local numUnits = plot:GetNumUnits()
			for val = 0,(numUnits - 1) do
				local unit = plot:GetUnit(val)
				local unitIDClass = unit:GetUnitClassType()
				if unit:GetUnitCombatType() == unitCombatMeleeID then
					unitTarget = unit
					break
				end
			end
			tTable.Unit = unitTarget
			if unitTarget then
				numChance = numChance - (unitTarget:GetLevel() * 10)
			end
		end
		if numChance < 10 then numChance = 10 end
		if numChance == 40 then numChance = 30 end
		tTable.Chance = numChance
		for cityIDState, cityState in pairs(Players) do
			if (cityState:IsEverAlive() and cityState:IsMinorCiv() and cityState:IsAlive() and (Teams[player:GetTeam()]:IsHasMet(cityState:GetTeam()))) then
				local decision = "Decisions_JFD_Iroquois_MourningWar" .. cityIDState
				local cityName = cityState:GetName()
				tTempDecisions[decision] = {}
				tTempDecisions[decision].Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_IROQUOIS_MOURNING_WAR", cityName)
				tTempDecisions[decision].Desc = "TXT_KEY_DECISIONS_JFD_IROQUOIS_MOURNING_WAR_DESC"
				tTempDecisions[decision].Data1 = cityState
				tTempDecisions[decision].Data2 = tTable
				tTempDecisions[decision].Weight = 0
				tTempDecisions[decision].Type = "Civilization"
				HookDecisionCivilizationIcon(tTempDecisions[decision], "CIVILIZATION_IROQUOIS")
				tTempDecisions[decision].CanFunc = (
				function(player, cityState, tTable)
					local decision = "Decisions_JFD_Iroquois_MourningWar" .. cityState:GetID()
					local cityName = cityState:GetName()
					if load(player, decision) == true then
						tTempDecisions[decision].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_IROQUOIS_MOURNING_WAR_ENACTED_DESC", cityName)
						return false, false, true
					end
					if load(player, "Decisions_JFD_Iroquois_MourningWar") >= 5 then return false, false end
					local rewardFood = Game.GetRound((player:GetCurrentEra() + 1) * 30*iMod)
					tTempDecisions[decision].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_IROQUOIS_MOURNING_WAR_DESC", cityName, tTable.Chance, rewardFood)
					if (not tTable.Unit) then return true, false end
					return true, true
				end
				)
				
				tTempDecisions[decision].DoFunc = (
				function(player, cityState, tTable)
					local decision = "Decisions_JFD_Iroquois_MourningWar" .. cityState:GetID()
					local rewardFood = Game.GetRound(((player:GetCurrentEra() + 1)*(30*iMod))/player:GetNumCities())
					cityState:ChangeMinorCivFriendshipWithMajor(player:GetID(), -60)
					if GetRandom(1, 100) <= tTable.Chance then
						tTable.Unit:Kill()
					end
					for city in player:Cities() do
						city:ChangeFood(rewardFood)
					end		
					local numTimesEnacted = load(player, "Decisions_JFD_Iroquois_MourningWar") + 1
					save(player, "Decisions_JFD_Iroquois_MourningWar", numTimesEnacted)
					save(player, decision, true)
					JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_IROQUOIS_MOURNING_WAR", player:GetName(), player:GetCivilizationShortDescription(), cityState:GetName()))
				end
				)
			end
		end
	end
	)

Decisions_AddCivilisationSpecific(civilizationIroquoisID, "Decisions_JFD_Iroquois_MourningWar", Decisions_JFD_Iroquois_MourningWar)
end
--------------------------------------------------------------------------------------------------------------------------
-- The Maya
--------------------------------------------------------------------------------------------------------------------------
local civilizationMayaID = GameInfoTypes["CIVILIZATION_MAYA"]
--------------------------------------------------------------------------------------------------------------------------
-- Maya: Endorse Pok-Ta-Pok
--------------------------------------------------------------------------------------------------------------------------
local buildingPyramidID				  = GameInfoTypes["BUILDING_MAYA_PYRAMID"]
local policyDecisionsMayaBallcourtsID = GameInfoTypes["POLICY_DECISIONS_MAYABALLGAME"]
local techTheologyID 				  = GameInfoTypes["TECH_THEOLOGY"]
if resourceClericsID then
local Decisions_JFD_Maya_Ballcourts = {}
    Decisions_JFD_Maya_Ballcourts.Name = "TXT_KEY_DECISIONS_JFD_MAYA_BALLCOURTS"
	Decisions_JFD_Maya_Ballcourts.Desc = "TXT_KEY_DECISIONS_JFD_MAYA_BALLCOURTS_DESC"
	Decisions_JFD_Maya_Ballcourts.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Maya_Ballcourts, "CIVILIZATION_MAYA")
	Decisions_JFD_Maya_Ballcourts.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationMayaID then return false, false end
		local govtShortTitle = player:GetGovernmentShortDescription()
		if player:HasPolicy(policyDecisionsMayaBallcourtsID) then
			Decisions_JFD_Maya_Ballcourts.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_MAYA_BALLCOURTS_ENACTED_DESC", govtShortTitle)
			return false, false, true
		end
		Decisions_JFD_Maya_Ballcourts.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_MAYA_BALLCOURTS_DESC", govtShortTitle)
		if player:GetNumResourceAvailable(resourceClericsID, false) < 1 then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		if player:GetNumCities() > player:CountNumBuildings(buildingPyramidID) then return true, false end
		if (not player:HasTech(techTheologyID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Maya_Ballcourts.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(resourceClericsID, -1)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:GrantPolicy(policyDecisionsMayaBallcourtsID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationMayaID, "Decisions_JFD_Maya_Ballcourts", Decisions_JFD_Maya_Ballcourts)
end
--------------------------------------------------------------------------------------------------------------------------
-- Maya: Improve our Atlatls
--------------------------------------------------------------------------------------------------------------------------
local policyDecisionsMayaAtlatlsID = GameInfoTypes["POLICY_DECISIONS_MAYAATLATL"]
local techConstructionID 		   = GameInfoTypes["TECH_CONSTRUCTION"]
local unitAtlatlID 		  		   = GameInfoTypes["UNIT_MAYAN_ATLATLIST"]
if resourceCaptainsID then
local Decisions_JFD_Maya_Atlatl = {}
    Decisions_JFD_Maya_Atlatl.Name = "TXT_KEY_DECISIONS_JFD_MAYA_ATLATLS"
	Decisions_JFD_Maya_Atlatl.Desc = "TXT_KEY_DECISIONS_JFD_MAYA_ATLATLS_DESC"
	Decisions_JFD_Maya_Atlatl.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Maya_Atlatl, "CIVILIZATION_MAYA")
	Decisions_JFD_Maya_Atlatl.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationMayaID then return false, false end
		if player:HasPolicy(policyDecisionsMayaAtlatlsID) then
			Decisions_JFD_Maya_Atlatl.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_MAYA_ATLATLS_ENACTED_DESC")
			return false, false, true
		end
		Decisions_JFD_Maya_Atlatl.tAtlatl = {}
		for unit in player:Units() do
			if unit:GetUnitType() == unitAtlatlID then table.insert(Decisions_JFD_Maya_Atlatl.tAtlatl, unit) end
		end
		local numUnits = #Decisions_JFD_Maya_Atlatl.tAtlatl
		local costGold = Game.GetRound((30*iMod)*numUnits)
		Decisions_JFD_Maya_Atlatl.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_MAYA_ATLATLS_DESC", costGold)
		if numUnits < 1 then return true, false end
		if player:GetGold() < costGold then	return true, false end
		if player:GetNumResourceAvailable(resourceCaptainsID, false) < 2 then return true, false end
		if (not player:HasTech(techConstructionID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Maya_Atlatl.DoFunc = (
	function(player)
		local numUnits = #Decisions_JFD_Maya_Atlatl.tAtlatl
		local costGold = Game.GetRound((30*iMod)*numUnits)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(resourceCaptainsID, -2)
		for iKey, unit in ipairs(Decisions_JFD_Maya_Atlatl.tAtlatl) do
			local pNewUnit = player:InitUnit(GameInfoTypes.UNIT_COMPOSITE_BOWMAN, unit:GetX(), unit:GetY())
			pNewUnit:Convert(unit)
		end
		player:GrantPolicy(policyDecisionsMayaAtlatlsID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationMayaID, "Decisions_JFD_Maya_Atlatl", Decisions_JFD_Maya_Atlatl)
end
--------------------------------------------------------------------------------------------------------------------------
-- The Netherlands
--------------------------------------------------------------------------------------------------------------------------
local civilizationNetherlandsID = GameInfoTypes["CIVILIZATION_NETHERLANDS"]
--------------------------------------------------------------------------------------------------------------------------
-- Netherlands: Found the Amsterdamsche Wisselbank
--------------------------------------------------------------------------------------------------------------------------
local buildingBankID	 				     = GameInfoTypes["BUILDING_BANK"]
local policyDecisionsNetherlandsWisselbankID = GameInfoTypes["POLICY_DECISIONS_JFD_NETHERLANDS_WISSELBANK"]
if resourceInventorsID then
local Decisions_JFD_Netherlands_Wisselbank = {}
	Decisions_JFD_Netherlands_Wisselbank.Name = "TXT_KEY_DECISIONS_JFD_NETHERLANDS_WISSELBANK"
	Decisions_JFD_Netherlands_Wisselbank.Desc = "TXT_KEY_DECISIONS_JFD_NETHERLANDS_WISSELBANK_DESC"
	Decisions_JFD_Netherlands_Wisselbank.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Netherlands_Wisselbank, "CIVILIZATION_NETHERLANDS")
	Decisions_JFD_Netherlands_Wisselbank.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationNetherlandsID then return false, false end
		if player:HasPolicy(policyDecisionsNetherlandsWisselbankID) then
			Decisions_JFD_Netherlands_Wisselbank.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NETHERLANDS_WISSELBANK_ENACTED_DESC")
			return false, false, true
		end
		local costCulture = Game.GetRound(100*iMod)
		local costGold = Game.GetRound(200*iMod)
		Decisions_JFD_Netherlands_Wisselbank.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NETHERLANDS_WISSELBANK_DESC", costCulture, costGold)
		if player:GetNumResourceAvailable(resourceInventorsID, false) < 2 then return true, false end
		if player:GetCurrentEra() < eraRenaissanceID then return true, false end
		if player:GetGold() < costGold then return true, false end
		if player:GetJONSCulture() < costCulture then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Netherlands_Wisselbank.DoFunc = (
	function(player)
		local costCulture = Game.GetRound(100*iMod)
		local costGold = Game.GetRound(200*iMod)
		player:ChangeNumResourceTotal(resourceInventorsID, -2)
		player:ChangeJONSCulture(-costCulture)
		player:ChangeGold(-costGold)
		player:GetCapitalCity():SetNumRealBuilding(buildingBankID, 1)
		player:GrantPolicy(policyDecisionsNetherlandsWisselbankID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationNetherlandsID, "Decisions_JFD_Netherlands_Wisselbank", Decisions_JFD_Netherlands_Wisselbank)
end
--------------------------------------------------------------------------------------------------------------------------
-- Netherlands: Modernise the Merchant Navy
--------------------------------------------------------------------------------------------------------------------------
local policyDecisionsNetherlandsMerchantNavyID = GameInfoTypes["POLICY_DECISIONS_JFD_NETHERLANDS_MERCHANT_NAVY"]
local unitCargoShipID 						   = GameInfoTypes["UNIT_CARGO_SHIP"]
if resourceCaptainsID then
local Decisions_JFD_Netherlands_MerchantNavy = {}
	Decisions_JFD_Netherlands_MerchantNavy.Name = "TXT_KEY_DECISIONS_JFD_NETHERLANDS_MERCHANT_NAVY"
	Decisions_JFD_Netherlands_MerchantNavy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NETHERLANDS_MERCHANT_NAVY_DESC")
	Decisions_JFD_Netherlands_MerchantNavy.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Netherlands_MerchantNavy, "CIVILIZATION_NETHERLANDS")
	Decisions_JFD_Netherlands_MerchantNavy.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationNetherlandsID then return false, false end
		if player:HasPolicy(policyDecisionsNetherlandsMerchantNavyID) then
			Decisions_JFD_Netherlands_MerchantNavy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NETHERLANDS_MERCHANT_NAVY_ENACTED_DESC")
			return false, false, true
		end
		if player:GetNumInternationalTradeRoutesUsed() < player:GetNumInternationalTradeRoutesAvailable() then return true, false end
		if player:GetCurrentEra() < eraRenaissanceID then return true, false end
		if player:GetNumResourceAvailable(resourceCaptainsID, false) < 2 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Netherlands_MerchantNavy.DoFunc = (
	function(player)
		local city = player:GetCapitalCity()
		local plot = city:Plot()
		player:ChangeNumResourceTotal(resourceCaptainsID, -2)
		player:InitUnit(unitCargoShipID, plot:GetX(), plot:GetY())
		player:GrantPolicy(policyDecisionsNetherlandsMerchantNavyID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationNetherlandsID, "Decisions_JFD_Netherlands_MerchantNavy", Decisions_JFD_Netherlands_MerchantNavy)
end
--------------------------------------------------------------------------------------------------------------------------
-- The Ottomans
--------------------------------------------------------------------------------------------------------------------------
local civilizationOttomansID = GameInfoTypes["CIVILIZATION_OTTOMAN"]
-------------------------------------------------------------------------------------------------------------------------
-- Ottomans: Commission Decorated Tughra
-------------------------------------------------------------------------------------------------------------------------
local eraRenaissanceID		     		 = GameInfoTypes["ERA_RENAISSANCE"]
local unitDecisionsOttomansCaligrapherID = GameInfoTypes["UNIT_DECISIONS_JFD_OTTOMAN_CALLIGRAPHER"]
if resourceDignitariesID then
local Decisions_JFD_Ottomans_DecoratedTughra = {}
	Decisions_JFD_Ottomans_DecoratedTughra.Name = "TXT_KEY_DECISIONS_JFD_OTTOMAN_COMMISSION_DECORATED_TUGHRA"
	Decisions_JFD_Ottomans_DecoratedTughra.Desc = "TXT_KEY_DECISIONS_JFD_OTTOMAN_COMMISSION_DECORATED_TUGHRA_DESC"
	Decisions_JFD_Ottomans_DecoratedTughra.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Ottomans_DecoratedTughra, "CIVILIZATION_OTTOMAN")
	Decisions_JFD_Ottomans_DecoratedTughra.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationOttomanID then return false, false end
		local leaderTitle = player:GetLeaderTitleShort()
		if load(player, "Decisions_JFD_Ottomans_DecoratedTughra") == true then
			Decisions_JFD_Ottomans_DecoratedTughra.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_OTTOMAN_COMMISSION_DECORATED_TUGHRA_ENACTED_DESC", leaderTitle)
			return false, false, true
		end
		local costGold = Game.GetRound(300*iMod)
		Decisions_JFD_Ottomans_DecoratedTughra.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_OTTOMAN_COMMISSION_DECORATED_TUGHRA_DESC", leaderTitle, costGold)
		if player:GetGold() < costGold then return true, false end
		if player:GetNumResourceAvailable(resourceDignitariesID, false) < 2 then return true, false end
		if player:GetCurrentEra() < eraRenaissanceID then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Ottomans_DecoratedTughra.DoFunc = (
	function(player)
		local costGold = Game.GetRound(300*iMod)
		local capital = player:GetCapitalCity()
		player:ChangeNumResourceTotal(resourceDignitariesID, -1)
		player:ChangeNumResourceTotal(iMagistrate, 1)
		player:ChangeGold(-costGold)
		player:InitUnit(unitDecisionsOttomansCaligrapherID, capital:GetX(), capital:GetY())
		save(player, "Decisions_JFD_Ottomans_DecoratedTughra", true)
	end
	)

Decisions_AddCivilisationSpecific(civilizationOttomansID, "Decisions_JFD_Ottomans_DecoratedTughra", Decisions_JFD_Ottomans_DecoratedTughra)
end
--------------------------------------------------------------------------------------------------------------------------
-- Ottomans: Become a Gunpowder Empire
--------------------------------------------------------------------------------------------------------------------------
local policyDecisionsGunpowderEmpireID = GameInfoTypes["POLICY_DECISIONS_OTTOMANGUNPOWDER"]
if resourceCaptainsID then
local Decisions_OttomanGunpowder = {}
    Decisions_OttomanGunpowder.Name = "TXT_KEY_DECISIONS_JFD_OTTOMAN_GUNPOWDER"
	Decisions_OttomanGunpowder.Desc = "TXT_KEY_DECISIONS_JFD_OTTOMAN_GUNPOWDER_DESC"
	Decisions_OttomanGunpowder.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_OttomanGunpowder, "CIVILIZATION_OTTOMAN")
	Decisions_OttomanGunpowder.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationOttomansID then return false, false end
		if player:HasPolicy(policyDecisionsGunpowderEmpireID) then
			Decisions_OttomanGunpowder.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_OTTOMAN_GUNPOWDER_ENACTED_DESC")
			return false, false, true
		end
		local costGold = Game.GetRound(500*iMod)
		Decisions_OttomanGunpowder.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_OTTOMAN_GUNPOWDER_DESC", costGold)
		if player:GetGold() < costGold then return true, false end
		if player:GetNumResourceAvailable(resourceCaptainsID, false) < 2 then return true, false end
		if (not player:HasTech(techGunpowderID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_OttomanGunpowder.DoFunc = (
	function(player)
		local costGold = Game.GetRound(500*iMod)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(resourceCaptainsID, -2)
		player:GrantPolicy(policyDecisionsGunpowderEmpireID, true)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_OTTOMAN_GUNPOWDER", player:GetName(), player:GetCivilizationShortDescription()))
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationOttomansID, "Decisions_OttomanGunpowder", Decisions_OttomanGunpowder)
end
--------------------------------------------------------------------------------------------------------------------------
-- The Shoshone
--------------------------------------------------------------------------------------------------------------------------
local civilizationShoshoneID = GameInfoTypes["CIVILIZATION_SHOSHONE"]
--------------------------------------------------------------------------------------------------------------------------
-- Shoshone: Form the Tukudeka Nation
--------------------------------------------------------------------------------------------------------------------------
local policyDecisionsShoshoneTukudekaID  = GameInfoTypes["POLICY_DECISIONS_JFD_SHOSHONE_TUKUDEKA"]
if resourceDignitariesID and resourceCaptainsID then
local Decisions_JFD_Shoshone_Tukudeka = {}
	Decisions_JFD_Shoshone_Tukudeka.Name = "TXT_KEY_DECISIONS_JFD_SHOSHONE_TUKUDEKA"
	Decisions_JFD_Shoshone_Tukudeka.Desc = "TXT_KEY_DECISIONS_JFD_SHOSHONE_TUKUDEKA_DESC"
	Decisions_JFD_Shoshone_Tukudeka.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Shoshone_Tukudeka, "CIVILIZATION_SHOSHONE")
	Decisions_JFD_Shoshone_Tukudeka.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationShoshoneID then return false, false end
		if player:HasPolicy(policyDecisionsShoshoneTukudekaID) then
			Decisions_JFD_Shoshone_Tukudeka.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SHOSHONE_TUKUDEKA_ENACTED_DESC")
			return false, false, true
		end
		Decisions_JFD_Shoshone_Tukudeka.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SHOSHONE_TUKUDEKA_DESC")
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if player:GetNumResourceAvailable(resourceCaptainsID, false) < 1 then return true, false end
		if player:GetNumResourceAvailable(resourceDignitariesID, false) < 1 then return true, false end
		if player:GetNumCities() < 4 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Shoshone_Tukudeka.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local cultureReward = Game.GetRound(((player:GetNumResourceAvailable(resourceHorseID, false)+5)*30)*iMod)
		player:ChangeNumResourceTotal(resourceDignitariesID, -1)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeNumResourceTotal(resourceCaptainsID, -1)
		player:ChangeNumResourceTotal(resourceHorseID, 5)
		player:ChangeJONSCulture(cultureReward)
		player:GrantPolicy(policyDecisionsShoshoneTukudekaID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationShoshoneID, "Decisions_JFD_Shoshone_Tukudeka", Decisions_JFD_Shoshone_Tukudeka)
end
--------------------------------------------------------------------------------------------------------------------------
-- Shoshone: Explore the Wilderness
--------------------------------------------------------------------------------------------------------------------------
local unitPathfinderID = GameInfoTypes["UNIT_SHOSHONE_PATHFINDER"]
if resourceCaptainsID then
local Decisions_JFD_Shoshone_Wilderness = {}
	Decisions_JFD_Shoshone_Wilderness.Name = "TXT_KEY_DECISIONS_JFD_SHOSHONE_WILDNERESS"
	Decisions_JFD_Shoshone_Wilderness.Desc = "TXT_KEY_DECISIONS_JFD_SHOSHONE_WILDNERESS_DESC"
	Decisions_JFD_Shoshone_Wilderness.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Shoshone_Wilderness, "CIVILIZATION_SHOSHONE")
	Decisions_JFD_Shoshone_Wilderness.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationShoshoneID then return false, false end
		if load(player, "Decisions_JFD_Shoshone_Wilderness") == true then
			Decisions_JFD_Shoshone_Wilderness.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SHOSHONE_WILDNERESS_ENACTED_DESC")
			return false, false, true
		end
		local costGold = Game.GetRound(40*iMod)
		Decisions_JFD_Shoshone_Wilderness.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SHOSHONE_WILDNERESS_DESC", costGold)
		if player:GetNumResourceAvailable(resourceCaptainsID, false) < 1 then return true, false end
		if player:GetGold() < costGold then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Shoshone_Wilderness.DoFunc = (
	function(player)
		local costGold = Game.GetRound(40*iMod)
		player:ChangeJONSCulture(-costGold)
		player:ChangeNumResourceTotal(resourceCaptainsID, -1)
		InitUnitFromCity(player:GetCapitalCity(), unitPathfinderID, 2)
		save(player, "Decisions_JFD_Shoshone_Wilderness", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationShoshoneID, "Decisions_JFD_Shoshone_Wilderness", Decisions_JFD_Shoshone_Wilderness)
end
--------------------------------------------------------------------------------------------------------------------------
-- Venice
--------------------------------------------------------------------------------------------------------------------------
local civilizationVeniceID = GameInfoTypes["CIVILIZATION_VENICE"]
--------------------------------------------------------------------------------------------------------------------------
-- Venice: Conduct Marriage to the Sea
--------------------------------------------------------------------------------------------------------------------------
local techCompassID = GameInfoTypes["TECH_COMPASS"]
if (resourceCaptainsID and resourceClericsID) then
local Decisions_JFD_Venice_MarriageSea = {}
	Decisions_JFD_Venice_MarriageSea.Name = "TXT_KEY_DECISIONS_JFD_VENICE_MARRIAGE_SEA"
	Decisions_JFD_Venice_MarriageSea.Desc = "TXT_KEY_DECISIONS_JFD_VENICE_MARRIAGE_SEA_DESC"
	Decisions_JFD_Venice_MarriageSea.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Venice_MarriageSea, "CIVILIZATION_VENICE")
	Decisions_JFD_Venice_MarriageSea.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationVeniceID then return false, false end
		local eraID = load(player, "Decisions_JFD_Venice_MarriageSea")
		local currentEraID = player:GetCurrentEra()
		if eraID then
			if eraID < currentEraID then
				save(player, "Decisions_JFD_Venice_MarriageSea", nil)
			else
				Decisions_JFD_Venice_MarriageSea.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_VENICE_MARRIAGE_SEA_ENACTED_DESC")
				return false, false, true
			end
		end
		local numCoastalCities = 0
		for city in player:Cities() do 
			if city:IsCoastal() then
				numCoastalCities = numCoastalCities + 1
			end
		end	
		local numTurns = (numCoastalCities*3)
		Decisions_JFD_Venice_MarriageSea.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_VENICE_MARRIAGE_SEA_DESC", numTurns)
		if player:GetNumResourceAvailable(resourceClericsID, false) < 1 then return true, false end
		if player:GetNumResourceAvailable(resourceCaptainsID, false) < 1 then return true, false end
		if (not player:HasTech(techCompassID)) then return true, false end
		if numTurns < 1 then return true, false end  
		return true, true
	end
	)
	
	Decisions_JFD_Venice_MarriageSea.DoFunc = (
	function(player)
		local numCoastalCities = 0
		for city in player:Cities() do 
			if city:IsCoastal() then
				numCoastalCities = numCoastalCities + 1
			end
		end	
		local numTurns = (numCoastalCities*3)
		player:ChangeNumResourceTotal(resourceClericsID, -1)
		player:ChangeNumResourceTotal(resourceCaptainsID, -1)
		player:ChangeGold(-costGold)
		for city in player:Cities() do 
			if city:IsCoastal() then 
				LuaEvents.JFD_WLTKDBegins(player:GetID(), city, city:GetX(), city:GetY(), numTurns, -1, true)
			end
		end	
		save(player, "Decisions_JFD_Venice_MarriageSea", player:GetCurrentEra())
	end
	)

Decisions_AddCivilisationSpecific(civilizationVeniceID, "Decisions_JFD_Venice_MarriageSea", Decisions_JFD_Venice_MarriageSea)
end
--------------------------------------------------------------------------------------------------------------------------
-- Venice: Rescue the Relics of St Mark
--------------------------------------------------------------------------------------------------------------------------
if resourceDignitariesID then
local buildingStMarksID		= GameInfoTypes["BUILDING_SAN_MARCO_BASILICA"]
local Decisions_JFD_Venice_StMarks = {}
	Decisions_JFD_Venice_StMarks.Name = "TXT_KEY_DECISIONS_JFD_VENICE_ST_MARKS"
	Decisions_JFD_Venice_StMarks.Desc = "TXT_KEY_DECISIONS_JFD_VENICE_ST_MARKS_DESC"
	Decisions_JFD_Venice_StMarks.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Venice_StMarks, "CIVILIZATION_VENICE")
	Decisions_JFD_Venice_StMarks.Pedia = "TXT_KEY_BUILDING_SAN_MARCO_BASILICA_DESC"
	Decisions_JFD_Venice_StMarks.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationVeniceID then return false, false end
		if load(player, "Decisions_JFD_Venice_StMarks") == true then
			Decisions_JFD_Venice_StMarks.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_VENICE_ST_MARKS_ENACTED_DESC")
			return false, false, true
		end
		local costGold = Game.GetRound(600*iMod)
		Decisions_JFD_Venice_StMarks.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_VENICE_ST_MARKS_DESC", costGold)
		if player:GetNumResourceAvailable(resourceDignitariesID, false) < 2 then return true, false end		
		if player:GetGold() < costGold then return true, false end
		local minors = {}
		minorPlayerID = nil
		local tradeRoutes = player:GetTradeRoutes()
        for _,tradeRoute in ipairs(tradeRoutes) do
			if tradeRoute.FromID ~= tradeRoute.ToID then
			     if Players[tradeRoute.ToID]:IsMinorCiv() then
					table.insert(minors, tradeRoute.ToID)
				end
			end
		end
		minorPlayerID = minors[Game.GetRandom(1, #minors)]
		if (not minorPlayerID) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Venice_StMarks.DoFunc = (
	function(player)
		local costGold = Game.GetRound(600*iMod)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(resourceDignitariesID, -2)
		player:GetCapitalCity():SetNumRealBuilding(buildingStMarksID, 1)
		Players[minorPlayerID]:ChangeMinorCivFriendshipWithMajor(player:GetID(), -30)
		save(player, "Decisions_JFD_Venice_StMarks", true)
	end
	)

Decisions_AddCivilisationSpecific(civilizationVeniceID, "Decisions_JFD_Venice_StMarks", Decisions_JFD_Venice_StMarks)
end
--------------------------------------------------------------------------------------------------------------------------
-- Zulu
--------------------------------------------------------------------------------------------------------------------------
local civilizationZuluID = GameInfoTypes["CIVILIZATION_ZULU"]
--------------------------------------------------------------------------------------------------------------------------
-- Zulu: Amabutho Conscription
--------------------------------------------------------------------------------------------------------------------------
local policyDescisionsZuluAmabuthoID = GameInfoTypes["POLICY_DECISIONS_JFD_ZULU_AMABUTHO"]
local techCivilServiceID 			 = GameInfoTypes["TECH_CIVIL_SERVICE"]
if resourceCaptainsID then
local Decisions_JFD_Zulu_Amabutho = {}
    Decisions_JFD_Zulu_Amabutho.Name = "TXT_KEY_DECISIONS_JFD_ZULU_AMABUTHO"
	Decisions_JFD_Zulu_Amabutho.Desc = "TXT_KEY_DECISIONS_JFD_ZULU_AMABUTHO_DESC"
	Decisions_JFD_Zulu_Amabutho.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Zulu_Amabutho, "CIVILIZATION_ZULU")
	Decisions_JFD_Zulu_Amabutho.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationZuluID then return false, false end
		if player:HasPolicy(policyDescisionsZuluAmabuthoID) then
			Decisions_JFD_Zulu_Amabutho.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ZULU_AMABUTHO_ENACTED_DESC")
			return false, false, true
		end
		Decisions_JFD_Zulu_Amabutho.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ZULU_AMABUTHO_DESC")
		local playerID = player:GetID()
		for city in player:Cities() do
			if city:GetPopulation() < 3 then return true, false end
		end
		if player:GetNumResourceAvailable(resourceCaptainsID, false) < 2 then return true, false end
		if (not player:HasTech(techCivilServiceID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Zulu_Amabutho.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(resourceCaptainsID, -4)
		player:GrantPolicy(policyDescisionsZuluAmabuthoID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationZuluID, "Decisions_JFD_Zulu_Amabutho", Decisions_JFD_Zulu_Amabutho)
end
--------------------------------------------------------------------------------------------------------------------------
-- Zulu: Recruit Udibi
--------------------------------------------------------------------------------------------------------------------------
local buildingIkandaID = GameInfoTypes["BUILDING_IKANDA"]
local domainLandID 	   = GameInfoTypes["DOMAIN_LAND"]
if resourceCaptainsID then
local Decisions_JFD_Zulu_Udibi = {}
    Decisions_JFD_Zulu_Udibi.Name = "TXT_KEY_DECISIONS_JFD_ZULU_UDIBI"
	Decisions_JFD_Zulu_Udibi.Desc = "TXT_KEY_DECISIONS_JFD_ZULU_UDIBI_DESC"
	Decisions_JFD_Zulu_Udibi.Type = "Civilization"
	HookDecisionCivilizationIcon(Decisions_JFD_Zulu_Udibi, "CIVILIZATION_ZULU")
	Decisions_JFD_Zulu_Udibi.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationZuluID then return false, false end
		local eraID = load(player, "Decisions_JFD_Zulu_Udibi")
		local currentEraID = player:GetCurrentEra()
		if eraID ~= nil then
			if eraID < currentEraID then
				save(player, "Decisions_JFD_Zulu_Udibi", nil)
			else
				Decisions_JFD_Zulu_Udibi.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ZULU_UDIBI_ENACTED_DESC")
				return false, false, true
			end
		end
		Decisions_JFD_Zulu_Udibi.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ZULU_UDIBI_DESC")
		if player:GetNumResourceAvailable(resourceCaptainsID, false) < 2 then return true, false end
		if player:CountNumBuildings(buildingIkandaID) < player:GetNumCities() then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Zulu_Udibi.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(resourceCaptainsID, -2)
		for unit in player:Units() do
			if unit:IsCombatUnit() and unit:GetDomainType() == domainLandID then
				unit:SetDamage(0)
				unit:ChangeExperience(10)
			end
		end
		save(player, "Decisions_JFD_Zulu_Udibi", player:GetCurrentEra())
	end
	)
	
	Decisions_JFD_Zulu_Udibi.Weight = (
	function(player) 
		return Teams[player:GetTeam()]:GetAtWarCount(false) > 0
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationZuluID, "Decisions_JFD_Zulu_Udibi", Decisions_JFD_Zulu_Udibi)
end
--=======================================================================================================================
--=======================================================================================================================