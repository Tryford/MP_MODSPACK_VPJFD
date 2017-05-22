-- JFD_RTP_Sovereignty_Decisions
-- Author: JFD
-- DateCreated: 7/7/2014 7:22:45 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_RTP_SovereigntyUtils.lua")
--=======================================================================================================================
-- DECISIONS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local eraIndustrialID 		= GameInfoTypes["ERA_INDUSTRIAL"]
local eraModernID  			= GameInfoTypes["ERA_MODERN"]
local eraRenaissanceID  	= GameInfoTypes["ERA_RENAISSANCE"]
local mathCeil				= math.ceil
local mathMin				= math.min
local resourceDignitariesID	= GameInfoTypes["RESOURCE_JFD_DIGNITARIES"]
local techCodeOfLawsID 		= GameInfoTypes["TECH_JFD_CODE_OF_LAWS"]
--=======================================================================================================================
-- GOVERNMENT DECISIONS
--=======================================================================================================================
-- Government: Declare Dictatorship
-------------------------------------------------------------------------------------------------------------------------
--local governmentDictatorshipID = GameInfoTypes["GOVERNMENT_JFD_DICTATORSHIP"]
--local Decisions_RTP_Sovereignty_Dictatorship = {}
--	Decisions_RTP_Sovereignty_Dictatorship.Name = "TXT_KEY_DECISIONS_JFD_DICTATORSHIP"
--	Decisions_RTP_Sovereignty_Dictatorship.Desc = "TXT_KEY_DECISIONS_JFD_DICTATORSHIP_DESC"
--	Decisions_RTP_Sovereignty_Dictatorship.Weight = 0
--	Decisions_RTP_Sovereignty_Dictatorship.IconAtlas = "JFD_SOVEREIGNTY_GOVERNMENT_ALPHA_ATLAS"
--	Decisions_RTP_Sovereignty_Dictatorship.IconIndex = 2
--	Decisions_RTP_Sovereignty_Dictatorship.Type = "Government"
--	Decisions_RTP_Sovereignty_Dictatorship.CanFunc = (
--	function(player)
--		if (not player:HasGovernment()) then return false, false end
--		local government = GameInfo.JFD_Governments[player:GetGovernment()]
--		Decisions_RTP_Sovereignty_Dictatorship.IconIndex = government.PortraitIndex
--		if player:GetGovernment() == governmentDictatorshipID then 
--			Decisions_RTP_Sovereignty_Dictatorship.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_DICTATORSHIP_ENACTED_DESC")
--			return false, false, true
--		end
--		Decisions_RTP_Sovereignty_Dictatorship.Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_DICTATORSHIP")
--		Decisions_RTP_Sovereignty_Dictatorship.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_DICTATORSHIP_DESC")
--		if player:GetLateGamePolicyTree() == -1 then return true, false end
--		if player:GetNumResourceAvailable(iMagistrate, false) < 5 then return true, false end
--		return true, true
--	end
--	)
--	
--	Decisions_RTP_Sovereignty_Dictatorship.DoFunc = (
--	function(player)
--		player:ChangeNumResourceTotal(iMagistrate, -5)
--		player:SetGovernment(governmentDictatorshipID)
--		player:SetGovernmentCooldown(0) 
--	end
--	)
--	
--tDecisions["Decisions_RTP_Sovereignty_Dictatorship"] = Decisions_RTP_Sovereignty_Dictatorship
-------------------------------------------------------------------------------------------------------------------------
-- Hold Coronation/Inauguration Ceremony
-------------------------------------------------------------------------------------------------------------------------
local Decisions_RTP_Sovereignty_Ceremony = {}
	Decisions_RTP_Sovereignty_Ceremony.Name = "TXT_KEY_DECISIONS_JFD_HOLD_CEREMONY"
	Decisions_RTP_Sovereignty_Ceremony.Desc = "TXT_KEY_DECISIONS_JFD_HOLD_CEREMONY_DESC"
	Decisions_RTP_Sovereignty_Ceremony.Type = "Government"
	Decisions_RTP_Sovereignty_Ceremony.IconAtlas = "JFD_SOVEREIGNTY_GOVERNMENT_ALPHA_ATLAS"
	Decisions_RTP_Sovereignty_Ceremony.CanFunc = (
	function(player)
		if (not player:HasGovernment()) then return false, false end
		if load(player, "Decisions_RTP_Sovereignty_Ceremony") == true then
			Decisions_RTP_Sovereignty_Ceremony.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_HOLD_CEREMONY_ENACTED_DESC")
			return false, false, true
		end
		local government = GameInfo.JFD_Governments[player:GetGovernment()]
		Decisions_RTP_Sovereignty_Ceremony.IconIndex = government.PortraitIndex
		local ceremonyDesc = "Coronation"
		local goldCost = mathCeil((250*player:GetNumCities())*iMod)
		local resourceType = "[ICON_JFD_DIGNITARY] Dignitaries"
		local resourceID = resourceDignitaryID
		if government.Type == "GOVERNMENT_JFD_REPUBLIC" then
			ceremonyDesc = "Inauguration"
			resourceType = "[ICON_MAGISTRATES] Magistrates"
			resourceID = iMagistrate
		end
		Decisions_RTP_Sovereignty_Ceremony.Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_HOLD_CEREMONY", ceremonyDesc)
		Decisions_RTP_Sovereignty_Ceremony.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_HOLD_CEREMONY_DESC", ceremonyDesc, goldCost, resourceType)
		if player:GetNumResourceAvailable(resourceID, false) < 2 then return true, false end
		if player:GetGold() < goldCost then return true, false end
		return true, true
	end
	)
	
	Decisions_RTP_Sovereignty_Ceremony.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local ceremonyDesc = "Coronation"
		local goldCost = mathCeil((250*player:GetNumCities())*iMod)
		local government = GameInfo.JFD_Governments[player:GetGovernment()]
		local resourceID = resourceDignitaryID
		if government.Type == "GOVERNMENT_JFD_REPUBLIC" then
			ceremonyDesc = "Inauguration"
			resourceID = iMagistrate
		end
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(resourceID, -2)
		for city in player:Cities() do
			city:ChangeWeLoveTheKingDayCounter(25)
		end
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_HOLD_CEREMONY", player:GetName(), ceremonyDesc, player:GetCivilizationDescription())) 
		save(player, "Decisions_RTP_Sovereignty_Ceremony", true)
	end
	)
	
tDecisions["Decisions_RTP_Sovereignty_Ceremony"] = Decisions_RTP_Sovereignty_Ceremony
-------------------------------------------------------------------------------------------------------------------------
-- Monarchy: Execute Royal Prerogative
-------------------------------------------------------------------------------------------------------------------------
local governmentMonarchyID = GameInfoTypes["GOVERNMENT_JFD_MONARCHY"]
local Decisions_RTP_Sovereignty_Prerogative = {}
	Decisions_RTP_Sovereignty_Prerogative.Name = "TXT_KEY_DECISIONS_JFD_ROYAL_PREROGATIVE"
	Decisions_RTP_Sovereignty_Prerogative.Desc = "TXT_KEY_DECISIONS_JFD_ROYAL_PREROGATIVE_DESC"
	Decisions_RTP_Sovereignty_Prerogative.Weight = 0
	Decisions_RTP_Sovereignty_Prerogative.IconAtlas = "JFD_SOVEREIGNTY_GOVERNMENT_ALPHA_ATLAS"
	Decisions_RTP_Sovereignty_Prerogative.IconIndex = 1
	Decisions_RTP_Sovereignty_Prerogative.Type = "Government"
	Decisions_RTP_Sovereignty_Prerogative.CanFunc = (
	function(player)
		if player:GetGovernment() ~= governmentMonarchyID then return false, false end
		local era = load(player, "Decisions_RTP_Sovereignty_Prerogative")
		if era ~= nil then
			if era < player:GetCurrentEra() then
				save(player, "Decisions_RTP_Sovereignty_Prerogative", nil)
			else
				Decisions_RTP_Sovereignty_Prerogative.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ROYAL_PREROGATIVE_ENACTED_DESC")
				return false, false, true
			end
		end
		Decisions_RTP_Sovereignty_Prerogative.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ROYAL_PREROGATIVE_DESC")
		local playerID = player:GetID()
		if (not JFD_HasLegislature(playerID)) then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 4 then return true, false end
		return true, true
	end
	)
	
	Decisions_RTP_Sovereignty_Prerogative.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -4)
		local reformCooldown = JFD_Round(player:GetReformCooldown()/2)
		player:ChangeReformCooldown(-reformCooldown)
		save(player, "Decisions_RTP_Sovereignty_Prerogative", player:GetCurrentEra())
	end
	)
	
tDecisions["Decisions_RTP_Sovereignty_Prerogative"] = Decisions_RTP_Sovereignty_Prerogative
-------------------------------------------------------------------------------------------------------------------------
-- Republic: Invoke Reserve Powers
-------------------------------------------------------------------------------------------------------------------------
local governmentRepublicID = GameInfoTypes["GOVERNMENT_JFD_REPUBLIC"]
local Decisions_RTP_Sovereignty_Reserve = {}
	Decisions_RTP_Sovereignty_Reserve.Name = "TXT_KEY_DECISIONS_JFD_RESERVE_POWERS"
	Decisions_RTP_Sovereignty_Reserve.Desc = "TXT_KEY_DECISIONS_JFD_RESERVE_POWERS_DESC"
	Decisions_RTP_Sovereignty_Reserve.Weight = 0
	Decisions_RTP_Sovereignty_Reserve.IconAtlas = "JFD_SOVEREIGNTY_GOVERNMENT_ALPHA_ATLAS"
	Decisions_RTP_Sovereignty_Reserve.IconIndex = 2
	Decisions_RTP_Sovereignty_Reserve.Type = "Government"
	Decisions_RTP_Sovereignty_Reserve.CanFunc = (
	function(player)
		if player:GetGovernment() ~= governmentRepublicID then return false, false end
		local era = load(player, "Decisions_RTP_Sovereignty_Reserve")
		if era ~= nil then
			if era < player:GetCurrentEra() then
				save(player, "Decisions_RTP_Sovereignty_Reserve", nil)
			else
				Decisions_RTP_Sovereignty_Reserve.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RESERVE_POWERS_ENACTED_DESC")
				return false, false, true
			end
		end
		Decisions_RTP_Sovereignty_Reserve.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RESERVE_POWERS_DESC")
		local playerID = player:GetID()
		if (not JFD_HasLegislature(playerID)) then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 4 then return true, false end
		return true, true
	end
	)
	
	Decisions_RTP_Sovereignty_Reserve.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -4)
		player:SetGovernmentCooldown(0)
		save(player, "Decisions_RTP_Sovereignty_Reserve", player:GetCurrentEra())
	end
	)
	
tDecisions["Decisions_RTP_Sovereignty_Reserve"] = Decisions_RTP_Sovereignty_Reserve
-------------------------------------------------------------------------------------------------------------------------
-- Theocracy: Issue Holy Decree
-------------------------------------------------------------------------------------------------------------------------
local governmentTheocracyID = GameInfoTypes["GOVERNMENT_JFD_THEOCRACY"]
local religionCatholicismID = GameInfoTypes["RELIGION_CHRISTIANITY"]
local Decisions_RTP_Sovereignty_Decree = {}
	Decisions_RTP_Sovereignty_Decree.Name = "TXT_KEY_DECISIONS_JFD_HOLY_DECREE"
	Decisions_RTP_Sovereignty_Decree.Desc = "TXT_KEY_DECISIONS_JFD_HOLY_DECREE_DESC"
	Decisions_RTP_Sovereignty_Decree.Weight = 0
	Decisions_RTP_Sovereignty_Decree.IconAtlas = "JFD_SOVEREIGNTY_GOVERNMENT_ALPHA_ATLAS"
	Decisions_RTP_Sovereignty_Decree.IconIndex = 3
	Decisions_RTP_Sovereignty_Decree.Type = "Government"
	Decisions_RTP_Sovereignty_Decree.CanFunc = (
	function(player)
		local playerID = player:GetID()
		local team = Teams[player:GetTeam()]
		if player:GetGovernment() ~= governmentTheocracyID then return false, false end
		if player:GetStateReligion() == religionCatholicismID then 
			Decisions_RTP_Sovereignty_Decree.Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_HOLY_DECREE_CATHOLICISM")
		end
		local era = load(player, "Decisions_RTP_Sovereignty_Decree")
		if era ~= nil then
			if era < player:GetCurrentEra() then
				save(player, "Decisions_RTP_Sovereignty_Decree", nil)
			else
				Decisions_RTP_Sovereignty_Decree.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_HOLY_DECREE_ENACTED_DESC")
				return false, false, true
			end
		end
		local pietyReward = 0
		local stateReligionID = player:GetStateReligion()
		for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			if (otherPlayer:IsAlive() and team:IsHasMet(otherPlayer:GetTeam()) and otherPlayer:GetStateReligion() == stateReligionID and (not otherPlayer:IsAtWar(playerID))) then
				pietyReward = pietyReward + 10
			end
		end
		Decisions_RTP_Sovereignty_Decree.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_HOLY_DECREE_DESC", pietyReward)
		local playerID = player:GetID()
		if (not JFD_HasLegislature(playerID)) then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 4 then return true, false end
		return true, true
	end
	)
	
	Decisions_RTP_Sovereignty_Decree.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local stateReligionID = player:GetStateReligion()
		local team = Teams[player:GetTeam()]
		player:ChangeNumResourceTotal(iMagistrate, -4)
		local pietyReward = 0
		for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			if (otherPlayer:IsAlive() and team:IsHasMet(otherPlayer:GetTeam()) and otherPlayer:GetStateReligion() == stateReligionID and (not otherPlayer:IsAtWar(playerID))) then
				pietyReward = pietyReward + 10
				otherPlayer:ChangePiety(50)
			end
		end
		player:ChangePiety(pietyReward)
		save(player, "Decisions_RTP_Sovereignty_Decree", player:GetCurrentEra())
	end
	)
	
tDecisions["Decisions_RTP_Sovereignty_Decree"] = Decisions_RTP_Sovereignty_Decree
-------------------------------------------------------------------------------------------------------------------------
-- Holy Rome: Revoke Holy Roman Empire
-------------------------------------------------------------------------------------------------------------------------
local governmentHolyRomeID = GameInfoTypes["GOVERNMENT_JFD_HOLY_ROME"]
local Decisions_RTP_Sovereignty_Revoke = {}
	Decisions_RTP_Sovereignty_Revoke.Name = "TXT_KEY_DECISIONS_JFD_REVOKE_HOLY_ROME"
	Decisions_RTP_Sovereignty_Revoke.Desc = "TXT_KEY_DECISIONS_JFD_REVOKE_HOLY_ROME_DESC"
	Decisions_RTP_Sovereignty_Revoke.Weight = 0
	Decisions_RTP_Sovereignty_Revoke.IconAtlas = "JFD_SOVEREIGNTY_GOVERNMENT_ALPHA_ATLAS"
	Decisions_RTP_Sovereignty_Revoke.IconIndex = 5
	Decisions_RTP_Sovereignty_Revoke.Type = "Government"
	Decisions_RTP_Sovereignty_Revoke.CanFunc = (
	function(player)
		local playerID = player:GetID()
		local team = Teams[player:GetTeam()]
		if player:GetGovernment() ~= governmentHolyRomeID then return false, false end
		local era = load(player, "Decisions_RTP_Sovereignty_Revoke")
		if era ~= nil then
			if era < player:GetCurrentEra() then
				save(player, "Decisions_RTP_Sovereignty_Revoke", nil)
			else
				Decisions_RTP_Sovereignty_Revoke.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_REVOKE_HOLY_ROME_ENACTED_DESC")
				return false, false, true
			end
		end
		local rewardCulture = 0
		for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			if (otherPlayer:IsAlive() and otherPlayer:IsMinorCiv() and otherPlayer:IsFriends(playerID) and (not otherPlayer:IsAtWar(playerID))) then
				rewardCulture = rewardCulture + otherPlayer:GetTotalJONSCulturePerTurn()
			end
		end
		Decisions_RTP_Sovereignty_Revoke.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_REVOKE_HOLY_ROME_DESC", rewardCulture)
		local playerID = player:GetID()
		if (not JFD_HasLegislature(playerID)) then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 4 then return true, false end
		return true, true
	end
	)
	
	Decisions_RTP_Sovereignty_Revoke.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local rewardCulture = 0
		for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			if (otherPlayer:IsAlive() and otherPlayer:IsMinorCiv() and otherPlayer:IsFriends(playerID) and (not otherPlayer:IsAtWar(playerID))) then
				rewardCulture = rewardCulture + otherPlayer:GetTotalJONSCulturePerTurn()
			end
		end
		player:ChangeJONSCulture(rewardCulture)
		player:ChangeNumResourceTotal(iMagistrate, -4)
		JFD_ChangeNumFreeGovernmentSwitches(playerID, 1)
		JFD_ChangeNumFreeReforms(playerID, 1)
		if player:IsHuman() then
			LuaEvents.JFD_RTP_Sovereignty_ShowChooseGovernmentPopup()
		end
		save(player, "Decisions_RTP_Sovereignty_Revoke", player:GetCurrentEra())
	end
	)
	
tDecisions["Decisions_RTP_Sovereignty_Revoke"] = Decisions_RTP_Sovereignty_Revoke
-------------------------------------------------------------------------------------------------------------------------
-- Dictatorship: Purge Enemies of the State
-------------------------------------------------------------------------------------------------------------------------
local governmentDictatorshipID = GameInfoTypes["GOVERNMENT_JFD_DICTATORSHIP"]
local Decisions_RTP_Sovereignty_Purge = {}
	Decisions_RTP_Sovereignty_Purge.Name = "TXT_KEY_DECISIONS_JFD_PURGE_ENEMIES"
	Decisions_RTP_Sovereignty_Purge.Desc = "TXT_KEY_DECISIONS_JFD_PURGE_ENEMIES_DESC"
	Decisions_RTP_Sovereignty_Purge.Weight = 0
	Decisions_RTP_Sovereignty_Purge.IconAtlas = "JFD_SOVEREIGNTY_GOVERNMENT_ALPHA_ATLAS"
	Decisions_RTP_Sovereignty_Purge.IconIndex = 4
	Decisions_RTP_Sovereignty_Purge.Type = "Government"
	Decisions_RTP_Sovereignty_Purge.CanFunc = (
	function(player)
		if player:GetGovernment() ~= governmentDictatorshipID then return false, false end
		local era = load(player, "Decisions_RTP_Sovereignty_Purge")
		if era ~= nil then
			if era < player:GetCurrentEra() then
				save(player, "Decisions_RTP_Sovereignty_Purge", nil)
			else
				Decisions_RTP_Sovereignty_Purge.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PURGE_ENEMIES_ENACTED_DESC")
				return false, false, true
			end
		end
		Decisions_RTP_Sovereignty_Purge.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PURGE_ENEMIES_DESC")
		local playerID = player:GetID()
		if (not JFD_HasLegislature(playerID)) then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 4 then return true, false end
		return true, true
	end
	)
	
	Decisions_RTP_Sovereignty_Purge.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -4)
		player:ChangeAnarchyNumTurns(-player:GetAnarchyNumTurns())
		for city in player:Cities() do
			city:ChangeResistanceTurns(-city:GetResistanceTurns())
		end
		save(player, "Decisions_RTP_Sovereignty_Purge", player:GetCurrentEra())
	end
	)
	
tDecisions["Decisions_RTP_Sovereignty_Purge"] = Decisions_RTP_Sovereignty_Purge
--=======================================================================================================================
-- CIV SPECIFIC DECISIONS
--=======================================================================================================================
-- Babylon: Construct the Ishtar Gate
--------------------------------------------------------------------------------------------------------------------------
tDecisions.Decisions_PolynesiaRunanga = nil
local civilizationBabylonID = GameInfoTypes["CIVILIZATION_BABYLON"]
local buildingIshtarGateID = GameInfoTypes["BUILDING_DECISIONS_BABYLONGATES"]
local buildingWallsID = GameInfoTypes["BUILDING_WALLS"]
local techMasonryID = GameInfoTypes["TECH_MASONRY"]
local Decisions_BabylonGates = {}
    Decisions_BabylonGates.Name = "TXT_KEY_DECISIONS_BABYLONGATES"
	Decisions_BabylonGates.Desc = "TXT_KEY_DECISIONS_BABYLONGATES_DESC"
	Decisions_BabylonGates.Pedia = "TXT_KEY_DECISIONS_BUILDING_BABYLONGATES"
	HookDecisionCivilizationIcon(Decisions_BabylonGates, "CIVILIZATION_BABYLON")
	Decisions_BabylonGates.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationBabylonID then return false, false end
		if load(player, "Decisions_BabylonGates") == true then
			Decisions_BabylonGates.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_BABYLONGATES_ENACTED_DESC")
			return false, false, true
		end
		local capital = player:GetCapitalCity()
		if (not capital) then return true, false end
		local goldCost = mathCeil((capital:GetBuildingPurchaseCost(buildingWallsID)) * 1.5)
		local faithReward = mathCeil(80 * iMod)
		Decisions_BabylonGates.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_BABYLONGATES_DESC", goldCost, faithReward)
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		if player:GetGold() < goldCost then return true, false end
		if (not Teams[player:GetTeam()]:IsHasTech(techMasonryID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_BabylonGates.DoFunc = (
	function(player)
		local capital = player:GetCapitalCity()
		local goldCost = mathCeil((capital:GetBuildingPurchaseCost(buildingWallsID)) * 1.5)
		local faithReward = mathCeil(80 * iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:ChangeFaith(faithReward)
		capital:SetNumRealBuilding(buildingIshtarGateID, 1)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_DECISIONS_BABYLONGATES", player:GetName(), player:GetCivilizationShortDescription()))
		save(player, "Decisions_BabylonGates", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationBabylonID, "Decisions_BabylonGates", Decisions_BabylonGates)
--------------------------------------------------------------------------------------------------------------------------
-- Polynesia: Revive the Runanga
--------------------------------------------------------------------------------------------------------------------------
tDecisions.Decisions_PolynesiaRunanga = nil
local civilizationPolynesiaID = GameInfoTypes["CIVILIZATION_POLYNESIA"]
local promotionHakaID = GameInfoTypes["PROMOTION_HAKA_WAR_DANCE"]
local Decisions_PS_Sovereignty_Polynesia_Runanga = {}
	Decisions_PS_Sovereignty_Polynesia_Runanga.Name = "TXT_KEY_DECISIONS_POLYNESIARUNANGA"
	Decisions_PS_Sovereignty_Polynesia_Runanga.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_POLYNESIARUNANGA_DESC")
	HookDecisionCivilizationIcon(Decisions_PS_Sovereignty_Polynesia_Runanga, "CIVILIZATION_POLYNESIA")
	Decisions_PS_Sovereignty_Polynesia_Runanga.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationPolynesiaID then return false, false end
		if load(player, "Decisions_PS_Sovereignty_Polynesia_Runanga") == true then
			Decisions_PS_Sovereignty_Polynesia_Runanga.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_POLYNESIARUNANGA_ENACTED_DESC")
			return false, false, true
		end
		Decisions_PS_Sovereignty_Polynesia_Runanga.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_POLYNESIARUNANGA_DESC")
		if player:GetSovereignty() < 75 then return true, false end
		if player:GetCurrentEra() < eraIndustrialID or player:GetCurrentEra() > eraModernID then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		local capital = player:GetCapitalCity()
		if (not capital) then return true, false end
		if (not capital:GetGarrisonedUnit()) then return true, false end
		if (not capital:GetGarrisonedUnit():IsHasPromotion(promotionHakaID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_PS_Sovereignty_Polynesia_Runanga.DoFunc = (
	function(player)
		player:GetCapitalCity():GetGarrisonedUnit():Kill()
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeNumFreePolicies(1)
		save(player, "Decisions_PS_Sovereignty_Polynesia_Runanga", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationPolynesiaID, "Decisions_PS_Sovereignty_Polynesia_Runanga", Decisions_PS_Sovereignty_Polynesia_Runanga)
--=======================================================================================================================
--=======================================================================================================================