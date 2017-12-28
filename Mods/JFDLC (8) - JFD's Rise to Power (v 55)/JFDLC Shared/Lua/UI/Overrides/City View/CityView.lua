-------------------------------------------------
-- Game View 
-------------------------------------------------
include( "IconSupport" );
include( "InstanceManager" );
include( "SupportFunctions"  );
include( "TutorialPopupScreen" );
include( "InfoTooltipInclude" );
------------------------------
-- JFDLC
------------------------------
include( "JFDLCUtils.lua" ) 

local userSettings = {}
	userSettings["UserSettingCIDCityDistricts"] 				= (Game.GetUserSetting("JFD_CID_DEVELOPMENT_CORE_DISTRICTS") == 1)
	userSettings["UserSettingCIDCrimeCore"] 					= (Game.GetUserSetting("JFD_CID_CRIMES_CORE") == 1)
	userSettings["UserSettingCIDCrimeOrganizedCore"] 			= (Game.GetUserSetting("JFD_CID_CRIMES_CORE_ORGANIZED") == 1)
	userSettings["UserSettingCIDDevelopmentCore"] 				= (Game.GetUserSetting("JFD_CID_DEVELOPMENT_CORE") == 1)
	userSettings["UserSettingCIDHappinessCore"] 				= (Game.GetUserSetting("JFD_CID_HAPPINESS_CORE") == 1)
	userSettings["UserSettingCIDHappinessCoreExcessProduction"] = (Game.GetUserSetting("JFD_CID_HAPPINESS_CORE_EXCESS_INTO_PRODUCTION") == 1)
	userSettings["UserSettingCIDHappinessCoreFirstNotificationResistanceTurns"] = (Game.GetUserSetting("JFD_CID_HAPPINESS_CORE_NOTIFICATION_FIRST_RESISTANCE_TURNS"))
	userSettings["UserSettingCIDHealthCore"] 					= (Game.GetUserSetting("JFD_CID_HEALTH_CORE") == 1)
	userSettings["UserSettingCIDHealthCoreFirstNotificationPlagueTurns"] 		= (Game.GetUserSetting("JFD_CID_HEALTH_CORE_FIRST_NOTIFICATION_PLAGUE_TURNS"))
	userSettings["UserSettingCIDInvestmentsCoreUI"] 			= (Game.GetUserSetting("JFD_CID_INVESTMENTS_CORE_UI"))
	userSettings["UserSettingCIDLoyaltyCore"] 					= (Game.GetUserSetting("JFD_CID_LOYALTY_CORE"))
	userSettings["UserSettingCIDProvincesCore"] 				= (Game.GetUserSetting("JFD_CID_PROVINCES_CORE"))
	userSettings["UserSettingCIDProvincesCoreLevies"] 			= (Game.GetUserSetting("JFD_CID_PROVINCES_CORE_LEVIES"))
	userSettings["UserSettingCIDSlaveryCore"] 					= (Game.GetUserSetting("JFD_CID_SLAVERY_CORE"))

local isUsingCBO									= Game.IsCBOActive()
local isUsingED										= Game.IsEventsAndDecisionsActive()
local isUsingSuzerainty								= Game.IsSuzeraintyActive()

local specialistGovernorID = GameInfo.Specialists["SPECIALIST_JFD_GOVERNOR"].ID or -1
------------------------------
-- JFDLC
------------------------------
-- Pedia Callback
------------------------------

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
------------------------------
------------------------------
getPedia = CivilopediaControl and getPediaA

local g_BuildingIM   = InstanceManager:new( "BuildingInstance", "BuildingButton", Controls.BuildingStack );
local g_GPIM   = InstanceManager:new( "GPInstance", "GPBox", Controls.GPStack );
local g_SlackerIM   = InstanceManager:new( "SlackerInstance", "SlackerButton", Controls.BoxOSlackers );
--Specialists
local g_Specialist1IM    = InstanceManager:new( "SpecialistInstance", "SpecialistButton", Controls.Specialist1Stack );
local g_Specialist2IM    = InstanceManager:new( "SpecialistInstance", "SpecialistButton", Controls.Specialist2Stack );
local g_Specialist3IM    = InstanceManager:new( "SpecialistInstance", "SpecialistButton", Controls.Specialist3Stack );
local g_Specialist4IM    = InstanceManager:new( "SpecialistInstance", "SpecialistButton", Controls.Specialist4Stack );
local g_Specialist5IM    = InstanceManager:new( "SpecialistInstance", "SpecialistButton", Controls.Specialist5Stack );
local g_Specialist6IM    = InstanceManager:new( "SpecialistInstance", "SpecialistButton", Controls.Specialist6Stack );
local g_Specialist7IM    = InstanceManager:new( "SpecialistInstance", "SpecialistButton", Controls.Specialist7Stack );
local g_Specialist8IM    = InstanceManager:new( "SpecialistInstance", "SpecialistButton", Controls.Specialist8Stack );
local g_Specialist9IM    = InstanceManager:new( "SpecialistInstance", "SpecialistButton", Controls.Specialist9Stack );
local g_Specialist10IM   = InstanceManager:new( "SpecialistInstance", "SpecialistButton", Controls.Specialist10Stack );
local g_Specialist11IM   = InstanceManager:new( "SpecialistInstance", "SpecialistButton", Controls.Specialist11Stack );
local g_Specialist12IM   = InstanceManager:new( "SpecialistInstance", "SpecialistButton", Controls.Specialist12Stack );
local g_Specialist13IM   = InstanceManager:new( "SpecialistInstance", "SpecialistButton", Controls.Specialist13Stack );
local g_Specialist14IM   = InstanceManager:new( "SpecialistInstance", "SpecialistButton", Controls.Specialist14Stack );
local g_Specialist15IM   = InstanceManager:new( "SpecialistInstance", "SpecialistButton", Controls.Specialist15Stack );
local g_Specialist16IM   = InstanceManager:new( "SpecialistInstance", "SpecialistButton", Controls.Specialist16Stack );
local g_Specialist17IM   = InstanceManager:new( "SpecialistInstance", "SpecialistButton", Controls.Specialist17Stack );
local g_Specialist18IM   = InstanceManager:new( "SpecialistInstance", "SpecialistButton", Controls.Specialist18Stack );
local g_Specialist19IM   = InstanceManager:new( "SpecialistInstance", "SpecialistButton", Controls.Specialist19Stack );
local g_Specialist20IM   = InstanceManager:new( "SpecialistInstance", "SpecialistButton", Controls.Specialist20Stack );
local specialistInstances = {}
specialistInstances[1] = g_Specialist1IM
specialistInstances[2] = g_Specialist2IM
specialistInstances[3] = g_Specialist3IM
specialistInstances[4] = g_Specialist4IM
specialistInstances[5] = g_Specialist5IM
specialistInstances[6] = g_Specialist6IM
specialistInstances[7] = g_Specialist7IM
specialistInstances[8] = g_Specialist8IM
specialistInstances[9] = g_Specialist9IM
specialistInstances[10] = g_Specialist10IM
specialistInstances[11] = g_Specialist11IM
specialistInstances[12] = g_Specialist12IM
specialistInstances[13] = g_Specialist13IM
specialistInstances[14] = g_Specialist14IM
specialistInstances[15] = g_Specialist15IM
specialistInstances[16] = g_Specialist16IM
specialistInstances[17] = g_Specialist17IM
specialistInstances[18] = g_Specialist18IM
specialistInstances[19] = g_Specialist19IM
specialistInstances[20] = g_Specialist20IM


local g_PlotButtonIM   = InstanceManager:new( "PlotButtonInstance", "PlotButtonAnchor", Controls.PlotButtonContainer );
local g_BuyPlotButtonIM   = InstanceManager:new( "BuyPlotButtonInstance", "BuyPlotButtonAnchor", Controls.PlotButtonContainer );

local WorldPositionOffset = { x = 0, y = 0, z = 30 };

local WorldPositionOffset2 = { x = 0, y = 35, z = 0 };

local g_iPortraitSize = Controls.ProductionPortrait:GetSize().x;

local screenSizeX, screenSizeY = UIManager:GetScreenSizeVal();
screenSizeY = screenSizeY - 110 -- JFD Development
	
local pediaSearchStrings = {};

local gPreviousCity = nil;
local specialistTable = {};

local g_iBuildingToSell = -1;

local g_bRazeButtonDisabled = false;

-- Add any interface modes that need special processing to this table
local InterfaceModeMessageHandler = 
{
	[InterfaceModeTypes.INTERFACEMODE_SELECTION] = {},
	--[InterfaceModeTypes.INTERFACEMODE_CITY_PLOT_SELECTION] = {},
	[InterfaceModeTypes.INTERFACEMODE_PURCHASE_PLOT] = {}
}
-------------------------------------------------
-- Clear out the UI so that when a player changes
-- the next update doesn't show the previous player's
-- values for a frame
-------------------------------------------------
function ClearCityUIInfo()

	Controls.b1number:SetHide( true );
	Controls.b1down:SetHide( true );
	Controls.b1remove:SetHide( true );
	Controls.b2box:SetHide( true );
	Controls.b3box:SetHide( true );
	Controls.b4box:SetHide( true );
	Controls.b5box:SetHide( true );
	Controls.b6box:SetHide( true );

	Controls.ProductionItemName:SetText("");	
	Controls.ProductionPortraitButton:SetHide(true);		
	Controls.ProductionHelp:SetHide(true);

end

-----------------------------------------------------------------
-- CITY SCREEN CLOSED
-----------------------------------------------------------------
function CityScreenClosed()
	
	UI.SetInterfaceMode(InterfaceModeTypes.INTERFACEMODE_SELECTION);
	OnCityViewUpdate();
	-- We may get here after a player change, clear the UI if this is not the active player's city
	local pCity = UI.GetHeadSelectedCity();
	if pCity ~= nil then
		if pCity:GetOwner() ~= Game.GetActivePlayer() then
			ClearCityUIInfo();
		end
	end
	UI.ClearSelectedCities();
	
	LuaEvents.TryDismissTutorial("CITY_SCREEN");
	
	g_iCurrentSpecialist = -1;
	if (not Controls.SellBuildingConfirm:IsHidden()) then 
		Controls.SellBuildingConfirm:SetHide(true);
	end
	g_iBuildingToSell = -1;
		
	-- Try and re-select the last unit selected		
	if (UI.GetHeadSelectedUnit() == nil and UI.GetLastSelectedUnit() ~= nil) then
		UI.SelectUnit(UI.GetLastSelectedUnit());
		UI.LookAtSelectionPlot();		
	end
	
	UI.SetCityScreenViewingMode(false);
end
Events.SerialEventExitCityScreen.Add(CityScreenClosed);

local DefaultMessageHandler = {};

DefaultMessageHandler[KeyEvents.KeyDown] =
function( wParam, lParam )
	
	local interfaceMode = UI.GetInterfaceMode();
	if (--	interfaceMode == InterfaceModeTypes.INTERFACEMODE_CITY_PLOT_SELECTION or
		interfaceMode == InterfaceModeTypes.INTERFACEMODE_PURCHASE_PLOT) then
		if ( wParam == Keys.VK_ESCAPE or wParam == Keys.VK_RETURN ) then
			UI.SetInterfaceMode(InterfaceModeTypes.INTERFACEMODE_SELECTION);
			return true;
		end	
	else
		if ( wParam == Keys.VK_ESCAPE or wParam == Keys.VK_RETURN ) then
			if(Controls.SellBuildingConfirm:IsHidden())then
				--CloseScreen();
				Events.SerialEventExitCityScreen();
				return true;
			else
				Controls.SellBuildingConfirm:SetHide(true);
				g_iBuildingToSell = -1;
				return true;
			end
		elseif wParam == Keys.VK_LEFT then
			Game.DoControl(GameInfoTypes.CONTROL_PREVCITY);
			return true;
		elseif wParam == Keys.VK_RIGHT then
			Game.DoControl(GameInfoTypes.CONTROL_NEXTCITY);
			return true;
		end
	end
	
    return false;
end


InterfaceModeMessageHandler[InterfaceModeTypes.INTERFACEMODE_SELECTION][MouseEvents.LButtonDown] = 
function( wParam, lParam )	
	if GameDefines.CITY_SCREEN_CLICK_WILL_EXIT == 1 then
		UI.ClearSelectedCities();
		return true;
	end

	return false;
end


--InterfaceModeMessageHandler[InterfaceModeTypes.INTERFACEMODE_PURCHASE_PLOT][MouseEvents.LButtonDown] = 
--function( wParam, lParam )
	--local hexX, hexY = UI.GetMouseOverHex();
	--local plot = Map.GetPlot( hexX, hexY );
	--local plotX = plot:GetX();
	--local plotY = plot:GetY();
	--local bShift = UIManager:GetShift();
	--local bAlt = UIManager:GetAlt();
	--local bCtrl = UIManager:GetControl();
	--local activePlayerID = Game.GetActivePlayer();
	--local pHeadSelectedCity = UI.GetHeadSelectedCity();
	--if pHeadSelectedCity then
		--if (plot:GetOwner() ~= activePlayerID) then
			--Events.AudioPlay2DSound("AS2D_INTERFACE_BUY_TILE");	
		--end
		--Network.SendCityBuyPlot(pHeadSelectedCity:GetID(), plotX, plotY);
	--end
	--return true;
--end
--
----------------------------------------------------------------        
----------------------------------------------------------------        
InterfaceModeMessageHandler[InterfaceModeTypes.INTERFACEMODE_PURCHASE_PLOT][MouseEvents.RButtonUp] = 
function( wParam, lParam )
	UI.SetInterfaceMode(InterfaceModeTypes.INTERFACEMODE_SELECTION);
end


----------------------------------------------------------------        
-- Input handling 
-- (this may be overkill for now because there is currently only 
-- one InterfaceMode on this display, but if we add some, which we did...)
----------------------------------------------------------------        
function InputHandler( uiMsg, wParam, lParam )
	local interfaceMode = UI.GetInterfaceMode();
	local currentInterfaceModeHandler = InterfaceModeMessageHandler[interfaceMode];
	if currentInterfaceModeHandler and currentInterfaceModeHandler[uiMsg] then
		return currentInterfaceModeHandler[uiMsg]( wParam, lParam );
	elseif DefaultMessageHandler[uiMsg] then
		return DefaultMessageHandler[uiMsg]( wParam, lParam );
	end
	return false;
end
ContextPtr:SetInputHandler( InputHandler );


local defaultErrorTextureSheet = "ProductionAtlas.dds";
local nullOffset = Vector2( 0, 0 );

local unemployedTexture = "citizenUnemployed.dds";
local workerTexture = "citizenWorker.dds";

--end addition
local emptySlotString = Locale.ConvertTextKey("TXT_KEY_CITYVIEW_EMPTY_SLOT");

---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

local otherSortedList = {};
local sortOrder = 0;

function CVSortFunction( a, b )

    local aVal = otherSortedList[ tostring( a ) ];
    local bVal = otherSortedList[ tostring( b ) ];
    
    if (aVal == nil) or (bVal == nil) then 
		if aVal and (bVal == nil) then
			return false;
		elseif (aVal == nil) and bVal then
			return true;
		else
			return tostring(a) < tostring(b); -- gotta do something deterministic
        end;
    else
        return aVal < bVal;
    end
end

---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

local workerHeadingOpen = OptionsManager.IsNoCitizenWarning();
local slackerHeadingOpen = true;
local specialistsHeadingOpen = false;
local GPHeadingOpen = true;
local nationalWonderHeadingOpen = true;
local wonderHeadingOpen = true;
local greatWorkHeadingOpen = true;
local specialistBuildingHeadingOpen = true;
local buildingHeadingOpen = true;
--JFD Yields
local yield1HeadingOpen      = true;
local yield2HeadingOpen      = false;
local yield3HeadingOpen      = false;
local yield4HeadingOpen      = false;
local yield5HeadingOpen      = false;
local yield6HeadingOpen      = false;
local developmentHeadingOpen = true;

--JFD Districts
local buildingDistrictHeadingOpen = {};
if userSettings["UserSettingCIDCityDistricts"] then
	for row in GameInfo.JFD_Districts() do
		if row.ID == 1 then
			buildingDistrictHeadingOpen[row.ID] = true
		else
			buildingDistrictHeadingOpen[row.ID] = false
		end
	end
end

local productionQueueOpen = false;
local yieldPanelsOpen 	  = false;

function OnSlackersSelected()
	if Players[Game.GetActivePlayer()]:IsTurnActive() then
		local pCity = UI.GetHeadSelectedCity();
		if pCity ~= nil then
			Network.SendDoTask(pCity:GetID(), TaskTypes.TASK_REMOVE_SLACKER, 0, -1, false, bAlt, bShift, bCtrl);
		end
	end
end

function OnSpecialistSelected()
	if Players[Game.GetActivePlayer()]:IsTurnActive() then
		local pCity = UI.GetHeadSelectedCity();
		if pCity ~= nil then
			Network.SendDoTask(pCity:GetID(), TaskTypes.TASK_REMOVE_SLACKER, 0, -1, false, bAlt, bShift, bCtrl);
		end
	end
end

function OnDevelopmentHeaderSelected()
	developmentHeadingOpen = not developmentHeadingOpen;
	OnCityViewUpdate();
end

function OnWorkerHeaderSelected()
	workerHeadingOpen = not workerHeadingOpen;
	OnCityViewUpdate();
end

function OnSpecialistsHeaderSelected()
	specialistsHeadingOpen = not specialistsHeadingOpen;
	OnCityViewUpdate();
end

function OnSlackerHeaderSelected()
	slackerHeadingOpen = not slackerHeadingOpen;
	OnCityViewUpdate();
end

function OnGPHeaderSelected()
	GPHeadingOpen = not GPHeadingOpen;
	OnCityViewUpdate();
end

function OnGreatWorkHeaderSelected()
	greatWorkHeadingOpen = not greatWorkHeadingOpen;
	OnCityViewUpdate();
end

function OnNationalWondersHeaderSelected()
	nationalWonderHeadingOpen = not nationalWonderHeadingOpen;
	OnCityViewUpdate();
end

function OnWondersHeaderSelected()
	wonderHeadingOpen = not wonderHeadingOpen;
	OnCityViewUpdate();
end

function OnSpecialistBuildingsHeaderSelected()
	specialistBuildingHeadingOpen = not specialistBuildingHeadingOpen;
	OnCityViewUpdate();
end

function OnBuildingsHeaderSelected(num)
	if num then
		buildingDistrictHeadingOpen[num] = not buildingDistrictHeadingOpen[num];
	else
		buildingHeadingOpen = not buildingHeadingOpen;
	end
	OnCityViewUpdate();
end

function OnYield1HeaderSelected()
	yield1HeadingOpen = not yield1HeadingOpen;
	OnCityViewUpdate();
	RecalcYieldPanelSize()
end

function OnYield2HeaderSelected()
	yield2HeadingOpen = not yield2HeadingOpen;
	OnCityViewUpdate();
	RecalcYieldPanelSize()
end

function OnYield3HeaderSelected()
	yield3HeadingOpen = not yield3HeadingOpen;
	OnCityViewUpdate();
	RecalcYieldPanelSize()
end

function OnYield4HeaderSelected()
	yield4HeadingOpen = not yield4HeadingOpen;
	OnCityViewUpdate();
	RecalcYieldPanelSize()
end

function OnYield5HeaderSelected()
	yield5HeadingOpen = not yield5HeadingOpen;
	OnCityViewUpdate();
	RecalcYieldPanelSize()
end

function OnYield6HeaderSelected()
	yield6HeadingOpen = not yield6HeadingOpen;
	OnCityViewUpdate();
	RecalcYieldPanelSize()
end

function GetPedia( void1, void2, button )
	local searchString = pediaSearchStrings[tostring(button)];
	if (searchString ~= nil) then
		Events.SearchForPediaEntry( searchString );
	end
end
-------------------------------------------------
-------------------------------------------------
function OnEditNameClick()
	if UI.GetHeadSelectedCity() then
		local popupInfo = {
				Type = ButtonPopupTypes.BUTTONPOPUP_RENAME_CITY,
				Data1 = UI.GetHeadSelectedCity():GetID(),
				Data2 = -1,
				Data3 = -1,
				Option1 = false,
				Option2 = false;
			}
		Events.SerialEventGameMessagePopup(popupInfo);
	end
end
Controls.EditButton:RegisterCallback( Mouse.eLClick, OnEditNameClick );


function AddBuildingButton( pCity, building )
	local iPlayer = pCity:GetOwner()
	local pPlayer = Players[iPlayer]
	local buildingID= building.ID;
	if (pCity:IsHasBuilding(buildingID)) then
		
		local controlTable = g_BuildingIM:GetInstance();
		
		sortOrder = sortOrder + 1;
		otherSortedList[tostring( controlTable.BuildingButton )] = sortOrder;
		
		--controlTable.BuildingButton:RegisterCallback( Mouse.eLClick, OnBuildingClick );
		--controlTable.BuildingButton:SetVoid1( buildingID );

		if (pCity:GetNumFreeBuilding(buildingID) > 0) then
			bIsBuildingFree = true;
		else
			bIsBuildingFree = false;
		end
		
		-- Name
		local strBuildingName;
		
		-- Religious Buildings have special names
		if (building.IsReligious) then
			strBuildingName = Locale.ConvertTextKey("TXT_KEY_RELIGIOUS_BUILDING", building.Description, pPlayer:GetStateReligionKey());
		else
			strBuildingName = Locale.ConvertTextKey(building.Description);
		end

		-- Building is free, add an asterisk to the name
		if (bIsBuildingFree) then
			strBuildingName = strBuildingName .. " (" .. Locale.ConvertTextKey("TXT_KEY_FREE") .. ")";
		end
		
		controlTable.BuildingName:SetText(strBuildingName);
		
		controlTable.BuildingDevelopment:SetHide(true)
		if userSettings["UserSettingCIDDevelopmentCore"] then
			local development = pPlayer:GetBuildingDevelopment(building.Type, building.BuildingClass, pCity)
			if development > 0 then 
				controlTable.BuildingDevelopment:LocalizeAndSetText("+{1_Num} [ICON_JFD_DEVELOPMENT]", development)
				controlTable.BuildingDevelopment:SetHide(false)
			end
		end

		pediaSearchStrings[tostring(controlTable.BuildingButton)] = Locale.ConvertTextKey(building.Description);
		controlTable.BuildingButton:RegisterCallback( Mouse.eRClick, GetPedia );
				
		-- Portrait
		if IconHookup( building.PortraitIndex, 64, building.IconAtlas, controlTable.BuildingImage ) then
			controlTable.BuildingImage:SetHide( false );
		else
			controlTable.BuildingImage:SetHide( true );
		end
		
		-- Great Work Slots		
		-- Hide all slots.
		local iMaxGreatWorkSlots = 4;
		for i = 1, iMaxGreatWorkSlots, 1 do
			local filledGreatWorkSlot = controlTable["BuildingFilledGreatWorkSlot" .. i];
			filledGreatWorkSlot:SetHide(true);
		end
		
		controlTable.ThemeBonus:SetHide(true);
		
		if(building.GreatWorkSlotType ~= nil and building.GreatWorkCount > 0) then
			local buildingGreatWorkSlotType = building.GreatWorkSlotType;
			local buildingGreatWorkSlot = GameInfo.GreatWorkSlots[buildingGreatWorkSlotType];
			local filledTexture = buildingGreatWorkSlot.FilledIcon;
			local emptyTexture = buildingGreatWorkSlot.EmptyIcon;
								
			local iBuildingClass = GameInfo.BuildingClasses[building.BuildingClass].ID;
			local iNumGreatWorks = building.GreatWorkCount;
			
			local themeBonus = pCity:GetThemingBonus(iBuildingClass);
			if(themeBonus > 0) then
				local themeBonusToolTip = pCity:GetThemingTooltip(iBuildingClass)
				controlTable.ThemeBonus:SetText("+" .. themeBonus .. "[ICON_TOURISM]");
				controlTable.ThemeBonus:SetToolTipString(themeBonusToolTip);
				controlTable.ThemeBonus:SetHide(false);
			end
			
			for i = 0, iNumGreatWorks - 1, 1 do
				local filledGreatWorkSlot = controlTable["BuildingFilledGreatWorkSlot" .. i + 1];
				
				local iGreatWorkIndex = pCity:GetBuildingGreatWork(iBuildingClass, i);
				if (iGreatWorkIndex >= 0) then
					local strGWTooltip = Game.GetGreatWorkTooltip(iGreatWorkIndex, pCity:GetOwner())
					--Crime
					local crimeGreatWorks = pPlayer:GetCrimePerGreatWork(pCity) 
					if crimeGreatWorks ~= 0 then
						strGWTooltip = strGWTooltip .. ", " .. Locale.ConvertTextKey("+{1_Num} [ICON_JFD_CRIME_BLACK]", crimeGreatWorks)
					end
					for row in GameInfo.Building_GreatWorkChangesUI("GreatWorkSlotType = '" .. buildingGreatWorkSlotType .. "'") do
						if pCity:IsHasBuilding(GameInfoTypes[row.BuildingType]) then
							if row.SpecialistType then
								local specialist = GameInfo.Specialists[row.SpecialistType]
								strGWTooltip = strGWTooltip .. ", " .. Locale.ConvertTextKey("+{1_Num} {2_Icon}", row.GreatPeopleRateChange, specialist.FontIcon)
							end	
						end
					end
					filledGreatWorkSlot:SetHide(false);
					filledGreatWorkSlot:SetTexture(filledTexture);
					filledGreatWorkSlot:SetToolTipString(strGWTooltip);
					
					local greatWorkType = Game.GetGreatWorkType(iGreatWorkIndex);
					local greatWork = GameInfo.GreatWorks[greatWorkType];
					
					filledGreatWorkSlot:ClearCallback(Mouse.eLClick);
					
					if(greatWork.GreatWorkClassType ~= "GREAT_WORK_ARTIFACT") then
						filledGreatWorkSlot:RegisterCallback(Mouse.eLClick, function() 
							local popupInfo = {
								Type = ButtonPopupTypes.BUTTONPOPUP_GREAT_WORK_COMPLETED_ACTIVE_PLAYER,
								Data1 = iGreatWorkIndex,
								Priority = PopupPriority.Current
							}
							Events.SerialEventGameMessagePopup(popupInfo);
						end);
					end	
				else
					filledGreatWorkSlot:SetHide(false);
					filledGreatWorkSlot:SetTexture(emptyTexture);
					filledGreatWorkSlot:LocalizeAndSetToolTip(buildingGreatWorkSlot.EmptyToolTipText);
					filledGreatWorkSlot:ClearCallback(Mouse.eLClick);
				end
			end	
		end		
		
		-- Empty Specialist Slots
		iNumSpecialists = pCity:GetNumSpecialistsAllowedByBuilding(buildingID)
		
		controlTable.BuildingEmptySpecialistSlot1:SetHide(true);
		controlTable.BuildingEmptySpecialistSlot2:SetHide(true);
		controlTable.BuildingEmptySpecialistSlot3:SetHide(true);
		
		if (iNumSpecialists >= 1) then
			controlTable.BuildingEmptySpecialistSlot1:SetHide(false);
		end
		if (iNumSpecialists >= 2) then
			controlTable.BuildingEmptySpecialistSlot2:SetHide(false);
		end
		if (iNumSpecialists >= 3) then
			controlTable.BuildingEmptySpecialistSlot3:SetHide(false);
		end
		
		-- Filled Specialist Slots
		iNumAssignedSpecialists = pCity:GetNumSpecialistsInBuilding(buildingID)

		if specialistTable[buildingID] == nil then
			specialistTable[buildingID] = { false, false, false };
			if (iNumAssignedSpecialists >= 1) then
				specialistTable[buildingID][1] = true;
			end
			if (iNumAssignedSpecialists >= 2) then
				specialistTable[buildingID][2] = true;
			end
			if (iNumAssignedSpecialists >= 3) then
				specialistTable[buildingID][3] = true;
			end
		else
			local numSlotsIThinkAreFilled = 0;
			for i = 1, 3 do
				if specialistTable[buildingID][i] then
					numSlotsIThinkAreFilled = numSlotsIThinkAreFilled + 1;
				end
			end
			if numSlotsIThinkAreFilled ~= iNumAssignedSpecialists then
				specialistTable[buildingID] = { false, false, false };
				if (iNumAssignedSpecialists >= 1) then
					specialistTable[buildingID][1] = true;
				end
				if (iNumAssignedSpecialists >= 2) then
					specialistTable[buildingID][2] = true;
				end
				if (iNumAssignedSpecialists >= 3) then
					specialistTable[buildingID][3] = true;
				end
			end
		end
		
		controlTable.BuildingFilledSpecialistSlot1:SetHide(true);
		controlTable.BuildingFilledSpecialistSlot2:SetHide(true);
		controlTable.BuildingFilledSpecialistSlot3:SetHide(true);
		
		if (specialistTable[buildingID][1]) then
			controlTable.BuildingEmptySpecialistSlot1:SetHide(true);
			controlTable.BuildingFilledSpecialistSlot1:SetHide(false);
		end
		if (specialistTable[buildingID][2]) then
			controlTable.BuildingEmptySpecialistSlot2:SetHide(true);
			controlTable.BuildingFilledSpecialistSlot2:SetHide(false);
		end
		if (specialistTable[buildingID][3]) then
			controlTable.BuildingEmptySpecialistSlot3:SetHide(true);
			controlTable.BuildingFilledSpecialistSlot3:SetHide(false);
		end
		
		local specialistName = nil;
		if building.SpecialistType then
			local iSpecialistID = GameInfoTypes[building.SpecialistType];
			local pSpecialistInfo = GameInfo.Specialists[iSpecialistID];
			if iSpecialistID == specialistGovernorID then
				specialistName = Locale.ConvertTextKey(pPlayer:GetCityGovernorDetails(pCity, building.Type));
			else
				specialistName = Locale.ConvertTextKey(pSpecialistInfo.Description);
			end
			-- local ToolTipString = specialistName .. " ";
			local ToolTipString = GetSpecialistToolTip(pCity, iSpecialistID, pSpecialistInfo, specialistName)
					
			-- Culture
			-- local iCultureFromSpecialist = pCity:GetCultureFromSpecialist(iSpecialistID);
			-- if (iCultureFromSpecialist > 0) then
				--CBP
				-- local extraYield = (pCity:GetSpecialistYield( iSpecialistID, YieldTypes.YIELD_CULTURE ) + pCity:GetSpecialistYieldChange(iSpecialistID, YieldTypes.YIELD_CULTURE))
				-- iCultureFromSpecialist = (iCultureFromSpecialist + extraYield)
				-- END
				-- ToolTipString = ToolTipString .. " +" .. iCultureFromSpecialist .. "[ICON_CULTURE]";
			-- end
			-- Faith

			-- Yield
			-- for pYieldInfo in GameInfo.Yields("IsFake = 0") do
				-- local iYieldID = pYieldInfo.ID;
				-- if(iYieldID ~= YieldTypes.YIELD_CULTURE) then
					-- local iYieldAmount = pCity:GetSpecialistYield(iSpecialistID, iYieldID);
					-- local iExtraYield = pCity:GetSpecialistYieldChange(iSpecialistID, iYieldID);
-- CBP
					-- if(iYieldAmount > 0) then
						-- iYieldAmount = (iYieldAmount + iExtraYield);
					-- end
-- End
				
					--Specialist Yield included in pCity:GetSpecialistYield();
					--iYieldAmount = iYieldAmount + Players[pCity:GetOwner()]:GetSpecialistExtraYield(iSpecialistID, iYieldID);
				
					-- if (iYieldAmount > 0) then
						-- ToolTipString = ToolTipString .. " +" .. iYieldAmount .. pYieldInfo.IconString;
					-- end
					-- if (iExtraYield > 0 and iYieldAmount <= 0) then
						-- ToolTipString = ToolTipString .. " +" .. iExtraYield .. pYieldInfo.IconString;
					-- end
				-- end
			-- end
			-- if pSpecialistInfo.GreatPeopleRateChange > 0 then
				-- ToolTipString = ToolTipString .. " +" .. pSpecialistInfo.GreatPeopleRateChange .. "[ICON_GREAT_PEOPLE]";					
			-- end
			--Development
			-- if userSettings["UserSettingCIDDevelopmentCore"] then
				-- local developmentPerSpecialist = pPlayer:GetDevelopmentPerSpecialist(pCity, pSpecialistInfo.ID) 
				-- if developmentPerSpecialist ~= 0 then
					-- ToolTipString = ToolTipString .. " +" .. developmentPerSpecialist .. "[ICON_JFD_DEVELOPMENT]" 
				-- end
			-- end
			--Loyalty Sentiment
			-- if userSettings["UserSettingCIDLoyaltyCore"] then
				-- for row in GameInfo.Policy_SpecialistSentimentChanges("SpecialistType = '" .. pSpecialistInfo.Type .. "'") do
					-- if pPlayer:HasPolicy(GameInfoTypes[row.PolicyType]) then
						-- if row.RevoltSentimentChange ~= 0 then
							-- ToolTipString = ToolTipString .. " -" .. row.RevoltSentimentChange .. "[ICON_JFD_REVOLT]" 
						-- end
						-- if row.WLTKDSentimentChange ~= 0 then
							-- ToolTipString = ToolTipString .. " +" .. row.WLTKDSentimentChange .. "[ICON_JFD_WLTKD]" 
						-- end
					-- end
				-- end
			-- end
			--Crime
			-- local crimeSpecialists = pPlayer:GetCrimePerSpecialist(pCity) 
			-- if crimeSpecialists ~= 0 then
				-- ToolTipString = ToolTipString .. " +" .. crimeSpecialists .. "[ICON_JFD_CRIME_BLACK]"
			-- end
			controlTable.BuildingFilledSpecialistSlot1:SetToolTipString(ToolTipString);
			controlTable.BuildingFilledSpecialistSlot2:SetToolTipString(ToolTipString);
			controlTable.BuildingFilledSpecialistSlot3:SetToolTipString(ToolTipString);
			ToolTipString = emptySlotString.."[NEWLINE]("..ToolTipString..")";
			controlTable.BuildingEmptySpecialistSlot1:SetToolTipString(ToolTipString);
			controlTable.BuildingEmptySpecialistSlot2:SetToolTipString(ToolTipString);
			controlTable.BuildingEmptySpecialistSlot3:SetToolTipString(ToolTipString);
			if pCity:IsResistance() then
				controlTable.BuildingFilledSpecialistSlot1:SetToolTipString(controlTable.BuildingFilledSpecialistSlot1:GetToolTipString() .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_CITY_VIEW_SPECIALIST_RESISTANCE"));
				controlTable.BuildingFilledSpecialistSlot2:SetToolTipString(controlTable.BuildingFilledSpecialistSlot2:GetToolTipString() .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_CITY_VIEW_SPECIALIST_RESISTANCE"));
				controlTable.BuildingFilledSpecialistSlot3:SetToolTipString(controlTable.BuildingFilledSpecialistSlot3:GetToolTipString() .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_CITY_VIEW_SPECIALIST_RESISTANCE"));
				
				controlTable.BuildingEmptySpecialistSlot1:SetToolTipString(controlTable.BuildingEmptySpecialistSlot1:GetToolTipString() .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_CITY_VIEW_SPECIALIST_RESISTANCE"));
				controlTable.BuildingEmptySpecialistSlot2:SetToolTipString(controlTable.BuildingEmptySpecialistSlot2:GetToolTipString() .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_CITY_VIEW_SPECIALIST_RESISTANCE"));
				controlTable.BuildingEmptySpecialistSlot3:SetToolTipString(controlTable.BuildingEmptySpecialistSlot3:GetToolTipString() .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_CITY_VIEW_SPECIALIST_RESISTANCE"));
			end
			
			local specialistTexture = GameInfo.Specialists[building.SpecialistType].SlotTexture
			if specialistTexture then
				controlTable.BuildingFilledSpecialistSlot1:SetTexture(specialistTexture);
				controlTable.BuildingFilledSpecialistSlot2:SetTexture(specialistTexture);
				controlTable.BuildingFilledSpecialistSlot3:SetTexture(specialistTexture);
			else
				controlTable.BuildingFilledSpecialistSlot1:SetTexture(workerTexture);
				controlTable.BuildingFilledSpecialistSlot2:SetTexture(workerTexture);
				controlTable.BuildingFilledSpecialistSlot3:SetTexture(workerTexture);
			end
		end

		if (UI.IsCityScreenViewingMode()) then
			controlTable.BuildingFilledSpecialistSlot1:RegisterCallback( Mouse.eLClick, DisableSpecialist );
			controlTable.BuildingFilledSpecialistSlot2:RegisterCallback( Mouse.eLClick, DisableSpecialist );
			controlTable.BuildingFilledSpecialistSlot3:RegisterCallback( Mouse.eLClick, DisableSpecialist );
		else
			controlTable.BuildingFilledSpecialistSlot1:RegisterCallback( Mouse.eLClick, RemoveSpecialist );
			controlTable.BuildingFilledSpecialistSlot2:RegisterCallback( Mouse.eLClick, RemoveSpecialist );
			controlTable.BuildingFilledSpecialistSlot3:RegisterCallback( Mouse.eLClick, RemoveSpecialist );
		end

		if (specialistName ~= nil) then
			pediaSearchStrings[tostring(controlTable.BuildingFilledSpecialistSlot1)] = specialistName;
			controlTable.BuildingFilledSpecialistSlot1:RegisterCallback( Mouse.eRClick, GetPedia );
			pediaSearchStrings[tostring(controlTable.BuildingFilledSpecialistSlot2)] = specialistName;
			controlTable.BuildingFilledSpecialistSlot2:RegisterCallback( Mouse.eRClick, GetPedia );
			pediaSearchStrings[tostring(controlTable.BuildingFilledSpecialistSlot3)] = specialistName;
			controlTable.BuildingFilledSpecialistSlot3:RegisterCallback( Mouse.eRClick, GetPedia );
		end
		
		controlTable.BuildingFilledSpecialistSlot1:SetVoids( buildingID, 1 );
		controlTable.BuildingFilledSpecialistSlot2:SetVoids( buildingID, 2 );
		controlTable.BuildingFilledSpecialistSlot3:SetVoids( buildingID, 3 );

		if (UI.IsCityScreenViewingMode()) then
			controlTable.BuildingEmptySpecialistSlot1:RegisterCallback( Mouse.eLClick, DisableSpecialist );
			controlTable.BuildingEmptySpecialistSlot2:RegisterCallback( Mouse.eLClick, DisableSpecialist );
			controlTable.BuildingEmptySpecialistSlot3:RegisterCallback( Mouse.eLClick, DisableSpecialist );
		else
			controlTable.BuildingEmptySpecialistSlot1:RegisterCallback( Mouse.eLClick, AddSpecialist );
			controlTable.BuildingEmptySpecialistSlot2:RegisterCallback( Mouse.eLClick, AddSpecialist );
			controlTable.BuildingEmptySpecialistSlot3:RegisterCallback( Mouse.eLClick, AddSpecialist );
		end

		controlTable.BuildingEmptySpecialistSlot1:SetVoids( buildingID, 1 );
		controlTable.BuildingEmptySpecialistSlot2:SetVoids( buildingID, 2 );
		controlTable.BuildingEmptySpecialistSlot3:SetVoids( buildingID, 3 );


		-- Tool Tip
		local bExcludeHeader = false;
		local bExcludeName = false;
		local bNoMaintenance = bIsBuildingFree;
		local strToolTip = GetHelpTextForBuilding(buildingID, bExcludeName, bExcludeHeader, bNoMaintenance, pCity);
		--strToolTip = strToolTip .. Locale.ConvertTextKey(building.Help);
		
		--if (not bIsBuildingFree) then
			--local iMaintenance = building.GoldMaintenance;
			--if (iMaintenance ~= 0) then
				--strToolTip = strToolTip .. "[NEWLINE][NEWLINE]" .. tostring(iMaintenance) .. "[ICON_GOLD]" .. Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_MAINTENANCE" );
			--end
		--end
		
		if (iNumAssignedSpecialists > 0) then
			if(building.SpecialistType) then
				local pSpecialistInfo = GameInfo.Specialists[building.SpecialistType];
				local iSpecialistID = pSpecialistInfo.ID;
				
				strToolTip = strToolTip .. "[NEWLINE][NEWLINE]";
					
				local yields = {};
				
				-- Development
				local iDevelopmentFromSpecialist = pPlayer:GetDevelopmentPerSpecialist(pCity, iSpecialistID)
				if iDevelopmentFromSpecialist ~= 0 then
					table.insert(yields, tostring(iDevelopmentFromSpecialist) .. "[ICON_JFD_DEVELOPMENT]");
				end
				
				-- Crime
				local iCrimeFromSpecialist = pPlayer:GetCrimePerSpecialist(pCity, iSpecialistID)
				if iCrimeFromSpecialist ~= 0 then
					table.insert(yields, tostring(iCrimeFromSpecialist) .. "[ICON_JFD_CRIME_BLACK]");
				end
				
				-- Culture
				local iCultureFromSpecialist = 0; 
				
				-- Yield
				for pYieldInfo in GameInfo.Yields("IsFake = 0 AND Type != 'YIELD_JFD_CRIME'") do
					local iYieldID = pYieldInfo.ID;
-- CBP
					if(iYieldID == YieldTypes.YIELD_CULTURE)then
						iCultureFromSpecialist = pCity:GetCultureFromSpecialist(iSpecialistID) + pCity:GetSpecialistYield( iSpecialistID, YieldTypes.YIELD_CULTURE ) + pCity:GetSpecialistYieldChange( iSpecialistID, YieldTypes.YIELD_CULTURE);
						if(iCultureFromSpecialist ~= 0) then
							table.insert(yields, tostring(iCultureFromSpecialist) .. "[ICON_CULTURE]");
						end
--END
					elseif(iYieldID ~= YieldTypes.YIELD_CULTURE)then
						local iYieldAmount = pCity:GetSpecialistYield(iSpecialistID, iYieldID);
-- CBP
						if(iYieldAmount ~= 0) then
							local iExtraYield = pCity:GetSpecialistYieldChange(iSpecialistID, iYieldID);
							iYieldAmount = (iYieldAmount + iExtraYield);
						end
-- End
					
						if (iYieldAmount ~= 0) then
							table.insert(yields, tostring(iYieldAmount) .. pYieldInfo.IconString);
						end
					end
				end
				
				local strYield = table.concat(yields, " ");
				
				local str = Locale.Lookup("TXT_KEY_CITYVIEW_BUILDING_SPECIALIST_YIELD", iNumAssignedSpecialists, pSpecialistInfo.Description, strYield);
				
				strToolTip = strToolTip .. str;
			end				
		end
		
		-- Can we sell this thing?
		local building = GameInfo.Buildings[buildingID]
		local iCrime = Game.GetBuildingYieldChange(buildingID, GameInfo.Yields["YIELD_JFD_CRIME"].ID)
		if ((pCity:IsBuildingSellable(buildingID) or (iCrime > 0 and (building.Cost > 0 or building.FaithCost > 0) and pCity:GetNumFreeBuilding(buildingID) == 0)) and not pCity:IsPuppet()) then
			strToolTip = strToolTip .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey( "TXT_KEY_CLICK_TO_SELL" );
			controlTable.BuildingButton:RegisterCallback( Mouse.eLClick, OnBuildingClicked );
			controlTable.BuildingButton:SetVoid1( buildingID );
		-- We have to clear the data out here or else the instance manager will recycle it in other cities!
		else
			controlTable.BuildingButton:ClearCallback(Mouse.eLClick);
			controlTable.BuildingButton:SetVoid1( -1 );
		end
		
		controlTable.BuildingButton:SetToolTipString(strToolTip);
		
		controlTable.BuildingFilledSpecialistSlot1:SetDisabled( false );
		controlTable.BuildingFilledSpecialistSlot2:SetDisabled( false );
		controlTable.BuildingFilledSpecialistSlot3:SetDisabled( false );
		controlTable.BuildingEmptySpecialistSlot1:SetDisabled( false );
		controlTable.BuildingEmptySpecialistSlot2:SetDisabled( false );
		controlTable.BuildingEmptySpecialistSlot3:SetDisabled( false );

		-- Viewing Mode only
		if (UI.IsCityScreenViewingMode()) then
			controlTable.BuildingButton:SetDisabled( true );
		else
			controlTable.BuildingButton:SetDisabled( false );
		end
	end
end

function UpdateThisQueuedItem(city, queuedItemNumber, queueLength)
	local buttonPrefix = "b"..tostring(queuedItemNumber);
	local queuedOrderType;
	local queuedData1;
	local queuedData2;
	local queuedSave;
	local queuedRush;
	local controlBox = buttonPrefix.."box";
	local controlImage = buttonPrefix.."image";
	local controlName = buttonPrefix.."name";
	local controlTurns = buttonPrefix.."turns";
	local isMaint = false;
	
	local strToolTip = "";
	
	local bGeneratingProduction = false;
	if (city:GetCurrentProductionDifferenceTimes100(false, false) > 0) then
		bGeneratingProduction = true;
	end
	
	Controls[controlTurns]:SetHide( false );
	queuedOrderType, queuedData1, queuedData2, queuedSave, queuedRush = city:GetOrderFromQueue( queuedItemNumber-1 );
    if (queuedOrderType == OrderTypes.ORDER_TRAIN) then
		local thisUnitInfo = GameInfo.Units[queuedData1];
		local portraitOffset, portraitAtlas = UI.GetUnitPortraitIcon(queuedData1, city:GetOwner());
		IconHookup( portraitOffset, 45, portraitAtlas, Controls[controlImage] );
		Controls[controlName]:SetText( Locale.ConvertTextKey( thisUnitInfo.Description ) );
		if (bGeneratingProduction) then
			Controls[controlTurns]:SetText(Locale.ConvertTextKey("TXT_KEY_PRODUCTION_HELP_NUM_TURNS", city:GetUnitProductionTurnsLeft(queuedData1, queuedItemNumber-1) ) );
		else
			Controls[controlTurns]:SetText(Locale.ConvertTextKey("TXT_KEY_PRODUCTION_HELP_INFINITE_TURNS"));
		end
		
		if (thisUnitInfo.Help ~= nil) then
			strToolTip = thisUnitInfo.Help;
		end
    elseif (queuedOrderType == OrderTypes.ORDER_CONSTRUCT) then
		local thisBuildingInfo = GameInfo.Buildings[queuedData1];
		IconHookup( thisBuildingInfo.PortraitIndex, 45, thisBuildingInfo.IconAtlas, Controls[controlImage] );
		Controls[controlName]:SetText( Locale.ConvertTextKey( thisBuildingInfo.Description ) );
		if (bGeneratingProduction) then
			Controls[controlTurns]:SetText(  Locale.ConvertTextKey("TXT_KEY_PRODUCTION_HELP_NUM_TURNS", city:GetBuildingProductionTurnsLeft(queuedData1, queuedItemNumber-1)) );
		else
			Controls[controlTurns]:SetText(Locale.ConvertTextKey("TXT_KEY_PRODUCTION_HELP_INFINITE_TURNS"));
		end
		
		if (thisBuildingInfo.Help ~= nil) then
			strToolTip = thisBuildingInfo.Help;
		end
    elseif (queuedOrderType == OrderTypes.ORDER_CREATE) then
		local thisProjectInfo = GameInfo.Projects[queuedData1];
		IconHookup( thisProjectInfo.PortraitIndex, 45, thisProjectInfo.IconAtlas, Controls[controlImage] );
		Controls[controlName]:SetText( Locale.ConvertTextKey( thisProjectInfo.Description ) );
		if (bGeneratingProduction) then
			Controls[controlTurns]:SetText(  Locale.ConvertTextKey("TXT_KEY_PRODUCTION_HELP_NUM_TURNS",city:GetProjectProductionTurnsLeft(queuedData1, queuedItemNumber-1)) );
		else
			Controls[controlTurns]:SetText(Locale.ConvertTextKey("TXT_KEY_PRODUCTION_HELP_INFINITE_TURNS"));
		end
		
		if (thisProjectInfo.Help ~= nil) then
			strToolTip = thisProjectInfo.Help;
		end
    elseif (queuedOrderType == OrderTypes.ORDER_MAINTAIN) then
		isMaint = true;
 		local thisProcessInfo = GameInfo.Processes[queuedData1];
		IconHookup( thisProcessInfo.PortraitIndex, 45, thisProcessInfo.IconAtlas, Controls[controlImage] );
		Controls[controlName]:SetText( Locale.ConvertTextKey( thisProcessInfo.Description ) );
		Controls[controlTurns]:SetHide( true );
		
		if (thisProcessInfo.Help ~= nil) then
			strToolTip = thisProcessInfo.Help;
		end
   end
   
	Controls[controlBox]:SetToolTipString(Locale.ConvertTextKey(strToolTip));
	return isMaint;
end

-------------------------------------------------
-- Specialist Tooltip
-------------------------------------------------
function GetSpecialistToolTip(pCity, iSpecialistID, pSpecialistInfo, specialistName)
	local pPlayer = Players[pCity:GetOwner()]
	local ToolTipString = specialistName .. " ";
	-- Culture
	local iCultureFromSpecialist = pCity:GetCultureFromSpecialist(iSpecialistID);
	if (iCultureFromSpecialist > 0) then
		--CBP
		local extraYield = (pCity:GetSpecialistYield( iSpecialistID, YieldTypes.YIELD_CULTURE ) + pCity:GetSpecialistYieldChange(iSpecialistID, YieldTypes.YIELD_CULTURE))
		iCultureFromSpecialist = (iCultureFromSpecialist + extraYield)
		-- END
		ToolTipString = ToolTipString .. " +" .. iCultureFromSpecialist .. "[ICON_CULTURE]";
	end
	-- Faith

	-- Yield
	for pYieldInfo in GameInfo.Yields("IsFake = 0") do
		local iYieldID = pYieldInfo.ID;
		if(iYieldID ~= YieldTypes.YIELD_CULTURE) then
			local iYieldAmount = pCity:GetSpecialistYield(iSpecialistID, iYieldID);
			local iExtraYield = pCity:GetSpecialistYieldChange(iSpecialistID, iYieldID);
-- CBP
					if(iYieldAmount > 0) then
						iYieldAmount = (iYieldAmount + iExtraYield);
					end
-- End
		
			--Specialist Yield included in pCity:GetSpecialistYield();
			--iYieldAmount = iYieldAmount + Players[pCity:GetOwner()]:GetSpecialistExtraYield(iSpecialistID, iYieldID);
		
			if (iYieldAmount > 0) then
				ToolTipString = ToolTipString .. " +" .. iYieldAmount .. pYieldInfo.IconString;
			end
			if (iExtraYield > 0 and iYieldAmount <= 0) then
				ToolTipString = ToolTipString .. " +" .. iExtraYield .. pYieldInfo.IconString;
			end
		end
	end
	if pSpecialistInfo.GreatPeopleRateChange > 0 then
		ToolTipString = ToolTipString .. " +" .. pSpecialistInfo.GreatPeopleRateChange .. "[ICON_GREAT_PEOPLE]";					
	end
	--Development
	if userSettings["UserSettingCIDDevelopmentCore"] then
		local developmentPerSpecialist = pPlayer:GetDevelopmentPerSpecialist(pCity, pSpecialistInfo.ID) 
		if developmentPerSpecialist ~= 0 then
			ToolTipString = ToolTipString .. " +" .. developmentPerSpecialist .. "[ICON_JFD_DEVELOPMENT]" 
		end
	end
	--Loyalty Sentiment
	if userSettings["UserSettingCIDLoyaltyCore"] then
		for row in GameInfo.Policy_SpecialistSentimentChanges("SpecialistType = '" .. pSpecialistInfo.Type .. "'") do
			if pPlayer:HasPolicy(GameInfoTypes[row.PolicyType]) then
				if row.RevoltSentimentChange ~= 0 then
					ToolTipString = ToolTipString .. " -" .. row.RevoltSentimentChange .. "[ICON_JFD_REVOLT]" 
				end
				if row.WLTKDSentimentChange ~= 0 then
					ToolTipString = ToolTipString .. " +" .. row.WLTKDSentimentChange .. "[ICON_JFD_WLTKD]" 
				end
			end
		end
	end
	--Crime
	local crimeSpecialists = pPlayer:GetCrimePerSpecialist(pCity, pSpecialistInfo.ID) 
	if crimeSpecialists ~= 0 then
		if crimeSpecialists > 0 then 
			ToolTipString = ToolTipString .. " +" .. crimeSpecialists .. "[ICON_JFD_CRIME_BLACK]"
		else
			ToolTipString = ToolTipString .. " " .. crimeSpecialists .. "[ICON_JFD_CRIME_BLACK]"
		end
	end
	return ToolTipString
end	
-------------------------------------------------
-- JFD District List
-------------------------------------------------
function JFD_AddBuildingsToDistrict(pCity, districtID, thisButton, thisButtonLabel, thisButtonDevelopmentLabel, sortedList)
	if buildingDistrictHeadingOpen[districtID] then
		for i, v in ipairs(sortedList) do
			if v.CategoryID == districtID then
				local building = GameInfo.Buildings[v.ID];
				AddBuildingButton( pCity, building );
			end
		end
	end
	local pPlayer = Players[pCity:GetOwner()]
	local districtMultiplier, districtMultiplierTT = pPlayer:GetDistrictDevelopmentMultipliers(pCity, districtID, true, true)
	if buildingDistrictHeadingOpen[districtID] then
		local localizedLabel = "[ICON_MINUS] "..Locale.ConvertTextKey( GameInfo.JFD_Districts[districtID].Description );
		if userSettings["UserSettingCIDDevelopmentCore"] then
			thisButtonDevelopmentLabel:LocalizeAndSetText("TXT_KEY_DISTRICT_DEVELOPMENT_MULTIPLIER", districtMultiplier);
			thisButtonDevelopmentLabel:LocalizeAndSetToolTip("TXT_KEY_DISTRICT_DEVELOPMENT_MULTIPLIER_TT", districtMultiplier, districtMultiplierTT);
			thisButtonDevelopmentLabel:SetHide(false)
		else
			thisButtonDevelopmentLabel:SetHide(true)
		end
		thisButtonLabel:SetText(localizedLabel);
	else
		local localizedLabel = "[ICON_PLUS] "..Locale.ConvertTextKey( GameInfo.JFD_Districts[districtID].Description );
		if userSettings["UserSettingCIDDevelopmentCore"] then
			thisButtonDevelopmentLabel:LocalizeAndSetText("TXT_KEY_DISTRICT_DEVELOPMENT_MULTIPLIER", districtMultiplier);
			thisButtonDevelopmentLabel:LocalizeAndSetToolTip("TXT_KEY_DISTRICT_DEVELOPMENT_MULTIPLIER_TT", districtMultiplier, districtMultiplierTT);
			thisButtonDevelopmentLabel:SetHide(false)
		else
			thisButtonDevelopmentLabel:SetHide(true)
		end
		thisButtonLabel:SetText(localizedLabel);
	end
end
-------------------------------------------------
-- City View Update
-------------------------------------------------
local resourceMagistratesID	= GameInfoTypes["RESOURCE_MAGISTRATES"]
function OnCityViewUpdate()
    if( ContextPtr:IsHidden() ) then
        return;
    end
        
	local pCity = UI.GetHeadSelectedCity();
	local iPlayer = pCity:GetOwner();
	local pPlayer = Players[iPlayer];
	local isActiveTeamCity = true;
	
	--Governor Title
	local provinceID = pCity:GetProvinceLevel()
	Controls.ProvinceDetailsBox:SetHide(true)
	
	--JFD Yield Panels
	if pCity:FoodDifference() < 0 then
		yield1HeadingOpen = true;
	end
	if pCity:HasPlague() or pCity:IsResistance() then
		yield2HeadingOpen = true;
	end
	if pCity:GetProductionUnit() ~= -1 then
		yield5HeadingOpen = true;
	end
	if pCity:GetOrganizedCrime() ~= -1 or pCity:GetLoyaltyState() < 3 then
		yield6HeadingOpen = true;
	end

	if gPreviousCity ~= pCity then
		gPreviousCity = pCity;
		specialistTable = {};
	end
	
	if (pCity ~= nil) then
	
		pediaSearchStrings = {};
		
		-- Auto Specialist checkbox
		local isNoAutoAssignSpecialists = pCity:IsNoAutoAssignSpecialists();
		Controls.NoAutoSpecialistCheckbox:SetCheck(isNoAutoAssignSpecialists);
		Controls.NoAutoSpecialistCheckbox2:SetCheck(isNoAutoAssignSpecialists);
	
		-- slewis - I'm showing this because when we're in espionage mode we hide this button
		Controls.EditButton:SetHide(false);
		Controls.PurchaseButton:SetDisabled(false);
		--local purchaseString = "[ICON_GOLD]/[ICON_PEACE]"
		--if userSettings["UserSettingCIDSlaveryCore"] then -- JFD Slavery
			-- purchaseString = purchaseString .. "/[ICON_JFD_SHACKLES]"
		-- end
		--if userSettings["UserSettingCIDProvincesCoreLevies"] then -- JFD Provinces
		--	purchaseString = purchaseString .. "/[ICON_CITIZEN]"
		--end
		--Controls.PurchaseButtonLabel:SetText(purchaseString);
		Controls.EndTurnText:SetText(Locale.ConvertTextKey("TXT_KEY_CITYVIEW_RETURN_TO_MAP"));
		
		-------------------------------------------
		-- City Banner
		-------------------------------------------
		
		-- Update capital icon
		local isCapital = pCity:IsCapital();
		Controls.CityCapitalIcon:SetHide(not isCapital);
		
		-- Connected to capital?
		if (isActiveTeamCity) then
			if (not isCapital and pPlayer:IsCapitalConnectedToCity(pCity) and not pCity:IsBlockaded()) then
				Controls.ConnectedIcon:SetHide(false);
				Controls.ConnectedIcon:LocalizeAndSetToolTip("TXT_KEY_CITY_CONNECTED");
			else
				Controls.ConnectedIcon:SetHide(true);
			end
		end
			
		-- Blockaded
		if (pCity:IsBlockaded()) then
			Controls.BlockadedIcon:SetHide(false);
			Controls.BlockadedIcon:LocalizeAndSetToolTip("TXT_KEY_CITY_BLOCKADED");
		else
			Controls.BlockadedIcon:SetHide(true);
		end
		
		-- Being Razed
		if (pCity:IsRazing()) then
			Controls.RazingIcon:SetHide(false);
			Controls.RazingIcon:LocalizeAndSetToolTip("TXT_KEY_CITY_BURNING", pCity:GetRazingTurns());
		else
			Controls.RazingIcon:SetHide(true);
		end
		
		-- In Resistance
		if (pCity:IsResistance()) then
			Controls.ResistanceIcon:SetHide(false);
			Controls.ResistanceIcon:LocalizeAndSetToolTip("TXT_KEY_CITY_RESISTANCE", pCity:GetResistanceTurns());
		else
			Controls.ResistanceIcon:SetHide(true);
		end

		-- Puppet Status
		if (pCity:IsPuppet()) and (not pCity:IsColony()) then
			Controls.PuppetIcon:SetHide(false);
			Controls.PuppetIcon:LocalizeAndSetToolTip("TXT_KEY_CITY_PUPPET");
		else
			Controls.PuppetIcon:SetHide(true);
		end

		-- Colony Status
		if pCity:IsColony() then
			if (not userSettings["UserSettingCIDProvincesCore"]) then
				Controls.ColonyIcon:SetHide(false);
				Controls.ColonyIcon:LocalizeAndSetToolTip("TXT_KEY_CITY_JFD_COLONY_BANNER_TT");
			else
				Controls.ColonyIcon:SetHide(true)
			end	
			local canAssimilate, requiredPopulation, costGold, costMagistrates = pPlayer:CanDecolonize(pCity)
			local assimilateStringTT = Locale.ConvertTextKey("TXT_KEY_CITYVIEW_JFD_ASSIMILATE_BUTTON_TT")
			local assimilateGoldCostStringTT = ""
			local assimilateMagistrateCostStringTT = ""
			if userSettings["UserSettingCIDProvincesCore"] then assimilateStringTT = Locale.ConvertTextKey("TXT_KEY_CITYVIEW_JFD_ASSIMILATE_BUTTON_TT_PROVINCES") end
			assimilateGoldCostStringTT = Locale.ConvertTextKey("TXT_KEY_CITYVIEW_JFD_ASSIMILATE_BUTTON_TT_COST_GOLD", costGold)
			assimilateStringTT = assimilateStringTT .. assimilateGoldCostStringTT 
			if isUsingED then 
				assimilateMagistrateCostStringTT = assimilateMagistrateCostStringTT .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_JFD_ASSIMILATE_BUTTON_TT_COST_MAGISTRATES", costMagistrates) 
				if isUsingED and pPlayer:GetNumResourceAvailable(resourceMagistratesID, false) < costMagistrates then 
					assimilateMagistrateCostStringTT = "[COLOR_NEGATIVE_TEXT]" .. assimilateMagistrateCostStringTT .. "[ENDCOLOR]" 
				end
				assimilateStringTT = assimilateStringTT .. assimilateMagistrateCostStringTT
			end
			if pPlayer:GetGold() < costGold then 
				assimilateGoldCostStringTT = "[COLOR_NEGATIVE_TEXT]" .. assimilateGoldCostStringTT .. "[ENDCOLOR]" 
			end
			if pCity:GetPopulation() < requiredPopulation then
				assimilateStringTT = assimilateStringTT .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_JFD_ASSIMILATE_BUTTON_TT_DISABLED", requiredPopulation)
			end
			Controls.AssimilateColonyButton:SetDisabled(not canAssimilate)
			Controls.AssimilateColonyButton:SetHide(false)
			Controls.AssimilateColonyButton:SetToolTipString(assimilateStringTT)
		else
			Controls.ColonyIcon:SetHide(true)
			Controls.AssimilateColonyButton:SetHide(true)
		end
		
		-- Occupation Status
		if (pCity:IsOccupied() and not pCity:IsNoOccupiedUnhappiness()) then
			Controls.OccupiedIcon:SetHide(false);
			Controls.OccupiedIcon:LocalizeAndSetToolTip("TXT_KEY_CITY_OCCUPIED");
		else
			Controls.OccupiedIcon:SetHide(true);
		end	
		
		local cityName = pCity:GetNameKey();
		local convertedKey = Locale.ConvertTextKey(cityName);
		
		if (pCity:IsRazing()) then
			convertedKey = convertedKey .. " (" .. Locale.ConvertTextKey("TXT_KEY_BURNING") .. ")";
		end
		
		if (pPlayer:GetNumCities() <= 1) then
			Controls.PrevCityButton:SetDisabled( true );
			Controls.NextCityButton:SetDisabled( true );
		else
			Controls.PrevCityButton:SetDisabled( false );
			Controls.NextCityButton:SetDisabled( false );
		end
		
		OnCitySetDamage(pCity:GetDamage(), pCity:GetMaxHitPoints());
		
		convertedKey = Locale.ToUpper(convertedKey);

		local cityNameSize = (math.abs(Controls.NextCityButton:GetOffsetX()) * 2) - (Controls.PrevCityButton:GetSizeX()); 
			         
		if(isCapital)then
			cityNameSize = cityNameSize - Controls.CityCapitalIcon:GetSizeX();
		end
		TruncateString(Controls.CityNameTitleBarLabel, cityNameSize, convertedKey); 

-- COMMUNITY PATCH
		if isUsingCBO then
			local iStarvingUnhappiness = pCity:GetUnhappinessFromStarving();
			local iPillagedUnhappiness = pCity:GetUnhappinessFromPillaged();
			local iGoldUnhappiness = pCity:GetUnhappinessFromGold();
			local iDefenseUnhappiness = pCity:GetUnhappinessFromDefense();
			local iConnectionUnhappiness = pCity:GetUnhappinessFromConnection();
			local iMinorityUnhappiness = pCity:GetUnhappinessFromMinority();
			local iScienceUnhappiness = pCity:GetUnhappinessFromScience();
			local iCultureUnhappiness = pCity:GetUnhappinessFromCulture();
			local iResistanceUnhappiness = 0;
			if(pCity:IsRazing()) then
				iResistanceUnhappiness = (pCity:GetPopulation() / 2);
			elseif(pCity:IsResistance()) then
				iResistanceUnhappiness = (pCity:GetPopulation() / 2);
			end
			local iOccupationUnhappiness = 0;
			if(pCity:IsOccupied() and not pCity:IsNoOccupiedUnhappiness() and not pCity:IsResistance() and not pCity:IsRazing()) then
				iOccupationUnhappiness = (pCity:GetPopulation() * GameDefines.UNHAPPINESS_PER_OCCUPIED_POPULATION);
			end
				
			local iTotalUnhappiness = iScienceUnhappiness + iCultureUnhappiness + iDefenseUnhappiness + iGoldUnhappiness + iConnectionUnhappiness + iPillagedUnhappiness + iStarvingUnhappiness + iMinorityUnhappiness + iOccupationUnhappiness + iResistanceUnhappiness;
	
			local iPuppetMod = pPlayer:GetPuppetUnhappinessMod();
			local iCultureYield = pCity:GetUnhappinessFromCultureYield() / 100;
			local iDefenseYield = pCity:GetUnhappinessFromDefenseYield() / 100;
			local iGoldYield = pCity:GetUnhappinessFromGoldYield() / 100;
			local iCultureNeeded = pCity:GetUnhappinessFromCultureNeeded() / 100;
			local iDefenseNeeded = pCity:GetUnhappinessFromDefenseNeeded() / 100;
			local iGoldNeeded = pCity:GetUnhappinessFromGoldNeeded() / 100;
			local iScienceYield = pCity:GetUnhappinessFromScienceYield() / 100;
			local iScienceNeeded = pCity:GetUnhappinessFromScienceNeeded() / 100;
	
			local iCultureDeficit = pCity:GetUnhappinessFromCultureDeficit() / 100;
			local iDefenseDeficit = pCity:GetUnhappinessFromDefenseDeficit() / 100;
			local iGoldDeficit = pCity:GetUnhappinessFromGoldDeficit() / 100;
			local iScienceDeficit = pCity:GetUnhappinessFromScienceDeficit() / 100;
	
			strOccupationTT = Locale.ConvertTextKey("TXT_KEY_EO_CITY_LOCAL_UNHAPPINESS", iTotalUnhappiness);
	
			if(pCity:IsPuppet()) then
				if (iPuppetMod ~= 0) then
					strOccupationTT = strOccupationTT .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_PUPPET_UNHAPPINESS_MOD", iPuppetMod);
				end
			end
			
			-- Occupation tooltip
			if (iOccupationUnhappiness ~= 0) then
				strOccupationTT = strOccupationTT .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_OCCUPATION_UNHAPPINESS", iOccupationUnhappiness);
			end
			-- Resistance tooltip
			if (iResistanceUnhappiness ~= 0) then
				strOccupationTT = strOccupationTT .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_RESISTANCE_UNHAPPINESS", iResistanceUnhappiness);
			end
			-- Starving tooltip
			if (iStarvingUnhappiness ~= 0) then
				strOccupationTT = strOccupationTT .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_STARVING_UNHAPPINESS", iStarvingUnhappiness);
			end
			-- Pillaged tooltip
			if (iPillagedUnhappiness ~= 0) then
				strOccupationTT = strOccupationTT .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_PILLAGED_UNHAPPINESS", iPillagedUnhappiness);
			end
			-- Gold tooltip
			if (iGoldUnhappiness > 0) then
				strOccupationTT = strOccupationTT .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_GOLD_UNHAPPINESS", iGoldUnhappiness, iGoldYield, iGoldNeeded, iGoldDeficit);
			end
			if ((iGoldYield - iGoldNeeded) >= 0) then
				strOccupationTT = strOccupationTT .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_GOLD_UNHAPPINESS_SURPLUS", (iGoldYield - iGoldNeeded));
			end
			-- Defense tooltip
			if (iDefenseUnhappiness > 0) then
				strOccupationTT = strOccupationTT .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_DEFENSE_UNHAPPINESS", iDefenseUnhappiness, iDefenseYield, iDefenseNeeded, iDefenseDeficit);
			end
			if ((iDefenseYield - iDefenseNeeded) >= 0) then
				strOccupationTT = strOccupationTT .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_DEFENSE_UNHAPPINESS_SURPLUS", (iDefenseYield - iDefenseNeeded));
			end
			-- Connection tooltip
			if (iConnectionUnhappiness ~= 0) then
				strOccupationTT = strOccupationTT .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_CONNECTION_UNHAPPINESS", iConnectionUnhappiness);
			end
			-- Minority tooltip
			if (iMinorityUnhappiness ~= 0) then
				strOccupationTT = strOccupationTT .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_MINORITY_UNHAPPINESS", iMinorityUnhappiness);
			end
			-- Science tooltip
			if (iScienceUnhappiness > 0) then
				strOccupationTT = strOccupationTT .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_SCIENCE_UNHAPPINESS", iScienceUnhappiness, iScienceYield, iScienceNeeded, iScienceDeficit);
			end
			if ((iScienceYield - iScienceNeeded) >= 0) then
				strOccupationTT = strOccupationTT .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_SCIENCE_UNHAPPINESS_SURPLUS", (iScienceYield - iScienceNeeded));
			end
			-- Culture tooltip
			if (iCultureUnhappiness > 0) then
				strOccupationTT = strOccupationTT .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_UNHAPPINESS", iCultureUnhappiness, iCultureYield, iCultureNeeded, iCultureDeficit);
			end
			if ((iCultureYield - iCultureNeeded) >= 0) then
				strOccupationTT = strOccupationTT .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_CULTURE_UNHAPPINESS_SURPLUS", (iCultureYield - iCultureNeeded));
			end
	
			Controls.CityNameTitleBarLabel:LocalizeAndSetToolTip(strOccupationTT);
			local strCityHappinessTooltip = pPlayer:GetCityHappinessTTForCBO(pCity);
			Controls.HappinessBox:SetToolTipString(strCityHappinessTooltip);
			Controls.HappinessLabel:LocalizeAndSetToolTip(strCityHappinessTooltip);
			Controls.HappinessPerTurnLabel:LocalizeAndSetToolTip(strCityHappinessTooltip);
			Controls.HappinessPerTurn2:LocalizeAndSetToolTip(strCityHappinessTooltip);
			Controls.HappinessPerTurnLabel2:SetText("[ICON_HAPPINESS_1] [COLOR_HAPPINESS]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_JFD_HAPPINESS"))
			Controls.HappinessPerTurnLabel2:LocalizeAndSetToolTip(strCityHappinessTooltip);
			local iHappinessPerTurn = pCity:getHappinessDelta();
			Controls.HappinessPerTurnLabel:SetText( Locale.ConvertTextKey("TXT_KEY_NET_HAPPINESS_TEXT", iHappinessPerTurn) );
			Controls.HappinessPerTurn2:SetText( Locale.ConvertTextKey("TXT_KEY_NET_HAPPINESS_TEXT", iHappinessPerTurn) );
			Controls.HappinessPerTurn2:SetHide(false);
		end
		
		Controls.TitleStack:CalculateSize();
		Controls.TitleStack:ReprocessAnchoring();

		--local cityStrengthStr = math.floor(pCity:GetStrengthValue()/100)
		local cityStrengthStr = pPlayer:GetCityDefense(pCity)
		Controls.Defense:SetText(cityStrengthStr);
		Controls.Defense:SetToolTipString(pPlayer:GetCityDefenseTooltip(pCity));

 		CivIconHookup( pPlayer:GetID(), 64, Controls.CivIcon, Controls.CivIconBG, Controls.CivIconShadow, false, true );
		
		-- JFD Yield Header TTs
		local yield1TT = ""
		local yield2TT = ""
		local yield3TT = ""
		local yield4TT = ""
		local yield5TT = ""
		local yield6TT = ""
		
		-------------------------------------------
		-- Growth Meter
		-------------------------------------------
		local iCurrentFood = pCity:GetFood();
		local iFoodNeeded = pCity:GrowthThreshold();
		local iFoodPerTurn = pCity:FoodDifference();
		local iCurrentFoodPlusThisTurn = iCurrentFood + iFoodPerTurn;
		
		local fGrowthProgressPercent = iCurrentFood / iFoodNeeded;
		local fGrowthProgressPlusThisTurnPercent = iCurrentFoodPlusThisTurn / iFoodNeeded;
		if (fGrowthProgressPlusThisTurnPercent > 1) then
			fGrowthProgressPlusThisTurnPercent = 1
		end
		
		local iTurnsToGrowth = pCity:GetFoodTurnsLeft();
		
		local cityPopulation = math.floor(pCity:GetPopulation());
		Controls.CityPopulationLabel:SetText(tostring(cityPopulation));
		Controls.PeopleMeter:SetPercent( pCity:GetFood() / pCity:GrowthThreshold() );
		
		--Update suffix to use correct plurality.
		Controls.CityPopulationLabelSuffix:LocalizeAndSetText("TXT_KEY_CITYVIEW_CITIZENS_TEXT", cityPopulation);
		
		local pediaEntry = CivilopediaControl and ("TXT_KEY_FOOD_HEADING1_TITLE")
		if pediaEntry then
			Controls.FoodBox:RegisterCallback(Mouse.eRClick, function() getPedia(pediaEntry) end)
		end
		-------------------------------------------
		-- Deal with the production queue buttons
		-------------------------------------------
		local qLength = pCity:GetOrderQueueLength();
		if qLength > 0 then
			Controls.HideQueueButton:SetHide( false );
		else
			Controls.HideQueueButton:SetHide( true );
		end
		
		-- hide the queue buttons
		Controls.b1number:SetHide( true );
		Controls.b1down:SetHide( true );
		Controls.b1remove:SetHide( true );
		Controls.b2box:SetHide( true );
		Controls.b3box:SetHide( true );
		Controls.b4box:SetHide( true );
		Controls.b5box:SetHide( true );
		Controls.b6box:SetHide( true );
		
		local anyMaint = false;
		
		Controls.ProductionPortraitButton:SetHide( false );
		
		local panelSize = Controls.ProdQueueBackground:GetSize();
		if productionQueueOpen and qLength > 0 then
			panelSize.y = 470;
			Controls.ProductionButtonLabel:SetText( Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_QUEUE_PROD") );
			Controls.ProductionButton:SetToolTipString( Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_QUEUE_PROD_TT") );
			
			-- show the queue buttons
			Controls.b1number:SetHide( false );
			Controls.b1remove:SetHide( false );
			if qLength > 1 then
				Controls.b1down:SetHide( false );
			end
			for i = 2, qLength, 1 do
				local isMaint = UpdateThisQueuedItem(pCity, i, qLength);
				local buttonName = "b"..tostring(i).."box";
				Controls[buttonName]:SetHide( false );
				--update the down buttons
				local buttonDown = "b"..tostring(i).."down";
				if qLength == i then
					Controls[buttonDown]:SetHide( true );
				else
					Controls[buttonDown]:SetHide( false );
				end
				local buttonUp = "b"..tostring(i).."up";
				if isMaint then
					anyMaint = true;
					Controls[buttonUp]:SetHide( true );
					buttonDown = "b"..tostring(i-1).."down";
					Controls[buttonDown]:SetHide( true );
				else
					Controls[buttonUp]:SetHide( false );
				end				
			end
		else
			if qLength == 0 then
				Controls.ProductionButtonLabel:SetText( Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_CHOOSE_PROD") );
				Controls.ProductionButton:SetToolTipString( Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_CHOOSE_PROD_TT") );
			else
				Controls.ProductionButtonLabel:SetText( Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_CHANGE_PROD") );
				Controls.ProductionButton:SetToolTipString( Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_CHANGE_PROD_TT") );
			end
			panelSize.y = 280;
		end
		Controls.ProdQueueBackground:SetSize(panelSize);
		if productionQueueOpen and (qLength >= 6 or anyMaint == true) then
			Controls.ProductionButton:SetDisabled( true );
		elseif pCity:IsColony() then
			Controls.ProductionButton:SetDisabled( true );
		else
			Controls.ProductionButton:SetDisabled( false );
		end
		if qLength == 1 then
			Controls.b1remove:SetHide( true );
		end

		
		-------------------------------------------
		-- Item under Production
		-------------------------------------------
		--JFD Development
		if userSettings["UserSettingCIDDevelopmentCore"] then
			JFD_UpdateDevelopmentInfo(pPlayer, pCity)		
		end
		--JFD Investment
		UpdateInvestmentInfo(pPlayer, pCity)
		
		local szItemName = Locale.ConvertTextKey(pCity:GetProductionNameKey());
		szItemName = Locale.ToUpper(szItemName);
		Controls.ProductionItemName:SetText(szItemName);
		Controls.ProductionItemName:SetToolTipString(szItemName);

		-------------------------------------------
		-- Description and picture of Item under Production
		-------------------------------------------
		local szHelpText = "";
		local unitProduction = pCity:GetProductionUnit();
		local buildingProduction = pCity:GetProductionBuilding();
		local projectProduction = pCity:GetProductionProject();
		local processProduction = pCity:GetProductionProcess();
		local noProduction = false;

		if unitProduction ~= -1 then
			local thisUnitInfo = GameInfo.Units[unitProduction];
			local portraitOffset, portraitAtlas = UI.GetUnitPortraitIcon(unitProduction, pCity:GetOwner());			
			szHelpText = Locale.ConvertTextKey(thisUnitInfo.Help);
			if IconHookup( portraitOffset, g_iPortraitSize, portraitAtlas, Controls.ProductionPortrait ) then
				Controls.ProductionPortrait:SetHide( false );
			else
				Controls.ProductionPortrait:SetHide( true );
			end
		elseif buildingProduction ~= -1 then
			local thisBuildingInfo = GameInfo.Buildings[buildingProduction];
			
			local bExcludeName = true;
			local bExcludeHeader = false;
			szHelpText = GetHelpTextForBuilding(buildingProduction, bExcludeName, bExcludeHeader, false, pCity);
			--szHelpText = thisBuildingInfo.Help;
			
			if IconHookup( thisBuildingInfo.PortraitIndex, g_iPortraitSize, thisBuildingInfo.IconAtlas, Controls.ProductionPortrait ) then
				Controls.ProductionPortrait:SetHide( false );
			else
				Controls.ProductionPortrait:SetHide( true );
			end
		elseif projectProduction ~= -1 then
			local thisProjectInfo = GameInfo.Projects[projectProduction];
			szHelpText = thisProjectInfo.Help;
			if IconHookup( thisProjectInfo.PortraitIndex, g_iPortraitSize, thisProjectInfo.IconAtlas, Controls.ProductionPortrait ) then
				Controls.ProductionPortrait:SetHide( false );
			else
				Controls.ProductionPortrait:SetHide( true );
			end
		elseif processProduction ~= -1 then
			local thisProcessInfo = GameInfo.Processes[processProduction];
			szHelpText = thisProcessInfo.Help;
			if IconHookup( thisProcessInfo.PortraitIndex, g_iPortraitSize, thisProcessInfo.IconAtlas, Controls.ProductionPortrait ) then
				Controls.ProductionPortrait:SetHide( false );
			else
				Controls.ProductionPortrait:SetHide( true );
			end
		else
			Controls.ProductionPortrait:SetHide(true);
			noProduction = true;
		end
		
		if szHelpText ~= nil and szHelpText ~= "" then
			Controls.ProductionHelp:SetText(Locale.ConvertTextKey(szHelpText));
			Controls.ProductionHelp:SetHide(false);
			Controls.ProductionHelpScroll:CalculateInternalSize();
		else
			Controls.ProductionHelp:SetHide(true);
		end

		-------------------------------------------
		-- Production
		-------------------------------------------
		
		DoUpdateProductionInfo( noProduction );
		
		-------------------------------------------
		-- Buildings (etc.) List
		-------------------------------------------		
		g_BuildingIM:ResetInstances();
		g_GPIM:ResetInstances();
		g_SlackerIM:ResetInstances();
		g_Specialist1IM:ResetInstances();
		g_Specialist2IM:ResetInstances();
		g_Specialist3IM:ResetInstances(); 
		g_Specialist4IM:ResetInstances(); 
		g_Specialist5IM:ResetInstances(); 
		g_Specialist6IM:ResetInstances(); 
		g_Specialist7IM:ResetInstances(); 
		g_Specialist8IM:ResetInstances(); 
		g_Specialist9IM:ResetInstances(); 
		g_Specialist10IM:ResetInstances();
		g_Specialist11IM:ResetInstances();
		g_Specialist12IM:ResetInstances();
		g_Specialist13IM:ResetInstances();
		g_Specialist14IM:ResetInstances();
		g_Specialist15IM:ResetInstances();
		g_Specialist16IM:ResetInstances();
		g_Specialist17IM:ResetInstances();
		g_Specialist18IM:ResetInstances();
		g_Specialist19IM:ResetInstances();
		g_Specialist20IM:ResetInstances();
		g_PlotButtonIM:ResetInstances();
		g_BuyPlotButtonIM:ResetInstances();
		
		local controlTable;
		local bIsFreeBuilding;		
		local iNumSpecialists;

		local slackerType = GameDefines.DEFAULT_SPECIALIST;
		local numSlackersInThisCity = pCity:GetSpecialistCount( slackerType );
		local numSpecialistsInThisCity = pCity:GetTotalSpecialistCount(  );

		-------------------------------------------
		-- JFD Development
		-------------------------------------------
		if userSettings["UserSettingCIDDevelopmentCore"] then
			Controls.DevelopmentHeader:SetHide(false);
			Controls.DevelopmentButton:SetHide(false);
			Controls.DevelopmentBox:SetHide(false);
			local localizedLabel = ""
			local developmentRate, developmentTotal, developmentThreshold, developmentTT = pPlayer:GetCityDevelopment(pCity)
			local developmentIcon = "[ICON_JFD_DEVELOPMENT_SURPLUS]"
			if developmentRate > 0 then
				localizedLabel = Locale.ConvertTextKey( "TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_TEXT", "[COLOR_POSITIVE_TEXT]+" .. developmentRate .. "[ENDCOLOR]");
			elseif developmentRate < 0 then
				developmentIcon = "[ICON_JFD_DEVELOPMENT_DEFICIT]"
				localizedLabel = Locale.ConvertTextKey( "TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_TEXT", "[COLOR_NEGATIVE_TEXT]" .. developmentRate .. "[ENDCOLOR]");
			else
				localizedLabel = Locale.ConvertTextKey( "TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_TEXT", developmentRate);
			end
			if developmentHeadingOpen then	
				developmentRate, developmentTotal, developmentThreshold, developmentTT = pPlayer:GetCityDevelopment(pCity, true)
				Controls.DevelopmentHeaderLabel:SetText(localizedLabel);
				Controls.DevelopmentThresholdLabel:LocalizeAndSetText("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_THRESHOLD", developmentThreshold)
				Controls.DevelopmentTotalLabel:LocalizeAndSetText("TXT_KEY_JFD_CITYVIEW_DEVELOPMENT_TOTAL", developmentTotal, developmentIcon)
				Controls.DevelopmentHeader:SetToolTipString(developmentTT)
				Controls.DevelopmentButton:SetToolTipString(developmentTT)
			else
				Controls.DevelopmentHeaderLabel:SetText("[ICON_MINUS]" .. developmentIcon .. " " .. localizedLabel);
				Controls.DevelopmentHeader:SetHide( false );
				-- Controls.DevelopmentBox:SetHide( true );
			end
			-- Controls.DevelopmentHeader:RegisterCallback( Mouse.eLClick, OnDevelopmentHeaderSelected );
			local pediaEntry = CivilopediaControl and ("TXT_KEY_JFD_DEVELOPMENT_HEADING1_TITLE")
			if pediaEntry then
				Controls.DevelopmentButton:RegisterCallback(Mouse.eRClick, function() getPedia(pediaEntry) end)
			end
		else
			Controls.DevelopmentHeader:SetHide(true);
			Controls.DevelopmentButton:SetHide(true);
		end

		-- header
		if workerHeadingOpen then
			local localizedLabel = "[ICON_MINUS] "..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_CITIZEN_ALLOCATION" );
			Controls.WorkerHeaderLabel:SetText(localizedLabel);
			local focusType = pCity:GetFocusType();
			if focusType == CityAIFocusTypes.NO_CITY_AI_FOCUS_TYPE then
				Controls.BalancedFocusButton:SetCheck( true );
			elseif focusType == CityAIFocusTypes.CITY_AI_FOCUS_TYPE_FOOD then
				Controls.FoodFocusButton:SetCheck( true );
			elseif focusType == CityAIFocusTypes.CITY_AI_FOCUS_TYPE_PRODUCTION then
				Controls.ProductionFocusButton:SetCheck( true );
			elseif focusType == CityAIFocusTypes.CITY_AI_FOCUS_TYPE_GOLD then
				Controls.GoldFocusButton:SetCheck( true );
			elseif focusType == CityAIFocusTypes.CITY_AI_FOCUS_TYPE_SCIENCE then
				Controls.ResearchFocusButton:SetCheck( true );
			elseif focusType == CityAIFocusTypes.CITY_AI_FOCUS_TYPE_CULTURE then
				Controls.CultureFocusButton:SetCheck( true );
			elseif focusType == CityAIFocusTypes.CITY_AI_FOCUS_TYPE_GREAT_PEOPLE then
				Controls.GPFocusButton:SetCheck( true );
			elseif focusType == CityAIFocusTypes.CITY_AI_FOCUS_TYPE_FAITH then
				Controls.FaithFocusButton:SetCheck( true );
			else
				Controls.BalancedFocusButton:SetCheck( true );
			end
			Controls.AvoidGrowthButton:SetCheck( pCity:IsForcedAvoidGrowth() );
			if pCity:GetNumForcedWorkingPlots() > 0 or numSlackersInThisCity > 0 then
				Controls.ResetButton:SetHide( false );
				Controls.ResetFooter:SetHide( false );
			else
				Controls.ResetButton:SetHide( true );
				Controls.ResetFooter:SetHide( true );
			end
			Events.RequestYieldDisplay( YieldDisplayTypes.CITY_OWNED, pCity:GetX(), pCity:GetY() );
			Controls.WorkerManagementBox:SetHide( false );
		else
			local localizedLabel = "[ICON_PLUS] "..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_CITIZEN_ALLOCATION" );
			Controls.WorkerHeaderLabel:SetText(localizedLabel);
			Events.RequestYieldDisplay( YieldDisplayTypes.CITY_WORKED, pCity:GetX(), pCity:GetY() );
			Controls.WorkerManagementBox:SetHide( true );
		end
		Controls.WorkerHeader:RegisterCallback( Mouse.eLClick, OnWorkerHeaderSelected );
		
		-- add in the Great Person Meters
		local numGPs = 0;		
		for pSpecialistInfo in GameInfo.Specialists() do
			local iSpecialistIndex = pSpecialistInfo.ID;			
			local iProgress = pCity:GetSpecialistGreatPersonProgress(iSpecialistIndex);
			if (iProgress > 0) then		
				numGPs = numGPs + 1;		
			
				local unitClass = GameInfo.UnitClasses[pSpecialistInfo.GreatPeopleUnitClass];
				if(unitClass ~= nil) then

					local threshold = pCity:GetSpecialistUpgradeThreshold(unitClass.ID);			
					controlTable = g_GPIM:GetInstance();
					local percent = iProgress / threshold;
					controlTable.GPMeter:SetPercent( percent );

					local gp = GameInfo.Units[ unitClass.DefaultUnit ];
					local portraitOffset, portraitAtlas = UI.GetUnitPortraitIcon(gp.ID, pCity:GetOwner());
					local labelText = Locale.ConvertTextKey(unitClass.Description);
					controlTable.GreatPersonLabel:SetText(labelText);
					pediaSearchStrings[tostring(controlTable.GPImage)] = labelText;
					controlTable.GPImage:RegisterCallback( Mouse.eRClick, GetPedia );
					
					local strToolTipText = Locale.ConvertTextKey("TXT_KEY_PROGRESS_TOWARDS",labelText);
					strToolTipText = strToolTipText .. ": " .. tostring(iProgress) .. "/" .. tostring(threshold);					
					local iCount = pCity:GetSpecialistCount( pSpecialistInfo.ID );
					local iGPPChange = pSpecialistInfo.GreatPeopleRateChange * iCount * 100;
					for building in GameInfo.Buildings{SpecialistType = pSpecialistInfo.Type} do
				        local buildingID = building.ID;
						if (pCity:IsHasBuilding(buildingID)) then
							iGPPChange = iGPPChange + building.GreatPeopleRateChange * 100;
						end
					end
					--JFD GPPs from Conquered Cities
					for row in GameInfo.Trait_GreatPeoplePointsFromConqueredCities("SpecialistType = '" .. pSpecialistInfo.Type .. "'") do
						if pPlayer:HasTrait(GameInfoTypes[row.TraitType]) then
							if row.IsCapitalOnly and pCity:IsCapital() then
								for city in pPlayer:Cities () do
									if city:GetOriginalOwner() ~= pPlayer:GetID() then
										if city:IsOriginalCapital() then
											iGPPChange = iGPPChange + row.CapitalPointsChange * 100
										else
											iGPPChange = iGPPChange + row.PointsChange * 100
										end
									end
								end
							else
								if pCity:GetOriginalOwner() ~= pPlayer:GetID() then
									if pCity:IsOriginalCapital() then
										iGPPChange = iGPPChange + row.CapitalPointsChange * 100
									else
										iGPPChange = iGPPChange + row.PointsChange * 100
									end
								end
							end
						end
					end
					--JFD GPPs from BuildingClasses
					for row in GameInfo.Policy_BuildingClassGreatPeoplePointsChange("SpecialistType = '" .. pSpecialistInfo.Type .. "'") do
						if (pPlayer:HasPolicy(GameInfoTypes[row.PolicyType]) and pCity:HasBuildingClass(GameInfoTypes[row.BuildingClassType])) then
							iGPPChange = iGPPChange + row.PointsChange * 100
						end
					end
					if iGPPChange > 0 then
						-- Generic GP mods
						local iPlayerMod = pPlayer:GetGreatPeopleRateModifier();
						local iPolicyMod = pPlayer:GetPolicyGreatPeopleRateModifier();
						local iProsperityMod = 0
						-- if userSettingProsperityCore then
							-- iProsperityMod = JFD_GetProsperityGreatPeopleRateModifier(pPlayer:GetID()); -- JFD Prosperity
							-- iPlayerMod = iPlayerMod - iProsperityMod
							-- iPolicyMod = iPolicyMod - iProsperityMod
						-- end
						local iWorldCongressMod = 0;
						local pWorldCongress = nil;
						if (Game.GetNumActiveLeagues() > 0) then
							pWorldCongress = Game.GetActiveLeague();
						end
						local iCityMod = pCity:GetGreatPeopleRateModifier();
						-- CBP
						iCityMod = iCityMod + pCity:GetSpecialistCityModifier(pSpecialistInfo.ID);
						--END
						local iGoldenAgeMod = 0;
						local bGoldenAge = (pPlayer:GetGoldenAgeTurns() > 0);
						
						-- GP mods by type		
						if (pSpecialistInfo.GreatPeopleUnitClass == "UNITCLASS_WRITER") then
							iPlayerMod = iPlayerMod + pPlayer:GetGreatWriterRateModifier();
							iPolicyMod = iPolicyMod + pPlayer:GetPolicyGreatWriterRateModifier();
							if (pWorldCongress ~= nil and pWorldCongress:GetArtsyGreatPersonRateModifier() ~= 0) then
								iWorldCongressMod = iWorldCongressMod + pWorldCongress:GetArtsyGreatPersonRateModifier();
							end
							if (bGoldenAge and pPlayer:GetGoldenAgeGreatWriterRateModifier() > 0) then
								iGoldenAgeMod = iGoldenAgeMod + pPlayer:GetGoldenAgeGreatWriterRateModifier();
							end
						elseif (pSpecialistInfo.GreatPeopleUnitClass == "UNITCLASS_ARTIST") then
							iPlayerMod = iPlayerMod + pPlayer:GetGreatArtistRateModifier();
							iPolicyMod = iPolicyMod + pPlayer:GetPolicyGreatArtistRateModifier();
							if (pWorldCongress ~= nil and pWorldCongress:GetArtsyGreatPersonRateModifier() ~= 0) then
								iWorldCongressMod = iWorldCongressMod + pWorldCongress:GetArtsyGreatPersonRateModifier();
							end
							if (bGoldenAge and pPlayer:GetGoldenAgeGreatArtistRateModifier() > 0) then
								iGoldenAgeMod = iGoldenAgeMod + pPlayer:GetGoldenAgeGreatArtistRateModifier();
							end
						elseif (pSpecialistInfo.GreatPeopleUnitClass == "UNITCLASS_MUSICIAN") then
							iPlayerMod = iPlayerMod + pPlayer:GetGreatMusicianRateModifier();
							iPolicyMod = iPolicyMod + pPlayer:GetPolicyGreatMusicianRateModifier();
							if (pWorldCongress ~= nil and pWorldCongress:GetArtsyGreatPersonRateModifier() ~= 0) then
								iWorldCongressMod = iWorldCongressMod + pWorldCongress:GetArtsyGreatPersonRateModifier();
							end
							if (bGoldenAge and pPlayer:GetGoldenAgeGreatMusicianRateModifier() > 0) then
								iGoldenAgeMod = iGoldenAgeMod + pPlayer:GetGoldenAgeGreatMusicianRateModifier();
							end
						elseif (pSpecialistInfo.GreatPeopleUnitClass == "UNITCLASS_SCIENTIST") then
							iPlayerMod = iPlayerMod + pPlayer:GetGreatScientistRateModifier();
							iPolicyMod = iPolicyMod + pPlayer:GetPolicyGreatScientistRateModifier();
							if (pWorldCongress ~= nil and pWorldCongress:GetScienceyGreatPersonRateModifier() ~= 0) then
								iWorldCongressMod = iWorldCongressMod + pWorldCongress:GetScienceyGreatPersonRateModifier();
							end
							--CBP
							if (bGoldenAge and pPlayer:GetGoldenAgeGreatScientistRateModifier() > 0) then
								iGoldenAgeMod = iGoldenAgeMod + pPlayer:GetGoldenAgeGreatScientistRateModifier();
							end
							--END
						elseif (pSpecialistInfo.GreatPeopleUnitClass == "UNITCLASS_MERCHANT") then
							iPlayerMod = iPlayerMod + pPlayer:GetGreatMerchantRateModifier();
							iPolicyMod = iPolicyMod + pPlayer:GetPolicyGreatMerchantRateModifier();
							if (pWorldCongress ~= nil and pWorldCongress:GetScienceyGreatPersonRateModifier() ~= 0) then
								iWorldCongressMod = iWorldCongressMod + pWorldCongress:GetScienceyGreatPersonRateModifier();
							end
							--CBP
							if (bGoldenAge and pPlayer:GetGoldenAgeGreatMerchantRateModifier() > 0) then
								iGoldenAgeMod = iGoldenAgeMod + pPlayer:GetGoldenAgeGreatMerchantRateModifier();
							end
							--END
						elseif (pSpecialistInfo.GreatPeopleUnitClass == "UNITCLASS_ENGINEER") then
							iPlayerMod = iPlayerMod + pPlayer:GetGreatEngineerRateModifier();
							iPolicyMod = iPolicyMod + pPlayer:GetPolicyGreatEngineerRateModifier();
							if (pWorldCongress ~= nil and pWorldCongress:GetScienceyGreatPersonRateModifier() ~= 0) then
								iWorldCongressMod = iWorldCongressMod + pWorldCongress:GetScienceyGreatPersonRateModifier();
							end
							--CBP
							if (bGoldenAge and pPlayer:GetGoldenAgeGreatEngineerRateModifier() > 0) then
								iGoldenAgeMod = iGoldenAgeMod + pPlayer:GetGoldenAgeGreatEngineerRateModifier();
							end
							--END
						elseif (pSpecialistInfo.GreatPeopleUnitClass == "UNITCLASS_GREAT_DIPLOMAT") then
							iPlayerMod = iPlayerMod + pPlayer:GetGreatDiplomatRateModifier();
							if (pWorldCongress ~= nil and pWorldCongress:GetScienceyGreatPersonRateModifier() ~= 0) then
								iWorldCongressMod = 0;
							end
							--CBP
							if (bGoldenAge and pPlayer:GetGoldenAgeGreatDiplomatRateModifier() > 0) then
								iGoldenAgeMod = iGoldenAgeMod + pPlayer:GetGoldenAgeGreatDiplomatRateModifier();
							end
							--END
						end
						
						-- Player mod actually includes policy mod and World Congress mod, so separate them for tooltip
						iPlayerMod = iPlayerMod - iPolicyMod - iWorldCongressMod;
						
						local iMod = iPlayerMod + iPolicyMod + iWorldCongressMod + iCityMod + iGoldenAgeMod;
						iGPPChange = (iGPPChange * (100 + iMod)) / 100;
						strToolTipText = strToolTipText .. " (+" .. math.floor(iGPPChange/100) .. "[ICON_GREAT_PEOPLE])";	
						if (iPlayerMod > 0) then
							strToolTipText = strToolTipText .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_PLAYER_GP_MOD", iPlayerMod);
						end
						if (iProsperityMod > 0) then
							strToolTipText = strToolTipText .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_POLICY_JFD_PROSPERITY_MOD", iProsperityMod);
						end
						if (iPolicyMod > 0) then
							strToolTipText = strToolTipText .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_POLICY_GP_MOD", iPolicyMod);
						elseif (iPolicyMod < 0) then
							strToolTipText = strToolTipText .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_POLICY_GP_MOD_NEGATIVE", iPolicyMod);
						end
						if (iCityMod > 0) then
							strToolTipText = strToolTipText .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_CITY_GP_MOD", iCityMod);
						end
						if (iGoldenAgeMod > 0) then
							strToolTipText = strToolTipText .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_GOLDENAGE_GP_MOD", iGoldenAgeMod);
						end
						if (iWorldCongressMod ~= 0) then
							if (iWorldCongressMod < 0) then
								strToolTipText = strToolTipText .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_WORLD_CONGRESS_NEGATIVE_GP_MOD", iWorldCongressMod);
							else
								strToolTipText = strToolTipText .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_WORLD_CONGRESS_POSITIVE_GP_MOD", iWorldCongressMod);
							end
						end
					end
					controlTable.GPBox:SetToolTipString(strToolTipText);
					local gpTurns = math.ceil( (threshold - iProgress) / (iGPPChange/100) )
					if (gpTurns > 0 and iGPPChange > 0) then
						controlTable.GreatPersonTurns:LocalizeAndSetText("TXT_KEY_JFD_CITYVIEW_TURNS", gpTurns);
					else
						controlTable.GreatPersonTurns:LocalizeAndSetText("TXT_KEY_JFD_CITYVIEW_TURNS", 0);
					end
					if IconHookup( portraitOffset, 64, portraitAtlas, controlTable.GPImage ) then
						controlTable.GPImage:SetHide( false );
					end
				end
			end			
		end
		-- header
		if GPHeadingOpen then
			local localizedLabel = "[ICON_MINUS] "..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_GREAT_PEOPLE_TEXT" );
			Controls.GPHeaderLabel:SetText(localizedLabel);
			Controls.GPStack:SetHide( false );
		else
			local localizedLabel = "[ICON_PLUS] "..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_GREAT_PEOPLE_TEXT" );
			Controls.GPHeaderLabel:SetText(localizedLabel);
			Controls.GPStack:SetHide( true );
		end
		if numGPs > 0 then
			Controls.GPHeader:SetHide( false );
		else
			Controls.GPHeader:SetHide( true );
			Controls.GPStack:SetHide( true );
		end
		Controls.GPHeader:RegisterCallback( Mouse.eLClick, OnGPHeaderSelected );

		
		-- add in the slackers
		local numberOfSlackersPerRow = 8;
		local slackerSize = 32;
		local slackerPadding = 2;
		-- header
		if slackerHeadingOpen then
			local localizedLabel = "[ICON_MINUS] "..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_UNEMPLOYED_TEXT" );
			Controls.SlackerHeaderLabel:SetText(localizedLabel);
		else
			local localizedLabel = "[ICON_PLUS] "..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_UNEMPLOYED_TEXT" );
			Controls.SlackerHeaderLabel:SetText(localizedLabel);
		end
		if numSlackersInThisCity > 0 then
			--if header is not hidden and is open
			Controls.SlackerHeader:SetHide( false );
			if slackerHeadingOpen then
				Controls.BoxOSlackers:SetHide( false );
				
				Controls.SlackerHeader:RegisterCallback( Mouse.eLClick, OnSlackerHeaderSelected );
				Controls.BoxOSlackers:RegisterCallback( Mouse.eLClick, OnSlackersSelected );

				-- build the tooltip for slackers
				local pSpecialistInfo = GameInfo.Specialists[slackerType];
				local specialistName = Locale.ConvertTextKey(pSpecialistInfo.Description);
				local ToolTipString = specialistName .. " ";						
				-- Culture
				local iCultureFromSpecialist = pCity:GetCultureFromSpecialist(iSpecialistID);
				if (iCultureFromSpecialist > 0) then
					--CBP
					local extraYield = (pCity:GetSpecialistYield( iSpecialistID, YieldTypes.YIELD_CULTURE ) + pCity:GetSpecialistYieldChange(YieldTypes.YIELD_CULTURE, iSpecialistID))
					iCultureFromSpecialist = (iCultureFromSpecialist + extraYield)
					-- END
					ToolTipString = ToolTipString .. " +" .. iCultureFromSpecialist .. "[ICON_CULTURE]";
				end
				-- Yield
				for pYieldInfo in GameInfo.Yields("IsFake = 0") do
					local iYieldID = pYieldInfo.ID;
					if(iYieldID ~= YieldTypes.YIELD_CULTURE) then
						local iYieldAmount = pCity:GetSpecialistYield(iSpecialistID, iYieldID);					
						--Specialist Yield included in pCity:GetSpecialistYield();
						--iYieldAmount = iYieldAmount + pPlayer:GetSpecialistExtraYield(iSpecialistID, iYieldID);
					
						if (iYieldAmount > 0) then
							--CBP
							local extraYield = pCity:GetSpecialistYieldChange(iSpecialistID, iYieldID);
							iYieldAmount = (iYieldAmount + extraYield);
							-- END
							ToolTipString = ToolTipString .. " +" .. iYieldAmount .. pYieldInfo.IconString;
						end
					end
				end
				if pSpecialistInfo.GreatPeopleRateChange > 0 then
					ToolTipString = ToolTipString .. " +" .. pSpecialistInfo.GreatPeopleRateChange .. "[ICON_GREAT_PEOPLE]";					
				end
				--Development
				if userSettings["UserSettingCIDDevelopmentCore"] then
					local developmentPerSpecialist = pPlayer:GetDevelopmentPerSpecialist(pCity, pSpecialistInfo.ID) 
					if developmentPerSpecialist ~= 0 then
						ToolTipString = ToolTipString .. " +" .. developmentPerSpecialist .. "[ICON_JFD_DEVELOPMENT]" 
					end
				end
				--Crime
				local crimeSpecialists = pPlayer:GetCrimePerSpecialist(pCity, pSpecialistInfo.ID) 
				if crimeSpecialists ~= 0 then
					ToolTipString = ToolTipString .. " +" .. crimeSpecialists .. "[ICON_JFD_CRIME_BLACK]"
				end

				-- bunch-o-slackers
				local slackerAdded = 0;
				for i = 1, numSlackersInThisCity do
					controlTable = g_SlackerIM:GetInstance();
					controlTable.SlackerButton:SetOffsetVal( (slackerAdded % numberOfSlackersPerRow) * slackerSize + slackerPadding, math.floor(slackerAdded / numberOfSlackersPerRow) * slackerSize + slackerPadding );				
					controlTable.SlackerButton:SetToolTipString( ToolTipString );
					controlTable.SlackerButton:RegisterCallback( Mouse.eLClick, OnSlackersSelected );
					pediaSearchStrings[tostring(controlTable.SlackerButton)] = specialistName;
					controlTable.SlackerButton:RegisterCallback( Mouse.eRClick, GetPedia );
					slackerAdded = slackerAdded + 1;
				end
				if slackerAdded > 0 then
					local frameSize = {};
					local h = (math.floor((slackerAdded - 1) / numberOfSlackersPerRow) + 1) * slackerSize + (slackerPadding * 2);
					frameSize.x = 254;
					frameSize.y = h;
					Controls.BoxOSlackers:SetSize( frameSize );
				end
			else
				Controls.BoxOSlackers:SetHide( true );
			end
		else
			Controls.SlackerHeader:SetHide( true );
			Controls.BoxOSlackers:SetHide( true );
		end		
		
		-- add in the specialists
		local numberOfSpecialistsPerRow = 7;
		local specialistSize = 32;
		local specialistPadding = 2;
		-- header
		if specialistsHeadingOpen then
			local localizedLabel = "[ICON_MINUS] "..Locale.ConvertTextKey( "TXT_KEY_JFD_CITYVIEW_SPECIALISTS" );
			Controls.SpecialistHeaderLabel:SetText(localizedLabel);
		else
			local localizedLabel = "[ICON_PLUS] "..Locale.ConvertTextKey( "TXT_KEY_JFD_CITYVIEW_SPECIALISTS" );
			Controls.SpecialistHeaderLabel:SetText(localizedLabel);
		end
		-- if numSpecialistsInThisCity > 0 then
			--if header is not hidden and is open
			Controls.SpecialistHeader:SetHide( false );
			Controls.SpecialistHeader:RegisterCallback( Mouse.eLClick, OnSpecialistsHeaderSelected );
			if specialistsHeadingOpen then
				Controls.SpecialistBox:SetHide( false );
				
				local numSpecialists = 0;
				local specialists = {}
				for specialist in GameInfo.Specialists("ID <> 0") do
					if pCity:HasSpecialistSlot(specialist.ID) then
						local element = {};
						element.ID = specialist.ID;
						element.name = Locale.ConvertTextKey( specialist.Description );
						specialists[numSpecialists] = element;
						numSpecialists = numSpecialists + 1
					end
				end
				table.sort(specialists, function(a, b) return a.name < b.name end);
				local sortedSpecialists = {}
				for _, thisSpecialist in pairs(specialists) do
					local specialistID = thisSpecialist.ID
					local specialist = GameInfo.Specialists[specialistID]
					sortedSpecialists[specialistID] = {};
					sortedSpecialists[specialistID].Type = specialist.Type;
					sortedSpecialists[specialistID].Desc = thisSpecialist.name;
					sortedSpecialists[specialistID].RowNum = specialist.OrderPriority
					sortedSpecialists[specialistID].Texture = specialist.SlotTexture;
					sortedSpecialists[specialistID].AssignedBuildings = {}						
					sortedSpecialists[specialistID].FreeBuildings = {}						
					local thisSpecialistNumAssigned = 0 
					local thisSpecialistNumFree = 0 
					local numBuildingsAssigned = 0 
					local numBuildingsFree = 0 
					local buildings = {}
					local numBuildings = 1
					for building in GameInfo.Buildings("SpecialistCount > 0 AND SpecialistType = '" .. specialist.Type .. "'") do 
						if pCity:HasBuilding(building.ID) then
							local element = {};
							local name = Locale.ConvertTextKey( building.Description )
							element.name = name;
							element.ID = building.ID;
							element.Type = building.Type;
							buildings[numBuildings] = element;
							numBuildings = numBuildings + 1;
						end
					end
					table.sort(buildings, function(a, b) return a.name < b.name end);
					for _, building in pairs(buildings) do
						local iNumAssignedSpecialists = pCity:GetNumSpecialistsInBuilding(building.ID)
						if iNumAssignedSpecialists > 0 and building.ID then
							thisSpecialistNumAssigned = thisSpecialistNumAssigned + iNumAssignedSpecialists
							for i = 1, iNumAssignedSpecialists do
								sortedSpecialists[specialist.ID].AssignedBuildings[i] = building.ID
							end
						end
						local iNumFreeSpecialists = (pCity:GetNumSpecialistsAllowedByBuilding(building.ID) - pCity:GetNumSpecialistsInBuilding(building.ID))
						if iNumFreeSpecialists > 0 and building.ID then
							thisSpecialistNumFree = thisSpecialistNumFree + iNumFreeSpecialists
							for i = 1, thisSpecialistNumFree do
								sortedSpecialists[specialist.ID].FreeBuildings[i] = building.ID
							end
						end
					end
					sortedSpecialists[specialist.ID].NumAssigned = thisSpecialistNumAssigned
					sortedSpecialists[specialist.ID].NumFree = thisSpecialistNumFree
				end
				-- for i = 1, 20 do
					-- local numString = tostring(i)
					-- local buttonBox = "Specialist"..numString.."Box"
					-- local buttonthisDivider = "Specialist"..numString.."Divider"
					-- local buttonthisDevelopmentLabel = "Specialist"..numString.."BoxDevelopment"
					-- local buttonNameLabel = "Specialist"..numString.."BoxLabel"
					-- local thisBox = Controls[buttonBox]
					-- local thisDivider = Controls[buttonthisDivider]
					-- local thisDevelopmentLabel = Controls[buttonthisDevelopmentLabel]
					-- local thisButtonLabel = Controls[buttonNameLabel]
					-- thisBox:SetHide(true)
					-- thisDivider:SetHide(true)
					-- thisDevelopmentLabel:SetHide(true)
					-- thisButtonLabel:SetHide(true)
				-- end
				local numSpecialistsAdded = 1
				for specialistID, specialist in pairs(sortedSpecialists) do
					if specialist.RowNum == 0 then specialist.RowNum = specialistID end
					local numString = tostring(specialist.RowNum)
					local buttonBox = "Specialist"..numString.."Box"
					local buttonthisDivider = "Specialist"..numString.."Divider"
					local buttonthisDevelopmentLabel = "Specialist"..numString.."BoxDevelopment"
					local buttonNameLabel = "Specialist"..numString.."BoxLabel"
					local thisBox = Controls[buttonBox]
					local thisDivider = Controls[buttonthisDivider]
					local thisDevelopmentLabel = Controls[buttonthisDevelopmentLabel]
					local thisButtonLabel = Controls[buttonNameLabel]
					thisBox:SetHide(false)
					thisDivider:SetHide(false)
					thisButtonLabel:SetHide(false)
					thisDevelopmentLabel:SetHide(true)
					thisButtonLabel:LocalizeAndSetText(specialist.Desc)
					local iDevelopment = (pPlayer:GetDevelopmentPerSpecialist(pCity, specialistID)*pCity:GetSpecialistCount(specialistID))
					if iDevelopment > 0 then
						thisDevelopmentLabel:LocalizeAndSetText("+{1_Num} [ICON_JFD_DEVELOPMENT]", iDevelopment)
						thisDevelopmentLabel:SetHide(false)
					end
					
					local specialistsAdded = 0
					for i = 1, specialist.NumAssigned do
						controlTable = specialistInstances[specialistID]:GetInstance();
						local ToolTipString = GetSpecialistToolTip(pCity, specialistID, GameInfo.Specialists[specialistID], Locale.ConvertTextKey(specialist.Desc))
						local buildingID = specialist.AssignedBuildings[i]
						if buildingID then
							local buildingDesc = Locale.ConvertTextKey(GameInfo.Buildings[buildingID].Description)
							controlTable.SpecialistButton:SetHide(false)
							if specialistsAdded > 7 then
								controlTable.SpecialistButton:SetOffsetVal( (specialistsAdded % numberOfSpecialistsPerRow) * specialistSize + specialistPadding, math.floor(specialistsAdded / numberOfSpecialistsPerRow) * specialistSize + specialistPadding );				
							end
							ToolTipString = "[COLOR_POSITIVE_TEXT]" .. buildingDesc .. "[ENDCOLOR][NEWLINE]" .. ToolTipString
							if pCity:IsResistance() then
								ToolTipString = ToolTipString .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_CITY_VIEW_SPECIALIST_RESISTANCE")
							end
							controlTable.SpecialistButton:SetToolTipString( ToolTipString );
							controlTable.SpecialistButton:SetVoids( specialist.AssignedBuildings[i], i );
							if (UI.IsCityScreenViewingMode()) then
								controlTable.SpecialistButton:RegisterCallback( Mouse.eLClick, DisableSpecialist );
							else
								controlTable.SpecialistButton:RegisterCallback( Mouse.eLClick, RemoveSpecialist );
							end
							if specialist.Texture then
								controlTable.SpecialistButton:SetTexture(specialist.Texture)
							else
								controlTable.SpecialistButton:SetTexture("CitizenWorker.dds")
							end
							pediaSearchStrings[tostring(controlTable.SpecialistButton)] = specialist.Desc;
							controlTable.SpecialistButton:RegisterCallback( Mouse.eRClick, GetPedia );
							specialistsAdded = specialistsAdded + 1;
						end
					end
					for i = 1, specialist.NumFree do
						controlTable = specialistInstances[specialistID]:GetInstance();
						local ToolTipString = GetSpecialistToolTip(pCity, specialistID, GameInfo.Specialists[specialistID], Locale.ConvertTextKey(specialist.Desc))
						local buildingID = specialist.FreeBuildings[i]
						if buildingID then
							local buildingDesc = Locale.ConvertTextKey(GameInfo.Buildings[buildingID].Description)
							controlTable.SpecialistButton:SetHide(false)
							if specialistsAdded > 7 then
								controlTable.SpecialistButton:SetOffsetVal( (specialistsAdded % numberOfSpecialistsPerRow) * specialistSize + specialistPadding, math.floor(specialistsAdded / numberOfSpecialistsPerRow) * specialistSize + specialistPadding );				
							end
							ToolTipString = "[COLOR_POSITIVE_TEXT]" .. buildingDesc .. "[ENDCOLOR][NEWLINE]" .. emptySlotString.."[NEWLINE]("..ToolTipString..")";
							if pCity:IsResistance() then
								ToolTipString = ToolTipString .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_CITY_VIEW_SPECIALIST_RESISTANCE")
							end
							controlTable.SpecialistButton:SetToolTipString( ToolTipString );
							controlTable.SpecialistButton:SetVoids( specialist.FreeBuildings[i], i );
							if (UI.IsCityScreenViewingMode()) then
								controlTable.SpecialistButton:RegisterCallback( Mouse.eLClick, DisableSpecialist );
							else
								controlTable.SpecialistButton:RegisterCallback( Mouse.eLClick, AddSpecialist );
							end
							pediaSearchStrings[tostring(controlTable.SpecialistButton)] = specialist.Desc;
							controlTable.SpecialistButton:SetTexture("CitizenEmpty.dds")
							controlTable.SpecialistButton:RegisterCallback( Mouse.eRClick, GetPedia );
							specialistsAdded = specialistsAdded + 1;
						end
					end
					
				end
				
				-- if (UI.IsCityScreenViewingMode()) then
			-- controlTable.BuildingFilledSpecialistSlot1:RegisterCallback( Mouse.eLClick, DisableSpecialist );
			-- controlTable.BuildingFilledSpecialistSlot2:RegisterCallback( Mouse.eLClick, DisableSpecialist );
			-- controlTable.BuildingFilledSpecialistSlot3:RegisterCallback( Mouse.eLClick, DisableSpecialist );
		-- else
			-- controlTable.BuildingFilledSpecialistSlot1:RegisterCallback( Mouse.eLClick, RemoveSpecialist );
			-- controlTable.BuildingFilledSpecialistSlot2:RegisterCallback( Mouse.eLClick, RemoveSpecialist );
			-- controlTable.BuildingFilledSpecialistSlot3:RegisterCallback( Mouse.eLClick, RemoveSpecialist );
		-- end

		-- controlTable.BuildingFilledSpecialistSlot1:SetVoids( buildingID, 1 );
		-- controlTable.BuildingFilledSpecialistSlot2:SetVoids( buildingID, 2 );
		-- controlTable.BuildingFilledSpecialistSlot3:SetVoids( buildingID, 3 );

		-- if (UI.IsCityScreenViewingMode()) then
			-- controlTable.BuildingEmptySpecialistSlot1:RegisterCallback( Mouse.eLClick, DisableSpecialist );
			-- controlTable.BuildingEmptySpecialistSlot2:RegisterCallback( Mouse.eLClick, DisableSpecialist );
			-- controlTable.BuildingEmptySpecialistSlot3:RegisterCallback( Mouse.eLClick, DisableSpecialist );
		-- else
			-- controlTable.BuildingEmptySpecialistSlot1:RegisterCallback( Mouse.eLClick, AddSpecialist );
			-- controlTable.BuildingEmptySpecialistSlot2:RegisterCallback( Mouse.eLClick, AddSpecialist );
			-- controlTable.BuildingEmptySpecialistSlot3:RegisterCallback( Mouse.eLClick, AddSpecialist );
		-- end

		-- controlTable.BuildingEmptySpecialistSlot1:SetVoids( buildingID, 1 );
		-- controlTable.BuildingEmptySpecialistSlot2:SetVoids( buildingID, 2 );
		-- controlTable.BuildingEmptySpecialistSlot3:SetVoids( buildingID, 3 );
				-- for i = 1, numSpecialistsInThisCity do
					
					-- controlTable = g_ArtistIM:GetInstance();
					-- controlTable.SpecialistButton:SetOffsetVal( (specialistAdded % numberOfSlackersPerRow) * slackerSize + slackerPadding, math.floor(specialistAdded / numberOfSlackersPerRow) * slackerSize + slackerPadding );				
					-- controlTable.SpecialistButton:SetToolTipString( ToolTipString );
					-- controlTable.SpecialistButton:RegisterCallback( Mouse.eLClick, OnSlackersSelected );
					-- pediaSearchStrings[tostring(controlTable.SpecialistButton)] = specialistName;
					-- controlTable.SpecialistButton:RegisterCallback( Mouse.eRClick, GetPedia );
					-- specialistAdded = specialistAdded + 1;
				-- end
				-- if specialistAdded > 0 then
					-- local frameSize = {};
					-- local h = (math.floor((specialistAdded - 1) / numberOfSlackersPerRow) + 1) * slackerSize + (slackerPadding * 2);
					-- frameSize.x = 254;
					-- frameSize.y = h;
					-- Controls.BoxOSlackers:SetSize( frameSize );
				-- end
			else
				Controls.SpecialistBox:SetHide( true );
			end
		-- else
			-- Controls.SpecialistHeader:SetHide( true );
			-- Controls.SpecialistBoxBox:SetHide( true );
		-- end
		
		sortOrder = 0;
		otherSortedList = {};
		
		local iBuildingMaintenance = pCity:GetTotalBaseBuildingMaintenance();
		local strMaintenanceTT = Locale.ConvertTextKey("TXT_KEY_BUILDING_MAINTENANCE_TT", iBuildingMaintenance);
		Controls.SpecialBuildingsHeader:SetToolTipString(strMaintenanceTT);
		Controls.BuildingsHeader:SetToolTipString(strMaintenanceTT);
		Controls.GreatWorkHeader:SetToolTipString(strMaintenanceTT);
		
		if userSettings["UserSettingCIDCityDistricts"] then
			Controls.SpecialBuildingsHeader:SetHide(true)
			Controls.SpecialistControlBox:SetHide(true)
			Controls.GreatWorkHeader:SetHide(true)
			Controls.WondersHeader:SetHide(true)
			Controls.NationalWondersHeader:SetHide(true)
		else
			-- buildings that take specialists
			local numSpecialBuildingsInThisCity = 0;
			--if specialistBuildingHeadingOpen then
			--	local localizedLabel = "[ICON_MINUS] "..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_SPECIAL_TEXT" );
			--	Controls.SpecialBuildingsHeaderLabel:SetText(localizedLabel);
			--else
			--	local localizedLabel = "[ICON_PLUS] "..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_SPECIAL_TEXT" );
			--	Controls.SpecialBuildingsHeaderLabel:SetText(localizedLabel);
			--end
			sortedList = {};
			thisId = 1;
			for building in GameInfo.Buildings() do
				local thisBuildingClass = GameInfo.BuildingClasses[building.BuildingClass];
				if thisBuildingClass.MaxGlobalInstances <= 0 and thisBuildingClass.MaxTeamInstances <= 0 then
					local buildingID= building.ID;
					if pCity:GetNumSpecialistsAllowedByBuilding(buildingID) > 0 then
						if (pCity:IsHasBuilding(buildingID)) then
							numSpecialBuildingsInThisCity = numSpecialBuildingsInThisCity + 1;
							local element = {};
							local name = Locale.ConvertTextKey( building.Description )
							element.name = name;
							element.ID = building.ID;
							sortedList[thisId] = element;
							thisId = thisId + 1;
						end
					end
				end
			end
			table.sort(sortedList, function(a, b) return a.name < b.name end);
			if numSpecialBuildingsInThisCity > 0 then
				--if header is not hidden and is open
				Controls.SpecialBuildingsHeader:SetHide( false );
				Controls.SpecialistControlBox:SetHide( false );
				sortOrder = sortOrder + 1;
				otherSortedList[tostring( Controls.SpecialBuildingsHeader )] = sortOrder;
				sortOrder = sortOrder + 1;
				otherSortedList[tostring( Controls.SpecialistControlBox )] = sortOrder;
				if specialistBuildingHeadingOpen then
					Controls.SpecialBuildingsHeader:RegisterCallback( Mouse.eLClick, OnSpecialistBuildingsHeaderSelected );
					for i, v in ipairs(sortedList) do
						local building = GameInfo.Buildings[v.ID];
						AddBuildingButton( pCity, building );
					end
				else
					Controls.SpecialistControlBox:SetHide( true );
				end			
			else
				Controls.SpecialBuildingsHeader:SetHide( true );
				Controls.SpecialistControlBox:SetHide( true );
			end
			if specialistBuildingHeadingOpen then
				local localizedLabel = "[ICON_MINUS] "..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_SPECIALIST_BUILDINGS_TEXT", numSpecialBuildingsInThisCity );
				Controls.SpecialBuildingsHeaderLabel:SetText(localizedLabel);
			else
				local localizedLabel = "[ICON_PLUS] "..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_SPECIALIST_BUILDINGS_TEXT", numSpecialBuildingsInThisCity );
				Controls.SpecialBuildingsHeaderLabel:SetText(localizedLabel);
			end
			
			-- now add the national nationalWonders
			local numNationalWondersInThisCity = 0;
			local numNationalWondersWithSpecialistInThisCity = 0;
			--if nationalWonderHeadingOpen then
			--	local localizedLabel = "[ICON_MINUS] "..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_NATIONAL_WONDERS_TEXT" );
			--	Controls.NationalWondersHeaderLabel:SetText(localizedLabel);
			--else
			--	local localizedLabel = "[ICON_PLUS] "..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_NATIONAL_WONDERS_TEXT" );
			--	Controls.NationalWondersHeaderLabel:SetText(localizedLabel);
			--end
			local sortedList = {};
			local thisId = 1;
			for building in GameInfo.Buildings() do
				local thisBuildingClass = GameInfo.BuildingClasses[building.BuildingClass];
				if (thisBuildingClass.MaxPlayerInstances >= 1) or thisBuildingClass.MaxTeamInstances > 0 then
					local buildingID= building.ID;
					if (pCity:IsHasBuilding(buildingID)) then
						numNationalWondersInThisCity = numNationalWondersInThisCity + 1;
						if(pCity:GetNumSpecialistsAllowedByBuilding(buildingID) > 0) then
							numNationalWondersWithSpecialistInThisCity = numNationalWondersWithSpecialistInThisCity + 1;
						end
						
						local element = {};
						local name = Locale.ConvertTextKey( building.Description )
						element.name = name;
						element.ID = building.ID;
						sortedList[thisId] = element;
						thisId = thisId + 1;
					end
				end
			end
			table.sort(sortedList, function(a, b) return a.name < b.name end);
			
			
			Controls.SpecialistControlBox2:SetHide( true );
			if numNationalWondersInThisCity > 0 then
				--if header is not hidden and is open
				Controls.NationalWondersHeader:SetHide( false );
				sortOrder = sortOrder + 1;
				otherSortedList[tostring( Controls.NationalWondersHeader )] = sortOrder;
				sortOrder = sortOrder + 1;
				otherSortedList[tostring( Controls.SpecialistControlBox2 )] = sortOrder;
				
				if nationalWonderHeadingOpen then
					Controls.NationalWondersHeader:RegisterCallback( Mouse.eLClick, OnNationalWondersHeaderSelected );
					for i, v in ipairs(sortedList) do
						local building = GameInfo.Buildings[v.ID];
						AddBuildingButton( pCity, building );
					end
					
					if(numNationalWondersWithSpecialistInThisCity > 0) then
						Controls.SpecialistControlBox2:SetHide( false );
					end
				end
			else
				Controls.NationalWondersHeader:SetHide( true );
			end
			if nationalWonderHeadingOpen then
				local localizedLabel = "[ICON_MINUS] "..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_NATIONAL_WONDERS_TEXT", numNationalWondersInThisCity );
				Controls.NationalWondersHeaderLabel:SetText(localizedLabel);
			else
				local localizedLabel = "[ICON_PLUS] "..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_NATIONAL_WONDERS_TEXT", numNationalWondersInThisCity );
				Controls.NationalWondersHeaderLabel:SetText(localizedLabel);
			end
			
			
			-- now add the wonders
			local numWondersInThisCity = 0;
			local numWondersWithSpecialistInThisCity = 0;
			--if wonderHeadingOpen then
			--	local localizedLabel = "[ICON_MINUS] "..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_WONDERS_TEXT" );
			--	Controls.WondersHeaderLabel:SetText(localizedLabel);
			--else
			--	local localizedLabel = "[ICON_PLUS] "..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_WONDERS_TEXT" );
			--	Controls.WondersHeaderLabel:SetText(localizedLabel);
			--end
			local sortedList = {};
			local thisId = 1;
			for building in GameInfo.Buildings() do
				local thisBuildingClass = GameInfo.BuildingClasses[building.BuildingClass];
				if thisBuildingClass.MaxGlobalInstances > 0 then
					local buildingID= building.ID;
					if (pCity:IsHasBuilding(buildingID)) then
						numWondersInThisCity = numWondersInThisCity + 1;
						if(pCity:GetNumSpecialistsAllowedByBuilding(buildingID) > 0) then
							numWondersWithSpecialistInThisCity = numWondersWithSpecialistInThisCity + 1;
						end
						
						local element = {};
						local name = Locale.ConvertTextKey( building.Description )
						element.name = name;
						element.ID = building.ID;
						sortedList[thisId] = element;
						thisId = thisId + 1;
					end
				end
			end
			table.sort(sortedList, function(a, b) return a.name < b.name end);
			
			
			Controls.SpecialistControlBox2:SetHide( true );
			if numWondersInThisCity > 0 then
				--if header is not hidden and is open
				Controls.WondersHeader:SetHide( false );
				sortOrder = sortOrder + 1;
				otherSortedList[tostring( Controls.WondersHeader )] = sortOrder;
				sortOrder = sortOrder + 1;
				otherSortedList[tostring( Controls.SpecialistControlBox2 )] = sortOrder;
				
				if wonderHeadingOpen then
					Controls.WondersHeader:RegisterCallback( Mouse.eLClick, OnWondersHeaderSelected );
					for i, v in ipairs(sortedList) do
						local building = GameInfo.Buildings[v.ID];
						AddBuildingButton( pCity, building );
					end
					
					if(numWondersWithSpecialistInThisCity > 0) then
						Controls.SpecialistControlBox2:SetHide( false );
					end
				end
			else
				Controls.WondersHeader:SetHide( true );
			end
			if wonderHeadingOpen then
				local localizedLabel = "[ICON_MINUS] "..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_WONDERS_TEXT", numWondersInThisCity );
				Controls.WondersHeaderLabel:SetText(localizedLabel);
			else
				local localizedLabel = "[ICON_PLUS] "..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_WONDERS_TEXT", numWondersInThisCity );
				Controls.WondersHeaderLabel:SetText(localizedLabel);
			end
				
			-- now add the Great Work buildings
			local numGreatWorkBuildingsInThisCity = 0;
			--if greatWorkHeadingOpen then
			--	local localizedLabel = "[ICON_MINUS] "..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_GREAT_WORK_BUILDINGS_TEXT" );
			--	Controls.GreatWorkHeaderLabel:SetText(localizedLabel);
			--else
			--	local localizedLabel = "[ICON_PLUS] "..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_GREAT_WORK_BUILDINGS_TEXT" );
			--	Controls.GreatWorkHeaderLabel:SetText(localizedLabel);
			--end
			sortedList = {};
			thisId = 1;
			for building in GameInfo.Buildings() do
				local thisBuildingClass = GameInfo.BuildingClasses[building.BuildingClass];
				if thisBuildingClass.MaxGlobalInstances <= 0 and thisBuildingClass.MaxPlayerInstances < 1 and thisBuildingClass.MaxTeamInstances <= 0 then
					local thisBuilding = GameInfo.Buildings[building.ID];
					if thisBuilding.GreatWorkCount > 0 then
						if (pCity:IsHasBuilding(building.ID)) then
							numGreatWorkBuildingsInThisCity = numGreatWorkBuildingsInThisCity + 1;
							local element = {};
							local name = Locale.ConvertTextKey( building.Description )
							element.name = name;
							element.ID = building.ID;
							sortedList[thisId] = element;
							thisId = thisId + 1;
							end
					end
				end
			end
			table.sort(sortedList, function(a, b) return a.name < b.name end);
			if numGreatWorkBuildingsInThisCity > 0 then
				--if header is not hidden and is open
				Controls.GreatWorkHeader:SetHide( false );
				sortOrder = sortOrder + 1;
				otherSortedList[tostring( Controls.GreatWorkHeader )] = sortOrder;
				if greatWorkHeadingOpen then
					Controls.GreatWorkHeader:RegisterCallback( Mouse.eLClick, OnGreatWorkHeaderSelected );
					for i, v in ipairs(sortedList) do
						local building = GameInfo.Buildings[v.ID];
						AddBuildingButton( pCity, building );
					end
				end
			else
				Controls.GreatWorkHeader:SetHide( true );
			end
			if greatWorkHeadingOpen then
				local localizedLabel = "[ICON_MINUS] "..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_GREAT_WORK_BUILDINGS_TEXT", numGreatWorkBuildingsInThisCity );
				Controls.GreatWorkHeaderLabel:SetText(localizedLabel);
			else
				local localizedLabel = "[ICON_PLUS] "..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_GREAT_WORK_BUILDINGS_TEXT", numGreatWorkBuildingsInThisCity );
				Controls.GreatWorkHeaderLabel:SetText(localizedLabel);
			end
		end
		
		-- the rest of the buildings
		local numBuildingsInThisCity = 0
		local numDistrictBuildingsInThisCity = {};
		if buildingHeadingOpen then
			local localizedLabel = "[ICON_MINUS] "..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_REGULARBUILDING_TEXT" );
			Controls.BuildingsHeaderLabel:SetText(localizedLabel);
		else
			local localizedLabel = "[ICON_PLUS] "..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_REGULARBUILDING_TEXT" );
			Controls.BuildingsHeaderLabel:SetText(localizedLabel);
		end
		sortedList = {};
		thisId = 1;
		if userSettings["UserSettingCIDCityDistricts"] then
			for building in GameInfo.Buildings() do
				local districtID = 1
				local thisBuildingClass = GameInfo.BuildingClasses[building.BuildingClass];
				local buildingID= building.ID;
				if (pCity:IsHasBuilding(buildingID) and GameInfo.Buildings[buildingID].GreatWorkCount > -1) then
					for row in GameInfo.BuildingClass_JFD_District("BuildingClassType = '" .. thisBuildingClass.Type .. "'") do
						districtID = GameInfoTypes[row.DistrictType]
						break
					end
					for row in GameInfo.Building_JFD_District("BuildingType = '" .. building.Type .. "'") do
						districtID = GameInfoTypes[row.DistrictType]
						break
					end
					local numThisCategory = numDistrictBuildingsInThisCity[districtID] or 0
					numDistrictBuildingsInThisCity[districtID] = numThisCategory + 1
					local element = {};
					local description = Locale.ConvertTextKey( building.Description )
					element.Description = description;
					element.ID = building.ID;
					element.SpecialistCount = building.SpecialistCount;
					element.GreatWorkCount = building.GreatWorkCount;
					element.CategoryID = districtID;
					sortedList[thisId] = element;
					thisId = thisId + 1;
				end
			end
		else
			for building in GameInfo.Buildings() do
				local thisBuildingClass = GameInfo.BuildingClasses[building.BuildingClass];
				if thisBuildingClass.MaxGlobalInstances <= 0 and thisBuildingClass.MaxPlayerInstances < 1 and thisBuildingClass.MaxTeamInstances <= 0 then
					local buildingID= building.ID;
					if pCity:GetNumSpecialistsAllowedByBuilding(buildingID) <= 0 then
						if (pCity:IsHasBuilding(buildingID) and GameInfo.Buildings[buildingID].GreatWorkCount == 0) then
							numBuildingsInThisCity = numBuildingsInThisCity + 1;
							local element = {};
							local description = Locale.ConvertTextKey( building.Description )
							element.Description = description;
							element.ID = building.ID;
							element.SpecialistCount = building.SpecialistCount;
							element.GreatWorkCount = building.GreatWorkCount;
							sortedList[thisId] = element;
							thisId = thisId + 1;
						end
					end
				end
			end
		end
		table.sort(sortedList, function(a, b) return a.Description < b.Description end);
		
		--Districts
		if userSettings["UserSettingCIDCityDistricts"] then
			Controls.BuildingsHeader:SetHide( true );
			for row in GameInfo.JFD_Districts() do
				local numString = tostring(row.ID)
				local buttonName = "Buildings"..numString.."Header" 
				local buttonNameLabel = "Buildings"..numString.."HeaderLabel"
				local buttonNameDevelopmentLabel = "Buildings"..numString.."DevelopmentLabel"
				local thisButton = Controls[buttonName]
				local thisButtonLabel = Controls[buttonNameLabel]
				local thisButtonDevelopmentLabel = Controls[buttonNameDevelopmentLabel]
				thisButton:SetHide( true );
				if (numDistrictBuildingsInThisCity[row.ID] and numDistrictBuildingsInThisCity[row.ID] > 0) then
					thisButton:SetHide( false );
					thisButton:SetVoid1( row.ID );
					thisButton:RegisterCallback( Mouse.eLClick, OnBuildingsHeaderSelected );
					sortOrder = sortOrder + 1;
					otherSortedList[tostring( thisButton )] = sortOrder;
					JFD_AddBuildingsToDistrict(pCity, row.ID, thisButton, thisButtonLabel, thisButtonDevelopmentLabel, sortedList)
				end
			end
		else
			if numBuildingsInThisCity > 0 then
				--if header is not hidden and is open
				Controls.BuildingsHeader:SetHide( false );
				sortOrder = sortOrder + 1;
				otherSortedList[tostring( Controls.BuildingsHeader )] = sortOrder;
				if buildingHeadingOpen then
					Controls.BuildingsHeader:RegisterCallback( Mouse.eLClick, OnBuildingsHeaderSelected );
					for i, v in ipairs(sortedList) do
						local building = GameInfo.Buildings[v.ID];
						AddBuildingButton( pCity, building );
					end
				end
			else
				Controls.BuildingsHeader:SetHide( true );
			end
			if buildingHeadingOpen then
				local localizedLabel = "[ICON_MINUS] "..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_REGULARBUILDING_TEXT", numBuildingsInThisCity );
				Controls.BuildingsHeaderLabel:SetText(localizedLabel);
			else
				local localizedLabel = "[ICON_PLUS] "..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_REGULARBUILDING_TEXT", numBuildingsInThisCity );
				Controls.BuildingsHeaderLabel:SetText(localizedLabel);
			end
		end
		
		Controls.BuildingStack:SortChildren( CVSortFunction );
		
		Controls.BuildingStack:CalculateSize();
		Controls.BuildingStack:ReprocessAnchoring();
		
		Controls.WorkerManagementBox:CalculateSize();
		Controls.WorkerManagementBox:ReprocessAnchoring();
		
		Controls.SpecialistBox:CalculateSize();
		Controls.SpecialistBox:ReprocessAnchoring();
		
		Controls.GPStack:CalculateSize();
		Controls.GPStack:ReprocessAnchoring();
		
		RecalcPanelSize();
		
		-----------------------------------------
		-- Buying Plots
		-------------------------------------------
		szText = string.format( Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_BUY_TILE") );
	    Controls.BuyPlotButton:SetToolTipString( Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_BUY_TILE_TT" ) );
		Controls.BuyPlotText:SetText(szText);
	    if (GameDefines["BUY_PLOTS_DISABLED"] ~= 0) then
			Controls.BuyPlotButton:SetDisabled(true);			
	    end

	    -------------------------------------------
		-- JFD Province
		-------------------------------------------
		if userSettings["UserSettingCIDProvincesCore"] then
			local provinceTitle = pPlayer:GetProvinceTitle(pCity, provinceID)
			local provinceSimpleTT, provinceTT = pPlayer:GetProvinceInfoTT(pCity, provinceID)
			Controls.ProvinceString:SetText(provinceTitle);
			-- Controls.ProvinceBox:SetToolTipString(provinceTT);
			Controls.ProvinceBox:SetHide(false);

			pediaSearchStrings[tostring(Controls.ProvinceString)] = Locale.ConvertTextKey("TXT_KEY_JFD_PROVINCES_HEADING1_TITLE");
			Controls.ProvinceString:RegisterCallback( Mouse.eRClick, GetPedia );
			
			local reqImpr, reqPop, cityImpr, cityPop, isConnected, isConnectedViaSP, provinceUpgrade = pPlayer:GetProvinceUpgradeRequirements(pCity)
			if (reqImpr > 0 and reqPop > 0) then
				Controls.ProvinceBuildBox:SetHide(false)
				Controls.ProvincePopBox:SetHide(false)
				Controls.ProvinceUpgradeBox:SetHide(false)
				Controls.ProvincePopLabel:LocalizeAndSetText("TXT_KEY_JFD_CITYVIEW_PROVINCE_REQ_POP", cityPop, reqPop);
				Controls.ProvincePopBox:LocalizeAndSetToolTip("TXT_KEY_JFD_CITYVIEW_PROVINCE_REQ_POP_TT", cityPop, reqPop);
				Controls.ProvinceBuildLabel:LocalizeAndSetText("TXT_KEY_JFD_CITYVIEW_PROVINCE_REQ_BUILD", cityImpr, reqImpr);
				Controls.ProvinceBuildBox:LocalizeAndSetToolTip("TXT_KEY_JFD_CITYVIEW_PROVINCE_REQ_BUILD_TT", cityImpr, reqImpr);
				if ((reqImpr == cityImpr or reqPop == cityPop) and isConnected) then
					Controls.ProvinceConnectedLabel:SetHide(true)
					Controls.ProvinceUpgradeFlashing:LocalizeAndSetText("TXT_KEY_JFD_CV_PROVINCE_UPGRADEABLE", provinceUpgrade.IconString)
					Controls.ProvinceUpgradeBox:LocalizeAndSetToolTip("TXT_KEY_JFD_CV_PROVINCE_UPGRADEABLE_TT", provinceUpgrade.IconString, GameInfo.Buildings[provinceUpgrade.BuildingType].Description)
				else
					if isConnected then
						Controls.ProvinceConnectedLabel:SetHide(false)
						Controls.ProvinceConnectedLabel:LocalizeAndSetText("[ICON_CONNECTED]");
						if isConnectedViaSP then
							Controls.ProvinceUpgradeBox:LocalizeAndSetToolTip("TXT_KEY_JFD_CV_PROVINCE_REQ_CONNECTION_TT_SUMMER_PALACE");
						else
							Controls.ProvinceUpgradeBox:LocalizeAndSetToolTip("TXT_KEY_JFD_CV_PROVINCE_REQ_CONNECTION_TT");
						end
					else
						Controls.ProvinceConnectedLabel:SetHide(false)
						Controls.ProvinceConnectedLabel:LocalizeAndSetText("[ICON_BLOCKADED]");
						Controls.ProvinceUpgradeBox:LocalizeAndSetToolTip("TXT_KEY_JFD_CV_PROVINCE_REQ_CONNECTION_TT_NOT");
					end
					Controls.ProvinceUpgradeFlashing:SetHide(true)
				end
				Controls.IconsStack:SetOffsetVal(0,20)
			else
				Controls.ProvinceUpgradeBox:SetHide(true)
				Controls.ProvinceBuildBox:SetHide(true)
				Controls.ProvincePopBox:SetHide(true)
				Controls.IconsStack:SetOffsetVal(0,10)
				Controls.IconsStack:CalculateSize()
				Controls.IconsStack:ReprocessAnchoring()
			end
			Controls.ProvinceStack:ReprocessAnchoring()
		else
			Controls.ProvinceBox:SetHide(true);
			Controls.ProvinceBuildBox:SetHide(true)
			Controls.ProvincePopBox:SetHide(true)
		end

		-------------------------------------------
		-- Resource Demanded
		-------------------------------------------
		
		local szResourceDemanded = "??? (Research Required)";
		
		if (pCity:GetResourceDemanded(true) ~= -1) then
			local pResourceInfo = GameInfo.Resources[pCity:GetResourceDemanded()];
			szResourceDemanded = Locale.ConvertTextKey(pResourceInfo.IconString) .. " " .. Locale.ConvertTextKey(pResourceInfo.Description);
			Controls.ResourceDemandedBox:SetHide(false);
		else
			Controls.ResourceDemandedBox:SetHide(true);
		end
				
		local iNumTurns = pCity:GetWeLoveTheKingDayCounter();
		if (iNumTurns > 0) then
			szText = Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_WLTKD_COUNTER", tostring(iNumTurns) );
			--- CBP
			if(pPlayer:IsGPWLTKD()) then
				szText = Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_WLTKD_COUNTER_UA", tostring(iNumTurns) );
				Controls.ResourceDemandedBox:SetToolTipString(Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_RESOURCE_FULFILLED_TT_UA" ) );
				Controls.ResourceDemandedBox:SetHide(false);
			elseif(pPlayer:IsCarnaval())then
				szText = Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_WLTKD_COUNTER_UA_CARNAVAL", tostring(iNumTurns) );
				Controls.ResourceDemandedBox:SetToolTipString(Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_RESOURCE_FULFILLED_TT_UA_CARNAVAL" ) );
				Controls.ResourceDemandedBox:SetHide(false);
			else
			-- END

			Controls.ResourceDemandedBox:SetToolTipString(Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_RESOURCE_FULFILLED_TT" ) );
			--CBP
			end
			Controls.ResourceDemandedBox:SetHide(false);
			-- END
		else
			szText = Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_RESOURCE_DEMANDED", szResourceDemanded );
			--CBP
			if(pPlayer:IsGPWLTKD()) then
				Controls.ResourceDemandedBox:SetToolTipString(Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_RESOURCE_DEMANDED_TT_UA" ) );
			elseif(pPlayer:IsCarnaval())then
				Controls.ResourceDemandedBox:SetToolTipString(Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_RESOURCE_DEMANDED_TT_UA_CARNAVAL" ) );
			else
				Controls.ResourceDemandedBox:SetToolTipString(Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_RESOURCE_DEMANDED_TT" ) );
			-- CBP
			end
			-- END
		end
		
		Controls.ResourceDemandedString:SetText(szText);
		Controls.ResourceDemandedBox:SetSizeX(Controls.ResourceDemandedString:GetSizeX() + 10);
		Controls.ResourceDemandedBox:ReprocessAnchoring()
		
		Controls.IconsStack:CalculateSize();
		Controls.IconsStack:ReprocessAnchoring();
		
		Controls.NotificationStack:CalculateSize();
		Controls.NotificationStack:ReprocessAnchoring();
		
		-------------------------------------------
		-- Raze City Button (Occupied Cities only)
		-------------------------------------------
		
		if (not pCity:IsOccupied() or pCity:IsRazing()) then		
			g_bRazeButtonDisabled = true;
			Controls.RazeCityButton:SetHide(true);
		else
			-- Can we not actually raze this city?
			if (not pPlayer:CanRaze(pCity, false)) then
				-- We COULD raze this city if it weren't a capital
				if (pPlayer:CanRaze(pCity, true)) then
					g_bRazeButtonDisabled = true;
					Controls.RazeCityButton:SetHide(false);
					Controls.RazeCityButton:SetDisabled(true);
					Controls.RazeCityButton:SetToolTipString( Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_RAZE_BUTTON_DISABLED_BECAUSE_CAPITAL_TT" ) );
				-- Can't raze this city period
				else
					g_bRazeButtonDisabled = true;
					Controls.RazeCityButton:SetHide(true);
				end
			else
				g_bRazeButtonDisabled = false;
				Controls.RazeCityButton:SetHide(false);
				Controls.RazeCityButton:SetDisabled(false);		
				Controls.RazeCityButton:SetToolTipString( Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_RAZE_BUTTON_TT" ) );
			end
		end

		-- Stop city razing
		if (pCity:IsRazing()) then
			g_bRazeButtonDisabled = false;
			Controls.UnrazeCityButton:SetHide(false);
		else
			g_bRazeButtonDisabled = true;
			Controls.UnrazeCityButton:SetHide(true);
		end
		
--		UpdateSpecialists(pCity);
		UpdateWorkingHexes();
		UpdateBuyPlotButton();

		-- Update left corner tooltips
		DoUpdateUpperLeftTooltips();
		local iFoodPerTurn = 0
		local iGoldPerTurn = 0
		local iProductionPerTurn = 0
		local iFaithPerTurn = 0
		local iGAPPerTurn = 0
		local iSciencePerTurn = 0
		local iCulturePerTurn = 0
		local iTourismPerTurn = 0
		
		iFoodPerTurn = pCity:FoodDifferenceTimes100() / 100;
		if (iFoodPerTurn >= 0) then
			yield1TT = yield1TT .. "[ICON_FOOD] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_FOOD_TEXT") .. ": " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT", iFoodPerTurn)
			Controls.FoodPerTurnLabel1:SetText("[ICON_FOOD] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_FOOD_TEXT"))
			Controls.FoodPerTurn1:SetText(Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT", iFoodPerTurn))
		else
			yield1TT = yield1TT .. "[ICON_FOOD] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_FOOD_TEXT") .. ": " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT_NEGATIVE", iFoodPerTurn)
			Controls.FoodPerTurnLabel1:SetText("[ICON_FOOD] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_FOOD_TEXT"))
			Controls.FoodPerTurn1:SetText(Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT_NEGATIVE", iFoodPerTurn))
		end
		
		iProductionPerTurn = pCity:GetCurrentProductionDifferenceTimes100(false, false) / 100;--pCity:GetYieldRate(YieldTypes.YIELD_PRODUCTION);
		if (iProductionPerTurn >= 0) then
			yield1TT = yield1TT .. "[NEWLINE][ICON_PRODUCTION] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PROD_TEXT") .. ": " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT", iProductionPerTurn)
			Controls.ProdPerTurnLabel1:SetText("[ICON_PRODUCTION] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PROD_TEXT"))
			Controls.ProdPerTurn1:SetText(Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT", iProductionPerTurn))
		else
			yield1TT = yield1TT .. "[NEWLINE][ICON_PRODUCTION] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PROD_TEXT") .. ": " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT_NEGATIVE", iProductionPerTurn)
			Controls.ProdPerTurnLabel1:SetText("[ICON_PRODUCTION] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PROD_TEXT"))
			Controls.ProdPerTurn1:SetText(Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT_NEGATIVE", iProductionPerTurn))
		end
		
		-- display gold income
		iGoldPerTurn = pCity:GetYieldRateTimes100(YieldTypes.YIELD_GOLD) / 100;
		if iGoldPerTurn >= 0 then
			yield1TT = yield1TT .. "[NEWLINE][ICON_GOLD] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_GOLD_TEXT") .. ": " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT", iGoldPerTurn)
			if yield1HeadingOpen then
				Controls.GoldPerTurnLabel:SetText( Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT", iGoldPerTurn) );
			else
				Controls.GoldPerTurnLabel1:SetText("[ICON_GOLD] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_GOLD_TEXT"))
				Controls.GoldPerTurn1:SetText(Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT", iGoldPerTurn))
			end
		else
			yield1TT = yield1TT .. "[NEWLINE][ICON_GOLD] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_GOLD_TEXT") .. ": " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT_NEGATIVE", iGoldPerTurn)
			if yield1HeadingOpen then
				Controls.GoldPerTurnLabel:SetText( Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT_NEGATIVE", iGoldPerTurn) );
			else
				Controls.GoldPerTurnLabel1:SetText("[ICON_GOLD] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_GOLD_TEXT"))
				Controls.GoldPerTurn1:SetText(Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT_NEGATIVE", iGoldPerTurn))
			end
		end
		if yield1HeadingOpen then
			local pediaEntry = CivilopediaControl and ("TXT_KEY_GOLD_HEADING1_TITLE")
			if pediaEntry then
				Controls.GoldBox:RegisterCallback(Mouse.eRClick, function() getPedia(pediaEntry) end)
			end
		end
		--Controls.ProdBox:SetToolTipString(strToolTip);
		
		-- display science income
		if (Game.IsOption(GameOptionTypes.GAMEOPTION_NO_SCIENCE)) then
			Controls.SciencePerTurnLabel:SetText( Locale.ConvertTextKey("TXT_KEY_CITYVIEW_OFF") );
		else
			iSciencePerTurn = pCity:GetYieldRateTimes100(YieldTypes.YIELD_SCIENCE) / 100;
			if iSciencePerTurn >= 0 then
				yield3TT = yield3TT .. "[NEWLINE][ICON_RESEARCH] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_RESEARCH_TEXT") .. ": " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT", iSciencePerTurn)
				if yield3HeadingOpen then
					Controls.SciencePerTurnLabel:SetText( Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT", iSciencePerTurn) );
				else
					Controls.SciencePerTurnLabel3:SetText("[ICON_RESEARCH] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_RESEARCH_TEXT"))
					Controls.SciencePerTurn3:SetText(Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT", iSciencePerTurn))
				end
			else
				yield3TT = yield3TT .. "[NEWLINE][ICON_RESEARCH] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_RESEARCH_TEXT") .. ": " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT_NEGATIVE", iSciencePerTurn)
				if yield3HeadingOpen then
					Controls.SciencePerTurnLabe3:SetText( Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT_NEGATIVE", iSciencePerTurn) );
				else
					Controls.SciencePerTurnLabel3:SetText("[ICON_RESEARCH] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_RESEARCH_TEXT"))
					Controls.SciencePerTurn3:SetText(Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT_NEGATIVE", iSciencePerTurn))
				end
			end
		end
		if yield3HeadingOpen then
			local pediaEntry = CivilopediaControl and ("TXT_KEY_TECH_BEAKERS_HEADING2_TITLE")
			if pediaEntry then
				Controls.ScienceBox:RegisterCallback(Mouse.eRClick, function() getPedia(pediaEntry) end)
			end
		end
		--Controls.ScienceBox:SetToolTipString(strToolTip);
		
		iCulturePerTurn = pCity:GetJONSCulturePerTurn();
		if iCulturePerTurn >= 0 then
			yield4TT = yield4TT .. "[ICON_CULTURE] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_CULTURE_TEXT") .. ": " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT", iCulturePerTurn)
			if yield4HeadingOpen then
				Controls.CulturePerTurnLabel:SetText( Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT", iCulturePerTurn) );
			else
				Controls.CulturePerTurnLabel4:SetText("[ICON_CULTURE] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_CULTURE_TEXT"))
				Controls.CulturePerTurn4:SetText(Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT", iCulturePerTurn))
			end
		else
			yield4TT = yield4TT .. "[ICON_CULTURE] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_CULTURE_TEXT") .. ": " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT_NEGATIVE", iCulturePerTurn)
			if yield4HeadingOpen then
				Controls.CulturePerTurnLabel:SetText( Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT_NEGATIVE", iCulturePerTurn) );
			else
				Controls.CulturePerTurnLabel4:SetText("[ICON_CULTURE] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_CULTURE_TEXT"))
				Controls.CulturePerTurn4:SetText(Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT_NEGATIVE", iCulturePerTurn))
			end
		end
		--Controls.CultureBox:SetToolTipString(strToolTip);
		local cultureStored = pCity:GetJONSCultureStored();
		local cultureNext = pCity:GetJONSCultureThreshold();
		local cultureDiff = cultureNext - cultureStored;
		local percentComplete = cultureStored / cultureNext;
		local cultureTurns = 0
		if iCulturePerTurn > 0 then cultureTurns = math.ceil(cultureDiff / iCulturePerTurn); end
		-- if (cultureTurns < 1) then cultureTurns = 1 end
		if yield4HeadingOpen then
			if iCulturePerTurn > 0 then
				Controls.CultureTimeTillGrowthLabel:SetText( Locale.ConvertTextKey("TXT_KEY_CITYVIEW_TURNS_TILL_TILE_TEXT", cultureTurns) );
				Controls.CultureTimeTillGrowthLabel:SetHide( false );
			else
				Controls.CultureTimeTillGrowthLabel:SetHide( true );
			end
			Controls.CultureMeter:SetPercent( percentComplete );
			local pediaEntry = CivilopediaControl and ("TXT_KEY_CULTURE_HEADING1_TITLE")
			if pediaEntry and OptionsManager.GetSmallUIAssets() then
				Controls.CultureBox:RegisterCallback(Mouse.eRClick, function() getPedia(pediaEntry) end)
			end
		end
		if cultureTurns == 0 then Controls.CultureTimeAnim:SetHide( true ); end
		Controls.CultureMeter2:SetPercent( percentComplete );
		Controls.CultureTimeTillGrowthLabel2:SetText( Locale.ConvertTextKey("[ICON_CULTURE]{1_Num}", cultureTurns) );
		Controls.CulturePlot:LocalizeAndSetToolTip( "TXT_KEY_CITYVIEW_TURNS_TILL_TILE_TEXT", cultureTurns );
		
		if (Game.IsOption(GameOptionTypes.GAMEOPTION_NO_RELIGION)) then
			Controls.FaithPerTurnLabel:SetText( Locale.ConvertTextKey("TXT_KEY_CITYVIEW_OFF") );
		else
			iFaithPerTurn = pCity:GetFaithPerTurn();
			if iFaithPerTurn >= 0 then
				yield3TT = "[ICON_PEACE] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_FAITH_TEXT") .. ": " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT", iFaithPerTurn) .. yield3TT
				if yield3HeadingOpen then
					Controls.FaithPerTurnLabel:SetText( Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT", iFaithPerTurn) );
				else
					Controls.FaithPerTurnLabel3:SetText("[ICON_PEACE] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_FAITH_TEXT"))
					Controls.FaithPerTurn3:SetText(Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT", iFaithPerTurn))
				end
			else
				yield3TT = "[ICON_PEACE] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_FAITH_TEXT") .. ": " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT_NEGATIVE", iFaithPerTurn) .. yield3TT
				if yield3HeadingOpen then
					Controls.FaithPerTurnLabel:SetText( Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT_NEGATIVE", iFaithPerTurn) );
				else
					Controls.FaithPerTurnLabel3:SetText("[ICON_PEACE] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_FAITH_TEXT"))
					Controls.FaithPerTurn3:SetText(Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT_NEGATIVE", iFaithPerTurn))
				end
			end
		end
		if yield3HeadingOpen then
			local pediaEntry = CivilopediaControl and ("TXT_KEY_CONCEPT_RELIGION_FAITH_EARNING_DESCRIPTION")
			if pediaEntry then
				Controls.FaithBox:RegisterCallback(Mouse.eRClick, function() getPedia(pediaEntry) end)
			end
		end
		
		iTourismPerTurn = pCity:GetBaseTourism();
		iTourismPerTurn = iTourismPerTurn - pCity:GetYieldFromCrime(GameInfoTypes["YIELD_TOURISM"])
		if iTourismPerTurn >= 0 then
			yield4TT = yield4TT .. "[NEWLINE][ICON_TOURISM] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_TOURISM_TEXT") .. ": " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT", iTourismPerTurn)
			if yield4HeadingOpen then
				Controls.TourismPerTurnLabel:SetText( Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT", iTourismPerTurn) );
			else
				Controls.TourismPerTurnLabel4:SetText("[ICON_TOURISM] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_TOURISM_TEXT"))
				Controls.TourismPerTurn4:SetText(Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT", iTourismPerTurn))
			end
		else
			yield4TT = yield4TT .. "[NEWLINE][ICON_TOURISM] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_TOURISM_TEXT") .. ": " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT_NEGATIVE", iTourismPerTurn)
			if yield4HeadingOpen then
				Controls.TourismPerTurnLabel:SetText( Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT_NEGATIVE", iTourismPerTurn) );
			else
				Controls.TourismPerTurnLabel4:SetText("[ICON_TOURISM] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_TOURISM_TEXT"))
				Controls.TourismPerTurn4:SetText(Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT_NEGATIVE", iTourismPerTurn))
			end
		end
		if yield4HeadingOpen then
			local pediaEntry = CivilopediaControl and ("TXT_KEY_CULTURE_TOURISM_HEADING2_TITLE")
			if pediaEntry then
				Controls.TourismBox:RegisterCallback(Mouse.eRClick, function() getPedia(pediaEntry) end)
			end
		end
		
		--BEGIN JFDLC
		--Crime Status
		if userSettings["UserSettingCIDCrimeCore"] then
			local crime = pPlayer:GetCityCrimeTotal(pCity)
			local crimeTT, crimeSpecificsTT, highestCrimeID
			if yield6HeadingOpen then
				crimeTT, crimeSpecificsTT, highestCrimeID = pPlayer:GetCityCrimeTT(pCity, false, true)
			else
				crimeTT, crimeSpecificsTT, highestCrimeID = pPlayer:GetCityCrimeTT(pCity, false, false)
			end
			local highestCrime = nil
			if highestCrimeID then highestCrime = GameInfo.JFD_Crimes[highestCrimeID] end
			yield6TT = yield6TT .. "[ICON_JFD_CRIME_BLACK] " .. Locale.ConvertTextKey("TXT_KEY_YIELD_JFD_CRIME") .. ": " .. crime
			if yield6HeadingOpen then
				Controls.CrimeBox:SetHide(false)
				Controls.CrimeBox:SetToolTipString(crimeTT)
				Controls.CrimePerTurnLabel:SetText("[COLOR_JFD_CRIME_BLACK]" .. crime .. "[ENDCOLOR]")
				if highestCrimeID and highestCrimeID > -1 then
					Controls.HighestCrimeLabel:SetHide(false)
					Controls.HighestCrimeLabel:LocalizeAndSetText("TXT_KEY_JFD_CITYVIEW_CRIME_TEXT_TT_HIGH", highestCrime.TextColour, highestCrime.Description)
					Controls.HighestCrimeLabel:SetToolTipString(crimeSpecificsTT)
				else
					Controls.HighestCrimeLabel:SetHide(true)
				end
				local pediaEntry = CivilopediaControl and ("TXT_KEY_JFD_CRIME_HEADING1_TITLE")
				if pediaEntry then
					Controls.CrimeBox:RegisterCallback(Mouse.eRClick, function() getPedia(pediaEntry) end)
				end
				-- Organized Crime Status
				if userSettings["UserSettingCIDCrimeOrganizedCore"] and highestCrimeID and highestCrimeID > -1 then
					local organizedCrimeID = GameInfoTypes[highestCrime.OrganizedCrimeType]
					local organizedCrime = GameInfo.JFD_OrganizedCrimes[organizedCrimeID]
					local organizedCrimeThreshold = pPlayer:GetOrganizedCrimeThreshold(pCity)
					local organizedCrimeValue = Game.GetRound(pPlayer:GetOrganizedCrimeValue(pCity, organizedCrimeID))
					if organizedCrimeValue >= organizedCrimeThreshold then
						Controls.OrganizedCrimeThreshold:SetText("[COLOR_NEGATIVE_TEXT]" .. organizedCrimeValue .. "[ENDCOLOR][COLOR_JFD_CRIME_BLACK]/" .. organizedCrimeThreshold .. "%[ENDCOLOR]")
					else
						Controls.OrganizedCrimeThreshold:SetText("[COLOR_POSITIVE_TEXT]" .. organizedCrimeValue .. "[ENDCOLOR][COLOR_JFD_CRIME_BLACK]/" .. organizedCrimeThreshold .. "%[ENDCOLOR]")
					end
					Controls.OrganizedCrimeThreshold:LocalizeAndSetToolTip(crimeSpecificsTT)
					if pPlayer:GetValidOrganizedCrimeID(pCity) > -1 then
						Controls.HighestCrimeLabel:LocalizeAndSetText("TXT_KEY_JFD_CITYVIEW_ORGANIZED_CRIME_TEXT_TT_HIGH", highestCrime.TextColour, organizedCrime.Description)
					end
				end
			else
				Controls.CrimePerTurnLabel6:SetText("[COLOR_JFD_CRIME_BLACK][ICON_JFD_CRIME_BLACK] " .. Locale.ConvertTextKey("TXT_KEY_YIELD_JFD_CRIME") .. "[ENDCOLOR]")
				Controls.CrimePerTurn6:SetText(Locale.ConvertTextKey("[COLOR_JFD_CRIME_BLACK]" .. crime .. "[ENDCOLOR]"))
			end
			if highestCrimeID and highestCrimeID > -1 then
				Controls.CrimeIcon:SetText(highestCrime.IconString)
				Controls.CrimeIcon:LocalizeAndSetToolTip("TXT_KEY_JFD_CITYVIEW_CRIME_TEXT_TT_HIGH", highestCrime.TextColour, highestCrime.Description)
				Controls.CrimeIcon:SetHide(false)
			else
				Controls.CrimeBox:SetHide(true)
			end
		else
			Controls.CrimeBox:SetHide(true)
		end
		--Happiness Status
		local excessHappiness, excessUnhappiness = pPlayer:GetCityExcessHappiness(pCity, true)
		if userSettings["UserSettingCIDHappinessCore"] then
			local pediaEntry = CivilopediaControl and ("TXT_KEY_JFD_HAPPINESS_HEADING1_TITLE")
			if excessHappiness >= excessUnhappiness then
				yield2TT = yield2TT .. "[NEWLINE][ICON_HAPPINESS_1] " .. Locale.ConvertTextKey("TXT_KEY_YIELD_JFD_HAPPINESS") .. ": +" .. excessHappiness
				if yield2HeadingOpen then
					Controls.HappinessIcon:SetText("[ICON_HAPPINESS_1]")
					Controls.HappinessLabel:LocalizeAndSetText("TXT_KEY_CITYVIEW_HAPPINESS_TEXT")
					Controls.HappinessPerTurnLabel:SetText( Locale.ConvertTextKey("TXT_KEY_CITYVIEW_HAPPINESS_PERTURN_TEXT", excessHappiness, "[COLOR_HAPPINESS]") );
					local resistanceCounter, resistanceThreshold = pPlayer:GetCityResistanceCounterDetails(pCity, true)
					if resistanceCounter > 0 then
						Controls.ResistanceLabel:LocalizeAndSetText("TXT_KEY_JFD_CITYVIEW_RESISTANCE_RECEDING_TURNS_TEXT")
					else
						Controls.ResistanceLabel:LocalizeAndSetText("TXT_KEY_JFD_CITYVIEW_RESISTANCE_NONE_TURNS_TEXT")
					end
					Controls.ResistanceLabel:SetHide(false)
					Controls.ResistanceLabelFlashing:SetHide(true)
				else
					Controls.HappinessPerTurnLabel2:SetText("[ICON_HAPPINESS_1] [COLOR_HAPPINESS]" .. Locale.ConvertTextKey("TXT_KEY_YIELD_JFD_HAPPINESS"))
					Controls.HappinessPerTurn2:SetText(Locale.ConvertTextKey("TXT_KEY_CITYVIEW_HAPPINESS_PERTURN_TEXT", excessHappiness, "[COLOR_HAPPINESS]"))
				end
			else
				yield2TT = yield2TT .. "[NEWLINE][ICON_HAPPINESS_4] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_UNHAPPINESS_TEXT") .. ": -" .. excessUnhappiness
				if yield2HeadingOpen then
					Controls.HappinessIcon:SetText("[ICON_HAPPINESS_4]")
					Controls.HappinessLabel:LocalizeAndSetText("TXT_KEY_CITYVIEW_UNHAPPINESS_TEXT")
					Controls.HappinessPerTurnLabel:SetText( Locale.ConvertTextKey("TXT_KEY_CITYVIEW_HAPPINESS_PERTURN_TEXT", excessUnhappiness, "[COLOR_UNHAPPINESS]") );
					local resistanceCounter, resistanceThreshold, resistanceTurns = pPlayer:GetCityResistanceCounterDetails(pCity, true, true)
					if resistanceTurns <= userSettings["UserSettingCIDHappinessCoreFirstNotificationResistanceTurns"] then
						Controls.ResistanceLabel:SetHide(true)
						Controls.ResistanceLabelFlashing:SetHide(false)
						Controls.ResistanceLabelFlashing:LocalizeAndSetText("TXT_KEY_JFD_CITYVIEW_RESISTANCE_TURNS_TEXT", resistanceTurns)
					else
						Controls.ResistanceLabel:SetHide(false)
						Controls.ResistanceLabelFlashing:SetHide(true)
						Controls.ResistanceLabel:LocalizeAndSetText("TXT_KEY_JFD_CITYVIEW_RESISTANCE_TURNS_TEXT", resistanceTurns)
					end
				else
					Controls.HappinessPerTurnLabel2:SetText("[ICON_HAPPINESS_1] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_UNHAPPINESS_TEXT"))
					Controls.HappinessPerTurn2:SetText(Locale.ConvertTextKey("TXT_KEY_CITYVIEW_HAPPINESS_PERTURN_TEXT", excessUnhappiness, "[COLOR_UNHAPPINESS]"))
				end
			end
			if pCity:GetResistanceTurns() > 0 then
				pediaEntry = CivilopediaControl and ("TXT_KEY_JFD_HAPPINESS_RESISTANCE_HEADING1_TITLE")
				Controls.HappinessIcon:SetText("[ICON_RESISTANCE]")
				Controls.HappinessLabel:SetText("[COLOR_UNHAPPINESS]" .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_JFD_RESISTANCE_TEXT") .. "[ENDCOLOR]")
				Controls.ResistanceLabelFlashing:SetHide(true)
			end
			if pediaEntry then
				Controls.HappinessBox:RegisterCallback(Mouse.eRClick, function() getPedia(pediaEntry) end)
			end
		elseif (not isUsingCBO) then
			if excessHappiness >= 0 then
				Controls.HappinessPerTurnLabel:SetText( Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT", excessHappiness) );
			else
				Controls.HappinessPerTurnLabel:SetText( Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT_NEGATIVE", excessHappiness) );
			end
			Controls.ResistanceCounter:SetHide(true)
		end
		Controls.HappinessBox:SetHide(not yield2HeadingOpen)
		--Health Status
		local excessHealth, excessDisease = pPlayer:GetCityExcessHealth(pCity, true)
		local pediaEntry = CivilopediaControl and ("TXT_KEY_JFD_HEALTH_HEADING1_TITLE")
		if userSettings["UserSettingCIDHealthCore"] then
			if yield2HeadingOpen then
				Controls.HealthBox:SetHide(false)
				local healthBreakdownTT, plagueSentimentTT = pPlayer:GetCityHealthTT(pCity)
				Controls.HealthBox:LocalizeAndSetToolTip( healthBreakdownTT );
				if plagueSentimentTT then
					Controls.PlagueLabel:LocalizeAndSetToolTip( plagueSentimentTT );
					Controls.PlagueLabelFlashing:LocalizeAndSetToolTip( plagueSentimentTT );
				end
			end
			if excessHealth >= excessDisease then
				yield2TT = "[ICON_JFD_HEALTH] " .. Locale.ConvertTextKey("TXT_KEY_JFD_CITYVIEW_HEALTH_TEXT") .. ": +" .. excessHealth .. yield2TT
				if yield2HeadingOpen then
					Controls.HealthIcon:SetText("[ICON_JFD_HEALTH]")
					Controls.HealthLabel:SetText("[COLOR_JFD_HEALTH]" .. Locale.ConvertTextKey("TXT_KEY_JFD_CITYVIEW_HEALTH_TEXT") .. "[ENDCOLOR]")
					Controls.HealthPerTurnLabel:SetText("[COLOR_JFD_HEALTH]+" .. excessHealth .. "[ENDCOLOR]")
					local plagueCounter, plagueThreshold, plagueTurns = pPlayer:GetCityPlagueCounterDetails(pCity, true, true)
					if plagueCounter > 0 then
						Controls.PlagueLabel:LocalizeAndSetText("TXT_KEY_JFD_CITYVIEW_PLAGUE_RECEDING_TURNS_TEXT")
					else
						Controls.PlagueLabel:LocalizeAndSetText("TXT_KEY_JFD_CITYVIEW_PLAGUE_NONE_TURNS_TEXT")
					end
					Controls.PlagueLabel:SetHide(false)
					Controls.PlagueLabelFlashing:SetHide(true)
				else
					Controls.HealthPerTurnLabel2:SetText("[ICON_JFD_HEALTH] [COLOR_JFD_HEALTH]" .. Locale.ConvertTextKey("TXT_KEY_JFD_CITYVIEW_HEALTH_TEXT") .. "[ENDCOLOR]")
					Controls.HealthPerTurn2:SetText(Locale.ConvertTextKey("[COLOR_JFD_HEALTH]+" .. excessHealth .. "[ENDCOLOR]"))
				end
			else
				yield2TT = "[ICON_JFD_DISEASE] " .. Locale.ConvertTextKey("TXT_KEY_JFD_CITYVIEW_DISEASE_TEXT") .. ": +" .. excessDisease .. yield2TT
				if yield2HeadingOpen then
					Controls.HealthIcon:SetText("[ICON_JFD_DISEASE]")
					Controls.HealthLabel:SetText("[COLOR_JFD_DISEASE]" .. Locale.ConvertTextKey("TXT_KEY_JFD_CITYVIEW_DISEASE_TEXT") .. "[ENDCOLOR]")
					Controls.HealthPerTurnLabel:SetText("[COLOR_JFD_DISEASE]+" .. excessDisease .. "[ENDCOLOR]")
					local plagueCounter, plagueThreshold, plagueTurns = pPlayer:GetCityPlagueCounterDetails(pCity, true, true)
					if plagueTurns <= userSettings["UserSettingCIDHealthCoreFirstNotificationPlagueTurns"] then
						Controls.PlagueLabel:SetHide(true)
						Controls.PlagueLabelFlashing:SetHide(false)
						Controls.PlagueLabelFlashing:LocalizeAndSetText("TXT_KEY_JFD_CITYVIEW_PLAGUE_TURNS_TEXT", plagueTurns)
					else
						Controls.PlagueLabel:SetHide(false)
						Controls.PlagueLabelFlashing:SetHide(true)
						Controls.PlagueLabel:LocalizeAndSetText("TXT_KEY_JFD_CITYVIEW_PLAGUE_TURNS_TEXT", plagueTurns)
					end
				else
					Controls.HealthPerTurnLabel2:SetText("[ICON_JFD_DISEASE] [COLOR_JFD_DISEASE]" .. Locale.ConvertTextKey("TXT_KEY_JFD_CITYVIEW_DISEASE_TEXT") .. "[ENDCOLOR]")
					Controls.HealthPerTurn2:SetText(Locale.ConvertTextKey("[COLOR_JFD_DISEASE]+" .. excessDisease .. "[ENDCOLOR]"))
				end
			end
			if pCity:HasPlague() then
				pediaEntry = CivilopediaControl and ("TXT_KEY_JFD_HEALTH_PLAGUE_HEADING1_TITLE")
				local plagueID = pCity:GetPlagueType()
				local plague = GameInfo.JFD_Plagues[plagueID]
				local plagueTurns = pCity:GetPlagueTurns()
				Controls.HealthIcon:SetText("[ICON_JFD_PLAGUE]")
				Controls.HealthLabel:SetText("[COLOR_JFD_PLAGUE]" .. Locale.ConvertTextKey("TXT_KEY_JFD_CITYVIEW_PLAGUED_TEXT") .. "[ENDCOLOR]")
				Controls.PlagueIcon:SetHide(false)
				Controls.PlagueIcon:SetText("[ICON_JFD_PLAGUE]")
				Controls.PlagueIcon:LocalizeAndSetToolTip("TXT_KEY_JFD_CITYBANNER_HEALTH_TEXT_TT_PLAGUE", plague.IconString, plague.Description, plagueTurns)
				Controls.PlagueLabel:LocalizeAndSetText("[COLOR_JFD_PLAGUE]by {1_Icon} {2_Desc}[ENDCOLOR]", plague.IconString, plague.Description)
				Controls.PlagueCounter:LocalizeAndSetText("TXT_KEY_JFD_CITYVIEW_PLAGUED_TURNS_TEXT", plagueTurns)
				Controls.PlagueLabelFlashing:SetHide(true)
			else
				Controls.PlagueCounter:SetHide(true)
				Controls.PlagueIcon:SetHide(true)
			end
			if pediaEntry then
				Controls.HealthBox:RegisterCallback(Mouse.eRClick, function() getPedia(pediaEntry) end)
			end
		end
		--Golden Age Status
		local iGAPPerTurn = pPlayer:GetCityGAP(pCity)
		local GAPPerTurn = iGAPPerTurn
		if GAPPerTurn >= 0 then GAPPerTurn = "+" .. GAPPerTurn end
		yield3TT = yield3TT .. "[NEWLINE][ICON_GOLDEN_AGE] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_GAP_TEXT") .. ": " .. GAPPerTurn
		if yield3HeadingOpen then
			Controls.GAPLabel:SetText("[COLOR_GOLDEN_AGE]" .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_GAP_TEXT") .. "[ENDCOLOR]")
			Controls.GAPPerTurnLabel:SetText("[COLOR_GOLDEN_AGE]" .. GAPPerTurn .. "[ENDCOLOR]")
			Controls.GAPBox:LocalizeAndSetToolTip(pPlayer:GetCityGAPTooltip(pCity))
		end
		Controls.GAPPerTurnLabel3:SetText("[ICON_GOLDEN_AGE] " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_GAP_TEXT"))
		Controls.GAPPerTurn3:SetText("[COLOR_GOLDEN_AGE]" .. GAPPerTurn .. "[ENDCOLOR]")
		--Loyalty Status
		if userSettings["UserSettingCIDLoyaltyCore"] then
			local loyaltyID, loyaltyPercent, loyaltyTT 
			if yield6HeadingOpen then
				loyaltyID, loyaltyPercent, loyaltyTT  = pPlayer:CalculateCityLoyalty(pCity, true)
			else
				loyaltyID, loyaltyPercent, loyaltyTT  = pPlayer:CalculateCityLoyalty(pCity, false)
			end
			if loyaltyID > -1 then
				local loyalty = GameInfo.JFD_Loyalties[loyaltyID]
				yield6TT = yield6TT .. "[NEWLINE]" .. loyalty.IconString .. " " .. Locale.ConvertTextKey("TXT_KEY_JFD_CITYVIEW_LOYALTY_TEXT") .. ": " .. loyaltyPercent .. "%"
				if yield6HeadingOpen then
					local loyaltyDesc = loyalty.TextColour .. Locale.ConvertTextKey(loyalty.ShortDescription) .. "[ENDCOLOR]"
					Controls.CityLoyaltyIcon:LocalizeAndSetText(loyalty.IconString)
					Controls.CityLoyaltyTypeLabel:SetText(loyaltyDesc)
					Controls.CityLoyaltyPercentLabel:LocalizeAndSetText("TXT_KEY_JFD_CITYVIEW_LOYALTY_PERCENT", loyalty.TextColour, loyaltyPercent)
					Controls.CityLoyaltyTypeLabel:LocalizeAndSetToolTip("TXT_KEY_JFD_CITYVIEW_LOYALTY_STATES_TT")
					Controls.CityLoyaltyPercentLabel:LocalizeAndSetToolTip("TXT_KEY_JFD_CITYVIEW_LOYALTY_TT", loyaltyTT, loyalty.IconString, loyalty.TextColour, loyaltyPercent)
					Controls.LoyaltyBox:SetHide(false)
					local revoltCounter, revoltThreshold, revoltRate, revoltRateTT, revoltTurns, WLTKDCounter, WLTKDThreshold, WLTKDRate, WLTKDRateTT, WLTKDTurns = pPlayer:GetCityLoyaltyCounterDetails(pCity, loyaltyID, true)
					if revoltRate > 0 then revoltRate = "+" .. revoltRate end
					if WLTKDRate  > 0 then WLTKDRate  = "+" .. WLTKDRate  end
					if pCity:HasLoyaltyState(GameInfoTypes["LOYALTY_JFD_PATRIOTIC"]) then
						Controls.RevoltMeter:SetPercent(WLTKDCounter/WLTKDThreshold)
						Controls.RevoltMeter:LocalizeAndSetToolTip(WLTKDTurns)
						Controls.RevoltMeter:SetTexture("MeterBarRevoltPatriotic.dds")
						Controls.RevoltLabel:LocalizeAndSetText("TXT_KEY_JFD_CITYVIEW_TURNS", WLTKDTurns)
						Controls.RevoltLabel:LocalizeAndSetToolTip("TXT_KEY_JFD_CITYVIEW_LOYALTY_WLTKD_TT", WLTKDTurns, revoltCounter, revoltThreshold, revoltRate, revoltRateTT, WLTKDCounter, WLTKDThreshold, WLTKDRate, WLTKDRateTT)
						Controls.RevoltMeter:LocalizeAndSetToolTip("TXT_KEY_JFD_CITYVIEW_LOYALTY_WLTKD_TT", WLTKDTurns, revoltCounter, revoltThreshold, revoltRate, revoltRateTT, WLTKDCounter, WLTKDThreshold, WLTKDRate, WLTKDRateTT)
						Controls.RevoltMeter:SetHide(false)
					elseif pCity:HasLoyaltyState(GameInfoTypes["LOYALTY_JFD_ALLEGIANT"]) then
						Controls.RevoltMeter:SetPercent(WLTKDCounter/WLTKDThreshold)
						Controls.RevoltMeter:LocalizeAndSetToolTip(WLTKDTurns)
						Controls.RevoltMeter:SetTexture("MeterBarRevoltAllegiant.dds")
						Controls.RevoltLabel:LocalizeAndSetText("TXT_KEY_JFD_CITYVIEW_TURNS", WLTKDTurns)
						Controls.RevoltLabel:LocalizeAndSetToolTip("TXT_KEY_JFD_CITYVIEW_LOYALTY_WLTKD_TT", WLTKDTurns, revoltCounter, revoltThreshold, revoltRate, revoltRateTT, WLTKDCounter, WLTKDThreshold, WLTKDRate, WLTKDRateTT)
						Controls.RevoltMeter:LocalizeAndSetToolTip("TXT_KEY_JFD_CITYVIEW_LOYALTY_WLTKD_TT", WLTKDTurns, revoltCounter, revoltThreshold, revoltRate, revoltRateTT, WLTKDCounter, WLTKDThreshold, WLTKDRate, WLTKDRateTT)
						Controls.RevoltMeter:SetHide(false)
					elseif pCity:HasLoyaltyState(GameInfoTypes["LOYALTY_JFD_NEUTRAL"]) then
						Controls.RevoltLabel:LocalizeAndSetText("TXT_KEY_JFD_CITYVIEW_TURNS", 0)
						Controls.RevoltMeter:SetPercent(0)Controls.RevoltLabel:LocalizeAndSetToolTip("TXT_KEY_JFD_CITYVIEW_LOYALTY_NEUTRAL_TT", revoltCounter, revoltThreshold, revoltRate, revoltRateTT, WLTKDCounter, WLTKDThreshold, WLTKDRate, WLTKDRateTT)
						Controls.RevoltMeter:LocalizeAndSetToolTip("TXT_KEY_JFD_CITYVIEW_LOYALTY_NEUTRAL_TT", revoltCounter, revoltThreshold, revoltRate, revoltRateTT, WLTKDCounter, WLTKDThreshold, WLTKDRate, WLTKDRateTT)
						Controls.RevoltMeter:SetHide(false)
					elseif pCity:HasLoyaltyState(GameInfoTypes["LOYALTY_JFD_REBELLIOUS"]) then
						Controls.RevoltMeter:SetPercent(revoltCounter/revoltThreshold)
						Controls.RevoltMeter:LocalizeAndSetToolTip(revoltTurns)
						Controls.RevoltMeter:SetTexture("MeterBarRevoltRebellious.dds")
						Controls.RevoltLabel:LocalizeAndSetText("TXT_KEY_JFD_CITYVIEW_TURNS", revoltTurns)
						Controls.RevoltLabel:LocalizeAndSetToolTip("TXT_KEY_JFD_CITYVIEW_LOYALTY_REVOLT_TT", revoltTurns, revoltCounter, revoltThreshold, revoltRate, revoltRateTT, WLTKDCounter, WLTKDThreshold, WLTKDRate, WLTKDRateTT)
						Controls.RevoltMeter:LocalizeAndSetToolTip("TXT_KEY_JFD_CITYVIEW_LOYALTY_REVOLT_TT", revoltTurns, revoltCounter, revoltThreshold, revoltRate, revoltRateTT, WLTKDCounter, WLTKDThreshold, WLTKDRate, WLTKDRateTT)
						Controls.RevoltMeter:SetHide(false)
					elseif pCity:HasLoyaltyState(GameInfoTypes["LOYALTY_JFD_SEPARATIST"]) then
						Controls.RevoltMeter:SetPercent(revoltCounter/revoltThreshold)
						Controls.RevoltMeter:LocalizeAndSetToolTip(revoltTurns)
						Controls.RevoltMeter:SetTexture("MeterBarRevoltSeparatist.dds")
						Controls.RevoltLabel:LocalizeAndSetText("TXT_KEY_JFD_CITYVIEW_TURNS", revoltTurns)
						Controls.RevoltLabel:LocalizeAndSetToolTip("TXT_KEY_JFD_CITYVIEW_LOYALTY_REVOLT_SEPARATIST_TT", revoltTurns, revoltCounter, revoltThreshold, revoltRate, revoltRateTT, WLTKDCounter, WLTKDThreshold, WLTKDRate, WLTKDRateTT)
						Controls.RevoltMeter:LocalizeAndSetToolTip("TXT_KEY_JFD_CITYVIEW_LOYALTY_REVOLT_SEPARATIST_TT", revoltTurns, revoltCounter, revoltThreshold, revoltRate, revoltRateTT, WLTKDCounter, WLTKDThreshold, WLTKDRate, WLTKDRateTT)
						Controls.RevoltMeter:SetHide(false)
					else
						Controls.RevoltMeter:SetHide(true)
					end
				else
					Controls.LoyaltyPercentLabel6:SetText(loyalty.IconString .. " " .. loyalty.TextColour .. Locale.ConvertTextKey(loyalty.ShortDescription) .. "[ENDCOLOR]")
					Controls.LoyaltyPercent6:SetText(Locale.ConvertTextKey("TXT_KEY_JFD_CITYVIEW_LOYALTY_PERCENT", loyalty.TextColour, loyaltyPercent))
				end
				-- Controls.LoyaltyIcon:SetHide(false)
				Controls.LoyaltyIcon:SetText(loyalty.IconString)
				Controls.LoyaltyIcon:LocalizeAndSetToolTip("TXT_KEY_JFD_CITYBANNER_LOYALTY_TEXT_TT_OTHER", loyalty.Description)
			else
				-- Controls.LoyaltyIcon:SetHide(true)
			end
			if yield6HeadingOpen then
				local pediaEntry = CivilopediaControl and ("TXT_KEY_JFD_LOYALTY_HEADING1_TITLE")
				if pediaEntry then
					Controls.LoyaltyBox:RegisterCallback(Mouse.eRClick, function() getPedia(pediaEntry) end)
				end
			end
		else
			Controls.LoyaltyBox:SetHide(true);
			Controls.RevoltBox:SetHide(true);
			-- Controls.LoyaltyIcon:SetHide(true)
		end
		--XP Status
		local XPAir, XPLand, XPSea = pPlayer:GetCityXP(pCity)
		yield5TT = Locale.ConvertTextKey("TXT_KEY_CITYVIEW_YIELD_5_TEXT_TT", XPAir, XPLand, XPSea)
		if yield5HeadingOpen then
			Controls.XPAirNum:SetText(XPAir)
			Controls.XPLandNum:SetText(XPLand)
			Controls.XPSeaNum:SetText(XPSea)
			Controls.XPBox:LocalizeAndSetToolTip(pPlayer:GetCityXPTooltip(pCity))
		else
			Controls.XPAir5:SetText(XPAir)
			Controls.XPLand5:SetText(XPLand)
			Controls.XPSea5:SetText(XPSea)
		end
		
		--JFD Yield Headers
		--Yield 1 Header
		Controls.Yields1Header:RegisterCallback( Mouse.eLClick, OnYield1HeaderSelected );
		Controls.Yields1Box:RegisterCallback( Mouse.eLClick, OnYield1HeaderSelected );
		Controls.FoodBox:RegisterCallback( Mouse.eLClick, OnYield1HeaderSelected );
		Controls.ProdBox:RegisterCallback( Mouse.eLClick, OnYield1HeaderSelected );
		Controls.GoldBox:RegisterCallback( Mouse.eLClick, OnYield1HeaderSelected );
		Controls.Yields1Header:LocalizeAndSetToolTip(yield1TT);
		Controls.Yields1Box:SetToolTipString(yield1TT)
		if yield1HeadingOpen then
			local localizedLabel = "[ICON_MINUS]"..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_YIELD_1_TEXT" );
			Controls.Yields1HeaderLabel:SetText(localizedLabel);
			Controls.PopulationBox:SetHide(false)
			Controls.FoodBox:SetHide(false)
			Controls.ProdBox:SetHide(false)
			Controls.GoldBox:SetHide(false)
			Controls.Yields1Box:SetHide(true)
		else
			local localizedLabel = "[ICON_PLUS]"..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_YIELD_1_TEXT" ) 
			Controls.Yields1HeaderLabel:SetText(localizedLabel);
			Controls.PopulationBox:SetHide(true)
			Controls.FoodBox:SetHide(true)
			Controls.ProdBox:SetHide(true)
			Controls.GoldBox:SetHide(true)
			Controls.Yields1Box:SetHide(false)
		end
		--Yield 2 Header
		Controls.Yields2Header:RegisterCallback( Mouse.eLClick, OnYield2HeaderSelected );
		Controls.Yields2Box:RegisterCallback( Mouse.eLClick, OnYield2HeaderSelected );
		Controls.HappinessBox:RegisterCallback( Mouse.eLClick, OnYield2HeaderSelected );
		Controls.HealthBox:RegisterCallback( Mouse.eLClick, OnYield2HeaderSelected );
		Controls.Yields2Header:SetToolTipString(yield2TT);
		Controls.Yields2Box:SetToolTipString(yield2TT)
		if yield2HeadingOpen then
			local localizedLabel = "[ICON_MINUS]"..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_YIELD_2_TEXT" ) 
			Controls.Yields2HeaderLabel:SetText(localizedLabel);
			if userSettings["UserSettingCIDHealthCore"] then
				Controls.HealthBox:SetHide(false)
			end
			if userSettings["UserSettingCIDHappinessCore"] then
				Controls.HappinessBox:SetHide(false)
			end
			Controls.Yields2Box:SetHide(true)
		else
			local localizedLabel = "[ICON_PLUS]"..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_YIELD_2_TEXT" ) 
			Controls.Yields2HeaderLabel:SetText(localizedLabel);
			if userSettings["UserSettingCIDHealthCore"] then
				Controls.HealthBox:SetHide(true)
			end
			if userSettings["UserSettingCIDHappinessCore"] then
				Controls.HappinessBox:SetHide(true)
			end
			Controls.Yields2Box:SetHide(false)
		end
		--Yield 3 Header
		Controls.Yields3Header:RegisterCallback( Mouse.eLClick, OnYield3HeaderSelected );
		Controls.Yields3Box:RegisterCallback( Mouse.eLClick, OnYield3HeaderSelected );
		Controls.Yields3Header:SetToolTipString(yield3TT);
		Controls.FaithBox:RegisterCallback( Mouse.eLClick, OnYield3HeaderSelected );
		Controls.ScienceBox:RegisterCallback( Mouse.eLClick, OnYield3HeaderSelected );
		Controls.GAPBox:RegisterCallback( Mouse.eLClick, OnYield3HeaderSelected );
		Controls.Yields3Box:SetToolTipString(yield3TT)
		if yield3HeadingOpen then
			local localizedLabel = "[ICON_MINUS]"..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_YIELD_3_TEXT" ) 
			Controls.Yields3HeaderLabel:SetText(localizedLabel);
			Controls.FaithBox:SetHide(false)
			Controls.ScienceBox:SetHide(false)
			Controls.GAPBox:SetHide(false)
			Controls.Yields3Box:SetHide(true)
		else
			local localizedLabel = "[ICON_PLUS]"..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_YIELD_3_TEXT" )
			Controls.Yields3HeaderLabel:SetText(localizedLabel);
			Controls.FaithBox:SetHide(true)
			Controls.ScienceBox:SetHide(true)
			Controls.GAPBox:SetHide(true)
			Controls.Yields3Box:SetHide(false)
		end
		--Yield 4 Header
		Controls.Yields4Header:RegisterCallback( Mouse.eLClick, OnYield4HeaderSelected );
		Controls.Yields4Box:RegisterCallback( Mouse.eLClick, OnYield4HeaderSelected );
		Controls.CultureBox:RegisterCallback( Mouse.eLClick, OnYield4HeaderSelected );
		Controls.TourismBox:RegisterCallback( Mouse.eLClick, OnYield4HeaderSelected );
		Controls.Yields4Header:SetToolTipString(yield4TT);
		Controls.Yields4Box:SetToolTipString(yield4TT)
		if yield4HeadingOpen then
			local localizedLabel = "[ICON_MINUS]"..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_YIELD_4_TEXT" ) 
			Controls.Yields4HeaderLabel:SetText(localizedLabel);
			Controls.CultureBox:SetHide(false)
			Controls.CultureFrame:SetHide(false)
			Controls.TourismBox:SetHide(false)
			Controls.Yields4Box:SetHide(true)
		else
			local localizedLabel = "[ICON_PLUS]"..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_YIELD_4_TEXT" ) 
			Controls.Yields4HeaderLabel:SetText(localizedLabel);
			Controls.CultureBox:SetHide(true)
			Controls.CultureFrame:SetHide(true)
			Controls.TourismBox:SetHide(true)
			Controls.Yields4Box:SetHide(false)
		end
		--Yield 5 Header
		Controls.Yields5Header:RegisterCallback( Mouse.eLClick, OnYield5HeaderSelected );
		Controls.Yields5Box:RegisterCallback( Mouse.eLClick, OnYield5HeaderSelected );
		Controls.XPBox:RegisterCallback( Mouse.eLClick, OnYield5HeaderSelected );
		Controls.Yields5Header:SetToolTipString(yield5TT);
		Controls.Yields5Box:SetToolTipString(yield5TT)
		if yield5HeadingOpen then
			local localizedLabel = "[ICON_MINUS]"..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_YIELD_5_TEXT" ) 
			Controls.Yields5HeaderLabel:SetText(localizedLabel);
			Controls.XPBox:SetHide(false)
			-- Controls.SupplyBox:SetHide(false)
			Controls.Yields5Box:SetHide(true)
		else
			local localizedLabel = "[ICON_PLUS]"..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_YIELD_5_TEXT" ) 
			Controls.Yields5HeaderLabel:SetText(localizedLabel);
			Controls.XPBox:SetHide(true)
			-- Controls.SupplyBox:SetHide(true)
			Controls.Yields5Box:SetHide(false)
		end
		--Yield 6 Header
		Controls.Yields6Header:RegisterCallback( Mouse.eLClick, OnYield6HeaderSelected );
		Controls.Yields6Box:RegisterCallback( Mouse.eLClick, OnYield6HeaderSelected );
		Controls.CrimeBox:RegisterCallback( Mouse.eLClick, OnYield6HeaderSelected );
		Controls.LoyaltyBox:RegisterCallback( Mouse.eLClick, OnYield6HeaderSelected );
		Controls.Yields6Header:SetToolTipString(yield6TT);
		Controls.Yields6Box:SetToolTipString(yield6TT)
		if yield6HeadingOpen then
			local localizedLabel = "[ICON_MINUS]"..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_YIELD_6_TEXT" )
			Controls.Yields6HeaderLabel:SetText(localizedLabel);
			if userSettings["UserSettingCIDCrimeCore"] then
				Controls.CrimeBox:SetHide(false)
			end
			if userSettings["UserSettingCIDLoyaltyCore"] then
				Controls.LoyaltyBox:SetHide(false)
			end
			Controls.Yields6Box:SetHide(true)
		else
			local localizedLabel = "[ICON_PLUS]"..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_YIELD_6_TEXT" ) 
			Controls.Yields6HeaderLabel:SetText(localizedLabel);
			if userSettings["UserSettingCIDCrimeCore"] then
				Controls.CrimeBox:SetHide(true)
			end
			if userSettings["UserSettingCIDLoyaltyCore"] then
				Controls.LoyaltyBox:SetHide(true)
			end
			Controls.Yields6Box:SetHide(false)
		end
		-- if OptionsManager.GetSmallUIAssets() then RecalcYieldPanelSize() end
		RecalcYieldPanelSize()
		--END JFD	
		
		local cityGrowth = pCity:GetFoodTurnsLeft();			
		if pCity:IsForcedAvoidGrowth() then
			Controls.CityGrowthLabel:SetText(Locale.ConvertTextKey("TXT_KEY_CITYVIEW_AVOID_GROWTH_TEXT"));
		elseif (pCity:IsFoodProduction() or pCity:FoodDifferenceTimes100() == 0) then
			Controls.CityGrowthLabel:SetText(Locale.ConvertTextKey("TXT_KEY_CITYVIEW_STAGNATION_TEXT"));
		elseif pCity:FoodDifference() < 0 then
			Controls.CityGrowthLabel:SetText(Locale.ConvertTextKey("TXT_KEY_CITYVIEW_STARVATION_TEXT"));
		else
			Controls.CityGrowthLabel:SetText(Locale.ConvertTextKey("TXT_KEY_CITYVIEW_TURNS_TILL_CITIZEN_TEXT", cityGrowth));
		end
		local iFoodPerTurn = pCity:FoodDifferenceTimes100() / 100;
		if (iFoodPerTurn >= 0) then
			Controls.FoodPerTurnLabel:SetText( Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT", iFoodPerTurn) );
		else
			Controls.FoodPerTurnLabel:SetText( Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT_NEGATIVE", iFoodPerTurn) );
		end

		local iCurrentFood = pCity:GetFood();
		local iFoodNeeded = pCity:GrowthThreshold();
		local iFoodDiff = pCity:FoodDifference();
		local iCurrentFoodPlusThisTurn = iCurrentFood + iFoodDiff;
			
		local fGrowthProgressPercent = iCurrentFood / iFoodNeeded;			
		
		-- Viewing mode only
		if (UI.IsCityScreenViewingMode()) then
			
			-- City Cycling
			Controls.PrevCityButton:SetDisabled( false );
			Controls.NextCityButton:SetDisabled( false );
			
			-- Governor
			Controls.BalancedFocusButton:SetDisabled( true );
			Controls.FoodFocusButton:SetDisabled( true );
			Controls.ProductionFocusButton:SetDisabled( true );
			Controls.GoldFocusButton:SetDisabled( true );
			Controls.ResearchFocusButton:SetDisabled( true );
			Controls.CultureFocusButton:SetDisabled( true );
			Controls.GPFocusButton:SetDisabled( true );
			Controls.FaithFocusButton:SetDisabled( true );
			Controls.AvoidGrowthButton:SetDisabled( true );
			Controls.ResetButton:SetDisabled( true );
			
			Controls.BoxOSlackers:SetDisabled( true );
			Controls.NoAutoSpecialistCheckbox:SetDisabled( true );
			Controls.NoAutoSpecialistCheckbox2:SetDisabled( true );
			
			-- Other
			Controls.RazeCityButton:SetDisabled( true );
			Controls.UnrazeCityButton:SetDisabled( true );
			
			if (not pPlayer:CanPuppetPurchase(pCity)) then
				Controls.BuyPlotButton:SetDisabled( true );
			-- display buy plot buttons
			-- Venice Edit (CBP)
			if(pCity:GetOwner() == Game.GetActivePlayer())then
				local bAnnex = Players[pCity:GetOwner()]:MayNotAnnex();
				if bAnnex then 
					Controls.BuyPlotButton:SetDisabled( false );
				end
			end
			--END
			end
		else
			
			-- City Cycling
			Controls.PrevCityButton:SetDisabled( false );
			Controls.NextCityButton:SetDisabled( false );
			
			-- Governor
			Controls.BalancedFocusButton:SetDisabled( false );
			Controls.FoodFocusButton:SetDisabled( false );
			Controls.ProductionFocusButton:SetDisabled( false );
			Controls.GoldFocusButton:SetDisabled( false );
			Controls.ResearchFocusButton:SetDisabled( false );
			Controls.CultureFocusButton:SetDisabled( false );
			Controls.GPFocusButton:SetDisabled( false );
			Controls.FaithFocusButton:SetDisabled( false );
			Controls.AvoidGrowthButton:SetDisabled( false );
			Controls.ResetButton:SetDisabled( false );
			
			Controls.BoxOSlackers:SetDisabled( false );
			Controls.NoAutoSpecialistCheckbox:SetDisabled( false );
			Controls.NoAutoSpecialistCheckbox2:SetDisabled( false );
			
			-- Other
			if (not g_bRazeButtonDisabled) then
				Controls.RazeCityButton:SetDisabled( false );
				Controls.UnrazeCityButton:SetDisabled( false );
			end
			
			Controls.BuyPlotButton:SetDisabled( false );
		end
		
		if (pCity:GetOwner() ~= Game.GetActivePlayer()) then
			Controls.ProductionButton:SetDisabled(true);
			Controls.PurchaseButton:SetDisabled(true);
			Controls.EditButton:SetHide(true);
			Controls.EndTurnText:SetText(Locale.ConvertTextKey("TXT_KEY_CITYVIEW_RETURN_TO_ESPIONAGE"));
		end
		
		if(UI.IsCityScreenViewingMode()) then
			Controls.EditButton:SetHide(true);
		end
	end
end
Events.SerialEventCityScreenDirty.Add(OnCityViewUpdate);
Events.SerialEventCityInfoDirty.Add(OnCityViewUpdate);


-----------------------------------------------------------------
-----------------------------------------------------------------
function RecalcPanelSize()
	
	Controls.RightStack:CalculateSize();
	local size = math.min( screenSizeY + 30, Controls.RightStack:GetSizeY() + 85 );
	Controls.BuildingListBackground:SetSizeY( size );
	size = math.max( size, 160 );
	
	size = math.min( screenSizeY - 65, Controls.RightStack:GetSizeY() + 85 );
    Controls.ScrollPanel:SetSizeY( size );
	Controls.ScrollPanel:CalculateInternalSize();
	Controls.ScrollPanel:ReprocessAnchoring();
end

function RecalcYieldPanelSize()
	Controls.LeftStack:CalculateSize();
	local size2 = math.min( screenSizeY + 30, Controls.LeftStack:GetSizeY() + 50 );
	size2 = math.max( size2, 160 );
	Controls.TopLeft:SetSizeY( size2 );
end

-------------------------------------------------
-- On City Set Damage
-------------------------------------------------
function OnCitySetDamage(iDamage, iMaxDamage)
	
	local iHealthPercent = 1 - (iDamage / iMaxDamage);

    Controls.HealthMeter:SetPercent(iHealthPercent);
    
    if iHealthPercent > 0.66 then
        Controls.HealthMeter:SetTexture("CityNamePanelHealthBarGreen.dds");
    elseif iHealthPercent > 0.33 then
        Controls.HealthMeter:SetTexture("CityNamePanelHealthBarYellow.dds");
    else
        Controls.HealthMeter:SetTexture("CityNamePanelHealthBarRed.dds");
    end
    
    -- Show or hide the Health Bar as necessary
    if (iDamage == 0) then
		Controls.HealthFrame:SetHide(true);
	else
		Controls.HealthFrame:SetHide(false);
    end

end

-------------------------------------------------
-- Update Production Info
-------------------------------------------------
function DoUpdateProductionInfo( bNoProduction )
	local pCity = UI.GetHeadSelectedCity();
	if (not pCity) then return end
	local pPlayer = Players[pCity:GetOwner()];

	-- Production stored and needed
	local iStoredProduction = pCity:GetProductionTimes100() / 100;
	local iProductionNeeded = pCity:GetProductionNeeded();
	if (pCity:IsProductionProcess()) then
		iProductionNeeded = 0;
	end
	
	-- Base Production per turn
	local iProductionPerTurn = pCity:GetCurrentProductionDifferenceTimes100(false, false) / 100;--pCity:GetYieldRate(YieldTypes.YIELD_PRODUCTION);
	local iProductionModifier = pCity:GetProductionModifier() + 100;
	--iProductionPerTurn = iProductionPerTurn * iProductionModifier;
	--iProductionPerTurn = iProductionPerTurn / 100;
	
	-- Item being produced with food? (e.g. Settlers)
	--if (pCity:IsFoodProduction()) then
		--iProductionPerTurn = iProductionPerTurn + pCity:GetYieldRate(YieldTypes.YIELD_FOOD) - pCity:FoodConsumption(true);
	--end
	
	
	
	local strProductionPerTurn = Locale.ConvertTextKey("TXT_KEY_CITY_SCREEN_PROD_PER_TURN", iProductionPerTurn);
	Controls.ProductionOutput:SetText(strProductionPerTurn);
	
	-- Progress info for meter
	local iStoredProductionPlusThisTurn = iStoredProduction + iProductionPerTurn;
	
	local fProductionProgressPercent = iStoredProduction / iProductionNeeded;
	local fProductionProgressPlusThisTurnPercent = iStoredProductionPlusThisTurn / iProductionNeeded;
	if (fProductionProgressPlusThisTurnPercent > 1) then
		fProductionProgressPlusThisTurnPercent = 1
	end
	
	Controls.ProductionMeter:SetPercents( fProductionProgressPercent, fProductionProgressPlusThisTurnPercent );
	
	-- Turns left
	local productionTurnsLeft = pCity:GetProductionTurnsLeft();
	--if pCity:IsOccupation() then
		--Controls.ProductionTurnsLabel:SetText(" (City in unrest)");
	--else
	
	local strNumTurns;
	if(productionTurnsLeft > 99) then
		strNumTurns = Locale.ConvertTextKey("TXT_KEY_PRODUCTION_HELP_99PLUS_TURNS");
	else
		strNumTurns = Locale.ConvertTextKey("TXT_KEY_PRODUCTION_HELP_NUM_TURNS", productionTurnsLeft);
	end
	
	
	
	local bGeneratingProduction = pCity:IsProductionProcess() or pCity:GetCurrentProductionDifferenceTimes100(false, false) == 0;
	
	if (bGeneratingProduction) then
		strNumTurns = "";
	end
	
	-- Indicator for the fact that the empire is very unhappy
	if (pPlayer:IsEmpireVeryUnhappy()) then
		strNumTurns = strNumTurns .. " [ICON_HAPPINESS_4]";
	end
	
	if (not bGeneratingProduction) then
		Controls.ProductionTurnsLabel:SetText("(" .. strNumTurns .. ")");
	else
		Controls.ProductionTurnsLabel:SetText(strNumTurns);
	end
	
	--end
	
	if bNoProduction then
		Controls.ProductionTurnsLabel:SetHide(true);
	else
		Controls.ProductionTurnsLabel:SetHide(false);
	end
	
	-----------------------------
	-- TOOLTIP
	-----------------------------
	
	local strToolTip = "";

	-- What is being produced right now?
	if (bNoProduction) then
		strToolTip = strToolTip .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_HELP_NOTHING");
	else
		if (not pCity:IsProductionProcess()) then
			strToolTip = strToolTip .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_HELP_TEXT", pCity:GetProductionNameKey(), strNumTurns);
			strToolTip = strToolTip .. "[NEWLINE]----------------[NEWLINE]";
			strToolTip = strToolTip .. Locale.ConvertTextKey("TXT_KEY_PRODUCTION_PROGRESS", iStoredProduction, iProductionNeeded);
		end
	end
	
	local iBaseProductionPT = pCity:GetBaseYieldRate(YieldTypes.YIELD_PRODUCTION);
	
	-- Output
	local strBase = Locale.ConvertTextKey("TXT_KEY_YIELD_BASE", iBaseProductionPT, "[ICON_PRODUCTION]");
	local strTotal = Locale.ConvertTextKey("TXT_KEY_YIELD_TOTAL", iProductionPerTurn, "[ICON_PRODUCTION]");
	local strOutput = strBase .. "[NEWLINE]" .. strTotal;
	strToolTip = strToolTip .. "[NEWLINE]";
	
	-- This builds the tooltip from C++
	local strCodeToolTip = pCity:GetYieldModifierTooltip(YieldTypes.YIELD_PRODUCTION);
	if (strCodeToolTip ~= "") then
		strOutput = strOutput .. "[NEWLINE]----------------" .. strCodeToolTip;
	end

	strToolTip = strToolTip .. strOutput;
	
	--Controls.ProductionDescriptionBox:SetToolTipString(strToolTip);
	Controls.ProductionPortraitButton:SetToolTipString(strToolTip);
	
	-- Info for the upper-left display
	if iProductionPerTurn >= 0 then
		Controls.ProdPerTurnLabel:SetText( Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT", iProductionPerTurn) );
	else
		Controls.ProdPerTurnLabel:SetText( Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PERTURN_TEXT_NEGATIVE", iProductionPerTurn) );
	end
	
	if yield1HeadingOpen then
		local strProductionHelp = GetProductionTooltip(pCity);
	
		Controls.ProdBox:SetToolTipString(strProductionHelp);
	end
end

-------------------------------------------------
-- Update Tooltips in the upper-left part of the screen
-------------------------------------------------
function DoUpdateUpperLeftTooltips()
	local pCity = UI.GetHeadSelectedCity();
	local pPlayer = Players[pCity:GetOwner()]

	if yield1HeadingOpen then
		local strFoodToolTip = GetFoodTooltip(pCity);
		Controls.FoodBox:SetToolTipString(strFoodToolTip);
		Controls.PopulationBox:SetToolTipString(strFoodToolTip);
		
		local strGoldToolTip = GetGoldTooltip(pCity);
		Controls.GoldBox:SetToolTipString(strGoldToolTip);
	end
	
	if yield3HeadingOpen then
		local strScienceToolTip = GetScienceTooltip(pCity);
		Controls.ScienceBox:SetToolTipString(strScienceToolTip);
		
		local strFaithToolTip = GetFaithTooltip(pCity);
		Controls.FaithBox:SetToolTipString(strFaithToolTip);
	end
	
	if yield4HeadingOpen then
		local strCultureToolTip = GetCultureTooltip(pCity);
		Controls.CultureBox:SetToolTipString(strCultureToolTip);
	
		local strTourismToolTip = GetTourismTooltip(pCity);
		Controls.TourismBox:SetToolTipString(strTourismToolTip);
	end
	
-- CBP
	if yield2HeadingOpen then
		if isUsingCBP then
			local strCityHappinessTooltip = pPlayer:GetCityHappinessTTForCBO(pCity);
			Controls.HappinessBox:SetToolTipString(strCityHappinessTooltip);
		else
			local happinessBreakdownTT, resistanceSentimentTT = pPlayer:GetCityHappinessTT(pCity)
			Controls.HappinessBox:LocalizeAndSetToolTip( happinessBreakdownTT );
			if resistanceSentimentTT then
				Controls.ResistanceLabel:LocalizeAndSetToolTip( resistanceSentimentTT );
				Controls.ResistanceLabelFlashing:LocalizeAndSetToolTip( resistanceSentimentTT );
			end
		end
	end
-- END
end

-------------------------------------------------
-- Enter City Screen
-------------------------------------------------
function OnEnterCityScreen()
	
	local pCity = UI.GetHeadSelectedCity();
	
	if (pCity ~= nil) then
		Network.SendUpdateCityCitizens(pCity:GetID());
	end

	LuaEvents.TryQueueTutorial("CITY_SCREEN", true);
	
	UI.SetInterfaceMode(InterfaceModeTypes.INTERFACEMODE_SELECTION);
end
Events.SerialEventEnterCityScreen.Add(OnEnterCityScreen);


-------------------------------------------------
-------------------------------------------------
function PlotButtonClicked( iPlotIndex )
	if Players[Game.GetActivePlayer()]:IsTurnActive() then
		if iPlotIndex > 0 then
			local pCity = UI.GetHeadSelectedCity();
			Network.SendDoTask(pCity:GetID(), TaskTypes.TASK_CHANGE_WORKING_PLOT, iPlotIndex, -1, false, bAlt, bShift, bCtrl);
		end
	end
end

-------------------------------------------------
-------------------------------------------------
function BuyPlotAnchorButtonClicked( iPlotIndex )

	if not Players[Game.GetActivePlayer()]:IsTurnActive() then
		return;
	end
	
	local activePlayerID = Game.GetActivePlayer();
	local pHeadSelectedCity = UI.GetHeadSelectedCity();
	if pHeadSelectedCity then
		local plot = pHeadSelectedCity:GetCityIndexPlot( iPlotIndex );
		local plotX = plot:GetX();
		local plotY = plot:GetY();
		Network.SendCityBuyPlot(pHeadSelectedCity:GetID(), plotX, plotY);
		UI.UpdateCityScreen();
		Events.AudioPlay2DSound("AS2D_INTERFACE_BUY_TILE");		
	end
	return true;
end


-------------------------------------------------
-------------------------------------------------
function UpdateWorkingHexes()
		
	local pCity = UI.GetHeadSelectedCity();
	
    if( pCity == nil ) then
        return;
    end
    
	if (UI.IsCityScreenUp()) then   
	
		-- display worked plots
		g_PlotButtonIM:ResetInstances();
		for i = 0, pCity:GetNumCityPlots() - 1, 1 do
			local plot = pCity:GetCityIndexPlot( i );
			if (plot ~= nil) then
				
				bNoHighlight = false;
				
				if ( plot:GetOwner() == pCity:GetOwner() ) then
				
					if workerHeadingOpen then
						local hexPos = ToHexFromGrid( Vector2( plot:GetX(), plot:GetY() ) );
						local worldPos = HexToWorld( hexPos );
					
						-- the city itself
						if ( i == 0 ) then
							local controlTable = g_PlotButtonIM:GetInstance();						
							controlTable.PlotButtonAnchor:SetWorldPosition( VecAdd( worldPos, WorldPositionOffset ) );
							IconHookup(	11, 45, "CITIZEN_ATLAS", controlTable.PlotButtonImage);
							controlTable.PlotButtonImage:SetToolTipString( Locale.ConvertTextKey("TXT_KEY_CITYVIEW_CITY_CENTER") );
							controlTable.PlotButtonImage:SetVoid1( -1 );
							controlTable.PlotButtonImage:RegisterCallback( Mouse.eLCLick, OnResetForcedTiles);
							
							DoTestViewingModeOnly(controlTable);
							
							-- JFD Trading Posts
							local improvementID = plot:GetImprovementType()
							local improvementUpgradeTimeLeft = plot:GetUpgradeTimeLeft(improvementID, pCity:GetOwner())
							if improvementUpgradeTimeLeft > 1 then
								controlTable.TradingPostLabel:SetText(improvementUpgradeTimeLeft)
								controlTable.TradingPostLabel:LocalizeAndSetToolTip("TXT_KEY_JFD_PLOT_HELP_TURNS_TIL_UPGRADE_TT", improvementUpgradeTimeLeft)
								controlTable.TradingPostLabel:SetHide(false)
							else
								controlTable.TradingPostLabel:SetHide(true)
							end
							
							--Events.SerialEventHexHighlight( ToHexFromGrid( Vector2( plot:GetX(), plot:GetY() ) ), true, Vector4( 1.0, 1.0, 1.0, 1 ) );
						-- FORCED worked plot
						elseif ( pCity:IsWorkingPlot( plot ) and pCity:IsForcedWorkingPlot( plot ) ) then
							local controlTable = g_PlotButtonIM:GetInstance();						
							controlTable.PlotButtonAnchor:SetWorldPosition( VecAdd( worldPos, WorldPositionOffset ) );
							IconHookup(	10, 45, "CITIZEN_ATLAS", controlTable.PlotButtonImage);
							controlTable.PlotButtonImage:SetToolTipString( Locale.ConvertTextKey("TXT_KEY_CITYVIEW_FORCED_WORK_TILE") );
							controlTable.PlotButtonImage:SetVoid1( i );
							controlTable.PlotButtonImage:RegisterCallback( Mouse.eLCLick, PlotButtonClicked);
							
							DoTestViewingModeOnly(controlTable);
							
							-- JFD Trading Posts
							local improvementID = plot:GetImprovementType()
							local improvementUpgradeTimeLeft = plot:GetUpgradeTimeLeft(improvementID, pCity:GetOwner())
							if improvementUpgradeTimeLeft > 1 then
								controlTable.TradingPostLabel:SetText(improvementUpgradeTimeLeft)
								controlTable.TradingPostLabel:LocalizeAndSetToolTip("TXT_KEY_JFD_PLOT_HELP_TURNS_TIL_UPGRADE_TT", improvementUpgradeTimeLeft)
								controlTable.TradingPostLabel:SetHide(false)
							else
								controlTable.TradingPostLabel:SetHide(true)
							end
							
							--Events.SerialEventHexHighlight( ToHexFromGrid( Vector2( plot:GetX(), plot:GetY() ) ), true, Vector4( 1.0, 1.0, 1.0, 1 ) );
						-- AI-picked worked plot
						elseif ( pCity:IsWorkingPlot( plot ) ) then						
							local controlTable = g_PlotButtonIM:GetInstance();						
							controlTable.PlotButtonAnchor:SetWorldPosition( VecAdd( worldPos, WorldPositionOffset ) );
							IconHookup(	0, 45, "CITIZEN_ATLAS", controlTable.PlotButtonImage);
							controlTable.PlotButtonImage:SetToolTipString( Locale.ConvertTextKey("TXT_KEY_CITYVIEW_GUVNA_WORK_TILE") );
							controlTable.PlotButtonImage:SetVoid1( i );
							controlTable.PlotButtonImage:RegisterCallback( Mouse.eLCLick, PlotButtonClicked);
							
							DoTestViewingModeOnly(controlTable);
							
							-- JFD Trading Posts
							local improvementID = plot:GetImprovementType()
							local improvementUpgradeTimeLeft = plot:GetUpgradeTimeLeft(improvementID, pCity:GetOwner())
							if improvementUpgradeTimeLeft > 1 then
								controlTable.TradingPostLabel:SetText(improvementUpgradeTimeLeft)
								controlTable.TradingPostLabel:LocalizeAndSetToolTip("TXT_KEY_JFD_PLOT_HELP_TURNS_TIL_UPGRADE_TT", improvementUpgradeTimeLeft)
								controlTable.TradingPostLabel:SetHide(false)
							else
								controlTable.TradingPostLabel:SetHide(true)
							end
							
							--Events.SerialEventHexHighlight( ToHexFromGrid( Vector2( plot:GetX(), plot:GetY() ) ), true, Vector4( 0.0, 1.0, 0.0, 1 ) );
						-- Owned by another one of our Cities
						elseif ( plot:GetWorkingCity():GetID() ~= pCity:GetID() and  plot:GetWorkingCity():IsWorkingPlot( plot ) ) then
							local controlTable = g_PlotButtonIM:GetInstance();						
							controlTable.PlotButtonAnchor:SetWorldPosition( VecAdd( worldPos, WorldPositionOffset ) );
							IconHookup(	12, 45, "CITIZEN_ATLAS", controlTable.PlotButtonImage);
							controlTable.PlotButtonImage:SetToolTipString( Locale.ConvertTextKey("TXT_KEY_CITYVIEW_NUTHA_CITY_TILE") );
							controlTable.PlotButtonImage:SetVoid1( i );
							controlTable.PlotButtonImage:RegisterCallback( Mouse.eLCLick, PlotButtonClicked);
							
							DoTestViewingModeOnly(controlTable);
							
							--Events.SerialEventHexHighlight( ToHexFromGrid( Vector2( plot:GetX(), plot:GetY() ) ), true, Vector4( 0.0, 0.0, 1.0, 1 ) );
						-- Blockaded water plot
						elseif ( plot:IsWater() and pCity:IsPlotBlockaded( plot ) ) then
							local controlTable = g_PlotButtonIM:GetInstance();						
							controlTable.PlotButtonAnchor:SetWorldPosition( VecAdd( worldPos, WorldPositionOffset ) );
							IconHookup(	13, 45, "CITIZEN_ATLAS", controlTable.PlotButtonImage);
							controlTable.PlotButtonImage:SetToolTipString( Locale.ConvertTextKey("TXT_KEY_CITYVIEW_BLOCKADED_CITY_TILE") );
							controlTable.PlotButtonImage:SetVoid1( -1 );
							controlTable.PlotButtonImage:RegisterCallback( Mouse.eLCLick, PlotButtonClicked);
							
							DoTestViewingModeOnly(controlTable);
							
							--Events.SerialEventHexHighlight( ToHexFromGrid( Vector2( plot:GetX(), plot:GetY() ) ), true, Vector4( 1.0, 0.0, 0.0, 1 ) );
						-- Enemy Unit standing here
						elseif ( plot:IsVisibleEnemyUnit(pCity:GetOwner()) ) then
							local controlTable = g_PlotButtonIM:GetInstance();						
							controlTable.PlotButtonAnchor:SetWorldPosition( VecAdd( worldPos, WorldPositionOffset ) );
							IconHookup(	13, 45, "CITIZEN_ATLAS", controlTable.PlotButtonImage);
							controlTable.PlotButtonImage:SetToolTipString( Locale.ConvertTextKey("TXT_KEY_CITYVIEW_ENEMY_UNIT_CITY_TILE") );
							controlTable.PlotButtonImage:SetVoid1( -1 );
							controlTable.PlotButtonImage:RegisterCallback( Mouse.eLCLick, PlotButtonClicked);
							
							DoTestViewingModeOnly(controlTable);
							
							--Events.SerialEventHexHighlight( ToHexFromGrid( Vector2( plot:GetX(), plot:GetY() ) ), true, Vector4( 1.0, 0.0, 0.0, 1 ) );
						-- Other: turn off highlight
						elseif ( pCity:CanWork( plot ) or plot:GetWorkingCity():GetID() ~= pCity:GetID() ) then
							local controlTable = g_PlotButtonIM:GetInstance();						
							controlTable.PlotButtonAnchor:SetWorldPosition( VecAdd( worldPos, WorldPositionOffset ) );
							controlTable.PlotButtonImage:SetToolTipString( Locale.ConvertTextKey("TXT_KEY_CITYVIEW_UNWORKED_CITY_TILE") );
							IconHookup(	9, 45, "CITIZEN_ATLAS", controlTable.PlotButtonImage);
							controlTable.PlotButtonImage:SetVoid1( i );
							controlTable.PlotButtonImage:RegisterCallback( Mouse.eLCLick, PlotButtonClicked);
							bNoHighlight = true;
							
							DoTestViewingModeOnly(controlTable);
							
							-- JFD Trading Posts
							local improvementID = plot:GetImprovementType()
							local improvementUpgradeTimeLeft = plot:GetUpgradeTimeLeft(improvementID, pCity:GetOwner())
							if improvementUpgradeTimeLeft > 1 then
								controlTable.TradingPostLabel:SetText(improvementUpgradeTimeLeft)
								controlTable.TradingPostLabel:LocalizeAndSetToolTip("TXT_KEY_JFD_PLOT_HELP_TURNS_TIL_UPGRADE_TT", improvementUpgradeTimeLeft)
								controlTable.TradingPostLabel:SetHide(false)
							else
								controlTable.TradingPostLabel:SetHide(true)
							end
						end
					else
						bNoHighlight = true;
					end
				end
				
				--if (bNoHighlight) then
					Events.SerialEventHexHighlight( ToHexFromGrid( Vector2( plot:GetX(), plot:GetY() ) ), false, Vector4( 0.0, 1.0, 0.0, 1 ) );
				--end
			end
		end
		
		-- Add buy plot buttons
		g_BuyPlotButtonIM:ResetInstances();
		if UI.GetInterfaceMode() == InterfaceModeTypes.INTERFACEMODE_PURCHASE_PLOT then
			Events.RequestYieldDisplay( YieldDisplayTypes.CITY_PURCHASABLE, pCity:GetX(), pCity:GetY() );
			for i = 0, pCity:GetNumCityPlots() - 1, 1 do
				local plot = pCity:GetCityIndexPlot( i );
				if (plot ~= nil) then
					local hexPos = ToHexFromGrid( Vector2( plot:GetX(), plot:GetY() ) );
					local worldPos = HexToWorld( hexPos );
					if (pCity:CanBuyPlotAt(plot:GetX(), plot:GetY(), false)) then
						local controlTable = g_BuyPlotButtonIM:GetInstance();						
						controlTable.BuyPlotButtonAnchor:SetWorldPosition( VecAdd( worldPos, WorldPositionOffset2 ) );
						local iPlotCost = pCity:GetBuyPlotCost( plot:GetX(), plot:GetY() );
						local strText = Locale.ConvertTextKey("TXT_KEY_CITYVIEW_CLAIM_NEW_LAND",iPlotCost);
						controlTable.BuyPlotAnchoredButton:SetToolTipString( strText );
						controlTable.BuyPlotAnchoredButtonLabel:SetText( tostring(iPlotCost) );
						controlTable.BuyPlotAnchoredButton:SetDisabled( false );
						controlTable.BuyPlotAnchoredButton:SetVoid1( i );
						controlTable.BuyPlotAnchoredButton:RegisterCallback( Mouse.eLCLick, BuyPlotAnchorButtonClicked);
					elseif (pCity:CanBuyPlotAt(plot:GetX(), plot:GetY(), true)) then
						local controlTable = g_BuyPlotButtonIM:GetInstance();						
						controlTable.BuyPlotButtonAnchor:SetWorldPosition( VecAdd( worldPos, WorldPositionOffset2 ) );
						local iPlotCost = pCity:GetBuyPlotCost( plot:GetX(), plot:GetY() );						
						local strText = Locale.ConvertTextKey("TXT_KEY_CITYVIEW_NEED_MONEY_BUY_TILE",iPlotCost);
						controlTable.BuyPlotAnchoredButton:SetToolTipString( strText );
						controlTable.BuyPlotAnchoredButton:SetDisabled( true );
						controlTable.BuyPlotAnchoredButtonLabel:SetText( "[COLOR_WARNING_TEXT]"..tostring(iPlotCost).."[ENDCOLOR]" );
					end
				end
			end
			local aPurchasablePlots = {pCity:GetBuyablePlotList()};
			for i = 1, #aPurchasablePlots, 1 do
				Events.SerialEventHexHighlight( ToHexFromGrid( Vector2( aPurchasablePlots[i]:GetX(), aPurchasablePlots[i]:GetY() ) ), true, Vector4( 1.0, 0.0, 1.0, 1 ) );
			end

		-- Standard mode - show plots that will be acquired by culture
		else
			local aPurchasablePlots = {pCity:GetBuyablePlotList()};
			for i = 1, #aPurchasablePlots, 1 do
				Events.SerialEventHexHighlight( ToHexFromGrid( Vector2( aPurchasablePlots[i]:GetX(), aPurchasablePlots[i]:GetY() ) ), true, Vector4( 1.0, 0.0, 1.0, 1 ) );
			end
		end
    end
end
Events.SerialEventCityHexHighlightDirty.Add(UpdateWorkingHexes);

-------------------------------------------------
function DoTestViewingModeOnly(controlTable)
	
	-- Viewing mode only?
	if (UI.IsCityScreenViewingMode()) then
		controlTable.PlotButtonImage:SetDisabled(true);
	else
		controlTable.PlotButtonImage:SetDisabled(false);
	end
	
end	



-------------------------------------------------
-------------------------------------------------
function OnProductionClick()
	
	local city = UI.GetHeadSelectedCity();
	local cityID = city:GetID();
	local popupInfo = {
		Type = ButtonPopupTypes.BUTTONPOPUP_CHOOSEPRODUCTION,
		Data1 = cityID,
		Data2 = -1,
		Data3 = -1,
		Option1 = (productionQueueOpen and city:GetOrderQueueLength() > 0),
		Option2 = false;
	}
	Events.SerialEventGameMessagePopup(popupInfo);
    -- send production popup message
end
Controls.ProductionButton:RegisterCallback( Mouse.eLClick, OnProductionClick );


-------------------------------------------------
-------------------------------------------------
function OnRemoveClick( num )	
	Game.SelectedCitiesGameNetMessage(GameMessageTypes.GAMEMESSAGE_POP_ORDER, num);
end
Controls.b1remove:RegisterCallback( Mouse.eLClick, OnRemoveClick );
Controls.b1remove:SetVoid1( 0 );
Controls.b2remove:RegisterCallback( Mouse.eLClick, OnRemoveClick );
Controls.b2remove:SetVoid1( 1 );
Controls.b3remove:RegisterCallback( Mouse.eLClick, OnRemoveClick );
Controls.b3remove:SetVoid1( 2 );
Controls.b4remove:RegisterCallback( Mouse.eLClick, OnRemoveClick );
Controls.b4remove:SetVoid1( 3 );
Controls.b5remove:RegisterCallback( Mouse.eLClick, OnRemoveClick );
Controls.b5remove:SetVoid1( 4 );
Controls.b6remove:RegisterCallback( Mouse.eLClick, OnRemoveClick );
Controls.b6remove:SetVoid1( 5 );

-------------------------------------------------
-------------------------------------------------
function OnSwapClick( num )
	print()
	Game.SelectedCitiesGameNetMessage(GameMessageTypes.GAMEMESSAGE_SWAP_ORDER, num);
end
Controls.b1down:RegisterCallback( Mouse.eLClick, OnSwapClick );
Controls.b1down:SetVoid1( 0 );

Controls.b2up:RegisterCallback( Mouse.eLClick, OnSwapClick );
Controls.b2up:SetVoid1( 0 );
Controls.b2down:RegisterCallback( Mouse.eLClick, OnSwapClick );
Controls.b2down:SetVoid1( 1 );

Controls.b3up:RegisterCallback( Mouse.eLClick, OnSwapClick );
Controls.b3up:SetVoid1( 1 );
Controls.b3down:RegisterCallback( Mouse.eLClick, OnSwapClick );
Controls.b3down:SetVoid1( 2 );

Controls.b4up:RegisterCallback( Mouse.eLClick, OnSwapClick );
Controls.b4up:SetVoid1( 2 );
Controls.b4down:RegisterCallback( Mouse.eLClick, OnSwapClick );
Controls.b4down:SetVoid1( 3 );

Controls.b5up:RegisterCallback( Mouse.eLClick, OnSwapClick );
Controls.b5up:SetVoid1( 3 );
Controls.b5down:RegisterCallback( Mouse.eLClick, OnSwapClick );
Controls.b5down:SetVoid1( 4 );

Controls.b6up:RegisterCallback( Mouse.eLClick, OnSwapClick );
Controls.b6up:SetVoid1( 4 );
--Controls.b6down:RegisterCallback( Mouse.eLClick, OnSwapClick );
--Controls.b6down:SetVoid1( 5 );


-------------------------------------------------
-------------------------------------------------

local g_iCurrentSpecialist = -1;
local g_bCurrentSpecialistGrowth = true;

---------------------------------------------------------------
-- Specialist Automation Checkbox
---------------------------------------------------------------
function OnNoAutoSpecialistCheckboxClick()
	local bValue = false;
	
	-- Checkbox was JUST turned on, 
	if (not UI.GetHeadSelectedCity():IsNoAutoAssignSpecialists()) then
		bValue = true;
	end
	
	Game.SelectedCitiesGameNetMessage(GameMessageTypes.GAMEMESSAGE_DO_TASK, TaskTypes.TASK_NO_AUTO_ASSIGN_SPECIALISTS, -1, -1, bValue);
end
Controls.NoAutoSpecialistCheckbox:RegisterCallback(Mouse.eLClick, OnNoAutoSpecialistCheckboxClick);
Controls.NoAutoSpecialistCheckbox2:RegisterCallback(Mouse.eLClick, OnNoAutoSpecialistCheckboxClick);

---------------------------------------------------------------
-- Clicking on Building instances to add or remove Specialists
---------------------------------------------------------------
function OnBuildingClick(iBuilding)
	--local pCity = UI.GetHeadSelectedCity();
	--
	--local iNumSpecialistsAllowed = pCity:GetNumSpecialistsAllowedByBuilding(iBuilding)
	--local iNumSpecialistsAssigned = pCity:GetNumSpecialistsInBuilding(iBuilding);
	--
	--if (iNumSpecialistsAllowed > 0) then
		--
		---- If Specialists are automated then you can't change things with them
		--if (not pCity:IsNoAutoAssignSpecialists()) then
			--local bValue = true;
			--Game.SelectedCitiesGameNetMessage(GameMessageTypes.GAMEMESSAGE_DO_TASK, TaskTypes.TASK_NO_AUTO_ASSIGN_SPECIALISTS, -1, -1, bValue);
			--Controls.NoAutoSpecialistCheckbox:SetCheck(true);
		--end
		--
		--local iSpecialist = GameInfoTypes[GameInfo.Buildings[iBuilding].SpecialistType];
		--
		---- Switched to a different specialist type, so clicking on the building will grow the count
		--if (iSpecialist ~= g_iCurrentSpecialist) then
			--g_bCurrentSpecialistGrowth = true;
		--end
		--
		---- Nobody assigned yet, so we must grow
		--if (iNumSpecialistsAssigned == 0) then
			--g_bCurrentSpecialistGrowth = true;
		--end
		--
		---- If we can add something, add it
		--if (g_bCurrentSpecialistGrowth and pCity:IsCanAddSpecialistToBuilding(iBuilding)) then
			--Game.SelectedCitiesGameNetMessage(GameMessageTypes.GAMEMESSAGE_DO_TASK, TaskTypes.TASK_ADD_SPECIALIST, iSpecialist, iBuilding);
			--
		---- Can't add something, so remove what's here instead
		--elseif (iNumSpecialistsAssigned > 0) then
			--Game.SelectedCitiesGameNetMessage(GameMessageTypes.GAMEMESSAGE_DO_TASK, TaskTypes.TASK_REMOVE_SPECIALIST, iSpecialist, iBuilding);
			--
			---- Start removing Specialists
			--g_bCurrentSpecialistGrowth = false;
		--end
		--
		--g_iCurrentSpecialist = iSpecialist;
	--end
	--
end


function DisableSpecialist(iBuilding, slot)
end


function AddSpecialist(iBuilding, slot)
	local pCity = UI.GetHeadSelectedCity();
				
	-- If Specialists are automated then you can't change things with them
	if (not pCity:IsNoAutoAssignSpecialists()) then
		Game.SelectedCitiesGameNetMessage(GameMessageTypes.GAMEMESSAGE_DO_TASK, TaskTypes.TASK_NO_AUTO_ASSIGN_SPECIALISTS, -1, -1, true);
		Controls.NoAutoSpecialistCheckbox:SetCheck(true);
		Controls.NoAutoSpecialistCheckbox2:SetCheck(true);
	end
	
	local iSpecialist = GameInfoTypes[GameInfo.Buildings[iBuilding].SpecialistType];
	
	-- If we can add something, add it
	if (pCity:IsCanAddSpecialistToBuilding(iBuilding)) then
		Game.SelectedCitiesGameNetMessage(GameMessageTypes.GAMEMESSAGE_DO_TASK, TaskTypes.TASK_ADD_SPECIALIST, iSpecialist, iBuilding);
	end
	if specialistTable[iBuilding] and specialistTable[iBuilding][slot] then
	--g_iCurrentSpecialist = iSpecialist;
		specialistTable[iBuilding][slot] = true;
	end
end

function RemoveSpecialist(iBuilding, slot)
	local pCity = UI.GetHeadSelectedCity();
	
	local iNumSpecialistsAssigned = pCity:GetNumSpecialistsInBuilding(iBuilding);
				
	-- If Specialists are automated then you can't change things with them
	if (not pCity:IsNoAutoAssignSpecialists()) then
		Game.SelectedCitiesGameNetMessage(GameMessageTypes.GAMEMESSAGE_DO_TASK, TaskTypes.TASK_NO_AUTO_ASSIGN_SPECIALISTS, -1, -1, true);
		Controls.NoAutoSpecialistCheckbox:SetCheck(true);
		Controls.NoAutoSpecialistCheckbox2:SetCheck(true);
	end
	
	local iSpecialist = GameInfoTypes[GameInfo.Buildings[iBuilding].SpecialistType];
	
	-- If we can remove something, remove it
	if (iNumSpecialistsAssigned > 0) then
		Game.SelectedCitiesGameNetMessage(GameMessageTypes.GAMEMESSAGE_DO_TASK, TaskTypes.TASK_REMOVE_SPECIALIST, iSpecialist, iBuilding);
	end
	
	--g_iCurrentSpecialist = iSpecialist;
	
	specialistTable[iBuilding][slot] = false;
end

-------------------------------------------------
-------------------------------------------------
function OnNextCityButton()
	Game.DoControl(GameInfoTypes.CONTROL_NEXTCITY)
end
Controls.NextCityButton:RegisterCallback( Mouse.eLClick, OnNextCityButton );

-------------------------------------------------
-------------------------------------------------
function OnPrevCityButton()
	Game.DoControl(GameInfoTypes.CONTROL_PREVCITY)
end
Controls.PrevCityButton:RegisterCallback( Mouse.eLClick, OnPrevCityButton );

-------------------------------------------------
-------------------------------------------------
function UpdateBuyPlotButton()

end

-------------------------------------------------
-------------------------------------------------
function OnBuyPlotClick()

	if not Players[Game.GetActivePlayer()]:IsTurnActive() then
		return;
	end
	
	local city = UI.GetHeadSelectedCity();
	
	if (city == nil) then
		return;
	end;
	
	UI.SetInterfaceMode(InterfaceModeTypes.INTERFACEMODE_PURCHASE_PLOT);
	UpdateWorkingHexes();
	
	--UpdateBuyPlotButton();
end
Controls.BuyPlotButton:RegisterCallback( Mouse.eLClick, OnBuyPlotClick );

-------------------------------------------------
-- Plot moused over
-------------------------------------------------
function OnMouseOverHex( hexX, hexY )
	
	if UI.GetInterfaceMode() == InterfaceModeTypes.INTERFACEMODE_PURCHASE_PLOT then
		
		local city = UI.GetHeadSelectedCity();
		
		if (city == nil) then
			return;
		end;

		local strText = "---";
		
		-- Can buy this plot
		if (city:CanBuyPlotAt( hexX, hexY, true)) then
			local iPlotCost = city:GetBuyPlotCost( hexX, hexY );
			strText = "[ICON_GOLD] " .. iPlotCost;
		end
		
		Controls.BuyPlotText:SetText(strText);
	end
	
end
Events.SerialEventMouseOverHex.Add( OnMouseOverHex );

-------------------------------------------------
-------------------------------------------------
function OnReturnToMapButton()
	--CloseScreen();
	Events.SerialEventExitCityScreen();
end
Controls.ReturnToMapButton:RegisterCallback( Mouse.eLClick, OnReturnToMapButton);

-------------------------------------------------
-------------------------------------------------
function OnRazeButton()

	local pCity = UI.GetHeadSelectedCity();
	
	if (pCity == nil) then
		return;
	end;
	
	local popupInfo = {
		Type = ButtonPopupTypes.BUTTONPOPUP_CONFIRM_CITY_TASK,
		Data1 = pCity:GetID(),
		Data2 = TaskTypes.TASK_RAZE,
		}
    
	Events.SerialEventGameMessagePopup( popupInfo );
end
Controls.RazeCityButton:RegisterCallback( Mouse.eLClick, OnRazeButton);

-------------------------------------------------
-------------------------------------------------
function OnUnrazeButton()

	if Players[Game.GetActivePlayer()]:IsTurnActive() then
		local pCity = UI.GetHeadSelectedCity();
		
		if (pCity == nil) then
			return;
		end;
		
		Network.SendDoTask(pCity:GetID(), TaskTypes.TASK_UNRAZE, -1, -1, false, false, false, false);
	end
end
Controls.UnrazeCityButton:RegisterCallback( Mouse.eLClick, OnUnrazeButton);
-------------------------------------------------
-- JFD Assimilate Colony
-------------------------------------------------
function JFD_ConfirmAssimilateYes()
	Controls.AssimilateConfirm:SetHide(true)
	local city = UI.GetHeadSelectedCity()
	if (city and city:IsColony()) then
		LuaEvents.JFD_ColonyDecolonized(Game.GetActivePlayer(), city, false)
		Events.AudioPlay2DSound("AS2D_WONDER_SPEECH_JFD_PENA");	
		Events.SerialEventExitCityScreen()
		local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
		Events.GameplayFX(hex.x, hex.y, -1) 
	end
end
Controls.ConfirmAssimilateYes:RegisterCallback(Mouse.eLClick, JFD_ConfirmAssimilateYes)

function JFD_ConfirmAssimilateNo()
	Controls.AssimilateConfirm:SetHide(true)
end
Controls.ConfirmAssimilateNo:RegisterCallback(Mouse.eLClick, JFD_ConfirmAssimilateNo)

function JFD_OnAssimilateButton()
	local playerID = Game.GetActivePlayer()
	local player = Players[playerID]
	if player:IsTurnActive() then
		local city = UI.GetHeadSelectedCity()
		if (not city) then return end
		local canAssimilate, reqPopulation, costGold, costMagistrates = player:CanDecolonize(city)
		local confirmText = Locale.ConvertTextKey("TXT_KEY_CITYVIEW_JFD_ASSIMILATE_BUTTON_TEXT_CONFIRM")
		if isUsingED then
			confirmText = confirmText .. " " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_JFD_ASSIMILATE_BUTTON_TEXT_CONFIRM_COST_ED", costMagistrates, costGold)
		else
			confirmText = confirmText .. " " .. Locale.ConvertTextKey("TXT_KEY_CITYVIEW_JFD_ASSIMILATE_BUTTON_TEXT_CONFIRM_COST", costGold)
		end
		Controls.AssimilateConfirm:SetHide(false)
		Controls.AssimilateLabelConfirm:SetText(confirmText)
	end
end
Controls.AssimilateColonyButton:RegisterCallback( Mouse.eLClick, JFD_OnAssimilateButton);
-------------------------------------------------
-------------------------------------------------
function OnPurchaseButton()
	local city = UI.GetHeadSelectedCity();
	local cityID = city:GetID();
	local popupInfo = {
		Type = ButtonPopupTypes.BUTTONPOPUP_CHOOSEPRODUCTION,
		Data1 = cityID,
		Data2 = -1,
		Data3 = -1,
		Option1 = (productionQueueOpen and city:GetOrderQueueLength() > 0),
		Option2 = true;
	}
	Events.SerialEventGameMessagePopup(popupInfo);
    -- send production popup message

end
Controls.PurchaseButton:RegisterCallback( Mouse.eLClick, OnPurchaseButton);


function OnPortraitRClicked()
	local city = UI.GetHeadSelectedCity();
	local cityID = city:GetID();

	local searchString = "";
	local unitProduction = city:GetProductionUnit();
	local buildingProduction = city:GetProductionBuilding();
	local projectProduction = city:GetProductionProject();
	local processProduction = city:GetProductionProcess();
	local noProduction = false;

	if unitProduction ~= -1 then
		local thisUnitInfo = GameInfo.Units[unitProduction];
		searchString = Locale.ConvertTextKey( thisUnitInfo.Description );
	elseif buildingProduction ~= -1 then
		local thisBuildingInfo = GameInfo.Buildings[buildingProduction];
		searchString = Locale.ConvertTextKey( thisBuildingInfo.Description );
	elseif projectProduction ~= -1 then
		local thisProjectInfo = GameInfo.Projects[projectProduction];
		searchString = Locale.ConvertTextKey( thisProjectInfo.Description );
	elseif processProduction ~= -1 then
		local pProcessInfo = GameInfo.Processes[processProduction];
		searchString = Locale.ConvertTextKey( pProcessInfo.Description );
	else
		noProduction = true;
	end
		
	if noProduction == false then
	
		--CloseScreen();

		-- search by name
		Events.SearchForPediaEntry( searchString );		
	end
		
end
Controls.ProductionPortraitButton:RegisterCallback( Mouse.eRClick, OnPortraitRClicked );


----------------------------------------------------------------
----------------------------------------------------------------
function OnHideQueue( bIsChecked )
	productionQueueOpen = bIsChecked;
	OnCityViewUpdate();
end
Controls.HideQueueButton:RegisterCheckHandler( OnHideQueue );

function OnToggleYields( bIsChecked )
	yieldPanelsOpen = bIsChecked;
	
	if yieldPanelsOpen then
		yield1HeadingOpen = true;
		yield2HeadingOpen = true;
		yield3HeadingOpen = true;
		yield4HeadingOpen = true;
		yield5HeadingOpen = true;
		yield6HeadingOpen = true;
	else
		yield1HeadingOpen = true;
		yield2HeadingOpen = false;
		yield3HeadingOpen = false;
		yield4HeadingOpen = false;
		yield5HeadingOpen = false;
		yield6HeadingOpen = false;
	end
	OnCityViewUpdate();
end
Controls.ToggleYieldPanels:RegisterCheckHandler( OnToggleYields );
----------------------------------------------------------------
----------------------------------------------------------------

function FocusChanged( focus )
	if Players[Game.GetActivePlayer()]:IsTurnActive() then
		local pCity = UI.GetHeadSelectedCity();
		Network.SendSetCityAIFocus( pCity:GetID(), focus );
	end
end
Controls.BalancedFocusButton:SetVoid1( CityAIFocusTypes.NO_CITY_AI_FOCUS_TYPE )
Controls.BalancedFocusButton:RegisterCallback( Mouse.eLClick, FocusChanged );

Controls.FoodFocusButton:SetVoid1( CityAIFocusTypes.CITY_AI_FOCUS_TYPE_FOOD )
Controls.FoodFocusButton:RegisterCallback( Mouse.eLClick, FocusChanged );

Controls.ProductionFocusButton:SetVoid1( CityAIFocusTypes.CITY_AI_FOCUS_TYPE_PRODUCTION )
Controls.ProductionFocusButton:RegisterCallback( Mouse.eLClick, FocusChanged );

Controls.GoldFocusButton:SetVoid1( CityAIFocusTypes.CITY_AI_FOCUS_TYPE_GOLD )
Controls.GoldFocusButton:RegisterCallback( Mouse.eLClick, FocusChanged );

Controls.ResearchFocusButton:SetVoid1( CityAIFocusTypes.CITY_AI_FOCUS_TYPE_SCIENCE )
Controls.ResearchFocusButton:RegisterCallback( Mouse.eLClick, FocusChanged );

Controls.CultureFocusButton:SetVoid1( CityAIFocusTypes.CITY_AI_FOCUS_TYPE_CULTURE )
Controls.CultureFocusButton:RegisterCallback( Mouse.eLClick, FocusChanged );

Controls.GPFocusButton:SetVoid1( CityAIFocusTypes.CITY_AI_FOCUS_TYPE_GREAT_PEOPLE )
Controls.GPFocusButton:RegisterCallback( Mouse.eLClick, FocusChanged );

Controls.FaithFocusButton:SetVoid1( CityAIFocusTypes.CITY_AI_FOCUS_TYPE_FAITH );
Controls.FaithFocusButton:RegisterCallback( Mouse.eLClick, FocusChanged );

----------------------------------------------------------------
----------------------------------------------------------------

function OnAvoidGrowth( )
	if Players[Game.GetActivePlayer()]:IsTurnActive() then
		local pCity = UI.GetHeadSelectedCity();
		Network.SendSetCityAvoidGrowth( pCity:GetID(), not pCity:IsForcedAvoidGrowth() );
	end		
end
Controls.AvoidGrowthButton:RegisterCallback( Mouse.eLClick, OnAvoidGrowth );

----------------------------------------------------------------
----------------------------------------------------------------

function OnResetForcedTiles( )
	if Players[Game.GetActivePlayer()]:IsTurnActive() then
		local pCity = UI.GetHeadSelectedCity();
		if pCity ~= nil then
			-- calling this with the city center (0 in the third param) causes it to reset all forced tiles
			Network.SendDoTask(pCity:GetID(), TaskTypes.TASK_CHANGE_WORKING_PLOT, 0, -1, false, bAlt, bShift, bCtrl);
		end
	end
end
Controls.ResetButton:RegisterCallback( Mouse.eLClick, OnResetForcedTiles );

---------------------------------------------------------------------------------------
-- Support for Modded Add-in UI's
---------------------------------------------------------------------------------------
g_uiAddins = {};
for addin in Modding.GetActivatedModEntryPoints("CityViewUIAddin") do
	local addinFile = Modding.GetEvaluatedFilePath(addin.ModID, addin.Version, addin.File);
	local addinPath = addinFile.EvaluatedPath;
	
	-- Get the absolute path and filename without extension.
	local extension = Path.GetExtension(addinPath);
	local path = string.sub(addinPath, 1, #addinPath - #extension);
	
	table.insert(g_uiAddins, ContextPtr:LoadNewContext(path));
end

---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
--JFD_UpdateDevelopmentInfo
local yieldProductionID = GameInfoTypes["YIELD_PRODUCTION"]
function JFD_UpdateDevelopmentInfo(pPlayer, pCity)
	-- local productionBuildingID = pCity:GetProductionBuilding()
	-- local isWonder = false
	-- if productionBuildingID > -1 then isWonder = GameInfo.BuildingClasses[GameInfo.Buildings[productionBuildingID].BuildingClass].MaxGlobalInstances == 1 end
	-- local developmentRate = pPlayer:GetCityDevelopment(pCity)
	-- local yieldHappiness, yieldHealth, yieldBuildingProduction, yieldCrime, yieldDisease, yieldWonderProduction = pPlayer:GetDevelopmentYields(pCity, developmentRate)
	-- yieldBuildingProduction  = math.floor(yieldBuildingProduction)
	-- yieldWonderProduction	 = math.floor(yieldWonderProduction)
	-- if developmentRate > 0 then
		-- if (productionBuildingID > -1 and (not isWonder)) then
			-- pCity:SetYieldModifierFromDevelopment(yieldProductionID, yieldBuildingProduction)	
		-- else
			-- pCity:SetYieldModifierFromDevelopment(yieldProductionID, 0)	
		-- end
	-- elseif developmentRate < 0 then
		-- if (productionBuildingID > -1 and isWonder) then
			-- pCity:SetYieldModifierFromDevelopment(yieldProductionID, yieldWonderProduction)	
		-- else
			-- pCity:SetYieldModifierFromDevelopment(yieldProductionID, 0)	
		-- end
	-- else	
		-- pCity:SetYieldModifierFromDevelopment(yieldProductionID, 0)	
	-- end
end
-- if userSettings["UserSettingCIDDevelopmentCore"] then
	-- Events.SpecificCityInfoDirty.Add( JFD_UpdateDevelopmentInfo );
-- end
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
--UpdateInvestmentInfo
function UpdateInvestmentInfo(player, city, isMadeInvestment)
	if (not city) then city = UI.GetHeadSelectedCity() end
	if (not city) then return end
	if (not player) then player = Players[city:GetOwner()] end
	Controls.InvestButton:SetHide(true)
	local buildingID = city:GetProductionBuilding();
	if buildingID ~= -1 then
		local building = GameInfo.Buildings[buildingID]
		local buildingClass = GameInfo.BuildingClasses[building.BuildingClass]
		local investmentAmount = player:GetInvestmentValue(false, (buildingClass.MaxGlobalInstances >= 1 or buildingClass.MaxPlayerInstances >= 1))
		if (city:GetBuildingInvestment(buildingID) > 0 or isMadeInvestment) then
			Controls.InvestButton:SetHide(false)
			Controls.InvestButton:SetDisabled(true)
			Controls.InvestButton:LocalizeAndSetText("TXT_KEY_CITYVIEW_QUEUE_INVESTED")
			Controls.InvestButton:LocalizeAndSetToolTip("TXT_KEY_CITYVIEW_QUEUE_INVESTED_TT", building.Description, investmentAmount)
		else
			local costGold = city:GetBuildingPurchaseCost( buildingID )
			local investmentString = Locale.ConvertTextKey("TXT_KEY_CITYVIEW_QUEUE_INVEST", costGold)
			if player:GetGold() < costGold then
				investmentString = "[COLOR_NEGATIVE_TEXT]" .. investmentString .. "[ENDCOLOR]"
				Controls.InvestButton:SetDisabled(true)
			else
				Controls.InvestButton:SetDisabled(false)	
			end
			Controls.InvestButton:SetHide(false)
			Controls.InvestButton:SetText(investmentString)
			Controls.InvestButton:LocalizeAndSetToolTip("TXT_KEY_CITYVIEW_QUEUE_INVEST_TT", costGold, building.Description, investmentAmount)
			Controls.InvestButton:SetVoid1(buildingID)
			Controls.InvestButton:RegisterCallback(Mouse.eLClick, MakeInvestment)
		end
	else
		Controls.InvestButton:SetHide(true)
	end
	DoUpdateProductionInfo(false)
	Events.SpecificCityInfoDirty(city:GetOwner(), city:GetID(), CityUpdateTypes.CITY_UPDATE_TYPE_BANNER);
end
if userSettings["UserSettingCIDInvestmentsCoreUI"] then
	Events.SerialEventGameDataDirty.Add( UpdateInvestmentInfo );
end

--MakeInvestment
function MakeInvestment(buildingID)
	local city = UI.GetHeadSelectedCity()
	Game.CityPurchaseBuilding(city, buildingID, YieldTypes.YIELD_GOLD)
	Events.AudioPlay2DSound("AS2D_INTERFACE_CITY_SCREEN_PURCHASE");
end
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
--UpdateProvinceInfo
function UpdateProvinceInfo()
	local pCity = UI.GetHeadSelectedCity()
	if Controls.ProvinceDetailsBox:IsHidden() then
		Controls.ProvinceDetailsBox:SetHide(false)
		local pPlayer = Players[pCity:GetOwner()]
		local provinceSimpleTT, provinceTT = pPlayer:GetProvinceInfoTT(pCity, pCity:GetProvinceLevel())
		Controls.ProvinceDetails:SetText(provinceSimpleTT);
		Controls.ProvinceDetailsBox:SetToolTipString(provinceTT);
		-- Controls.ProvinceDetailsScroll:CalculateInternalSize();
		-- Controls.ProvinceDetailsScroll:ReprocessAnchoring();
		-- Controls.IconsStack:SetHide(false)
	else
		Controls.ProvinceDetailsBox:SetHide(true)
		Controls.ProvinceDetailsBox:SetToolTipString(nil);
		-- Controls.IconsStack:SetHide(true)
	end
	-- Controls.IconsStack:CalculateSize();
	-- Controls.IconsStack:ReprocessAnchoring()
end
Controls.ProvinceBox:RegisterCallback( Mouse.eLClick, UpdateProvinceInfo );
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
function OnProductionPopup( bIsHide )
	-- if OptionsManager.GetSmallUIAssets() then
		Controls.TopLeft:SetHide( not bIsHide );
		Controls.CivIconFrame:SetHide( not bIsHide );
		Controls.ProdQueueBackground:SetHide( not bIsHide );
		Controls.LeftTrim:SetHide( not bIsHide );
    -- else
		-- Controls.TopLeft:SetHide( not bIsHide );
		-- Controls.InfoBG:SetHide( not bIsHide );
		-- Controls.CityInfo:SetHide( not bIsHide );
		-- Controls.ProdQueueBackground:SetHide( not bIsHide );
		-- Controls.LeftTrim:SetHide( not bIsHide );
    -- end
end
LuaEvents.ProductionPopup.Add( OnProductionPopup );


------------------------------------------------------------
-- Selling Buildings
------------------------------------------------------------
	
function OnBuildingClicked(iBuildingID)

	if (not Players[Game.GetActivePlayer()]:IsTurnActive()) then
		return;
	end

	local pCity = UI.GetHeadSelectedCity();
	
	
	-- Build info string
	local pBuilding = GameInfo.Buildings[iBuildingID];
	local iCrime = Game.GetBuildingYieldChange(iBuildingID, GameInfo.Yields["YIELD_JFD_CRIME"].ID)
	-- Can this building even be sold?
	if (not pCity:IsBuildingSellable(iBuildingID) and iCrime <= 0) then -- JFD Crime
		return;
	end
	
	local iRefund = pCity:GetSellBuildingRefund(iBuildingID);
	local iMaintenance = pBuilding.GoldMaintenance;
	
	local localizedLabel = Locale.ConvertTextKey( "TXT_KEY_SELL_BUILDING_INFO", iRefund, iMaintenance );
	if iCrime > 0 then
		localizedLabel = Locale.ConvertTextKey( "TXT_KEY_SELL_BUILDING_INFO_JFD_CRIME", iRefund, iCrime );
	end
	Controls.SellBuildingPopupText:SetText(localizedLabel);
	
	g_iBuildingToSell = iBuildingID;
	
	Controls.SellBuildingConfirm:SetHide(false);
end

function OnYes( )
	Controls.SellBuildingConfirm:SetHide(true);
	if Players[Game.GetActivePlayer()]:IsTurnActive() then
		local pCity = UI.GetHeadSelectedCity();
		local building = GameInfo.Buildings[g_iBuildingToSell]
		local iCrime = Game.GetBuildingYieldChange(g_iBuildingToSell, GameInfo.Yields["YIELD_JFD_CRIME"].ID)
		if iCrime > 0 and (building.Cost > 0 or building.FaithCost > 0) and pCity:GetNumFreeBuilding(buildingID) == 0 then
			local iRefund = pCity:GetSellBuildingRefund(g_iBuildingToSell);
			pCity:SetNumRealBuilding(g_iBuildingToSell, 0)
			Players[Game.GetActivePlayer()]:ChangeGold(iRefund)
		else
			Network.SendSellBuilding(pCity:GetID(), g_iBuildingToSell);
		end
	end
	g_iBuildingToSell = -1;
end
Controls.YesButton:RegisterCallback( Mouse.eLClick, OnYes );

function OnNo( )
	Controls.SellBuildingConfirm:SetHide(true);
	g_iBuildingToSell = -1;
end
Controls.NoButton:RegisterCallback( Mouse.eLClick, OnNo );


------------------------------------------------------------
------------------------------------------------------------
local NormalWorldPositionOffset  = WorldPositionOffset;
local NormalWorldPositionOffset2 = WorldPositionOffset2;
local StrategicViewWorldPositionOffset = { x = 0, y = 20, z = 0 };
function OnStrategicViewStateChanged( bStrategicView )
	if bStrategicView then
		WorldPositionOffset  = StrategicViewWorldPositionOffset;
		WorldPositionOffset2 = StrategicViewWorldPositionOffset;
	else
		WorldPositionOffset  = NormalWorldPositionOffset;
		WorldPositionOffset2 = NormalWorldPositionOffset2;
	end
end
Events.StrategicViewStateChanged.Add(OnStrategicViewStateChanged);

----------------------------------------------------------------
-- 'Active' (local human) player has changed
----------------------------------------------------------------
function OnEventActivePlayerChanged( iActivePlayer, iPrevActivePlayer )
	ClearCityUIInfo();
    if( not ContextPtr:IsHidden() ) then
		Events.SerialEventExitCityScreen();	
	end
end
Events.GameplaySetActivePlayer.Add(OnEventActivePlayerChanged);
