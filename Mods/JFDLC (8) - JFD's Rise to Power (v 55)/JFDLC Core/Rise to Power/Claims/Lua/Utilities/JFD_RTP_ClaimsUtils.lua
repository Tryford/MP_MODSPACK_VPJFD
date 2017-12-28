-- JFD_RTP_ClaimsUtils
-- Author: JFD
-- DateCreated: 10/3/2015 2:57:10 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFDLCUtils.lua")
include("JFD_RussiaPutinUtils.lua")
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
local defineRTPClaimAlliedTurns    	  = GameDefines["JFD_RTP_CLAIMS_ALLIED_TURNS"]
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingRTPClaimsCore		  = (Game.GetUserSetting("JFD_RTP_CLAIMS_CORE") == 1)
local userSettingRTPClaimsCoreClaims  = (Game.GetUserSetting("JFD_RTP_CLAIMS_CORE_CLAIMS") == 1)
local userSettingRTPClaimsCoreCulDiv  = (Game.GetUserSetting("JFD_RTP_CLAIMS_CORE_CULTURE_CAUSE") == 1)
local userSettingColoniesCore	 	  = (Game.GetUserSetting("JFD_CID_COLONIES_CORE") == 1)
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local convertTextKey 		 		 = Locale.ConvertTextKey
local resourceDignitariesID	 		 = GameInfoTypes["RESOURCE_JFD_DIGNITARIES"]

local worldSize 					 = GameInfo.Worlds[Map.GetWorldSize()]
------------------------------------------------------------------------------------------------------------------------
-- CLAIMS
------------------------------------------------------------------------------------------------------------------------
--Player:GetMinorClaimID
local claimWeakID = GameInfoTypes["CLAIM_JFD_WEAK"]
function Player.GetMinorClaimID(player, minorPlayerID)
	local claimID = claimWeakID
	local numClaimCauses = player:GetClaimCauses(minorPlayerID, false)
	for row in GameInfo.JFD_Claims() do
		if numClaimCauses >= row.CausesNeeded then
			return row.ID
		end
	end
	return claimID
end

--Player:CanPushMinorClaim
function Player.CanPushMinorClaim(player, minorPlayerID, claimID)
	local minorPlayer = Players[minorPlayerID]
	if player:IsAtWarWith(minorPlayerID) then return false end
	local claimGoldCost, claimDignitaryCost = player:GetClaimCost(minorPlayerID, claimID)
	if player:GetGold() < claimGoldCost then return false end
	if player:GetNumResourceAvailable(resourceDignitariesID, false) < claimDignitaryCost then return false end
	return true
end
----------------
-- COST
----------------
--Player:GetClaimCost
function Player.GetClaimCost(player, minorPlayerID, claimID)
	local playerID = player:GetID()
	local minorPlayer = Players[minorPlayerID]
	local minorIsAllies = minorPlayer:IsAllies(playerID)
	local minorIsFriends = minorPlayer:IsFriends(playerID)
	local claim = GameInfo.JFD_Claims[claimID]
	local claimDignitaryCost = claim.DignitaryCost
	local claimGoldCost = minorPlayer:GetBuyoutCost(playerID)
	local claimResistanceCost = Game.GetRound((minorPlayer:GetTotalPopulation()*claim.ResistanceModifier)/100)
	claimGoldCost = (claimGoldCost*claim.GoldCostModifier)/100
	--Buildings
	local numCausesFromBuildings = 0
	for row in GameInfo.Building_JFD_ClaimMods("ClaimCostMod <> 0") do
		if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
			local requireAllies = row.RequiresAllied
			local requireFriends = row.RequiresBefriended
			if (requireAllies and (minorIsAllies)) or (requireFriends and minorIsFriends) or ((not requireAllies) and (not requireFriends)) then
				claimGoldCost = claimGoldCost + ((claimGoldCost*row.ClaimCostMod)/100)
			end
		end
	end
	--Epithets
	local numCausesFromEpithets = 0
	for row in GameInfo.JFD_Reform_ClaimMods("ClaimCostMod <> 0") do
		if player:HasReform(GameInfoTypes[row.ReformType]) then
			local requireAllies = row.RequiresAllied
			local requireFriends = row.RequiresBefriended
			if (requireAllies and (minorIsAllies)) or (requireFriends and minorIsFriends) or ((not requireAllies) and (not requireFriends)) then
				claimGoldCost = claimGoldCost + ((claimGoldCost*row.ClaimCostMod)/100)
			end
		end
	end
	--Policies
	local numCausesFromPolicies = 0
	for row in GameInfo.Policy_JFD_ClaimMods("ClaimCostMod <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			local requireAllies = row.RequiresAllied
			local requireFriends = row.RequiresBefriended
			if (requireAllies and (minorIsAllies)) or (requireFriends and minorIsFriends) or ((not requireAllies) and (not requireFriends)) then
				claimGoldCost = claimGoldCost + ((claimGoldCost*row.ClaimCostMod)/100)
			end
		end
	end
	--Reforms
	local numCausesFromReforms = 0
	for row in GameInfo.JFD_Reform_ClaimMods("ClaimCostMod <> 0") do
		if player:HasReform(GameInfoTypes[row.ReformType]) then
			local requireAllies = row.RequiresAllied
			local requireFriends = row.RequiresBefriended
			if (requireAllies and (minorIsAllies)) or (requireFriends and minorIsFriends) or ((not requireAllies) and (not requireFriends)) then
				claimGoldCost = claimGoldCost + ((claimGoldCost*row.ClaimCostMod)/100)
			end
		end
	end
	--Traits
	local numCausesFromTraits = 0
	for row in GameInfo.Trait_JFD_ClaimMods("ClaimCostMod <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			local requireAllies = row.RequiresAllied
			local requireFriends = row.RequiresBefriended
			if (requireAllies and (minorIsAllies)) or (requireFriends and minorIsFriends) or ((not requireAllies) and (not requireFriends)) then
				claimGoldCost = claimGoldCost + ((claimGoldCost*row.ClaimCostMod)/100)
			end
		end
	end
	return Game.GetRound(claimGoldCost), claimDignitaryCost, claimResistanceCost
end
----------------
-- CAUSES
----------------
--Player:GetNumMinorClaimCauses
local domainLandID 				= GameInfoTypes["DOMAIN_LAND"]
local domainSeaID 				= GameInfoTypes["DOMAIN_SEA"]
local minorTraitCultureID 		= MinorCivTraitTypes["MINOR_CIV_TRAIT_CULTURED"]
local minorTraitMaritimeID 		= MinorCivTraitTypes["MINOR_CIV_TRAIT_MARITIME"]
local minorTraitMercantileID 	= MinorCivTraitTypes["MINOR_CIV_TRAIT_MERCANTILE"]
local minorTraitMilitaristicID 	= MinorCivTraitTypes["MINOR_CIV_TRAIT_MILITARISTIC"]
local minorTraitReligiousID 	= MinorCivTraitTypes["MINOR_CIV_TRAIT_RELIGIOUS"]
local policyRussiaPutinImperialThroneID = GameInfoTypes["POLICY_DECISIONS_JFD_RUSSIA_PUTIN_IMPERIAL_THRONE"]
function Player.GetClaimCauses(player, minorPlayerID, returnsTT)
	local playerID = player:GetID()
	local playerCapital = player:GetCapitalCity()
	local minorPlayer = Players[minorPlayerID]
	local minorCapital = minorPlayer:GetCapitalCity()
	local minorIsAllies = minorPlayer:IsAllies(playerID)
	local minorIsFriends = minorPlayer:IsFriends(playerID)
	local numClaimCauses = 0
	local numClaimCausesTT = ""
	if (not minorCapital) then return numClaimCauses, numClaimCausesTT end
	local minorTraitID = minorPlayer:GetMinorCivTrait()
	--Russia (Putin)
	if (GameInfoTypes[policyRussiaPutinImperialThroneID] and player:HasPolicy(policyRussiaPutinImperialThroneID)) then
		if JFD_IsCityStateBordering(playerID, minorCapital) then
			numClaimCauses = numClaimCauses + 1
			if returnsTT then
				numClaimCausesTT = numClaimCausesTT .. "[COLOR_POSITIVE_TEXT]" .. convertTextKey("TXT_KEY_CLAIM_JFD_CAUSE_RUSSIA_PUTIN") .. "[ENDCOLOR]"
			end
		else
			if returnsTT then
				numClaimCausesTT = numClaimCausesTT .. "[COLOR_FADING_NEGATIVE_TEXT]" .. convertTextKey("TXT_KEY_CLAIM_JFD_CAUSE_RUSSIA_PUTIN") .. "[ENDCOLOR]"	
			end
		end
	end
	--Allies
	local allianceTurns = minorPlayer:GetAlliedTurns()
	if (minorPlayer:GetAlly() == playerID and allianceTurns >= defineRTPClaimAlliedTurns) then
		numClaimCauses = numClaimCauses + 1
		if returnsTT then
			numClaimCausesTT = numClaimCausesTT .. "[COLOR_POSITIVE_TEXT]" .. convertTextKey("TXT_KEY_CLAIM_JFD_CAUSE_ALLIES", allianceTurns, defineRTPClaimAlliedTurns) .. "[ENDCOLOR]"
		end			
	else
		if returnsTT then
			numClaimCausesTT = numClaimCausesTT .. "[COLOR_FADING_NEGATIVE_TEXT]" .. convertTextKey("TXT_KEY_CLAIM_JFD_CAUSE_ALLIES", allianceTurns, defineRTPClaimAlliedTurns) .. "[ENDCOLOR]"	
		end
	end
	--Nearby Capital
	local distance = Map.PlotDistance(minorCapital:GetX(), minorCapital:GetY(), playerCapital:GetX(), playerCapital:GetY())
	if distance < worldSize.FogTilesPerBarbarianCamp then
		numClaimCauses = numClaimCauses + 1
		if returnsTT then
			numClaimCausesTT = numClaimCausesTT .. "[COLOR_POSITIVE_TEXT]" .. convertTextKey("TXT_KEY_CLAIM_JFD_CAUSE_NEARBY", distance ) .. "[ENDCOLOR]"
		end	
	end	
	--Pledge of Protection
	if minorPlayer:IsProtectedByMajor(playerID) then
		numClaimCauses = numClaimCauses + 1
		if returnsTT then
			numClaimCausesTT = numClaimCausesTT .. "[COLOR_POSITIVE_TEXT]" .. convertTextKey("TXT_KEY_CLAIM_JFD_CAUSE_PROTECTION") .. "[ENDCOLOR]"
		end	
	else
		if returnsTT then
			numClaimCausesTT = numClaimCausesTT .. "[COLOR_FADING_NEGATIVE_TEXT]" .. convertTextKey("TXT_KEY_CLAIM_JFD_CAUSE_PROTECTION") .. "[ENDCOLOR]"	
		end
	end
	--Spy
	if minorCapital:HasSpy(playerID) then
		numClaimCauses = numClaimCauses + 1
		if returnsTT then
			numClaimCausesTT = numClaimCausesTT .. "[COLOR_POSITIVE_TEXT]" .. convertTextKey("TXT_KEY_CLAIM_JFD_CAUSE_SPY") .. "[ENDCOLOR]"
		end	
	else
		if returnsTT then
			numClaimCausesTT = numClaimCausesTT .. "[COLOR_FADING_NEGATIVE_TEXT]" .. convertTextKey("TXT_KEY_CLAIM_JFD_CAUSE_SPY") .. "[ENDCOLOR]"	
		end
	end 
	--Same Culture Type
	if userSettingRTPClaimsCoreCulDiv then
		if (player:GetCultureType() == minorPlayer:GetCultureType()) then
			numClaimCauses = numClaimCauses + 1
			if returnsTT then
				numClaimCausesTT = numClaimCausesTT .. "[COLOR_POSITIVE_TEXT]" .. convertTextKey("TXT_KEY_CLAIM_JFD_CAUSE_SAME_CULTURE") .. "[ENDCOLOR]"
			end	
		else
			if returnsTT then
				numClaimCausesTT = numClaimCausesTT .. "[COLOR_FADING_NEGATIVE_TEXT]" .. convertTextKey("TXT_KEY_CLAIM_JFD_CAUSE_SAME_CULTURE") .. "[ENDCOLOR]"	
			end
		end 
	end
	--Cultural Only
	if minorTraitID == minorTraitCultureID then
		if player:IsGoldenAge() then
			numClaimCauses = numClaimCauses + 1
			if returnsTT then
				numClaimCausesTT = numClaimCausesTT .. "[COLOR_POSITIVE_TEXT]" .. convertTextKey("TXT_KEY_CLAIM_JFD_CAUSE_GOLDEN_AGE") .. "[ENDCOLOR]"
			end	
		else
			if returnsTT then
				numClaimCausesTT = numClaimCausesTT .. "[COLOR_FADING_NEGATIVE_TEXT]" .. convertTextKey("TXT_KEY_CLAIM_JFD_CAUSE_GOLDEN_AGE") .. "[ENDCOLOR]"	
			end
		end 
	end
	--Maritime/Fertile Only
	if minorTraitID == minorTraitMaritimeID then
		if player:GetCapitalCity():GetPopulation() > minorCapital:GetPopulation() then
			numClaimCauses = numClaimCauses + 1
			if returnsTT then
				numClaimCausesTT = numClaimCausesTT .. "[COLOR_POSITIVE_TEXT]" .. convertTextKey("TXT_KEY_CLAIM_JFD_CAUSE_POPULATION") .. "[ENDCOLOR]"
			end	
		else
			if returnsTT then
				numClaimCausesTT = numClaimCausesTT .. "[COLOR_FADING_NEGATIVE_TEXT]" .. convertTextKey("TXT_KEY_CLAIM_JFD_CAUSE_POPULATION") .. "[ENDCOLOR]"	
			end
		end
	end
	--Mercantile Only
	if minorTraitID == minorTraitMercantileID then
		if player:HasAnyTradeRouteWith(minorPlayerID) then
			numClaimCauses = numClaimCauses + 1
			if returnsTT then
				numClaimCausesTT = numClaimCausesTT .. "[COLOR_POSITIVE_TEXT]" .. convertTextKey("TXT_KEY_CLAIM_JFD_CAUSE_TRADE_ROUTE") .. "[ENDCOLOR]"
			end	
		else
			if returnsTT then
				numClaimCausesTT = numClaimCausesTT .. "[COLOR_FADING_NEGATIVE_TEXT]" .. convertTextKey("TXT_KEY_CLAIM_JFD_CAUSE_TRADE_ROUTE") .. "[ENDCOLOR]"	
			end
		end
	end
	--Militaristic Only
	if minorTraitID == minorTraitMilitaristicID then
		if minorPlayer:CanMajorBullyGold(playerID) then
			numClaimCauses = numClaimCauses + 1
			if returnsTT then
				numClaimCausesTT = numClaimCausesTT .. "[COLOR_POSITIVE_TEXT]" .. convertTextKey("TXT_KEY_CLAIM_JFD_CAUSE_BULLY") .. "[ENDCOLOR]"
			end	
		else
			if returnsTT then
				numClaimCausesTT = numClaimCausesTT .. "[COLOR_FADING_NEGATIVE_TEXT]" .. convertTextKey("TXT_KEY_CLAIM_JFD_CAUSE_BULLY") .. "[ENDCOLOR]"	
			end
		end 
	end
	--Religious Only
	if minorTraitID == minorTraitReligiousID then
		local religionID = player:GetStateReligion()
		if (religionID > -1 and religionID == minorPlayer:GetStateReligion()) then
			numClaimCauses = numClaimCauses + 1
			if returnsTT then
				numClaimCausesTT = numClaimCausesTT .. "[COLOR_POSITIVE_TEXT]" .. convertTextKey("TXT_KEY_CLAIM_JFD_CAUSE_SAME_RELIGION") .. "[ENDCOLOR]"
			end	
		else
			if returnsTT then
				numClaimCausesTT = numClaimCausesTT .. "[COLOR_FADING_NEGATIVE_TEXT]" .. convertTextKey("TXT_KEY_CLAIM_JFD_CAUSE_SAME_RELIGION") .. "[ENDCOLOR]"	
			end
		end 
	end
	--Buildings
	local numCausesFromBuildings = 0
	for row in GameInfo.Building_JFD_ClaimMods("CauseChange <> 0") do
		if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
			local requireAllies = row.RequiresAllied
			local requireFriends = row.RequiresBefriended
			if (requireAllies and (minorIsAllies)) or (requireFriends and minorIsFriends) or ((not requireAllies) and (not requireFriends)) then
				numCausesFromBuildings = numCausesFromBuildings + row.CauseChange
			end
		end
	end
	numClaimCauses = numClaimCauses + numCausesFromBuildings
	if returnsTT then
		if numCausesFromBuildings > 0 then
			numClaimCausesTT = numClaimCausesTT .. "[COLOR_POSITIVE_TEXT]" .. convertTextKey("TXT_KEY_CLAIM_JFD_CAUSE_BUILDINGS", "+" .. numCausesFromBuildings) .. "[ENDCOLOR]"
		elseif numCausesFromBuildings < 0 then
			numClaimCausesTT = numClaimCausesTT .. "[COLOR_NEGATIVE_TEXT]" .. convertTextKey("TXT_KEY_CLAIM_JFD_CAUSE_BUILDINGS", numCausesFromBuildings) .. "[ENDCOLOR]"
		end
	end
	--Epithets
	local numCausesFromEpithets = 0
	for row in GameInfo.JFD_Epithet_ClaimMods("CauseChange <> 0") do
		if player:HasEpithet(GameInfoTypes[row.EpithetType]) then
			local requireAllies = row.RequiresAllied
			local requireFriends = row.RequiresBefriended
			if (requireAllies and (minorIsAllies)) or (requireFriends and minorIsFriends) or ((not requireAllies) and (not requireFriends)) then
				numCausesFromEpithets = numCausesFromEpithets + row.CauseChange
			end
		end
	end
	numClaimCauses = numClaimCauses + numCausesFromEpithets
	if returnsTT then
		if numCausesFromEpithets > 0 then
			numClaimCausesTT = numClaimCausesTT .. "[COLOR_POSITIVE_TEXT]" .. convertTextKey("TXT_KEY_CLAIM_JFD_CAUSE_EPITHETS", "+" .. numCausesFromEpithets) .. "[ENDCOLOR]"
		elseif numCausesFromEpithets < 0 then
			numClaimCausesTT = numClaimCausesTT .. "[COLOR_NEGATIVE_TEXT]" .. convertTextKey("TXT_KEY_CLAIM_JFD_CAUSE_EPITHETS", numCausesFromEpithets) .. "[ENDCOLOR]"
		end
	end
	--Policies
	local numCausesFromPolicies = 0
	for row in GameInfo.Policy_JFD_ClaimMods("CauseChange <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			local requireAllies = row.RequiresAllied
			local requireFriends = row.RequiresBefriended
			if (requireAllies and (minorIsAllies)) or (requireFriends and minorIsFriends) or ((not requireAllies) and (not requireFriends)) then
				numCausesFromPolicies = numCausesFromPolicies + row.CauseChange
			end
		end
	end
	numClaimCauses = numClaimCauses + numCausesFromPolicies
	if returnsTT then
		if numCausesFromPolicies > 0 then
			numClaimCausesTT = numClaimCausesTT .. "[COLOR_POSITIVE_TEXT]" .. convertTextKey("TXT_KEY_CLAIM_JFD_CAUSE_POLICIES", "+" .. numCausesFromPolicies) .. "[ENDCOLOR]"
		elseif numCausesFromPolicies < 0 then
			numClaimCausesTT = numClaimCausesTT .. "[COLOR_NEGATIVE_TEXT]" .. convertTextKey("TXT_KEY_CLAIM_JFD_CAUSE_POLICIES", numCausesFromPolicies) .. "[ENDCOLOR]"
		end
	end
	--Reforms
	local numCausesFromReforms = 0
	for row in GameInfo.JFD_Reform_ClaimMods("CauseChange <> 0") do
		if player:HasReform(GameInfoTypes[row.ReformType]) then
			local requireAllies = row.RequiresAllied
			local requireFriends = row.RequiresBefriended
			if (requireAllies and (minorIsAllies)) or (requireFriends and minorIsFriends) or ((not requireAllies) and (not requireFriends)) then
				numCausesFromReforms = numCausesFromReforms + row.CauseChange
			end
		end
	end
	numClaimCauses = numClaimCauses + numCausesFromReforms
	if returnsTT then
		if numCausesFromReforms > 0 then
			numClaimCausesTT = numClaimCausesTT .. "[COLOR_POSITIVE_TEXT]" .. convertTextKey("TXT_KEY_CLAIM_JFD_CAUSE_REFORMS", "+" .. numCausesFromReforms) .. "[ENDCOLOR]"
		elseif numCausesFromReforms < 0 then
			numClaimCausesTT = numClaimCausesTT .. "[COLOR_NEGATIVE_TEXT]" .. convertTextKey("TXT_KEY_CLAIM_JFD_CAUSE_REFORMS", numCausesFromReforms) .. "[ENDCOLOR]"
		end
	end
	--Traits
	local numCausesFromTraits = 0
	for row in GameInfo.Trait_JFD_ClaimMods("CauseChange <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			local requireAllies = row.RequiresAllied
			local requireFriends = row.RequiresBefriended
			if (requireAllies and (minorIsAllies)) or (requireFriends and minorIsFriends) or ((not requireAllies) and (not requireFriends)) then
				numCausesFromTraits = numCausesFromTraits + row.CauseChange
			end
		end
	end
	numClaimCauses = numClaimCauses + numCausesFromTraits
	if returnsTT then
		if numCausesFromTraits > 0 then
			numClaimCausesTT = numClaimCausesTT .. "[COLOR_POSITIVE_TEXT]" .. convertTextKey("TXT_KEY_CLAIM_JFD_CAUSE_TRAITS", "+" .. numCausesFromTraits) .. "[ENDCOLOR]"
		elseif numCausesFromTraits < 0 then
			numClaimCausesTT = numClaimCausesTT .. "[COLOR_NEGATIVE_TEXT]" .. convertTextKey("TXT_KEY_CLAIM_JFD_CAUSE_TRAITS", numCausesFromTraits) .. "[ENDCOLOR]"
		end
	end
	if returnsTT then
		if player:IsAtWarWith(minorPlayerID) then 
			numClaimCausesTT = numClaimCausesTT .. "[NEWLINE][NEWLINE]" .. convertTextKey("TXT_KEY_CLAIM_JFD_WARNING_AT_WAR")
		end
	end
	return numClaimCauses, numClaimCausesTT
end
--=======================================================================================================================
--=======================================================================================================================