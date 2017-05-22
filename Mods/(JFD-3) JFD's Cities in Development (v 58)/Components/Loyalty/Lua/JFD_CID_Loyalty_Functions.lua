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
local userSettingLoyaltyCore   = JFD_GetUserSetting("JFD_CID_LOYALTY_CORE") == 1
local userSettingLoyaltyCoreAI = JFD_GetUserSetting("JFD_CID_LOYALTY_CORE_AI") == 1
local userSettingLoyaltyCities = JFD_GetUserSetting("JFD_CID_LOYALTY_CITIES")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local activePlayerID 	= Game.GetActivePlayer()
local activePlayer 		= Players[activePlayerID]
local convertTextKey 	= Locale.ConvertTextKey
local mathCeil 			= math.ceil
local mathMax			= math.max
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
-- LOYALTY 
--------------------------------------------------------------------------------------------------------------------------
-- JFD_CID_Loyalty_CityFounded
function JFD_CID_Loyalty_CityFounded(playerID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (player:IsMinorCiv() or player:IsBarbarian()) then return end
	local city = Map.GetPlot(plotX, plotY):GetPlotCity()
	if (not city) then return end
	local loyaltyID, loyaltyPercent = JFD_CalculateCityLoyalty(playerID, city, false)
	if loyaltyID > -1 then
		local loyalty = GameInfo.JFD_Loyalties[loyaltyID]
		local buildingID = GameInfoTypes[loyalty.BuildingType]
		if (not city:HasBuilding(buildingID)) then
			city:SetNumRealBuilding(buildingID, 1, true)
		end
	end
end
if userSettingLoyaltyCore then
	GameEvents.PlayerCityFounded.Add(JFD_CID_Loyalty_CityFounded)	
end

-- JFD_CID_Loyalty_PlayerDoTurn
local buildingDisloyaltyID   = GameInfoTypes["BUILDING_JFD_DISLOYALTY"]
local loyaltyAllegiantID	 = GameInfoTypes["LOYALTY_JFD_ALLEGIANT"]
local loyaltyPatrioticID	 = GameInfoTypes["LOYALTY_JFD_PATRIOTIC"]	
local loyaltyNeutralID		 = GameInfoTypes["LOYALTY_JFD_NEUTRAL"]	
local loyaltyRebelliousID    = GameInfoTypes["LOYALTY_JFD_REBELLIOUS"]
local loyaltySeparatistID    = GameInfoTypes["LOYALTY_JFD_SEPARATIST"]
local notificationCityLostID = NotificationTypes["NOTIFICATION_CITY_LOST"]
local playerBarbarian = Players[63]
function JFD_CID_Loyalty_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (player:IsMinorCiv() or player:IsBarbarian()) then return end
	if ((not userSettingLoyaltyCoreAI) and (not player:IsHuman())) then return end
	for city in player:Cities() do
		local loyaltyID, loyaltyPercent = JFD_CalculateCityLoyalty(playerID, city)
		if loyaltyID > -1 then
			--Loyalty Marker
			local loyalty = GameInfo.JFD_Loyalties[loyaltyID]
			local buildingLoyaltyID = GameInfoTypes[loyalty.BuildingType]
			if (not city:HasBuilding(buildingLoyaltyID)) then
				city:SetNumRealBuilding(buildingLoyaltyID, 1, true)
				local loyaltyNotificationShort = loyalty.NotificationShortDesc
				if (player:IsHuman() and loyaltyNotificationShort) then
					JFD_SendNotification(activePlayerID, loyalty.NotificationType, Locale.ConvertTextKey(loyalty.NotificationDesc, city:GetName()), Locale.ConvertTextKey(loyaltyNotificationShort, city:GetName()), false, city:GetX(), city:GetY())
					if loyalty.SoundEffect then
						Events.AudioPlay2DSound(loyalty.SoundEffect)
					end
				end
			end
			for row in GameInfo.JFD_Loyalties("ID <> '" .. loyaltyID .. "'") do
				local otherBuildingID = GameInfoTypes[row.BuildingType]
				if city:HasBuilding(otherBuildingID) then
					city:SetNumRealBuilding(otherBuildingID, 0)
				end
			end
			local revoltCounter, revoltThreshold, revoltRate, revoltTurns, WLTKDCounter, WLTKDThreshold, WLTKDRate, WLTKDTurns = JFD_GetLoyaltyCounter(playerID, city, loyaltyID, true)
			if revoltRate ~= 0 then
				JFD_ChangeLoyaltyCounter(playerID, city, revoltRate)
			end
			if WLTKDRate ~= 0 then
				JFD_ChangeLoyaltyCounter(playerID, city, WLTKDRate, true)
			end
		end
	end
end
if userSettingLoyaltyCore then
	GameEvents.PlayerDoTurn.Add(JFD_CID_Loyalty_PlayerDoTurn)
end
------------------------------------------------------------------------------------------------------------------------
-- REVOLT
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Loyalty_RevoltBegins
local buildingDiseaseID   = GameInfoTypes["BUILDING_JFD_DISEASE"]
local cityFocusFoodID     = CityAIFocusTypes["CITY_AI_FOCUS_TYPE_FOOD"]
local promotionPlaguedID  = GameInfoTypes["PROMOTION_JFD_PLAGUED"]
function JFD_CID_Loyalty_RevoltBegins(playerID, city, plotX, plotY, plagueTurns)
	local player = Players[playerID]
	local originalOwnerID = city:GetOriginalOwner()
	local originalOwner = Players[originalOwnerID]
	local loyaltyID = JFD_GetCityLoyaltyID(playerID, city)
	JFD_SetLoyaltyCounter(playerID, city, 0)
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
		local unitCount = mathMax(1,mathCeil(city:GetPopulation()/3))
		for value = 1, unitCount do
			local newUnit = rebelPlayer:InitUnit(rebelUnitID, city:GetX()+1, city:GetY())
			if (newUnit:GetPlot():IsWater() or newUnit:GetPlot():GetNumUnits() > 0) then newUnit:JumpToNearestValidPlot() end
			newUnit:SetName("Rebel")
		end
	end
end
if userSettingLoyaltyCore then
	LuaEvents.JFD_RevoltBegins.Add(JFD_CID_Loyalty_RevoltBegins)
end
------------------------------------------------------------------------------------------------------------------------
-- WLTKD
------------------------------------------------------------------------------------------------------------------------
--JFD_CID_Loyalty_WLTKBegins
function JFD_CID_Loyalty_WLTKBegins(playerID, city, plotX, plotY, WLTKDTurns)
	local player = Players[playerID]
	JFD_SetLoyaltyCounter(playerID, city, 0, true)
	city:ChangeWeLoveTheKingDayCounter(WLTKDTurns)
	if player:IsHuman() then
		Events.AudioPlay2DSound("AS2D_SOUND_JFD_WLTKD")
		JFD_SendNotification(playerID, "NOTIFICATION_CAPITAL_RECOVERED", Locale.ConvertTextKey("TXT_KEY_JFD_CITY_WLTKD_NOTIFICATION", city:GetName(), WLTKDTurns), Locale.ConvertTextKey("TXT_KEY_JFD_CITY_WLTKD_NOTIFICATION_SHORT", city:GetName()), false, plotX, plotY)
	end
end
if userSettingLoyaltyCore then
	LuaEvents.JFD_WLTKDBegins.Add(JFD_CID_Loyalty_WLTKBegins)
end
--=======================================================================================================================
--=======================================================================================================================