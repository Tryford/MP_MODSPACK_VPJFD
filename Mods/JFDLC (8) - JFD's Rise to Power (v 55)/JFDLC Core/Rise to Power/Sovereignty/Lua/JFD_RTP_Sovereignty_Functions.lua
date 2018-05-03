-- JFD_RTP_Sovereignty_Functions
-- Author: JFD
-- DateCreated: 11/5/2015 11:39:39 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFDLCUtils.lua")
include("JFD_RTP_SovereigntyUtils.lua")
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingRTPSovereigntyCore			= (Game.GetUserSetting("JFD_RTP_SOVEREIGNTY_CORE") == 1)
local userSettingRTPSovereigntyHimeji		= (Game.GetUserSetting("JFD_RTP_SOVEREIGNTY_WONDER_CHANGES_HIMEJI_CASTLE") == 1)
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
local gameSpeedID 							 = Game.GetGameSpeedType()
local gameSpeed 							 = GameInfo.GameSpeeds[gameSpeedID]
local gameSpeedMod							 = (gameSpeed.BuildPercent/100) 

local defineRTPReformCityStateCitiesMax 	 = GameDefines["JFD_RTP_SOVEREIGNTY_REFORM_CITY_STATE_MAX_CITIES"]
local defineRTPReformEmpireCitiesMin 	 	 = GameDefines["JFD_RTP_SOVEREIGNTY_REFORM_EMPIRE_MIN_CITIES"]
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local activePlayerID 						 = Game.GetActivePlayer()
local activePlayer 							 = Players[activePlayerID]
local activePlayerTeam 						 = Teams[activePlayer:GetTeam()]
local convertTextKey 						 = Locale.ConvertTextKey
local mathMin 								 = math.min
			 
local governmentDictatorshipID 				 = GameInfoTypes["GOVERNMENT_JFD_DICTATORSHIP"]
local governmentHolyRomeID 					 = GameInfoTypes["GOVERNMENT_JFD_HOLY_ROME"]
local governmentMonarchyID 					 = GameInfoTypes["GOVERNMENT_JFD_MONARCHY"]
local governmentRepublicID 					 = GameInfoTypes["GOVERNMENT_JFD_REPUBLIC"]
local governmentShogunateID 				 = GameInfoTypes["GOVERNMENT_JFD_SHOGUNATE"]
local governmentTheocracyID 				 = GameInfoTypes["GOVERNMENT_JFD_THEOCRACY"]
--=======================================================================================================================
-- AI FUNCTIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
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
	local numFreeReforms = player:GetNumFreeReforms()
	if (cooldown == 0 or numFreeReforms > 0) then
		local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
		local guaranteedReforms = {}
		local count = 1
		if (player:CanHaveReform(reformStateEmpireID) and player:GetNumCities() >= defineRTPReformEmpireCitiesMin) then
			guaranteedReforms[count] = reformStateEmpireID
			count = count + 1
		elseif (player:CanHaveReform(reformStateCityStateID) and player:GetNumCities() <= defineRTPReformCityStateCitiesMax) then
			guaranteedReforms[count] = reformStateCityStateID
			count = count + 1
		else
			guaranteedReforms[count] = reformStateNationID
			count = count + 1
		end
		for row in GameInfo.Leader_JFD_Reforms("LeaderType = '" .. leaderType .. "'") do
			local reformID = GameInfoTypes[row.ReformType]
			if player:CanHaveReform(reformID) then
				guaranteedReforms[count] = reformID
				count = count + 1
			end
		end
		if #guaranteedReforms > 0 then
			local chosenReformID = guaranteedReforms[Game.GetRandom(1,#guaranteedReforms)]
			if chosenReformID then player:SetHasReform(chosenReformID, true) end	
		end
		local validReforms = {}
		local count = 1
		local governmentType = GameInfo.JFD_Governments[player:GetGovernment()].Type
		for reform in GameInfo.JFD_Reforms("IsDisabled = 0 AND (PrereqGovernment = '" .. governmentType .. "' OR PrereqGovernment IS NULL)") do
			local leaderAlignment = player:GetReformBranchAlignment(reform.ReformBranchType)
			if (leaderAlignment and reform.Alignment == leaderAlignment) then
				local leaderFlavour =  player:GetFlavorValue(reform.ReformFlavourType)
				local reformID = reform.ID
				if player:CanHaveReform(reformID) then
					if (reform.ID == reformStateEmpireID and player:GetNumCities() <= defineRTPReformEmpireCitiesMin) then
						reformID = reformStateCityStateID
					elseif (reform.ID == reformStateCityStateID and player:GetNumCities() >= defineRTPReformCityStateCitiesMax) then
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
			local chosenReformID = validReforms[Game.GetRandom(1,#validReforms)]
			if chosenReformID then player:SetHasReform(chosenReformID, true) end	
		end
	end
end
if userSettingRTPSovereigntyCore then
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
	player:ChangeNumFreeReforms(2)
	local government = GameInfo.JFD_Governments[player:GetGovernment()]
	local flavourGovernment = player:GetFlavorValue("FLAVOR_JFD_REFORM_GOVERNMENT")
	if eraID == eraRenaissanceID then
		if flavourGovernment >= 6 then
			if (not player:HasReform(reformExecutiveAbsoluteID)) then
				player:SetHasReform(reformExecutiveAbsoluteID, true)
			end
		else
			if (not player:HasReform(reformExecutiveConstitutionalID)) then
				player:SetHasReform(reformExecutiveConstitutionalID, true)
			end
		end
	end
	if eraID >= eraMedievalID then
		if player:HasLegislature() then return end
		if flavourGovernment >= 6 then
			for reform in GameInfo.JFD_Reforms("IsDisabled = 0 AND PrereqGovernment = '" .. government.Type .. "' AND Alignment = 'REFORM_RIGHT' AND IsLegislature = 1") do
				if (not player:HasReform(reform.ID)) then
					player:SetHasReform(reform.ID, true)
				end
			end
		else
			for reform in GameInfo.JFD_Reforms("IsDisabled = 0 AND PrereqGovernment = '" .. government.Type .. "' AND Alignment = 'REFORM_LEFT' AND IsLegislature = 1") do
				if (not player:HasReform(reform.ID)) then
					player:SetHasReform(reform.ID, true)
				end
			end
		end
	end
end
if userSettingRTPSovereigntyCore then
	GameEvents.TeamSetEra.Add(JFD_RTP_Sovereignty_TeamSetEraAI)
end

--JFD_RTP_Sovereignty_UnitCreatedAI
function JFD_RTP_Sovereignty_UnitCreatedAI(playerID, unitID, unitType, plotX, plotY)
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
if userSettingRTPSovereigntyCore then
	GameEvents.UnitCreated.Add(JFD_RTP_Sovereignty_UnitCreatedAI)
end
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- GOVERNMENT
------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Sovereignty_OnGovernment
function JFD_RTP_Sovereignty_OnGovernment(playerID, governmentID)
	local player = Players[playerID]
	local government = GameInfo.JFD_Governments[governmentID]
	local numFreeReforms = player:GetNumFreeReforms()
	if activePlayerTeam:IsHasMet(player:GetTeam()) then 
		local governmentDesc = government.Description
		if playerID == activePlayerID then
			Events.AudioPlay2DSound(government.AudioEffect)
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_GOVERNMENT_NOTIFICATION_TEXT", governmentDesc, player:GetCivilizationAdjective()), convertTextKey("TXT_KEY_JFD_GOVERNMENT_NOTIFICATION_SHORT_TEXT"), true)
		else
			activePlayer:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], convertTextKey("TXT_KEY_JFD_GOVERNMENT_NOTIFICATION_TEXT_OTHER", player:GetName(), governmentDesc, player:GetCivilizationAdjective()), "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
		end
	end
	player:SetHasAllDefaultReforms(governmentID, isGovernmentFounding)
	local legislatureName = government.TitleLegislature
	if governmentID ~= governmentHolyRomeID then
		if (governmentID == governmentTheocracyID and player:HasStateReligion()) then
			local religionType = GameInfo.Religions[player:GetStateReligion()].Type
			for row in GameInfo.Religion_JFD_Governments("ReligionType = '" .. religionType .. "' AND LegislatureName IS NOT NULL") do
				legislatureName = row.LegislatureName
				break
			end
		else
			local cultureID = player:GetCultureType()
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
	player:SetGovernmentTitle(player:GetGovernmentTitle(governmentID))
	player:SetLeaderTitle(player:GetLeaderTitleShort(governmentID))
	if player:IsHuman() then Events.SerialEventGameDataDirty() end
	player:SetReformCooldown(0)
	JFD_RTP_Sovereignty(playerID)
	if (not player:HasGovernment()) then
		if government.FreeUnitClassType then
			local capital = player:GetCapitalCity()
			local unitID = player:GetSpecificUnitType(government.FreeUnitClassType)
			if capital then
				player:InitUnit(unitID, capital:GetX(), capital:GetY()):JumpToNearestValidPlot()
			else
				player:AddFreeUnit(unitID)
			end
		end
		if government.FreeUnitClassTypeSecond then
			local capital = player:GetCapitalCity()
			local unitID = player:GetSpecificUnitType(government.FreeUnitClassTypeSecond)
			if capital then
				player:InitUnit(unitID, capital:GetX(), capital:GetY()):JumpToNearestValidPlot()
			else
				player:AddFreeUnit(unitID)
			end
		end
		if government.FreeGreatPeopleCount > 0 then
			player:ChangeNumFreeGreatPeople(government.FreeGreatPeopleCount)
		end
	end
	if player:GetSovereignty() < player:GetMaxSovereignty() then
		player:ChangeNumFreeGovernmentChanges(-1)
	end
	player:ChangeNumFreeReforms(numFreeReforms)
end	
if userSettingRTPSovereigntyCore then
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
	player:SetLeaderTitle(player:GetLeaderTitleShort(governmentRepublicID, true))
end
if userSettingRTPSovereigntyCore then
	GameEvents.TeamSetEra.Add(JFD_RTP_Sovereignty_TeamSetEra)
end
-----------------
-- LEGISLATURE
-----------------
--JFD_RTP_GovernmentCooldown
function JFD_RTP_GovernmentCooldown(playerID, cooldown)
	local player = Players[playerID]
	if cooldown == 5 then
		if player:GetGovernment() == governmentShogunateID then
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_GOVERNMENT_ELECTION_IMMINENT_SHOGUNATE_TEXT", player:GetPoliticLeaderKey()), convertTextKey("TXT_KEY_JFD_GOVERNMENT_ELECTION_IMMINENT_SHOGUNATE_SHORT_TEXT"), false, -1, -1)
		else
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_GOVERNMENT_ELECTION_IMMINENT_TEXT"), convertTextKey("TXT_KEY_JFD_GOVERNMENT_ELECTION_IMMINENT_SHORT_TEXT"), false, -1, -1)
		end
	elseif cooldown == 0 then 
		player:ResetLegislature(player:GetLateGamePolicyTree())
	end
end
if userSettingRTPSovereigntyCore then
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
			player:SetLeaderTitle(player:GetLeaderTitleShort())
			player:SetGovernmentTitle(player:GetGovernmentTitle())
			if player:CanHaveAnyGovernment() then
				if player:IsHuman() then
					JFD_SendNotification(playerID, "NOTIFICATION_JFD_CHOOSE_GOVERNMENT", convertTextKey("TXT_KEY_JFD_CAN_GOVERNMENT_NOTIFICATION_TEXT"), convertTextKey("TXT_KEY_JFD_CAN_GOVERNMENT_NOTIFICATION_SHORT_TEXT"))	
				else
					local governmentID = player:GetGovernmentPreference()
					player:SetGovernment(governmentID)
				end
			end
		end
	end
end
if userSettingRTPSovereigntyCore then
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
			player:SetGovernment(player:GetGovernmentPreference())
		end
	end
end
if userSettingRTPSovereigntyCore then
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
		player:SetNumFreeReforms(currentEraID)
	end
end
if userSettingRTPSovereigntyCore then
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
	player:SetNumFreeGovernmentChanges(1)
	if player:IsHuman() then return end
	if player:GetFlavorValue("FLAVOR_JFD_STATE_RELIGION") < 6 then return end
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	local governmentWeight = Game.GetRandom(1,10)*5
	for row in GameInfo.Civilization_JFD_Governments("CivilizationType = '" .. civType .. "' AND GovernmentType = 'GOVERNMENT_JFD_THEOCRACY'") do
		governmentWeight = row.Weight
		break
	end
	if governmentWeight == 0 then
		local cultureID = player:GetCultureType()
		local cultureType = GameInfo.JFD_CultureTypes[cultureID].Type
		for row in GameInfo.JFD_CultureType_Governments("CultureType = '" .. cultureType .. "' AND GovernmentType = 'GOVERNMENT_JFD_THEOCRACY'") do
			governmentWeight = row.Weight
			break
		end
	end
	if Game.GetRandom(1,100) <= governmentWeight then
		player:SetGovernment(governmentTheocracyID)
	end
end
if userSettingRTPSovereigntyCore then
	GameEvents.PlayerStateReligionAdopted.Add(JFD_RTP_Sovereignty_StateReligionAdopted)
end
-----------------
-- IDEOLOGY
-----------------
--JFD_RTP_Sovereignty_IdeologyAdopted
function JFD_RTP_Sovereignty_IdeologyAdopted(playerID, newIdeologyID)
	local player = Players[playerID]
	player:ResetLegislature(newIdeologyID)
	if (player:IsHuman() and player:HasGovernment()) then
		JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", Locale.ConvertTextKey("TXT_KEY_JFD_DICTATORSHIP_AVAILABLE_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_JFD_DICTATORSHIP_AVAILABLE_NOTIFICATION_SHORT"), false)
	end
	player:SetNumFreeGovernmentChanges(1)
	if player:IsHuman() then return end
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	local governmentWeight = Game.GetRandom(1,10)*5
	for row in GameInfo.Civilization_JFD_Governments("CivilizationType = '" .. civType .. "' AND GovernmentType = 'GOVERNMENT_JFD_DICTATORSHIP'") do
		governmentWeight = row.Weight
		break
	end
	if governmentWeight == 0 then
		local cultureID = player:GetCultureType()
		local cultureType = GameInfo.JFD_CultureTypes[cultureID].Type
		for row in GameInfo.JFD_CultureType_Governments("CultureType = '" .. cultureType .. "' AND GovernmentType = 'GOVERNMENT_JFD_DICTATORSHIP'") do
			governmentWeight = row.Weight
			break
		end
	end
	if Game.GetRandom(1,100) <= governmentWeight then
		player:SetGovernment(governmentDictatorshipID)
	end
end
if userSettingRTPSovereigntyCore then
	GameEvents.IdeologyAdopted.Add(JFD_RTP_Sovereignty_IdeologyAdopted)
end

--JFD_RTP_Sovereignty_IdeologySwitched
function JFD_RTP_Sovereignty_IdeologySwitched(playerID, oldIdeologyID, newIdeologyID)
	local player = Players[playerID]
	player:ResetLegislature(newIdeologyID)
	if player:IsHuman() then return end
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	local governmentWeight = 0
	for row in GameInfo.Civilization_JFD_Governments("CivilizationType = '" .. civType .. "' AND GovernmentType = 'GOVERNMENT_JFD_DICTATORSHIP'") do
		governmentWeight = row.Weight
		break
	end
	if governmentWeight == 0 then
		local cultureID = player:GetCultureType()
		local cultureType = GameInfo.JFD_CultureTypes[cultureID].Type
		for row in GameInfo.JFD_CultureType_Governments("CultureType = '" .. cultureType .. "' AND GovernmentType = 'GOVERNMENT_JFD_DICTATORSHIP'") do
			governmentWeight = row.Weight
			break
		end
	end
	if Game.GetRandom(1,100) <= governmentWeight then
		player:SetGovernment(governmentDictatorshipID)
	end
end
if userSettingRTPSovereigntyCore then
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
if userSettingRTPSovereigntyCore then
	GameEvents.ReformCooldownChanges.Add(JFD_RTP_ReformCooldown)
end
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
			if player:HasReform(GameInfoTypes[row.ReformType]) then
				unit:SetHasPromotion(GameInfoTypes[row.PromotionType], true)
			end
		end
	end
	for row in GameInfo.JFD_Reform_FreePromotions("RequiresFaithPurchase = 0") do
		if (row.IsCombatOnly and (not unit:IsCombatUnit())) then return end
		if (row.IsCivilianOnly and unit:IsCombatUnit()) then return end
		if player:HasReform(GameInfoTypes[row.ReformType]) then
			unit:SetHasPromotion(GameInfoTypes[row.PromotionType], true)
		end
	end
end
if userSettingRTPSovereigntyCore then
	GameEvents.CityTrained.Add(JFD_RTP_Sovereignty_OnUnitTrained)
end
--------------------------------------------------------------------------------------------------------------------------
-- SOVEREIGNTY
--------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Sovereignty
function JFD_RTP_Sovereignty(playerID)
	local playerID = playerID or activePlayerID
	local player = Players[playerID]
	local sovereignty = player:CalculateSovereignty()
	player:SetSovereignty(sovereignty)
end
if userSettingRTPSovereigntyCore then
	GameEvents.PlayerDoTurn.Add(JFD_RTP_Sovereignty)
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
--------------------------------------------------------------------------------------------------------------------------
-- UNITS
--------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Sovereignty_PlayerCanTrain
local reformLabourEmancipatedID = GameInfoTypes["REFORM_JFD_LABOUR_EMANCIPATED"]
local unitClassSlaveWorkerID 	= GameInfoTypes["UNITCLASS_JFD_SLAVE"]
function JFD_RTP_Sovereignty_PlayerCanTrain(playerID, unitID)
	local player = Players[playerID]
	if unitID == unitClassSlaveWorkerID then
		if player:HasReform(reformLabourEmancipatedID) then
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
				JFDLC_PrivyCouncillorName[privyCouncillorID] = unit:GetNameNoDesc()
				local hex = ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))
				JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_PRIVY_COUNCILLOR_NOTIFICATION_TEXT", player:GetPrivyCouncillorTitle(privyCouncillorID), unit:GetNameNoDesc()), convertTextKey("TXT_KEY_JFD_PRIVY_COUNCILLOR_NOTIFICATION_SHORT_TEXT"), true)
				Events.AudioPlay2DSound("AS2D_JFD_PRIVY_COUNCILLOR")
			end
		else
			player:RevokePolicy(policyID)
		end
	end
	unit:greatperson()
end
if userSettingRTPSovereigntyCore then
	LuaEvents.JFD_PrivyCouncillorAppointed.Add(JFD_RTP_Sovereignty_PrivyCouncillorAppointed)
end
--------------------------------------------------------------------------------------------------------------------------
--- WONDERS
--------------------------------------------------------------------------------------------------------------------------
--JFD_RTP_Sovereignty_CityCanConstruct
local buildingHimejiCastleID  = GameInfoTypes["BUILDING_HIMEJI_CASTLE"]
local buildingHofburgPalaceID = GameInfoTypes["BUILDING_JFD_HOFBURG_PALACE"]
function JFD_RTP_Sovereignty_CityCanConstruct(playerID, cityID, buildingID)
	local player = Players[playerID]
	local building = GameInfo.Buildings[buildingID]
	if building.GovernmentType then
		return (player:GetGovernment() == GameInfoTypes[building.GovernmentType])
	end
	if (buildingID == buildingHofburgPalaceID and (not player:IsHuman())) then
		local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
		local governmentWeight = 0
		for row in GameInfo.Civilization_JFD_Governments("CivilizationType = '" .. civType .. "' AND GovernmentType = 'GOVERNMENT_JFD_HOLY_ROME'") do
			governmentWeight = row.Weight
			break
		end
		if governmentWeight == 0 then
			local cultureID = player:GetCultureType(playerID)
			local cultureType = GameInfo.JFD_CultureTypes[cultureID].Type
			for row in GameInfo.JFD_CultureType_Governments("CultureType = '" .. cultureType .. "' AND GovernmentType = 'GOVERNMENT_JFD_HOLY_ROME'") do
				governmentWeight = row.Weight
				break
			end
		end
		if governmentWeight > 5 then return true end
		if player:GetFlavorValue("FLAVOR_JFD_DIPLOMACY") < 6 then return false end
	end
	if userSettingRTPSovereigntyHimeji then
		if (buildingID == buildingHimejiCastleID and (not player:IsHuman())) then
			local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
			local governmentWeight = 0
			for row in GameInfo.Civilization_JFD_Governments("CivilizationType = '" .. civType .. "' AND GovernmentType = 'GOVERNMENT_JFD_SHOGUNATE'") do
				governmentWeight = row.Weight
				break
			end
			if governmentWeight == 0 then
				local cultureID = player:GetCultureType(playerID)
				local cultureType = GameInfo.JFD_CultureTypes[cultureID].Type
				for row in GameInfo.JFD_CultureType_Governments("CultureType = '" .. cultureType .. "' AND GovernmentType = 'GOVERNMENT_JFD_SHOGUNATE'") do
					governmentWeight = row.Weight
					break
				end
			end
			if governmentWeight > 5 then return true end
			if player:GetFlavorValue("FLAVOR_JFD_OFFENSE") < 6 then return false end
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
		player:ChangeNumFreeGovernmentChanges(building.FreeGovernmentSwitches)
	end
	for government in GameInfo.JFD_Governments("RequiresBuilding = '" .. building.Type .. "'") do
		if player:GetGovernment() == government.ID then break end
		if (player:IsHuman() and player:HasGovernment()) then
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_GOVERNMENT_ACTIVE_PLAYER", Locale.ConvertTextKey("TXT_KEY_JFD_GOVERNMENT_AVAILABLE_NOTIFICATION", GameInfo.Buildings[building.Type].Description, government.Description), Locale.ConvertTextKey("TXT_KEY_JFD_GOVERNMENT_AVAILABLE_NOTIFICATION_SHORT", government.Description), false)
		end
		if player:IsHuman() then return end
		player:SetGovernment(government.ID)
	end
	if player:HasGovernment() then return end
	if building.FoundsGovernment ~= nil then
		if player:IsHuman() then
			JFD_SendNotification(playerID, "NOTIFICATION_JFD_CHOOSE_GOVERNMENT", convertTextKey("TXT_KEY_JFD_CAN_GOVERNMENT_NOTIFICATION_TEXT"), convertTextKey("TXT_KEY_JFD_CAN_GOVERNMENT_NOTIFICATION_SHORT_TEXT"))	
		else
			player:SetGovernment(player:GetGovernmentPreference())
		end
	end
end
if userSettingRTPSovereigntyCore then
	GameEvents.CityConstructed.Add(JFD_RTP_Sovereignty_FoundsGovernment)
end
--=======================================================================================================================
--=======================================================================================================================