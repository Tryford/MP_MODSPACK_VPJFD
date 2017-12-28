print("This is the 'Units - Multiple Upgrades' mod script.")

include("IconSupport")
include("InstanceManager")

local iUnitClassWarrior = GameInfoTypes.UNITCLASS_WARRIOR
local iUnitClassSpearman = GameInfoTypes.UNITCLASS_SPEARMAN
local iUnitClassPikeman = GameInfoTypes.UNITCLASS_PIKEMAN
local iUnitClassMusketman = GameInfoTypes.UNITCLASS_MUSKETMAN
local iUnitClassLancer = GameInfoTypes.UNITCLASS_LANCER
local iUnitClassCrossbowman = GameInfoTypes.UNITCLASS_CROSSBOWMAN
local iUnitClassCuirassier = GameInfoTypes.UNITCLASS_EE_CUIRASSIER
local iUnitClassGatlingGun = GameInfoTypes.UNITCLASS_GATLINGGUN
local iUnitClassRifleman = GameInfoTypes.UNITCLASS_RIFLEMAN

local iResourceIron = GameInfoTypes.RESOURCE_IRON

local iTechIronWorking = GameInfoTypes.TECH_IRON_WORKING

local iMusketmenPerLancer = 3 -- we want this number of Musketmen for every Lancer
local iRiflemenPerGatlingGun = 4 -- we want this number of Riflemen for every Gatling Gun

local iCommandUpgrade = GameInfoTypes.COMMAND_UPGRADE
local iMissionUpgrade  = GameInfoTypes.MISSION_MULTIPLE_UPGRADE

local CUSTOM_MISSION_NO_ACTION = 0
local CUSTOM_MISSION_ACTION    = 1

local g_UpgradeIM = InstanceManager:new("UnitUpgrade", "UnitUpgradeButton", Controls.UpgradePanel)
local g_ShowingUpgradePanel = false

local g_LastUnit = -1

local upgradesPerRow = 4
local upgradeButtonSize = 60
local upgradeButtonPadding = 8
local upgradeButtonOffsetX = 16
local upgradeButtonOffsetY = 0
local upgradePanelSizeOffsetY = 104
local upgradeIconSize = 64

if (UI.IsTouchScreenEnabled()) then
  upgradeButtonOffsetX = upgradeButtonOffsetX + 44
end

if (OptionsManager.GetSmallUIAssets() and not UI.IsTouchScreenEnabled()) then
  upgradesPerRow = 6
  upgradeButtonSize = 40
  upgradeButtonPadding = 6
  upgradePanelSizeOffsetY = 86
  upgradeIconSize = 45
end

function ShowUpgradePanel(iWidth, iUpgradesAvailable)
  Controls.UpgradePanel:SetSizeVal(iWidth, math.floor((iUpgradesAvailable-1) / upgradesPerRow) * upgradeButtonSize + upgradeButtonPadding + upgradeButtonOffsetY + upgradePanelSizeOffsetY)
  ContextPtr:SetHide(false)
  g_ShowingUpgradePanel = true
  g_LastUnit = UI.GetHeadSelectedUnit():GetID()
end

function HideUpgradePanel()
  ContextPtr:SetHide(true)
  g_ShowingUpgradePanel = false
  g_LastUnit = -1
end

function OnActivePlayerChanged(iPlayer, iPrevPlayer)
  HideUpgradePanel()
end
Events.GameplaySetActivePlayer.Add(OnActivePlayerChanged)

function OnUnitInfoDirty()
    local pUnit = UI.GetHeadSelectedUnit()
    local iUnit = pUnit and pUnit:GetID() or -1

    if (g_LastUnit ~= -1 and iUnit ~= g_LastUnit) then
	  HideUpgradePanel()
    end
end
Events.SerialEventUnitInfoDirty.Add(OnUnitInfoDirty)


function CountUnitsOfClass(pPlayer, iUnitClassType, bIncludeDerived)
  local unitClassCounts = {}

  for pUnit in pPlayer:Units() do
    local iUnitClassType = pUnit:GetUnitClassType()

    unitClassCounts[iUnitClassType] = (unitClassCounts[iUnitClassType] or 0) + 1
  end

  return _CountUnitsOfClass(unitClassCounts, pPlayer, iUnitClassType, bIncludeDerived)
end

function _CountUnitsOfClass(unitClassCounts, pPlayer, iUnitClassType, bIncludeDerived)
  local iCount = unitClassCounts[iUnitClassType] or 0

  if (bIncludeDerived) then
    local iUnitType = pPlayer:GetSpecificUnitType(GameInfo.UnitClasses[iUnitClassType].Type)
	if GameInfo.Units[iUnitType] then
		for row in GameInfo.Unit_ClassUpgrades{UnitType = GameInfo.Units[iUnitType].Type} do
		  iCount = iCount + _CountUnitsOfClass(unitClassCounts, pPlayer, row.UnitClassType, bIncludeDerived)
		end
	end
  end

  return iCount
end

function CountLocalResources(pPlayer, iResource, bImprovedOnly)
  local iCount = 0

  local iTeam = pPlayer:GetTeam()

  for pCity in pPlayer:Cities() do
    for iPlotIndex = 0, pCity:GetNumCityPlots()-1, 1 do
      local pPlot = pCity:GetCityIndexPlot(iPlotIndex)

      if (pPlot and pPlot:GetResourceType(iTeam) == iResource) then
        if (not bImprovedOnly or pPlot:IsResourceConnectedByImprovement(pPlot:GetImprovementType())) then
          iCount = iCount + pPlot:GetNumResource()
        end
      end
    end
  end

  return iCount
end

function CanTrain(pPlayer, iUnitClassType)
  local iRequiredTech = GameInfo.Units[pPlayer:GetSpecificUnitType(GameInfo.UnitClasses[iUnitClassType].Type)].PrereqTech
  if (not iRequiredTech) then return false end
  if (iRequiredTech) then
    return Teams[pPlayer:GetTeam()]:GetTeamTechs():HasTech(iRequiredTech)
  end

  return true
end

function GetUpgradeToolTip(pPlayer, pUnit, iUpgradeUnitType, bDisabled)
  local upgradeUnit = GameInfo.Units[iUpgradeUnitType]
  local pPlot = pUnit:GetPlot()
  local iGoldToUpgrade = pUnit:UpgradePrice(iUpgradeUnitType)
  local strToolTip = Locale.ConvertTextKey("TXT_KEY_UPGRADE_HELP", upgradeUnit.Description, iGoldToUpgrade)

  if (bDisabled) then
    local strDisabledString = ""

    -- Can't upgrade because we're outside our territory
    if (pPlot:GetOwner() ~= pUnit:GetOwner()) then
      strDisabledString = strDisabledString .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_UPGRADE_HELP_DISABLED_TERRITORY")
    end

    -- Can't upgrade because we lack the Gold
    if (iGoldToUpgrade > pPlayer:GetGold()) then
      strDisabledString = strDisabledString .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_UPGRADE_HELP_DISABLED_GOLD")
    end
	
	-- Can't upgrade because we lack the Technology
	local sPrereqTech = upgradeUnit.PrereqTech
	if (sPrereqTech and not Teams[pPlayer:GetTeam()]:GetTeamTechs():HasTech(GameInfoTypes[sPrereqTech])) then
      strDisabledString = strDisabledString .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_UPGRADE_HELP_DISABLED_TECHNOLOGY", GameInfo.Technologies[sPrereqTech].Description)
	end

    -- Loop through all resources to see how many we need. If it's > 0 then add to the string
    local strResourcesNeeded = ""
    for pResource in GameInfo.Resources() do
      local iResourceLoop = pResource.ID
      local iNumResourceNeededToUpgrade = pUnit:GetNumResourceNeededToUpgrade(iResourceLoop, iUpgradeUnitType)
        
      if (iNumResourceNeededToUpgrade > 0 and iNumResourceNeededToUpgrade > pPlayer:GetNumResourceAvailable(iResourceLoop)) then
        if (strResourcesNeeded ~= "") then
          strResourcesNeeded = strResourcesNeeded .. ", "
        end

        strResourcesNeeded = strResourcesNeeded .. iNumResourceNeededToUpgrade .. " " .. pResource.IconString .. " " .. Locale.ConvertTextKey(pResource.Description)
      end
    end

    -- Can't upgrade because we lack the Resources
    if (strResourcesNeeded ~= "") then
      strDisabledString = strDisabledString .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_UPGRADE_HELP_DISABLED_RESOURCES", strResourcesNeeded)
    end

    -- Can't upgrade due to stacking
    if (pPlot:GetNumFriendlyUnitsOfType(pUnit) > 1) then
      strDisabledString = strDisabledString .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_UPGRADE_HELP_DISABLED_STACKING")
    end

    strToolTip = strToolTip .. "[COLOR_WARNING_TEXT]" .. strDisabledString .. "[ENDCOLOR]"          
  end

  return strToolTip
end

function CanHaveWarriorUpgrade(pPlayer, iUpgradeUnitClassType)
  if (iUpgradeUnitClassType == iUnitClassSpearman) then
    -- Warrior to Spearman instead of Swordsman?
    -- Never if we have spare improved local iron
    if (pPlayer:GetNumResourceAvailable(iResourceIron, false)) then
      return false
    end

    -- If we have no Spearmen, always
    if (CountUnitsOfClass(pPlayer, iUnitClassSpearman, true) == 0) then
      return true
    end

    -- Otherwise wait until we have Iron Working ...
    if (not Teams[pPlayer:GetTeam()]:GetTeamTechs():HasTech(iTechIronWorking)) then
      return false
    end

    -- ... and check for available (but not necessarily currently improved) iron resources
    if (CountLocalResources(pPlayer, iResourceIron, false) > pPlayer:GetNumResourceTotal(iResourceIron, true)) then
      return false
    end
  end

  return true
end

function CanHavePikemanUpgrade(pPlayer, iUpgradeUnitClassType)
  -- Pikeman to Lancer or Musketman?
  if (iUpgradeUnitClassType == iUnitClassLancer) then
    local bCanTrainMusketmen = CanTrain(pPlayer, iUnitClassMusketman)

    -- If we can train Musketmen AND have no Musketmen, never
    if (bCanTrainMusketmen and CountUnitsOfClass(pPlayer, iUnitClassMusketman, true) == 0) then
      return false
    end

    -- If we have no Lancers, always
    if (CountUnitsOfClass(pPlayer, iUnitClassLancer, true) == 0) then
      return true
    end

    -- If we can't train Musketmen, wait until we can
    if (not bCanTrainMusketmen) then
      return false
    end
  else
    -- If we don't have enough Musketmen, always
    if (CountUnitsOfClass(pPlayer, iUnitClassMusketman, true) < iMusketmenPerLancer) then
      return true
    end

    -- If we can't train Lancers, wait until we can
    if (not CanTrain(pPlayer, iUnitClassLancer)) then
      return false
    end
  end

  -- If we get here, we can train both Lancers and Musketmen, so check the ratio
  local iLancers = CountUnitsOfClass(pPlayer, iUnitClassLancer, true)
  local iMusketmen = CountUnitsOfClass(pPlayer, iUnitClassMusketman, true)

  local bWantLancer = (iMusketmen > (iLancers * (iMusketmenPerLancer+0.5)))
  local bWantMusketman = (iMusketmen < (iLancers * (iMusketmenPerLancer-0.5)))

  if (iUpgradeUnitClassType == iUnitClassLancer and bWantLancer and not bWantMusketman) then
    return true
  elseif (iUpgradeUnitClassType == iUnitClassMusketman and bWantMusketman and not bWantLancer) then
    return true
  end

  -- Randomise it
  return (Game.Rand(100, "Rolling for Pikeman upgrade") < 50)
end

function CanHaveCrossbowmanUpgrade(pPlayer, iUpgradeUnitClassType)
  -- Crossbowman to Gatling Gun or Rifleman?
  if (iUpgradeUnitClassType == iUnitClassGatlingGun) then
    local bCanTrainRiflemen = CanTrain(pPlayer, iUnitClassRifleman)

    -- If we can train Riflemen AND have no Riflemen, never
    if (bCanTrainRiflemen and CountUnitsOfClass(pPlayer, iUnitClassRifleman, true) == 0) then
      return false
    end

    -- If we have no Gatling Guns, always
    if (CountUnitsOfClass(pPlayer, iUnitClassGatlingGun, true) == 0) then
      return true
    end

    -- If we can't train Riflemen, wait until we can
    if (not bCanTrainRiflemen) then
      return false
    end
  else
    -- If we don't have enough Riflemen, always
    if (CountUnitsOfClass(pPlayer, iUnitClassMusketman, true) < iRiflemenPerGatlingGun) then
      return true
    end

    -- If we can't train Gatling Guns, wait until we can
    if (not CanTrain(pPlayer, iUnitClassGatlingGun)) then
      return false
    end
  end

  -- If we get here, we can train both Gatling Guns and Riflemen, so check the ratio
  local iGatlingGuns = CountUnitsOfClass(pPlayer, iUnitClassGatlingGun, true)
  local iRiflemen = CountUnitsOfClass(pPlayer, iUnitClassRifleman, true)

  local bWantGatlingGun = (iRiflemen > (iGatlingGuns * (iRiflemenPerGatlingGun+0.5)))
  local bWantRifleman = (iRiflemen < (iGatlingGuns * (iRiflemenPerGatlingGun-0.5)))

  if (iUpgradeUnitClassType == iUnitClassGatlingGun and bWantGatlingGun and not bWantRifleman) then
    return true
  elseif (iUpgradeUnitClassType == iUnitClassRifleman and bWantRifleman and not bWantGatlingGun) then
    return true
  end

  -- Randomise it
  return (Game.Rand(100, "Rolling for Crossbowman upgrade") < 50)
end

function OnCanHaveUpgrade(iPlayer, iUnit, iUpgradeUnitClassType, iUpgradeUnitType)
  local pPlayer = Players[iPlayer]

  -- Only do this for the AI, human players get to make a choice via the UI
  if (not pPlayer:IsHuman()) then
    local iUnitClassType = pPlayer:GetUnitByID(iUnit):GetUnitClassType()

    if (iUnitClassType == iUnitClassWarrior) then
      return CanHaveWarriorUpgrade(pPlayer, iUpgradeUnitClassType)
    elseif (iUnitClassType == iUnitClassPikeman) then
      return CanHavePikemanUpgrade(pPlayer, iUpgradeUnitClassType)
    elseif (iUnitClassType == iUnitClassCrossbowman) then
      return CanHaveCrossbowmanUpgrade(pPlayer, iUpgradeUnitClassType)
    end
  end

  return true
end
GameEvents.CanHaveUpgrade.Add(OnCanHaveUpgrade)

function OnUnitUpgraded(iPlayer, iOldUnit, iNewUnit, bGoodyHut)
  if (not bGoodyHut) then
    local pPlayer = Players[iPlayer]
    local pOldUnit = pPlayer:GetUnitByID(iOldUnit)
    local iOldUnitClassType = pOldUnit:GetUnitClassType()

	if (iOldUnitClassType == iUnitClassWarrior or iOldUnitClassType == iUnitClassPikeman or iOldUnitClassType == iUnitClassCrossbowman) then
      print(string.format("Player %i upgraded %s to %s", iPlayer, Locale.Lookup(pOldUnit:GetName()), Locale.Lookup(pPlayer:GetUnitByID(iNewUnit):GetName())))
	end
  end
end
GameEvents.UnitUpgraded.Add(OnUnitUpgraded)


function OnCanDoCommand(iPlayer, iUnit, iCommand, iData1, iData2, iPlotX, iPlotY, bTestVisible)
  local pPlayer = Players[iPlayer]

  if (pPlayer:IsHuman() and iCommand == iCommandUpgrade) then
    local iUnitClassType = pPlayer:GetUnitByID(iUnit):GetUnitClassType()

    if (iUnitClassType == iUnitClassWarrior or iUnitClassType == iUnitClassPikeman or iUnitClassType == iUnitClassCrossbowman) then
      return false
    end
  end

  return true
end
GameEvents.CanDoCommand.Add(OnCanDoCommand)


function OnCustomMissionPossible(iPlayer, iUnit, iMission, iData1, iData2, _, _, iPlotX, iPlotY, bTestVisible)
  local pPlayer = Players[iPlayer]

  if (pPlayer:IsHuman() and iMission == iMissionUpgrade) then
    local pUnit = pPlayer:GetUnitByID(iUnit)
    local iUnitClassType = pUnit:GetUnitClassType()

    if (iUnitClassType == iUnitClassWarrior or iUnitClassType == iUnitClassPikeman or iUnitClassType == iUnitClassCrossbowman) then
      return pUnit:CanUpgradeRightNow(bTestVisible and 1 or 0)
    end
  end

  return false
end
GameEvents.CustomMissionPossible.Add(OnCustomMissionPossible)

function OnCustomMissionStart(iPlayer, iUnit, iMission, iData1, iData2, iFlags, iTurn)
  local pPlayer = Players[iPlayer]

  if (pPlayer:IsHuman() and iMission == iMissionUpgrade) then
    local pUnit = pPlayer:GetUnitByID(iUnit)
    local iUnitClassType = pUnit:GetUnitClassType()

    if (iUnitClassType == iUnitClassWarrior or iUnitClassType == iUnitClassPikeman or iUnitClassType == iUnitClassCrossbowman) then
      if (g_ShowingUpgradePanel) then
        HideUpgradePanel()
      else
        g_UpgradeIM:ResetInstances()

        local upgradeStackSize = Controls.UpgradePanel:GetSize()
        local iUpgradesAvailable = 0

        local iUnitType = pPlayer:GetSpecificUnitType(GameInfo.UnitClasses[iUnitClassType].Type)
        for row in GameInfo.Unit_ClassUpgrades{UnitType = GameInfo.Units[iUnitType].Type} do
          local iUpgradeUnitType = pPlayer:GetSpecificUnitType(row.UnitClassType)
          local upgradeUnit = GameInfo.Units[iUpgradeUnitType]
		  local bEnabled = pUnit:CanUpgradeTo(iUpgradeUnitType)
          -- print(string.format("MultipleUpgrade: %s --> %s is %s", Locale.Lookup(pUnit:GetName()), Locale.Lookup(upgradeUnit.Description), (bEnabled and "enabled" or "disabled")))

          local instance = g_UpgradeIM:GetInstance()
          local iOffsetX = (iUpgradesAvailable % upgradesPerRow) * upgradeButtonSize + upgradeButtonPadding + upgradeButtonOffsetX
          local iOffsetY = math.floor(iUpgradesAvailable / upgradesPerRow) * upgradeButtonSize + upgradeButtonPadding + upgradeButtonOffsetY
          instance.UnitUpgradeButton:SetOffsetVal(iOffsetX, iOffsetY)
          iUpgradesAvailable = iUpgradesAvailable + 1

          IconHookup(upgradeUnit.PortraitIndex, upgradeIconSize, upgradeUnit.IconAtlas, instance.UnitUpgradeIcon)
		  instance.UnitUpgradeButton:SetToolTipString(GetUpgradeToolTip(pPlayer, pUnit, iUpgradeUnitType, not bEnabled))

          if (bEnabled) then
            instance.UnitUpgradeButton:SetAlpha(1.0)
            instance.UnitUpgradeButton:SetDisabled(false)

            instance.UnitUpgradeButton:RegisterCallback(Mouse.eLClick, function() OnUnitUpgradeClicked(iPlayer, iUnit, iUpgradeUnitType) end)
          else
            instance.UnitUpgradeButton:SetAlpha(0.4)
            instance.UnitUpgradeButton:SetDisabled(true)
          end
        end

        ShowUpgradePanel(upgradeStackSize.x, iUpgradesAvailable)
      end
    end
  end

  return CUSTOM_MISSION_NO_ACTION
end
GameEvents.CustomMissionStart.Add(OnCustomMissionStart)

function OnCustomMissionCompleted(iPlayer, iUnit, iMission, iData1, iData2, iFlags, iTurn)
  local pPlayer = Players[iPlayer]

  if (pPlayer:IsHuman() and iMission == iMissionUpgrade) then
    -- Upgrading is instantaneous, so don't bother checking the unit (as it'll be "dead" anyway!)
    return true
  end

  return false
end
GameEvents.CustomMissionCompleted.Add(OnCustomMissionCompleted)

function OnUnitUpgradeClicked(iPlayer, iUnit, iUpgradeUnitType)
  local pUnit = Players[iPlayer]:GetUnitByID(iUnit)
  print(string.format("Player %i upgraded %s to %s", iPlayer, Locale.Lookup(pUnit:GetName()), Locale.Lookup(GameInfo.Units[iUpgradeUnitType].Description)))

  pUnit:UpgradeTo(iUpgradeUnitType, false)

  HideUpgradePanel()
end

function OnCloseButton()
  HideUpgradePanel()
end
Controls.CloseButton:RegisterCallback(Mouse.eLClick, OnCloseButton)

HideUpgradePanel()
