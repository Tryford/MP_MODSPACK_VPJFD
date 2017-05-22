--print("This is the 'CP Production Mod Replacement.'")
--print("This is the modded ProductionPopup from 'UI - City Production Queue Enhancements'")
-------------------------------------------------
-- Production Chooser Popup
-------------------------------------------------
include("IconSupport.lua");
include("InstanceManager.lua");
include("InfoTooltipInclude.lua");
------------------------------
-- JFD
------------------------------
include( "JFD_CID_ColoniesUtils.lua" ) 	-- JFD Colonies
include( "JFD_CID_CrimesUtils.lua" ) 	-- JFD Crimes
include( "JFD_CID_HappinessUtils.lua" ) -- JFD Happiness
include( "JFD_CID_HealthUtils.lua" ) 	-- JFD Health
include( "JFD_CID_LoyaltyUtils.lua" ) 	-- JFD Loyalty
include( "JFD_CID_ProvincesUtils.lua" ) -- JFD Provinces
include( "JFD_CID_SlaveryUtils.lua" ) 	-- JFD Slavery
local userSettingColoniesCoreMagistrates = JFD_GetUserSetting("JFD_CID_COLONIES_CORE_MAGISTRATE_PURCHASES") == 1
local userSettingCrimeCore 				 = JFD_GetUserSetting("JFD_CID_CRIMES_CORE") == 1
local userSettingHappinessCore			 = JFD_GetUserSetting("JFD_CID_HAPPINESS_CORE") == 1
local userSettingHealthCore 			 = JFD_GetUserSetting("JFD_CID_HEALTH_CORE") == 1
local userSettingInvestmentsCore 		 = JFD_GetUserSetting("JFD_CID_INVESTMENTS_CORE") == 1
local userSettingLoyaltyCore 			 = JFD_GetUserSetting("JFD_CID_LOYALTY_CORE") == 1
local userSettingProvincesCoreLevies	 = JFD_GetUserSetting("JFD_CID_PROVINCES_CORE_LEVIES") == 1
local userSettingSlaveryCore 			 = JFD_GetUserSetting("JFD_CID_SLAVERY_CORE") == 1
------------------------------
-- JFD
------------------------------

local g_LevyInstanceManager = InstanceManager:new( "ProdButton", "Button", Controls.LevyButtonStack );
local g_SlaveInstanceManager = InstanceManager:new( "ProdButton", "Button", Controls.SlaveButtonStack );
local g_UnitInstanceManager = InstanceManager:new( "ProdButton", "Button", Controls.UnitButtonStack );
local g_BuildingInstanceManager = InstanceManager:new( "ProdButton", "Button", Controls.BuildingButtonStack );
local g_NationalWonderInstanceManager = InstanceManager:new( "ProdButton", "Button", Controls.NationalWonderButtonStack );
local g_WonderInstanceManager = InstanceManager:new( "ProdButton", "Button", Controls.WonderButtonStack );
local g_ProcessInstanceManager = InstanceManager:new( "ProdButton", "Button", Controls.OtherButtonStack );

local m_PopupInfo = nil;

local bHidden = true;

------------------------------------------------
-- global constants
------------------------------------------------
g_strInfiniteTurns = Locale.ConvertTextKey("TXT_KEY_PRODUCTION_HELP_INFINITE_TURNS");

-- Storing current city in a global because the button cannot have more than 2 extra args.
-- NOTE: Storing the PlayerID/CityID for the city, it is not safe to store the pointer to a city
--       over multiple frames, the city could get removed by the game core thread
local g_currentCityOwnerID = -1;
local g_currentCityID = -1;
local g_append = false;
local g_IsProductionMode = true;

-- Defines used to track building/unit and gold/faith information on city purchase menu with a single int
local g_PURCHASE_BUILDING_MAGISTRATE = 12; -- JFD Colonies
local g_PURCHASE_UNIT_LEVIES = 11; -- JFD Levies
local g_PURCHASE_UNIT_SLAVERY = 10; -- JFD Slavery
local g_PURCHASE_UNIT_GOLD = 0;
local g_PURCHASE_BUILDING_GOLD = 1;
local g_PURCHASE_PROJECT_GOLD = 2;
local g_PURCHASE_UNIT_FAITH = 3;
local g_PURCHASE_BUILDING_FAITH = 4;
local g_PURCHASE_PROJECT_FAITH = 5;
local g_CONSTRUCT_UNIT = 6;
local g_CONSTRUCT_BUILDING = 7;
local g_CONSTRUCT_PROJECT = 8;
local g_MAINTAIN_PROCESS = 9;

local g_TheVeniceException = false;

local m_gOrderType = -1;
local m_gFinishedItemType = -1;

local screenSizeX, screenSizeY = UIManager:GetScreenSizeVal()
local scrollPanelSize = Controls.ScrollPanel:GetSize();
local scrollPanelSize = Controls.ScrollPanel:GetSize();
local scrollBarSize = { x = scrollBarWidth; y = screenSizeY - 400; };
Controls.ScrollBar:SetSize( scrollBarSize );
Controls.ScrollBar:SetOffsetVal( 15, 18 );
Controls.UpButton:SetOffsetVal( 15, 0);
Controls.DownButton:SetOffsetVal( 15, screenSizeY - 414 );
scrollPanelSize.y = screenSizeY - 396;
Controls.ScrollPanel:SetSize( scrollPanelSize );
Controls.ScrollPanel:CalculateInternalSize();
local backdropSize = { x = 377; y = screenSizeY - 300; };
Controls.Backdrop:SetSize( backdropSize );
--local mouseCatcherSize = { x = 465; y = screenSizeY - 30; };
--Controls.MouseCatcher:SetSize( mouseCatcherSize );

local listOfStrings = {};

-------------------------------------------------
-- Get the current city the popup is working with
-- Can return nil
-------------------------------------------------
function GetCurrentCity()
	if (g_currentCityOwnerID ~= -1 and g_currentCityID ~= -1) then
		local pPlayer = Players[g_currentCityOwnerID];
		if (pPlayer ~= nil) then
			local pCity = pPlayer:GetCityByID(g_currentCityID);
			return pCity;
		end
	end
	
	return nil;
end
-------------------------------------------------
-- On Production Selected
-------------------------------------------------
function ProductionSelected( ePurchaseEnum, iData)
	
	local eOrder;
	local eYield;
-- CP Edit
	local bIsUnitOverride = false;
	local bIsBuildingOverride = false;
	local bIsPuppetOverride = false;
	if(not g_IsProductionMode) then
		local city = GetCurrentCity();
		if (city ~= nil) then
			for building in GameInfo.Buildings() do
 				local buildingID = building.ID;
				if(buildingID ~= -1) then
					if(building.AllowsPuppetPurchase) then
						if (city:IsHasBuilding(buildingID)) then
							bIsPuppetOverride = true;
							break;
						end
					elseif(building.PuppetPurchaseOverride) then
						if city:IsCanPurchase(false, false, buildingID, -1, -1, YieldTypes.YIELD_GOLD) then
							bIsBuildingOverride = true;
							break;
						elseif city:IsCanPurchase(false, false, buildingID, -1, -1, YieldTypes.YIELD_FAITH) then
							bIsBuildingOverride = true;
							break;
						end
					end
				end
			end
			for unit in GameInfo.Units() do
 				local unitID = unit.ID;
				if(unitID ~= -1) then
					if(unit.PuppetPurchaseOverride) then
						if city:IsCanPurchase(false, false, unitID, -1, -1, YieldTypes.YIELD_GOLD) then
							bIsUnitOverride = true;
							break;
						elseif city:IsCanPurchase(false, false, unitID, -1, -1, YieldTypes.YIELD_FAITH) then
							bIsUnitOverride = true;
							break;
						end
					end
				end
			end
		end
	end
-- END
	-- Viewing mode only!
	-- slewis - Venice side-effect. Able to purchase in city-states
	local player = Players[Game.GetActivePlayer()];
	g_bTheVeniceException = (player:MayNotAnnex()) and (not g_IsProductionMode);
-- EDIT
	--if (UI.IsCityScreenViewingMode() and (not g_bTheVeniceException)) then
	if (UI.IsCityScreenViewingMode() and (not g_bTheVeniceException) and (not bIsBuildingOverride) and (not bIsUnitOverride) and (not bIsPuppetOverride)) then
		return;
	end
	
		--print("TESTING BEGINS");
		--print("TESTING " .. ePurchaseEnum);
	-- Unpack the enum
	-- JFD Colonies
	local isMagistrate = false
	-- JFD Provinces
	local isLevy = false
	-- JFD Slavery
	local isSlave = false
	if ePurchaseEnum == g_PURCHASE_BUILDING_MAGISTRATE then
		eOrder = OrderTypes.ORDER_CONSTRUCT;
		isMagistrate = true
	elseif ePurchaseEnum == g_PURCHASE_UNIT_SLAVERY then
		eOrder = OrderTypes.ORDER_TRAIN;
		isSlave = true
	elseif ePurchaseEnum == g_PURCHASE_UNIT_LEVIES then
		eOrder = OrderTypes.ORDER_TRAIN;
		isLevy = true
	else
		if (ePurchaseEnum == g_PURCHASE_UNIT_GOLD) then
		eOrder = OrderTypes.ORDER_TRAIN;
		eYield = YieldTypes.YIELD_GOLD;
		elseif (ePurchaseEnum == g_PURCHASE_BUILDING_GOLD) then
		eOrder = OrderTypes.ORDER_CONSTRUCT;
		eYield = YieldTypes.YIELD_GOLD;
		elseif (ePurchaseEnum == g_PURCHASE_PROJECT_GOLD) then
		eOrder = OrderTypes.ORDER_CREATE;
		eYield = YieldTypes.YIELD_GOLD;
		elseif (ePurchaseEnum == g_PURCHASE_UNIT_FAITH) then
		eOrder = OrderTypes.ORDER_TRAIN;
		eYield = YieldTypes.YIELD_FAITH;
		elseif (ePurchaseEnum == g_PURCHASE_BUILDING_FAITH) then
		eOrder = OrderTypes.ORDER_CONSTRUCT;
		eYield = YieldTypes.YIELD_FAITH;
		elseif (ePurchaseEnum == g_PURCHASE_PROJECT_FAITH) then
		eOrder = OrderTypes.ORDER_CREATE;
		eYield = YieldTypes.YIELD_FAITH;
		elseif (ePurchaseEnum == g_CONSTRUCT_UNIT) then
		eOrder = OrderTypes.ORDER_TRAIN;
		elseif (ePurchaseEnum == g_CONSTRUCT_BUILDING) then
		eOrder = OrderTypes.ORDER_CONSTRUCT;
		elseif (ePurchaseEnum == g_CONSTRUCT_PROJECT) then
		eOrder = OrderTypes.ORDER_CREATE;
		elseif (ePurchaseEnum == g_MAINTAIN_PROCESS) then
		eOrder = OrderTypes.ORDER_MAINTAIN;
		end
	end
	
    local city = GetCurrentCity();
    
    if (city == nil) then
		OnClose();
		return;
	end
    
    if g_IsProductionMode then
		Game.CityPushOrder(city, eOrder, iData, false, not g_append, true);
    else
		--print("TESTING ORDER " .. eOrder);
		if (eOrder == OrderTypes.ORDER_TRAIN) then
			if isSlave then
				LuaEvents.JFD_CityPurchasedSlaveUnit(city:GetOwner(), city, iData, JFD_GetShackleCost(city:GetOwner(), iData))
			elseif isLevy then
				LuaEvents.JFD_CityPurchasedLevyUnit(city:GetOwner(), city, iData, JFD_GetLevyCost(city:GetOwner(), iData))
			else
				if (city:IsCanPurchase(true, true, iData, -1, -1, eYield)) then
					Game.CityPurchaseUnit(city, iData, eYield);
				end
			end
		elseif (eOrder == OrderTypes.ORDER_CONSTRUCT) then
			if isMagistrate then
				LuaEvents.JFD_CityPurchasedMagistrateBuilding(city:GetOwner(), city, iData, JFD_GetMagistrateCost(city:GetOwner(), iData))
				Events.SerialEventCityInfoDirty()
			else
				if (city:IsCanPurchase(true, true, -1, iData, -1, eYield)) then
					Game.CityPurchaseBuilding(city, iData, eYield);
					Events.SerialEventCityInfoDirty()
				end
			end
		elseif (eOrder == OrderTypes.ORDER_CREATE) then
			if (city:IsCanPurchase(true, true, -1, -1, iData, eYield)) then
				Game.CityPurchaseProject(city, iData, eYield);
			end
		end
		
		if (eOrder == OrderTypes.ORDER_TRAIN or eOrder == OrderTypes.ORDER_CONSTRUCT or eOrder == OrderTypes.ORDER_CREATE) then
			if isMagistrate then -- JFD Colonies
				Events.AudioPlay2DSound("AS2D_SOUND_JFD_MAGISTRATE");
			elseif isSlave then -- JFD Slavery
				Events.AudioPlay2DSound("AS2D_SOUND_JFD_SLAVERY");
			elseif isLevy then -- JFD Provinces
				Events.AudioPlay2DSound("AS2D_SOUND_JFD_LEVIES");
			else
				if (eYield == YieldTypes.YIELD_GOLD) then
					Events.AudioPlay2DSound("AS2D_INTERFACE_CITY_SCREEN_PURCHASE");
				elseif (eYield == YieldTypes.YIELD_FAITH) then
					Events.AudioPlay2DSound("AS2D_INTERFACE_FAITH_PURCHASE");
				end
			end
		end
    end
     
	local cityID = city:GetID();
	local player = city:GetOwner();
    Events.SpecificCityInfoDirty( player, cityID, CityUpdateTypes.CITY_UPDATE_TYPE_BANNER);
    Events.SpecificCityInfoDirty( player, cityID, CityUpdateTypes.CITY_UPDATE_TYPE_PRODUCTION);
 
	--JFD Only close production list after each choice
	if not g_append and g_IsProductionMode then 
		OnClose();
	end
	-- if not g_append or not g_IsProductionMode then 
		-- OnClose();
	-- end
end

-------------------------------------------------
-------------------------------------------------
function OnCityButton( x, y )
    OnClose();
    UI.DoSelectCityAtPlot( Map.GetPlot( x, y ) );
end
Controls.CityButton:RegisterCallback( Mouse.eLClick, OnCityButton );

-------------------------------------------------
-------------------------------------------------
local buildingHeadingOpen = true;
local magistrateHeadingOpen = true; -- JFD Colonies
local slaveHeadingOpen = true; -- JFD Slavery
local levyHeadingOpen = true; -- JFD Provinces
local unitHeadingOpen = true;
local nationalWonderHeadingOpen = true;
local wonderHeadingOpen = true;
local otherHeadingOpen = true;

function OnBuildingHeaderSelected()
	buildingHeadingOpen = not buildingHeadingOpen;
	UpdateWindow( GetCurrentCity() );
end

function OnMagistratesHeaderSelected()
	magistrateHeadingOpen = not magistrateHeadingOpen;
	UpdateWindow( GetCurrentCity() );
end

function OnSlaveHeaderSelected()
	slaveHeadingOpen = not slaveHeadingOpen;
	UpdateWindow( GetCurrentCity() );
end

function OnLevyHeaderSelected()
	levyHeadingOpen = not levyHeadingOpen;
	UpdateWindow( GetCurrentCity() );
end


function OnUnitHeaderSelected()
	unitHeadingOpen = not unitHeadingOpen;
	UpdateWindow( GetCurrentCity() );
end

function OnNationalWonderHeaderSelected()
	nationalWonderHeadingOpen = not nationalWonderHeadingOpen;
	UpdateWindow( GetCurrentCity() );
end

function OnWonderHeaderSelected()
	wonderHeadingOpen = not wonderHeadingOpen;
	UpdateWindow( GetCurrentCity() );
end

function OnOtherHeaderSelected()
	otherHeadingOpen = not otherHeadingOpen;
	UpdateWindow( GetCurrentCity() );
end


function UpdateWindow( city )
    g_SlaveInstanceManager:ResetInstances(); -- JFD Slavery
    g_LevyInstanceManager:ResetInstances(); -- JFD Provinces
    g_UnitInstanceManager:ResetInstances();
    g_BuildingInstanceManager:ResetInstances();
    g_NationalWonderInstanceManager:ResetInstances();
    g_WonderInstanceManager:ResetInstances();
    g_ProcessInstanceManager:ResetInstances();
    
    if city == nil then
		city = UI.GetHeadSelectedCity();
    end

    if city == nil then
		OnClose();
		return;
    end
   
	local qMode = g_append and g_IsProductionMode;
 
	if qMode then
		local qLength = city:GetOrderQueueLength();
		if qLength >= 6 then
			OnClose();
		end
		
		local queuedOrderType;
		local queuedData1;
		local queuedData2;
		local queuedSave;
		local queuedRush;

		local isMaint = false;
		for i = 1, qLength do
			queuedOrderType, queuedData1, queuedData2, queuedSave, queuedRush = city:GetOrderFromQueue( i-1 );
			if (queuedOrderType == OrderTypes.ORDER_MAINTAIN) then
				isMaint = true;
				break;
			end
		end
		
		if isMaint then
			OnClose();
		end
	end
    
    if( g_IsProductionMode ) then
        Controls.PurchaseButton:SetDisabled(false)
	    Controls.PurchaseIcon:SetText( "" );
        Controls.PurchaseString:LocalizeAndSetText( "TXT_KEY_CITYVIEW_PURCHASE_BUTTON" );
        Controls.PurchaseButton:LocalizeAndSetToolTip( "TXT_KEY_CITYVIEW_PURCHASE_TT" );
    else
		--JFD Colonies
		if JFD_IsCityColony(city) then
			Controls.PurchaseButton:SetDisabled(true)
		else
			Controls.PurchaseButton:SetDisabled(false)
		end
        Controls.PurchaseIcon:SetText( "[ICON_PRODUCTION]" );
        Controls.PurchaseString:LocalizeAndSetText( "TXT_KEY_CITYVIEW_PRODUCE_BUTTON" );
        --Controls.PurchaseString:LocalizeAndSetText( "TXT_KEY_CITYVIEW_QUEUE_PROD" );
        
        if( g_append ) then
            Controls.PurchaseButton:LocalizeAndSetToolTip( "TXT_KEY_CITYVIEW_QUEUE_PROD_TT" );
        else
            Controls.PurchaseButton:LocalizeAndSetToolTip( "TXT_KEY_CITYVIEW_CHOOSE_PROD_TT" );
        end
        
        
    end
    
    local player = Players[Game.GetActivePlayer()];
    local cityID = city:GetID();
    
    local selectedCity = UI.GetHeadSelectedCity();
    local selectedCityID = selectedCity and selectedCity:GetID() or -1;
	
	Game.SetAdvisorRecommenderCity(city);

	-- Should we pan to this city?
	if(cityID ~= selectedCityID) then
		local plot = city:Plot();
		UI.LookAt(plot, 0);
	end
   
    g_currentCityID = city:GetID();
    g_currentCityOwnerID = city:GetOwner();
 		
    -- City Detail info
    Controls.CityName:SetText( city:GetName() );
    
    local cityPopulation = city:GetPopulation();
    Controls.Population:SetText( cityPopulation );
    Controls.PopulationSuffix:LocalizeAndSetText("TXT_KEY_CITYVIEW_CITIZENS_TEXT", cityPopulation);
    
    local productionYield = city:GetYieldRate(YieldTypes.YIELD_PRODUCTION);
    local productionPerTurn = math.floor(productionYield + (productionYield * (city:GetProductionModifier() / 100)));
    
    local scienceYield = city:GetYieldRate(YieldTypes.YIELD_SCIENCE);
    if (Game.IsOption(GameOptionTypes.GAMEOPTION_NO_SCIENCE)) then
		scienceYield = 0;
	end
    
	Controls.GrowthBar:SetPercent( city:GetFood() / city:GrowthThreshold() );
    Controls.Food:SetText( "[ICON_FOOD]" .. city:FoodDifference() );
    Controls.Production:SetText( "[ICON_PRODUCTION]" .. productionPerTurn );
    Controls.Science:SetText( "[ICON_RESEARCH]" ..  scienceYield);
    Controls.Gold:SetText( "[ICON_GOLD]" .. city:GetYieldRate( YieldTypes.YIELD_GOLD ) );
    Controls.Culture:SetText( "[ICON_CULTURE]" .. city:GetJONSCulturePerTurn() );
	Controls.Faith:SetText( "[ICON_PEACE]" .. city:GetFaithPerTurn() );
	--BEGIN JFD	
	--JFD Health
	if userSettingHealthCore then
		local excessHealth, excessDisease = JFD_GetExcessHealth(g_currentCityOwnerID, city, true)
		if excessHealth >= excessDisease then
			Controls.Health:SetText( "[ICON_JFD_HEALTH][COLOR_JFD_HEALTH]" .. excessHealth .. "[ENDCOLOR]" );
		else
			Controls.Health:SetText( "[ICON_JFD_DISEASE][COLOR_JFD_DISEASE]" .. excessDisease .. "[ENDCOLOR]" );
		end
		Controls.Health:LocalizeAndSetToolTip( JFD_GetHealthTT(g_currentCityOwnerID, city) );	
	else
		Controls.Health:SetText( "[COLOR_WHITE][ICON_STRENGTH]" .. city:GetStrengthValue()/100 .. "[ENDCOLOR]" );
	end
	--JFD Happiness
	if userSettingHappinessCore then
		local excessHappiness, excessUnhappiness = JFD_GetExcessHappiness(g_currentCityOwnerID, city, true)
		if excessHappiness >= excessUnhappiness then
			Controls.Happiness:SetText( "[ICON_HAPPINESS_1][COLOR_JFD_HAPPINESS]" .. excessHappiness .. "[ENDCOLOR]" );
		else
			Controls.Happiness:SetText( "[ICON_HAPPINESS_4][COLOR_JFD_UNHAPPINESS]" .. excessUnhappiness .. "[ENDCOLOR]" );
		end
		Controls.Happiness:LocalizeAndSetToolTip( JFD_GetHappinessTT(g_currentCityOwnerID, city) );	
	else
		Controls.Happiness:SetText( "[ICON_HAPPINESS_1][COLOR_JFD_HAPPINESS]" .. city:GetLocalHappiness() .. "[ENDCOLOR]" );
		if isUsingCBP then
			Controls.Happiness:LocalizeAndSetToolTip( GetCityHappinessTooltip(city) );
		end
	end
	--JFD Crimes
	if userSettingCrimeCore then
		Controls.Crime:SetText( "[ICON_JFD_CRIME_BLACK][COLOR_JFD_CRIME_BLACK]" .. JFD_Round(JFD_GetCrimeTotal(g_currentCityOwnerID, city)) .. "[ENDCOLOR]" );
		Controls.Crime:LocalizeAndSetToolTip( JFD_GetCrimeBreakdownTT(g_currentCityOwnerID, city) );
	else
		Controls.Crime:SetText( "[ICON_TOURISM]" .. city:GetBaseTourism().. "" );
		Controls.Crime:LocalizeAndSetToolTip( GetTourismTooltip(city));
	end
    Controls.CityButton:SetVoids( city:GetX(), city:GetY() );
	--JFD Loyalty
	if userSettingLoyaltyCore then
		local loyaltyID, loyaltyPercent, loyaltyTT = JFD_CalculateCityLoyalty(g_currentCityOwnerID, city, true)
		local loyalty = GameInfo.JFD_Loyalties[loyaltyID]
		Controls.Loyalty:SetText( loyalty.IconString );
		Controls.Loyalty:LocalizeAndSetToolTip("TXT_KEY_JFD_CITYVIEW_LOYALTY_TT", loyaltyTT, loyalty.IconString, loyalty.TextColour, loyaltyPercent)
	else
		Controls.Loyalty:SetHide(true)
	end
	--END JFD	

	local cityGrowth = city:GetFoodTurnsLeft();			
	if (city:IsFoodProduction() or city:FoodDifferenceTimes100() == 0) then
		Controls.CityGrowthLabel:SetText(Locale.ConvertTextKey("TXT_KEY_CITYVIEW_STAGNATION_TEXT"));
	elseif city:FoodDifference() < 0 then
		Controls.CityGrowthLabel:SetText(Locale.ConvertTextKey("TXT_KEY_CITYVIEW_STARVATION_TEXT"));
	else
		Controls.CityGrowthLabel:SetText(Locale.ConvertTextKey("TXT_KEY_CITYVIEW_TURNS_TILL_CITIZEN_TEXT", cityGrowth));
	end

	-- Yield (and Culture) Tooltips
	local strFoodToolTip = GetFoodTooltip(city);
	Controls.PopBox:SetToolTipString(strFoodToolTip);
	Controls.Food:SetToolTipString(strFoodToolTip);
	
	local strProductionToolTip = GetProductionTooltip(city);
	Controls.Production:SetToolTipString(strProductionToolTip);
	
	local strGoldToolTip = GetGoldTooltip(city);
	Controls.Gold:SetToolTipString(strGoldToolTip);
	
	local strScienceToolTip = GetScienceTooltip(city);
	Controls.Science:SetToolTipString(strScienceToolTip);
	
	local strCultureToolTip = GetCultureTooltip(city);
	Controls.Culture:SetToolTipString(strCultureToolTip);
	
	local strFaithToolTip = GetFaithTooltip(city);
	Controls.Faith:SetToolTipString(strFaithToolTip);
   
	local ourCiv = player:GetCivilizationType();
    local ourCivCiv = GameInfo.Civilizations[ourCiv];
 	IconHookup( ourCivCiv.PortraitIndex, 32, ourCivCiv.IconAtlas, Controls.CivIcon );                    
            
	local strTurnsLeft = g_strInfiniteTurns;
	
	local bGeneratingProduction = false;
	if (city:GetCurrentProductionDifferenceTimes100(false, false) > 0) then
		bGeneratingProduction = true;
	end
	
	listOfStrings = {};
	
	local listWonders = {};
	local listNationalWonders = {};
	local listMagistrates = {}; -- JFD Colonies
	local listSlaves = {}; -- JFD Slavery
	local listLevies = {}; -- JFD Provinces
	local listUnits = {};
	local listBuildings = {};
	
	
	local eraIDs = {};
	local erasByTech = {};
	
	for row in GameInfo.Eras() do
		eraIDs[row.Type] = row.ID;
	end
	
	for row in GameInfo.Technologies() do
		erasByTech[row.Type] =  (eraIDs[row.Era] + 10);
	end
	
	function GetUnitSortPriority(unitInfo)
		local eraPriority = 0;
		if(unitInfo.PrereqTech ~= nil) then
			eraPriority = erasByTech[unitInfo.PrereqTech];
		end
	
		if(unitInfo.CivilianAttackPriority ~= nil) then
			if(unitInfo.Domain == "DOMAIN_LAND") then
				return eraPriority;
			else
				return eraPriority + 1000;
			end
		else
			if(unitInfo.Domain == "DOMAIN_LAND") then
				return eraPriority + 2000;
			else
				return eraPriority + 3000;
			end
		end	
	end
		
	function GetBuildingSortPriority(buildingInfo)
		--print("TESTING Building sort");
		--print("TESTING " .. buildingInfo);
		if(buildingInfo.PrereqTech ~= nil) then
			return erasByTech[buildingInfo.PrereqTech];
		else
			return 0;
		end
	end
	
    -- Units
	local canLevyPurchase = JFD_CanPurchaseLevies(g_currentCityOwnerID, city)
	local canSlavePurchase = JFD_CanPurchaseSlaves(g_currentCityOwnerID)
	for unit in GameInfo.Units() do
 		local unitID = unit.ID;
 		if g_IsProductionMode then
 			-- test w/ visible (ie COULD train if ... )
			if city:CanTrain( unitID, 0, 1 ) then
				local isDisabled = false;
     			-- test w/o visible (ie can train right now)
     			local iIsCurrentlyBuilding = 0;
     			if (city:GetProductionUnit() == eUnit) then
     				iIsCurrentlyBuilding = 1;
     			end
     			
    			if not city:CanTrain(unitID, iIsCurrentlyBuilding) then
    				isDisabled = true;
				end
				
				if (bGeneratingProduction) then
					local iProductionTurns = JFD_GetUnitProductionTurnsLeft(city:GetOwner(), city, unitID) -- JFD Happiness
					strTurnsLeft = Locale.ConvertTextKey( "TXT_KEY_STR_TURNS", iProductionTurns);
				else
					strTurnsLeft = g_strInfiniteTurns;
				end
				
				table.insert(listUnits, {
					ID = unitID,
					Description = unit.Description,
					DisplayDescription = Locale.Lookup(unit.Description),
					OrderType = OrderTypes.ORDER_TRAIN,
					Cost = strTurnsLeft,
					Disabled = isDisabled,
					YieldType = YieldTypes.NO_YIELD,
					SortPriority = GetUnitSortPriority(unit)
				});
			end
 		else
			if city:IsCanPurchase(false, false, unitID, -1, -1, YieldTypes.YIELD_GOLD) then
 				local isDisabled = false;
     			-- test w/o visible (ie can train right now)
	     	
    			if (not city:IsCanPurchase(true, true, unitID, -1, -1, YieldTypes.YIELD_GOLD)) then
    				isDisabled = true;
				end
	 			
 				local cost = city:GetUnitPurchaseCost( unitID );
 				
 				table.insert(listUnits, {
 					ID = unitID,
 					Description = unit.Description,
 					DisplayDescription = Locale.Lookup(unit.Description),
 					OrderType = OrderTypes.ORDER_TRAIN,
 					Cost = cost,
 					Disabled = isDisabled,
 					YieldType = YieldTypes.YIELD_GOLD,
 					SortPriority = GetUnitSortPriority(unit)
 				});
 			end
			if city:IsCanPurchase(false, false, unitID, -1, -1, YieldTypes.YIELD_FAITH) then
 				local isDisabled = false;
     			-- test w/o visible (ie can train right now)
	     	
    			if (not city:IsCanPurchase(true, true, unitID, -1, -1, YieldTypes.YIELD_FAITH)) then
    				isDisabled = true;
				end
	 			
 				local cost = city:GetUnitFaithPurchaseCost( unitID, true );
				table.insert(listUnits, {
					ID = unitID,
					Description = unit.Description,
					DisplayDescription = Locale.Lookup(unit.Description),
					OrderType = OrderTypes.ORDER_TRAIN,
					Cost = cost,
					Disabled = isDisabled,
					YieldType = YieldTypes.YIELD_FAITH,
					SortPriority = GetUnitSortPriority(unit)
				});
			end
			--JFD Levies
			if canLevyPurchase then
				local levyCost = JFD_GetLevyCost(g_currentCityOwnerID, unitID)
				if (city:CanTrain( unitID, 0, 1 ) and levyCost > 0) then
					local isDisabled = false;
					-- test w/o visible (ie can train right now)
				
					if (city:GetPopulation() < GameDefines["JFD_PROVINCES_LEVY_MIN_POP"] or city:GetGarrisonedUnit() or city:GetResistanceTurns() > 0) then
						isDisabled = true;
					end
					
					local cost = levyCost;
					table.insert(listLevies, {
						ID = unitID,
						Description = unit.Description,
						DisplayDescription = Locale.Lookup(unit.Description),
						OrderType = OrderTypes.ORDER_TRAIN,
						Cost = cost,
						Disabled = isDisabled,
						YieldType = YieldTypes.NO_YIELD,
						SortPriority = GetUnitSortPriority(unit)
					});
				end
			end
			--JFD Slavery
			if (canSlavePurchase and unit.ShackleCost > 0) then
				local slaveCost = JFD_GetShackleCost(g_currentCityOwnerID, unitID)
				if ((city:CanTrain( unitID, 0, 1 ) or JFD_IsPurchaseOnlySlave(g_currentCityOwnerID, unit)) and slaveCost > 0) then
					local isDisabled = false;
					-- test w/o visible (ie can train right now)
				
					if JFD_GetNumShackles(g_currentCityOwnerID) < slaveCost then
						isDisabled = true;
					end
					if (not city:CanTrain( unitID, 0 )) then
						isDisabled = true;
					end
					
					local cost = slaveCost;
					table.insert(listSlaves, {
						ID = unitID,
						Description = unit.Description,
						DisplayDescription = Locale.Lookup(unit.Description),
						OrderType = OrderTypes.ORDER_TRAIN,
						Cost = cost,
						Disabled = isDisabled,
						YieldType = YieldTypes.NO_YIELD,
						SortPriority = GetUnitSortPriority(unit)
					});
				end
			end
 		end
	end


    -- Projects	
 	for project in GameInfo.Projects() do
 		local projectID = project.ID;
 	 	if g_IsProductionMode then
 	 	 	-- test w/ visible (ie COULD train if ... )
			if city:CanCreate( projectID, 0, 1 ) then
				local isDisabled = false;
			    
     			-- test w/o visible (ie can train right now)
    			if( not city:CanCreate( projectID ) )
    			then
    				isDisabled = true;
				end
				
				if (bGeneratingProduction) then
					local iProductionTurns = JFD_GetProjectProductionTurnsLeft(city:GetOwner(), city, projectID)  -- JFD Happiness
					strTurnsLeft = Locale.ConvertTextKey( "TXT_KEY_STR_TURNS", iProductionTurns);
				else
					strTurnsLeft = g_strInfiniteTurns;
				end
				
				table.insert(listWonders, {
					ID = projectID,
					Description = project.Description,
					DisplayDescription = Locale.Lookup(project.Description),
					OrderType = OrderTypes.ORDER_CREATE,
					Cost = strTurnsLeft,
					Disabled = isDisabled,
					YieldType = YieldTypes.NO_YIELD,
				});
			end
		else
			if city:IsCanPurchase(false, false, -1, -1, projectID, YieldTypes.YIELD_GOLD) then
				local isDisabled = true;		    
 				local cost = city:GetProjectPurchaseCost( projectID );
 				
 				table.insert(listWonders, {
 					ID = projectID,
 					Description = project.Description,
 					DisplayDescription = Locale.Lookup(project.Description),
 					OrderType = OrderTypes.ORDER_CREATE,
 					Cost = cost,
 					Disabled = isDisabled,
 					YieldType = YieldTypes.YIELD_GOLD,
 				});
			end
		end
	end
	
    -- Buildings	
		--print("TESTING Building sort");
	local canMagistratePurchase = JFD_CanMagistratePurchase(g_currentCityOwnerID, city) -- JFD ColoniesbuildingInfo
 	for building in GameInfo.Buildings() do
 		local buildingID = building.ID;
		----print("TESTING id " .. buildingID);
 		if g_IsProductionMode then
		--print("TESTING mode true");
			-- WHOWARD MOD - change this to allow for national wonders after the tech is obtained
 			-- test w/ visible (ie COULD train if ... )
			if CouldConstruct(city, buildingID) then
		--print("TESTING construct true");
				local isDisabled = false;
			    
     			-- test w/o visible (ie can train right now)
    			if not city:CanConstruct( buildingID ) then
    				isDisabled = true;
				end

				local col = 2;
				local thisBuildingClass = GameInfo.BuildingClasses[building.BuildingClass];
				if thisBuildingClass.MaxGlobalInstances > 0 then
					col = 3;
				elseif thisBuildingClass.MaxPlayerInstances >= 1 or thisBuildingClass.MaxTeamInstances > 0 then
					col = 8;
				end
				
				if (bGeneratingProduction) then
					local iProductionTurns = JFD_GetBuildingProductionTurnsLeft(city:GetOwner(), city, buildingID) -- JFD Happiness
					strTurnsLeft = Locale.ConvertTextKey( "TXT_KEY_STR_TURNS", iProductionTurns);
				else
					strTurnsLeft = g_strInfiniteTurns;
				end
				local building = {
					ID = buildingID,
					Description = building.Description,
					DisplayDescription = Locale.Lookup(building.Description),
					OrderType = OrderTypes.ORDER_CONSTRUCT,
					Cost = strTurnsLeft,
					Disabled = isDisabled,
					YieldType = YieldTypes.NO_YIELD,
					SortPriority = GetBuildingSortPriority(building)
				};
				
				if col == 2 then
					table.insert(listBuildings, building);
				elseif col == 8 then
					table.insert(listNationalWonders, building);
				else
					table.insert(listWonders, building);
				end
			end
		--print("TESTING construct end");
		else
		--print("TESTING mode false");
			if city:IsCanPurchase(false, false, -1, buildingID, -1, YieldTypes.YIELD_GOLD) then
				local col = 2;
				local thisBuildingClass = GameInfo.BuildingClasses[building.BuildingClass];
				if thisBuildingClass.MaxGlobalInstances > 0 then
					col = 3;
				elseif thisBuildingClass.MaxPlayerInstances >= 1 or thisBuildingClass.MaxTeamInstances > 0 then
					col = 8;
				end

 				local isDisabled = false;
    			if (not city:IsCanPurchase(true, true, -1, buildingID, -1, YieldTypes.YIELD_GOLD)) then
 					isDisabled = true;
 				end
				
				local cost = city:GetBuildingPurchaseCost( buildingID );
				local building = {
					ID = buildingID,
					Description = building.Description,
					DisplayDescription = Locale.Lookup(building.Description),
					OrderType = OrderTypes.ORDER_CONSTRUCT,
					Cost = cost,
					Disabled = isDisabled,
					YieldType = YieldTypes.YIELD_GOLD,
					SortPriority = GetBuildingSortPriority(building)
				};
				if col == 2 then
					table.insert(listBuildings, building);
				elseif col == 8 then
					table.insert(listNationalWonders, building);
				else
					table.insert(listWonders, building);
				end
				-- JFD Colonies				
				if canMagistratePurchase then
					local magistrateCost = JFD_GetMagistrateCost(g_currentCityOwnerID, buildingID);
					if JFD_GetNumMagistrates(g_currentCityOwnerID) < magistrateCost then
						isDisabled = true;
					else
						isDisabled = false
					end
					table.insert(listMagistrates, {
						ID = buildingID,
						Description = building.Description,
						DisplayDescription = Locale.Lookup(building.Description),
						OrderType = OrderTypes.ORDER_CONSTRUCT,
						Cost = magistrateCost,
						Disabled = isDisabled,
						YieldType = YieldTypes.NO_YIELD,
						SortPriority = GetBuildingSortPriority(building)
					});
				end
			end
			if city:IsCanPurchase(false, false, -1, buildingID, -1, YieldTypes.YIELD_FAITH) then
				local col = 2;
				local thisBuildingClass = GameInfo.BuildingClasses[building.BuildingClass];
				if thisBuildingClass.MaxGlobalInstances > 0 then
					col = 3;
				elseif thisBuildingClass.MaxPlayerInstances >= 1 or thisBuildingClass.MaxTeamInstances > 0 then
					col = 8;
				end

 				local isDisabled = false;
    			if (not city:IsCanPurchase(true, true, -1, buildingID, -1, YieldTypes.YIELD_FAITH)) then
 					isDisabled = true;
 				end
	 			
 				local cost = city:GetBuildingFaithPurchaseCost( buildingID );
				
				local building = {
					ID = buildingID,
					Description = building.Description,
					DisplayDescription = Locale.Lookup(building.Description),
					OrderType = OrderTypes.ORDER_CONSTRUCT,
					Cost = cost,
					Disabled = isDisabled,
					YieldType = YieldTypes.YIELD_FAITH,
					SortPriority = GetBuildingSortPriority(building)
				};
				
				if col == 2 then
					table.insert(listBuildings, building);
				elseif col == 8 then
					table.insert(listNationalWonders, building);
				else
					table.insert(listWonders, building);
				end
			end
		end
	end
	
	local GenericSort = function(a,b)
		local aSort = a.SortPriority or 0;
		local bSort = b.SortPriority or 0;
	
		if(aSort == bSort) then
			local comp = Locale.Compare(a.DisplayDescription, b.DisplayDescription);
			if(comp == 0) then
				local aYT = a.YieldType == YieldTypes.YIELD_FAITH and 1 or 0;
				local bYT = b.YieldType == YieldTypes.YIELD_FAITH and 1 or 0;
				
				return aYT < bYT;
			else
				return comp == -1;
			end
		else
			return aSort < bSort;
		end	
	end
	
	numMagistrateButtons = #listMagistrates; -- JFD Colonies
	numSlaveButtons = #listSlaves; -- JFD Slavery
	numLevyButtons = #listLevies; -- JFD Provinces
	numUnitButtons = #listUnits;
	numBuildingButtons = #listBuildings;
	numNationalWonderButtons = #listNationalWonders;
	numWonderButtons = #listWonders;
	
	table.sort(listMagistrates, GenericSort); -- JFD Colonies
	table.sort(listSlaves, GenericSort); -- JFD Slavery
	table.sort(listLevies, GenericSort); -- JFD provinces
	table.sort(listUnits, GenericSort);
	table.sort(listBuildings, GenericSort);
	table.sort(listNationalWonders, GenericSort);
	table.sort(listWonders, GenericSort);
	
	-- JFD Colonies
	for _, magistrate in ipairs(listMagistrates) do
		AddProductionButton(magistrate.ID, magistrate.Description, magistrate.OrderType, magistrate.Cost, 7, magistrate.Disabled, magistrate.YieldType, false, false, true); -- JFD Magistrate
	end
	-- JFD Slavery
	for _, slave in ipairs(listSlaves) do
		AddProductionButton(slave.ID, slave.Description, slave.OrderType, slave.Cost, 5, slave.Disabled, slave.YieldType, true, false, false); -- JFD Slavery
	end
	-- JFD Provinces
	for _, levy in ipairs(listLevies) do
		AddProductionButton(levy.ID, levy.Description, levy.OrderType, levy.Cost, 6, levy.Disabled, levy.YieldType, false, true, false); -- JFD Provinces
	end
	for _, unit in ipairs(listUnits) do
		AddProductionButton(unit.ID, unit.Description, unit.OrderType, unit.Cost, 1, unit.Disabled, unit.YieldType); 
	end
	for _, building in ipairs(listBuildings) do
		AddProductionButton(building.ID, building.Description, building.OrderType, building.Cost, 2, building.Disabled, building.YieldType);
	end
	for _ , nationalWonder in ipairs(listNationalWonders) do
		AddProductionButton(nationalWonder.ID, nationalWonder.Description, nationalWonder.OrderType, nationalWonder.Cost, 8, nationalWonder.Disabled, nationalWonder.YieldType);
	end
	for _ , wonder in ipairs(listWonders) do
		AddProductionButton(wonder.ID, wonder.Description, wonder.OrderType, wonder.Cost, 3, wonder.Disabled, wonder.YieldType);
	end
	
	-- JFD Slavery
	if userSettingSlaveryCore then
		if slaveHeadingOpen then
			local localizedLabel = "[ICON_MINUS] "..Locale.ConvertTextKey( "TXT_KEY_POP_SLAVES" );
			Controls.SlaveButtonLabel:SetText(localizedLabel);
			Controls.SlaveButtonStack:SetHide( false );
		else
			local localizedLabel = "[ICON_PLUS] "..Locale.ConvertTextKey( "TXT_KEY_POP_SLAVES" );
			Controls.SlaveButtonLabel:SetText(localizedLabel);
			Controls.SlaveButtonStack:SetHide( true );
		end
		if numSlaveButtons > 0 then
			Controls.SlaveButton:SetHide( false );
		else
			Controls.SlaveButton:SetHide( true );
			Controls.SlaveButton:SetHide( true );
		end
		Controls.SlaveButton:RegisterCallback( Mouse.eLClick, OnSlaveHeaderSelected );
	else
		Controls.SlaveButton:SetHide(true)
	end	
	
	-- JFD Provinces
	if userSettingProvincesCoreLevies then
		if levyHeadingOpen then
			local localizedLabel = "[ICON_MINUS] "..Locale.ConvertTextKey( "TXT_KEY_POP_LEVIES" );
			Controls.LevyButtonLabel:SetText(localizedLabel);
			Controls.LevyButtonStack:SetHide( false );
		else
			local localizedLabel = "[ICON_PLUS] "..Locale.ConvertTextKey( "TXT_KEY_POP_LEVIES" );
			Controls.LevyButtonLabel:SetText(localizedLabel);
			Controls.LevyButtonStack:SetHide( true );
		end
		if numLevyButtons > 0 then
			Controls.LevyButton:SetHide( false );
		else
			Controls.LevyButton:SetHide( true );
			Controls.LevyButton:SetHide( true );
		end
		Controls.LevyButton:RegisterCallback( Mouse.eLClick, OnLevyHeaderSelected );
	else
		Controls.LevyButton:SetHide(true)
	end	
	
	if unitHeadingOpen then
		local localizedLabel = "[ICON_MINUS] "..Locale.ConvertTextKey( "TXT_KEY_POP_UNITS" );
		Controls.UnitButtonLabel:SetText(localizedLabel);
		Controls.UnitButtonStack:SetHide( false );
	else
		local localizedLabel = "[ICON_PLUS] "..Locale.ConvertTextKey( "TXT_KEY_POP_UNITS" );
		Controls.UnitButtonLabel:SetText(localizedLabel);
		Controls.UnitButtonStack:SetHide( true );
	end
	if numUnitButtons > 0 then
		Controls.UnitButton:SetHide( false );
	else
		Controls.UnitButton:SetHide( true );
		Controls.UnitButton:SetHide( true );
	end
	Controls.UnitButton:RegisterCallback( Mouse.eLClick, OnUnitHeaderSelected );
	
	if buildingHeadingOpen then
		local localizedLabel = "[ICON_MINUS] "..Locale.ConvertTextKey( "TXT_KEY_POP_BUILDINGS" );
		Controls.BuildingsButtonLabel:SetText(localizedLabel);
		Controls.BuildingButtonStack:SetHide( false );
	else
		local localizedLabel = "[ICON_PLUS] "..Locale.ConvertTextKey( "TXT_KEY_POP_BUILDINGS" );
		Controls.BuildingsButtonLabel:SetText(localizedLabel);
		Controls.BuildingButtonStack:SetHide( true );
	end
	if numBuildingButtons > 0 then
		Controls.BuildingsButton:SetHide( false );
	else
		Controls.BuildingsButton:SetHide( true );
		Controls.BuildingsButton:SetHide( true );
	end
	Controls.BuildingsButton:RegisterCallback( Mouse.eLClick, OnBuildingHeaderSelected );
	
	if nationalWonderHeadingOpen then
		local localizedLabel = "[ICON_MINUS] "..Locale.ConvertTextKey( "TXT_KEY_POP_NATIONAL_WONDERS" );
		Controls.NationalWondersButtonLabel:SetText(localizedLabel);
		Controls.NationalWonderButtonStack:SetHide( false );
	else
		local localizedLabel = "[ICON_PLUS] "..Locale.ConvertTextKey( "TXT_KEY_POP_NATIONAL_WONDERS" );
		Controls.NationalWondersButtonLabel:SetText(localizedLabel);
		Controls.NationalWonderButtonStack:SetHide( true );
	end
	if numNationalWonderButtons > 0 then
		Controls.NationalWondersButton:SetHide( false );
	else
		Controls.NationalWondersButton:SetHide( true );
		Controls.NationalWondersButton:SetHide( true );
	end
	Controls.NationalWondersButton:RegisterCallback( Mouse.eLClick, OnNationalWonderHeaderSelected );
	
	if wonderHeadingOpen then
		local localizedLabel = "[ICON_MINUS] "..Locale.ConvertTextKey( "TXT_KEY_POP_WONDERS" );
		Controls.WondersButtonLabel:SetText(localizedLabel);
		Controls.WonderButtonStack:SetHide( false );
	else
		local localizedLabel = "[ICON_PLUS] "..Locale.ConvertTextKey( "TXT_KEY_POP_WONDERS" );
		Controls.WondersButtonLabel:SetText(localizedLabel);
		Controls.WonderButtonStack:SetHide( true );
	end
	if numWonderButtons > 0 then
		Controls.WondersButton:SetHide( false );
	else
		Controls.WondersButton:SetHide( true );
		Controls.WondersButton:SetHide( true );
	end
	Controls.WondersButton:RegisterCallback( Mouse.eLClick, OnWonderHeaderSelected );
    	
	-- Processes
	local numOtherButtons = 0;
	for process in GameInfo.Processes() do
		local processID = process.ID;
		if g_IsProductionMode then
			if city:CanMaintain( processID ) then
				local isDisabled = false;
				local col = 4;
				strTurnsLeft = g_strInfiniteTurns;
				AddProductionButton( processID, process.Description, OrderTypes.ORDER_MAINTAIN, strTurnsLeft, col, isDisabled, YieldTypes.NO_YIELD );
				numOtherButtons = numOtherButtons + 1;
			end
		else
			-- Processes cannot be purchased
		end
	end
	if otherHeadingOpen then
		local localizedLabel = "[ICON_MINUS] "..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_OTHER" );
		Controls.OtherButtonLabel:SetText(localizedLabel);
		Controls.OtherButtonStack:SetHide( false );
	else
		local localizedLabel = "[ICON_PLUS] "..Locale.ConvertTextKey( "TXT_KEY_CITYVIEW_OTHER" );
		Controls.OtherButtonLabel:SetText(localizedLabel);
		Controls.OtherButtonStack:SetHide( true );
	end
	if numOtherButtons > 0 then
		Controls.OtherButton:SetHide( false );
	else
		Controls.OtherButton:SetHide( true );
	end
	Controls.OtherButton:RegisterCallback( Mouse.eLClick, OnOtherHeaderSelected );
    	   	
	-- Header Text
	
	-------------------------------------------
	-- Item under Production
	-------------------------------------------
	
	local strItemName	;
	local szHelpText = "";
	local unitProduction = -1;
	local buildingProduction = -1;
	local projectProduction = -1;
	local processProduction = -1;
	local noProduction = false;
	
	local bJustFinishedSomething;
	
	-- Didn't just finish something
	if (m_gOrderType == -1 or m_gOrderType > 4) then
		
		bJustFinishedSomething = false;
		
		strItemName = Locale.ConvertTextKey(city:GetProductionNameKey());
		
		-- Description and picture of Item under Production
		unitProduction = city:GetProductionUnit();
		buildingProduction = city:GetProductionBuilding();
		projectProduction = city:GetProductionProject();
		processProduction = city:GetProductionProcess();
		
	-- We just finished something, so show THAT in the bottom left
	else
		
		bJustFinishedSomething = true;
		
		-- Just finished a Unit
		if (m_gOrderType == OrderTypes.ORDER_TRAIN) then
			unitProduction = m_gFinishedItemType;
			strItemName = Locale.ConvertTextKey(GameInfo.Units[unitProduction].Description);
			
		-- Just finished a Building/Wonder
		elseif (m_gOrderType == OrderTypes.ORDER_CONSTRUCT) then
			buildingProduction = m_gFinishedItemType;
			strItemName = Locale.ConvertTextKey(GameInfo.Buildings[buildingProduction].Description);
			
		-- Just finished a Project
		elseif (m_gOrderType == OrderTypes.ORDER_CREATE) then
			projectProduction = m_gFinishedItemType;
			strItemName = Locale.ConvertTextKey(GameInfo.Projects[projectProduction].Description);
			
		-- Don't worry about specialists or processes
		end
		
		strItemName = Locale.ConvertTextKey("TXT_KEY_RESEARCH_FINISHED") .. " " .. strItemName;
		
	end
	
	Controls.ProductionItemName:SetText(strItemName);
	
	local strToolTip = Locale.ConvertTextKey("TXT_KEY_CITYVIEW_PROD_METER_TT");

	if unitProduction ~= -1 then
		local thisUnitInfo = GameInfo.Units[unitProduction];
		szHelpText = Locale.ConvertTextKey(thisUnitInfo.Help);
		local portraitOffset, portraitAtlas = UI.GetUnitPortraitIcon(unitProduction, city:GetOwner());
		if IconHookup( portraitOffset, 128, portraitAtlas, Controls.ProductionPortrait ) then
			Controls.ProductionPortrait:SetHide( false );
			
			-- Info for this thing
			strToolTip = Locale.ConvertTextKey(GetHelpTextForUnit(unitProduction, true, city)) .. "[NEWLINE][NEWLINE]" .. strToolTip;
			
		else
			Controls.ProductionPortrait:SetHide( true );
		end
	elseif buildingProduction ~= -1 then
		local thisBuildingInfo = GameInfo.Buildings[buildingProduction];
		szHelpText = thisBuildingInfo.Help;
		if IconHookup( thisBuildingInfo.PortraitIndex, 128, thisBuildingInfo.IconAtlas, Controls.ProductionPortrait ) then
			Controls.ProductionPortrait:SetHide( false );
			
			-- Info for this thing
			strToolTip = Locale.ConvertTextKey(GetHelpTextForBuilding(buildingProduction, false, false, false, city)) .. "[NEWLINE][NEWLINE]" .. strToolTip;
			
		else
			Controls.ProductionPortrait:SetHide( true );
		end
	elseif projectProduction ~= -1 then
		local thisProjectInfo = GameInfo.Projects[projectProduction];
		szHelpText = thisProjectInfo.Help;
		if IconHookup( thisProjectInfo.PortraitIndex, 128, thisProjectInfo.IconAtlas, Controls.ProductionPortrait ) then
			Controls.ProductionPortrait:SetHide( false );
			
			-- Info for this thing
			strToolTip = Locale.ConvertTextKey(GetHelpTextForProject(projectProduction, true)) .. "[NEWLINE][NEWLINE]" .. strToolTip;
			
		else
			Controls.ProductionPortrait:SetHide( true );
		end
	elseif processProduction ~= -1 then
		local thisProcessInfo = GameInfo.Processes[processProduction];
		szHelpText = thisProcessInfo.Help;
		if IconHookup( thisProcessInfo.PortraitIndex, 128, thisProcessInfo.IconAtlas, Controls.ProductionPortrait ) then
			Controls.ProductionPortrait:SetHide( false );
		else
			Controls.ProductionPortrait:SetHide( true );
		end
	else
		Controls.ProductionPortrait:SetHide(true);
		noProduction = true;
	end
	
	Controls.ProductionPortrait:SetToolTipString( strToolTip );
	
	if (not bJustFinishedSomething) then
		
		-- Production stored and needed
		local iStoredProduction = city:GetProductionTimes100() / 100;
		local iProductionNeeded = city:GetProductionNeeded();
		if (city:IsProductionProcess()) then
			iProductionNeeded = 0;
		end
		
		-- Base Production per turn
		local iProductionPerTurn = city:GetCurrentProductionDifferenceTimes100(false, false) / 100;
		local iProductionModifier = city:GetProductionModifier() + 100;
			
		if userSettingHappinessCore then
			local excessHappiness = JFD_GetExcessHappiness(city:GetOwner(), city)
			local strProductionPerTurn = Locale.ConvertTextKey("TXT_KEY_CITY_SCREEN_PROD_PER_TURN", iProductionPerTurn) .. "[COLOR_WHITE] +[ENDCOLOR] [NEWLINE][COLOR_JFD_HAPPINESS]" .. Locale.ConvertTextKey("TXT_KEY_CITY_SCREEN_JFD_HAPPINESS_PER_TURN", excessHappiness) .. "[ENDCOLOR]"
			Controls.ProductionOutput:SetText(strProductionPerTurn);
		else
			local strProductionPerTurn = Locale.ConvertTextKey("TXT_KEY_CITY_SCREEN_PROD_PER_TURN", iProductionPerTurn);
			Controls.ProductionOutput:SetText(strProductionPerTurn);
		end
		
		-- Progress info for meter
		local iStoredProductionPlusThisTurn = iStoredProduction + iProductionPerTurn;
		
		local fProductionProgressPercent = iStoredProduction / iProductionNeeded;
		local fProductionProgressPlusThisTurnPercent = iStoredProductionPlusThisTurn / iProductionNeeded;
		if (fProductionProgressPlusThisTurnPercent > 1) then
			fProductionProgressPlusThisTurnPercent = 1
		end
		
		Controls.ProductionMeter:SetPercents( fProductionProgressPercent, fProductionProgressPlusThisTurnPercent );
		
		-- Turns left
		local productionTurnsLeft = JFD_GetProductionTurnsLeft(city:GetOwner(), city) -- JFD Happiness
		local strNumTurns;
		
		if productionTurnsLeft > 99 then
			strNumTurns = Locale.ConvertTextKey("TXT_KEY_PRODUCTION_HELP_99PLUS_TURNS");
		else
			strNumTurns = Locale.ConvertTextKey("TXT_KEY_PRODUCTION_HELP_NUM_TURNS", productionTurnsLeft);
		end
			
		local bGeneratingProduction = city:IsProductionProcess() or city:GetCurrentProductionDifferenceTimes100(false, false) == 0;
		
		if (bGeneratingProduction) then
			strNumTurns = "";
		end
		
		-- Indicator for the fact that the empire is very unhappy
		if (player:IsEmpireVeryUnhappy()) then
			strNumTurns = strNumTurns .. " [ICON_HAPPINESS_4]";
		end
		
		if (not bGeneratingProduction) then
			strNumTurns = "(" .. strNumTurns .. ")";
		end
		
		Controls.ProductionTurnsLabel:SetText(strNumTurns);
		Controls.ProductionTurnsLabel:SetHide(false);
		
	-- Just Finished something
	else
		Controls.ProductionOutput:SetText("");
		Controls.ProductionTurnsLabel:SetText("");
		Controls.ProductionTurnsLabel:SetHide(true);
	end
		
	if noProduction then
		Controls.ProductionBox:SetHide(true);
	else
		Controls.ProductionBox:SetHide(false);
	end
      
	if qMode then
		Controls.ProductionBox:SetHide(true);
		
		Controls.b1box:SetHide( true );
		Controls.b2box:SetHide( true );
		Controls.b3box:SetHide( true );
		Controls.b4box:SetHide( true );
		Controls.b5box:SetHide( true );
		Controls.b6box:SetHide( true );
				
		local bGeneratingProduction = city:GetCurrentProductionDifferenceTimes100(false, false) > 0;

		local qLength = city:GetOrderQueueLength();
		for i = 1, qLength do
			local queuedOrderType;
			local queuedData1;
			local queuedData2;
			local queuedSave;
			local queuedRush;
			local buttonPrefix = "b"..tostring(i);
			local controlBox = buttonPrefix.."box";
			local controlName = buttonPrefix.."name";
			local controlTurns = buttonPrefix.."turns";		
			local strToolTip = "";
			
			Controls[controlTurns]:SetHide( false );

			queuedOrderType, queuedData1, queuedData2, queuedSave, queuedRush = city:GetOrderFromQueue( i-1 );
			if (queuedOrderType == OrderTypes.ORDER_TRAIN) then
				local thisUnitInfo = GameInfo.Units[queuedData1];
				Controls[controlName]:SetText( Locale.ConvertTextKey( thisUnitInfo.Description ) );
				if (bGeneratingProduction) then
					local iProductionTurns = JFD_GetUnitProductionTurnsLeft(city:GetOwner(), city, queuedData1, i-1) -- JFD Happiness
					Controls[controlTurns]:SetText( Locale.ConvertTextKey("TXT_KEY_PRODUCTION_HELP_NUM_TURNS", iProductionTurns ) );
				else
					Controls[controlTurns]:SetText( g_strInfiniteTurns );
				end 
				if (thisUnitInfo.Help ~= nil) then
					strToolTip = thisUnitInfo.Help;
				end
			elseif (queuedOrderType == OrderTypes.ORDER_CONSTRUCT) then
				local thisBuildingInfo = GameInfo.Buildings[queuedData1];
				Controls[controlName]:SetText( Locale.ConvertTextKey( thisBuildingInfo.Description ) );
				
				if (bGeneratingProduction) then
					--print ("true");
				else
					--print ("false");
				end
				
				if (bGeneratingProduction) then
					local iProductionTurns = JFD_GetBuildingProductionTurnsLeft(city:GetOwner(), city, queuedData1, i-1) -- JFD Happiness
					Controls[controlTurns]:SetText( Locale.ConvertTextKey("TXT_KEY_PRODUCTION_HELP_NUM_TURNS", iProductionTurns) );
				else
					Controls[controlTurns]:SetText( g_strInfiniteTurns );
				end
				if (thisBuildingInfo.Help ~= nil) then
					strToolTip = thisBuildingInfo.Help;
				end
			elseif (queuedOrderType == OrderTypes.ORDER_CREATE) then
				local thisProjectInfo = GameInfo.Projects[queuedData1];
				Controls[controlName]:SetText( Locale.ConvertTextKey( thisProjectInfo.Description ) );
				if (bGeneratingProduction) then
					local iProductionTurns = JFD_GetProjectProductionTurnsLeft(city:GetOwner(), city, queuedData1, i-1) -- JFD Happiness
					Controls[controlTurns]:SetText( Locale.ConvertTextKey("TXT_KEY_PRODUCTION_HELP_NUM_TURNS", iProductionTurns) );
				else
					Controls[controlTurns]:SetText( g_strInfiniteTurns );
				end
				if (thisProjectInfo.Help ~= nil) then
					strToolTip = thisProjectInfo.Help;
				end
			elseif (queuedOrderType == OrderTypes.ORDER_MAINTAIN) then
				local thisProcessInfo = GameInfo.Processes[queuedData1];
				Controls[controlName]:SetText( Locale.ConvertTextKey( thisProcessInfo.Description ) );
				if (bGeneratingProduction) then
					Controls[controlTurns]:SetHide( true );
				else
					Controls[controlTurns]:SetText( g_strInfiniteTurns );
				end
				if (thisProcessInfo.Help ~= nil) then
					strToolTip = thisProcessInfo.Help;
				end
			end
			Controls[controlBox]:SetToolTipString(Locale.ConvertTextKey(strToolTip));
			Controls[controlBox]:SetHide( false );
		end
		Controls.ProductionQueueBox:SetHide(false);
	else
		Controls.ProductionQueueBox:SetHide(true);
	end
      
	-- JFD Slavery
	Controls.SlaveButtonStack:CalculateSize();
	Controls.SlaveButtonStack:ReprocessAnchoring();
	
	-- JFD Provinces
	Controls.LevyButtonStack:CalculateSize();
	Controls.LevyButtonStack:ReprocessAnchoring();
	
	Controls.UnitButtonStack:CalculateSize();
	Controls.UnitButtonStack:ReprocessAnchoring();
	
	Controls.BuildingButtonStack:CalculateSize();
	Controls.BuildingButtonStack:ReprocessAnchoring();
	
	Controls.NationalWonderButtonStack:CalculateSize();
	Controls.NationalWonderButtonStack:ReprocessAnchoring();
	
	Controls.WonderButtonStack:CalculateSize();
	Controls.WonderButtonStack:ReprocessAnchoring();
	
	Controls.OtherButtonStack:CalculateSize();
	Controls.OtherButtonStack:ReprocessAnchoring();
	
	Controls.StackOStacks:CalculateSize();
	Controls.StackOStacks:ReprocessAnchoring();

	Controls.ScrollPanel:CalculateInternalSize();

end


-------------------------------------------------
-- On Popup
-------------------------------------------------
function OnPopup( popupInfo )

	if( popupInfo.Type ~= ButtonPopupTypes.BUTTONPOPUP_CHOOSEPRODUCTION ) then
		return;
	end

	CivIconHookup( Game.GetActivePlayer(), 32, Controls.CivIcon, Controls.CivIconBG, Controls.CivIconShadow, false, true );
	
	m_PopupInfo = popupInfo;

	local player = Players[Game.GetActivePlayer()];

    -- Purchase mode?
    if (popupInfo.Option2 == true) then
		g_IsProductionMode = false;
	else
		g_IsProductionMode = true;
	end

    local city = player:GetCityByID( popupInfo.Data1 );
    
    if (city == nil) then
		return;
	end
    if city and city:IsPuppet() then
-- CP Edit
		local bIsUnitOverride = false;
		local bIsBuildingOverride = false;
		local bIsPuppetOverride = false;
		if(not g_IsProductionMode) then
			for building in GameInfo.Buildings() do
 				local buildingID = building.ID;
				if(buildingID ~= -1) then
					if(building.AllowsPuppetPurchase) then
						if (city:IsHasBuilding(buildingID)) then
							bIsPuppetOverride = true;
							break;
						end
					elseif(building.PuppetPurchaseOverride) then
						if city:IsCanPurchase(false, false, buildingID, -1, -1, YieldTypes.YIELD_GOLD) then
							bIsBuildingOverride = true;
							break;
						elseif city:IsCanPurchase(false, false, buildingID, -1, -1, YieldTypes.YIELD_FAITH) then
							bIsBuildingOverride = true;
							break;
						end
					end
				end
			end
			for unit in GameInfo.Units() do
 				local unitID = unit.ID;
				if(unitID ~= -1) then
					if(unit.PuppetPurchaseOverride) then
						if city:IsCanPurchase(false, false, unitID, -1, -1, YieldTypes.YIELD_GOLD) then
							bIsUnitOverride = true;
							break;
						elseif city:IsCanPurchase(false, false, unitID, -1, -1, YieldTypes.YIELD_FAITH) then
							bIsUnitOverride = true;
							break;
						end
					end
				end
			end
		end
-- END
		if (player:MayNotAnnex() and not g_IsProductionMode) then
			-- You're super-special Venice and are able to update the window. Congrats.
-- EDIT
		elseif (bIsUnitOverride or bIsBuildingOverride or bIsPuppetOverride) then
--END
		else
			return;
		end
    end
	
	m_gOrderType = popupInfo.Data2;
	m_gFinishedItemType = popupInfo.Data3;
	
    g_append = popupInfo.Option1;
 
	UpdateWindow( city );
 			
    --UIManager:QueuePopup( ContextPtr, PopupPriority.ProductionPopup );
    ContextPtr:SetHide( false );
end
Events.SerialEventGameMessagePopup.Add( OnPopup );


function OnDirty()
	if not bHidden then
		local pCity = UI.GetHeadSelectedCity();
		if pCity ~= nil then
			UpdateWindow( pCity );
		else
			UpdateWindow( GetCurrentCity() );
		end
	end
end
Events.SerialEventCityScreenDirty.Add( OnDirty );
Events.SerialEventCityInfoDirty.Add( OnDirty );
Events.SerialEventGameDataDirty.Add( OnDirty );
Events.SerialEventUnitInfoDirty.Add( OnDirty );
Events.UnitSelectionChanged.Add( OnDirty );
Events.UnitGarrison.Add( OnDirty );
Events.UnitEmbark.Add( OnDirty );



function OnCityDestroyed(hexPos, playerID, cityID, newPlayerID)
	if not bHidden then
		if playerID == g_currentOwnerID and cityID == g_currentCityID then
			OnClose();
		end
	end	
end
Events.SerialEventCityDestroyed.Add(OnCityDestroyed);
Events.SerialEventCityCaptured.Add(OnCityDestroyed);


function GetProdHelp( void1, void2, button )
	local searchString = listOfStrings[tostring(button)];
	Events.SearchForPediaEntry( searchString );		
end

function OnPortraitRClicked()
	local city = GetCurrentCity();
	if (city == nil) then
		return;
	end
	local cityID = city:GetID();

	local searchString = "";
	
	local unitProduction = -1;
	local buildingProduction = -1;
	local projectProduction = -1;
	local processProduction = -1;
	local noProduction = false;
	
	-- Didn't just finish something
	if (m_gOrderType == -1) then
		
		-- Description and picture of Item under Production
		unitProduction = city:GetProductionUnit();
		buildingProduction = city:GetProductionBuilding();
		projectProduction = city:GetProductionProject();
		processProduction = city:GetProductionProcess();
		
	-- We just finished something, so show THAT in the bottom left
	else
		
		-- Just finished a Unit
		if (m_gOrderType == OrderTypes.ORDER_TRAIN) then
			unitProduction = m_gFinishedItemType;
			
		-- Just finished a Building/Wonder
		elseif (m_gOrderType == OrderTypes.ORDER_CONSTRUCT) then
			buildingProduction = m_gFinishedItemType;
			
		-- Just finished a Project
		elseif (m_gOrderType == OrderTypes.ORDER_CREATE) then
			projectProduction = m_gFinishedItemType;
			
		-- Don't worry about specialists or processes
		end
		
	end

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
		-- search by name
		Events.SearchForPediaEntry( searchString );		
	end
		
end
Controls.ProductionPortraitButton:RegisterCallback( Mouse.eRClick, OnPortraitRClicked );



local defaultErrorTextureSheet = "TechAtlasSmall.dds";
local nullOffset = Vector2( 0, 0 );

----------------------------------------------------------------        
-- Add a button based on the item info
----------------------------------------------------------------        
function AddProductionButton( id, description, orderType, turnsLeft, column, isDisabled, ePurchaseYield, isSlave, isLevy, isMagistrate)	
	local controlTable;
	
	local pCity = GetCurrentCity();
	if (pCity == nil) then
		return;
	end
	
	local abAdvisorRecommends = {false, false, false, false};
	local iUnit = -1;
	local iBuilding = -1;
	local iProject = -1;
	local iProcess = -1;
	
	if column == 5 then -- we are a Slave
		iUnit = id;
		controlTable = g_SlaveInstanceManager:GetInstance();
		local thisUnitInfo = GameInfo.Units[id];
		
		-- Portrait
		local portraitOffset, portraitAtlas = UI.GetUnitPortraitIcon(id, pCity:GetOwner());
		local textureOffset, textureSheet = IconLookup( portraitOffset, 45, portraitAtlas );				
		if textureOffset == nil then
			textureSheet = defaultErrorTextureSheet;
			textureOffset = nullOffset;
		end				
		controlTable.ProductionButtonImage:SetTexture(textureSheet);
		controlTable.ProductionButtonImage:SetTextureOffset(textureOffset);
		
		-- Tooltip
		local bIncludeRequirementsInfo = false;
		local strToolTip = Locale.ConvertTextKey(GetHelpTextForUnit(id, bIncludeRequirementsInfo, pCity));
		
		-- Disabled help text
		if (isDisabled) then
			if pCity:CanTrain( id, 0) then
				strToolTip = strToolTip .. "[NEWLINE][COLOR_WARNING_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_CANNOT_PURCHASE_JFD_NO_SLAVES") .. "[ENDCOLOR]";
			else
				for row in GameInfo.Unit_ResourceQuantityRequirements("UnitType = '" .. thisUnitInfo.Type .. "'") do
					local resource = GameInfo.Resources[row.ResourceType]
					strToolTip = strToolTip .. "[NEWLINE][COLOR_WARNING_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_NO_ACTION_UNIT_LACKS_RESOURCES", row.Cost, resource.IconString, resource.Description) .. "[ENDCOLOR]";
				end
			end
		else
			if userSettingHappinessCore then
				strToolTip = strToolTip .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_PURCHASE_JFD_SLAVES_UNHAPPINESS") .. "[ENDCOLOR]"
			end
		end
		
		controlTable.Button:SetToolTipString(strToolTip);
		
	elseif column == 6 then -- we are a Levy
		iUnit = id;
		controlTable = g_LevyInstanceManager:GetInstance();
		local thisUnitInfo = GameInfo.Units[id];
		
		-- Portrait
		local portraitOffset, portraitAtlas = UI.GetUnitPortraitIcon(id, pCity:GetOwner());
		local textureOffset, textureSheet = IconLookup( portraitOffset, 45, portraitAtlas );				
		if textureOffset == nil then
			textureSheet = defaultErrorTextureSheet;
			textureOffset = nullOffset;
		end				
		controlTable.ProductionButtonImage:SetTexture(textureSheet);
		controlTable.ProductionButtonImage:SetTextureOffset(textureOffset);
		
		-- Tooltip
		local bIncludeRequirementsInfo = false;
		local strToolTip = Locale.ConvertTextKey(GetHelpTextForUnit(id, bIncludeRequirementsInfo, pCity));
		
		-- Disabled help text
		if (isDisabled) then
			local minPopReq = GameDefines["JFD_PROVINCES_LEVY_MIN_POP"]
			local strDisabledInfo = Locale.ConvertTextKey("TXT_KEY_CANNOT_PURCHASE_JFD_NO_POPULATION", minPopReq)
			if (strDisabledInfo ~= nil and strDisabledInfo ~= "") and pCity:GetPopulation() < minPopReq then
				strToolTip = strToolTip .. "[NEWLINE][COLOR_WARNING_TEXT]" .. strDisabledInfo .. "[ENDCOLOR]";
			end
			if pCity:GetGarrisonedUnit() then
				strToolTip = strToolTip .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_PURCHASE_JFD_LEVIES_INFO_GARRISON") 
			end
		else
			strToolTip = strToolTip .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_PURCHASE_JFD_LEVIES_INFO") 
		end
		
		controlTable.Button:SetToolTipString(strToolTip);
	
	elseif column == 1 then -- we are a unit
		iUnit = id;
		controlTable = g_UnitInstanceManager:GetInstance();
		local thisUnitInfo = GameInfo.Units[id];
		
		-- Portrait
		local portraitOffset, portraitAtlas = UI.GetUnitPortraitIcon(id, pCity:GetOwner());
		local textureOffset, textureSheet = IconLookup( portraitOffset, 45, portraitAtlas );				
		if textureOffset == nil then
			textureSheet = defaultErrorTextureSheet;
			textureOffset = nullOffset;
		end				
		controlTable.ProductionButtonImage:SetTexture(textureSheet);
		controlTable.ProductionButtonImage:SetTextureOffset(textureOffset);
		
		-- Tooltip
		local bIncludeRequirementsInfo = false;
		local strToolTip = Locale.ConvertTextKey(GetHelpTextForUnit(id, bIncludeRequirementsInfo, pCity));
		
		-- Disabled help text
		if (isDisabled) then
			if (g_IsProductionMode) then
				local strDisabledInfo = pCity:CanTrainTooltip(id);
				if (strDisabledInfo ~= nil and strDisabledInfo ~= "") then
					strToolTip = strToolTip .. "[NEWLINE][COLOR_WARNING_TEXT]" .. strDisabledInfo .. "[ENDCOLOR]";
				end
			else
				local strDisabledInfo;
				if (ePurchaseYield == YieldTypes.YIELD_GOLD) then
					strDisabledInfo = pCity:GetPurchaseUnitTooltip(id);
				else
					strDisabledInfo = pCity:GetFaithPurchaseUnitTooltip(id);
				end
				if (strDisabledInfo ~= nil and strDisabledInfo ~= "") then
					strToolTip = strToolTip .. "[NEWLINE][COLOR_WARNING_TEXT]" .. strDisabledInfo .. "[ENDCOLOR]";
				end
			end
		end
		
		controlTable.Button:SetToolTipString(strToolTip);
		
	elseif column == 2 or column == 3 or column == 7 or column == 8 then -- we are a building, wonder, or project
		if column == 2 then
			controlTable = g_BuildingInstanceManager:GetInstance();
		elseif column == 3 then
			controlTable = g_WonderInstanceManager:GetInstance();
		elseif column == 8 then
			controlTable = g_NationalWonderInstanceManager:GetInstance();
		elseif column == 7 then
			controlTable = g_BuildingInstanceManager:GetInstance();
		end
		
		local thisInfo;
		
		local strToolTip = "";
		
		if orderType == OrderTypes.ORDER_MAINTAIN then
			--print("SCRIPTING ERROR: Got a Process when a Building was expected");
		else
			local bBuilding;
			if orderType == OrderTypes.ORDER_CREATE then
				bBuilding = false;
				thisInfo = GameInfo.Projects[id];
				iProject = id;
			elseif orderType == OrderTypes.ORDER_CONSTRUCT then
				bBuilding = true;
				thisInfo = GameInfo.Buildings[id];
				iBuilding = id;
			end
			
			local textureOffset, textureSheet = IconLookup( thisInfo.PortraitIndex, 45, thisInfo.IconAtlas );				
			if textureOffset == nil then
				textureSheet = defaultErrorTextureSheet;
				textureOffset = nullOffset;
			end				
			controlTable.ProductionButtonImage:SetTexture(textureSheet);
			controlTable.ProductionButtonImage:SetTextureOffset(textureOffset);
			
			-- Tooltip
			if (bBuilding) then
				local bExcludeName = false;
				local bExcludeHeader = false;
				strToolTip = GetHelpTextForBuilding(id, bExcludeName, bExcludeHeader, false, pCity, isMagistrate);
			else
				local bIncludeRequirementsInfo = false;
				strToolTip = GetHelpTextForProject(id, bIncludeRequirementsInfo);
			end
			
			-- Disabled help text
			if (isDisabled) then
				if (g_IsProductionMode) then
					local strDisabledInfo = pCity:CanConstructTooltip(id);
					if (strDisabledInfo ~= nil and strDisabledInfo ~= "") then
						strToolTip = strToolTip .. "[NEWLINE][COLOR_WARNING_TEXT]" .. strDisabledInfo .. "[ENDCOLOR]";
					end
				else
					local strDisabledInfo;
					if isMagistrate then -- JFD Colonies
						strToolTip = strToolTip .. "[NEWLINE][COLOR_WARNING_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_CANNOT_PURCHASE_JFD_NO_MAGISTRATES") .. "[ENDCOLOR]";
					elseif (ePurchaseYield == YieldTypes.YIELD_GOLD) then
						strDisabledInfo = pCity:GetPurchaseBuildingTooltip(id);
					else
						strDisabledInfo = pCity:GetFaithPurchaseBuildingTooltip(id);
					end
					if (strDisabledInfo ~= nil and strDisabledInfo ~= "") then
						strToolTip = strToolTip .. "[NEWLINE][COLOR_WARNING_TEXT]" .. strDisabledInfo .. "[ENDCOLOR]";
					end
				end
			end
			
		end
		
		controlTable.Button:SetToolTipString(strToolTip);
		
	elseif column == 4 then -- processes
		
		iProcess = id;
		controlTable = g_ProcessInstanceManager:GetInstance();
		local thisProcessInfo = GameInfo.Processes[id];
		
		-- Portrait
		local textureOffset, textureSheet = IconLookup( thisProcessInfo.PortraitIndex, 45, thisProcessInfo.IconAtlas );				
		if textureOffset == nil then
			textureSheet = defaultErrorTextureSheet;
			textureOffset = nullOffset;
		end				
		controlTable.ProductionButtonImage:SetTexture(textureSheet);
		controlTable.ProductionButtonImage:SetTextureOffset(textureOffset);
		
		-- Tooltip
		local bIncludeRequirementsInfo = false;
		local strToolTip = Locale.ConvertTextKey(GetHelpTextForProcess(id, bIncludeRequirementsInfo));
		
		-- Disabled help text
		if (isDisabled) then
			
		end
		
		controlTable.Button:SetToolTipString(strToolTip);
		
	else
		return
	end
    
    local nameString = Locale.ConvertTextKey( description );
    
    listOfStrings[tostring(controlTable.Button)] = nameString;
    
    controlTable.UnitName:SetText( nameString );
    if g_IsProductionMode then
		controlTable.NumTurns:SetText(turnsLeft);
	else
		if isMagistrate then -- JFD Colonies
			controlTable.NumTurns:SetText( JFD_GetMagistrateCost(pCity:GetOwner(), iBuilding).." [ICON_JFD_MAGISTRATE]" );
		elseif isSlave then -- JFD Slavery
			controlTable.NumTurns:SetText( JFD_GetShackleCost(pCity:GetOwner(), iUnit).." [ICON_JFD_SHACKLES]" );
		elseif isLevy then -- JFD Provinces
			controlTable.NumTurns:SetText( turnsLeft.." [ICON_CITIZEN]" );
		elseif (ePurchaseYield == YieldTypes.YIELD_GOLD) then
			if userSettingInvestmentsCore and (column == 2 or column == 3 or column == 7 or column == 8) then
				controlTable.NumTurns:SetText( turnsLeft.." [ICON_INVEST]" );
			else
				controlTable.NumTurns:SetText( turnsLeft.." [ICON_GOLD]" );
			end
		elseif (ePurchaseYield == YieldTypes.YIELD_FAITH) then
			controlTable.NumTurns:SetText( turnsLeft.." [ICON_PEACE]" );
		end
	end
	
	local ePurchaseEnum;
	if g_IsProductionMode then
		if (orderType == OrderTypes.ORDER_TRAIN) then
			ePurchaseEnum = g_CONSTRUCT_UNIT;
		elseif (orderType == OrderTypes.ORDER_CONSTRUCT) then
			ePurchaseEnum = g_CONSTRUCT_BUILDING;
		elseif (orderType == OrderTypes.ORDER_CREATE) then
			ePurchaseEnum = g_CONSTRUCT_PROJECT;
		elseif (orderType == OrderTypes.ORDER_MAINTAIN) then
			ePurchaseEnum = g_MAINTAIN_PROCESS;
		end
	else
		if (orderType == OrderTypes.ORDER_TRAIN) then
			if isSlave then
				ePurchaseEnum = g_PURCHASE_UNIT_SLAVERY; -- JFD Slavery
			elseif isLevy then
				ePurchaseEnum = g_PURCHASE_UNIT_LEVIES; -- JFD Provinces
			else
				if (ePurchaseYield == YieldTypes.YIELD_GOLD) then
					ePurchaseEnum = g_PURCHASE_UNIT_GOLD;
				elseif (ePurchaseYield == YieldTypes.YIELD_FAITH) then
					ePurchaseEnum = g_PURCHASE_UNIT_FAITH;
				end
			end
		elseif (orderType == OrderTypes.ORDER_CONSTRUCT) then
			if isMagistrate then
				ePurchaseEnum = g_PURCHASE_BUILDING_MAGISTRATE; -- JFD Colonies
			elseif (ePurchaseYield == YieldTypes.YIELD_GOLD) then
				ePurchaseEnum = g_PURCHASE_BUILDING_GOLD;
			elseif (ePurchaseYield == YieldTypes.YIELD_FAITH) then
				ePurchaseEnum = g_PURCHASE_BUILDING_FAITH;
			end
		elseif (orderType == OrderTypes.ORDER_CREATE) then
			if (ePurchaseYield == YieldTypes.YIELD_GOLD) then
				ePurchaseEnum = g_PURCHASE_PROJECT_GOLD;
			elseif (ePurchaseYield == YieldTypes.YIELD_FAITH) then
				ePurchaseEnum = g_PURCHASE_PROJECT_FAITH;
			end
		elseif (orderType == OrderTypes.ORDER_MAINTAIN) then
			--print("SCRIPTING ERROR: Processes are not allowed to be purchased");
		end
	end
	
    controlTable.Button:SetVoid1( ePurchaseEnum );
    controlTable.Button:SetVoid2( id );
    controlTable.Button:RegisterCallback( Mouse.eRClick, GetProdHelp );
    controlTable.Button:ClearCallback(Mouse.eLClick);

    
	if(isDisabled) then
		controlTable.DisabledBox:SetHide(false);	
	else
		controlTable.Button:RegisterCallback( Mouse.eLClick, ProductionSelected );
		controlTable.DisabledBox:SetHide(true);
	end
   
	
    if (iUnit >= 0) then
		for iAdvisorLoop = 0, AdvisorTypes.NUM_ADVISOR_TYPES - 1, 1 do
			abAdvisorRecommends[iAdvisorLoop] = Game.IsUnitRecommended(iUnit, iAdvisorLoop);
		end
    elseif (iBuilding >= 0) then
		for iAdvisorLoop = 0, AdvisorTypes.NUM_ADVISOR_TYPES - 1, 1 do
			abAdvisorRecommends[iAdvisorLoop] = Game.IsBuildingRecommended(iBuilding, iAdvisorLoop);
		end
    elseif (iProject >= 0) then
		for iAdvisorLoop = 0, AdvisorTypes.NUM_ADVISOR_TYPES - 1, 1 do
			abAdvisorRecommends[iAdvisorLoop] = Game.IsProjectRecommended(iProject, iAdvisorLoop);
		end    
    elseif (iProcess >= 0) then
		-- Advisors will not recommend Processes
    end
    
    for iAdvisorLoop = 0, AdvisorTypes.NUM_ADVISOR_TYPES - 1, 1 do
		local pControl = nil;
		if (iAdvisorLoop == AdvisorTypes.ADVISOR_ECONOMIC) then			
			pControl = controlTable.EconomicRecommendation;
		elseif (iAdvisorLoop == AdvisorTypes.ADVISOR_MILITARY) then
			pControl = controlTable.MilitaryRecommendation;			
		elseif (iAdvisorLoop == AdvisorTypes.ADVISOR_SCIENCE) then
			pControl = controlTable.ScienceRecommendation;
		elseif (iAdvisorLoop == AdvisorTypes.ADVISOR_FOREIGN) then
			pControl = controlTable.ForeignRecommendation;
		end
	
		if (pControl) then
			pControl:SetHide(not abAdvisorRecommends[iAdvisorLoop]);
		end
    end
end


----------------------------------------------------------------        
----------------------------------------------------------------        
function OnClose()
    --UIManager:DequeuePopup( ContextPtr );
	g_currentCityOwnerID = -1;
	g_currentCityID = -1;
    ContextPtr:SetHide( true );
end
Controls.CloseButton:RegisterCallback( Mouse.eLClick, OnClose );
Events.SerialEventExitCityScreen.Add( OnClose );



----------------------------------------------------------------        
-- Input processing
----------------------------------------------------------------        
function InputHandler( uiMsg, wParam, lParam )
    if uiMsg == KeyEvents.KeyDown then
        if wParam == Keys.VK_ESCAPE or wParam == Keys.VK_RETURN then
            OnClose();
            return true;
 		--elseif wParam == Keys.VK_LEFT then
			--Game.DoControl(GameInfoTypes.CONTROL_PREVCITY);
			--return true;
		--elseif wParam == Keys.VK_RIGHT then
			--Game.DoControl(GameInfoTypes.CONTROL_NEXTCITY);
			--return true;
		end
    end
end
ContextPtr:SetInputHandler( InputHandler );


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function ShowHideHandler( bIsHide, bInitState )

    if( not bInitState ) then
        if( not bIsHide ) then
        	Events.SerialEventGameMessagePopupShown(m_PopupInfo);
        else
            Events.SerialEventGameMessagePopupProcessed.CallImmediate(ButtonPopupTypes.BUTTONPOPUP_CHOOSEPRODUCTION, 0);
        end
        bHidden = bIsHide;
        LuaEvents.ProductionPopup( bIsHide );
    end
end
ContextPtr:SetShowHideHandler( ShowHideHandler );


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnPurchaseButton()
	g_IsProductionMode = not g_IsProductionMode;
	UpdateWindow( GetCurrentCity() );
end
Controls.PurchaseButton:RegisterCallback( Mouse.eLClick, OnPurchaseButton );

----------------------------------------------------------------
-- 'Active' (local human) player has changed
----------------------------------------------------------------
function OnActivePlayerChanged()
	if (not ContextPtr:IsHidden()) then
		OnClose();
	end
end
Events.GameplaySetActivePlayer.Add(OnActivePlayerChanged);


-- WHOWARD MOD - Can the specified city construct the specified building?
function CouldConstruct(pCity, iBuilding)
  local building = GameInfo.Buildings[iBuilding]
  local buildingclass = GameInfo.BuildingClasses[building.BuildingClass]
--print("Test CouldConsctruct start");
  if building.IsProvince then
	if pCity:IsCapital() then return false end
	if pCity:HasBuilding(iBuilding) then return false end
	for row in GameInfo.Building_ClassesNeededInCity("BuildingType = '" .. building.Type .. "'") do
		if (not pCity:HasBuildingClass(GameInfoTypes[row.BuildingClassType])) then
			return false
		end
	end
	return true
  end
  
  -- Is this a National Wonder?
  if (buildingclass.MaxPlayerInstances ~= -1) then
    local pPlayer = Players[Game.GetActivePlayer()]

    -- Have we built it already?
    if (pPlayer:CountNumBuildings(iBuilding) < buildingclass.MaxPlayerInstances) then

      -- Does it need a specific tech?
      local techType = building.PrereqTech
      if (techType ~= nil) then

        -- Do we have that tech?
        if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes[techType])) then

          -- Is the national wonder specific to a Civ? (this implicit db query should only return a single row at most)
          for info in GameInfo.Civilization_BuildingClassOverrides{BuildingType=building.Type} do

            -- Are we that Civ?
            if (info.CivilizationType == GameInfo.Civilizations[pPlayer:GetCivilizationType()].Type) then

              -- We can build it
              return true
            else

              -- We can't build it
              return false
            end
          end

          -- Is there a building class override for our civ for this building?
          for info in GameInfo.Civilization_BuildingClassOverrides{BuildingClassType=buildingclass.Type, CivilizationType=GameInfo.Civilizations[pPlayer:GetCivilizationType()].Type} do

            -- We can't build it (as we have to build the over-ride building instead, which was tested for above)
            return false
          end

          -- We can build it
          return true
        end
      end
    end
  end
--print("Test CouldConsctruct start");

  -- Otherwise, just do the standard stuff
  return pCity:CanConstruct(iBuilding, 0, 1)
end
