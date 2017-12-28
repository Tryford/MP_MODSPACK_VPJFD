-- JFD_ProsperityUtils
-- Author: JFD
-- DateCreated: 11/21/2015 9:23:28 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFDLCUtils.lua");
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local convertTextKey = Locale.ConvertTextKey
local mathFloor 	 = math.floor
local mathCeil 		 = math.ceil
local mathMin 		 = math.min
------------------------------------------------------------------------------------------------------------------------
-- CURRENCY
------------------------------------------------------------------------------------------------------------------------
-- JFD_CanAdoptAnyCurrency
-- function JFD_CanAdoptAnyCurrency(playerID)
	-- local player = Players[playerID]
	-- for row in GameInfo.Technologies_JFD_MiscEffects("AllowCurrencies > 0") do
		-- local techID = GameInfoTypes[row.TechType]
		-- if (not player:HasTech(techID)) then return false end
	-- end
	-- for currency in GameInfo.JFD_Currencies() do
		-- if JFD_CanAdoptCurrency(playerID, currency.ID) then
			-- return true
		-- end
	-- end
	-- return false
-- end

-- JFD_CanAdoptCurrency
-- function JFD_CanAdoptCurrency(playerID, currencyID)
	-- local player = Players[playerID]
	-- if player:HasCurrency(currencID) then return false end
	-- return true
-- end

-- JFD_GetCurrencyRate
-- function JFD_GetCurrencyRate(playerID)
	-- local player = Players[playerID]
	-- local currencyRate = 10
	-- for row in GameInfo.Policy_JFD_ProsperityMods("CurrencyMod <> 0") do
		-- if player:HasPolicy(GameInfoTypes[row.PolicyType]) then
			-- currencyRate = currencyRate + row.CurrencyMod
		-- end
	-- end
	-- return currencyRate
-- end

-- JFD_GetCurrencyProsperityValue
-- function JFD_GetCurrencyProsperityValue(playerID, currencyID)
	-- local player = Players[playerID]
	-- local value = 0
	-- for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		-- local otherPlayer = Players[otherPlayerID]
		-- if (otherPlayerID ~= playerID and otherPlayer:IsAlive() and Teams[player:GetTeam()]:IsHasMet(otherPlayer:GetTeam())) then
			-- if otherPlayer:GetCurrency() == currencyID then
				-- value = value + ((otherPlayer:CalculateGoldRate()*10)/100)
			-- end
		-- end
	-- end
	-- return (value/10)
-- end
------------------------------------------------------------------------------------------------------------------------
-- MIGRATION
------------------------------------------------------------------------------------------------------------------------
-- JFD_GetCityMigration
-- function JFD_GetCityMigration(playerID, isHighest)
	-- local player = Players[playerID]
	-- local capital = player:GetCapitalCity()
	-- if isHighest then
		-- local cityMigration = capital
		-- local cityMigrationPop = capital:GetPopulation()
		-- for city in player:Cities() do
			-- if city:GetPopulation() > cityMigrationPop then
				-- cityMigration = city
				-- cityMigrationPop = city:GetPopulation()
			-- end
		-- end
		-- return cityMigration
	-- else
		-- local cityMigration = capital
		-- local cityMigrationPop = capital:GetPopulation()
		-- for city in player:Cities() do
			-- if city:GetPopulation() <= cityMigrationPop then
				-- cityMigration = city
				-- cityMigrationPop = city:GetPopulation()
			-- end
		-- end
		-- return cityMigration
	-- end
-- end

-- JFD_GetCityMigrationTurns
-- function JFD_GetCityMigrationTurns(playerID)
	-- local player = Players[playerID]
	-- local cityMigrationTurns = 20
	-- return cityMigrationTurns
-- end
------------------------------------------------------------------------------------------------------------------------
-- PROSPERITY
------------------------------------------------------------------------------------------------------------------------
--Player:CalculateProsperity
local prosperityHighID = GameInfoTypes["PROSPERITY_JFD_AFFLUENT"]
local prosperityMidID  = GameInfoTypes["PROSPERITY_JFD_BALANCED"]
local prosperityLowID  = GameInfoTypes["PROSPERITY_JFD_WEAK"]
local prosperityZeroID = GameInfoTypes["PROSPERITY_JFD_DESTITUTE"]
function Player.CalculateProsperity(player, returnsTT)
	local playerID = player:GetID()
	local prosperity = 0
	local prosperityFromGPT = 0
	local prosperityFromGPTBonus = 0
	-- local prosperityFromGPTBonusPercent = JFD_GetCurrencyRate(playerID)
	local prosperityFromGPTBonusPercent = 0
	local prosperityTT = ""
	if player:GetNumCities() == 0 then return prosperity end
	local currencyID = player:GetCurrency()
	local GPT = Game.GetRound(player:CalculateGoldRate())
	local worldGPT = GPT
	for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local otherPlayer = Players[otherPlayerID]
		if (otherPlayerID ~= playerID and otherPlayer:IsAlive() and Teams[player:GetTeam()]:IsHasMet(otherPlayer:GetTeam())) then
			local otherPlayerGPT = Game.GetRound(otherPlayer:CalculateGoldRate())
			worldGPT = worldGPT + otherPlayerGPT
			if (otherPlayer:HasCurrency() and otherPlayer:GetCurrency() == currencyID) then
				prosperityFromGPTBonus = prosperityFromGPTBonus + ((otherPlayerGPT*prosperityFromGPTBonusPercent)/100)
			end
		end
	end
	GPT = GPT + prosperityFromGPTBonus
	if worldGPT > 0 then
		prosperityFromGPT = Game.GetRound(GPT/worldGPT,1)
	end
	prosperityFromGPTBonus = (Game.GetRound(prosperityFromGPTBonus)/10)
	prosperity = prosperity + prosperityFromGPT
	prosperity = (prosperity*10)
	if returnsTT then
		local prosperityScore = player:GetProsperityScore(prosperity)
		local prosperityLevelID = player:GetProsperityLevelID(prosperityScore)
		local prosperityLevel = GameInfo.JFD_ProsperityLevels[prosperityLevelID]
		prosperityTT = convertTextKey("TXT_KEY_TOP_PANEL_JFD_PROSPERITY_TT_NONE", prosperityLevel.Description, player:GetWeightedProsperityScore(prosperityScore))
		if player:HasCurrency() then
			local currency = GameInfo.JFD_Currencies[currencyID]
			prosperityTT = convertTextKey("TXT_KEY_TOP_PANEL_JFD_PROSPERITY_TT", currency.IconString, currency.Description, prosperityLevel.Description, player:GetWeightedProsperityScore(prosperityScore))
			prosperityTT = prosperityTT .. "[NEWLINE][NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_TOP_PANEL_JFD_PROSPERITY_TT_GPT", player:GetWeightedProsperityScore(prosperityFromGPT*10))
			if prosperityFromGPTBonus ~= 0 then
				prosperityTT = prosperityTT .. "[NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_TOP_PANEL_JFD_PROSPERITY_TT_GPT_BONUS", player:GetWeightedProsperityScore(prosperityFromGPTBonus*10), prosperityFromGPTBonusPercent, currency.IconString, currency.Description)
			end
		else
			prosperityTT = prosperityTT .. "[NEWLINE][NEWLINE][ICON_BULLET]" .. convertTextKey("TXT_KEY_TOP_PANEL_JFD_PROSPERITY_TT_GPT", player:GetWeightedProsperityScore(prosperityFromGPT*10))
		end
		local cityMigrationHighest = player:GetCapitalCity()
		-- local cityMigrationHighest = JFD_GetCityMigration(playerID, true)
		local cityMigrationLowest  = player:GetCapitalCity()
		-- local cityMigrationLowest  = JFD_GetCityMigration(playerID)
		local cityMigrationTurns   = 12
		-- local cityMigrationTurns   = JFD_GetCityMigrationTurns(playerID)
		if prosperityLevelID == prosperityHighID then
			prosperityTT = prosperityTT .. "[NEWLINE][NEWLINE]"	.. convertTextKey("TXT_KEY_PROSPERITY_JFD_AFFLUENT_HELP", cityMigrationHighest:GetName(), cityMigrationTurns)
		elseif prosperityLevelID == prosperityMidID then
			prosperityTT = prosperityTT .. "[NEWLINE][NEWLINE]"	.. convertTextKey("TXT_KEY_PROSPERITY_JFD_BALANCED_HELP")
		elseif prosperityLevelID == prosperityLowID then
			prosperityTT = prosperityTT .. "[NEWLINE][NEWLINE]"	.. convertTextKey("TXT_KEY_PROSPERITY_JFD_WEAK_HELP", cityMigrationLowest:GetName(), cityMigrationTurns)
		end
		local prosperityProjectedLevelID = player:GetProsperityLevelID(prosperity)
		local prosperityProjectedLevel = GameInfo.JFD_ProsperityLevels[prosperityProjectedLevelID]
		if prosperityProjectedLevelID == prosperityLevelID then
			prosperityTT = prosperityTT .. "[NEWLINE][NEWLINE]"	.. convertTextKey("TXT_KEY_TOP_PANEL_JFD_PROSPERITY_TT_PROJECTED_UNCHANGED", prosperityProjectedLevel.Description)
		else
			prosperityTT = prosperityTT .. "[NEWLINE][NEWLINE]"	.. convertTextKey("TXT_KEY_TOP_PANEL_JFD_PROSPERITY_TT_PROJECTED_CHANGE", prosperityProjectedLevel.Description)
		end
		return prosperity, prosperityTT	
	else
		return prosperity
	end
end

--Player:GetWeightedProsperityScore
local prosperityScores = {}
	prosperityScores[0]   = "0.0"
	prosperityScores[1]   = "0.1"
	prosperityScores[2]   = "0.2"
	prosperityScores[3]   = "0.3"
	prosperityScores[4]   = "0.4"
	prosperityScores[5]   = "0.5"
	prosperityScores[6]   = "0.6"
	prosperityScores[7]   = "0.7"
	prosperityScores[8]   = "0.8"
	prosperityScores[9]   = "0.9"
	prosperityScores[10]  = "1.0"
function Player.GetWeightedProsperityScore(player, prosperity)
	if (not prosperity) then prosperity = player:CalculateProsperity(false) end
	if prosperity == -1 then return "1.0" end
	return prosperityScores[prosperity] or "0.0"
end
------------------------------------------------------------------------------------------------------------------------
-- PROSPERITY LEVEL
------------------------------------------------------------------------------------------------------------------------
--Player:GetProsperityLevelID
function Player.GetProsperityLevelID(player, prosperity)
	if (not prosperity) then prosperity = player:GetProsperityScore() end
	for row in GameInfo.JFD_ProsperityLevels("Threshold <= '" .. prosperity .. "'") do
		return row.ID
	end
	return prosperityMidID
end

--Player:GetProsperityGreatPeopleRateModifier
-- function Player.GetProsperityGreatPeopleRateModifier(player)
	-- local prosperityLevel = GameInfo.JFD_ProsperityLevels[player:GetProsperityLevelID()]
	-- return GameInfo.Policies[prosperityLevel.PolicyType].GreatPeopleRateModifier
-- end
--=======================================================================================================================
--=======================================================================================================================
