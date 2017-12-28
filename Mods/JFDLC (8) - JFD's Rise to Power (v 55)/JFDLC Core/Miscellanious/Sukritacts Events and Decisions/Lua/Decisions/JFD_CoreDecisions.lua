-- Core Decisions
-- Author: Sukritact
--=======================================================================================================================

print("Core Decisions: loaded")
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingCIDDevelopmentCore = (Game.GetUserSetting("JFD_CID_DEVELOPMENT_CORE") == 1)
local userSettingCIDLoyaltyCore 	= (Game.GetUserSetting("JFD_CID_LOYALTY_CORE") == 1)
local userSettingRTPSovereigntyCore = (Game.GetUserSetting("JFD_RTP_SOVEREIGNTY_CORE") == 1)
--=======================================================================================================================
-- GLOBALS
--=======================================================================================================================
local defineMaxMajorCivs	= GameDefines["MAX_MAJOR_CIVS"]
local defineMaxMinorCivs	= GameDefines["MAX_MINOR_CIVS"]

local eraAncientID			= GameInfoTypes["ERA_ANCIENT"]
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
-- GENERAL
--=======================================================================================================================
local epithetDecisionsEnlightenedID = GameInfoTypes["EPITHET_JFD_ENLIGHTENED"]
local policyDecisionsEnlightenedID  = GameInfoTypes["POLICY_EPITHET_JFD_ENLIGHTENED"]
if (eraEnlightenmentID and resourceCaptainsID and resourceClericsID and resourceDignitariesID and resourceInventorsID) then
local Decisions_JFD_EmbraceEnlightenment = {}
	Decisions_JFD_EmbraceEnlightenment.Name = "TXT_KEY_DECISIONS_JFD_EMBRACE_ENLIGHTENMENT"
	Decisions_JFD_EmbraceEnlightenment.Desc = "TXT_KEY_DECISIONS_JFD_EMBRACE_ENLIGHTENMENT_DESC"
	Decisions_JFD_EmbraceEnlightenment.Era = eraEnlightenmentID
	Decisions_JFD_EmbraceEnlightenment.CanFunc = (
	function(player)
		if player:HasPolicy(policyDecisionsEnlightenedID) then
			Decisions_JFD_EmbraceEnlightenment.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_EMBRACE_ENLIGHTENMENT_ENACTED_DESC")
			return false, false, true
		end
		if player:GetCurrentEra() < eraRenaissanceID then return false, false end
		Decisions_JFD_EmbraceEnlightenment.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_EMBRACE_ENLIGHTENMENT_DESC")
		if player:GetCurrentEra() ~= eraEnlightenmentID then return true, false end
		if player:GetNumResourceAvailable(resourceCaptainsID, false) < 1 then return true, false end
		if player:GetNumResourceAvailable(resourceClericsID, false) < 1 then return true, false end
		if player:GetNumResourceAvailable(resourceDignitariesID, false) < 1 then return true, false end
		if player:GetNumResourceAvailable(resourceInventorsID, false) < 1 then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_EmbraceEnlightenment.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(resourceCaptainsID, -1)
		player:ChangeNumResourceTotal(resourceClericsID, -1)
		player:ChangeNumResourceTotal(resourceDignitariesID, -1)
		player:ChangeNumResourceTotal(resourceInventorsID, -1)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeGoldenAgeTurns(12*iGAMod)
		player:ChangeNumFreePolicies(1)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_EMBRACE_ENLIGHTENMENT", player:GetName(), player:GetCivilizationShortDescription()))
		LuaEvents.JFD_RTP_Epithets_ShowChooseEpithetPopup(epithetDecisionsEnlightenedID)
		save(player, "Decisions_JFD_EmbraceEnlightenment", player:GetCurrentEra())
	end
	)

tDecisions["Decisions_JFD_EmbraceEnlightenment"] = Decisions_JFD_EmbraceEnlightenment
end
--=======================================================================================================================
-- CAPTAINS
--=======================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Appoint Commander
--------------------------------------------------------------------------------------------------------------------------
if resourceCaptainsID then
local Decisions_JFD_AppointCommander = {}
	Decisions_JFD_AppointCommander.Name = "TXT_KEY_DECISIONS_JFD_APPOINT_COMMANDER"
	Decisions_JFD_AppointCommander.Desc = "TXT_KEY_DECISIONS_JFD_APPOINT_COMMANDER_DESC"
	Decisions_JFD_AppointCommander.Era = eraClassicalID
	Decisions_JFD_AppointCommander.CanFunc = (
	function(player)
		if player:GetCurrentEra() < eraClassicalID then return false, false end
		local eraID = load(player, "Decisions_JFD_AppointCommander")
		local currentEraID = player:GetCurrentEra()
		if eraID then
			if eraID < currentEraID then
				save(player, "Decisions_JFD_AppointCommander", nil)
			else
				Decisions_JFD_AppointCommander.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_APPOINT_COMMANDER_ENACTED_DESC")
				return false, false, true
			end
		end
		Decisions_JFD_AppointCommander.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_APPOINT_COMMANDER_DESC")
		-- if player:GetCurrentEra() < eraClassicalID then return true, false end
		if (not player:GetCapitalCity()) then return true, false end
		if (not player:GetCapitalCity():GetGarrisonedUnit()) then return true, false end
		if player:GetNumResourceAvailable(resourceCaptainsID, false) < 2 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_AppointCommander.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(resourceCaptainsID, -2)
		local unit = player:GetCapitalCity():GetGarrisonedUnit()
		unit:ChangeExperience(unit:ExperienceNeeded())
		save(player, "Decisions_JFD_AppointCommander", player:GetCurrentEra())
	end
	)

tDecisions["Decisions_JFD_AppointCommander"] = Decisions_JFD_AppointCommander
end
-------------------------------------------------------------------------------------------------------------------------
-- Hold Military Parade
-------------------------------------------------------------------------------------------------------------------------
local ideologyAutocracyID = GameInfoTypes["POLICY_BRANCH_AUTOCRACY"]
if resourceCaptainsID then
local Decisions_JFD_MilitaryParade = {}
	Decisions_JFD_MilitaryParade.Name = "TXT_KEY_DECISIONS_JFD_MILITARY_PARADE"
	Decisions_JFD_MilitaryParade.Desc = "TXT_KEY_DECISIONS_JFD_MILITARY_PARADE_DESC"
	Decisions_JFD_MilitaryParade.Era = eraIndustrialID
	Decisions_JFD_MilitaryParade.CanFunc = (
	function(player)
		if player:GetCurrentEra() < eraEnlightenmentID then return false, false end
		local eraID = load(player, "Decisions_JFD_MilitaryParade")
		local currentEraID = player:GetCurrentEra()
		if eraID then
			if eraID < currentEraID then
				save(player, "Decisions_JFD_MilitaryParade", nil)
			else
				Decisions_JFD_MilitaryParade.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_MILITARY_PARADE_ENACTED_DESC")
				return false, false, true
			end
		end
		local costGold = Game.GetRound((player:GetNumCities()*150)*iMod)
		Decisions_JFD_MilitaryParade.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_MILITARY_PARADE_DESC", costGold)
		if player:GetCurrentEra() < eraIndustrialID then return true, false end
		if (not player:GetCapitalCity()) then return true, false end
		if (not player:GetCapitalCity():GetGarrisonedUnit()) then return true, false end
		if player:GetGold() < costGold then return true, false end
		if player:GetNumResourceAvailable(resourceCaptainsID, false) < 2 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_MilitaryParade.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local costGold = Game.GetRound((player:GetNumCities()*150)*iMod)
		player:ChangeNumResourceTotal(resourceCaptainsID, -2)
		player:ChangeGold(-costGold)
		for city in player:Cities() do
			city:ChangeResistanceTurns(-city:GetResistanceTurns())
			city:ChangeResistanceCounter(-city:GetResistanceCounter())
			city:ChangeDisloyaltyCounter(-city:GetDisloyaltyCounter())
		end
		save(player, "Decisions_JFD_MilitaryParade", player:GetCurrentEra())
	end
	)
	
tDecisions["Decisions_JFD_MilitaryParade"] = Decisions_JFD_MilitaryParade
end
-------------------------------------------------------------------------------------------------------------------------
-- Host a Grand Tournament
-------------------------------------------------------------------------------------------------------------------------
if resourceCaptainsID then
local Decisions_JFD_HostGrandTournament = {}
	Decisions_JFD_HostGrandTournament.Name = "TXT_KEY_DECISIONS_JFD_GRAND_TOURNAMENT"
	Decisions_JFD_HostGrandTournament.Desc = "TXT_KEY_DECISIONS_JFD_GRAND_TOURNAMENT_DESC"
	Decisions_JFD_HostGrandTournament.Era = eraMedievalID
	Decisions_JFD_HostGrandTournament.CanFunc = (
	function(player)
		if player:GetCurrentEra() < eraClassicalID then return false, false end
		local eraID = load(player, "Decisions_JFD_HostGrandTournament")
		local currentEraID = player:GetCurrentEra()
		if eraID then
			if eraID < currentEraID then
				save(player, "Decisions_JFD_HostGrandTournament", nil)
			else
				Decisions_JFD_HostGrandTournament.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_GRAND_TOURNAMENT_ENACTED_DESC")
				return false, false, true
			end
		end
		local costGold = Game.GetRound((50*player:GetNumCities())*iMod)
		Decisions_JFD_HostGrandTournament.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_GRAND_TOURNAMENT_DESC", costGold)
		if player:GetCurrentEra() < eraMedievalID then return true, false end
		if player:GetNumResourceAvailable(resourceCaptainsID, false) < 2 then return true, false end
		if player:GetGold() < costGold then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_HostGrandTournament.DoFunc = (
	function(player)
		local costGold = Game.GetRound((50*player:GetNumCities())*iMod)
		local resourceID = resourceDignitariesID
		player:ChangeNumResourceTotal(resourceCaptainsID, -2)
		for city in player:Cities() do
			LuaEvents.JFD_WLTKDBegins(player:GetID(), city, city:GetX(), city:GetY(), 5, -1, true)
		end
		save(player, "Decisions_JFD_HostGrandTournament", player:GetCurrentEra())
	end
	)
	
tDecisions["Decisions_JFD_HostGrandTournament"] = Decisions_JFD_HostGrandTournament
end
--------------------------------------------------------------------------------------------------------------------------
-- Levy War Taxes
--------------------------------------------------------------------------------------------------------------------------
if resourceCaptainsID then
local Decisions_JFD_LevyWarTaxes = {}
	Decisions_JFD_LevyWarTaxes.Name = "TXT_KEY_DECISIONS_JFD_LEVY_WAR_TAXES"
	Decisions_JFD_LevyWarTaxes.Desc = "TXT_KEY_DECISIONS_JFD_LEVY_WAR_TAXES_DESC"
	Decisions_JFD_LevyWarTaxes.Era = eraAncientID
	Decisions_JFD_LevyWarTaxes.Weight = 0
	Decisions_JFD_LevyWarTaxes.CanFunc = (
	function(player)		
		local currentEraID = player:GetCurrentEra()
		local eraID = load(player, "Decisions_JFD_LevyWarTaxes")
		if eraID ~= nil then
			if eraID < currentEraID then
				save(player, "Decisions_JFD_LevyWarTaxes", nil)
			else
				Decisions_JFD_LevyWarTaxes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_LEVY_WAR_TAXES_ENACTED_DESC")
				return false, false, true
			end
		end
		local costCulture = Game.GetRound((player:GetTotalPopulation()*5)*iMod)
		local rewardGold = Game.GetRound((player:GetTotalPopulation()*20)*iMod)
		Decisions_JFD_LevyWarTaxes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_LEVY_WAR_TAXES_DESC", costCulture, rewardGold)
		if (not player:IsAtWarAnyMajor()) then return true, false end
		if player:GetNumResourceAvailable(resourceCaptainsID, false) < 1 then return true, false end
		if player:GetJONSCulture() < costCulture then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_LevyWarTaxes.DoFunc = (
	function(player)
		local costCulture = Game.GetRound((player:GetTotalPopulation()*5)*iMod)
		local rewardGold = Game.GetRound((player:GetTotalPopulation()*20)*iMod)
		player:ChangeNumResourceTotal(resourceCaptainsID, -1)
		player:ChangeJONSCulture(-costCulture)
		player:ChangeGold(rewardGold)
		save(player, "Decisions_JFD_LevyWarTaxes", player:GetCurrentEra())
	end
	)
	
tDecisions["Decisions_JFD_LevyWarTaxes"] = Decisions_JFD_LevyWarTaxes
end
-------------------------------------------------------------------------------------------------------------------------
-- Autocracy: Militarize the Utilities
-------------------------------------------------------------------------------------------------------------------------
local buildingClassFactoryID = GameInfoTypes["BUILDINGCLASS_FACTORY"]
local ideologyAutocracyID	 = GameInfoTypes["POLICY_BRANCH_AUTOCRACY"]
if resourceCaptainsID then
local Decisions_JFD_AutocracyMilitarizeUtilities = {}
	Decisions_JFD_AutocracyMilitarizeUtilities.Name = "TXT_KEY_DECISIONS_JFD_AUTOCRACY_MILITARIZE_UTILITIES"
	Decisions_JFD_AutocracyMilitarizeUtilities.Desc = "TXT_KEY_DECISIONS_JFD_AUTOCRACY_MILITARIZE_UTILITIES_DESC"
	Decisions_JFD_AutocracyMilitarizeUtilities.Era = eraIndustrialID
	Decisions_JFD_AutocracyMilitarizeUtilities.CanFunc = (
	function(player)
		if player:GetCurrentEra() < eraIndustrialID then return false, false end
		if (not player:HasIdeology(ideologyAutocracyID)) then return false, false end
		if load(player, "Decisions_JFD_AutocracyMilitarizeUtilities") then
			Decisions_JFD_AutocracyMilitarizeUtilities.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_AUTOCRACY_MILITARIZE_UTILITIES_ENACTED_DESC")
			return false, false, true
		end
		local numFactories = player:GetBuildingClassCount(buildingClassFactoryID)
		local rewardGGP = Game.GetRound((numFactories*50)*iMod)
		Decisions_JFD_AutocracyMilitarizeUtilities.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_AUTOCRACY_MILITARIZE_UTILITIES_DESC", numFactories, rewardGGP)
		if numFactories < 3 then return true, false end
		if player:GetNumResourceAvailable(resourceCaptainsID, false) < numFactories then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_AutocracyMilitarizeUtilities.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local numFactories = player:GetBuildingClassCount(buildingClassFactoryID)
		local rewardGGP = Game.GetRound((numFactories*50)*iMod)
		player:ChangeNumResourceTotal(resourceCaptainsID, -numFactories)
		player:ChangeCombatExperience(rewardGGP)
		for city in player:Cities() do
			local buildingFactoryID = player:GetSpecificBuildingType("BUILDINGCLASS_FACTORY")
			if buildingFactoryID then
				city:SetNumFreeBuilding(buildingFactoryID, 1)
			end
		end
		save(player, "Decisions_JFD_AutocracyMilitarizeUtilities", true)
	end
	)
	
tDecisions["Decisions_JFD_AutocracyMilitarizeUtilities"] = Decisions_JFD_AutocracyMilitarizeUtilities
end
--=======================================================================================================================
-- DIGNITARIES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
-- Dispatch Emissaries
-------------------------------------------------------------------------------------------------------------------------
if resourceDignitariesID then
local Decisions_JFD_DispatchEmissaries = {}
	Decisions_JFD_DispatchEmissaries.Name = "TXT_KEY_DECISIONS_JFD_DISPATCH_EMISSARIES"
	Decisions_JFD_DispatchEmissaries.Desc = "TXT_KEY_DECISIONS_JFD_DISPATCH_EMISSARIES_DESC"
	Decisions_JFD_DispatchEmissaries.Data1 = nil
	Decisions_JFD_DispatchEmissaries.Era = eraAncientID
	Decisions_JFD_DispatchEmissaries.CanFunc = (
	function(player)
		local unmetPlayers = {}
		local count = 1
		for otherPlayerID = 0, defineMaxMajorCivs - 1 do 
			local otherPlayer = Players[otherPlayerID]
			if (otherPlayer:IsAlive() and (not Teams[player:GetTeam()]:IsHasMet(otherPlayer:GetTeam()))) then
				unmetPlayers[count] = otherPlayerID
			end
		end
		if #unmetPlayers == 0 then return false, false end
		local randomPlayerID = Game.GetRandom(1,#unmetPlayers)
		if randomPlayerID > #unmetPlayers then randomPlayerID = #unmetPlayers end
		Decisions_JFD_DispatchEmissaries.Data1 = randomPlayerID
		local eraID = load(player, "Decisions_JFD_DispatchEmissaries")
		local currentEraID = player:GetCurrentEra()
		if eraID then
			if eraID < currentEraID then
				save(player, "Decisions_JFD_DispatchEmissaries", nil)
			else
				Decisions_JFD_DispatchEmissaries.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_DISPATCH_EMISSARIES_ENACTED_DESC")
				return false, false, true
			end
		end
		local costGold = Game.GetRound(200*iMod)
		Decisions_JFD_DispatchEmissaries.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_DISPATCH_EMISSARIES_DESC", costGold)
		if player:GetNumResourceAvailable(resourceDignitariesID, false) < 1 then return true, false end
		if player:GetGold() < costGold then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_DispatchEmissaries.DoFunc = (
	function(player)
		local costGold = Game.GetRound(200 * iMod)
		player:ChangeNumResourceTotal(resourceDignitariesID, -1)
		player:ChangeGold(-costGold)
		local unmetPlayerTeamID = Players[Decisions_JFD_DispatchEmissaries.Data1]:GetTeam()
		Teams[player:GetTeam()]:Meet(unmetPlayerTeamID)
		save(player, "Decisions_JFD_DispatchEmissaries", player:GetCurrentEra())
	end
	)
	
tDecisions["Decisions_JFD_DispatchEmissaries"] = Decisions_JFD_DispatchEmissaries
end
-------------------------------------------------------------------------------------------------------------------------
-- Hold Political Forum
-------------------------------------------------------------------------------------------------------------------------
if resourceDignitariesID then
local numCityStates = 0
local Decisions_JFD_PoliticalForum = {}
	Decisions_JFD_PoliticalForum.Name = "TXT_KEY_DECISIONS_JFD_POLITICAL_FORUM"
	Decisions_JFD_PoliticalForum.Desc = "TXT_KEY_DECISIONS_JFD_POLITICAL_FORUM_DESC"
	Decisions_JFD_PoliticalForum.Era = eraClassicalID
	Decisions_JFD_PoliticalForum.CanFunc = (
	function(player)
		if player:GetCurrentEra() < eraClassicalID then return false, false end
		local eraID = load(player, "Decisions_JFD_PoliticalForum")
		local currentEraID = player:GetCurrentEra()
		if eraID then
			if eraID < currentEraID then
				save(player, "Decisions_JFD_PoliticalForum", nil)
			else
				Decisions_JFD_PoliticalForum.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_POLITICAL_FORUM_ENACTED_DESC")
				return false, false, true
			end
		end
		numCityStates = 0
		for otherPlayerID = 0, defineMaxMinorCivs - 1 do 
			local minorCiv = Players[otherPlayerID]
			if (minorCiv:IsAlive() and minorCiv:IsMinorCiv() and Teams[player:GetTeam()]:IsHasMet(minorCiv:GetTeam())) then
				if minorCiv:GetMinorCivFriendshipLevelWithMajor(playerID) >= 0 then
					numCityStates = numCityStates + 1
				end
			end
		end
		local dignitaryCost = Game.GetRound(numCityStates/3)
		if dignitaryCost == 0 then dignitaryCost = 1 end
		local influenceReward = player:GetEraAdjustedValue(Game.GetRound(10*iMod))
		Decisions_JFD_PoliticalForum.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_POLITICAL_FORUM_DESC", dignitaryCost, influenceReward)
		-- if player:GetCurrentEra() < eraClassicalID then return true, false end
		if numCityStates == 0 then return true, false end
		if player:GetNumResourceAvailable(resourceDignitariesID, false) < dignitaryCost then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_PoliticalForum.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local dignitaryCost = Game.GetRound(numCityStates/3)
		if dignitaryCost == 0 then dignitaryCost = 1 end
		player:ChangeNumResourceTotal(resourceDignitariesID, -dignitaryCost)
		local influenceReward = player:GetEraAdjustedValue(Game.GetRound(10*iMod))
		for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do 
			local minorCiv = Players[otherPlayerID]
			if (minorCiv:IsAlive() and minorCiv:IsMinorCiv() and Teams[player:GetTeam()]:IsHasMet(minorCiv:GetTeam())) then
				if minorCiv:GetMinorCivFriendshipLevelWithMajor(playerID) >= 0 then
					minorCiv:ChangeMinorCivFriendshipWithMajor(playerID, influenceReward)
				end
			end
		end
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_RTP_CLAIMS_POLITICAL_FORUM", player:GetName(), player:GetCivilizationShortDescription())) 
		save(player, "Decisions_JFD_PoliticalForum", player:GetCurrentEra())
	end
	)
	
tDecisions["Decisions_JFD_PoliticalForum"] = Decisions_JFD_PoliticalForum
end
--------------------------------------------------------------------------------------------------------------------------
-- Promote the Arts
--------------------------------------------------------------------------------------------------------------------------
if resourceDignitariesID then
local techAcousticsID = GameInfoTypes["TECH_ACOUSTICS"]
local techGuildsID	  = GameInfoTypes["TECH_GUILDS"]
local techMassMediaID = GameInfoTypes["TECH_JFD_MASS_MEDIA"]
local techRadioID	  = GameInfoTypes["TECH_RADIO"]
local Decisions_JFD_PromoteArts = {}
	Decisions_JFD_PromoteArts.Name = "TXT_KEY_DECISIONS_JFD_PROMOTE_THE_ARTS"
	Decisions_JFD_PromoteArts.Desc = "TXT_KEY_DECISIONS_JFD_PROMOTE_THE_ARTS_DESC"
	Decisions_JFD_PromoteArts.Era = eraRenaissanceID
	Decisions_JFD_PromoteArts.CanFunc = (
	function(player)
		if player:GetCurrentEra() < eraMedievalID then return false, false end
		local eraID = load(player, "Decisions_JFD_PromoteArts")
		local currentEraID = player:GetCurrentEra()
		if eraID ~= nil then
			if eraID < currentEraID then
				save(player, "Decisions_JFD_PromoteArts", nil)
			else
				Decisions_JFD_PromoteArts.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PROMOTE_THE_ARTS_ENACTED_DESC")
				return false, false, true
			end
		end
		-- if currentEraID < eraClassicalID then return false, false end
		if player:GetNumCities() < 1 then return false, false end
		local costGold = Game.GetRound(((currentEraID+1)*150)*iMod)
		local techDesc = "Radio"
		if techMassMediaID then
			techDesc = "Mass Media"
		end
		Decisions_JFD_PromoteArts.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PROMOTE_THE_ARTS_DESC", costGold, techDesc)
		if player:GetCurrentEra() < eraRenaissanceID then return true, false end
		if player:GetNumResourceAvailable(resourceDignitariesID, false) < 2 then return true, false end
		if player:GetGold() < costGold then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_PromoteArts.DoFunc = (
	function(player)
		local currentEraID = player:GetCurrentEra()
		local costGold = Game.GetRound(((currentEraID+1)*150)*iMod)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(resourceDignitariesID, -2)
		local tGreatPeople = {}
		local tInclude = {}
		tInclude.UNITCLASS_WRITER = 1
		tInclude.UNITCLASS_ARTIST = 1 
		tInclude.UNITCLASS_MUSICIAN = 1
		if ((not techMassMediaID) and (player:HasTech(techRadioID))) then tInclude.UNITCLASS_JFD_GREAT_DIRECTOR = 1 end
		if (techMassMediaID and (player:HasTech(techMassMediaID))) then tInclude.UNITCLASS_JFD_GREAT_DIRECTOR = 1 end
		local unitArtsID = nil
		for decisionKey, val in pairs(tInclude) do
			unitArtsID = player:GetSpecificUnitType(decisionKey)
			table.insert(tGreatPeople, unitArtsID)
		end
		local capital = player:GetCapitalCity()
		player:InitUnit(tGreatPeople[GetRandom(1, #tGreatPeople)], capital:GetX(), capital:GetY())
		save(player, "Decisions_JFD_PromoteArts", player:GetCurrentEra())
	end
	)
	
tDecisions["Decisions_JFD_PromoteArts"] = Decisions_JFD_PromoteArts
end
--=======================================================================================================================
-- INVENTORS
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
-- Freedom: Privatize the Utilities
-------------------------------------------------------------------------------------------------------------------------
local buildingClassFactoryID = GameInfoTypes["BUILDINGCLASS_FACTORY"]
local ideologyFreedomID		 = GameInfoTypes["POLICY_BRANCH_FREEDOM"]
if resourceInventorsID then
local Decisions_JFD_FreedomPrivatizeUtilities = {}
	Decisions_JFD_FreedomPrivatizeUtilities.Name = "TXT_KEY_DECISIONS_JFD_FREEDOM_PRIVATIZE_UTILITIES"
	Decisions_JFD_FreedomPrivatizeUtilities.Desc = "TXT_KEY_DECISIONS_JFD_FREEDOM_PRIVATIZE_UTILITIES_DESC"
	Decisions_JFD_FreedomPrivatizeUtilities.Era = eraIndustrialID
	Decisions_JFD_FreedomPrivatizeUtilities.CanFunc = (
	function(player)
		if player:GetCurrentEra() < eraIndustrialID then return false, false end
		-- if (not player:HasIdeology(ideologyFreedomID)) then return false, false end
		if load(player, "Decisions_JFD_FreedomPrivatizeUtilities") then
			Decisions_JFD_FreedomPrivatizeUtilities.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_FREEDOM_PRIVATIZE_UTILITIES_ENACTED_DESC")
			return false, false, true
		end
		local numFactories = player:GetBuildingClassCount(buildingClassFactoryID)
		local rewardGold = Game.GetRound((numFactories*250)*iMod)
		Decisions_JFD_FreedomPrivatizeUtilities.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_FREEDOM_PRIVATIZE_UTILITIES_DESC", numFactories, rewardGold)
		if numFactories < 3 then return true, false end
		if player:GetNumResourceAvailable(resourceInventorsID, false) < numFactories then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_FreedomPrivatizeUtilities.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local numFactories = player:GetBuildingClassCount(buildingClassFactoryID)
		local rewardGold = Game.GetRound((numFactories*250)*iMod)
		player:ChangeNumResourceTotal(resourceInventorsID, -numFactories)
		player:ChangeGold(rewardGold)
		for city in player:Cities() do
			local buildingFactoryID = player:GetSpecificBuildingType("BUILDINGCLASS_FACTORY")
			if buildingFactoryID then
				city:SetNumFreeBuilding(buildingFactoryID, 1)
			end
		end
		save(player, "Decisions_JFD_FreedomPrivatizeUtilities", true)
	end
	)
	
tDecisions["Decisions_JFD_FreedomPrivatizeUtilities"] = Decisions_JFD_FreedomPrivatizeUtilities
end
--------------------------------------------------------------------------------------------------------------------------
-- Fund Innovation
--------------------------------------------------------------------------------------------------------------------------
if resourceInventorsID then
local Decisions_JFD_FundInnovation = {}
	Decisions_JFD_FundInnovation.Name = "TXT_KEY_DECISIONS_JFD_FUND_INNOVATION"
	Decisions_JFD_FundInnovation.Desc = "TXT_KEY_DECISIONS_JFD_FUND_INNOVATION_DESC"
	Decisions_JFD_FundInnovation.Era = eraRenaissanceID
	Decisions_JFD_FundInnovation.CanFunc = (
	function(player)
		if player:GetCurrentEra() < eraMedievalID then return false, false end
		local eraID = load(player, "Decisions_JFD_FundInnovation")
		local currentEraID = player:GetCurrentEra()
		if eraID then
			if eraID < currentEraID then
				save(player, "Decisions_JFD_FundInnovation", nil)
			else
				Decisions_JFD_FundInnovation.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_FUND_INNOVATION_ENACTED_DESC")
				return false, false, true
			end
		end
		local costGold = player:GetEraAdjustedValue(Game.GetRound(100*iMod))
		Decisions_JFD_FundInnovation.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_FUND_INNOVATION_DESC", costGold)
		if player:GetCurrentEra() < eraRenaissanceID then return true, false end
		if player:GetNumResourceAvailable(resourceInventorsID, false) < 2 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_FundInnovation.DoFunc = (
	function(player)
		local costGold = player:GetEraAdjustedValue(Game.GetRound(100*iMod))
		player:ChangeNumResourceTotal(resourceInventorsID, -2)
		player:DoRandomInnovation(currentEraID)
		save(player, "Decisions_JFD_FundInnovation", player:GetCurrentEra())
	end
	)

tDecisions["Decisions_JFD_FundInnovation"] = Decisions_JFD_FundInnovation
end
--------------------------------------------------------------------------------------------------------------------------
-- Writing System
--------------------------------------------------------------------------------------------------------------------------
-- local techWritingID = GameInfoTypes["TECH_WRITING"]
-- if resourceInventorsID then
-- local Decisions_JFD_WritingSystem = {}
	-- Decisions_JFD_WritingSystem.Name = "TXT_KEY_DECISIONS_JFD_WRITING_SYSTEM"
	-- Decisions_JFD_WritingSystem.Desc = "TXT_KEY_DECISIONS_JFD_WRITING_SYSTEM_DESC"
	-- Decisions_JFD_WritingSystem.Era = eraAncientID
	-- Decisions_JFD_WritingSystem.CanFunc = (
	-- function(player)
		-- if (not player:IsHuman()) then return false, false end
		-- local writingSystemID = player:GetWritingSystemID()
		-- if writingSystemID > -1 then
			-- local writingSystem = GameInfo.JFD_WritingSystems[writingSystemID]
			-- Decisions_JFD_WritingSystem.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_CODE_LAWS_ENACTED_DESC_SOVEREIGNTY", writingSystem.Description, writingSystem.Help)
			-- return false, false, true
		-- end
		-- Decisions_JFD_WritingSystem.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_WRITING_SYSTEM_DESC")
		-- if (not player:HasTech(techWritingID)) then return true, false end
		-- if player:GetNumResourceAvailable(resourceInventorsID, false) < 2 then return true, false end
		-- return true, true
	-- end
	-- )
	
	-- Decisions_JFD_WritingSystem.DoFunc = (
	-- function(player)
		-- player:ChangeNumResourceTotal(resourceInventorsID, -2)
		-- LuaEvents.JFD_ED_ShowChooseSystemPopup("Writing")
	-- end
	-- )

-- tDecisions["Decisions_JFD_WritingSystem"] = Decisions_JFD_WritingSystem
-- end
--=======================================================================================================================
-- MAGISTRATES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
-- Compile Code of Laws
-------------------------------------------------------------------------------------------------------------------------
local Decisions_JFD_CodeOfLaws = {}
	Decisions_JFD_CodeOfLaws.Name = "TXT_KEY_DECISIONS_JFD_CODE_LAWS"
	Decisions_JFD_CodeOfLaws.Desc = "TXT_KEY_DECISIONS_JFD_CODE_LAWS_DESC"
	Decisions_JFD_CodeOfLaws.IconAtlas = "JFD_SOVEREIGNTY_GOVERNMENT_ALPHA_ATLAS"
	Decisions_JFD_CodeOfLaws.Era = eraClassicalID
	Decisions_JFD_CodeOfLaws.CanFunc = (
	function(player)
		if (not userSettingRTPSovereigntyCore) then return false, false end
		if (not player:HasGovernment()) then return false, false end
		if load(player, "Decisions_JFD_CodeOfLaws") then
			Decisions_JFD_CodeOfLaws.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_CODE_LAWS_ENACTED_DESC")
			return false, false, true
		end
		local government = GameInfo.JFD_Governments[player:GetGovernment()]
		Decisions_JFD_CodeOfLaws.IconIndex = government.PortraitIndex
		local costCulture = Game.GetRound(100*iMod)
		local techID = techWritingID
		local techDesc = "Writing"
		if techCodeOfLawsID then
			techID = techCodeOfLawsID
			techDesc = "Code of Laws"
		end
		Decisions_JFD_CodeOfLaws.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_CODE_LAWS_DESC", techDesc, costCulture)
		if player:GetJONSCulture() < costCulture then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		if (not player:HasTech(techID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_CodeOfLaws.DoFunc = (
	function(player)
		local costCulture = Game.GetRound(100*iMod)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:ChangeJONSCulture(-costCulture)
		player:SetReformCooldown(0)
		player:ChangeNumFreeReforms(1)
		save(player, "Decisions_JFD_CodeOfLaws", true)
	end
	)
	
tDecisions.Decisions_JFD_CodeOfLaws = Decisions_JFD_CodeOfLaws
--------------------------------------------------------------------------------------------------------------------------
-- Formalize Scales, Weights and Measures
--------------------------------------------------------------------------------------------------------------------------
local policyDecisionsFormalWeightsID = GameInfoTypes["POLICY_DECISIONS_JFD_FORMAL_WEIGHTS"]
local techMathematicsID    			 = GameInfoTypes["TECH_MATHEMATICS"]
local Decisions_JFD_WeightsFormal = {}
	Decisions_JFD_WeightsFormal.Name = "TXT_KEY_DECISIONS_JFD_WEIGHTS_FORMAL"
	Decisions_JFD_WeightsFormal.Desc = "TXT_KEY_DECISIONS_JFD_WEIGHTS_FORMAL_DESC"
	Decisions_JFD_WeightsFormal.Era = eraAncientID
	Decisions_JFD_WeightsFormal.CanFunc = (
	function(player)
		if player:HasPolicy(policyDecisionsFormalWeightsID) then
			Decisions_JFD_WeightsFormal.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_WEIGHTS_FORMAL_ENACTED_DESC")
			return false, false, true
		end
		local costCulture = Game.GetRound(200*iMod)
		Decisions_JFD_WeightsFormal.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_WEIGHTS_FORMAL_DESC", costCulture)
		if player:GetJONSCulture() < costCulture then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		if (not Teams[player:GetTeam()]:IsHasTech(techMathematicsID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_WeightsFormal.DoFunc = (
	function(player)
		local costCulture = Game.GetRound(200*iMod)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:ChangeJONSCulture(-costCulture)
		player:GrantPolicy(policyDecisionsFormalWeightsID, true)
	end
	)

--tDecisions["Decisions_JFD_WeightsFormal"] = Decisions_JFD_WeightsFormal
--------------------------------------------------------------------------------------------------------------------------
-- Fund the Sciences
--------------------------------------------------------------------------------------------------------------------------
local unitClassDoctorID = GameInfoTypes["UNITCLASS_JFD_GREAT_DOCTOR"]
local Decisions_JFD_FundSciences = {}
	Decisions_JFD_FundSciences.Name = "TXT_KEY_DECISIONS_JFD_FUND_THE_SCIENCES"
	Decisions_JFD_FundSciences.Desc = "TXT_KEY_DECISIONS_JFD_FUND_THE_SCIENCES_DESC"
	Decisions_JFD_FundSciences.Era = eraRenaissanceID
	Decisions_JFD_FundSciences.CanFunc = (
	function(player)
		if player:GetCurrentEra() < eraMedievalID then return false, false end
		local eraID = load(player, "Decisions_JFD_FundSciences")
		local currentEraID = player:GetCurrentEra()
		if eraID ~= nil then
			if eraID < currentEraID then
				save(player, "Decisions_JFD_FundSciences", nil)
			else
				Decisions_JFD_FundSciences.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_FUND_THE_SCIENCES_ENACTED_DESC")
				return false, false, true
			end
		end
		if player:GetNumCities() < 1 then return false, false end
		local costGold = Game.GetRound(((currentEraID+1)*200)*iMod)
		Decisions_JFD_FundSciences.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_FUND_THE_SCIENCES_DESC", costGold)
		if player:GetCurrentEra() < eraRenaissanceID then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		if player:GetGold() < costGold then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_FundSciences.DoFunc = (
	function(player)
		local currentEraID = player:GetCurrentEra()
		local costGold = Game.GetRound(((currentEraID+1)*150)*iMod)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		local tGreatPeople = {}
		local tInclude = {}
		if unitClassDoctorID then tInclude.UNITCLASS_JFD_DOCTOR = 1 end
		tInclude.UNITCLASS_ENGINEER = 1
		tInclude.UNITCLASS_MERCHANT = 1
		tInclude.UNITCLASS_SCIENTIST = 1
		local unitSciencesID = nil
		for decisionKey, val in pairs(tInclude) do
			unitSciencesID = player:GetSpecificUnitType(decisionKey)
			table.insert(tGreatPeople, unitSciencesID)
		end
		local capital = player:GetCapitalCity()
		player:InitUnit(tGreatPeople[GetRandom(1, #tGreatPeople)], capital:GetX(), capital:GetY())
		save(player, "Decisions_JFD_FundSciences", player:GetCurrentEra())
	end
	)
	
tDecisions["Decisions_JFD_FundSciences"] = Decisions_JFD_FundSciences
-------------------------------------------------------------------------------------------------------------------------
-- Order: Nationalize the Utilities
-------------------------------------------------------------------------------------------------------------------------
local buildingClassFactoryID = GameInfoTypes["BUILDINGCLASS_FACTORY"]
local ideologyOrderID	 = GameInfoTypes["POLICY_BRANCH_ORDER"]
local Decisions_JFD_OrderMilitarizeUtilities = {}
	Decisions_JFD_OrderMilitarizeUtilities.Name = "TXT_KEY_DECISIONS_JFD_ORDER_NATIONALIZE_UTILITIES"
	Decisions_JFD_OrderMilitarizeUtilities.Desc = "TXT_KEY_DECISIONS_JFD_ORDER_NATIONALIZE_UTILITIES_DESC"
	Decisions_JFD_OrderMilitarizeUtilities.Era = eraIndustrialID
	Decisions_JFD_OrderMilitarizeUtilities.CanFunc = (
	function(player)
		if player:GetCurrentEra() < eraIndustrialID then return false, false end
		if (not player:HasIdeology(ideologyOrderID)) then return false, false end
		if load(player, "Decisions_JFD_OrderMilitarizeUtilities") then
			Decisions_JFD_OrderMilitarizeUtilities.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ORDER_NATIONALIZE_UTILITIES_ENACTED_DESC")
			return false, false, true
		end
		local numFactories = player:GetBuildingClassCount(buildingClassFactoryID)
		local rewardProduction = Game.GetRound((numFactories*50)*iMod)
		Decisions_JFD_OrderMilitarizeUtilities.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ORDER_NATIONALIZE_UTILITIES_DESC", numFactories, rewardProduction)
		if numFactories < 3 then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < numFactories then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_OrderMilitarizeUtilities.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local numFactories = player:GetBuildingClassCount(buildingClassFactoryID)
		local rewardProduction = Game.GetRound((numFactories*50)*iMod)
		player:ChangeNumResourceTotal(iMagistrate, -numFactories)
		for city in player:Cities() do
			local buildingFactoryID = player:GetSpecificBuildingType("BUILDINGCLASS_FACTORY")
			if buildingFactoryID then
				city:SetNumFreeBuilding(buildingFactoryID, 1)
				city:SetOverflowProduction(city:GetOverflowProduction() + rewardProduction)
			end
		end
		save(player, "Decisions_JFD_OrderMilitarizeUtilities", true)
	end
	)
	
tDecisions["Decisions_JFD_OrderMilitarizeUtilities"] = Decisions_JFD_OrderMilitarizeUtilities
-------------------------------------------------------------------------------------------------------------------------
-- Order: Organize Soviets
-------------------------------------------------------------------------------------------------------------------------
-- local ideologyOrderID   = GameInfoTypes["POLICY_BRANCH_ORDER"]
-- local unitClassWorkerID = GameInfoTypes["UNITCLASS_JFD_WORKER"]
-- local yieldProductionID = YieldTypes["YIELD_PRODUCTION"]
-- local Decisions_JFD_Order_Soviets = {}
	-- Decisions_JFD_Order_Soviets.Name = "TXT_KEY_DECISIONS_JFD_ORDER_SOVIETS"
	-- Decisions_JFD_Order_Soviets.Desc = "TXT_KEY_DECISIONS_JFD_ORDER_SOVIETS_DESC"
	-- Decisions_JFD_Order_Soviets.CanFunc = (
	-- function(player)
		-- if (not player:HasIdeology(ideologyOrderID)) then return false, false end
		-- local eraID = load(player, "Decisions_JFD_Order_Soviets")
		-- local currentEraID = player:GetCurrentEra()
		-- if eraID then
			-- if eraID < currentEraID then
				-- save(player, "Decisions_JFD_Order_Soviets", nil)
			-- else
				-- Decisions_JFD_Order_Soviets.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ORDER_SOVIETS_ENACTED_DESC")
				-- return false, false, true
			-- end
		-- end
		-- local numWorkers = player:GetUnitClassCount(unitClassWorkerID)
		-- local costGold = Game.GetRound((numWorkers*200)*iMod)
		-- Decisions_JFD_Order_Soviets.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ORDER_SOVIETS_DESC", costGold)
		-- if numWorkers < 3 then return true, false end
		-- if player:GetGold() < costGold then return true, false end
		-- if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		-- return true, true
	-- end
	-- )
	
	-- Decisions_JFD_Order_Soviets.DoFunc = (
	-- function(player)
		-- local playerID = player:GetID()
		-- local numWorkers = player:GetUnitClassCount(unitClassWorkerID)
		-- local costGold = Game.GetRound((numWorkers*200)*iMod)
		-- player:ChangeNumResourceTotal(iMagistrate, -1)
		-- player:ChangeGold(-costGold)
		-- for city in player:Cities() do
			-- city:ChangeProduction(city:GetYieldRate(yieldProductionID)*numWorkers)
		-- end
		-- for unit in player:Units() do
			-- if unit:GetUnitClassType() == unitClassWorkerID then
				-- unit:Kill(-1)
			-- end
		-- end
		-- save(player, "Decisions_JFD_Order_Soviets", player:GetCurrentEra())
	-- end
	-- )
	
-- tDecisions["Decisions_JFD_Order_Soviets"] = Decisions_JFD_Order_Soviets
--------------------------------------------------------------------------------------------------------------------------
-- Set Up a Universities Funding Council
--------------------------------------------------------------------------------------------------------------------------
-- local buildingUniversityGrantsID = GameInfoTypes["BUILDING_DECISIONS_UNIVERSITYGRANTS"]
-- local techArchaeologyID 		 = GameInfoTypes["TECH_ARCHAEOLOGY"]
-- local Decisions_JFD_UniversityGrants = {}
	-- Decisions_JFD_UniversityGrants.Name = "TXT_KEY_DECISIONS_JFD_UNIVERSITY_GRANTS"
	-- Decisions_JFD_UniversityGrants.Desc = "TXT_KEY_DECISIONS_JFD_UNIVERSITY_GRANTS_DESC"
	-- Decisions_JFD_UniversityGrants.CanFunc = (
	-- function(player)
		-- if player:GetCurrentEra() < eraIndustrialID then return false, false end
		-- if load(player, "Decisions_JFD_UniversityGrants") == true then
			-- Decisions_JFD_UniversityGrants.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_UNIVERSITY_GRANTS_ENACTED_DESC")
			-- return false, false, true
		-- end
		-- local costGold = Game.GetRound(600*iMod)
		-- Decisions_JFD_UniversityGrants.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_UNIVERSITY_GRANTS_DESC", costGold)
		-- if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		-- if player:GetGold() < costGold then return true, false end
		-- if (not player:HasTech(techArchaeologyID)) then return true, false end
		-- return true, true
	-- end
	-- )
	
	-- Decisions_JFD_UniversityGrants.DoFunc = (
	-- function(player)
		-- local costGold = Game.GetRound(600*iMod)
		-- player:ChangeNumResourceTotal(iMagistrate, -2)
		-- player:ChangeGold(-costGold)
		-- local capital = player:GetCapitalCity()
		-- capital:SetNumRealBuilding(buildingUniversityGrantsID, 1)
		-- local unitArchaeologistID = player:GetSpecificUnitType("UNITCLASS_ARCHAEOLOGIST")
		-- player:InitUnit(unitArchaeologistID, capital:GetX(), capital:GetY())
		-- player:InitUnit(unitArchaeologistID, capital:GetX(), capital:GetY())
		-- save(player, "Decisions_JFD_UniversityGrants", true)
	-- end
	-- )
	
-- tDecisions.Decisions_JFD_UniversityGrants = Decisions_JFD_UniversityGrants
--------------------------------------------------------------------------------------------------------------------------
-- Subsidise Public Transport
--------------------------------------------------------------------------------------------------------------------------
local buildingFactory 			= GameInfo.Buildings["BUILDING_FACTORY"]
local buildingPublicTransportID = GameInfoTypes["BUILDING_DECISIONS_PUBLICTRANSPORT"]
local techSteamPowerID 			= GameInfoTypes["TECH_STEAM_POWER"]
local Decisions_JFD_PublicTransport = {}
	Decisions_JFD_PublicTransport.Name = "TXT_KEY_DECISIONS_JFD_PUBLIC_TRANSPORT"
	Decisions_JFD_PublicTransport.Desc = "TXT_KEY_DECISIONS_JFD_PUBLIC_TRANSPORT_DESC"
	Decisions_JFD_PublicTransport.Era = eraIndustrialID
	Decisions_JFD_PublicTransport.CanFunc = (
	function(player)
		--Generate Decisions
		if player:GetCurrentEra() < eraEnlightenmentID then return false, false end
		if (not Teams[player:GetTeam()]:IsHasTech(techSteamPowerID)) then return end
		for city in player:Cities() do
			if (city:GetPopulation() > 19 or city:IsCapital()) then
				local decisionKey = "Decisions_JFD_PublicTransport" .. CompileCityID(city)
				local cityName = city:GetName()
				local decisionNote = ""
				if (city:IsCapital()) then decisionNote = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PUBLIC_TRANSPORT_NOTE") end
				tTempDecisions[decisionKey] = {}
				tTempDecisions[decisionKey].Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PUBLIC_TRANSPORT", cityName)
				tTempDecisions[decisionKey].Desc = "TXT_KEY_DECISIONS_JFD_PUBLIC_TRANSPORT_DESC"
				tTempDecisions[decisionKey].Pedia = "TXT_KEY_DECISIONS_BUILDING_PUBLICTRANSPORT"
				tTempDecisions[decisionKey].Data1 = city
				tTempDecisions[decisionKey].CanFunc = (
				function(player, city)
					local decisionKey = "Decisions_JFD_PublicTransport" .. CompileCityID(city)
					local cityName = city:GetName()
					if load(player, decisionKey) == true then
						tTempDecisions[decisionKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PUBLIC_TRANSPORT_ENACTED_DESC", cityName, decisionNote)
						return false, false, true
					end
					if city:IsHasBuilding(buildingPublicTransportID) then return false, false end
					local costGold = Game.GetRound(buildingFactory.Cost*3.5)
					tTempDecisions[decisionKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PUBLIC_TRANSPORT_DESC", cityName, costGold, decisionNote)
					if player:GetGold() < costGold then return true, false end
					if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
					return true, true
				end
				)
				
				tTempDecisions[decisionKey].DoFunc = (
				function(player, city)
					local decisionKey = "Decisions_JFD_PublicTransport" .. CompileCityID(city)
					local costGold = Game.GetRound(buildingFactory.Cost*3.5)
					player:ChangeGold(-costGold)
					city:SetNumRealBuilding(buildingPublicTransportID, 1)
					player:ChangeNumResourceTotal(iMagistrate, -1)
					save(player, decisionKey, true)
				end
				)
				
			end
		end
		--End Generation
		return
	end
	)
	
tDecisions.Decisions_JFD_PublicTransport = Decisions_JFD_PublicTransport
--=======================================================================================================================
--=======================================================================================================================
