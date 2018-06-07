
-------------------------------------------------
-- SocialPolicy Chooser Popup
-------------------------------------------------

include( "IconSupport" );
include( "InstanceManager" );
include( "CommonBehaviors" );
include("JFD_RTPUtils.lua");
include("JFD_RTP_SovereigntyUtils.lua");

local userSettingRTPSovereigntyCore  = (Game.GetUserSetting("JFD_RTP_SOVEREIGNTY_CORE") == 1)
local defineDefaultAnarchyTurns	     = GameDefines["JFD_RTP_SOVEREIGNTY_DEFAULT_ANARCHY_TURNS"]

local m_PopupInfo = nil;

local g_PoliticalFactionManager = InstanceManager:new("FactionInstance", "FactionBase", Controls.FactionStack)
local g_PoliticalReformsCategoryHeaderManager = InstanceManager:new("ReformHeaderInstance", "ReformHeader", Controls.PoliticalReformsHeaderStack)
local g_PoliticalReformsLeftManager = InstanceManager:new("ReformInstance", "ReformButton", Controls.PoliticalReformsLeftStack)
local g_PoliticalReformsCentreManager = InstanceManager:new("ReformInstance", "ReformButton", Controls.PoliticalReformsCentreStack)
local g_PoliticalReformsRightManager = InstanceManager:new("ReformInstance", "ReformButton", Controls.PoliticalReformsRightStack)
local g_YourReformsManager = InstanceManager:new( "YourReformsInstance", "Base", Controls.YourReformsStack);
local g_WorldGovernmentsManager = InstanceManager:new( "WorldGovernmentInstance", "Base", Controls.WorldGovernmentsStack);

include( "FLuaVector" );

g_Tabs = {
	["YourGovernment"] = {
		Button = Controls.TabButtonYourGovernment,
		Panel = Controls.YourGovernmentPanel,
		SelectHighlight = Controls.TabButtonYourGovernmentHL,
	},
	
	["YourReforms"] = {
		Button = Controls.TabButtonYourReforms,
		Panel = Controls.YourReformsPanel,
		SelectHighlight = Controls.TabButtonYourReformsHL,
	},
	
	["WorldGovernments"] = {
		Button = Controls.TabButtonWorldGovernments,
		Panel = Controls.WorldGovernmentsPanel,
		SelectHighlight = Controls.TabButtonWorldGovernmentsHL,
	},
}

g_PoliticalFactionsSortOptions = {
	{
		Button = Controls.GOSortByFaction,
		ImageControl = Controls.GOSortByFactionImage,
		Column = "FactionName",
		DefaultDirection = "desc",
		CurrentDirection = nil,
	},
	{
		Button = Controls.GOSortBySovereignty,
		ImageControl = Controls.GOSortBySovereigntyImage,
		Column = "Sovereignty",
		DefaultDirection = "desc",
		SortType = "numeric",
		CurrentDirection = nil,
	},
};

g_PoliticalFactionsSortFunction = nil

g_YourReformsSortOptions = {
	{
		Button = Controls.WGSortByReform,
		ImageControl = Controls.WGSortByReformImage,
		Column = "ReformDesc",
		DefaultDirection = "asc",
		CurrentDirection = nil,
	},
	{
		Button = Controls.WGSortByReformGroup,
		ImageControl = Controls.WGSortByReformGroupImage,
		Column = "ReformGroupDesc",
		DefaultDirection = "desc",
		CurrentDirection = nil,
	},
	{
		Button = Controls.WGSortByReformBranch,
		ImageControl = Controls.WGSortByReformBranchImage,
		Column = "ReformBranchDesc",
		DefaultDirection = "asc",
		CurrentDirection = "asc",
	},
	{
		Button = Controls.WGSortByReformEffect,
		ImageControl = Controls.WGSortByReformEffectImage,
		Column = "ReformEffect",
		DefaultDirection = "desc",
		CurrentDirection = nil,
	},
};
g_YourReformsSortFunction = nil;

g_WorldGovernmentsSortOptions = {
	{
		Button = Controls.WGSortByCivilization,
		ImageControl = Controls.WGSortByCivilizationImage,
		Column = "Civilization",
		DefaultDirection = "desc",
		CurrentDirection = "desc",
	},
	{
		Button = Controls.WGSortByLeaderName,
		ImageControl = Controls.WGSortByLeaderNameImage,
		Column = "Leader",
		DefaultDirection = "desc",
		CurrentDirection = nil,
	},
	{
		Button = Controls.WGSortByPoliticType,
		ImageControl = Controls.WGSortByPoliticTypeImage,
		Column = "PoliticType",
		DefaultDirection = "desc",
		CurrentDirection = nil,
	},
	{
		Button = Controls.WGSortByGovernmentType,
		ImageControl = Controls.WGSortByGovernmentTypeImage,
		Column = "Government",
		DefaultDirection = "asc",
		CurrentDirection = nil,
	},
	{
		Button = Controls.WGSortBySovereignty,
		ImageControl = Controls.WGSortBySovereigntyImage,
		Column = "Sovereignty",
		DefaultDirection = "desc",
		SortType = "numeric",
		CurrentDirection = nil,
	},
};

g_WorldGovernmentsSortFunction = nil;
--=======================================================================================================================
-- Pedia Callback: Adapted from EUI
--=======================================================================================================================

CivilopediaControl = "/FrontEnd/MainMenu/Other/Civilopedia"

local getPedia

local function getPediaB(...)
	Events.SearchForPediaEntry(...)
end

local function getPediaA(...)
	UIManager:QueuePopup(LookUpControl(CivilopediaControl), PopupPriority.eUtmost)
	getPedia = getPediaB
	getPedia(...)
end

getPedia = CivilopediaControl and getPediaA
--==========================================================================================================================
-- JFD FUNCTIONS
--==========================================================================================================================
-- JFD_RefreshDisplays
------------------------------------------------------------------------------------------------------------------------
function JFD_RefreshDisplays()
	JFD_RefreshYourGovernment()
	JFD_RefreshWorldGovernments()
end
-- Events.SerialEventGameDataDirty.Add(JFD_RefreshDisplays)
------------------------------------------------------------------------------------------------------------------------
-- JFD_RefreshYourGovernment
------------------------------------------------------------------------------------------------------------------------
local currentReformBranchID 			= 1
local chosenReformID	
local mathCeil 							= math.ceil
local showDetailedFactions				= false
local showDetailedReforms				= false
local showNewReforms					= false
local showNotNone						= true
local showOnlyPenalty					= false
local showReformIcons					= false
local sovereigntyNeededToFormGovt 		= 100
	
local defaultHolySynodMembers 			= GameDefines["JFD_SOVEREIGNTY_DEFAULT_HOLY_SYNOD_MEMBERS"]
	
local governmentDictatorshipID 			= GameInfoTypes["GOVERNMENT_JFD_DICTATORSHIP"]
local governmentHolyRomeID 				= GameInfoTypes["GOVERNMENT_JFD_HOLY_ROME"]
local governmentMonarchyID 				= GameInfoTypes["GOVERNMENT_JFD_MONARCHY"]
local governmentRepublicID 				= GameInfoTypes["GOVERNMENT_JFD_REPUBLIC"]
local governmentShogunateID 			= GameInfoTypes["GOVERNMENT_JFD_SHOGUNATE"]
local governmentTheocracyID 			= GameInfoTypes["GOVERNMENT_JFD_THEOCRACY"]

local reformExecutiveAbsoluteID 		= GameInfoTypes["REFORM_JFD_EXECUTIVE_ABSOLUTE"]
local reformTLegislatureAutocephalousID = GameInfoTypes["REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS"]
local reformTLegislatureEcumenicalID 	= GameInfoTypes["REFORM_JFD_LEGISLATURE_T_ECUMENICAL"]
		
function JFD_OnReformClicked(reformID)
	if reformID == -1 then return end
    local player = Players[Game.GetActivePlayer()]
    if player == nil then return  end
	chosenReformID = reformID
	Controls.ReformConfirm:SetHide(false)
	local reformAnarchySentiment, reformAnarchyTurns, reformAnarchyCooldownTurns = player:GetAnarchySentiment()
	Controls.ReformConfirmLabel:LocalizeAndSetText("TXT_KEY_CONFIRM_JFD_REFORM", reformAnarchyTurns, reformAnarchyCooldownTurns)
	Controls.BGBlock:SetHide(true)
end

function JFD_OnYes()
	Controls.ReformConfirm:SetHide(true)
	Controls.BGBlock:SetHide(false)
	
	Players[Game.GetActivePlayer()]:SetHasReform(chosenReformID, true)
	Events.AudioPlay2DSound("AS2D_JFD_REFORM_PASSED")
	JFD_RefreshDisplays()
end
Controls.ReformYes:RegisterCallback(Mouse.eLClick, JFD_OnYes)

function JFD_OnNo()
	Controls.ReformConfirm:SetHide(true)
	Controls.BGBlock:SetHide(false)
end
Controls.ReformNo:RegisterCallback(Mouse.eLClick, JFD_OnNo)

local yieldCultureID = GameInfoTypes["YIELD_CULTURE"]
local yieldFaithID   = GameInfoTypes["YIELD_FAITH"]
local yieldGoldID    = GameInfoTypes["YIELD_GOLD"]
local yieldScienceID = GameInfoTypes["YIELD_SCIENCE"]
function JFD_RefreshYourGovernment()
	local activePlayerID = Game.GetActivePlayer()
	local activePlayer = Players[activePlayerID]
	local activeTeam = Teams[Game.GetActiveTeam()]
	if (not activePlayer:HasGovernment()) then
		Controls.YourGovernmentStack:SetHide(true)
		Controls.GovtTitleBox:SetHide(true)
		Controls.GovtOverviewTrim:SetHide(true)
		Controls.GovtOverviewDisabled:SetHide(false)
		Controls.GovtDisabledText:SetHide(false)
		Controls.DisabledGovtTextLabel:LocalizeAndSetText("TXT_KEY_POLICYSCREEN_JFD_GOVT_DISABLED")
	else
		Controls.GovtDisabledText:SetHide(true)
		Controls.GovtOverviewDisabled:SetHide(true)
		Controls.YourGovernmentStack:SetHide(false)
		Controls.GovtTitleBox:SetHide(false)
		Controls.GovtOverviewTrim:SetHide(false)
		JFD_RefreshYourGovernmentStats()
		JFD_RefreshYourGovernmentPolitics()
		JFD_RefreshYourGovernmentReforms()
	end
end

function JFD_RefreshYourGovernmentStats()
	local activePlayerID = Game.GetActivePlayer()
	local activePlayer = Players[activePlayerID]
	local activeTeam = Teams[Game.GetActiveTeam()]
	local governmentID = activePlayer:GetGovernment()
	local government = GameInfo.JFD_Governments[governmentID]
	local stateReligionID = activePlayer:GetStateReligion()
	-- State Header
	local stateName = activePlayer:GetCivilizationDescription()
	Controls.StateHeaderLabel:SetText(stateName)
	Controls.StateHeaderLabel:LocalizeAndSetToolTip(stateName)
	--Head of State
	local headOfState = activePlayer:GetName()
	local headOfStateTT = activePlayer:GetLeaderTitle()
	Controls.HeadOfState:LocalizeAndSetText(headOfState)
	Controls.HeadOfState:LocalizeAndSetToolTip(headOfStateTT)
	--Head of Government
	local isAbsolute = activePlayer:HasReform(reformExecutiveAbsoluteID)
	local headOfGovt = activePlayer:GetName()
	local headOfGovtTitle = activePlayer:GetHeadOfGovernmentTitle(governmentID == governmentTheocracyID)
	local headOfGovtFull = ""
	local dominantPoliticID = activePlayer:GetDominantPolitic()
	if (governmentID == governmentShogunateID) then
		headOfGovt = Locale.ConvertTextKey(activePlayer:GetPoliticLeaderKey())
		headOfGovtFull = Locale.ConvertTextKey(headOfGovtTitle) .. " " .. headOfGovt
	elseif (dominantPoliticID and (not isAbsolute) and governmentID ~= governmentHolyRomeID) then
		headOfGovt = Locale.ConvertTextKey(activePlayer:GetPoliticLeaderKey())
		headOfGovtFull = Locale.ConvertTextKey(headOfGovtTitle) .. " " .. headOfGovt
	else
		headOfGovtFull = headOfGovt
	end
	Controls.HeadOfGovernment:LocalizeAndSetText(headOfGovt)
	if governmentID == governmentHolyRomeID then
		Controls.HeadOfGovernmentHeader:SetToolTipString(headOfGovtFull .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_JFD_GO_HEAD_OF_GOVERNMENT_TT_HOLY_ROME"))
	elseif governmentID == governmentShogunateID then
		Controls.HeadOfGovernmentHeader:SetToolTipString(headOfGovtFull .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_JFD_GO_HEAD_OF_GOVERNMENT_TT_SHOGUNATE"))
	elseif isAbsolute then
		Controls.HeadOfGovernmentHeader:SetToolTipString(headOfGovtFull .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_JFD_GO_HEAD_OF_GOVERNMENT_TT_ABSOLUTE"))
	else
		Controls.HeadOfGovernmentHeader:SetToolTipString(headOfGovtFull .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_JFD_GO_HEAD_OF_GOVERNMENT_TT"))
	end
	local strBackgroundImage = government.OverviewBackground or "GovtOverview_Background.dds"
	if strBackgroundImage then
		Controls.GovernmentBackgroundImage:SetHide(false)
		Controls.GovernmentBackgroundImage:SetTextureAndResize(strBackgroundImage)
		Controls.GovernmentBackgroundImage:SetSizeX(970);
		Controls.GovernmentBackgroundImage:SetSizeY(588);
	end

	--Icons
	local civilization = GameInfo.Civilizations[activePlayer:GetCivilizationType()]
	local civilizationType = civilization.Type
	local leader = GameInfo.Leaders( "Type = '" .. GameInfo.Civilization_Leaders( "CivilizationType = '" .. civilizationType .. "'" )().LeaderheadType .. "'" )();
	if governmentID == governmentRepublicID then
		IconHookup(civilization.PortraitIndex, 128, civilization.IconAtlas, Controls.HeadOfStateIcon)
		IconHookup(leader.PortraitIndex, 64, leader.IconAtlas, Controls.CivIconImg)
	elseif governmentID == governmentTheocracyID then
		local religion = GameInfo.Religions[stateReligionID]
		IconHookup(religion.PortraitIndex, 128, religion.IconAtlas, Controls.HeadOfStateIcon)
		IconHookup(leader.PortraitIndex, 64, leader.IconAtlas, Controls.CivIconImg)
	elseif governmentID == governmentHolyRomeID then
		IconHookup(6, 128, "JFD_SOVEREIGNTY_GOVERNMENT_ALPHA_ATLAS", Controls.HeadOfStateIcon)
		IconHookup(leader.PortraitIndex, 64, leader.IconAtlas, Controls.CivIconImg)
	elseif governmentID == governmentShogunateID then
		IconHookup(3, 128, "JFD_SOVEREIGNTY_GOVERNMENT_ALPHA_ATLAS", Controls.HeadOfStateIcon)
		IconHookup(leader.PortraitIndex, 64, leader.IconAtlas, Controls.CivIconImg)
	else
		IconHookup(leader.PortraitIndex, 128, leader.IconAtlas, Controls.HeadOfStateIcon)
		IconHookup(civilization.PortraitIndex, 64, civilization.IconAtlas, Controls.CivIconImg)
	end
	--Full Title 
	local leaderTitle = activePlayer:GetName()
	local governmentTitle = activePlayer:GetCivilizationDescription()
	Controls.YourGovernmentLabel:LocalizeAndSetText("TXT_KEY_JFD_GOVERNMENT_OVERVIEW_TITLE_TAB", leaderTitle, governmentTitle)
	
	--Government
	local governmentDescription = Locale.ConvertTextKey(government.Description)
	local governmentDescriptionShort = activePlayer:GetGovernmentShortDescription()
	if governmentID ~= governmentHolyRomeID then
		governmentDescription = governmentDescription .. " - " .. Locale.ConvertTextKey(governmentDescriptionShort)
	end
	Controls.Government:LocalizeAndSetText(governmentDescription)
	Controls.Government:LocalizeAndSetToolTip(governmentDescription)
	--Change Government
	local canChangeGovt, changeGovtTT = activePlayer:CanChangeGovernment()
	Controls.ChangeGovernmentsButton:SetDisabled(not canChangeGovt)
	if (not canChangeGovt) then
		Controls.ChangeGovernmentsButton:SetText("[COLOR_FADING_NEGATIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_GO_JFD_CHANGE_GOVERNMENT") .. "[ENDCOLOR]")
	else
		Controls.ChangeGovernmentsButton:SetText(Locale.ConvertTextKey("TXT_KEY_GO_JFD_CHANGE_GOVERNMENT"))
	end
	if changeGovtTT then
		Controls.ChangeGovernmentsButton:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_JFD_CHANGE_GOVERNMENT_TT") .. "[NEWLINE][NEWLINE]" .. changeGovtTT)
	else
		Controls.ChangeGovernmentsButton:LocalizeAndSetToolTip("TXT_KEY_JFD_CHANGE_GOVERNMENT_TT")
	end
	--Culture
	local cultureID = activePlayer:GetCultureType()
	local culture = GameInfo.JFD_CultureTypes[cultureID]
	Controls.Culture:SetText(culture.FontIcon)
	Controls.Culture:LocalizeAndSetToolTip("TXT_KEY_JFD_GOVERNMENT_OVERVIEW_CULTURE", culture.ShortDescription)
	--State Religion
	if stateReligionID <= 0 then stateReligionID = 0 end
	local religion = GameInfo.Religions[stateReligionID]
	Controls.StateReligion:SetText(religion.IconString)
	Controls.StateReligion:LocalizeAndSetToolTip("TXT_KEY_JFD_GOVERNMENT_OVERVIEW_STATE_RELIGION", Game.GetReligionName(stateReligionID))
	if activePlayer:HasSecularized() then
		Controls.StateReligion:SetHide(true)
	end
	--Currency
	if activePlayer:HasCurrency() then
		local currencyID = activePlayer:GetCurrency()
		local currency = GameInfo.JFD_Currencies[currencyID]
		Controls.Currency:SetText(currency.IconString)
		Controls.Currency:LocalizeAndSetToolTip("TXT_KEY_JFD_GOVERNMENT_OVERVIEW_CURRENCY", currency.Description)
	end
	--Ideology
	local ideologyID = activePlayer:GetLateGamePolicyTree()
	if ideologyID > -1 then
		local ideology = GameInfo.PolicyBranchTypes[ideologyID]
		Controls.Ideology:SetText(ideology.IconString)
		Controls.Ideology:LocalizeAndSetToolTip("TXT_KEY_JFD_GOVERNMENT_OVERVIEW_IDEOLOGY", ideology.Description)
	end
	--Privy Council
	local privyNum = 1
	for privyCouncillor in GameInfo.JFD_PrivyCouncillors() do	
		local hasCouncillor = activePlayer:HasPrivyCouncillor(privyCouncillor.ID)
		local numString = tostring(privyNum)
		local buttonName = "Privy"..numString .."Icon"
		local thisButton = Controls[buttonName]
		local titleDesc = activePlayer:GetPrivyCouncillorTitle(privyCouncillor.ID)
		local privyTT = "[COLOR_JFD_SOVEREIGNTY]" .. titleDesc .. " - [COLOR_WARNING_TEXT]Vacant[ENDCOLOR][NEWLINE]"
		if hasCouncillor then
			local councillorUnit = activePlayer:GetPrivyCouncillorUnitClassType(privyCouncillor.ID)
			local councillorUnitID = activePlayer:GetSpecificUnitType(councillorUnit)
			local councillorUnitInfo = GameInfo.Units[councillorUnitID]
			local councillorName = councillorUnitInfo.Description
			local councillorHelp1 = nil
			local councillorHelp2 = nil
			local councillorAlpha = 0
			--if JFDLC_PrivyCouncillorName[privyCouncillor.ID] then
				--councillorName = JFDLC_PrivyCouncillorName[privyCouncillor.ID] -- Depends on TSL
			--end
			for row in GameInfo.JFD_PrivyCouncillor_GreatPeople("PrivyCouncillorType = '" .. privyCouncillor.Type .. "'") do
				if councillorUnitInfo.Class == row.UnitClassType then
					councillorHelp1 = Locale.ConvertTextKey(row.Help, "[COLOR_POSITIVE_TEXT]", "")
				else
					councillorHelp2 = Locale.ConvertTextKey(row.Help, "[COLOR_FADING_POSITIVE_TEXT]", "[COLOR_JFD_ALPHA]") .. "[ENDCOLOR]"
				end
			end
			privyTT = "[COLOR_JFD_SOVEREIGNTY]" .. titleDesc .. Locale.ConvertTextKey(" - [COLOR_JFD_SOVEREIGNTY]{1_Desc}[ENDCOLOR][NEWLINE]", councillorName) .. Locale.ConvertTextKey(privyCouncillor.HelpFilled)
			if councillorHelp1 then
				privyTT = privyTT .. councillorHelp1
			end
			if councillorHelp2 then
				privyTT = privyTT .. councillorHelp2
			end
			IconHookup(councillorUnitInfo.PortraitIndex, 64, councillorUnitInfo.IconAtlas, thisButton)
		else
			privyTT = privyTT .. Locale.ConvertTextKey(privyCouncillor.HelpVacant)
			IconHookup(22, 64, "LEADER_ATLAS", thisButton)
		end
		thisButton:LocalizeAndSetToolTip(privyTT)
		privyNum = privyNum + 1
		if privyNum > 5 then break end
	end
	--Free Reforms
	local numFreeReforms = activePlayer:GetNumFreeReforms()
	if numFreeReforms > 0 then
		Controls.FreeReformsLabel:LocalizeAndSetText("TXT_KEY_JFD_FREE_REFORMS_LABEL", numFreeReforms)
		Controls.FreeReformsLabel:LocalizeAndSetToolTip("TXT_KEY_JFD_FREE_REFORMS_LABEL_TT", numFreeReforms)
		Controls.FreeReformsLabelAni:LocalizeAndSetToolTip("TXT_KEY_JFD_FREE_REFORMS_LABEL_TT", numFreeReforms)
		Controls.FreeReformsLabel:SetHide(false)
	else
		Controls.FreeReformsLabel:SetHide(true)
	end
	--Sovereignty
	local sovereignty = activePlayer:GetSovereignty()
	local reformAnarchySentiment, reformAnarchyTurns, reformAnarchyCooldownTurns, reformAnarchyTT = activePlayer:GetAnarchySentiment(true)
	local reformAnarchyString = Locale.ConvertTextKey("TXT_KEY_JFD_GO_ANARCHY", reformAnarchySentiment)
	if reformAnarchySentiment >= 100 then
		reformAnarchyString = "[COLOR_NEGATIVE_TEXT]" ..  Locale.ConvertTextKey("TXT_KEY_JFD_GO_ANARCHY", reformAnarchySentiment) .. "[ENDCOLOR]"
	end
	local reformCooldown, reformCooldownTT = activePlayer:CalculateReformCooldown(true)
	Controls.Anarchy:SetText(reformAnarchyString) 
	Controls.Anarchy:LocalizeAndSetToolTip("TXT_KEY_JFD_GO_ANARCHY_TT", reformAnarchySentiment, Game.GetRound((reformAnarchyTurns+defineDefaultAnarchyTurns)*100), reformAnarchyTurns, reformAnarchyCooldownTurns, reformAnarchyTT) 
	Controls.CurrentSovereigntyLabel:LocalizeAndSetText("TXT_KEY_JFD_CURRENT_SOVEREIGNTY_LABEL", sovereignty)
	Controls.CurrentSovereigntyLabel:LocalizeAndSetToolTip(activePlayer:GetSovereigntyTopPanelInfoTT()) 
	Controls.ReformCooldownTurnLabel:LocalizeAndSetText("TXT_KEY_JFD_NEXT_REFORM_TURN_LABEL", activePlayer:GetReformCooldown())
	Controls.ReformCooldownTurnLabel:LocalizeAndSetToolTip(reformCooldownTT)
	Controls.SovereigntyInfoStack:ReprocessAnchoring()
	Controls.SovereigntyInfoStack2:ReprocessAnchoring()
end

function JFD_RefreshYourGovernmentPolitics()
	local activePlayerID = Game.GetActivePlayer()
	local activePlayer = Players[activePlayerID]
	local activeTeam = Teams[Game.GetActiveTeam()]
	local governmentID = activePlayer:GetGovernment()
	local government = GameInfo.JFD_Governments[governmentID]
	local isAbsolute = activePlayer:HasReform(reformExecutiveAbsoluteID)
	local hasLegislature = activePlayer:HasLegislature()
	local legislatureName = activePlayer:GetLegislatureName() or "TXT_KEY_JFD_GO_LEGISLATURE_DESC" 
	local governmentCooldown = activePlayer:GetGovernmentCooldown()
	local sovereignty = activePlayer:GetSovereignty()
	if (not hasLegislature) then
		Controls.HeadOfGovernmentHeader:SetHide(true)
		Controls.NoLegislatureLabel:SetHide(false)
		Controls.LegislatureEditButton:SetHide(true)
		Controls.GovernmentCooldownImage:SetHide(true)
		Controls.LegislatureHeaderLabel:SetText(Locale.ToUpper("TXT_KEY_JFD_GO_LEGISLATURE_DESC"))
		Controls.LegislatureHeaderLabel:LocalizeAndSetToolTip("TXT_KEY_JFD_GO_LEGISLATURE_NONE")
		Controls.NoLegislatureLabel:LocalizeAndSetText("TXT_KEY_JFD_GO_NO_LEGISLATURE_DESC")
	else
		Controls.HeadOfGovernmentHeader:SetHide(false)
		Controls.LegislatureHeaderLabel:SetAlpha(1)
		Controls.LegislatureHeaderLabel:SetText(Locale.ToUpper(legislatureName))
		Controls.LegislatureEditButton:SetHide(false)
		Controls.NoLegislatureLabel:SetHide(true)
		if governmentID ~= governmentDictatorshipID then
			Controls.GovernmentCooldown:SetHide(false)
			Controls.GovernmentCooldownImage:SetHide(false)
			Controls.GovernmentCooldown:LocalizeAndSetText(governmentCooldown)
			Controls.GovernmentCooldownImage:LocalizeAndSetToolTip("TXT_KEY_JFD_NEXT_ELECTION_TURN_LABEL", governmentCooldown)
		end
	end
	if governmentID == governmentShogunateID then
		Controls.LegislatureHeaderLabel:SetText(Locale.ToUpper("TXT_KEY_GOVERNMENT_JFD_SHOGUNATE_TITLE_LEGISLATURE"))
		Controls.LegislatureEditButton:SetHide(true)
		Controls.GovernmentCooldown:SetHide(true)
		Controls.GovernmentCooldownImage:SetHide(true)
	end
	for row in GameInfo.JFD_Reforms("LegislatureHelp IS NOT NULL") do
		if activePlayer:HasReform(row.ID) then
			Controls.LegislatureHeaderLabel:LocalizeAndSetToolTip(row.LegislatureHelp, governmentCooldown)
			break
		end
	end
	if activePlayer:GetLateGamePolicyTree() > -1 then
		for row in GameInfo.JFD_Reforms("LegislatureIdeologyHelp IS NOT NULL") do
			if activePlayer:HasReform(row.ID) then
				Controls.LegislatureHeaderLabel:LocalizeAndSetToolTip(row.LegislatureIdeologyHelp, governmentCooldown)
				break
			end
		end
	end
	g_PoliticalFactionManager:ResetInstances()
	if hasLegislature then
		if governmentID == governmentHolyRomeID then
			local politics = {};
			for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do	
				local otherPlayer = Players[otherPlayerID]
				if (otherPlayer:IsAlive() and otherPlayer:IsMinorCiv() and otherPlayer:GetCapitalCity() and activeTeam:IsHasMet(otherPlayer:GetTeam())) then
					local electorID = otherPlayer:GetFactionElectorID()
					local politicPercent = activePlayer:GetPoliticPercent(electorID)
					if (showDetailedFactions or politicPercent > 0) then
						table.insert(politics, {IsRevolutionaries = false, PoliticID = electorID, PlayerName = otherPlayer:GetName(), Percent = politicPercent, CityStateTraitType = otherPlayer:GetMinorCivTrait()});
					elseif politicPercent > 0 then
						table.insert(politics, {IsRevolutionaries = false, PoliticID = electorID, PlayerName = otherPlayer:GetName(), Percent = politicPercent, CityStateTraitType = otherPlayer:GetMinorCivTrait()});
					end
				end
			end
			for row in GameInfo.JFD_Politics("PrereqGovernment = '" .. government.Type .. "' AND NOT Type = 'ELECTOR_JFD_ELECTOR'") do
				local prereqReformID = GameInfoTypes[row.PrereqReform]
				if ((prereqReformID and activePlayer:HasReform(prereqReformID)) or (not prereqReformID)) then
					local politicPercent = activePlayer:GetPoliticPercent(row.ID)
					if (showDetailedFactions or politicPercent > 0) then
						table.insert(politics, {IsRevolutionaries = true, PoliticID = row.ID, PlayerName = nil, Percent = politicPercent, CityStateTraitType = nil});
					elseif politicPercent > 0 then
						table.insert(politics, {IsRevolutionaries = true, PoliticID = row.ID, PlayerName = nil, Percent = politicPercent, CityStateTraitType = nil});
					end
				end
			end
			if #politics == 0 then
				Controls.NoLegislatureLabel:SetHide(false)
				Controls.NoLegislatureLabel:LocalizeAndSetText("TXT_KEY_JFD_GO_LEGISLATURE_EMPTY")
			end
			table.sort(politics, function(a,b) return a.Percent > b.Percent end)
			for _,politic in ipairs(politics) do
				local instance = g_PoliticalFactionManager:GetInstance()
				if (not politic.IsRevolutionaries) then
					local politicID = politic.PoliticID
					local politicDesc = Locale.ConvertTextKey("TXT_KEY_JFD_ELECTOR_JFD_ELECTOR_DESC")
					local politicHighlight = "[COLOR_JFD_SOVEREIGNTY_FADING]"
					local politicPercent = politic.Percent
					local minorCivTrait = GameInfo.MinorCivTraits[politic.CityStateTraitType]
					instance.FactionName:LocalizeAndSetText("	[ICON_JFD_ELECTOR] {1_ElectorDesc} of {2_CivName}", politicDesc, politic.PlayerName)
					for row in GameInfo.JFD_Politics_MinorCivTraitTypes("PoliticsType = 'ELECTOR_JFD_ELECTOR' AND MinorCivTraitType = '" .. minorCivTrait.Type .. "'") do
						instance.FactionName:LocalizeAndSetToolTip(row.Help, politicDesc, politic.PlayerName)
						break
					end
					instance.Sovereignty:LocalizeAndSetText("{1_SovHL}{2_num}%[ICON_JFD_SOVEREIGNTY][ENDCOLOR]", politicHighlight, politicPercent)
					instance.Sovereignty:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_GO_JFD_FACTION_TT_HOLY_ROME"))
					-- CivIconHookup(politic.PoliticID, 32, instance.CivIcon, instance.CivIconBG, instance.CivIconShadow, false, true, instance.CivIconHighlight)
					instance.CityStateIcon:SetHide(false)
					instance.CityStateIcon:SetTexture(minorCivTrait.TraitIcon)
					instance.CivIconBox:SetHide(true)
					if politicPercent <= 0 then
						instance.FactionBase:SetAlpha(0.4)
					else
						instance.FactionBase:SetAlpha(1)
					end
				else
					local politicID = politic.PoliticID
					local politicInfo = GameInfo.JFD_Politics[politicID]
					local politicDesc = Locale.ConvertTextKey(activePlayer:GetPoliticDescription(politicID))
					local politicHighlight = "[COLOR_JFD_SOVEREIGNTY_FADING]"
					local politicPercent = politic.Percent
					local sovereigntyTT = Locale.ConvertTextKey("TXT_KEY_GO_JFD_FACTION_TT")
					instance.FactionName:LocalizeAndSetToolTip(politicInfo.Help, politicDesc, politicPercent)
					instance.FactionName:SetText(politicInfo.FontIcon .. " " .. politicDesc)
					instance.Sovereignty:LocalizeAndSetText("{1_SovHL}{2_Num}%[ICON_JFD_SOVEREIGNTY][ENDCOLOR]", politicHighlight, politicPercent)
					instance.CityStateIcon:SetHide(true)
					instance.CivIconBox:SetHide(true)
					if politicPercent <= 0 then
						instance.FactionBase:SetAlpha(0.4)
					else
						instance.FactionBase:SetAlpha(1)
					end
				end
			end
		elseif governmentID == governmentTheocracyID then
			local politics = {};
			if activePlayer:HasReform(reformTLegislatureAutocephalousID) then	
				local stateReligionID = activePlayer:GetStateReligion()
				for city in activePlayer:Cities() do
					local clergyID = activePlayer:GetFactionClergyID(city)
					local politicPercent = activePlayer:GetPoliticPercent(clergyID)
					if (showDetailedFactions or politicPercent > 0) then
						table.insert(politics, {IsRevolutionaries = false, PoliticID = cityID, CityName = city:GetName(), Percent = politicPercent, CityHighestYield = activePlayer:GetHighestYield(city)});
					elseif politicPercent > 0 then
						table.insert(politics, {IsRevolutionaries = false, PoliticID = cityID, CityName = city:GetName(), Percent = politicPercent, CityHighestYield = activePlayer:GetHighestYield(city)});
					end
				end
				for row in GameInfo.JFD_Politics("PrereqGovernment = '" .. government.Type .. "' AND NOT Type = 'CLERGY_JFD_CLERGY'") do
					local prereqReformID = GameInfoTypes[row.PrereqReform]
					if ((prereqReformID and activePlayer:HasReform(prereqReformID)) or (not prereqReformID)) then
						local politicPercent = activePlayer:GetPoliticPercent(row.ID)
						if (showDetailedFactions or politicPercent > 0) then
							table.insert(politics, {IsRevolutionaries = true, PoliticID = row.ID, CityName = nil, Percent = politicPercent, CityHighestYield = nil});
						elseif politicPercent > 0 then
							table.insert(politics, {IsRevolutionaries = true, PoliticID = row.ID, CityName = nil, Percent = politicPercent, CityHighestYield = nil});
						end
					end
				end
				if #politics == 0 then
					Controls.NoLegislatureLabel:SetHide(false)
					Controls.NoLegislatureLabel:LocalizeAndSetText("TXT_KEY_JFD_GO_LEGISLATURE_EMPTY")
				end
				table.sort(politics, function(a,b) return a.Percent > b.Percent end)
				for _,politic in ipairs(politics) do
					local instance = g_PoliticalFactionManager:GetInstance()
					if (not politic.IsRevolutionaries) then
						local politicID = politic.PoliticID
						local politicDesc = Locale.ConvertTextKey(activePlayer:GetPoliticDescription(stateReligionID, true))
						local politicHighlight = "[COLOR_JFD_SOVEREIGNTY_FADING]"
						local politicPercent = politic.Percent
						instance.FactionName:LocalizeAndSetText("[ICON_JFD_CLERGY]{1_City} {2_ClergyDesc}", politic.CityName, politicDesc)
						if politic.CityHighestYield == yieldCultureID then
							instance.FactionName:LocalizeAndSetToolTip("TXT_KEY_JFD_CLERGY_JFD_AUTOCEPHALOUS_CULTURE_HELP", politic.CityName, politicDesc)
						elseif politic.CityHighestYield == yieldGoldID then
							instance.FactionName:LocalizeAndSetToolTip("TXT_KEY_JFD_CLERGY_JFD_AUTOCEPHALOUS_GOLD_HELP", politic.CityName, politicDesc)
						elseif politic.CityHighestYield == yieldScienceID then
							instance.FactionName:LocalizeAndSetToolTip("TXT_KEY_JFD_CLERGY_JFD_AUTOCEPHALOUS_SCIENCE_HELP", politic.CityName, politicDesc)
						else
							instance.FactionName:LocalizeAndSetToolTip("TXT_KEY_JFD_CLERGY_JFD_AUTOCEPHALOUS_FAITH_HELP", politic.CityName, politicDesc)
						end
						instance.Sovereignty:LocalizeAndSetText("{1_SovHL}{2_num}%[ICON_JFD_SOVEREIGNTY][ENDCOLOR]", politicHighlight, politicPercent)
						instance.CityStateIcon:SetHide(true)
						instance.CivIconBox:SetHide(true)
						if politicPercent <= 0 then
							instance.FactionBase:SetAlpha(0.4)
						else
							instance.FactionBase:SetAlpha(1)
						end
					else
						local politicID = politic.PoliticID
						local politicInfo = GameInfo.JFD_Politics[politicID]
						local politicDesc = Locale.ConvertTextKey(activePlayer:GetPoliticDescription(politicID))
						local politicHighlight = "[COLOR_JFD_SOVEREIGNTY_FADING]"
						local politicPercent = politic.Percent
						local sovereigntyTT = Locale.ConvertTextKey("TXT_KEY_GO_JFD_FACTION_TT")
						instance.FactionName:LocalizeAndSetToolTip(politicInfo.Help, politicDesc, politicPercent)
						instance.FactionName:SetText(politicInfo.FontIcon .. " " .. politicDesc)
						instance.Sovereignty:LocalizeAndSetText("{1_SovHL}{2_Num}%[ICON_JFD_SOVEREIGNTY][ENDCOLOR]", politicHighlight, politicPercent)
						instance.CityStateIcon:SetHide(true)
						instance.CivIconBox:SetHide(true)
						if politicPercent <= 0 then
							instance.FactionBase:SetAlpha(0.4)
						else
							instance.FactionBase:SetAlpha(1)
						end
					end
				end
			elseif activePlayer:HasReform(reformTLegislatureEcumenicalID) then
				local stateReligionID = activePlayer:GetStateReligion()
				for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do	
					local otherPlayer = Players[otherPlayerID]
					if otherPlayer:IsAlive() then
						local clergyID = otherPlayer:GetFactionClergyID()
						local politicPercent = activePlayer:GetPoliticPercent(clergyID)
						if ((showDetailedFactions or politicPercent > 0) and otherPlayer:GetStateReligion() == stateReligionID) then
							table.insert(politics, {IsRevolutionaries = false, PoliticID = otherPlayerID, PlayerAdj = otherPlayer:GetCivilizationAdjective(), Percent = politicPercent, CivHighestYield = otherPlayer:GetHighestYield()});
						elseif politicPercent > 0 then
							table.insert(politics, {IsRevolutionaries = false, PoliticID = otherPlayerID, PlayerAdj = otherPlayer:GetCivilizationAdjective(), Percent = politicPercent, CivHighestYield = otherPlayer:GetHighestYield()});
						end
					end
				end
				for row in GameInfo.JFD_Politics("PrereqGovernment = '" .. government.Type .. "' AND NOT Type = 'CLERGY_JFD_CLERGY'") do
					local prereqReformID = GameInfoTypes[row.PrereqReform]
					if ((prereqReformID and activePlayer:HasReform(prereqReformID)) or (not prereqReformID)) then
						local politicPercent = activePlayer:GetPoliticPercent(row.ID)
						if (showDetailedFactions or politicPercent > 0) then
							table.insert(politics, {IsRevolutionaries = true, PoliticID = row.ID, PlayerAdj = nil, Percent = politicPercent, CivHighestYield = nil});
						elseif politicPercent > 0 then
							table.insert(politics, {IsRevolutionaries = true, PoliticID = row.ID, PlayerAdj = nil, Percent = politicPercent, CivHighestYield = nil});
						end
					end
				end
				if #politics == 0 then
					Controls.NoLegislatureLabel:SetHide(false)
					Controls.NoLegislatureLabel:LocalizeAndSetText("TXT_KEY_JFD_GO_LEGISLATURE_TT_EMPTY")
				end
				table.sort(politics, function(a,b) return a.Percent > b.Percent end)
				for _,politic in ipairs(politics) do
					local instance = g_PoliticalFactionManager:GetInstance()
					if (not politic.IsRevolutionaries) then
						local politicID = politic.PoliticID
						local politicDesc = Locale.ConvertTextKey(activePlayer:GetPoliticDescription(stateReligionID, true))
						local politicHighlight = "[COLOR_JFD_SOVEREIGNTY_FADING]"
						local politicPercent = politic.Percent
						instance.FactionName:LocalizeAndSetText("  {1_CivAdj} {2_ClergyDesc}", politic.PlayerAdj, politicDesc)
						if politic.CivHighestYield == yieldCultureID then
							instance.FactionName:LocalizeAndSetToolTip("TXT_KEY_JFD_CLERGY_JFD_ECUMENICAL_CULTURE_HELP", politic.PlayerAdj, politicDesc)
						elseif politic.CivHighestYield == yieldGoldID then
							instance.FactionName:LocalizeAndSetToolTip("TXT_KEY_JFD_CLERGY_JFD_ECUMENICAL_GOLD_HELP", politic.PlayerAdj, politicDesc)
						elseif politic.CivHighestYield == yieldScienceID then
							instance.FactionName:LocalizeAndSetToolTip("TXT_KEY_JFD_CLERGY_JFD_ECUMENICAL_SCIENCE_HELP", politic.PlayerAdj, politicDesc)
						else
							instance.FactionName:LocalizeAndSetToolTip("TXT_KEY_JFD_CLERGY_JFD_ECUMENICAL_FAITH_HELP", politic.PlayerAdj, politicDesc)
						end
						instance.Sovereignty:LocalizeAndSetText("{1_SovHL}{2_num}%[ICON_JFD_SOVEREIGNTY][ENDCOLOR]", politicHighlight, politicPercent)
						CivIconHookup(politic.PoliticID, 32, instance.CivIcon, instance.CivIconBG, instance.CivIconShadow, false, true, instance.CivIconHighlight)
						instance.CityStateIcon:SetHide(true)
						instance.CivIconBox:SetHide(false)
						if politicPercent <= 0 then
							instance.FactionBase:SetAlpha(0.4)
						else
							instance.FactionBase:SetAlpha(1)
						end
					else
						local politicID = politic.PoliticID
						local politicInfo = GameInfo.JFD_Politics[politicID]
						local politicDesc = Locale.ConvertTextKey(activePlayer:GetPoliticDescription(politicID))
						local politicHighlight = "[COLOR_JFD_SOVEREIGNTY_FADING]"
						local politicPercent = politic.Percent
						local sovereigntyTT = Locale.ConvertTextKey("TXT_KEY_GO_JFD_FACTION_TT")
						instance.FactionName:LocalizeAndSetToolTip(politicInfo.Help, politicDesc, politicPercent)
						instance.FactionName:SetText(politicInfo.FontIcon .. " " .. politicDesc)
						instance.Sovereignty:LocalizeAndSetText("{1_SovHL}{2_Num}%[ICON_JFD_SOVEREIGNTY][ENDCOLOR]", politicHighlight, politicPercent)
						instance.CityStateIcon:SetHide(true)
						instance.CivIconBox:SetHide(true)
						if politicPercent <= 0 then
							instance.FactionBase:SetAlpha(0.4)
						else
							instance.FactionBase:SetAlpha(1)
						end
					end
				end
			end
		elseif governmentID == governmentShogunateID then
			local politics = {};
			for row in GameInfo.JFD_Politics("PrereqGovernment = '" .. government.Type .. "'") do
				local prereqReformID = GameInfoTypes[row.PrereqReform]
				if ((prereqReformID and activePlayer:HasReform(prereqReformID)) or (not prereqReformID)) then
					local politicPercent = activePlayer:GetPoliticPercent(row.ID)
					if showDetailedFactions then
						if (politicPercent > 0 or row.Type == "IMP_FACTION_JFD_REVOLUTIONARY") then
							table.insert(politics, {PoliticID = row.ID, Percent = politicPercent});
						end
					elseif politicPercent > 0 then
						table.insert(politics, {PoliticID = row.ID, Percent = politicPercent});
					end
				end
			end
			table.sort(politics, function(a,b) return a.Percent > b.Percent end)
			for _,politic in ipairs(politics) do
				local instance = g_PoliticalFactionManager:GetInstance()
				local politicID = politic.PoliticID
				local politicInfo = GameInfo.JFD_Politics[politicID]
				local politicDesc = Locale.ConvertTextKey("TXT_KEY_JFD_IMP_FACTION_JFD_EMPEROR_SHORT_DESC") .. " " .. Locale.ConvertTextKey(player:GetPoliticLeaderKey())
				local politicHighlight = "[COLOR_JFD_SOVEREIGNTY]"
				local politicPercent = politic.Percent
				instance.FactionName:LocalizeAndSetToolTip(politicInfo.Help, politicDesc, politicPercent)
				instance.FactionName:SetText(politicInfo.FontIcon .. " " .. politicDesc)
				instance.Sovereignty:LocalizeAndSetText("{1_SovHL}{2_num}%[ICON_JFD_SOVEREIGNTY][ENDCOLOR]", politicHighlight, politicPercent)
				if (politicInfo.HelpIdeologyPreference and ideologyID == GameInfoTypes[politicInfo.IdeologyType]) then
					instance.Sovereignty:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_GO_JFD_FACTION_TT") .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey(politicInfo.HelpIdeologyPreference))
				else
					instance.Sovereignty:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_GO_JFD_FACTION_TT")) 
				end
				instance.CityStateIcon:SetHide(true)
				instance.CivIconBox:SetHide(true)
				if politicPercent <= 0 then
					instance.FactionBase:SetAlpha(0.4)
				else
					instance.FactionBase:SetAlpha(1)
				end
			end
		else
			local politics = {};
			for row in GameInfo.JFD_Politics("PrereqGovernment = '" .. government.Type .. "'") do
				local prereqReformID = GameInfoTypes[row.PrereqReform]
				if ((prereqReformID and activePlayer:HasReform(prereqReformID)) or (not prereqReformID)) then
					local politicPercent = activePlayer:GetPoliticPercent(row.ID)
					if showDetailedFactions then
						if (row.ReqsNotIdeology and activePlayer:GetLateGamePolicyTree() == -1) then
							table.insert(politics, {PoliticID = row.ID, Percent = politicPercent});
						elseif ((row.ReqsIdeology and activePlayer:GetLateGamePolicyTree() > -1) and (not row.ReqsNotIdeology) or ((not row.ReqsIdeology) and (not row.ReqsNotIdeology))) then
							table.insert(politics, {PoliticID = row.ID, Percent = politicPercent});
						end
					elseif politicPercent > 0 then
						table.insert(politics, {PoliticID = row.ID, Percent = politicPercent});
					end
				end
			end
			table.sort(politics, function(a,b) return a.Percent > b.Percent end)
			for _,politic in ipairs(politics) do
				local instance = g_PoliticalFactionManager:GetInstance()
				local politicID = politic.PoliticID
				local politicInfo = GameInfo.JFD_Politics[politicID]
				local politicDesc = Locale.ConvertTextKey(activePlayer:GetPoliticDescription(politicID))
				local politicHighlight = "[COLOR_JFD_SOVEREIGNTY_FADING]"
				if politicInfo.Type == "ASSEMBLY_JFD_MILITARY" then politicHighlight = "[COLOR_JFD_SOVEREIGNTY]" end
				local politicPercent = politic.Percent
				instance.FactionName:LocalizeAndSetToolTip(politicInfo.Help, politicDesc, politicPercent)
				instance.FactionName:SetText(politicInfo.FontIcon .. " " .. politicDesc)
				instance.Sovereignty:LocalizeAndSetText("{1_SovHL}{2_num}%[ICON_JFD_SOVEREIGNTY][ENDCOLOR]", politicHighlight, politicPercent)
				if (politicInfo.HelpIdeologyPreference and ideologyID == GameInfoTypes[politicInfo.IdeologyType]) then
					instance.Sovereignty:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_GO_JFD_FACTION_TT") .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey(politicInfo.HelpIdeologyPreference))
				else
					instance.Sovereignty:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_GO_JFD_FACTION_TT")) 
				end
				instance.CityStateIcon:SetHide(true)
				instance.CivIconBox:SetHide(true)
				if politicPercent <= 0 then
					instance.FactionBase:SetAlpha(0.4)
				else
					instance.FactionBase:SetAlpha(1)
				end
			end
		end
	end
	Controls.FactionStack:CalculateSize()
	Controls.FactionStack:ReprocessAnchoring()
	Controls.FactionScrollPanel:CalculateInternalSize()
end

function JFD_RefreshYourGovernmentReforms()
	local activePlayerID = Game.GetActivePlayer()
	local activePlayer = Players[activePlayerID]
	local activeTeam = Teams[Game.GetActiveTeam()]
	local governmentID = activePlayer:GetGovernment()
	local government = GameInfo.JFD_Governments[governmentID]
	local currentEraID = activePlayer:GetCurrentEra()
	local sovereignty = activePlayer:GetSovereignty()
	g_PoliticalReformsCategoryHeaderManager:ResetInstances()
	g_PoliticalReformsLeftManager:ResetInstances()
	g_PoliticalReformsCentreManager:ResetInstances()
	g_PoliticalReformsRightManager:ResetInstances()
	if activePlayer:HasGovernment() then
		local currentReformBranch = GameInfo.JFD_ReformBranches[currentReformBranchID]
		-- Left
		for row in GameInfo.JFD_Reforms("IsDisabled = 0 AND ReformBranchType = '" .. currentReformBranch.Type .. "' AND Alignment = 'REFORM_LEFT'") do
			local isReformVisible = true
			local prereqEraID = GameInfoTypes[row.PrereqEra]
			local prereqGovernmentID = GameInfoTypes[row.PrereqGovernment]
			if (prereqGovernmentID and governmentID ~= prereqGovernmentID) then
				isReformVisible = false
			end
			if isReformVisible then
				local instance = g_PoliticalReformsLeftManager:GetInstance()
				local reformID = row.ID
				local reformAlpha = 1
				local reformCost = activePlayer:GetReformCost(reformID)
				local reformDesc = Locale.ConvertTextKey(row.ShortDescription)
				local reformFocus = row.FocusIcon
				local reformBranchDesc = row.HeaderDescription
				local reformHelp = activePlayer:GetReformHelpTT(reformID)
				instance.ReformTitle:SetTruncateWidth(130)
				instance.ReformTitleDetailed:SetTruncateWidth(100)
				instance.ReformBranch:SetTruncateWidth(120)
				instance.ReformOpinion:SetHide(true)
				instance.ReformHL:SetHide(true)
				instance.ReformCost:SetHide(true)
				instance.VerticalTrim1:SetHide(false)
				instance.VerticalTrim2:SetHide(false)
				local hasReform = activePlayer:HasReform(reformID)
				if hasReform then
					instance.ReformButton:SetAlpha(1)
					instance.CenterLine:SetAlpha(0.5)
					instance.ReformButton:SetDisabled(true)
					instance.ReformHL:SetHide(false)
					instance.ReformTitle:SetTruncateWidth(200)
					instance.ReformTitleDetailed:SetTruncateWidth(200)
					instance.ReformTitle:LocalizeAndSetText("[COLOR_POSITIVE_TEXT]" .. reformDesc .. "[ENDCOLOR]")
					instance.ReformTitleDetailed:LocalizeAndSetText("[COLOR_POSITIVE_TEXT]" .. reformDesc .. "[ENDCOLOR]")
					instance.VerticalTrim1:SetHide(true)
					instance.VerticalTrim2:SetHide(true)
				else
					if (showNewReforms and currentEraID == prereqEraID and (not showDetailedReforms) and (not showReformIcons)) then
						instance.ReformNew:SetHide(false)
					else
						instance.ReformNew:SetHide(true)
					end
					local canHaveReform, canHaveReformIfNotCooldown, disabledFontIcon = activePlayer:CanHaveReform(reformID, true)
					if (not canHaveReform) then
						instance.ReformButton:SetAlpha(0.5)
						instance.ReformButton:SetDisabled(true)
						instance.ReformCost:LocalizeAndSetText(disabledFontIcon)
						instance.ReformCost:SetHide(false)
						instance.ReformTitle:LocalizeAndSetText("[COLOR_NEGATIVE_TEXT]" .. reformDesc .. "[ENDCOLOR]")
						instance.ReformTitleDetailed:LocalizeAndSetText("[COLOR_NEGATIVE_TEXT]" .. reformDesc .. "[ENDCOLOR]")
						instance.ReformBranchDetailed:SetTruncateWidth(150)
						if (showDetailedReforms and canHaveReformIfNotCooldown) then
							instance.ReformCost:SetHide(false)
							instance.ReformCost:LocalizeAndSetText("[COLOR_JFD_SOVEREIGNTY_FADING]{1_Num}%[ICON_JFD_SOVEREIGNTY][ENDCOLOR]", reformCost)
						end
					else
						if sovereignty < reformCost then
							instance.ReformButton:SetAlpha(0.5)
							instance.CenterLine:SetAlpha(1)
							instance.ReformButton:SetDisabled(true)
							instance.ReformTitle:LocalizeAndSetText("[COLOR_NEGATIVE_TEXT]" .. reformDesc .. "[ENDCOLOR]")
							instance.ReformTitleDetailed:LocalizeAndSetText("[COLOR_NEGATIVE_TEXT]" .. reformDesc .. "[ENDCOLOR]")
							if showDetailedReforms then
								instance.ReformCost:SetHide(false)
								instance.ReformCost:LocalizeAndSetText("[COLOR_JFD_SOVEREIGNTY_FADING]{1_Num}%[ICON_JFD_SOVEREIGNTY][ENDCOLOR]", reformCost)
							end
						else
							instance.ReformButton:SetAlpha(1)
							instance.CenterLine:SetAlpha(0.5)
							instance.ReformButton:SetDisabled(false)
							instance.ReformTitle:SetText(reformDesc)
							instance.ReformTitleDetailed:SetText(reformDesc)
							if showDetailedReforms then
								instance.ReformCost:SetHide(false)
								instance.ReformCost:LocalizeAndSetText("[COLOR_JFD_SOVEREIGNTY]{1_Num}%[ICON_JFD_SOVEREIGNTY][ENDCOLOR]", reformCost)
							end
						end
					end
					if showDetailedReforms then
						local reformFavoured = activePlayer:GetReformOpinionFavoured(reformID)
						local reformOpposed  = activePlayer:GetReformOpinionOpposed(reformID)
						if (reformFavoured > 0 or reformOpposed > 0) then
							instance.ReformOpinion:LocalizeAndSetText("TXT_KEY_JFD_REFORM_OPINION", reformFavoured, reformOpposed) 
							instance.ReformOpinion:SetHide(false)
							instance.ReformOpinion:SetAlpha(reformAlpha)
							instance.ReformBranchDetailed:SetTruncateWidth(80)
						end
					end
				end
				instance.ReformTitle:SetHide(false)
				instance.ReformTitleDetailed:SetHide(true)
				instance.ReformBranch:SetHide(false)
				instance.ReformBranch:LocalizeAndSetText(Locale.ToUpper(reformBranchDesc))
				instance.ReformBranchDetailed:SetHide(true)
				instance.ReformBranchDetailed:LocalizeAndSetText(Locale.ToUpper(reformBranchDesc))
				if showDetailedReforms then
					instance.ReformTitle:SetHide(true)
					instance.ReformTitleDetailed:SetHide(false)
					instance.ReformBranch:SetHide(true)
					instance.ReformBranchDetailed:SetHide(false)
					instance.ReformBranchDetailed:SetOffsetX(5)
				end
				if showReformIcons then
					instance.ReformTitle:SetHide(true)
					instance.ReformTitleDetailed:SetHide(false)
					instance.ReformBranch:SetHide(true)
					instance.ReformBranchDetailed:SetHide(false)
					if reformFocus then
						instance.ReformBranchDetailed:SetText(Locale.ConvertTextKey(reformFocus) .. "" .. Locale.ToUpper(reformBranchDesc))
						instance.ReformBranchDetailed:SetOffsetX(0)
					end
				end
				instance.ReformBranch:ReprocessAnchoring()
				instance.ReformButton:LocalizeAndSetToolTip(reformHelp)
				instance.ReformButton:RegisterCallback(Mouse.eLClick, JFD_OnReformClicked)
				instance.ReformButton:SetVoid1(reformID)
				local pediaEntry = CivilopediaControl and (row.Pedia)
				if (pediaEntry and (not instance.ReformButton:IsDisabled())) then
					instance.ReformButton:RegisterCallback(Mouse.eRClick, function() getPedia(pediaEntry) end)
				end
			end
		end	
		
		-- Centre
		for row in GameInfo.JFD_Reforms("IsDisabled = 0 AND ReformBranchType = '" .. currentReformBranch.Type .. "' AND Alignment = 'REFORM_CENTRE'") do
			local isReformVisible = true
			local prereqGovernmentID = GameInfoTypes[row.PrereqGovernment]
			if (prereqGovernmentID and governmentID ~= prereqGovernmentID) then
				isReformVisible = false
			end
			if isReformVisible then
				local instance = g_PoliticalReformsCentreManager:GetInstance()
				local reformID = row.ID
				local reformAlpha = 1
				local reformCost = activePlayer:GetReformCost(reformID)
				local reformDesc = Locale.ConvertTextKey(row.ShortDescription)
				local reformFocus = row.FocusIcon
				local reformBranchDesc = row.HeaderDescription
				local reformHelp = activePlayer:GetReformHelpTT(reformID)
				instance.ReformTitle:SetTruncateWidth(130)
				instance.ReformTitleDetailed:SetTruncateWidth(100)
				instance.ReformBranch:SetTruncateWidth(120)
				instance.ReformOpinion:SetHide(true)
				instance.ReformHL:SetHide(true)
				instance.ReformCost:SetHide(true)
				instance.VerticalTrim1:SetHide(false)
				instance.VerticalTrim2:SetHide(false)
				local hasReform = activePlayer:HasReform(reformID)
				if hasReform then
					instance.ReformButton:SetAlpha(1)
					instance.CenterLine:SetAlpha(0.5)
					instance.ReformButton:SetDisabled(true)
					instance.ReformHL:SetHide(false)
					instance.ReformTitle:SetTruncateWidth(200)
					instance.ReformTitleDetailed:SetTruncateWidth(200)
					instance.ReformTitle:LocalizeAndSetText("[COLOR_POSITIVE_TEXT]" .. reformDesc .. "[ENDCOLOR]")
					instance.ReformTitleDetailed:LocalizeAndSetText("[COLOR_POSITIVE_TEXT]" .. reformDesc .. "[ENDCOLOR]")
					instance.VerticalTrim1:SetHide(true)
					instance.VerticalTrim2:SetHide(true)
				else
					local canHaveReform, canHaveReformIfNotCooldown, disabledFontIcon = activePlayer:CanHaveReform(reformID, true)
					if (not canHaveReform) then
						instance.ReformButton:SetAlpha(0.5)
						instance.ReformButton:SetDisabled(true)
						instance.ReformCost:LocalizeAndSetText(disabledFontIcon)
						instance.ReformCost:SetHide(false)
						instance.ReformTitle:LocalizeAndSetText("[COLOR_NEGATIVE_TEXT]" .. reformDesc .. "[ENDCOLOR]")
						instance.ReformTitleDetailed:LocalizeAndSetText("[COLOR_NEGATIVE_TEXT]" .. reformDesc .. "[ENDCOLOR]")
						instance.ReformBranchDetailed:SetTruncateWidth(150)
						if (showDetailedReforms and canHaveReformIfNotCooldown) then
							instance.ReformCost:SetHide(false)
							instance.ReformCost:LocalizeAndSetText("[COLOR_JFD_SOVEREIGNTY_FADING]{1_Num}%[ICON_JFD_SOVEREIGNTY][ENDCOLOR]", reformCost)
						end
					else
						if sovereignty < reformCost then
							instance.ReformButton:SetAlpha(0.5)
							instance.CenterLine:SetAlpha(1)
							instance.ReformButton:SetDisabled(true)
							instance.ReformTitle:LocalizeAndSetText("[COLOR_NEGATIVE_TEXT]" .. reformDesc .. "[ENDCOLOR]")
							instance.ReformTitleDetailed:LocalizeAndSetText("[COLOR_NEGATIVE_TEXT]" .. reformDesc .. "[ENDCOLOR]")
							if showDetailedReforms then
								instance.ReformCost:SetHide(false)
								instance.ReformCost:LocalizeAndSetText("[COLOR_JFD_SOVEREIGNTY_FADING]{1_Num}%[ICON_JFD_SOVEREIGNTY][ENDCOLOR]", reformCost)
							end
						else
							instance.ReformButton:SetAlpha(1)
							instance.CenterLine:SetAlpha(0.5)
							instance.ReformButton:SetDisabled(false)
							instance.ReformTitle:SetText(reformDesc)
							instance.ReformTitleDetailed:SetText(reformDesc)
							if showDetailedReforms then
								instance.ReformCost:SetHide(false)
								instance.ReformCost:LocalizeAndSetText("[COLOR_JFD_SOVEREIGNTY]{1_Num}%[ICON_JFD_SOVEREIGNTY][ENDCOLOR]", reformCost)
							end
						end
					end
					if showDetailedReforms then
						local reformFavoured = activePlayer:GetReformOpinionFavoured(reformID)
						local reformOpposed  = activePlayer:GetReformOpinionOpposed(reformID)
						if (reformFavoured > 0 or reformOpposed > 0) then
							instance.ReformOpinion:LocalizeAndSetText("TXT_KEY_JFD_REFORM_OPINION", reformFavoured, reformOpposed) 
							instance.ReformOpinion:SetHide(false)
							instance.ReformOpinion:SetAlpha(reformAlpha)
							instance.ReformBranchDetailed:SetTruncateWidth(80)
						end
					end
				end
				instance.ReformTitle:SetHide(false)
				instance.ReformTitleDetailed:SetHide(true)
				instance.ReformBranch:SetHide(false)
				instance.ReformBranch:LocalizeAndSetText(Locale.ToUpper(reformBranchDesc))
				instance.ReformBranchDetailed:SetHide(true)
				instance.ReformBranchDetailed:LocalizeAndSetText(Locale.ToUpper(reformBranchDesc))
				if showDetailedReforms then
					instance.ReformTitle:SetHide(true)
					instance.ReformTitleDetailed:SetHide(false)
					instance.ReformBranch:SetHide(true)
					instance.ReformBranchDetailed:SetHide(false)
					instance.ReformBranchDetailed:SetOffsetX(5)
				end
				if showReformIcons then
					instance.ReformTitle:SetHide(true)
					instance.ReformTitleDetailed:SetHide(false)
					instance.ReformBranch:SetHide(true)
					instance.ReformBranchDetailed:SetHide(false)
					if reformFocus then
						instance.ReformBranchDetailed:SetText(Locale.ConvertTextKey(reformFocus) .. "" .. Locale.ToUpper(reformBranchDesc))
						instance.ReformBranchDetailed:SetOffsetX(0)
					end
				end
				instance.ReformBranch:ReprocessAnchoring()
				instance.ReformButton:LocalizeAndSetToolTip(reformHelp)
				instance.ReformButton:RegisterCallback(Mouse.eLClick, JFD_OnReformClicked)
				instance.ReformButton:SetVoid1(reformID)
				local pediaEntry = CivilopediaControl and (row.Pedia)
				if (pediaEntry and (not instance.ReformButton:IsDisabled())) then
					instance.ReformButton:RegisterCallback(Mouse.eRClick, function() getPedia(pediaEntry) end)
				end
			end
		end	
		
		-- Right
		for row in GameInfo.JFD_Reforms("IsDisabled = 0 AND ReformBranchType = '" .. currentReformBranch.Type .. "' AND Alignment = 'REFORM_RIGHT'") do
			local isReformVisible = true
			local prereqEraID = GameInfoTypes[row.PrereqEra]
			local prereqGovernmentID = GameInfoTypes[row.PrereqGovernment]
			if (prereqGovernmentID and governmentID ~= prereqGovernmentID) then
				isReformVisible = false
			end
			if isReformVisible then
				local instance = g_PoliticalReformsRightManager:GetInstance()
				local reformID = row.ID
				local reformAlpha = 1
				local reformCost = activePlayer:GetReformCost(reformID)
				local reformDesc = Locale.ConvertTextKey(row.ShortDescription)
				local reformFocus = row.FocusIcon
				local reformBranchDesc = row.HeaderDescription
				local reformHelp = activePlayer:GetReformHelpTT(reformID)
				instance.ReformTitle:SetTruncateWidth(130)
				instance.ReformTitleDetailed:SetTruncateWidth(100)
				instance.ReformBranch:SetTruncateWidth(120)
				instance.ReformOpinion:SetHide(true)
				instance.ReformHL:SetHide(true)
				instance.CenterLine:SetHide(true)
				instance.ReformCost:SetHide(true)
				instance.VerticalTrim1:SetHide(false)
				instance.VerticalTrim2:SetHide(false)
				local hasReform = activePlayer:HasReform(reformID)
				if hasReform then
					instance.ReformButton:SetAlpha(1)
					instance.ReformButton:SetDisabled(true)
					instance.ReformHL:SetHide(false)
					instance.ReformTitle:SetTruncateWidth(200)
					instance.ReformTitleDetailed:SetTruncateWidth(200)
					instance.ReformTitle:LocalizeAndSetText("[COLOR_POSITIVE_TEXT]" .. reformDesc .. "[ENDCOLOR]")
					instance.ReformTitleDetailed:LocalizeAndSetText("[COLOR_POSITIVE_TEXT]" .. reformDesc .. "[ENDCOLOR]")
					instance.VerticalTrim1:SetHide(true)
					instance.VerticalTrim2:SetHide(true)
				else
					if (showNewReforms and currentEraID == prereqEraID and (not showDetailedReforms) and (not showReformIcons)) then
						instance.ReformNew:SetHide(false)
					else
						instance.ReformNew:SetHide(true)
					end
					local canHaveReform, canHaveReformIfNotCooldown, disabledFontIcon = activePlayer:CanHaveReform(reformID, true)
					if (not canHaveReform) then
						instance.ReformButton:SetAlpha(0.5)
						instance.ReformButton:SetDisabled(true)
						instance.ReformCost:LocalizeAndSetText(disabledFontIcon)
						instance.ReformCost:SetHide(false)
						instance.ReformTitle:LocalizeAndSetText("[COLOR_NEGATIVE_TEXT]" .. reformDesc .. "[ENDCOLOR]")
						instance.ReformTitleDetailed:LocalizeAndSetText("[COLOR_NEGATIVE_TEXT]" .. reformDesc .. "[ENDCOLOR]")
						instance.ReformBranchDetailed:SetTruncateWidth(150)
						if (showDetailedReforms and canHaveReformIfNotCooldown) then
							instance.ReformCost:SetHide(false)
							instance.ReformCost:LocalizeAndSetText("[COLOR_JFD_SOVEREIGNTY_FADING]{1_Num}%[ICON_JFD_SOVEREIGNTY][ENDCOLOR]", reformCost)
						end
					else
						if sovereignty < reformCost then
							instance.ReformButton:SetAlpha(0.5)
							instance.ReformButton:SetDisabled(true)
							instance.ReformTitle:LocalizeAndSetText("[COLOR_NEGATIVE_TEXT]" .. reformDesc .. "[ENDCOLOR]")
							instance.ReformTitleDetailed:LocalizeAndSetText("[COLOR_NEGATIVE_TEXT]" .. reformDesc .. "[ENDCOLOR]")
							if showDetailedReforms then
								instance.ReformCost:SetHide(false)
								instance.ReformCost:LocalizeAndSetText("[COLOR_JFD_SOVEREIGNTY_FADING]{1_Num}%[ICON_JFD_SOVEREIGNTY][ENDCOLOR]", reformCost)
							end
						else
							instance.ReformButton:SetAlpha(1)
							instance.ReformButton:SetDisabled(false)
							instance.ReformTitle:SetText(reformDesc)
							instance.ReformTitleDetailed:SetText(reformDesc)
							if showDetailedReforms then
								instance.ReformCost:SetHide(false)
								instance.ReformCost:LocalizeAndSetText("[COLOR_JFD_SOVEREIGNTY]{1_Num}%[ICON_JFD_SOVEREIGNTY][ENDCOLOR]", reformCost)
							end
						end
					end
					if showDetailedReforms then
						local reformFavoured = activePlayer:GetReformOpinionFavoured(reformID)
						local reformOpposed  = activePlayer:GetReformOpinionOpposed(reformID)
						if (reformFavoured > 0 or reformOpposed > 0) then
							instance.ReformOpinion:LocalizeAndSetText("TXT_KEY_JFD_REFORM_OPINION", reformFavoured, reformOpposed) 
							instance.ReformOpinion:SetHide(false)
							instance.ReformOpinion:SetAlpha(reformAlpha)
							instance.ReformBranchDetailed:SetTruncateWidth(80)
						end
					end
				end
				instance.ReformTitle:SetHide(false)
				instance.ReformTitleDetailed:SetHide(true)
				instance.ReformBranch:SetHide(false)
				instance.ReformBranch:LocalizeAndSetText(Locale.ToUpper(reformBranchDesc))
				instance.ReformBranchDetailed:SetHide(true)
				instance.ReformBranchDetailed:LocalizeAndSetText(Locale.ToUpper(reformBranchDesc))
				if showDetailedReforms then
					instance.ReformTitle:SetHide(true)
					instance.ReformTitleDetailed:SetHide(false)
					instance.ReformBranch:SetHide(true)
					instance.ReformBranchDetailed:SetHide(false)
					instance.ReformBranchDetailed:SetOffsetX(5)
				end
				if showReformIcons then
					instance.ReformTitle:SetHide(true)
					instance.ReformTitleDetailed:SetHide(false)
					instance.ReformBranch:SetHide(true)
					instance.ReformBranchDetailed:SetHide(false)
					if reformFocus then
						instance.ReformBranchDetailed:SetText(Locale.ConvertTextKey(reformFocus) .. "" .. Locale.ToUpper(reformBranchDesc))
						instance.ReformBranchDetailed:SetOffsetX(0)
					end
				end
				instance.ReformBranch:ReprocessAnchoring()
				instance.ReformButton:LocalizeAndSetToolTip(reformHelp)
				instance.ReformButton:RegisterCallback(Mouse.eLClick, JFD_OnReformClicked)
				instance.ReformButton:SetVoid1(reformID)
				local pediaEntry = CivilopediaControl and (row.Pedia)
				if (pediaEntry and (not instance.ReformButton:IsDisabled())) then
					instance.ReformButton:RegisterCallback(Mouse.eRClick, function() getPedia(pediaEntry) end)
				end
			end
		end	
	end
	Controls.PoliticalReformsLeftStack:CalculateSize()
	Controls.PoliticalReformsCentreStack:CalculateSize()
	Controls.PoliticalReformsRightStack:CalculateSize()
	Controls.PoliticalReformsScrollPanel:CalculateInternalSize()
	Controls.PoliticalReformsLeftStack:ReprocessAnchoring()
	Controls.PoliticalReformsCentreStack:ReprocessAnchoring()
	Controls.PoliticalReformsRightStack:ReprocessAnchoring()
end
g_Tabs["YourGovernment"].RefreshContent = JFD_RefreshYourGovernment;

local reformBranchGovernmentID = GameInfoTypes["REFORM_BRANCH_JFD_GOVERNMENT"]
local reformBranchCultureID    = GameInfoTypes["REFORM_BRANCH_JFD_CULTURE"]
local reformBranchEconomicID   = GameInfoTypes["REFORM_BRANCH_JFD_ECONOMY"]
local reformBranchForeignID    = GameInfoTypes["REFORM_BRANCH_JFD_FOREIGN"]
local reformBranchIndustryID   = GameInfoTypes["REFORM_BRANCH_JFD_INDUSTRY"]
local reformBranchLegalID 	   = GameInfoTypes["REFORM_BRANCH_JFD_LEGAL"]
local reformBranchMilitaryID   = GameInfoTypes["REFORM_BRANCH_JFD_MILITARY"]
local reformBranchReligionID   = GameInfoTypes["REFORM_BRANCH_JFD_RELIGION"]

function JFD_UpdateCurrentReformBranch()
	local activePlayerID = Game.GetActivePlayer()
	local reformBranch = GameInfo.JFD_ReformBranches[currentReformBranchID]
	Controls.ReformBranchHeaderLabel:SetText(string.upper(Locale.ConvertTextKey(reformBranch.ShortDescription)))
	Controls.ReformBranchHeaderLabel:SetToolTipString(Locale.ConvertTextKey(reformBranch.Help)) 
	JFD_RefreshYourGovernment()
end

function JFD_OnPoliticalReformBranch1Button()
	currentReformBranchID = reformBranchGovernmentID
	Controls.ReformBranchButton1:SetDisabled(true)
	Controls.ReformBranchButton1:SetTexture("DC45_GovernmentReformsHL.dds")
	Controls.ReformBranchButton2:SetDisabled(false)
	Controls.ReformBranchButton2:SetTexture("DC45_LegalReforms.dds")
	Controls.ReformBranchButton3:SetDisabled(false)
	Controls.ReformBranchButton3:SetTexture("DC45_CultureReforms.dds")
	Controls.ReformBranchButton4:SetDisabled(false)
	Controls.ReformBranchButton4:SetTexture("DC45_EconomicReforms.dds")
	Controls.ReformBranchButton5:SetDisabled(false)
	Controls.ReformBranchButton5:SetTexture("DC45_ForeignReforms.dds")
	Controls.ReformBranchButton6:SetDisabled(false)
	Controls.ReformBranchButton6:SetTexture("DC45_IndustryReforms.dds")
	Controls.ReformBranchButton7:SetDisabled(false)
	Controls.ReformBranchButton7:SetTexture("DC45_MilitaryReforms.dds")
	Controls.ReformBranchButton8:SetDisabled(false)
	Controls.ReformBranchButton8:SetTexture("DC45_ReligionReforms.dds")
	JFD_UpdateCurrentReformBranch()
end
Controls.ReformBranchButton1:RegisterCallback(Mouse.eLClick, JFD_OnPoliticalReformBranch1Button)

function JFD_OnPoliticalReformBranch2Button()
	currentReformBranchID = reformBranchLegalID
	Controls.ReformBranchButton1:SetDisabled(false)
	Controls.ReformBranchButton1:SetTexture("DC45_GovernmentReforms.dds")
	Controls.ReformBranchButton2:SetDisabled(true)
	Controls.ReformBranchButton2:SetTexture("DC45_LegalReformsHL.dds")
	Controls.ReformBranchButton3:SetDisabled(false)
	Controls.ReformBranchButton3:SetTexture("DC45_CultureReforms.dds")
	Controls.ReformBranchButton4:SetDisabled(false)
	Controls.ReformBranchButton4:SetTexture("DC45_EconomicReforms.dds")
	Controls.ReformBranchButton5:SetDisabled(false)
	Controls.ReformBranchButton5:SetTexture("DC45_ForeignReforms.dds")
	Controls.ReformBranchButton6:SetDisabled(false)
	Controls.ReformBranchButton6:SetTexture("DC45_IndustryReforms.dds")
	Controls.ReformBranchButton7:SetDisabled(false)
	Controls.ReformBranchButton7:SetTexture("DC45_MilitaryReforms.dds")
	Controls.ReformBranchButton8:SetDisabled(false)
	Controls.ReformBranchButton8:SetTexture("DC45_ReligionReforms.dds")
	JFD_UpdateCurrentReformBranch()
end
Controls.ReformBranchButton2:RegisterCallback(Mouse.eLClick, JFD_OnPoliticalReformBranch2Button)

function JFD_OnPoliticalReformBranch3Button()
	currentReformBranchID = reformBranchCultureID
	Controls.ReformBranchButton1:SetDisabled(false)
	Controls.ReformBranchButton1:SetTexture("DC45_GovernmentReforms.dds")
	Controls.ReformBranchButton2:SetDisabled(false)
	Controls.ReformBranchButton2:SetTexture("DC45_LegalReforms.dds")
	Controls.ReformBranchButton3:SetDisabled(true)
	Controls.ReformBranchButton3:SetTexture("DC45_CultureReformsHL.dds")
	Controls.ReformBranchButton4:SetDisabled(false)
	Controls.ReformBranchButton4:SetTexture("DC45_EconomicReforms.dds")
	Controls.ReformBranchButton5:SetDisabled(false)
	Controls.ReformBranchButton5:SetTexture("DC45_ForeignReforms.dds")
	Controls.ReformBranchButton6:SetDisabled(false)
	Controls.ReformBranchButton6:SetTexture("DC45_IndustryReforms.dds")
	Controls.ReformBranchButton7:SetDisabled(false)
	Controls.ReformBranchButton7:SetTexture("DC45_MilitaryReforms.dds")
	Controls.ReformBranchButton8:SetDisabled(false)
	Controls.ReformBranchButton8:SetTexture("DC45_ReligionReforms.dds")
	JFD_UpdateCurrentReformBranch()
end
Controls.ReformBranchButton3:RegisterCallback(Mouse.eLClick, JFD_OnPoliticalReformBranch3Button)

function JFD_OnPoliticalReformBranch4Button()
	currentReformBranchID = reformBranchEconomicID
	Controls.ReformBranchButton1:SetDisabled(false)
	Controls.ReformBranchButton1:SetTexture("DC45_GovernmentReforms.dds")
	Controls.ReformBranchButton2:SetDisabled(false)
	Controls.ReformBranchButton2:SetTexture("DC45_LegalReforms.dds")
	Controls.ReformBranchButton3:SetDisabled(false)
	Controls.ReformBranchButton3:SetTexture("DC45_CultureReforms.dds")
	Controls.ReformBranchButton4:SetDisabled(true)
	Controls.ReformBranchButton4:SetTexture("DC45_EconomicReformsHL.dds")
	Controls.ReformBranchButton5:SetDisabled(false)
	Controls.ReformBranchButton5:SetTexture("DC45_ForeignReforms.dds")
	Controls.ReformBranchButton6:SetDisabled(false)
	Controls.ReformBranchButton6:SetTexture("DC45_IndustryReforms.dds")
	Controls.ReformBranchButton7:SetDisabled(false)
	Controls.ReformBranchButton7:SetTexture("DC45_MilitaryReforms.dds")
	Controls.ReformBranchButton8:SetDisabled(false)
	Controls.ReformBranchButton8:SetTexture("DC45_ReligionReforms.dds")
	JFD_UpdateCurrentReformBranch()
end
Controls.ReformBranchButton4:RegisterCallback(Mouse.eLClick, JFD_OnPoliticalReformBranch4Button)

function JFD_OnPoliticalReformBranch5Button()
	currentReformBranchID = reformBranchForeignID
	Controls.ReformBranchButton1:SetDisabled(false)
	Controls.ReformBranchButton1:SetTexture("DC45_GovernmentReforms.dds")
	Controls.ReformBranchButton2:SetDisabled(false)
	Controls.ReformBranchButton2:SetTexture("DC45_LegalReforms.dds")
	Controls.ReformBranchButton3:SetDisabled(false)
	Controls.ReformBranchButton3:SetTexture("DC45_CultureReforms.dds")
	Controls.ReformBranchButton4:SetDisabled(false)
	Controls.ReformBranchButton4:SetTexture("DC45_EconomicReforms.dds")
	Controls.ReformBranchButton5:SetDisabled(true)
	Controls.ReformBranchButton5:SetTexture("DC45_ForeignReformsHL.dds")
	Controls.ReformBranchButton6:SetDisabled(false)
	Controls.ReformBranchButton6:SetTexture("DC45_IndustryReforms.dds")
	Controls.ReformBranchButton7:SetDisabled(false)
	Controls.ReformBranchButton7:SetTexture("DC45_MilitaryReforms.dds")
	Controls.ReformBranchButton8:SetDisabled(false)
	Controls.ReformBranchButton8:SetTexture("DC45_ReligionReforms.dds")
	JFD_UpdateCurrentReformBranch()
end
Controls.ReformBranchButton5:RegisterCallback(Mouse.eLClick, JFD_OnPoliticalReformBranch5Button)

function JFD_OnPoliticalReformBranch6Button()
	currentReformBranchID = reformBranchIndustryID
	Controls.ReformBranchButton1:SetDisabled(false)
	Controls.ReformBranchButton1:SetTexture("DC45_GovernmentReforms.dds")
	Controls.ReformBranchButton2:SetDisabled(false)
	Controls.ReformBranchButton2:SetTexture("DC45_LegalReforms.dds")
	Controls.ReformBranchButton3:SetDisabled(false)
	Controls.ReformBranchButton3:SetTexture("DC45_CultureReforms.dds")
	Controls.ReformBranchButton4:SetDisabled(false)
	Controls.ReformBranchButton4:SetTexture("DC45_EconomicReforms.dds")
	Controls.ReformBranchButton5:SetDisabled(false)
	Controls.ReformBranchButton5:SetTexture("DC45_ForeignReforms.dds")
	Controls.ReformBranchButton6:SetDisabled(true)
	Controls.ReformBranchButton6:SetTexture("DC45_IndustryReformsHL.dds")
	Controls.ReformBranchButton7:SetDisabled(false)
	Controls.ReformBranchButton7:SetTexture("DC45_MilitaryReforms.dds")
	Controls.ReformBranchButton8:SetDisabled(false)
	Controls.ReformBranchButton8:SetTexture("DC45_ReligionReforms.dds")
	JFD_UpdateCurrentReformBranch()
end
Controls.ReformBranchButton6:RegisterCallback(Mouse.eLClick, JFD_OnPoliticalReformBranch6Button)

function JFD_OnPoliticalReformBranch7Button()
	currentReformBranchID = reformBranchMilitaryID
	Controls.ReformBranchButton1:SetDisabled(false)
	Controls.ReformBranchButton1:SetTexture("DC45_GovernmentReforms.dds")
	Controls.ReformBranchButton2:SetDisabled(false)
	Controls.ReformBranchButton2:SetTexture("DC45_LegalReforms.dds")
	Controls.ReformBranchButton3:SetDisabled(false)
	Controls.ReformBranchButton3:SetTexture("DC45_CultureReforms.dds")
	Controls.ReformBranchButton4:SetDisabled(false)
	Controls.ReformBranchButton4:SetTexture("DC45_EconomicReforms.dds")
	Controls.ReformBranchButton5:SetDisabled(false)
	Controls.ReformBranchButton5:SetTexture("DC45_ForeignReforms.dds")
	Controls.ReformBranchButton6:SetDisabled(false)
	Controls.ReformBranchButton6:SetTexture("DC45_IndustryReforms.dds")
	Controls.ReformBranchButton7:SetDisabled(true)
	Controls.ReformBranchButton7:SetTexture("DC45_MilitaryReformsHL.dds")
	Controls.ReformBranchButton8:SetDisabled(false)
	Controls.ReformBranchButton8:SetTexture("DC45_ReligionReforms.dds")
	JFD_UpdateCurrentReformBranch()
end
Controls.ReformBranchButton7:RegisterCallback(Mouse.eLClick, JFD_OnPoliticalReformBranch7Button)

function JFD_OnPoliticalReformBranch8Button()
	currentReformBranchID = reformBranchReligionID
	Controls.ReformBranchButton1:SetDisabled(false)
	Controls.ReformBranchButton1:SetTexture("DC45_GovernmentReforms.dds")
	Controls.ReformBranchButton2:SetDisabled(false)
	Controls.ReformBranchButton2:SetTexture("DC45_LegalReforms.dds")
	Controls.ReformBranchButton3:SetDisabled(false)
	Controls.ReformBranchButton3:SetTexture("DC45_CultureReforms.dds")
	Controls.ReformBranchButton4:SetDisabled(false)
	Controls.ReformBranchButton4:SetTexture("DC45_EconomicReforms.dds")
	Controls.ReformBranchButton5:SetDisabled(false)
	Controls.ReformBranchButton5:SetTexture("DC45_ForeignReforms.dds")
	Controls.ReformBranchButton6:SetDisabled(false)
	Controls.ReformBranchButton6:SetTexture("DC45_IndustryReforms.dds")
	Controls.ReformBranchButton7:SetDisabled(false)
	Controls.ReformBranchButton7:SetTexture("DC45_MilitaryReforms.dds")
	Controls.ReformBranchButton8:SetDisabled(true)
	Controls.ReformBranchButton8:SetTexture("DC45_ReligionReformsHL.dds")
	JFD_UpdateCurrentReformBranch()
end
Controls.ReformBranchButton8:RegisterCallback(Mouse.eLClick, JFD_OnPoliticalReformBranch8Button)

function JFD_OnChangeGovtButton()
	OnClose()
	LuaEvents.JFD_RTP_Sovereignty_ShowChooseGovernmentPopup(true)
end
Controls.ChangeGovernmentsButton:RegisterCallback(Mouse.eLClick, JFD_OnChangeGovtButton)
-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
function JFD_OnConfirmGovernmentName()
	Controls.GovtNameConfirm:SetHide(true)
	Controls.BGBlock:SetHide(false)
	JFD_RefreshYourGovernment()
end
Controls.EditOKButton:RegisterCallback(Mouse.eLClick, JFD_OnConfirmGovernmentName)

function JFD_ValidateEditBox(sValue, control, bFire)
	local activePlayer = Players[Game.GetActivePlayer()]
	local text = string.gsub(Controls.EditHeading:GetText(), " ", "")
	if (sValue and bFire and text:len() > 1) then
		activePlayer:SetLegislatureName(sValue)
	end
end
Controls.EditHeading:RegisterCallback(JFD_ValidateEditBox)

function JFD_OnEditNameClick()
	Controls.GovtNameConfirm:SetHide(false)
	Controls.BGBlock:SetHide(true)
end
Controls.LegislatureEditButton:RegisterCallback(Mouse.eLClick, JFD_OnEditNameClick)
-------------------------------------------------
-------------------------------------------------
function JFD_OnShowDetailedFactions(isChecked)
	showDetailedFactions = isChecked
	JFD_RefreshYourGovernment()
end
Controls.ShowDetailCheckFaction:RegisterCheckHandler(JFD_OnShowDetailedFactions)
-------------------------------------------------
-------------------------------------------------
function JFD_OnShowNewReforms(isChecked)
	showNewReforms = isChecked
	JFD_RefreshYourGovernment()
end
Controls.ShowNewCheckReform:RegisterCheckHandler(JFD_OnShowNewReforms)
-------------------------------------------------
-------------------------------------------------
function JFD_OnShowIconsCheckReforms(isChecked)
	showReformIcons = isChecked
	JFD_RefreshYourGovernment()
end
Controls.ShowIconsCheckReform:RegisterCheckHandler(JFD_OnShowIconsCheckReforms)
-------------------------------------------------
-------------------------------------------------
function JFD_OnShowDetailedReforms(isChecked)
	showDetailedReforms = isChecked
	JFD_RefreshYourGovernment()
end
Controls.ShowDetailCheckReform:RegisterCheckHandler(JFD_OnShowDetailedReforms)
------------------------------------------------------------------------------------------------------------------------
-- JFD_RefreshYourReforms
------------------------------------------------------------------------------------------------------------------------
function JFD_RefreshYourReforms()
	g_YourReformsManager:ResetInstances()
	local yourReforms = {}
		
	local activePlayerID = Game.GetActivePlayer()
	local activePlayer = Players[activePlayerID]
	for reform in GameInfo.JFD_Reforms("IsDisabled = 0 AND HelpBonus IS NOT NULL AND HelpPenalty IS NOT NULL") do
		local player = Players[playerID];
		if activePlayer:HasReform(reform.ID) then
			local isVisible = true
			local reformBranch = GameInfo.JFD_ReformBranches[reform.ReformBranchType]
			local reformBranchDesc = reformBranch.ShortDescription
			local reformBranchHelp = reformBranch.Help
			local reformDesc = reform.ShortDescription
			local reformGroupDesc = reform.HeaderDescription
			local reformEffect = reform.HelpBonus
			if showOnlyPenalty then reformEffect = reform.HelpPenalty end
			if (showNotNone and reformEffect == "TXT_KEY_JFD_REFORM_HELP_NONE") then isVisible = false end
			if isVisible then
				table.insert(yourReforms, {
					PlayerID = playerID,
					ReformID = reform.ID,
					ReformDesc = Locale.Lookup(reformDesc),
					ReformGroupDesc = Locale.Lookup(reformGroupDesc),
					ReformBranchDesc = Locale.Lookup(reformBranchDesc),
					ReformBranchHelp = Locale.Lookup(reformBranchHelp),
					ReformEffect = Locale.Lookup(reformEffect),
				});
			end
		end
	end
	if(#yourReforms > 0) then
		Controls.YourReformsScrollPanel:SetHide(false);
		table.sort(yourReforms, g_YourReformsSortFunction);
		for i,v in ipairs(yourReforms) do
			local reform = GameInfo.JFD_Reforms[v.ReformID]
			local entry = g_YourReformsManager:GetInstance()
			entry.ReformDesc:SetText(v.ReformDesc)
			entry.ReformDesc:LocalizeAndSetToolTip(reform.Pedia)
			entry.ReformGroupDesc:SetText(v.ReformGroupDesc)
			entry.ReformGroupDesc:LocalizeAndSetToolTip(reform.HeaderHelp)
			entry.ReformBranchDesc:SetText(v.ReformBranchDesc)
			entry.ReformBranchDesc:SetToolTipString(v.ReformBranchHelp)
			entry.ReformEffect:SetText(v.ReformEffect)
			entry.ReformEffect:SetToolTipString(v.ReformEffect)
		end
		Controls.YourReformsStack:CalculateSize();
		Controls.YourReformsStack:ReprocessAnchoring();
		Controls.YourReformsScrollPanel:CalculateInternalSize();
	end
end
g_Tabs["YourReforms"].RefreshContent = JFD_RefreshYourReforms;
-------------------------------------------------
-------------------------------------------------
function JFD_OnShowOnlyPenaltyReforms(isChecked)
	showOnlyPenalty = isChecked
	JFD_RefreshYourReforms()
end
Controls.ShowOnlyPenaltyCheckReform:RegisterCheckHandler(JFD_OnShowOnlyPenaltyReforms)
-------------------------------------------------
-------------------------------------------------
function JFD_OnShowNotNoneReforms(isChecked)
	showNotNone = isChecked
	JFD_RefreshYourReforms()
end
Controls.ShowNotNoneCheckReform:RegisterCheckHandler(JFD_OnShowNotNoneReforms)
------------------------------------------------------------------------------------------------------------------------
-- JFD_RefreshWorldGovernments
------------------------------------------------------------------------------------------------------------------------
local politicRevolutionariesTID   = GameInfoTypes["CLERGY_JFD_REVOLUTIONARY"]
local politicRevolutionariesHREID = GameInfoTypes["ELECTOR_JFD_REVOLUTIONARY"]
function JFD_RefreshWorldGovernments()
	g_WorldGovernmentsManager:ResetInstances()
	local worldGovernments = {}
		
	local activePlayer = Players[Game.GetActivePlayer()]
	local activeTeam = Teams[activePlayer:GetTeam()]
		
	for playerID = 0, GameDefines.MAX_CIV_PLAYERS - 1 do	
		local player = Players[playerID];
		if (player:IsAlive() and activeTeam:IsHasMet(player:GetTeam()) and (not(player:IsMinorCiv()))) then
			local civName = player:GetCivilizationDescription()
			local civID = player:GetID()
			local leaderName = player:GetDefaultName()
			local leaderTitle = player:GetLeaderTitle()
			local sovereignty = player:GetSovereignty()
			local governmentID = player:GetGovernment()
			local government = "TXT_KEY_GOVERNMENT_JFD_TRIBE_DESC"
			local governmentTT = "TXT_KEY_GOVERNMENT_JFD_TRIBE_DESC"
			local governmentIndex = 0
			local politicID = nil
			local politic = Locale.ConvertTextKey("TXT_KEY_JFD_FACTION_PANEL_NONE")
			local politicShort = Locale.ConvertTextKey("TXT_KEY_JFD_FACTION_PANEL_NONE")
			local politicAdj = ""
			local politicLeader = ""
			if governmentID > -1 then
				local governmentInfo = GameInfo.JFD_Governments[governmentID]
				government = governmentInfo.Description
				governmentIndex = governmentInfo.PortraitIndex
			end
			if player:HasLegislature() then
				politicID = player:GetDominantPolitic()
				if (governmentID == governmentHolyRomeID and politicID ~= politicRevolutionariesHREID) then
					politic = "[ICON_JFD_ELECTOR]" .. " " .. Locale.ConvertTextKey("TXT_KEY_JFD_ELECTOR_JFD_ELECTOR_SHORT_DESC")
					politicShort = "[ICON_JFD_ELECTOR]" .. " " .. Locale.ConvertTextKey("TXT_KEY_JFD_ELECTOR_JFD_ELECTOR_SHORT_DESC")
					politicAdj = Locale.ConvertTextKey("TXT_KEY_JFD_ELECTOR_JFD_ELECTOR_ADJ")
					politicLeader = Locale.ConvertTextKey(player:GetName())
				elseif (governmentID == governmentTheocracyID and politicID ~= politicRevolutionariesTID and player:HasLegislature()) then
					if player:HasReform(reformTLegislatureAutocephalousID) then
						politic = Locale.ConvertTextKey("[ICON_JFD_CLERGY]") .. " " .. Locale.ConvertTextKey(player:GetPoliticDescription(player:GetStateReligion(), true))
						politicShort = Locale.ConvertTextKey("[ICON_JFD_CLERGY]") .. " " .. Locale.ConvertTextKey("TXT_KEY_JFD_CLERGY_JFD_AUTOCEPHALOUS_SHORT_DESC")
						politicAdj = Locale.ConvertTextKey("TXT_KEY_JFD_CLERGY_JFD_AUTOCEPHALOUS_ADJ")
						politicLeader = Locale.ConvertTextKey(player:GetPoliticLeaderKey())
					elseif player:HasReform(reformTLegislatureEcumenicalID) then
						politic = Locale.ConvertTextKey("[ICON_JFD_CLERGY]") .. " " .. player:GetCivilizationAdjective() .. " " .. Locale.ConvertTextKey(player:GetPoliticDescription(player:GetStateReligion(), true))
						politicShort = Locale.ConvertTextKey("[ICON_JFD_CLERGY]") .. " " .. Locale.ConvertTextKey("TXT_KEY_JFD_CLERGY_JFD_ECUMENICAL_SHORT_DESC")
						politicAdj = Locale.ConvertTextKey("TXT_KEY_JFD_CLERGY_JFD_ECUMENICAL_ADJ")
						politicLeader = Locale.ConvertTextKey(player:GetPoliticLeaderKey())
					end
				else
					if politicID then
						local politicInfo = GameInfo.JFD_Politics[politicID]
						politic = Locale.ConvertTextKey(politicInfo.FontIcon) .. " " .. Locale.ConvertTextKey(player:GetPoliticDescription(politicID))
						politicShort = Locale.ConvertTextKey(politicInfo.FontIcon) .. " " .. Locale.ConvertTextKey(politicInfo.ShortDescription)
						politicAdj = Locale.ConvertTextKey(politicInfo.Adjective)
						politicLeader = Locale.ConvertTextKey(player:GetPoliticLeaderKey())
					end
				end
			end
			local leader = GameInfo.Leaders[player:GetLeaderType()].Type
			local leaderTrait = GameInfo.Leader_Traits( "LeaderType ='" .. leader .. "'" )()
			local traitInfo = GameInfo.Traits[ leaderTrait.TraitType ];
			local traitShortDesc = traitInfo.ShortDescription
			local traitDesc = traitInfo.Description
			local traitTT = Locale.ConvertTextKey(player:GetCivilizationDescription()) .. "[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey(traitInfo.ShortDescription) .. "[ENDCOLOR]" .. "[NEWLINE]" .. Locale.ConvertTextKey(traitDesc)
			table.insert(worldGovernments, {
				PlayerID = playerID,
				Civilization = Locale.Lookup(civName),
				CivilizationID = civID,
				CivilizationTT = Locale.Lookup(traitTT),
				Leader = Locale.Lookup(leaderName),
				LeaderTitle = Locale.Lookup(leaderTitle),
				GovernmentID = governmentID,
				Government = Locale.Lookup(government),
				PortraitIndex = governmentIndex,
				PoliticType = politic,
				PoliticShort = politicShort,
				PoliticAdj = politicAdj,
				PoliticLeader = politicLeader,
				Sovereignty = sovereignty,
			});
		end
	end
	
	if(#worldGovernments > 0) then
		Controls.WorldGovernmentsScrollPanel:SetHide(false);
		table.sort(worldGovernments, g_WorldGovernmentsSortFunction);
		for i,v in ipairs(worldGovernments) do
			local entry = g_WorldGovernmentsManager:GetInstance()
			local player = Players[v.PlayerID]
			entry.Civilization:SetText(v.Civilization)
			entry.Civilization:LocalizeAndSetToolTip(v.CivilizationTT)
			entry.LeaderName:SetText(v.Leader)
			entry.LeaderName:LocalizeAndSetToolTip(v.LeaderTitle)
			entry.PoliticType:SetText(v.PoliticShort)
			if v.PoliticLeader ~= "" then
				if v.GovernmentID == governmentShogunateID then
					entry.PoliticType:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_JFD_IMP_FACTION_JFD_EMPEROR_SHORT_DESC") .. " " .. Locale.ConvertTextKey(player:GetPoliticLeaderKey()))
				else
					entry.PoliticType:LocalizeAndSetToolTip("TXT_KEY_JFD_FACTION_PANEL_TT", v.PoliticType, v.PoliticAdj, v.PoliticLeader)
				end
			else
				entry.PoliticType:LocalizeAndSetToolTip("")
			end
			entry.GovernmentType:SetText(v.Government)
			entry.GovernmentType:LocalizeAndSetToolTip(player:GetReformsListTT())
			entry.Sovereignty:SetText("[COLOR_JFD_SOVEREIGNTY]" .. v.Sovereignty .. "%[ENDCOLOR]")
			IconHookup(v.PortraitIndex, 48, "JFD_SOVEREIGNTY_GOVERNMENT_ALPHA_ATLAS", entry.GovernmentTypeIcon)
			CivIconHookup(v.CivilizationID, 45, entry.CivilizationIcon, entry.CivilizationIconBG, entry.CivilizationIconShadow, true, true )
		end
			
		Controls.WorldGovernmentsStack:CalculateSize();
		Controls.WorldGovernmentsStack:ReprocessAnchoring();
		Controls.WorldGovernmentsScrollPanel:CalculateInternalSize();
	end
end
g_Tabs["WorldGovernments"].RefreshContent = JFD_RefreshWorldGovernments;
-------------------------------------------------
-------------------------------------------------
function JFD_ShowGovernmentOverview()
	m_PopupInfo = popupInfo;
	JFD_RefreshYourGovernment();
	JFD_RefreshYourReforms();
	JFD_RefreshWorldGovernments();
	ContextPtr:SetHide(false)
	local activePlayerID = Game.GetActivePlayer()
	local activePlayer = Players[activePlayerID]
	if activePlayer:GetNumFreeReforms() > 0 then
		LuaEvents.JFD_Tutorial_PushTutorialPopup(activePlayerID, "IsOnFreeReform")
	end
end
LuaEvents.JFD_RTP_Sovereignty_ShowGovernmentOverview.Add(JFD_ShowGovernmentOverview)

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnClose()
	ContextPtr:SetHide(true)
end
Controls.CloseButton:RegisterCallback( Mouse.eLClick, OnClose );

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function InputHandler(uiMsg, wParam, lParam)
  if (uiMsg == KeyEvents.KeyDown) then
    if (wParam == Keys.VK_ESCAPE) then
		if (not Controls.ReformConfirm:IsHidden()) then
			JFD_OnNo()
		else
			OnClose()
		end
      return true
    end
  end
end
ContextPtr:SetInputHandler(InputHandler)
--------------------------------------------------------------------
function ShowHideHandler(bIsHide, bInitState)
	if (not bInitState and not bIsHide) then
		JFD_RefreshYourGovernment()
	end
end
ContextPtr:SetShowHideHandler(ShowHideHandler)
ContextPtr:SetHide(true)
-------------------------------------------------------------------------------
-- Sorting Support
-------------------------------------------------------------------------------
function AlphabeticalSortFunction(field, direction)
	if(direction == "asc") then
		return function(a,b)
			return Locale.Compare(a[field], b[field]) == -1;
		end
	elseif(direction == "desc") then
		return function(a,b)
			return Locale.Compare(a[field], b[field]) == 1;
		end
	end
end

function NumericSortFunction(field, direction)
	if(direction == "asc") then
		return function(a,b)
			return a[field] <= b[field];
		end
	elseif(direction == "desc") then
		return function(a,b)
			return a[field] > b[field];
		end
	end
end

-- Registers the sort option controls click events
function RegisterSortOptions()
	
	for i,v in ipairs(g_PoliticalFactionsSortOptions) do
		if(v.Button ~= nil) then
			v.Button:RegisterCallback(Mouse.eLClick, function() PoliticalFactionsSortOptionSelected(v); end);
		end
	end
	for i,v in ipairs(g_YourReformsSortOptions) do
		if(v.Button ~= nil) then
			v.Button:RegisterCallback(Mouse.eLClick, function() YourReformsSortOptionSelected(v); end);
		end
	end
	for i,v in ipairs(g_WorldGovernmentsSortOptions) do
		if(v.Button ~= nil) then
			v.Button:RegisterCallback(Mouse.eLClick, function() WorldGovernmentsSortOptionSelected(v); end);
		end
	end
	
	UpdateSortOptionsDisplay(g_PoliticalFactionsSortOptions);
	UpdateSortOptionsDisplay(g_YourReformsSortOptions);
	UpdateSortOptionsDisplay(g_WorldGovernmentsSortOptions);
	
	g_PoliticalFactionsSortFunction = GetSortFunction(g_PoliticalFactionsSortOptions);
	g_YourReformsSortFunction = GetSortFunction(g_YourReformsSortOptions);
	g_WorldGovernmentsSortFunction  = GetSortFunction(g_WorldGovernmentsSortOptions);
end

function GetSortFunction(sortOptions)
	local orderBy = nil;
	for i,v in ipairs(sortOptions) do
		if(v.CurrentDirection ~= nil) then
			if(v.SortType == "Numeric") then
				return NumericSortFunction(v.Column, v.CurrentDirection);
			else
				return AlphabeticalSortFunction(v.Column, v.CurrentDirection);
			end
		end
	end
	
	return nil;
end

-- Updates the sort option structure
function UpdateSortOptionState(sortOptions, selectedOption)
	-- Current behavior is to only have 1 sort option enabled at a time 
	-- though the rest of the structure is built to support multiple in the future.
	-- If a sort option was selected that wasn't already selected, use the default 
	-- direction.  Otherwise, toggle to the other direction.
	for i,v in ipairs(sortOptions) do
		if(v == selectedOption) then
			if(v.CurrentDirection == nil) then			
				v.CurrentDirection = v.DefaultDirection;
			else
				if(v.CurrentDirection == "asc") then
					v.CurrentDirection = "desc";
				else
					v.CurrentDirection = "asc";
				end
			end
		else
			v.CurrentDirection = nil;
		end
	end
end

-- Updates the control states of sort options
function UpdateSortOptionsDisplay(sortOptions)
	for i,v in ipairs(sortOptions) do
		local imageControl = v.ImageControl;
		if(imageControl ~= nil) then
			if(v.CurrentDirection == nil) then
				imageControl:SetHide(true);
			else
				local imageToUse = "SelectedUp.dds";
				if(v.CurrentDirection == "desc") then
					imageToUse = "SelectedDown.dds";
				end
				imageControl:SetTexture(imageToUse);
				
				imageControl:SetHide(false);
			end
		end
	end
end

-- Callback for when sort options are selected.
function PoliticalFactionsSortOptionSelected(option)
	local sortOptions = g_PoliticalFactionsSortOptions;
	UpdateSortOptionState(sortOptions, option);
	UpdateSortOptionsDisplay(sortOptions);
	g_PoliticalFactionsSortFunction = GetSortFunction(sortOptions);
	
	JFD_RefreshYourGovernment();
end

function YourReformsSortOptionSelected(option)
	local sortOptions = g_YourReformsSortOptions;
	UpdateSortOptionState(sortOptions, option);
	UpdateSortOptionsDisplay(sortOptions);
	g_YourReformsSortFunction = GetSortFunction(sortOptions);
	
	JFD_RefreshYourReforms();
end

function WorldGovernmentsSortOptionSelected(option)
	local sortOptions = g_WorldGovernmentsSortOptions;
	UpdateSortOptionState(sortOptions, option);
	UpdateSortOptionsDisplay(sortOptions);
	g_WorldGovernmentsSortFunction = GetSortFunction(sortOptions);
	
	JFD_RefreshWorldGovernments();
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function ShowHideHandler( bIsHide, bInitState )
    if( not bInitState ) then
        if( not bIsHide ) then
        	UI.incTurnTimerSemaphore();
        	Events.SerialEventGameMessagePopupShown(m_PopupInfo);
        else
            UI.decTurnTimerSemaphore();
            Events.SerialEventGameMessagePopupProcessed.CallImmediate(ButtonPopupTypes.BUTTONPOPUP_CHOOSEPOLICY, 0);
        end
    end
end
ContextPtr:SetShowHideHandler( ShowHideHandler );

-----------------------------------------------------------------
-- Add Religion Overview to Dropdown (if enabled)
-----------------------------------------------------------------
if userSettingRTPSovereigntyCore then
	LuaEvents.AdditionalInformationDropdownGatherEntries.Add(function(entries)
		table.insert(entries, {
			text=Locale.Lookup("TXT_KEY_JFD_GOVERNMENT_OVERVIEW_SCREEN_TITLE"),
			art = "DC45_Culture.dds",
			call=function() 
				JFD_ShowGovernmentOverview()
			end,
		});
	end);
	
	-- Just in case :)
	LuaEvents.RequestRefreshAdditionalInformationDropdownEntries();
end
----------------------------------------------------------------
-- 'Active' (local human) player has changed
----------------------------------------------------------------
function OnActivePlayerChanged()
	if (not Controls.GovtNameConfirm:IsHidden() or not Controls.ReformConfirm:IsHidden()) then
		Controls.GovtNameConfirm:SetHide(true);
		Controls.ReformConfirm:SetHide(true);
    	Controls.BGBlock:SetHide(false);
	end
	OnClose();
end
Events.GameplaySetActivePlayer.Add(OnActivePlayerChanged);

--JFD_ShowGovernmentOverview();
RegisterSortOptions();

-- Register tabbing behavior and assign global TabSelect routine.
TabSelect = RegisterTabBehavior(g_Tabs, g_Tabs["YourGovernment"]);

--Controls.ToIdeologyTab:RegisterCallback(Mouse.eLClick, function() TabSelect(g_Tabs["Ideologies"]) end);