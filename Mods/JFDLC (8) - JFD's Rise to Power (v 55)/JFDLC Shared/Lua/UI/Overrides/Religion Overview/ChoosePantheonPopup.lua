
-------------------------------------------------
-- Choose Pantheon Popup
-------------------------------------------------

include( "IconSupport" );
include( "InstanceManager" );

-- Used for Piano Keys
local ltBlue = {19/255,32/255,46/255,120/255};
local dkBlue = {12/255,22/255,30/255,120/255};

local g_ItemManager = InstanceManager:new( "ItemInstance", "Button", Controls.ItemStack );
local bHidden = true;
local g_bPantheons = true;

local screenSizeX, screenSizeY = UIManager:GetScreenSizeVal()
local spWidth, spHeight = Controls.ItemScrollPanel:GetSizeVal();

-- Original UI designed at 1050px 
local heightOffset = screenSizeY - 1020;

spHeight = spHeight + heightOffset;
Controls.ItemScrollPanel:SetSizeVal(spWidth, spHeight); 
Controls.ItemScrollPanel:CalculateInternalSize();
Controls.ItemScrollPanel:ReprocessAnchoring();

local bpWidth, bpHeight = Controls.BottomPanel:GetSizeVal();
--bpHeight = bpHeight * heightRatio;
print(heightOffset);
print(bpHeight);
bpHeight = bpHeight + heightOffset 
print(bpHeight);

Controls.BottomPanel:SetSizeVal(bpWidth, bpHeight);
Controls.BottomPanel:ReprocessAnchoring();
-------------------------------------------------
-------------------------------------------------
function OnPopupMessage(popupInfo)
	
	local popupType = popupInfo.Type;
	if popupType ~= ButtonPopupTypes.BUTTONPOPUP_FOUND_PANTHEON then
		return;
	end
	
	g_PopupInfo = popupInfo;
	g_bPantheons = popupInfo.Data2;

   	UIManager:QueuePopup( ContextPtr, PopupPriority.SocialPolicy );
end
Events.SerialEventGameMessagePopup.Add( OnPopupMessage );
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnClose()
    UIManager:DequeuePopup(ContextPtr);
end
Controls.CloseButton:RegisterCallback( Mouse.eLClick, OnClose );

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function InputHandler( uiMsg, wParam, lParam )
    if uiMsg == KeyEvents.KeyDown then
        if (wParam == Keys.VK_ESCAPE) then
			if(Controls.ChooseConfirm:IsHidden())then
	            OnClose();
	        else
				Controls.ChooseConfirm:SetHide(true);
           	end
			return true;
        elseif (wParam == Keys.VK_RETURN or wParam == Keys.VK_ESCAPE) then
			OnSearchButtonClicked()
		end
    end
end
ContextPtr:SetInputHandler( InputHandler );

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function RefreshList(searchString)
	g_ItemManager:ResetInstances();
	local pPlayer = Players[Game.GetActivePlayer()];
	CivIconHookup( pPlayer:GetID(), 64, Controls.CivIcon, Controls.CivIconBG, Controls.CivIconShadow, false, true );
	
	local availableBeliefs = {};
	
	if (g_bPantheons > 0) then	
		Controls.PanelIcon:SetTexture("NotificationPantheon128.dds");	
		Controls.PanelTitle:LocalizeAndSetText("TXT_KEY_CHOOSE_PANTHEON_TITLE");
		for row in GameInfo.Beliefs("Pantheon = 1") do
			-- for i,v in ipairs(Game.GetAvailablePantheonBeliefs()) do
			local belief = GameInfo.Beliefs[row.ID];
			local isBeliefFiltered = false
			if searchString then
				isBeliefFiltered = true
				if string.find(Locale.ToLower(belief.ShortDescription), searchString) or string.find(Locale.ToLower(belief.Description), searchString) then
					isBeliefFiltered = false
				end
			end
			if (not isBeliefFiltered) then
				if(belief ~= nil) then
					table.insert(availableBeliefs, {
						ID = row.ID,
						Name = Locale.Lookup(row.ShortDescription),
						Description = Locale.Lookup(row.Description),
						IsTaken = Game.AnyoneHasBelief(row.ID)
					});
				end
			end
		end
	else
		Controls.PanelIcon:SetTexture("notificationenhancereligion128.dds");
		Controls.PanelTitle:LocalizeAndSetText("TXT_KEY_CHOOSE_REFORMATION_BELIEF_TITLE");
		for row in GameInfo.Beliefs("Reformation = 1") do
		-- for i,v in ipairs(Game.GetAvailableReformationBeliefs()) do
			local belief = GameInfo.Beliefs[row.ID];
			local isBeliefFiltered = false
			if searchString then
				isBeliefFiltered = true
				if string.find(Locale.ToLower(belief.ShortDescription), searchString) or string.find(Locale.ToLower(belief.Description), searchString) then
					isBeliefFiltered = false
				end
			end
			if (not isBeliefFiltered) then
				if(belief ~= nil) then
					table.insert(availableBeliefs, {
						ID = row.ID,
						Name = Locale.Lookup(row.ShortDescription),
						Description = Locale.Lookup(row.Description),
						IsTaken = Game.AnyoneHasBelief(row.ID)
					});
				end
			end
		end		
	end

	-- Sort beliefs by their description.
	table.sort(availableBeliefs, function(a,b) return Locale.Compare(a.Name, b.Name) < 0; end);
	
	local bTickTock = false;
	for i, pantheon in ipairs(availableBeliefs) do
		local itemInstance = g_ItemManager:GetInstance();
		itemInstance.Name:SetText(pantheon.Name);
		--itemInstance.Button:SetToolTipString(pantheon.Description);
		itemInstance.Description:SetText("[ICON_BULLET]" .. pantheon.Description .. ".");
		
		itemInstance.Button:RegisterCallback(Mouse.eLClick, function() SelectPantheon(pantheon.ID); end);
	
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
		if pantheon.IsTaken then
			local civName = "TXT_KEY_CHOOSE_BELIEF_LOCK_TT_UNMET"
			for playerID = 0, GameDefines.MAX_PLAYERS - 1 do
				local player = Players[playerID]
				if (player:HasBelief(pantheon.ID) and Teams[Game.GetActiveTeam()]:IsHasMet(player:GetTeam())) then
					civName = player:GetCivilizationShortDescription()
					break
				end
			end
			itemInstance.Button:SetDisabled(true)
			itemInstance.Button:LocalizeAndSetToolTip("TXT_KEY_CHOOSE_BELIEF_LOCK_TT", civName)
			itemInstance.Name:SetAlpha(0.2)
			itemInstance.Description:SetAlpha(0.2)
			itemInstance.Lock:SetHide(false)
		end
				
		bTickTock = not bTickTock;
	end
	
	Controls.ItemStack:CalculateSize();
	Controls.ItemStack:ReprocessAnchoring();
	Controls.ItemScrollPanel:CalculateInternalSize();
end

function SelectPantheon(beliefID) 
	g_BeliefID = beliefID;
	local belief = GameInfo.Beliefs[beliefID];
	Controls.ConfirmText:LocalizeAndSetText("TXT_KEY_CONFIRM_PANTHEON", belief.ShortDescription);
	Controls.ChooseConfirm:SetHide(false);
end

function OnYes( )
	Controls.ChooseConfirm:SetHide(true);
	
	Network.SendFoundPantheon(Game.GetActivePlayer(), g_BeliefID);
	Events.AudioPlay2DSound("AS2D_INTERFACE_POLICY");	
	
	OnClose();	
end
Controls.Yes:RegisterCallback( Mouse.eLClick, OnYes );

function OnNo( )
	Controls.ChooseConfirm:SetHide(true);
end
Controls.No:RegisterCallback( Mouse.eLClick, OnNo );


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function ShowHideHandler( bIsHide, bInitState )

	bHidden = bIsHide;
    if( not bInitState ) then
        if( not bIsHide ) then
        	UI.incTurnTimerSemaphore();
        	Events.SerialEventGameMessagePopupShown(g_PopupInfo);
        	
        	RefreshList();
        
			local unitPanel = ContextPtr:LookUpControl( "/InGame/WorldView/UnitPanel/Base" );
			if( unitPanel ~= nil ) then
				unitPanel:SetHide( true );
			end
			
			local infoCorner = ContextPtr:LookUpControl( "/InGame/WorldView/InfoCorner" );
			if( infoCorner ~= nil ) then
				infoCorner:SetHide( true );
			end
               	
        else
      
			local unitPanel = ContextPtr:LookUpControl( "/InGame/WorldView/UnitPanel/Base" );
			if( unitPanel ~= nil ) then
				unitPanel:SetHide(false);
			end
			
			local infoCorner = ContextPtr:LookUpControl( "/InGame/WorldView/InfoCorner" );
			if( infoCorner ~= nil ) then
				infoCorner:SetHide(false);
			end
			
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
	if (not Controls.ChooseConfirm:IsHidden()) then
		Controls.ChooseConfirm:SetHide(true);
    end
end
Events.GameplaySetActivePlayer.Add(OnActivePlayerChanged);

function OnDirty()
	-- If the user performed any action that changes selection states, just close this UI.
	if not bHidden then
		OnClose();
	end
end
Events.UnitSelectionChanged.Add( OnDirty );

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
