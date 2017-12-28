--=======================================================================================================================
-- CityStateDialogueHelper.lua
--=======================================================================================================================
-- Global Variables
-------------------------------------------------
m_OldDialogue = nil
m_LastAction = "MESSAGE_GREETING"
m_OldLastAction = ""
m_PendingAction = ""; -- For bullying dialog popups

local L = Locale.ConvertTextKey
--=======================================================================================================================
-- GetCSDialogue
--=======================================================================================================================
function GetCSDialogue(pPlayer, iActivePlayer, bWar)

	local pActivePlayer = Players[iActivePlayer]
	local iActiveTeam = pActivePlayer:GetTeam()

	local sText = L("TXT_KEY_CITY_STATE_DIPLO_HELLO_PEACE_NEUTRAL") -- Fallback in case something goes wrong
	local sGift
	local bGreeting = (m_PopupInfo.Type == ButtonPopupTypes.BUTTONPOPUP_CITY_STATE_GREETING) 
					and ((m_LastAction == "MESSAGE_GREETING") or (m_LastAction == "MESSAGE_FIRST_GREETING"))

	local sMinorCivType = pPlayer:GetCivilizationShortDescriptionKey()
	local iMinorCivType = pPlayer:GetMinorCivType()
	local iTrait 		= pPlayer:GetMinorCivTrait()
	local iPersonality 	= pPlayer:GetPersonality()
	local bIsAlly 		= pPlayer:IsAllies(iActivePlayer)
	local bIsFriends 	= pPlayer:IsFriends(iActivePlayer)
	local bIsGuardian 	= pActivePlayer:IsProtectingMinor(pPlayer:GetID())	
	local bFirstMajorCiv = m_PopupInfo.Option1;

	if bGreeting then
		m_LastAction = "MESSAGE_FIRST_GREETING"
		m_PopupInfo.Type = nil
		local iGoldGift = m_PopupInfo.Data2
		local iFaithGift = m_PopupInfo.Data3

		if iGoldGift > 0 and iFaithGift > 0 then
			sGift = L("TXT_KEY_CITY_STATE_DIPLO_FIRST_GREETING_GOLD_FAITH_GIFT", iGoldGift, iFaithGift)
		elseif iGoldGift > 0 then
			sGift = L("TXT_KEY_CITY_STATE_DIPLO_FIRST_GREETING_GOLD_GIFT", iGoldGift)
		elseif iFaithGift > 0 then
			sGift = L("TXT_KEY_CITY_STATE_DIPLO_FIRST_GREETING_FAITH_GIFT", iFaithGift)
		end
	end	

	if bWar then

		-- Warmongering player
		if (pPlayer:IsPeaceBlocked(iActiveTeam)) then
			m_LastAction = "MESSAGE_AT_WAR_WARMONGER"
		else
			m_LastAction = "MESSAGE_AT_WAR"
		end
	end

	local tResponses = {}
	for tRow in GameInfo.Suk_MinorDialogue("MessageType = '" .. m_LastAction .. "'") do
		local bType = (tRow.MinorCivType == nil) or (GameInfoTypes[tRow.MinorCivType] == iMinorCivType)
		local bTrait = (tRow.MinorCivTrait == nil) or (GameInfoTypes[tRow.MinorCivTrait] == iTrait)
		local bPersonality = (tRow.MinorCivPersonality == nil) or (MinorCivPersonalityTypes[tRow.MinorCivPersonality] == iPersonality)
		local bFriends = (tRow.IsFriends == nil) or (tRow.IsFriends == bIsFriends)
		local bAllies = (tRow.IsAllied == nil) or (tRow.IsAllied == bIsAlly)
		local bGuardian = (tRow.IsProtected == nil) or (tRow.IsProtected == bIsGuardian)
		local bFirstToMeet = (tRow.IsFirstToMeet == nil) or (tRow.IsFirstToMeet == bFirstMajorCiv)

		if bType and bTrait and bPersonality and bFriends and bAllies and bGuardian and bFirstToMeet then
			
			local sResponse = L(tRow.Message, sMinorCivType)

			for i=1,tRow.Bias do
				table.insert(tResponses, sResponse)
			end
		end

		if #tResponses > 0 then
			sText = tResponses[math.random(#tResponses)]
		end
	end

	if sGift then sText = sText .. sGift end
	return sText

end
--=======================================================================================================================
-- GetCityStateResourceExports
--=======================================================================================================================
function GetCityStateResourceExports(pCityState)
	local pCapital = pCityState:GetCapitalCity()
	if (pCapital ~= nil) then
		local strResourceText = ""

		local iCityX = pCapital:GetX()
		local iCityY = pCapital:GetY()

		local iNumResourcesFound = 0
		local tResourceList = {}

		local iRange = GameDefines.MINOR_CIV_RESOURCE_SEARCH_RADIUS or 5
		local iCloseRange = math.floor((iRange/2))

		for i = 0, (iRange+1) * iRange * 3 do
			local pTargetPlot = pCapital:GetCityIndexPlot(i)
			if pTargetPlot ~= nil then

				local iOwner = pTargetPlot:GetOwner()

				local iX = pTargetPlot:GetX()
				local iY = pTargetPlot:GetY()
				local iDistance = Map.PlotDistance(iCityX, iCityY, iX, iY)

				if (iOwner == pCityState:GetID() or (iOwner == -1 and not(iDistance > iCloseRange))) then
					local iResourceType = pTargetPlot:GetResourceType(Game.GetActiveTeam())
					if (iResourceType ~= -1) then

						if (Game.GetResourceUsageType(iResourceType) ~= ResourceUsageTypes.RESOURCEUSAGE_BONUS) then

							if (tResourceList[iResourceType] == nil) then
								tResourceList[iResourceType] = 0
							end
							tResourceList[iResourceType] = tResourceList[iResourceType] + pTargetPlot:GetNumResource()

						end

					end
				end
			end
		end

		for iResourceType, iAmount in pairs(tResourceList) do
			if (iNumResourcesFound > 0) then
				strResourceText = strResourceText .. ", "
			end
			local pResource = GameInfo.Resources[iResourceType]
			strResourceText = strResourceText .. pResource.IconString .. " [COLOR_POSITIVE_TEXT]" .. L(pResource.Description) .. " (" .. iAmount .. ") [ENDCOLOR]"
			iNumResourcesFound = iNumResourcesFound + 1
		end

		if strResourceText == "" then return end
		return strResourceText
	end
end
--=======================================================================================================================
-- GetCityStateRelations
--=======================================================================================================================
function GetCityStateRelations(iMinor, iActivePlayer)

	local pActivePlayer = Players[iActivePlayer]
	local iActiveTeam = Game.GetActiveTeam()
	local pActiveTeam = Teams[iActiveTeam]

	local pMinor = Players[iMinor]
	local iMinorTeam = pMinor:GetTeam()
	local pMinorTeam = Teams[iMinorTeam]

	local tRelations = {}

	-- Then loop through all the Majors
	for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do

		local pPlayer = Players[iPlayer]
		local iTeam = pPlayer:GetTeam()

		if (pPlayer:IsEverAlive() and pPlayer:IsAlive()) then

			local bHasMet = pActiveTeam:IsHasMet(iTeam)
			local bIsAlly = pMinor:IsAllies(iPlayer)

			if (bHasMet or bIsAlly) then

				local bIsFriends = pMinor:IsFriends(iPlayer)
				local bIsWar = pMinorTeam:IsAtWar(iTeam)
				local bIsGuardian = pPlayer:IsProtectingMinor(iMinor)

				local tRelation 	= {
					Player		= iPlayer,
					Team		= iTeam,
					HasMet		= bHasMet,
					Allied		= bIsAlly,
					Friends		= bIsFriends,
					Guardian	= bIsGuardian,
					War			= bIsWar,
					Influence	= pMinor:GetMinorCivFriendshipWithMajor(iPlayer)
				}

				if (bIsAlly) or (bHasMet and (bIsFriends or bIsGuardian or bIsWar)) then
					table.insert(tRelations, tRelation)
				end  

			end
		end

	end

	return tRelations
end