-- JFD_RTP_Claims_Decisions
-- Author: JFD
-- DateCreated: 10/3/2015 11:10:41 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_RTPUtils.lua")
include("JFD_RTP_SovereigntyUtils.lua")
--=======================================================================================================================
-- MOD USES
--=======================================================================================================================
local isUsingExCE = JFD_IsUsingExCE()
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingSovereigntyCore = JFD_GetUserSetting("JFD_RTP_SOVEREIGNTY_CORE") == 1
--=======================================================================================================================
-- DECISIONS 
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local eraAncientID				= GameInfoTypes["ERA_ANCIENT"]
local eraClassicalID			= GameInfoTypes["ERA_CLASSICAL"]
local eraIndustrialID 			= GameInfoTypes["ERA_INDUSTRIAL"]
local eraModernID  				= GameInfoTypes["ERA_MODERN"]
local eraRenaissanceID  		= GameInfoTypes["ERA_RENAISSANCE"]
local mathCeil					= math.ceil
local mathMin					= math.min
local resourceDignitariesID		= GameInfoTypes["RESOURCE_JFD_DIGNITARIES"]
local techCodeOfLawsID 			= GameInfoTypes["TECH_JFD_CODE_OF_LAWS"]
--------------------------------------------------------------------------------------------------------------------------
-- Claims: Levy War Taxes
--------------------------------------------------------------------------------------------------------------------------
tDecisions.Decisions_TaxReform = nil
local Decisions_CID_Claims_LevyWarTaxes = {}
	Decisions_CID_Claims_LevyWarTaxes.Name = "TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_LEVY_WAR_TAXES"
	Decisions_CID_Claims_LevyWarTaxes.Desc = "TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_LEVY_WAR_TAXES_DESC"
	Decisions_CID_Claims_LevyWarTaxes.Weight = 0
	Decisions_CID_Claims_LevyWarTaxes.CanFunc = (
	function(player)		
		local currentEraID = player:GetCurrentEra()
		if currentEraID < eraAncientID then return false, false end
		local eraID = load(player, "Decisions_CID_Claims_LevyWarTaxes")
		if eraID ~= nil then
			if eraID < currentEraID then
				save(player, "Decisions_CID_Claims_LevyWarTaxes", nil)
			else
				Decisions_CID_Claims_LevyWarTaxes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_LEVY_WAR_TAXES_ENACTED_DESC")
				return false, false, true
			end
		end
		local costCulture = mathCeil((player:GetTotalPopulation()*5)*iMod)
		local rewardGold = mathCeil((player:GetTotalPopulation()*20)*iMod)
		Decisions_CID_Claims_LevyWarTaxes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_LEVY_WAR_TAXES_DESC", costCulture, rewardGold)
		if player:GetCurrentEra() < eraClassicalID then return true, false end
		if (not player:IsAtWarAnyMajor()) then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if player:GetJONSCulture() < costCulture then return true, false end
		return true, true
	end
	)
	
	Decisions_CID_Claims_LevyWarTaxes.DoFunc = (
	function(player)
		local costCulture = mathCeil((player:GetTotalPopulation()*5)*iMod)
		local rewardGold = mathCeil((player:GetTotalPopulation()*20)*iMod)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeJONSCulture(-costCulture)
		player:ChangeGold(rewardGold)
		save(player, "Decisions_CID_Claims_LevyWarTaxes", player:GetCurrentEra())
	end
	)
	
tDecisions["Decisions_CID_Claims_LevyWarTaxes"] = Decisions_CID_Claims_LevyWarTaxes
--------------------------------------------------------------------------------------------------------------------------
-- Claims: Formalize Scales, Weights and Measures
--------------------------------------------------------------------------------------------------------------------------
tDecisions.Decisions_WeightsFormal = nil
local policyFormalWeightsID = GameInfoTypes["POLICY_DECISIONS_JFD_FORMAL_WEIGHTS"]
local techMathematicsID     = GameInfoTypes["TECH_MATHEMATICS"]
local Decisions_CID_Claims_WeightsFormal = {}
	Decisions_CID_Claims_WeightsFormal.Name = "TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_WEIGHTS_FORMAL"
	Decisions_CID_Claims_WeightsFormal.Desc = "TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_WEIGHTS_FORMAL_DESC"
	Decisions_CID_Claims_WeightsFormal.CanFunc = (
	function(player)
		if player:HasPolicy(policyFormalWeightsID) then
			Decisions_CID_Claims_WeightsFormal.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_WEIGHTS_FORMAL_ENACTED_DESC")
			return false, false, true
		end
		local costGold = mathCeil(300*iMod)
		Decisions_CID_Claims_WeightsFormal.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_WEIGHTS_FORMAL_DESC", costGold)
		if player:GetGold() < costGold then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		if (not Teams[player:GetTeam()]:IsHasTech(techMathematicsID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_CID_Claims_WeightsFormal.DoFunc = (
	function(player)
		local costGold = mathCeil(300*iMod)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:ChangeGold(-costGold)
		player:GrantPolicy(policyFormalWeightsID, true)
	end
	)

tDecisions["Decisions_CID_Claims_WeightsFormal"] = Decisions_CID_Claims_WeightsFormal
-------------------------------------------------------------------------------------------------------------------------
-- Claims: Compile Code of Laws
-------------------------------------------------------------------------------------------------------------------------
tDecisions.Decisions_CodeOfLaws = nil
local policyCodeOfLawsID  = GameInfoTypes["POLICY_DECISIONS_JFD_CODE_OF_LAWS"]
local techWritingID		  = GameInfoTypes["TECH_WRITING"]
local Decisions_JFD_CID_Claims_CodeOfLaws = {}
	Decisions_JFD_CID_Claims_CodeOfLaws.Name = "TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_CODE_LAWS"
	Decisions_JFD_CID_Claims_CodeOfLaws.Desc = "TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_CODE_LAWS_DESC"
	Decisions_JFD_CID_Claims_CodeOfLaws.CanFunc = (
	function(player)
		if player:HasPolicy(policyCodeOfLawsID) then
			if userSettingSovereigntyCore then
				Decisions_JFD_CID_Claims_CodeOfLaws.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_CODE_LAWS_ENACTED_DESC_SOVEREIGNTY")
			else
				Decisions_JFD_CID_Claims_CodeOfLaws.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_CODE_LAWS_ENACTED_DESC")
			end
			return false, false, true
		end
		local costCulture = mathCeil(200*iMod)
		local techID = techWritingID
		local techDesc = "Writing"
		if techCodeOfLawsID then
			techID = techCodeOfLawsID
			techDesc = "Code of Laws"
		end
		if userSettingSovereigntyCore then
			Decisions_JFD_CID_Claims_CodeOfLaws.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_CODE_LAWS_DESC_SOVEREIGNTY", techDesc, costCulture)
		else
			Decisions_JFD_CID_Claims_CodeOfLaws.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_CODE_LAWS_DESC", techDesc, costCulture)
		end
		if player:GetJONSCulture() < costCulture then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if (not Teams[player:GetTeam()]:IsHasTech(techID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_CID_Claims_CodeOfLaws.DoFunc = (
	function(player)
		local costCulture = mathCeil(200*iMod)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeJONSCulture(-costCulture)
		player:GrantPolicy(policyCodeOfLawsID)
		if userSettingSovereigntyCore then
			JFD_ChangeNumFreeReforms(player:GetID(), 1)
		end
	end
	)
	
tDecisions.Decisions_JFD_CID_Claims_CodeOfLaws = Decisions_JFD_CID_Claims_CodeOfLaws
-------------------------------------------------------------------------------------------------------------------------
-- Claims: Invite GreatPerson
-------------------------------------------------------------------------------------------------------------------------
tDecisions.Decisions_InviteGreatPerson = nil
local branchHonorID		= GameInfoTypes["POLICY_BRANCH_HONOR"]
local branchLibertyID	= GameInfoTypes["POLICY_BRANCH_LIBERTY"]
local branchPietyID		= GameInfoTypes["POLICY_BRANCH_PIETY"]
local branchTraditionID = GameInfoTypes["POLICY_BRANCH_TRADITION"]
local unitDoctorID      = GameInfoTypes["UNIT_JFD_GREAT_DOCTOR"]
local Decisions_CID_Claims_InviteGreatPerson = {}
	Decisions_CID_Claims_InviteGreatPerson.Name = "TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_INVITE_GREAT_PERSON"
	Decisions_CID_Claims_InviteGreatPerson.Desc = "TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_INVITE_GREAT_PERSON_DESC"
	Decisions_CID_Claims_InviteGreatPerson.CanFunc = (
	function(player)
		if (player:IsPolicyBranchFinished(branchHonorID) or player:IsPolicyBranchFinished(branchLibertyID) or player:IsPolicyBranchFinished(branchPietyID) or player:IsPolicyBranchFinished(branchTraditionID)) then return false, false end
		if unitDoctorID then
			Decisions_CID_Claims_InviteGreatPerson.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_INVITE_GREAT_PERSON_DESC_HEALTH")
		else
			Decisions_CID_Claims_InviteGreatPerson.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_INVITE_GREAT_PERSON_DESC")
		end
		return true, false
	end
	)
	
	Decisions_CID_Claims_InviteGreatPerson.DoFunc = (
	function(player)
	end
	)

tDecisions["Decisions_CID_Claims_InviteGreatPerson"] = Decisions_CID_Claims_InviteGreatPerson
-------------------------------------------------------------------------------------------------------------------------
-- Claims: Invite Civil Servant
-------------------------------------------------------------------------------------------------------------------------
local unitClassCivilServants = {"UNITCLASS_JFD_GREAT_DIGNITARY", "UNITCLASS_JFD_GREAT_MAGISTRATE"}
local Decisions_CID_Claims_InviteCivilServant = {}
	Decisions_CID_Claims_InviteCivilServant.Name = "TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_INVITE_CIVIL_SERVANT"
	Decisions_CID_Claims_InviteCivilServant.Desc = "TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_INVITE_CIVIL_SERVANT_DESC"
	Decisions_CID_Claims_InviteCivilServant.CanFunc = (
	function(player)
		if (not player:IsPolicyBranchFinished(branchLibertyID)) then return false, false end
		local eraID = load(player, "Decisions_CID_Claims_InviteCivilServant")
		local currentEraID = player:GetCurrentEra()
		if eraID ~= nil then
			if eraID < currentEraID then
				save(player, "Decisions_CID_Claims_InviteCivilServant", nil)
			else
				Decisions_CID_Claims_InviteCivilServant.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_INVITE_CIVIL_SERVANT_ENACTED_DESC")
				return false, false, true
			end
		end
		local costGold = mathCeil(((currentEraID+1)*250)*iMod)
		Decisions_CID_Claims_InviteCivilServant.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_INVITE_CIVIL_SERVANT_DESC", costGold)
		if player:GetGold() < costGold then return true, false end
		return true, true
	end
	)
	
	Decisions_CID_Claims_InviteCivilServant.DoFunc = (
	function(player)
		local currentEraID = player:GetCurrentEra()
		local costGold = mathCeil(((currentEraID+1)*250)*iMod)
		player:ChangeGold(-costGold)
		local unitClassCivilServant = unitClassCivilServants[GetRandom(1, #unitClassCivilServants)]
		local unitCivilServantID = player:GetSpecificUnitType(unitCivilServantClass)
		local capital = player:GetCapitalCity()
		player:InitUnit(unitCivilServantID, capital:GetX(), capital:GetY())
		save(player, "Decisions_CID_Claims_InviteCivilServant", player:GetCurrentEra())
	end
	)

tDecisions["Decisions_CID_Claims_InviteCivilServant"] = Decisions_CID_Claims_InviteCivilServant
-------------------------------------------------------------------------------------------------------------------------
-- Claims: Invite Holy Man
-------------------------------------------------------------------------------------------------------------------------
local unitClassHolyMans = {"UNITCLASS_JFD_GREAT_DOCTOR", "UNITCLASS_PROPHET"}
local Decisions_CID_Claims_InviteHolyMan = {}
	Decisions_CID_Claims_InviteHolyMan.Name = "TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_INVITE_HOLY_MAN"
	Decisions_CID_Claims_InviteHolyMan.Desc = "TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_INVITE_HOLY_MAN_DESC"
	Decisions_CID_Claims_InviteHolyMan.CanFunc = (
	function(player)
		if (not unitDoctorID) then return false, false end
		if (not player:IsPolicyBranchFinished(branchPietyID)) then return false, false end
		local eraID = load(player, "Decisions_CID_Claims_InviteHolyMan")
		local currentEraID = player:GetCurrentEra()
		if eraID ~= nil then
			if eraID < currentEraID then
				save(player, "Decisions_CID_Claims_InviteHolyMan", nil)
			else
				Decisions_CID_Claims_InviteHolyMan.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_INVITE_HOLY_MAN_ENACTED_DESC")
				return false, false, true
			end
		end
		local costGold = mathCeil(((currentEraID+1)*250)*iMod)
		Decisions_CID_Claims_InviteHolyMan.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_INVITE_HOLY_MAN_DESC", costGold)
		if player:GetGold() < costGold then return true, false end
		return true, true
	end
	)
	
	Decisions_CID_Claims_InviteHolyMan.DoFunc = (
	function(player)
		local currentEraID = player:GetCurrentEra()
		local costGold = mathCeil(((currentEraID+1)*250)*iMod)
		player:ChangeGold(-costGold)
		local unitClassHolyMan = unitClassHolyMans[GetRandom(1, #unitClassHolyMans)]
		local unitHolyManID = player:GetSpecificUnitType(unitClassHolyMan)
		local capital = player:GetCapitalCity()
		player:InitUnit(unitHolyManID, capital:GetX(), capital:GetY())
		save(player, "Decisions_CID_Claims_InviteHolyMan", player:GetCurrentEra())
	end
	)

tDecisions["Decisions_CID_Claims_InviteHolyMan"] = Decisions_CID_Claims_InviteHolyMan
-------------------------------------------------------------------------------------------------------------------------
-- Claims: Invite Tutor
-------------------------------------------------------------------------------------------------------------------------
tDecisions.Decisions_InviteTutor = nil
local unitClassTutors = {"UNITCLASS_SCIENTIST", "UNITCLASS_ENGINEER", "UNITCLASS_MERCHANT"}
local Decisions_CID_Claims_InviteTutor = {}
	Decisions_CID_Claims_InviteTutor.Name = "TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_INVITE_TUTOR"
	Decisions_CID_Claims_InviteTutor.Desc = "TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_INVITE_TUTOR_DESC"
	Decisions_CID_Claims_InviteTutor.CanFunc = (
	function(player)
		if (not player:IsPolicyBranchFinished(branchTraditionID)) then return false, false end
		local eraID = load(player, "Decisions_CID_Claims_InviteTutor")
		local currentEraID = player:GetCurrentEra()
		if eraID ~= nil then
			if eraID < currentEraID then
				save(player, "Decisions_CID_Claims_InviteTutor", nil)
			else
				Decisions_CID_Claims_InviteTutor.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_INVITE_TUTOR_ENACTED_DESC")
				return false, false, true
			end
		end
		local costGold = mathCeil(((currentEraID+1)*250)*iMod)
		Decisions_CID_Claims_InviteTutor.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_INVITE_TUTOR_DESC", costGold)
		if player:GetNumResourceAvailable(resourceDignitariesID, false) < 1 then return true, false end
		if player:GetGold() < costGold then return true, false end
		return true, true
	end
	)
	
	Decisions_CID_Claims_InviteTutor.DoFunc = (
	function(player)
		local currentEraID = player:GetCurrentEra()
		local costGold = mathCeil(((currentEraID+1)*250)*iMod)
		player:ChangeNumResourceTotal(resourceDignitariesID, -1)
		player:ChangeGold(-costGold)
		local unitGreatPersonClass = unitClassTutors[GetRandom(1, #unitClassTutors)]
		local unitGreatPersonID = player:GetSpecificUnitType(unitGreatPersonClass)
		local capital = player:GetCapitalCity()
		player:InitUnit(unitGreatPersonID, capital:GetX(), capital:GetY())
		save(player, "Decisions_CID_Claims_InviteTutor", player:GetCurrentEra())
	end
	)

tDecisions["Decisions_CID_Claims_InviteTutor"] = Decisions_CID_Claims_InviteTutor
-------------------------------------------------------------------------------------------------------------------------
-- Claims: Invite Veteran
-------------------------------------------------------------------------------------------------------------------------
local unitAdventurerID  = GameInfoTypes["UNIT_JFD_ADVENTURER"]
local unitExplorerID    = GameInfoTypes["UNIT_JFD_EXPLORER"]
local Decisions_CID_Claims_InviteVeteran = {}
	Decisions_CID_Claims_InviteVeteran.Name = "TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_INVITE_VETERAN"
	Decisions_CID_Claims_InviteVeteran.Desc = "TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_INVITE_VETERAN_DESC"
	Decisions_CID_Claims_InviteVeteran.CanFunc = (
	function(player)
		if (not player:IsPolicyBranchFinished(branchHonorID)) then return false, false end
		local eraID = load(player, "Decisions_CID_Claims_InviteVeteran")
		local currentEraID = player:GetCurrentEra()
		if eraID ~= nil then
			if eraID < currentEraID then
				save(player, "Decisions_CID_Claims_InviteVeteran", nil)
			else
				if unitAdventurerID then
					Decisions_CID_Claims_InviteVeteran.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_INVITE_VETERAN_ENACTED_DESC_EXCE")
				else
					Decisions_CID_Claims_InviteVeteran.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_INVITE_VETERAN_ENACTED_DESC")
				end
				return false, false, true
			end
		end
		local costGold = mathCeil(((currentEraID+1)*250)*iMod)
		if unitAdventurerID then
			Decisions_CID_Claims_InviteVeteran.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_INVITE_VETERAN_DESC_EXCE", costGold)
		else
			Decisions_CID_Claims_InviteVeteran.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RPT_CLAIMS_INVITE_VETERAN_DESC", costGold)
		end
		if player:GetGold() < costGold then return true, false end
		return true, true
	end
	)
	
	Decisions_CID_Claims_InviteVeteran.DoFunc = (
	function(player)
		local unitClassVeterans = {"UNITCLASS_GREAT_ADMIRAL", "UNITCLASS_GREAT_GENERAL"}
		if unitAdventurerID then
			if player:CanTrain(unitAdventurerID) then
				unitClassVeterans = {"UNITCLASS_GREAT_ADMIRAL", "UNITCLASS_GREAT_GENERAL", 'UNITCLASS_JFD_GREAT_ADVENTURER'}
			elseif player:CanTrain(unitExplorerID) then
				unitClassVeterans = {"UNITCLASS_GREAT_ADMIRAL", "UNITCLASS_GREAT_GENERAL", 'UNITCLASS_JFD_GREAT_EXPLORER'}
			else
				unitClassVeterans = {"UNITCLASS_GREAT_ADMIRAL", "UNITCLASS_GREAT_GENERAL", 'UNITCLASS_JFD_GREAT_SCOUT'}
			end
		end
		local currentEraID = player:GetCurrentEra()
		local costGold = mathCeil(((currentEraID+1)*150)*iMod)
		player:ChangeGold(-costGold)
		local unitClassVeteran = unitClassVeterans[GetRandom(1, #unitClassVeterans)]
		local unitVeteranID = player:GetSpecificUnitType(unitClassVeteran)
		local capital = player:GetCapitalCity()
		player:InitUnit(unitVeteranID, capital:GetX(), capital:GetY()):JumpToNearestValidPlot()
		save(player, "Decisions_CID_Claims_InviteVeteran", player:GetCurrentEra())
	end
	)

tDecisions["Decisions_CID_Claims_InviteVeteran"] = Decisions_CID_Claims_InviteVeteran
-------------------------------------------------------------------------------------------------------------------------
-- Claims: Nationalize the Utilities
-------------------------------------------------------------------------------------------------------------------------
tDecisions.Decisions_NationaliseUtilities = nil
local buildingNationalizeUtilitiesID = GameInfoTypes["BUILDING_DECISIONS_NATIONALISEUTILITIES"]
local techIndustrializationID		 = GameInfoTypes["TECH_INDUSTRIALIZATION"]
local Decisions_CID_Claims_NationalizeUtilities = {}
	Decisions_CID_Claims_NationalizeUtilities.Name = "TXT_KEY_DECISIONS_NATIONALISEUTILITIES"
	Decisions_CID_Claims_NationalizeUtilities.Desc = "TXT_KEY_DECISIONS_NATIONALISEUTILITIES_DESC"
	Decisions_CID_Claims_NationalizeUtilities.CanFunc = (
	function(player)
		if player:GetCurrentEra() < eraIndustrialID then return false, false end
		if load(player, "Decisions_CID_Claims_NationalizeUtilities") == true then
			Decisions_CID_Claims_NationalizeUtilities.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_NATIONALISEUTILITIES_ENACTED_DESC")
			return false, false, true
		end
		local costGold = mathCeil(300*iMod)
		local resistanceTurns = mathCeil(5*iGAMod)
		Decisions_CID_Claims_NationalizeUtilities.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_NATIONALISEUTILITIES_DESC", costGold, resistanceTurns)
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if player:GetGold() < costGold then return true, false end
		if (not Teams[player:GetTeam()]:IsHasTech(techIndustrializationID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_CID_Claims_NationalizeUtilities.DoFunc = (
	function(player)
		local costGold = mathCeil(300 * iMod)
		local resistanceTurns = mathCeil(5 * iGAMod)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeGold(-costGold)
		player:GetCapitalCity():SetNumRealBuilding(buildingNationalizeUtilitiesID, 1)
		player:GetCapitalCity():ChangeResistanceTurns(resistanceTurns)
		save(player, "Decisions_CID_Claims_NationalizeUtilities", true)
	end
	)

	Decisions_CID_Claims_NationalizeUtilities.Monitors = {}
	Decisions_CID_Claims_NationalizeUtilities.Monitors[GameEvents.PlayerDoTurn] =  (
	function(iPlayer)
		local player = Players[iPlayer]
		if load(player, "Decisions_CID_Claims_NationalizeUtilities") == true then
			player:GetCapitalCity():SetNumRealBuilding(buildingNationalizeUtilitiesID, 1)
		end
	end
	)
	
tDecisions.Decisions_CID_Claims_NationalizeUtilities = Decisions_CID_Claims_NationalizeUtilities
--------------------------------------------------------------------------------------------------------------------------
-- Claims: Promote the Arts
--------------------------------------------------------------------------------------------------------------------------
tDecisions.Decisions_PromoteTheArts = nil
local techAcousticsID = GameInfoTypes["TECH_ACOUSTICS"]
local techGuildsID	  = GameInfoTypes["TECH_GUILDS"]
local Decisions_CID_Claims_PromoteArts = {}
	Decisions_CID_Claims_PromoteArts.Name = "TXT_KEY_DECISIONS_PROMOTETHEARTS"
	Decisions_CID_Claims_PromoteArts.Desc = "TXT_KEY_DECISIONS_PROMOTETHEARTS_DESC"
	Decisions_CID_Claims_PromoteArts.CanFunc = (
	function(player)
		local eraID = load(player, "Decisions_CID_Claims_PromoteArts")
		local currentEraID = player:GetCurrentEra()
		if eraID ~= nil then
			if eraID < currentEraID then
				save(player, "Decisions_CID_Claims_PromoteArts", nil)
			else
				Decisions_CID_Claims_PromoteArts.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PROMOTETHEARTS_ENACTED_DESC")
				return false, false, true
			end
		end
		if currentEraID < eraClassicalID then return false, false end
		if player:GetNumCities() < 1 then return false, false end
		local costGold = mathCeil(((currentEraID+1)*150)*iMod)
		Decisions_CID_Claims_PromoteArts.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PROMOTETHEARTS_DESC", costGold)
		if (player:GetGold() >= costGold) then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_CID_Claims_PromoteArts.DoFunc = (
	function(player)
		local currentEraID = player:GetCurrentEra()
		local costGold = mathCeil(((currentEraID+1)*150)*iMod)
		player:ChangeGold(-costGold)
		local tGreatPeople = {}
		local tInclude = {}
		tInclude.UNITCLASS_WRITER = 1
		if (Teams[player:GetTeam()]:IsHasTech(techGuildsID)) then tInclude.UNITCLASS_ARTIST = 1 end
		if (Teams[player:GetTeam()]:IsHasTech(techAcousticsID)) then tInclude.UNITCLASS_MUSICIAN = 1 end
		local unitArtsID = nil
		for sKey, iVal in pairs(tInclude) do
			unitArtsID = player:GetSpecificUnitType(sKey)
			table.insert(tGreatPeople, unitArtsID)
		end
		local capital = player:GetCapitalCity()
		player:InitUnit(tGreatPeople[GetRandom(1, #tGreatPeople)], capital:GetX(), capital:GetY())
		save(player, "Decisions_CID_Claims_PromoteArts", player:GetCurrentEra())
	end
	)
	
tDecisions["Decisions_CID_Claims_PromoteArts"] = Decisions_CID_Claims_PromoteArts
--------------------------------------------------------------------------------------------------------------------------
-- Claims: Set Up a Universities Funding Council
--------------------------------------------------------------------------------------------------------------------------
local buildingUniversityGrantsID = GameInfoTypes["BUILDING_DECISIONS_UNIVERSITYGRANTS"]
local techArchaeologyID = GameInfoTypes["TECH_ARCHAEOLOGY"]
local unitArchaeologistID = GameInfoTypes["UNIT_ARCHAEOLOGIST"]
tDecisions.Decisions_UniversityGrants = nil
local Decisions_CID_Claims_UniversityGrants = {}
	Decisions_CID_Claims_UniversityGrants.Name = "TXT_KEY_DECISIONS_UNIVERSITYGRANTS"
	Decisions_CID_Claims_UniversityGrants.Desc = "TXT_KEY_DECISIONS_UNIVERSITYGRANTS_DESC"
	Decisions_CID_Claims_UniversityGrants.CanFunc = (
	function(player)
		if player:GetCurrentEra() < eraIndustrialID then return false, false end
		if load(player, "Decisions_CID_Claims_UniversityGrants") == true then
			Decisions_CID_Claims_UniversityGrants.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_UNIVERSITYGRANTS_ENACTED_DESC")
			return false, false, true
		end
		local costGold = mathCeil(600*iMod)
		Decisions_CID_Claims_UniversityGrants.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_UNIVERSITYGRANTS_DESC", costGold)
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		if player:GetGold() < costGold then return true, false end
		if (not Teams[player:GetTeam()]:IsHasTech(techArchaeologyID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_CID_Claims_UniversityGrants.DoFunc = (
	function(player)
		local costGold = mathCeil(600*iMod)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:ChangeGold(-costGold)
		local capital = player:GetCapitalCity()
		capital:SetNumRealBuilding(buildingUniversityGrantsID, 1)
		player:InitUnit(unitArchaeologistID, capital:GetX(), capital:GetY())
		player:InitUnit(unitArchaeologistID, capital:GetX(), capital:GetY())
		save(player, "Decisions_CID_Claims_UniversityGrants", true)
	end
	)
	
tDecisions.Decisions_CID_Claims_UniversityGrants = Decisions_CID_Claims_UniversityGrants
-------------------------------------------------------------------------------------------------------------------------
-- Claims: Host a Grand Tournament
-------------------------------------------------------------------------------------------------------------------------
local techChivalryID = GameInfoTypes["TECH_CHIVALRY"]
local techNobilityID = GameInfoTypes["TECH_JFD_NOBILITY"]
local Decisions_JFD_CID_Claims_HostGrandTournament = {}
	Decisions_JFD_CID_Claims_HostGrandTournament.Name = "TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_GRAND_TOURNAMENT"
	Decisions_JFD_CID_Claims_HostGrandTournament.Desc = "TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_GRAND_TOURNAMENT_DESC"
	Decisions_JFD_CID_Claims_HostGrandTournament.CanFunc = (
	function(player)
		local eraID = load(player, "Decisions_JFD_CID_Claims_HostGrandTournament")
		local currentEraID = player:GetCurrentEra()
		if eraID then
			if eraID < currentEraID then
				save(player, "Decisions_JFD_CID_Claims_HostGrandTournament", nil)
			else
				Decisions_JFD_CID_Claims_HostGrandTournament.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_GRAND_TOURNAMENT_ENACTED_DESC")
				return false, false, true
			end
		end
		local techID = techChivalryID
		local techDesc = "Chivalry"
		if techNobilityID then
			techID = techNobilityID
			techDesc = "Nobility"
		end
		local costGold = mathCeil((50*player:GetNumCities())*iMod)
		Decisions_JFD_CID_Claims_HostGrandTournament.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_GRAND_TOURNAMENT_DESC", techDesc, costGold)
		if player:GetNumResourceAvailable(resourceDignitariesID, false) < 1 then return true, false end
		if player:GetGold() < costGold then return true, false end
		if (not Teams[player:GetTeam()]:IsHasTech(techID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_CID_Claims_HostGrandTournament.DoFunc = (
	function(player)
		local costGold = mathCeil((50*player:GetNumCities())*iMod)
		player:ChangeNumResourceTotal(resourceDignitariesID, -1)
		for city in player:Cities() do
			city:ChangeWeLoveTheKingDayCounter(5)
		end
		if player:HasStateReligion() then
			local religionID = player:GetStateReligion()
			for row in GameInfo.Belief_JFD_PietyYieldChanges("OnWLTKD == 1") do
				if Game.BeliefIsInReligion(religionID, GameInfoTypes[row.BeliefType]) then
					local rewardPiety = JFD_GetPietyYield(playerID, row.Yield)
					if rewardPiety > 0 then
						player:ChangePiety(rewardPiety)
						if player:IsHuman() then
							local hex = ToHexFromGrid(Vector2(plotX, plotY))
							Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_JFD_PIETY]+{1_Num}[ENDCOLOR] [ICON_JFD_PIETY]", rewardPiety), true)
						end
						break
					end
				end
			end	
		end
		save(player, "Decisions_JFD_CID_Claims_HostGrandTournament", player:GetCurrentEra())
	end
	)
	
tDecisions["Decisions_JFD_CID_Claims_HostGrandTournament"] = Decisions_JFD_CID_Claims_HostGrandTournament	
-------------------------------------------------------------------------------------------------------------------------
-- Claims: Dispatch Emissaries
-------------------------------------------------------------------------------------------------------------------------
local unmetPlayerID = nil
local Decisions_JFD_CID_Claims_DispatchEmissaries = {}
	Decisions_JFD_CID_Claims_DispatchEmissaries.Name = "TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_DISPATCH_EMISSARIES"
	Decisions_JFD_CID_Claims_DispatchEmissaries.Desc = "TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_DISPATCH_EMISSARIES_DESC"
	Decisions_JFD_CID_Claims_DispatchEmissaries.CanFunc = (
	function(player)
		local unmetPlayers = {}
		local count = 1
		for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do 
			local otherPlayer = Players[otherPlayerID]
			if (otherPlayer:IsAlive() and (not Teams[player:GetTeam()]:IsHasMet(otherPlayer:GetTeam()))) then
				unmetPlayers[count] = otherPlayerID
			end
		end
		if #unmetPlayers == 0 then return false, false end
		unmetPlayerID = unmetPlayers[GetRandom(1,#unmetPlayers)]
		local eraID = load(player, "Decisions_JFD_CID_Claims_DispatchEmissaries")
		local currentEraID = player:GetCurrentEra()
		if eraID then
			if eraID < currentEraID then
				save(player, "Decisions_JFD_CID_Claims_DispatchEmissaries", nil)
			else
				Decisions_JFD_CID_Claims_DispatchEmissaries.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_DISPATCH_EMISSARIES_ENACTED_DESC")
				return false, false, true
			end
		end
		local costGold = mathCeil(200*iMod)
		Decisions_JFD_CID_Claims_DispatchEmissaries.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_DISPATCH_EMISSARIES_DESC", costGold)
		if player:GetNumResourceAvailable(resourceDignitariesID, false) < 1 then return true, false end
		if player:GetGold() < costGold then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_CID_Claims_DispatchEmissaries.DoFunc = (
	function(player)
		local costGold = mathCeil(200 * iMod)
		player:ChangeNumResourceTotal(resourceDignitariesID, -1)
		player:ChangeGold(-costGold)
		local unmetPlayerTeamID = Players[unmetPlayerID]:GetTeam()
		Teams[player:GetTeam()]:Meet(unmetPlayerTeamID)
		save(player, "Decisions_JFD_CID_Claims_DispatchEmissaries", player:GetCurrentEra())
	end
	)
	
tDecisions["Decisions_JFD_CID_Claims_DispatchEmissaries"] = Decisions_JFD_CID_Claims_DispatchEmissaries
-------------------------------------------------------------------------------------------------------------------------
-- Claims: Hold Political Forum
-------------------------------------------------------------------------------------------------------------------------
local numCityStates = 0
local Decisions_JFD_CID_Claims_PoliticalForum = {}
	Decisions_JFD_CID_Claims_PoliticalForum.Name = "TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_POLITICAL_FORUM"
	Decisions_JFD_CID_Claims_PoliticalForum.Desc = "TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_POLITICAL_FORUM_DESC"
	Decisions_JFD_CID_Claims_PoliticalForum.CanFunc = (
	function(player)
		local eraID = load(player, "Decisions_JFD_CID_Claims_PoliticalForum")
		local currentEraID = player:GetCurrentEra()
		if eraID then
			if eraID < currentEraID then
				save(player, "Decisions_JFD_CID_Claims_PoliticalForum", nil)
			else
				Decisions_JFD_CID_Claims_PoliticalForum.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_POLITICAL_FORUM_ENACTED_DESC")
				return false, false, true
			end
		end
		numCityStates = 0
		for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do 
			local minorCiv = Players[otherPlayerID]
			if (minorCiv:IsAlive() and minorCiv:IsMinorCiv() and Teams[player:GetTeam()]:IsHasMet(minorCiv:GetTeam())) then
				if minorCiv:GetMinorCivFriendshipLevelWithMajor(playerID) >= 0 then
					numCityStates = numCityStates + 1
				end
			end
		end
		local dignitaryCost = mathCeil(numCityStates/3)
		if dignitaryCost == 0 then dignitaryCost = 1 end
		local influenceReward = JFD_GetEraAdjustedValue(player:GetID(), mathCeil(10*iMod))
		local techID = techChivalryID
		local techDesc = "Chivalry"
		if userSettingNobility then
			techID = techNobilityID
			techDesc = "Nobility"
		end
		Decisions_JFD_CID_Claims_PoliticalForum.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_POLITICAL_FORUM_DESC", techDesc, dignitaryCost, influenceReward)
		if numCityStates == 0 then return true, false end
		if player:GetNumResourceAvailable(resourceDignitariesID, false) < dignitaryCost then return true, false end
		if (not Teams[player:GetTeam()]:IsHasTech(techID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_CID_Claims_PoliticalForum.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local dignitaryCost = mathCeil(numCityStates/3)
		if dignitaryCost == 0 then dignitaryCost = 1 end
		player:ChangeNumResourceTotal(resourceDignitariesID, -dignitaryCost)
		local influenceReward = JFD_GetEraAdjustedValue(playerID, mathCeil(10*iMod))
		for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do 
			local minorCiv = Players[otherPlayerID]
			if (minorCiv:IsAlive() and minorCiv:IsMinorCiv() and Teams[player:GetTeam()]:IsHasMet(minorCiv:GetTeam())) then
				if minorCiv:GetMinorCivFriendshipLevelWithMajor(playerID) >= 0 then
					minorCiv:ChangeMinorCivFriendshipWithMajor(playerID, influenceReward)
				end
			end
		end
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_RTP_CLAIMS_POLITICAL_FORUM", player:GetName(), player:GetCivilizationShortDescription())) 
		save(player, "Decisions_JFD_CID_Claims_PoliticalForum", player:GetCurrentEra())
	end
	)
	
tDecisions["Decisions_JFD_CID_Claims_PoliticalForum"] = Decisions_JFD_CID_Claims_PoliticalForum
-------------------------------------------------------------------------------------------------------------------------
-- Claims: Fund Colonial Venture
-------------------------------------------------------------------------------------------------------------------------
local techNavigationID		     = GameInfoTypes["TECH_NAVIGATION"]
local unitPromotionExtraMovesIID = GameInfoTypes["PROMOTION_EXTRA_SIGHT_I"]
local unitPromotionExtraSightIID = GameInfoTypes["PROMOTION_EXTRA_MOVES_I"]
local unitSettlerID = GameInfoTypes["UNIT_SETTLER"]
local Decisions_JFD_CID_Claims_FundVenture = {}
	Decisions_JFD_CID_Claims_FundVenture.Name = "TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_FUND_VENTURE"
	Decisions_JFD_CID_Claims_FundVenture.Desc = "TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_FUND_VENTURE_DESC"
	Decisions_JFD_CID_Claims_FundVenture.CanFunc = (
	function(player)
		local eraID = load(player, "Decisions_JFD_CID_Claims_FundVenture")
		local currentEraID = player:GetCurrentEra()
		if currentEraID < eraRenaissanceID then return false, false end
		if currentEraID >= eraModernID then return false, false end
		if eraID then
			if eraID < currentEraID then
				save(player, "Decisions_JFD_CID_Claims_FundVenture", nil)
			else
				local unitDesc = "Settler"
				if isUsingExCE then
					local unitID = GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_RECON")
					if unitID then unitDesc = GameInfo.Units[unitID].Description end
				end
				Decisions_JFD_CID_Claims_FundVenture.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_FUND_VENTURE_ENACTED_DESC", unitDesc)
				return false, false, true
			end
		end
		local unitDesc = "Colonist"
		if isUsingExCE then
			local unitID = GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_RECON")
			if unitID then unitDesc = GameInfo.Units[unitID].Description end
		end
		local costGold = mathCeil(JFD_GetEraAdjustedValue(player:GetID(), 500*iMod))
		Decisions_JFD_CID_Claims_FundVenture.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_FUND_VENTURE_DESC", costGold, unitDesc)
		if player:GetGold() < costGold then return true, false end
		if player:GetNumResourceAvailable(resourceDignitariesID, false) < 1 then return true, false end
		if (not Teams[player:GetTeam()]:IsHasTech(techNavigationID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_CID_Claims_FundVenture.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local costGold = mathCeil(JFD_GetEraAdjustedValue(player:GetID(), 500*iMod))
		player:ChangeNumResourceTotal(resourceDignitariesID, -1)
		player:ChangeGold(-costGold)
		local capital = player:GetCapitalCity()
		local unitID = unitSettlerID
		if isUsingExCE then unitID = GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_RECON") end	
		if unitID then
			local newUnit = player:InitUnit(unitID, capital:GetX(), capital:GetY())
			newUnit:SetHasPromotion(unitPromotionExtraMovesIID, true)
			newUnit:SetHasPromotion(unitPromotionExtraSightIID, true)
		end
		local unitNavalID = GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_NAVALMELEE", "UNITCOMBAT_NAVALRANGED")
		if unitNavalID then
			player:InitUnit(unitNavalID, capital:GetX(), capital:GetY())
			player:InitUnit(unitNavalID, capital:GetX(), capital:GetY())
		end
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_RTP_CLAIMS_FUND_VENTURE", player:GetName(), player:CivilizationShortDescription())) 
		save(player, "Decisions_JFD_CID_Claims_FundVenture", player:GetCurrentEra())
	end
	)
	
--tDecisions["Decisions_JFD_CID_Claims_FundVenture"] = Decisions_JFD_CID_Claims_FundVenture
-------------------------------------------------------------------------------------------------------------------------
-- Claims: Autocracy Hold Military Parade
-------------------------------------------------------------------------------------------------------------------------
local ideologyAutocracyID = GameInfoTypes["POLICY_BRANCH_AUTOCRACY"]
local Decisions_JFD_CID_Claims_AutocracyMilitaryParade = {}
	Decisions_JFD_CID_Claims_AutocracyMilitaryParade.Name = "TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_AUTOCRACY_MILITARY_PARADE"
	Decisions_JFD_CID_Claims_AutocracyMilitaryParade.Desc = "TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_AUTOCRACY_MILITARY_PARADE_DESC"
	Decisions_JFD_CID_Claims_AutocracyMilitaryParade.CanFunc = (
	function(player)
		if (not player:HasIdeology(ideologyAutocracyID)) then return false, false end
		local eraID = load(player, "Decisions_JFD_CID_Claims_AutocracyMilitaryParade")
		local currentEraID = player:GetCurrentEra()
		if eraID then
			if eraID < currentEraID then
				save(player, "Decisions_JFD_CID_Claims_AutocracyMilitaryParade", nil)
			else
				Decisions_JFD_CID_Claims_AutocracyMilitaryParade.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_AUTOCRACY_MILITARY_PARADE_ENACTED_DESC")
				return false, false, true
			end
		end
		local costGold = mathCeil((player:GetNumCities()*150)*iMod)
		Decisions_JFD_CID_Claims_AutocracyMilitaryParade.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_AUTOCRACY_MILITARY_PARADE_DESC", costGold)
		if player:GetGold() < costGold then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_CID_Claims_AutocracyMilitaryParade.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local costGold = mathCeil((player:GetNumCities()*150)*iMod)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeGold(-costGold)
		for city in player:Cities() do
			city:ChangeResistanceTurns(-city:GetResistanceTurns())
		end
		save(player, "Decisions_JFD_CID_Claims_AutocracyMilitaryParade", player:GetCurrentEra())
	end
	)
	
tDecisions["Decisions_JFD_CID_Claims_AutocracyMilitaryParade"] = Decisions_JFD_CID_Claims_AutocracyMilitaryParade
-------------------------------------------------------------------------------------------------------------------------
-- Claims: Freedom Privatize Industries
-------------------------------------------------------------------------------------------------------------------------
local buildingClassFactoryID = GameInfoTypes["BUILDINGCLASS_FACTORY"]
local ideologyFreedomID		 = GameInfoTypes["POLICY_BRANCH_FREEDOM"]
local Decisions_JFD_CID_Claims_FreedomPrivatizeIndustries = {}
	Decisions_JFD_CID_Claims_FreedomPrivatizeIndustries.Name = "TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_FREEDOM_PRIVATIZE_INDUSTRIES"
	Decisions_JFD_CID_Claims_FreedomPrivatizeIndustries.Desc = "TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_FREEDOM_PRIVATIZE_INDUSTRIES_DESC"
	Decisions_JFD_CID_Claims_FreedomPrivatizeIndustries.CanFunc = (
	function(player)
		if (not player:HasIdeology(ideologyFreedomID)) then return false, false end
		local eraID = load(player, "Decisions_JFD_CID_Claims_FreedomPrivatizeIndustries")
		local currentEraID = player:GetCurrentEra()
		if eraID then
			if eraID < currentEraID then
				save(player, "Decisions_JFD_CID_Claims_FreedomPrivatizeIndustries", nil)
			else
				Decisions_JFD_CID_Claims_FreedomPrivatizeIndustries.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_FREEDOM_PRIVATIZE_INDUSTRIES_ENACTED_DESC")
				return false, false, true
			end
		end
		local numFactories = player:GetBuildingClassCount(buildingClassFactoryID)
		local productionCost = mathCeil((numFactories*100)*iMod)
		local rewardGold = mathCeil((numFactories*250)*iMod)
		Decisions_JFD_CID_Claims_FreedomPrivatizeIndustries.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_FREEDOM_PRIVATIZE_INDUSTRIES_DESC", productionCost, rewardGold)
		if numFactories < 3 then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_CID_Claims_FreedomPrivatizeIndustries.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local numFactories = player:GetBuildingClassCount(buildingClassFactoryID)
		local productionCost = mathCeil((numFactories*100)*iMod)
		local rewardGold = mathCeil((numFactories*250)*iMod)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeGold(rewardGold)
		for city in player:Cities() do
			local buildingFactoryID = player:GetSpecificBuildingType("BUILDINGCLASS_FACTORY")
			if buildingFactoryID then
				if city:IsHasBuilding(buildingFactoryID) then
					city:ChangeProduction(-productionCost)
					city:SetNumRealBuilding(buildingFactoryID, 0)
				end
			end
		end
		save(player, "Decisions_JFD_CID_Claims_FreedomPrivatizeIndustries", player:GetCurrentEra())
	end
	)
	
tDecisions["Decisions_JFD_CID_Claims_FreedomPrivatizeIndustries"] = Decisions_JFD_CID_Claims_FreedomPrivatizeIndustries
-------------------------------------------------------------------------------------------------------------------------
-- Claims: Order Organize Soviets
-------------------------------------------------------------------------------------------------------------------------
local ideologyOrderID   = GameInfoTypes["POLICY_BRANCH_ORDER"]
local unitClassWorkerID = GameInfoTypes["UNITCLASS_WORKER"]
local yieldProductionID = YieldTypes["YIELD_PRODUCTION"]
local Decisions_JFD_CID_Claims_OrderSoviets = {}
	Decisions_JFD_CID_Claims_OrderSoviets.Name = "TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_ORDER_SOVIETS"
	Decisions_JFD_CID_Claims_OrderSoviets.Desc = "TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_ORDER_SOVIETS_DESC"
	Decisions_JFD_CID_Claims_OrderSoviets.CanFunc = (
	function(player)
		if (not player:HasIdeology(ideologyOrderID)) then return false, false end
		local eraID = load(player, "Decisions_JFD_CID_Claims_OrderSoviets")
		local currentEraID = player:GetCurrentEra()
		if eraID then
			if eraID < currentEraID then
				save(player, "Decisions_JFD_CID_Claims_OrderSoviets", nil)
			else
				Decisions_JFD_CID_Claims_OrderSoviets.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_ORDER_SOVIETS_ENACTED_DESC")
				return false, false, true
			end
		end
		local numWorkers = player:GetUnitClassCount(unitClassWorkerID)
		local costGold = mathCeil((numWorkers*200)*iMod)
		Decisions_JFD_CID_Claims_OrderSoviets.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RTP_CLAIMS_ORDER_SOVIETS_DESC", costGold)
		if numWorkers < 3 then return true, false end
		if player:GetGold() < costGold then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_CID_Claims_OrderSoviets.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local numWorkers = player:GetUnitClassCount(unitClassWorkerID)
		local costGold = mathCeil((numWorkers*200)*iMod)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeGold(-costGold)
		for city in player:Cities() do
			city:ChangeProduction(city:GetYieldRate(yieldProductionID)*numWorkers)
		end
		for unit in player:Units() do
			if unit:GetUnitClassType() == unitClassWorkerID then
				unit:Kill(-1)
			end
		end
		save(player, "Decisions_JFD_CID_Claims_OrderSoviets", player:GetCurrentEra())
	end
	)
	
tDecisions["Decisions_JFD_CID_Claims_OrderSoviets"] = Decisions_JFD_CID_Claims_OrderSoviets
--=======================================================================================================================
-- CIV SPECIFIC DECISIONS
--=======================================================================================================================
-- America: Louisiana Purchase
--------------------------------------------------------------------------------------------------------------------------
tDecisions.Decisions_AmericanPurchase = nil
local civilizationAmericaID = GameInfoTypes["CIVILIZATION_AMERICA"]
local Decisions_CID_Claims_America_Purchase = {}
	Decisions_CID_Claims_America_Purchase.Name = "TXT_KEY_DECISIONS_AMERICANPURCHASE"
	Decisions_CID_Claims_America_Purchase.Desc = "TXT_KEY_DECISIONS_AMERICANPURCHASE_DESC"
	HookDecisionCivilizationIcon(Decisions_CID_Claims_America_Purchase, "CIVILIZATION_AMERICA")
	Decisions_CID_Claims_America_Purchase.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationAmericaID then return false, false end
		if load(player, "Decisions_CID_Claims_America_Purchase") == true then
			Decisions_CID_Claims_America_Purchase.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_AMERICANPURCHASE_ENACTED_DESC")
			return false, false, true
		end
		local costGold = mathCeil(800*iMod)
		Decisions_CID_Claims_America_Purchase.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_AMERICANPURCHASE_DESC", costGold)
		if player:GetGold() < costGold then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if player:GetNumResourceAvailable(resourceDignitariesID, false) < 1 then return true, false end
		return true, true
	end
	)
	
	Decisions_CID_Claims_America_Purchase.DoFunc = (
	function(player)
		local costGold = mathCeil(800*iMod)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeNumResourceTotal(resourceDignitariesID, -1)
		save(player, "Decisions_CID_Claims_America_Purchase", true)
	end
	)

	Decisions_CID_Claims_America_Purchase.Monitors = {}
	Decisions_CID_Claims_America_Purchase.Monitors[GameEvents.PlayerCityFounded] = (
	function(playerID, plotX, plotY)
		local player = Players[playerID]
		if load(player, "Decisions_CID_Claims_America_Purchase") ~= true then return end
		local plot = Map.GetPlot(plotX, plotY)
		local city = plot:GetPlotCity()
		local cityID = city:GetID()
		local plots = {city:GetBuyablePlotList()}
		for plotID = 1,8 do
			local plots = {city:GetBuyablePlotList()}
			plots[1]:SetOwner(playerID, cityID, true, true)
		end
		if load(player, "bDecisions_CID_Claims_America_Purchase") ~= true then
			city:SetName("Baton Rouge")
			save(player, "bDecisions_CID_Claims_America_Purchase", true)
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationAmericaID, "Decisions_CID_Claims_America_Purchase", Decisions_CID_Claims_America_Purchase)
--------------------------------------------------------------------------------------------------------------------------
-- Aztecs: Enact the Flower Wars
------------------------------------------------------------------------------------------------------------------------
tDecisions.Decisions_AztecFlowerWar = nil
local civilizationAztecsID   = GameInfoTypes["CIVILIZATION_AZTEC"]
local policyAztecFlowerWarID = GameInfoTypes["POLICY_DECISIONS_AZTECFLOWERWAR"]
local techCivilServiceID	 = GameInfoTypes["TECH_CIVIL_SERVICE"]
local Decisions_CID_Claims_Aztec_FlowerWar = {}
	Decisions_CID_Claims_Aztec_FlowerWar.Name = "TXT_KEY_DECISIONS_AZTECFLOWERWAR"
	Decisions_CID_Claims_Aztec_FlowerWar.Desc = "TXT_KEY_DECISIONS_AZTECFLOWERWAR_DESC"
	HookDecisionCivilizationIcon(Decisions_CID_Claims_Aztec_FlowerWar, "CIVILIZATION_AZTEC")
	Decisions_CID_Claims_Aztec_FlowerWar.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationAztecsID then return false, false end
		if player:HasPolicy(policyAztecFlowerWarID) then
			Decisions_CID_Claims_Aztec_FlowerWar.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_AZTECFLOWERWAR_ENACTED_DESC")
			return false, false, true
		end
		local costCulture = mathCeil(300*iMod)
		Decisions_CID_Claims_Aztec_FlowerWar.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_AZTECFLOWERWAR_DESC", costCulture)
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if player:GetNumResourceAvailable(resourceDignitariesID, false) < 1 then return true, false end
		if player:GetJONSCulture() < costCulture then return true, false end
		if (not Teams[player:GetTeam()]:IsHasTech(techCivilServiceID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_CID_Claims_Aztec_FlowerWar.DoFunc = (
	function(player)
		local costCulture = mathCeil(300*iMod)
		player:ChangeJONSCulture(-costCulture)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeNumResourceTotal(resourceDignitariesID, -1)
		player:GrantPolicy(policyAztecFlowerWarID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationAztecsID, "Decisions_CID_Claims_Aztec_FlowerWar", Decisions_CID_Claims_Aztec_FlowerWar)
--------------------------------------------------------------------------------------------------------------------------
-- Iroquois: Ratify the Gayanashagowa
--------------------------------------------------------------------------------------------------------------------------
tDecisions.Decisions_IroquoisLawofPeace = nil
local civilizationIroquoisID	 = GameInfoTypes["CIVILIZATION_IROQUOIS"]
local policyIroquoisLawOfPeaceID = GameInfoTypes["POLICY_DECISIONS_JFD_IROQUOIS_LAW_PEACE"]
local Decisions_CID_Claims_Iroquois_LawOfPeace = {}
	Decisions_CID_Claims_Iroquois_LawOfPeace.Name = "TXT_KEY_DECISIONS_IROQUOISLAWOFPEACE"
	Decisions_CID_Claims_Iroquois_LawOfPeace.Desc = "TXT_KEY_DECISIONS_IROQUOISLAWOFPEACE_DESC"
	HookDecisionCivilizationIcon(Decisions_CID_Claims_Iroquois_LawOfPeace, "CIVILIZATION_IROQUOIS")
	Decisions_CID_Claims_Iroquois_LawOfPeace.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationIroquoisID then return false, false end
		if player:HasPolicy(policyIroquoisLawOfPeaceID)	then
			Decisions_CID_Claims_Iroquois_LawOfPeace.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_IROQUOISLAWOFPEACE_ENACTED_DESC")
			return false, false, true
		end
		Decisions_CID_Claims_Iroquois_LawOfPeace.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_IROQUOISLAWOFPEACE_DESC")
		if player:GetNumResourceAvailable(resourceDignitariesID, false) < 1 then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		local isConnected = true
		local numCitiesConnected = 1
		for city in player:Cities() do
			if (not city:IsCapital()) then
				numCitiesConnected = numCitiesConnected + 1
				if (not player:IsCapitalConnectedToCity(city)) then
					isConnected = false
				end
			end
		end
		if numCitiesConnected < 3 then return true, false end
		if (not isConnected) then return true, false end
		return true, true
	end
	)
	
	Decisions_CID_Claims_Iroquois_LawOfPeace.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(resourceDignitariesID, -1)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeGoldenAgeTurns(12)
		player:GrantPolicy(policyIroquoisLawOfPeaceID, true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationIroquoisID, "Decisions_CID_Claims_Iroquois_LawOfPeace", Decisions_CID_Claims_Iroquois_LawOfPeace)
--------------------------------------------------------------------------------------------------------------------------
-- Siam: Send Out Embassies
--------------------------------------------------------------------------------------------------------------------------
tDecisions.Decisions_SiamEmbassies = nil
local civilizationSiamID	= GameInfoTypes["CIVILIZATION_SIAM"]
local policySiamEmbassiesID = GameInfoTypes["POLICY_DECISIONS_SIAMEMBASSIES"]
local Decisions_CID_Claims_Siam_Embassies = {}
	Decisions_CID_Claims_Siam_Embassies.Name = "TXT_KEY_DECISIONS_SIAMEMBASSIES"
	Decisions_CID_Claims_Siam_Embassies.Desc = "TXT_KEY_DECISIONS_SIAMEMBASSIES_DESC"
	HookDecisionCivilizationIcon(Decisions_CID_Claims_Siam_Embassies, "CIVILIZATION_SIAM")
	Decisions_CID_Claims_Siam_Embassies.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationSiamID then return false, false end
		if player:HasPolicy(policySiamEmbassiesID) then
			Decisions_CID_Claims_Siam_Embassies.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SIAMEMBASSIES_ENACTED_DESC")
			return false, false, true
		end
		numCityStates = 0
		for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do 
			local minorCiv = Players[otherPlayerID]
			if (minorCiv:IsAlive() and minorCiv:IsMinorCiv() and Teams[player:GetTeam()]:IsHasMet(minorCiv:GetTeam())) then
				numCityStates = numCityStates + 1
			end
		end
		local costGold = mathCeil(numCityStates*100*iMod)
		Decisions_CID_Claims_Siam_Embassies.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SIAMEMBASSIES_DESC", costGold)
		local currentEraID = player:GetCurrentEra()
		if currentEraID < eraRenaissanceID or currentEraID > eraIndustrialID then return true, false end
		if numCityStates < 4 then return true, false end
		if player:GetNumResourceAvailable(resourceDignitariesID, false) < 2 then return true, false end
		if player:GetGold() < costGold then return true, false end
		if Teams[player:GetTeam()]:GetAtWarCount(false) > 0 then return true, false end
		return true, true
	end
	)
	
	Decisions_CID_Claims_Siam_Embassies.DoFunc = (
	function(player, tCSSiam, tChance)
		local playerID = player:GetID()
		local costGold = mathCeil(numCityStates*100*iMod) 
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(resourceDignitariesID, -2)
		for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do 
			local minorCiv = Players[otherPlayerID]
			if (minorCiv:IsAlive() and minorCiv:IsMinorCiv() and Teams[player:GetTeam()]:IsHasMet(minorCiv:GetTeam())) then
				minorCiv:ChangeMinorCivFriendshipWithMajor(playerID, GetRandom(10,40))
			end
		end
		player:GrantPolicy(policySiamEmbassiesID, true)
	end
	)

Decisions_AddCivilisationSpecific(civilizationSiamID, "Decisions_CID_Claims_Siam_Embassies", Decisions_CID_Claims_Siam_Embassies)
--------------------------------------------------------------------------------------------------------------------------
-- Shoshone: Form the Comanche Nation
--------------------------------------------------------------------------------------------------------------------------
tDecisions.Decisions_ShoshoneComanche = nil
local civilizationShoshoneID	= GameInfoTypes["CIVILIZATION_SHOSHONE"]
local policyShoshoneComancheID  = GameInfoTypes["POLICY_DECISIONS_JFD_SHOSHONE_COMANCHE"]
local resourceHorseID			= GameInfoTypes["RESOURCE_HORSE"]
local unitComancheRiderID = GameInfoTypes["UNIT_SHOSHONE_COMANCHE_RIDERS"]
local Decisions_CID_Claims_Shoshone_Comanche = {}
	Decisions_CID_Claims_Shoshone_Comanche.Name = "TXT_KEY_DECISIONS_SHOSHONECOMANCHE"
	Decisions_CID_Claims_Shoshone_Comanche.Desc = "TXT_KEY_DECISIONS_SHOSHONECOMANCHE_DESC"
	HookDecisionCivilizationIcon(Decisions_CID_Claims_Shoshone_Comanche, "CIVILIZATION_SHOSHONE")
	Decisions_CID_Claims_Shoshone_Comanche.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationShoshoneID then return false, false end
		if player:HasPolicy(policyShoshoneComancheID) then
			Decisions_CID_Claims_Shoshone_Comanche.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SHOSHONECOMANCHE_ENACTED_DESC")
			return false, false, true
		end
		local cultureReward = mathCeil(((player:GetNumResourceAvailable(resourceHorseID, false)+5)*30)*iMod)
		Decisions_CID_Claims_Shoshone_Comanche.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SHOSHONECOMANCHE_DESC", cultureReward)
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if player:GetNumResourceAvailable(resourceDignitariesID, false) < 1 then return true, false end
		if player:GetCurrentEra() < eraIndustrialID then return true, false end
		return true, true
	end
	)
	
	Decisions_CID_Claims_Shoshone_Comanche.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local cultureReward = mathCeil(((player:GetNumResourceAvailable(resourceHorseID, false)+5)*30) * iMod)
		player:ChangeNumResourceTotal(resourceDignitariesID, -1)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeNumResourceTotal(resourceHorseID, 5)
		player:ChangeJONSCulture(cultureReward)
		InitUnitFromCity(player:GetCapitalCity(), unitComancheRiderID, 3)
		player:GrantPolicy(policyShoshoneComancheID, true)
		PreGame.SetCivilizationAdjective(playerID, Locale.ConvertTextKey("TXT_KEY_DECISIONS_CIV_JFD_COMANCHE_ADJECTIVE"))
		PreGame.SetCivilizationDescription(playerID, Locale.ConvertTextKey("TXT_KEY_DECISIONS_CIV_JFD_COMANCHE_DESC"))
		PreGame.SetCivilizationShortDescription(playerID, Locale.ConvertTextKey("TXT_KEY_DECISIONS_CIV_JFD_COMANCHE_SHORT_DESC"))
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SHOSHONE_COMANCHE", player:GetName())) 
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationShoshoneID, "Decisions_CID_Claims_Shoshone_Comanche", Decisions_CID_Claims_Shoshone_Comanche)
--------------------------------------------------------------------------------------------------------------------------
-- Venice: Rescue the Relics of St Mark
--------------------------------------------------------------------------------------------------------------------------
local buildingStMarksID		= GameInfoTypes["BUILDING_SAN_MARCO_BASILICA"]
local civilizationVeniceID  = GameInfoTypes["CIVILIZATION_VENICE"]
local Decisions_VeniceStMark = {}
	Decisions_VeniceStMark.Name = "TXT_KEY_DECISIONS_STMARK"
	Decisions_VeniceStMark.Desc = "TXT_KEY_DECISIONS_STMARK_DESC"
	HookDecisionCivilizationIcon(Decisions_VeniceStMark, "CIVILIZATION_VENICE")
	Decisions_VeniceStMark.Pedia = "TXT_KEY_BUILDING_SAN_MARCO_BASILICA_DESC"
	Decisions_VeniceStMark.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationVeniceID then return false, false end
		if load(player, "Decisions_VeniceStMark") == true then
			Decisions_VeniceStMark.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_STMARK_ENACTED_DESC")
			return false, false, true
		end
		local costGold = mathCeil(600*iMod)
		Decisions_VeniceStMark.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_STMARK_DESC", costGold)
		if player:GetNumResourceAvailable(resourceDignitariesID, false) < 2 then return true, false end		
		local tCSVenice = {}
		iCSVenice = nil
		local tradeRoutes = player:GetTradeRoutes()
        for _,tradeRoute in ipairs(tradeRoutes) do
			if tradeRoute.FromID ~= tradeRoute.ToID then
			     if Players[tradeRoute.ToID]:IsMinorCiv() then
					table.insert(tCSVenice, tradeRoute.ToID)
				end
			end
		end
		iCSVenice = tCSVenice[GetRandom(1, #tCSVenice)]
		if (iCSVenice ~= nil) and (player:GetGold() >= costGold) then
			return true, true
		else 
			return true, false
		end
	end
	)
	
	Decisions_VeniceStMark.DoFunc = (
	function(player)
		local costGold = mathCeil(600*iMod)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(resourceDignitariesID, -2)
		player:GetCapitalCity():SetNumRealBuilding(buildingSaintMarksID, 1)
		Players[iCSVenice]:ChangeMinorCivFriendshipWithMajor(player:GetID(), -30)
		save(player, "Decisions_VeniceStMark", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_VENICE, "Decisions_VeniceStMark", Decisions_VeniceStMark)
--=======================================================================================================================
--=======================================================================================================================
