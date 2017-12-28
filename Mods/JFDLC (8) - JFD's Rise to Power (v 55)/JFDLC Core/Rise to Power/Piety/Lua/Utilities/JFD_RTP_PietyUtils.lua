-- JFD_RTP_PietyUtils
-- Author: JFD
-- DateCreated: 10/14/2015 7:38:08 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFDLCUtils.lua")
include("JFDLC_GlobalDefines.lua");
--=======================================================================================================================
-- DEFINES
--=======================================================================================================================
local defineRTPPietyCityStateRestBonus		 = GameDefines["JFD_RTP_PIETY_CITY_STATE_REST_BONUS"]
local defineRTPPietyFromNaturalWonder		 = GameDefines["JFD_RTP_PIETY_FROM_NATURAL_WONDER"]
local defineRTPPietyFromProphet				 = GameDefines["JFD_RTP_PIETY_FROM_PROPHET"]
local defineRTPPietyIdeologyPenalty			 = GameDefines["JFD_RTP_PIETY_IDEOLOGY_PENALTY"]
local defineRTPPietyRestingRateAbove		 = GameDefines["JFD_RTP_PIETY_RESTING_RATE_PER_TURN_ABOVE"]
local defineRTPPietyRestingRateBelow		 = GameDefines["JFD_RTP_PIETY_RESTING_RATE_PER_TURN_BELOW"]
local defineRTPPietyStateReligionChange		 = GameDefines["JFD_RTP_PIETY_STATE_RELIGION_CHANGE"]
local defineRTPPietyStateReligionChangeFirst = GameDefines["JFD_RTP_PIETY_STATE_RELIGION_CHANGE_FIRST"]
local defineRTPPietyStateReligionSecularize	 = GameDefines["JFD_RTP_PIETY_STATE_RELIGION_SECULARIZE"]
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingRTPPietyCore				 = (Game.GetUserSetting("JFD_RTP_PIETY_CORE") == 1)
local userSettingRTPPietyCoreLossFromOthers	 = (Game.GetUserSetting("JFD_RTP_PIETY_CORE_LOSS_FROM_OTHER_CITIES") == 1)
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

local pietyLevelDevoutID	= GameInfoTypes["PIETY_LEVEL_JFD_DEVOUT"]
local pietyLevelHereticalID = GameInfoTypes["PIETY_LEVEL_JFD_HERETICAL"]
local pietyLevelNeutralID   = GameInfoTypes["PIETY_LEVEL_JFD_NEUTRAL"]
local pietyLevelPoorID		= GameInfoTypes["PIETY_LEVEL_JFD_POOR"]
local pietyLevelVirtuousID	= GameInfoTypes["PIETY_LEVEL_JFD_VIRTUOUS"]
------------------------------------------------------------------------------------------------------------------------
-- STATE RELIGION
------------------------------------------------------------------------------------------------------------------------
--Player:CanHaveAnyStateReligion
function Player.CanHaveAnyStateReligion(player)
	if (not userSettingRTPPietyCore) then return false end
	if player:CanSecularize() then return true end
	if player:HasSecularized() then return false end
	if (not player:HasTechnologyRequiredForUnlock("AllowStateReligions")) then return false end
	local currentStateReligionID = player:GetStateReligion()
	for religion in GameInfo.Religions("ID <> '" .. currentStateReligionID .. "'") do
		if player:CanHaveStateReligion(religion.ID) then
			return true
		end
	end
	return false
end

--Player:CanHaveStateReligion
function Player.CanHaveStateReligion(player, religionID)
	if (not userSettingRTPPietyCore) then return false end
	if (not Game.GetHolyCityForReligion(religionID,-1)) then return false end
	if ((not player:IsHuman()) and player:GetFlavorValue("FLAVOR_JFD_STATE_RELIGION") == 0) then return false end
	if religionID == 0 then return false end
	if player:HasSecularized() then return false end
	if (not player:HasTechnologyRequiredForUnlock("AllowStateReligions")) then return false end
	if player:GetGovernment() == governmentTheocracyID then return false end
	if player:HasStateReligion() then
		local currentStateReligionID = player:GetStateReligion()
		if religionID == currentStateReligionID then return false end
		local faithCost = (GameInfo.JFD_PietyLevels[player:GetPietyLevel()].ChangeFaithCost * player:GetNumCitiesWithStateReligion(religionID))
		faithCost = Game.GetRound(faithCost*gameSpeedMod)
		if player:GetFaith() < faithCost then return false end
	end
	local founderID = Game.GetFounder(religionID, -1)
	if founderID then
		local founder = Players[founderID]
		if Teams[player:GetTeam()]:IsHasMet(founder:GetTeam()) then
			return true
		end
	end
	return false
end

--Player:GetStateReligionChance
local civilizationLithuaniaID = GameInfoTypes["CIVILIZATION_JFD_LITHUANIA"]
local eraIndustrialID		  = GameInfoTypes["ERA_INDUSTRIAL"]
local eraMedievalID			  = GameInfoTypes["ERA_MEDIEVAL"]
local eraRenaissanceID		  = GameInfoTypes["ERA_RENAISSANCE"]
local majorCivOpinionMods	  = {[0]=0, [1]=-20, [2]=-50, [3]=0, [4]=50, [5]=100}
local minorCivOpinionMods	  = {[0]=-50, [1]=0, [2]=50}
function Player.GetStateReligionChance(player)
	if (not userSettingRTPPietyCore) then return 0 end
	local stateReligionChance = 0
	if (not player:IsAlive()) then return -1 end
	local flavourStateReligion = player:GetFlavorValue("FLAVOR_JFD_STATE_RELIGION")
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
	if (not player:CanHaveStateReligion(religionID)) then 
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
		stateReligionChance = stateReligionChance + mathCeil((player:GetFlavorValue("FLAVOR_JFD_STATE_RELIGION")*opinionMod)/100)
	else
		local opinionMod = majorCivOpinionMods[player:GetMajorCivOpinion(religionFounderID)] or 1
		stateReligionChance = stateReligionChance + mathCeil((player:GetFlavorValue("FLAVOR_JFD_STATE_RELIGION")*opinionMod)/100)
	end		
	if (player:GetCurrentEra() == eraMedievalID or player:GetCurrentEra() == eraRenaissanceID) then
		stateReligionChance = stateReligionChance*2
	end
	if player:GetLateGamePolicyTree() > 0 then 
		stateReligionChance = (stateReligionChance/2) 
	end
	local pietyLevelMod = GameInfo.JFD_PietyLevels[player:GetPietyLevel()].AdoptModifier
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
		if player:HasReform(GameInfoTypes[row.ReformType]) then
			local adoptMod = row.StateReligionAdoptMod
			stateReligionChance = stateReligionChance + ((stateReligionChance*adoptMod)/100)
		end
	end
	return Game.GetRound(stateReligionChance)
end

--Player:GetStateReligionReligiousPressure
function Player.GetStateReligionReligiousPressure(player)
	if (not userSettingRTPPietyCore) then return 0 end
	local pietyLevelID = player:GetPietyLevel()
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
		if player:HasReform(GameInfoTypes[row.ReformType]) then
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
	return Game.GetRound(stateReligionPressure)
end
-----------------
-- SECULARIZATION
-----------------
--Player:CanSecularize
function Player.CanSecularize(player)
	if (not userSettingRTPPietyCore) then return false end
	if player:IsMinorCiv() then return false end
	if player:HasSecularized() then return false end
	if player:GetGovernment() == governmentTheocracyID then return false end
	if ((not player:IsHuman()) and player:GetPietyLevel() >= pietyLevelNeutralID) then return false end
	if (player:HasStateReligion() and (not player:IsHuman())) then
		local pietyLevel = GameInfo.JFD_PietyLevels[player:GetPietyLevel()]
		local faithCost = mathCeil(pietyLevel.ChangeFaithCost*gameSpeedMod) 
		if player:GetFaith() < faithCost then return false end
	end
	return player:HasTechnologyRequiredForUnlock("AllowSecularization")
end

--Player:GetSecularizationChance
local majorCivOpinionModsSecularize = {[0]=-20, [1]=-50, [2]=0, [3]=50, [4]=100, [5]=0}
local minorCivOpinionMods			= {[0]=50, [1]=0, [2]=-50}
local minorCivTraitReligiousID		= MinorCivTraitTypes["MINOR_CIV_TRAIT_RELIGIOUS"]
function Player.GetSecularizationChance(player)
	if (not userSettingRTPPietyCore) then return 0 end
	local secularizeChance = 0
	if player:GetGovernment() == governmentTheocracyID then
		return -1, Locale.ConvertTextKey("TXT_KEY_JFD_STATE_RELIGION_CHANCE_THEOCRACY")
	end
	if (player:IsMinorCiv() and player:GetMinorCivTrait() == minorCivTraitReligiousID) then 
		return 0, Locale.ConvertTextKey("TXT_KEY_JFD_STATE_RELIGION_CHANCE_RELIGIOUS_CITY_STATE") 
	end
	if (not player:CanSecularize()) then 
		return -1, Locale.ConvertTextKey("TXT_KEY_JFD_STATE_RELIGION_CHANCE_NO_CONDITIONS_SECULARIZE")
	end
	if Game.GetGameTurn() < player:GetTurnsSinceConversion() then 
		return secularizeChance, Locale.ConvertTextKey("TXT_KEY_JFD_STATE_RELIGION_CHANCE_TOO_RECENT_SECULARIZE")
	end
	if player:GetFlavorValue("FLAVOR_JFD_STATE_RELIGION") > 9 then 
		return secularizeChance, Locale.ConvertTextKey("TXT_KEY_JFD_STATE_RELIGION_CHANCE_STATE_RELIGION_FLAVOUR")
	end 
	local religionID = player:GetStateReligion()
	local religionFounderID = Game.GetFounder(religionID, -1)
	local religionFounder = Players[religionFounderID]
	if player:IsMinorCiv() then
		local opinionMod = minorCivOpinionMods[player:GetMinorCivFriendshipLevelWithMajor(religionFounderID)] or 1
		secularizeChance = secularizeChance + mathCeil((player:GetFlavorValue("FLAVOR_SCIENCE")*opinionMod)/100)
	else
		local opinionMod = majorCivOpinionMods[player:GetMajorCivOpinion(religionFounderID)] or 1
		secularizeChance = secularizeChance + mathCeil((player:GetFlavorValue("FLAVOR_SCIENCE")*opinionMod)/100)
	end		
	secularizeChance = (secularizeChance+player:GetCurrentEra()+1)
	local pietyLevelID = player:GetPietyLevel()
	local pietyLevelMod = GameInfo.JFD_PietyLevels[pietyLevelID].AdoptModifier
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
		if religionFounder:HasReform(GameInfoTypes[row.ReformType]) then
			local adoptMod = row.StateReligionAdoptMod*-1
			secularizeChance = secularizeChance + ((secularizeChance*adoptMod)/100)
		end
	end
	return Game.GetRound(secularizeChance)
end
-----------------
-- TEXT
-----------------
--Player:GetStateReligionChanceTT
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local majorCivOpinionMods = {[0]=1, [1]=0.2, [2]=0.5, [3]=1, [4]=1.5, [5]=2}
local minorCivOpinionMods = {[0]=0.5, [1]=1, [2]=1.5}
local majorCivOpinionModsSecularize = {[0]=1, [1]=2, [2]=1.5, [3]=1, [4]=0.5, [5]=0.2}
function Player.GetStateReligionChanceTT(player)
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
		local stateReligionChance = player:GetStateReligionChance()
		if religionID == player:GetStateReligion() then
			stateReligionTT = convertTextKey("TXT_KEY_JFD_STATE_RELIGIONS_TT_SAME")
		elseif stateReligionChance == 0 then
			stateReligionTT = convertTextKey("TXT_KEY_JFD_STATE_RELIGIONS_TT_NO_DESIRE")
		elseif stateReligionChance > -1 then
			stateReligionTT = convertTextKey("TXT_KEY_JFD_STATE_RELIGIONS_TT", stateReligionChance, Game.GetReligionName(religionID))
		else
			stateReligionTT = convertTextKey("TXT_KEY_JFD_STATE_RELIGIONS_TT_DISABLED")
		end
		local secularizeChance = player:GetSecularizationChance()
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

--Player:CalculatePietyYield
function Player.CalculatePietyYield(player, baseYield, returnsTT)
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
		for row in GameInfo.Policies("ReversesPietyIdeologyPenalty > 0") do
			if player:HasPolicy(row.ID) then
				defineRTPPietyIdeologyPenalty = defineRTPPietyIdeologyPenalty*-1
				break
			end
		end
		for row in GameInfo.Policies("RemovesPietyIdeologyPenalty > 0") do
			if player:HasPolicy(row.ID) then
				defineRTPPietyIdeologyPenalty = 0
				break
			end
		end
		pietyYieldMod = pietyYieldMod + defineRTPPietyIdeologyPenalty
		if pietyYield then pietyYield = pietyYield + ((pietyYield*defineRTPPietyIdeologyPenalty)/100) end
		if returnsTT then
			if defineRTPPietyIdeologyPenalty < 0 then
				pietyYieldTT = pietyYieldTT .. "[NEWLINE][ICON_BULLET][COLOR_NEGATIVE_TEXT]" .. convertTextKey("TXT_KEY_JFD_PIETY_YIELD_FROM_IDEOLOGY", defineRTPPietyIdeologyPenalty)
			elseif defineRTPPietyIdeologyPenalty > 0 then
				pietyYieldTT = pietyYieldTT .. "[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]" .. convertTextKey("TXT_KEY_JFD_PIETY_YIELD_FROM_IDEOLOGY", "+" .. defineRTPPietyIdeologyPenalty)
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
		if player:HasReform(GameInfoTypes[row.ReformType]) then
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
	return Game.GetRound(pietyYield), pietyYieldMod, pietyYieldTT
end

--Player:GetPietyPercent
function Player.GetPietyPercent(player, percent, isDifference)
	if isDifference then
		return Game.GetRound(((defaultMaxPietyRate-player:GetPiety())*percent)/100)
	else
		return Game.GetRound((player:GetPiety()*percent)/100)
	end
end
-----------------
-- PIETY RATE
-----------------
--Player:GetPietyPerTurn
local processPietyID = GameInfoTypes["PROCESS_JFD_PIETY"]
function Player.GetPietyPerTurn(player, returnsTT)
	local religionID = player:GetStateReligion()
	local piety = player:GetPiety()
	local pietyRate = 0
	local pietyRateGain = 0
	local pietyRateLoss = 0
	local pietyRateTT = ""
	local pietyRestingRate = player:GetPietyRestingRate()
	--Mandate of Heaven
	local isNoRateDuringGAs = false
	if player:IsGoldenAge() then
		for belief in GameInfo.Beliefs("IsNoPietyDuringGoldenAges = 1") do
			if player:HasBelief(belief.ID) then
				isNoRateDuringGAs = true
				pietyRateTT = pietyRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_PIETY_FROM_MANDATE_OF_HEAVEN")
				break
			end
		end
	end
	--Inquisition
	local numCitiesInquisition = player:GetNumCitiesCreating(processPietyID)
	if numCitiesInquisition > 0 then
		pietyRateGain = pietyRateGain + numCitiesInquisition
		if returnsTT then
			pietyRateTT = pietyRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_PIETY_FROM_INQUISITION", numCitiesInquisition)
		end
	end
	--Without State Religion
	local numCitiesWithoutSR = (player:GetNumCitiesWithoutStateReligion(religionID)-player:GetNumPuppetCities())+player:GetNumColonies()
	if numCitiesWithoutSR > 0 then
		pietyRateLoss = pietyRateLoss + numCitiesWithoutSR
		if returnsTT then
			pietyRateTT = pietyRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_PIETY_FROM_HERETICAL_CITIES", -numCitiesWithoutSR)
		end
	end
	--War
	local isNoLossFromWar = false
	for building in GameInfo.Buildings("IsNoPietyLossFromWar = 1") do
		if player:HasBuilding(building.ID) then
			isNoLossFromWar = true
			break
		end
	end
	if (not isNoLossFromWar) then
		local numWars = 0
		if player:IsAtWar() then
			for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
				local otherPlayer = Players[otherPlayerID]
				if ((not otherPlayer:IsBarbarian()) and (player:IsAtWarWith(otherPlayerID) and otherPlayer:GetStateReligion() == religionID)) then
					numWars = numWars + 1
				end
			end
		end
		if numWars > 0 then
			pietyRateLoss = pietyRateLoss + numWars
			if returnsTT then
				pietyRateTT = pietyRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_PIETY_FROM_WARS", -numWars)
			end
		end
	end
	--Resting Rate
	local isNoLossFromOtherCivs = false
	for belief in GameInfo.Beliefs("IsNoPietyLossOtherCivs = 1") do
		if player:HasBelief(belief.ID) then
			isNoLossFromOtherCivs = true
			break
		end
	end
	local pietyRateRestingRate = 0
	if piety < pietyRestingRate then 
		pietyRateRestingRate = defineRTPPietyRestingRateBelow
		for policy in GameInfo.Policies("DoublePietyRestingRateRecovery = 1") do
			if player:HasPolicy(policy.ID) then
				pietyRateRestingRate = defineRTPPietyRestingRateBelow*2
				break
			end	
		end
		pietyRateGain = pietyRateGain + pietyRateRestingRate
	else
		pietyRateRestingRate = defineRTPPietyRestingRateAbove
		pietyRateLoss = pietyRateLoss + (pietyRateRestingRate*-1)
	end
	if player:GetReligionCreatedByPlayer() == religionID then
		local numFollowers, numMajorFollowers, numMinorFollowers = Game.GetNumStateReligionFollowers(religionID, player:GetID())
		numMajorFollowers = Game.GetRound(numMajorFollowers/2)
		numMinorFollowers = Game.GetRound(numMinorFollowers/4)
		if isNoLossFromOtherCivs then numMajorFollowers = 0 numMinorFollowers = 0 end
		if piety < pietyRestingRate then 
			pietyRateGain = pietyRateGain + numMajorFollowers
			pietyRateGain = pietyRateGain + numMinorFollowers
			pietyRateRestingRate = pietyRateRestingRate + numMajorFollowers + numMinorFollowers
			if returnsTT then
				pietyRateTT = pietyRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_PIETY_FROM_BELOW_THRESHOLD", pietyRateRestingRate)
				if (not isNoLossFromOtherCivs) then
					pietyRateTT = pietyRateTT .. convertTextKey("TXT_KEY_JFD_PIETY_FROM_BELOW_THRESHOLD_CIVILIZATIONS", numMajorFollowers)
					pietyRateTT = pietyRateTT .. convertTextKey("TXT_KEY_JFD_PIETY_FROM_BELOW_THRESHOLD_CITY_STATES", numMinorFollowers)
				end
			end
		elseif piety > pietyRestingRate then 
			pietyRateLoss = pietyRateLoss + numMajorFollowers
			pietyRateLoss = pietyRateLoss + numMinorFollowers
			pietyRateRestingRate = pietyRateRestingRate + numMajorFollowers + numMinorFollowers
			if returnsTT then
				pietyRateTT = pietyRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_PIETY_FROM_ABOVE_THRESHOLD", pietyRateRestingRate)
				if (not isNoLossFromOtherCivs) then
					pietyRateTT = pietyRateTT .. convertTextKey("TXT_KEY_JFD_PIETY_FROM_ABOVE_THRESHOLD_CIVILIZATIONS", numMajorFollowers)
					pietyRateTT = pietyRateTT .. convertTextKey("TXT_KEY_JFD_PIETY_FROM_ABOVE_THRESHOLD_CITY_STATES", numMinorFollowers)
				end
			end
		else
			if returnsTT then
				pietyRateTT = pietyRateTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("[TXT_KEY_JFD_PIETY_FROM_ON_THRESHOLD]", (pietyRateLoss - (pietyRateRestingRate*-1)))
			end
		end
	end
	if isNoRateDuringGAs then pietyRate = 0 
	else
		pietyRate = (pietyRateGain-pietyRateLoss) 
	end
	return pietyRate, pietyRateTT
end
-----------------
-- PIETY LEVEL
-----------------
--Player:GetPietyLevel
function Player.GetPietyLevel(player)
	local piety = player:GetPiety()
	for row in GameInfo.JFD_PietyLevel_GameSpeedThresholds("GameSpeedType = '" .. gameSpeedType .. "' AND '" .. piety .. "' <= MaxThreshold AND '" .. piety .. "' >= MinThreshold") do
		return GameInfoTypes[row.PietyLevelType]
	end
	return pietyLevelNeutralID
end

--Player:GetPietyLevelEventWeight
function Player.GetPietyLevelEventWeight(player, negative)
	if negative then 
		return GameInfo.JFD_PietyLevels[player:GetPietyLevel()].EventWeightModNegative or 5
	else
		return GameInfo.JFD_PietyLevels[player:GetPietyLevel()].EventWeightModPositive or 5
	end
end

--Player:GetPietyLevelRewardMod
function Player.GetPietyLevelRewardMod(player)
	return GameInfo.JFD_PietyLevels[player:GetPietyLevel()].RewardModifier or 1
end

--Player:GetTurnsUntilPietyLevelDrops
function Player.GetTurnsUntilPietyLevelDrops(player)
	local pietyLevelID = player:GetPietyLevel()
	local pietyLevelType = GameInfo.JFD_PietyLevels[pietyLevelID].Type
	local piety = player:GetPiety()
	local pietyRate = player:GetPietyRate()
	local threshold = 0
	local turns = 0
	for row in GameInfo.JFD_PietyLevel_GameSpeedThresholds("PietyLevelType = '" .. pietyLevelType .. "' AND GameSpeedType = '" .. gameSpeedType .. "'") do
		if player:GetPietyRestingRate() > piety then
			threshold = row.MaxThreshold
		else
			threshold = row.MinThreshold
		end
	end
	if pietyRate == 0 then turns = 0 
	else turns = mathFloor((piety-threshold)/pietyRate)*-1 end
	if turns < 0 then turns = 0 end
	return turns, threshold
end
-----------------
-- RESTING RATE
-----------------
--Player:GetPietyRestingRate
function Player.GetPietyRestingRate(player, returnsTT)
	local playerID = player:GetID()
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
				restingRateChangeOther = restingRateChangeOther + Game.GetRound(restingRateChange/3)
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
		if player:HasReform(GameInfoTypes[row.ReformType]) then
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
	if player:IsMinorCiv() then restingRate = restingRate + defineRTPPietyCityStateRestBonus end
	return restingRate, restingRateTT
end
------------------------------------------------------------------------------------------------------------------------
-- TOP PANEL
------------------------------------------------------------------------------------------------------------------------
--Player:GetPietyTopPanelInfo
function Player.GetPietyTopPanelInfo(player, pietyRate)
	local pietyLevelID = player:GetPietyLevel()
	local pietyLevel = GameInfo.JFD_PietyLevels[pietyLevelID]
	local pietyTPInfo = convertTextKey("TXT_KEY_JFD_PIETY_RATE", pietyLevel.TextColor, player:GetPiety(), defaultMaxPietyRate)
	local pietyRateInfo = convertTextKey("[COLOR_JFD_PIETY]({1_Num})[ENDCOLOR]", "+" .. pietyRate)
	if pietyRate < 0 then
		pietyRateInfo = convertTextKey("[COLOR_JFD_PIETY]([ENDCOLOR][COLOR_JFD_PIETY_NEUTRAL]{1_Num}[ENDCOLOR][COLOR_JFD_PIETY])[ENDCOLOR]", pietyRate)
	end		
	return pietyTPInfo .. " " .. pietyRateInfo
end

--Player:GetPietyTopPanelInfoTT
function Player.GetPietyTopPanelInfoTT(player)
	local strText = ""
	if player:HasStateReligion() then
		local religionID = player:GetStateReligion()
		local beliefShortDesc = nil
		local beliefHelp = nil
		local beliefPiety = 0
		local beliefBuildingDesc = nil
		local beliefBuildingPiety = 0
		--local beliefProphetHelp = Locale.ConvertTextKey("TXT_KEY_JFD_PIETY_TOP_PANEL_TT_STATE_RELIGION_PROPHET_PIETY", player:CalculatePietyYield(defineRTPPietyFromProphet, true))
		for _, belief in ipairs(Game.GetBeliefsInReligion(religionID)) do
			local beliefInfo = GameInfo.Beliefs[belief]
			if beliefInfo.IsPietySource then
				for row in GameInfo.Belief_JFD_PietyYieldChanges("BeliefType = '" .. beliefInfo.Type .. "' AND OnBuildingClassConstructed IS NULL") do
					beliefPiety = row.Yield
					break
				end
				beliefShortDesc = beliefInfo.ShortDescription
				beliefHelp = beliefInfo.Description .. "_HELP"
			end
			for row in GameInfo.Belief_JFD_PietyYieldChanges("BeliefType = '" .. beliefInfo.Type .. "' AND OnBuildingClassConstructed IS NOT NULL") do
				beliefBuildingPiety = player:CalculatePietyYield(row.Yield, true)
				beliefBuildingDesc = GameInfo.Buildings[player:GetSpecificBuildingType(row.OnBuildingClassConstructed)].Description
				break
			end
		end
		local pietyYield, pietyYieldMod, pietyYieldTT = player:CalculatePietyYield(beliefPiety, true)
		if (not beliefHelp) then return end
		beliefHelp = convertTextKey(beliefHelp, pietyYield)
		strText = strText .. convertTextKey("TXT_KEY_JFD_PIETY_TOP_PANEL_TT_STATE_RELIGION", GameInfo.Religions[religionID].IconString, Game.GetReligionName(religionID), beliefShortDesc, beliefHelp)
		if beliefBuildingDesc then
			strText = strText .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_BELIEF_JFD_RELIGIOUS_BUILDING_HELP", beliefBuildingPiety, beliefBuildingDesc)
		end
		for policy in GameInfo.Policies("PietyFromReligiousUnitPurchase > 0") do
			if player:HasPolicy(policy.ID) then
				strText = strText .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_PIETY_TOP_PANEL_TT_STATE_RELIGION_INFALLIBILITY_PIETY", player:CalculatePietyYield(policy.PietyFromReligiousUnitPurchase, true))
			end	
		end
		--strText = strText .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_JFD_PIETY_TOP_PANEL_TT_STATE_RELIGION_NW_PIETY", player:CalculatePietyYield(defineRTPPietyFromNaturalWonder, true))

		strText = strText .. "[NEWLINE][NEWLINE]";
		strText = strText .. convertTextKey("TXT_KEY_JFD_PIETY_YIELD_TT", pietyYieldMod, pietyYieldTT)
		
		strText = strText .. "[NEWLINE][NEWLINE]--------------------------[NEWLINE]";
		
		local currentPiety = player:GetPiety()
		local pietyLevelID = player:GetPietyLevel()
		local pietyLevel = GameInfo.JFD_PietyLevels[pietyLevelID]
		local pietyPerTurn = player:GetPietyRate()
		local pietyPerTurnHL = "[COLOR_NEGATIVE_TEXT]"
		local turnsUntilDrop, threshold = player:GetTurnsUntilPietyLevelDrops()
		local txtString = 'TXT_KEY_TP_JFD_PIETY_TT'
		if pietyPerTurn > 0 then 
			pietyPerTurn = "+" .. pietyPerTurn 
			pietyPerTurnHL = "[COLOR_POSITIVE_TEXT]"
		end
		local pietyRate, pietyRateTT = player:GetPietyPerTurn(true)
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
		
		local pietyRestingRate, pietyRestingRateTT = player:GetPietyRestingRate(true)
		strText = strText .. convertTextKey("TXT_KEY_JFD_PIETY_RESTING_RATE_TT", pietyRestingRate, pietyRestingRateTT)
		
		-- strText = strText .. "[NEWLINE][NEWLINE]--------------------------[NEWLINE]";
		local currentEffects = ""
		
		--strText = strText .. "[NEWLINE][NEWLINE]";
		--strText = strText .. convertTextKey("TXT_KEY_JFD_TP_PIETY_TOOLTIP_PIETY_SOURCES_HELP")
		strText = strText .. "[NEWLINE][NEWLINE]" .. convertTextKey("TXT_KEY_JFD_PIETY_TOP_PANEL_NOTE")
	end
	return strText
end
------------------------------------------------------------------------------------------------------------------------
-- RELIGIOUS VICTORY
------------------------------------------------------------------------------------------------------------------------
--Player:HasMetReligiousVictoryConditions
function Player.HasMetReligiousVictoryConditions(player)
	--Is Devout
	if player:GetPietyLevel() ~= pietyLevelDevoutID then return false end
	--Converted all Holy Cities
	--Converted all Civilizations/Religious City-States
	--Converted % Cities
	--Converted % Population
	return true
end
--=======================================================================================================================
--=======================================================================================================================