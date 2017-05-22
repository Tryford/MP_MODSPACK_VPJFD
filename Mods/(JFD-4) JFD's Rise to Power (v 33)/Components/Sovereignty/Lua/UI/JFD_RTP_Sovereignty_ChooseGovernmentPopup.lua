--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_RTPUtils.lua");
include("JFD_RTP_SovereigntyUtils.lua");
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
-- Pedia Callback: Adapted from EUI
-------------------------------------------------

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
-- Choose Government Popup
-------------------------------------------------

include( "IconSupport" );
include( "InstanceManager" );
include( "CommonBehaviors" );

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

local bpWidth, bpHeight = Controls.BottomPanel:GetSizeVal();
--bpHeight = bpHeight * heightRatio;
bpHeight = bpHeight + heightOffset 

Controls.BottomPanel:SetSizeVal(bpWidth, bpHeight);
Controls.BottomPanel:ReprocessAnchoring();

local g_PopupInfo = nil;

ButtonPopupTypes.BUTTONPOPUP_CHOOSE_JFD_GOVERNMENT = "BUTTONPOPUP_CHOOSE_JFD_GOVERNMENT"
g_PopupInfo = {["Type"] = ButtonPopupTypes.BUTTONPOPUP_CHOOSE_JFD_GOVERNMENT}

g_IsChangingGovernment = false
-------------------------------------------------
-------------------------------------------------
function OnPopupMessage(popupInfo)
	  
	local popupType = popupInfo.Type;
	
	g_iUnitIndex = popupInfo.Data2;
	
	if popupType ~= ButtonPopupTypes.BUTTONPOPUP_CHOOSE_JFD_GOVERNMENT then
		return;
	end	
	
	g_PopupInfo = popupInfo;
	
   	UIManager:QueuePopup( ContextPtr, PopupPriority.SocialPolicy );
end
Events.SerialEventGameMessagePopup.Add( OnPopupMessage );

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function InputHandler( uiMsg, wParam, lParam )
    ----------------------------------------------------------------        
    -- Key Down Processing
    ----------------------------------------------------------------        
    if uiMsg == KeyEvents.KeyDown then
        if (wParam == Keys.VK_ESCAPE) then
			-- if(not Controls.ViewTenetsPopup:IsHidden()) then
				-- Controls.ViewTenetsPopup:SetHide(true);
			-- elseif(not Controls.ChooseConfirm:IsHidden()) then
				-- Controls.ChooseConfirm:SetHide(true);
			-- else
				OnClose();
			-- end
        	return true;
        end
    end
end
ContextPtr:SetInputHandler( InputHandler );

-- JFD_ShowChooseGovernmentPopup
function JFD_ShowChooseGovernmentPopup(isChanging)
	g_IsChangingGovernment = isChanging
	UIManager:QueuePopup(ContextPtr, PopupPriority.SocialPolicy)
end 
LuaEvents.JFD_RTP_Sovereignty_ShowChooseGovernmentPopup.Add(JFD_ShowChooseGovernmentPopup)
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnClose()
    UIManager:DequeuePopup(ContextPtr);
end
Controls.CloseButton:RegisterCallback( Mouse.eLClick, OnClose );
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function RefreshList()
	g_ItemManager:ResetInstances();
		
	local pPlayer = Players[Game.GetActivePlayer()];
	CivIconHookup( pPlayer:GetID(), 64, Controls.CivIcon, Controls.CivIconBG, Controls.CivIconShadow, false, true );
	   
	local activePlayerTeam = Teams[pPlayer:GetTeam()];
			
	local tick = true;
	for government in GameInfo.JFD_Governments("IsDisabled = 0") do
		local governmentType = government.Type;
		local governmentID = government.ID;
		local governmentHelp = government.Help
		local itemInstance = g_ItemManager:GetInstance();
		itemInstance.Name:LocalizeAndSetText(government.Description);
		itemInstance.Help:LocalizeAndSetText(government.Help);
		
		itemInstance.Button:RegisterCallback(Mouse.eLClick, function() SelectGovernmentChoice(governmentID); end);
		local pediaEntry = CivilopediaControl and (government.Civilopedia)
		if (pediaEntry and (not setDisabled)) then
			itemInstance.Button:RegisterCallback(Mouse.eRClick, function() getPedia(pediaEntry) end)
		end
		
		local color = tick and ltBlue or dkBlue;
		tick = not tick;
		
		itemInstance.Box:SetColorVal(unpack(color));
		
		itemInstance.Button:SetAlpha(1)
		itemInstance.Button:SetDisabled(false)
		if g_IsChangingGovernment then
			governmentHelp = governmentHelp .. "_CHANGE"
			if governmentID == pPlayer:GetGovernment() then
				itemInstance.Button:SetHide(true)
			end
		end
		local reqBuilding = government.RequiresBuilding
		if reqBuilding and (not pPlayer:HasBuilding(GameInfoTypes[reqBuilding])) then
			itemInstance.Button:SetAlpha(0.5)
			itemInstance.Button:SetDisabled(true)
			itemInstance.Help:SetText(Locale.ConvertTextKey(governmentHelp) .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_JFD_CHOOSE_GOVERNMENT_REQUIRES_BUILDING"));
		end
		if government.RequiresIdeology then
			if pPlayer:GetLateGamePolicyTree() < 0 then
				itemInstance.Button:SetAlpha(0.5)
				itemInstance.Button:SetDisabled(true)
				itemInstance.Help:SetText(Locale.ConvertTextKey(governmentHelp) .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_JFD_CHOOSE_GOVERNMENT_REQUIRES_IDEOLOGY"));
			end
		end
		if government.RequiresReligion then
			if (pPlayer:GetReligionCreatedByPlayer() < 0 or pPlayer:GetStateReligion() ~= pPlayer:GetReligionCreatedByPlayer() or (not pPlayer:HasStateReligion())) then
				itemInstance.Button:SetAlpha(0.5)
				itemInstance.Button:SetDisabled(true)
				itemInstance.Help:SetText(Locale.ConvertTextKey(governmentHelp) .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_JFD_CHOOSE_GOVERNMENT_REQUIRES_RELIGION"));
			end
		end
		if (not itemInstance.Button:IsDisabled()) then
			itemInstance.Help:SetText(Locale.ConvertTextKey(governmentHelp) .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_JFD_CHOOSE_GOVERNMENT_PEDIA"));
		end
		local buttonWidth, buttonHeight = itemInstance.GovernmentStack:GetSizeVal();
		local newHeight = buttonHeight;	
		
		if government.ChoiceImage then
			itemInstance.GovernmentImage:SetTexture(government.ChoiceImage);
			--itemInstance.GovernmentImage:SetTextureOffsetVal(government.ImageOffsetX, government.ImageOffsetY);

			local governmentImageWidth, governmentImageHeight = itemInstance.GovernmentImage:GetSizeVal();
			itemInstance.GovernmentImage:SetSizeVal(governmentImageWidth, newHeight+5);
			itemInstance.GovernmentImage:SetTextureSizeVal(governmentImageWidth, newHeight+5);
			itemInstance.GovernmentImage:NormalizeTexture();
		end
		itemInstance.Button:SetSizeVal(buttonWidth, newHeight);
		itemInstance.BounceAnim:SetSizeVal(buttonWidth, newHeight);
		itemInstance.Box:SetSizeVal(buttonWidth, newHeight);
		
		itemInstance.BounceAnim:SetSizeVal(buttonWidth, newHeight + 5);
		itemInstance.BounceGrid:SetSizeVal(buttonWidth, newHeight + 5);
	end
	
	Controls.ItemStack:CalculateSize();
	Controls.ItemStack:ReprocessAnchoring();
	Controls.ItemScrollPanel:CalculateInternalSize();
end

function SelectGovernmentChoice(iChoice) 
	g_iChoice = iChoice;
	
	local government = GameInfo.JFD_Governments[iChoice];
	Controls.ConfirmText:LocalizeAndSetText("TXT_KEY_CHOOSE_JFD_GOVERNMENT_CONFIRM", government.Description); 
	Controls.ChooseConfirm:SetHide(false);
end

function OnConfirmYes( )
	Controls.ChooseConfirm:SetHide(true);
	Players[Game.GetActivePlayer()]:SetGovernment(g_iChoice)
	Events.AudioPlay2DSound("AS2D_INTERFACE_POLICY");	
	OnClose();
	Events.SerialEventEndTurnDirty()
	LuaEvents.JFD_RTP_Sovereignty_ShowGovernmentOverview()
end
Controls.ConfirmYes:RegisterCallback( Mouse.eLClick, OnConfirmYes );

function OnConfirmNo( )
	Controls.ChooseConfirm:SetHide(true);
end
Controls.ConfirmNo:RegisterCallback( Mouse.eLClick, OnConfirmNo );


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

function OnDirty()
	-- If the user performed any action that changes selection states, just close this UI.
	if not bHidden then
		OnClose();
	end
end
Events.UnitSelectionChanged.Add( OnDirty );

UIManager:QueuePopup(ContextPtr, PopupPriority.SocialPolicy)
UIManager:DequeuePopup(ContextPtr)