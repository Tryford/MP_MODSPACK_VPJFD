-------------------------------------------------
-- Advisor button
-------------------------------------------------
include("FLuaVector.lua")
local bModal = false;


g_TutorialQueue = {};	-- Queue of Advisor Messages!
g_CustomTutorialQueue = {};	-- Queue of Advisor Messages!
local g_CustomTutorialQueueNum = 0	-- Queue of Advisor Messages!
local g_CurrentCustomAdviceID = nil
local g_DontShowAdvice = false
-------------------------------------------------
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
-------------------------------------------------
function OnAdvisorButton( button )
    if( button == Mouse.eLClick ) then
        if(not  IsAdvisorDisplayOpen() ) then
    		-- this should be reconsidered        		
			local popupInfo = {
				Type = ButtonPopupTypes.BUTTONPOPUP_ADVISOR_COUNSEL,
			}
			Events.SerialEventGameMessagePopup(popupInfo);
    		
    	end
    else
    	AdvisorClose();
    end
end
LuaEvents.AdvisorButtonEvent.Add( OnAdvisorButton );


function AdvisorOpen()
	-- UIManager:QueuePopup( ContextPtr, PopupPriority.SocialPolicy );
	ContextPtr:SetHide(false);
end

function AdvisorClose()

	if(g_TutorialQueue[1] ~= nil and Controls.DontShowAgainCheckbox:IsChecked()) then
		UI.SetAdvisorMessageHasBeenSeen(g_TutorialQueue[1].IDName, true);
	end
	
	table.remove(g_TutorialQueue, 1);
	ContextPtr:SetHide(true);
	 -- UIManager:DequeuePopup( ContextPtr );
	if (bModal) then
		print("Popping Advisor UI");
		UIManager:PopModal(ContextPtr);
	end
end

function IsAdvisorDisplayOpen()
	return (not Controls.AdvisorDisplayFront:IsHidden());
end

function HideAllAdvisors ()
	Controls.ScienceAdvisor:SetHide(true);
	Controls.EconomicAdvisor:SetHide(true);
	Controls.ForeignAdvisor:SetHide(true);
	Controls.MilitaryAdvisor:SetHide(true);	
end

local AdvisorAudio = {
	[AdvisorTypes.ADVISOR_SCIENCE] = "AS2D_IF_SCIENCE_ADVISOR_STING",
	[AdvisorTypes.ADVISOR_ECONOMIC] = "AS2D_IF_ECONOMIC_ADVISOR_STING",
	[AdvisorTypes.ADVISOR_FOREIGN] = "AS2D_IF_FOREIGN_ADVISOR_STING",
	[AdvisorTypes.ADVISOR_MILITARY] = "AS2D_IF_MILITARY_ADVISOR_STING",
};

local AdvisorText = {
	[AdvisorTypes.ADVISOR_SCIENCE] = Locale.Lookup("TXT_KEY_ADVISOR_SCIENCE_TITLE"),
	[AdvisorTypes.ADVISOR_ECONOMIC] = Locale.Lookup("TXT_KEY_ADVISOR_ECON_TITLE"),
	[AdvisorTypes.ADVISOR_FOREIGN] = Locale.Lookup("TXT_KEY_ADVISOR_FOREIGN_TITLE"),
	[AdvisorTypes.ADVISOR_MILITARY] = Locale.Lookup("TXT_KEY_ADVISOR_MILITARY_TITLE"),
};

local AdvisorBlocks = {
	[AdvisorTypes.ADVISOR_SCIENCE] = Controls.ScienceAdvisor,
	[AdvisorTypes.ADVISOR_ECONOMIC] = Controls.EconomicAdvisor,
	[AdvisorTypes.ADVISOR_FOREIGN] = Controls.ForeignAdvisor,
	[AdvisorTypes.ADVISOR_MILITARY] = Controls.MilitaryAdvisor,
}

local AdvisorPortraits = {
	[AdvisorTypes.ADVISOR_SCIENCE] = {
		ERA_ANCIENT = Controls.ScienceAdvisorPortrait1,
		ERA_RENAISSANCE = Controls.ScienceAdvisorPortrait2,
		ERA_MODERN = Controls.ScienceAdvisorPortrait3,
	},
	
	[AdvisorTypes.ADVISOR_ECONOMIC] = {
		ERA_ANCIENT = Controls.EconomicAdvisorPortrait1,
		ERA_RENAISSANCE = Controls.EconomicAdvisorPortrait2,
		ERA_MODERN = Controls.EconomicAdvisorPortrait3,
	},
	
	[AdvisorTypes.ADVISOR_FOREIGN] = {
		ERA_ANCIENT = Controls.ForeignAdvisorPortrait1,
		ERA_RENAISSANCE = Controls.ForeignAdvisorPortrait2,
		ERA_MODERN = Controls.ForeignAdvisorPortrait3,
	},
	
	[AdvisorTypes.ADVISOR_MILITARY] = {
		ERA_ANCIENT = Controls.MilitaryAdvisorPortrait1,
		ERA_RENAISSANCE = Controls.MilitaryAdvisorPortrait2,
		ERA_MODERN = Controls.MilitaryAdvisorPortrait3,
	},
}

function SetAdvisorDisplay (iAdvisor)
	HideAllAdvisors();

	Controls.AdvisorDismissButton:SetHide(false);
	
	local advisorText = AdvisorText[iAdvisor];
	Controls.AdvisorTitleText:SetText(advisorText);
	
	local advisor = AdvisorBlocks[iAdvisor];
	advisor:SetHide(false);
	
	local player = Players[Game.GetActivePlayer()];
	local currentEra = player:GetCurrentEra();
	
	local bestPortrait = nil;
	local bestPortraitEra = -2;
	
	for eraType, portrait in pairs(AdvisorPortraits[iAdvisor]) do
		
		-- Hide portrait by default.
		portrait:SetHide(true);
		
		local era = GameInfo.Eras[eraType];
		local eraID = (era ~= nil) and era.ID or -1;
		
		-- If it is nil, assign it SOMETHING.
		if(bestPortrait == nil) then
			bestPortrait = portrait;
		end
		
		if(eraID > bestPortraitEra and eraID <= currentEra) then
			bestPortrait = portrait;
			bestPortraitEra = eraID;
		end		
	end
	
	bestPortrait:SetHide(false);
end

function ResetAdvisorDisplay ()
	HideAllAdvisors();
	Controls.ActivateButton:SetHide(true);
	Controls.Question1String:SetHide(true);
	Controls.Question2String:SetHide(true);
	Controls.Question3String:SetHide(true);
	Controls.Question4String:SetHide(true);
	
	SetAdvisorDisplay(0);
	
	Controls.AdvisorHeaderText:SetText( Locale.ConvertTextKey( "TXT_KEY_ADVISOR_RESET_TITLE" ));
	Controls.AdvisorBodyText:SetText( Locale.ConvertTextKey( "TXT_KEY_ADVISOR_RESET_TEXT" ));
	
	-- g_CurrentCustomAdviceID = nil
end

function OnAdvisorHelpClicked ()
	local popupInfo = 
	{
		Type  = 99997,
	};
	Events.SerialEventGameMessagePopup(popupInfo);
end
Controls.ActivateButton:RegisterCallback( Mouse.eLClick, OnAdvisorHelpClicked );

function OnAdvisorDismissClicked()
	if g_CurrentCustomAdviceID then
		g_CustomTutorialQueue[g_CurrentCustomAdviceID] = nil
		g_CustomTutorialQueueNum = g_CustomTutorialQueueNum - 1
		-- if #g_CustomTutorialQueue > 0 then
		-- ContextPtr:SetHide(true);
		if (g_CurrentCustomAdviceID and g_DontShowAdvice) then
			-- NOTE: This doesn't take into account pesturing tutorials which should never be marked.
			Game.SetAdvisorMessageHasBeenSeen(g_CurrentCustomAdviceID, true);
		end
		if g_CustomTutorialQueueNum > 0 then
			local numQueued = 0
			for eventInfoID, thisEventInfo in pairs(g_CustomTutorialQueue) do
				LuaEvents.JFD_AdvisorDisplayShow(GameInfo.CustomTutorials[eventInfoID], thisEventInfo.PlayerID, thisEventInfo.Unit, thisEventInfo.City, thisEventInfo.PlotX, thisEventInfo.PlotY, true)
				g_CustomTutorialQueueNum = g_CustomTutorialQueueNum - 1
			end
		else
			Events.AdvisorDisplayHide();
		end
	else
		Events.AdvisorDisplayHide();
	end
end
Controls.AdvisorDismissButton:RegisterCallback( Mouse.eLClick, OnAdvisorDismissClicked );

local AdvisorConcept1 = "";
local AdvisorConcept2 = "";
local AdvisorConcept3 = "";

function OnQuestion1Clicked ()
	local popupInfo = {
		Type = ButtonPopupTypes.BUTTONPOPUP_ADVISOR_INFO,
		Text = AdvisorConcept1,
		Priority = PopupPriority.Current,
	}
	Events.SerialEventGameMessagePopup(popupInfo);
end
Controls.Question1String:RegisterCallback( Mouse.eLClick, OnQuestion1Clicked);

function OnQuestion2Clicked ()
	local popupInfo = {
		Type = ButtonPopupTypes.BUTTONPOPUP_ADVISOR_INFO,
		Text = AdvisorConcept2,
		Priority = PopupPriority.Current,
	}
	Events.SerialEventGameMessagePopup(popupInfo);
end
Controls.Question2String:RegisterCallback( Mouse.eLClick, OnQuestion2Clicked);

function OnQuestion3Clicked ()
	local popupInfo = {
		Type = ButtonPopupTypes.BUTTONPOPUP_ADVISOR_INFO,
		Text = AdvisorConcept3,
		Priority = PopupPriority.Current,
	}
	Events.SerialEventGameMessagePopup(popupInfo);
end
Controls.Question3String:RegisterCallback( Mouse.eLClick, OnQuestion3Clicked);

function OnAdvisorDisplayShow (eventInfo)
	table.insert(g_TutorialQueue, eventInfo);
	
	ResetAdvisorDisplay();

	AdvisorConcept1 = eventInfo.Concept1;
	AdvisorConcept2 = eventInfo.Concept2;
	AdvisorConcept3 = eventInfo.Concept3;

	SetAdvisorDisplay(eventInfo.Advisor);
	
	-- NOTE: This doesn't take into account pesturing tutorials which should never be marked.
	print("Marking " .. eventInfo.IDName .. " as seen");
	Game.SetAdvisorMessageHasBeenSeen(eventInfo.IDName, true);
		
	Controls.DontShowAgainCheckbox:SetCheck(false);
	
	Controls.AdvisorHeaderText:LocalizeAndSetText(eventInfo.TitleText);
	Controls.AdvisorBodyText:LocalizeAndSetText(eventInfo.BodyText);
	
	if (eventInfo.ActivateButtonText ~= nil and eventInfo.ActivateButtonText ~= "") then
		Controls.ActivateButtonText:SetText(eventInfo.ActivateButtonText);
		Controls.ActivateButton:SetHide(false);
	else 
		Controls.ActivateButton:SetHide(true);
	end
	
	if (eventInfo.Concept1 ~= nil and eventInfo.Concept1 ~= "") then
		local concept = GameInfo.Concepts[eventInfo.Concept1];
		if(concept ~= nil) then
			Controls.Question1String:SetHide(false);
			Controls.Question1String:SetText(Locale.ConvertTextKey(concept.AdvisorQuestion));
		else
			Controls.Question1String:SetHide(true);
			print("Could not find concept. " .. eventInfo.Concept1);
		end
	else
		Controls.Question1String:SetHide(true);
	end

	if (eventInfo.Concept2 ~= nil and eventInfo.Concept2 ~= "") then
		local concept = GameInfo.Concepts[eventInfo.Concept2];
		if(concept ~= nil) then
			Controls.Question2String:SetHide(false);
			Controls.Question2String:SetText(Locale.ConvertTextKey(concept.AdvisorQuestion));
		else
			Controls.Question2String:SetHide(true);
			print("Could not find concept. " .. eventInfo.Concept2);
		end
	else
		Controls.Question2String:SetHide(true);
	end

	if (eventInfo.Concept3 ~= nil and eventInfo.Concept3 ~= "") then
		local concept = GameInfo.Concepts[eventInfo.Concept3];
		if(concept ~= nil) then
			Controls.Question3String:SetHide(false);
			Controls.Question3String:SetText(Locale.ConvertTextKey(concept.AdvisorQuestion));		
		else
			Controls.Question3String:SetHide(true);
			print("Could not find concept. " .. eventInfo.Concept3);
		end
	else
		Controls.Question3String:SetHide(true);
	end
	
	if (eventInfo.Modal) then
		UIManager:PushModal(ContextPtr, true);	
		bModal = true;
	end
	
	AdvisorOpen();
end
Events.AdvisorDisplayShow.Add(OnAdvisorDisplayShow);


function OnJFDLCAdvisorDisplayShow(eventInfo, playerID, city, unit, plotX, plotY, isQueued, isQuestion)
	print("pushing tutorial for", eventInfo.Type)
	-- AdvisorOpen()
	local eventInfoID = eventInfo.ID
	if (not isQuestion) then
		local thisEventInfo = {}
		thisEventInfo.ID = eventInfo.ID
		thisEventInfo.PlayerID = playerID
		thisEventInfo.City = city
		thisEventInfo.Unit = unit
		thisEventInfo.PlotX = plotX
		thisEventInfo.PlotY = plotY
		g_CustomTutorialQueue[eventInfoID] = thisEventInfo
		g_CustomTutorialQueueNum = g_CustomTutorialQueueNum + 1
	end
	if (not ContextPtr:IsHidden()) and (not isQueued) then return end
	g_CurrentCustomAdviceID = eventInfoID

	-- AdvisorConcept1 = eventInfo.Concept1;
	-- AdvisorConcept2 = eventInfo.Concept2;
	-- AdvisorConcept3 = eventInfo.Concept3;

	local advisorID = 0
	local advisorType = eventInfo.AdvisorType
	if eventInfo.AdvisorType == "ADVISOR_ECONOMIC" then
		advisorID = 1
	elseif eventInfo.AdvisorType == "ADVISOR_FOREIGN" then
		advisorID = 2
	elseif eventInfo.AdvisorType == "ADVISOR_SCIENCE" then
		advisorID = 3
	end
	SetAdvisorDisplay(advisorID);

	if eventInfo.DoNotRepeat then
		g_DontShowAdvice = true
		Controls.DontShowAgainCheckbox:SetHide(true);
	else
		Controls.DontShowAgainCheckbox:SetCheck(false);
		Controls.DontShowAgainCheckbox:SetHide(false);
	end
	Controls.AdvisorHeaderText:LocalizeAndSetText(eventInfo.Description);
	Controls.AdvisorBodyText:LocalizeAndSetText(eventInfo.Help);
	Controls.BackButton:SetHide(true);
	
	if city then
		Controls.ActivateButtonText:LocalizeAndSetText("TXT_KEY_TUTORIAL_GO_TO_CITY");
		Controls.ActivateButton:SetHide(false);
		Controls.ActivateButton:SetVoids(plotX, plotY);
		Controls.ActivateButton:RegisterCallback( Mouse.eLClick, OnFindOnMapButtonClicked )
	elseif unit then
		Controls.ActivateButtonText:LocalizeAndSetText("TXT_KEY_TUTORIAL_GO_TO_UNIT");
		Controls.ActivateButton:SetHide(false);
		Controls.ActivateButton:SetVoids(plotX, plotY);
		Controls.ActivateButton:RegisterCallback( Mouse.eLClick, OnFindOnMapButtonClicked )
	elseif plotX and plotY then
		Controls.ActivateButtonText:LocalizeAndSetText("TXT_KEY_TUTORIAL_GO_TO_PLOT");
		Controls.ActivateButton:SetHide(false);
		Controls.ActivateButton:SetVoids(plotX, plotY);
		Controls.ActivateButton:RegisterCallback( Mouse.eLClick, OnFindOnMapButtonClicked )
	else 
		Controls.ActivateButton:SetHide(true);
	end
	if eventInfo.Civilopedia then
		local pediaEntry = CivilopediaControl and (eventInfo.Civilopedia)
		Controls.PediaButtonText:LocalizeAndSetText("TXT_KEY_TUTORIAL_GO_TO_PEDIA");
		Controls.PediaButton:RegisterCallback( Mouse.eLClick, function() getPedia(pediaEntry) end )
		Controls.PediaButton:SetHide(false)
	else
		Controls.PediaButton:SetHide(true)
	end

	if eventInfo.DoNotRepeat then
		Controls.DontShowAgainCheckbox:SetHide(true)
	else
		Controls.DontShowAgainCheckbox:SetHide(false)
	end
	
	local numQuestion = 1
	Controls.Question1String:SetHide(true)
	Controls.Question2String:SetHide(true)
	Controls.Question3String:SetHide(true)
	for row in GameInfo.CustomTutorial_Questions("TutorialType = '" .. eventInfo.Type .. "'") do
		local numString = tostring( numQuestion );
		local buttonName = "Question"..numQuestion.."String"
		local thisButton = Controls[buttonName];
		thisButton:SetHide(false)
		thisButton:LocalizeAndSetText(row.Description);
		thisButton:SetVoid1( GameInfoTypes[row.LinkedTutorialType]);
		thisButton:RegisterCallback( Mouse.eLClick, OnQuestionClicked);
		numQuestion = numQuestion + 1
	end
	
	if (ContextPtr:IsHidden() or isQueued) and (not isQuestion) then
		if AdvisorAudio[advisorID] then
			Events.AudioPlay2DSound(AdvisorAudio[advisorID])
		end
		if eventInfo.AudioSound then
			Events.AudioPlay2DSound(eventInfo.AudioSound)
		end
	end
	AdvisorOpen();
end
LuaEvents.JFD_AdvisorDisplayShow.Add(OnJFDLCAdvisorDisplayShow);

function OnQuestionClicked(eventInfoID)
	local eventInfo = GameInfo.CustomTutorials[eventInfoID]
	
	local advisorID = 0
	local advisorType = eventInfo.AdvisorType
	if eventInfo.AdvisorType == "ADVISOR_ECONOMIC" then
		advisorID = 1
	elseif eventInfo.AdvisorType == "ADVISOR_FOREIGN" then
		advisorID = 2
	elseif eventInfo.AdvisorType == "ADVISOR_SCIENCE" then
		advisorID = 3
	end
	SetAdvisorDisplay(advisorID);

	Controls.DontShowAgainCheckbox:SetHide(true);
	Controls.AdvisorHeaderText:LocalizeAndSetText(eventInfo.Description);
	Controls.AdvisorBodyText:LocalizeAndSetText(eventInfo.Help);
	Controls.ActivateButton:SetHide(true);
	
	local previousEventInfoID = nil
	for row in GameInfo.CustomTutorial_Questions("LinkedTutorialType = '" .. eventInfo.Type .. "'") do
		previousEventInfoID = GameInfoTypes[row.TutorialType]
		break
	end
	Controls.BackButton:SetVoid1(previousEventInfoID)
	Controls.BackButton:SetHide(false);
	
	local numQuestion = 1
	Controls.Question1String:SetHide(true)
	Controls.Question2String:SetHide(true)
	Controls.Question3String:SetHide(true)
	for row in GameInfo.CustomTutorial_Questions("TutorialType = '" .. eventInfo.Type .. "'") do
		local numString = tostring( numQuestion );
		local buttonName = "Question"..numQuestion.."String"
		local thisButton = Controls[buttonName];
		thisButton:SetHide(false)
		thisButton:LocalizeAndSetText(row.Description);
		thisButton:SetVoid1( GameInfoTypes[row.LinkedTutorialType]);
		thisButton:RegisterCallback( Mouse.eLClick, OnQuestionClicked);
		numQuestion = numQuestion + 1
	end
end

function JFD_OnQuestionBack(eventInfoID)
	LuaEvents.JFD_AdvisorDisplayShow(GameInfo.CustomTutorials[eventInfoID], nil, nil, nil, nil, nil, true, true)
end
Controls.BackButton:RegisterCallback( Mouse.eLClick, JFD_OnQuestionBack)

function JFD_OnDontShowAgainCheckbox(isChecked)
	g_DontShowAdvice = isChecked
end
Controls.DontShowAgainCheckbox:RegisterCheckHandler(JFD_OnDontShowAgainCheckbox)

function OnClearAdvice()
	AdvisorClose();
	ResetAdvisorDisplay();
end
Events.AdvisorDisplayHide.Add( OnClearAdvice );

----------------------------------------------------------------
-- Find On Map
----------------------------------------------------------------
function OnFindOnMapButtonClicked(plotX,plotY)
	local plot = Map.GetPlot(plotX,plotY)
	if plot then
		UI.LookAt(plot, 0)
		local hex = ToHexFromGrid(Vector2(plotX,plotY))
		Events.GameplayFX(hex.x, hex.y, -1)
	end
end
----------------------------------------------------------------        
-- Key Down Processing
----------------------------------------------------------------        
function InputHandler(uiMsg, wParam, lParam)
    if( IsAdvisorDisplayOpen() and
        uiMsg == KeyEvents.KeyDown ) then
        if( wParam == Keys.VK_ESCAPE ) then
			OnAdvisorDismissClicked();
            return true;
        end
    end
    
    return false;
end
ContextPtr:SetInputHandler( InputHandler );

---------------------
ResetAdvisorDisplay();