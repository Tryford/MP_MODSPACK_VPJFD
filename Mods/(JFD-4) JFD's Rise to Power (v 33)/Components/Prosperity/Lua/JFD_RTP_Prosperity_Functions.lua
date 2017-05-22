-- JFD_PS_Prosperity_Functions
-- Author: JFD
-- DateCreated: 11/22/2015 1:27:14 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_RTP_ProsperityUtils.lua")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local activePlayerID 	= Game.GetActivePlayer()
local activePlayer 		= Players[activePlayerID]
local activePlayerTeam 	= Teams[activePlayer:GetTeam()]
local convertTextKey 	= Locale.ConvertTextKey
local gameSpeedID 		= Game.GetGameSpeedType()
local gameSpeed			= GameInfo.GameSpeeds[gameSpeedID]
local gameSpeedMod	 	= (gameSpeed.BuildPercent/100) 
local gameSpeedType 	= gameSpeed.Type 
local mathFloor 		= math.floor
local mathCeil 			= math.ceil
local mathMin 			= math.min
local unitCurrencyNotificationID = GameInfoTypes["UNIT_JFD_PROSPERITY"]

local userSettingProsperityCore = JFD_GetUserSetting("JFD_RTP_PROSPERITY_CORE") == 1
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
-- CURRENCY
------------------------------------------------------------------------------------------------------------------------
-- JFD_RTP_Prosperity_OnCurrency
function JFD_RTP_Prosperity_OnCurrency(playerID, newCurrencyID, oldCurrencyID)
	local player = Players[playerID]
	local currency = GameInfo.JFD_Currencies[newCurrencyID]
	if activePlayerTeam:IsHasMet(player:GetTeam()) then 
		local oldCurrencyID = player:GetCurrency()
		if playerID == activePlayerID then
			local oldCurrency = GameInfo.JFD_Currencies[oldCurrencyID]
			if (oldCurrencyID ~= newCurrencyID and oldCurrency) then
				JFD_SendNotification(playerID, "NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_CURRENCY_NOTIFICATION_CHANGE_TEXT", currency.IconString, currency.Description, oldCurrency.IconString, oldCurrency.Description), convertTextKey("TXT_KEY_JFD_CURRENCY_NOTIFICATION_SHORT_TEXT"), true, -1, -1, unitCurrencyNotificationID)
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_CURRENCY_NOTIFICATION_TEXT", currency.IconString, currency.Description), convertTextKey("TXT_KEY_JFD_CURRENCY_NOTIFICATION_SHORT_TEXT"), true, -1, -1, unitCurrencyNotificationID)
			end
		else
			local oldCurrency = GameInfo.JFD_Currencies[oldCurrencyID]
			if (oldCurrencyID ~= newCurrencyID and oldCurrency) then
				JFD_SendNotification(playerID, "NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_CURRENCY_NOTIFICATION_OTHER_CHANGE_TEXT", currency.Description, currency.IconString, currency.Description, oldCurrency.IconString, oldCurrency.Description), convertTextKey("TXT_KEY_JFD_CURRENCY_NOTIFICATION_SHORT_TEXT"), true, -1, -1, unitCurrencyNotificationID)
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_CURRENCY_NOTIFICATION_OTHER_TEXT", currency.Description, currency.IconString, currency.Description), convertTextKey("TXT_KEY_JFD_CURRENCY_NOTIFICATION_SHORT_TEXT"), true, -1, -1, unitCurrencyNotificationID)
			end
		end
	end
end	
if userSettingProsperityCore then
	GameEvents.PlayerAdoptsCurrency.Add(JFD_RTP_Prosperity_OnCurrency)
end

-- JFD_RTP_Prosperity_TeamTechResearched
function JFD_RTP_Prosperity_TeamTechResearched(teamID, techID)
	for row in GameInfo.Technologies_JFD_MiscEffects("AllowCurrencies == 1") do
		if GameInfoTypes[row.TechType] == techID then
			local playerID = Teams[teamID]:GetLeaderID()
			local player = Players[playerID]
			if playerID == activePlayerID then
				if JFD_CanAdoptAnyCurrency(playerID) then
					JFD_SendNotification(playerID, "NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_CURRENCY_CAN_ADOPT_NOTIFICATION_TEXT"), convertTextKey("TXT_KEY_JFD_CURRENCY_CAN_ADOPT_NOTIFICATION_SHORT_TEXT"), true, -1, -1, unitCurrencyNotificationID)
				end
			end
			break
		end
	end
end
if userSettingProsperityCore then
	GameEvents.TeamTechResearched.Add(JFD_RTP_Prosperity_TeamTechResearched)
end
------------------------------------------------------------------------------------------------------------------------
-- PROSPERITY
------------------------------------------------------------------------------------------------------------------------
-- JFD_RTP_Prosperity_CityFounded
function JFD_RTP_Prosperity_CityFounded(playerID, plotX, plotY)
	local player = Players[playerID]
	local plot = Map.GetPlot(plotX, plotY)
	local city = plot:GetPlotCity()
	if (not city) then return end
	if (player:IsAlive() and city:IsCapital()) then
		 JFD_RTP_Prosperity_DoTurn(playerID)
	end
end
if userSettingProsperityCore then
	GameEvents.PlayerCityFounded.Add(JFD_RTP_Prosperity_CityFounded)
end

-- JFD_RTP_Prosperity_DoTurn
function JFD_RTP_Prosperity_DoTurn(playerID)
	local player = Players[playerID]
	if player:IsMinorCiv() then return end
	if player:IsBarbarian() then return end
	local prosperity = JFD_CalculateProsperity(playerID, false)
	player:SetProsperityScore(prosperity)
	local prosperityLevelID = JFD_GetProsperityLevelID(playerID, prosperity)
	local prosperityLevel = GameInfo.JFD_ProsperityLevels[prosperityLevelID]
	local policyID = GameInfoTypes[prosperityLevel.PolicyType]
	player:GrantPolicy(policyID, true)
	for row in GameInfo.JFD_ProsperityLevels("ID <> '" .. prosperityLevelID .. "'") do
		player:RevokePolicy(GameInfoTypes[row.PolicyType])
	end
end
if userSettingProsperityCore then
	GameEvents.PlayerDoTurn.Add(JFD_RTP_Prosperity_DoTurn)
end
--=======================================================================================================================
--=======================================================================================================================