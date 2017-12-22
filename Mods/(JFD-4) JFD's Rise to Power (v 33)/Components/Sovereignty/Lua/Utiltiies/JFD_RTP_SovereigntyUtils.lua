-- JFD_RTP_SovereigntyUtils
-- Author: JFD
-- DateCreated: 11/5/2015 11:39:54 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_CulDivUtilities.lua");
include("JFD_PietyUtils.lua");
include("JFD_CID_LoyaltyUtils.lua");
include("JFD_CID_HappinessUtils.lua");
include("JFD_RTPUtils.lua")
include("JFD_RTP_GlobalDefines.lua");
include("JFD_RTP_EpithetsUtils.lua");
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
local gameSpeedID 							 = Game.GetGameSpeedType()
local gameSpeed 							 = GameInfo.GameSpeeds[gameSpeedID]
local gameSpeedMod							 = (gameSpeed.BuildPercent/100) 

local defineDefaultAnarchyTurns				 = GameDefines["JFD_SOVEREIGNTY_DEFAULT_ANARCHY_TURNS"]
local defineDefaultAnarchyCooldownTurns		 = GameDefines["JFD_SOVEREIGNTY_DEFAULT_ANARCHY_COOLDOWN_TURNS"]
local defineDefaultLegislatureCooldown 	 	 = (GameDefines["JFD_SOVEREIGNTY_DEFAULT_LEGISLATURE_COOLDOWN"]*gameSpeedMod)
local defineDefaultLegislatureCooldownRate 	 = GameDefines["JFD_SOVEREIGNTY_DEFAULT_LEGISLATURE_COOLDOWN_RATE"]
local defineDefaultReformCooldownTurns 	 	 = (GameDefines["JFD_SOVEREIGNTY_DEFAULT_REFORM_COOLDOWN"]*gameSpeedMod)
local defineLegitimacyPopThreshold 			 = GameDefines["JFD_SOVEREIGNTY_LEGITIMACY_POPULATION_THRESHOLD"]
local defineNoLegislatureAnarchyPenalty	     = GameDefines["JFD_SOVEREIGNTY_NO_LEGISLATURE_ANARCHY_PENALTY"]
local defineNoLegislatureSovereigntyPenalty  = GameDefines["JFD_SOVEREIGNTY_NO_LEGISLATURE_SOVEREIGNTY_PENALTY"]
local defineReformCityStateCitiesMax 		 = GameDefines["JFD_SOVEREIGNTY_REFORM_CITY_STATE_MAX_CITIES"]
local defineReformCityStateCitiesSovereignty = GameDefines["JFD_SOVEREIGNTY_REFORM_CITY_STATE_SOVEREIGNTY"]
local defineReformEmpireCitiesMin 	 		 = GameDefines["JFD_SOVEREIGNTY_REFORM_EMPIRE_MIN_CITIES"]
local defineReformEmpireCitiesSovereignty 	 = GameDefines["JFD_SOVEREIGNTY_REFORM_EMPIRE_SOVEREIGNTY"]
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingEpithetsCore = JFD_GetUserSetting("JFD_RTP_EPITHETS_CORE") == 1
--=======================================================================================================================
-- MOD USE
--=======================================================================================================================
local isUsingCID = JFD_IsUsingCID()
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local activePlayerID 			= Game.GetActivePlayer()
local activePlayer 				= Players[activePlayerID]
local activePlayerTeam 			= Teams[activePlayer:GetTeam()]
local convertTextKey 			= Locale.ConvertTextKey
local mathFloor 				= math.floor
local mathCeil 					= math.ceil
local mathMax 					= math.max
local mathMin 					= math.min

local buildingClassHofburgID	= GameInfoTypes["BUILDINGCLASS_JFD_HORBURG"]
local governmentDictatorshipID 	= GameInfoTypes["GOVERNMENT_JFD_DICTATORSHIP"]
local governmentHolyRomeID 		= GameInfoTypes["GOVERNMENT_JFD_HOLY_ROME"]
local governmentMonarchyID 		= GameInfoTypes["GOVERNMENT_JFD_MONARCHY"]
local governmentRepublicID 		= GameInfoTypes["GOVERNMENT_JFD_REPUBLIC"]
local governmentTheocracyID 	= GameInfoTypes["GOVERNMENT_JFD_THEOCRACY"]

local ideologyAutocracyID		= GameInfoTypes["POLICY_BRANCH_AUTOCRACY"]
local ideologyFreedomID	 		= GameInfoTypes["POLICY_BRANCH_FREEDOM"]
local ideologyOrderID	 		= GameInfoTypes["POLICY_BRANCH_ORDER"]
------------------------------------------------------------------------------------------------------------------------
-- SOVEREIGNTY
------------------------------------------------------------------------------------------------------------------------
--JFD_CalculateSovereignty
local buildingDogesPalaceID  		= GameInfoTypes["BUILDING_JFD_DOGES_PALACE"]
local buildingVersaillesID   		= GameInfoTypes["BUILDING_JFD_VERSAILLES"]
local buildingClassChanceryID  		= GameInfoTypes["BUILDINGCLASS_JFD_CHANCERY"]
local buildingClassHighCourtID  	= GameInfoTypes["BUILDINGCLASS_JFD_HIGH_COURT"]
local buildingClassMonasteryID  	= GameInfoTypes["BUILDINGCLASS_MONASTERY"]
local loyaltyPatrioticID 			= GameInfoTypes["LOYALTY_JFD_PATRIOTIC"]
local reformCitizenshipNoneID		= GameInfoTypes["REFORM_JFD_CITIZENSHIP_NONE"]
local reformLegitimacyTraditionID	= GameInfoTypes["REFORM_JFD_LEGITIMACY_TRADITION"]
local reformStateCityStateID		= GameInfoTypes["REFORM_JFD_STATE_CITYSTATE"]
local reformStateEmpireID			= GameInfoTypes["REFORM_JFD_STATE_EMPIRE"]
local yieldSovereigntyID			= GameInfoTypes["YIELD_JFD_SOVEREIGNTY"]
function JFD_CalculateSovereignty(playerID, returnsTT)
	local player = Players[playerID]
	local capital = player:GetCapitalCity()
	if (not capital) then return 0 end
	local isHuman = player:IsHuman()
	if (not player:HasGovernment()) then return 0 end
	local governmentID = player:GetGovernment()
	local religionID = player:GetStateReligion()
	local numCities = player:GetNumCities()
	local hasNoCitizenship = JFD_HasReform(playerID, reformCitizenshipNoneID)
	if hasNoCitizenship then numCities = numCities - player:GetNumPuppetCities() end
	local hasTradition = JFD_HasReform(playerID, reformLegitimacyTraditionID)
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
	local sovFromLegitimaciesMod = JFD_GetLegitimacySovMod(playerID)
	local pietyLevelID = JFD_GetPietyLevelID(playerID)
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
	if JFD_HasReform(playerID, reformStateCityStateID) then
		if player:GetNumCities() > defineReformCityStateCitiesMax then
			sovereignty = sovereignty - defineReformCityStateCitiesSovereignty
			if returnsTT then
				sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_SOVEREIGNTY_FROM_CITY_STATE_NEGATIVE", "[COLOR_NEGATIVE_TEXT]", "-" .. defineReformCityStateCitiesSovereignty, defineReformCityStateCitiesMax+1)
			end
		else
			sovereignty = sovereignty + defineReformCityStateCitiesSovereignty
			if returnsTT then
				sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_SOVEREIGNTY_FROM_CITY_STATE_POSITIVE", "[COLOR_POSITIVE_TEXT]", "+" .. defineReformCityStateCitiesSovereignty, defineReformCityStateCitiesMax)
			end
		end	
	elseif JFD_HasReform(playerID, reformStateEmpireID) then
		if player:GetNumCities() < defineReformEmpireCitiesMin then
			sovereignty = sovereignty - defineReformEmpireCitiesSovereignty
			if returnsTT then
				sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_SOVEREIGNTY_FROM_EMPIRE_NEGATIVE", "[COLOR_NEGATIVE_TEXT]", "-" .. defineReformEmpireCitiesSovereignty, defineReformEmpireCitiesMin-1)
			end
		else
			sovereignty = sovereignty + defineReformEmpireCitiesSovereignty
			if returnsTT then
				sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_SOVEREIGNTY_FROM_EMPIRE_POSITIVE", "[COLOR_POSITIVE_TEXT]", "+" .. defineReformEmpireCitiesSovereignty, defineReformEmpireCitiesMin)
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
				if city:GetPopulation() >= defineLegitimacyPopThreshold then numPopulation = numPopulation + 1 end
				if (religionID > 0 and city:GetReligiousMajority() == religionID) then numStateReligion = numStateReligion + 1 end
				--Legitimacies (Third)
				if isUsingCID then
					local excessHappiness, excessUnhappiness = JFD_GetExcessHappiness(playerID, city, true)
					if excessHappiness > excessUnhappiness then numExcessHappiness = numExcessHappiness + 1 end
					if JFD_GetCityLoyaltyID(playerID, city) == loyaltyPatrioticID then numPatriotic = numPatriotic + 1 end	
				end
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
		if capital:GetPopulation() >= defineLegitimacyPopThreshold then numPopulation = numPopulation + 1 end
		if (religionID > 0 and capital:GetReligiousMajority() == religionID) then numStateReligion = numStateReligion + 1 end
		--Legitimacies (Third)
		if isUsingCID then
			local excessHappiness, excessUnhappiness = JFD_GetExcessHappiness(playerID, capital, true)
			if excessHappiness > excessUnhappiness then numExcessHappiness = numExcessHappiness + 1 end
			if JFD_GetCityLoyaltyID(playerID, capital) == loyaltyPatrioticID then numPatriotic = numPatriotic + 1 end	
		end
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
				if pietyLevel ~= row.SovereigntyWhenPietyLevelReq then sovWhenPietyLevel = 0 textHighlight = "[COLOR_NEGATIVE_TEXT]" end
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
		if JFD_HasReform(playerID, GameInfoTypes[row.ReformType]) then
			--Legitimacies (First)
			local sovWhenConnected = row.SovereigntyWhenConnected
			if sovWhenConnected > 0 then 
				local textHighlight = "[COLOR_POSITIVE_TEXT]"
				if numConnections == 0 then sovWhenConnected = 0 end 
				if (isHuman and numConnections < numCities) then sovWhenConnected = 0 textHighlight = "[COLOR_NEGATIVE_TEXT]" end
				if (hasTradition and sovWhenConnected > 0) then sovWhenTradition = sovWhenTradition + row.SovereigntyWhenTradition end
				sovereignty = sovereignty + sovWhenConnected
				if sovFromLegitimaciesMod ~= 0 then sovWhenConnected = sovWhenConnected + JFD_Round((sovWhenConnected*sovFromLegitimaciesMod)/100) end
				sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey(row.Help, textHighlight, sovWhenConnected)
			end
			local sovWhenGarrisoned = row.SovereigntyWhenGarrisoned
			if sovWhenGarrisoned > 0 then
				local textHighlight = "[COLOR_POSITIVE_TEXT]"
				if numGarrisons == 0 then sovWhenGarrisoned = 0 end 
				if (isHuman and numGarrisons < numCities) then sovWhenGarrisoned = 0 textHighlight = "[COLOR_NEGATIVE_TEXT]" end
				if (hasTradition and sovWhenGarrisoned > 0) then sovWhenTradition = sovWhenTradition + row.SovereigntyWhenTradition end
				sovereignty = sovereignty + sovWhenGarrisoned
				if sovFromLegitimaciesMod ~= 0 then sovWhenGarrisoned = sovWhenGarrisoned + JFD_Round((sovWhenGarrisoned*sovFromLegitimaciesMod)/100) end
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
				sovereignty = sovereignty + sovWhenSpecialist
				if sovFromLegitimaciesMod ~= 0 then sovWhenSpecialist = sovWhenSpecialist + JFD_Round((sovWhenSpecialist*sovFromLegitimaciesMod)/100) end
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
				sovereignty = sovereignty + sovWhenHighCourts
				if sovFromLegitimaciesMod ~= 0 then sovWhenHighCourts = sovWhenHighCourts + JFD_Round((sovWhenHighCourts*sovFromLegitimaciesMod)/100) end
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
				sovereignty = sovereignty + sovWhenPopulation
				if sovFromLegitimaciesMod ~= 0 then sovWhenPopulation = sovWhenPopulation + JFD_Round((sovWhenPopulation*sovFromLegitimaciesMod)/100) end
				if returnsTT then
					sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey(row.Help, textHighlight, sovWhenPopulation, defineLegitimacyPopThreshold)
				end
			end
			local sovWhenStateReligion = row.SovereigntyWhenStateReligion
			if sovWhenStateReligion > 0 then 
				local textHighlight = "[COLOR_POSITIVE_TEXT]"
				if numStateReligion == 0 then sovWhenStateReligion = 0 end 
				if (isHuman and numStateReligion < numCities) then sovWhenStateReligion = 0 textHighlight = "[COLOR_NEGATIVE_TEXT]" end
				if (hasTradition and sovWhenStateReligion > 0) then sovWhenTradition = sovWhenTradition + row.SovereigntyWhenTradition end
				sovereignty = sovereignty + sovWhenStateReligion
				if sovFromLegitimaciesMod ~= 0 then sovWhenStateReligion = sovWhenStateReligion + JFD_Round((sovWhenStateReligion*sovFromLegitimaciesMod)/100) end
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
				sovereignty = sovereignty + sovWhenExcessHappiness
				if sovFromLegitimaciesMod ~= 0 then sovWhenExcessHappiness = sovWhenExcessHappiness + JFD_Round((sovWhenExcessHappiness*sovFromLegitimaciesMod)/100) end
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
				sovereignty = sovereignty + sovWhenPatriotic
				if sovFromLegitimaciesMod ~= 0 then sovWhenPatriotic = sovWhenPatriotic + JFD_Round((sovWhenPatriotic*sovFromLegitimaciesMod)/100) end
				if returnsTT then
					sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey(row.Help, textHighlight, sovWhenPatriotic)
				end
			end
			if row.ReformType == 'REFORM_JFD_LEGITIMACY_TRADITION' then
				local textHighlight = "[COLOR_POSITIVE_TEXT]"
				if sovWhenTradition <= 0 then textHighlight = "[COLOR_NEGATIVE_TEXT]" end
				sovereignty = sovereignty + sovWhenTradition
				if sovFromLegitimaciesMod ~= 0 then sovWhenTradition = sovWhenTradition + JFD_Round((sovWhenTradition*sovFromLegitimaciesMod)/100) end
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
	--No Legislature
	--local numSovFromNoLegislature = 0
	--if ((not JFD_HasLegislature(playerID)) and (not hasDictatorship)) then
	--	numSovFromNoLegislature = numSovFromNoLegislature + JFD_GetNumReforms(playerID, true)
	--	numSovFromNoLegislature = (numSovFromNoLegislature*defineNoLegislatureSovereigntyPenalty)
	--	if returnsTT then
	--		sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_SOVEREIGNTY_FROM_NO_LEGISLATURE", numSovFromNoLegislature)
	--	end
	--end
	--sovereignty = sovereignty - numSovFromNoLegislature
	--Government Legitimacy Mods
	if (sovFromLegitimaciesMod ~= 0 and returnsTT) then
		local textHL = "[COLOR_NEGATIVE_TEXT]"
		if sovFromLegitimaciesMod > 0 then textHL = "[COLOR_POSITIVE_TEXT]" end
		sovereigntyTT = sovereigntyTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_SOVEREIGNTY_FROM_GOVERNMENT", textHL, sovFromLegitimaciesMod)
	end
	if returnsTT then 
		sovereigntyTT = sovereigntyTT .. "[NEWLINE][NEWLINE]" .. convertTextKey("TXT_KEY_JFD_SOVEREIGNTY_LEGITIMACY_HINT")
	end
	local maxSovereignty = JFD_GetMaxSovereignty(playerID)
	if sovereignty > maxSovereignty then sovereignty = maxSovereignty end
	return mathMax(sovereignty,0), sovereigntyTT
end

--JFD_GetMaxSovereignty
function JFD_GetMaxSovereignty(playerID)
	local player = Players[playerID]
	local maxSovereignty = 0
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
		if JFD_HasReform(playerID, row.ID) then
			maxSovereignty = maxSovereignty + row.MaxSovChange
		end
	end
	return maxSovereignty
end

--JFD_GetLegitimacySovMod
function JFD_GetLegitimacySovMod(playerID)
	local player = Players[playerID]
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
		if JFD_HasReform(playerID, row.ID) then
			legitimacySovMod = legitimacySovMod + row.LegitimacySovMod
		end
	end
	return legitimacySovMod
end
-------------------------------
-- TOP PANEL
-------------------------------
--JFD_GetSovereigntyTopPanelInfoTT
function JFD_GetSovereigntyTopPanelInfoTT(playerID)
	local player = Players[playerID]
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
	sovereigntyTT = sovereigntyTT .. convertTextKey("TXT_KEY_JFD_SOVEREIGNTY_TOP_PANEL_TOTAL", player:GetSovereignty(), JFD_GetMaxSovereignty(playerID))
	local sovereignty, sovTT = JFD_CalculateSovereignty(playerID, true)
	sovereigntyTT = sovereigntyTT .. sovTT
	sovereigntyTT = sovereigntyTT .. "[NEWLINE][NEWLINE]" .. convertTextKey("TXT_KEY_JFD_SOVEREIGNTY_TOP_PANEL_NOTE")
	return sovereigntyTT
end
------------------------------------------------------------------------------------------------------------------------
-- GOVERNMENT
------------------------------------------------------------------------------------------------------------------------
--JFD_CanAdoptAnyGovernment
function JFD_CanAdoptAnyGovernment(playerID)
	local player = Players[playerID]
	if player:IsBarbarian() then return false end
	if player:HasGovernment() then return false end
	local hasEarlyFound = false
	for building in GameInfo.Buildings("FoundsGovernment > 0") do
		if player:HasBuilding(building.ID) then hasEarlyFound = true end
	end
	return (JFD_IsTechnologyRequirementUnlocked(playerID, "AllowGovernments") or hasEarlyFound)
end

--JFD_CanAdoptGovernment
function JFD_CanAdoptGovernment(playerID, governmentID, skipAnyGovernment)
	local player = Players[playerID]
	local government = GameInfo.JFD_Governments[governmentID]
	if ((not skipAnyGovernment) and (not JFD_CanAdoptAnyGovernment(playerID))) then return false end
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

--JFD_CanChangeGovernment
function JFD_CanChangeGovernment(playerID)
	local player = Players[playerID]
	if player:IsAnarchy() then
		return false, Locale.ConvertTextKey("TXT_KEY_JFD_CHANGE_GOVERNMENT_DISABLED_ANARCHY")
	end
	local maxSovereignty = JFD_GetMaxSovereignty(playerID)
	local numFreeChanges = JFD_GetNumFreeGovernmentSwitches(playerID)
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
-- FREE GOVERNMENT CHANGES
----------------
--JFD_GetNumFreeGovernmentSwitches
function JFD_GetNumFreeGovernmentSwitches(playerID)
	return JFD_RTP_FreeGovtSwitches[playerID] or numGovtChanges or 0
end

--JFD_ChangeNumFreeGovernmentSwitches
function JFD_ChangeNumFreeGovernmentSwitches(playerID, numGovtChanges)
	local currentNum = JFD_GetNumFreeGovernmentSwitches(playerID)
	JFD_SetNumFreeGovernmentSwitches(playerID, currentNum+numGovtChanges)
end

--JFD_SetNumFreeGovernmentSwitches
function JFD_SetNumFreeGovernmentSwitches(playerID, numGovtChanges)
	--JFD_RTP_FreeGovtSwitches[playerID] = numGovtChanges
end
----------------
-- LEGISLATURE
----------------
local reformCitizenshipFullID = GameInfoTypes["REFORM_JFD_CITIZENSHIP_FULL"] 
--JFD_HasLegislature
function JFD_HasLegislature(playerID)
	local player = Players[playerID]
	for reform in GameInfo.JFD_Reforms("IsLegislature = 1") do
		if JFD_HasReform(playerID, reform.ID) then
			return true
		end
	end
	return false
end

--JFD_ResetLegislature
function JFD_ResetLegislature(playerID, ideologyID, isHumanOnly)
	local player = Players[playerID]
	if (isHumanOnly and (not player:IsHuman())) then return end
	for reform in GameInfo.JFD_Reforms("ResetsAssembly = 1 OR ResetsHolySynod = 1 OR ResetsImperialDiet = 1 OR ResetsParliament = 1 OR ResetsSenate = 1") do
		if JFD_HasReform(playerID, reform.ID) then
			if reform.ResetsAssembly then
				JFD_ComposeAssembly(playerID, ideologyID)
				break
			end
			if reform.ResetsHolySynod then
				JFD_ComposeHolySynod(playerID, ideologyID)
				break
			end
			if reform.ResetsImperialDiet then
				JFD_ComposeImperialDiet(playerID, ideologyID)
				break
			end
			if reform.ResetsParliament then
				JFD_ComposeParliament(playerID, ideologyID)
				break
			end
			if reform.ResetsSenate then
				JFD_ComposeSenate(playerID, ideologyID)
				break
			end
		end
	end
end
----------------
-- MONARCHY
----------------
--JFD_ComposeParliament
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
function JFD_ComposeParliament(playerID, ideologyID)
	local player = Players[playerID]
	local governmentID = player:GetGovernment()
	local government = GameInfo.JFD_Governments[governmentID]
	local factionSovMod = JFD_GetFactionSovMod(playerID)
	local numCities = player:GetNumCities()
	for row in GameInfo.JFD_Politics() do
		player:SetPoliticPercent(row.ID, 0)
	end
	if JFD_HasReform(playerID, reformMLegislatureAristocraticID) then
		local yieldBurgher 				= (player:CalculateGrossGold()	+player:GetTotalJONSCulturePerTurn())
		local yieldClergy 				= (player:GetTotalFaithPerTurn()+player:GetScience())
		local yieldNobility 			= JFD_GetTotalYieldNobility(playerID)
		local yieldRevolutionary 		= (mathMax((player:GetUnhappiness()-player:GetHappiness()),0)+player:GetPublicOpinionUnhappiness())
		local yieldTotal 				= (yieldBurgher+yieldClergy+yieldNobility+yieldRevolutionary)
		local percentBurgher 			= JFD_Round((yieldBurgher/yieldTotal)*100)	
		local percentClergy 			= JFD_Round((yieldClergy/yieldTotal)*100)	
		local percentNobility 			= JFD_Round((yieldNobility/yieldTotal)*100)	
		local percentRevolutionaries 	= JFD_Round((yieldRevolutionary/yieldTotal)*100)	
		-- if JFD_HasReform(playerID, reformFactionsClergyID) then
			-- percentClergy = percentClergy+percentRevolutionaries
			-- percentRevolutionaries = 0
		-- elseif JFD_HasReform(playerID, reformFactionsNobleID) then
			-- percentNobility = percentNobility+percentRevolutionaries
			-- percentRevolutionaries = 0	
		-- end
		if factionSovMod ~= 0 then
			percentBurgher 			= percentBurgher 		 + JFD_Round((percentBurgher*factionSovMod)/100)
			percentClergy 			= percentClergy 		 + JFD_Round((percentClergy*factionSovMod)/100)
			percentNobility 		= percentNobility 		 + JFD_Round((percentNobility*factionSovMod)/100)
			percentRevolutionaries  = percentRevolutionaries + JFD_Round((percentRevolutionaries*factionSovMod)/100)
		end
		player:SetPoliticPercent(politicBurgherD,			percentBurgher)
		player:SetPoliticPercent(politicClergyID,			percentClergy)
		player:SetPoliticPercent(politicNobilityID, 		percentNobility)
		player:SetPoliticPercent(politicRevolutionariesID, 	percentRevolutionaries)
		local politicLeader = JFD_GetPoliticLeader(playerID)
		player:SetPoliticLeaderKey(politicLeader)
		if player:IsHuman() then
			local politicResultsListTT = ""
			for row in GameInfo.JFD_Politics("PrereqGovernment = 'GOVERNMENT_JFD_MONARCHY' AND PrereqReform = 'REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC'") do
				local politicPercent = player:GetPoliticPercent(row.ID)
				if politicPercent > 0 then
					local politicDesc = JFD_GetPoliticDescription(activePlayerID, row.ID)
					politicResultsListTT = politicResultsListTT .. "[NEWLINE]" .. row.FontIcon .. " " .. convertTextKey(politicDesc) .. ": " .. politicPercent .. "%"
				end
			end
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_ARISTOCRATIC", player:GetLegislatureName(), politicResultsListTT), convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_SHORT"), false, -1, -1)
			Events.AudioPlay2DSound(government.AudioEffect)
		end
		player:SetGovernmentCooldown(defineDefaultLegislatureCooldown) 
		player:SetGovernmentCooldownRate(defineDefaultLegislatureCooldownRate)
	elseif JFD_HasReform(playerID, reformMLegislatureParliamentaryID) then
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
		local percentConservative    = JFD_Round((numVotesConservative/numVotesTotal)*100)	
		local percentLiberal 	     = JFD_Round((numVotesLiberal/numVotesTotal)*100)	
		local percentSocialist 	     = JFD_Round((numVotesSocialist/numVotesTotal)*100)	
		local percentCommunist 	     = JFD_Round((numVotesCommunist/numVotesTotal)*100)	
		local percentFascist 	     = JFD_Round((numVotesFascist/numVotesTotal)*100)	
		local percentLibertarian     = JFD_Round((numVotesLibertarian/numVotesTotal)*100)	
		-- local percentReactionary  = JFD_Round((numVotesReactionary/numVotesTotal)*100)	
		local percentRevolutionaries = JFD_Round((numVotesRevolutionary/numVotesTotal)*100)	
		if factionSovMod ~= 0 then
			percentConservative	= percentConservative 		 + JFD_Round((percentConservative*factionSovMod)/100)
			percentLiberal 			= percentLiberal 		 + JFD_Round((percentLiberal*factionSovMod)/100)
			percentSocialist 		= percentSocialist 		 + JFD_Round((percentSocialist*factionSovMod)/100)
			percentCommunist 		= percentCommunist 		 + JFD_Round((percentCommunist*factionSovMod)/100)
			percentFascist 			= percentFascist 		 + JFD_Round((percentFascist*factionSovMod)/100)
			percentLibertarian 		= percentLibertarian 	 + JFD_Round((percentLibertarian*factionSovMod)/100)
			percentRevolutionaries  = percentRevolutionaries + JFD_Round((percentRevolutionaries*factionSovMod)/100)
			-- percentReactionary  = percentReactionary 	+ JFD_Round((percentReactionary*factionSovMod)/100)
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
		local politicLeader = JFD_GetPoliticLeader(playerID)
		player:SetPoliticLeaderKey(politicLeader)
		if player:IsHuman() then
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_PARLIAMENTARY", player:GetLegislatureName(), politicsVoteListTT), convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_SHORT"), false, -1, -1)
			Events.AudioPlay2DSound(government.AudioEffect)
		end
		player:SetGovernmentCooldown(defineDefaultLegislatureCooldown) 
		player:SetGovernmentCooldownRate(defineDefaultLegislatureCooldownRate)
	end
	LuaEvents.JFD_LegislatureFormed(playerID, governmentID)
end
----------------
-- REPUBLIC
----------------
--JFD_ComposeSenate
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
function JFD_ComposeSenate(playerID, ideologyID)
	local player = Players[playerID]
	local governmentID = player:GetGovernment()
	local government = GameInfo.JFD_Governments[governmentID]
	local factionSovMod = JFD_GetFactionSovMod(playerID)
	local team = Teams[player:GetTeam()]
	for row in GameInfo.JFD_Politics() do
		player:SetPoliticPercent(row.ID, 0)
	end
	if JFD_HasReform(playerID, reformRLegislatureDemocraticID) then
		local politicsVoteListTT = ""
		local yieldTotalHappiness = 0
		local yieldNationalist = player:GetHappiness() + (player:GetUnhappinessFromCityCount()/100)
		local yieldPopularist = player:GetHappinessFromCities() + (player:GetUnhappinessFromCityPopulation()/100)
		local yieldRevolutionary = (mathMax((player:GetUnhappiness()-player:GetHappiness()),0)+player:GetPublicOpinionUnhappiness())
		yieldNationalist = yieldNationalist - yieldPopularist
		yieldTotalHappiness = yieldNationalist + yieldPopularist + yieldRevolutionary
		local percentNationalist 	= JFD_Round((yieldNationalist/yieldTotalHappiness)*100)	
		local percentPopularist 	= JFD_Round((yieldPopularist/yieldTotalHappiness)*100)	
		local percentRevolutionary 	= JFD_Round((yieldRevolutionary/yieldTotalHappiness)*100)	
		if factionSovMod ~= 0 then
			percentNationalist 		= percentNationalist 	+ JFD_Round((percentNationalist*factionSovMod)/100)
			percentPopularist 		= percentPopularist 	+ JFD_Round((percentPopularist*factionSovMod)/100)
			percentRevolutionary 	= percentRevolutionary 	+ JFD_Round((percentRevolutionary*factionSovMod)/100)
		end
		player:SetPoliticPercent(politicNationalistID,		percentNationalist)
		player:SetPoliticPercent(politicPopularistID, 		percentPopularist)
		player:SetPoliticPercent(politicRevolutionariesRID, percentRevolutionary)
		
		local politicLeader = JFD_GetPoliticLeader(playerID)
		player:SetPoliticLeaderKey(politicLeader)
		if player:IsHuman() then
			local politicResultsListTT = ""
			for row in GameInfo.JFD_Politics("PrereqGovernment = 'GOVERNMENT_JFD_REPUBLIC' AND (PrereqReform = 'REFORM_JFD_LEGISLATURE_R_DEMOCRATIC' OR PrereqReform IS NULL)") do
				local politicPercent = player:GetPoliticPercent(row.ID)
				if politicPercent > 0 then
					local politicDesc = JFD_GetPoliticDescription(activePlayerID, row.ID)
					politicResultsListTT = politicResultsListTT .. "[NEWLINE]" .. row.FontIcon .. " " .. convertTextKey(politicDesc) .. ": " .. politicPercent .. "%"
				end
			end
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_DEMOCRATIC", player:GetLegislatureName(), politicResultsListTT), convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_SHORT"), false, -1, -1)
			Events.AudioPlay2DSound(government.AudioEffect)
		end
		player:SetGovernmentCooldown(defineDefaultLegislatureCooldown) 
		player:SetGovernmentCooldownRate(defineDefaultLegislatureCooldownRate)
	elseif JFD_HasReform(playerID, reformRLegislatureOligarchicID) then
		local yieldCivic 			= player:GetNumNationalWonders() - (player:CountNumBuildings(buildingAssemblyID) + player:CountNumBuildings(buildingManorID) + player:CountNumBuildings(buildingMansionID))
		local yieldIndustrialist 	= player:GetNumInternalTradeRoutes()
		local yieldMercantile 		= player:GetNumInternationalTradeRoutes()
		local yieldMilitary			= team:GetAtWarCount(true)+1
		local yieldPopulist 		= player:GetNumPolicyBranchesFinished() + player:GetNumPolicyBranchesUnlocked()
		local yieldReligious 		= JFD_GetNumCivilizationFollowers(player:GetStateReligion())
		local yieldRevolutionary    = (mathMax((player:GetUnhappiness()-player:GetHappiness()),0)+player:GetPublicOpinionUnhappiness())
		local yieldTotal 			= yieldCivic + yieldIndustrialist + yieldMercantile + yieldMilitary + yieldPopulist + yieldReligious + yieldRevolutionary
		local percentCivic 			= JFD_Round((yieldCivic/yieldTotal)*100)	
		local percentIndustrialist 	= JFD_Round((yieldIndustrialist/yieldTotal)*100)	
		local percentMercantile 	= JFD_Round((yieldMercantile/yieldTotal)*100)	
		local percentMilitary		= JFD_Round((yieldMilitary/yieldTotal)*100)	
		local percentPopulist 		= JFD_Round((yieldPopulist/yieldTotal)*100)	
		local percentReligious 		= JFD_Round((yieldReligious/yieldTotal)*100)
		local percentRevolutionary 	= JFD_Round((yieldRevolutionary/yieldTotal)*100)	
		if ideologyID > -1 then
			local yieldFanatics         = yieldMilitary + yieldReligious
			local yieldProgressives     = yieldMercantile + yieldPopulist
			local yieldRadicals			= yieldCivic + yieldIndustrialist
			local percentFanatics 		= JFD_Round((yieldFanatics/yieldTotal)*100)	
			local percentProgressives 	= JFD_Round((yieldProgressives/yieldTotal)*100)	
			local percentRadicals 		= JFD_Round((yieldRadicals/yieldTotal)*100)	
			if factionSovMod ~= 0 then
				percentFanatics 	 = percentFanatics 			+ JFD_Round((percentFanatics*factionSovMod)/100)
				percentProgressives  = percentProgressives 		+ JFD_Round((percentProgressives*factionSovMod)/100)
				percentRadicals 	 = percentRadicals 			+ JFD_Round((percentRadicals*factionSovMod)/100)
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
			local percentCivic 			= JFD_Round((yieldCivic/yieldTotal)*100)	
			local percentIndustrialist 	= JFD_Round((yieldIndustrialist/yieldTotal)*100)	
			local percentMercantile 	= JFD_Round((yieldMercantile/yieldTotal)*100)	
			local percentMilitary		= JFD_Round((yieldMilitary/yieldTotal)*100)	
			local percentPopulist 		= JFD_Round((yieldPopulist/yieldTotal)*100)	
			local percentReligious 		= JFD_Round((yieldReligious/yieldTotal)*100)
			if factionSovMod ~= 0 then
				percentCivic 		 = percentCivic 			+ JFD_Round((percentCivic*factionSovMod)/100)
				percentIndustrialist = percentIndustrialist 	+ JFD_Round((percentIndustrialist*factionSovMod)/100)
				percentMercantile 	 = percentMercantile 		+ JFD_Round((percentMercantile*factionSovMod)/100)
				percentMilitary 	 = percentMilitary 			+ JFD_Round((percentMilitary*factionSovMod)/100)
				percentPopulist  	 = percentPopulist 			+ JFD_Round((percentPopulist*factionSovMod)/100)
				percentReligious  	 = percentReligious 		+ JFD_Round((percentReligious*factionSovMod)/100)
			end
			player:SetPoliticPercent(politicCivicD,				percentCivic)				
			player:SetPoliticPercent(politicIndustrialistID,	percentIndustrialist)
			player:SetPoliticPercent(politicMercantileID, 		percentMercantile)		
			player:SetPoliticPercent(politicMilitaryID, 		percentMilitary) 		
			player:SetPoliticPercent(politicPopulistID, 		percentPopulist)	
			player:SetPoliticPercent(politicReligiousID, 		percentReligious)
			player:SetPoliticPercent(politicRevolutionariesRID, percentRevolutionary)
		end
		local politicLeader = JFD_GetPoliticLeader(playerID)
		player:SetPoliticLeaderKey(politicLeader)
		if player:IsHuman() then
			local politicResultsListTT = ""
			for row in GameInfo.JFD_Politics("PrereqGovernment = 'GOVERNMENT_JFD_REPUBLIC' AND (PrereqReform = 'REFORM_JFD_LEGISLATURE_R_OLIGARCHIC' OR PrereqReform IS NULL)") do
				local politicPercent = player:GetPoliticPercent(row.ID)
				if politicPercent > 0 then
					local politicDesc = JFD_GetPoliticDescription(activePlayerID, row.ID)
					politicResultsListTT = politicResultsListTT .. "[NEWLINE]" .. row.FontIcon .. " " .. convertTextKey(politicDesc) .. ": " .. politicPercent .. "%"
				end
			end
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_OLIGARCHIC", player:GetLegislatureName(), politicResultsListTT), convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_SHORT"), false, -1, -1)
			Events.AudioPlay2DSound(government.AudioEffect)
		end
		player:SetGovernmentCooldown(defineDefaultLegislatureCooldown) 
		player:SetGovernmentCooldownRate(defineDefaultLegislatureCooldownRate)
	end
	LuaEvents.JFD_LegislatureFormed(playerID, governmentID)
end
----------------
-- DICTATORSHIP
----------------
--JFD_ComposeAssembly
--Military
local politicMilitaryID 			 = GameInfoTypes["ASSEMBLY_JFD_MILITARY"]

--One-Party
local politicCommunistDID 			 = GameInfoTypes["ASSEMBLY_JFD_COMMUNIST"]
local politicFascistID 		 		 = GameInfoTypes["ASSEMBLY_JFD_FASCIST"]
local politicLibertarianDID 		 = GameInfoTypes["ASSEMBLY_JFD_LIBERTARIAN"]

local reformDLegislatureOnePartyID  = GameInfoTypes["REFORM_JFD_LEGISLATURE_D_ONE_PARTY"]
local reformDLegislatureMilitaryID  = GameInfoTypes["REFORM_JFD_LEGISLATURE_D_MILITARY"]
function JFD_ComposeAssembly(playerID)
	local player = Players[playerID]
	local governmentID = player:GetGovernment()
	local government = GameInfo.JFD_Governments[governmentID]
	local factionSovMod = JFD_GetFactionSovMod(playerID)
	local numCities = player:GetNumCities()
	for row in GameInfo.JFD_Politics() do
		player:SetPoliticPercent(row.ID, 0)
	end
	if JFD_HasReform(playerID, reformDLegislatureOnePartyID) then
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
			percentCommunist 	= percentCommunist 		+ JFD_Round((percentCommunist*factionSovMod)/100)
			percentFascist 		= percentFascist 		+ JFD_Round((percentFascist*factionSovMod)/100)
			percentLibertarian 	= percentLibertarian 	+ JFD_Round((percentLibertarian*factionSovMod)/100)
		end
		player:SetPoliticPercent(politicCommunistDID,	percentCommunist)
		player:SetPoliticPercent(politicFascistID,		percentFascist)
		player:SetPoliticPercent(politicLibertarianDID, percentLibertarian)
		local politicLeader = JFD_GetPoliticLeader(playerID)
		player:SetPoliticLeaderKey(politicLeader)
		if player:IsHuman() then
			local politicResultsListTT = ""
			for row in GameInfo.JFD_Politics("PrereqGovernment = 'GOVERNMENT_JFD_DICTATORSHIP' AND PrereqReform = 'REFORM_JFD_LEGISLATURE_D_ONE_PARTY'") do
				local politicPercent = player:GetPoliticPercent(row.ID)
				if politicPercent > 0 then
					local politicDesc = JFD_GetPoliticDescription(activePlayerID, row.ID)
					politicResultsListTT = politicResultsListTT .. "[NEWLINE]" .. row.FontIcon .. " " .. convertTextKey(politicDesc) .. ": " .. politicPercent .. "%"
				end
			end
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_ONE_PARTY", player:GetLegislatureName(), politicResultsListTT), convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_SHORT"), false, -1, -1)
			Events.AudioPlay2DSound(government.AudioEffect)
		end
	elseif JFD_HasReform(playerID, reformDLegislatureMilitaryID) then
		local percentMilitary = 100
		if factionSovMod ~= 0 then
			percentMilitary = percentMilitary + JFD_Round((percentMilitary*factionSovMod)/100)
		end
		player:SetPoliticPercent(politicMilitaryID, percentMilitary)
		local politicLeader = JFD_GetPoliticLeader(playerID)
		player:SetPoliticLeaderKey(politicLeader)
		if player:IsHuman() then
			local politicResultsListTT = ""
			for row in GameInfo.JFD_Politics("PrereqGovernment = 'GOVERNMENT_JFD_DICTATORSHIP' AND PrereqReform = 'REFORM_JFD_LEGISLATURE_D_MILITARY'") do
				local politicPercent = player:GetPoliticPercent(row.ID)
				if politicPercent > 0 then
					local politicDesc = JFD_GetPoliticDescription(activePlayerID, row.ID)
					politicResultsListTT = politicResultsListTT .. "[NEWLINE]" .. row.FontIcon .. " " .. convertTextKey(politicDesc) .. ": " .. politicPercent .. "%"
				end
			end
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_MILITARY", player:GetLegislatureName(), politicResultsListTT), convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_SHORT"), false, -1, -1)
			Events.AudioPlay2DSound(government.AudioEffect)
		end
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

--JFD_GetClergyID
local politicClergyTID = GameInfoTypes["CLERGY_JFD_CLERGY"]
function JFD_GetClergyID(playerID)
	return politicClergyTID + playerID
end

--JFD_ComposeHolySynod
local reformTLegislatureAutocephalousID  = GameInfoTypes["REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS"]
local reformTLegislatureEcumenicalID  	 = GameInfoTypes["REFORM_JFD_LEGISLATURE_T_ECUMENICAL"]

local pietyLevelNeutralID  				 = GameInfoTypes["PIETY_LEVEL_JFD_NEUTRAL"]
--(Revolutionaries)
local politicRevolutionariesTID   		 = GameInfoTypes["CLERGY_JFD_REVOLUTIONARY"]
function JFD_ComposeHolySynod(playerID)
	local player = Players[playerID]
	local governmentID = player:GetGovernment()
	local government = GameInfo.JFD_Governments[governmentID]
	local factionSovMod = JFD_GetFactionSovMod(playerID)
	local team = Teams[player:GetTeam()]
	for row in GameInfo.JFD_Politics() do
		player:SetPoliticPercent(row.ID, 0)
	end
	local stateReligionID = player:GetStateReligion()
	if JFD_HasReform(playerID, reformTLegislatureAutocephalousID) then
		local politicResultsListTT = ""
		local percentRevolutionary 	= 0
		if JFD_GetPietyLevelID(playerID) <= pietyLevelNeutralID then
			percentRevolutionary = (defaultMaxPietyRate-player:GetPiety())
		end
		if factionSovMod ~= 0 then
			percentRevolutionary = percentRevolutionary + JFD_Round((percentRevolutionary*factionSovMod)/100)
		end
		player:SetPoliticPercent(politicRevolutionariesTID, percentRevolutionary)
		for city in player:Cities() do
			local politicPercent = 0
			local numFollowers = city:GetNumFollowers(stateReligionID)
			if numFollowers > 0 then politicPercent = JFD_Round((numFollowers/player:GetTotalPopulation())*100)	end
			if factionSovMod ~= 0 then
				politicPercent = politicPercent + JFD_Round((politicPercent*factionSovMod)/100)
			end
			player:SetPoliticPercent(JFD_CompileCityID(city), politicPercent)
			if player:IsHuman() then
				if politicPercent > 0 then
					local politicDesc = JFD_GetPoliticDescription(playerID, stateReligionID, true)
					politicResultsListTT = politicResultsListTT .. "[NEWLINE][ICON_JFD_CLERGY] " .. city:GetName() .. " " .. convertTextKey(politicDesc) .. ": " .. politicPercent .. "%"
				end			
			end
		end
		if percentRevolutionary > 0 then
			local politicDesc = JFD_GetPoliticDescription(playerID, politicRevolutionariesTID)
			politicResultsListTT = politicResultsListTT .. "[NEWLINE][ICON_JFD_REVOLUTIONARIES] " .. convertTextKey(politicDesc) .. ": " .. percentRevolutionary .. "%"
		end	
		local politicLeader = JFD_GetPoliticLeader(playerID)
		player:SetPoliticLeaderKey(politicLeader)
		if player:IsHuman() then
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_HOLY_SYNOD", player:GetLegislatureName(), politicResultsListTT), convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_SHORT"), false, -1, -1)
			Events.AudioPlay2DSound(government.AudioEffect)
		end
		player:SetGovernmentCooldown(defineDefaultLegislatureCooldown) 
		player:SetGovernmentCooldownRate(defineDefaultLegislatureCooldownRate)
	elseif JFD_HasReform(playerID, reformTLegislatureEcumenicalID) then
		local politicResultsListTT = ""
		local percentRevolutionary 	= 0
		if JFD_GetPietyLevelID(playerID) <= pietyLevelNeutralID then
			percentRevolutionary = (defaultMaxPietyRate-player:GetPiety())
		end
		if factionSovMod ~= 0 then
			percentRevolutionary = percentRevolutionary + JFD_Round((percentRevolutionary*factionSovMod)/100)
		end
		player:SetPoliticPercent(politicRevolutionariesTID, percentRevolutionary)
		for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			local clergyID = JFD_GetClergyID(otherPlayerID)
			if player:GetPoliticPercent(clergyID) > 0 then
				player:SetPoliticPercent(clergyID, 0)
			end
		end	
		for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			local clergyID = JFD_GetClergyID(otherPlayerID)
			if (otherPlayer:IsAlive() and team:IsHasMet(otherPlayer:GetTeam()) and otherPlayer:GetStateReligion() == stateReligionID and (not otherPlayer:IsAtWar(playerID))) then
				local numCities = otherPlayer:GetNumCitiesWithStateReligion(stateReligionID)
				if (otherPlayerID == playerID and numCities == 0) then numCities = numCities + 1 end
				local politicPercent = JFD_Round(numCities/(Game.GetNumCitiesFollowing(stateReligionID))*100)	
				if factionSovMod ~= 0 then
					politicPercent = politicPercent + JFD_Round((politicPercent*factionSovMod)/100)
				end
				player:SetPoliticPercent(clergyID, politicPercent)
				if player:IsHuman() then
					if politicPercent > 0 then
						politicResultsListTT = politicResultsListTT .. Locale.ConvertTextKey("[NEWLINE][ICON_JFD_CLERGY] {1_CivAdj} {2_ClergyDesc}: +{3_Percent}% [ICON_JFD_SOVEREIGNTY]", otherPlayer:GetCivilizationAdjective(), JFD_GetPoliticDescription(playerID, stateReligionID, true), politicPercent)
					end			
				end
			end
		end
		if percentRevolutionary > 0 then
			local politicDesc = JFD_GetPoliticDescription(playerID, politicRevolutionariesTID)
			politicResultsListTT = politicResultsListTT .. "[NEWLINE][ICON_JFD_REVOLUTIONARIES] " .. convertTextKey(politicDesc) .. ": " .. percentRevolutionary .. "%"
		end	
		local politicLeader = JFD_GetPoliticLeader(playerID)
		player:SetPoliticLeaderKey(politicLeader)
		if player:IsHuman() then
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_HOLY_SYNOD", player:GetLegislatureName(), politicResultsListTT), convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_SHORT"), false, -1, -1)
			Events.AudioPlay2DSound(government.AudioEffect)
		end
		player:SetGovernmentCooldown(defineDefaultLegislatureCooldown) 
		player:SetGovernmentCooldownRate(defineDefaultLegislatureCooldownRate)
	end
	LuaEvents.JFD_LegislatureFormed(playerID, governmentID)
end
----------------
-- HRE
----------------
--JFD_GetElectorID
local politicElectorHREID = GameInfoTypes["ELECTOR_JFD_ELECTOR"]
function JFD_GetElectorID(playerID)
	return politicElectorHREID + playerID
end

--JFD_ComposeImperialDiet
local reformHRELegislaturePrivilegiumMaiusID = GameInfoTypes["REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS"]
local reformHRELegislaturePrivilegiumMinorID = GameInfoTypes["REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR"]
--(Revolutionaries)
local politicRevolutionariesHREID   		 = GameInfoTypes["ELECTOR_JFD_REVOLUTIONARY"]
function JFD_ComposeImperialDiet(playerID)
	local player = Players[playerID]
	local governmentID = player:GetGovernment()
	local government = GameInfo.JFD_Governments[governmentID]
	local factionSovMod = JFD_GetFactionSovMod(playerID)
	local team = Teams[player:GetTeam()]
	local percentRevolutionary = (mathMax((player:GetUnhappiness()-player:GetHappiness()),0)+player:GetPublicOpinionUnhappiness())
	if factionSovMod ~= 0 then
		percentRevolutionary = percentRevolutionary + JFD_Round((percentRevolutionary*factionSovMod)/100)
	end
	for row in GameInfo.JFD_Politics() do
		player:SetPoliticPercent(row.ID, 0)
	end
	if JFD_HasReform(playerID, reformHRELegislaturePrivilegiumMaiusID) then
		local politicResultsListTT = ""
		player:SetPoliticPercent(politicRevolutionariesHREID, percentRevolutionary)
		local totalPopulation = 0
		for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			local electorID = JFD_GetElectorID(otherPlayerID)
			if player:GetPoliticPercent(electorID) > 0 then
				player:SetPoliticPercent(electorID, 0)
			end
			if (otherPlayer:IsAlive() and otherPlayer:IsMinorCiv() and otherPlayer:GetCapitalCity() and team:IsHasMet(otherPlayer:GetTeam()) and otherPlayer:IsAllies(playerID)) then
				totalPopulation = totalPopulation + otherPlayer:GetTotalPopulation()
			end
		end
		for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			local electorID = JFD_GetElectorID(otherPlayerID)
			if (otherPlayer:IsAlive() and otherPlayer:IsMinorCiv() and otherPlayer:GetCapitalCity() and team:IsHasMet(otherPlayer:GetTeam()) and otherPlayer:IsAllies(playerID)) then
				local otherPopulation = otherPlayer:GetTotalPopulation()
				local politicPercent = JFD_Round(otherPopulation/(totalPopulation)*100)
				if factionSovMod ~= 0 then
					politicPercent = politicPercent + JFD_Round((politicPercent*factionSovMod)/100)
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
			local politicDesc = JFD_GetPoliticDescription(playerID, politicRevolutionariesTID)
			politicResultsListTT = politicResultsListTT .. "[NEWLINE][ICON_JFD_REVOLUTIONARIES] " .. convertTextKey(politicDesc) .. ": " .. percentRevolutionary .. "%"
		end	
		-- local politicLeader = JFD_GetPoliticLeader(playerID)
		-- player:SetPoliticLeaderKey(politicLeader)
		if player:IsHuman() then
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_IMPERIAL_DIET", player:GetLegislatureName(), politicResultsListTT), convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_SHORT"), false, -1, -1)
			Events.AudioPlay2DSound(government.AudioEffect)
		end
		player:SetGovernmentCooldown(defineDefaultLegislatureCooldown) 
		player:SetGovernmentCooldownRate(defineDefaultLegislatureCooldownRate)
	elseif JFD_HasReform(playerID, reformHRELegislaturePrivilegiumMinorID) then
		local politicResultsListTT = ""
		player:SetPoliticPercent(politicRevolutionariesHREID, percentRevolutionary)
		local totalPopulation = 0
		for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			local electorID = JFD_GetElectorID(otherPlayerID)
			if player:GetPoliticPercent(electorID) > 0 then
				player:SetPoliticPercent(electorID, 0)
			end
			if (otherPlayer:IsAlive() and otherPlayer:IsMinorCiv() and otherPlayer:GetCapitalCity() and team:IsHasMet(otherPlayer:GetTeam()) and otherPlayer:IsFriends(playerID)) then
				totalPopulation = totalPopulation + otherPlayer:GetTotalPopulation()
			end
		end
		for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			local electorID = JFD_GetElectorID(otherPlayerID)
			if (otherPlayer:IsAlive() and otherPlayer:IsMinorCiv() and otherPlayer:GetCapitalCity() and team:IsHasMet(otherPlayer:GetTeam()) and otherPlayer:IsFriends(playerID)) then
				local otherPopulation = otherPlayer:GetTotalPopulation()
				local politicPercent = JFD_Round(otherPopulation/(totalPopulation)*100)
				if factionSovMod ~= 0 then
					politicPercent = politicPercent + JFD_Round((politicPercent*factionSovMod)/100)
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
			local politicDesc = JFD_GetPoliticDescription(playerID, politicRevolutionariesTID)
			politicResultsListTT = politicResultsListTT .. "[NEWLINE][ICON_JFD_REVOLUTIONARIES] " .. convertTextKey(politicDesc) .. ": " .. percentRevolutionary .. "%"
		end	
		-- local politicLeader = JFD_GetPoliticLeader(playerID)
		-- player:SetPoliticLeaderKey(politicLeader)
		if player:IsHuman() then
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_IMPERIAL_DIET", player:GetLegislatureName(), politicResultsListTT), convertTextKey("TXT_KEY_JFD_NEW_LEGISLATURE_SHORT"), false, -1, -1)
			Events.AudioPlay2DSound(government.AudioEffect)
		end
		player:SetGovernmentCooldown(defineDefaultLegislatureCooldown) 
		player:SetGovernmentCooldownRate(defineDefaultLegislatureCooldownRate)
	end
	LuaEvents.JFD_LegislatureFormed(playerID, governmentID)
end
----------------
-- FACTIONS
----------------
--JFD_GetFactionSovMod
function JFD_GetFactionSovMod(playerID)
	local player = Players[playerID]
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
		if JFD_HasReform(playerID, row.ID) then
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

--JFD_GetReformOpinionFavoured
local reformSuffrageLandedID = GameInfoTypes["REFORM_JFD_SUFFRAGE_LANDED"]
local reformSuffrageUniversalID = GameInfoTypes["REFORM_JFD_SUFFRAGE_UNIVERSAL"]
function JFD_GetReformOpinionFavoured(playerID, reformID)
	local player = Players[playerID]
	local team = Teams[player:GetTeam()]
	local reform = GameInfo.JFD_Reforms[reformID]
	local governmentID = player:GetGovernment()
	local government = GameInfo.JFD_Governments[governmentID]
	local reformOpinionFavoured = 0
	if reform.ReformBranchType == "REFORM_BRANCH_JFD_GOVERNMENT" then
		for row in GameInfo.JFD_Reforms("ReformCostModPerCity <> 0") do
			if JFD_HasReform(playerID, row.ID) then
				local reformCostModPerCity = (row.ReformCostModPerCity*-1)
				reformCostModPerCity = (reformCostModPerCity*player:GetNumCities())
				if reformCostModPerCity > 50 then reformCostModPerCity = 50 end
				reformOpinionFavoured = reformOpinionFavoured + reformCostModPerCity
			end
		end
		for row in GameInfo.JFD_Reforms("ReformCostModPerPop <> 0") do
			if JFD_HasReform(playerID, row.ID) then
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
		local reformElectorOpinionFavoured, reformElectorOpinionOpposed = JFD_GetReformElectorOpinion(playerID, reformID)
		reformOpinionFavoured = reformOpinionFavoured + reformElectorOpinionFavoured
	elseif governmentID == governmentTheocracyID then
		local reformClergyOpinionFavoured, reformClergyOpinionOpposed = JFD_GetReformClergyOpinion(playerID, reform.ReformBranchType, reform.Alignment)
		reformOpinionFavoured = reformOpinionFavoured + reformClergyOpinionFavoured
	end
	return reformOpinionFavoured
end

--JFD_GetReformOpinionOpposed
function JFD_GetReformOpinionOpposed(playerID, reformID)
	local player = Players[playerID]
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
		local reformElectorOpinionFavoured, reformElectorOpinionOpposed = JFD_GetReformElectorOpinion(playerID, reformID)
		reformOpinionOpposed = reformOpinionOpposed + reformElectorOpinionOpposed
	elseif governmentID == governmentTheocracyID then
		local reformClergyOpinionFavoured, reformClergyOpinionOpposed = JFD_GetReformClergyOpinion(playerID, reform.ReformBranchType, reform.Alignment)
		reformOpinionOpposed = reformOpinionOpposed + reformClergyOpinionOpposed
	end
	return reformOpinionOpposed
end
----------------
-- HOLY ROMAN EMPIRE
----------------
-- JFD_GetNumNonBefriendedCityStates
-- function JFD_GetNumBefriendedCityStates(playerID, isNonBefriended)
	-- local player = Players[playerID]
	-- local team = Teams[player:GetTeam()]
	-- local numCityStates = 0
	-- for minorPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
		-- local minorPlayer = Players[minorPlayerID]
		-- if (minorPlayer:IsAlive() and minorPlayer:IsMinorCiv() and team:IsHasMet(minorPlayer:GetTeam())) then
			-- if (isNonBefriended and (not minorPlayer:IsAllies(playerID)) and (not minorPlayer:IsFriends(playerID))) then
				-- numCityStates = numCityStates + 1
			-- elseif (minorPlayer:IsAllies(playerID) or minorPlayer:IsFriends(playerID)) then
				-- numCityStates = numCityStates + 1	
			-- end
		-- end
	-- end
	-- return numCityStates
-- end

--JFD_GetReformElectorOpinion
function JFD_GetReformElectorOpinion(playerID, reformID)
	local player = Players[playerID]
	local team = Teams[player:GetTeam()]
	local reformOpinionFavoured = 0
	local reformOpinionOpposed = 0
	local reform = GameInfo.JFD_Reforms[reformID]
	for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
		local otherPlayer = Players[otherPlayerID]
		local electorID = JFD_GetElectorID(otherPlayerID)
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
--JFD_GetReformClergyOpinion
local factionClergyOpinions = {}
	factionClergyOpinions["REFORM_BRANCH_JFD_CULTURE"]  = yieldCultureID
	factionClergyOpinions["REFORM_BRANCH_JFD_ECONOMY"]  = yieldGoldID
	factionClergyOpinions["REFORM_BRANCH_JFD_INDUSTRY"] = yieldScienceID
	factionClergyOpinions["REFORM_BRANCH_JFD_RELIGION"] = yieldFaithID
function JFD_GetReformClergyOpinion(playerID, reformBranch, reformAlignment)
	local player = Players[playerID]
	local team = Teams[player:GetTeam()]
	local reformOpinion = 0
	local reformOpinionFavoured = 0
	local reformOpinionOpposed = 0
	local pietyLevelID = JFD_GetPietyLevelID(playerID)
	local pietyLevelMod = GameInfo.JFD_PietyLevels[pietyLevelID].ReformOpinionMod
	local stateReligionID = player:GetStateReligion()
	if JFD_HasReform(playerID, reformTLegislatureAutocephalousID) then
		for city in player:Cities() do
			local cityID = JFD_CompileCityID(city)
			local highestYieldID = JFD_GetHighestYield(playerID, city)
			if (factionClergyOpinions[reformBranch] and factionClergyOpinions[reformBranch] == highestYieldID) then
				if reformAlignment == "REFORM_LEFT" then
					reformOpinionFavoured = reformOpinionFavoured + player:GetPoliticPercent(cityID)
				elseif reformAlignment == "REFORM_RIGHT" then
					reformOpinionOpposed = reformOpinionOpposed + player:GetPoliticPercent(cityID)
				end
			end
		end
	elseif JFD_HasReform(playerID, reformTLegislatureEcumenicalID) then
		for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do	
			local otherPlayer = Players[otherPlayerID]
			local clergyID = JFD_GetClergyID(otherPlayerID)
			if (otherPlayer:IsAlive() and otherPlayer:GetStateReligion() == stateReligionID) then
				local highestYieldID = JFD_GetHighestYield(otherPlayerID)
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
----------------
-- TEXT
----------------
----------------
-- AI
----------------
--JFD_GetPreferredGovernmentID
function JFD_GetPreferredGovernmentID(playerID)
	local player = Players[playerID]
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
		local cultureID = JFD_GetCultureID(playerID)
		local cultureType = GameInfo.JFD_CultureTypes[cultureID].Type
		for row in GameInfo.JFD_CultureType_Governments("CultureType = '" .. cultureType .. "' AND GovernmentType IS NOT NULL") do
			governmentPrefs[count] = {}
			governmentPrefs[count].ID = GameInfoTypes[row.GovernmentType]
			governmentPrefs[count].Weight = row.Weight
			count = count + 1
		end
	end
	for _, government in ipairs(governmentPrefs) do
		if JFD_CanAdoptGovernment(playerID, government.ID, true) then
			governmentPrefID = government.ID
			governmentWeight = government.Weight
			break
		end
	end
	if governmentPrefID <= -1 then governmentPrefID = governmentMonarchyID end
	if JFD_GetRandom(1,100) <= governmentWeight then
		return governmentPrefID
	else	
		if JFD_GetRandom(1,2) == 1 then 
			return governmentMonarchyID
		else
			return governmentRepublicID
		end
	end
end
------------------------------------------------------------------------------------------------------------------------
-- REFORMS
------------------------------------------------------------------------------------------------------------------------
--JFD_CanHaveReform
function JFD_CanHaveReform(playerID, reformID, skipCost)
	local reform = GameInfo.JFD_Reforms[reformID]
	if reform.IsDisabled then return false, false, "" end
	if JFD_HasReform(playerID, reformID) then return false, false, "" end
	local player = Players[playerID]
	if player:IsAnarchy() then
		return false, false, "[ICON_RESISTANCE]" 
	end
	if (not skipCost) then
		local reformCost = JFD_GetReformCost(playerID, reformID)
		if player:GetSovereignty() < reformCost then 
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
	if (prereqReformID and (not JFD_HasReform(playerID, prereqReformID))) then 
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

--JFD_GetReformCost
local pietyLevelDevoutID = GameInfoTypes["PIETY_LEVEL_JFD_DEVOUT"]
function JFD_GetReformCost(playerID, reformID)
	local player = Players[playerID]
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
		if JFD_HasReform(playerID, row.ID) then
			sovereigntyCost = sovereigntyCost + ((row.ReformCostMod*sovereigntyCost)/100)
		end
	end
	for row in GameInfo.JFD_Reforms("ReformCostModPerPuppet <> 0") do
		if JFD_HasReform(playerID, row.ID) then
			local reformCostModPerPuppet = (row.ReformCostModPerPuppet*player:GetNumPuppetCities())
			sovereigntyCost = sovereigntyCost + ((reformCostModPerPuppet*sovereigntyCost)/100)
		end
	end
	if reform.ReformBranchType == "REFORM_BRANCH_JFD_GOVERNMENT" then
		for row in GameInfo.JFD_Reforms("ReformCostModPerCity <> 0") do
			if JFD_HasReform(playerID, row.ID) then
				local reformCostModPerCity = (row.ReformCostModPerCity*player:GetNumCities())
				if reformCostModPerCity > 50 then reformCostModPerCity = 50 end
				if reformCostModPerCity < -50 then reformCostModPerCity = -50 end
				sovereigntyCost = sovereigntyCost + ((reformCostModPerCity*sovereigntyCost)/100)
			end
		end
		for row in GameInfo.JFD_Reforms("ReformCostModPerPop <> 0") do
			if JFD_HasReform(playerID, row.ID) then
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
	sovereigntyCost = sovereigntyCost+JFD_GetReformOpinionOpposed(playerID, reformID)
	sovereigntyCost = sovereigntyCost-JFD_GetReformOpinionFavoured(playerID, reformID)
	if sovereigntyCost < 0 then sovereigntyCost = 0 end
	return JFD_Round(sovereigntyCost)
end

--JFD_GetReformCooldown
function JFD_GetReformCooldown(playerID, returnsTT)
	local player = Players[playerID]
	local reformCooldown = defineDefaultReformCooldownTurns
	local reformCooldownMod = 0
	local reformCooldownTT = ""
	--Check Governments
	local cooldownModFromGovernments = 0
	for row in GameInfo.JFD_Governments("ReformCooldownMod <> 0") do
		if player:GetGovernment() == row.ID then
			cooldownModFromGovernments = cooldownModFromGovernments + row.ReformCooldownMod
			if returnsTT then
				if cooldownModFromGovernments > 0 then
					reformCooldownTT = reformCooldownTT .. convertTextKey("TXT_KEY_JFD_GO_REFORM_COOLDOWN_TT_FROM_GOVERNMENT", "[COLOR_POSITIVE_TEXT]+ " .. cooldownModFromGovernments .. "%[ENDCOLOR]")
				else
					reformCooldownTT = reformCooldownTT .. convertTextKey("TXT_KEY_JFD_GO_REFORM_COOLDOWN_TT_FROM_GOVERNMENT", "[COLOR_WARNING_TEXT]" .. cooldownModFromGovernments .. "%[ENDCOLOR]")
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
					reformCooldownTT = reformCooldownTT .. convertTextKey("TXT_KEY_JFD_GO_REFORM_COOLDOWN_TT_FROM_BUILDINGS", "[COLOR_POSITIVE_TEXT]+ " .. cooldownModFromBuildings .. "%[ENDCOLOR]")
				else
					reformCooldownTT = reformCooldownTT .. convertTextKey("TXT_KEY_JFD_GO_REFORM_COOLDOWN_TT_FROM_BUILDINGS", "[COLOR_WARNING_TEXT]" .. cooldownModFromBuildings .. "%[ENDCOLOR]")
				end
			end
		end
	end
	--Check Reforms
	local cooldownModFromReforms = 0
	for row in GameInfo.JFD_Reforms("ReformCooldownMod <> 0") do
		if JFD_HasReform(playerID, row.ID) then
			cooldownModFromReforms = cooldownModFromReforms + row.ReformCooldownMod
			if returnsTT then
				if cooldownModFromReforms > 0 then
					reformCooldownTT = reformCooldownTT .. convertTextKey("TXT_KEY_JFD_GO_REFORM_COOLDOWN_TT_FROM_REFORMS", "[COLOR_POSITIVE_TEXT]+ " .. cooldownModFromReforms .. "%[ENDCOLOR]")
				else
					reformCooldownTT = reformCooldownTT .. convertTextKey("TXT_KEY_JFD_GO_REFORM_COOLDOWN_TT_FROM_REFORMS", "[COLOR_WARNING_TEXT]" .. cooldownModFromReforms .. "%[ENDCOLOR]")
				end
			end
		end
	end
	--Check Epithets
	local cooldownModFromEpithets = 0
	for row in GameInfo.JFD_Epithet_SovereigntyMods("ReformCooldownMod <> 0") do
		if JFD_HasEpithet(playerID, GameInfoTypes[row.EpithetType]) then
			cooldownModFromEpithets = cooldownModFromEpithets + row.ReformCooldownMod
			if returnsTT then
				if cooldownModFromEpithets > 0 then
					reformCooldownTT = reformCooldownTT .. convertTextKey("TXT_KEY_JFD_GO_REFORM_COOLDOWN_TT_FROM_EPITHETS", "[COLOR_POSITIVE_TEXT]+ " .. cooldownModFromEpithets .. "%[ENDCOLOR]")
				else
					reformCooldownTT = reformCooldownTT .. convertTextKey("TXT_KEY_JFD_GO_REFORM_COOLDOWN_TT_FROM_EPITHETS", "[COLOR_WARNING_TEXT]" .. cooldownModFromEpithets .. "%[ENDCOLOR]")
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
					reformCooldownTT = reformCooldownTT .. convertTextKey("TXT_KEY_JFD_GO_REFORM_COOLDOWN_TT_FROM_POLICIES", "[COLOR_POSITIVE_TEXT]+ " .. cooldownModFromPolicies .. "%[ENDCOLOR]")
				else
					reformCooldownTT = reformCooldownTT .. convertTextKey("TXT_KEY_JFD_GO_REFORM_COOLDOWN_TT_FROM_POLICIES", "[COLOR_WARNING_TEXT]" .. cooldownModFromPolicies .. "%[ENDCOLOR]")
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
					reformCooldownTT = reformCooldownTT .. convertTextKey("TXT_KEY_JFD_GO_REFORM_COOLDOWN_TT_FROM_TRAITS", "[COLOR_POSITIVE_TEXT]+ " .. cooldownModFromTraits .. "%[ENDCOLOR]")
				else
					reformCooldownTT = reformCooldownTT .. convertTextKey("TXT_KEY_JFD_GO_REFORM_COOLDOWN_TT_FROM_TRAITS", "[COLOR_WARNING_TEXT]" .. cooldownModFromTraits .. "%[ENDCOLOR]")
				end
			end
		end
	end
	reformCooldownMod = cooldownModFromBuildings + cooldownModFromEpithets + cooldownModFromReforms + cooldownModFromPolicies + cooldownModFromGovernments
	reformCooldown = reformCooldown + JFD_Round((reformCooldownMod*reformCooldown)/100)
	reformCooldownTT = convertTextKey("TXT_KEY_JFD_GO_REFORM_COOLDOWN_TT", reformCooldown) .. reformCooldownTT
	return reformCooldown, reformCooldownTT
end

--JFD_SetHasReform
function JFD_SetHasReform(playerID, reformID, isAdding, isFree)
	local player = Players[playerID]
	local reform = GameInfo.JFD_Reforms[reformID]
	local numFreeReforms = JFD_GetNumFreeReforms(playerID)
	if ((not isFree) and numFreeReforms > 0) then isFree = true end
	local policyID = GameInfoTypes[reform.PolicyType]
	if isAdding then
		if (not player:HasPolicy(policyID)) then
			player:GrantPolicy(policyID, true)
			LuaEvents.JFD_ReformPassed(playerID, reformID, isFree)
			if (player:IsHuman() and player:GetGovernment() > -1) then
				JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_REFORM_PASSED_ENDS_TEXT", reform.ShortDescription, reform.HeaderDescription), convertTextKey("TXT_KEY_JFD_REFORM_PASSED_ENDS_SHORT_TEXT"), false, -1, -1)
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
		JFD_ChangeNumFreeReforms(playerID, -1)
	else
		local reformCooldown = JFD_GetReformCooldown(playerID)
		player:SetReformCooldown(reformCooldown)
		player:SetReformCooldownRate(1)
	end
	if player:HasGovernment() then
		local reformAnarchySentiment, reformAnarchyTurns, reformAnarchyCooldownTurns = JFD_GetReformAnarchy(playerID, reformID)
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
		local leaderTitle = JFD_GetLeaderTitleShort(playerID)
		local governmentTitle = JFD_GetGovernmentTitle(playerID)
		JFD_SetLeaderTitle(playerID, leaderTitle)
		JFD_SetGovernmentTitle(playerID, governmentTitle)
	end
	if (reform.IsSovereignty and player:IsHuman()) then Events.SerialEventGameDataDirty() end
	if reform.ResetsLegislature then JFD_ResetLegislature(playerID, player:GetLateGamePolicyTree()) end
end

--JFD_SetHasAllDefaultReforms
function JFD_SetHasAllDefaultReforms(playerID, governmentID)
	local player = Players[playerID]
	local governmentType = GameInfo.JFD_Governments[governmentID].Type
	local hasGovernment = player:HasGovernment()
	for row in GameInfo.JFD_Reforms("IsDisabled = 0 AND DefaultActive = 1 AND PrereqGovernment = '" .. governmentType .. "' AND PrereqReform IS NOT NULL") do
		if JFD_HasReform(playerID, GameInfoTypes[row.PrereqReform]) then
			JFD_SetHasReform(playerID, row.ID, true)
		end
	end
	for row in GameInfo.JFD_Reforms("IsDisabled = 0 AND DefaultActive = 1 AND PrereqGovernment = '" .. governmentType .. "' AND PrereqReform IS NULL") do
		JFD_SetHasReform(playerID, row.ID, true)
	end
	if (not hasGovernment) then
		for row in GameInfo.JFD_Reforms("IsDisabled = 0 AND DefaultActive = 1 AND PrereqGovernment IS NULL AND PrereqReform IS NOT NULL") do
			if JFD_HasReform(GameInfoTypes[row.PrereqReform]) then
				JFD_SetHasReform(playerID, row.ID, true)
			end
		end
		for row in GameInfo.JFD_Reforms("IsDisabled = 0 AND DefaultActive = 1 AND PrereqGovernment IS NULL AND PrereqReform IS NULL") do
			JFD_SetHasReform(playerID, row.ID, true)
		end
		for row in GameInfo.JFD_Reforms("PrereqGovernment IS NOT NULL and PrereqGovernment <> '" .. governmentType .. "'") do
			if JFD_HasReform(playerID, row.ID) then
				JFD_SetHasReform(playerID, row.ID, false)
			end
		end
		local civilizationID = player:GetCivilizationType()
		local civilizationType = GameInfo.Civilizations[civilizationID].Type
		for row in GameInfo.Civilization_JFD_Reforms("CivilizationType = '" .. civilizationType .. "' AND StartsWith = 1") do
			local reformID = GameInfoTypes[row.ReformType]
			JFD_SetHasReform(playerID, reformID, true)
		end
	end
end
----------------
-- FREE REFORMS
----------------
--JFD_GetNumFreeReforms
function JFD_GetNumFreeReforms(playerID)
	return JFD_RTP_FreeReforms[playerID] or numReforms or 0
end

--JFD_ChangeNumFreeReforms
function JFD_ChangeNumFreeReforms(playerID, numReforms)
	local currentNum = JFD_GetNumFreeReforms(playerID)
	JFD_SetNumFreeReforms(playerID, currentNum+numReforms)
end

--JFD_SetNumFreeReforms
function JFD_SetNumFreeReforms(playerID, numReforms)
	--JFD_RTP_FreeReforms[playerID] = numReforms
end
----------------
-- ANARCHY SENTIMENT
----------------
--JFD_GetReformAnarchy
function JFD_GetReformAnarchy(playerID, returnsTT)
	local player = Players[playerID]
	local anarchySentimentTT = ""
	local numAnarchySentiment = 0
	local numAnarchySentimentMod = 0
	local numAnarchyTurns = 0
	local numAnarchyCooldownTurns = 0 
	local numAnarchySentimentLegislature = 0
	if (not JFD_HasLegislature(playerID)) then
		numAnarchySentimentLegislature = numAnarchySentimentLegislature + JFD_GetNumReforms(playerID, true)
		numAnarchySentimentLegislature = (numAnarchySentimentLegislature*defineNoLegislatureAnarchyPenalty)
	end
	local numAnarchySentimentReforms = 0
	for row in GameInfo.JFD_Reforms("AnarchySentimentMod <> 0") do
		if JFD_HasReform(playerID, row.ID) then
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
	numAnarchySentimentMod = mathFloor(numAnarchySentiment/100)
	numAnarchyTurns = numAnarchySentimentMod*defineDefaultAnarchyTurns
	numAnarchyCooldownTurns = ((JFD_GetReformCooldown(playerID)*defineDefaultAnarchyCooldownTurns)/100)*numAnarchySentimentMod
	return numAnarchySentiment, numAnarchyTurns, numAnarchyCooldownTurns, anarchySentimentTT
end
----------------
-- INDEX
----------------
--JFD_GetReformIndex
function JFD_GetReformIndex(playerID, isAutocracy, isFreedom, isOrder)
	local autocracyIndex = 0
	if isAutocracy then
		for row in GameInfo.JFD_Reforms("AutocracyIndex = 1") do
			if JFD_HasReform(playerID, row.ID) then
				autocracyIndex = autocracyIndex + row.AutocracyIndex
			end
		end
		return autocracyIndex
	end
	local freedomIndex = 0
	if isFreedom then
		for row in GameInfo.JFD_Reforms("FreedomIndex = 1") do
			if JFD_HasReform(playerID, row.ID) then
				freedomIndex = freedomIndex + row.FreedomIndex
			end
		end
		return freedomIndex
	end
	local orderIndex = 0
	if isOrder then
		for row in GameInfo.JFD_Reforms("OrderIndex = 1") do
			if JFD_HasReform(playerID, row.ID) then
				orderIndex = orderIndex + row.OrderIndex
			end
		end
		return orderIndex
	end
	return autocracyIndex, freedomIndex, orderIndex
end
----------------
-- TEXT
----------------
--JFD_GetReformHelpTT
function JFD_GetReformHelpTT(playerID, reformID)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local hasReform = JFD_HasReform(playerID, reformID)
	local canHaveReform = JFD_CanHaveReform(playerID, reformID)
	local reform = GameInfo.JFD_Reforms[reformID]
	local reformBranch = reform.ReformBranchType
	local reformHelp = reform.Help
	local reformOpinions = nil
	if JFD_HasLegislature(playerID) then reformOpinions = "[NEWLINE]----------[NEWLINE]" end
	local reformAlignment = reform.Alignment
	--Suffrage Support
	if reformBranch == "REFORM_BRANCH_JFD_GOVERNMENT" or reformBranch == "REFORM_BRANCH_JFD_FOREIGN" then
		for row in GameInfo.JFD_Reforms("ReformCostModPerCity <> 0") do
			if JFD_HasReform(playerID, row.ID) then
				local reformCostModPerCity = (row.ReformCostModPerCity*-1)
				reformCostModPerCity = (reformCostModPerCity*player:GetNumCities())
				if reformCostModPerCity > 30 then reformCostModPerCity = 30 end
				if (not reformOpinions) then reformOpinions = "" end
				reformOpinions = reformOpinions .. "[ICON_PLUS]" .. convertTextKey("TXT_KEY_JFD_REFORM_SUPPORT", "TXT_KEY_JFD_SUFFRAGE_THE_CITIES", reformCostModPerCity) 
				reformOpinions = reformOpinions .. "[NEWLINE]"
			end
		end
		for row in GameInfo.JFD_Reforms("ReformCostModPerPop <> 0") do
			if JFD_HasReform(playerID, row.ID) then
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
			-- local politicsDesc = Locale.ConvertTextKey(JFD_GetPoliticDescription(activePlayerID, politic.ID))
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
		local politicsFavour, politicsOppose = JFD_GetReformElectorOpinion(playerID, reformID)
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
		local politicsFavour, politicsOppose = JFD_GetReformClergyOpinion(playerID, reformBranch, reform.Alignment)
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
			local reformCost = JFD_GetReformCost(playerID, reformID)
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
			if (prereqReformID and (not JFD_HasReform(playerID, prereqReformID))) then
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

--JFD_GetReformsListTT
function JFD_GetReformsListTT(playerID)
	local player = Players[playerID]
	local reformListTT = "[COLOR_JFD_SOVEREIGNTY]REFORMS[ENDCOLOR]"
	if (playerID == activePlayerID or activePlayerTeam:HasEmbassyAtTeam(player:GetTeam())) then 
		--Government
		local reformsGovt = {}
		local reformGovtsCount = 1
		for row in GameInfo.JFD_Reforms("ReformBranchType = 'REFORM_BRANCH_JFD_GOVERNMENT' AND (Alignment = 'REFORM_LEFT' OR Alignment = 'REFORM_RIGHT')") do
			local reformID = row.ID
			if JFD_HasReform(playerID, reformID) then
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
			if JFD_HasReform(playerID, reformID) then
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
			if JFD_HasReform(playerID, reformID) then
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
			if JFD_HasReform(playerID, reformID) then
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
			if JFD_HasReform(playerID, reformID) then
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
			if JFD_HasReform(playerID, reformID) then
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
			if JFD_HasReform(playerID, reformID) then
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
			if JFD_HasReform(playerID, reformID) then
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
--JFD_HasPrivyCouncillor
function JFD_HasPrivyCouncillor(playerID, privyCouncillorID)
	local player = Players[playerID]
	local privyCouncillor = GameInfo.JFD_PrivyCouncillors[privyCouncillorID]	
	for row in GameInfo.JFD_PrivyCouncillor_GreatPeople("PrivyCouncillorType = '" .. privyCouncillor.Type .. "'") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			return true
		end
	end
	return false
end

--JFD_GetPrivyCouncllor
function JFD_GetPrivyCouncllor(playerID, privyCouncillorID)
	local player = Players[playerID]
	local privyCouncillor = GameInfo.JFD_PrivyCouncillors[privyCouncillorID]
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
--JFD_GetUniqueTitle
function JFD_GetUniqueTitle(playerID, titleType, isReligious)
	local player = Players[playerID]
	local civType = nil
	local cultureID = JFD_GetCultureID(playerID)
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
--JFD_GetLeaderTitle
local buildingTempleHeavenID 		= GameInfoTypes["BUILDING_JFD_TEMPLE_HEAVEN"]
local reformLegitimacyDivineRightID = GameInfoTypes["REFORM_JFD_LEGITIMACY_DIVINE_RIGHT"]
local reformStateEmpireID 		    = GameInfoTypes["REFORM_JFD_STATE_EMPIRE"]
function JFD_GetLeaderTitle(playerID)
	local player = Players[playerID]
	local civName = player:GetCivilizationShortDescription()
	local leaderName = convertTextKey(JFD_GetDefaultLeaderName(playerID))
	local dominantBranchID = player:GetDominantPolicyBranchForTitle()
	local leaderFullTitle = leaderName
	if (dominantBranchID > -1 and (not userSettingEpithetsCore)) then
		local socialPolicyShortDesc = GameInfo.PolicyBranchTypes[dominantBranchID].TitleShort
		leaderFullTitle = leaderName .. " " .. convertTextKey(socialPolicyShortDesc)
	elseif userSettingEpithetsCore then
		local epithetID = JFD_GetEpithetID(playerID)
		if epithetID then
			local epithetShortDesc = JFD_GetEpithetDescription(playerID, epithetID)
			leaderName = leaderName .. " " .. convertTextKey(epithetShortDesc)
			leaderFullTitle = leaderName
		end
	end
	local hasDivineRight = JFD_HasReform(playerID, reformLegitimacyDivineRightID)
	if (player:GetLateGamePolicyTree() == ideologyAutocracyID and JFD_HasReform(playerID, reformStateEmpireID)) then
		if hasDivineRight then
			leaderFullTitle = leaderFullTitle .. ", " .. convertTextKey("TXT_KEY_JFD_BY_THE_GRACE_OF_GOD_AND_WILL_OF_NATION")
		else
			leaderFullTitle = leaderFullTitle .. ", " .. convertTextKey("TXT_KEY_JFD_BY_THE_WILL_OF_NATION")
		end
	elseif hasDivineRight then
		leaderFullTitle = leaderFullTitle .. ", " .. convertTextKey("TXT_KEY_JFD_BY_THE_GRACE_OF_GOD")
	end
	if player:HasBuilding(buildingTempleHeavenID) then
		if JFD_IsLeaderFeminine(playerID) then
			leaderFullTitle = leaderFullTitle .. ", " .. convertTextKey("TXT_KEY_JFD_DAUGHTER_OF_HEAVEN")
		else
			leaderFullTitle = leaderFullTitle .. ", " .. convertTextKey("TXT_KEY_JFD_SON_OF_HEAVEN")
		end
	end
	if player:GetGovernment() == governmentHolyRomeID then
		leaderFullTitle = leaderFullTitle .. ", " .. convertTextKey("TXT_KEY_JFD_BLANK_TITLE_LEADER_GOVT_HRE", JFD_GetLeaderTitleShort(playerID), JFD_GetLeaderTitleShort(playerID, governmentMonarchyID), civName)
	elseif player:GetGovernment() == governmentTheocracyID then
		leaderFullTitle = leaderFullTitle .. ", " .. convertTextKey("TXT_KEY_JFD_BLANK_TITLE_LEADER_GOVT", JFD_GetLeaderTitleShort(playerID), "the " .. player:GetCivilizationDescription())
	else
		leaderFullTitle = leaderFullTitle .. ", " .. convertTextKey("TXT_KEY_JFD_BLANK_TITLE_LEADER_GOVT", JFD_GetLeaderTitleShort(playerID), civName)
	end
	for city in player:Cities() do
		if (city:IsOriginalCapital() and city:GetOriginalOwner() ~= playerID) then	
			local secondaryTitle = nil
			local originalOwnerID = city:GetOriginalOwner()
			local originalOwner = Players[originalOwnerID]
			if (not originalOwner:IsMinorCiv()) then
				local governmentID = originalOwner:GetGovernment()
				if governmentID > -1 then
					secondaryTitle = JFD_GetLeaderTitleShort(originalOwnerID, originalOwner:GetGovernment(), false, playerID)
				end
			end
			if secondaryTitle then
				if JFD_IsLeaderFeminine(playerID) then secondaryTitle = secondaryTitle .. "_FEMININE" end
				leaderFullTitle = leaderFullTitle .. ", " .. convertTextKey("TXT_KEY_JFD_BLANK_TITLE_LEADER_GOVT", secondaryTitle, originalOwner:GetCivilizationShortDescription())
			end
		end
	end
	for city in player:Cities() do
		if (city:IsOriginalCapital() and city:GetOriginalOwner() ~= playerID) then	
			local originalOwnerID = city:GetOriginalOwner()
			local originalOwner = Players[originalOwnerID]
			local secondaryTitle = nil
			if originalOwner:IsMinorCiv() then
				for row in GameInfo.MinorCivilization_JFD_Titles("MinorCivilizationType = '" .. GameInfo.MinorCivilizations[originalOwner:GetMinorCivType()].Type .. "'") do
					secondaryTitle = row.UniqueLeaderTitle
					if (secondaryTitle and JFD_IsLeaderFeminine(playerID)) then secondaryTitle = secondaryTitle .. "_FEMININE" end
				end
			end
			if secondaryTitle then
				leaderFullTitle = leaderFullTitle .. ", " .. convertTextKey("TXT_KEY_JFD_BLANK_TITLE_LEADER_GOVT", secondaryTitle, originalOwner:GetCivilizationShortDescription())
			end
		end
	end
	return leaderFullTitle
end

--JFD_GetLeaderTitleShort
local eraMedievalID			= GameInfoTypes["ERA_MEDIEVAL"]
local religionCatholicismID	= GameInfoTypes["RELIGION_CHRISTIANITY"]
function JFD_GetLeaderTitleShort(playerID, thisGovernmentID, isLate, otherPlayerID)
	local player = Players[playerID]
	local isLeaderFeminine = JFD_IsLeaderFeminine(playerID)
	if otherPlayerID then isLeaderFeminine = JFD_IsLeaderFeminine(otherPlayerID) end
	if (player:HasGovernment() or thisGovernmentID and thisGovernmentID > -1) then
		local governmentID = thisGovernmentID
		if (not governmentID) then governmentID = player:GetGovernment() end
		local government = GameInfo.JFD_Governments[governmentID]
		local leaderTitleText = ""
		for row in GameInfo.JFD_Government_ReformTitles("GovernmentType = '" .. government.Type .. "' AND TitleLeader IS NOT NULL") do
			if ((not row.ReformType) or JFD_HasReform(playerID, GameInfoTypes[row.ReformType])) then
				leaderTitleText = row.TitleLeader
			end
		end
		if (player:GetCurrentEra() > eraMedievalID or isLate) then
			for row in GameInfo.JFD_Government_ReformTitles("GovernmentType = '" .. government.Type .. "' AND TitleLeaderLate IS NOT NULL") do
				if ((not row.ReformType) or JFD_HasReform(playerID, GameInfoTypes[row.ReformType])) then
					leaderTitleText = row.TitleLeaderLate 
				end
			end
		end	
		local isReligious = (governmentID == governmentTheocracyID)
		local uniqueleaderTitleText, useAdj, useCapital, isCulDiv = JFD_GetUniqueTitle(playerID, leaderTitleText, isReligious)
		if isLeaderFeminine then leaderTitleText = leaderTitleText .. "_FEMININE" end
		if isLeaderFeminine and uniqueleaderTitleText then uniqueleaderTitleText = uniqueleaderTitleText .. "_FEMININE" end
		return uniqueleaderTitleText or leaderTitleText
	else
		local leaderTitleText = "TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_LEADER"
		local uniqueleaderTitleText, useAdj, useCapital, isCulDiv = JFD_GetUniqueTitle(playerID, leaderTitleText)
		if isLeaderFeminine then leaderTitleText = leaderTitleText .. "_FEMININE" end
		if isLeaderFeminine and uniqueleaderTitleText then uniqueleaderTitleText = uniqueleaderTitleText .. "_FEMININE" end
		return uniqueleaderTitleText or leaderTitleText
	end
end

--JFD_SetLeaderTitle
function JFD_SetLeaderTitle(playerID, leaderTitle)
	local player = Players[playerID]
	local leaderName = GameInfo.Leaders[player:GetLeaderType()].Description
	--Check Policy-earned Names
	local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
	for row in GameInfo.Policy_JFD_LeaderName("LeaderType = '" .. leaderType .. "'") do
		local policyID = GameInfoTypes[row.PolicyType]
		if player:HasPolicy(policyID) then
			leaderName = row.Description
		end
	end
	local leaderTitleText = convertTextKey("TXT_KEY_JFD_BLANK_TITLE_LEADER", leaderTitle, leaderName)
	PreGame.SetLeaderName(playerID, leaderTitleText)
end
----------------------
-- GOVERNMENT
----------------------
--JFD_GetGovernmentTitle
function JFD_GetGovernmentTitle(playerID, thisGovernmentID)
	local player = Players[playerID]
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
	local isCivilisationPlural = JFD_IsCivilizationPlural(playerID)
	local useAdjective = false
	local governmentTitleText = ""
	local governmentTitleAdj = civAdjective
	if (player:HasGovernment() or thisGovernmentID) then
		local governmentID = thisGovernmentID
		if (not governmentID) then governmentID = player:GetGovernment() end
		local government = GameInfo.JFD_Governments[governmentID]
		local isReligious = (governmentID == governmentTheocracyID)
		for row in GameInfo.JFD_Government_ReformTitles("GovernmentType = '" .. government.Type .. "'") do
			if ((not row.ReformType) or JFD_HasReform(playerID, GameInfoTypes[row.ReformType])) then
				governmentTitleText = row.TitleGovernment
				useAdjective = row.UseAdjective
				break
			end
		end
		local uniqueGovernmentTitleText, isAdj, useCapitalName = JFD_GetUniqueTitle(playerID, governmentTitleText, isReligious)
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
		local uniqueGovernmentTitleText, isAdj = JFD_GetUniqueTitle(playerID, governmentTitleText)
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

--JFD_GetGovernmentShortDescription
function JFD_GetGovernmentShortDescription(playerID)
	local player = Players[playerID]
	if player:HasGovernment() then
		local governmentID = player:GetGovernment()
		local government = GameInfo.JFD_Governments[governmentID]
		for row in GameInfo.JFD_Government_ReformTitles("GovernmentType = '" .. government.Type .. "'") do
			if ((not row.ReformType) or JFD_HasReform(playerID, GameInfoTypes[row.ReformType])) then
				return row.TitleGovernmentShort
			end
		end
	end
	return "TXT_KEY_GOVERNMENT_JFD_TRIBE_DESC"
end

--JFD_SetGovernmentTitle
function JFD_SetGovernmentTitle(playerID, governmentTitle)
	PreGame.SetCivilizationDescription(playerID, governmentTitle)
end
----------------------
-- FACTION
----------------------
--JFD_GetDominantPoliticID
function JFD_GetDominantPoliticID(playerID)
	local player = Players[playerID]
	local dominantPoliticID = nil
	local dominantPoliticPercent = 0
	local governmentID = player:GetGovernment()
	local governmentType = GameInfo.JFD_Governments[governmentID].Type
	if governmentID == governmentHolyRomeID then
		for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do	
			local otherPlayer = Players[otherPlayerID]
			local electorID = JFD_GetElectorID(otherPlayerID)
			if (otherPlayer:IsAlive() and otherPlayer:IsMinorCiv()) then
				local politicID = nil
				if (player:GetPoliticPercent(electorID) > dominantPoliticPercent) then
					dominantPoliticID = electorID
					dominantPoliticPercent = player:GetPoliticPercent(electorID)
				end
			end
		end	
	elseif governmentID == governmentTheocracyID then
		if JFD_HasReform(playerID, reformTLegislatureAutocephalousID) then
			for city in player:Cities() do
				local cityID = JFD_CompileCityID(city)
				local politicID = nil
				if (player:GetPoliticPercent(cityID) > dominantPoliticPercent) then
					dominantPoliticID = cityID
					dominantPoliticPercent = player:GetPoliticPercent(cityID)
				end
			end	
		elseif JFD_HasReform(playerID, reformTLegislatureEcumenicalID) then
			for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do	
				local otherPlayer = Players[otherPlayerID]
				local clergyID = JFD_GetClergyID(otherPlayerID)
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

--JFD_GetHeadOfGovernmentTitle
function JFD_GetHeadOfGovernmentTitle(playerID, isReligious)
	local player = Players[playerID]
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	local officeTitle = "TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE"
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

--JFD_GetPoliticDescription
local politicRevolutionaryHREID		  = GameInfoTypes["ELECTOR_JFD_REVOLUTIONARY"]
local politicRevolutionaryTheocracyID = GameInfoTypes["CLERGY_JFD_REVOLUTIONARY"]
function JFD_GetPoliticDescription(playerID, politicID, isReligious)
	local player = Players[playerID]
	local governmentID = player:GetGovernment()
	if (governmentID == governmentHolyRomeID and politicID == politicRevolutionaryHREID) then 
		return "TXT_KEY_JFD_ELECTOR_JFD_REVOLUTIONARY_UNIQUE_NAME", "[ICON_JFD_ELECTOR]"
	end
	if (governmentID == governmentTheocracyID and politicID == politicRevolutionaryTheocracyID) then 
		return "TXT_KEY_JFD_CLERGY_JFD_REVOLUTIONARY_UNIQUE_NAME", "[ICON_JFD_CLERGY]"
	end
	if isReligious then
		local politicDesc = "TXT_KEY_JFD_PARTY_JFD_CLERGY_DESC"
		local religionType = GameInfo.Religions[politicID].Type
		for row in GameInfo.Religion_JFD_Governments("ReligionType = '" .. religionType .. "'") do
			return row.FactionName			
		end		
		return politicDesc
	else
		local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
		local politic = GameInfo.JFD_Politics[politicID]
		for row in GameInfo.Civilization_JFD_Politics("CivilizationType = '" .. civType .. "' AND PoliticsType = '" .. politic.Type .. "'") do
			return row.UniqueName, politic.FontIcon
		end
		return politic.Description, politic.FontIcon
	end
end

--JFD_GetPoliticLeader
function JFD_GetPoliticLeader(playerID)
	local player = Players[playerID]
	local headsOfGovt = {}
	local headsOfGovtCount = 1
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	for row in GameInfo.Civilization_JFD_HeadsOfGovernment("CivilizationType = '" .. civType .. "'") do
		headsOfGovt[headsOfGovtCount] = row.HeadOfGovernmentName
		headsOfGovtCount = headsOfGovtCount + 1
	end
	if #headsOfGovt > 0 then 
		return headsOfGovt[JFD_GetRandom(1,#headsOfGovt)] or headsOfGovt[1]
	end
	local cultureID = JFD_GetCultureID(playerID)
	for row in GameInfo.JFD_CultureType_HeadsOfGovernment("CultureType = '" .. GameInfo.JFD_CultureTypes[cultureID].Type .. "'") do
		headsOfGovt[headsOfGovtCount] = row.HeadOfGovernmentName
		headsOfGovtCount = headsOfGovtCount + 1
	end
	if #headsOfGovt > 0 then
		return headsOfGovt[JFD_GetRandom(1,#headsOfGovt)] or headsOfGovt[1]
	end
end
----------------------
-- PRIVY COUNCILLOR
----------------------
--JFD_GetPrivyCouncillorTitle
function JFD_GetPrivyCouncillorTitle(playerID, privyCouncillorID)
	local player = Players[playerID]
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
	local cultureType = GameInfo.JFD_CultureTypes[JFD_GetCultureID(playerID)].Type
	for row in GameInfo.JFD_PrivyCouncillor_UniqueNames("PrivyCouncillorType = '" .. privyCouncillorType .. "' AND CultureType = '" .. cultureType .. "'") do
		return Locale.ConvertTextKey(row.UniqueName)
	end
	return Locale.ConvertTextKey(privyCouncillor.Description)
end
------------------------------------------------------------------------------------------------------------------------
-- AI
------------------------------------------------------------------------------------------------------------------------
--JFD_GetLeaderAlignment
function JFD_GetLeaderAlignment(playerID, reformBranchType)
	local player = Players[playerID]
	local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
	local flavourType = nil
	local flavourTypeAlt = nil
	for row in GameInfo.JFD_ReformBranch_Flavours("ReformBranchType = '" .. reformBranchType .. "'") do
		flavourType = row.FlavourType
		flavourTypeAlt = row.AltFlavourType
		break
	end
	local leaderFlavour = JFD_GetLeaderFlavour(playerID, flavourType)
	if (not leaderFlavour) or leaderFlavour <= 0 then leaderFlavour = JFD_GetLeaderFlavour(playerID, flavourTypeAlt) end
	local alignment = "REFORM_CENTRE"
	for row in GameInfo.JFD_ReformBranch_Alignment("ReformBranchType = '" .. reformBranchType .. "' AND '" .. leaderFlavour .. "' >= MinRange AND '" .. leaderFlavour .. "' <= MaxRange") do
		alignment = row.Alignment
		break
	end
	return alignment
end
------------------------------------------------------------------------------------------------------------------------
-- MISC
------------------------------------------------------------------------------------------------------------------------
--JFD_GetDiploListInfo
function JFD_GetDiploListInfo(playerID)
	local player = Players[playerID]
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	local civDesc = player:GetCivilizationShortDescription()
	local civTT = ""
	--Check for Policy-earned Names
	for row in GameInfo.Policy_JFD_CivilizationNames("CivilizationType = '" .. civType .. "'") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			civDesc = row.ShortDescription
		end
	end
	--Government
	local government = "TXT_KEY_GOVERNMENT_JFD_TRIBE_DESC"
	local governmentID = player:GetGovernment()
	civTT = civTT .. "[NEWLINE]" .. Locale.ConvertTextKey(government)
	civTT = player:GetCivilizationDescription() .. "[NEWLINE]---------" 
	--Culture
	local cultureID = JFD_GetCultureID(activePlayerID)
	local culture = GameInfo.JFD_CultureTypes[cultureID]
	civTT = civTT .. "[NEWLINE]" .. Locale.ConvertTextKey("{1_FontIcon} {2_CultureDesc}", culture.FontIcon, culture.ShortDescription)
	--State Religion
	if player:IsPagan() then
		civTT = civTT .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_JFD_NO_STATE_RELIGION_PAGAN")
	elseif player:HasSecularized() then
		civTT = civTT .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_JFD_NO_STATE_RELIGION_SECULAR")
	elseif player:HasStateReligion() then
		local religionID = player:GetStateReligion()
		if religionID > -1 then
			civTT = civTT .. "[NEWLINE]" .. Locale.ConvertTextKey("{1_FontIcon} {2_ReligionDesc}", GameInfo.Religions[religionID].IconString, Game.GetReligionName(religionID))
		end
	end	
	--Currency
	local currencyID = player:GetCurrency()
	if currencyID > -1 then
		local currency = GameInfo.JFD_Currencies[currencyID]
		if currency then civTT = civTT .. "[NEWLINE]" .. Locale.ConvertTextKey("{1_FontIcon} {2_CurrencyDesc}", currency.IconString, currency.Description) end
	end
	--Ideology
	local ideologyID = player:GetLateGamePolicyTree()
	if ideologyID > -1 then
		local ideology = GameInfo.PolicyBranchTypes[ideologyID]
		civTT = civTT .. "[NEWLINE]" .. Locale.ConvertTextKey("{1_FontIcon} {2_IdeologyDesc}", ideology.IconString, ideology.Description)
	end
	--Resources
	local leaderDesc = GameInfo.Leaders[player:GetLeaderType()].Description
	local leaderTT = JFD_GetLeaderTitle(playerID)
	--Check Policy-earned Names
	local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
	for row in GameInfo.Policy_JFD_LeaderName("LeaderType = '" .. leaderType .. "'") do
		local policyID = GameInfoTypes[row.PolicyType]
		if player:HasPolicy(policyID) then
			leaderDesc = row.Description
		end
	end
	return civDesc, civTT, leaderDesc, leaderTT
end
--=======================================================================================================================
--=======================================================================================================================







