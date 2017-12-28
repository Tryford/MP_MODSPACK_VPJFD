-- WorldCurrenciesOverview
-- Author: Deo-e
-- DateCreated: 4/27/2016 7:27:36 PM
--------------------------------------------------------------
include( "IconSupport" );
include( "InstanceManager" );
include( "JFD_RTP_ProsperityUtils.lua" );

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
g_WorldCurrenciesSortOptions = {
	{
		Button = Controls.SortByCivilization,
		ImageControl = Controls.SortByCivilizationImage,
		Column = "Civilization",
		DefaultDirection = "asc",
		CurrentDirection = "desc",
	},
	{
		Button = Controls.SortByCurrency,
		ImageControl = Controls.SortByCurrencyImage,
		Column = "Name",
		DefaultDirection = "desc",
		CurrentDirection = nil,
	},
	{
		Button = Controls.SortByGPT,
		ImageControl = Controls.SortByGPTImage,
		Column = "NumGPT",
		DefaultDirection = "desc",
		SortType = "numeric",
		CurrentDirection = nil,
	},
	{
		Button = Controls.SortByProsperity,
		ImageControl = Controls.SortByProsperityImage,
		Column = "NumProsperity",
		DefaultDirection = "desc",
		SortType = "numeric",
		CurrentDirection = nil,
	},
};

g_WorldCurrenciesSortFunction = nil

local g_WorldCurrenciesManager = InstanceManager:new( "WorldCurrenciesInstance", "Base", Controls.WorldCurrenciesStack);

function RefreshWorldCurrencies()
	g_WorldCurrenciesManager:ResetInstances()
	local worldCurrencies = {}
	local activePlayerID = Game.GetActivePlayer()
	local activePlayer = Players[activePlayerID]
	local activeTeam = Teams[activePlayer:GetTeam()]
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do	
		local player = Players[playerID]
		if (player:IsAlive() and activeTeam:IsHasMet(player:GetTeam())) then
			local currencyDesc = "TXT_KEY_JFD_NO_CURRENCY_NONE"
			local currencyID = -1
			local numGPT = player:CalculateGoldRate()
			local numProsperity = JFD_GetProsperityScore(playerID)
			if player:HasCurrency() then
				currencyID = player:GetCurrency()
				currencyDesc = GameInfo.JFD_Currencies[currencyID].Description
			end
			table.insert(worldCurrencies, {
				Civilization = Locale.Lookup(player:GetCivilizationDescription()),
				CivilizationID = player:GetID(),
				Name = Locale.Lookup(currencyDesc),
				CurrencyID = currencyID,
				NumGPT = numGPT,
				NumProsperity = numProsperity,
			});
		end
	end
	if(#worldCurrencies > 0) then
		Controls.WorldCurrenciesScrollPanel:SetHide(false)
		Controls.NoWorldCurrencies:SetHide(true)
		--table.sort(worldCurrencies, g_WorldCurrenciesSortFunction)
		for i,v in ipairs(worldCurrencies) do
			local entry = g_WorldCurrenciesManager:GetInstance()
			local playerID = v.CivilizationID
			local player = Players[playerID]
			entry.Civilization:SetText(v.Civilization)
			entry.CurrencyName:SetText(v.Name)
			entry.NumGPT:SetText(v.NumGPT)
			entry.ProsperityScore:SetText(v.NumProsperity)
			if player:HasCurrency() then
				entry.CurrencyIcon:SetHide(false)
				IconHookup(GameInfo.JFD_Currencies[v.CurrencyID].PortraitIndex, 48, GameInfo.JFD_Currencies[v.CurrencyID].IconAtlas, entry.CurrencyIcon)
			else
				entry.CurrencyIcon:SetHide(true)
			end
			CivIconHookup(v.CivilizationID, 45, entry.CivilizationIcon, entry.CivilizationIconBG, entry.CivilizationIconShadow, true, true)
		end
		Controls.WorldCurrenciesStack:CalculateSize()
		Controls.WorldCurrenciesStack:ReprocessAnchoring()
		Controls.WorldCurrenciesScrollPanel:CalculateInternalSize()
	end
end 
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
	for i,v in ipairs(g_WorldCurrenciesSortOptions) do
		if(v.Button ~= nil) then
			v.Button:RegisterCallback(Mouse.eLClick, function() WorldCurrenciesSortOptionSelected(v); end);
		end
	end
	UpdateSortOptionsDisplay(g_WorldCurrenciesSortOptions);
	g_WorldCurrenciesSortFunction = GetSortFunction(g_WorldCurrenciesSortOptions);
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
function WorldCurrenciesSortOptionSelected(option)
	local sortOptions = g_WorldCurrenciesSortOptions;
	UpdateSortOptionState(sortOptions, option);
	UpdateSortOptionsDisplay(sortOptions);
	g_WorldCurrenciesSortFunction = GetSortFunction(sortOptions);
	
	RefreshWorldCurrencies();
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function ShowHideHandler( bIsHide, bInitState )
	RefreshWorldCurrencies()
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

RegisterSortOptions();

