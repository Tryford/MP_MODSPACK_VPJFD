-- LUA YnaemInGame
-- Author: Gedemon
-- DateCreated: 11/1/2010
--------------------------------------------------------------

include( "ShareData.lua" )
include( "YnaemDefines" )
include( "YnaemUtils" )
include( "YnaemFunctions" )
include( "YnaemCityMap" )

local isUsingCulturalDiversity = JFD_IsUsingCulturalDiversity()
if isUsingCulturalDiversity then
	include( "JFD_CulDivUtilities.lua")	
end
--------------------------------------------------------------

-- dont start configuration sooner than needed
local WaitBeforeInitialize = true

function UpdateNaturalWonderName()
	print("-------------------------------")
	print ("YnAEMP is updating natural wonders name...")
	local savedData = Modding.OpenSaveData()
	local mapID = savedData.GetValue("MapID")
	if (mapID) then
		local table = g_NaturalWonderName[mapID]
		for tag, str in pairs (table) do
			print(tag .." = " .. str)
			SetText ( str, tag )
		end
	end
	Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )
	print("-------------------------------")
end

function YnaemRemoveCiv (playerID)
	local player = Players[playerID]
	-- kill all units
	for v in player:Units() do
		v:Kill()
	end
end

function GetPlayerBy (key, value)
	--print ("key = " .. key)
	--print ("value = " .. value)
	-- warning, could be more than one, but will return first found
	for player_num = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
		local player = Players[player_num]
		local checkValue
		if key == "civID" then checkValue = player:GetCivilizationType() end
		if key == "minorCivID" then checkValue = player:GetMinorCivType() end
		if checkValue == value then
			print ("player_num = " .. player_num)
			return player_num
		end
	end
end

function FinalizeCityState(numMinorCivs)
	-- tab for playerID
	local ynaemSelection = {}
	for playerID = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 1 do
		local player = Players[playerID]
		local minorCivID = player:GetMinorCivType()
		-- Does this civ exist ?
		if minorCivID ~= -1 then
			-- keep only TSL ?
			if (not MinorCivHasTSL(minorCivID) and PreGame.GetMapOption(MINOR_PLACEMENT) == MINOR_TSL_ONLY) then
				YnaemRemoveCiv (playerID)
			-- was marked for removing ?
			elseif string.find(modUserData.GetValue("ToRemove"), "minor"..minorCivID.."tr") then
				YnaemRemoveCiv (playerID)
				print ("kill marked civ : " .. minorCivID)
			else
				table.insert(ynaemSelection, playerID)
			end
		end
	end

	print ("Actual Number of City States = " .. #ynaemSelection )
		
	if #ynaemSelection > numMinorCivs then
		print ("Ok, exterminating a few settlers discretly..." )
		-- remove excedent
		-- but first shuffle selection
		-- so we can't be accused of deliberate ethnic cleaning
		for i = #ynaemSelection, 2, -1 do
			local r = math.random(i)
			ynaemSelection[i], ynaemSelection[r] = ynaemSelection[r], ynaemSelection[i]
		end
		-- keep only the requested number
		for i = numMinorCivs + 1 , #ynaemSelection do
			YnaemRemoveCiv (ynaemSelection[i])
		end		
	end
end

function FinalizeYnaem ()
	
	print("-------------------------------")
	print("Ynaemp script started")
	print("-------------------------------")
	if modUserData.GetValue("MapChecked") == "true" then
		modUserData.SetValue("MapChecked", "false")

		local reqNumMinor = modUserData.GetValue("NumMinorCivs")
		
		print("Loaded map : " .. PreGame.GetMapScript() )
		print("Finalize setup now")
		print("-------------------------------")
		print("To remove : " .. modUserData.GetValue("ToRemove"))
		print("Requested City States = ".. reqNumMinor)

		FinalizeCityState( reqNumMinor )

		print("City States placement finished")
		print("-------------------------------")
		if PreGame.GetMapOption(NO_US) == 1 then
			print("only native american option selected")
			-- warning, could remove the human player !
			for i = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
				local player = Players[i]
				local civID = player:GetCivilizationType()
				if isUsingCulturalDiversity then
					if (civID ~= -1 and JFD_GetCultureType(i) == "JFD_Colonial") then
						if player:IsHuman() then
							-- do nothing
							print ("human player is colonial, don't kill it !")
						else
							print("remove colonial units (Player " .. i .. ")")
							YnaemRemoveCiv (i)
						end	
					end
				elseif civID ~= -1 and (civID == GameInfoTypes["CIVILIZATION_AMERICA"] or civID == GameInfoTypes["CIVILIZATION_BRAZIL"]) then
					if player:IsHuman() then
						-- do nothing
						print ("human player is US/Brazil, don't kill it !")
					else
						print("remove US/Brazil units (Player " .. i .. ")")
						YnaemRemoveCiv (i)
					end
				end
			end 
		end

		--JFD: Remove non-TSL Majors
		print("Majors only", PreGame.GetMapOption(MAJOR_PLACEMENT))
		if PreGame.GetMapOption(MAJOR_PLACEMENT) == MAJOR_TSL_ONLY then
			for i = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
				local player = Players[i]
				local civID = player:GetCivilizationType()
				if (civID ~= -1 and (not CivHasTSL(civID))) then
					if player:IsHuman() then
						-- do nothing
						print ("human player is civ, don't kill it !")
					else
						print("remove (Player " .. i .. ")")
						YnaemRemoveCiv(i)
					end
				end
			end
		end

		local savedData = Modding.OpenSaveData()
		print ("YnAEMP initialization finished, saving MapID")
		savedData.SetValue("YnAEMPInitDone", 1)
		savedData.SetValue("MapID", modUserData.GetValue ("MapID"))

		print("-------------------------------")
	else	
		print("Mapcheck was negative, do nothing")
		print("-------------------------------")
	end
end


-- functions to call at first turn
function OnFirstTurn ()
	FinalizeYnaem ()
	UpdateNaturalWonderName()
end

-- functions to call when loading game
function OnLoading ()
	UpdateNaturalWonderName()
end

-- Initialize when YnaempInGame is loaded
if ( WaitBeforeInitialize ) then
	WaitBeforeInitialize = false
	local savedData = Modding.OpenSaveData()
	local iValue = savedData.GetValue("YnAEMPInitDone")
	if (iValue ~= 1) then
		OnFirstTurn()
	else
		OnLoading()
	end
end