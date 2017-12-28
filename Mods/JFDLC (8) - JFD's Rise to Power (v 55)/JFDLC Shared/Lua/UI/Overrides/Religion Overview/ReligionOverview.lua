-------------------------------------------------
-- Religion Overview Popup
-------------------------------------------------
include( "IconSupport" );
include( "InstanceManager" );
-------------------------------------------------
-- JFDLC
-------------------------------------------------
include("JFDLCUtils.lua");
include("JFD_RTP_PietyUtils.lua");

local gameSpeedMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100)

local userSettingCIDCrimesCore = (Game.GetUserSetting("JFD_CID_CRIMES_CORE") == 1)
local userSettingRTPPietyCore  = (Game.GetUserSetting("JFD_RTP_PIETY_CORE") == 1)
----------------------------------------------------------------
-- Pedia Callback: Adapted from EUI
----------------------------------------------------------------
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
-------------------------------------------------
-- Global Constants
-------------------------------------------------
g_Tabs = {
	["YourReligion"] = {
		Panel = Controls.YourReligionPanel,
		SelectHighlight = Controls.YourReligionSelectHighlight,
	},
	
	["StateReligions"] = {
		Panel = Controls.StateReligionsPanel,
		SelectHighlight = Controls.StateReligionsSelectHighlight,
	},
	
	["WorldReligion"] = {
		Panel = Controls.WorldReligionPanel,
		SelectHighlight = Controls.WorldReligionsSelectHighlight,
	},
	
	["Beliefs"] = {
		Panel = Controls.BeliefsPanel,
		SelectHighlight = Controls.BeliefsSelectHighlight,
	},
	
	["Map"] = {
		Panel = Controls.MapPanel,
		SelectHighlight = Controls.MapSelectHighlight,
	},
}

g_BeliefSortOptions = {
	{
		Button = Controls.BPSortbyName,
		ImageControl = Controls.BPSortbyNameImage,
		Column = "Name",
		DefaultDirection = "asc",
		CurrentDirection = "asc",
	},
	{
		Button = Controls.BPSortbyType,
		ImageControl = Controls.BPSortbyTypeImage,
		Column = "Type",
		DefaultDirection = "desc",
		CurrentDirection = nil,
	},
	{
		Button = Controls.BPSortbyBonus,
		ImageControl = Controls.BPSortbyBonusImage,
		Column = "Description",
		DefaultDirection = "desc",
		CurrentDirection = nil,
	},
	{
		Button = Controls.BPSortbyReligion,
		ImageControl = Controls.BPSortbyReligionImage,
		Column = "Religion",
		DefaultDirection = "desc",
		CurrentDirection = nil,
	},
};

g_WorldReligionSortOptions = {
	{
		Button = Controls.WRSortByReligion,
		ImageControl = Controls.WRSortByReligionImage,
		Column = "Name",
		DefaultDirection = "asc",
		CurrentDirection = "asc",
	},
	{
		Button = Controls.WRSortByFoundDate,
		ImageControl = Controls.WRSortByFoundDateImage,
		Column = "FoundDate",
		DefaultDirection = "desc",
		CurrentDirection = nil,
	},
	{
		Button = Controls.WRSortByHolyCity,
		ImageControl = Controls.WRSortByHolyCityImage,
		Column = "HolyCity",
		DefaultDirection = "desc",
		CurrentDirection = nil,
	},
	{
		Button = Controls.WRSortByFounder,
		ImageControl = Controls.WRSortByFounderImage,
		Column = "Founder",
		DefaultDirection = "desc",
		CurrentDirection = nil,
	},
	{
		Button = Controls.WRSortByNumCities,
		ImageControl = Controls.WRSortByNumCitiesImage,
		Column = "NumCities",
		DefaultDirection = "desc",
		SortType = "numeric",
		CurrentDirection = nil,
	},
	{
		Button = Controls.WRSortByNumFollowers,
		ImageControl = Controls.WRSortByNumFollowersImage,
		Column = "NumFollowers",
		SortType = "numeric",
		DefaultDirection = "desc",
		CurrentDirection = nil,
	},
};

g_StateReligionsSortOptions = {
	{
		Button = Controls.SRSortByCivilization,
		ImageControl = Controls.SRSortByCivilizationImage,
		Column = "Civilization",
		DefaultDirection = "asc",
		CurrentDirection = "desc",
	},
	{
		Button = Controls.SRSortByReligion,
		ImageControl = Controls.SRSortByReligionImage,
		Column = "Name",
		DefaultDirection = "desc",
		CurrentDirection = nil,
	},
	{
		Button = Controls.SRSortByFounder,
		ImageControl = Controls.SRSortByFounderImage,
		Column = "Founder",
		DefaultDirection = "asc",
		CurrentDirection = nil,
	},
	{
		Button = Controls.SRSortByPiety,
		ImageControl = Controls.SRSortByPietyImage,
		Column = "NumPiety",
		DefaultDirection = "desc",
		SortType = "numeric",
		CurrentDirection = nil,
	},
	{
		Button = Controls.SRSortByFaith,
		ImageControl = Controls.SRSortByFaithImage,
		Column = "NumFaith",
		DefaultDirection = "desc",
		SortType = "numeric",
		CurrentDirection = nil,
	},
};

g_BeliefSortFunction = nil;
g_WorldReligionSortFunction = nil;
g_StateReligionsSortFunction = nil

g_ReligionBeliefsToolTipTypeTipControls= {}
g_StateReligionBeliefsToolTipTypeTipControls= {}
TTManager:GetTypeControlTable("ReligionBeliefsToolTipType", g_ReligionBeliefsToolTipTypeTipControls)
TTManager:GetTypeControlTable("StateReligionReligionBeliefsToolTipType", g_StateReligionBeliefsToolTipTypeTipControls)

local g_ReligiousBeliefsManager = InstanceManager:new("YourReligiousBeliefInstance", "Base", Controls.YourReligiousBeliefsStack);
local g_FaithModifierManager = InstanceManager:new("FaithModifierInstance", "FaithModifier", Controls.FaithModifierStack);
local g_WorldReligionsManager = InstanceManager:new( "WorldReligionInstance", "Base", Controls.WorldReligionsStack);
local g_BeliefsManager = InstanceManager:new( "BeliefInstance", "Base", Controls.BeliefsStack);
local g_StateReligionsManager = InstanceManager:new( "StateReligionsInstance", "Base", Controls.StateReligionsStack);
local g_StateReligionChoiceManager = InstanceManager:new("StateReligionChoiceInstance", "StateReligionChoiceButton", Controls.StateReligionChoiceStack)

local Colours = {
  UNKNOWN   = {r=190, g=190, b=190, a=1.0},
  NONE      = {r=0,   g=0,   b=0,   a=0.0},
  WATER     = {r=0,   g=0,   b=0,   a=0.0},
  ICE       = {r=189, g=242, b=255, a=0.7},
  CITY      = {r=0,   g=0,   b=0,   a=1.0},
  HOLY_CITY = {r=255, g=255, b=0,   a=1.0}
}
local iFeatureIce = GameInfoTypes.FEATURE_ICE
local iTerrainDesert = GameInfoTypes.TERRAIN_DESERT

local mapWidth, mapHeight = Map.GetGridSize()
Controls.ReligionMap:SetMapSize(mapWidth, mapHeight, 0, -1)
-------------------------------------------------
-- Global Variables
-------------------------------------------------
g_CurrentTab = nil;		-- The currently selected Tab.

-------------------------------------------------
-------------------------------------------------

function GetReligiousStatus()

	local text = nil;
	local player = Players[Game.GetActivePlayer()];
	if(player:HasCreatedReligion()) then
		local eReligion = player:GetReligionCreatedByPlayer();
		text = Locale.Lookup("TXT_KEY_RO_STATUS_FOUNDER", GameInfo.Religions[eReligion].IconString, Game.GetReligionName(eReligion));
	elseif player:HasStateReligion() then
		local eReligion = player:GetStateReligion();
		text = Locale.Lookup("TXT_KEY_RO_STATUS_ADOPTER", GameInfo.Religions[eReligion].IconString, Game.GetReligionName(eReligion));	
	elseif(player:HasCreatedPantheon()) then
		text = Locale.Lookup("TXT_KEY_RO_STATUS_CREATED_PANTHEON");
	elseif(player:CanCreatePantheon(true)) then
		text = Locale.Lookup("TXT_KEY_RO_STATUS_CAN_CREATE_PANTHEON");
	elseif(player:CanCreatePantheon(false)) then
		local minRequiredFaith = Game.GetMinimumFaithNextPantheon();
		local currentFaith = player:GetFaith();
		local faithNeeded = minRequiredFaith - currentFaith;
		text = Locale.Lookup("TXT_KEY_RO_STATUS_NEED_FAITH" , faithNeeded);
	else
		text = Locale.Lookup("TXT_KEY_RO_STATUS_TOO_LATE");
	end
	
	return text;
end

function GetStateReligionStatus()
	local isHidden = false
	local text = nil;
	local player = Players[Game.GetActivePlayer()];
	if player:IsPagan() then
		text = Locale.ConvertTextKey("TXT_KEY_RO_YOUR_STATE_RELIGION_STATUS_CHANGE", Locale.ToUpper(Game.GetReligionName(0)))
	elseif player:HasStateReligion() then
		local stateReligionID = player:GetStateReligion()
		text = Locale.ConvertTextKey("TXT_KEY_RO_YOUR_STATE_RELIGION_STATUS_CHANGE", Locale.ToUpper(Game.GetReligionName(stateReligionID)))
		if player:IsAnarchy() then
			text = "[COLOR_NEGATIVE_TEXT]" .. text .. "[ENDCOLOR]"
		end
	end
	return text
end

function GetBeliefType(belief)
	if(belief.Pantheon) then
		return Locale.Lookup("TXT_KEY_RO_BELIEF_TYPE_PANTHEON");
	elseif(belief.Founder) then
		return Locale.Lookup("TXT_KEY_RO_BELIEF_TYPE_FOUNDER");
	elseif(belief.Follower or belief.Bonus) then
		return Locale.Lookup("TXT_KEY_RO_BELIEF_TYPE_FOLLOWER");
	elseif(belief.Enhancer) then
		return Locale.Lookup("TXT_KEY_RO_BELIEF_TYPE_ENHANCER");
	elseif(belief.Reformation) then
	    return Locale.Lookup("TXT_KEY_RO_BELIEF_TYPE_REFORMATION");
	end
end
	
-------------------------------------------------
-------------------------------------------------
function OnPopupMessage(popupInfo)
	
	local popupType = popupInfo.Type;
	if popupType ~= ButtonPopupTypes.BUTTONPOPUP_RELIGION_OVERVIEW then
		return;
	end
	
	if(not Game.IsOption(GameOptionTypes.GAMEOPTION_NO_RELIGION)) then
		g_PopupInfo = popupInfo;
	
		if( g_PopupInfo.Data1 == 1 ) then
    		if( ContextPtr:IsHidden() == false ) then
    			OnClose();
			else
        		UIManager:QueuePopup( ContextPtr, PopupPriority.InGameUtmost );
    		end
		else
			UIManager:QueuePopup( ContextPtr, PopupPriority.SocialPolicy );
		end   	
   	end
end
Events.SerialEventGameMessagePopup.Add( OnPopupMessage );

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function IgnoreLeftClick( Id )
	-- just swallow it
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function InputHandler( uiMsg, wParam, lParam )
    ----------------------------------------------------------------        
    -- Key Down Processing
    ----------------------------------------------------------------        
    if(uiMsg == KeyEvents.KeyDown) then
        if (wParam == Keys.VK_ESCAPE) then
			OnClose();
			return true;
        end
        
        -- Do Nothing.
        if(wParam == Keys.VK_RETURN) then
			return true;
        end
    end
end
ContextPtr:SetInputHandler( InputHandler );
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnClose()
	UIManager:DequeuePopup(ContextPtr);
end
Controls.CloseButton:RegisterCallback(Mouse.eLClick, OnClose);
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function TabSelect(tab)

	for i,v in pairs(g_Tabs) do
		local bHide = i ~= tab;
		v.Panel:SetHide(bHide);
		v.SelectHighlight:SetHide(bHide);
	end
	if (not tab) then return end
	g_CurrentTab = tab;
	g_Tabs[tab].RefreshContent();	
end
Controls.TabButtonStateReligions:SetHide(not userSettingRTPPietyCore)
Controls.TabButtonYourReligion:RegisterCallback( Mouse.eLClick, function() TabSelect("YourReligion"); end);
Controls.TabButtonStateReligions:RegisterCallback( Mouse.eLClick, function() TabSelect("StateReligions"); end );
Controls.TabButtonWorldReligions:RegisterCallback( Mouse.eLClick, function() TabSelect("WorldReligion"); end );
Controls.TabButtonBeliefs:RegisterCallback( Mouse.eLClick, function() TabSelect("Beliefs"); end );
Controls.TabButtonMap:RegisterCallback( Mouse.eLClick, function() TabSelect("Map"); end );

local defaultMaxPietyRate = 200
local gameSpeedID 			= Game.GetGameSpeedType()
local gameSpeedType			= GameInfo.GameSpeeds[gameSpeedID].Type 
local governmentTheocracyID = GameInfoTypes["GOVERNMENT_JFD_THEOCRACY"]
for row in GameInfo.GameSpeed_JFD_PietyThresholds("GameSpeedType = '" .. gameSpeedType .. "'") do
	defaultMaxPietyRate = row.MaxThreshold
	break
end
local pietyLevelDevoutID	= GameInfoTypes["PIETY_LEVEL_JFD_DEVOUT"]
local pietyLevelNeutralID   = GameInfoTypes["PIETY_LEVEL_JFD_NEUTRAL"]
local pietyLevelVirtuousID  = GameInfoTypes["PIETY_LEVEL_JFD_VIRTUOUS"]
function RefreshYourReligion()
	local playerID = Game.GetActivePlayer()
	local player = Players[playerID]
	local capital = player:GetCapitalCity()
	CivIconHookup(playerID, 80, Controls.FounderIcon, Controls.FounderIconBG, Controls.FounderIconShadow, true, true )
	--Religion Status
	Controls.ReligiousStatus:SetText(GetReligiousStatus())
	--Faith Display
	local minFaithForProphet = tostring(player:GetMinimumFaithNextGreatProphet())
	Controls.CurrentFaith:LocalizeAndSetText("TXT_KEY_RO_FAITH", player:GetFaith(), minFaithForProphet)
	Controls.CurrentFaith:LocalizeAndSetToolTip("TXT_KEY_RO_FAITH_TOOLTIP", minFaithForProphet)
	
	--State Religion Status
	Controls.StateReligionInfoStack:SetHide(not userSettingRTPPietyCore)
	Controls.StateReligionStatus:SetDisabled(true)
	if (player:CanHaveAnyStateReligion() and (not player:IsAnarchy())) then
		Controls.StateReligionStatus:SetDisabled(false)
	end
	if player:HasSecularized() then
		Controls.FounderReligionIcon:SetHide(true)
		Controls.CurrentPiety:SetHide(true)
		Controls.StateReligionStatus:LocalizeAndSetText("TXT_KEY_RO_YOUR_STATE_RELIGION_STATUS_SECULAR")	
		Controls.StateReligionStatus:LocalizeAndSetToolTip("TXT_KEY_RO_YOUR_STATE_RELIGION_STATUS_SECULAR")	
	elseif player:HasStateReligion() then
		local stateReligionID = player:GetStateReligion()
		local religion = GameInfo.Religions[stateReligionID]
		Controls.FounderReligionIcon:SetHide(false) 
		IconHookup(religion.PortraitIndex, 64, religion.IconAtlas, Controls.FounderReligionIcon)
		--Piety Display
		local pietyLevelID = player:GetPietyLevel()
		local pietyLevel = GameInfo.JFD_PietyLevels[pietyLevelID]
		local currentPiety = pietyLevel.TextColor .. player:GetPiety() .. "[ENDCOLOR]"
		local pietyRate, pietyRateTT = player:GetPietyPerTurn(true)
		Controls.CurrentPiety:LocalizeAndSetText("TXT_KEY_RO_JFD_PIETY", currentPiety, defaultMaxPietyRate)
		Controls.CurrentPiety:LocalizeAndSetToolTip("TXT_KEY_RO_JFD_PIETY_TT", pietyLevel.TextColor, pietyLevel.ShortDescription, player:GetPietyRate(), pietyRateTT)
		local stateReligionStatusTT = Locale.ConvertTextKey("TXT_KEY_RO_YOUR_STATE_RELIGION_STATUS_CHANGE_TT")
		if Game.IsEnlightenmentEraActive() then stateReligionStatusTT = Locale.ConvertTextKey("TXT_KEY_RO_YOUR_STATE_RELIGION_STATUS_CHANGE_TT_EE") end
		if pietyLevel.ChangeHelp then
			local numFaithCost = math.ceil((pietyLevel.ChangeFaithCost*gameSpeedMod)*player:GetNumCitiesWithStateReligion(stateReligionID))
			stateReligionStatusTT = stateReligionStatusTT .. Locale.ConvertTextKey(pietyLevel.ChangeHelp, pietyLevel.ChangeResistanceTurns, numFaithCost)
			if player:GetGovernment() == governmentTheocracyID then
				stateReligionStatusTT = stateReligionStatusTT .. Locale.ConvertTextKey("TXT_KEY_RO_YOUR_STATE_RELIGION_STATUS_CHANGE_TT_DISABLED_THEOCRACY")
				Controls.StateReligionStatus:SetDisabled(true)
			elseif (numFaithCost > 0 and player:GetFaith() < numFaithCost) then
				stateReligionStatusTT = stateReligionStatusTT .. Locale.ConvertTextKey("TXT_KEY_RO_YOUR_STATE_RELIGION_STATUS_CHANGE_TT_DISABLED_FAITH")
				Controls.StateReligionStatus:SetDisabled(true)
			end
		end
		Controls.StateReligionStatus:LocalizeAndSetToolTip(stateReligionStatusTT)
		if player:IsAnarchy() then
			Controls.StateReligionStatus:LocalizeAndSetToolTip("TXT_KEY_TP_ANARCHY", player:GetAnarchyNumTurns())
		end
		Controls.StateReligionStatus:SetText(GetStateReligionStatus())
	elseif player:IsPagan() then
		local pantheon = GameInfo.Religions["RELIGION_PANTHEON"]
		IconHookup(pantheon.PortraitIndex, 64, pantheon.IconAtlas, Controls.FounderReligionIcon)
		Controls.FounderReligionIcon:SetHide(false)
		Controls.StateReligionStatus:LocalizeAndSetText("TXT_KEY_RO_YOUR_STATE_RELIGION_STATUS_PAGAN")	
		Controls.StateReligionStatus:LocalizeAndSetToolTip("TXT_KEY_RO_YOUR_STATE_RELIGION_STATUS_PAGAN_TT")	
		Controls.StateReligionStatus:SetText(GetStateReligionStatus())
	else
		Controls.FounderReligionIcon:SetHide(true)
		Controls.StateReligionStatus:LocalizeAndSetToolTip("")
	end	
	
	
	

	
	-- Update faith modifiers
	-- g_FaithModifierManager:ResetInstances();
	-- Faith from Cities
	-- local iFaithFromCities = player:GetFaithPerTurnFromCities();
	-- if (iFaithFromCities ~= 0) then
		-- local entry = g_FaithModifierManager:GetInstance();
		-- entry.FaithModifier:LocalizeAndSetText("TXT_KEY_TP_FAITH_FROM_CITIES", iFaithFromCities);
	-- end

	-- Faith from Minor Civs
	-- local iFaithFromMinorCivs = player:GetFaithPerTurnFromMinorCivs();
	-- if (iFaithFromMinorCivs ~= 0) then
		-- local entry = g_FaithModifierManager:GetInstance();
		-- entry.FaithModifier:LocalizeAndSetText("TXT_KEY_TP_FAITH_FROM_MINORS", iFaithFromMinorCivs);
	-- end
	
	-- Faith from Religion
	-- local iFaithFromReligion = player:GetFaithPerTurnFromReligion();
	-- if (iFaithFromReligion ~= 0) then
		-- local entry = g_FaithModifierManager:GetInstance();
		-- entry.FaithModifier:LocalizeAndSetText("TXT_KEY_TP_FAITH_FROM_RELIGION", iFaithFromReligion);
	-- end
	
	-- Unlocked Great People
	local unlockedGreatPeople = {}
		
	local capital = player:GetCapitalCity();
	if(capital ~= nil) then	
		for info in GameInfo.Units{Special = "SPECIALUNIT_PEOPLE"} do
			local infoID = info.ID;
			local faithCost = capital:GetUnitFaithPurchaseCost(infoID, true);
			if(faithCost > 0 and player:IsCanPurchaseAnyCity(false, true, infoID, -1, YieldTypes.YIELD_FAITH)) then
				if (player:DoesUnitPassFaithPurchaseCheck(infoID)) then
					table.insert(unlockedGreatPeople, Locale.Lookup(info.Description));
				end
			end
		end
	end
		
	table.sort(unlockedGreatPeople, function(a,b) return Locale.Compare(a,b) == -1 end);
	
	for i = 1,9,1 do
		local c = Controls["GreatPersonName" .. i];
		c:SetHide(true);
	end
	
	for i,v in ipairs(unlockedGreatPeople) do
		local c = Controls["GreatPersonName" .. i];
		if(c ~= nil) then
			c:SetText("[ICON_BULLET] " .. v);
			c:SetHide(false);
		end
	end
	
	if(#unlockedGreatPeople == 0) then
		local c = Controls["GreatPersonName" .. 1];
		c:LocalizeAndSetText("TXT_KEY_RO_YR_NO_GREAT_PEOPLE");
		c:SetHide(false);
	end

	Controls.GreatPersonList:CalculateSize();
	
	--Refresh Beliefs
	g_ReligiousBeliefsManager:ResetInstances();
	Controls.YourReligionNoBeliefs:SetHide(true);
	Controls.YourReligiousBeliefsStack:SetHide(false);
	if (player:HasCreatedReligion()) then
		local eCreatedReligion = player:GetReligionCreatedByPlayer() 
		local eReligion = eCreatedReligion
		if (player:HasSecularized()) then
			local entry = g_ReligiousBeliefsManager:GetInstance();
			entry.BeliefType:LocalizeAndSetText("TXT_KEY_JFD_BELIEF_SECULAR");
			entry.BeliefName:LocalizeAndSetText("");
			if userSettingCIDCrimesCore then
				entry.BeliefDescription:LocalizeAndSetText("TXT_KEY_JFD_BELIEF_SECULAR_DESC_CRIMES");
			else
				entry.BeliefDescription:LocalizeAndSetText("TXT_KEY_JFD_BELIEF_SECULAR_DESC");
			end
			local bw,bh = entry.Base:GetSizeVal();
			local bdw,bdh = entry.BeliefDescription:GetSizeVal();
			entry.Base:SetSizeVal(bw, bdh + 18);
		elseif (player:HasStateReligion()) then 
			eReligion = player:GetStateReligion();
			local entry = g_ReligiousBeliefsManager:GetInstance();
			local pietyLevelID = player:GetPietyLevel()
			local pietyLevel = GameInfo.JFD_PietyLevels[pietyLevelID]
			local pietyLevelHelp = pietyLevel.Help
			entry.BeliefType:LocalizeAndSetText("TXT_KEY_JFD_BELIEF_STATE_RELIGION");
			entry.BeliefName:LocalizeAndSetText(pietyLevel.TextColor .. Locale.ConvertTextKey(pietyLevel.Description) .. "[ENDCOLOR]");
			for row in GameInfo.Policies("ConvertsAllStateReligion > 0") do
				if player:HasPolicy(row.ID) then
					pietyLevelHelp = pietyLevelHelp .. "_SYNCRETISM"
					break
				end
			end
			if (player:HasGovernment() and player:GetGovernment() == governmentTheocracyID) then
				--if pietyLevelID == pietyLevelDevoutID then
				--	pietyLevelHelp = Locale.ConvertTextKey("TXT_KEY_PIETY_LEVEL_JFD_THEOCRACY", 15) .. Locale.ConvertTextKey(pietyLevelHelp, player:GetStateReligionReligiousPressure())
				--elseif pietyLevelID == pietyLevelVirtuousID then
				--	pietyLevelHelp = Locale.ConvertTextKey("TXT_KEY_PIETY_LEVEL_JFD_THEOCRACY", 5)  .. Locale.ConvertTextKey(pietyLevelHelp, player:GetStateReligionReligiousPressure())
				--else
					pietyLevelHelp = Locale.ConvertTextKey(pietyLevelHelp, player:GetStateReligionReligiousPressure())
				--end
			else
				pietyLevelHelp = Locale.ConvertTextKey(pietyLevelHelp, player:GetStateReligionReligiousPressure())
			end
			entry.BeliefDescription:LocalizeAndSetText(pietyLevelHelp);
			local bw,bh = entry.Base:GetSizeVal();
			local bdw,bdh = entry.BeliefDescription:GetSizeVal();
			entry.Base:SetSizeVal(bw, bdh + 18);
		end
		for i,v in ipairs(Game.GetBeliefsInReligion(eReligion)) do
			local belief = GameInfo.Beliefs[v];
			if (belief ~= nil) then
				local showBelief = true
				if eReligion ~= eCreatedReligion then
					if ((not belief.Follower) and (not belief.Pantheon)) then
						showBelief = false
					end
				end
				if showBelief then
					local entry = g_ReligiousBeliefsManager:GetInstance();
					local beliefType = GetBeliefType(belief);
					entry.BeliefType:SetText(beliefType);
					entry.BeliefName:LocalizeAndSetText(belief.ShortDescription);
					if belief.Founder then
						entry.BeliefDescription:SetText("[ICON_BULLET]" .. Locale.ConvertTextKey(belief.Description) .. ".");
					else
						entry.BeliefDescription:SetText("[ICON_BULLET]" .. Locale.ConvertTextKey(belief.Description) .. ".");
					end
					local bw,bh = entry.Base:GetSizeVal();
					local bdw,bdh = entry.BeliefDescription:GetSizeVal();
					entry.Base:SetSizeVal(bw, bdh + 18);
				end
			end
		end
	elseif (player:HasStateReligion()) then
		local eReligion = player:GetStateReligion();
		local entry = g_ReligiousBeliefsManager:GetInstance();
		local pietyLevelID = player:GetPietyLevel()
		local pietyLevel = GameInfo.JFD_PietyLevels[pietyLevelID]
		local pietyLevelHelp = pietyLevel.Help
		entry.BeliefType:LocalizeAndSetText("TXT_KEY_JFD_BELIEF_STATE_RELIGION");
		entry.BeliefName:LocalizeAndSetText(pietyLevel.TextColor .. Locale.ConvertTextKey(pietyLevel.Description) .. "[ENDCOLOR]");
		for row in GameInfo.Policies("ConvertsAllStateReligion > 0") do
			if player:HasPolicy(row.ID) then
				pietyLevelHelp = pietyLevelHelp .. "_SYNCRETISM"
				break
			end
		end
		if (player:HasGovernment() and player:GetGovernment() == governmentTheocracyID) then
			if pietyLevelID == pietyLevelDevoutID then
				pietyLevelHelp = Locale.ConvertTextKey("TXT_KEY_PIETY_LEVEL_JFD_THEOCRACY", 15) .. Locale.ConvertTextKey(pietyLevelHelp, player:GetStateReligionReligiousPressure())
			elseif pietyLevelID == pietyLevelVirtuousID then
				pietyLevelHelp = Locale.ConvertTextKey("TXT_KEY_PIETY_LEVEL_JFD_THEOCRACY", 5)  .. Locale.ConvertTextKey(pietyLevelHelp, player:GetStateReligionReligiousPressure())
			else
				pietyLevelHelp = Locale.ConvertTextKey(pietyLevelHelp, player:GetStateReligionReligiousPressure())
			end
		else
			pietyLevelHelp = Locale.ConvertTextKey(pietyLevelHelp, player:GetStateReligionReligiousPressure())
		end
		entry.BeliefDescription:LocalizeAndSetText(pietyLevelHelp);
		local bw,bh = entry.Base:GetSizeVal();
		local bdw,bdh = entry.BeliefDescription:GetSizeVal();
		entry.Base:SetSizeVal(bw, bdh + 18);
		for i,v in ipairs(Game.GetBeliefsInReligion(eReligion)) do
			local belief = GameInfo.Beliefs[v];
			if (belief ~= nil and belief.Follower) then
				local entry = g_ReligiousBeliefsManager:GetInstance();
				local beliefType = GetBeliefType(belief);
				entry.BeliefType:SetText(beliefType);
				entry.BeliefName:LocalizeAndSetText(belief.ShortDescription);
				entry.BeliefDescription:SetText("[ICON_BULLET]" .. Locale.ConvertTextKey(belief.Description) .. ".");
				if(belief.Tooltip ~= "") then
					entry.BeliefDescription:LocalizeAndSetToolTip(belief.Tooltip);
				end
				
				local bw,bh = entry.Base:GetSizeVal();
				local bdw,bdh = entry.BeliefDescription:GetSizeVal();
				entry.Base:SetSizeVal(bw, bdh + 18);
			end
		end
	elseif (player:HasCreatedPantheon()) then
		
		local iBelief = player:GetBeliefInPantheon();
		
		local belief = GameInfo.Beliefs[iBelief];
		if(belief ~= nil) then
			local entry = g_ReligiousBeliefsManager:GetInstance();
			local beliefType = GetBeliefType(belief);
			entry.BeliefType:SetText(beliefType);
			entry.BeliefName:LocalizeAndSetText(belief.ShortDescription);
			entry.BeliefDescription:SetText("[ICON_BULLET]" .. Locale.ConvertTextKey(belief.Description) .. ".");
			if(belief.Tooltip ~= "") then
				entry.BeliefDescription:LocalizeAndSetToolTip(belief.Tooltip);
			end
			
			local bw,bh = entry.Base:GetSizeVal();
			local bdw,bdh = entry.BeliefDescription:GetSizeVal();
			entry.Base:SetSizeVal(bw, bdh + 18);
		end
	else
		-- No Beliefs
		Controls.YourReligionNoBeliefs:SetHide(false);
		Controls.YourReligiousBeliefsStack:SetHide(true);
	end
	
	Controls.YourReligiousBeliefsStack:CalculateSize();
	Controls.YourReligiousBeliefsStack:ReprocessAnchoring();
	Controls.YourReligiousBeliefsScrollPanel:CalculateInternalSize();
	
	
	local automaticPurchasePullDown = Controls.AutomaticPurchasePD;
	function AddToPullDown(text, tooltip, v1, v2)
	-- set up the random slot
		local controlTable = {};
		automaticPurchasePullDown:BuildEntry( "InstanceOne", controlTable );
		
		controlTable.Button:SetVoids(v1, v2);
		controlTable.Button:SetText(text);
		controlTable.Button:SetToolTipString(tooltip);
	end
	
	function SetCurrentSelection(v1, v2)
		if (v1 == FaithPurchaseTypes.NO_AUTOMATIC_FAITH_PURCHASE) then
			automaticPurchasePullDown:GetButton():LocalizeAndSetText("TXT_KEY_RO_AUTO_FAITH_PROMPT");
		elseif (v1 == FaithPurchaseTypes.FAITH_PURCHASE_SAVE_PROPHET) then
			automaticPurchasePullDown:GetButton():LocalizeAndSetText("TXT_KEY_RO_AUTO_FAITH_PROPHET");		
		elseif (v1 == FaithPurchaseTypes.FAITH_PURCHASE_UNIT) then
			local faithCost = capital:GetUnitFaithPurchaseCost(GameInfo.Units[v2].ID, true);
			local gpString = string.format("%s (%i [ICON_PEACE])", Locale.Lookup(GameInfo.Units[v2].Description), faithCost); 
			automaticPurchasePullDown:GetButton():LocalizeAndSetText("TXT_KEY_RO_AUTO_FAITH_PURCHASE_GREAT_PERSON", gpString);
		else
			local faithCost = capital:GetBuildingFaithPurchaseCost(GameInfo.Buildings[v2].ID, true);
			local gpString = string.format("%s (%i [ICON_PEACE])", Locale.Lookup(GameInfo.Buildings[v2].Description), faithCost); 
			automaticPurchasePullDown:GetButton():LocalizeAndSetText("TXT_KEY_RO_AUTO_FAITH_PURCHASE_GREAT_PERSON", gpString);
		end
		automaticPurchasePullDown:GetButton():SetToolTipString("");
	end
	
	automaticPurchasePullDown:ClearEntries();
	
	-- Add default options	
	AddToPullDown(Locale.Lookup("TXT_KEY_RO_AUTO_FAITH_PROMPT"), "", FaithPurchaseTypes.NO_AUTOMATIC_FAITH_PURCHASE, 0);
	
	if (player:GetReligionCreatedByPlayer() > ReligionTypes.RELIGION_PANTHEON or Game.GetNumReligionsStillToFound() > 0) then
	    if (player:GetCurrentEra() < GameInfo.Eras["ERA_INDUSTRIAL"].ID) then
			AddToPullDown(Locale.Lookup("TXT_KEY_RO_AUTO_FAITH_PROPHET"), "", FaithPurchaseTypes.FAITH_PURCHASE_SAVE_PROPHET, 0);
		end
	end
	
	--Refresh automatic purchase pulldown.
	local capital = player:GetCapitalCity();
	if(capital ~= nil) then
		for unit in GameInfo.Units() do
			local faithCost = capital:GetUnitFaithPurchaseCost(unit.ID, true);
			if(faithCost > 0 and player:IsCanPurchaseAnyCity(false, true, unit.ID, -1, YieldTypes.YIELD_FAITH)) then
			    if (player:DoesUnitPassFaithPurchaseCheck(unit.ID)) then
					local gpString = string.format("%s (%i [ICON_PEACE])", Locale.Lookup(unit.Description), faithCost); 
					AddToPullDown(Locale.Lookup("TXT_KEY_RO_AUTO_FAITH_PURCHASE_GREAT_PERSON", gpString), "", FaithPurchaseTypes.FAITH_PURCHASE_UNIT, unit.ID);
				end
			end
		end
		
		for building in GameInfo.Buildings() do
			local faithCost = capital:GetBuildingFaithPurchaseCost(building.ID);
			if(faithCost > 0 and player:IsCanPurchaseAnyCity(false, true, -1, building.ID, YieldTypes.YIELD_FAITH)) then
				local gpString = string.format("%s (%i [ICON_PEACE])", Locale.Lookup(building.Description), faithCost); 
				AddToPullDown(Locale.Lookup("TXT_KEY_RO_AUTO_FAITH_PURCHASE_GREAT_PERSON", gpString), "", FaithPurchaseTypes.FAITH_PURCHASE_BUILDING, building.ID);
			end
		end
	end
	
	SetCurrentSelection(player:GetFaithPurchaseType(), player:GetFaithPurchaseIndex());
	
	automaticPurchasePullDown:CalculateInternals();
	automaticPurchasePullDown:RegisterSelectionCallback(function(v1, v2)
		
		local player = Players[Game.GetActivePlayer()];					
		Network.SendFaithPurchase(Game.GetActivePlayer(), v1, v2);
		SetCurrentSelection(v1, v2);
	end);

end

g_Tabs["YourReligion"].RefreshContent = RefreshYourReligion;

function RefreshWorldReligions()
	g_WorldReligionsManager:ResetInstances();
	
	local religions = {};
	
	local activePlayer = Players[Game.GetActivePlayer()];
	local activeTeam = Teams[activePlayer:GetTeam()];
		
	-- Pantheon and Religion info (JFD: Changes made to register religions 'founded' by the same player)
	for religion in GameInfo.Religions() do
		local eReligion = religion.ID
		local holyCity = Game.GetHolyCityForReligion(eReligion, -1);
		if holyCity then
			local pPlayer = Players[holyCity:GetOwner()]
			local holyCityName = holyCity:GetName();
			local civName = pPlayer:GetCivilizationShortDescription();
			
			local founderID = pPlayer:GetID();
			local foundDate = Game.TranslateDate(Game.GetFoundYear(eReligion, founderID)) 
			if(not activeTeam:IsHasMet(pPlayer:GetTeam())) then
				founderID = -1;
				holyCityName = "TXT_KEY_RO_WR_UNKNOWN_HOLY_CITY";
				civName = "TXT_KEY_RO_WR_UNKNOWN_CIV";
			end
			
			local colour = Colours[eReligion]
			if (not colour) then
				AssignReligionColours()
				colour = Colours[eReligion]
			end
			
			local beliefList = nil
			for _, beliefID in ipairs(Game.GetBeliefsInReligion(eReligion)) do
				local belief = GameInfo.Beliefs[beliefID]
				local beliefTypeDesc = GetBeliefType(belief)
				if (not beliefList) then
					beliefList = "[COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey(beliefTypeDesc) .. ":[ENDCOLOR] " .. Locale.ConvertTextKey(belief.ShortDescription).. "[NEWLINE][ICON_BULLET]" .. Locale.ConvertTextKey(belief.Description) .. "."
				else
					beliefList = beliefList .. "[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey(beliefTypeDesc) .. ":[ENDCOLOR] " .. Locale.ConvertTextKey(belief.ShortDescription).. "[NEWLINE][ICON_BULLET]" .. Locale.ConvertTextKey(belief.Description) .. "."
				end
			end
				
			table.insert(religions, {
				Name = Locale.Lookup(Game.GetReligionName(eReligion)),
				Color = {x=colour.r/255, y=colour.g/255, z=colour.b/255, w=colour.a},
				FoundDate = foundDate,
				ReligionIconIndex = religion.PortraitIndex,
				ReligionIconAtlas = religion.IconAtlas,
				FounderID = founderID,
				HolyCity= Locale.Lookup(holyCityName),
				Founder = Locale.Lookup(civName),
				NumCities = Game.GetNumCitiesFollowing(eReligion),
				NumFollowers = Game.GetNumTotalFollowers(eReligion),
				FounderAlive = pPlayer:IsAlive(),
				BeliefList = beliefList,
			});
		end
	end
	
	-- Pantheon and Religion info
	-- for iPlayer = 0, GameDefines.MAX_PLAYERS - 1 do	
		-- local pPlayer = Players[iPlayer];
		-- if (pPlayer:IsEverAlive()) then
			-- if (pPlayer:HasCreatedReligion()) then
				-- local eReligion = pPlayer:GetReligionCreatedByPlayer();
				-- local religion = GameInfo.Religions[eReligion];
				-- local holyCity = Game.GetHolyCityForReligion(eReligion, iPlayer);
				
				-- local holyCityName = holyCity:GetName();
				-- local civName = pPlayer:GetCivilizationDescription();
				
				-- local founderID = pPlayer:GetID();
				-- local foundDate = Game.TranslateDate(Game.GetFoundYear(eReligion, founderID)) 
				-- if(not activeTeam:IsHasMet(pPlayer:GetTeam())) then
					-- founderID = -1;
					-- holyCityName = "TXT_KEY_RO_WR_UNKNOWN_HOLY_CITY";
					-- civName = "TXT_KEY_RO_WR_UNKNOWN_CIV";
				-- end
				
				-- local colour = Colours[eReligion]
				-- if (not colour) then
					-- AssignReligionColours()
					-- colour = Colours[eReligion]
				-- end
				-- table.insert(religions, {
					-- Name = Locale.Lookup(Game.GetReligionName(eReligion)),
					-- Color = {x=colour.r/255, y=colour.g/255, z=colour.b/255, w=colour.a},
					-- DateFounded = foundDate,
					-- ReligionIconIndex = religion.PortraitIndex,
					-- ReligionIconAtlas = religion.IconAtlas,
					-- FounderID = founderID,
					-- HolyCity= Locale.Lookup(holyCityName),
					-- Founder = Locale.Lookup(civName),
					-- NumCities = Game.GetNumCitiesFollowing(eReligion),
					-- NumFollowers = GetNumFollowers(eReligion),
					-- FounderAlive = pPlayer:IsAlive(),
				-- });
			-- end
		-- end
	-- end
	
	if(#religions > 0) then
		Controls.WorldReligionsScrollPanel:SetHide(false);
		Controls.NoWorldReligions:SetHide(true);
		
		table.sort(religions, g_WorldReligionSortFunction);	
		
		for i,v in ipairs(religions) do
			local entry = g_WorldReligionsManager:GetInstance();
			entry.FoundDate:SetText(v.FoundDate)
			entry.ReligionName:SetText(v.Name);
			if v.Color then
				entry.ReligionName:SetColor(v.Color, 0)
			end
			entry.HolyCityName:SetText(v.HolyCity);
			entry.Founder:SetText(v.Founder);
			entry.NumberOfCities:SetText(v.NumCities);
			entry.NumberOfFollowers:SetText(v.NumFollowers)
			IconHookup(v.ReligionIconIndex, 48, v.ReligionIconAtlas, entry.WorldReligionIcon);
			CivIconHookup(v.FounderID, 45, entry.FounderIcon, entry.FounderIconBG, entry.FounderIconShadow, true, true );
			entry.FounderKilled:SetHide(v.FounderAlive);
			
			-- g_ReligionBeliefsToolTipTypeTipControls.Body:SetText(v.BeliefList)
			-- g_ReligionBeliefsToolTipTypeTipControls.Box:DoAutoSize()
		end
			
		Controls.WorldReligionsStack:CalculateSize();
		Controls.WorldReligionsStack:ReprocessAnchoring();
		Controls.WorldReligionsScrollPanel:CalculateInternalSize();
	else
		Controls.WorldReligionsScrollPanel:SetHide(true);
		Controls.NoWorldReligions:SetHide(false);
	end
	
	local iReligionsLeft = Game.GetNumReligionsStillToFound();
	if (iReligionsLeft < 0) then
		iReligionsLeft = 0;
	end
	Controls.NumberOfReligionsCanBeFounded:LocalizeAndSetText("TXT_KEY_TP_FAITH_RELIGIONS_LEFT", iReligionsLeft);
	
	local text = GetReligiousStatus();
	Controls.TooLateToStartPantheon:SetText(text);

end
g_Tabs["WorldReligion"].RefreshContent = RefreshWorldReligions;

function RefreshBeliefs()
	g_BeliefsManager:ResetInstances();
	
	local beliefs = {};
	
	local activePlayer = Players[Game.GetActivePlayer()];
	local activeTeam = Teams[activePlayer:GetTeam()];
	
	-- Pantheon and Religion info (JFD: Changes made to register religions 'founded' by the same player)
	for religion in GameInfo.Religions() do
		local eReligion = religion.ID
		local holyCity = Game.GetHolyCityForReligion(eReligion, -1);
		if holyCity then
			for i,v in ipairs(Game.GetBeliefsInReligion(eReligion)) do
				local religionFounderDesc = "TXT_KEY_RO_WR_UNKNOWN_CIV"
				local religionFounder = Players[Game.GetFounder(eReligion, -1)]
				if activeTeam:IsHasMet(religionFounder:GetTeam()) then
					religionFounderDesc = religionFounder:GetCivilizationShortDescription()
				end
				local belief = GameInfo.Beliefs[v];
				local beliefDesc =  Locale.Lookup(belief.Description)
				-- local colour = Colours[eReligion]
				local colour = nil
				if (not colour) then
					AssignReligionColours()
					colour = Colours[eReligion]
				end
				table.insert(beliefs, {
				Name = Locale.Lookup(belief.ShortDescription),
				Color = {x=colour.r/255, y=colour.g/255, z=colour.b/255, w=colour.a},
				CivName = Locale.Lookup(religionFounderDesc),
				Description = Locale.Lookup(belief.Description),
				Type = GetBeliefType(belief),
				Tooltip = Locale.Lookup(belief.Tooltip),
				Religion = Locale.Lookup(Game.GetReligionName(eReligion)),
				ReligionIconIndex = religion.PortraitIndex,
				ReligionIconAtlas = religion.IconAtlas
				});
			end
		end
	end
	
	-- Pantheon and Religion info
	for iPlayer = 0, GameDefines.MAX_PLAYERS - 1 do	
		local pPlayer = Players[iPlayer];
		if (pPlayer:IsEverAlive()) then
			-- if (pPlayer:HasCreatedReligion()) then
				-- local eReligion = pPlayer:GetReligionCreatedByPlayer();
				-- local religion = GameInfo.Religions[eReligion];
				-- for i,v in ipairs(Game.GetBeliefsInReligion(eReligion)) do
					-- local belief = GameInfo.Beliefs[v];
					-- local beliefDesc =  Locale.Lookup(belief.Description)
					-- local colour = Colours[religionID]
					-- if (not colour) then
						-- AssignReligionColours()
						-- colour = Colours[eReligion]
					-- end
					-- table.insert(beliefs, {
						-- Name = Locale.Lookup(belief.ShortDescription),
						-- Description = beliefDesc,
						-- Type = GetBeliefType(belief),
						-- Tooltip = Locale.Lookup(belief.Tooltip),
						-- Color = {x=colour.r/255, y=colour.g/255, z=colour.b/255, w=colour.a},
						-- Religion = Locale.Lookup(Game.GetReligionName(eReligion)),
						-- ReligionIconIndex = religion.PortraitIndex,
						-- ReligionIconAtlas = religion.IconAtlas
					-- });
				-- end
			-- elseif (pPlayer:HasCreatedPantheon()) then
			if (pPlayer:HasCreatedPantheon()) then
				local iBelief = pPlayer:GetBeliefInPantheon();
				if (not Game.IsInSomeReligion(iBelief)) then
					local belief = GameInfo.Beliefs[iBelief];
					
					local religion = nil;
					if(not activeTeam:IsHasMet(pPlayer:GetTeam())) then
						religion = Locale.Lookup("TXT_KEY_RO_BELIEF_UNKNOWN_PANTHEON");
					else
						local civilizationAdjective = pPlayer:GetCivilizationAdjectiveKey();
						religion = Locale.Lookup("TXT_KEY_RO_BELIEF_PANTHEON", civilizationAdjective);
					end
					
					local pantheon = GameInfo.Religions["RELIGION_PANTHEON"];
					local pantheonFounderDesc = "TXT_KEY_RO_WR_UNKNOWN_CIV"
					if activeTeam:IsHasMet(pPlayer:GetTeam()) then
						pantheonFounderDesc = pPlayer:GetCivilizationShortDescription()
					end
					local colour = Colours[eReligion]
					if (not colour) then
						AssignReligionColours()
						colour = Colours[0]
					end
					table.insert(beliefs, {
						Name = Locale.Lookup(belief.ShortDescription),
						Color = {x=colour.r/255, y=colour.g/255, z=colour.b/255, w=colour.a},
						Description = Locale.Lookup(belief.Description),
						CivName = Locale.Lookup(pantheonFounderDesc),
						Type = GetBeliefType(belief),
						Tooltip = Locale.Lookup(belief.Tooltip),
						Religion = religion,
						ReligionIconIndex = pantheon.PortraitIndex,
						ReligionIconAtlas = pantheon.IconAtlas
					});
				end
			end
		end	
	end
	
	if(#beliefs > 0) then
		Controls.BeliefsScrollPanel:SetHide(false);
		Controls.NoBeliefs:SetHide(true);
	
		table.sort(beliefs, g_BeliefSortFunction);	
		
		for i,v in ipairs(beliefs) do
			local beliefEntry = g_BeliefsManager:GetInstance();
			beliefEntry.BeliefName:SetText(v.Name);
			beliefEntry.BeliefType:SetText(v.Type);
			beliefEntry.BeliefDescription:SetText(v.CivName);
			if(v.Tooltip ~= "") then
				beliefEntry.BeliefName:SetToolTipString(v.Tooltip);
			else
				beliefEntry.BeliefName:SetToolTipString("[ICON_BULLET]" .. v.Description .. ".");
			end
			beliefEntry.BeliefReligion:SetText(v.Religion);
			if v.Color then
				beliefEntry.BeliefReligion:SetColor(v.Color, 0)
			end
			IconHookup(v.ReligionIconIndex, 48, v.ReligionIconAtlas, beliefEntry.BeliefReligionIcon);
		end
		
		
		Controls.BeliefsStack:CalculateSize();
		Controls.BeliefsStack:ReprocessAnchoring();
		Controls.BeliefsScrollPanel:CalculateInternalSize();
	
	else
		Controls.BeliefsScrollPanel:SetHide(true);
		Controls.NoBeliefs:SetHide(false);
	end
end
g_Tabs["Beliefs"].RefreshContent = RefreshBeliefs;

local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local minorCivTraitReligiousID = MinorCivTraitTypes["MINOR_CIV_TRAIT_RELIGIOUS"]
function RefreshStateReligions()
	g_StateReligionsManager:ResetInstances()
	local stateReligions = {}
	local activePlayerID = Game.GetActivePlayer()
	local activePlayer = Players[activePlayerID]
	local activeTeam = Teams[activePlayer:GetTeam()]
	for playerID = 0, GameDefines.MAX_CIV_PLAYERS - 1 do	
		local player = Players[playerID]
		if (player:IsAlive() and activeTeam:IsHasMet(player:GetTeam())) then
			--if (player:GetMinorCivTrait() == minorCivTraitReligiousID or (not player:IsMinorCiv())) then
				local religionDesc = "TXT_KEY_JFD_NO_STATE_RELIGION_NONE"
				local religionFounderDesc = "TXT_KEY_JFD_NO_FOUNDER"
				local religionFounderID = -1
				local religionID = 0
				local numFaith = player:GetTotalFaithPerTurn()
				local numPiety = player:GetPiety()
				if player:HasSecularized() then
					religionDesc = "TXT_KEY_JFD_NO_STATE_RELIGION_SECULAR"
					religionID = 0
				elseif player:HasStateReligion() then
					local stateReligionID = player:GetStateReligion()
					local stateReligionFounder = Players[Game.GetFounder(stateReligionID, -1)]
					religionDesc = Game.GetReligionName(stateReligionID)
					religionFounderDesc = "TXT_KEY_RO_WR_UNKNOWN_CIV"
					if activeTeam:IsHasMet(stateReligionFounder:GetTeam()) then
						religionFounderID = stateReligionFounder:GetID()
						religionFounderDesc = stateReligionFounder:GetCivilizationDescription()
					end
					religionID = stateReligionID
				elseif player:IsPagan() then
					religionDesc = "TXT_KEY_JFD_NO_STATE_RELIGION_PAGAN"
				end
				local colour = Colours[religionID]
				if (not colour) then
					AssignReligionColours()
					colour = Colours[religionID]
				end
				local beliefList = "[NEWLINE][COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_JFD_BELIEF_STATE_RELIGION") .. "[ENDCOLOR][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_JFD_BELIEF_STATE_RELIGION_DESC")
				-- for _, beliefID in ipairs(Game.GetBeliefsInReligion(eReligion)) do
					-- local belief = GameInfo.Beliefs[beliefID]
					-- local beliefTypeDesc = GetBeliefType(belief)
					-- beliefList = beliefList .. "[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey(beliefTypeDesc) .. ":[ENDCOLOR] " .. Locale.ConvertTextKey(belief.ShortDescription).. "[NEWLINE][ICON_BULLET]" .. Locale.ConvertTextKey(belief.Description) .. "."
				-- end
				table.insert(stateReligions, {
					Civilization = Locale.Lookup(player:GetCivilizationShortDescription()),
					CivilizationID = player:GetID(),
					Name = Locale.Lookup(religionDesc),
					ReligionID = religionID,
					Founder = Locale.Lookup(religionFounderDesc),
					FounderID = religionFounderID,
					Color = {x=colour.r/255, y=colour.g/255, z=colour.b/255, w=colour.a},
					NumPiety = numPiety,
					NumFaith = numFaith,
					BeliefList = beliefList,
				});
			--end
		end
	end
	if(#stateReligions > 0) then
		Controls.StateReligionsScrollPanel:SetHide(false)
		Controls.NoStateReligions:SetHide(true)
		table.sort(stateReligions, g_StateReligionsSortFunction)
		for i,v in ipairs(stateReligions) do
			local entry = g_StateReligionsManager:GetInstance()
			local playerID = v.CivilizationID
			local player = Players[playerID]
			entry.Civilization:SetText(v.Civilization)
			entry.StateReligionName:SetText(v.Name)
			if (playerID ~= activePlayerID and (not player:HasSecularized())) then
				entry.StateReligionName:LocalizeAndSetToolTip(player:GetStateReligionChanceTT())
			else
				entry.StateReligionName:SetToolTipString(nil)
			end
			entry.StateReligionName:SetColor(v.Color, 0)
			entry.ReligionFounder:SetText(v.Founder)
			local pietyDesc = "TXT_KEY_JFD_NOT_APPLICABLE"
			if player:HasStateReligion() then
				local pietyLevelID = player:GetPietyLevel()
				local pietyLevel = GameInfo.JFD_PietyLevels[pietyLevelID]
				pietyDesc = pietyLevel.TextColor .. Locale.ConvertTextKey(pietyLevel.ShortDescription) .. "[ENDCOLOR]"
			end
			entry.PietyLevel:LocalizeAndSetText(pietyDesc)
			entry.NumFaithPerTurn:SetText(v.NumFaith)
			if (player:HasStateReligion() or player:IsPagan()) then
				entry.StateReligionIcon:SetHide(false)
				IconHookup(GameInfo.Religions[v.ReligionID].PortraitIndex, 48, GameInfo.Religions[v.ReligionID].IconAtlas, entry.StateReligionIcon)
			else
				entry.StateReligionIcon:SetHide(true)
			end
			CivIconHookup(v.CivilizationID, 45, entry.CivilizationIcon, entry.CivilizationIconBG, entry.CivilizationIconShadow, true, true)
			CivIconHookup(v.FounderID, 45, entry.FounderIcon, entry.FounderIconBG, entry.FounderIconShadow, true, true)
			-- g_StateReligionBeliefsToolTipTypeTipControls.Body:SetText(v.BeliefList)
			-- g_StateReligionBeliefsToolTipTypeTipControls.Box:DoAutoSize()
		end
		Controls.StateReligionsStack:CalculateSize()
		Controls.StateReligionsStack:ReprocessAnchoring()
		Controls.StateReligionsScrollPanel:CalculateInternalSize()
	end
end
g_Tabs["StateReligions"].RefreshContent = RefreshStateReligions
-------------------------------------------------------------------------------
-- Choose State Religion
-------------------------------------------------------------------------------
-- JFD_ShowConfirmStateReligion
function JFD_ShowConfirmStateReligion(religionID)
	local playerID = Game.GetActivePlayer()
	local player = Players[playerID]
	local stateReligionID = player:GetStateReligion()
	if g_StateReligionChosenID == 0 then
		Controls.LabelConfirm:LocalizeAndSetText("TXT_KEY_RO_CONFIRM_JFD_SECULARIZE")
		local pietyLevel = GameInfo.JFD_PietyLevels[player:GetPietyLevel()]
		local numResistanceTurns = pietyLevel.ChangeResistanceTurns
		local numFaithCost = math.ceil((pietyLevel.ChangeFaithCost*gameSpeedMod)*player:GetNumCitiesWithStateReligion(stateReligionID))
		if numResistanceTurns > 0 then
			Controls.LabelConfirm:LocalizeAndSetText("TXT_KEY_RO_CONFIRM_JFD_SECULARIZE_ANARCHY_COST", numResistanceTurns)
		elseif numFaithCost > 0 then
			Controls.LabelConfirm:LocalizeAndSetText("TXT_KEY_RO_CONFIRM_JFD_SECULARIZE_FAITH_COST", numFaithCost)
		end
	else
		Controls.LabelConfirm:LocalizeAndSetText("TXT_KEY_RO_CONFIRM_JFD_STATE_RELIGION", Game.GetReligionName(g_StateReligionChosenID))
		if player:HasStateReligion() then
			local pietyLevel = GameInfo.JFD_PietyLevels[player:GetPietyLevel()]
			local numResistanceTurns = pietyLevel.ChangeResistanceTurns
			local numFaithCost = math.ceil((pietyLevel.ChangeFaithCost*gameSpeedMod)*player:GetNumCitiesWithStateReligion(stateReligionID))
			if numResistanceTurns > 0 then
				Controls.LabelConfirm:LocalizeAndSetText("TXT_KEY_RO_CONFIRM_JFD_STATE_RELIGION_ANARCHY_COST", Game.GetReligionName(g_StateReligionChosenID), numResistanceTurns)
			elseif numFaithCost > 0 then
				Controls.LabelConfirm:LocalizeAndSetText("TXT_KEY_RO_CONFIRM_JFD_STATE_RELIGION_FAITH_COST", Game.GetReligionName(g_StateReligionChosenID), numFaithCost)
			end
		end
	end
	Controls.Confirm:SetHide(false)
end
Controls.EstablishButton:RegisterCallback(Mouse.eLClick, JFD_ShowConfirmStateReligion)

-- JFD_EstablishStateReligion
function JFD_EstablishStateReligion()
	local player = Players[Game.GetActivePlayer()]
	if g_StateReligionChosenID == 0 then
		player:SetHasSecularized(true)
	else
		player:SetStateReligion(g_StateReligionChosenID)
		player:SetPietyRate(player:GetPietyPerTurn())
	end
	Controls.Confirm:SetHide(true)
	Controls.StateReligionChoicePopup:SetHide(true)
	RefreshYourReligion()
end
Controls.ConfirmYes:RegisterCallback(Mouse.eLClick, JFD_EstablishStateReligion)

-- JFD_ConfirmNo
function JFD_ConfirmNo()
	Controls.Confirm:SetHide(true)
end
Controls.ConfirmNo:RegisterCallback(Mouse.eLClick, JFD_ConfirmNo)

-- JFD_CloseChooseStateReligionPopup
function JFD_CloseChooseStateReligionPopup()
	Controls.StateReligionChoicePopup:SetHide(true)
end
Controls.BackButton:RegisterCallback(Mouse.eLClick, JFD_CloseChooseStateReligionPopup)

-- JFD_OnReligionSelected
function JFD_OnReligionSelected(religionID)
	local playerID = Game.GetActivePlayer()
	local player = Players[playerID]
	local stateReligionID = player:GetStateReligion()
	g_StateReligionChosenID = religionID
	JFD_ShowChooseStateReligionPopup()
	local establishTT = ""
	if g_StateReligionChosenID == 0 then
		establishTT = Locale.ConvertTextKey("TXT_KEY_JFD_CHOOSE_SECULARIZATION_MENU_TOOLTIP")
		if player:HasStateReligion() then
			local pietyLevel = GameInfo.JFD_PietyLevels[player:GetPietyLevel()]
			local numResistanceTurns = pietyLevel.ChangeResistanceTurns
			local numFaithCost = math.ceil((pietyLevel.ChangeFaithCost*gameSpeedMod)*player:GetNumCitiesWithStateReligion(stateReligionID))
			if numResistanceTurns > 0 then
				establishTT = Locale.ConvertTextKey("TXT_KEY_JFD_CHOOSE_SECULARIZATION_MENU_TOOLTIP_ANARCHY_COST", numResistanceTurns)
			elseif numFaithCost > 0 then
				establishTT = Locale.ConvertTextKey("TXT_KEY_JFD_CHOOSE_SECULARIZATION_MENU_TOOLTIP_FAITH_COST", numFaithCost)
			end	
		end
	else
		if player:HasStateReligion() then 
			establishTT = Locale.ConvertTextKey("TXT_KEY_JFD_CHOOSE_NEW_STATE_RELIGION_MENU_TOOLTIP", Game.GetReligionName(religionID))
			if player:HasStateReligion() then
				local pietyLevel = GameInfo.JFD_PietyLevels[player:GetPietyLevel()]
				local numResistanceTurns = pietyLevel.ChangeResistanceTurns
				local numFaithCost = math.ceil((pietyLevel.ChangeFaithCost*gameSpeedMod)*player:GetNumCitiesWithStateReligion(stateReligionID))
				if numResistanceTurns > 0 then
					establishTT = Locale.ConvertTextKey("TXT_KEY_JFD_CHOOSE_NEW_STATE_RELIGION_MENU_TOOLTIP_ANARCHY_COST", Game.GetReligionName(religionID), numResistanceTurns)
				elseif numFaithCost > 0 then
					establishTT = Locale.ConvertTextKey("TXT_KEY_JFD_CHOOSE_NEW_STATE_RELIGION_MENU_TOOLTIP_FAITH_COST", Game.GetReligionName(religionID), numFaithCost)
				end	
			end
		else
			establishTT = Locale.ConvertTextKey("TXT_KEY_JFD_CHOOSE_STATE_RELIGION_MENU_TOOLTIP", Game.GetReligionName(religionID))
		end
	end
	Controls.EstablishButton:SetToolTipString(establishTT)
	Controls.EstablishButton:SetDisabled(false)
end

-- JFD_ShowChooseStateReligionPopup
function JFD_ShowChooseStateReligionPopup()
	Controls.StateReligionChoicePopup:SetHide(false)
	g_StateReligionChoiceManager:ResetInstances()
	local playerID = Game.GetActivePlayer()
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local currentStateReligionID = player:GetStateReligion()
	if player:CanSecularize() then
		local instance = g_StateReligionChoiceManager:GetInstance()
		if userSettingCIDCrimesCore then
			instance.StateReligionChoiceButton:LocalizeAndSetToolTip("TXT_KEY_JFD_ESTABLISH_SECULARIZATION_TT_CRIMES")
		else
			instance.StateReligionChoiceButton:LocalizeAndSetToolTip("TXT_KEY_JFD_ESTABLISH_SECULARIZATION_TT")
		end
		instance.StateReligionChoiceDesc:LocalizeAndSetText("TXT_KEY_JFD_ESTABLISH_SECULARIZATION")
		instance.StateReligionChoiceFounder:SetHide(true)
		instance.StateReligionChoiceIcon:SetTexture("Secularization.dds")
		instance.StateReligionChoiceButton:SetVoid1(0)
		instance.StateReligionChoiceButton:RegisterCallback(Mouse.eLClick, JFD_OnReligionSelected)
		if g_StateReligionChosenID == 0 then
			instance.SelectedHL:SetHide(false)
		else
			instance.SelectedHL:SetHide(true)
		end
	end
	for religion in GameInfo.Religions("ID <> '" .. currentStateReligionID .. "' AND ID > 0") do
		local religionID = religion.ID
		if player:CanHaveStateReligion(religionID) then
			local instance = g_StateReligionChoiceManager:GetInstance()
			local beliefList = "[NEWLINE][COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_JFD_BELIEF_STATE_RELIGION") .. "[ENDCOLOR][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_JFD_BELIEF_STATE_RELIGION_DESC")
			for _, beliefID in ipairs(Game.GetBeliefsInReligion(religionID)) do
				local belief = GameInfo.Beliefs[beliefID]
				beliefList = beliefList .. "[NEWLINE][COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey(belief.ShortDescription).. "[ENDCOLOR][NEWLINE]" .. Locale.ConvertTextKey(belief.Description)
			end
			local religionDesc = Game.GetReligionName(religionID)
			local religionFounderID = Game.GetFounder(religionID, -1)
			local religionFounderDesc = Players[religionFounderID]:GetCivilizationDescription()
			if religionFounderID == playerID then religionFounderDesc = Locale.ConvertTextKey(religionFounderDesc) .. " ([COLOR_POSITIVE_TEXT]You[ENDCOLOR])" end
			local religionFoundDate = Game.TranslateDate(Game.GetFoundYear(religionID, religionFounderID))
			local religionHolyCity = Game.GetHolyCityForReligion(religionID, -1):GetName()
			instance.StateReligionChoiceButton:LocalizeAndSetToolTip("TXT_KEY_JFD_CHOOSE_STATE_RELIGION_TT", Locale.ToUpper(religionDesc), religionFounderDesc, religionHolyCity, religionFoundDate, beliefList)
			instance.StateReligionChoiceDesc:LocalizeAndSetText(religionDesc)
			instance.StateReligionChoiceFounder:LocalizeAndSetText(religionFounderDesc)
			IconHookup(religion.PortraitIndex, 64, religion.IconAtlas, instance.StateReligionChoiceIcon)
			instance.StateReligionChoiceIcon:SetHide(false)
			instance.StateReligionChoiceButton:SetVoid1(religionID)
			instance.StateReligionChoiceButton:RegisterCallback(Mouse.eLClick, JFD_OnReligionSelected)
			local pediaEntry = CivilopediaControl and (GameInfo.Religions[religionID].Description)
			if (pediaEntry and (not setDisabled)) then
				instance.StateReligionChoiceButton:RegisterCallback(Mouse.eRClick, function() getPedia(pediaEntry) end)
			end
			if religionID == g_StateReligionChosenID then
				instance.SelectedHL:SetHide(false)
			else
				instance.SelectedHL:SetHide(true)
			end
		end
		Controls.StateReligionChoiceStack:CalculateSize()
		Controls.StateReligionChoiceStack:ReprocessAnchoring()
		Controls.StateReligionChoiceScrollPanel:CalculateInternalSize()
		Controls.EstablishButton:SetDisabled(not g_StateReligionChosenID)
	end
end
Controls.StateReligionStatus:RegisterCallback(Mouse.eLClick, JFD_ShowChooseStateReligionPopup)
LuaEvents.JFD_RTP_Piety_ShowChooseStateReligionPopup.Add(JFD_ShowChooseStateReligionPopup);
-------------------------------------------------------------------------------
-- Religion Map
-------------------------------------------------------------------------------
function AssignReligionColours()
  for iPlayer=0, GameDefines.MAX_CIV_PLAYERS-1 do	
    local pPlayer = Players[iPlayer]

    if (pPlayer:IsEverAlive()) then
      if (pPlayer:HasCreatedReligion()) then
        local iReligion = pPlayer:GetOriginalReligionCreatedByPlayer()
        local colourMap = GameInfo.Religion_MapColors("ReligionType='" .. GameInfo.Religions[iReligion].Type .. "'")()
        local colour
        if (colourMap ~= nil) then
          colour = GameInfo.Colors[colourMap.ColorType]
          Colours[iReligion] = {r=(255*colour.Red), g=(255*colour.Green), b=(255*colour.Blue), a=colour.Alpha}
        else
          if (pPlayer:IsMinorCiv()) then
            colour, _ = pPlayer:GetPlayerColors()
          else
            _, colour = pPlayer:GetPlayerColors()
          end
          Colours[iReligion] = {r=(255*colour.x), g=(255*colour.y), b=(255*colour.z), a=colour.w}
        end
      else
		Colours[GameInfoTypes["RELIGION_PANTHEON"]] = {r=(255), g=(255), b=(255), a=1}
	  end
    end
  end
end

function ShadeCities(iTeam)
  for iPlayer=0, GameDefines.MAX_CIV_PLAYERS-1 do	
    local pPlayer = Players[iPlayer]

    if (pPlayer:IsAlive()) then
      for pCity in pPlayer:Cities() do
        local iReligion = pCity:GetReligiousMajority()

        if (iReligion > 0) then
          if (Colours[iReligion] == nil) then
            AssignReligionColours()
          end

          ShadeCity(iTeam, pCity, Colours[iReligion])
        end
      end
    end
  end
end

function ShadeCity(iTeam, pCity, colour)
  for i = 1, pCity:GetNumCityPlots()-1, 1 do
    local pPlot = pCity:GetCityIndexPlot(i)
    
    if (pPlot ~= nil and pPlot:IsRevealed(iTeam)) then
      if (pPlot:GetOwner() == pCity:GetOwner()) then
        if (pPlot:IsLake() or not pPlot:IsWater()) then 
          if (pPlot:IsMountain() or pPlot:GetTerrainType() == iTerrainDesert or pCity:IsWorkingPlot(pPlot) or pCity:CanWork(pPlot)) then
            Controls.ReligionMap:SetPlot(pPlot:GetX(), pPlot:GetY(), pPlot:GetTerrainType(), colour.r/255, colour.g/255, colour.b/255, colour.a)
          end
        end
      end
    end
  end
end

function RefreshMap()
  local iPlayer = Game.GetActivePlayer()
  local pPlayer = Players[iPlayer]
  local iTeam = pPlayer:GetTeam()

  for y = 0, mapHeight-1, 1 do  
    for x = 0, mapWidth-1, 1 do
      local pPlot = Map.GetPlot(x, y)
      local colour = Colours.UNKNOWN

      if (pPlot:IsRevealed(iTeam)) then
        if (pPlot:IsCity()) then
          local pCity = pPlot:GetPlotCity()
          local iReligion = pCity:GetReligiousMajority()

          if (iReligion >= 0 and pCity:IsHolyCityForReligion(iReligion)) then
            colour = Colours.HOLY_CITY
          else
            colour = Colours.CITY
          end
        else
          if (pPlot:GetFeatureType() == iFeatureIce) then
            colour = Colours.ICE
          elseif (pPlot:IsWater()) then
            colour = Colours.WATER
          else
            colour = Colours.NONE
          end
        end
      end

      Controls.ReligionMap:SetPlot(x, y, pPlot:GetTerrainType(), colour.r/255, colour.g/255, colour.b/255, colour.a)
    end
  end

  ShadeCities(iTeam)
end
g_Tabs["Map"].RefreshContent = RefreshMap;
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
	
	for i,v in ipairs(g_BeliefSortOptions) do
		if(v.Button ~= nil) then
			v.Button:RegisterCallback(Mouse.eLClick, function() BeliefSortOptionSelected(v); end);
		end
	end
	
	for i,v in ipairs(g_WorldReligionSortOptions) do
		if(v.Button ~= nil) then
			v.Button:RegisterCallback(Mouse.eLClick, function() WorldReligionSortOptionSelected(v); end);
		end
	end
	
	for i,v in ipairs(g_StateReligionsSortOptions) do
		if(v.Button ~= nil) then
			v.Button:RegisterCallback(Mouse.eLClick, function() StateReligionsSortOptionSelected(v); end);
		end
	end
	
	UpdateSortOptionsDisplay(g_BeliefSortOptions);
	UpdateSortOptionsDisplay(g_WorldReligionSortOptions);
	UpdateSortOptionsDisplay(g_StateReligionsSortOptions);
	
	g_BeliefSortFunction = GetSortFunction(g_BeliefSortOptions);
	g_WorldReligionSortFunction = GetSortFunction(g_WorldReligionSortOptions);
	g_StateReligionsSortFunction = GetSortFunction(g_StateReligionsSortOptions);
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
function BeliefSortOptionSelected(option)
	local sortOptions = g_BeliefSortOptions;
	UpdateSortOptionState(sortOptions, option);
	UpdateSortOptionsDisplay(sortOptions);
	g_BeliefSortFunction = GetSortFunction(sortOptions);
	
	RefreshBeliefs();
end

-- Callback for when sort options are selected.
function WorldReligionSortOptionSelected(option)
	local sortOptions = g_WorldReligionSortOptions;
	UpdateSortOptionState(sortOptions, option);
	UpdateSortOptionsDisplay(sortOptions);
	g_WorldReligionSortFunction = GetSortFunction(sortOptions);
	
	RefreshWorldReligions();
end

-- Callback for when sort options are selected.
function StateReligionsSortOptionSelected(option)
	local sortOptions = g_StateReligionsSortOptions;
	UpdateSortOptionState(sortOptions, option);
	UpdateSortOptionsDisplay(sortOptions);
	g_StateReligionsSortFunction = GetSortFunction(sortOptions);
	
	RefreshStateReligions();
end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function ShowHideHandler( bIsHide, bInitState )
    if( not bInitState ) then
        if( not bIsHide ) then
        	UI.incTurnTimerSemaphore();  
        	Events.SerialEventGameMessagePopupShown(g_PopupInfo);
        	
        	TabSelect(g_CurrentTab);
        else
			if(g_PopupInfo ~= nil) then
				Events.SerialEventGameMessagePopupProcessed.CallImmediate(g_PopupInfo.Type, 0);
            end
            UI.decTurnTimerSemaphore();
        end
    end
end
ContextPtr:SetShowHideHandler( ShowHideHandler );

----------------------------------------------------------------
-- 'Active' (local human) player has changed
----------------------------------------------------------------
function OnActivePlayerChanged()
	--if (not Controls.ChooseConfirm:IsHidden()) then
	--	Controls.ChooseConfirm:SetHide(true);
	--end
end
Events.GameplaySetActivePlayer.Add(OnActivePlayerChanged);

-----------------------------------------------------------------
-- Add Religion Overview to Dropdown (if enabled)
-----------------------------------------------------------------
if(not Game.IsOption(GameOptionTypes.GAMEOPTION_NO_RELIGION)) then
	LuaEvents.AdditionalInformationDropdownGatherEntries.Add(function(entries)
		table.insert(entries, {
			text=Locale.Lookup("TXT_KEY_RELIGION_OVERVIEW"),
			art = "DC45_ReligionOverview.dds",
			call=function() 
				Events.SerialEventGameMessagePopup{ 
					Type = ButtonPopupTypes.BUTTONPOPUP_RELIGION_OVERVIEW,
				};
			end,
		});
	end);

	-- Just in case :)
	LuaEvents.RequestRefreshAdditionalInformationDropdownEntries();
end

-- MODS START
function OnFound()
  OnClose()
  Events.SerialEventGameMessagePopup({Type=ButtonPopupTypes.BUTTONPOPUP_FOUND_PANTHEON, Data2=1})
end
Controls.FoundPantheonButton:RegisterCallback(Mouse.eLClick, OnFound)
-- MODS END

AssignReligionColours()
RegisterSortOptions();
TabSelect("YourReligion");

