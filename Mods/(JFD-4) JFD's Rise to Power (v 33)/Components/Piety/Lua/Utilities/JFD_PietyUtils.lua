-- JFD_PietyUtils
-- Author: JFD
-- DateCreated: 10/14/2015 7:38:08 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_RTPUtils.lua")
--=======================================================================================================================
-- DEFINES
--=======================================================================================================================
local definePietyCityStateRestBonus			 = GameDefines["JFD_RTP_PIETY_CITY_STATE_REST_BONUS"]
local definePietyIdeologyPenalty			 = GameDefines["JFD_RTP_PIETY_IDEOLOGY_PENALTY"]
local definePietyRestingRateAbove			 = GameDefines["JFD_RTP_PIETY_RESTING_RATE_PER_TURN_ABOVE"]
local definePietyRestingRateBelow			 = GameDefines["JFD_RTP_PIETY_RESTING_RATE_PER_TURN_BELOW"]
local definePietyStateReligionChange		 = GameDefines["JFD_RTP_PIETY_STATE_RELIGION_CHANGE"]
local definePietyStateReligionChangeFirst	 = GameDefines["JFD_RTP_PIETY_STATE_RELIGION_CHANGE_FIRST"]
local definePietyStateReligionSecularize	 = GameDefines["JFD_RTP_PIETY_STATE_RELIGION_SECULARIZE"]
--=======================================================================================================================
-- MOD USE
--=======================================================================================================================
local isUsingEUI = JFD_IsUsingEUI(true)
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingPietyCore				 = JFD_GetUserSetting("JFD_RTP_PIETY_CORE") == 1
local userSettingPietyCoreLossFromOthers = JFD_GetUserSetting("JFD_RTP_PIETY_CORE_LOSS_FROM_OTHER_CITIES") == 1
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local convertTextKey		= Locale.ConvertTextKey
local mathCeil				= math.ceil
local mathFloor 			= math.floor
local mathMin				= math.min

local gameSpeed				= GameInfo.GameSpeeds[Game.GetGameSpeedType()]
local gameSpeedMod			= (gameSpeed.BuildPercent/100)
local gameSpeedType 		= gameSpeed.Type 

local governmentTheocracyID = GameInfoTypes["GOVERNMENT_JFD_THEOCRACY"]
------------------------------------------------------------------------------------------------------------------------
-- STATE RELIGION
------------------------------------------------------------------------------------------------------------------------
--JFD_CanAdoptAnyStateReligion
function JFD_CanAdoptAnyStateReligion(playerID)
	if (not userSettingPietyCore) then return false end
	if JFD_CanSecularize(playerID) then return true end
	local player = Players[playerID]
	if player:HasSecularized() then return false end
	local hasEarlyFound = false
	for row in GameInfo.Buildings("FoundsStateReligion > 0") do
		if player:HasBuilding(row.ID) then
			hasEarlyFound = true
		end
	end
	if (JFD_IsTechnologyRequirementUnlocked(playerID, "AllowStateReligions") or hasEarlyFound) then
		local currentStateReligionID = player:GetStateReligion()
		for religion in GameInfo.Religions("ID <> '" .. currentStateReligionID .. "'") do
			if JFD_CanAdoptStateReligion(playerID, religion.ID) then
				return true
			end
		end
	end
	return false
end

--JFD_CanAdoptStateReligion
function JFD_CanAdoptStateReligion(playerID, religionID)
	if (not userSettingPietyCore) then return false end
	if (not Game.AnyoneHasReligion(religionID)) then return false end
	local flavourStateReligion = JFD_GetLeaderFlavour(playerID, "FLAVOR_JFD_STATE_RELIGION")
	local player = Players[playerID]
	if ((not player:IsHuman()) and flavourStateReligion == 0) then return false end
	if player:HasSecularized() then return false end
	if player:HasStateReligion() then
		local currentStateReligionID = player:GetStateReligion()
		if religionID == currentStateReligionID then return false end
		local pietyLevel = GameInfo.JFD_PietyLevels[JFD_GetPietyLevelID(playerID)]
		local faithCost = mathCeil(pietyLevel.ChangeFaithCost*gameSpeedMod) 
		if player:GetFaith() < faithCost then return false end
		if player:GetGovernment() == governmentTheocracyID then return false end
	end
	local hasEarlyFound = false
	for row in GameInfo.Buildings("FoundsStateReligion > 0") do
		if player:HasBuilding(row.ID) then
			hasEarlyFound = true
		end
	end
	if (JFD_IsTechnologyRequirementUnlocked(playerID, "AllowStateReligions") or hasEarlyFound) then
		local religionFounderID = Game.GetFounder(religionID, -1)
		if religionFounderID then
			if Teams[player:GetTeam()]:IsHasMet(Players[religionFounderID]:GetTeam()) then
				return true
			end
		end
	end
	return false
end

--JFD_GetStateReligionChance
local civilizationLithuaniaID = GameInfoTypes["CIVILIZATION_JFD_LITHUANIA"]
local eraIndustrialID = GameInfoTypes["ERA_INDUSTRIAL"]
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local majorCivOpinionMods = {[0]=0, [1]=-20, [2]=-50, [3]=0, [4]=50, [5]=100}
local minorCivOpinionMods = {[0]=-50, [1]=0, [2]=50}
function JFD_GetStateReligionChance(playerID)
	if (not userSettingPietyCore) then return 0 end
	local player = Players[playerID]
	local stateReligionChance = 0
	if (not player:IsAlive()) then return -1 end
	local flavourStateReligion = JFD_GetLeaderFlavour(playerID, "FLAVOR_JFD_STATE_RELIGION")
	if flavourStateReligion == 0 then 
		return stateReligionChance, Locale.ConvertTextKey("TXT_KEY_JFD_STATE_RELIGION_CHANCE_NO_INTEREST")
	end 
	local foundedReligionID = player:GetReligionCreatedByPlayer()
	if foundedReligionID > 0 then
		if player:GetGovernment() == governmentTheocracyID then
			return -1, Locale.ConvertTextKey("TXT_KEY_JFD_STATE_RELIGION_CHANCE_THEOCRACY")
		end
		if player:GetCapitalCity():GetReligiousMajority() == foundedReligionID then 
			return -1, Locale.ConvertTextKey("TXT_KEY_JFD_STATE_RELIGION_CHANCE_FOUNDED_AND_CAPITAL", Game.GetReligionName(foundedReligionID))
		end
	end
	local religionID = player:GetMajorityReligion() or -1
	if religionID <= 0 then		
		if player:GetNumCities() <= 2 then religionID = player:GetCapitalCity():GetReligiousMajority() or -1 end
	end
	if religionID <= 0 then 
		return -1, Locale.ConvertTextKey("TXT_KEY_JFD_STATE_RELIGION_CHANCE_NO_RELIGION") 
	end
	if (not JFD_CanAdoptStateReligion(playerID, religionID)) then 
		return -1, Locale.ConvertTextKey("TXT_KEY_JFD_STATE_RELIGION_CHANCE_NO_CONDITIONS") 
	end
	if (player:IsCivilization(civilizationLithuaniaID) and player:GetCurrentEra() < eraRenaissanceID) then 
		return stateReligionChance, Locale.ConvertTextKey("TXT_KEY_JFD_STATE_RELIGION_CHANCE_LITHUANIA")
	end
	if Game.GetGameTurn() < player:GetTurnsSinceConversion() then 
		local turnsTil = (player:GetTurnsSinceConversion()-Game.GetGameTurn())
		return stateReligionChance, Locale.ConvertTextKey("TXT_KEY_JFD_STATE_RELIGION_CHANCE_TOO_RECENT", turnsTil)
	end
	local religionFounderID = Game.GetFounder(religionID, -1)
	local religionFounder = Players[religionFounderID]
	if player:IsMinorCiv() then
		local opinionMod = minorCivOpinionMods[player:GetMinorCivFriendshipLevelWithMajor(religionFounderID)] or 1
		stateReligionChance = stateReligionChance + mathCeil((flavourStateReligion*opinionMod)/100)
	else
		local opinionMod = majorCivOpinionMods[player:GetMajorCivOpinion(religionFounderID)] or 1
		stateReligionChance = stateReligionChance + mathCeil((flavourStateReligion*opinionMod)/100)
	end		
	if (player:GetCurrentEra() == eraMedievalID or player:GetCurrentEra() == eraRenaissanceID) then
		stateReligionChance = stateReligionChance*2
	end
	if player:GetLateGamePolicyTree() > 0 then 
		stateReligionChance = (stateReligionChance/2) 
	end
	local pietyLevelMod = GameInfo.JFD_PietyLevels[JFD_GetPietyLevelID(playerID)].AdoptModifier
	stateReligionChance = stateReligionChance + mathCeil((flavourStateReligion*pietyLevelMod)/100)
	for row in GameInfo.Building_JFD_PietyMods("StateReligionAdoptMod <> 0") do
		if religionFounder:HasBuilding(GameInfoTypes[row.BuildingType]) then
			local adoptMod = row.StateReligionAdoptMod
			stateReligionChance = stateReligionChance + ((stateReligionChance*adoptMod)/100)
		end
	end	
	for row in GameInfo.Policy_JFD_PietyMods("StateReligionAdoptMod <> 0") do
		if religionFounder:HasPolicy(GameInfoTypes[row.PolicyType]) then
			local adoptMod = row.StateReligionAdoptMod
			stateReligionChance = stateReligionChance + ((stateReligionChance*adoptMod)/100)
		end
	end
	for row in GameInfo.Trait_JFD_PietyMods("StateReligionAdoptMod <> 0") do
		if religionFounder:HasTrait(GameInfoTypes[row.TraitType]) then
			local adoptMod = row.StateReligionAdoptMod
			stateReligionChance = stateReligionChance + ((stateReligionChance*adoptMod)/100)
		end
	end
	for row in GameInfo.JFD_Reform_PietyMods("StateReligionAdoptMod <> 0") do
		if JFD_HasReform(religionFounderID, GameInfoTypes[row.ReformType]) then
			local adoptMod = row.StateReligionAdoptMod
			stateReligionChance = stateReligionChance + ((stateReligionChance*adoptMod)/100)
		end
	end
	return mathFloor(stateReligionChance)
end

--JFD_GetStateReligionPressure
local pietyLevelHereticalID = GameInfoTypes["PIETY_LEVEL_JFD_HERETICAL"]
local pietyLevelPoorID		= GameInfoTypes["PIETY_LEVEL_JFD_POOR"]
function JFD_GetStateReligionPressure(playerID)
	if (not userSettingPietyCore) then return 0 end
	local player = Players[playerID]
	local pietyLevelID = JFD_GetPietyLevelID(playerID)
	local pietyLevel = GameInfo.JFD_PietyLevels[pietyLevelID]
	local stateReligionPressure = pietyLevel.ConversionRate
	local pietyYieldTT = ""
	for row in GameInfo.Building_JFD_PietyMods("StateReligionPressureMod <> 0") do
		if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
			local pressureMod = row.StateReligionPressureMod
			stateReligionPressure = stateReligionPressure + ((stateReligionPressure*pressureMod)/100)
		end
	end	
	for row in GameInfo.Policy_JFD_PietyMods("StateReligionPressureMod <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			local pressureMod = row.StateReligionPressureMod
			stateReligionPressure = stateReligionPressure + ((stateReligionPressure*pressureMod)/100)
		end
	end
	for row in GameInfo.Trait_JFD_PietyMods("StateReligionPressureMod <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			local pressureMod = row.StateReligionPressureMod
			stateReligionPressure = stateReligionPressure + ((stateReligionPressure*pressureMod)/100)
		end
	end
	for row in GameInfo.JFD_Reform_PietyMods("StateReligionPressureMod <> 0") do
		if JFD_HasReform(playerID, GameInfoTypes[row.ReformType]) then
			local pressureMod = row.StateReligionPressureMod
			stateReligionPressure = stateReligionPressure + ((stateReligionPressure*pressureMod)/100)
		end
	end
	for row in GameInfo.Policies("NoReligionLossFromPiety = 1") do
		if player:HasPolicy(row.ID) then
			if (pietyLevelID == pietyLevelPoorID or pietyLevelID == pietyLevelHereticalID) then
				stateReligionPressure = 0 
			end
		end
	end
	return JFD_Round(stateReligionPressure)
end
-----------------
-- SECULARIZATION
-----------------
--JFD_CanSecularize
local pietyLevelNeutralID = GameInfoTypes["PIETY_LEVEL_JFD_NEUTRAL"]
function JFD_CanSecularize(playerID)
	if (not userSettingPietyCore) then return false end
	local player = Players[playerID]
	if player:IsMinorCiv() then return false end
	if player:HasSecularized() then return false end
	if ((not player:IsHuman()) and JFD_GetPietyLevelID(playerID) >= pietyLevelNeutralID) then return false end
	if (player:HasStateReligion() and (not player:IsHuman())) then
		local pietyLevel = GameInfo.JFD_PietyLevels[JFD_GetPietyLevelID(playerID)]
		local faithCost = mathCeil(pietyLevel.ChangeFaithCost*gameSpeedMod) 
		if player:GetFaith() < faithCost then return false end
		if player:GetGovernment() == governmentTheocracyID then return false end
	end
	return JFD_IsTechnologyRequirementUnlocked(playerID, "AllowSecularization")
end

--JFD_GetSecularizeChance
local majorCivOpinionModsSecularize = {[0]=-20, [1]=-50, [2]=0, [3]=50, [4]=100, [5]=0}
local minorCivOpinionMods = {[0]=50, [1]=0, [2]=-50}
local minorCivTraitReligiousID = MinorCivTraitTypes["MINOR_CIV_TRAIT_RELIGIOUS"]
function JFD_GetSecularizeChance(playerID)
	if (not userSettingPietyCore) then return 0 end
	local player = Players[playerID]
	local secularizeChance = 0
	if player:GetGovernment() == governmentTheocracyID then
		return -1, Locale.ConvertTextKey("TXT_KEY_JFD_STATE_RELIGION_CHANCE_THEOCRACY")
	end
	if (player:IsMinorCiv() and player:GetMinorCivTrait() == minorCivTraitReligiousID) then 
		return 0, Locale.ConvertTextKey("TXT_KEY_JFD_STATE_RELIGION_CHANCE_RELIGIOUS_CITY_STATE") 
	end
	if (not JFD_CanSecularize(playerID)) then 
		return -1, Locale.ConvertTextKey("TXT_KEY_JFD_STATE_RELIGION_CHANCE_NO_CONDITIONS_SECULARIZE")
	end
	if Game.GetGameTurn() < player:GetTurnsSinceConversion() then 
		return secularizeChance, Locale.ConvertTextKey("TXT_KEY_JFD_STATE_RELIGION_CHANCE_TOO_RECENT_SECULARIZE")
	end
	local flavourStateReligion = JFD_GetLeaderFlavour(playerID, "FLAVOR_JFD_STATE_RELIGION")
	if flavourStateReligion > 9 then 
		return secularizeChance, Locale.ConvertTextKey("TXT_KEY_JFD_STATE_RELIGION_CHANCE_STATE_RELIGION_FLAVOUR")
	end 
	local religionID = player:GetStateReligion()
	local religionFounderID = Game.GetFounder(religionID, -1)
	local religionFounder = Players[religionFounderID]
	local flavourScience = JFD_GetLeaderFlavour(playerID, "FLAVOR_SCIENCE")
	if player:IsMinorCiv() then
		local opinionMod = minorCivOpinionMods[player:GetMinorCivFriendshipLevelWithMajor(religionFounderID)] or 1
		secularizeChance = secularizeChance + mathCeil((flavourScience*opinionMod)/100)
	else
		local opinionMod = majorCivOpinionMods[player:GetMajorCivOpinion(religionFounderID)] or 1
		secularizeChance = secularizeChance + mathCeil((flavourScience*opinionMod)/100)
	end		
	secularizeChance = (secularizeChance+player:GetCurrentEra()+1)
	local pietyLevelID = JFD_GetPietyLevelID(playerID)
	local pietyLevel = GameInfo.JFD_PietyLevels[pietyLevelID].AdoptModifier
	secularizeChance = secularizeChance + mathCeil((secularizeChance*pietyLevelMod)/100)
	for row in GameInfo.Building_JFD_PietyMods("StateReligionAdoptMod <> 0") do
		if religionFounder:HasBuilding(GameInfoTypes[row.BuildingType]) then
			local adoptMod = row.StateReligionAdoptMod*-1
			secularizeChance = secularizeChance + ((secularizeChance*adoptMod)/100)
		end
	end	
	for row in GameInfo.Policy_JFD_PietyMods("StateReligionAdoptMod <> 0") do
		if religionFounder:HasPolicy(GameInfoTypes[row.PolicyType]) then
			local adoptMod = row.StateReligionAdoptMod*-1
			secularizeChance = secularizeChance + ((secularizeChance*adoptMod)/100)
		end
	end
	for row in GameInfo.Trait_JFD_PietyMods("StateReligionAdoptMod <> 0") do
		if religionFounder:HasTrait(GameInfoTypes[row.TraitType]) then
			local adoptMod = row.StateReligionAdoptMod*-1
			secularizeChance = secularizeChance + ((secularizeChance*adoptMod)/100)
		end
	end
	for row in GameInfo.JFD_Reform_PietyMods("StateReligionAdoptMod <> 0") do
		if JFD_HasReform(religionFounderID, GameInfoTypes[row.ReformType]) then
			local adoptMod = row.StateReligionAdoptMod*-1
			secularizeChance = secularizeChance + ((secularizeChance*adoptMod)/100)
		end
	end
	return mathFloor(secularizeChance)
end
-----------------
-- TEXT
-----------------
--JFD_GetROStateReligionTT
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local majorCivOpinionMods = {[0]=1, [1]=0.2, [2]=0.5, [3]=1, [4]=1.5, [5]=2}
local minorCivOpinionMods = {[0]=0.5, [1]=1, [2]=1.5}
local majorCivOpinionModsSecularize = {[0]=1, [1]=2, [2]=1.5, [3]=1, [4]=0.5, [5]=0.2}
function JFD_GetROStateReligionTT(playerID)
	local player = Players[playerID]
	local religionID = player:GetMajorityReligion()
	local capital = player:GetCapitalCity()
	if (not capital) then return "" end
	if player:GetNumCities() <= 2 then religionID = capital:GetReligiousMajority() or -1 end
	if (religionID <= 0 and (not player:IsMinorCiv())) then 
		local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
		for row in GameInfo.Civilization_Religions("CivilizationType = '" .. civType .. "'") do
			religionID = GameInfoTypes[row.ReligionType]
			break
		end
	end
	if religionID > 0 then
		local stateReligionTT = ""
		local stateReligionChance = JFD_GetStateReligionChance(playerID)
		if religionID == player:GetStateReligion() then
			stateReligionTT = convertTextKey("TXT_KEY_JFD_STATE_RELIGIONS_TT_SAME")
		elseif stateReligionChance == 0 then
			stateReligionTT = convertTextKey("TXT_KEY_JFD_STATE_RELIGIONS_TT_NO_DESIRE")
		elseif stateReligionChance > -1 then
			stateReligionTT = convertTextKey("TXT_KEY_JFD_STATE_RELIGIONS_TT", stateReligionChance, Game.GetReligionName(religionID))
		else
			stateReligionTT = convertTextKey("TXT_KEY_JFD_STATE_RELIGIONS_TT_DISABLED")
		end
		local secularizeChance = JFD_GetSecularizeChance(playerID)
		if secularizeChance == 0 then
			stateReligionTT = stateReligionTT .. "[NEWLINE][NEWLINE]" .. convertTextKey("TXT_KEY_JFD_STATE_RELIGIONS_TT_SECULAR_NONE")
		elseif secularizeChance > -1 then
			stateReligionTT = stateReligionTT .. "[NEWLINE][NEWLINE]" .. convertTextKey("TXT_KEY_JFD_STATE_RELIGIONS_TT_SECULAR", secularizeChance)
		end
		return stateReligionTT
	end
end
------------------------------------------------------------------------------------------------------------------------
-- PIETY
------------------------------------------------------------------------------------------------------------------------
-- OLD FUNCTIONS
-----------------
--JFD_ChangePiety
function JFD_ChangePiety(playerID, value)
	Players[playerID]:ChangePiety(value)
end

--JFD_HasStateReligion
function JFD_HasStateReligion(playerID)
	return Players[playerID]:HasStateReligion()
end

--JFD_GetStateReligion
function JFD_GetStateReligion(playerID)
	return Players[playerID]:GetStateReligion()
end
-----------------
-- PIETY
-----------------
local defaultMaxPietyRate   = 100
local defaultPietyYieldMod  = 0
local defaultRestingRateMod = 0
for row in GameInfo.GameSpeed_JFD_PietyThresholds("GameSpeedType = '" .. gameSpeedType .. "'") do
	defaultMaxPietyRate   = row.MaxThreshold
	defaultPietyYieldMod  = row.PietyYieldMod
	defaultRestingRateMod = row.RestingRateMod
	break
end

--JFD_GetPietyYield
function JFD_GetPietyYield(playerID, baseYield, returnsTT)
	local player = Players[playerID]
	local pietyYield = baseYield
	local pietyYieldMod = 100
	local pietyYieldTT = ""
	if defaultPietyYieldMod > 0 then
		pietyYieldMod = pietyYieldMod + defaultPietyYieldMod
		if pietyYield then pietyYield = pietyYield + ((pietyYield*defaultPietyYieldMod)/100) end
		if returnsTT then
			pietyYieldTT = pietyYieldTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_PIETY_YIELD_FROM_GAME_SPEED", defaultPietyYieldMod)
		end
	end
	if player:GetLateGamePolicyTree() > -1 then
		for row in GameInfo.Policies("JFD_PietyReverseIdeologyPenalty > 0") do
			if player:HasPolicy(row.ID) then
				definePietyIdeologyPenalty = definePietyIdeologyPenalty*-1
				break
			end
		end
		for row in GameInfo.Policies("JFD_PietyRemoveIdeologyPenalty > 0") do
			if player:HasPolicy(row.ID) then
				definePietyIdeologyPenalty = 0
				break
			end
		end
		pietyYieldMod = pietyYieldMod + definePietyIdeologyPenalty
		if pietyYield then pietyYield = pietyYield + ((pietyYield*definePietyIdeologyPenalty)/100) end
		if returnsTT then
			if definePietyIdeologyPenalty < 0 then
				pietyYieldTT = pietyYieldTT .. "[NEWLINE][ICON_BULLET][COLOR_NEGATIVE_TEXT]" .. convertTextKey("TXT_KEY_JFD_PIETY_YIELD_FROM_IDEOLOGY", definePietyIdeologyPenalty)
			elseif definePietyIdeologyPenalty > 0 then
				pietyYieldTT = pietyYieldTT .. "[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]" .. convertTextKey("TXT_KEY_JFD_PIETY_YIELD_FROM_IDEOLOGY", "+" .. definePietyIdeologyPenalty)
			end
		end
	end
	for row in GameInfo.Building_JFD_PietyMods("PietyYieldMod <> 0") do
		if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
			local yieldMod = row.PietyYieldMod
			if pietyYield then pietyYield = pietyYield + ((pietyYield*yieldMod)/100) end
			pietyYieldMod = pietyYieldMod + yieldMod
			if returnsTT then
				if yieldMod < 0 then
					pietyYieldTT = pietyYieldTT .. "[NEWLINE][ICON_BULLET][COLOR_NEGATIVE_TEXT]" .. convertTextKey("TXT_KEY_JFD_PIETY_YIELD_FROM_BUILDINGS", yieldMod)
				elseif yieldMod > 0 then
					pietyYieldTT = pietyYieldTT .. "[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]" .. convertTextKey("TXT_KEY_JFD_PIETY_YIELD_FROM_BUILDINGS", "+" .. yieldMod)
				end
			end
		end
	end	
	for row in GameInfo.Policy_JFD_PietyMods("PietyYieldMod <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			local yieldMod = row.PietyYieldMod
			if pietyYield then pietyYield = pietyYield + ((pietyYield*yieldMod)/100) end
			pietyYieldMod = pietyYieldMod + yieldMod
			if returnsTT then
				if (not row.IsEpithet) then
					if yieldMod < 0 then
						pietyYieldTT = pietyYieldTT .. "[NEWLINE][ICON_BULLET][COLOR_NEGATIVE_TEXT]" .. convertTextKey("TXT_KEY_JFD_PIETY_YIELD_FROM_POLICIES", yieldMod)
					elseif yieldMod > 0 then
						pietyYieldTT = pietyYieldTT .. "[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]" .. convertTextKey("TXT_KEY_JFD_PIETY_YIELD_FROM_POLICIES", "+" .. yieldMod)
					end
				else
					if yieldMod < 0 then
						pietyYieldTT = pietyYieldTT .. "[NEWLINE][ICON_BULLET][COLOR_NEGATIVE_TEXT]" .. convertTextKey("TXT_KEY_JFD_PIETY_YIELD_FROM_EPITHETS", yieldMod)
					elseif yieldMod > 0 then
						pietyYieldTT = pietyYieldTT .. "[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]" .. convertTextKey("TXT_KEY_JFD_PIETY_YIELD_FROM_EPITHETS", "+" .. yieldMod)
					end
				end
			end
		end
	end
	for row in GameInfo.Trait_JFD_PietyMods("PietyYieldMod <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			local yieldMod = row.PietyYieldMod
			if pietyYield then pietyYield = pietyYield + ((pietyYield*yieldMod)/100) end
			pietyYieldMod = pietyYieldMod + yieldMod
			if returnsTT then
				if yieldMod < 0 then
					pietyYieldTT = pietyYieldTT .. "[NEWLINE][ICON_BULLET][COLOR_NEGATIVE_TEXT]" .. convertTextKey("TXT_KEY_JFD_PIETY_YIELD_FROM_TRAITS", yieldMod)
				elseif yieldMod > 0 then
					pietyYieldTT = pietyYieldTT .. "[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]" .. convertTextKey("TXT_KEY_JFD_PIETY_YIELD_FROM_TRAITS", "+" .. yieldMod)
				end
			end
		end
	end
	for row in GameInfo.JFD_Reform_PietyMods("PietyYieldMod <> 0") do
		if JFD_HasReform(playerID, GameInfoTypes[row.ReformType]) then
			local yieldMod = row.PietyYieldMod
			if pietyYield then pietyYield = pietyYield + ((pietyYield*yieldMod)/100) end
			pietyYieldMod = pietyYieldMod + yieldMod
			if returnsTT then
				if yieldMod < 0 then
					pietyYieldTT = pietyYieldTT .. "[NEWLINE][ICON_BULLET][COLOR_NEGATIVE_TEXT]" .. convertTextKey("TXT_KEY_JFD_PIETY_YIELD_FROM_REFORMS", yieldMod)
				elseif yieldMod > 0 then
					pietyYieldTT = pietyYieldTT .. "[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]" .. convertTextKey("TXT_KEY_JFD_PIETY_YIELD_FROM_REFORMS", "+" .. yieldMod)
				end
			end
		end
	end
	return JFD_Round(pietyYield), pietyYieldMod, pietyYieldTT
end

--JFD_GetPietyPercent
function JFD_GetPietyPercent(playerID, percent, isDifference)
	local player = Players[playerID]
	if isDifference then
		return mathCeil(((defaultMaxPietyRate-player:GetPiety())*percent)/100)
	else
		return mathCeil((player:GetPiety()*percent)/100)
	end
end

--JFD_DoPietyFromAdoption
function JFD_DoPietyFromAdoption(playerID, newReligionID, oldReligionID, isSecularization, isFirst)
	local player = Players[playerID]
	for otherPlayerID = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
		local otherPlayer = Players[otherPlayerID]
		if (otherPlayer:IsAlive() and otherPlayerID ~= playerID and Teams[otherPlayer:GetTeam()]:IsHasMet(player:GetTeam())) then	
			if (isSecularization and oldReligionID == otherPlayer:GetStateReligion()) then
				local pietyLoss = JFD_GetPietyYield(otherPlayerID, definePietyStateReligionSecularize, true)
				otherPlayer:ChangePiety(-pietyLoss)
				if otherPlayer:IsHuman() then
					Events.GameplayAlertMessage(convertTextKey("TXT_KEY_JFD_PIETY_LOSS_FROM_SECULARIZATION", pietyLoss, player:GetName()))
					Events.AudioPlay2DSound("AS2D_EVENT_NOTIFICATION_BAD")
				end
			elseif (isFirst and otherPlayer:HasStateReligion()) then
				if newReligionID == otherPlayer:GetStateReligion() then
					local pietyReward = JFD_GetPietyYield(otherPlayerID, definePietyStateReligionChangeFirst, true)
					otherPlayer:ChangePiety(pietyReward)
					if otherPlayer:IsHuman() then
						Events.GameplayAlertMessage(convertTextKey("TXT_KEY_JFD_PIETY_GAIN_FROM_ADOPTION", pietyReward, player:GetName()))
						Events.AudioPlay2DSound("AS2D_INTERFACE_FAITH_PURCHASE")
					end
				end
			elseif otherPlayer:HasStateReligion() then
				if newReligionID == otherPlayer:GetStateReligion() then
					local pietyReward = JFD_GetPietyYield(otherPlayerID, definePietyStateReligionChange, true)
					otherPlayer:ChangePiety(pietyReward)
					if otherPlayer:IsHuman() then
						Events.GameplayAlertMessage(convertTextKey("TXT_KEY_JFD_PIETY_GAIN_FROM_ADOPTION", pietyReward, player:GetName()))
						Events.AudioPlay2DSound("AS2D_INTERFACE_FAITH_PURCHASE")
					end
				elseif oldReligionID == otherPlayer:GetStateReligion() then
					local pietyLoss = JFD_GetPietyYield(otherPlayerID, definePietyStateReligionChange, true)
					otherPlayer:ChangePiety(-pietyLoss)
					if otherPlayer:IsHuman() then
						Events.GameplayAlertMessage(convertTextKey("TXT_KEY_JFD_PIETY_LOSS_FROM_ADOPTION", pietyLoss, player:GetName()))
						Events.AudioPlay2DSound("AS2D_EVENT_NOTIFICATION_BAD")
					end
				end
			end
		end
	end
end
-----------------
-- PIETY RATE
-----------------
--JFD_GetPietyRate
local buildingDomeOfTheRockID = GameInfoTypes["BUILDING_JFD_DOME_ROCK"]
function JFD_GetPietyRate(playerID, returnsTT)
	local player = Players[playerID]
	local religionID = player:GetStateReligion()
	local piety = player:GetPiety()
	local pietyRate = 0
	local pietyRateTT = ""
	local pietyRestingRate = JFD_GetPietyRestingRate(playerID)
	--Inquisition
	local numCitiesInquisition = JFD_GetNumCitiesInquisition(playerID)
	if numCitiesInquisition > 0 then
		pietyRate = pietyRate+numCitiesInquisition
		if returnsTT then
			pietyRateTT = pietyRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_PIETY_FROM_INQUISITION", numCitiesInquisition)
		end
	end
	--Without State Religion
	local numCitiesWithoutSR = (player:GetNumCitiesWithoutStateReligion(religionID)-player:GetNumPuppetCities())
	if numCitiesWithoutSR > 0 then
		pietyRate = pietyRate-numCitiesWithoutSR
		if returnsTT then
			pietyRateTT = pietyRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_PIETY_FROM_HERETICAL_CITIES", -numCitiesWithoutSR)
		end
	end
	--if userSettingPietyCoreLossFromOthers then
	--	if player:GetReligionCreatedByPlayer() == religionID then
	--		local numOtherCitiesWithoutSR = 0
	--		for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
	--			if otherPlayerID ~= playerID then
	--				local otherPlayer = Players[otherPlayerID]
	--				if (otherPlayer:IsAlive() and otherPlayer:HasStateReligion() and otherPlayer:GetStateReligion() == religionID) then
	--					numOtherCitiesWithoutSR = numOtherCitiesWithoutSR + (otherPlayer:GetNumCitiesWithoutStateReligion(religionID)-otherPlayer:GetNumPuppetCities())
	--				end
	--			end
	--		end
	--		if numOtherCitiesWithoutSR > 0 then
	--			pietyRate = pietyRate-numOtherCitiesWithoutSR
	--			if returnsTT then
	--				pietyRateTT = pietyRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_PIETY_FROM_HERETICAL_CITIES_OTHER", -numOtherCitiesWithoutSR)
	--			end
	--		end
	--	end
	--end
	--War
	if (not player:HasBuilding(buildingDomeOfTheRockID)) then
		local numWars = 0
		if player:IsAtWar() then
			for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
				local otherPlayer = Players[otherPlayerID]
				if (player:IsAtWarWith(otherPlayerID) and otherPlayer:GetStateReligion() == religionID) and (not otherPlayer:IsBarbarian()) then
					numWars = numWars+1
				end
			end
		end
		if numWars > 0 then
			pietyRate = pietyRate-numWars
			if returnsTT then
				pietyRateTT = pietyRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_PIETY_FROM_WARS", -numWars)
			end
		end
	end
	--Resting Rate
	local pietyRateRestingRate = 0
	if piety < pietyRestingRate then 
		pietyRateRestingRate = definePietyRestingRateBelow
		for policy in GameInfo.Policies("DoublePietyRestingRateRecovery = 1") do
			if player:HasPolicy(policy.ID) then
				pietyRateRestingRate = definePietyRestingRateBelow*2
				break
			end	
		end
		pietyRate = pietyRate + pietyRateRestingRate
		if returnsTT then
			pietyRateTT = pietyRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_PIETY_FROM_BELOW_THRESHOLD", pietyRateRestingRate)
		end
	else
		pietyRestingRate = definePietyRestingRateAbove
		pietyRate = pietyRate + pietyRateRestingRate
		if returnsTT then
			pietyRateTT = pietyRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_PIETY_FROM_ABOVE_THRESHOLD", pietyRateRestingRate)
		end
	end
	if player:GetReligionCreatedByPlayer() == religionID then
		local numFollowers, numMajorFollowers, numMinorFollowers = JFD_GetNumCivilizationFollowers(religionID, playerID)
		numMajorFollowers = (numMajorFollowers/2)
		numMinorFollowers = (numMinorFollowers/4)
		if piety < pietyRestingRate then 
			pietyRate = pietyRate+numMajorFollowers
			pietyRate = pietyRate+numMinorFollowers
			if returnsTT then
				pietyRateTT = pietyRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_PIETY_FROM_BELOW_THRESHOLD_CIVILIZATIONS", numMajorFollowers)
				pietyRateTT = pietyRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_PIETY_FROM_BELOW_THRESHOLD_CITY_STATES", numMinorFollowers)
			end
		else
			pietyRate = pietyRate-numMajorFollowers
			pietyRate = pietyRate-numMinorFollowers
			if returnsTT then
				pietyRateTT = pietyRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_PIETY_FROM_ABOVE_THRESHOLD_CIVILIZATIONS", numMajorFollowers)
				pietyRateTT = pietyRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_PIETY_FROM_ABOVE_THRESHOLD_CITY_STATES", numMinorFollowers)
			end
		end
	end
	return pietyRate, pietyRateTT
end
-----------------
-- PIETY LEVEL
-----------------
--JFD_GetPietyLevelID
function JFD_GetPietyLevelID(playerID)
	local player = Players[playerID]
	local piety = player:GetPiety()
	for row in GameInfo.JFD_PietyLevel_GameSpeedThresholds("GameSpeedType = '" .. gameSpeedType .. "' AND '" .. piety .. "' <= MaxThreshold AND '" .. piety .. "' >= MinThreshold") do
		return GameInfoTypes[row.PietyLevelType]
	end
	return GameInfoTypes["PIETY_LEVEL_JFD_NEUTRAL"]
end

--JFD_GetPietyEventWeight
function JFD_GetPietyEventWeight(playerID, negative)
	local pietyLevelID = JFD_GetPietyLevelID(playerID)
	if negative then 
		return GameInfo.JFD_PietyLevels[pietyLevelID].EventWeightModNegative or 5
	else
		return GameInfo.JFD_PietyLevels[pietyLevelID].EventWeightModPositive or 5
	end
end

--JFD_GetPietyLevelMod
function JFD_GetPietyLevelMod(playerID)
	local pietyLevelID = JFD_GetPietyLevelID(playerID)
	return GameInfo.JFD_PietyLevels[pietyLevelID].RewardModifier or 1
end
-----------------
-- RESTING RATE
-----------------
--JFD_GetPietyRestingRate
function JFD_GetPietyRestingRate(playerID, returnsTT)
	local player = Players[playerID]
	if (not player:HasStateReligion()) then return 0 end
	local restingRate = 0
	local restingRateTT = ""
	--Holy City Bonus
	local religionID = player:GetStateReligion()
	local cityHolyCity = Game.GetHolyCityForReligion(religionID, -1)
	local restingRateChange = 0
	if (cityHolyCity and cityHolyCity:GetOwner() == playerID) then
		for row in GameInfo.JFD_PietyLevel_GameSpeedThresholds("PietyLevelType = 'PIETY_LEVEL_JFD_HERETICAL' AND GameSpeedType = '" .. gameSpeedType .. "'") do
			restingRateChange = row.MaxThreshold
		end
		restingRate = restingRate + restingRateChange
	end
	if returnsTT then
		restingRateTT = restingRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_PIETY_RESTING_RATE_FROM_HOLY_CITY", restingRateChange)
	end
	--Other Holy City Bonus
	local restingRateChangeOther = 0
	for otherPlayerID = 0, GameDefines.MAX_CIV_PLAYERS - 1 do	
		local otherPlayer = Players[otherPlayerID]
		if (otherPlayerID ~= playerID and otherPlayer:IsAlive() and otherPlayer:HasStateReligion() and otherPlayer:HasAnyHolyCity()) then
			if otherPlayer:GetStateReligion() == religionID then
				restingRateChangeOther = restingRateChangeOther + JFD_Round(restingRateChange/3)
			end
		end
	end
	restingRate = restingRate + restingRateChangeOther
	if returnsTT then
		restingRateTT = restingRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_PIETY_RESTING_RATE_FROM_HOLY_CITY_OTHER", restingRateChangeOther)
	end
	--Buildings
	for row in GameInfo.Building_JFD_PietyMods("RestingRateChange <> 0") do
		if player:HasBuilding(GameInfoTypes[row.BuildingType]) then
			local restingRateChange = row.RestingRateChange
			restingRate = restingRate + restingRateChange
			if returnsTT then
				if restingRateChange < 0 then
					restingRateTT = restingRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_PIETY_RESTING_RATE_FROM_BUILDINGS", "[COLOR_NEGATIVE_TEXT]", restingRateChange)
				else
					restingRateTT = restingRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_PIETY_RESTING_RATE_FROM_BUILDINGS", "[COLOR_POSITIVE_TEXT]", "+" .. restingRateChange)
				end
			end
		end
	end 
	--Policies
	for row in GameInfo.Policy_JFD_PietyMods("RestingRateChange <> 0") do
		if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			local restingRateChange = row.RestingRateChange
			restingRate = restingRate + restingRateChange
			if returnsTT then
				if (not row.IsEpithet) then
					if restingRateChange < 0 then
						restingRateTT = restingRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_PIETY_RESTING_RATE_FROM_POLICIES", "[COLOR_NEGATIVE_TEXT]", restingRateChange)
					else
						restingRateTT = restingRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_PIETY_RESTING_RATE_FROM_POLICIES", "[COLOR_POSITIVE_TEXT]", "+" .. restingRateChange)
					end
				else
					if restingRateChange < 0 then
						restingRateTT = restingRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_PIETY_RESTING_RATE_FROM_EPITHETS", "[COLOR_NEGATIVE_TEXT]", restingRateChange)
					else
						restingRateTT = restingRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_PIETY_RESTING_RATE_FROM_EPITHETS", "[COLOR_POSITIVE_TEXT]", "+" .. restingRateChange)
					end
				end
			end
		end
	end
	--Traits
	for row in GameInfo.Trait_JFD_PietyMods("RestingRateChange <> 0") do
		if player:HasTrait(GameInfoTypes[row.TraitType]) then
			local restingRateChange = row.RestingRateChange
			restingRate = restingRate + restingRateChange
			if returnsTT then
				if restingRateChange < 0 then
					restingRateTT = restingRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_PIETY_RESTING_RATE_FROM_TRAITS", "[COLOR_NEGATIVE_TEXT]", restingRateChange)
				else
					restingRateTT = restingRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_PIETY_RESTING_RATE_FROM_TRAITS", "[COLOR_POSITIVE_TEXT]", "+" .. restingRateChange)
				end
			end
		end
	end
	--Reforms
	for row in GameInfo.JFD_Reform_PietyMods("RestingRateChange <> 0") do
		if JFD_HasReform(playerID, GameInfoTypes[row.ReformType]) then
			local restingRateChange = row.RestingRateChange
			restingRate = restingRate + restingRateChange
			if returnsTT then
				if restingRateChange < 0 then
					restingRateTT = restingRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_PIETY_RESTING_RATE_FROM_REFORMS", "[COLOR_NEGATIVE_TEXT]", restingRateChange)
				else
					restingRateTT = restingRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_PIETY_RESTING_RATE_FROM_REFORMS", "[COLOR_POSITIVE_TEXT]", "+" .. restingRateChange)
				end
			end
		end
	end
	--City-State Bonus
	if player:IsMinorCiv() then restingRate = restingRate + definePietyCityStateRestBonus end
	return restingRate, restingRateTT
end
-----------------
-- PROCESSES
-----------------
--JFD_GetNumCitiesInquisition
local processPietyID = GameInfoTypes["PROCESS_JFD_PIETY"]
function JFD_GetNumCitiesInquisition(playerID)
	local player = Players[playerID]
	local numCitiesInquisition = 0
	for city in player:Cities() do
		if city:GetProductionProcess() == processPietyID then
			numCitiesInquisition = numCitiesInquisition + 1
		end
	end
	return numCitiesInquisition
end
------------------------------------------------------------------------------------------------------------------------
-- TOP PANEL
------------------------------------------------------------------------------------------------------------------------
--JFD_GetTurnsUntilPietyLevelDrop
local pietyLevelHereticalID = GameInfoTypes["PIETY_LEVEL_JFD_HERETICAL"]
function JFD_GetTurnsUntilPietyLevelDrop(playerID)
	local player = Players[playerID]
	local pietyLevelID = JFD_GetPietyLevelID(playerID)
	local currentPiety = player:GetPiety()
	local pietyLevelType = GameInfo.JFD_PietyLevels[pietyLevelID].Type
	local pietyRate = player:GetPietyRate()
	local threshold = 0
	for row in GameInfo.JFD_PietyLevel_GameSpeedThresholds("PietyLevelType = '" .. pietyLevelType .. "' AND GameSpeedType = '" .. gameSpeedType .. "'") do
		if JFD_GetPietyRestingRate(playerID) > currentPiety then
			threshold = row.MaxThreshold
		else
			threshold = row.MinThreshold
		end
	end
	return mathFloor((currentPiety-threshold)/pietyRate)*-1, threshold
end

--JFD_GetPietyTopPanelInfo
function JFD_GetPietyTopPanelInfo(playerID, pietyRate)
	local player = Players[playerID]
	local pietyLevelID = JFD_GetPietyLevelID(playerID)
	local pietyLevel = GameInfo.JFD_PietyLevels[pietyLevelID]
	local pietyTPInfo = convertTextKey("TXT_KEY_JFD_PIETY_RATE", pietyLevel.TextColor, player:GetPiety(), defaultMaxPietyRate)
	local pietyRateInfo = convertTextKey("[COLOR_JFD_PIETY]({1_Num})[ENDCOLOR]", "+" .. pietyRate)
	if pietyRate < 0 then
		pietyRateInfo = convertTextKey("[COLOR_JFD_PIETY]([ENDCOLOR][COLOR_JFD_PIETY_NEUTRAL]{1_Num}[ENDCOLOR][COLOR_JFD_PIETY])[ENDCOLOR]", pietyRate)
	end		
	return pietyTPInfo .. " " .. pietyRateInfo
end

--JFD_GetPietyTopPanelInfoTT
function JFD_GetPietyTopPanelInfoTT(playerID)
	local player = Players[playerID]
	local strText = ""
	if player:HasStateReligion() then
		local religionID = player:GetStateReligion()
		local beliefShortDesc = nil
		local beliefHelp = nil
		local beliefPiety = 0
		for _, belief in ipairs(Game.GetBeliefsInReligion(religionID)) do
			local beliefInfo = GameInfo.Beliefs[belief]
			if beliefInfo.JFD_IsPiety then
				for row in GameInfo.Belief_JFD_PietyYieldChanges("BeliefType = '" .. beliefInfo.Type .. "'") do
					beliefPiety = row.Yield
					break
				end
				beliefShortDesc = beliefInfo.ShortDescription
				beliefHelp = beliefInfo.Description .. "_HELP"
				break
			end
		end
		local pietyYield, pietyYieldMod, pietyYieldTT = JFD_GetPietyYield(playerID, beliefPiety, true)
		if (not beliefHelp) then return end
		beliefHelp = convertTextKey(beliefHelp, pietyYield)
		strText = strText .. convertTextKey("TXT_KEY_JFD_PIETY_TOP_PANEL_TT_STATE_RELIGION", GameInfo.Religions[religionID].IconString, Game.GetReligionName(religionID), beliefShortDesc, beliefHelp)
		
		strText = strText .. "[NEWLINE][NEWLINE]";
		strText = strText .. convertTextKey("TXT_KEY_JFD_PIETY_YIELD_TT", pietyYieldMod, pietyYieldTT)
		
		strText = strText .. "[NEWLINE][NEWLINE]--------------------------[NEWLINE]";
		
		local currentPiety = player:GetPiety()
		local pietyLevelID = JFD_GetPietyLevelID(playerID)
		local pietyLevel = GameInfo.JFD_PietyLevels[pietyLevelID]
		local pietyPerTurn = player:GetPietyRate()
		local pietyPerTurnHL = "[COLOR_NEGATIVE_TEXT]"
		local turnsUntilDrop, threshold = JFD_GetTurnsUntilPietyLevelDrop(playerID)
		local txtString = 'TXT_KEY_TP_JFD_PIETY_TT'
		if pietyPerTurn > 0 then 
			pietyPerTurn = "+" .. pietyPerTurn 
			pietyPerTurnHL = "[COLOR_POSITIVE_TEXT]"
		end
		if isUsingEUI then
			txtString = 'TXT_KEY_TP_JFD_PIETY_TT_EUI'
		end
		local pietyRate, pietyRateTT = JFD_GetPietyRate(playerID, true)
		local pietyAtChange = 0
		for row in GameInfo.JFD_PietyLevel_GameSpeedThresholds("GameSpeedType = '" .. gameSpeedType .. "' AND '" .. currentPiety .. "' <= MaxThreshold AND '" .. currentPiety .. "' >= MinThreshold") do
			if player:GetPietyRate() > 0 then 
				pietyAtChange = row.MaxThreshold
			else
				pietyAtChange = row.MinThreshold
			end
			break
		end
		strText = strText .. convertTextKey(txtString, pietyLevel.TextColor, pietyLevel.ShortDescription, pietyPerTurnHL, turnsUntilDrop, currentPiety, pietyPerTurn, pietyRateTT, pietyAtChange)
		
		strText = strText .. "[NEWLINE][NEWLINE]--------------------------[NEWLINE]";
		
		local pietyRestingRate, pietyRestingRateTT = JFD_GetPietyRestingRate(playerID, true)
		strText = strText .. convertTextKey("TXT_KEY_JFD_PIETY_RESTING_RATE_TT", pietyRestingRate, pietyRestingRateTT)
		
		-- strText = strText .. "[NEWLINE][NEWLINE]--------------------------[NEWLINE]";
		local currentEffects = ""
		
		--strText = strText .. "[NEWLINE][NEWLINE]";
		--strText = strText .. convertTextKey("TXT_KEY_JFD_TP_PIETY_TOOLTIP_PIETY_SOURCES_HELP")
		strText = strText .. "[NEWLINE][NEWLINE]" .. convertTextKey("TXT_KEY_JFD_PIETY_TOP_PANEL_NOTE")
	end
	return strText
end
-----------------
-- GOLDEN AGE
-----------------
--JFD_GetGoldenAgePointsFromFaith
local buildingTempleHeavenID = GameInfoTypes["BUILDING_JFD_TEMPLE_HEAVEN"]
local pietyLevelDevoutID	 = GameInfoTypes["PIETY_LEVEL_JFD_DEVOUT"]
function JFD_GetGoldenAgePointsFromFaith(playerID)
	local player = Players[playerID]
	local numGAP = 0 
	if (player:HasStateReligion() and player:HasBuilding(buildingTempleHeavenID)) then
		if JFD_GetPietyLevelID(playerID) == pietyLevelDevoutID then
			numGAP = player:GetTotalFaithPerTurn()
		end
	end
	return mathFloor((numGAP*20)/100)
end

--JFD_GetGoldenAgePointsFromFollowers
local beliefNoblePathID = GameInfoTypes["BELIEF_JFD_NOBLE_PATH"]
function JFD_GetGoldenAgePointsFromFollowers(playerID)
	local player = Players[playerID]
	local numGAP = 0 
	if player:HasStateReligion() then
		local religionID = player:GetStateReligion()
		for _, beliefID in ipairs(Game.GetBeliefsInReligion(religionID)) do
			if beliefID == beliefNoblePathID then
				for city in player:Cities() do
					numGAP = numGAP + mathFloor(city:GetNumFollowers(religionID)/2)
				end
				break
			end
		end
	end
	return mathMin(numGAP,15)
end
--=======================================================================================================================
--=======================================================================================================================