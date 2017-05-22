-- JFD_RTP_Piety_Functions
-- Author: JFD
-- DateCreated: 10/14/2015 7:37:23 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("FLuaVector.lua")
include("JFD_PietyUtils.lua")
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
local defineMaxMajorCivs 		  = GameDefines["MAX_MAJOR_CIVS"]
local defineMaxMinorCivs 		  = GameDefines["MAX_MINOR_CIVS"]
local definePietyGiftMedium 	  = GameDefines["MINOR_JFD_PIETY_GIFT_MEDIUM"]
local definePietyGiftMediumReward = GameDefines["MINOR_JFD_PIETY_GIFT_MEDIUM_REWARD"]
--=======================================================================================================================
-- MOD USE
--=======================================================================================================================
local isUsingCBP = JFD_IsUsingCBP()
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingInvestmentsCore		= JFD_GetUserSetting("JFD_CID_INVESTMENTS_CORE") == 1
local userSettingPietyCore				= JFD_GetUserSetting("JFD_RTP_PIETY_CORE") == 1
local userSettingPietyPolicies			= JFD_GetUserSetting("JFD_RTP_PIETY_POLICY_CHANGES") == 1
local userSettingPietyProphetArtifacts	= JFD_GetUserSetting("JFD_RTP_PIETY_GREAT_PROPHET_ARTIFACTS") == 1
local userSettingSovereigntyCore		= JFD_GetUserSetting("JFD_RTP_SOVEREIGNTY_CORE") == 1
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local activePlayerID 	= Game.GetActivePlayer()
local activePlayer 		= Players[activePlayerID]
local activePlayerTeam 	= Teams[activePlayer:GetTeam()]
local convertTextKey 	= Locale.ConvertTextKey
local gameSpeed			= GameInfo.GameSpeeds[Game.GetGameSpeedType()]
local gameSpeedMod		= (gameSpeed.BuildPercent/100)
local gameSpeedType 	= gameSpeed.Type 
local mathCeil			= math.ceil

local defaultTurnsBetweenConversion = GameDefines["JFD_RTP_PIETY_AI_TURNS_BETWEEN_CONVERSION"]
local defaultMaxPietyRate   = 100
local defaultRestingRateMod = 0
for row in GameInfo.GameSpeed_JFD_PietyThresholds("GameSpeedType = '" .. gameSpeedType .. "'") do
	defaultMaxPietyRate   = row.MaxThreshold
	defaultRestingRateMod = row.RestingRateMod
	break
end

local unitClassInquisitorID = GameInfoTypes["UNITCLASS_INQUISITOR"]
local unitClassMissionaryID = GameInfoTypes["UNITCLASS_MISSIONARY"]
local unitClassProphetID    = GameInfoTypes["UNITCLASS_PROPHET"]
--=======================================================================================================================
-- AI FUNCTIONS
--=======================================================================================================================
-- PIETY
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Piety_AICityStateInfluence
local pietyLevelVirtuousID = GameInfoTypes["PIETY_LEVEL_JFD_VIRTUOUS"]
function JFD_RTP_Piety_AICityStateInfluence(playerID)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	if player:IsHuman() then return end
	if player:IsBarbarian() then return end
	if player:IsMinorCiv() then return end
	if (not player:HasStateReligion()) then return end
	if JFD_GetPietyLevelID(playerID) < pietyLevelVirtuousID then return end
	local flavourDiplomacy = JFD_GetLeaderFlavour(playerID, "FLAVOR_DIPLOMACY")
	if flavourDiplomacy < 6 then return end
	if JFD_GetRandom(1,100) > (flavourDiplomacy*2) then return end
	local cityStatesFriends = {}
	local count = 1
	for minorPlayerID = 0, defineMaxMinorCivs - 1 do
		local minorPlayer = Players[minorPlayerID]
		if (minorPlayer:IsAlive() and playerTeam:IsHasMet(minorPlayer:GetTeam()) and minorPlayer:GetMinorCivFriendshipLevelWithMajor(playerID) >= 1) then
			cityStatesFriends[count] = minorPlayer
		end
	end
	if #cityStatesFriends > 0 then
		local minorCityState = cityStatesFriends[JFD_GetRandom(1,#cityStatesFriends)]
		if (not minorCityState) then return end
		player:ChangePiety(-definePietyGiftMedium)
		minorCityState:ChangeMinorCivFriendshipWithMajor(playerID, definePietyGiftMediumReward)
	end
end
if userSettingPietyCore then
	GameEvents.PlayerDoTurn.Add(JFD_RTP_Piety_AICityStateInfluence)
end
------------------------------------------------------------------------------------------------------------------------
-- STATE RELIGION
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Piety_AIStateReligion
local minorCivTraitReligiousID = MinorCivTraitTypes["MINOR_CIV_TRAIT_RELIGIOUS"]
function JFD_RTP_Piety_AIStateReligion(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (not player:GetCapitalCity()) then return end
	if (player:IsHuman() or player:IsBarbarian()) then return end
	--if (player:IsMinorCiv() and player:GetMinorCivTrait() ~= minorCivTraitReligiousID) then return end
	local stateReligionChance = JFD_GetStateReligionChance(playerID)
	if stateReligionChance == 0 then return end
	if JFD_GetRandom(1,100) <= stateReligionChance then
		local religionID = player:GetMajorityReligion()
		if player:GetNumCities() <= 2 then religionID = player:GetCapitalCity():GetReligiousMajority() end
		if religionID > 0 then player:SetStateReligion(religionID) end
	end
end
if userSettingPietyCore then
	GameEvents.PlayerDoTurn.Add(JFD_RTP_Piety_AIStateReligion)
end

--JFD_RTP_Piety_Priesthood
local techPriesthoodID = GameInfoTypes["TECH_JFD_PRIESTHOOD"]
function JFD_RTP_Piety_Priesthood(playerID, isFreeTech)
	local player = Players[playerID]
	local religionID = player:GetMajorityReligion()
	local createdReligionID = player:GetReligionCreatedByPlayer()
	if ((religionID > 0 or createdReligionID > 0) and techPriesthoodID) then
		return techPriesthoodID
	end
end
if userSettingPietyCore then
	GameEvents.AiOverrideChooseNextTech.Add(JFD_RTP_Piety_Priesthood)
end
------------------------------------------------------------------------------------------------------------------------
-- SECULARIZATION
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Piety_AISecularize
function JFD_RTP_Piety_AISecularize(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (not player:GetCapitalCity()) then return end
	if (player:IsHuman() or player:IsBarbarian() or player:IsMinorCiv()) then return end
	local secularizeChance = JFD_GetSecularizeChance(playerID)
	if secularizeChance <= 0 then return end
	if JFD_GetRandom(1,100) <= secularizeChance then
		player:SetHasSecularized(true)
	end
end
--GameEvents.PlayerDoTurn.Add(JFD_RTP_Piety_AISecularize)
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
-- RELIGION
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Piety_CityConvertsReligion
local notificationReligionSpreadID 		  = NotificationTypes["NOTIFICATION_RELIGION_SPREAD"]
local notificationReligionSpreadNaturalID = NotificationTypes["NOTIFICATION_RELIGION_SPREAD_NATURAL"]
function JFD_RTP_Piety_CityConvertsReligion(notificationType, notificationID)
	if (notificationID == notificationReligionSpreadID or notificationID == notificationReligionSpreadNaturalID) then
		Events.AudioPlay2DSound("AS2D_CITY_CONVERTS_RELIGION")
	end
end
Events.NotificationAdded.Add(JFD_RTP_Piety_CityConvertsReligion)

--JFD_RTP_Piety_OnPantheonFounded
function JFD_RTP_Piety_OnPantheonFounded(playerID)
	if playerID == activePlayerID then
		Events.AudioPlay2DSound("AS2D_JFD_DRUIDISM")
	end
end
GameEvents.PantheonFounded.Add(JFD_RTP_Piety_OnPantheonFounded)

--JFD_RTP_Piety_OnReligionFounded
local gameYear = Game.GetGameTurnYear()
function JFD_RTP_Piety_OnReligionFounded(playerID, holyCityID, religionID, belief1, belief2, belief3, belief4, belief5)
	local player = Players[playerID]
	if JFD_CanAdoptStateReligion(playerID, religionID) then
		if religionID > 0 then player:SetStateReligion(religionID) end
	else
		if playerID == activePlayerID then
			if JFD_CanAdoptAnyStateReligion(playerID) then
				JFD_SendNotification(playerID, "NOTIFICATION_RELIGION_FOUNDED", convertTextKey("TXT_KEY_JFD_STATE_RELIGION_CAN_ADOPT_NOTIFICATION_TEXT"), convertTextKey("TXT_KEY_JFD_STATE_RELIGION_CAN_ADOPT_NOTIFICATION_SHORT_TEXT"), true)
			end
		end
	end
	Game.SetFoundYear(religionID, Game.GetGameTurnYear())
	local religion = GameInfo.Religions[religionID]
	local religionTheme = religion.JFD_ReligionTheme
	if religionTheme then
		Events.AudioPlay2DSound(religionTheme)
	end
end
GameEvents.ReligionFounded.Add(JFD_RTP_Piety_OnReligionFounded)
------------------------------------------------------------------------------------------------------------------------
-- STATE RELIGION
------------------------------------------------------------------------------------------------------------------------
-- JFD_RTP_Piety_Init
function JFD_RTP_Piety_Init()
	for playerID = 0, defineMaxMajorCivs - 1 do
		local player = Players[playerID]
		if (player:IsAlive() and JFD_CanSecularize(playerID)) then
			if (not player:HasStateReligion()) then
				player:SetHasSecularized(true)
			end
		end
	end
end
if userSettingPietyCore then
	Events.LoadScreenClose.Add(JFD_RTP_Piety_Init)
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
				local religion = GameInfo.Religions[religionID]
				local religionTheme = religion.JFD_ReligionTheme
				if religionTheme then
					Events.AudioPlay2DSound(religionTheme)
				end
			else
				if playerID == activePlayerID then
					if JFD_CanAdoptAnyStateReligion(playerID) then
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
			end
		end
	end
	if (player:IsHuman() or player:IsBarbarian()) then return end
	local secularizeChance = JFD_GetSecularizeChance(playerID)
	if secularizeChance <= 0 then return end
	if JFD_GetRandom(1,100) <= secularizeChance then
		player:SetHasSecularized(true)
	end
end
if userSettingPietyCore then
	GameEvents.TeamTechResearched.Add(JFD_RTP_Piety_TeamTechResearched)
end

--JFD_RTP_Piety_OnCityConstructed
function JFD_RTP_Piety_OnCityConstructed(playerID, cityID, buildingID)
	local player = Players[playerID]
	local building = GameInfo.Buildings[buildingID]
	if building.FoundsStateReligion then
		local religionID = player:GetReligionCreatedByPlayer()
		if religionID > 0 then
			player:SetStateReligion(religionID)
			local religion = GameInfo.Religions[religionID]
			local religionTheme = religion.JFD_ReligionTheme
			if religionTheme then
				Events.AudioPlay2DSound(religionTheme)
			end
		else
			if playerID == activePlayerID then
				if JFD_CanAdoptAnyStateReligion(playerID) then
					JFD_SendNotification(playerID, "NOTIFICATION_RELIGION_FOUNDED", convertTextKey("TXT_KEY_JFD_STATE_RELIGION_CAN_ADOPT_NOTIFICATION_TEXT"), convertTextKey("TXT_KEY_JFD_STATE_RELIGION_CAN_ADOPT_NOTIFICATION_SHORT_TEXT"), true)
				end
			end
		end
	end
end
if userSettingPietyCore then
	GameEvents.CityConstructed.Add(JFD_RTP_Piety_OnCityConstructed)
end

--JFD_RTP_Piety_StateReligionAdopted
local governmentTheocracyID = GameInfoTypes["GOVERNMENT_JFD_THEOCRACY"]
function JFD_RTP_Piety_StateReligionAdopted(playerID, religionID)
	if (not religionID) then return end
	if religionID <= -1 then return end
	local player = Players[playerID]
	if activePlayerTeam:IsHasMet(player:GetTeam()) then 
		if playerID == activePlayerID then
			JFD_SendNotification(playerID, "NOTIFICATION_RELIGION_FOUNDED", convertTextKey("TXT_KEY_JFD_STATE_RELIGION_ADOPT_NOTIFICATION_TEXT", Game.GetReligionName(religionID)), convertTextKey("TXT_KEY_JFD_STATE_RELIGION_NOTIFICATION_SHORT_TEXT"), true)
		else
			JFD_SendNotification(playerID, "NOTIFICATION_RELIGION_FOUNDED", convertTextKey("TXT_KEY_JFD_STATE_RELIGION_ADOPT_NOTIFICATION_OTHER_TEXT", player:GetCivilizationShortDescription(), Game.GetReligionName(religionID)), convertTextKey("TXT_KEY_JFD_STATE_RELIGION_NOTIFICATION_SHORT_TEXT"), true)
		end
		local religion = GameInfo.Religions[religionID]
		if religion then
			local religionTheme = religion.JFD_ReligionTheme
			if religionTheme then Events.AudioPlay2DSound(religionTheme) end
		end
	end
	if (not player:IsHuman()) then
		player:SetTurnsSinceConversion(Game.GetGameTurn()+defaultTurnsBetweenConversion)
	end
	player:ChangePiety(defaultMaxPietyRate)
	JFD_RTP_Piety_PietyRate(playerID)
	--JFD_DoPietyFromAdoption(playerID, religionID, nil, false, true)
	if userSettingSovereigntyCore then
		if player:GetGovernment() == governmentTheocracyID then
			local religionType = GameInfo.Religions[religionID].Type
			for row in GameInfo.Religion_JFD_Governments("ReligionType = '" .. religionType .. "' AND LegislatureName IS NOT NULL") do
				legislatureName = row.LegislatureName
				break
			end
			player:SetLegislatureName(legislatureName)
		end
	end
end
if userSettingPietyCore then
	GameEvents.PlayerStateReligionAdopted.Add(JFD_RTP_Piety_StateReligionAdopted)
end

--JFD_RTP_Piety_StateReligionChanged
function JFD_RTP_Piety_StateReligionChanged(playerID, newReligionID, oldReligionID)
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
		local religion = GameInfo.Religions[newReligionID]
		local religionTheme = religion.JFD_ReligionTheme
		if religionTheme then Events.AudioPlay2DSound(religionTheme) end
	end
	if (not player:IsHuman()) then
		player:SetTurnsSinceConversion(Game.GetGameTurn()+defaultTurnsBetweenConversion)
	end
	JFD_RTP_Piety_PietyRate(playerID)
	if player:IsHuman() then
		local pietyLevel = GameInfo.JFD_PietyLevels[JFD_GetPietyLevelID(playerID)]
		local numResistanceTurns = pietyLevel.ChangeResistanceTurns
		if numResistanceTurns > 0 then
			for city in player:Cities() do
				if city:GetReligiousMajority() == oldReligionID then
					city:ChangeResistanceTurns(numResistanceTurns)
				end
			end
			Events.GameplayAlertMessage(convertTextKey("TXT_KEY_JFD_STATE_RELIGION_CHANGED_ANARCHY_ALERT_STATE_RELIGION"))
		end
		local faithCost = mathCeil((pietyLevel.ChangeFaithCost*gameSpeedMod)*player:GetNumCitiesWithStateReligion(oldReligionID))
		if faithCost > 0 then
			player:ChangeFaith(-faithCost)
			Events.GameplayAlertMessage(convertTextKey("TXT_KEY_JFD_STATE_RELIGION_CHANGED_FAITH_ALERT_STATE_RELIGION"))
		end
		Events.SerialEventGameDataDirty()
	end
end
if userSettingPietyCore then
	GameEvents.PlayerStateReligionChanged.Add(JFD_RTP_Piety_StateReligionChanged)
end
----------------
-- SECULARIZATION
----------------
--JFD_RTP_Piety_StateReligionSecularized
function JFD_RTP_Piety_StateReligionSecularized(playerID, religionID, isSecularizes)
	if isSecularizes then
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
				local pietyLevel = GameInfo.JFD_PietyLevels[JFD_GetPietyLevelID(playerID)]
				local numResistanceTurns = pietyLevel.ChangeResistanceTurns
				if numResistanceTurns > 0 then
					for city in player:Cities() do
						if city:GetReligiousMajority() == religionID then
							city:ChangeNumResistanceTurns(numResistanceTurns)
						end
					end
					Events.GameplayAlertMessage(convertTextKey("TXT_KEY_JFD_STATE_RELIGION_CHANGED_ANARCHY_ALERT_SECULARIZE"))
				end
				local faithCost = mathCeil((pietyLevel.ChangeFaithCost*gameSpeedMod)*player:GetNumCitiesWithStateReligion(religionID))
				if faithCost > 0 then
					player:ChangeFaith(-faithCost)
					Events.GameplayAlertMessage(convertTextKey("TXT_KEY_JFD_STATE_RELIGION_CHANGED_FAITH_ALERT_SECULARIZE"))
				end
				Events.SerialEventGameDataDirty()
			end
			player:SetStateReligion(-1)
			player:SetPiety(0)
		end
	end
end
if userSettingPietyCore then
	GameEvents.PlayerSecularizes.Add(JFD_RTP_Piety_StateReligionSecularized)
end
----------------
-- DIPLOMACY
----------------
--JFD_RTP_Piety_DiploModifiers
local diploModHeathenID				= GameInfoTypes["DIPLOMODIFIER_JFD_HEATHEN"]
local diploModHeathenTolerantID		= GameInfoTypes["DIPLOMODIFIER_JFD_HEATHEN_TOLERANT"]
local diploModHighPietyID			= GameInfoTypes["DIPLOMODIFIER_JFD_HIGH_PIETY"]
local diploModLowPietyID			= GameInfoTypes["DIPLOMODIFIER_JFD_LOW_PIETY"]
local pietyLevelDevoutID			= GameInfoTypes["PIETY_LEVEL_JFD_DEVOUT"]
local pietyLevelHereticalID			= GameInfoTypes["PIETY_LEVEL_JFD_HERETICAL"]
function JFD_RTP_Piety_DiploModifiers(diploModifierID, fromPlayerID, toPlayerID)
	local diploModifier = 0
	local fromPlayer = Players[fromPlayerID]
	local fromPlayerHasStateReligion = fromPlayer:HasStateReligion()
	local fromPlayerStateReligionID = fromPlayer:GetStateReligion() or -1
	local fromPlayerReligiousIntolerance = JFD_GetLeaderFlavour(fromPlayerID, "FLAVOR_JFD_RELIGIOUS_INTOLERANCE")
	local toPlayer = Players[toPlayerID]
	local toPlayerIsPagan = toPlayer:IsPagan()
	local toPlayerHasStateReligion = toPlayer:HasStateReligion()
	local toPlayerStateReligionID = toPlayer:GetStateReligion() or -1
	local eraMod = GameInfo.Eras[fromPlayer:GetCurrentEra()].JFD_StateReligionDiploMod
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
			local toPlayerPietyLevel = JFD_GetPietyLevelID(toPlayerID)
			if toPlayerPietyLevel == pietyLevelDevoutID then
				diploModifier = -fromPlayerReligiousIntolerance*eraMod
			end
		end
	end
	--Low Piety
	if diploModifierID == diploModLowPietyID then
		if ((fromPlayerHasStateReligion and toPlayerHasStateReligion) and (fromPlayerStateReligionID == toPlayerStateReligionID)) then
			local toPlayerPietyLevel = JFD_GetPietyLevelID(toPlayerID)
			if toPlayerPietyLevel == pietyLevelHereticalID then
				diploModifier = fromPlayerReligiousIntolerance*eraMod
			end
		end
	end
	return JFD_Round(diploModifier)
end
if userSettingPietyCore then
	GameEvents.GetDiploModifier.Add(JFD_RTP_Piety_DiploModifiers)
end
------------------------------------------------------------------------------------------------------------------------
-- PIETY
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Piety_PietyRate
function JFD_RTP_Piety_PietyRate(playerID)
	local playerID = playerID or activePlayerID
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (not player:HasStateReligion()) then return end
	local pietyRate = JFD_GetPietyRate(playerID)
	if player:GetPietyRate() ~= pietyRate then
		player:SetPietyRate(pietyRate)
	end
end
if userSettingPietyCore then
	GameEvents.PlayerDoTurn.Add(JFD_RTP_Piety_PietyRate)
	--Events.SerialEventGameDataDirty.Add(JFD_RTP_Piety_PietyRate)
end

--JFD_RTP_Piety_NaturalWonderDiscovered
function JFD_RTP_Piety_NaturalWonderDiscovered(teamID, featureID, plotX, plotY, isFirst)
	local team = Teams[teamID]
	local playerID = team:GetLeaderID()
	local player = Players[playerID]
	if (not player:HasStateReligion()) then return end
	local feature = GameInfo.Features[featureID]
	for row in GameInfo.Feature_YieldChanges("FeatureType = '" .. feature.Type .. "' AND YieldType = 'YIELD_FAITH'") do
		local rewardPiety = JFD_GetPietyYield(playerID, row.Yield)
		if rewardPiety > 0 then
			player:ChangePiety(rewardPiety)
			if player:IsHuman() then
				Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(plotX, plotY))), Locale.ConvertTextKey("[COLOR_JFD_PIETY]+{1_Num}[ENDCOLOR] [ICON_JFD_PIETY]", rewardPiety), true)
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_JFD_PIETY_NATURAL_WONDER_DISCOVERED", rewardPiety, feature.Description))
			end
		end
		break
	end
end
if userSettingPietyCore then
	GameEvents.NaturalWonderDiscovered.Add(JFD_RTP_Piety_NaturalWonderDiscovered)
end
----------------
-- PIETY LEVEL
----------------
--JFD_RTP_Piety_OnPietyLevelChanged
function JFD_RTP_Piety_OnPietyLevelChanged(playerID, oldPietyLevelID, newPietyLevelID)
	local player = Players[playerID]
	if player:IsHuman() then
		local pietyLevel = GameInfo.JFD_PietyLevels[newPietyLevelID]
		JFD_SendNotification(playerID, "NOTIFICATION_JFD_PIETY", convertTextKey("TXT_KEY_JFD_PIETY_LEVEL_NOTIFICATION_TEXT", pietyLevel.TextColor, pietyLevel.ShortDescription), convertTextKey("TXT_KEY_JFD_PIETY_LEVEL_NOTIFICATION_SHORT_TEXT"), true)
	end
end
if userSettingPietyCore then
	LuaEvents.JFD_PietyLevelChanged.Add(JFD_RTP_Piety_OnPietyLevelChanged)
end

--JFD_RTP_Piety_PietyLevelChanged
function JFD_RTP_Piety_PietyLevelChanged(playerID, currentPiety, pietyChange)
	local player = Players[playerID]
	local currentPietyLevelID = JFD_GetPietyLevelID(playerID)
	if currentPiety == pietyChange then return end
	for row in GameInfo.JFD_PietyLevel_GameSpeedThresholds("GameSpeedType = '" .. gameSpeedType .. "' AND '" .. (currentPiety+pietyChange) .. "' <= MaxThreshold AND '" .. (currentPiety+pietyChange) .. "' >= MinThreshold") do
		local pietyLevelID = GameInfoTypes[row.PietyLevelType]
		if currentPietyLevelID ~= pietyLevelID then
			LuaEvents.JFD_PietyLevelChanged(playerID, currentPietyLevelID, pietyLevelID)
		end
		break
	end
	if player:IsHuman() then Events.SerialEventGameDataDirty() end
end
if userSettingPietyCore then
	GameEvents.PietyChange.Add(JFD_RTP_Piety_PietyLevelChanged)
end

--JFD_RTP_Piety_Conversion
local pietyLevelNeutralID = GameInfoTypes["PIETY_LEVEL_JFD_NEUTRAL"]
function JFD_RTP_Piety_Conversion(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if player:HasSecularized() then return end
	if player:IsBarbarian() then return end
	if (not player:HasStateReligion()) then return end
	local pietyLevelID = JFD_GetPietyLevelID(playerID)
	local conversionRate = JFD_GetStateReligionPressure(playerID)
	local hasSyncretism = false
	for row in GameInfo.Policies("JFD_ConvertAllReligions > 0") do
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
if userSettingPietyCore then
	GameEvents.PlayerDoTurn.Add(JFD_RTP_Piety_Conversion)
end

--JFD_RTP_Piety_ConversionStrength
local promotionReligiousUnitID = GameInfoTypes["PROMOTION_JFD_RELIGIOUS_UNIT"]
local unitMissionaryStrength = GameInfo.Units["UNIT_MISSIONARY"].ReligiousStrength
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
			local pietyLevelID = JFD_GetPietyLevelID(playerID)
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
if userSettingPietyCore then
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
		if (not player:HasStateReligion()) then return end
		local religionID = player:GetStateReligion()
		for row in GameInfo.Belief_JFD_PietyYieldChanges("OnCitizenBirth == 1") do
			if Game.BeliefIsInReligion(religionID, GameInfoTypes[row.BeliefType]) then
				local popMod = JFD_Round(newPopulation/3)
				local rewardPiety = (JFD_GetPietyYield(playerID, row.Yield)*popMod)
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
if userSettingPietyCore then
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
if userSettingPietyCore then
	GameEvents.PlayerCityFounded.Add(JFD_RTP_Piety_FromCity)
end

--JFD_RTP_Piety_FromCityConstructed
function JFD_RTP_Piety_FromCityConstructed(playerID, cityID, buildingID, isGold, isFaith)
	local player = Players[playerID]
	if (not player:HasStateReligion()) then return end
	local religionID = player:GetStateReligion()
	local buildingQuery = "OnBuildingConstructed"
	if isGold then buildingQuery = "OnBuildingPurchased" end
	local buildingClassID = GameInfoTypes[GameInfo.Buildings[buildingID].BuildingClass]
	local buildingClass = GameInfo.BuildingClasses[buildingClassID]
	if (buildingClass.MaxGlobalInstances == 1 or buildingClass.MaxPlayerInstances == 1) then buildingQuery = "OnWonderConstructed" end
	if (buildingQuery == "OnBuildingConstructed" and GameInfo.Buildings[buildingID].SpecialistCount <= 0) then return end
	for row in GameInfo.Belief_JFD_PietyYieldChanges(buildingQuery .. " == 1") do
		if Game.BeliefIsInReligion(religionID, GameInfoTypes[row.BeliefType]) then
			local rewardPiety = JFD_GetPietyYield(playerID, row.Yield)
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
if userSettingPietyCore then
	GameEvents.CityConstructed.Add(JFD_RTP_Piety_FromCityConstructed)
end

--JFD_RTP_Piety_FromCityInvested
function JFD_RTP_Piety_FromCityInvested(playerID, cityID, buildingID, value)
	local player = Players[playerID]
	if (not player:HasStateReligion()) then return end
	local religionID = player:GetStateReligion()
	for row in GameInfo.Belief_JFD_PietyYieldChanges("OnBuildingPurchased == 1") do
		if Game.BeliefIsInReligion(religionID, GameInfoTypes[row.BeliefType]) then
			local rewardPiety = JFD_GetPietyYield(playerID, row.Yield)
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
if (userSettingPietyCore and (userSettingInvestmentsCore or isUsingCBP)) then
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
				local rewardPiety = JFD_GetPietyYield(playerID, row.Yield)
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
if userSettingPietyCore then
	GameEvents.CityTrained.Add(JFD_RTP_Piety_FromCityTrained)
end

--JFD_RTP_Piety_FromGoldenAge
function JFD_RTP_Piety_FromGoldenAge(playerID, isStart, turns)
	if isStart then
		local player = Players[playerID]
		if (not player:HasStateReligion()) then return end
		local religionID = player:GetStateReligion()
		for row in GameInfo.Belief_JFD_PietyYieldChanges("OnGoldenAgeBegins == 1") do
			if Game.BeliefIsInReligion(religionID, GameInfoTypes[row.BeliefType]) then
				local rewardPiety = JFD_GetPietyYield(playerID, row.Yield)
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
end
if userSettingPietyCore then
	GameEvents.PlayerGoldenAge.Add(JFD_RTP_Piety_FromGoldenAge)
end

--JFD_RTP_Piety_FromPolicyAdopted
function JFD_RTP_Piety_FromPolicyAdopted(playerID, policyID)
	local player = Players[playerID]
	if (not player:HasStateReligion()) then return end
	local religionID = player:GetStateReligion()
	for row in GameInfo.Belief_JFD_PietyYieldChanges("OnPolicyAdopted == 1") do
		if Game.BeliefIsInReligion(religionID, GameInfoTypes[row.BeliefType]) then
			local rewardPiety = JFD_GetPietyYield(playerID, row.Yield)
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
if userSettingPietyCore then
	GameEvents.PlayerAdoptPolicy.Add(JFD_RTP_Piety_FromPolicyAdopted)
	GameEvents.PlayerAdoptPolicyBranch.Add(JFD_RTP_Piety_FromPolicyAdopted)
end

--JFD_RTP_Piety_FromTechDiscovered
function JFD_RTP_Piety_FromTechDiscovered(teamID, techID)
	local playerID = Teams[teamID]:GetLeaderID()
	local player = Players[playerID]
	if (not player:HasStateReligion()) then return end
	local religionID = player:GetStateReligion()
	for row in GameInfo.Belief_JFD_PietyYieldChanges("OnTechDiscovered == 1") do
		if Game.BeliefIsInReligion(religionID, GameInfoTypes[row.BeliefType]) then
			local rewardPiety = JFD_GetPietyYield(playerID, row.Yield)
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
if userSettingPietyCore then
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
if userSettingPietyCore then
	GameEvents.CityBoughtPlot.Add(JFD_RTP_Piety_FromTilePurchased)
end

--JFD_RTP_Piety_FromUnitCreated
function JFD_RTP_Piety_FromUnitCreated(playerID, unitID, unitTypeID, plotX, plotY)
	local player = Players[playerID]
	if (not player:HasStateReligion()) then return end
	local religionID = player:GetStateReligion()
	local unitClassType = GameInfo.Units[unitTypeID].Class
	for row in GameInfo.Belief_JFD_PietyYieldChanges("OnUnitClassCreated == '" .. unitClassType .. "'") do
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
if userSettingPietyCore then
	GameEvents.UnitCreated.Add(JFD_RTP_Piety_FromUnitCreated)
end

--JFD_RTP_Piety_FromUnitExpended
function JFD_RTP_Piety_FromUnitExpended(playerID, unitID, unitTypeID, plotX, plotY)
	local player = Players[playerID]
	if (not player:HasStateReligion()) then return end
	local religionID = player:GetStateReligion()
	local unitClassType = GameInfo.Units[unitTypeID].Class
	for row in GameInfo.Belief_JFD_PietyYieldChanges("OnUnitClassExpended == '" .. unitClassType .. "'") do
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
if userSettingPietyCore then
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
				local rewardPiety = (JFD_GetPietyYield(killingPlayerID, row.Yield, true)*unitLevel)
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
if userSettingPietyCore then
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
			local rewardPiety = (JFD_GetPietyYield(playerID, row.Yield)*unit:GetLevel())
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
if userSettingPietyCore then
	GameEvents.UnitPromoted.Add(JFD_RTP_Piety_FromUnitPromoted)
end

--JFD_RTP_Piety_FromWLTKD
function JFD_RTP_Piety_FromWLTKD(playerID, city, plotX, plotY, turns)
	local player = Players[playerID]
	if (not player:HasStateReligion()) then return end
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
if userSettingPietyCore then
	GameEvents.CityBeginsWLTKD.Add(JFD_RTP_Piety_FromWLTKD)
	LuaEvents.JFD_WLTKDBegins.Add(JFD_RTP_Piety_FromWLTKD)
end
------------------------------------------------------------------------------------------------------------------------
-- BELIEFS
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Piety_ReligionCanHaveBelief
function JFD_RTP_Piety_ReligionCanHaveBelief(playerID, religionID, beliefID)
	local belief = GameInfo.Beliefs[beliefID]
	if belief.Follower then
		if belief.JFD_RequiresEnhancement then
			local player = Players[playerID] or activePlayer
			if player:GetReligionCreatedByPlayer() <= 0 then
				return false
			end
		elseif belief.JFD_RequiresFounding then
			local player = Players[playerID] or activePlayer
			if player:GetReligionCreatedByPlayer() > 0 then
				return false
			end
		end
	end
	return true
end
GameEvents.ReligionCanHaveBelief.Add(JFD_RTP_Piety_ReligionCanHaveBelief)

--JFD_RTP_Piety_CityTrained
local unitInquisitorID 					= GameInfoTypes["UNIT_INQUISITOR"]
local unitMissionaryID	 				= GameInfoTypes["UNIT_MISSIONARY"]
local unitPromotionSightPenalty 		= GameInfoTypes["PROMOTION_SIGHT_PENALTY"]
local unitPromotionUnwelcomeEvagelist 	= GameInfoTypes["PROMOTION_UNWELCOME_EVANGELIST"]
function JFD_RTP_Piety_CityTrained(playerID, cityID, unitID, isGold, isFaith)
	local player = Players[playerID] 
	local unit = player:GetUnitByID(unitID)
	if isFaith then
		for row in GameInfo.Beliefs("JFD_XPOnFaithPurchase") do
			local beliefID = GameInfoTypes[row.Type]
			if player:HasBelief(beliefID) then
				unit:ChangeExperience(row.JFD_XPOnFaithPurchase)
			end
		end
	end
	if unit:GetUnitType() == unitInquisitorID then
		for row in GameInfo.Beliefs("JFD_InquisitorPromotion IS NOT NULL") do
			local beliefID = GameInfoTypes[row.Type]
			if player:HasBelief(beliefID) then
				unit:SetHasPromotion(GameInfoTypes[row.JFD_InquisitorPromotion], true)
			end
		end
	elseif unit:GetUnitType() == unitMissionaryID then
		for row in GameInfo.Beliefs("JFD_MissionaryPromotion IS NOT NULL") do
			local beliefID = GameInfoTypes[row.Type]
			if player:HasBelief(beliefID) then
				unit:SetHasPromotion(GameInfoTypes[row.JFD_MissionaryPromotion], true)
			end
		end
		for row in GameInfo.Beliefs("JFD_RemovesMissionaryPenalties") do
			local beliefID = GameInfoTypes[row.Type]
			if player:HasBelief(beliefID) then
				unit:SetHasPromotion(unitPromotionSightPenalty, false)
				unit:SetHasPromotion(unitPromotionUnwelcomeEvagelist, false)
			end
		end
	end
	local city = player:GetCityByID(cityID)
	local religionID = city:GetReligiousMajority()
	if religionID > 0 then
		for _, beliefID in ipairs(Game.GetBeliefsInReligion(religionID)) do
			local belief = GameInfo.Beliefs[beliefID]
			local unitPromotion = belief.TrainedFreePromotion
			if unitPromotion then
				unit:SetHasPromotion(GameInfoTypes[unitPromotion], true)
			end
		end
	end
end
GameEvents.CityTrained.Add(JFD_RTP_Piety_CityTrained)
------------------------------------------------------------------------------------------------------------------------
-- POLICIES
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Piety_Infallability
function JFD_RTP_Piety_Infallability(playerID, cityID, unitID, isGold, isFaithOrCulture)
	if (not isFaithOrCulture) then return end
	local player = Players[playerID]
	if (not player:HasStateReligion()) then return end
	local unit = player:GetUnitByID(unitID)
	if (unit:GetUnitClassType() == unitClassMissionaryID or unit:GetUnitClassType() == unitClassInquisitorID or unit:GetUnitClassType() == unitClassProphetID) then
		for row in GameInfo.Policy_JFD_PietyYieldChanges("OnReligiousUnitFaithPurchased == 1") do
			if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
				local rewardPiety = JFD_GetPietyYield(playerID, row.Yield)
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
if userSettingPietyPolicies then
	GameEvents.CityTrained.Add(JFD_RTP_Piety_Infallability)
end

--JFD_RTP_Piety_Finisher
local policyTheocracyID	 = GameInfoTypes["POLICY_THEOCRACY"]
local policySyncretismID = GameInfoTypes["POLICY_FREE_RELIGION"]
function JFD_RTP_Piety_PietyFinisher(playerID, policyID)
	local player = Players[playerID]
	if ((policyID == policySyncretismID and player:HasPolicy(policyTheocracyID)) or (policyID == policyTheocracyID and player:HasPolicy(policySyncretismID))) then
		if (player:GetReligionCreatedByPlayer() <= 0 and Game.GetNumReligionsStillToFound() == 0) then
			local capital = player:GetCapitalCity()
			local unitProphetID = player:GetSpecificUnitType("UNITCLASS_PROPHET")
			player:InitUnit(unitProphetID, capital:GetX(), capital:GetY())
		end
	end
end
if userSettingPietyPolicies then
	GameEvents.PlayerAdoptPolicy.Add(JFD_RTP_Piety_PietyFinisher)
end
------------------------------------------------------------------------------------------------------------------------
-- PROCESSES
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Piety_Inquisition
local processPietyID = GameInfoTypes["PROCESS_JFD_PIETY"]
function JFD_RTP_Piety_Inquisition(playerID, cityID, processID)
	local player = Players[playerID]
	if processID == processPietyID then
		if (not player:HasStateReligion()) then return false end
		if player:HasSecularized() then return false end
		local city = player:GetCityByID(cityID)
		if city:IsPuppet() then return false end
		if city:GetReligiousMajority() == player:GetStateReligion() then return false end
	end
	return true
end
if processPietyID then
	GameEvents.CityCanMaintain.Add(JFD_RTP_Piety_Inquisition)
end
------------------------------------------------------------------------------------------------------------------------
-- RESOLUTIONS
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Piety_ResolutionPassed
local resolutionSecularizationID = GameInfoTypes["RESOLUTION_JFD_SECULARIZATION"]
function JFD_RTP_Piety_ResolutionPassed(resolutionID, choiceID, isEnact, isPassed)
	if resolutionID ~= resolutionSecularizationID then return end
	if (not isPassed) then return end
	for otherPlayerID = 0, defineMaxMajorCivs - 1 do 
		local otherPlayer = Players[otherPlayerID]
		if (otherPlayer:IsAlive() and otherPlayer:HasStateReligion()) then
			otherPlayer:SetHasSecularized(true)
		end
	end
end
if resolutionSecularizationID then
	GameEvents.ResolutionResult.Add(JFD_RTP_Piety_ResolutionPassed)
end
------------------------------------------------------------------------------------------------------------------------
-- GREAT PEOPLE
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Piety_GreatProphet
local unitClassProphetID = GameInfoTypes["UNITCLASS_PROPHET"]
function JFD_RTP_Piety_GreatProphet(playerID, unitID, greatWorkID)
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
if userSettingPietyProphetArtifacts then
	GameEvents.GreatWorkCreated.Add(JFD_RTP_Piety_GreatProphet)
end

--JFD_RTP_Piety_GreatProphet_CanHaveGreatWork
local missionCreateGreatWorkID = GameInfoTypes["MISSION_CREATE_GREAT_WORK"]
function JFD_RTP_Piety_GreatProphet_CanHaveGreatWork(playerID, unitID, missionID)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if unit:GetUnitClassType() ~= unitClassProphetID then return true end
	if missionID ~= missionCreateGreatWorkID then return true end
	if JFD_GetPietyLevelID(playerID) ~= pietyLevelDevoutID then return false end
	return true
end
if userSettingPietyProphetArtifacts then
	GameEvents.CanStartMission.Add(JFD_RTP_Piety_GreatProphet_CanHaveGreatWork)
end
------------------------------------------------------------------------------------------------------------------------
-- WONDERS
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Piety_DomeOfTheRock
local buildingDomeOfTheRockID = GameInfoTypes["BUILDING_JFD_DOME_ROCK"]
function JFD_RTP_Piety_DomeOfTheRock(oldOwnerID, capital, plotX, plotY, newOwnerID)
	local player = Players[newOwnerID]
	if (not player:HasStateReligion()) then return end
	if (not player:HasBuilding(buildingDomeOfTheRockID)) then return end
	local city = Map.GetPlot(plotX, plotY):GetPlotCity()
	if (not city) then return end
	if (city:GetReligiousMajority() > 0 and city:GetReligiousMajority() == player:GetStateReligion()) then
		local rewardPiety = JFD_GetPietyYield(newOwnerID, city:GetPopulation()*2)
		player:ChangePiety(rewardPiety)
		if player:IsHuman() then
			Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(plotX, plotY))), Locale.ConvertTextKey("[COLOR_JFD_PIETY]+{1_Num}[ENDCOLOR] [ICON_JFD_PIETY]", rewardPiety), true)
		end
	end
end
if buildingDomeOfTheRockID then
	GameEvents.CityCaptureComplete.Add(JFD_RTP_Piety_DomeOfTheRock)	
end

--JFD_RTP_Piety_GrandInquisiton
local buildingGrandInquisitonID = GameInfoTypes["BUILDING_JFD_GRAND_INQUISITION"]
local unitInquisitorID 			= GameInfoTypes["UNIT_INQUISITOR"]
function JFD_RTP_Piety_GrandInquisiton(playerID, cityID, buildingID)
	local player = Players[playerID]
	if (not player:HasStateReligion()) then return end
	if buildingID == buildingGrandInquisitonID then
		local city = player:GetCityByID(cityID)
		player:InitUnit(unitInquisitorID, city:GetX(), city:GetY())
		player:InitUnit(unitInquisitorID, city:GetX(), city:GetY())
	end
end
if buildingDomeOfTheRockID then
	GameEvents.CityConstructed.Add(JFD_RTP_Piety_GrandInquisiton)	
end

--JFD_RTP_Piety_TempleOfHeaven
local buildingTempleOfHeavenID = GameInfoTypes["BUILDING_JFD_TEMPLE_HEAVEN"]
function JFD_RTP_Piety_TempleOfHeaven(playerID)
	local player = Players[playerID]
	if (not player:HasStateReligion()) then return end
	if (not player:HasBuilding(buildingTempleOfHeavenID)) then return end
	player:ChangeGoldenAgeProgressMeter(JFD_GetGoldenAgePointsFromFaith(playerID))
end
if buildingTempleOfHeavenID then
	GameEvents.PlayerDoTurn.Add(JFD_RTP_Piety_TempleOfHeaven)
end	

--JFD_RTP_Piety_TodaiJiFaithPurchase
local buildingTodaiJiID = GameInfoTypes["BUILDING_JFD_TODAI"]
local promotionTodaiJiID = GameInfoTypes["PROMOTION_JFD_TODAI"]
function JFD_RTP_Piety_TodaiJiFaithPurchase(playerID, cityID, unitID, isGold, isFaithOrCulture)
	if (not isFaithOrCulture) then return end
	local player = Players[playerID]
	local city = player:GetCityByID(cityID)
	if (not city:HasBuilding(buildingTodaiJiID)) then return end
	local unit = player:GetUnitByID(unitID)
	if (not unit:IsCombatUnit()) then return end
	unit:SetHasPromotion(promotionTodaiJiID, true)
end
if buildingTodaiJiID then
	GameEvents.CityTrained.Add(JFD_RTP_Piety_TodaiJiFaithPurchase)
end
--=======================================================================================================================
--=======================================================================================================================