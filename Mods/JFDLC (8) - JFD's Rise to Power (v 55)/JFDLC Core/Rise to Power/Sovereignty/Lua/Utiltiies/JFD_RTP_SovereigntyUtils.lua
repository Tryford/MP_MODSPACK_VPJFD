-- JFD_RTP_SovereigntyUtils
-- Author: JFD
-- DateCreated: 11/5/2015 11:39:54 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFDLCUtils.lua")
include("JFDLC_GlobalDefines.lua");
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
local gameSpeedID 								 = Game.GetGameSpeedType()
local gameSpeed 								 = GameInfo.GameSpeeds[gameSpeedID]
local gameSpeedMod								 = (gameSpeed.BuildPercent/100) 

local defineRTPDefaultAnarchyTurns				 = GameDefines["JFD_RTP_SOVEREIGNTY_DEFAULT_ANARCHY_TURNS"]
local defineRTPDefaultAnarchyCooldownTurns		 = GameDefines["JFD_RTP_SOVEREIGNTY_DEFAULT_ANARCHY_COOLDOWN_TURNS"]
local defineRTPDefaultLegislatureCooldown 	 	 = GameDefines["JFD_RTP_SOVEREIGNTY_DEFAULT_LEGISLATURE_COOLDOWN"]*gameSpeedMod
local defineRTPDefaultLegislatureCooldownRate 	 = GameDefines["JFD_RTP_SOVEREIGNTY_DEFAULT_LEGISLATURE_COOLDOWN_RATE"]
local defineRTPDefaultReformCooldownTurns 	 	 = GameDefines["JFD_RTP_SOVEREIGNTY_DEFAULT_REFORM_COOLDOWN"]*gameSpeedMod
local defineRTPLegitimacyPopThreshold 			 = GameDefines["JFD_RTP_SOVEREIGNTY_LEGITIMACY_POPULATION_THRESHOLD"]
local defineRTPNoLegislatureAnarchyPenalty	     = GameDefines["JFD_RTP_SOVEREIGNTY_NO_LEGISLATURE_ANARCHY_PENALTY"]
local defineRTPNoLegislatureSovereigntyPenalty   = GameDefines["JFD_RTP_SOVEREIGNTY_NO_LEGISLATURE_SOVEREIGNTY_PENALTY"]
local defineRTPReformCityStateCitiesMax 		 = GameDefines["JFD_RTP_SOVEREIGNTY_REFORM_CITY_STATE_MAX_CITIES"]
local defineRTPReformCityStateCitiesSovereignty  = GameDefines["JFD_RTP_SOVEREIGNTY_REFORM_CITY_STATE_SOVEREIGNTY"]
local defineRTPReformEmpireCitiesMin 	 		 = GameDefines["JFD_RTP_SOVEREIGNTY_REFORM_EMPIRE_MIN_CITIES"]
local defineRTPReformEmpireCitiesSovereignty 	 = GameDefines["JFD_RTP_SOVEREIGNTY_REFORM_EMPIRE_SOVEREIGNTY"]
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingEpithetsCore					= Game.GetUserSetting("JFD_RTP_EPITHETS_CORE") == 1
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local activePlayerID 				= Game.GetActivePlayer()
local activePlayer 					= Players[activePlayerID]
local activePlayerTeam 				= Teams[activePlayer:GetTeam()]
local convertTextKey 				= Locale.ConvertTextKey
local mathMax 						= math.max
local mathMin 						= math.min

local buildingDogesPalaceID  		= GameInfoTypes["BUILDING_JFD_DOGES_PALACE"]
local buildingStPetersID  			= GameInfoTypes["BUILDING_JFD_ST_PETERS"]
local buildingVersaillesID   		= GameInfoTypes["BUILDING_JFD_VERSAILLES"]

local governmentDictatorshipID 		= GameInfoTypes["GOVERNMENT_JFD_DICTATORSHIP"]
local governmentHolyRomeID 			= GameInfoTypes["GOVERNMENT_JFD_HOLY_ROME"]
local governmentMonarchyID 			= GameInfoTypes["GOVERNMENT_JFD_MONARCHY"]
local governmentRepublicID 			= GameInfoTypes["GOVERNMENT_JFD_REPUBLIC"]
local governmentShogunateID 		= GameInfoTypes["GOVERNMENT_JFD_SHOGUNATE"]
local governmentTheocracyID 		= GameInfoTypes["GOVERNMENT_JFD_THEOCRACY"]

local ideologyAutocracyID			= GameInfoTypes["POLICY_BRANCH_AUTOCRACY"]
local ideologyFreedomID	 			= GameInfoTypes["POLICY_BRANCH_FREEDOM"]
local ideologyOrderID	 			= GameInfoTypes["POLICY_BRANCH_ORDER"]

local reformCitizenshipFullID		= GameInfoTypes["REFORM_JFD_CITIZENSHIP_FULL"] 
local reformCitizenshipNoneID		= GameInfoTypes["REFORM_JFD_CITIZENSHIP_NONE"]
local reformLegitimacyTraditionID	= GameInfoTypes["REFORM_JFD_LEGITIMACY_TRADITION"]
local reformStateCityStateID		= GameInfoTypes["REFORM_JFD_STATE_CITYSTATE"]
local reformStateEmpireID			= GameInfoTypes["REFORM_JFD_STATE_EMPIRE"]
------------------------------------------------------------------------------------------------------------------------
-- SOVEREIGNTY
------------------------------------------------------------------------------------------------------------------------
--Player:CalculateSovereignty
local buildingClassChanceryID  		= GameInfoTypes["BUILDINGCLASS_JFD_CHANCERY"]
local buildingClassHighCourtID  	= GameInfoTypes["BUILDINGCLASS_JFD_HIGH_COURT"]
local buildingClassMonasteryID  	= GameInfoTypes["BUILDINGCLASS_MONASTERY"]
local loyaltyPatrioticID 			= GameInfoTypes["LOYALTY_JFD_PATRIOTIC"]
local yieldSovereigntyID			= GameInfoTypes["YIELD_JFD_SOVEREIGNTY"]
function Player.CalculateSovereignty(player, returnsTT)
	local capital = player:GetCapitalCity()
	if (not capital) then return 0 end
	local isHuman = player:IsHuman()
	if (not player:HasGovernment()) then return 0 end
	local governmentID = player:GetGovernment()
	local religionID = player:GetStateReligion()
	local numCities = player:GetNumCities()
	local hasNoCitizenship = player:HasReform(reformCitizenshipNoneID)
	if hasNoCitizenship then numCities = numCities - player:GetNumPuppetCities() end
	local hasTradition = player:HasReform(reformLegitimacyTraditionID)
	local sovereignty = 0
	local sovereigntyTT = "[NEWLINE]"
	local sovPerPolicies = player:GetYieldRateModifier(yieldSovereigntyID)
	local sovPerGA = 0
	if player:IsGoldenAge() then
	for row in GameInfo.Policy_GoldenAgeYieldMod("YieldType = 'YIELD_JFD_SOVEREIGNTY' AND Yield <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			sovPerGA = sovPerGA + row.Yield
		end
	end
	end
	local sovPerCities = 0
	local sovFromLegitimaciesMod = player:GetLegitimacySovereigntyModifier()
	local pietyLevelID = player:GetPietyLevel()
	local pietyLevel = nil
	if pietyLevelID then
		pietyLevel = GameInfo.JFD_PietyLevels[pietyLevelID].Type
	end
	local numGreatWorks = 0
	local numTradeRoutes = 0
	local numConnections = 0
	local numGarrisons = 0
	local numSpecialists = 0
	local numHighCourt = 0
	local numPopulation = 0
	local numStateReligion = 0
	local numExcessHappiness = 0
	local numPatriotic = 0
	local numChanceries = 0
	local numMonasteries = 0
	if player:HasReform(reformStateCityStateID) then
		if player:GetNumCities() > defineRTPReformCityStateCitiesMax then
			sovereignty = sovereignty - defineRTPReformCityStateCitiesSovereignty
			if returnsTT then
				sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_SOVEREIGNTY_FROM_CITY_STATE_NEGATIVE", "[COLOR_NEGATIVE_TEXT]", "-" .. defineRTPReformCityStateCitiesSovereignty, defineRTPReformCityStateCitiesMax+1)
			end
		else
			sovereignty = sovereignty + defineRTPReformCityStateCitiesSovereignty
			if returnsTT then
				sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_SOVEREIGNTY_FROM_CITY_STATE_POSITIVE", "[COLOR_POSITIVE_TEXT]", "+" .. defineRTPReformCityStateCitiesSovereignty, defineRTPReformCityStateCitiesMax)
			end
		end	
	elseif player:HasReform(reformStateEmpireID) then
		if player:GetNumCities() < defineRTPReformEmpireCitiesMin then
			sovereignty = sovereignty - defineRTPReformEmpireCitiesSovereignty
			if returnsTT then
				sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_SOVEREIGNTY_FROM_EMPIRE_NEGATIVE", "[COLOR_NEGATIVE_TEXT]", "-" .. defineRTPReformEmpireCitiesSovereignty, defineRTPReformEmpireCitiesMin-1)
			end
		else
			sovereignty = sovereignty + defineRTPReformEmpireCitiesSovereignty
			if returnsTT then
				sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_SOVEREIGNTY_FROM_EMPIRE_POSITIVE", "[COLOR_POSITIVE_TEXT]", "+" .. defineRTPReformEmpireCitiesSovereignty, defineRTPReformEmpireCitiesMin)
			end
		end	
	end
	if isHuman then
		for city in player:Cities() do
			if (hasNoCitizenship and (not city:IsPuppet()) or (not hasNoCitizenship)) then
				sovPerCities = sovPerCities + city:GetYieldRateModifier(yieldSovereigntyID)
				--Legitimacies (First)
				if (player:IsCapitalConnectedToCity(city) or city:IsCapital()) then numConnections = numConnections + 1 end
				if city:GetGarrisonedUnit() then numGarrisons = numGarrisons + 1 end
				if city:GetTotalSpecialistCount() > 0 then numSpecialists = numSpecialists + 1 end
				--Legitimacies (Second)
				if city:GetPopulation() >= defineRTPLegitimacyPopThreshold then numPopulation = numPopulation + 1 end
				if (religionID > 0 and city:GetReligiousMajority() == religionID) then numStateReligion = numStateReligion + 1 end
				--Legitimacies (Third)
				local excessHappiness, excessUnhappiness = player:GetCityExcessHappiness(city, true)
				if excessHappiness > excessUnhappiness then numExcessHappiness = numExcessHappiness + 1 end
				if city:HasLoyaltyState(loyaltyPatrioticID) then numPatriotic = numPatriotic + 1 end	
			end
			--Doge's Palace
			if player:HasBuilding(buildingDogesPalaceID) then
				if (city:HasTradeRouteFromAnyCity() or city:HasTradeRouteToAnyCity()) then numTradeRoutes = numTradeRoutes + 1 end
			end
			--Versailles
			if player:HasBuilding(buildingVersaillesID) then
				if city:GetNumGreatWorks() > 0 then numGreatWorks = numGreatWorks + 1 end
			end
		end
	else
		sovPerCities = sovPerCities + capital:GetYieldRateModifier(yieldSovereigntyID)
		--Legitimacies (First)
		numConnections = numConnections + 1
		if capital:GetGarrisonedUnit() then numGarrisons = numGarrisons + 1 end
		if capital:GetTotalSpecialistCount() > 0 then numSpecialists = numSpecialists + 1 end
		--Legitimacies (Second)
		if capital:GetPopulation() >= defineRTPLegitimacyPopThreshold then numPopulation = numPopulation + 1 end
		if (religionID > 0 and capital:GetReligiousMajority() == religionID) then numStateReligion = numStateReligion + 1 end
		--Legitimacies (Third)
		local excessHappiness, excessUnhappiness = player:GetCityExcessHappiness(capital, true)
		if excessHappiness > excessUnhappiness then numExcessHappiness = numExcessHappiness + 1 end
		if capital:HasLoyaltyState(loyaltyPatrioticID) then numPatriotic = numPatriotic + 1 end	
		--Doge's Palace
		if capital:HasBuilding(buildingDogesPalaceID) then
			if (capital:HasTradeRouteFromAnyCity() or capital:HasTradeRouteToAnyCity()) then numTradeRoutes = numTradeRoutes + 1 end
		end
		--Versailles
		if capital:HasBuilding(buildingVersaillesID) then
			if capital:GetNumGreatWorks() > 0 then numGreatWorks = numGreatWorks + 1 end
		end
	end
	sovereignty = sovereignty + sovPerPolicies
	sovereignty = sovereignty + sovPerCities
	sovereignty = sovereignty + sovPerGA
	if (sovPerPolicies ~= 0 and returnsTT) then
		if sovPerPolicies > 0 then sovPerPolicies = "+" .. sovPerPolicies	end
		sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_SOVEREIGNTY_FROM_POLICIES_REFORMS", sovPerPolicies)
	end
	if (sovPerGA ~= 0 and returnsTT) then
		if sovPerGA > 0 then sovPerGA = "+" .. sovPerGA	end
		sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_SOVEREIGNTY_FROM_GOLDEN_AGE", sovPerGA)
	end
	if (sovPerCities ~= 0 and returnsTT) then
		if sovPerCities > 0 then sovPerCities = "+" .. sovPerCities	end
		sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_SOVEREIGNTY_FROM_CITIES", sovPerCities)
	end
	for row in GameInfo.Building_JFD_SovereigntyMods("IsSovereignty = 1") do
		if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
			--Doge's Palace
			local sovWhenTradeRoutes = row.SovereigntyWhenTradeRoutes
			if sovWhenTradeRoutes > 0 then 
				local textHighlight = "[COLOR_POSITIVE_TEXT]"
				if numTradeRoutes == 0 then sovWhenTradeRoutes = 0 end 
				if (isHuman and numTradeRoutes < numCities) then sovWhenTradeRoutes = 0 textHighlight = "[COLOR_NEGATIVE_TEXT]" end
				sovereignty = sovereignty + sovWhenTradeRoutes
				sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey(row.Help, textHighlight, sovWhenTradeRoutes)
			end
			--St Peters
			local sovWhenPietyLevel = row.SovereigntyWhenPietyLevel
			if sovWhenPietyLevel > 0 then 
				local textHighlight = "[COLOR_POSITIVE_TEXT]"
				if pietyLevelID < GameInfoTypes[row.SovereigntyWhenPietyLevelReq] then sovWhenPietyLevel = 0 textHighlight = "[COLOR_NEGATIVE_TEXT]" end
				sovereignty = sovereignty + sovWhenPietyLevel
				sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey(row.Help, textHighlight, sovWhenPietyLevel)
			end
			--Versailles
			local sovWhenGreatWorks = row.SovereigntyWhenGreatWorks
			if sovWhenGreatWorks > 0 then 
				local textHighlight = "[COLOR_POSITIVE_TEXT]"
				if numGreatWorks == 0 then sovWhenGreatWorks = 0 end 
				if (isHuman and numGreatWorks < numCities) then sovWhenGreatWorks = 0 textHighlight = "[COLOR_NEGATIVE_TEXT]" end
				sovereignty = sovereignty + sovWhenGreatWorks
				sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey(row.Help, textHighlight, sovWhenGreatWorks)
			end
		end	
	end
	local sovWhenTradition = 0
	for row in GameInfo.JFD_Reform_Legitimacies() do
		if player:HasReform(GameInfoTypes[row.ReformType]) then
			--Legitimacies (First)
			local sovWhenConnected = row.SovereigntyWhenConnected
			if sovWhenConnected > 0 then 
				local textHighlight = "[COLOR_POSITIVE_TEXT]"
				if numConnections == 0 then sovWhenConnected = 0 end 
				if (isHuman and numConnections < numCities) then sovWhenConnected = 0 textHighlight = "[COLOR_NEGATIVE_TEXT]" end
				if (hasTradition and sovWhenConnected > 0) then sovWhenTradition = sovWhenTradition + row.SovereigntyWhenTradition end
				if sovFromLegitimaciesMod ~= 0 then sovWhenConnected = sovWhenConnected + Game.GetRound((sovWhenConnected*sovFromLegitimaciesMod)/100) end
				sovereignty = sovereignty + sovWhenConnected
				sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey(row.Help, textHighlight, sovWhenConnected)
			end
			local sovWhenGarrisoned = row.SovereigntyWhenGarrisoned
			if sovWhenGarrisoned > 0 then
				local textHighlight = "[COLOR_POSITIVE_TEXT]"
				if numGarrisons == 0 then sovWhenGarrisoned = 0 end 
				if (isHuman and numGarrisons < numCities) then sovWhenGarrisoned = 0 textHighlight = "[COLOR_NEGATIVE_TEXT]" end
				if (hasTradition and sovWhenGarrisoned > 0) then sovWhenTradition = sovWhenTradition + row.SovereigntyWhenTradition end
				if sovFromLegitimaciesMod ~= 0 then sovWhenGarrisoned = sovWhenGarrisoned + Game.GetRound((sovWhenGarrisoned*sovFromLegitimaciesMod)/100) end
				sovereignty = sovereignty + sovWhenGarrisoned
				if returnsTT then
					sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey(row.Help, textHighlight, sovWhenGarrisoned)
				end
			end
			local sovWhenSpecialist = row.SovereigntyWhenSpecialist
			if sovWhenSpecialist > 0 then 
				local textHighlight = "[COLOR_POSITIVE_TEXT]"
				if numSpecialists == 0 then sovWhenSpecialist = 0 end 
				if (isHuman and numSpecialists < numCities) then sovWhenSpecialist = 0 textHighlight = "[COLOR_NEGATIVE_TEXT]" end
				if (hasTradition and sovWhenSpecialist > 0) then sovWhenTradition = sovWhenTradition + row.SovereigntyWhenTradition end
				if sovFromLegitimaciesMod ~= 0 then sovWhenSpecialist = sovWhenSpecialist + Game.GetRound((sovWhenSpecialist*sovFromLegitimaciesMod)/100) end
				sovereignty = sovereignty + sovWhenSpecialist
				if returnsTT then
					sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey(row.Help, textHighlight, sovWhenSpecialist)
				end
			end
			--Legitimacies (Second)
			local sovWhenHighCourts = row.SovereigntyWhenHighCourt
			if sovWhenHighCourts > 0 then 
				local textHighlight = "[COLOR_POSITIVE_TEXT]"
				if hasTradition then sovWhenTradition = sovWhenTradition + row.SovereigntyWhenTradition end
				local numHighCourts = player:GetBuildingClassCount(buildingClassHighCourtID)
				if numHighCourts == 0 then sovWhenHighCourts = 0 end 
				if (isHuman and numHighCourts < numCities) then sovWhenHighCourts = 0 textHighlight = "[COLOR_NEGATIVE_TEXT]" end
				if (hasTradition and sovWhenHighCourts > 0) then sovWhenTradition = sovWhenTradition + row.SovereigntyWhenTradition end
				if sovFromLegitimaciesMod ~= 0 then sovWhenHighCourts = sovWhenHighCourts + Game.GetRound((sovWhenHighCourts*sovFromLegitimaciesMod)/100) end
				sovereignty = sovereignty + sovWhenHighCourts
				if returnsTT then
					sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey(row.Help, textHighlight, sovWhenHighCourts)
				end
			end
			local sovWhenPopulation = row.SovereigntyWhenPopulation
			if sovWhenPopulation > 0 then 
				local textHighlight = "[COLOR_POSITIVE_TEXT]"
				if numPopulation == 0 then sovWhenPopulation = 0 end 
				if (isHuman and numPopulation < numCities) then sovWhenPopulation = 0 textHighlight = "[COLOR_NEGATIVE_TEXT]" end
				if (hasTradition and sovWhenPopulation > 0) then sovWhenTradition = sovWhenTradition + row.SovereigntyWhenTradition end
				if sovFromLegitimaciesMod ~= 0 then sovWhenPopulation = sovWhenPopulation + Game.GetRound((sovWhenPopulation*sovFromLegitimaciesMod)/100) end
				sovereignty = sovereignty + sovWhenPopulation
				if returnsTT then
					sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey(row.Help, textHighlight, sovWhenPopulation, defineRTPLegitimacyPopThreshold)
				end
			end
			local sovWhenStateReligion = row.SovereigntyWhenStateReligion
			if sovWhenStateReligion > 0 then 
				local textHighlight = "[COLOR_POSITIVE_TEXT]"
				if numStateReligion == 0 then sovWhenStateReligion = 0 end 
				if (isHuman and numStateReligion < numCities) then sovWhenStateReligion = 0 textHighlight = "[COLOR_NEGATIVE_TEXT]" end
				if (hasTradition and sovWhenStateReligion > 0) then sovWhenTradition = sovWhenTradition + row.SovereigntyWhenTradition end
				if sovFromLegitimaciesMod ~= 0 then sovWhenStateReligion = sovWhenStateReligion + Game.GetRound((sovWhenStateReligion*sovFromLegitimaciesMod)/100) end
				sovereignty = sovereignty + sovWhenStateReligion
				if returnsTT then
					sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey(row.Help, textHighlight, sovWhenStateReligion)
				end
			end
			--Legitimacies (Third)
			local sovWhenExcessHappiness = row.SovereigntyWhenExcessHappiness
			if sovWhenExcessHappiness > 0 then 
				local textHighlight = "[COLOR_POSITIVE_TEXT]"
				if numExcessHappiness == 0 then sovWhenExcessHappiness = 0 end 
				if (isHuman and numExcessHappiness < numCities) then sovWhenExcessHappiness = 0 textHighlight = "[COLOR_NEGATIVE_TEXT]" end
				if (hasTradition and sovWhenExcessHappiness > 0) then sovWhenTradition = sovWhenTradition + row.SovereigntyWhenTradition end
				if sovFromLegitimaciesMod ~= 0 then sovWhenExcessHappiness = sovWhenExcessHappiness + Game.GetRound((sovWhenExcessHappiness*sovFromLegitimaciesMod)/100) end
				sovereignty = sovereignty + sovWhenExcessHappiness
				if returnsTT then
					sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey(row.Help, textHighlight, sovWhenExcessHappiness)
				end
			end
			local sovWhenPatriotic = row.SovereigntyWhenPatriotic
			if sovWhenPatriotic > 0 then 
				local textHighlight = "[COLOR_POSITIVE_TEXT]"
				if numPatriotic == 0 then sovWhenPatriotic = 0 end 
				if (isHuman and numPatriotic < numCities) then sovWhenPatriotic = 0 textHighlight = "[COLOR_NEGATIVE_TEXT]" end
				if (hasTradition and sovWhenPatriotic > 0) then sovWhenTradition = sovWhenTradition + row.SovereigntyWhenTradition end
				if sovFromLegitimaciesMod ~= 0 then sovWhenPatriotic = sovWhenPatriotic + Game.GetRound((sovWhenPatriotic*sovFromLegitimaciesMod)/100) end
				sovereignty = sovereignty + sovWhenPatriotic
				if returnsTT then
					sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey(row.Help, textHighlight, sovWhenPatriotic)
				end
			end
			if row.ReformType == 'REFORM_JFD_LEGITIMACY_TRADITION' then
				local textHighlight = "[COLOR_POSITIVE_TEXT]"
				if sovWhenTradition <= 0 then textHighlight = "[COLOR_NEGATIVE_TEXT]" end
				if sovFromLegitimaciesMod ~= 0 then sovWhenTradition = sovWhenTradition + Game.GetRound((sovWhenTradition*sovFromLegitimaciesMod)/100) end
				sovereignty = sovereignty + sovWhenTradition
				if returnsTT then
					sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey(row.Help, textHighlight, sovWhenTradition)
				end
			end
			--Misc.
			local sovWhenChanceries = row.SovereigntyWhenChanceries
			if sovWhenChanceries > 0 then 
				local textHighlight = "[COLOR_POSITIVE_TEXT]"
				local numChanceries = player:GetBuildingClassCount(buildingClassChanceryID)
				if numChanceries == 0 then sovWhenChanceries = 0 end 
				if (isHuman and numChanceries < numCities) then sovWhenChanceries = 0 textHighlight = "[COLOR_NEGATIVE_TEXT]" end
				sovereignty = sovereignty + sovWhenChanceries
				if returnsTT then
					sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey(row.Help, textHighlight, sovWhenChanceries)
				end
			end
			local sovWhenMonasteries = row.SovereigntyWhenMonasteries
			if sovWhenMonasteries > 0 then 
				local textHighlight = "[COLOR_POSITIVE_TEXT]"
				local numMonasteries = player:GetBuildingClassCount(buildingClassMonasteryID)
				if numMonasteries == 0 then sovWhenMonasteries = 0 end 
				if (isHuman and numMonasteries < numCities) then sovWhenMonasteries = 0 textHighlight = "[COLOR_NEGATIVE_TEXT]" end
				sovereignty = sovereignty + sovWhenMonasteries
				if returnsTT then
					sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey(row.Help, textHighlight, sovWhenMonasteries)
				end
			end
		end
	end
	--===============================
	--JFD's Top Panel Addins BEGIN
	--===============================
	--This is for any extra Sovereignty addins
	for row in GameInfo.JFD_TopPanelAdditions("YieldType = 'YIELD_JFD_SOVEREIGNTY'") do
		local yieldSourceFunction = row.YieldSourceFunction
		if yieldSourceFunction then
			local numSovereignty = loadstring("return " .. yieldSourceFunction .. "(Game.GetActivePlayer())")()
			if numSovereignty > 0 then
				local prereqCivilization = row.CivilizationType 
				if prereqCivilization then
					local prereqCivilizationID = GameInfoTypes[prereqCivilization]
					if activePlayer:GetCivilizationType() == prereqCivilizationID then
						local yieldToolTip = row.YieldSourceToolTip
						if yieldToolTip then
							local yieldToolTipText = convertTextKey(yieldToolTip, numSovereignty)
							sovereignty = sovereignty + numSovereignty
							sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. yieldToolTipText
						end
					end
				end
				if (not prereqCivilization) then
					local yieldToolTip = row.YieldSourceToolTip
					if yieldToolTip then
						local yieldToolTipText = convertTextKey(yieldToolTip, numSovereignty)
						sovereignty = sovereignty + numSovereignty
						sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. yieldToolTipText
					end
				end	
			end
		end
	end
	--===============================
	--JFD's Top Panel Addins END
	--===============================
	--Government Legitimacy Mods
	if (sovFromLegitimaciesMod ~= 0 and returnsTT) then
		local textHL = "[COLOR_NEGATIVE_TEXT]"
		if sovFromLegitimaciesMod > 0 then textHL = "[COLOR_POSITIVE_TEXT]" end
		sovereigntyTT = sovereigntyTT .. convertTextKey("TXT_KEY_JFD_SOVEREIGNTY_FROM_GOVERNMENT", textHL, sovFromLegitimaciesMod)
	end
	if returnsTT then 
		sovereigntyTT = sovereigntyTT .. "[NEWLINE][NEWLINE]" .. convertTextKey("TXT_KEY_JFD_SOVEREIGNTY_LEGITIMACY_HINT")
	end
	local maxSovereignty = player:GetMaxSovereignty()
	if sovereignty > maxSovereignty then sovereignty = maxSovereignty end
	return mathMax(sovereignty,0), sovereigntyTT
end

--Player:GetMaxSovereignty
function Player.GetMaxSovereignty(player)
	local maxSovereignty = 0
	if (not GameInfo) then return end
	for row in GameInfo.JFD_Governments("MaxSovChange <> 0") do
		if player:GetGovernment() == row.ID then
			maxSovereignty = maxSovereignty + row.MaxSovChange
		end
	end
	for row in GameInfo.Building_JFD_SovereigntyMods("MaxSovChange <> 0") do
		if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
			maxSovereignty = maxSovereignty + row.MaxSovChange
		end
	end
	for row in GameInfo.Policy_JFD_SovereigntyMods("MaxSovChange <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			maxSovereignty = maxSovereignty + row.MaxSovChange
		end
	end
	for row in GameInfo.JFD_Reforms("MaxSovChange <> 0") do
		if player:HasReform(row.ID) then
			maxSovereignty = maxSovereignty + row.MaxSovChange
		end
	end
	return maxSovereignty
end

--Player:GetLegitimacySovereigntyModifier
function Player.GetLegitimacySovereigntyModifier(player)
	local legitimacySovMod = 0
	for row in GameInfo.JFD_Governments("LegitimacySovMod <> 0") do
		if player:GetGovernment() == row.ID then
			legitimacySovMod = legitimacySovMod + row.LegitimacySovMod
		end
	end
	for row in GameInfo.Building_JFD_SovereigntyMods("LegitimacySovMod <> 0") do
		if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
			legitimacySovMod = legitimacySovMod + row.LegitimacySovMod
		end
	end
	for row in GameInfo.Policy_JFD_SovereigntyMods("LegitimacySovMod <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			legitimacySovMod = legitimacySovMod + row.LegitimacySovMod
		end
	end
	for row in GameInfo.JFD_Reforms("LegitimacySovMod <> 0") do
		if player:HasReform(row.ID) then
			legitimacySovMod = legitimacySovMod + row.LegitimacySovMod
		end
	end
	return legitimacySovMod
end
-------------------------------
-- TOP PANEL
-------------------------------
--Player:GetSovereigntyTopPanelInfoTT
function Player.GetSovereigntyTopPanelInfoTT(player)
	local sovereigntyTT = convertTextKey("TXT_KEY_JFD_SOVEREIGNTY_TOP_PANEL_TT_GOVERNMENT_NONE")
	local governmentID = player:GetGovernment()
	local government = GameInfo.JFD_Governments[governmentID]
	sovereigntyTT = convertTextKey("TXT_KEY_JFD_SOVEREIGNTY_TOP_PANEL_" .. government.Type .. "_TT")
	local govtCooldown = player:GetGovernmentCooldown()
	if govtCooldown > 0 then
		sovereigntyTT = sovereigntyTT .. " " .. convertTextKey("TXT_KEY_JFD_SOVEREIGNTY_TOP_PANEL_LEGISLATURE", govtCooldown)	
	end
	local reformCooldown = player:GetReformCooldown()
	if reformCooldown > 0 then
		if govtCooldown <= 0 then sovereigntyTT = sovereigntyTT .. "[NEWLINE]" end
		sovereigntyTT = sovereigntyTT .. "[NEWLINE]".. convertTextKey("TXT_KEY_JFD_SOVEREIGNTY_TOP_PANEL_REFORM", reformCooldown)	
		sovereigntyTT = sovereigntyTT .. "[NEWLINE]"
	else
		if govtCooldown <= 0 then sovereigntyTT = sovereigntyTT .. "[NEWLINE]" end
		sovereigntyTT = sovereigntyTT .. "[NEWLINE]".. convertTextKey("TXT_KEY_JFD_SOVEREIGNTY_TOP_PANEL_REFORM_NONE")	
		sovereigntyTT = sovereigntyTT .. "[NEWLINE]"
	end
	sovereigntyTT = sovereigntyTT .. "[NEWLINE]"
	sovereigntyTT = sovereigntyTT .. convertTextKey("TXT_KEY_JFD_SOVEREIGNTY_TOP_PANEL_TOTAL", player:GetSovereignty(), player:GetMaxSovereignty())
	local sovereignty, sovTT = player:CalculateSovereignty(true)
	sovereigntyTT = sovereigntyTT .. sovTT
	sovereigntyTT = sovereigntyTT .. "[NEWLINE][NEWLINE]" .. convertTextKey("TXT_KEY_JFD_SOVEREIGNTY_TOP_PANEL_NOTE")
	return sovereigntyTT
end
------------------------------------------------------------------------------------------------------------------------
-- GOVERNMENT
------------------------------------------------------------------------------------------------------------------------
--Player:CanHaveAnyGovernment
function Player.CanHaveAnyGovernment(player)
	if player:IsBarbarian() then return false end
	if player:HasGovernment() then return false end
	local hasEarlyFound = false
	for building in GameInfo.Buildings("FoundsGovernment > 0") do
		if player:HasBuilding(building.ID) then hasEarlyFound = true end
	end
	return (player:HasTechnologyRequiredForUnlock("AllowGovernments") or hasEarlyFound)
end

--Player:CanHaveGovernment
function Player.CanHaveGovernment(player, governmentID, skipsAnyGovernment)
	local government = GameInfo.JFD_Governments[governmentID]
	if ((not skipsAnyGovernment) and (not player:CanHaveAnyGovernment())) then return false end
	local reqBuilding = government.RequiresBuilding
	if reqBuilding and (not player:HasBuilding(GameInfoTypes[reqBuilding])) then return false end
	if government.RequiresIdeology and player:GetLateGamePolicyTree() <= 0 then return false end
	local reqReligion = government.RequiresReligion
	if reqReligion then
		if (not player:HasStateReligion()) then return false end
		if player:GetReligionCreatedByPlayer() <= 0 then return false end
		if player:GetStateReligion() ~= player:GetReligionCreatedByPlayer() then return false end
	end
	if government.IsUnique then
		for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			if otherPlayer:IsAlive() and otherPlayer:GetGovernment() == governmentID then
				return false
			end
		end
	end
	return true
end

--Player:CanChangeGovernment
function Player.CanChangeGovernment(player)
	if player:IsAnarchy() then
		return false, Locale.ConvertTextKey("TXT_KEY_JFD_CHANGE_GOVERNMENT_DISABLED_ANARCHY")
	end
	local maxSovereignty = player:GetMaxSovereignty()
	local numFreeChanges = player:GetNumFreeGovernmentChanges()
	if numFreeChanges > 0 then 
		return true, Locale.ConvertTextKey("TXT_KEY_JFD_CHANGE_GOVERNMENT_FREE_SWITCHES", numFreeChanges, maxSovereignty) 
	end
	if player:GetReformCooldown() ~= 0 then
		return false, Locale.ConvertTextKey("TXT_KEY_JFD_CHANGE_GOVERNMENT_DISABLED_REFORM_COOLDOWN")
	end
	if player:GetSovereignty() < maxSovereignty then
		return false, Locale.ConvertTextKey("TXT_KEY_JFD_CHANGE_GOVERNMENT_DISABLED_SOVEREIGNTY", maxSovereignty)
	end
	return true
end
----------------
-- AI PREFERENCE
----------------
--Player:GetGovernmentPreference
function Player.GetGovernmentPreference(player)
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	local count = 1
	local governmentPrefs = {}
	local governmentPrefID = -1
	local governmentWeight = 0
	for row in GameInfo.Civilization_JFD_Governments("CivilizationType = '" .. civType .. "' AND GovernmentType IS NOT NULL") do
		if GameInfoTypes[row.GovernmentType] then
			governmentPrefs[count] = {}
			governmentPrefs[count].ID = GameInfoTypes[row.GovernmentType]
			governmentPrefs[count].Weight = row.Weight
			count = count + 1
		end
	end
	if #governmentPrefs == 0 then
		local cultureID = player:GetCultureType()
		local cultureType = GameInfo.JFD_CultureTypes[cultureID].Type
		for row in GameInfo.JFD_CultureType_Governments("CultureType = '" .. cultureType .. "' AND GovernmentType IS NOT NULL") do
			governmentPrefs[count] = {}
			governmentPrefs[count].ID = GameInfoTypes[row.GovernmentType]
			governmentPrefs[count].Weight = row.Weight
			count = count + 1
		end
	end
	for _, government in ipairs(governmentPrefs) do
		if player:CanHaveGovernment(government.ID, true) then
			governmentPrefID = government.ID
			governmentWeight = government.Weight
			break
		end
	end
	if governmentPrefID <= -1 then governmentPrefID = governmentMonarchyID end
	if Game.GetRandom(1,100) <= governmentWeight then
		return governmentPrefID
	else	
		if Game.GetRandom(1,2) == 1 then 
			return governmentMonarchyID
		else
			return governmentRepublicID
		end
	end
end
----------------
-- FREE CHANGES
----------------
--Player:GetNumFreeGovernmentChanges
function Player.GetNumFreeGovernmentChanges(player)
	return JFDLC_FreeGovtSwitches[player:GetID()] or 0
end

--Player:ChangeNumFreeGovernmentChanges
function Player.ChangeNumFreeGovernmentChanges(player, numGovtChanges)
	local currentNum = player:GetNumFreeGovernmentChanges()
	player:SetNumFreeGovernmentChanges(currentNum+numGovtChanges)
end

--Player:SetNumFreeGovernmentChanges
function Player.SetNumFreeGovernmentChanges(player, numGovtChanges)
	JFDLC_FreeGovtSwitches[player:GetID()] = numGovtChanges
end
----------------
-- LEGISLATURE
----------------
--Player:HasLegislature
function Player.HasLegislature(player)
	for reform in GameInfo.JFD_Reforms("IsLegislature = 1") do
		if player:HasReform(reform.ID) then
			return true
		end
	end
	return false
end

--Player:ResetLegislature
function Player.ResetLegislature(player, ideologyID, isHuman)
	if (isHuman and (not player:IsHuman())) then return end
	for reform in GameInfo.JFD_Reforms("ResetsAssembly = 1 OR ResetsHolySynod = 1 OR ResetsImperialCourt = 1 OR ResetsImperialDiet = 1 OR ResetsParliament = 1 OR ResetsSenate = 1") do
		if player:HasReform(reform.ID) then
			if reform.ResetsAssembly then
				player:ComposeAssembly(ideologyID)
				break
			end
			if reform.ResetsHolySynod then
				player:ComposeHolySynod(ideologyID)
				break
			end
			if reform.ResetsImperialCourt then
				player:ComposeImperialCourt(ideologyID)
				break
			end
			if reform.ResetsImperialDiet then
				player:ComposeImperialDiet(ideologyID)
				break
			end
			if reform.ResetsParliament then
				player:ComposeParliament(ideologyID)
				break
			end
			if reform.ResetsSenate then
				player:ComposeSenate(ideologyID)
				break
			end
		end
	end
end
----------------
-- MONARCHY
----------------
--Player:ComposeParliament
--Aristocratic
local politicBurgherD 					= GameInfoTypes["PARTY_JFD_BURGHERS"]
local politicClergyID 					= GameInfoTypes["PARTY_JFD_CLERGY"]
local politicNobilityID 				= GameInfoTypes["PARTY_JFD_NOBILITY"]
--Parliamentary		
local politicConservativeID				= GameInfoTypes["PARTY_JFD_CONSERVATIVE"]
local politicLiberalID 					= GameInfoTypes["PARTY_JFD_LIBERAL"]
local politicReactionaryID 				= GameInfoTypes["PARTY_JFD_REACTIONARY"]
local politicSocialistID 				= GameInfoTypes["PARTY_JFD_SOCIALIST"]
--(Extremists)		
local politicCommunistID 				= GameInfoTypes["PARTY_JFD_COMMUNIST"]
local politicFascistID 					= GameInfoTypes["PARTY_JFD_FASCIST"]
local politicLibertarianID 				= GameInfoTypes["PARTY_JFD_LIBERTARIAN"]
--(Revolutionaries)		
local politicRevolutionariesID			= GameInfoTypes["PARTY_JFD_REVOLUTIONARY"]
		
local specialistArtistID				= GameInfoTypes["SPECIALIST_ARTIST"]
local specialistCitizenID				= GameInfoTypes["SPECIALIST_CITIZEN"]
local specialistDoctorID				= GameInfoTypes["SPECIALIST_JFD_DOCTOR"]
local specialistEngineerID				= GameInfoTypes["SPECIALIST_ENGINEER"]
local specialistMerchantID				= GameInfoTypes["SPECIALIST_MERCHANT"]
local specialistMonkID					= GameInfoTypes["SPECIALIST_JFD_MONK"]
local specialistMusicianID				= GameInfoTypes["SPECIALIST_MUSICIAN"]
local specialistScientistID				= GameInfoTypes["SPECIALIST_SCIENTIST"]
local specialistWriterID				= GameInfoTypes["SPECIALIST_WRITER"]
local yieldCultureID 					= GameInfoTypes["YIELD_CULTURE"]
local yieldFaithID 						= GameInfoTypes["YIELD_FAITH"]
local yieldFoodID 						= GameInfoTypes["YIELD_FOOD"]
local yieldGoldID  						= GameInfoTypes["YIELD_GOLD"]
local yieldProductionID  				= GameInfoTypes["YIELD_PRODUCTION"]
local yieldScienceID  					= GameInfoTypes["YIELD_SCIENCE"]

local reformMLegislatureAristocraticID  = GameInfoTypes["REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC"]
local reformMLegislatureParliamentaryID = GameInfoTypes["REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY"]
local reformFactionsControlledID  		= GameInfoTypes["REFORM_JFD_FACTIONS_M_CONTROLLED"]
local reformFactionsRegulatedID 		= GameInfoTypes["REFORM_JFD_FACTIONS_M_REGULATED"]
local reformFactionsUncontrolledID 		= GameInfoTypes["REFORM_JFD_FACTIONS_M_UNCONTROLLED"]
local reformFactionsClergyID 			= GameInfoTypes["REFORM_JFD_FACTIONS_M_CLERGY"]
local reformFactionsNoneID 				= GameInfoTypes["REFORM_JFD_FACTIONS_M_NONE"]
local reformFactionsNobleID  			= GameInfoTypes["REFORM_JFD_FACTIONS_M_NOBLE"]

local yieldFoodID						= GameInfoTypes["YIELD_FOOD"]
local yieldProductionID					= GameInfoTypes["YIELD_PRODUCTION"]
function Player.ComposeParliament(player, ideologyID)
	local playerID = player:GetID()
	local governmentID = player:GetGovernment()
	local government = GameInfo.JFD_Governments[governmentID]
	local factionSovMod = player:GetFactionSovereigntyModifier()
	local numCities = player:GetNumCities()
	for row in GameInfo.JFD_Politics() do
		player:SetPoliticPercent(row.ID, 0)
	end
	if player:HasReform(reformMLegislatureAristocraticID) then
		local yieldBurgher 				= (player:CalculateGrossGold()	+player:GetTotalJONSCulturePerTurn())
		local yieldClergy 				= (player:GetTotalFaithPerTurn()+player:GetScience())
		local yieldNobility 			= (player:GetTotalYieldRate(yieldFoodID)+player:GetTotalYieldRate(yieldProductionID))
		local yieldRevolutionary 		= (mathMax((player:GetUnhappiness()-player:GetHappiness()),0)+player:GetPublicOpinionUnhappiness())
		local yieldTotal 				= (yieldBurgher+yieldClergy+yieldNobility+yieldRevolutionary)
		local percentBurgher 			= Game.GetRound((yieldBurgher/yieldTotal)*100)	
		local percentClergy 			= Game.GetRound((yieldClergy/yieldTotal)*100)	
		local percentNobility 			= Game.GetRound((yieldNobility/yieldTotal)*100)	
		local percentRevolutionaries 	= Game.GetRound((yieldRevolutionary/yieldTotal)*100)	
		if factionSovMod ~= 0 then
			percentBurgher 			= percentBurgher 		 + Game.GetRound((percentBurgher*factionSovMod)/100)
			percentClergy 			= percentClergy 		 + Game.GetRound((percentClergy*factionSovMod)/100)
			percentNobility 		= percentNobility 		 + Game.GetRound((percentNobility*factionSovMod)/100)
			percentRevolutionaries  = percentRevolutionaries + Game.GetRound((percentRevolutionaries*factionSovMod)/100)
		end
		player:SetPoliticPercent(politicBurgherD,			percentBurgher)
		player:SetPoliticPercent(politicClergyID,			percentClergy)
		player:SetPoliticPercent(politicNobilityID, 		percentNobility)
		player:SetPoliticPercent(politicRevolutionariesID, 	percentRevolutionaries)
		local politicLeader = player:GetPoliticLeader()
		player:SetPoliticLeaderKey(politicLeader)
		if player:IsHuman() then
			local politicResultsListTT = ""
			for row in GameInfo.JFD_Politics("PrereqGovernment = 'GOVERNMENT_JFD_MONARCHY' AND PrereqReform = 'REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC'") do
				local politicPercent = player:GetPoliticPercent(row.ID)
				if politicPercent > 0 then
					local politicDesc = player:GetPoliticDescription(row.ID)
					politicResultsListTT = politicResultsListTT .. "[NEWLINE]" .. row.FontIcon .. " " .. convertTextKey(politicDesc) .. ": " .. politicPercent .. "%"
				end
			end
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_ARISTOCRATIC", player:GetLegislatureName(), politicResultsListTT), convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_SHORT"), false, -1, -1)
			Events.AudioPlay2DSound(government.AudioEffect)
		end
		LuaEvents.JFD_LegislatureFormed(playerID, governmentID)
		player:SetGovernmentCooldown(defineRTPDefaultLegislatureCooldown) 
		player:SetGovernmentCooldownRate(defineRTPDefaultLegislatureCooldownRate)
	elseif player:HasReform(reformMLegislatureParliamentaryID) then
		local politicsVoteListTT = ""
		local numVotesConservative   = 0
		local numVotesLiberal        = 0
		local numVotesSocialist      = 0
		local numVotesCommunist      = 0
		local numVotesFascist 	     = 0
		local numVotesLibertarian    = 0
		local numVotesReactionary    = 0
		local numVotesRevolutionary  = (mathMax((player:GetUnhappiness()-player:GetHappiness()),0)+player:GetPublicOpinionUnhappiness())
		local numVotesTotal          = 0 
		for city in player:Cities() do
			local cityPop = city:GetPopulation()
			local conservativeSpecialists 	= (city:GetSpecialistCount(specialistMonkID) 	+ city:GetSpecialistCount(specialistScientistID))
			local conservativeYields 		= (city:GetYieldRate(yieldFaithID) 				+ city:GetYieldRate(yieldScienceID))
			local liberalSpecialists 		= (city:GetSpecialistCount(specialistArtistID) 	+ city:GetSpecialistCount(specialistMerchantID) + city:GetSpecialistCount(specialistMusicianID) + city:GetSpecialistCount(specialistWriterID))
			local liberalYields 			= (city:GetYieldRate(yieldCultureID) 			+ city:GetYieldRate(yieldGoldID))
			local socialistSpecialists 		= (city:GetSpecialistCount(specialistDoctorID)  + city:GetSpecialistCount(specialistEngineerID))
			local socialistYields 			= (city:FoodDifference() 						+ city:GetYieldRate(yieldProductionID))
			--Specialist Vote
			if (conservativeSpecialists > liberalSpecialists and conservativeSpecialists > socialistSpecialists) then
				numVotesConservative = numVotesConservative + 1
			elseif liberalSpecialists > socialistSpecialists then 
				numVotesLiberal = numVotesLiberal + 1
			elseif socialistSpecialists > 0 then
				numVotesSocialist = numVotesSocialist + 1
			end
			--Common Vote
			if (conservativeYields < liberalYields and conservativeYields < socialistYields) then
				numVotesConservative = numVotesConservative + 1
			elseif  liberalYields < socialistYields then 
				numVotesLiberal = numVotesLiberal + 1
			else
				numVotesSocialist = numVotesSocialist + 1
			end
			--Ideology Vote
			local dominantIdeologyID = player:GetPublicOpinionPreferredIdeology()
			if dominantIdeologyID <= 0 then dominantIdeologyID = ideologyID end
			if dominantIdeologyID > -1 then
				if dominantIdeologyID == ideologyAutocracyID then
					numVotesFascist 	 = numVotesFascist + conservativeSpecialists
					numVotesConservative = numVotesConservative - conservativeSpecialists
				elseif dominantIdeologyID == ideologyFreedomID then
					numVotesLibertarian = numVotesLibertarian + numVotesLiberal
					numVotesLiberal 	= numVotesLiberal - numVotesLiberal
				elseif dominantIdeologyID == ideologyOrderID then
					numVotesCommunist = numVotesCommunist + socialistSpecialists
					numVotesSocialist = numVotesSocialist - socialistSpecialists
				end
			-- else
				-- if ideologyID == ideologyAutocracyID then
					-- numVotesReactionary  = numVotesReactionary+conservativeSpecialists
					-- numVotesConservative = numVotesConservative-conservativeSpecialists
				-- elseif ideologyID == ideologyFreedomID then
					-- numVotesReactionary = numVotesReactionary+numVotesLiberal
					-- numVotesLiberal 	= numVotesLiberal-numVotesLiberal
				-- elseif ideologyID == ideologyOrderID then
					-- numVotesReactionary = numVotesReactionary+socialistSpecialists
					-- numVotesSocialist 	= numVotesSocialist-socialistSpecialists
				-- end
			end
			if player:IsHuman() then
				if numVotesConservative > 0 then
					local politic = GameInfo.JFD_Politics[politicConservativeID]
					politicsVoteListTT = politicsVoteListTT .. "[NEWLINE]" .. convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_PARLIAMENTARY_VOTE_OUTCOME", city:GetName(), politic.FontIcon, politic.Adjective, numVotesConservative)
				end
				if numVotesLiberal > 0 then
					local politic = GameInfo.JFD_Politics[politicLiberalID]
					politicsVoteListTT = politicsVoteListTT .. "[NEWLINE]" .. convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_PARLIAMENTARY_VOTE_OUTCOME", city:GetName(), politic.FontIcon, politic.Adjective, numVotesLiberal)
				end
				if numVotesSocialist > 0 then
					local politic = GameInfo.JFD_Politics[politicSocialistID]
					politicsVoteListTT = politicsVoteListTT .. "[NEWLINE]" .. convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_PARLIAMENTARY_VOTE_OUTCOME", city:GetName(), politic.FontIcon, politic.Adjective, numVotesSocialist)
				end
				if numVotesCommunist > 0 then
					local politic = GameInfo.JFD_Politics[politicCommunistID]
					politicsVoteListTT = politicsVoteListTT .. "[NEWLINE]" .. convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_PARLIAMENTARY_VOTE_OUTCOME", city:GetName(), politic.FontIcon, politic.Adjective, numVotesCommunist)
				end
				if numVotesFascist > 0 then
					local politic = GameInfo.JFD_Politics[politicFascistID]
					politicsVoteListTT = politicsVoteListTT .. "[NEWLINE]" .. convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_PARLIAMENTARY_VOTE_OUTCOME", city:GetName(), politic.FontIcon, politic.Adjective, numVotesFascist)
				end
				if numVotesLibertarian > 0 then
					local politic = GameInfo.JFD_Politics[politicLibertarianID]
					politicsVoteListTT = politicsVoteListTT .. "[NEWLINE]" .. convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_PARLIAMENTARY_VOTE_OUTCOME", city:GetName(), politic.FontIcon, politic.Adjective, numVotesLibertarian)
				end
				-- if numVotesReactionary > 0 then
					-- local politic = GameInfo.JFD_Politics[politicReactionaryID]
					-- politicsVoteListTT = politicsVoteListTT .. "[NEWLINE]" .. convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_PARLIAMENTARY_VOTE_OUTCOME", city:GetName(), politic.FontIcon, politic.Adjective, numVotesReactionary)
				-- end
			end
		end		
		numVotesTotal = numVotesTotal + numVotesConservative + numVotesLiberal + numVotesSocialist + numVotesCommunist + numVotesFascist + numVotesLibertarian + numVotesReactionary + numVotesRevolutionary
		local percentConservative    = Game.GetRound((numVotesConservative/numVotesTotal)*100)	
		local percentLiberal 	     = Game.GetRound((numVotesLiberal/numVotesTotal)*100)	
		local percentSocialist 	     = Game.GetRound((numVotesSocialist/numVotesTotal)*100)	
		local percentCommunist 	     = Game.GetRound((numVotesCommunist/numVotesTotal)*100)	
		local percentFascist 	     = Game.GetRound((numVotesFascist/numVotesTotal)*100)	
		local percentLibertarian     = Game.GetRound((numVotesLibertarian/numVotesTotal)*100)	
		-- local percentReactionary  = Game.GetRound((numVotesReactionary/numVotesTotal)*100)	
		local percentRevolutionaries = Game.GetRound((numVotesRevolutionary/numVotesTotal)*100)	
		if factionSovMod ~= 0 then
			percentConservative	= percentConservative 		 + Game.GetRound((percentConservative*factionSovMod)/100)
			percentLiberal 			= percentLiberal 		 + Game.GetRound((percentLiberal*factionSovMod)/100)
			percentSocialist 		= percentSocialist 		 + Game.GetRound((percentSocialist*factionSovMod)/100)
			percentCommunist 		= percentCommunist 		 + Game.GetRound((percentCommunist*factionSovMod)/100)
			percentFascist 			= percentFascist 		 + Game.GetRound((percentFascist*factionSovMod)/100)
			percentLibertarian 		= percentLibertarian 	 + Game.GetRound((percentLibertarian*factionSovMod)/100)
			percentRevolutionaries  = percentRevolutionaries + Game.GetRound((percentRevolutionaries*factionSovMod)/100)
			-- percentReactionary  = percentReactionary 	+ Game.GetRound((percentReactionary*factionSovMod)/100)
		end
		if ideologyID == ideologyAutocracyID then
			percentFascist = percentFascist * 2
		elseif ideologyID == ideologyFreedomID then
			percentLibertarian = percentLibertarian * 2
		elseif ideologyID == ideologyOrderID then
			percentCommunist = percentCommunist * 2
		end
		player:SetPoliticPercent(politicConservativeID,		percentConservative)
		player:SetPoliticPercent(politicLiberalID, 			percentLiberal)
		player:SetPoliticPercent(politicSocialistID, 		percentSocialist)
		player:SetPoliticPercent(politicCommunistID, 		percentCommunist)
		player:SetPoliticPercent(politicFascistID, 			percentFascist)
		player:SetPoliticPercent(politicLibertarianID, 		percentLibertarian)
		-- player:SetPoliticPercent(politicReactionaryID, 		percentReactionary)
		player:SetPoliticPercent(politicRevolutionariesID, 		percentRevolutionaries)
		local politicLeader = player:GetPoliticLeader()
		player:SetPoliticLeaderKey(politicLeader)
		if player:IsHuman() then
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_PARLIAMENTARY", player:GetLegislatureName(), politicsVoteListTT), convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_SHORT"), false, -1, -1)
			Events.AudioPlay2DSound(government.AudioEffect)
		end
		LuaEvents.JFD_LegislatureFormed(playerID, governmentID)
		player:SetGovernmentCooldown(defineRTPDefaultLegislatureCooldown) 
		player:SetGovernmentCooldownRate(defineRTPDefaultLegislatureCooldownRate)
	end
	LuaEvents.JFD_LegislatureFormed(playerID, governmentID)
end
----------------
-- REPUBLIC
----------------
--Player:ComposeSenate
local buildingAssemblyID			  = GameInfoTypes["BUILDING_JFD_ASSEMBLY"]
local buildingManorID				  = GameInfoTypes["BUILDING_JFD_MANOR"]
local buildingMansionID				  = GameInfoTypes["BUILDING_JFD_MANSION"]
--Democratic
local politicNationalistID 			  = GameInfoTypes["FACTION_JFD_NATIONALIST"]
local politicPopularistID 			  = GameInfoTypes["FACTION_JFD_POPULARIST"]
--Oligarchic
local politicCivicD 				  = GameInfoTypes["FACTION_JFD_CIVIC"]
local politicIndustrialistID 		  = GameInfoTypes["FACTION_JFD_INDUSTRIALIST"]
local politicMercantileID 			  = GameInfoTypes["FACTION_JFD_MERCANTILE"]
local politicMilitaryID		  		  = GameInfoTypes["FACTION_JFD_MILITARY"]
local politicPopulistID			 	  = GameInfoTypes["FACTION_JFD_POPULIST"]
local politicReligiousID 			  = GameInfoTypes["FACTION_JFD_RELIGIOUS"]
--(Extremists)
local politicFanaticsID 			  = GameInfoTypes["FACTION_JFD_FANATICAL"]
local politicProgressivesID 		  = GameInfoTypes["FACTION_JFD_PROGRESSIVE"]
local politicRadicalsID 			  = GameInfoTypes["FACTION_JFD_RADICAL"]
--(Revolutionaries)
local politicRevolutionariesRID 	  = GameInfoTypes["FACTION_JFD_REVOLUTIONARY"]

local reformRLegislatureDemocraticID  = GameInfoTypes["REFORM_JFD_LEGISLATURE_R_DEMOCRATIC"]
local reformRLegislatureOligarchicID  = GameInfoTypes["REFORM_JFD_LEGISLATURE_R_OLIGARCHIC"]
function Player.ComposeSenate(player, ideologyID)
	local playerID = player:GetID()
	local governmentID = player:GetGovernment()
	local government = GameInfo.JFD_Governments[governmentID]
	local factionSovMod = player:GetFactionSovereigntyModifier()
	local team = Teams[player:GetTeam()]
	for row in GameInfo.JFD_Politics() do
		player:SetPoliticPercent(row.ID, 0)
	end
	if player:HasReform(reformRLegislatureDemocraticID) then
		local politicsVoteListTT = ""
		local yieldTotalHappiness = 0
		local yieldNationalist = player:GetHappiness() + (player:GetUnhappinessFromCityCount()/100)
		local yieldPopularist = player:GetHappinessFromCities() + (player:GetUnhappinessFromCityPopulation()/100)
		local yieldRevolutionary = (mathMax((player:GetUnhappiness()-player:GetHappiness()),0)+player:GetPublicOpinionUnhappiness())
		yieldNationalist = yieldNationalist - yieldPopularist
		yieldTotalHappiness = yieldNationalist + yieldPopularist + yieldRevolutionary
		local percentNationalist 	= Game.GetRound((yieldNationalist/yieldTotalHappiness)*100)	
		local percentPopularist 	= Game.GetRound((yieldPopularist/yieldTotalHappiness)*100)	
		local percentRevolutionary 	= Game.GetRound((yieldRevolutionary/yieldTotalHappiness)*100)	
		if factionSovMod ~= 0 then
			percentNationalist 		= percentNationalist 	+ Game.GetRound((percentNationalist*factionSovMod)/100)
			percentPopularist 		= percentPopularist 	+ Game.GetRound((percentPopularist*factionSovMod)/100)
			percentRevolutionary 	= percentRevolutionary 	+ Game.GetRound((percentRevolutionary*factionSovMod)/100)
		end
		player:SetPoliticPercent(politicNationalistID,		percentNationalist)
		player:SetPoliticPercent(politicPopularistID, 		percentPopularist)
		player:SetPoliticPercent(politicRevolutionariesRID, percentRevolutionary)
		
		local politicLeader = player:GetPoliticLeader()
		player:SetPoliticLeaderKey(politicLeader)
		if player:IsHuman() then
			local politicResultsListTT = ""
			for row in GameInfo.JFD_Politics("PrereqGovernment = 'GOVERNMENT_JFD_REPUBLIC' AND (PrereqReform = 'REFORM_JFD_LEGISLATURE_R_DEMOCRATIC' OR PrereqReform IS NULL)") do
				local politicPercent = player:GetPoliticPercent(row.ID)
				if politicPercent > 0 then
					local politicDesc = player:GetPoliticDescription(row.ID)
					politicResultsListTT = politicResultsListTT .. "[NEWLINE]" .. row.FontIcon .. " " .. convertTextKey(politicDesc) .. ": " .. politicPercent .. "%"
				end
			end
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_DEMOCRATIC", player:GetLegislatureName(), politicResultsListTT), convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_SHORT"), false, -1, -1)
			Events.AudioPlay2DSound(government.AudioEffect)
		end
		LuaEvents.JFD_LegislatureFormed(playerID, governmentID)
		player:SetGovernmentCooldown(defineRTPDefaultLegislatureCooldown) 
		player:SetGovernmentCooldownRate(defineRTPDefaultLegislatureCooldownRate)
	elseif player:HasReform(reformRLegislatureOligarchicID) then
		local yieldCivic 			= player:GetNumNationalWonders() - (player:CountNumBuildings(buildingAssemblyID) + player:CountNumBuildings(buildingManorID) + player:CountNumBuildings(buildingMansionID))
		local yieldIndustrialist 	= player:GetNumInternalTradeRoutes()
		local yieldMercantile 		= player:GetNumInternationalTradeRoutes()
		local yieldMilitary			= team:GetAtWarCount(true)+1
		local yieldPopulist 		= player:GetNumPolicyBranchesFinished() + player:GetNumPolicyBranchesUnlocked()
		local yieldReligious 		= Game.GetNumStateReligionFollowers(player:GetStateReligion())
		local yieldRevolutionary    = (mathMax((player:GetUnhappiness()-player:GetHappiness()),0)+player:GetPublicOpinionUnhappiness())
		local yieldTotal 			= yieldCivic + yieldIndustrialist + yieldMercantile + yieldMilitary + yieldPopulist + yieldReligious + yieldRevolutionary
		local percentCivic 			= Game.GetRound((yieldCivic/yieldTotal)*100)	
		local percentIndustrialist 	= Game.GetRound((yieldIndustrialist/yieldTotal)*100)	
		local percentMercantile 	= Game.GetRound((yieldMercantile/yieldTotal)*100)	
		local percentMilitary		= Game.GetRound((yieldMilitary/yieldTotal)*100)	
		local percentPopulist 		= Game.GetRound((yieldPopulist/yieldTotal)*100)	
		local percentReligious 		= Game.GetRound((yieldReligious/yieldTotal)*100)
		local percentRevolutionary 	= Game.GetRound((yieldRevolutionary/yieldTotal)*100)	
		if ideologyID > -1 then
			local yieldFanatics         = yieldMilitary + yieldReligious
			local yieldProgressives     = yieldMercantile + yieldPopulist
			local yieldRadicals			= yieldCivic + yieldIndustrialist
			local percentFanatics 		= Game.GetRound((yieldFanatics/yieldTotal)*100)	
			local percentProgressives 	= Game.GetRound((yieldProgressives/yieldTotal)*100)	
			local percentRadicals 		= Game.GetRound((yieldRadicals/yieldTotal)*100)	
			if factionSovMod ~= 0 then
				percentFanatics 	 = percentFanatics 			+ Game.GetRound((percentFanatics*factionSovMod)/100)
				percentProgressives  = percentProgressives 		+ Game.GetRound((percentProgressives*factionSovMod)/100)
				percentRadicals 	 = percentRadicals 			+ Game.GetRound((percentRadicals*factionSovMod)/100)
			end
			if ideologyID == ideologyAutocracyID then
				percentFanatics = percentFanatics * 2
			elseif ideologyID == ideologyFreedomID then
				percentProgressives = percentProgressives * 2
			elseif ideologyID == ideologyOrderID then
				percentRadicals = percentRadicals * 2
			end
			player:SetPoliticPercent(politicFanaticsID, 		percentFanatics)
			player:SetPoliticPercent(politicProgressivesID, 	percentProgressives)
			player:SetPoliticPercent(politicRadicalsID, 		percentRadicals)
			player:SetPoliticPercent(politicRevolutionariesRID, percentRevolutionary)
		else
			local percentCivic 			= Game.GetRound((yieldCivic/yieldTotal)*100)	
			local percentIndustrialist 	= Game.GetRound((yieldIndustrialist/yieldTotal)*100)	
			local percentMercantile 	= Game.GetRound((yieldMercantile/yieldTotal)*100)	
			local percentMilitary		= Game.GetRound((yieldMilitary/yieldTotal)*100)	
			local percentPopulist 		= Game.GetRound((yieldPopulist/yieldTotal)*100)	
			local percentReligious 		= Game.GetRound((yieldReligious/yieldTotal)*100)
			if factionSovMod ~= 0 then
				percentCivic 		 = percentCivic 			+ Game.GetRound((percentCivic*factionSovMod)/100)
				percentIndustrialist = percentIndustrialist 	+ Game.GetRound((percentIndustrialist*factionSovMod)/100)
				percentMercantile 	 = percentMercantile 		+ Game.GetRound((percentMercantile*factionSovMod)/100)
				percentMilitary 	 = percentMilitary 			+ Game.GetRound((percentMilitary*factionSovMod)/100)
				percentPopulist  	 = percentPopulist 			+ Game.GetRound((percentPopulist*factionSovMod)/100)
				percentReligious  	 = percentReligious 		+ Game.GetRound((percentReligious*factionSovMod)/100)
			end
			player:SetPoliticPercent(politicCivicD,				percentCivic)				
			player:SetPoliticPercent(politicIndustrialistID,	percentIndustrialist)
			player:SetPoliticPercent(politicMercantileID, 		percentMercantile)		
			player:SetPoliticPercent(politicMilitaryID, 		percentMilitary) 		
			player:SetPoliticPercent(politicPopulistID, 		percentPopulist)	
			player:SetPoliticPercent(politicReligiousID, 		percentReligious)
			player:SetPoliticPercent(politicRevolutionariesRID, percentRevolutionary)
		end
		local politicLeader = player:GetPoliticLeader()
		player:SetPoliticLeaderKey(politicLeader)
		if player:IsHuman() then
			local politicResultsListTT = ""
			for row in GameInfo.JFD_Politics("PrereqGovernment = 'GOVERNMENT_JFD_REPUBLIC' AND (PrereqReform = 'REFORM_JFD_LEGISLATURE_R_OLIGARCHIC' OR PrereqReform IS NULL)") do
				local politicPercent = player:GetPoliticPercent(row.ID)
				if politicPercent > 0 then
					local politicDesc = player:GetPoliticDescription(row.ID)
					politicResultsListTT = politicResultsListTT .. "[NEWLINE]" .. row.FontIcon .. " " .. convertTextKey(politicDesc) .. ": " .. politicPercent .. "%"
				end
			end
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_OLIGARCHIC", player:GetLegislatureName(), politicResultsListTT), convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_SHORT"), false, -1, -1)
			Events.AudioPlay2DSound(government.AudioEffect)
		end
		LuaEvents.JFD_LegislatureFormed(playerID, governmentID)
		player:SetGovernmentCooldown(defineRTPDefaultLegislatureCooldown) 
		player:SetGovernmentCooldownRate(defineRTPDefaultLegislatureCooldownRate)
	end
	LuaEvents.JFD_LegislatureFormed(playerID, governmentID)
end
----------------
-- DICTATORSHIP
----------------
--Player:ComposeAssembly
--Military
local politicMilitaryID 			 = GameInfoTypes["ASSEMBLY_JFD_MILITARY"]

--One-Party
local politicCommunistDID 			 = GameInfoTypes["ASSEMBLY_JFD_COMMUNIST"]
local politicFascistID 		 		 = GameInfoTypes["ASSEMBLY_JFD_FASCIST"]
local politicLibertarianDID 		 = GameInfoTypes["ASSEMBLY_JFD_LIBERTARIAN"]

local reformDLegislatureOnePartyID  = GameInfoTypes["REFORM_JFD_LEGISLATURE_D_ONE_PARTY"]
local reformDLegislatureMilitaryID  = GameInfoTypes["REFORM_JFD_LEGISLATURE_D_MILITARY"]
function Player.ComposeAssembly(player)
	local playerID = player:GetID()
	local governmentID = player:GetGovernment()
	local government = GameInfo.JFD_Governments[governmentID]
	local factionSovMod = player:GetFactionSovereigntyModifier()
	local numCities = player:GetNumCities()
	for row in GameInfo.JFD_Politics() do
		player:SetPoliticPercent(row.ID, 0)
	end
	if player:HasReform(reformDLegislatureOnePartyID) then
		local percentCommunist 			= 0
		local percentFascist 			= 0
		local percentLibertarian 		= 0
		local chosenIdeologyID = player:GetLateGamePolicyTree()
		if chosenIdeologyID > -1 then
			if chosenIdeologyID == ideologyAutocracyID then 
				percentFascist = 100
			elseif chosenIdeologyID == ideologyFreedomID then
				percentLibertarian = 100
			elseif chosenIdeologyID == ideologyOrderID then
				percentCommunist = 100
			end
		end
		if factionSovMod ~= 0 then
			percentCommunist 	= percentCommunist 		+ Game.GetRound((percentCommunist*factionSovMod)/100)
			percentFascist 		= percentFascist 		+ Game.GetRound((percentFascist*factionSovMod)/100)
			percentLibertarian 	= percentLibertarian 	+ Game.GetRound((percentLibertarian*factionSovMod)/100)
		end
		player:SetPoliticPercent(politicCommunistDID,	percentCommunist)
		player:SetPoliticPercent(politicFascistID,		percentFascist)
		player:SetPoliticPercent(politicLibertarianDID, percentLibertarian)
		local politicLeader = player:GetPoliticLeader()
		player:SetPoliticLeaderKey(politicLeader)
		if player:IsHuman() then
			local politicResultsListTT = ""
			for row in GameInfo.JFD_Politics("PrereqGovernment = 'GOVERNMENT_JFD_DICTATORSHIP' AND PrereqReform = 'REFORM_JFD_LEGISLATURE_D_ONE_PARTY'") do
				local politicPercent = player:GetPoliticPercent(row.ID)
				if politicPercent > 0 then
					local politicDesc = player:GetPoliticDescription(row.ID)
					politicResultsListTT = politicResultsListTT .. "[NEWLINE]" .. row.FontIcon .. " " .. convertTextKey(politicDesc) .. ": " .. politicPercent .. "%"
				end
			end
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_ONE_PARTY", player:GetLegislatureName(), politicResultsListTT), convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_SHORT"), false, -1, -1)
			Events.AudioPlay2DSound(government.AudioEffect)
		end
		LuaEvents.JFD_LegislatureFormed(playerID, governmentID)
	elseif player:HasReform(reformDLegislatureMilitaryID) then
		local percentMilitary = 100
		if factionSovMod ~= 0 then
			percentMilitary = percentMilitary + Game.GetRound((percentMilitary*factionSovMod)/100)
		end
		player:SetPoliticPercent(politicMilitaryID, percentMilitary)
		local politicLeader = player:GetPoliticLeader()
		player:SetPoliticLeaderKey(politicLeader)
		if player:IsHuman() then
			local politicResultsListTT = ""
			for row in GameInfo.JFD_Politics("PrereqGovernment = 'GOVERNMENT_JFD_DICTATORSHIP' AND PrereqReform = 'REFORM_JFD_LEGISLATURE_D_MILITARY'") do
				local politicPercent = player:GetPoliticPercent(row.ID)
				if politicPercent > 0 then
					local politicDesc = player:GetPoliticDescription(row.ID)
					politicResultsListTT = politicResultsListTT .. "[NEWLINE]" .. row.FontIcon .. " " .. convertTextKey(politicDesc) .. ": " .. politicPercent .. "%"
				end
			end
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_MILITARY", player:GetLegislatureName(), politicResultsListTT), convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_SHORT"), false, -1, -1)
			Events.AudioPlay2DSound(government.AudioEffect)
		end
		LuaEvents.JFD_LegislatureFormed(playerID, governmentID)
	end
	LuaEvents.JFD_LegislatureFormed(playerID, governmentID)
end
----------------
-- THEOCRACY
----------------
local defaultMaxPietyRate = 100
for row in GameInfo.GameSpeed_JFD_PietyThresholds("GameSpeedType = '" .. gameSpeed.Type .. "'") do
	defaultMaxPietyRate   = row.MaxThreshold
	break
end

--Player:GetFactionClergyID
local politicClergyTID = GameInfoTypes["CLERGY_JFD_CLERGY"]
function Player.GetFactionClergyID(player, city)
	if city then
		local cityID = city:GetX()+city:GetY()
		cityID = cityID - Game.GetRound(cityID/1.1)
		return politicClergyTID + cityID
	else
		return politicClergyTID + player:GetID()
	end
end

--Player:ComposeHolySynod
local reformTLegislatureAutocephalousID  = GameInfoTypes["REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS"]
local reformTLegislatureEcumenicalID  	 = GameInfoTypes["REFORM_JFD_LEGISLATURE_T_ECUMENICAL"]

local pietyLevelNeutralID  				 = GameInfoTypes["PIETY_LEVEL_JFD_NEUTRAL"]
--(Revolutionaries)
local politicRevolutionariesTID   		 = GameInfoTypes["CLERGY_JFD_REVOLUTIONARY"]
function Player.ComposeHolySynod(player)
	local playerID = player:GetID()
	local governmentID = player:GetGovernment()
	local government = GameInfo.JFD_Governments[governmentID]
	local factionSovMod = player:GetFactionSovereigntyModifier()
	local team = Teams[player:GetTeam()]
	for row in GameInfo.JFD_Politics() do
		player:SetPoliticPercent(row.ID, 0)
	end
	local stateReligionID = player:GetStateReligion()
	if player:HasReform(reformTLegislatureAutocephalousID) then
		local politicResultsListTT = ""
		local percentRevolutionary 	= 0
		if player:GetPietyLevel() <= pietyLevelNeutralID then
			percentRevolutionary = (defaultMaxPietyRate-player:GetPiety())
		end
		if factionSovMod ~= 0 then
			percentRevolutionary = percentRevolutionary + Game.GetRound((percentRevolutionary*factionSovMod)/100)
		end
		player:SetPoliticPercent(politicRevolutionariesTID, percentRevolutionary)
		for city in player:Cities() do
			local politicPercent = 0
			local numFollowers = city:GetNumFollowers(stateReligionID)
			if numFollowers > 0 then politicPercent = Game.GetRound((numFollowers/player:GetTotalPopulation())*100)	end
			if factionSovMod ~= 0 then
				politicPercent = politicPercent + Game.GetRound((politicPercent*factionSovMod)/100)
			end
			local clergyID = player:GetFactionClergyID(city)
			player:SetPoliticPercent(clergyID, politicPercent)
			if player:IsHuman() then
				if politicPercent > 0 then
					local politicDesc = player:GetPoliticDescription(stateReligionID, true)
					politicResultsListTT = politicResultsListTT .. "[NEWLINE][ICON_JFD_CLERGY] " .. city:GetName() .. " " .. convertTextKey(politicDesc) .. ": " .. politicPercent .. "%"
				end			
			end
		end
		if percentRevolutionary > 0 then
			local politicDesc = player:GetPoliticDescription(politicRevolutionariesTID) 
			politicResultsListTT = politicResultsListTT .. "[NEWLINE][ICON_JFD_REVOLUTIONARIES] " .. convertTextKey(politicDesc) .. ": " .. percentRevolutionary .. "%"
		end	
		local politicLeader = player:GetPoliticLeader()
		player:SetPoliticLeaderKey(politicLeader)
		if player:IsHuman() then
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_HOLY_SYNOD", player:GetLegislatureName(), politicResultsListTT), convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_SHORT"), false, -1, -1)
			Events.AudioPlay2DSound(government.AudioEffect)
		end
		LuaEvents.JFD_LegislatureFormed(playerID, governmentID)
		player:SetGovernmentCooldown(defineRTPDefaultLegislatureCooldown) 
		player:SetGovernmentCooldownRate(defineRTPDefaultLegislatureCooldownRate)
	elseif player:HasReform(reformTLegislatureEcumenicalID) then
		local politicResultsListTT = ""
		local percentRevolutionary 	= 0
		if player:GetPietyLevel() <= pietyLevelNeutralID then
			percentRevolutionary = (defaultMaxPietyRate-player:GetPiety())
		end
		if factionSovMod ~= 0 then
			percentRevolutionary = percentRevolutionary + Game.GetRound((percentRevolutionary*factionSovMod)/100)
		end
		player:SetPoliticPercent(politicRevolutionariesTID, percentRevolutionary)
		for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			local clergyID = otherPlayer:GetFactionClergyID()
			if player:GetPoliticPercent(clergyID) > 0 then
				player:SetPoliticPercent(clergyID, 0)
			end
		end	
		for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			local clergyID = otherPlayer:GetFactionClergyID()
			if (otherPlayer:IsAlive() and team:IsHasMet(otherPlayer:GetTeam()) and otherPlayer:GetStateReligion() == stateReligionID and (not otherPlayer:IsAtWar(playerID))) then
				local numCities = otherPlayer:GetNumCitiesWithStateReligion(stateReligionID)
				if (otherPlayerID == playerID and numCities == 0) then numCities = numCities + 1 end
				local politicPercent = Game.GetRound(numCities/(Game.GetNumCitiesFollowing(stateReligionID))*100)	
				if factionSovMod ~= 0 then
					politicPercent = politicPercent + Game.GetRound((politicPercent*factionSovMod)/100)
				end
				player:SetPoliticPercent(clergyID, politicPercent)
				if player:IsHuman() then
					if politicPercent > 0 then
						politicResultsListTT = politicResultsListTT .. Locale.ConvertTextKey("[NEWLINE][ICON_JFD_CLERGY] {1_CivAdj} {2_ClergyDesc}: +{3_Percent}% [ICON_JFD_SOVEREIGNTY]", otherPlayer:GetCivilizationAdjective(), player:GetPoliticDescription(stateReligionID, true), politicPercent)
					end			
				end
			end
		end
		if percentRevolutionary > 0 then
			local politicDesc = player:GetPoliticDescription(politicRevolutionariesTID)
			politicResultsListTT = politicResultsListTT .. "[NEWLINE][ICON_JFD_REVOLUTIONARIES] " .. convertTextKey(politicDesc) .. ": " .. percentRevolutionary .. "%"
		end	
		local politicLeader = player:GetPoliticLeader()
		player:SetPoliticLeaderKey(politicLeader)
		if player:IsHuman() then
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_HOLY_SYNOD", player:GetLegislatureName(), politicResultsListTT), convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_SHORT"), false, -1, -1)
			Events.AudioPlay2DSound(government.AudioEffect)
		end
		LuaEvents.JFD_LegislatureFormed(playerID, governmentID)
		player:SetGovernmentCooldown(defineRTPDefaultLegislatureCooldown) 
		player:SetGovernmentCooldownRate(defineRTPDefaultLegislatureCooldownRate)
	end
	LuaEvents.JFD_LegislatureFormed(playerID, governmentID)
end
----------------
-- HRE
----------------
--Player:GetFactionElectorID
local politicElectorHREID = GameInfoTypes["ELECTOR_JFD_ELECTOR"]
function Player.GetFactionElectorID(player)
	return politicElectorHREID + player:GetID()
end

--Player:ComposeImperialDiet
local reformHRELegislaturePrivilegiumMaiusID = GameInfoTypes["REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS"]
local reformHRELegislaturePrivilegiumMinorID = GameInfoTypes["REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR"]
--(Revolutionaries)
local politicRevolutionariesHREID   		 = GameInfoTypes["ELECTOR_JFD_REVOLUTIONARY"]
function Player.ComposeImperialDiet(player)
	local playerID = player:GetID()
	local governmentID = player:GetGovernment()
	local government = GameInfo.JFD_Governments[governmentID]
	local factionSovMod = player:GetFactionSovereigntyModifier()
	local team = Teams[player:GetTeam()]
	local percentRevolutionary = (mathMax((player:GetUnhappiness()-player:GetHappiness()),0)+player:GetPublicOpinionUnhappiness())
	if factionSovMod ~= 0 then
		percentRevolutionary = percentRevolutionary + Game.GetRound((percentRevolutionary*factionSovMod)/100)
	end
	for row in GameInfo.JFD_Politics() do
		player:SetPoliticPercent(row.ID, 0)
	end
	if player:HasReform(reformHRELegislaturePrivilegiumMaiusID) then
		local politicResultsListTT = ""
		player:SetPoliticPercent(politicRevolutionariesHREID, percentRevolutionary)
		local totalPopulation = 0
		for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			local electorID = otherPlayer:GetFactionElectorID()
			if player:GetPoliticPercent(electorID) > 0 then
				player:SetPoliticPercent(electorID, 0)
			end
			if (otherPlayer:IsAlive() and otherPlayer:IsMinorCiv() and otherPlayer:GetCapitalCity() and team:IsHasMet(otherPlayer:GetTeam()) and otherPlayer:IsAllies(playerID)) then
				totalPopulation = totalPopulation + otherPlayer:GetTotalPopulation()
			end
		end
		for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			local electorID = otherPlayer:GetFactionElectorID()
			if (otherPlayer:IsAlive() and otherPlayer:IsMinorCiv() and otherPlayer:GetCapitalCity() and team:IsHasMet(otherPlayer:GetTeam()) and otherPlayer:IsAllies(playerID)) then
				local otherPopulation = otherPlayer:GetTotalPopulation()
				local politicPercent = Game.GetRound(otherPopulation/(totalPopulation)*100)
				if factionSovMod ~= 0 then
					politicPercent = politicPercent + Game.GetRound((politicPercent*factionSovMod)/100)
				end
				player:SetPoliticPercent(electorID, politicPercent)
				if player:IsHuman() then
					if politicPercent > 0 then
						politicResultsListTT = politicResultsListTT .. Locale.ConvertTextKey("[NEWLINE][ICON_JFD_ELECTOR] {1_Desc} of {2_CivDesc}: +{3_Percent}% [ICON_JFD_SOVEREIGNTY]", "TXT_KEY_JFD_ELECTOR_JFD_ELECTOR_DESC", otherPlayer:GetName(), politicPercent)
					end			
				end
			end
		end
		if percentRevolutionary > 0 then
			local politicDesc = player:GetPoliticDescription(politicRevolutionariesHREID)
			politicResultsListTT = politicResultsListTT .. "[NEWLINE][ICON_JFD_REVOLUTIONARIES] " .. convertTextKey(politicDesc) .. ": " .. percentRevolutionary .. "%"
		end	
		-- local politicLeader = player:GetPoliticLeader()
		-- player:SetPoliticLeaderKey(politicLeader)
		if player:IsHuman() then
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_IMPERIAL_DIET", player:GetLegislatureName(), politicResultsListTT), convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_SHORT"), false, -1, -1)
			Events.AudioPlay2DSound(government.AudioEffect)
		end
		LuaEvents.JFD_LegislatureFormed(playerID, governmentID)
		player:SetGovernmentCooldown(defineRTPDefaultLegislatureCooldown) 
		player:SetGovernmentCooldownRate(defineRTPDefaultLegislatureCooldownRate)
	elseif player:HasReform(reformHRELegislaturePrivilegiumMinorID) then
		local politicResultsListTT = ""
		player:SetPoliticPercent(politicRevolutionariesHREID, percentRevolutionary)
		local totalPopulation = 0
		for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			local electorID = otherPlayer:GetFactionElectorID()
			if player:GetPoliticPercent(electorID) > 0 then
				player:SetPoliticPercent(electorID, 0)
			end
			if (otherPlayer:IsAlive() and otherPlayer:IsMinorCiv() and otherPlayer:GetCapitalCity() and team:IsHasMet(otherPlayer:GetTeam()) and otherPlayer:IsFriends(playerID)) then
				totalPopulation = totalPopulation + otherPlayer:GetTotalPopulation()
			end
		end
		for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			local electorID = otherPlayer:GetFactionElectorID()
			if (otherPlayer:IsAlive() and otherPlayer:IsMinorCiv() and otherPlayer:GetCapitalCity() and team:IsHasMet(otherPlayer:GetTeam()) and otherPlayer:IsFriends(playerID)) then
				local otherPopulation = otherPlayer:GetTotalPopulation()
				local politicPercent = Game.GetRound(otherPopulation/(totalPopulation)*100)
				if factionSovMod ~= 0 then
					politicPercent = politicPercent + Game.GetRound((politicPercent*factionSovMod)/100)
				end
				player:SetPoliticPercent(electorID, politicPercent)
				if player:IsHuman() then
					if politicPercent > 0 then
						politicResultsListTT = politicResultsListTT .. Locale.ConvertTextKey("[NEWLINE][ICON_JFD_ELECTOR] {1_Desc} of {2_CivDesc}: +{3_Percent}% [ICON_JFD_SOVEREIGNTY]", "TXT_KEY_JFD_ELECTOR_JFD_ELECTOR_DESC", otherPlayer:GetName(), politicPercent)
					end			
				end
			end
		end
		if percentRevolutionary > 0 then
			local politicDesc = player:GetPoliticDescription(politicRevolutionariesHREID)
			politicResultsListTT = politicResultsListTT .. "[NEWLINE][ICON_JFD_REVOLUTIONARIES] " .. convertTextKey(politicDesc) .. ": " .. percentRevolutionary .. "%"
		end	
		-- local politicLeader = player:GetPoliticLeader()
		-- player:SetPoliticLeaderKey(politicLeader)
		if player:IsHuman() then
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_IMPERIAL_DIET", player:GetLegislatureName(), politicResultsListTT), convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_SHORT"), false, -1, -1)
			Events.AudioPlay2DSound(government.AudioEffect)
		end
		LuaEvents.JFD_LegislatureFormed(playerID, governmentID)
		player:SetGovernmentCooldown(defineRTPDefaultLegislatureCooldown) 
		player:SetGovernmentCooldownRate(defineRTPDefaultLegislatureCooldownRate)
	end
	LuaEvents.JFD_LegislatureFormed(playerID, governmentID)
end
----------------
-- SHOGUNATE
----------------
--Player:GetFactionElectorID
-- local politicElectorHREID = GameInfoTypes["ELECTOR_JFD_ELECTOR"]
-- function Player.GetFactionElectorID(player)
	-- return politicElectorHREID + player:GetID()
-- end

--Player:ComposeImperialCourt
local reformShogunateLegislatureDaimyoID 	 = GameInfoTypes["REFORM_JFD_LEGISLATURE_S_DAIMYO"]
local reformShogunateLegislatureEmperorID 	 = GameInfoTypes["REFORM_JFD_LEGISLATURE_S_EMPEROR"]
--Emperor
local numEmperors = 0
for row in GameInfo.JFD_Politics("IsEmperor = 1") do
	numEmperors = numEmperors + 1
end
 
--(Revolutionaries)
local politicRevolutionariesShogunateID   	= GameInfoTypes["IMP_FACTION_JFD_REVOLUTIONARY"]
function Player.ComposeImperialCourt(player)
	local playerID = player:GetID()
	local governmentID = player:GetGovernment()
	local government = GameInfo.JFD_Governments[governmentID]
	local factionSovMod = player:GetFactionSovereigntyModifier()
	local team = Teams[player:GetTeam()]
	local percentRevolutionary = (mathMax((player:GetUnhappiness()-player:GetHappiness()),0)+player:GetPublicOpinionUnhappiness())
	if factionSovMod ~= 0 then
		percentRevolutionary = percentRevolutionary + Game.GetRound((percentRevolutionary*factionSovMod)/100)
	end
	for row in GameInfo.JFD_Politics() do
		player:SetPoliticPercent(row.ID, 0)
	end
	if player:HasReform(reformShogunateLegislatureDaimyoID) then
		-- local politicResultsListTT = ""
		-- player:SetPoliticPercent(politicRevolutionariesHREID, percentRevolutionary)
		-- local totalPopulation = 0
		-- for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
			-- local otherPlayer = Players[otherPlayerID]
			-- local electorID = otherPlayer:GetFactionElectorID()
			-- if player:GetPoliticPercent(electorID) > 0 then
				-- player:SetPoliticPercent(electorID, 0)
			-- end
			-- if (otherPlayer:IsAlive() and otherPlayer:IsMinorCiv() and otherPlayer:GetCapitalCity() and team:IsHasMet(otherPlayer:GetTeam()) and otherPlayer:IsAllies(playerID)) then
				-- totalPopulation = totalPopulation + otherPlayer:GetTotalPopulation()
			-- end
		-- end
		-- for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
			-- local otherPlayer = Players[otherPlayerID]
			-- local electorID = otherPlayer:GetFactionElectorID()
			-- if (otherPlayer:IsAlive() and otherPlayer:IsMinorCiv() and otherPlayer:GetCapitalCity() and team:IsHasMet(otherPlayer:GetTeam()) and otherPlayer:IsAllies(playerID)) then
				-- local otherPopulation = otherPlayer:GetTotalPopulation()
				-- local politicPercent = Game.GetRound(otherPopulation/(totalPopulation)*100)
				-- if factionSovMod ~= 0 then
					-- politicPercent = politicPercent + Game.GetRound((politicPercent*factionSovMod)/100)
				-- end
				-- player:SetPoliticPercent(electorID, politicPercent)
				-- if player:IsHuman() then
					-- if politicPercent > 0 then
						-- politicResultsListTT = politicResultsListTT .. Locale.ConvertTextKey("[NEWLINE][ICON_JFD_ELECTOR] {1_Desc} of {2_CivDesc}: +{3_Percent}% [ICON_JFD_SOVEREIGNTY]", "TXT_KEY_JFD_ELECTOR_JFD_ELECTOR_DESC", otherPlayer:GetName(), politicPercent)
					-- end			
				-- end
			-- end
		-- end
		-- if percentRevolutionary > 0 then
			-- local politicDesc = player:GetPoliticDescription(politicRevolutionariesShogunateID)
			-- politicResultsListTT = politicResultsListTT .. "[NEWLINE][ICON_JFD_REVOLUTIONARIES] " .. convertTextKey(politicDesc) .. ": " .. percentRevolutionary .. "%"
		-- end	
		-- local politicLeader = player:GetPoliticLeader()
		-- player:SetPoliticLeaderKey(politicLeader)
		-- if player:IsHuman() then
			-- JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_IMPERIAL_DIET", player:GetLegislatureName(), politicResultsListTT), convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_SHORT"), false, -1, -1)
			-- Events.AudioPlay2DSound(government.AudioEffect)
		-- end
		-- LuaEvents.JFD_LegislatureFormed(playerID, governmentID)
		-- local randomCooldown = Game.GetRandom(1,(defineRTPDefaultLegislatureCooldown*2))
		-- player:SetGovernmentCooldown(randomCooldown) 
		-- player:SetGovernmentCooldownRate(defineRTPDefaultLegislatureCooldownRate)
	elseif player:HasReform(reformShogunateLegislatureEmperorID) then
		player:SetPoliticPercent(politicRevolutionariesShogunateID, percentRevolutionary)
		local politicImpFaction = "IMP_FACTION_JFD_EMPEROR_" .. Game.GetRandom(1,(numEmperors-1))
		local politicImpFactionID = GameInfoTypes[politicImpFaction]
		player:SetPoliticPercent(politicImpFactionID, 100)
		print(numEmperors, politicImpFaction, politicImpFactionID, player:GetPoliticPercent(politicImpFactionID))
		local politicLeader = player:GetPoliticLeader()
		player:SetPoliticLeaderKey(politicLeader)
		if player:IsHuman() then
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_IMPERIAL_COURT"), convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_SHORT"), false, -1, -1)
			Events.AudioPlay2DSound(government.AudioEffect)
		end
		LuaEvents.JFD_LegislatureFormed(playerID, governmentID)
		local randomCooldown = Game.GetRandom(1,(defineRTPDefaultLegislatureCooldown*2))
		player:SetGovernmentCooldown(randomCooldown) 
		player:SetGovernmentCooldownRate(defineRTPDefaultLegislatureCooldownRate)
	end
	LuaEvents.JFD_LegislatureFormed(playerID, governmentID)
end
----------------
-- FACTIONS
----------------
--Player:GetFactionSovereigntyModifier
function Player.GetFactionSovereigntyModifier(player)
	local factionSovMod = 0
	--Check Buildings
	for row in GameInfo.Building_JFD_SovereigntyMods("FactionSovMod <> 0") do
		if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
			factionSovMod = factionSovMod + row.FactionSovMod
		end
	end
	--Check Governments
	for row in GameInfo.JFD_Governments("FactionSovMod <> 0") do
		if player:GetGovernment() == row.ID then
			factionSovMod = factionSovMod + row.FactionSovMod
		end
	end
	--Check Reforms
	for row in GameInfo.JFD_Reforms("FactionSovMod <> 0") do
		if player:HasReform(row.ID) then
			factionSovMod = factionSovMod + row.FactionSovMod
		end
	end
	--Check Policies
	for row in GameInfo.Policy_JFD_SovereigntyMods("FactionSovMod <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			factionSovMod = factionSovMod + row.FactionSovMod
		end
	end
	--Check Traits
	for row in GameInfo.Trait_JFD_SovereigntyMods("FactionSovMod <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			factionSovMod = factionSovMod + row.FactionSovMod
		end
	end
	return factionSovMod
end

--Player:GetReformOpinionFavoured
local reformSuffrageLandedID	= GameInfoTypes["REFORM_JFD_SUFFRAGE_LANDED"]
local reformSuffrageUniversalID = GameInfoTypes["REFORM_JFD_SUFFRAGE_UNIVERSAL"]
function Player.GetReformOpinionFavoured(player, reformID)
	local team = Teams[player:GetTeam()]
	local reform = GameInfo.JFD_Reforms[reformID]
	local governmentID = player:GetGovernment()
	local government = GameInfo.JFD_Governments[governmentID]
	local reformOpinionFavoured = 0
	if reform.ReformBranchType == "REFORM_BRANCH_JFD_GOVERNMENT" then
		for row in GameInfo.JFD_Reforms("ReformCostModPerCity <> 0") do
			if player:HasReform(row.ID) then
				local reformCostModPerCity = (row.ReformCostModPerCity*-1)
				reformCostModPerCity = (reformCostModPerCity*player:GetNumCities())
				if reformCostModPerCity > 50 then reformCostModPerCity = 50 end
				reformOpinionFavoured = reformOpinionFavoured + reformCostModPerCity
			end
		end
		for row in GameInfo.JFD_Reforms("ReformCostModPerPop <> 0") do
			if player:HasReform(row.ID) then
				local reformCostModPerPop = (row.ReformCostModPerPop*-1)
				reformCostModPerPop = (reformCostModPerPop*player:GetTotalPopulation())
				if reformCostModPerPop > 50 then reformCostModPerPop = 50 end
				reformOpinionFavoured = reformOpinionFavoured + reformCostModPerPop
			end
		end
	end
	for politic in GameInfo.JFD_Politics("PrereqGovernment = '" .. government.Type .. "'") do
		local politicsPercent = player:GetPoliticPercent(politic.ID)
		if politicsPercent > 0 then
			for row in GameInfo.JFD_Politics_FavouredReforms("PoliticsType = '" .. politic.Type .. "' AND ReformBranchType = '" .. reform.ReformBranchType .. "' AND (ReformAlignment = '" .. reform.Alignment .. "' OR ReformAlignment IS NULL)") do
				reformOpinionFavoured = reformOpinionFavoured + politicsPercent
			end
			for row in GameInfo.JFD_Politics_FavouredReforms("PoliticsType = '" .. politic.Type .. "' AND ReformType = '" .. reform.Type .. "'") do
				reformOpinionFavoured = reformOpinionFavoured + politicsPercent
			end
		end
	end
	if governmentID == governmentHolyRomeID then
		local reformElectorOpinionFavoured, reformElectorOpinionOpposed = player:GetReformOpinionFactionElectors(reformID)
		reformOpinionFavoured = reformOpinionFavoured + reformElectorOpinionFavoured
	elseif governmentID == governmentTheocracyID then
		local reformClergyOpinionFavoured, reformClergyOpinionOpposed = player:GetReformOpinionFactionClergy(reform.ReformBranchType, reform.Alignment)
		reformOpinionFavoured = reformOpinionFavoured + reformClergyOpinionFavoured
	end
	return reformOpinionFavoured
end

--Player:GetReformOpinionOpposed
function Player.GetReformOpinionOpposed(player, reformID)
	local reformOpinionOpposed = 0
	local reform = GameInfo.JFD_Reforms[reformID]
	local governmentID = player:GetGovernment()
	local government = GameInfo.JFD_Governments[governmentID]
	for politic in GameInfo.JFD_Politics("PrereqGovernment = '" .. government.Type .. "'") do
		local politicsPercent = player:GetPoliticPercent(politic.ID)
		if politicsPercent > 0 then
			for row in GameInfo.JFD_Politics_OpposedReforms("PoliticsType = '" .. politic.Type .. "' AND ReformBranchType = '" .. reform.ReformBranchType .. "' AND (ReformAlignment = '" .. reform.Alignment .. "' OR ReformAlignment IS NULL)") do
				reformOpinionOpposed = reformOpinionOpposed + politicsPercent
			end
			for row in GameInfo.JFD_Politics_FavouredReforms("PoliticsType = '" .. politic.Type .. "' AND ReformType = '" .. reform.Type .. "'") do
				reformOpinionOpposed = reformOpinionOpposed + politicsPercent
			end
		end
	end
	if governmentID == governmentHolyRomeID then
		local reformElectorOpinionFavoured, reformElectorOpinionOpposed = player:GetReformOpinionFactionElectors(reformID)
		reformOpinionOpposed = reformOpinionOpposed + reformElectorOpinionOpposed
	elseif governmentID == governmentTheocracyID then
		local reformClergyOpinionFavoured, reformClergyOpinionOpposed = player:GetReformOpinionFactionClergy(reform.ReformBranchType, reform.Alignment)
		reformOpinionOpposed = reformOpinionOpposed + reformClergyOpinionOpposed
	end
	return reformOpinionOpposed
end
----------------
-- HOLY ROMAN EMPIRE
----------------
--Player:GetReformOpinionFactionElectors
function Player.GetReformOpinionFactionElectors(player, reformID)
	local team = Teams[player:GetTeam()]
	local reformOpinionFavoured = 0
	local reformOpinionOpposed = 0
	local reform = GameInfo.JFD_Reforms[reformID]
	for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
		local otherPlayer = Players[otherPlayerID]
		local electorID = otherPlayer:GetFactionElectorID()
		if (otherPlayer:IsAlive() and otherPlayer:IsMinorCiv() and otherPlayer:GetCapitalCity()) then
			local minorCivTraitType = GameInfo.MinorCivTraits[otherPlayer:GetMinorCivTrait()].Type
			for row in GameInfo.JFD_Politics_FavouredReforms("PoliticsType = 'ELECTOR_JFD_ELECTOR' AND MinorCivTraitType = '" .. minorCivTraitType .. "' AND ReformBranchType = '" .. reform.ReformBranchType .. "' AND (ReformAlignment = '" .. reform.Alignment .. "' OR ReformAlignment IS NULL)") do
				reformOpinionFavoured = reformOpinionFavoured + player:GetPoliticPercent(electorID)
			end
			for row in GameInfo.JFD_Politics_OpposedReforms("PoliticsType = 'ELECTOR_JFD_ELECTOR' AND MinorCivTraitType = '" .. minorCivTraitType .. "' AND ReformBranchType = '" .. reform.ReformBranchType .. "' AND (ReformAlignment = '" .. reform.Alignment .. "' OR ReformAlignment IS NULL)") do
				reformOpinionOpposed = reformOpinionOpposed + player:GetPoliticPercent(electorID)
			end
		end		
	end
	return reformOpinionFavoured, reformOpinionOpposed
end
----------------
-- THEOCRACY
----------------
--Player:GetReformOpinionFactionClergy
local factionClergyOpinions = {}
	factionClergyOpinions["REFORM_BRANCH_JFD_CULTURE"]  = yieldCultureID
	factionClergyOpinions["REFORM_BRANCH_JFD_ECONOMY"]  = yieldGoldID
	factionClergyOpinions["REFORM_BRANCH_JFD_INDUSTRY"] = yieldScienceID
	factionClergyOpinions["REFORM_BRANCH_JFD_RELIGION"] = yieldFaithID
function Player.GetReformOpinionFactionClergy(player, reformBranch, reformAlignment)
	local team = Teams[player:GetTeam()]
	local reformOpinion = 0
	local reformOpinionFavoured = 0
	local reformOpinionOpposed = 0
	local pietyLevelID = player:GetPietyLevel()
	local pietyLevelMod = GameInfo.JFD_PietyLevels[pietyLevelID].ReformOpinionMod
	local stateReligionID = player:GetStateReligion()
	if player:HasReform(reformTLegislatureAutocephalousID) then
		for city in player:Cities() do
			local clergyID = player:GetFactionClergyID(city)
			local highestYieldID = player:GetHighestYield()
			if (factionClergyOpinions[reformBranch] and factionClergyOpinions[reformBranch] == highestYieldID) then
				if reformAlignment == "REFORM_LEFT" then
					reformOpinionFavoured = reformOpinionFavoured + player:GetPoliticPercent(clergyID)
				elseif reformAlignment == "REFORM_RIGHT" then
					reformOpinionOpposed = reformOpinionOpposed + player:GetPoliticPercent(clergyID)
				end
			end
		end
	elseif player:HasReform(reformTLegislatureEcumenicalID) then
		for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do	
			local otherPlayer = Players[otherPlayerID]
			local clergyID = otherPlayer:GetFactionClergyID()
			if (otherPlayer:IsAlive() and otherPlayer:GetStateReligion() == stateReligionID) then
				local highestYieldID = otherPlayer:GetHighestYield()
				if (factionClergyOpinions[reformBranch] and factionClergyOpinions[reformBranch] == highestYieldID) then
					if reformAlignment == "REFORM_LEFT" then
						reformOpinionOpposed = reformOpinionOpposed + player:GetPoliticPercent(clergyID)
					elseif reformAlignment == "REFORM_RIGHT" then
						reformOpinionFavoured = reformOpinionFavoured + player:GetPoliticPercent(clergyID)
					end
				end
			end
		end
	end
	return reformOpinionFavoured, reformOpinionOpposed
end
------------------------------------------------------------------------------------------------------------------------
-- REFORMS
------------------------------------------------------------------------------------------------------------------------
--Player:HasReform
function Player.HasReform(player, reformID)
	return player:HasPolicy(GameInfoTypes[GameInfo.JFD_Reforms[reformID].PolicyType])
end	

--Player:GetNumReforms
function Player.GetNumReforms(player, isAligned)
	local numReforms = 0
	if isAligned then
		for row in GameInfo.JFD_Reforms("IsDisabled = 0 AND Alignment = 'REFORM_LEFT' OR Alignment = 'REFORM_RIGHT'") do
			if player:HasReform(row.ID) then
				numReforms = numReforms + 1
			end
		end
	else
		for row in GameInfo.JFD_Reforms("IsDisabled = 0") do
			if player:HasReform(row.ID) then
				numReforms = numReforms + 1
			end
		end
	end
	return numReforms
end

--Player:SetHasReform
function Player.SetHasReform(player, reformID, isAdding, isFree, isGovernmentFounding)
	local playerID = player:GetID()
	local reform = GameInfo.JFD_Reforms[reformID]
	local numFreeReforms = player:GetNumFreeReforms()
	if ((not isFree) and numFreeReforms > 0) then isFree = true end
	local policyID = GameInfoTypes[reform.PolicyType]
	if isAdding then
		if (not player:HasPolicy(policyID)) then
			player:GrantPolicy(policyID, true)
			if (not isGovernmentFounding) then LuaEvents.JFD_ReformPassed(playerID, reformID, isFree) end
			if (player:IsHuman() and player:GetGovernment() > -1) then
				local reformBranchDesc = GameInfo.JFD_ReformBranches[reform.ReformBranchType].ShortDescription
				print(reformBranchDesc, reform.ShortDescription, reform.HeaderDescription, reform.Pedia, reform.HelpBonus, reform.HelpPenalty)
				JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_REFORM_PASSED_ENDS_TEXT", reformBranchDesc, reform.ShortDescription, reform.HeaderDescription, reform.Pedia, reform.HelpBonus, reform.HelpPenalty), convertTextKey("TXT_KEY_JFD_REFORM_PASSED_ENDS_SHORT_TEXT", reformBranchDesc), false, -1, -1)
			end
		end
		for row in GameInfo.JFD_Reform_Negates("ReformType = '" .. reform.Type .. "'") do
			local policyID = GameInfoTypes["POLICY_" .. row.ReformNegateType]
			player:RevokePolicy(policyID)
			LuaEvents.JFD_ReformRevoked(playerID, GameInfoTypes[row.ReformType])
		end
	else
		player:RevokePolicy(policyID)
		LuaEvents.JFD_ReformRevoked(playerID, reformID)
	end
	if isFree then
		player:ChangeNumFreeReforms(-1)
	else
		local reformCooldown = player:CalculateReformCooldown()
		player:SetReformCooldown(reformCooldown)
		player:SetReformCooldownRate(1)
	end
	if player:HasGovernment() then
		local reformAnarchySentiment, reformAnarchyTurns, reformAnarchyCooldownTurns = player:GetAnarchySentiment()
		if reformAnarchyTurns > 0 then
			player:ChangeAnarchyNumTurns(reformAnarchyTurns)
			player:ChangeReformCooldown(reformAnarchyCooldownTurns)
			if player:IsHuman() then
				Events.AudioPlay2DSound("AS2D_JFD_REFORM_ANARCHY")
				JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_REFORM_PROTESTS_NOTIFICATION_TEXT"), convertTextKey("TXT_KEY_JFD_REFORM_PROTESTS_NOTIFICATION_SHORT_TEXT"), false)
			else
				JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_REFORM_PROTESTS_TEXT", player:GetCivilizationDescription()))
			end
		end
	end
	if reform.IsTitled then
		player:SetLeaderTitle(player:GetLeaderTitleShort())
		player:SetGovernmentTitle(player:GetGovernmentTitle())
	end
	if (reform.IsSovereignty and player:IsHuman()) then Events.SerialEventGameDataDirty() end
	if reform.ResetsLegislature then player:ResetLegislature(player:GetLateGamePolicyTree()) end
end

--Player:SetHasAllDefaultReforms
function Player.SetHasAllDefaultReforms(player, governmentID, isGovernmentFounding)
	local governmentType = GameInfo.JFD_Governments[governmentID].Type
	local hasGovernment = player:HasGovernment()
	for row in GameInfo.JFD_Reforms("IsDisabled = 0 AND DefaultActive = 1 AND PrereqGovernment = '" .. governmentType .. "' AND PrereqReform IS NOT NULL") do
		if player:HasReform(GameInfoTypes[row.PrereqReform]) then
			player:SetHasReform(row.ID, true, isGovernmentFounding)
		end
	end
	for row in GameInfo.JFD_Reforms("IsDisabled = 0 AND DefaultActive = 1 AND PrereqGovernment = '" .. governmentType .. "' AND PrereqReform IS NULL") do
		player:SetHasReform(row.ID, true, isGovernmentFounding)
	end
	if (not hasGovernment) then
		for row in GameInfo.JFD_Reforms("IsDisabled = 0 AND DefaultActive = 1 AND PrereqGovernment IS NULL AND PrereqReform IS NOT NULL") do
			if player:HasReform(GameInfoTypes[row.PrereqReform]) then
				player:SetHasReform(row.ID, true, isGovernmentFounding)
			end
		end
		for row in GameInfo.JFD_Reforms("IsDisabled = 0 AND DefaultActive = 1 AND PrereqGovernment IS NULL AND PrereqReform IS NULL") do
			player:SetHasReform(row.ID, true, isGovernmentFounding)
		end
		for row in GameInfo.JFD_Reforms("PrereqGovernment IS NOT NULL and PrereqGovernment <> '" .. governmentType .. "'") do
			if player:HasReform(row.ID) then
				player:SetHasReform(row.ID, false, isGovernmentFounding)
			end
		end
		local civilizationID = player:GetCivilizationType()
		local civilizationType = GameInfo.Civilizations[civilizationID].Type
		for row in GameInfo.Civilization_JFD_Reforms("CivilizationType = '" .. civilizationType .. "' AND StartsWith = 1") do
			local reformID = GameInfoTypes[row.ReformType]
			player:SetHasReform(row.ID, true, isGovernmentFounding)
		end
	end
end

--Player:CanHaveReform
function Player.CanHaveReform(player, reformID, skipsCost)
	local reform = GameInfo.JFD_Reforms[reformID]
	if reform.IsDisabled then return false, false, "" end
	if player:HasReform(reformID) then return false, false, "" end
	if player:IsAnarchy() then
		return false, false, "[ICON_RESISTANCE]" 
	end
	if (not skipsCost) then
		if player:GetSovereignty() < player:GetReformCost(reformID) then 
			return false, false, "[ICON_JFD_SOVEREIGNTY]" 
		end
	end
	local numCityStateFriendsReq = reform.RequiresNumCityStateFriends
	-- if (numCityStateFriendsReq > 0 and JFD_GetNumBefriendedCityStates(playerID) < numCityStateFriendsReq) 
		-- then return false, false, "[ICON_LOCKED]" 
	-- end
	local requiresStateReligion = reform.RequiresStateReligion
	if (requiresStateReligion and (not player:HasStateReligion())) then 
		return false, false, "[ICON_LOCKED]" 
	end
	local requiresFoundedReligion = reform.RequiresFoundedReligion
	if (requiresFoundedReligion and player:GetReligionCreatedByPlayer() <= 0) then 
		return false, false, "[ICON_LOCKED]" 
	end
	local requiresEnhancedReligion = reform.RequiresEnhancedReligion
	if (requiresEnhancedReligion and (not player:HasEnhancedReligion())) then 
		return false, false, "[ICON_LOCKED]" 
	end
	local prereqReformID = GameInfoTypes[reform.PrereqReform]
	if (prereqReformID and (not player:HasReform(prereqReformID))) then 
		return false, false, "[ICON_LOCKED]" 
	end
	local prereqEraID = GameInfoTypes[reform.PrereqEra]
	if (prereqEraID and player:GetCurrentEra() < prereqEraID) then 
		return false, false, "[ICON_LOCKED]"
	end
	local prereqTechID = GameInfoTypes[reform.PrereqTech]
	if (prereqTechID and (not player:HasTech(prereqTechID))) then 
		return false, false, "[ICON_LOCKED]" 
	end
	local prereqPolicyID = GameInfoTypes[reform.PrereqPolicy]
	if (prereqPolicyID and (not player:HasPolicy(prereqPolicyID))) then 
		return false, false, "[ICON_LOCKED]" 
	end
	if player:GetReformCooldown() > 0 then return false, true, "[ICON_JFD_REFORM_COOLDOWN]" end
	return true, true, ""
end
----------------
-- COST
----------------
--Player:GetReformCost
function Player.GetReformCost(player, reformID)
	local reform = GameInfo.JFD_Reforms[reformID]
	local sovereigntyCost = reform.Cost
	for row in GameInfo.JFD_Governments("ReformCostMod <> 0") do
		if player:GetGovernment() == row.ID then
			sovereigntyCost = sovereigntyCost + ((row.ReformCostMod*sovereigntyCost)/100)
		end
	end
	--Check Buildings
	for row in GameInfo.Building_JFD_SovereigntyMods("ReformCostMod <> 0 AND (ReformBranchType IS NULL) OR (ReformBranchType = '" .. reform.ReformBranchType .. "')") do
		if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
			sovereigntyCost = sovereigntyCost + ((row.ReformCostMod*sovereigntyCost)/100)
		end
	end
	--Check Reforms
	for row in GameInfo.JFD_Reforms("ReformCostMod <> 0") do
		if player:HasReform(row.ID) then
			sovereigntyCost = sovereigntyCost + ((row.ReformCostMod*sovereigntyCost)/100)
		end
	end
	for row in GameInfo.JFD_Reforms("ReformCostModPerPuppet <> 0") do
		if player:HasReform(row.ID) then
			local reformCostModPerPuppet = (row.ReformCostModPerPuppet*player:GetNumPuppetCities())
			sovereigntyCost = sovereigntyCost + ((reformCostModPerPuppet*sovereigntyCost)/100)
		end
	end
	if reform.ReformBranchType == "REFORM_BRANCH_JFD_GOVERNMENT" then
		for row in GameInfo.JFD_Reforms("ReformCostModPerCity <> 0") do
			if player:HasReform(row.ID) then
				local reformCostModPerCity = (row.ReformCostModPerCity*player:GetNumCities())
				if reformCostModPerCity > 50 then reformCostModPerCity = 50 end
				if reformCostModPerCity < -50 then reformCostModPerCity = -50 end
				sovereigntyCost = sovereigntyCost + ((reformCostModPerCity*sovereigntyCost)/100)
			end
		end
		for row in GameInfo.JFD_Reforms("ReformCostModPerPop <> 0") do
			if player:HasReform(row.ID) then
				local reformCostModPerPop = (row.ReformCostModPerPop*player:GetTotalPopulation())
				if reformCostModPerPop > 50 then reformCostModPerPop = 50 end
				if reformCostModPerPop < -50 then reformCostModPerPop = -50 end
				sovereigntyCost = sovereigntyCost + ((reformCostModPerPop*sovereigntyCost)/100)
			end
		end
	end
	--Check Policies
	for row in GameInfo.Policy_JFD_SovereigntyMods("ReformCostMod <> 0 AND (ReformBranchType IS NULL) OR (ReformBranchType = '" .. reform.ReformBranchType .. "')") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			sovereigntyCost = sovereigntyCost + ((row.ReformCostMod*sovereigntyCost)/100)
		end
	end
	--Check Traits
	for row in GameInfo.Trait_JFD_SovereigntyMods("ReformCostMod <> 0 AND (ReformBranchType IS NULL) OR (ReformBranchType = '" .. reform.ReformBranchType .. "')") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			sovereigntyCost = sovereigntyCost + ((row.ReformCostMod*sovereigntyCost)/100)
		end
	end
	--Check Legislature
	sovereigntyCost = sovereigntyCost+player:GetReformOpinionOpposed(reformID)
	sovereigntyCost = sovereigntyCost-player:GetReformOpinionFavoured(reformID)
	if sovereigntyCost < 0 then sovereigntyCost = 0 end
	return Game.GetRound(sovereigntyCost)
end
----------------
-- COOLDOWN
----------------
--Player:CalculateReformCooldown
function Player.CalculateReformCooldown(player, returnsTT)
	local reformCooldown = defineRTPDefaultReformCooldownTurns
	local reformCooldownMod = 0
	local reformCooldownTT = ""
	--Check Governments
	local cooldownModFromGovernments = 0
	for row in GameInfo.JFD_Governments("ReformCooldownMod <> 0") do
		if player:GetGovernment() == row.ID then
			cooldownModFromGovernments = cooldownModFromGovernments + row.ReformCooldownMod
			if returnsTT then
				if cooldownModFromGovernments > 0 then
					reformCooldownTT = reformCooldownTT .. convertTextKey("TXT_KEY_JFD_GO_REFORM_COOLDOWN_TT_FROM_GOVERNMENT", "[COLOR_WARNING_TEXT]+" .. cooldownModFromGovernments .. "%[ENDCOLOR]")
				else
					reformCooldownTT = reformCooldownTT .. convertTextKey("TXT_KEY_JFD_GO_REFORM_COOLDOWN_TT_FROM_GOVERNMENT", "[COLOR_POSITIVE_TEXT]" .. cooldownModFromGovernments .. "%[ENDCOLOR]")
				end
			end
		end
	end
	--Check Buildings
	local cooldownModFromBuildings = 0
	for row in GameInfo.Building_JFD_SovereigntyMods("ReformCooldownMod <> 0") do
		if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
			cooldownModFromBuildings = cooldownModFromBuildings + row.ReformCooldownMod
			if returnsTT then
				if cooldownModFromBuildings > 0 then
					reformCooldownTT = reformCooldownTT .. convertTextKey("TXT_KEY_JFD_GO_REFORM_COOLDOWN_TT_FROM_BUILDINGS", "[COLOR_WARNING_TEXT]+" .. cooldownModFromBuildings .. "%[ENDCOLOR]")
				else
					reformCooldownTT = reformCooldownTT .. convertTextKey("TXT_KEY_JFD_GO_REFORM_COOLDOWN_TT_FROM_BUILDINGS", "[COLOR_POSITIVE_TEXT]" .. cooldownModFromBuildings .. "%[ENDCOLOR]")
				end
			end
		end
	end
	--Check Reforms
	local cooldownModFromReforms = 0
	for row in GameInfo.JFD_Reforms("ReformCooldownMod <> 0") do
		if player:HasReform(row.ID) then
			cooldownModFromReforms = cooldownModFromReforms + row.ReformCooldownMod
			if returnsTT then
				if cooldownModFromReforms > 0 then
					reformCooldownTT = reformCooldownTT .. convertTextKey("TXT_KEY_JFD_GO_REFORM_COOLDOWN_TT_FROM_REFORMS", "[COLOR_WARNING_TEXT]+" .. cooldownModFromReforms .. "%[ENDCOLOR]")
				else
					reformCooldownTT = reformCooldownTT .. convertTextKey("TXT_KEY_JFD_GO_REFORM_COOLDOWN_TT_FROM_REFORMS", "[COLOR_POSITIVE_TEXT]" .. cooldownModFromReforms .. "%[ENDCOLOR]")
				end
			end
		end
	end
	--Check Epithets
	local cooldownModFromEpithets = 0
	for row in GameInfo.JFD_Epithet_SovereigntyMods("ReformCooldownMod <> 0") do
		if player:HasEpithet(GameInfoTypes[row.EpithetType]) then
			cooldownModFromEpithets = cooldownModFromEpithets + row.ReformCooldownMod
			if returnsTT then
				if cooldownModFromEpithets > 0 then
					reformCooldownTT = reformCooldownTT .. convertTextKey("TXT_KEY_JFD_GO_REFORM_COOLDOWN_TT_FROM_EPITHETS", "[COLOR_WARNING_TEXT]+" .. cooldownModFromEpithets .. "%[ENDCOLOR]")
				else
					reformCooldownTT = reformCooldownTT .. convertTextKey("TXT_KEY_JFD_GO_REFORM_COOLDOWN_TT_FROM_EPITHETS", "[COLOR_POSITIVE_TEXT]" .. cooldownModFromEpithets .. "%[ENDCOLOR]")
				end
			end
		end
	end
	--Check Policies
	local cooldownModFromPolicies = 0
	for row in GameInfo.Policy_JFD_SovereigntyMods("ReformCooldownMod <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			cooldownModFromPolicies = cooldownModFromPolicies + row.ReformCooldownMod
			if returnsTT then
				if cooldownModFromPolicies > 0 then
					reformCooldownTT = reformCooldownTT .. convertTextKey("TXT_KEY_JFD_GO_REFORM_COOLDOWN_TT_FROM_POLICIES", "[COLOR_WARNING_TEXT]+" .. cooldownModFromPolicies .. "%[ENDCOLOR]")
				else
					reformCooldownTT = reformCooldownTT .. convertTextKey("TXT_KEY_JFD_GO_REFORM_COOLDOWN_TT_FROM_POLICIES", "[COLOR_POSITIVE_TEXT]" .. cooldownModFromPolicies .. "%[ENDCOLOR]")
				end
			end
		end
	end
	--Check Traits
	local cooldownModFromTraits = 0
	for row in GameInfo.Trait_JFD_SovereigntyMods("ReformCooldownMod <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			cooldownModFromTraits = cooldownModFromTraits + row.ReformCooldownMod
			if returnsTT then
				if cooldownModFromTraits > 0 then
					reformCooldownTT = reformCooldownTT .. convertTextKey("TXT_KEY_JFD_GO_REFORM_COOLDOWN_TT_FROM_TRAITS", "[COLOR_WARNING_TEXT]+" .. cooldownModFromTraits .. "%[ENDCOLOR]")
				else
					reformCooldownTT = reformCooldownTT .. convertTextKey("TXT_KEY_JFD_GO_REFORM_COOLDOWN_TT_FROM_TRAITS", "[COLOR_POSITIVE_TEXT]" .. cooldownModFromTraits .. "%[ENDCOLOR]")
				end
			end
		end
	end
	reformCooldownMod = cooldownModFromBuildings + cooldownModFromEpithets + cooldownModFromReforms + cooldownModFromPolicies + cooldownModFromGovernments
	reformCooldown = reformCooldown + Game.GetRound((reformCooldownMod*reformCooldown)/100)
	reformCooldownTT = convertTextKey("TXT_KEY_JFD_GO_REFORM_COOLDOWN_TT", reformCooldown) .. reformCooldownTT
	return reformCooldown, reformCooldownTT
end
----------------
-- FREE REFORMS
----------------
--Player:GetNumFreeReforms
function Player.GetNumFreeReforms(player)
	return JFDLC_FreeReforms[player:GetID()] or 0
end

--Player:ChangeNumFreeReforms
function Player.ChangeNumFreeReforms(player, numReforms)
	local currentNum = player:GetNumFreeReforms()
	player:SetNumFreeReforms(currentNum+numReforms)
end

--Player:SetNumFreeReforms
function Player.SetNumFreeReforms(player, numReforms)
	JFDLC_FreeReforms[player:GetID()] = numReforms
end
----------------
-- ANARCHY SENTIMENT
----------------
--Player:GetAnarchySentiment
function Player.GetAnarchySentiment(player, returnsTT)
	local anarchySentimentTT = ""
	local numAnarchySentiment = 0
	local numAnarchySentimentMod = 0
	local numAnarchyTurns = 0
	local numAnarchyCooldownTurns = 0 
	local numAnarchySentimentLegislature = 0
	if (not player:HasLegislature()) then
		numAnarchySentimentLegislature = numAnarchySentimentLegislature + player:GetNumReforms(true)
		numAnarchySentimentLegislature = (numAnarchySentimentLegislature*defineRTPNoLegislatureAnarchyPenalty)
	end
	local numAnarchySentimentReforms = 0
	for row in GameInfo.JFD_Reforms("AnarchySentimentMod <> 0") do
		if player:HasReform(row.ID) then
			numAnarchySentimentReforms = numAnarchySentimentReforms + row.AnarchySentimentMod
		end
	end
	local numAnarchySentimentRevolutionaries  = player:GetPoliticPercent(politicRevolutionariesID) + player:GetPoliticPercent(politicRevolutionariesRID) + player:GetPoliticPercent(politicRevolutionariesTID) + player:GetPoliticPercent(politicRevolutionariesHREID)
	if returnsTT then
		if numAnarchySentimentLegislature > 0 then
			anarchySentimentTT = anarchySentimentTT .. Locale.ConvertTextKey("TXT_KEY_JFD_GO_ANARCHY_TT_FROM_REFORMS_LEGISLATURE", "+" .. numAnarchySentimentLegislature)
		end
		if numAnarchySentimentReforms > 0 then
			anarchySentimentTT = anarchySentimentTT .. Locale.ConvertTextKey("TXT_KEY_JFD_GO_ANARCHY_TT_FROM_REFORMS", "+" .. numAnarchySentimentReforms)
		end
		if numAnarchySentimentReforms < 0 then
			anarchySentimentTT = anarchySentimentTT .. Locale.ConvertTextKey("TXT_KEY_JFD_GO_ANARCHY_TT_FROM_REFORMS", numAnarchySentimentReforms)
		end
		if numAnarchySentimentRevolutionaries ~= 0 then
			anarchySentimentTT = anarchySentimentTT .. Locale.ConvertTextKey("TXT_KEY_JFD_GO_ANARCHY_TT_FROM_REVOLUTIONARIES", numAnarchySentimentRevolutionaries)
		end
	end
	numAnarchySentiment = numAnarchySentimentLegislature + numAnarchySentimentReforms + numAnarchySentimentRevolutionaries
	numAnarchySentimentMod = math.floor(numAnarchySentiment/100)
	numAnarchyTurns = numAnarchySentimentMod*defineRTPDefaultAnarchyTurns
	numAnarchyCooldownTurns = ((player:CalculateReformCooldown()*defineRTPDefaultAnarchyCooldownTurns)/100)*numAnarchySentimentMod
	return numAnarchySentiment, Game.GetRound(numAnarchyTurns), Game.GetRound(numAnarchyCooldownTurns), anarchySentimentTT
end
----------------
-- AI PREFERENCE
----------------
--Player:GetReformBranchAlignment
function Player.GetReformBranchAlignment(player, reformBranchType)
	local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
	local flavourType = nil
	local flavourTypeAlt = nil
	for row in GameInfo.JFD_ReformBranch_Flavours("ReformBranchType = '" .. reformBranchType .. "'") do
		flavourType = row.FlavourType
		flavourTypeAlt = row.AltFlavourType
		break
	end
	local leaderFlavour = player:GetFlavorValue(flavourType)
	if (not leaderFlavour) or leaderFlavour <= 0 then leaderFlavour = player:GetFlavorValue(flavourTypeAlt) end
	local alignment = "REFORM_CENTRE"
	for row in GameInfo.JFD_ReformBranch_Alignment("ReformBranchType = '" .. reformBranchType .. "' AND '" .. leaderFlavour .. "' >= MinRange AND '" .. leaderFlavour .. "' <= MaxRange") do
		alignment = row.Alignment
		break
	end
	return alignment
end
----------------
-- INDEX
----------------
--Player:GetReformIdeologyIndex
function Player.GetReformIdeologyIndex(player, isAutocracy, isFreedom, isOrder)
	local indexAutocracy = 0
	if isAutocracy then
		for row in GameInfo.JFD_Reforms("AutocracyIndex = 1") do
			if player:HasReform(row.ID) then
				indexAutocracy = indexAutocracy + row.AutocracyIndex
			end
		end
		return indexAutocracy
	end
	local indexFreedom = 0
	if isFreedom then
		for row in GameInfo.JFD_Reforms("FreedomIndex = 1") do
			if player:HasReform(row.ID) then
				indexFreedom = indexFreedom + row.FreedomIndex
			end
		end
		return indexFreedom
	end
	local indexOrder = 0
	if isOrder then
		for row in GameInfo.JFD_Reforms("OrderIndex = 1") do
			if player:HasReform(row.ID) then
				indexOrder = indexOrder + row.OrderIndex
			end
		end
		return indexOrder
	end
	return indexAutocracy, indexFreedom, indexOrder
end
----------------
-- TEXT
----------------
--Player:GetReformHelpTT
function Player.GetReformHelpTT(player, reformID)
	local playerTeam = Teams[player:GetTeam()]
	local hasReform = player:HasReform(reformID)
	local canHaveReform = player:CanHaveReform(reformID)
	local reform = GameInfo.JFD_Reforms[reformID]
	local reformBranch = reform.ReformBranchType
	local reformHelp = reform.Help
	local reformOpinions = nil
	if player:HasLegislature() then reformOpinions = "[NEWLINE]----------[NEWLINE]" end
	local reformAlignment = reform.Alignment
	--Suffrage Support
	if reformBranch == "REFORM_BRANCH_JFD_GOVERNMENT" or reformBranch == "REFORM_BRANCH_JFD_FOREIGN" then
		for row in GameInfo.JFD_Reforms("ReformCostModPerCity <> 0") do
			if player:HasReform(row.ID) then
				local reformCostModPerCity = (row.ReformCostModPerCity*-1)
				reformCostModPerCity = (reformCostModPerCity*player:GetNumCities())
				if reformCostModPerCity > 30 then reformCostModPerCity = 30 end
				if (not reformOpinions) then reformOpinions = "" end
				reformOpinions = reformOpinions .. "[ICON_PLUS]" .. convertTextKey("TXT_KEY_JFD_REFORM_SUPPORT", "TXT_KEY_JFD_SUFFRAGE_THE_CITIES", reformCostModPerCity) 
				reformOpinions = reformOpinions .. "[NEWLINE]"
			end
		end
		for row in GameInfo.JFD_Reforms("ReformCostModPerPop <> 0") do
			if player:HasReform(row.ID) then
				local reformCostModPerPop = (row.ReformCostModPerPop*-1)
				reformCostModPerPop = (reformCostModPerPop*player:GetTotalPopulation())
				if reformCostModPerPop > 30 then reformCostModPerPop = 30 end
				if (not reformOpinions) then reformOpinions = "" end
				reformOpinions = reformOpinions .. "[ICON_PLUS]" .. convertTextKey("TXT_KEY_JFD_REFORM_SUPPORT", "TXT_KEY_JFD_SUFFRAGE_THE_PEOPLE", reformCostModPerPop) 
				reformOpinions = reformOpinions .. "[NEWLINE]"
			end
		end
	end
	--Political Party Opposition/Support
	local government = GameInfo.JFD_Governments[player:GetGovernment()]
	for politic in GameInfo.JFD_Politics("PrereqGovernment = '" .. government.Type .. "'") do
		local politicsPercent = player:GetPoliticPercent(politic.ID)
		if politicsPercent > 0 then
			local isSupport = false
			local politicsIcon = GameInfo.JFD_Politics[ politic.ID].FontIcon
			for row in GameInfo.JFD_Politics_FavouredReforms("PoliticsType = '" .. politic.Type .. "' AND ReformBranchType = '" .. GameInfo.JFD_Reforms[reformID].ReformBranchType .. "' AND (ReformAlignment = '" .. reformAlignment .. "' OR ReformAlignment IS NULL)") do
				isSupport = true
				if (not reformOpinions) then reformOpinions = "" end
				reformOpinions = reformOpinions .. "[ICON_PLUS]" .. convertTextKey("TXT_KEY_JFD_REFORM_SUPPORT", politicsIcon, politicsPercent) 
				reformOpinions = reformOpinions .. "[NEWLINE]"
			end
			for row in GameInfo.JFD_Politics_OpposedReforms("PoliticsType = '" .. politic.Type .. "' AND ReformBranchType = '" .. GameInfo.JFD_Reforms[reformID].ReformBranchType .. "' AND (ReformAlignment = '" .. reformAlignment .. "' OR ReformAlignment IS NULL)") do
				if (not reformOpinions) then reformOpinions = "" end
				if isSupport then reformOpinions = reformOpinions .. "[NEWLINE]" end
				reformOpinions = reformOpinions .. "[ICON_MINUS]" .. convertTextKey("TXT_KEY_JFD_REFORM_OPPOSITION", politicsIcon, politicsPercent) 
				reformOpinions = reformOpinions .. "[NEWLINE]"
			end
		end
	end
	--Electors
	if player:GetGovernment() == governmentHolyRomeID then
		local politicsFavour, politicsOppose = player:GetReformOpinionFactionElectors(reformID)
		if politicsFavour > 0 then
			if (not reformOpinions) then reformOpinions = "" end
			reformOpinions = reformOpinions .. "[ICON_PLUS]" .. convertTextKey("TXT_KEY_JFD_REFORM_SUPPORT", "[ICON_JFD_ELECTOR]", politicsFavour) 
			reformOpinions = reformOpinions .. "[NEWLINE]"
		end
		if politicsOppose > 0 then
			if (not reformOpinions) then reformOpinions = "" end
			reformOpinions = reformOpinions .. "[ICON_MINUS]" .. convertTextKey("TXT_KEY_JFD_REFORM_OPPOSITION", "[ICON_JFD_ELECTOR]", politicsOppose) 
			reformOpinions = reformOpinions .. "[NEWLINE]"
		end
	end
	--Clergy
	if player:GetGovernment() == governmentTheocracyID then
		local politicsFavour, politicsOppose = player:GetReformOpinionFactionClergy(reformBranch, reform.Alignment)
		if politicsFavour > 0 then
			if (not reformOpinions) then reformOpinions = "" end
			reformOpinions = reformOpinions .. "[ICON_PLUS]" .. convertTextKey("TXT_KEY_JFD_REFORM_SUPPORT", "[ICON_JFD_CLERGY]", politicsFavour) 
			reformOpinions = reformOpinions .. "[NEWLINE]"
		end
		if politicsOppose > 0 then
			if (not reformOpinions) then reformOpinions = "" end
			reformOpinions = reformOpinions .. "[ICON_MINUS]" .. convertTextKey("TXT_KEY_JFD_REFORM_OPPOSITION", "[ICON_JFD_CLERGY]", politicsOppose) 
			reformOpinions = reformOpinions .. "[NEWLINE]"
		end
	end
	if (not reformOpinions) then reformOpinions = "[NEWLINE]" end
	local reformHelpTT = convertTextKey(reformHelp, reformOpinions)
	--Active
	if hasReform then
		reformHelpTT = reformHelpTT .. "[NEWLINE]" .. convertTextKey("TXT_KEY_JFD_REFORM_PASSED")
	else
		if (canHaveReform and (reform.ResetsAssembly or reform.ResetsSenate or reform.ResetsParliament or reform.ResetsHolySynod or reform.ResetsImperialDiet)) then
			reformHelpTT = reformHelpTT .. "[NEWLINE]" .. convertTextKey("TXT_KEY_JFD_REFORM_RESETS_LEGISLATURE")
		else
			--reformHelpTT = reformHelpTT .. "[NEWLINE]" 
			--Warnings
			if player:IsAnarchy() then reformHelpTT = reformHelpTT .. "[NEWLINE]" .. convertTextKey("TXT_KEY_JFD_REFORM_ANARCHY")  end
			local reformCost = player:GetReformCost(reformID)
			if (player:GetSovereignty() < reformCost) then
				reformHelpTT = reformHelpTT .. "[NEWLINE]" .. convertTextKey("TXT_KEY_JFD_REFORM_NOT_ENOUGH_SOVEREIGNTY", reformCost) 
			end
			local reformCooldown = player:GetReformCooldown()
			if reformCooldown > 0 then 
				reformHelpTT = reformHelpTT .. "[NEWLINE]" .. convertTextKey("TXT_KEY_JFD_REFORM_COOLDOWN", reformCooldown) 
			end
			if (not canHaveReform) then
				reformHelpTT = reformHelpTT .. "[NEWLINE]" .. convertTextKey("TXT_KEY_JFD_REFORM_PREREQS_NOT_MET") 
			end		
			--Prereqs
			--local numCityStateFriendsReq = reform.RequiresNumCityStateFriends
			--if (numCityStateFriendsReq > 0 and JFD_GetNumBefriendedCityStates(playerID) < numCityStateFriendsReq) then
			--	reformHelpTT = reformHelpTT .. "[NEWLINE]" .. convertTextKey("TXT_KEY_JFD_REFORM_PREREQ_CITY_STATE_FRIENDS", numCityStateFriendsReq) 
			--end
			local prereqEraID = GameInfoTypes[reform.PrereqEra]
			if (prereqEraID and player:GetCurrentEra() < prereqEraID) then
				local prereqEraDesc = GameInfo.Eras[prereqEraID].Description
				reformHelpTT = reformHelpTT .. "[NEWLINE]" .. convertTextKey("TXT_KEY_JFD_REFORM_PREREQ_ERA", prereqEraDesc) 
			end
			local prereqTechID = GameInfoTypes[reform.PrereqTech]
			if (prereqTechID and (not playerTeam:IsHasTech(prereqTechID))) then
				local prereqTechDesc = GameInfo.Technologies[prereqTechID].Description
				reformHelpTT = reformHelpTT .. "[NEWLINE]" .. convertTextKey("TXT_KEY_JFD_REFORM_PREREQ_TECH", prereqTechDesc) 
			end
			local prereqReformID = GameInfoTypes[reform.PrereqReform]
			if (prereqReformID and (not player:HasReform(prereqReformID))) then
				local prereqReformShortDesc = GameInfo.JFD_Reforms[prereqReformID].ShortDescription
				reformHelpTT = reformHelpTT .. "[NEWLINE]" .. convertTextKey("TXT_KEY_JFD_REFORM_PREREQ_REFORM", prereqReformShortDesc) 
			end
			local prereqPolicyID = GameInfoTypes[reform.PrereqPolicy]
			if (prereqPolicyID and (not player:HasPolicy(prereqPolicyID))) then
				local prereqPolicyDesc = GameInfo.Policies[prereqPolicyID].Description
				reformHelpTT = reformHelpTT .. "[NEWLINE]" .. convertTextKey("TXT_KEY_JFD_REFORM_PREREQ_POLICY", prereqPolicyDesc) 
			end
			local requiresStateReligion = reform.RequiresStateReligion 
			if (requiresStateReligion and (not player:HasStateReligion())) then
				reformHelpTT = reformHelpTT .. "[NEWLINE]" .. convertTextKey("TXT_KEY_JFD_REFORM_PREREQ_STATE_RELIGION") 
			end
			local requiresFoundedReligion = reform.RequiresFoundedReligion 
			if requiresFoundedReligion then
				reformHelpTT = reformHelpTT .. "[NEWLINE]" .. convertTextKey("TXT_KEY_JFD_REFORM_PREREQ_FOUNDED_RELIGION") 
			end
			local requiresEnhancedReligion = reform.RequiresEnhancedReligion 
			if requiresEnhancedReligion then
				reformHelpTT = reformHelpTT .. "[NEWLINE]" .. convertTextKey("TXT_KEY_JFD_REFORM_PREREQ_ENHANCED_RELIGION") 
			end
		end
	end
	return reformHelpTT
end

--Player:GetReformsListTT
function Player.GetReformsListTT(player)
	local reformListTT = "[COLOR_JFD_SOVEREIGNTY]REFORMS[ENDCOLOR]"
	if (player:GetID() == activePlayerID or activePlayerTeam:HasEmbassyAtTeam(player:GetTeam())) then 
		--Government
		local reformsGovt = {}
		local reformGovtsCount = 1
		for row in GameInfo.JFD_Reforms("ReformBranchType = 'REFORM_BRANCH_JFD_GOVERNMENT' AND (Alignment = 'REFORM_LEFT' OR Alignment = 'REFORM_RIGHT')") do
			local reformID = row.ID
			if player:HasReform(reformID) then
				reformsGovt[reformGovtsCount] = reformID
				reformGovtsCount = reformGovtsCount + 1
			end
		end
		if #reformsGovt > 0 then
			reformListTT = reformListTT .. "[NEWLINE]-----------[NEWLINE][COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_JFD_REFORM_CATEGORY_GOVERNMENT_SHORT_DESC") .. "[ENDCOLOR][NEWLINE]-----------"
			for _, reformID in pairs(reformsGovt) do
				local reform = GameInfo.JFD_Reforms[reformID]
				local reformBranchDesc = GameInfo.JFD_ReformBranches[reform.ReformBranchType].ShortDescription
				reformListTT = reformListTT .. "[NEWLINE][ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_JFD_LEADER_PANEL_REFORM_TT", reform.ShortDescription, reform.HeaderDescription)
			end
		end
		--Legal
		local reformsLegal = {}
		local reformLegalsCount = 1
		for row in GameInfo.JFD_Reforms("ReformBranchType = 'REFORM_BRANCH_JFD_LEGAL' AND (Alignment = 'REFORM_LEFT' OR Alignment = 'REFORM_RIGHT')") do
			local reformID = row.ID
			if player:HasReform(reformID) then
				reformsLegal[reformLegalsCount] = reformID
				reformLegalsCount = reformLegalsCount + 1
			end
		end
		if #reformsLegal > 0 then
			reformListTT = reformListTT .. "[NEWLINE]-----------[NEWLINE][COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_JFD_REFORM_CATEGORY_LEGAL_SHORT_DESC") .. "[ENDCOLOR][NEWLINE]-----------"
			for _, reformID in pairs(reformsLegal) do
				local reform = GameInfo.JFD_Reforms[reformID]
				local reformBranchDesc = GameInfo.JFD_ReformBranches[reform.ReformBranchType].ShortDescription
				reformListTT = reformListTT .. "[NEWLINE][ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_JFD_LEADER_PANEL_REFORM_TT", reform.ShortDescription, reform.HeaderDescription)
			end
		end
		--Culture
		local reformsCulture = {}
		local reformCulturesCount = 1
		for row in GameInfo.JFD_Reforms("ReformBranchType = 'REFORM_BRANCH_JFD_CULTURE' AND (Alignment = 'REFORM_LEFT' OR Alignment = 'REFORM_RIGHT')") do
			local reformID = row.ID
			if player:HasReform(reformID) then
				reformsCulture[reformCulturesCount] = reformID
				reformCulturesCount = reformCulturesCount + 1
			end
		end
		if #reformsCulture > 0 then
			reformListTT = reformListTT .. "[NEWLINE]-----------[NEWLINE][COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_JFD_REFORM_CATEGORY_CULTURE_SHORT_DESC") .. "[ENDCOLOR][NEWLINE]-----------"
			for _, reformID in pairs(reformsCulture) do
				local reform = GameInfo.JFD_Reforms[reformID]
				local reformBranchDesc = GameInfo.JFD_ReformBranches[reform.ReformBranchType].ShortDescription
				reformListTT = reformListTT .. "[NEWLINE][ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_JFD_LEADER_PANEL_REFORM_TT", reform.ShortDescription, reform.HeaderDescription)
			end
		end
		--Economy
		local reformsEconomy = {}
		local reformEconomysCount = 1
		for row in GameInfo.JFD_Reforms("ReformBranchType = 'REFORM_BRANCH_JFD_ECONOMY' AND (Alignment = 'REFORM_LEFT' OR Alignment = 'REFORM_RIGHT')") do
			local reformID = row.ID
			if player:HasReform(reformID) then
				reformsEconomy[reformEconomysCount] = reformID
				reformEconomysCount = reformEconomysCount + 1
			end
		end
		if #reformsEconomy > 0 then
			reformListTT = reformListTT .. "[NEWLINE]-----------[NEWLINE][COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_JFD_REFORM_CATEGORY_ECONOMY_SHORT_DESC") .. "[ENDCOLOR][NEWLINE]-----------"
			for _, reformID in pairs(reformsEconomy) do
				local reform = GameInfo.JFD_Reforms[reformID]
				local reformBranchDesc = GameInfo.JFD_ReformBranches[reform.ReformBranchType].ShortDescription
				reformListTT = reformListTT .. "[NEWLINE][ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_JFD_LEADER_PANEL_REFORM_TT", reform.ShortDescription, reform.HeaderDescription)
			end
		end
		--Foreign
		local reformsForeign = {}
		local reformForeignsCount = 1
		for row in GameInfo.JFD_Reforms("ReformBranchType = 'REFORM_BRANCH_JFD_FOREIGN' AND (Alignment = 'REFORM_LEFT' OR Alignment = 'REFORM_RIGHT')") do
			local reformID = row.ID
			if player:HasReform(reformID) then
				reformsForeign[reformForeignsCount] = reformID
				reformForeignsCount = reformForeignsCount + 1
			end
		end
		if #reformsForeign > 0 then
			reformListTT = reformListTT .. "[NEWLINE]-----------[NEWLINE][COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_JFD_REFORM_CATEGORY_FOREIGN_SHORT_DESC") .. "[ENDCOLOR][NEWLINE]-----------"
			for _, reformID in pairs(reformsForeign) do
				local reform = GameInfo.JFD_Reforms[reformID]
				local reformBranchDesc = GameInfo.JFD_ReformBranches[reform.ReformBranchType].ShortDescription
				reformListTT = reformListTT .. "[NEWLINE][ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_JFD_LEADER_PANEL_REFORM_TT", reform.ShortDescription, reform.HeaderDescription)
			end
		end
		--Industry
		local reformsIndustry = {}
		local reformIndustrysCount = 1
		for row in GameInfo.JFD_Reforms("ReformBranchType = 'REFORM_BRANCH_JFD_INDUSTRY' AND (Alignment = 'REFORM_LEFT' OR Alignment = 'REFORM_RIGHT')") do
			local reformID = row.ID
			if player:HasReform(reformID) then
				reformsIndustry[reformIndustrysCount] = reformID
				reformIndustrysCount = reformIndustrysCount + 1
			end
		end
		if #reformsIndustry > 0 then
			reformListTT = reformListTT .. "[NEWLINE]-----------[NEWLINE][COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_JFD_REFORM_CATEGORY_INDUSTRY_SHORT_DESC") .. "[ENDCOLOR][NEWLINE]-----------"
			for _, reformID in pairs(reformsIndustry) do
				local reform = GameInfo.JFD_Reforms[reformID]
				local reformBranchDesc = GameInfo.JFD_ReformBranches[reform.ReformBranchType].ShortDescription
				reformListTT = reformListTT .. "[NEWLINE][ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_JFD_LEADER_PANEL_REFORM_TT", reform.ShortDescription, reform.HeaderDescription)
			end
		end
		--Military
		local reformsMilitary = {}
		local reformMilitarysCount = 1
		for row in GameInfo.JFD_Reforms("ReformBranchType = 'REFORM_BRANCH_JFD_MILITARY' AND (Alignment = 'REFORM_LEFT' OR Alignment = 'REFORM_RIGHT')") do
			local reformID = row.ID
			if player:HasReform(reformID) then
				reformsMilitary[reformMilitarysCount] = reformID
				reformMilitarysCount = reformMilitarysCount + 1
			end
		end
		if #reformsMilitary > 0 then
			reformListTT = reformListTT .. "[NEWLINE]-----------[NEWLINE][COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_JFD_REFORM_CATEGORY_MILITARY_SHORT_DESC") .. "[ENDCOLOR][NEWLINE]-----------"
			for _, reformID in pairs(reformsMilitary) do
				local reform = GameInfo.JFD_Reforms[reformID]
				local reformBranchDesc = GameInfo.JFD_ReformBranches[reform.ReformBranchType].ShortDescription
				reformListTT = reformListTT .. "[NEWLINE][ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_JFD_LEADER_PANEL_REFORM_TT", reform.ShortDescription, reform.HeaderDescription)
			end
		end
		--Religion
		local reformsReligion = {}
		local reformReligionsCount = 1
		for row in GameInfo.JFD_Reforms("ReformBranchType = 'REFORM_BRANCH_JFD_RELIGION' AND (Alignment = 'REFORM_LEFT' OR Alignment = 'REFORM_RIGHT')") do
			local reformID = row.ID
			if player:HasReform(reformID) then
				reformsReligion[reformReligionsCount] = reformID
				reformReligionsCount = reformReligionsCount + 1
			end
		end
		if #reformsReligion > 0 then
			reformListTT = reformListTT .. "[NEWLINE]-----------[NEWLINE][COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_JFD_REFORM_CATEGORY_RELIGION_SHORT_DESC") .. "[ENDCOLOR][NEWLINE]-----------"
			for _, reformID in pairs(reformsReligion) do
				local reform = GameInfo.JFD_Reforms[reformID]
				local reformBranchDesc = GameInfo.JFD_ReformBranches[reform.ReformBranchType].ShortDescription
				reformListTT = reformListTT .. "[NEWLINE][ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_JFD_LEADER_PANEL_REFORM_TT", reform.ShortDescription, reform.HeaderDescription)
			end
		end
		if reformListTT ~= "" then
			--reformListTT = "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_JFD_LEADER_PANEL_TT_REFORMS") .. reformListTT
		end
	else
		reformListTT = Locale.ConvertTextKey("TXT_KEY_JFD_LEADER_PANEL_TT_EMBASSY_REQ")
	end
	return reformListTT
end
------------------------------------------------------------------------------------------------------------------------
-- PRIVY COUNCILLORS
------------------------------------------------------------------------------------------------------------------------
--Player:HasPrivyCouncillor
function Player.HasPrivyCouncillor(player, privyCouncillorID)
	local privyCouncillor = GameInfo.JFD_PrivyCouncillors[privyCouncillorID]	
	for row in GameInfo.JFD_PrivyCouncillor_GreatPeople("PrivyCouncillorType = '" .. privyCouncillor.Type .. "'") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			return true
		end
	end
	return false
end

--Player:GetPrivyCouncillorType
function Player.GetPrivyCouncillorType(player, unitClass)
	for row in GameInfo.JFD_PrivyCouncillor_GreatPeople("UnitClassType = '" .. unitClass .. "'") do
		return row.PrivyCouncillorType
	end
	return nil
end

--Player:GetPrivyCouncillorUnitClassType
function Player.GetPrivyCouncillorUnitClassType(player, privyCouncillorID)
	local privyCouncillor = GameInfo.JFD_PrivyCouncillors[privyCouncillorID]
	for row in GameInfo.JFD_PrivyCouncillor_GreatPeople("PrivyCouncillorType = '" .. privyCouncillor.Type .. "'") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			return row.UnitClassType
		end
	end
	return nil
end
------------------------------------------------------------------------------------------------------------------------
-- TITLES
------------------------------------------------------------------------------------------------------------------------
--Player:GetUniqueTitle
function Player.GetUniqueTitle(player, titleType, isReligious)
	local civType = nil
	local cultureID = player:GetCultureType()
	local cultureType = GameInfo.JFD_CultureTypes[cultureID].Type
	if (not titleType) then return end
	if isReligious and player:HasStateReligion() then
		local religionType = GameInfo.Religions[player:GetStateReligion()].Type
		civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
		for row in GameInfo.Civilization_JFD_Titles("CivilizationType = '" .. civType .. "' AND DefaultTitle = '" .. titleType .. "'") do
			return row.UniqueTitle, row.UseAdjective
		end
		for row in GameInfo.Religion_JFD_Titles("ReligionType = '" .. religionType .. "' AND DefaultTitle = '" .. titleType .. "'") do
			return row.UniqueTitle, row.UseAdjective, row.UseCapitalName
		end
		for row in GameInfo.JFD_CultureType_Titles("CultureType = '" .. cultureType .. "' AND DefaultTitle = '" .. titleType .. "'") do
			return row.UniqueTitle, row.UseAdjective, false, true
		end
		return
	end
	if player:IsMinorCiv() then
		civType = GameInfo.MinorCivilizations[player:GetMinorCivType()].Type
		for row in GameInfo.MinorCivilization_JFD_Titles("MinorCivilizationType = '" .. civType .. "'") do
			return row.UniqueTitle, row.UseAdjective
		end
		for row in GameInfo.JFD_CultureType_Titles("CultureType = '" .. cultureType .. "' AND DefaultTitle = '" .. titleType .. "'") do
			return row.UniqueTitle, row.UseAdjective, false, true
		end
		return
	else
		civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
		for row in GameInfo.Civilization_JFD_Titles("CivilizationType = '" .. civType .. "' AND DefaultTitle = '" .. titleType .. "'") do
			return row.UniqueTitle, row.UseAdjective
		end
		for row in GameInfo.JFD_CultureType_Titles("CultureType = '" .. cultureType .. "' AND DefaultTitle = '" .. titleType .. "'") do
			return row.UniqueTitle, row.UseAdjective, false, true
		end
		return
	end
end
----------------------
-- LEADER
----------------------
--Player:GetLeaderTitle
local buildingTempleHeavenID 		= GameInfoTypes["BUILDING_JFD_TEMPLE_HEAVEN"]
local reformLegitimacyDivineRightID = GameInfoTypes["REFORM_JFD_LEGITIMACY_DIVINE_RIGHT"]
local reformStateEmpireID 		    = GameInfoTypes["REFORM_JFD_STATE_EMPIRE"]
function Player.GetLeaderTitle(player)
	local playerID = player:GetID()
	local civName = player:GetCivilizationShortDescription()
	local leaderName = convertTextKey(player:GetDefaultName())
	local dominantBranchID = player:GetDominantPolicyBranchForTitle()
	local leaderFullTitle = leaderName
	if (dominantBranchID > -1 and (not userSettingEpithetsCore)) then
		local socialPolicyShortDesc = GameInfo.PolicyBranchTypes[dominantBranchID].TitleShort
		leaderFullTitle = leaderName .. " " .. convertTextKey(socialPolicyShortDesc)
	elseif userSettingEpithetsCore then
		local epithetID = player:GetEpithetType()
		if epithetID then
			local epithetShortDesc = player:GetEpithetShortDescription(epithetID)
			leaderName = leaderName .. " " .. convertTextKey(epithetShortDesc)
			leaderFullTitle = leaderName
		end
	end
	local hasDivineRight = player:HasReform(reformLegitimacyDivineRightID)
	if (player:GetLateGamePolicyTree() == ideologyAutocracyID and player:HasReform(reformStateEmpireID)) then
		if hasDivineRight then
			leaderFullTitle = leaderFullTitle .. ", " .. convertTextKey("TXT_KEY_JFD_BY_THE_GRACE_OF_GOD_AND_WILL_OF_NATION")
		else
			leaderFullTitle = leaderFullTitle .. ", " .. convertTextKey("TXT_KEY_JFD_BY_THE_WILL_OF_NATION")
		end
	elseif hasDivineRight then
		leaderFullTitle = leaderFullTitle .. ", " .. convertTextKey("TXT_KEY_JFD_BY_THE_GRACE_OF_GOD")
	end
	if player:HasBuilding(buildingTempleHeavenID) then
		if player:IsLeaderFeminine() then
			leaderFullTitle = leaderFullTitle .. ", " .. convertTextKey("TXT_KEY_JFD_DAUGHTER_OF_HEAVEN")
		else
			leaderFullTitle = leaderFullTitle .. ", " .. convertTextKey("TXT_KEY_JFD_SON_OF_HEAVEN")
		end
	end
	if player:GetGovernment() == governmentHolyRomeID then
		leaderFullTitle = leaderFullTitle .. ", " .. convertTextKey("TXT_KEY_JFD_BLANK_TITLE_LEADER_GOVT_HRE", player:GetLeaderTitleShort(), player:GetLeaderTitleShort(governmentMonarchyID), civName)
	elseif player:GetGovernment() == governmentTheocracyID then
		leaderFullTitle = leaderFullTitle .. ", " .. convertTextKey("TXT_KEY_JFD_BLANK_TITLE_LEADER_GOVT", player:GetLeaderTitleShort(), "the " .. player:GetCivilizationDescription())
	else
		leaderFullTitle = leaderFullTitle .. ", " .. convertTextKey("TXT_KEY_JFD_BLANK_TITLE_LEADER_GOVT", player:GetLeaderTitleShort(), civName)
	end
	for city in player:Cities() do
		if (city:IsOriginalCapital() and city:GetOriginalOwner() ~= playerID) then	
			local secondaryTitle = nil, false
			local originalOwnerID = city:GetOriginalOwner()
			local originalOwner = Players[originalOwnerID]
			if (not originalOwner:IsMinorCiv()) then
				local governmentID = originalOwner:GetGovernment()
				if governmentID > -1 then
					secondaryTitle = originalOwner:GetLeaderTitleShort(originalOwner:GetGovernment(), false, playerID)
				end
			end
			if secondaryTitle then
				if player:IsLeaderFeminine() then secondaryTitle = secondaryTitle .. "_FEMININE" end
				leaderFullTitle = leaderFullTitle .. ", " .. convertTextKey("TXT_KEY_JFD_BLANK_TITLE_LEADER_GOVT", secondaryTitle, originalOwner:GetCivilizationShortDescription())
			end
		end
	end
	for city in player:Cities() do
		if (city:IsOriginalCapital() and city:GetOriginalOwner() ~= playerID) then	
			local originalOwnerID = city:GetOriginalOwner()
			local originalOwner = Players[originalOwnerID]
			local secondaryTitle = nil, false
			if originalOwner:IsMinorCiv() then
				for row in GameInfo.MinorCivilization_JFD_Titles("MinorCivilizationType = '" .. GameInfo.MinorCivilizations[originalOwner:GetMinorCivType()].Type .. "'") do
					secondaryTitle = row.UniqueLeaderTitle
					if (secondaryTitle and player:IsLeaderFeminine()) then secondaryTitle = secondaryTitle .. "_FEMININE" end
				end
			end
			if secondaryTitle then
				leaderFullTitle = leaderFullTitle .. ", " .. convertTextKey("TXT_KEY_JFD_BLANK_TITLE_LEADER_GOVT", secondaryTitle, originalOwner:GetCivilizationShortDescription())
			end
		end
	end
	return leaderFullTitle
end

--Player:GetLeaderTitleShort
local eraMedievalID			= GameInfoTypes["ERA_MEDIEVAL"]
local religionCatholicismID	= GameInfoTypes["RELIGION_CHRISTIANITY"]
function Player.GetLeaderTitleShort(player, thisGovernmentID, isLate, otherPlayerID)
	local isLeaderFeminine = player:IsLeaderFeminine(playerID)
	if otherPlayerID then isLeaderFeminine = Players[otherPlayerID]:IsLeaderFeminine() end
	if (player:HasGovernment() or thisGovernmentID and thisGovernmentID > -1) then
		local governmentID = thisGovernmentID
		if (not governmentID) then governmentID = player:GetGovernment() end
		local government = GameInfo.JFD_Governments[governmentID]
		local leaderTitleText = ""
		for row in GameInfo.JFD_Government_ReformTitles("GovernmentType = '" .. government.Type .. "' AND TitleLeader IS NOT NULL") do
			if ((not row.ReformType) or player:HasReform(GameInfoTypes[row.ReformType])) then
				leaderTitleText = row.TitleLeader
			end
		end
		if (player:GetCurrentEra() > eraMedievalID or isLate) then
			for row in GameInfo.JFD_Government_ReformTitles("GovernmentType = '" .. government.Type .. "' AND TitleLeaderLate IS NOT NULL") do
				if ((not row.ReformType) or player:HasReform(GameInfoTypes[row.ReformType])) then
					leaderTitleText = row.TitleLeaderLate 
				end
			end
		end	
		local isReligious = (governmentID == governmentTheocracyID)
		local uniqueleaderTitleText, useAdj, useCapital, isCulDiv = player:GetUniqueTitle(leaderTitleText, isReligious)
		if isLeaderFeminine then leaderTitleText = leaderTitleText .. "_FEMININE" end
		if isLeaderFeminine and uniqueleaderTitleText then uniqueleaderTitleText = uniqueleaderTitleText .. "_FEMININE" end
		return uniqueleaderTitleText or leaderTitleText
	else
		local leaderTitleText = "TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_LEADER"
		local uniqueleaderTitleText, useAdj, useCapital, isCulDiv = player:GetUniqueTitle(leaderTitleText)
		if isLeaderFeminine then leaderTitleText = leaderTitleText .. "_FEMININE" end
		if isLeaderFeminine and uniqueleaderTitleText then uniqueleaderTitleText = uniqueleaderTitleText .. "_FEMININE" end
		return uniqueleaderTitleText or leaderTitleText
	end
end

--Player:SetLeaderTitle
function Player.SetLeaderTitle(player, leaderTitle)
	local leaderName = convertTextKey(player:GetDefaultName())
	local leaderTitleText = convertTextKey("TXT_KEY_JFD_BLANK_TITLE_LEADER", leaderTitle, leaderName)
	PreGame.SetLeaderName(player:GetID(), leaderTitleText)
end
----------------------
-- GOVERNMENT
----------------------
--Player:GetGovernmentTitle
function Player.GetGovernmentTitle(player, thisGovernmentID)
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	local civAdjective = player:GetCivilizationAdjective()
	local civShortDescription = player:GetCivilizationShortDescription()
	--Check for Policy-earned Names
	for row in GameInfo.Policy_JFD_CivilizationNames("CivilizationType = '" .. civType .. "'") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			civShortDescription = row.ShortDescription
			civAdjective = row.Adjective
		end
	end
	local isCivilisationPlural = player:IsCivilizationPlural()
	local useAdjective = false
	local governmentTitleText = ""
	local governmentTitleAdj = civAdjective
	if (player:HasGovernment() or thisGovernmentID) then
		local governmentID = thisGovernmentID
		if (not governmentID) then governmentID = player:GetGovernment() end
		local government = GameInfo.JFD_Governments[governmentID]
		local isReligious = (governmentID == governmentTheocracyID)
		for row in GameInfo.JFD_Government_ReformTitles("GovernmentType = '" .. government.Type .. "'") do
			if ((not row.ReformType) or player:HasReform(GameInfoTypes[row.ReformType])) then
				governmentTitleText = row.TitleGovernment
				useAdjective = row.UseAdjective
				break
			end
		end
		local uniqueGovernmentTitleText, isAdj, useCapitalName = player:GetUniqueTitle(governmentTitleText, isReligious)
		if uniqueGovernmentTitleText then 
			if isAdj then
				return convertTextKey(uniqueGovernmentTitleText, governmentTitleAdj)
			else
				if useCapitalName then civShortDescription = player:GetCapitalCity():GetName() end
				return convertTextKey(uniqueGovernmentTitleText, civShortDescription)
			end
		else
			if useAdjective then 
				return convertTextKey(governmentTitleText, governmentTitleAdj)
			else
				return convertTextKey(governmentTitleText, civShortDescription)
			end
		end
	else
		if isCivilisationPlural then return civShortDescription end
		local governmentTitleText = "TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_GOVERNMENT"
		local uniqueGovernmentTitleText, isAdj = player:GetUniqueTitle(governmentTitleText)
		if (not uniqueGovernmentTitleText) then 
			return convertTextKey(governmentTitleText, civAdjective)
		else
			if isAdj then
				return convertTextKey(uniqueGovernmentTitleText, civAdjective)
			else
				return convertTextKey(uniqueGovernmentTitleText, civShortDescription)
			end
		end
	end
end

--Player:GetGovernmentShortDescription
function Player.GetGovernmentShortDescription(player)
	if player:HasGovernment() then
		local governmentID = player:GetGovernment()
		local government = GameInfo.JFD_Governments[governmentID]
		for row in GameInfo.JFD_Government_ReformTitles("GovernmentType = '" .. government.Type .. "'") do
			if ((not row.ReformType) or player:HasReform(GameInfoTypes[row.ReformType])) then
				return row.TitleGovernmentShort, row.TitleGovernmentAdjective
			end
		end
	end
	return "TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_GOVERNMENT_SHORT", "TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_GOVERNMENT_ADJ"
end

--Player:SetGovernmentTitle
function Player.SetGovernmentTitle(player, governmentTitle)
	PreGame.SetCivilizationDescription(player:GetID(), governmentTitle)
end
----------------------
-- FACTION
----------------------
--Player:GetDominantPolitic
function Player.GetDominantPolitic(player)
	local dominantPoliticID = nil
	local dominantPoliticPercent = 0
	local governmentID = player:GetGovernment()
	local governmentType = GameInfo.JFD_Governments[governmentID].Type
	if governmentID == governmentHolyRomeID then
		for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do	
			local otherPlayer = Players[otherPlayerID]
			local electorID = otherPlayer:GetFactionElectorID()
			if (otherPlayer:IsAlive() and otherPlayer:IsMinorCiv()) then
				local politicID = nil
				if (player:GetPoliticPercent(electorID) > dominantPoliticPercent) then
					dominantPoliticID = electorID
					dominantPoliticPercent = player:GetPoliticPercent(electorID)
				end
			end
		end	
	elseif governmentID == governmentTheocracyID then
		if player:HasReform(reformTLegislatureAutocephalousID) then
			for city in player:Cities() do
				local clergyID = player:GetFactionClergyID(city)
				local politicID = nil
				if (player:GetPoliticPercent(clergyID) > dominantPoliticPercent) then
					dominantPoliticID = cityID
					dominantPoliticPercent = player:GetPoliticPercent(cityID)
				end
			end	
		elseif player:HasReform(reformTLegislatureEcumenicalID) then
			for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do	
				local otherPlayer = Players[otherPlayerID]
				local clergyID = otherPlayer:GetFactionClergyID() 
				if otherPlayer:IsAlive() then
					local politicID = nil
					if (player:GetPoliticPercent(clergyID) > dominantPoliticPercent) then
						dominantPoliticID = clergyID
						dominantPoliticPercent = player:GetPoliticPercent(clergyID)
					end
				end
			end	
		end
	else
		for row in GameInfo.JFD_Politics("PrereqGovernment = '" .. governmentType .. "'") do
			local politicID = row.ID
			if (player:GetPoliticPercent(politicID) > dominantPoliticPercent) then
				dominantPoliticID = politicID
				dominantPoliticPercent = player:GetPoliticPercent(politicID)
			end
		end
	end
	return dominantPoliticID, dominantPoliticPercent
end

--Player:GetHeadOfGovernmentTitle
function Player.GetHeadOfGovernmentTitle(player, isReligious)
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	local officeTitle = "TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE"
	if player:GetGovernment() == governmentShogunateID then return "TXT_KEY_JFD_IMP_FACTION_JFD_EMPEROR_SHORT_DESC" end
	if isReligious then
		local religionID = player:GetStateReligion()
		for row in GameInfo.Religion_JFD_Governments("ReligionType = '" .. GameInfo.Religions[religionID].Type .. "' AND OfficeTitle IS NOT NULL") do
			return row.OfficeTitle
		end
	end
	for row in GameInfo.Civilization_JFD_Governments("CivilizationType = '" .. civType .. "' AND OfficeTitle IS NOT NULL") do
		return row.OfficeTitle
	end
	return officeTitle
end

--Player:GetPoliticDescription
local politicRevolutionaryHREID		  = GameInfoTypes["ELECTOR_JFD_REVOLUTIONARY"]
local politicRevolutionaryTheocracyID = GameInfoTypes["CLERGY_JFD_REVOLUTIONARY"]
function Player.GetPoliticDescription(player, politicID, isReligious)
	local governmentID = player:GetGovernment()
	if (governmentID == governmentHolyRomeID and politicID == politicRevolutionaryHREID) then 
		return "TXT_KEY_JFD_ELECTOR_JFD_REVOLUTIONARY_UNIQUE_NAME", "[ICON_JFD_ELECTOR]"
	end
	if (governmentID == governmentShogunateID and politicID == politicRevolutionaryHREID) then 
		return "TXT_KEY_JFD_IMP_FACTION_JFD_REVOLUTIONARY_UNIQUE_NAME", "[ICON_JFD_EMPEROR]"
	end
	if (governmentID == governmentTheocracyID and politicID == politicRevolutionaryTheocracyID) then 
		return "TXT_KEY_JFD_CLERGY_JFD_REVOLUTIONARY_UNIQUE_NAME", "[ICON_JFD_CLERGY]"
	end
	if (isReligious and player:HasStateReligion()) then
		local politicDesc = "TXT_KEY_JFD_PARTY_JFD_CLERGY_DESC"
		local religionType = GameInfo.Religions[player:GetStateReligion()].Type
		for row in GameInfo.Religion_JFD_Governments("ReligionType = '" .. religionType .. "'") do
			return row.FactionName			
		end		
		return politicDesc
	else
		if (not politicID) then return end
		local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
		local politic = GameInfo.JFD_Politics[politicID]
		for row in GameInfo.Civilization_JFD_Politics("CivilizationType = '" .. civType .. "' AND PoliticsType = '" .. politic.Type .. "'") do
			return row.UniqueName, politic.FontIcon
		end
		return politic.Description, politic.FontIcon
	end
end

--Player:GetPoliticLeader
function Player.GetPoliticLeader(player)
	local headsOfGovt = {}
	local headsOfGovtCount = 1
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	if player:GetGovernment() == governmentShogunateID then
		for row in GameInfo.Civilization_JFD_HeadsOfGovernment("CivilizationType = '" .. civType .. "' AND IsEmperor = 1") do
			headsOfGovt[headsOfGovtCount] = row.HeadOfGovernmentName
			headsOfGovtCount = headsOfGovtCount + 1
		end
		if #headsOfGovt > 0 then 
			return headsOfGovt[Game.GetRandom(1,#headsOfGovt)] or headsOfGovt[1]
		end
		local cultureID = player:GetCultureType()
		for row in GameInfo.JFD_CultureType_HeadsOfGovernment("CultureType = '" .. GameInfo.JFD_CultureTypes[cultureID].Type .. "' AND IsEmperor = 1") do
			headsOfGovt[headsOfGovtCount] = row.HeadOfGovernmentName
			headsOfGovtCount = headsOfGovtCount + 1
		end
	else
		for row in GameInfo.Civilization_JFD_HeadsOfGovernment("CivilizationType = '" .. civType .. "' AND IsEmperor = 0") do
			headsOfGovt[headsOfGovtCount] = row.HeadOfGovernmentName
			headsOfGovtCount = headsOfGovtCount + 1
		end
		if #headsOfGovt > 0 then 
			return headsOfGovt[Game.GetRandom(1,#headsOfGovt)] or headsOfGovt[1]
		end
		local cultureID = player:GetCultureType()
		for row in GameInfo.JFD_CultureType_HeadsOfGovernment("CultureType = '" .. GameInfo.JFD_CultureTypes[cultureID].Type .. "' AND IsEmperor = 0") do
			headsOfGovt[headsOfGovtCount] = row.HeadOfGovernmentName
			headsOfGovtCount = headsOfGovtCount + 1
		end
	end
	if #headsOfGovt > 0 then
		return headsOfGovt[Game.GetRandom(1,#headsOfGovt)] or headsOfGovt[1]
	end
end
----------------------
-- PRIVY COUNCILLOR
----------------------
--Player:GetPrivyCouncillorTitle
function Player.GetPrivyCouncillorTitle(player, privyCouncillorID)
	local privyCouncillor = GameInfo.JFD_PrivyCouncillors[privyCouncillorID]
	local privyCouncillorType = privyCouncillor.Type
	local governmentType = GameInfo.JFD_Governments[player:GetGovernment()].Type
	for row in GameInfo.JFD_PrivyCouncillor_UniqueNames("PrivyCouncillorType = '" .. privyCouncillorType .. "' AND GovernmentType = '" .. governmentType .. "'") do
		return Locale.ConvertTextKey(row.UniqueName)
	end
	if player:HasStateReligion() then
		local religionType = GameInfo.Religions[player:GetStateReligion()].Type
		for row in GameInfo.JFD_PrivyCouncillor_UniqueNames("PrivyCouncillorType = '" .. privyCouncillorType .. "' AND ReligionType = '" .. religionType .. "'") do
			return Locale.ConvertTextKey(row.UniqueName)
		end
	end
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	for row in GameInfo.JFD_PrivyCouncillor_UniqueNames("PrivyCouncillorType = '" .. privyCouncillorType .. "' AND CivilizationType = '" .. civType .. "'") do
		return Locale.ConvertTextKey(row.UniqueName)
	end
	local cultureType = GameInfo.JFD_CultureTypes[player:GetCultureType()].Type
	for row in GameInfo.JFD_PrivyCouncillor_UniqueNames("PrivyCouncillorType = '" .. privyCouncillorType .. "' AND CultureType = '" .. cultureType .. "'") do
		return Locale.ConvertTextKey(row.UniqueName)
	end
	return Locale.ConvertTextKey(privyCouncillor.Description)
end
--=======================================================================================================================
--=======================================================================================================================







