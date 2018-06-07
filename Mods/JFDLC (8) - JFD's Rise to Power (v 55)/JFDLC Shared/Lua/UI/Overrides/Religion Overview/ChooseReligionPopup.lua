
-------------------------------------------------
-- Choose Pantheon Popup
-------------------------------------------------

include( "IconSupport" );
include( "InstanceManager" );
include( "InfoTooltipInclude.lua" );
include( "JFD_RTPUtils.lua" );
include( "JFD_RTP_PietyUtils" );

local userSettingRTPPietyBeliefMissionaries = (Game.GetUserSetting("JFD_RTP_PIETY_BELIEF_ADDITIONS_FOLLOWER_MISSIONS") == 1)

local g_ReligionButtonManager = InstanceManager:new( "ReligionButtonInstance", "Base", Controls.ReligionStack );
local g_BeliefItemManager = InstanceManager:new( "BeliefItemInstance", "Button", Controls.BeliefStack );

g_BeliefToggleContext = nil; -- Used to track which context the belief listing is for.

g_CurrentReligionID = nil;
g_CurrentReligionName = nil;
g_Beliefs = {};
g_iCityX = -1;
g_iCityY = -1;
g_bFoundingReligion = true;

-------------------------------------------------
-------------------------------------------------
function OnPopupMessage(popupInfo)
	
	local popupType = popupInfo.Type;
	if popupType ~= ButtonPopupTypes.BUTTONPOPUP_FOUND_RELIGION then
		return;
	end
	
	g_PopupInfo = popupInfo;
	
	g_iCityX = popupInfo.Data1;
	g_iCityY = popupInfo.Data2;
	g_bFoundingReligion = popupInfo.Option1;
	
   	UIManager:QueuePopup( ContextPtr, PopupPriority.SocialPolicy );
end
Events.SerialEventGameMessagePopup.Add( OnPopupMessage );

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnClose()
	if(g_BeliefToggleContext ~= nil) then
		ToggleBeliefContext(nil);
	else
		UIManager:DequeuePopup(ContextPtr);
	end
end
Controls.CloseButton:RegisterCallback(Mouse.eLClick, OnClose);

-------------------------------------------------------------------------------------------------
function IgnoreLeftClick( Id )
	-- just swallow it
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function InputHandler( uiMsg, wParam, lParam )
    ----------------------------------------------------------------        
    -- Key Down Processing
    ----------------------------------------------------------------        
    if uiMsg == KeyEvents.KeyDown then
        if (wParam == Keys.VK_ESCAPE) then
        
			if(not Controls.ChooseConfirm:IsHidden())then
	            Controls.ChooseConfirm:SetHide(true);
            elseif(not Controls.TopPanel:IsHidden()) then
				OnBack();
			elseif(not Controls.ChangeNamePopup:IsHidden()) then
				Controls.ChangeNamePopup:SetHide(true);
           	else
				OnClose();
			end
			return true;
        end
        
       if(wParam == Keys.VK_RETURN) and (not Controls.TopPanel:IsHidden()) then
		-- Do Nothing.
			OnSearchButtonClicked()
		else
			return true;
        end
    end
end
ContextPtr:SetInputHandler( InputHandler );

-------------------------------------------------------------------------------------------------
function OnPantheonBeliefClick()
	OnChooseBeliefPopup("Pantheon")

	-- if(ToggleBeliefContext("PantheonBelief")) then
		-- local availablePantheonBeliefs = {};
		-- for i,v in ipairs(Game.GetAvailablePantheonBeliefs()) do
			-- local belief = GameInfo.Beliefs[v];
			-- if(belief ~= nil and v ~= g_Beliefs[6]) then
				-- table.insert(availablePantheonBeliefs, {
					-- ID = belief.ID,
					-- Name = Locale.Lookup(belief.ShortDescription),
					-- Description = Locale.Lookup(belief.Description),
				-- });
			-- end
		-- end
		
		-- table.sort(availablePantheonBeliefs, function(a,b) return Locale.Compare(a.Name, b.Name) < 0; end);
		
		-- SelectFromBeliefs(availablePantheonBeliefs, function(belief)
			-- Controls.PantheonBeliefName:SetText(belief.Name);
			-- Controls.PantheonBeliefDescription:SetText(belief.Description);
			-- g_Beliefs[1] = belief.ID;
			
			-- CheckifCanCommit();
		-- end);
	-- end

end

-------------------------------------------------------------------------------------------------
function OnFounderBeliefClick()
	OnChooseBeliefPopup("Founder")

	-- if(ToggleBeliefContext("FounderBelief")) then
		-- local availableFounderBeliefs = {};
		-- for i,v in ipairs(Game.GetAvailableFounderBeliefs()) do
			-- local belief = GameInfo.Beliefs[v];
			-- if(belief ~= nil and v ~= g_Beliefs[6]) then
				-- table.insert(availableFounderBeliefs, {
					-- ID = belief.ID,
					-- Name = Locale.Lookup(belief.ShortDescription),
					-- Description = Locale.Lookup(belief.Description),
				-- });
			-- end
		-- end
		
		-- table.sort(availableFounderBeliefs, function(a,b) return Locale.Compare(a.Name, b.Name) < 0; end);
		
		-- SelectFromBeliefs(availableFounderBeliefs, function(belief)
			-- Controls.FounderBeliefName:SetText(belief.Name);
			-- Controls.FounderBeliefDescription:SetText(belief.Description);
			-- g_Beliefs[2] = belief.ID;
			
			-- CheckifCanCommit();
		-- end);
	-- end

end

-------------------------------------------------------------------------------------------------
function OnFollowerBeliefClick()
	OnChooseBeliefPopup("Follower")
	
	-- if(ToggleBeliefContext("FollowerBelief")) then
		-- local availableFollowerBeliefs = {};
		-- for i,v in ipairs(Game.GetAvailableFollowerBeliefs()) do
			-- local belief = GameInfo.Beliefs[v];
			-- if(belief ~= nil and v ~= g_Beliefs[6]) then
				-- table.insert(availableFollowerBeliefs, {
					-- ID = belief.ID,
					-- Name = Locale.Lookup(belief.ShortDescription),
					-- Description = Locale.Lookup(belief.Description),
				-- });
			-- end
		-- end
		
		-- Sort by their description.
		-- table.sort(availableFollowerBeliefs, function(a,b) return Locale.Compare(a.Name, b.Name) < 0; end);
			
		-- SelectFromBeliefs(availableFollowerBeliefs, function(belief)
			-- Controls.FollowerBeliefName:SetText(belief.Name);
			-- Controls.FollowerBeliefDescription:SetText(belief.Description);
			-- g_Beliefs[3] = belief.ID;
			
			-- CheckifCanCommit();
		-- end);
	-- end
end

-------------------------------------------------------------------------------------------------
function OnFollowerBelief2Click()
	OnChooseBeliefPopup("RequiresEnhancement")

	-- if(ToggleBeliefContext("FollowerBelief2")) then
		-- local availableFollowerBeliefs = {};
		-- for i,v in ipairs(Game.GetAvailableFollowerBeliefs()) do
			-- local belief = GameInfo.Beliefs[v];
			-- if(belief ~= nil) then
				-- table.insert(availableFollowerBeliefs, {
					-- ID = belief.ID,
					-- Name = Locale.Lookup(belief.ShortDescription),
					-- Description = Locale.Lookup(belief.Description),
				-- });
			-- end
		-- end
		
		-- Sort by their description.
		-- table.sort(availableFollowerBeliefs, function(a,b) return Locale.Compare(a.Name, b.Name) < 0; end);
			
		-- SelectFromBeliefs(availableFollowerBeliefs, function(belief)
			-- Controls.FollowerBelief2Name:SetText(belief.Name);
			-- Controls.FollowerBelief2Description:SetText(belief.Description);
			-- g_Beliefs[4] = belief.ID;
			
			-- CheckifCanCommit();
		-- end);
	-- end
end

-------------------------------------------------------------------------------------------------
function OnEnhancerBeliefClick()
	OnChooseBeliefPopup("Enhancer")
	
	-- if(ToggleBeliefContext("EnhancerBelief")) then
		-- local availableEnhancerBeliefs = {};
		-- for i,v in ipairs(Game.GetAvailableEnhancerBeliefs()) do
			-- local belief = GameInfo.Beliefs[v];
			-- if(belief ~= nil) then
				-- table.insert(availableEnhancerBeliefs, {
					-- ID = belief.ID,
					-- Name = Locale.Lookup(belief.ShortDescription),
					-- Description = Locale.Lookup(belief.Description),
				-- });
			-- end
		-- end
		
		-- Sort by their description.
		-- table.sort(availableEnhancerBeliefs, function(a,b) return Locale.Compare(a.Name, b.Name) < 0; end);
			
		-- SelectFromBeliefs(availableEnhancerBeliefs, function(belief)
			-- Controls.EnhancerBeliefName:SetText(belief.Name);
			-- Controls.EnhancerBeliefDescription:SetText(belief.Description);
			-- g_Beliefs[5] = belief.ID;
			
			-- CheckifCanCommit();
		-- end);
	-- end
end

-------------------------------------------------------------------------------------------------
function OnBonusBeliefClick()
	OnChooseBeliefPopup("Bonus")
		
	-- if(ToggleBeliefContext("BonusBelief")) then
		-- local availableBonusBeliefs = {};
		-- for i,v in ipairs(Game.GetAvailableBonusBeliefs()) do
			-- local belief = GameInfo.Beliefs[v];
			-- if(belief ~= nil and v ~= g_Beliefs[1] and v ~= g_Beliefs[2] and v ~= g_Beliefs[3]) then
				-- table.insert(availableBonusBeliefs, {
					-- ID = belief.ID,
					-- Name = Locale.Lookup(belief.ShortDescription),
					-- Description = Locale.Lookup(belief.Description),
				-- });
			-- end
		-- end
		
		-- Sort by their description.
		-- table.sort(availableBonusBeliefs, function(a,b) return Locale.Compare(a.Name, b.Name) < 0; end);
			
		-- SelectFromBeliefs(availableBonusBeliefs, function(belief)
			-- Controls.BonusBeliefName:SetText(belief.Name);
			-- Controls.BonusBeliefDescription:SetText(belief.Description);
			-- g_Beliefs[6] = belief.ID;
				
			-- CheckifCanCommit();
		-- end);
	-- end
end

-------------------------------------------------------------------------------------------------
function ToggleBeliefContext(contextName)
	-- if(not Controls.BeliefPanel:IsHidden() and g_BeliefToggleContext == contextName or contextName == nil) then
		-- Controls.FoundReligion:SetHide(false);
		-- Controls.BeliefPanel:SetHide(true);
		-- Controls.CloseButton:LocalizeAndSetText("TXT_KEY_CLOSE");
		-- g_BeliefToggleContext = nil;
		-- return false;
	-- else
		-- Controls.FoundReligion:SetHide(true);
		-- Controls.BeliefPanel:SetHide(false);
		-- Controls.CloseButton:LocalizeAndSetText("TXT_KEY_BACK_BUTTON");
		-- g_BeliefToggleContext = contextName;
		-- return true;
	-- end
end

-------------------------------------------------------------------------------------------------
function RefreshReligions()
	g_ReligionButtonManager:ResetInstances();
	local pActivePlayer = Players[Game.GetActivePlayer()];
	local pActiveTeam = Teams[Game.GetActiveTeam()];
	local takenReligions = {};
	
	for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1 do	
		local pPlayer = Players[iPlayer];
		if (pPlayer:IsEverAlive() and pPlayer:HasCreatedReligion()) then
			local eReligion = pPlayer:GetReligionCreatedByPlayer();
			local iOtherTeam = pPlayer:GetTeam();
			
			if (pActiveTeam:IsHasMet(iOtherTeam)) then
				takenReligions[eReligion] = pPlayer:GetCivilizationShortDescription();
			else
				takenReligions[eReligion] = Locale.ConvertTextKey("TXT_KEY_CHOOSE_RELIGION_UNMET_PLAYER");			
			end
			
			if (eReligion > ReligionTypes.RELIGION_PANTHEON) then
				if (pActivePlayer:GetID() == pPlayer:GetID()) then
					g_CurrentReligionID = eReligion;
				elseif (g_CurrentReligionID == eReligion) then
					-- Someone took the one we had selected.  Start over.
					Controls.ReligionPanel:SetHide(true);
					g_CurrentReligionID = nil;
					g_CurrentReligionName = nil;
					g_Beliefs = {};
				end
			end
		end
	end
	
	local numReligionButtons = 0;
	
	local religions = {};
	-- Refresh Religion Buttons
	for row in GameInfo.Religions("Type <> 'RELIGION_PANTHEON'") do
		
		local religion = {	
			ID = row.ID,
			Description = row.Description,
			PortraitIndex = row.PortraitIndex,
			IconAtlas = row.IconAtlas,
			ToolTip = Locale.Lookup(row.Description),
			Disabled = false,
		}
			
		if(g_CurrentReligionID == row.ID) then
			religion.Disabled = true;
		elseif(takenReligions[row.ID] ~= nil) then
			religion.Disabled = true;
			religion.ToolTip = Locale.Lookup("TXT_KEY_CHOOSE_RELIGION_ALREADY_FOUNDED", row.Description, takenReligions[row.ID]);
		end
		table.insert(religions, religion);
	end	
	
	table.sort(religions, function(a,b)
		return Locale.Compare(Locale.ConvertTextKey(a.Description), Locale.ConvertTextKey(b.Description)) < 0;
	end);
	
	-- Refresh Religion Buttons
	for i, religion in ipairs(religions) do
		local religionButton = g_ReligionButtonManager:GetInstance();
		religionButton.Button:SetToolTipString(religion.ToolTip);
		IconHookup(religion.PortraitIndex, 64, religion.IconAtlas, religionButton.Icon);
		
		religionButton.Button:SetDisabled(religion.Disabled);
		if religionButton.PreferenceIcon then
			local civType = GameInfo.Civilizations[pActivePlayer:GetCivilizationType()].Type
			for row in GameInfo.Civilization_Religions("CivilizationType = '" .. civType .. "'") do
				if religion.ID == GameInfoTypes[row.ReligionType] then
					religionButton.PreferenceIcon:SetHide(false)
					break
				end
			end
		end			
		if (g_bFoundingReligion) then
			religionButton.Button:RegisterCallback(Mouse.eLClick, function() SelectReligion(religion.ID, religion.Description, religion.IconAtlas, religion.PortraitIndex); end);
		else
			religionButton.Button:RegisterCallback(Mouse.eLClick, IgnoreLeftClick);		
		end
		
		numReligionButtons = numReligionButtons + 1;
	end	
		
	if(#religions > 13) then
		Controls.ReligionStack:SetAnchor("L,T");
	else
		Controls.ReligionStack:SetAnchor("C,T");
	end
	

	Controls.ReligionStack:CalculateSize();
	Controls.ReligionStack:ReprocessAnchoring();
	Controls.ReligionScrollPanel:CalculateInternalSize();	
end

function RefreshExistingBeliefs()
	local pPlayer = Players[Game.GetActivePlayer()];
	
	-- Reset some text, multiple players will come in here with different states
	Controls.PantheonBeliefName:LocalizeAndSetText("TXT_KEY_CHOOSE_RELIGION_PANTHEON_BELIEF");
	Controls.PantheonBeliefDescription:LocalizeAndSetText("TXT_KEY_CHOOSE_RELIGION_SELECT_PANTHEON_BELIEF");	
	
	Controls.FounderBeliefName:LocalizeAndSetText("TXT_KEY_CHOOSE_RELIGION_FOUNDER_BELIEF");
	Controls.FounderBeliefDescription:LocalizeAndSetText("TXT_KEY_CHOOSE_RELIGION_SELECT_FOUNDER_BELIEF");
		
	Controls.FollowerBeliefName:LocalizeAndSetText("TXT_KEY_CHOOSE_RELIGION_FOLLOWER_BELIEF");
	Controls.FollowerBeliefDescription:LocalizeAndSetText("TXT_KEY_CHOOSE_RELIGION_SELECT_FOLLOWER_BELIEF");	
		
	if userSettingRTPPietyBeliefMissionaries then
		Controls.BonusBeliefName:LocalizeAndSetText("TXT_KEY_CHOOSE_RELIGION_FOLLOWER_BELIEF2_MISSION");
		Controls.BonusBeliefDescription:LocalizeAndSetText("TXT_KEY_CHOOSE_RELIGION_SELECT_FOLLOWER_BELIEF2");	
	else
		Controls.BonusBeliefName:LocalizeAndSetText("TXT_KEY_CHOOSE_RELIGION_BONUS_BELIEF");
		Controls.BonusBeliefDescription:LocalizeAndSetText("TXT_KEY_CHOOSE_RELIGION_SELECT_BONUS_BELIEF");	
	end
	
	Controls.FollowerBelief2Name:LocalizeAndSetText("TXT_KEY_CHOOSE_RELIGION_FOLLOWER_BELIEF3")
	Controls.EnhancerBeliefName:LocalizeAndSetText("TXT_KEY_CHOOSE_RELIGION_SPREAD_BELIEF");
	
	if (pPlayer:HasCreatedReligion()) then
		local eReligion = pPlayer:GetReligionCreatedByPlayer();
		for i,v in ipairs(Game.GetBeliefsInReligion(eReligion)) do
			local belief = GameInfo.Beliefs[v];
			if(belief ~= nil) then
				if (belief.Reformation == false) then
					if (i == 1) then
						Controls.PantheonBeliefName:SetText(Locale.Lookup(belief.ShortDescription));
						Controls.PantheonBeliefDescription:SetText("[ICON_BULLET]" .. Locale.Lookup(belief.Description) .. ".");	
						g_Beliefs[1] = v;		
					elseif (i == 2) then
						Controls.FounderBeliefName:SetText(Locale.Lookup(belief.ShortDescription));
						Controls.FounderBeliefDescription:SetText("[ICON_BULLET]" .. Locale.Lookup(belief.Description) .. ".");	
						g_Beliefs[2] = v;							
					elseif (i == 3) then
						Controls.FollowerBeliefName:SetText(Locale.Lookup(belief.ShortDescription));
						Controls.FollowerBeliefDescription:SetText("[ICON_BULLET]" .. Locale.Lookup(belief.Description) .. ".");	
						g_Beliefs[3] = v;						
					elseif (i == 4) then
						Controls.BonusBeliefName:SetText(Locale.Lookup(belief.ShortDescription));
						Controls.BonusBeliefDescription:SetText("[ICON_BULLET]" .. Locale.Lookup(belief.Description) .. ".");	
						g_Beliefs[6] = v;
					end	
				end
			end
		end
		Controls.PantheonBeliefButton:RegisterCallback(Mouse.eLClick, IgnoreLeftClick);
		Controls.AlphaAnimPantheon:SetHide(true);
		Controls.FollowerBeliefButton:RegisterCallback(Mouse.eLClick, IgnoreLeftClick);
		Controls.AlphaAnimFollower:SetHide(true);
		Controls.FounderBeliefButton:RegisterCallback(Mouse.eLClick, IgnoreLeftClick);
        Controls.AlphaAnimFounder:SetHide(true);
		Controls.FollowerBelief2Button:RegisterCallback(Mouse.eLClick, OnFollowerBelief2Click);
		Controls.FollowerBelief2Description:LocalizeAndSetText("TXT_KEY_CHOOSE_RELIGION_SELECT_FOLLOWER_BELIEF2");
		Controls.FollowerBelief2Description:SetOffsetVal(24,25);
        Controls.AlphaAnimFollower2:SetHide(false);
        Controls.Follower2Lock:SetHide(true);
		Controls.EnhancerBeliefButton:RegisterCallback(Mouse.eLClick, OnEnhancerBeliefClick);
		Controls.EnhancerBeliefDescription:LocalizeAndSetText("TXT_KEY_CHOOSE_RELIGION_SELECT_SPREAD_BELIEF");
		Controls.EnhancerBeliefDescription:SetOffsetVal(24,25);
        Controls.AlphaAnimEnhancer:SetHide(false);
        Controls.EnhancerLock:SetHide(true);
	
	elseif (pPlayer:HasCreatedPantheon()) then
		local eBelief = pPlayer:GetBeliefInPantheon();
		local belief = GameInfo.Beliefs[eBelief];
		Controls.PantheonBeliefName:SetText(Locale.Lookup(belief.ShortDescription));
		Controls.PantheonBeliefDescription:SetText("[ICON_BULLET]" .. Locale.Lookup(belief.Description) .. ".");	
		g_Beliefs[1] = eBelief;		
	
		Controls.PantheonBeliefButton:RegisterCallback(Mouse.eLClick, IgnoreLeftClick);
		Controls.AlphaAnimPantheon:SetHide(true);
		Controls.FollowerBeliefButton:RegisterCallback(Mouse.eLClick, OnFollowerBeliefClick);
		Controls.AlphaAnimFollower:SetHide(false);
		Controls.FounderBeliefButton:RegisterCallback(Mouse.eLClick, OnFounderBeliefClick);
        Controls.AlphaAnimFounder:SetHide(false);
		Controls.FollowerBelief2Button:RegisterCallback(Mouse.eLClick, IgnoreLeftClick);
		Controls.FollowerBelief2Description:LocalizeAndSetText("TXT_KEY_CHOOSE_RELIGION_AVAILABLE_LATER");
		Controls.FollowerBelief2Description:SetOffsetVal(52,30);
        Controls.AlphaAnimFollower2:SetHide(true);
        Controls.Follower2Lock:SetHide(false);
		Controls.EnhancerBeliefButton:RegisterCallback(Mouse.eLClick, IgnoreLeftClick);
		Controls.EnhancerBeliefDescription:LocalizeAndSetText("TXT_KEY_CHOOSE_RELIGION_AVAILABLE_LATER");
		Controls.EnhancerBeliefDescription:SetOffsetVal(52,30);
        Controls.AlphaAnimEnhancer:SetHide(true);
        Controls.EnhancerLock:SetHide(false);
        
    -- Not even a pantheon
    else
		Controls.PantheonBeliefButton:RegisterCallback(Mouse.eLClick, OnPantheonBeliefClick);
		Controls.AlphaAnimPantheon:SetHide(false);
		Controls.FollowerBeliefButton:RegisterCallback(Mouse.eLClick, OnFollowerBeliefClick);
		Controls.AlphaAnimFollower:SetHide(false);
		Controls.FounderBeliefButton:RegisterCallback(Mouse.eLClick, OnFounderBeliefClick);
        Controls.AlphaAnimFounder:SetHide(false);
		Controls.FollowerBelief2Button:RegisterCallback(Mouse.eLClick, IgnoreLeftClick);
		Controls.FollowerBelief2Description:LocalizeAndSetText("TXT_KEY_CHOOSE_RELIGION_AVAILABLE_LATER");
		Controls.FollowerBelief2Description:SetOffsetVal(52,30);
        Controls.AlphaAnimFollower2:SetHide(true);
        Controls.Follower2Lock:SetHide(false);
		Controls.EnhancerBeliefButton:RegisterCallback(Mouse.eLClick, IgnoreLeftClick);
		Controls.EnhancerBeliefDescription:LocalizeAndSetText("TXT_KEY_CHOOSE_RELIGION_AVAILABLE_LATER");
		Controls.EnhancerBeliefDescription:SetOffsetVal(52,30);
        Controls.AlphaAnimEnhancer:SetHide(true);
        Controls.EnhancerLock:SetHide(false);
	end

	if (pPlayer:IsTraitBonusReligiousBelief()) or userSettingRTPPietyBeliefMissionaries then
		if (not pPlayer:HasCreatedReligion()) then
			Controls.BonusBeliefButton:RegisterCallback(Mouse.eLClick, OnBonusBeliefClick);
 			Controls.BonusBeliefDescription:LocalizeAndSetText("TXT_KEY_CHOOSE_RELIGION_SELECT_FOLLOWER_BELIEF2_PIETY");
			Controls.BonusBeliefDescription:SetOffsetVal(24,25);
            Controls.AlphaAnimBonus:SetHide(false);
			Controls.BonusLock:SetHide(true);
		else
 			Controls.BonusBeliefButton:RegisterCallback(Mouse.eLClick, IgnoreLeftClick);
			Controls.BonusBeliefDescription:SetOffsetVal(24,25);
            Controls.AlphaAnimBonus:SetHide(true);
			Controls.BonusLock:SetHide(true);
		end
	else
 		Controls.BonusBeliefButton:RegisterCallback(Mouse.eLClick, IgnoreLeftClick);
		Controls.BonusBeliefDescription:LocalizeAndSetText("TXT_KEY_CHOOSE_RELIGION_BYZANTINES_ONLY");
		Controls.BonusBeliefDescription:SetOffsetVal(52,30);
        Controls.AlphaAnimBonus:SetHide(true);
		Controls.BonusLock:SetHide(false);
	end
end

function SelectReligion(religionID, name, iconAtlas, portraitIndex)

	local pPlayer = Players[Game.GetActivePlayer()];

	g_CurrentReligionID = religionID;
	RefreshReligions();
	
	if (g_CurrentReligionID ~= nil) then		
		IconHookup(portraitIndex, 128, iconAtlas, Controls.ReligionTopIcon);

		Controls.LabelPleaseSelectAReligion:SetHide(true);
		g_CurrentReligionName = name;

		if (pPlayer:HasCreatedReligion()) then
			Controls.LabelReligionName:LocalizeAndSetText(name);
			Controls.LabelReligionName:RegisterCallback(Mouse.eLClick, IgnoreLeftClick);
			Controls.LabelReligionCustomise:RegisterCallback(Mouse.eLClick, IgnoreLeftClick);
			Controls.FoundReligion:LocalizeAndSetText("TXT_KEY_CHOOSE_RELIGION_OK_BUTTON_ENHANCE");
			Controls.FoundReligionHeading:LocalizeAndSetText("TXT_KEY_CHOOSE_RELIGION_TITLE_ENHANCE");
		else
			local label = Locale.Lookup("TXT_KEY_CHOOSE_RELIGION_NAME_LABEL", name);
			Controls.LabelReligionName:SetText(Locale.Lookup(name));
			Controls.LabelReligionName:RegisterCallback(Mouse.eLClick, ChangeReligionName);
			Controls.LabelReligionCustomise:RegisterCallback(Mouse.eLClick, ChangeReligionName);
			Controls.FoundReligion:LocalizeAndSetText("TXT_KEY_CHOOSE_RELIGION_OK_BUTTON");
			Controls.FoundReligionHeading:LocalizeAndSetText("TXT_KEY_CHOOSE_RELIGION_TITLE");			
		end
		
		local year = Game.GetGameTurnYear();
		local date;
		if(year < 0) then
			date = Locale.ConvertTextKey("TXT_KEY_TIME_BC", math.abs(year));
		else
			date = Locale.ConvertTextKey("TXT_KEY_TIME_AD", math.abs(year));
		end
		
		local foundedIn = Locale.Lookup("TXT_KEY_CHOOSE_RELIGION_FOUNDED_IN", date);
		Controls.LabelReligionFoundedIn:SetText(foundedIn);
		--if JFDLC_ProphetName[Game.GetActivePlayer()] then
			--Controls.LabelReligionFounder:LocalizeAndSetText(JFDLC_ProphetName[Game.GetActivePlayer()]); -- Depends on TSL
		--else
			Controls.LabelReligionFounder:SetHide(true)
		--end
		Controls.ReligionPanel:SetHide(false);
	end
end

-------------------------------------------------------------------------------------------------
function ChangeReligionName()

	Controls.NewName:LocalizeAndSetText(g_CurrentReligionName);
	Controls.ChangeNameError:SetHide(true);
	Controls.ChangeNamePopup:SetHide(false);
end

-------------------------------------------------------------------------------------------------
function SelectFromBeliefs(beliefs, selectFn)
	-- g_BeliefItemManager:ResetInstances();
	
	-- for i,v in ipairs(beliefs) do
		-- local itemInstance = g_BeliefItemManager:GetInstance();
		-- itemInstance.Name:SetText(v.Name);
		-- itemInstance.Description:SetText(v.Description);
		
		-- local gw,gh = itemInstance.AnimGrid:GetSizeVal();
		-- local dw,dh = itemInstance.Description:GetSizeVal();
		-- local bw,bh = itemInstance.Button:GetSizeVal();
		
		
		-- local newHeight = dh + 45;
		
		-- itemInstance.Button:SetSizeVal(bw, newHeight);
		-- itemInstance.AnimGrid:SetSizeVal(gw, newHeight + 5);
		
		-- itemInstance.Button:RegisterCallback(Mouse.eLClick, function() 
			-- selectFn(v);
			-- ToggleBeliefContext(nil);
		-- end);
	-- end
	
	-- Controls.BeliefStack:CalculateSize();
	-- Controls.BeliefStack:ReprocessAnchoring();
	-- Controls.BeliefScrollPanel:CalculateInternalSize();
	-- Controls.BeliefScrollPanel:SetScrollValue(0);
end

function CheckifCanCommit()
    local pPlayer = Players[Game.GetActivePlayer()];

    if(g_bFoundingReligion and g_Beliefs[1] ~= nil and g_Beliefs[2] ~= nil and g_Beliefs[3] ~= nil) then
    
		if (pPlayer:IsTraitBonusReligiousBelief()) or userSettingRTPPietyBeliefMissionaries then
			if (g_Beliefs[6] ~= nil) then
				Controls.FoundReligion:SetDisabled(false);
			else
				Controls.FoundReligion:SetDisabled(true);
			end
		else
			Controls.FoundReligion:SetDisabled(false);
		end
	elseif(g_Beliefs[4] ~= nil and g_Beliefs[5] ~= nil) then
		Controls.FoundReligion:SetDisabled(false);
	else
		Controls.FoundReligion:SetDisabled(true);
	end
end

function OnYes( )

	local pPlayer = Players[Game.GetActivePlayer()];
	
	Controls.ChooseConfirm:SetHide(true);
	
	local religion = GameInfo.Religions[g_CurrentReligionID];
	
	local customName = Locale.Lookup(g_CurrentReligionName);
	if(Locale.Lookup(religion.Description) == customName) then
		customName = nil;
	end
	
	if (g_bFoundingReligion) then
	
		local beliefsToSend = {};
		beliefsToSend[3] = BeliefTypes.NO_BELIEF;
		beliefsToSend[4] = BeliefTypes.NO_BELIEF;
		local iStoring = 1;
	
		if (not pPlayer:HasCreatedPantheon()) then
			beliefsToSend[iStoring] = g_Beliefs[1];
			iStoring = iStoring + 1;
		end

		beliefsToSend[iStoring] = g_Beliefs[2];
		iStoring = iStoring + 1;

		beliefsToSend[iStoring] = g_Beliefs[3];
		iStoring = iStoring + 1;

		if (pPlayer:IsTraitBonusReligiousBelief()) or userSettingRTPPietyBeliefMissionaries then
			beliefsToSend[iStoring] = g_Beliefs[6];
			iStoring = iStoring + 1;
		end
		
		Network.SendFoundReligion(Game.GetActivePlayer(), g_CurrentReligionID, customName, beliefsToSend[1], beliefsToSend[2], beliefsToSend[3], beliefsToSend[4], g_iCityX, g_iCityY);
	else
		Network.SendEnhanceReligion(Game.GetActivePlayer(), g_CurrentReligionID, customName, g_Beliefs[4], g_Beliefs[5], g_iCityX, g_iCityY);
	end
	Events.AudioPlay2DSound("AS2D_INTERFACE_POLICY");	
	
	OnClose();	
end
Controls.Yes:RegisterCallback( Mouse.eLClick, OnYes );

function OnNo( )
	Controls.ChooseConfirm:SetHide(true);
end
Controls.No:RegisterCallback( Mouse.eLClick, OnNo );


function OnChangeNameOK()

	local name = Controls.NewName:GetText();
	if(Locale.IsNilOrEmpty(name)) then
		Controls.ChangeNameError:LocalizeAndSetText("TXT_KEY_CHOOSE_RELIGION_ERROR_NAME_EMPTY");
		Controls.ChangeNameError:SetHide(false);
	else
		Controls.ChangeNameError:SetHide(true);
		
		g_CurrentReligionName = name;
		local label = Locale.Lookup("TXT_KEY_CHOOSE_RELIGION_NAME_LABEL", g_CurrentReligionName);
		Controls.LabelReligionName:SetText(g_CurrentReligionName);
		Controls.ChangeNamePopup:SetHide(true);
	end
end
Controls.ChangeNameOKButton:RegisterCallback(Mouse.eLClick, OnChangeNameOK);

function OnChangeNameDefault()
	local defaultName = Locale.Lookup(GameInfo.Religions[g_CurrentReligionID].Description);
	Controls.NewName:SetText(defaultName);
	Controls.ChangeNameError:SetHide(true);
end
Controls.ChangeNameDefaultButton:RegisterCallback(Mouse.eLClick, OnChangeNameDefault);

function OnChangeNameCancel()
	Controls.ChangeNamePopup:SetHide(true);
end
Controls.ChangeNameCancelButton:RegisterCallback(Mouse.eLClick, OnChangeNameCancel);

function FoundReligion()
    local t;
    if (g_bFoundingReligion) then
		t = Locale.Lookup("TXT_KEY_CHOOSE_RELIGION_CONFIRM", g_CurrentReligionName);
	else
		t = Locale.Lookup("TXT_KEY_CHOOSE_RELIGION_CONFIRM_ENHANCE", g_CurrentReligionName);
	end
	Controls.LabelConfirmFoundReligion:SetText(t);
	Controls.ChooseConfirm:SetHide(false);
end
Controls.FoundReligion:RegisterCallback(Mouse.eLClick, FoundReligion);

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function ShowHideHandler( bIsHide, bInitState )
    if( not bInitState ) then
        if( not bIsHide ) then
        	UI.incTurnTimerSemaphore();
        	Events.SerialEventGameMessagePopupShown(g_PopupInfo);

        	RefreshReligions();
        	RefreshExistingBeliefs();
        	    	
			if (g_CurrentReligionID ~= nil) then
				local religionRow = GameInfo.Religions[g_CurrentReligionID];
				SelectReligion(g_CurrentReligionID, Game.GetReligionName(g_CurrentReligionID), religionRow.IconAtlas, religionRow.PortraitIndex);
			else
				Controls.LabelPleaseSelectAReligion:SetHide(false);
			end

        	CheckifCanCommit();
        	
        	ToggleBeliefContext(nil);
        else
			if(g_PopupInfo ~= nil) then
				Events.SerialEventGameMessagePopupProcessed.CallImmediate(g_PopupInfo.Type, 0);
			end
            UI.decTurnTimerSemaphore();
        end
    end
end
ContextPtr:SetShowHideHandler( ShowHideHandler );

-------------------------------------------------------------------------------------------------
-- Choose Belief Popup
-------------------------------------------------------------------------------------------------
-- Used for Piano Keys
local ltBlue = {19/255,32/255,46/255,120/255};
local dkBlue = {12/255,22/255,30/255,120/255};

local g_ItemManager = InstanceManager:new( "ItemInstance", "Button", Controls.ItemStack );
local bHidden = true;

local screenSizeX, screenSizeY = UIManager:GetScreenSizeVal()
local spWidth, spHeight = Controls.ItemScrollPanel:GetSizeVal();

-- Original UI designed at 1050px 
local heightOffset = screenSizeY - 1020;

spHeight = spHeight + heightOffset;
Controls.ItemScrollPanel:SetSizeVal(spWidth, spHeight); 
Controls.ItemScrollPanel:CalculateInternalSize();
Controls.ItemScrollPanel:ReprocessAnchoring();

local g_player = Players[Game.GetActivePlayer()]
local bpWidth, bpHeight = Controls.BottomPanel:GetSizeVal();
bpHeight = bpHeight + heightOffset 

Controls.BottomPanel:SetSizeVal(bpWidth, bpHeight);
Controls.BottomPanel:ReprocessAnchoring();

local g_BeliefType = "Pantheon"
local g_BeliefTitles = {}
	  g_BeliefTitles["Pantheon"] 		    = "TXT_KEY_CHOOSE_PANTHEON_TITLE"
	  g_BeliefTitles["Founder"] 		    = "TXT_KEY_CHOOSE_FOUNDER_TITLE"
	  g_BeliefTitles["Follower"] 		    = "TXT_KEY_CHOOSE_FOLLOWER_TITLE"
	  g_BeliefTitles["RequiresEnhancement"] = "TXT_KEY_CHOOSE_FOLLOWER_TITLE"
	  g_BeliefTitles["Enhancer"] 		    = "TXT_KEY_CHOOSE_ENHANCER_TITLE"
	  g_BeliefTitles["Bonus"] 			    = "TXT_KEY_CHOOSE_FOLLOWER_TITLE"

function OnChooseBeliefPopup(beliefType)
	g_BeliefType = beliefType
	Controls.BottomPanel:SetHide(false)
	Controls.BottomLeft:SetHide(false)
	Controls.TopPanel:SetHide(false)
	Controls.TopCorner:SetHide(false)
	Controls.IGE_LeftDecor:SetTexture("LeftPortraitDecor128.dds");
	Controls.CivIcon:SetTexture("CivSymbolsColor512.dds");
	if g_player:GetReligionCreatedByPlayer() > 0 then
		Controls.IGE_LeftDecorImage:SetTexture("notificationenhancereligion128.dds");
	else
		Controls.IGE_LeftDecorImage:SetTexture("notificationreligion128.dds");
	end
	Controls.ChooseBeliefTitle:LocalizeAndSetText(g_BeliefTitles[g_BeliefType])
	if beliefType == "Founder" then
		LuaEvents.JFD_Tutorial_PushTutorialPopup(Game.GetActivePlayer(), "IsOnChooseBeliefPopupFounder")
	end
	RefreshList()
end

function OnBack()
	Controls.BottomPanel:SetHide(true)
	Controls.BottomLeft:SetHide(true)
	Controls.TopPanel:SetHide(true)
	Controls.TopCorner:SetHide(true)
end
Controls.BackButton:RegisterCallback( Mouse.eLClick, OnBack );


-------------------------------------------------------------------------------------------------
function RefreshList(searchString)
	g_ItemManager:ResetInstances();
	local pPlayer = g_player;
	CivIconHookup( pPlayer:GetID(), 64, Controls.CivIcon, Controls.CivIconBG, Controls.CivIconShadow, false, true );
	
	local availableBeliefs = {};
	for row in GameInfo.Beliefs(g_BeliefType .. " = 1") do
		if ((g_BeliefType == "Follower" and (not row.Bonus)) or g_BeliefType ~= "Follower") and (((row.RequiresFounding and pPlayer:GetReligionCreatedByPlayer() < 0) or (row.RequiresEnhancement and pPlayer:GetReligionCreatedByPlayer() > 0)) 
		or (not row.RequiresFounding and (not row.RequiresEnhancement))) then
			local belief = GameInfo.Beliefs[row.ID];
			local helpText = nil
			if row.RequiresEnhancement then
				for row in GameInfo.Belief_BuildingClassFaithPurchase("BeliefType = '" .. row.Type .. "'") do
					helpText = GetHelpTextForBuilding(pPlayer:GetSpecificBuildingType(row.BuildingClassType), false, false, false, nil, false)
					break
				end
			end
			local isBeliefFiltered = false
			if searchString then
				isBeliefFiltered = true
				if string.find(Locale.ToLower(belief.ShortDescription), searchString) or string.find(Locale.ToLower(belief.Description), searchString) then
					isBeliefFiltered = false
				end
			end
			local isTaken = Game.AnyoneHasBelief(row.ID)
			-- if row.Bonus then isTaken = false end
			if (not isBeliefFiltered) then
				if(belief ~= nil) then
					table.insert(availableBeliefs, {
						ID = row.ID,
						Name = Locale.Lookup(row.ShortDescription),
						Description = Locale.Lookup(row.Description),
						Help = helpText,
						IsTaken = isTaken
					});
				end
			end
		end
	end
		
	-- Sort beliefs by their description.
	table.sort(availableBeliefs, function(a,b) return Locale.Compare(a.Name, b.Name) < 0; end);
	
	local bTickTock = false;
	for i, belief in ipairs(availableBeliefs) do
		local itemInstance = g_ItemManager:GetInstance();
		itemInstance.Name:SetText(belief.Name);
		--itemInstance.Button:SetToolTipString(belief.Description);
		itemInstance.Description:SetText("[ICON_BULLET]" .. belief.Description .. ".");
		if belief.Help then
			itemInstance.Button:SetToolTipString(belief.Help)
		else
			itemInstance.Button:SetToolTipString(nil)
		end
		
		itemInstance.Button:RegisterCallback(Mouse.eLClick, function() SelectBelief(belief, g_BeliefType); end);
	
		if(bTickTock == false) then
			itemInstance.Box:SetColorVal(unpack(ltBlue));
		else
			itemInstance.Box:SetColorVal(unpack(dkBlue));
		end
		
		local buttonWidth, buttonHeight = itemInstance.Button:GetSizeVal();
		local descWidth, descHeight = itemInstance.Description:GetSizeVal();
		
		local newHeight = descHeight + 40;	
	
		
		itemInstance.Button:SetSizeVal(buttonWidth, newHeight);
		itemInstance.Box:SetSizeVal(buttonWidth + 20, newHeight);
		itemInstance.BounceAnim:SetSizeVal(buttonWidth + 20, newHeight + 5);
		itemInstance.BounceGrid:SetSizeVal(buttonWidth + 20, newHeight + 5);
		if belief.IsTaken then
			local civName = "TXT_KEY_CHOOSE_BELIEF_LOCK_TT_UNMET"
			for playerID = 0, GameDefines.MAX_PLAYERS - 1 do
				local player = Players[playerID]
				if (player:HasBelief(belief.ID) and Teams[Game.GetActiveTeam()]:IsHasMet(player:GetTeam())) then
					civName = player:GetCivilizationShortDescription()
					break
				end
			end
			itemInstance.Button:SetDisabled(true)
			itemInstance.Button:LocalizeAndSetToolTip("TXT_KEY_CHOOSE_BELIEF_LOCK_TT", civName)
			itemInstance.Name:SetAlpha(0.2)
			itemInstance.Description:SetAlpha(0.2)
			itemInstance.Lock:SetHide(false)
		else
			itemInstance.Button:SetDisabled(false)
			itemInstance.Button:LocalizeAndSetToolTip("")
			itemInstance.Name:SetAlpha(1)
			itemInstance.Description:SetAlpha(1)
			itemInstance.Lock:SetHide(true)
		end
				
		bTickTock = not bTickTock;
	end
	
	Controls.ItemStack:CalculateSize();
	Controls.ItemStack:ReprocessAnchoring();
	Controls.ItemScrollPanel:CalculateInternalSize();
end
-------------------------------------------------------------------------------------------------
function SelectBelief(belief, g_BeliefType) 	
	if g_BeliefType == "Founder" or g_HasChosenEternalSky then
		Controls.FounderBeliefName:SetText(belief.Name);
		Controls.FounderBeliefDescription:SetText("[ICON_BULLET]" .. belief.Description .. ".");
		g_Beliefs[2] = belief.ID;
	elseif g_BeliefType == "Follower" then
		Controls.FollowerBeliefName:SetText(belief.Name);
		Controls.FollowerBeliefDescription:SetText("[ICON_BULLET]" .. belief.Description .. ".");
		g_Beliefs[3] = belief.ID;
	elseif g_BeliefType == "RequiresEnhancement" then
		Controls.FollowerBelief2Name:SetText(belief.Name);
		Controls.FollowerBelief2Description:SetText("[ICON_BULLET]" .. belief.Description .. ".");
		g_Beliefs[4] = belief.ID;
	elseif g_BeliefType == "Enhancer" then
		Controls.EnhancerBeliefName:SetText(belief.Name);
		Controls.EnhancerBeliefDescription:SetText("[ICON_BULLET]" .. belief.Description .. ".");
		g_Beliefs[5] = belief.ID;
	elseif g_BeliefType == "Bonus" then
		Controls.BonusBeliefName:SetText(belief.Name);
		Controls.BonusBeliefDescription:SetText("[ICON_BULLET]" .. belief.Description .. ".");
		g_Beliefs[6] = belief.ID;
	else
		Controls.PantheonBeliefName:SetText(belief.Name);
		Controls.PantheonBeliefDescription:SetText("[ICON_BULLET]" .. belief.Description .. ".");
		g_Beliefs[1] = belief.ID;
	end
	CheckifCanCommit();
	OnBack()
end	

-------------------------------------------------------------------------------------------------

function ValidateText(text)

	if #text < 3 then
		return false;
	end

	local isAllWhiteSpace = true;
	local numNonWhiteSpace = 0;
	for i = 1, #text, 1 do
		if string.byte(text, i) ~= 32 then
			isAllWhiteSpace = false;
			numNonWhiteSpace = numNonWhiteSpace + 1;
		end
	end

	if isAllWhiteSpace then
		return false;
	end

	if numNonWhiteSpace < 3 then
		return false;
	end

	-- don't allow % character
	for i = 1, #text, 1 do
		if string.byte(text, i) == 37 then
			return false;
		end
	end

	local invalidCharArray = { '\"', '<', '>', '|', '\b', '\0', '\t', '\n', '/', '\\', '*', '?', '%[', ']' };

	for i, ch in ipairs(invalidCharArray) do
		if string.find(text, ch) ~= nil then
			return false;
		end
	end

	-- don't allow control characters
	for i = 1, #text, 1 do
		if string.byte(text, i) < 32 then
			return false;
		end
	end

	return true;
end

function OnSearchButtonClicked()
	UIManager:SetUICursor( 1 );
	local searchString = Controls.SearchEditBox:GetText();
	local lowerCaseSearchString = Locale.ToLower(searchString);
	if searchString ~= nil and searchString ~= "" and ValidateText(searchString) then
		RefreshList(Locale.ToLower(searchString))
	else
		RefreshList(nil)
	end
	UIManager:SetUICursor( 0 );
end
Controls.SearchButton:RegisterCallback( Mouse.eLClick, OnSearchButtonClicked );

function OnSearchButtonCleared()
	RefreshList(nil)
	UIManager:SetUICursor( 0 );
	Controls.SearchEditBox:SetText("");
end
Controls.SearchButton:RegisterCallback( Mouse.eRClick, OnSearchButtonCleared );


function OnSearchTextEnter( dummyString, dummyControl )
	OnSearchButtonClicked();
end
Controls.SearchEditBox:RegisterCallback( OnSearchTextEnter );

-------------------------------------------------------------------------------------------------
function OnActivePlayerChanged()
	Controls.ReligionPanel:SetHide(true);
	g_CurrentReligionID = nil;
	g_CurrentReligionName = nil;
	g_Beliefs = {};
	if (not Controls.ChooseConfirm:IsHidden()) then
		Controls.ChooseConfirm:SetHide(true);
	end
	OnClose();
end
