-- Religious Decisions
-- Author: Sukritact
--=======================================================================================================================

print("Religious Decisions: loaded")

--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingRTPPietyCore = (Game.GetUserSetting("JFD_RTP_PIETY_CORE") == 1)
--=======================================================================================================================
-- GLOBALS
--=======================================================================================================================
local defineMaxMajorCivs	= GameDefines["MAX_MAJOR_CIVS"]
local defineMaxMinorCivs	= GameDefines["MAX_MINOR_CIVS"]

local eraAncientID			= GameInfoTypes["ERA_ANCIENT"]
local eraClassicalID		= GameInfoTypes["ERA_CLASSICAL"]
local eraIndustrialID		= GameInfoTypes["ERA_INDUSTRIAL"]
local eraMedievalID			= GameInfoTypes["ERA_MEDIEVAL"]
local eraModernID			= GameInfoTypes["ERA_MODERN"]
local eraRenaissanceID		= GameInfoTypes["ERA_RENAISSANCE"]
local eraEnlightenmentID	= GameInfoTypes["ERA_ENLIGHTENMENT"] or eraRenaissanceID

local resourceCaptainsID 	= GameInfoTypes["RESOURCE_JFD_CAPTAINS"]
local resourceClericsID 	= GameInfoTypes["RESOURCE_JFD_CLERICS"]
local resourceDignitariesID = GameInfoTypes["RESOURCE_JFD_DIGNITARIES"]
local resourceInventorsID   = GameInfoTypes["RESOURCE_JFD_INVENTORS"]

local pietyLevelNeutralID   = GameInfoTypes["PIETY_LEVEL_JFD_NEUTRAL"]
--=======================================================================================================================
-- PANTHEON
--=======================================================================================================================

--=======================================================================================================================
-- CLERICS
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
-- Commission an Illustrated Holy Book
-------------------------------------------------------------------------------------------------------------------------
if resourceClericsID then
local Decisions_JFD_HolyBook = {}
	Decisions_JFD_HolyBook.Name = "TXT_KEY_DECISIONS_JFD_HOLY_BOOK"
	Decisions_JFD_HolyBook.Desc = "TXT_KEY_DECISIONS_JFD_HOLY_BOOK_DESC"
	Decisions_JFD_HolyBook.Era = eraRenaissanceID
	Decisions_JFD_HolyBook.Type = "Religious"
	Decisions_JFD_HolyBook.CanFunc = (
	function(player)
		local religionID = player:GetMajorityReligion()
		if religionID <= 0 then return false, false end
		HookDecisionReligionIcon(Decisions_JFD_HolyBook, GameInfo.Religions[religionID].Type)
		local religionType = GameInfo.Religions[religionID].Type
		local desc = "TXT_KEY_DECISIONS_JFD_HOLY_BOOK_" .. religionType 
		local flavour = "TXT_KEY_DECISIONS_JFD_HOLY_BOOK_FLAVOUR_" .. religionType 
		local isTextValid = false
		for row in DB.Query("SELECT Tag FROM Language_en_US WHERE Tag = '" .. desc .. "'") do
			isTextValid = true
		end
		if (not isTextValid) then
			desc = "TXT_KEY_DECISIONS_JFD_HOLY_BOOK_DEFAULT"
			flavour = "TXT_KEY_DECISIONS_JFD_HOLY_BOOK_DEFAULT_FLAVOUR"
		end
		if load(player, "Decisions_JFD_HolyBook") then
			Decisions_JFD_HolyBook.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_HOLY_BOOK_ENACTED_DESC", flavour)
			return false, false, true
		end
		local pietyMod = GameInfo.JFD_PietyLevels[player:GetPietyLevel()].RewardModifier
		local costGold = Game.GetRound((250*pietyMod)*iMod)
		local rewardFaith = Game.GetRound((150*pietyMod)*iMod)
		Decisions_JFD_HolyBook.Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_HOLY_BOOK", desc, costGold, rewardFaith)
		Decisions_JFD_HolyBook.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_HOLY_BOOK_DESC", flavour, costGold, rewardFaith)
		if player:GetCurrentEra() < eraRenaissanceID then return true, false end
		if player:GetNumResourceAvailable(resourceClericsID, false) < 2 then return true, false end
		if player:GetGold() < costGold then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_HolyBook.DoFunc = (
	function(player)
		local pietyMod = GameInfo.JFD_PietyLevels[player:GetPietyLevel()].RewardModifier
		local costGold = Game.GetRound((250*pietyMod)*iMod)
		local rewardFaith = Game.GetRound((150*pietyMod)*iMod)
		player:ChangeFaith(rewardFaith)
		player:ChangeNumResourceTotal(resourceClericsID, -2)
		save(player, "Decisions_JFD_HolyBook", true)
	end
	)
	
tDecisions.Decisions_JFD_HolyBook = Decisions_JFD_HolyBook
end
-------------------------------------------------------------------------------------------------------------------------
-- Declare Repentance
-------------------------------------------------------------------------------------------------------------------------
if resourceClericsID then
local Decisions_JFD_DeclareRepentance = {}
	Decisions_JFD_DeclareRepentance.Name = "TXT_KEY_DECISIONS_JFD_DECLARE_REPENTANCE"
	Decisions_JFD_DeclareRepentance.Desc = "TXT_KEY_DECISIONS_JFD_DECLARE_REPENTANCE_DESC"
	Decisions_JFD_DeclareRepentance.Type = "Religious"
	Decisions_JFD_DeclareRepentance.Era = eraAncientID
	Decisions_JFD_DeclareRepentance.CanFunc = (
	function(player)
		local playerID = player:GetID()
		if (not resourceClericsID) then return false, false end
		if (not player:HasStateReligion()) then return false, false end
		local stateReligionID = player:GetStateReligion()
		HookDecisionReligionIcon(Decisions_JFD_DeclareRepentance, GameInfo.Religions[stateReligionID].Type)
		if load(player, "Decisions_JFD_DeclareRepentance") == stateReligionID then return false, false end
		local pietyLevelID = player:GetPietyLevel()
		if pietyLevelID >= pietyLevelNeutralID then return false, false end
		local costFaith = Game.GetRound(300*iMod)
		local rewardPiety = player:CalculatePietyYield(100)
		Decisions_JFD_DeclareRepentance.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_DECLARE_REPENTANCE_DESC", costFaith, rewardPiety)
		if player:GetNumResourceAvailable(resourceClericsID, false) < 2 then return true, false end
		if player:GetFaith() < costFaith then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_DeclareRepentance.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local costFaith = Game.GetRound(300*iMod)
		local rewardPiety = player:CalculatePietyYield(100)
		player:ChangeFaith(-costFaith)
		player:ChangeNumResourceTotal(resourceClericsID, -2)
		player:ChangePiety(rewardPiety)
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_DECLARE_REPENTANCE", player:GetName(), player:GetCivilizationShortDescription())) 
		save(player, "Decisions_JFD_DeclareRepentance", player:GetStateReligion())
	end
	)

tDecisions["Decisions_JFD_DeclareRepentance"] = Decisions_JFD_DeclareRepentance	
end
-------------------------------------------------------------------------------------------------------------------------
-- Hold a Religious Celebration
-------------------------------------------------------------------------------------------------------------------------
local yieldCultureID  	= GameInfoTypes["YIELD_CULTURE"]
local yieldFoodID 		= GameInfoTypes["YIELD_FOOD"]
local yieldGAdmiralID   = GameInfoTypes["YIELD_GREAT_ADMIRAL_POINTS"]
local yieldGGeneralID   = GameInfoTypes["YIELD_GREAT_GENERAL_POINTS"]
local yieldGAPID   		= GameInfoTypes["YIELD_GOLDEN_AGE_POINTS"]
local yieldGoldID  		= GameInfoTypes["YIELD_GOLD"]
local yieldProductionID = GameInfoTypes["YIELD_PRODUCTION"]
local yieldScienceID  	= GameInfoTypes["YIELD_SCIENCE"]
local yields = {yieldCultureID, yieldFoodID, yieldGAdmiralID, yieldGGeneralID, yieldGAPID, yieldGoldID, yieldProductionID, yieldScienceID}
if resourceClericsID then
local Decisions_JFD_ReligiousCelebration = {}
	Decisions_JFD_ReligiousCelebration.Name = "TXT_KEY_DECISIONS_JFD_RELIGIOUS_CELEBRATION"
	Decisions_JFD_ReligiousCelebration.Desc = "TXT_KEY_DECISIONS_JFD_RELIGIOUS_CELEBRATION_DESC"
	Decisions_JFD_ReligiousCelebration.Type = "Religious"
	Decisions_JFD_ReligiousCelebration.Era = eraClassicalID
	Decisions_JFD_ReligiousCelebration.Data1 = {}
	Decisions_JFD_ReligiousCelebration.CanFunc = (
	function(player)
		local eraID = load(player, "Decisions_JFD_ReligiousCelebration")
		local currentEraID = player:GetCurrentEra() + 1
		local religionID = player:GetMajorityReligion()
		if religionID <= 0 then return false, false end
		HookDecisionReligionIcon(Decisions_JFD_ReligiousCelebration, GameInfo.Religions[religionID].Type)
		if eraID ~= nil then
			if eraID < currentEraID then
				save(player, "Decisions_JFD_ReligiousCelebration", nil)
				save(player, "Decisions_JFD_ReligiousCelebrationReligion", nil)
			else
				--Decision is enacted, grab saved religion
				isEnacted = true
				religionID = load(player, "Decisions_JFD_ReligiousCelebrationReligion")
			end
		end
		local religionType = GameInfo.Religions[religionID].Type
		local desc = "TXT_KEY_DECISIONS_JFD_RELIGIOUS_CELEBRATION_" .. religionType 
		local flavour = "TXT_KEY_DECISIONS_JFD_RELIGIOUS_CELEBRATION_FLAVOUR_" .. religionType 
		local isTextValid = false
		for row in DB.Query("SELECT Tag FROM Language_en_US WHERE Tag = '" .. desc .. "'") do
			isTextValid = true
		end
		if (not isTextValid) then
			desc = "TXT_KEY_DECISIONS_JFD_RELIGIOUS_CELEBRATION_DEFAULT"
			flavour = "TXT_KEY_DECISIONS_JFD_RELIGIOUS_CELEBRATION_DEFAULT_FLAVOUR"
		end
		local pietyMod = GameInfo.JFD_PietyLevels[player:GetPietyLevel()].RewardModifier
		local rewardYield = Game.GetRound((100*pietyMod)*iMod)
		local rewardYieldType = "[ICON_GOLDEN_AGE] " .. Locale.ConvertTextKey("TXT_KEY_YIELD_GOLDEN_AGE_POINTS")
		local rewardYieldID = yieldGAPID
		for row in GameInfo.Religion_YieldTypes("ReligionType = '" .. religionType .. "'") do
			rewardYieldID = GameInfoTypes[row.YieldType]
			rewardYield = Game.GetRound(rewardYield*GameInfo.Yields[rewardYieldID].Value)
			break
		end
		local costFaith = Game.GetRound(rewardYield*1.2)
		rewardYieldType = GameInfo.Yields[rewardYieldID].IconString .. " " .. Locale.ConvertTextKey(GameInfo.Yields[rewardYieldID].Description) 
		Decisions_JFD_ReligiousCelebration.Data1[rewardYieldID] = rewardYield
		Decisions_JFD_ReligiousCelebration.Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RELIGIOUS_CELEBRATION", desc, costFaith, rewardYield, rewardYieldType)
		Decisions_JFD_ReligiousCelebration.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RELIGIOUS_CELEBRATION_DESC", flavour, costFaith, rewardYield, rewardYieldType)
		if isEnacted then
			Decisions_JFD_ReligiousCelebration.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RELIGIOUS_CELEBRATION_ENACTED_DESC", flavour, rewardYieldType)
			return false, false, true
		end
		if player:GetNumResourceAvailable(resourceClericsID, false) < 2 then return true, false end
		if player:GetFaith() < costFaith then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_ReligiousCelebration.DoFunc = (
	function(player)
		local religionID = player:GetMajorityReligion()
		for rewardYieldID, rewardYield in pairs(Decisions_JFD_ReligiousCelebration.Data1) do
			--Food
			if rewardYieldID == yieldFoodID then
				rewardYield = Game.GetRound(rewardYield/player:GetNumCities())
				for city in player:Cities() do
					city:ChangeFood(rewardYield)
				end
			--Production
			elseif rewardYieldID == yieldProductionID then
				rewardYield = Game.GetRound(rewardYield/player:GetNumCities())
				for city in player:Cities() do
					city:SetOverflowProduction(city:GetOverflowProduction() + rewardYield)
				end
			--Gold
			elseif rewardYieldID == yieldGoldID then
				player:ChangeGold(rewardYield)
			--Science	
			elseif rewardYieldID == yieldScienceID then
				LuaEvents.Sukritact_ChangeResearchProgress(player:GetID(), rewardYield)
			--Culture
			elseif rewardYieldID == yieldCultureID then
				player:ChangeJONSCulture(rewardYield)
			--Faith
			elseif rewardYieldID == yieldFaithID then
				player:ChangeFaith(rewardYield)
			--Golden Age Points
			elseif rewardYieldID == yieldGAPID then
				player:ChangeGoldenAgeProgressMeter(rewardYield)
			--Great Admiral Points
			elseif rewardYieldID == yieldGAdmiralID then
				player:ChangeNavalCombatExperience(rewardYield)
			--Great General Points
			elseif rewardYieldID == yieldGGeneralID then
				player:ChangeCombatExperience(rewardYield)
			end
			local costFaith = Game.GetRound(rewardYield*1.2)
			player:ChangeFaith(-costFaith)
		end
		player:ChangeNumResourceTotal(resourceClericsID, -2)
		if player:IsHuman() then
			for row in GameInfo.Religion_FoundingAudios("ReligionType = '" .. GameInfo.Religions[religionID].Type .. "' AND AudioSound IS NOT NULL") do
				Events.AudioPlay2DSound(row.AudioSound)
			end
		end
		save(player, "Decisions_JFD_ReligiousCelebration", player:GetCurrentEra())
		save(player, "Decisions_JFD_ReligiousCelebrationReligion", religionID)
	end
	)
	
tDecisions.Decisions_JFD_ReligiousCelebration = Decisions_JFD_ReligiousCelebration
end
-------------------------------------------------------------------------------------------------------------------------
-- Expel Religious Minorities
-------------------------------------------------------------------------------------------------------------------------
if resourceClericsID then
local Decisions_JFD_ExpelMinorities = {}
	Decisions_JFD_ExpelMinorities.Name = "TXT_KEY_DECISIONS_JFD_EXPEL_MINORITIES"
	Decisions_JFD_ExpelMinorities.Desc = "TXT_KEY_DECISIONS_JFD_EXPEL_MINORITIES_DESC"
	Decisions_JFD_ExpelMinorities.Weight = 5
	Decisions_JFD_ExpelMinorities.Type = "Religious"
	Decisions_JFD_ExpelMinorities.Era = eraMedievalID
	Decisions_JFD_ExpelMinorities.CanFunc = (
	function(player)
		local playerID = player:GetID()
		if (not resourceClericsID) then return false, false end
		if (not player:HasStateReligion()) then return false, false end
		local govtTitleShort = player:GetGovernmentShortDescription()
		if load(player, "Decisions_JFD_ExpelMinorities") == true then
		Decisions_JFD_ExpelMinorities.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_EXPEL_MINORITIES_ENACTED_DESC", govtTitleShort)
			return false, false, true
		end
		local stateReligionID = player:GetStateReligion()
		HookDecisionReligionIcon(Decisions_JFD_ExpelMinorities, GameInfo.Religions[stateReligionID].Type)
		local rewardPiety = player:CalculatePietyYield(Game.GetRound(40*iMod))
		local costGold = Game.GetRound((120*iMod)+(player:GetTotalPopulation()*7)*iMod)
		Decisions_JFD_ExpelMinorities.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_EXPEL_MINORITIES_DESC", govtTitleShort, costGold, rewardPiety)
		if player:GetNumResourceAvailable(resourceClericsID, false) < 2 then return true, false end
		if player:GetGold() < costGold then return true, false end
		if player:GetPietyLevel() < pietyLevelNeutralID then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_ExpelMinorities.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local rewardPiety = player:CalculatePietyYield(Game.GetRound(40*iMod))
		local costGold = Game.GetRound((120*iMod)+(player:GetTotalPopulation()*7)*iMod)
		player:ChangeGold(-costGold)
		player:ChangePiety(rewardPiety)
		player:ChangeNumResourceTotal(resourceClericsID, -2)
		local stateReligionID = player:GetStateReligion()
		for city in player:Cities() do
			for religion in GameInfo.Religions("ID <> '" .. stateReligionID .. "'") do
				city:ConvertPercentFollowers(-1, religion.ID, 100)
			end
		end
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_EXPEL_RELIGIOUS_MINORITIES", player:GetName(), player:GetCivilizationDescription())) 
		save(player, "Decisions_JFD_ExpelMinorities", true)
	end
	)
	
tDecisions["Decisions_JFD_ExpelMinorities"] = Decisions_JFD_ExpelMinorities	
end
-------------------------------------------------------------------------------------------------------------------------
-- Perform Sacred Mysteries
-------------------------------------------------------------------------------------------------------------------------
local Decisions_JFD_SacredMysteries = {}
	Decisions_JFD_SacredMysteries.Name = "TXT_KEY_DECISIONS_JFD_PERFORM_SACRED_MYSTERIES"
	Decisions_JFD_SacredMysteries.Desc = "TXT_KEY_DECISIONS_JFD_PERFORM_RITES_OF_REVERANCE"
	Decisions_JFD_SacredMysteries.Type = "TXT_KEY_DECISIONS_JFD_PERFORM_RITES_OF_REVERANCE_DESC"
	Decisions_JFD_SacredMysteries.Era = eraAncientID
	Decisions_JFD_SacredMysteries.CanFunc = (
	function(player)
		local playerID = player:GetID()
		if (not resourceClericsID) then return false, false end
		if (not player:IsPagan()) then return false, false end
		HookDecisionReligionIcon(Decisions_JFD_SacredMysteries, "RELIGION_PANTHEON")
		local currentEra = player:GetCurrentEra()
		local pantheonBeliefID = player:GetBeliefInPantheon()
		local beliefName = GameInfo.Beliefs[pantheonBeliefID].ShortDescription
		local desc = "TXT_KEY_DECISIONS_JFD_PERFORM_SACRED_MYSTERIES"
		local help = "TXT_KEY_DECISIONS_JFD_PERFORM_SACRED_MYSTERIES_DESC"
		for row in GameInfo.Beliefs("Pantheon = '1' AND DecisionDescription IS NOT NULL") do
			if player:HasBelief(row.ID) then
				desc = row.DecisionDescription
				help = row.DecisionHelp
			end
		end
		local era = load(player, "Decisions_JFD_SacredMysteries")
		if era ~= nil then
			if era < currentEra then
				save(player, "Decisions_JFD_SacredMysteries", nil)
			else
				Decisions_JFD_SacredMysteries.Desc = Locale.ConvertTextKey(Locale.ConvertTextKey(desc) .. Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PAGAN_ENACTED_REWARD"))
				return false, false, true
			end
		end
		local rewardFaith = player:GetEraAdjustedValue(Game.GetRound(65*iMod))
		local yieldCost = Game.GetRound(rewardFaith*0.3)
		Decisions_JFD_SacredMysteries.Name = Locale.ConvertTextKey(desc)
		Decisions_JFD_SacredMysteries.Desc = Locale.ConvertTextKey(help) .. Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PAGAN_DESC", yieldCost, rewardFaith)
		local capital = player:GetCapitalCity()
		if capital:GetFood() < yieldCost then return true, false end
		if capital:GetProduction() < yieldCost then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_SacredMysteries.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local rewardFaith = player:GetEraAdjustedValue(Game.GetRound(65*iMod))
		local yieldCost = Game.GetRound(rewardFaith*0.3)
		local capital = player:GetCapitalCity()
		capital:ChangeFood(-yieldCost)
		capital:ChangeProduction(-yieldCost)
		player:ChangeFaith(rewardFaith)
		save(player, "Decisions_JFD_SacredMysteries", player:GetCurrentEra())
		if player:IsHuman() then
			Events.AudioPlay2DSound("AS2D_JFD_DRUIDISM")
		end
	end
	)

tDecisions["Decisions_JFD_SacredMysteries"] = Decisions_JFD_SacredMysteries	
--=======================================================================================================================
--=======================================================================================================================