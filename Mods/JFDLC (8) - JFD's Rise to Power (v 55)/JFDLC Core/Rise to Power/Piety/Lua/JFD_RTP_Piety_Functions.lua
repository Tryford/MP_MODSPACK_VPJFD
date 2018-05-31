-- JFD_RTP_Piety_Functions
-- Author: JFD
-- DateCreated: 10/14/2015 7:37:23 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("FLuaVector.lua")
include("JFD_RTP_PietyUtils.lua")
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
local defineMaxMajorCivs 					= GameDefines["MAX_MAJOR_CIVS"]
local defineMaxMinorCivs 					= GameDefines["MAX_MINOR_CIVS"]
local defineRTPPietyChanceToFoundVirtuous   = GameDefines["JFD_RTP_PIETY_AI_CHANCE_TO_FOUND_VIRTUOUS"]
local defineRTPPietyChanceToFoundNeutral    = GameDefines["JFD_RTP_PIETY_AI_CHANCE_TO_FOUND_NEUTRAL"]
local defineRTPPietyGiftMedium 				= GameDefines["MINOR_JFD_PIETY_GIFT_MEDIUM"]
local defineRTPPietyGiftMediumReward		= GameDefines["MINOR_JFD_PIETY_GIFT_MEDIUM_REWARD"]
local defineRTPPietyFromNaturalWonder		= GameDefines["JFD_RTP_PIETY_FROM_NATURAL_WONDER"]
local defineRTPPietyFromProphet				= GameDefines["JFD_RTP_PIETY_FROM_PROPHET"]
local defineRTPPietyTurnsBetweenConversion 	= GameDefines["JFD_RTP_PIETY_AI_TURNS_BETWEEN_CONVERSION"]
--=======================================================================================================================
-- MOD USE
--=======================================================================================================================
local isUsingCBP = Game.IsCBOActive()
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingCIDInvestmentsCore			= (Game.GetUserSetting("JFD_CID_INVESTMENTS_CORE") == 1)
local userSettingRTPPietyCore				= (Game.GetUserSetting("JFD_RTP_PIETY_CORE") == 1)
local userSettingRTPPietyAztecs				= (Game.GetUserSetting("JFD_RTP_PIETY_CIVILIZATION_CHANGES_AZTECS") == 1)
local userSettingRTPPietyBeliefMissions		= (Game.GetUserSetting("JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS") == 1)
local userSettingRTPPietyMonumentGods		= (Game.GetUserSetting("JFD_RTP_PIETY_BELIEF_CHANGES_MONUMENT_GODS") == 1)
local userSettingRTPPietyPolicies			= (Game.GetUserSetting("JFD_RTP_PIETY_POLICY_CHANGES") == 1)
local userSettingRTPPietyProphetArtifacts	= (Game.GetUserSetting("JFD_RTP_PIETY_GREAT_PEOPLE_CHANGES_PROPHET") == 1)
local userSettingRTPPietyReligiousVictory	= (Game.GetUserSetting("JFD_RTP_PIETY_VICTORY_ADDITIONS_RELIGIOUS") == 1)
local userSettingRTPSovereigntyCore			= (Game.GetUserSetting("JFD_RTP_SOVEREIGNTY_CORE") == 1)
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local activePlayerID 		= Game.GetActivePlayer()
local activePlayer 			= Players[activePlayerID]
local activePlayerTeam 		= Teams[activePlayer:GetTeam()]
local convertTextKey 		= Locale.ConvertTextKey
local gameSpeed				= GameInfo.GameSpeeds[Game.GetGameSpeedType()]
local gameSpeedMod			= (gameSpeed.BuildPercent/100)
local gameSpeedType 		= gameSpeed.Type 
local mathCeil				= math.ceil

local defaultMaxPietyRate   = 100
local defaultRestingRateMod = 0
for row in GameInfo.GameSpeed_JFD_PietyThresholds("GameSpeedType = '" .. gameSpeedType .. "'") do
	defaultMaxPietyRate     = row.MaxThreshold
	defaultRestingRateMod   = row.RestingRateMod
	break
end

local governmentTheocracyID = GameInfoTypes["GOVERNMENT_JFD_THEOCRACY"]

local pietyLevelDevoutID	= GameInfoTypes["PIETY_LEVEL_JFD_DEVOUT"]
local pietyLevelHereticalID = GameInfoTypes["PIETY_LEVEL_JFD_HERETICAL"]
local pietyLevelNeutralID   = GameInfoTypes["PIETY_LEVEL_JFD_NEUTRAL"]
local pietyLevelPoorID		= GameInfoTypes["PIETY_LEVEL_JFD_POOR"]
local pietyLevelVirtuousID	= GameInfoTypes["PIETY_LEVEL_JFD_VIRTUOUS"]

local resourceClericsID		= GameInfoTypes["RESOURCE_JFD_CLERICS"]

local unitClassInquisitorID = GameInfoTypes["UNITCLASS_INQUISITOR"]
local unitClassMissionaryID = GameInfoTypes["UNITCLASS_MISSIONARY"]
local unitClassProphetID    = GameInfoTypes["UNITCLASS_PROPHET"]

local yieldFaithID   		= GameInfoTypes["YIELD_FAITH"]

g_EVCReligiousVictoryWon 	= false;
--=======================================================================================================================
-- AI FUNCTIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- RELIGION
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Piety_GetBeliefToFound
function JFD_RTP_Piety_GetBeliefToFound(playerID, religionID)
	local player = Players[playerID]
	if player:IsHuman() then return end
	local bonusBeliefID = -1
	local bonusBeliefs = {}
	local bonusBeliefCount = 1
	for row in GameInfo.Beliefs("Bonus = 1") do
		if (not Game.IsInSomeReligion(row.ID)) then
			bonusBeliefs[bonusBeliefCount] = row.ID
			bonusBeliefCount = bonusBeliefCount + 1
		end
	end
	if #bonusBeliefs > 0 then
		bonusBeliefID = bonusBeliefs[Game.GetRandom(1,#bonusBeliefs)]
	end
	if (not bonusBeliefID) then bonusBeliefID = bonusBeliefs[bonusBeliefCount] end
	return bonusBeliefID 
end
if userSettingRTPPietyBeliefMissions then
	GameEvents.GetBeliefToFound.Add(JFD_RTP_Piety_GetBeliefToFound)
end

--JFD_RTP_Piety_GetReligionToSpread
function JFD_RTP_Piety_GetReligionToSpread(playerID)
	local player = Players[playerID]
	local religionID = player:GetStateReligion()
	if religionID <= 0 then religionID = player:GetReligionCreatedByPlayer() end
	if (player:GetNumCities() <= 2 and religionID <= 0 and player:GetCapitalCity()) then religionID = player:GetCapitalCity():GetReligiousMajority() or -1 end
	if religionID <= 0 then religionID = player:GetMajorityReligion() or -1 end
	return religionID 
end
if userSettingRTPPietyCore then
	GameEvents.GetReligionToSpread.Add(JFD_RTP_Piety_GetReligionToSpread)
end
------------------------------------------------------------------------------------------------------------------------
-- PIETY
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Piety_PlayerDoTurnAI
function JFD_RTP_Piety_PlayerDoTurnAI(playerID)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	if player:IsHuman() and playerID == Game.GetActivePlayer() thenreturn end
	if player:IsBarbarian() then return end
	if player:IsMinorCiv() then return end
	if (not player:HasStateReligion()) then return end
	if player:GetPietyLevel() < pietyLevelVirtuousID then return end
	local flavourDiplomacy = player:GetFlavorValue("FLAVOR_DIPLOMACY")
	if flavourDiplomacy < 6 then return end
	if Game.GetRandom(1,100) > (flavourDiplomacy*2) then return end
	local minorPlayers = {}
	local count = 1
	for minorPlayerID = 0, defineMaxMinorCivs - 1 do
		local minorPlayer = Players[minorPlayerID]
		if (minorPlayer:IsAlive() and playerTeam:IsHasMet(minorPlayer:GetTeam()) and minorPlayer:GetMinorCivFriendshipLevelWithMajor(playerID) >= 1) then
			minorPlayers[count] = minorPlayer
		end
	end
	if #minorPlayers > 0 then
		local minorPlayer = minorPlayers[Game.GetRandom(1,#minorPlayers)]
		if (not minorPlayer) then return end
		player:ChangePiety(-defineRTPPietyGiftMedium)
		minorPlayer:ChangeMinorCivFriendshipWithMajor(playerID, defineRTPPietyGiftMediumReward)
	end
end
if userSettingRTPPietyCore then
	GameEvents.PlayerDoTurn.Add(JFD_RTP_Piety_PlayerDoTurnAI)
end
------------------------------------------------------------------------------------------------------------------------
-- STATE RELIGION
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Piety_StateReligion_PlayerDoTurnAI
local minorCivTraitReligiousID = MinorCivTraitTypes["MINOR_CIV_TRAIT_RELIGIOUS"]
function JFD_RTP_Piety_StateReligion_PlayerDoTurnAI(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (not player:GetCapitalCity()) then return end
	if (player:IsHuman() or player:IsBarbarian()) then return end
	--if (player:IsMinorCiv() and player:GetMinorCivTrait() ~= minorCivTraitReligiousID) then return end
	local stateReligionChance = player:GetStateReligionChance()
	if stateReligionChance == 0 then return end
	if Game.GetRandom(1,100) <= stateReligionChance then
		local religionID = player:GetMajorityReligion()
		if player:GetNumCities() <= 2 then religionID = player:GetCapitalCity():GetReligiousMajority() end
		if religionID > 0 then player:SetStateReligion(religionID) end
	end
end
if userSettingRTPPietyCore then
	GameEvents.PlayerDoTurn.Add(JFD_RTP_Piety_StateReligion_PlayerDoTurnAI)
end

--JFD_RTP_Piety_AiOverrideChooseNextTech
local techPriesthoodID = GameInfoTypes["TECH_JFD_PRIESTHOOD"]
function JFD_RTP_Piety_AiOverrideChooseNextTech(playerID, isFreeTech)
	local player = Players[playerID]
	local religionID = player:GetMajorityReligion()
	local createdReligionID = player:GetReligionCreatedByPlayer()
	if ((religionID > 0 or createdReligionID > 0) and techPriesthoodID) then
		return techPriesthoodID
	end
end
if userSettingRTPPietyCore then
	GameEvents.AiOverrideChooseNextTech.Add(JFD_RTP_Piety_AiOverrideChooseNextTech)
end
------------------------------------------------------------------------------------------------------------------------
-- SECULARIZATION
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Piety_Secularization_PlayerDoTurnAI
--function JFD_RTP_Piety_Secularization_PlayerDoTurnAI(playerID)
--	local player = Players[playerID]
--	if (not player:IsAlive()) then return end
--	if (not player:GetCapitalCity()) then return end
--	if (player:IsHuman() or player:IsBarbarian() or player:IsMinorCiv()) then return end
--	local secularizeChance = player:GetSecularizationChance()
--	if secularizeChance <= 0 then return end
--	if Game.GetRandom(1,100) <= secularizeChance then
--		player:SetHasSecularized(true)
--	end
--end
--GameEvents.PlayerDoTurn.Add(JFD_RTP_Piety_Secularization_PlayerDoTurnAI)
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- RELIGION
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Piety_PantheonFounded
function JFD_RTP_Piety_PantheonFounded(playerID)
	if playerID ~= activePlayerID then return end
	Events.AudioPlay2DSound("AS2D_JFD_DRUIDISM")
end
GameEvents.PantheonFounded.Add(JFD_RTP_Piety_PantheonFounded)

--JFD_RTP_Piety_ReligionFounded
function JFD_RTP_Piety_ReligionFounded(playerID, holyCityID, religionID, belief1, belief2, belief3, belief4, belief5)
	local player = Players[playerID]
	if player:CanHaveStateReligion(religionID) then
		player:SetStateReligion(religionID)
	else
		if (playerID == activePlayerID and player:CanHaveAnyStateReligion()) then
			JFD_SendNotification(playerID, "NOTIFICATION_RELIGION_FOUNDED", convertTextKey("TXT_KEY_JFD_STATE_RELIGION_CAN_ADOPT_NOTIFICATION_TEXT"), convertTextKey("TXT_KEY_JFD_STATE_RELIGION_CAN_ADOPT_NOTIFICATION_SHORT_TEXT"), true)
		end
	end
	Game.SetFoundYear(religionID, Game.GetGameTurnYear())
	for row in GameInfo.Religion_FoundingAudios("ReligionType = '" .. GameInfo.Religions[religionID].Type .. "' AND AudioSound IS NOT NULL") do
		Events.AudioPlay2DSound(row.AudioSound)
	end
	if resourceClericsID then
		player:ChangeNumResourceTotal(resourceClericsID, 2)
	end
end
GameEvents.ReligionFounded.Add(JFD_RTP_Piety_ReligionFounded)
------------------------------------------------------------------------------------------------------------------------
-- STATE RELIGION
------------------------------------------------------------------------------------------------------------------------
-- JFD_RTP_Piety_LoadScreenClose
function JFD_RTP_Piety_LoadScreenClose()
for playerID = 0, defineMaxMajorCivs - 1 do
	local player = Players[playerID]
	if (player:IsAlive() and player:CanSecularize() and (not player:HasStateReligion())) then
		player:SetHasSecularized(true)
	end
end
end
if userSettingRTPPietyCore then
	Events.LoadScreenClose.Add(JFD_RTP_Piety_LoadScreenClose)
end

--JFD_RTP_Piety_TeamTechResearched
function JFD_RTP_Piety_TeamTechResearched(teamID, techID)
	local playerID = Teams[teamID]:GetLeaderID()
	local player = Players[playerID]
	local techType = GameInfo.Technologies[techID].Type
	if player:IsBarbarian() then return end
	if (not player:HasStateReligion()) and (not player:HasStateReligion()) then
		for row in GameInfo.Technologies_JFD_MiscEffects("TechType = '" .. techType .. "' AND AllowStateReligions == 1") do
			local religionID = player:GetReligionCreatedByPlayer()
			if religionID > 0 then
				player:SetStateReligion(religionID)
				for row in GameInfo.Religion_FoundingAudios("ReligionType = '" .. GameInfo.Religions[religionID].Type .. "' AND AudioSound IS NOT NULL") do
					Events.AudioPlay2DSound(row.AudioSound)
				end
			else
				if playerID == activePlayerID then
					if player:CanHaveAnyStateReligion() then
						JFD_SendNotification(playerID, "NOTIFICATION_RELIGION_FOUNDED", convertTextKey("TXT_KEY_JFD_STATE_RELIGION_CAN_ADOPT_NOTIFICATION_TEXT"), convertTextKey("TXT_KEY_JFD_STATE_RELIGION_CAN_ADOPT_NOTIFICATION_SHORT_TEXT"), true)
					end
				end
			end
			break
		end
	end
	for row in GameInfo.Technologies_JFD_MiscEffects("TechType = '" .. techType .. "' AND AllowSecularization == 1") do
		if (not player:HasStateReligion()) then
			player:SetHasSecularized(true)
		else
			if playerID == activePlayerID then
				JFD_SendNotification(playerID, "NOTIFICATION_RELIGION_FOUNDED", convertTextKey("TXT_KEY_JFD_STATE_RELIGION_CAN_SECULARIZE_NOTIFICATION_TEXT"), convertTextKey("TXT_KEY_JFD_STATE_RELIGION_CAN_SECULARIZE_NOTIFICATION_SHORT_TEXT"), true)
				LuaEvents.JFD_Tutorial_PushTutorialPopup(playerID, "IsOnCanSecularize")
			end
		end
	end
	if (player:IsHuman() or player:IsBarbarian()) then return end
	local secularizeChance = player:GetSecularizationChance()
	if secularizeChance <= 0 then return end
	if Game.GetRandom(1,100) <= secularizeChance then
		player:SetHasSecularized(true)
	end
end
if userSettingRTPPietyCore then
	GameEvents.TeamTechResearched.Add(JFD_RTP_Piety_TeamTechResearched)
end

--JFD_RTP_Piety_PlayerStateReligionAdopted
function JFD_RTP_Piety_PlayerStateReligionAdopted(playerID, religionID)
	if (not religionID) then return end
	if religionID <= -1 then return end
	local player = Players[playerID]
	if activePlayerTeam:IsHasMet(player:GetTeam()) then 
		if playerID == activePlayerID then
			JFD_SendNotification(playerID, "NOTIFICATION_RELIGION_FOUNDED", convertTextKey("TXT_KEY_JFD_STATE_RELIGION_ADOPT_NOTIFICATION_TEXT", Game.GetReligionName(religionID)), convertTextKey("TXT_KEY_JFD_STATE_RELIGION_NOTIFICATION_SHORT_TEXT"), true)
			LuaEvents.JFD_Tutorial_PushTutorialPopup(playerID, "IsOnStateReligion")
		else
			JFD_SendNotification(playerID, "NOTIFICATION_RELIGION_FOUNDED", convertTextKey("TXT_KEY_JFD_STATE_RELIGION_ADOPT_NOTIFICATION_OTHER_TEXT", player:GetCivilizationShortDescription(), Game.GetReligionName(religionID)), convertTextKey("TXT_KEY_JFD_STATE_RELIGION_NOTIFICATION_SHORT_TEXT"), true)
		end
		for row in GameInfo.Religion_FoundingAudios("ReligionType = '" .. GameInfo.Religions[religionID].Type .. "' AND AudioSound IS NOT NULL") do
			Events.AudioPlay2DSound(row.AudioSound)
		end
	end
	if (not player:IsHuman()) then
		player:SetTurnsSinceConversion(Game.GetGameTurn()+defineRTPPietyTurnsBetweenConversion)
	end
	player:ChangePiety(defaultMaxPietyRate)
	JFD_RTP_Piety_PlayerDoTurn(playerID)
	if userSettingRTPSovereigntyCore then
		if player:GetGovernment() == governmentTheocracyID then
			local religionType = GameInfo.Religions[religionID].Type
			for row in GameInfo.Religion_JFD_Governments("ReligionType = '" .. religionType .. "' AND LegislatureName IS NOT NULL") do
				legislatureName = row.LegislatureName
				break
			end
			player:SetLegislatureName(legislatureName)
		end
	end
	local playerFounderID = Game.GetFounder(religionID, -1)
	local playerFounder = Players[playerFounderID]
	for row in GameInfo.Beliefs("OnSRGoldenAgeTurns > 0") do
		if playerFounder:HasBelief(row.ID) then
			local turnsGA = Game.GetRound(row.OnSRGoldenAgeTurns*gameSpeedMod)
			playerFounder:ChangeGoldenAgeTurns(turnsGA)
		end
	end
	for row in GameInfo.Beliefs("OnSRFreeInnovations > 0") do
		if playerFounder:HasBelief(row.ID) then
			playerFounder:DoRandomInnovation(playerFounder:GetCurrentEra())
		end
	end
	for row in GameInfo.Beliefs("OnSRWLTKDTurns > 0") do
		if playerFounder:HasBelief(row.ID) then
			local turnsWLTKD = Game.GetRound(row.OnSRWLTKDTurns*gameSpeedMod)
			for city in playerFounder:Cities() do
				if city:IsHolyCityForReligion(religionID) then
					LuaEvents.JFD_WLTKDBegins(playerFounderID, city, city:GetX(), city:GetY(), turnsWLTKD, -1, true)
				end
			end
		end
	end
end
if userSettingRTPPietyCore then
	GameEvents.PlayerStateReligionAdopted.Add(JFD_RTP_Piety_PlayerStateReligionAdopted)
end

--JFD_RTP_Piety_PlayerStateReligionChanged
function JFD_RTP_Piety_PlayerStateReligionChanged(playerID, newReligionID, oldReligionID)
	if newReligionID == -1 then return end
	if oldReligionID == -1 then return end
	if oldReligionID == newReligionID then return end
	local player = Players[playerID]
	if activePlayerTeam:IsHasMet(player:GetTeam()) then 
		if playerID == activePlayerID then
			JFD_SendNotification(playerID, "NOTIFICATION_RELIGION_FOUNDED", convertTextKey("TXT_KEY_JFD_STATE_RELIGION_CHANGE_NOTIFICATION_TEXT", Game.GetReligionName(newReligionID), Game.GetReligionName(oldReligionID)), convertTextKey("TXT_KEY_JFD_STATE_RELIGION_CHANGED_NOTIFICATION_SHORT_TEXT"), true)
		else
			JFD_SendNotification(playerID, "NOTIFICATION_RELIGION_FOUNDED", convertTextKey("TXT_KEY_JFD_STATE_RELIGION_CHANGE_NOTIFICATION_OTHER_TEXT", player:GetCivilizationShortDescription(), Game.GetReligionName(newReligionID), Game.GetReligionName(oldReligionID)), convertTextKey("TXT_KEY_JFD_STATE_RELIGION_CHANGED_NOTIFICATION_SHORT_TEXT"), true)
		end
		for row in GameInfo.Religion_FoundingAudios("ReligionType = '" .. GameInfo.Religions[newReligionID].Type .. "' AND AudioSound IS NOT NULL") do
			Events.AudioPlay2DSound(row.AudioSound)
		end
	end
	if (not player:IsHuman()) then
		player:SetTurnsSinceConversion(Game.GetGameTurn()+defineRTPPietyTurnsBetweenConversion)
	end
	JFD_RTP_Piety_PlayerDoTurn(playerID)
	if player:IsHuman() then
		local pietyLevel = GameInfo.JFD_PietyLevels[player:GetPietyLevel()]
		local numResistanceTurns = pietyLevel.ChangeResistanceTurns
		if numResistanceTurns > 0 then
			for city in player:Cities() do
				if city:GetReligiousMajority() == oldReligionID then
					city:ChangeResistanceTurns(numResistanceTurns)
				end
			end
			Events.GameplayAlertMessage(convertTextKey("TXT_KEY_JFD_STATE_RELIGION_CHANGED_ANARCHY_ALERT_STATE_RELIGION"))
		end
		local faithCost = (pietyLevel.ChangeFaithCost * player:GetNumCitiesWithStateReligion(oldReligionID))
		faithCost = Game.GetRound(faithCost*gameSpeedMod)
		if faithCost > 0 then
			player:ChangeFaith(-faithCost)
			Events.GameplayAlertMessage(convertTextKey("TXT_KEY_JFD_STATE_RELIGION_CHANGED_FAITH_ALERT_STATE_RELIGION"))
			Events.AudioPlay2DSound("AS2D_INTERFACE_FAITH_PURCHASE");
		end
	end
end
if userSettingRTPPietyCore then
	GameEvents.PlayerStateReligionChanged.Add(JFD_RTP_Piety_PlayerStateReligionChanged)
end
----------------
-- SECULARIZATION
----------------
--JFD_RTP_Piety_PlayerSecularizes
function JFD_RTP_Piety_PlayerSecularizes(playerID, religionID, isSecularizes)
	if (not isSecularizes) then return end
	local player = Players[playerID]
	if activePlayerTeam:IsHasMet(player:GetTeam()) then 
		Events.AudioPlay2DSound("AS2D_JFD_SECULARIZATION")
		if playerID == activePlayerID then
			JFD_SendNotification(playerID, "NOTIFICATION_RELIGION_FOUNDED", convertTextKey("TXT_KEY_JFD_SECULARIZATION_NOTIFICATION_TEXT"), convertTextKey("TXT_KEY_JFD_SECULARIZATION_NOTIFICATION_SHORT_TEXT"), true)
		else
			JFD_SendNotification(playerID, "NOTIFICATION_RELIGION_FOUNDED", convertTextKey("TXT_KEY_JFD_SECULARIZATION_NOTIFICATION_OTHER_TEXT", player:GetCivilizationShortDescription()), convertTextKey("TXT_KEY_JFD_SECULARIZATION_NOTIFICATION_SHORT_TEXT"), true)
		end
	end
	if player:HasStateReligion() then
		if player:IsHuman() then
			local pietyLevel = GameInfo.JFD_PietyLevels[player:GetPietyLevel()]
			local numResistanceTurns = pietyLevel.ChangeResistanceTurns
			if numResistanceTurns > 0 then
				for city in player:Cities() do
					if city:GetReligiousMajority() == religionID then
						city:ChangeResistanceTurns(numResistanceTurns)
					end
				end
				Events.GameplayAlertMessage(convertTextKey("TXT_KEY_JFD_STATE_RELIGION_CHANGED_ANARCHY_ALERT_SECULARIZE"))
			end
			local faithCost = (pietyLevel.ChangeFaithCost * player:GetNumCitiesWithStateReligion(religionID))
			faithCost = Game.GetRound(faithCost*gameSpeedMod)
			if faithCost > 0 then
				player:ChangeFaith(-faithCost)
				Events.GameplayAlertMessage(convertTextKey("TXT_KEY_JFD_STATE_RELIGION_CHANGED_FAITH_ALERT_SECULARIZE"))
			end
		end
		player:SetStateReligion(-1)
		player:SetPiety(0)
	end
end
if userSettingRTPPietyCore then
	GameEvents.PlayerSecularizes.Add(JFD_RTP_Piety_PlayerSecularizes)
end
----------------
-- DIPLOMACY
----------------
--JFD_RTP_Piety_GetDiploModifier
local diploModHeathenID				= GameInfoTypes["DIPLOMODIFIER_JFD_HEATHEN"]
local diploModHeathenTolerantID		= GameInfoTypes["DIPLOMODIFIER_JFD_HEATHEN_TOLERANT"]
local diploModHighPietyID			= GameInfoTypes["DIPLOMODIFIER_JFD_HIGH_PIETY"]
local diploModLowPietyID			= GameInfoTypes["DIPLOMODIFIER_JFD_LOW_PIETY"]
local pietyLevelDevoutID			= GameInfoTypes["PIETY_LEVEL_JFD_DEVOUT"]
local pietyLevelHereticalID			= GameInfoTypes["PIETY_LEVEL_JFD_HERETICAL"]
function JFD_RTP_Piety_GetDiploModifier(diploModifierID, fromPlayerID, toPlayerID)
	local diploModifier = 0
	local fromPlayer = Players[fromPlayerID]
	local fromPlayerHasStateReligion = fromPlayer:HasStateReligion()
	local fromPlayerStateReligionID = fromPlayer:GetStateReligion() or -1
	local fromPlayerReligiousIntolerance = fromPlayer:GetFlavorValue("FLAVOR_JFD_RELIGIOUS_INTOLERANCE")
	local toPlayer = Players[toPlayerID]
	local toPlayerIsPagan = toPlayer:IsPagan()
	local toPlayerHasStateReligion = toPlayer:HasStateReligion()
	local toPlayerStateReligionID = toPlayer:GetStateReligion() or -1
	local eraMod = GameInfo.Eras[fromPlayer:GetCurrentEra()].StateReligionDiploMod
	--Different State Religion, or State Religion vs. Pagan (Intolerant)
	if diploModifierID == diploModHeathenID then
		if fromPlayerReligiousIntolerance > 6 then
			if ((fromPlayerHasStateReligion and (toPlayerHasStateReligion or toPlayerIsPagan)) and (fromPlayerStateReligionID ~= toPlayerStateReligionID)) then
				diploModifier = (fromPlayerReligiousIntolerance*eraMod)
			end
		end
	end
	--Different State Religion, or State Religion vs. Pagan (Tolerant)
	if diploModifierID == diploModHeathenTolerantID then
		if (fromPlayerReligiousIntolerance > 0 and fromPlayerReligiousIntolerance < 6) then
			if ((fromPlayerHasStateReligion and (toPlayerHasStateReligion or toPlayerIsPagan)) and (fromPlayerStateReligionID ~= toPlayerStateReligionID)) then
				diploModifier = ((fromPlayerReligiousIntolerance*eraMod)*25/100)
			end
		end
	end
	--Same State Religion
	--High Piety
	if diploModifierID == diploModHighPietyID then
		if ((fromPlayerHasStateReligion and toPlayerHasStateReligion) and (fromPlayerStateReligionID == toPlayerStateReligionID)) then
			local toPlayerPietyLevel = toPlayer:GetPietyLevel() 
			if toPlayerPietyLevel == pietyLevelDevoutID then
				diploModifier = -fromPlayerReligiousIntolerance*eraMod
			end
		end
	end
	--Low Piety
	if diploModifierID == diploModLowPietyID then
		if ((fromPlayerHasStateReligion and toPlayerHasStateReligion) and (fromPlayerStateReligionID == toPlayerStateReligionID)) then
			local toPlayerPietyLevel = toPlayer:GetPietyLevel() 
			if toPlayerPietyLevel == pietyLevelHereticalID then
				diploModifier = fromPlayerReligiousIntolerance*eraMod
			end
		end
	end
	return Game.GetRound(diploModifier)
end
if userSettingRTPPietyCore then
	GameEvents.GetDiploModifier.Add(JFD_RTP_Piety_GetDiploModifier)
end
------------------------------------------------------------------------------------------------------------------------
-- PIETY
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Piety_PlayerDoTurn
function JFD_RTP_Piety_PlayerDoTurn(playerID)
	local playerID = playerID or activePlayerID
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (not player:HasStateReligion()) then return end
	local pietyPerTurn = player:GetPietyPerTurn()
	if player:GetPietyRate() ~= pietyPerTurn then
		player:SetPietyRate(pietyPerTurn)
	end
end
if userSettingRTPPietyCore then
	GameEvents.PlayerDoTurn.Add(JFD_RTP_Piety_PlayerDoTurn)
end

--JFD_RTP_Piety_NaturalWonderDiscovered
function JFD_RTP_Piety_NaturalWonderDiscovered(teamID, featureID, plotX, plotY, isFirst)
	local team = Teams[teamID]
	local playerID = team:GetLeaderID()
	local player = Players[playerID]
	if (not player:HasStateReligion()) then return end
	local rewardPiety = player:CalculatePietyYield(defineRTPPietyFromNaturalWonder)
	if rewardPiety > 0 then
		player:ChangePiety(rewardPiety)
		if player:IsHuman() then
			Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(plotX, plotY))), Locale.ConvertTextKey("[COLOR_JFD_PIETY]+{1_Num}[ENDCOLOR] [ICON_JFD_PIETY]", rewardPiety), true)
			Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_JFD_PIETY_NATURAL_WONDER_DISCOVERED", rewardPiety, feature.Description))
		end
	end
end
if userSettingRTPPietyCore then
	--GameEvents.NaturalWonderDiscovered.Add(JFD_RTP_Piety_NaturalWonderDiscovered)
end
----------------
-- PIETY LEVEL
----------------
--JFD_RTP_Piety_PietyLevelChanged
function JFD_RTP_Piety_PietyLevelChanged(playerID, oldPietyLevelID, newPietyLevelID)
	local player = Players[playerID]
	if (not player:IsHuman()) then return end
	local pietyLevel = GameInfo.JFD_PietyLevels[newPietyLevelID]
	JFD_SendNotification(playerID, "NOTIFICATION_JFD_PIETY", convertTextKey("TXT_KEY_JFD_PIETY_LEVEL_NOTIFICATION_TEXT", pietyLevel.TextColor, pietyLevel.ShortDescription), convertTextKey("TXT_KEY_JFD_PIETY_LEVEL_NOTIFICATION_SHORT_TEXT"), true)
end
if userSettingRTPPietyCore then
	LuaEvents.JFD_PietyLevelChanged.Add(JFD_RTP_Piety_PietyLevelChanged)
end

--JFD_RTP_Piety_PietyLevelChanged
function JFD_RTP_Piety_PietyLevelChanged(playerID, currentPiety, pietyChange)
	local player = Players[playerID]
	local currentPietyLevelID = player:GetPietyLevel() 
	if currentPiety == pietyChange then return end
	for row in GameInfo.JFD_PietyLevel_GameSpeedThresholds("GameSpeedType = '" .. gameSpeedType .. "' AND '" .. (currentPiety+pietyChange) .. "' <= MaxThreshold AND '" .. (currentPiety+pietyChange) .. "' >= MinThreshold") do
		local pietyLevelID = GameInfoTypes[row.PietyLevelType]
		if currentPietyLevelID ~= pietyLevelID then
			LuaEvents.JFD_PietyLevelChanged(playerID, currentPietyLevelID, pietyLevelID)
		end
		break
	end
	if player:IsHuman() and playerID == Game.GetActivePlayer() then Events.SerialEventGameDataDirty() end
end
if userSettingRTPPietyCore then
	GameEvents.PietyChange.Add(JFD_RTP_Piety_PietyLevelChanged)
end

--JFD_RTP_Piety_Conversion
function JFD_RTP_Piety_Conversion(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if player:HasSecularized() then return end
	if player:IsBarbarian() then return end
	if (not player:HasStateReligion()) then return end
	local pietyLevelID = player:GetPietyLevel() 
	local conversionRate = player:GetStateReligionReligiousPressure()
	local hasSyncretism = false
	for row in GameInfo.Policies("ConvertsAllStateReligion > 0") do
		if player:HasPolicy(row.ID) then
			hasSyncretism = true
			break
		end
	end
	local stateReligionID = player:GetStateReligion()
	if stateReligionID > 0 then
		if (pietyLevelID > pietyLevelNeutralID and hasSyncretism) then
			for city in player:Cities() do
				if city:GetReligiousMajority() ~= stateReligionID then
					city:ConvertPercentFollowers(stateReligionID, -1, conversionRate)
					for row in GameInfo.Religions("ID <> '" .. stateReligionID .. "'") do
						local religionID = row.ID
						city:ConvertPercentFollowers(stateReligionID, religionID, conversionRate)
					end
				end
			end
		elseif pietyLevelID ~= pietyLevelNeutralID then
			if pietyLevelID > pietyLevelNeutralID then
				for city in player:Cities() do
					if (not city:IsHolyCityAnyReligion()) then
						if city:GetReligiousMajority() ~= stateReligionID then
							city:ConvertPercentFollowers(stateReligionID, -1, conversionRate)
							city:ConvertPercentFollowers(stateReligionID, 0, conversionRate)
						end
					end
				end
			else
				if (not player:IsHuman()) then return end
				for city in player:Cities() do
					if (not city:IsHolyCityAnyReligion()) then
						city:ConvertPercentFollowers(-1, stateReligionID, conversionRate)
					end
				end
			end
		end
	end
end
if userSettingRTPPietyCore then
	GameEvents.PlayerDoTurn.Add(JFD_RTP_Piety_Conversion)
end

--JFD_RTP_Piety_ConversionStrength
local promotionReligiousUnitID = GameInfoTypes["PROMOTION_JFD_RELIGIOUS_UNIT"]
local unitMissionaryStrength   = GameInfo.Units["UNIT_MISSIONARY"].ReligiousStrength
function JFD_RTP_Piety_ConversionStrength(playerID, unitID)
    local player = Players[playerID]
	if player:IsAlive() then
		if (not unitID) then return end
		if (not player:HasStateReligion()) then return end
		local unit = player:GetUnitByID(unitID)
		if (not unit) then return end
		if (not unit:IsUnitClass(unitClassMissionaryID)) then return end
		if unit:HasPromotion(promotionReligiousUnitID) then return end
		local unitReligionSpreads = unit:GetSpreadsLeft()
		if (unitMissionaryStrength > 0 or unitReligionSpreads > 0) then
			local pietyLevelID = player:GetPietyLevel() 
			local pietyLevel = GameInfo.JFD_PietyLevels[pietyLevelID]
			local conversionStrengthMod = pietyLevel.ConversionStrengthModifier
			local religionSpreadsMod = pietyLevel.ReligionSpreadsModifier
			if (conversionStrengthMod ~= 0 or religionSpreadsMod ~= 0) then
				local conversionStrength = unitMissionaryStrength + ((unitMissionaryStrength*conversionStrengthMod)/100)
				local religiousSpreads = (unit:GetSpreadsLeft()+religionSpreadsMod)
				unit:SetConversionStrength(conversionStrength)
				unit:SetSpreadsLeft(religiousSpreads)
				unit:SetHasPromotion(promotionReligiousUnitID, true)
			end
		end	
	end
end
if userSettingRTPPietyCore then
	Events.SerialEventUnitCreated.Add(JFD_RTP_Piety_ConversionStrength)
end
------------
-- BELIEFS
------------
--JFD_RTP_Piety_FromBirth
function JFD_RTP_Piety_FromBirth(plotX, plotY, oldPopulation, newPopulation)
	if newPopulation > oldPopulation then
		local city = Map.GetPlot(plotX, plotY):GetPlotCity()
		if (not city) then return end
		local playerID = city:GetOwner()
		local player = Players[playerID]
		for row in GameInfo.Beliefs("FaithFromGrowth = 1") do
			if city:HasBelief(row.ID) then
				local rewardFaith = city:GetBaseYieldRate(yieldFaithID)
				if rewardFaith > 0 then
					player:ChangeFaith(rewardFaith)
					if player:IsHuman() then
						local hex = ToHexFromGrid(Vector2(plotX, plotY))
						Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_WHITE]+{1_Num}[ENDCOLOR] [ICON_PEACE]", rewardFaith), true)
					end
					break
				end
			end
		end
		if (not player:HasStateReligion()) then return end
		local religionID = player:GetStateReligion()
		for row in GameInfo.Belief_JFD_PietyYieldChanges("OnCitizenBirth == 1") do
			if Game.BeliefIsInReligion(religionID, GameInfoTypes[row.BeliefType]) then
				local popMod = Game.GetRound(newPopulation/5)
				if newPopulation > 20 then popMod = 4 end
				local rewardPiety = (player:CalculatePietyYield(row.Yield)*popMod)
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
end
if userSettingRTPPietyCore then
	GameEvents.SetPopulation.Add(JFD_RTP_Piety_FromBirth)
end

--JFD_RTP_Piety_FromCity
function JFD_RTP_Piety_FromCity(playerID, plotX, plotY)
	local city = Map.GetPlot(plotX, plotY):GetPlotCity()
	if (not city) then return end
	local playerID = city:GetOwner()
	local player = Players[playerID]
	if (not player:HasStateReligion()) then return end
	local religionID = player:GetStateReligion()
	for row in GameInfo.Belief_JFD_PietyYieldChanges("OnCityFounded == 1") do
		if Game.BeliefIsInReligion(religionID, GameInfoTypes[row.BeliefType]) then
			local rewardPiety = player:CalculatePietyYield(row.Yield)
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
if userSettingRTPPietyCore then
	GameEvents.PlayerCityFounded.Add(JFD_RTP_Piety_FromCity)
end

--JFD_RTP_Piety_CityCaptureComplete
function JFD_RTP_Piety_FromCityCaptured(oldOwnerID, capital, plotX, plotY, newOwnerID)
	local player = Players[newOwnerID]
	if (not player:HasStateReligion()) then return end
	local city = Map.GetPlot(plotX, plotY):GetPlotCity()
	if (not city) then return end
	if city:GetReligiousMajority() <= 0 then return end
	if city:GetReligiousMajority() ~= player:GetStateReligion() then return end
	for building in GameInfo.Buildings("EnablePietyFromConquests = 1") do
		if player:HasBuilding(building.ID) then
			local rewardPiety = player:CalculatePietyYield(city:GetPopulation()*2)
			player:ChangePiety(rewardPiety)
			if player:IsHuman() then
				Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(plotX, plotY))), Locale.ConvertTextKey("[COLOR_JFD_PIETY]+{1_Num}[ENDCOLOR] [ICON_JFD_PIETY]", rewardPiety), true)
			end
		end
	end
	local religionID = player:GetStateReligion()
	for row in GameInfo.Belief_JFD_PietyYieldChanges("OnCityCaptured == 1") do
		if Game.BeliefIsInReligion(religionID, GameInfoTypes[row.BeliefType]) then
			local rewardPiety = player:CalculatePietyYield((row.Yield*city:GetPopulation()))
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
if userSettingRTPPietyCore then
	GameEvents.CityCaptureComplete.Add(JFD_RTP_Piety_FromCityCaptured)
end

--JFD_RTP_Piety_FromCityConstructed
function JFD_RTP_Piety_FromCityConstructed(playerID, cityID, buildingID, isGold, isFaith)
	local player = Players[playerID]
	local building = GameInfo.Buildings[buildingID]
	local buildingClassID = GameInfoTypes[building.BuildingClass]
	local buildingClass = GameInfo.BuildingClasses[buildingClassID]
	local city = player:GetCityByID(cityID)
	if ((buildingClass.MaxGlobalInstances == -1 or buildingClass.MaxPlayerInstances == -1) and (not isGold) and (not isFaith)) then
		for row in GameInfo.Beliefs("FaithFromConstruction = 1") do
			if city:HasBelief(row.ID) then
				local rewardFaith = (city:GetBaseYieldRate(yieldFaithID)*0.5)
				if rewardFaith > 0 then
					player:ChangeFaith(rewardFaith)
					if player:IsHuman() then
						local hex = ToHexFromGrid(Vector2(plotX, plotY))
						Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_WHITE]+{1_Num}[ENDCOLOR] [ICON_PEACE]", rewardFaith), true)
					end
					break
				end
			end
		end
	end
	if (not player:HasStateReligion()) then return end
	local religionID = player:GetStateReligion()
	local buildingQuery = "OnBuildingConstructed"
	if isGold then buildingQuery = "OnBuildingPurchased" end
	for row in GameInfo.Belief_JFD_PietyYieldChanges("OnBuildingClassConstructed = '" .. buildingClass.Type .. "'") do
		if Game.BeliefIsInReligion(religionID, GameInfoTypes[row.BeliefType]) then
			local rewardPiety = player:CalculatePietyYield(row.Yield)
			if rewardPiety > 0 then
				player:ChangePiety(rewardPiety)
				if player:IsHuman() then
					local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_JFD_PIETY]+{1_Num}[ENDCOLOR] [ICON_JFD_PIETY]", rewardPiety), true)
				end
				break
			end
		end
	end
	for row in GameInfo.Belief_JFD_PietyYieldChanges(buildingQuery .. " == 1") do
		if Game.BeliefIsInReligion(religionID, GameInfoTypes[row.BeliefType]) then
			local rewardPiety = 0
			if (row.RequiresAnyGreatWorkSlot and building.GreatWorkCount > 0) then
				rewardPiety = player:CalculatePietyYield(row.Yield)
			end
			if (row.RequiresGreatWorkSlotType and building.GreatWorkSlotType == row.RequireGreatWorkType) then
				rewardPiety = player:CalculatePietyYield(row.Yield)
			end
			if (row.RequiresAnySpecialistType and building.SpecialistCount > 0) then
				rewardPiety = player:CalculatePietyYield(row.Yield)
			end
			if (row.RequiresSpecialistType and building.SpecialistType == row.RequiresSpecialistType) then
				rewardPiety = player:CalculatePietyYield(row.Yield)
			end
			if (row.RequiresWonder and (buildingClass.MaxGlobalInstances == 1 or buildingClass.MaxPlayerInstances == 1)) then
				rewardPiety = player:CalculatePietyYield(row.Yield)
			end
			if rewardPiety > 0 then
				player:ChangePiety(rewardPiety)
				if player:IsHuman() then
					local city = player:GetCityByID(cityID)
					local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_JFD_PIETY]+{1_Num}[ENDCOLOR] [ICON_JFD_PIETY]", rewardPiety), true)
				end
			end
		end
	end
end
if userSettingRTPPietyCore then
	GameEvents.CityConstructed.Add(JFD_RTP_Piety_FromCityConstructed)
end

--JFD_RTP_Piety_FromCityInvested
function JFD_RTP_Piety_FromCityInvested(playerID, cityID, buildingID, value)
	local player = Players[playerID]
	if (not player:HasStateReligion()) then return end
	local religionID = player:GetStateReligion()
	for row in GameInfo.Belief_JFD_PietyYieldChanges("OnBuildingPurchased == 1") do
		if Game.BeliefIsInReligion(religionID, GameInfoTypes[row.BeliefType]) then
			local rewardPiety = player:CalculatePietyYield(row.Yield)
			if rewardPiety > 0 then
				player:ChangePiety(rewardPiety)
				if player:IsHuman() then
					local city = player:GetCityByID(cityID)
					local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_JFD_PIETY]+{1_Num}[ENDCOLOR] [ICON_JFD_PIETY]", rewardPiety), true)
				end
				break
			end
		end
	end	
end
if (userSettingRTPPietyCore and (userSettingCIDInvestmentsCore or isUsingCBP)) then
	GameEvents.CityInvestedBuilding.Add(JFD_RTP_Piety_FromCityInvested)
end

--JFD_RTP_Piety_FromCityTrained
function JFD_RTP_Piety_FromCityTrained(playerID, cityID, unitID, isGold, isFaith)
	local player = Players[playerID]
	if (not player:HasStateReligion()) then return end
	local religionID = player:GetStateReligion()
	local unit = player:GetUnitByID(unitID)
	if (isFaith and unit:IsCombatUnit()) then
		for row in GameInfo.Belief_JFD_PietyYieldChanges("OnMilitaryUnitFaithPurchased == 1") do
			if Game.BeliefIsInReligion(religionID, GameInfoTypes[row.BeliefType]) then
				local rewardPiety = player:CalculatePietyYield(row.Yield)
				if rewardPiety > 0 then
					player:ChangePiety(rewardPiety)
					if player:IsHuman() then
						local city = player:GetCityByID(cityID)
						local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
						Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_JFD_PIETY]+{1_Num}[ENDCOLOR] [ICON_JFD_PIETY]", rewardPiety), true)
					end
					break
				end
			end
		end	
	end
end
if userSettingRTPPietyCore then
	GameEvents.CityTrained.Add(JFD_RTP_Piety_FromCityTrained)
end

--JFD_RTP_Piety_FromGoldenAge
function JFD_RTP_Piety_FromGoldenAge(playerID, isStart, turns)
	if (not isStart) then return end
	local player = Players[playerID]
	if (not player:HasStateReligion()) then return end
	local religionID = player:GetStateReligion()
	for row in GameInfo.Belief_JFD_PietyYieldChanges("OnGoldenAgeBegins == 1") do
		if Game.BeliefIsInReligion(religionID, GameInfoTypes[row.BeliefType]) then
			local rewardPiety = (player:CalculatePietyYield(row.Yield)*turns)
			if rewardPiety > 0 then
				player:ChangePiety(rewardPiety)
				if player:IsHuman() then
					Events.GameplayAlertMessage(Locale.ConvertTextKey("[COLOR_JFD_PIETY]+{1_Num}[ENDCOLOR] [ICON_JFD_PIETY]Piety from a new [ICON_GOLDEN_AGE] Golden Age!", rewardPiety))
				end
				break
			end
		end
	end
end
if userSettingRTPPietyCore then
	GameEvents.PlayerGoldenAge.Add(JFD_RTP_Piety_FromGoldenAge)
end

--JFD_RTP_Piety_FromInnovationTriggered
function JFD_RTP_Piety_FromInnovationTriggered(playerID, techID)
	local player = Players[playerID]
	if (not player:HasStateReligion()) then return end
	local religionID = player:GetStateReligion()
	for row in GameInfo.Belief_JFD_PietyYieldChanges("OnInnovationTriggered == 1") do
		if Game.BeliefIsInReligion(religionID, GameInfoTypes[row.BeliefType]) then
			local maxInnovations = player:GetNumInnovations(Teams[player:GetTeam()]:GetTeamTechs(), techID)
			local rewardPiety = Game.GetRound(player:CalculatePietyYield(row.Yield)/maxInnovations)
			if rewardPiety > 0 then
				player:ChangePiety(rewardPiety)
				if player:IsHuman() then
					Events.GameplayAlertMessage(Locale.ConvertTextKey("[COLOR_JFD_PIETY]+{1_Num}[ENDCOLOR] [ICON_JFD_PIETY]Piety from a new [ICON_JFD_INNOVATION] Innovation!", rewardPiety))
				end
				break
			end
		end
	end
end
if userSettingRTPPietyCore then
	LuaEvents.JFD_InnovationTriggered.Add(JFD_RTP_Piety_FromInnovationTriggered)
end

--JFD_RTP_Piety_FromPolicyAdopted
function JFD_RTP_Piety_FromPolicyAdopted(playerID, policyID)
	local player = Players[playerID]
	if (not player:HasStateReligion()) then return end
	local religionID = player:GetStateReligion()
	for row in GameInfo.Belief_JFD_PietyYieldChanges("OnPolicyAdopted == 1") do
		if Game.BeliefIsInReligion(religionID, GameInfoTypes[row.BeliefType]) then
			local rewardPiety = player:CalculatePietyYield(row.Yield)
			if rewardPiety > 0 then
				player:ChangePiety(rewardPiety)
				if player:IsHuman() then
					Events.GameplayAlertMessage(Locale.ConvertTextKey("[COLOR_JFD_PIETY]+{1_Num}[ENDCOLOR] [ICON_JFD_PIETY] Piety from a new [ICON_CULTURE] Social Policy!", rewardPiety))
				end
				break
			end
		end
	end	
end
if userSettingRTPPietyCore then
	GameEvents.PlayerAdoptPolicy.Add(JFD_RTP_Piety_FromPolicyAdopted)
	GameEvents.PlayerAdoptPolicyBranch.Add(JFD_RTP_Piety_FromPolicyAdopted)
end

--JFD_RTP_Piety_FromReformPassed
function JFD_RTP_Piety_FromReformPassed(playerID, reformID, isFree)
	if GameInfo.JFD_Reforms[reformID].Alignment == "REFORM_CENTRE" then return end
	local player = Players[playerID]
	if (not player:HasStateReligion()) then return end
	local religionID = player:GetStateReligion()
	for row in GameInfo.Belief_JFD_PietyYieldChanges("OnReformPassed == 1") do
		if Game.BeliefIsInReligion(religionID, GameInfoTypes[row.BeliefType]) then
			local rewardPiety = player:CalculatePietyYield(row.Yield)
			if rewardPiety > 0 then
				player:ChangePiety(rewardPiety)
				if player:IsHuman() then
					Events.GameplayAlertMessage(Locale.ConvertTextKey("[COLOR_JFD_PIETY]+{1_Num}[ENDCOLOR] [ICON_JFD_PIETY] Piety from a new [ICON_JFD_REFORM] Reform!", rewardPiety))
				end
				break
			end
		end
	end	
end
if userSettingRTPPietyCore then
	LuaEvents.JFD_ReformPassed.Add(JFD_RTP_Piety_FromReformPassed)
end

--JFD_RTP_Piety_FromTechDiscovered
function JFD_RTP_Piety_FromTechDiscovered(teamID, techID)
	local playerID = Teams[teamID]:GetLeaderID()
	local player = Players[playerID]
	if (not player:HasStateReligion()) then return end
	local religionID = player:GetStateReligion()
	for row in GameInfo.Belief_JFD_PietyYieldChanges("OnTechDiscovered == 1") do
		if Game.BeliefIsInReligion(religionID, GameInfoTypes[row.BeliefType]) then
			local rewardPiety = player:CalculatePietyYield(row.Yield)
			if rewardPiety > 0 then
				player:ChangePiety(rewardPiety)
				if player:IsHuman() then
					Events.GameplayAlertMessage(Locale.ConvertTextKey("[COLOR_JFD_PIETY]+{1_Num}[ENDCOLOR] [ICON_JFD_PIETY] Piety from a new [ICON_TECH] Technology!", rewardPiety))
				end
				break
			end
		end
	end	
end
if userSettingRTPPietyCore then
	GameEvents.TeamTechResearched.Add(JFD_RTP_Piety_FromTechDiscovered)
end

--JFD_RTP_Piety_FromTilePurchased
function JFD_RTP_Piety_FromTilePurchased(playerID, cityID, plotX, plotY, isGold, isCulture)
	local player = Players[playerID]
	if (not player:HasStateReligion()) then return end
	local religionID = player:GetStateReligion()
	local tileQuery = "OnTileAcquired"
	if isGold then tileQuery = "OnTilePurchased" end
	for row in GameInfo.Belief_JFD_PietyYieldChanges(tileQuery .. " == 1") do
		if Game.BeliefIsInReligion(religionID, GameInfoTypes[row.BeliefType]) then
			local rewardPiety = player:CalculatePietyYield(row.Yield)
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
if userSettingRTPPietyCore then
	GameEvents.CityBoughtPlot.Add(JFD_RTP_Piety_FromTilePurchased)
end

--JFD_RTP_Piety_FromUnitCreated
local unitMissionaryID = GameInfoTypes["UNIT_MISSIONARY"]
function JFD_RTP_Piety_FromUnitCreated(playerID, unitID, unitTypeID, plotX, plotY)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local unitClassType = GameInfo.Units[unitTypeID].Class
	local hasStateReligion = player:HasStateReligion()
	if (unitClassType == "UNITCLASS_PROPHET"  and (not player:IsHuman())) then
		if player:GetReligionCreatedByPlayer() <= 0 then
			local stateReligionChance = player:GetStateReligionChance()
			if (stateReligionChance > 0 and Game.GetRandom(1,100) <= stateReligionChance) then
				player:InitUnit(unitMissionaryID, plotX, plotY)
				player:InitUnit(unitMissionaryID, plotX, plotY)
				player:ChangePiety(100)
				unit:greatperson()
			end
		end
		if player:HasEnhancedReligion() then
			if (not player:HasPolicy(policyReformationID)) then
				LuaEvents.JFD_RTP_Piety_ReformationStarted(playerID, unit)
			end
		end
		if hasStateReligion then
			if player:GetPietyLevel() < pietyLevelNeutralID then
				LuaEvents.JFD_RTP_Piety_DeclareRepentance(playerID, unit)
			end
		end
	end	
	if (not hasStateReligion) then return end
	local religionID = player:GetStateReligion()
	for row in GameInfo.Belief_JFD_PietyYieldChanges("OnUnitClassCreated == '" .. unitClassType .. "'") do
		if Game.BeliefIsInReligion(religionID, GameInfoTypes[row.BeliefType]) then
			local rewardPiety = player:CalculatePietyYield(row.Yield)
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
if userSettingRTPPietyCore then
	GameEvents.UnitCreated.Add(JFD_RTP_Piety_FromUnitCreated)
end

--JFD_RTP_Piety_FromUnitExpended
function JFD_RTP_Piety_FromUnitExpended(playerID, unitID, unitTypeID, plotX, plotY)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local unitClassType = GameInfo.Units[unitTypeID].Class
	if (player:GetReligionCreatedByPlayer() <= 0 and unitClassType == "UNITCLASS_PROPHET") then
		JFDLC_ProphetName[playerID] = unit:GetNameNoDesc()
	end	
	if (not player:HasStateReligion()) then return end
	local religionID = player:GetStateReligion()
	for row in GameInfo.Belief_JFD_PietyYieldChanges("OnUnitClassExpended == '" .. unitClassType .. "'") do
		if Game.BeliefIsInReligion(religionID, GameInfoTypes[row.BeliefType]) then
			local rewardPiety = player:CalculatePietyYield(row.Yield)
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
	for row in GameInfo.Belief_JFD_PietyYieldChanges("OnAnyGreatPersonExpended == 1") do
		if Game.BeliefIsInReligion(religionID, GameInfoTypes[row.BeliefType]) then
			local rewardPiety = player:CalculatePietyYield(row.Yield)
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
if userSettingRTPPietyCore then
	GameEvents.GreatPersonExpended.Add(JFD_RTP_Piety_FromUnitExpended)
end

--JFD_RTP_Piety_FromUnitKilled
function JFD_RTP_Piety_FromUnitKilled(playerID, unitID, unitTypeID, plotX, plotY, isDelay, killingPlayerID)
	if (playerID == -1 or killingPlayerID == -1) then return end
	if playerID == killingPlayerID then return end
	if (not isDelay) then return end
	local player = Players[killingPlayerID]
	if (not player:HasStateReligion()) then return end
	local unit = Players[playerID]:GetUnitByID(unitID)
	local unitLevel = unit:GetLevel()
	if (playerID ~= killingPlayerID and player:HasStateReligion()) then
		local religionID = player:GetStateReligion()
		for row in GameInfo.Belief_JFD_PietyYieldChanges("OnUnitKilled == 1") do
			if Game.BeliefIsInReligion(religionID, GameInfoTypes[row.BeliefType]) then
				local rewardPiety = (player:CalculatePietyYield(row.Yield, true)*unitLevel)
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
end
if userSettingRTPPietyCore then
	GameEvents.UnitPrekill.Add(JFD_RTP_Piety_FromUnitKilled)
end

--JFD_RTP_Piety_FromUnitPromoted
function JFD_RTP_Piety_FromUnitPromoted(playerID, unitID, promotionID)
	local player = Players[playerID]
	if (not player:HasStateReligion()) then return end
	local religionID = player:GetStateReligion()
	for row in GameInfo.Belief_JFD_PietyYieldChanges("OnUnitPromoted == 1") do
		if Game.BeliefIsInReligion(religionID, GameInfoTypes[row.BeliefType]) then
			local unit = player:GetUnitByID(unitID)
			local rewardPiety = (player:CalculatePietyYield(row.Yield)*unit:GetLevel())
			if rewardPiety > 0 then
				player:ChangePiety(rewardPiety)
				if player:IsHuman() then
					local unit = player:GetUnitByID(unitID)
					local hex = ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_JFD_PIETY]+{1_Num}[ENDCOLOR] [ICON_JFD_PIETY]", rewardPiety), true)
				end
				break
			end
		end
	end	
end
if userSettingRTPPietyCore then
	GameEvents.UnitPromoted.Add(JFD_RTP_Piety_FromUnitPromoted)
end

--JFD_RTP_Piety_FromWorkerChargeExpended
function JFD_RTP_Piety_FromWorkerChargeExpended(playerID, unitID, plotX, plotY)
	local player = Players[playerID]
	if (not player:HasStateReligion()) then return end
	local religionID = player:GetStateReligion()
	for row in GameInfo.Belief_JFD_PietyYieldChanges("OnWorkerChargeExpended == 1") do
		if Game.BeliefIsInReligion(religionID, GameInfoTypes[row.BeliefType]) then
			local rewardPiety = player:CalculatePietyYield(row.Yield)
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
if userSettingRTPPietyCore then
	LuaEvents.JFD_WorkerChargeExpended.Add(JFD_RTP_Piety_FromWorkerChargeExpended)
end

--JFD_RTP_Piety_FromWLTKD
function JFD_RTP_Piety_FromWLTKD(playerID, city, plotX, plotY, turns)
	local player = Players[playerID]
	if (not player:HasStateReligion()) then return end
	local religionID = player:GetStateReligion()
	for row in GameInfo.Belief_JFD_PietyYieldChanges("OnWLTKD == 1") do
		if Game.BeliefIsInReligion(religionID, GameInfoTypes[row.BeliefType]) then
			local rewardPiety = (player:CalculatePietyYield(row.Yield)*turns)
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
if userSettingRTPPietyCore then
	GameEvents.CityBeginsWLTKD.Add(JFD_RTP_Piety_FromWLTKD)
	LuaEvents.JFD_WLTKDBegins.Add(JFD_RTP_Piety_FromWLTKD)
end
------------------------------------------------------------------------------------------------------------------------
-- BELIEFS
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Piety_Beliefss_PlayerDoTurn
local beliefGodMonumentsID   = GameInfoTypes["BELIEF_MONUMENT_GODS"]
local beliefGodMonumentsRate = GameInfo.Beliefs["BELIEF_MONUMENT_GODS"].FaithModifierDuringWonderConstruction
function JFD_RTP_Piety_Beliefss_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if (not player:HasBelief(beliefGodMonumentsID)) then return end
	for city in player:Cities() do
		if city:HasBelief(beliefGodMonumentsID) then
			local currentBuildingID = city:GetProductionBuilding()
			if (currentBuildingID ~= -1 and GameInfo.Buildings[currentBuildingID].Quote) then
				city:SetYieldModifierFromDevelopment(yieldFaithID, beliefGodMonumentsRate)	
			else
				city:SetYieldModifierFromDevelopment(yieldFaithID, 0)
			end
		else
			city:SetYieldModifierFromDevelopment(yieldFaithID, 0)
		end
	end
end
if userSettingRTPPietyMonumentGods then
	GameEvents.PlayerDoTurn.Add(JFD_RTP_Piety_Beliefss_PlayerDoTurn)
end
------------------------------------------------------------------------------------------------------------------------
-- CIVILIZATIONS
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Piety_SacrificialCaptives_UnitPrekill
local traitAztecsID = GameInfoTypes["TRAIT_JFD_AZTECS"]
function JFD_RTP_Piety_SacrificialCaptives_UnitPrekill(playerID, unitID, unitTypeID, plotX, plotY, isDelay, killingPlayerID)
	if (playerID == -1 or killingPlayerID == -1) then return end
	if playerID == killingPlayerID then return end
	if (not isDelay) then return end
	local player = Players[killingPlayerID]
	if (not player:HasTrait(traitAztecsID)) then return end
	if (not player:HasStateReligion()) then return end
	local unit = Players[playerID]:GetUnitByID(unitID)
	local pietyReward = player:CalculatePietyYield(unit:GetLevel())
	if pietyReward > 0 then
		player:ChangePiety(pietyReward)
		if player:IsHuman() then
			local hex = ToHexFromGrid(Vector2(plotX, plotY))
			Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_JFD_PIETY]+{1_Num}[ENDCOLOR] [ICON_JFD_PIETY]", pietyReward), true)
		end
	end
end
if userSettingRTPPietyAztecs then
	GameEvents.UnitPrekill.Add(JFD_RTP_Piety_SacrificialCaptives_UnitPrekill)
end

--JFD_RTP_Piety_Aztec_SacrificialCaptives_PlayerDoTurn
function JFD_RTP_Piety_Aztec_SacrificialCaptives_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if (not player:HasTrait(traitAztecsID)) then return end
	if (not player:HasStateReligion()) then return end
	if player:GetPietyLevel() == pietyLevelDevoutID then
		local playerCapital = player:GetCapitalCity()
		if playerCapital:GetWeLoveTheKingDayCounter() == 0 then
			playerCapital:ChangeWeLoveTheKingDayCounter(2)
		elseif playerCapital:GetWeLoveTheKingDayCounter() == 1 then
			playerCapital:ChangeWeLoveTheKingDayCounter(1)
		end
	end
end
if userSettingRTPPietyAztecs then
	GameEvents.PlayerDoTurn.Add(JFD_RTP_Piety_Aztec_SacrificialCaptives_PlayerDoTurn)
end

-- JFD_RTP_Piety_Byzantium_PatriarchOfConstantinople_TeamTechResearched
local techTheologyID   = GameInfoTypes["TECH_THEOLOGY"]
local traitByzantiumID = GameInfoTypes["TRAIT_JFD_BYZANTIUM"]
local unitProphetID	   = GameInfoTypes["UNIT_PROPHET"]
function JFD_RTP_Piety_Byzantium_PatriarchOfConstantinople_TeamTechResearched(teamID, techID)
	local playerID = Teams[teamID]:GetLeaderID()
	local player = Players[playerID] 
	if (not player:IsAlive()) then return end
	if (not player:HasTrait(player, traitByzantiumID)) then return end
	if techID ~= techTheologyID then return end
	local capital = player:GetCapitalCity()
	player:InitUnit(unitProphetID, capital:GetX(), capital:GetY())
end
if userSettingRTPPietyBeliefMissions then
	GameEvents.TeamTechResearched.Add(JFD_RTP_Piety_Byzantium_PatriarchOfConstantinople_TeamTechResearched)
end
------------------------------------------------------------------------------------------------------------------------
-- GREAT PEOPLE
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Piety_GreatWorkCreated
local unitClassProphetID = GameInfoTypes["UNITCLASS_PROPHET"]
function JFD_RTP_Piety_GreatWorkCreated(playerID, unitID, greatWorkID)
	local player = Players[playerID]
	if (not player:IsHuman()) then return end
	local unit = player:GetUnitByID(unitID)
	if unit:GetUnitClassType() ~= unitClassProphetID then return end
	local descGreatWork = GameInfo.GreatWorks[greatWorkID].Description
	local hex = ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))
	Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("{1_Num} [ICON_GREAT_WORK]", descGreatWork), true)
	Events.GameplayFX(hex.x, hex.y, -1)
	Events.AudioPlay2DSound("AS2D_UNIT_GREAT_PROPHET_ACTIVATE")
end
if userSettingRTPPietyProphetArtifacts then
	--GameEvents.GreatWorkCreated.Add(JFD_RTP_Piety_GreatWorkCreated)
end

--JFD_RTP_Piety_GreatProphet_UnitCanHaveGreatWork
local missionCreateGreatWorkID = GameInfoTypes["MISSION_CREATE_GREAT_WORK"]
function JFD_RTP_Piety_GreatProphet_UnitCanHaveGreatWork(playerID, unitID, missionID)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if (unit:GetUnitClassType() == unitClassProphetID and missionID ~= missionCreateGreatWorkID) then 
		return false
		--return player:GetPietyLevel() == pietyLevelDevoutID
	end
	return true
end
if userSettingRTPPietyProphetArtifacts then
	GameEvents.UnitCanHaveGreatWork.Add(JFD_RTP_Piety_GreatProphet_UnitCanHaveGreatWork)
end

--JFD_RTP_Piety_ReformationStarted
local policyReformationID = GameInfoTypes["POLICY_JFD_REFORMATION"]
function JFD_RTP_Piety_ReformationStarted(playerID, unit)
	local player = Players[playerID]
	player:GrantPolicy(policyReformationID, true)
	unit:greatperson()
end	
if userSettingRTPPietyProphetArtifacts then
	LuaEvents.JFD_RTP_Piety_ReformationStarted.Add(JFD_RTP_Piety_ReformationStarted)
end

--JFD_RTP_Piety_DeclareRepentance
function JFD_RTP_Piety_DeclareRepentance(playerID, unit)
	local player = Players[playerID]
	local rewardPiety = (defaultMaxPietyRate-player:GetPiety())
	if rewardPiety > 0 then
		player:ChangePiety(rewardPiety)
		if player:IsHuman() then
			local hex = ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))
			Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_JFD_PIETY]+{1_Num}[ENDCOLOR] [ICON_JFD_PIETY]", rewardPiety), true)
		end
	end
	unit:greatperson()
end	
if userSettingRTPPietyProphetArtifacts then
	LuaEvents.JFD_RTP_Piety_RepentanceDeclared.Add(JFD_RTP_Piety_DeclareRepentance)
end
-------------------
-- MISSION
-------------------
local missionGreatGeneralID = GameInfoTypes["MISSION_JFD_CONVERT_GREAT_GENERAL"]
local missionReformationID  = GameInfoTypes["MISSION_JFD_START_REFORMATION"]
local missionRepentanceID   = GameInfoTypes["MISSION_JFD_DECLARE_REPENTANCE"]

--JFD_RTP_Piety_CustomMissionStart
function JFD_RTP_Piety_CustomMissionStart(playerID, unitID, missionID, data1, data2, flags, turn)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if missionID == missionGreatGeneralID then
		local unitGreatGeneralID = player:GetSpecificUnitType("UNITCLASS_GREAT_GENERAL")
		player:InitUnit(unitGreatGeneralID, unit:GetX(), unit:GetY())
		unit:greatperson()
		return CUSTOM_MISSION_ACTION
	elseif missionID == missionReformationID then
		LuaEvents.JFD_RTP_Piety_ReformationStarted(playerID, unit)
		return CUSTOM_MISSION_ACTION
	elseif missionID == missionRepentanceID then
		LuaEvents.JFD_RTP_Piety_RepentanceDeclared(playerID, unit)
		return CUSTOM_MISSION_ACTION
	end
	return CUSTOM_MISSION_NO_ACTION
end
GameEvents.CustomMissionStart.Add(JFD_RTP_Piety_CustomMissionStart)

--JFD_RTP_Piety_CustomMissionCompleted
function JFD_RTP_Piety_CustomMissionCompleted(playerID, unitID, missionID, data1, data2, flags, turn)
    local player = Players[playerID]
    if missionID == missionGreatGeneralID 
	or missionID == missionReformationID 
	or missionID == missionRepentanceID then 
	return true end
	return false
end
GameEvents.CustomMissionCompleted.Add(JFD_RTP_Piety_CustomMissionCompleted)
------------------------------------------------------------------------------------------------------------------------
-- POLICIES
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Piety_CityTrained
function JFD_RTP_Piety_CityTrained(playerID, cityID, unitID, isGold, isFaithOrCulture)
	if (not isFaithOrCulture) then return end
	local player = Players[playerID]
	if (not player:HasStateReligion()) then return end
	local unit = player:GetUnitByID(unitID)
	if (unit:GetUnitClassType() == unitClassMissionaryID or unit:GetUnitClassType() == unitClassInquisitorID or unit:GetUnitClassType() == unitClassProphetID) then
		for row in GameInfo.Policies("PietyFromReligiousUnitPurchase > 0") do
			if player:HasPolicy(row.ID) then
				local rewardPiety = player:CalculatePietyYield(row.PietyFromReligiousUnitPurchase)
				if rewardPiety > 0 then
					player:ChangePiety(rewardPiety)
					if player:IsHuman() then
						local city = player:GetCityByID(cityID)
						local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
						Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_JFD_PIETY]+{1_Num}[ENDCOLOR] [ICON_JFD_PIETY]", rewardPiety), true)
					end
				end
			end
		end	
	end
end
if userSettingRTPPietyPolicies then
	GameEvents.CityTrained.Add(JFD_RTP_Piety_CityTrained)
end

--JFD_RTP_Piety_PlayerAdoptPolicy
local policyTheocracyID	 = GameInfoTypes["POLICY_THEOCRACY"]
local policySyncretismID = GameInfoTypes["POLICY_FREE_RELIGION"]
function JFD_RTP_Piety_PlayerAdoptPolicy(playerID, policyID)
	local player = Players[playerID]
	if player:GetReligionCreatedByPlayer() > 0 then return end
	if Game.GetNumReligionsStillToFound() > 0  then return end
	if ((policyID == policySyncretismID and player:HasPolicy(policyTheocracyID)) or (policyID == policyTheocracyID and player:HasPolicy(policySyncretismID))) then
		local capital = player:GetCapitalCity()
		local unitProphetID = player:GetSpecificUnitType("UNITCLASS_PROPHET")
		player:InitUnit(unitProphetID, capital:GetX(), capital:GetY())
	end
end
if userSettingRTPPietyPolicies then
	GameEvents.PlayerAdoptPolicy.Add(JFD_RTP_Piety_PlayerAdoptPolicy)
end
------------------------------------------------------------------------------------------------------------------------
-- PROCESSES
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Piety_CityCanMaintain
local processPietyID = GameInfoTypes["PROCESS_JFD_PIETY"]
function JFD_RTP_Piety_CityCanMaintain(playerID, cityID, processID)
	local player = Players[playerID]
	if processID ~= processPietyID then return true end
	if (not player:HasStateReligion()) then return false end
	if player:HasSecularized() then return false end
	local city = player:GetCityByID(cityID)
	if city:IsPuppet() then return false end
	if city:GetReligiousMajority() == player:GetStateReligion() then return false end
	return true
end
if processPietyID then
	GameEvents.CityCanMaintain.Add(JFD_RTP_Piety_CityCanMaintain)
end
------------------------------------------------------------------------------------------------------------------------
-- RESOLUTIONS
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Piety_ResolutionPassed
local resolutionSecularizationID = GameInfoTypes["RESOLUTION_JFD_SECULARIZATION"]
function JFD_RTP_Piety_ResolutionPassed(resolutionID, proposerID, choiceID, isEnact, isPassed)
	if resolutionID ~= resolutionSecularizationID then return end
	if (not isPassed) then return end
	for otherPlayerID = 0, defineMaxMajorCivs - 1 do 
		local otherPlayer = Players[otherPlayerID]
		if (otherPlayer:IsAlive() and otherPlayer:HasStateReligion() and otherPlayer:GetGovernment() ~= governmentTheocracyID) then
			otherPlayer:SetHasSecularized(true)
		end
	end
end
if resolutionSecularizationID then
	GameEvents.ResolutionResult.Add(JFD_RTP_Piety_ResolutionPassed)
end
------------------------------------------------------------------------------------------------------------------------
-- VICTORIES
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Piety_PlayerDoTurn_ReligiousVictory
local victoryReligiousID   = GameInfoTypes["VICTORY_JFD_RELIGIOUS"]
function JFD_RTP_Piety_PlayerDoTurn_ReligiousVictory(playerID)
	local playerID = playerID or activePlayerID
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (not player:HasCreatedReligion()) then return end
	if (not player:HasStateReligion()) then return end
	if player:HasMetReligiousVictoryConditions() then
		g_EVCReligiousVictoryWon = true
		Game.SetWinner(player:GetTeam(), victoryReligiousID);
	end
	-- if ((g_EVCReligiousSpread[eReligion] >= 70) and (g_EVCReligiousFollowers[eReligion] >= g_EVCMaxFollowers) and (g_EVCReligiousHolyCities[eReligion] == g_EVCMaxHolyCities)) then
end
if userSettingRTPPietyReligiousVictory then
	GameEvents.PlayerDoTurn.Add(JFD_RTP_Piety_PlayerDoTurn_ReligiousVictory)
end	
--=======================================================================================================================
--=======================================================================================================================