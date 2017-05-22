-- JFD_RTP_Sovereignty_Functions
-- Author: JFD
-- DateCreated: 11/5/2015 11:39:39 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_RTPUtils.lua")
include("JFD_RTP_SovereigntyUtils.lua")
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingSovereigntyCore = JFD_GetUserSetting("JFD_RTP_SOVEREIGNTY_CORE") == 1
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
local gameSpeedID 							 = Game.GetGameSpeedType()
local gameSpeed 							 = GameInfo.GameSpeeds[gameSpeedID]
local gameSpeedMod							 = (gameSpeed.BuildPercent/100) 

local defineDefaultLegislatureCooldown 	 	 = (GameDefines["JFD_SOVEREIGNTY_DEFAULT_LEGISLATURE_COOLDOWN"]*gameSpeedMod)
local defineDefaultLegislatureCooldownRate 	 = GameDefines["JFD_SOVEREIGNTY_DEFAULT_LEGISLATURE_COOLDOWN_RATE"]
local defineDefaultReformCooldownTurns 	 	 = (GameDefines["JFD_SOVEREIGNTY_DEFAULT_REFORM_COOLDOWN"]*gameSpeedMod)
local defineLegitimacyPopThreshold 			 = GameDefines["JFD_SOVEREIGNTY_LEGITIMACY_POPULATION_THRESHOLD"]
local defineReformCityStateCitiesMax 		 = GameDefines["JFD_SOVEREIGNTY_REFORM_CITY_STATE_MAX_CITIES"]
local defineReformEmpireCitiesMin 	 		 = GameDefines["JFD_SOVEREIGNTY_REFORM_EMPIRE_MIN_CITIES"]
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local activePlayerID 						 = Game.GetActivePlayer()
local activePlayer 							 = Players[activePlayerID]
local activePlayerTeam 						 = Teams[activePlayer:GetTeam()]
local convertTextKey 						 = Locale.ConvertTextKey
local mathFloor 							 = math.floor
local mathCeil 								 = math.ceil
local mathMin 								 = math.min
			 
local governmentDictatorshipID 				 = GameInfoTypes["GOVERNMENT_JFD_DICTATORSHIP"]
local governmentHolyRomeID 					 = GameInfoTypes["GOVERNMENT_JFD_HOLY_ROME"]
local governmentMonarchyID 					 = GameInfoTypes["GOVERNMENT_JFD_MONARCHY"]
local governmentRepublicID 					 = GameInfoTypes["GOVERNMENT_JFD_REPUBLIC"]
local governmentTheocracyID 				 = GameInfoTypes["GOVERNMENT_JFD_THEOCRACY"]
--=======================================================================================================================
-- AI FUNCTIONS
--=======================================================================================================================
-- GOVERNMENT
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Sovereignty_ReformCooldownChangesAI
local reformStateCityStateID = GameInfoTypes["REFORM_JFD_STATE_CITYSTATE"]
local reformStateEmpireID    = GameInfoTypes["REFORM_JFD_STATE_EMPIRE"]
local reformStateNationID    = GameInfoTypes["REFORM_JFD_STATE_NATION"]
function JFD_RTP_Sovereignty_ReformCooldownChangesAI(playerID, cooldown)
	local player = Players[playerID]
	if player:IsHuman() then return end
	if player:IsMinorCiv() then return end
	if player:IsBarbarian() then return end
	if (not player:HasGovernment()) then return end
	if (not cooldown) then cooldown = player:GetReformCooldown() end
	local numFreeReforms = JFD_GetNumFreeReforms(playerID)
	if (cooldown == 0 or numFreeReforms > 0) then
		local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
		local guaranteedReforms = {}
		local count = 1
		if (JFD_CanHaveReform(playerID, reformStateEmpireID, false) and player:GetNumCities() >= defineReformEmpireCitiesMin) then
			guaranteedReforms[count] = reformStateEmpireID
			count = count + 1
		elseif (JFD_CanHaveReform(playerID, reformStateCityStateID, false) and player:GetNumCities() <= defineReformCityStateCitiesMax) then
			guaranteedReforms[count] = reformStateCityStateID
			count = count + 1
		else
			guaranteedReforms[count] = reformStateNationID
			count = count + 1
		end
		for row in GameInfo.Leader_JFD_Reforms("LeaderType = '" .. leaderType .. "'") do
			local reformID = GameInfoTypes[row.ReformType]
			if JFD_CanHaveReform(playerID, reformID, false) then
				guaranteedReforms[count] = reformID
				count = count + 1
			end
		end
		if #guaranteedReforms > 0 then
			local chosenReformID = guaranteedReforms[JFD_GetRandom(1,#guaranteedReforms)]
			if chosenReformID then JFD_SetHasReform(playerID, chosenReformID, true) end	
		end
		local validReforms = {}
		local count = 1
		local governmentType = GameInfo.JFD_Governments[player:GetGovernment()].Type
		for reform in GameInfo.JFD_Reforms("IsDisabled = 0 AND (PrereqGovernment = '" .. governmentType .. "' OR PrereqGovernment IS NULL)") do
			local leaderAlignment = JFD_GetLeaderAlignment(playerID, reform.ReformBranchType)
			if (leaderAlignment and reform.Alignment == leaderAlignment) then
				local leaderFlavour =  JFD_GetLeaderFlavour(playerID, reform.ReformFlavourType)
				local reformID = reform.ID
				if JFD_CanHaveReform(playerID, reformID, false) then
					if (reform.ID == reformStateEmpireID and player:GetNumCities() <= defineReformEmpireCitiesMin) then
						reformID = reformStateCityStateID
					elseif (reform.ID == reformStateCityStateID and player:GetNumCities() >= defineReformCityStateCitiesMax) then
						reformID = reformStateEmpireID
					end
					for value = 1, leaderFlavour do
						validReforms[count] = reformID
						count = count + 1
					end
				end
			end
		end
		if #validReforms > 0 then
			local chosenReformID = validReforms[JFD_GetRandom(1,#validReforms)]
			if chosenReformID then JFD_SetHasReform(playerID, chosenReformID, true) end	
		end
	end
end
if userSettingSovereigntyCore then
	GameEvents.ReformCooldownChanges.Add(JFD_RTP_Sovereignty_ReformCooldownChangesAI)
	GameEvents.PlayerDoTurn.Add(JFD_RTP_Sovereignty_ReformCooldownChangesAI)
end

--JFD_RTP_Sovereignty_TeamSetEraAI
local eraMedievalID    				   = GameInfoTypes["ERA_MEDIEVAL"]
local eraRenaissanceID 				   = GameInfoTypes["ERA_RENAISSANCE"]
local reformExecutiveAbsoluteID 	   = GameInfoTypes["REFORM_JFD_EXECUTIVE_ABSOLUTE"]
local reformExecutiveConstitutionalID  = GameInfoTypes["REFORM_JFD_EXECUTIVE_CONSTITUTIONAL"]
function JFD_RTP_Sovereignty_TeamSetEraAI(teamID, eraID)
	local team = Teams[teamID]
	local playerID = team:GetLeaderID()
	local player = Players[playerID]
	if player:IsHuman() then return end
	if (not player:HasGovernment()) then return end
	JFD_ChangeNumFreeReforms(playerID, 2)
	local government = GameInfo.JFD_Governments[player:GetGovernment()]
	local flavourGovernment = JFD_GetLeaderFlavour(playerID, "FLAVOR_JFD_REFORM_GOVERNMENT")
	if eraID == eraRenaissanceID then
		if flavourGovernment >= 6 then
			if (not JFD_HasReform(playerID, reformExecutiveAbsoluteID)) then
				JFD_SetHasReform(playerID, reformExecutiveAbsoluteID, true)
			end
		else
			if (not JFD_HasReform(playerID, reformExecutiveConstitutionalID)) then
				JFD_SetHasReform(playerID, reformExecutiveConstitutionalID, true)
			end
		end
	end
	if eraID >= eraMedievalID then
		if JFD_HasLegislature(playerID) then return end
		if flavourGovernment >= 6 then
			for reform in GameInfo.JFD_Reforms("IsDisabled = 0 AND PrereqGovernment = '" .. government.Type .. "' AND Alignment = 'REFORM_RIGHT' AND IsLegislature = 1") do
				if (not JFD_HasReform(playerID, reform.ID)) then
					JFD_SetHasReform(playerID, reform.ID, true)
				end
			end
		else
			for reform in GameInfo.JFD_Reforms("IsDisabled = 0 AND PrereqGovernment = '" .. government.Type .. "' AND Alignment = 'REFORM_LEFT' AND IsLegislature = 1") do
				if (not JFD_HasReform(playerID, reform.ID)) then
					JFD_SetHasReform(playerID, reform.ID, true)
				end
			end
		end
	end
end
if userSettingSovereigntyCore then
	GameEvents.TeamSetEra.Add(JFD_RTP_Sovereignty_TeamSetEraAI)
end

--JFD_RTP_Sovereignty_UnitCreated
function JFD_RTP_Sovereignty_UnitCreated(playerID, unitID, unitType, plotX, plotY)
	local player = Players[playerID]
	if player:IsHuman() then return end
	if (not player:HasGovernment()) then return end
	local unit = player:GetUnitByID(unitID)
	if unit:IsGreatPerson() then
		for row in GameInfo.JFD_PrivyCouncillor_GreatPeople("UnitClassType = '" .. GameInfo.Units[unit:GetUnitType()].Class .. "'") do
			local policyID = GameInfoTypes[row.PolicyType]
			if player:HasPolicy(policyID) then return end
			break
		end
		LuaEvents.JFD_PrivyCouncillorAppointed(playerID, unitID)
	end
end
if userSettingSovereigntyCore then
	GameEvents.UnitCreated.Add(JFD_RTP_Sovereignty_UnitCreated)
end
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
-- GOVERNMENT
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Sovereignty_OnGovernment
function JFD_RTP_Sovereignty_OnGovernment(playerID, governmentID)
	local player = Players[playerID]
	local government = GameInfo.JFD_Governments[governmentID]
	if activePlayerTeam:IsHasMet(player:GetTeam()) then 
		local governmentDesc = government.Description
		if playerID == activePlayerID then
			Events.AudioPlay2DSound(government.AudioEffect)
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_GOVERNMENT_NOTIFICATION_TEXT", governmentDesc, player:GetCivilizationAdjective()), convertTextKey("TXT_KEY_JFD_GOVERNMENT_NOTIFICATION_SHORT_TEXT"), true)
		else
			activePlayer:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], convertTextKey("TXT_KEY_JFD_GOVERNMENT_NOTIFICATION_TEXT_OTHER", player:GetName(), governmentDesc, player:GetCivilizationAdjective()), "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
		end
	end
	JFD_SetHasAllDefaultReforms(playerID, governmentID)
	local legislatureName = government.TitleLegislature
	if governmentID ~= governmentHolyRomeID then
		if (governmentID == governmentTheocracyID and player:HasStateReligion()) then
			local religionType = GameInfo.Religions[player:GetStateReligion()].Type
			for row in GameInfo.Religion_JFD_Governments("ReligionType = '" .. religionType .. "' AND LegislatureName IS NOT NULL") do
				legislatureName = row.LegislatureName
				break
			end
		else
			local cultureID = JFD_GetCultureID(playerID)
			local cultureType = GameInfo.JFD_CultureTypes[cultureID].Type
			for row in GameInfo.JFD_CultureType_Governments("CultureType = '" .. cultureType .. "' AND LegislatureName IS NOT NULL") do
				legislatureName = row.LegislatureName
				break
			end
			local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
			for row in GameInfo.Civilization_JFD_Governments("CivilizationType = '" .. civType .. "' AND LegislatureName IS NOT NULL") do
				legislatureName = row.LegislatureName
				break
			end
		end
	end
	player:SetLegislatureName(legislatureName)
	local titleLeader = JFD_GetLeaderTitleShort(playerID, governmentID)
	local titleGovernment = JFD_GetGovernmentTitle(playerID, governmentID)
	JFD_SetGovernmentTitle(playerID, titleGovernment)
	JFD_SetLeaderTitle(playerID, titleLeader)
	if player:IsHuman() then 
		Events.SerialEventGameDataDirty() 
	end
	player:SetReformCooldown(0)
	JFD_RTP_Sovereignty(playerID)
	if (not player:HasGovernment()) then
		if government.FreeUnitClassType then
			local capital = player:GetCapitalCity()
			local unitID = player:GetSpecificUnitType(government.FreeUnitClassType)
			if capital then
				player:InitUnit(unitID, capital:GetX(), capital:GetY())
			else
				player:AddFreeUnit(unitID)
			end
		end
		if government.FreeGreatPeopleCount > 0 then
			player:ChangeNumFreeGreatPeople(government.FreeGreatPeopleCount)
		end
	end
	local maxSovereignty = JFD_GetMaxSovereignty(playerID)
	if player:GetSovereignty() < maxSovereignty then
		JFD_ChangeNumFreeGovernmentSwitches(playerID, -1)
	end
end	
if userSettingSovereigntyCore then
	GameEvents.PlayerAdoptsGovernment.Add(JFD_RTP_Sovereignty_OnGovernment)
end

--JFD_RTP_Sovereignty_TeamSetEra
function JFD_RTP_Sovereignty_TeamSetEra(teamID, eraID)
	if eraID ~= eraRenaissanceID then return end
	local team = Teams[teamID]
	local playerID = team:GetLeaderID()
	local player = Players[playerID]
	if (not player:HasGovernment()) then return end
	if player:GetGovernment() ~= governmentRepublicID then return end
	local leaderTitle = JFD_GetLeaderTitleShort(playerID, governmentRepublicID, true)
	JFD_SetLeaderTitle(playerID, leaderTitle)
end
if userSettingSovereigntyCore then
	GameEvents.TeamSetEra.Add(JFD_RTP_Sovereignty_TeamSetEra)
end
-----------------
-- LEGISLATURE
-----------------
--JFD_RTP_GovernmentCooldown
function JFD_RTP_GovernmentCooldown(playerID, cooldown)
	local player = Players[playerID]
	if cooldown == 5 then
		JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_GOVERNMENT_ELECTION_IMMINENT_TEXT"), convertTextKey("TXT_KEY_JFD_GOVERNMENT_ELECTION_IMMINENT_SHORT_TEXT"), false, -1, -1)
	elseif cooldown == 0 then 
		JFD_ResetLegislature(playerID, player:GetLateGamePolicyTree())
	end
end
if userSettingSovereigntyCore then
	GameEvents.GovernmentCooldownChanges.Add(JFD_RTP_GovernmentCooldown)
end
-----------------
-- INIT
-----------------
--JFD_RTP_Sovereignty_OnInit
function JFD_RTP_Sovereignty_OnInit()
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local player = Players[playerID]
		if (player:IsAlive() and (not player:HasGovernment())) then
			local titleLeader = JFD_GetLeaderTitleShort(playerID)
			local titleGovernment = JFD_GetGovernmentTitle(playerID)
			JFD_SetLeaderTitle(playerID, titleLeader)
			JFD_SetGovernmentTitle(playerID, titleGovernment)
			if JFD_CanAdoptAnyGovernment(playerID) then
				if player:IsHuman() then
					JFD_SendNotification(playerID, "NOTIFICATION_JFD_CHOOSE_GOVERNMENT", convertTextKey("TXT_KEY_JFD_CAN_GOVERNMENT_NOTIFICATION_TEXT"), convertTextKey("TXT_KEY_JFD_CAN_GOVERNMENT_NOTIFICATION_SHORT_TEXT"))	
				else
					local governmentID = JFD_GetPreferredGovernmentID(playerID)
					player:SetGovernment(governmentID)
				end
			end
		end
	end
end
if userSettingSovereigntyCore then
	Events.LoadScreenClose.Add(JFD_RTP_Sovereignty_OnInit)
end

--JFD_RTP_Sovereignty_TechResearched
function JFD_RTP_Sovereignty_TechResearched(teamID, techID)
	local playerID = Teams[teamID]:GetLeaderID()
	local player = Players[playerID]
	if player:IsBarbarian() then return end
	if player:IsMinorCiv() then return end
	if player:HasGovernment() then return end
	local techType = GameInfo.Technologies[techID].Type
	for row in GameInfo.Technologies_JFD_MiscEffects("AllowGovernments == 1 AND TechType = '" .. techType .."'") do
		if player:IsHuman() then
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_CHOOSE_GOVERNMENT", convertTextKey("TXT_KEY_JFD_CAN_GOVERNMENT_NOTIFICATION_TEXT"), convertTextKey("TXT_KEY_JFD_CAN_GOVERNMENT_NOTIFICATION_SHORT_TEXT"))	
		else
			local governmentID = JFD_GetPreferredGovernmentID(playerID)
			player:SetGovernment(governmentID)
		end
	end
end
if userSettingSovereigntyCore then
	GameEvents.TeamTechResearched.Add(JFD_RTP_Sovereignty_TechResearched)
end

--JFD_RTP_Sovereignty_InitOnSettle
function JFD_RTP_Sovereignty_InitOnSettle(playerID, plotX, plotY)
	local player = Players[playerID]
	local plot = Map.GetPlot(plotX, plotY)
	local city = plot:GetPlotCity()
	if (not player:IsAlive()) then return end
	if (not city) then return end
	if (not city:IsCapital()) then return end
	local currentEraID = (player:GetCurrentEra()-1)
	if currentEraID > 0 then
		JFD_SetNumFreeReforms(playerID, currentEraID)
	end
end
if userSettingSovereigntyCore then
	GameEvents.PlayerCityFounded.Add(JFD_RTP_Sovereignty_InitOnSettle)
end
-----------------
-- STATE RELIGION
-----------------
--JFD_RTP_Sovereignty_StateReligionAdopted
function JFD_RTP_Sovereignty_StateReligionAdopted(playerID, religionID)
	local player = Players[playerID]
	if player:GetReligionCreatedByPlayer() <= 0 then return end
	if player:GetReligionCreatedByPlayer() ~= religionID then return end
	if player:GetGovernment() == governmentTheocracyID then return end
	if (player:IsHuman() and player:HasGovernment()) then
		JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", Locale.ConvertTextKey("TXT_KEY_JFD_THEOCRACY_AVAILABLE_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_JFD_THEOCRACY_AVAILABLE_NOTIFICATION_SHORT"), false)
	end
	JFD_SetNumFreeGovernmentSwitches(playerID, 1)
	if player:IsHuman() then return end
	if JFD_GetLeaderFlavour(playerID, "FLAVOR_JFD_STATE_RELIGION") < 6 then return end
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	local governmentWeight = JFD_GetRandom(1,10)*5
	for row in GameInfo.Civilization_JFD_Governments("CivilizationType = '" .. civType .. "' AND GovernmentType = 'GOVERNMENT_JFD_THEOCRACY'") do
		governmentWeight = row.Weight
		break
	end
	if governmentWeight == 0 then
		local cultureID = JFD_GetCultureID(playerID)
		local cultureType = GameInfo.JFD_CultureTypes[cultureID].Type
		for row in GameInfo.JFD_CultureType_Governments("CultureType = '" .. cultureType .. "' AND GovernmentType = 'GOVERNMENT_JFD_THEOCRACY'") do
			governmentWeight = row.Weight
			break
		end
	end
	if JFD_GetRandom(1,100) <= governmentWeight then
		player:SetGovernment(governmentTheocracyID)
	end
end
if userSettingSovereigntyCore then
	GameEvents.PlayerStateReligionAdopted.Add(JFD_RTP_Sovereignty_StateReligionAdopted)
end
-----------------
-- IDEOLOGY
-----------------
--JFD_RTP_Sovereignty_IdeologyAdopted
function JFD_RTP_Sovereignty_IdeologyAdopted(playerID, newIdeologyID)
	JFD_ResetLegislature(playerID, newIdeologyID)
	local player = Players[playerID]
	if (player:IsHuman() and player:HasGovernment()) then
		JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", Locale.ConvertTextKey("TXT_KEY_JFD_DICTATORSHIP_AVAILABLE_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_JFD_DICTATORSHIP_AVAILABLE_NOTIFICATION_SHORT"), false)
	end
	JFD_ChangeNumFreeGovernmentSwitches(playerID, 1)
	if player:IsHuman() then return end
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	local governmentWeight = JFD_GetRandom(1,10)*5
	for row in GameInfo.Civilization_JFD_Governments("CivilizationType = '" .. civType .. "' AND GovernmentType = 'GOVERNMENT_JFD_DICTATORSHIP'") do
		governmentWeight = row.Weight
		break
	end
	if governmentWeight == 0 then
		local cultureID = JFD_GetCultureID(playerID)
		local cultureType = GameInfo.JFD_CultureTypes[cultureID].Type
		for row in GameInfo.JFD_CultureType_Governments("CultureType = '" .. cultureType .. "' AND GovernmentType = 'GOVERNMENT_JFD_DICTATORSHIP'") do
			governmentWeight = row.Weight
			break
		end
	end
	if JFD_GetRandom(1,100) <= governmentWeight then
		player:SetGovernment(governmentDictatorshipID)
	end
end
if userSettingSovereigntyCore then
	GameEvents.IdeologyAdopted.Add(JFD_RTP_Sovereignty_IdeologyAdopted)
end

--JFD_RTP_Sovereignty_IdeologySwitched
function JFD_RTP_Sovereignty_IdeologySwitched(playerID, oldIdeologyID, newIdeologyID)
	JFD_ResetLegislature(playerID, newIdeologyID)
	local player = Players[playerID]
	if player:IsHuman() then return end
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	local governmentWeight = 0
	for row in GameInfo.Civilization_JFD_Governments("CivilizationType = '" .. civType .. "' AND GovernmentType = 'GOVERNMENT_JFD_DICTATORSHIP'") do
		governmentWeight = row.Weight
		break
	end
	if governmentWeight == 0 then
		local cultureID = JFD_GetCultureID(playerID)
		local cultureType = GameInfo.JFD_CultureTypes[cultureID].Type
		for row in GameInfo.JFD_CultureType_Governments("CultureType = '" .. cultureType .. "' AND GovernmentType = 'GOVERNMENT_JFD_DICTATORSHIP'") do
			governmentWeight = row.Weight
			break
		end
	end
	if JFD_GetRandom(1,100) <= governmentWeight then
		player:SetGovernment(governmentDictatorshipID)
	end
end
if userSettingSovereigntyCore then
	GameEvents.IdeologySwitched.Add(JFD_RTP_Sovereignty_IdeologySwitched)
end
------------------------------------------------------------------------------------------------------------------------
-- REFORMS
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_ReformCooldown
function JFD_RTP_ReformCooldown(playerID, cooldown)
	local player = Players[playerID]
	if (not player:IsHuman()) then return end
	if cooldown == 0 then
		Events.AudioPlay2DSound("AS2D_JFD_REFORM_PASSABLE")
		JFD_SendNotification(playerID, "NOTIFICATION_JFD_REFORM", convertTextKey("TXT_KEY_JFD_REFORM_COOLDOWN_ENDS_TEXT"), convertTextKey("TXT_KEY_JFD_REFORM_COOLDOWN_ENDS_SHORT_TEXT"), false, -1, -1)
	end
end
if userSettingSovereigntyCore then
	GameEvents.ReformCooldownChanges.Add(JFD_RTP_ReformCooldown)
end

--JFD_RTP_Sovereignty_TeamSetEra
--function JFD_RTP_Sovereignty_TeamSetEra(teamID, eraID)
--	local team = Teams[teamID]
--	local playerID = team:GetLeaderID()
--	local player = Players[playerID]
--	if (not player:IsHuman()) then return end
--	if (not player:HasGovernment()) then return end
--	print("new era", player:GetCurrentEra(), eraID)
--	local reformList = ""
--	for reform in GameInfo.JFD_Reforms("IsDisabled = 0 AND PrereqEra = '" .. GameInfo.Eras[eraID].Type .. "' AND PrereqGovernment = '" .. GameInfo.JFD_Governments[player:GetGovernment()].Type .. "' OR PrereqGovernment IS NULL") do
--		reformList = reformList .. "[NEWLINE][ICON_BULLET]" .. convertTextKey(reform.ShortDescription) .. " ([COLOR_POSITIVE_TEXT]" .. convertTextKey(reform. HeaderDescription) .. "[ENDCOLOR])"
--	end
--	num = num + 1
--	print("num", num)
--	if reformList ~= "" then
--		JFD_SendNotification(playerID, "NOTIFICATION_JFD_REFORM", convertTextKey("TXT_KEY_NOTIFICATION_JFD_NEW_ERA_TEXT", reformList), convertTextKey("TXT_KEY_NOTIFICATION_JFD_NEW_ERA_SHORT_TEXT"), false, -1, -1)
--	end
--end
--if userSettingSovereigntyCore then
--	--GameEvents.TeamSetEra.Add(JFD_RTP_Sovereignty_TeamSetEra)
--end
------------------
-- UNITS
------------------
--JFD_RTP_Sovereignty_OnUnitTrained
function JFD_RTP_Sovereignty_OnUnitTrained(playerID, cityID, unitID, isGold, isFaith)
	local player = Players[playerID] 
	local unit = player:GetUnitByID(unitID)
	if isFaith then
		for row in GameInfo.JFD_Reform_FreePromotions("RequiresFaithPurchase = 1") do
			if (row.IsCombatOnly and (not unit:IsCombatUnit())) then return end
			if (row.IsCivilianOnly and unit:IsCombatUnit()) then return end
			if JFD_HasReform(playerID, GameInfoTypes[row.ReformType]) then
				unit:SetHasPromotion(GameInfoTypes[row.PromotionType], true)
			end
		end
	end
	for row in GameInfo.JFD_Reform_FreePromotions("RequiresFaithPurchase = 0") do
		if (row.IsCombatOnly and (not unit:IsCombatUnit())) then return end
		if (row.IsCivilianOnly and unit:IsCombatUnit()) then return end
		if JFD_HasReform(playerID, GameInfoTypes[row.ReformType]) then
			unit:SetHasPromotion(GameInfoTypes[row.PromotionType], true)
		end
	end
end
if userSettingSovereigntyCore then
	GameEvents.CityTrained.Add(JFD_RTP_Sovereignty_OnUnitTrained)
end
--------------------------------------------------------------------------------------------------------------------------
-- SOVEREIGNTY
--------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Sovereignty
function JFD_RTP_Sovereignty(playerID)
	local playerID = playerID or activePlayerID
	local sovereignty = JFD_CalculateSovereignty(playerID)
	Players[playerID]:SetSovereignty(sovereignty)
end
if userSettingSovereigntyCore then
	-- Events.ActivePlayerTurnStart.Add(JFD_RTP_Sovereignty)
	GameEvents.PlayerDoTurn.Add(JFD_RTP_Sovereignty)
end
--------------------------------------------------------------------------------------------------------------------------
-- UNITS
--------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Sovereignty_PlayerCanTrain
local reformLabourEmancipatedID = GameInfoTypes["REFORM_JFD_LABOUR_EMANCIPATED"]
local unitClassSlaveWorkerID 	= GameInfoTypes["UNITCLASS_JFD_SLAVE"]
function JFD_RTP_Sovereignty_PlayerCanTrain(playerID, unitID)
	local player = Players[playerID]
	if unitID == unitClassSlaveWorkerID then
		if JFD_HasReform(playerID, reformLabourEmancipatedID) then
			return false
		end
	end
	return true
end
GameEvents.PlayerCanTrain.Add(JFD_RTP_Sovereignty_PlayerCanTrain)
------------------
-- MISSIONS
------------------
--JFD_RTP_Sovereignty_MissionStart
local CUSTOM_MISSION_NO_ACTION		 = 0
local CUSTOM_MISSION_ACTION			 = 1
local CUSTOM_MISSION_DONE			 = 2
local CUSTOM_MISSION_ACTION_AND_DONE = 3
local missionJoinCouncilID			 = GameInfoTypes["MISSION_JFD_JOIN_COUNCIL"]

function JFD_RTP_Sovereignty_MissionStart(playerID, unitID, missionID, data1, data2, flags, turn)
	if missionID == missionJoinCouncilID then
		LuaEvents.JFD_PrivyCouncillorAppointed(playerID, unitID)
		return CUSTOM_MISSION_ACTION
	end
	return CUSTOM_MISSION_NO_ACTION
end
GameEvents.CustomMissionStart.Add(JFD_RTP_Sovereignty_MissionStart)

--JFD_RTP_Sovereignty_MissionCompleted
function JFD_RTP_Sovereignty_MissionCompleted(playerID, unitID, missionID, data1, data2, flags, turn)
    if missionID == missionJoinCouncilID then return true end
	return false
end
GameEvents.CustomMissionCompleted.Add(JFD_RTP_Sovereignty_MissionCompleted)

--JFD_RTP_Sovereignty_PrivyCouncillorAppointed
function JFD_RTP_Sovereignty_PrivyCouncillorAppointed(playerID, unitID)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local unitClass = GameInfo.Units[unit:GetUnitType()].Class
	local privyCouncillorType = nil
	for row in GameInfo.JFD_PrivyCouncillor_GreatPeople("UnitClassType = '" .. unitClass .. "'") do
		privyCouncillorType = row.PrivyCouncillorType
	end
	if (not privyCouncillorType) then return end
	for row in GameInfo.JFD_PrivyCouncillor_GreatPeople("PrivyCouncillorType = '" .. privyCouncillorType .. "'") do
		local policyID = GameInfoTypes[row.PolicyType]
		if row.UnitClassType == unitClass then
			local privyCouncillorID = GameInfoTypes[row.PrivyCouncillorType]
			player:GrantPolicy(policyID, true)
			if player:IsHuman() then
				JFD_RTP[privyCouncillorID] = unit:GetNameNoDesc()
				local hex = ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))
				JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_PRIVY_COUNCILLOR_NOTIFICATION_TEXT", JFD_GetPrivyCouncillorTitle(playerID, privyCouncillorID), unit:GetNameNoDesc()), convertTextKey("TXT_KEY_JFD_PRIVY_COUNCILLOR_NOTIFICATION_SHORT_TEXT"), true)
				Events.AudioPlay2DSound("AS2D_JFD_PRIVY_COUNCILLOR")
			end
		else
			player:RevokePolicy(policyID)
		end
	end
	unit:greatperson()
end
if userSettingSovereigntyCore then
	LuaEvents.JFD_PrivyCouncillorAppointed.Add(JFD_RTP_Sovereignty_PrivyCouncillorAppointed)
end
--------------------------------------------------------------------------------------------------------------------------
---- WONDERS
--------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Sovereignty_CityCanConstruct
function JFD_RTP_Sovereignty_CityCanConstruct(playerID, cityID, buildingID)
	local player = Players[playerID]
	local building = GameInfo.Buildings[buildingID]
	if building.GovernmentType then
		if player:GetGovernment() ~= GameInfoTypes[building.GovernmentType] then
			return false
		end
	end
	return true
end
GameEvents.CityCanConstruct.Add(JFD_RTP_Sovereignty_CityCanConstruct)

--JFD_RTP_Sovereignty_FoundsGovernment
function JFD_RTP_Sovereignty_FoundsGovernment(playerID, cityID, buildingID)
	local player = Players[playerID]
	local building = GameInfo.Buildings[buildingID]
	if building.FreeGovernmentSwitches > 0 then
		JFD_ChangeNumFreeGovernmentSwitches(playerID, building.FreeGovernmentSwitches)
	end
	for government in GameInfo.JFD_Governments("RequiresBuilding = '" .. building.Type .. "'") do
		if player:GetGovernment() == government.ID then break end
		if (player:IsHuman() and player:HasGovernment()) then
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", Locale.ConvertTextKey("TXT_KEY_JFD_HOLY_ROME_AVAILABLE_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_JFD_HOLY_ROME_AVAILABLE_NOTIFICATION_SHORT"), false)
		end
		if player:IsHuman() then return end
		local flavourDiplomacy = JFD_GetLeaderFlavour(playerID, "FLAVOR_JFD_DIPLOMACY")
		if flavourDiplomacy < 6 then break end
		local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
		local governmentWeight = (flavourDiplomacy*10)
		for row in GameInfo.Civilization_JFD_Governments("CivilizationType = '" .. civType .. "' AND GovernmentType = 'GOVERNMENT_JFD_HOLY_ROME'") do
			governmentWeight = row.Weight
			break
		end
		if governmentWeight == 0 then
			local cultureID = JFD_GetCultureID(playerID)
			local cultureType = GameInfo.JFD_CultureTypes[cultureID].Type
			for row in GameInfo.JFD_CultureType_Governments("CultureType = '" .. cultureType .. "' AND GovernmentType = 'GOVERNMENT_JFD_HOLY_ROME'") do
				governmentWeight = row.Weight
				break
			end
		end
		if JFD_GetRandom(1,100) <= governmentWeight then
			player:SetGovernment(governmentHolyRomeID)
		end	
	end
	if player:HasGovernment() then return end
	if building.FoundsGovernment then
		if player:IsHuman() then
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_CHOOSE_GOVERNMENT", convertTextKey("TXT_KEY_JFD_CAN_GOVERNMENT_NOTIFICATION_TEXT"), convertTextKey("TXT_KEY_JFD_CAN_GOVERNMENT_NOTIFICATION_SHORT_TEXT"))	
		else
			local governmentID = JFD_GetPreferredGovernmentID(playerID)
			player:SetGovernment(governmentID)
		end
	end
end
if userSettingSovereigntyCore then
	GameEvents.CityConstructed.Add(JFD_RTP_Sovereignty_FoundsGovernment)
end
--------------------------------------------------------------------------------------------------------------------------
-- DIPLOMACY
--------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Sovereignty_DiploModifiers
local buildingClassDogesPalaceID = GameInfoTypes["BUILDINGCLASS_JFD_DOGES_PALACE"]
local buildingClassStPetersID	 = GameInfoTypes["BUILDINGCLASS_JFD_ST_PETERS"]
local buildingClassVersaillesID	 = GameInfoTypes["BUILDINGCLASS_JFD_VERSAILLES"]
local diploModDogesPalaceID		 = GameInfoTypes["DIPLOMODIFIER_JFD_DOGES_PALACE"]
local diploModTheocracyID		 = GameInfoTypes["DIPLOMODIFIER_JFD_THEOCRACY"]
local diploModVersaillesID		 = GameInfoTypes["DIPLOMODIFIER_JFD_VERSAILLES"]
local governmentMonarchyID		 = GameInfoTypes["GOVERNMENT_JFD_MONARCHY"]
local governmentRepublicID		 = GameInfoTypes["GOVERNMENT_JFD_REPUBLIC"]
function JFD_RTP_Sovereignty_DiploModifiers(diploModifierID, fromPlayerID, toPlayerID)
	local diploModifier = 0
	local fromPlayer = Players[fromPlayerID]
	local fromPlayerGovernmentID = fromPlayer:GetGovernment() or -1
	local fromPlayerStateReligionID = fromPlayer:GetStateReligion() or -1
	local toPlayer = Players[toPlayerID]
	local toPlayerGovernmentID = toPlayer:GetGovernment() or -1
	local toPlayerStateReligionID = toPlayer:GetStateReligion() or -1
	if diploModifierID == diploModDogesPalaceID then
		if (toPlayer:HasBuildingClass(buildingClassDogesPalaceID) and toPlayerGovernmentID == governmentRepublicID and fromPlayerGovernmentID == governmentRepublicID) then
			diploModifier = -30
		end
	end
	if diploModifierID == diploModTheocracyID then
		if (toPlayer:HasBuildingClass(buildingClassStPetersID) and toPlayerStateReligionID == fromPlayerStateReligionID) then
			diploModifier = -50
		end
	end
	if diploModifierID == diploModVersaillesID then
		if (toPlayer:HasBuildingClass(buildingClassVersaillesID) and toPlayerGovernmentID == governmentMonarchyID and fromPlayerGovernmentID == governmentMonarchyID) then
			diploModifier = -30
		end
	end
	return diploModifier
end
GameEvents.GetDiploModifier.Add(JFD_RTP_Sovereignty_DiploModifiers)
--=======================================================================================================================
--=======================================================================================================================