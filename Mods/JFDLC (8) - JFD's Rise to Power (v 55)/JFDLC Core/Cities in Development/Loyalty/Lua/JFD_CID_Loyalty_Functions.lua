-- JFD_CID_Loyalty_Functions
-- Author: JFD
-- DateCreated: 2/10/2015 8:30:19 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("IconSupport")
include("JFD_CID_ColoniesUtils.lua")
include("JFD_CID_LoyaltyUtils.lua")
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingCIDLoyaltyCore								 = (Game.GetUserSetting("JFD_CID_LOYALTY_CORE") == 1)
local userSettingCIDLoyaltyCoreAI							 = (Game.GetUserSetting("JFD_CID_LOYALTY_CORE_AI") == 1)
local userSettingCIDLoyaltyCities							 = (Game.GetUserSetting("JFD_CID_LOYALTY_CITIES"))
local userSettingCIDLoyaltyCoreFirstNotificationRevoltTurns  = (Game.GetUserSetting("JFD_CID_LOYALTY_CORE_FIRST_NOTIFICATION_REVOLT_TURNS"))
local userSettingCIDLoyaltyCoreSecondNotificationRevoltTurns = (Game.GetUserSetting("JFD_CID_LOYALTY_CORE_SECOND_NOTIFICATION_REVOLT_TURNS"))
local userSettingCIDLoyaltyCoreFirstNotificationWLTKDTurns   = (Game.GetUserSetting("JFD_CID_LOYALTY_CORE_FIRST_NOTIFICATION_WLTKD_TURNS"))
local userSettingCIDLoyaltyCoreSecondNotificationWLTKDTurns  = (Game.GetUserSetting("JFD_CID_LOYALTY_CORE_SECOND_NOTIFICATION_WLTKD_TURNS"))
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local activePlayerID 		 = Game.GetActivePlayer()
local activePlayer 			 = Players[activePlayerID]
local convertTextKey 		 = Locale.ConvertTextKey
local mathMax				 = math.max

local loyaltyAllegiantID	 = GameInfoTypes["LOYALTY_JFD_ALLEGIANT"]
local loyaltyPatrioticID	 = GameInfoTypes["LOYALTY_JFD_PATRIOTIC"]	
local loyaltyNeutralID		 = GameInfoTypes["LOYALTY_JFD_NEUTRAL"]	
local loyaltyRebelliousID    = GameInfoTypes["LOYALTY_JFD_REBELLIOUS"]
local loyaltySeparatistID    = GameInfoTypes["LOYALTY_JFD_SEPARATIST"]
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- LOYALTY 
--------------------------------------------------------------------------------------------------------------------------
-- JFD_CID_Loyalty_PlayerCityFounded
function JFD_CID_Loyalty_PlayerCityFounded(playerID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (not player:IsHuman()) then return end
	local city = Map.GetPlot(plotX, plotY):GetPlotCity()
	if (not city) then return end
	local loyaltyID = player:CalculateCityLoyalty(city)
	city:SetLoyaltyState(loyaltyID)
end
if userSettingCIDLoyaltyCore then
	GameEvents.PlayerCityFounded.Add(JFD_CID_Loyalty_PlayerCityFounded)	
end

--JFD_CID_Loyalty_CityCaptureComplete
function JFD_CID_Loyalty_CityCaptureComplete(oldOwnerID, capital, plotX, plotY, newOwnerID, population, isConquest)
	local player = Players[newOwnerID]
	local city = Map.GetPlot(plotX, plotY):GetPlotCity()
	if (not city) then return end
	local loyaltyID = player:CalculateCityLoyalty(city)
	city:SetLoyaltyState(loyaltyID)
end
if userSettingCIDLoyaltyCore then
	GameEvents.CityCaptureComplete.Add(JFD_CID_Loyalty_CityCaptureComplete)	
end

-- JFD_CID_Loyalty_PlayerDoTurn
local notificationCityLostID = NotificationTypes["NOTIFICATION_CITY_LOST"]
local playerBarbarian 		 = Players[63]
function JFD_CID_Loyalty_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (player:IsMinorCiv() or player:IsBarbarian()) then return end
	if ((not userSettingCIDLoyaltyCoreAI) and (not player:IsHuman())) then return end
	for city in player:Cities() do
		local loyaltyID, loyaltyPercent = player:CalculateCityLoyalty(city)
		if loyaltyID ~= city:GetLoyaltyState() then city:SetLoyaltyState(loyaltyID) end
		if city:GetWeLoveTheKingDayCounter() == 0 then
			local revoltCounter, revoltThreshold, revoltRate, revoltRateTT, revoltTurns, WLTKDCounter, WLTKDThreshold, WLTKDRate, WLTKDRateTT, WLTKDTurns = player:GetCityLoyaltyCounterDetails(city, loyaltyID, true)
			if revoltRate ~= 0 then
				-- if (city:GetLoyaltyCounter() >= 0 and revoltRate > 0) then
					-- city:ChangeDisloyaltyCounter(revoltRate)
				-- end
				if city:GetDisloyaltyCounter() >= 0 then
					city:ChangeDisloyaltyCounter(revoltRate)
				end
				revoltCounter, revoltThreshold, revoltRate, revoltRateTT, revoltTurns = player:GetCityLoyaltyCounterDetails(city, loyaltyID, false, true, true, true)
				if revoltCounter >= revoltThreshold then
					LuaEvents.JFD_RevoltBegins(playerID, city, city:GetX(), city:GetY(), loyaltyID)
				elseif (userSettingCIDLoyaltyCoreFirstNotificationRevoltTurns > 0 and revoltTurns == userSettingCIDLoyaltyCoreFirstNotificationRevoltTurns) then
					JFD_SendNotification(playerID, "NOTIFICATION_CITY_LOST", Locale.ConvertTextKey("TXT_KEY_JFD_CITY_IMPENDING_REVOLT_NOTIFICATION", city:GetName(), revoltTurns), Locale.ConvertTextKey("TXT_KEY_JFD_CITY_IMPENDING_REVOLT_NOTIFICATION_SHORT", city:GetName()), false, city:GetX(), city:GetY())
				elseif (userSettingCIDLoyaltyCoreSecondNotificationRevoltTurns > 0 and revoltTurns == userSettingCIDLoyaltyCoreSecondNotificationRevoltTurns) then
					JFD_SendNotification(playerID, "NOTIFICATION_CITY_LOST", Locale.ConvertTextKey("TXT_KEY_JFD_CITY_IMPENDING_REVOLT_NOTIFICATION", city:GetName(), revoltTurns), Locale.ConvertTextKey("TXT_KEY_JFD_CITY_IMPENDING_REVOLT_NOTIFICATION_SHORT", city:GetName()), false, city:GetX(), city:GetY())
				end
			end
			if WLTKDRate ~= 0 then
				if city:GetLoyaltyCounter() >= 0 then
					city:ChangeLoyaltyCounter(WLTKDRate)
				end
				-- if (city:GetDisloyaltyCounter() > 0  and WLTKDRate < 0) then
					-- city:ChangeLoyaltyCounter(WLTKDRate)
				-- end
				WLTKDCounter, WLTKDThreshold, WLTKDRate, WLTKDRateTT, WLTKDTurns = player:GetCityLoyaltyCounterDetails(city, loyaltyID, false, false, false, false, true, true, true, true)
				if WLTKDCounter >= WLTKDThreshold then
					LuaEvents.JFD_WLTKDBegins(playerID, city, city:GetX(), city:GetY(), (city:GetPopulation()/2))
				elseif (userSettingCIDLoyaltyCoreFirstNotificationWLTKDTurns > 0 and WLTKDTurns == userSettingCIDLoyaltyCoreFirstNotificationWLTKDTurns) then
					JFD_SendNotification(playerID, "NOTIFICATION_CAPITAL_RECOVERED", Locale.ConvertTextKey("TXT_KEY_JFD_CITY_IMPENDING_WLTKD_NOTIFICATION", city:GetName(), WLTKDTurns), Locale.ConvertTextKey("TXT_KEY_JFD_CITY_IMPENDING_WLTKD_NOTIFICATION_SHORT", city:GetName()), false, city:GetX(), city:GetY())
				elseif (userSettingCIDLoyaltyCoreSecondNotificationWLTKDTurns > 0 and WLTKDTurns == userSettingCIDLoyaltyCoreSecondNotificationWLTKDTurns) then
					JFD_SendNotification(playerID, "NOTIFICATION_CAPITAL_RECOVERED", Locale.ConvertTextKey("TXT_KEY_JFD_CITY_IMPENDING_WLTKD_NOTIFICATION", city:GetName(), WLTKDTurns), Locale.ConvertTextKey("TXT_KEY_JFD_CITY_IMPENDING_WLTKD_NOTIFICATION_SHORT", city:GetName()), false, city:GetX(), city:GetY())
				end
			end
		end
	end
end
if userSettingCIDLoyaltyCore then
	GameEvents.PlayerDoTurn.Add(JFD_CID_Loyalty_PlayerDoTurn)
end

--JFD_CID_Loyalty_LoyaltyStateChanged
function JFD_CID_Loyalty_LoyaltyStateChanged(playerID, cityID, oldLoyaltyID, newLoyaltyID)
	if oldLoyaltyID == -1 then return end
	local player = Players[playerID]
	local city = player:GetCityByID(cityID)
	local loyalty = GameInfo.JFD_Loyalties[newLoyaltyID]
	local loyaltyNotificationShort = loyalty.NotificationShortDesc
	if (player:IsHuman() and loyaltyNotificationShort) then
		JFD_SendNotification(activePlayerID, loyalty.NotificationType, Locale.ConvertTextKey(loyalty.NotificationDesc, city:GetName()), Locale.ConvertTextKey(loyaltyNotificationShort, city:GetName()), false, city:GetX(), city:GetY())
		if loyalty.SoundEffect then
			Events.AudioPlay2DSound(loyalty.SoundEffect)
		end
	end
end
if userSettingCIDLoyaltyCore then
	GameEvents.LoyaltyStateChanged.Add(JFD_CID_Loyalty_LoyaltyStateChanged)
end
------------------------------------------------------------------------------------------------------------------------
-- REVOLT
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Loyalty_RevoltBegins
function JFD_CID_Loyalty_RevoltBegins(playerID, city, plotX, plotY, loyaltyID)
	local player = Players[playerID]
	local originalOwnerID = city:GetOriginalOwner()
	local originalOwner = Players[originalOwnerID]
	city:SetDisloyaltyCounter(0)
	if loyaltyID == loyaltySeparatistID then	
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_CITY_REVOLT", city:GetName(), player:GetCivilizationDescription()))
		if (originalOwnerID ~= playerID and (originalOwner:IsAlive() and player:IsAtWarWith(originalOwnerID)) or (originalOwner:IsMinorCiv() and originalOwner:IsEverAlive())) then
			originalOwner:AcquireCity(city, true)
		else
			playerBarbarian:AcquireCity(city, true)
		end
		if player:IsHuman() then
			JFD_SendNotification(playerID, "NOTIFICATION_CITY_LOST", Locale.ConvertTextKey("TXT_KEY_JFD_CITY_REVOLT_NOTIFICATION", city:GetName()), Locale.ConvertTextKey("TXT_KEY_JFD_CITY_REVOLT_NOTIFICATION_SHORT", city:GetName()), false, city:GetX(), city:GetY())
			Events.AudioPlay2DSound("AS2D_SOUND_JFD_REVOLT")
		end
	elseif loyaltyID == loyaltyRebelliousID then	
		if player:IsHuman() then
			JFD_SendNotification(playerID, "NOTIFICATION_CITY_LOST", Locale.ConvertTextKey("TXT_KEY_JFD_CITY_REVOLT_NOTIFICATION", city:GetName()), Locale.ConvertTextKey("TXT_KEY_JFD_CITY_REVOLT_NOTIFICATION_SHORT", city:GetName()), false, city:GetX(), city:GetY())
			Events.AudioPlay2DSound("AS2D_SOUND_JFD_REVOLT")
		end
	end
	local rebelPlayer = nil
	local rebelUnitID = nil
	if (originalOwnerID ~= playerID and originalOwner:IsAlive() and player:IsAtWarWith(originalOwnerID)) then
		rebelPlayer = originalOwner
		rebelUnitID = GetStrongestMilitaryUnit(originalOwner, true, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")
	else
		rebelPlayer = playerBarbarian
		rebelUnitID = GetStrongestMilitaryUnit(playerBarbarian, true, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")
	end
	if rebelUnitID then
		local unitCount = mathMax(1,Game.GetRound(city:GetPopulation()/3))
		for value = 1, unitCount do
			local newUnit = rebelPlayer:InitUnit(rebelUnitID, city:GetX()+1, city:GetY())
			if (newUnit:GetPlot():IsWater() or newUnit:GetPlot():GetNumUnits() > 0) then newUnit:JumpToNearestValidPlot() end
			newUnit:SetName("Rebel")
		end
	end
end
if userSettingCIDLoyaltyCore then
	LuaEvents.JFD_RevoltBegins.Add(JFD_CID_Loyalty_RevoltBegins)
end
------------------------------------------------------------------------------------------------------------------------
-- WLTKD
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Loyalty_WLTKDBegins
function JFD_CID_Loyalty_WLTKDBegins(playerID, city, plotX, plotY, WLTKDTurns, loyaltyID, skipsLoyaltyReset)
	local player = Players[playerID]
	if (not skipsLoyaltyReset) then 
		city:SetLoyaltyCounter(0)
	end
	for row in GameInfo.Policies("WLTKDModifier <> 0") do
		if player:HasPolicy(row.ID) then
			local newWLTKDTurns = Game.GetRound((WLTKDTurns*row.WLTKDModifier)/100)
			WLTKDTurns = WLTKDTurns + newWLTKDTurns
		end
	end
	city:ChangeWeLoveTheKingDayCounter(WLTKDTurns)
	if (player:IsHuman() and city:GetWeLoveTheKingDayCounter() == 0) then
		Events.AudioPlay2DSound("AS2D_SOUND_JFD_WLTKD")
		if (not skipsLoyaltyReset) then 
			JFD_SendNotification(playerID, "NOTIFICATION_CAPITAL_RECOVERED", Locale.ConvertTextKey("TXT_KEY_JFD_CITY_WLTKD_NOTIFICATION", city:GetName(), WLTKDTurns), Locale.ConvertTextKey("TXT_KEY_JFD_CITY_WLTKD_NOTIFICATION_SHORT", city:GetName()), false, plotX, plotY)
		end
	end
end
LuaEvents.JFD_WLTKDBegins.Add(JFD_CID_Loyalty_WLTKDBegins)
--=======================================================================================================================
--=======================================================================================================================