--=======================================================================================================================
-- Sukritact_SaveUtils
-- Modified from NewSaveUtils.lua
--=======================================================================================================================
--=======================================================================================================================
function InitializeInstances()
	--print(Player)
	--print(Player)
	--print(Team)
	--print(Team)
	--print(Plot)
	local pPlot = Map.GetPlotByIndex(0)
	--print(Plot)
	--print(Unit)
	local pPlayer = Players[0]
	for pUnit in pPlayer:Units() do
		break
	end
	--print(Unit)
end
InitializeInstances()

function CompileUnitID(pUnit)
	local iOwner = pUnit:GetOwner()
	local iUnit = pUnit:GetID()
	local iTurn = pUnit:GetGameTurnCreated()
    return(iOwner .. "_ID" .. iUnit .. "_T" .. iTurn)
end

function CompilePlotID(pPlot)
    local iX = pPlot:GetX()
    local iY = pPlot:GetY()
    return(iX .. "_Y" .. iY)
end
--=======================================================================================================================
-- Save/Load Functions
--=======================================================================================================================
function save(pObject, sKey, Val)
	
	--Booleans must be converted to strings
	if Val == true then
		Val = "bTrue"
	elseif Val == false then
		Val = "bFalse"
	end
	
	local sTrueKey = nil
	--if pObject == "GAME" or variants save without other ID
	if (type(pObject) == "string") then
		if string.upper(pObject) == "GAME" then
			sTrueKey = (MY_MOD_NAME .. "_" .. sKey)
		else
			--print("Error on Save: Invalid type")
			return
		end
	--Else ensure pObject is an Object
	elseif (pObject == nil or type(pObject) ~= "table") then
		--print("Error on Save: Invalid type")
		return
	end
	
	--Player
	if (getmetatable(pObject).__index == Player) then
		sTrueKey = (MY_MOD_NAME .. "_Player" .. pObject:GetID() .. "_" .. sKey)
	--Team
	elseif (getmetatable(pObject).__index == Team) then
		sTrueKey = (MY_MOD_NAME .. "_Team" .. pObject:GetID() .. "_" .. sKey)
	--Unit
	elseif (getmetatable(pObject).__index == Unit) then
		sTrueKey = (MY_MOD_NAME .. "_Unit".. CompileUnitID(pObject) .. "_" .. sKey)
	--Plot
	elseif (getmetatable(pObject).__index == Plot) then
		sTrueKey = (MY_MOD_NAME .. "_Plot".. CompilePlotID(pObject) .. "_" .. sKey)
	end
	
	--Save Data
	if	sTrueKey ~= nil then
		--print("Save", sTrueKey, Val)
		MY_MOD_SAVE[sTrueKey] = Val
	else
		--print("Error on Save: Key Creation Failed")
	end
end

function Load_Booleanfy(Val)
	--Booleans must be converted from strings
	if Val == "bTrue" then
		Val = true
	elseif Val == "bFalse" then
		Val = false
	end
	return Val
end

function load(pObject, sKey)
	
	local sTrueKey = nil
	--if pObject == "GAME" or variants save without other ID
	if (type(pObject) == "string") then
		if string.upper(pObject) == "GAME" then
			sTrueKey = (MY_MOD_NAME .. "_" .. sKey)
		else
			--print("Error on Load: Invalid type")
			return
		end
	--Else ensure pObject is an Object
	elseif (pObject == nil or type(pObject) ~= "table") then
		--print("Error on Load: Invalid type")
		return
	end
	
	--Player
	if (getmetatable(pObject).__index == Player) then
		sTrueKey = (MY_MOD_NAME .. "_Player" .. pObject:GetID() .. "_" .. sKey)
	--Team
	elseif (getmetatable(pObject).__index == Team) then
		sTrueKey = (MY_MOD_NAME .. "_Team" .. pObject:GetID() .. "_" .. sKey)
	--Unit
	elseif (getmetatable(pObject).__index == Unit) then
		sTrueKey = (MY_MOD_NAME .. "_Unit".. CompileUnitID(pObject) .. "_" .. sKey)
	--Plot
	elseif (getmetatable(pObject).__index == Plot) then
		sTrueKey = (MY_MOD_NAME .. "_Plot".. CompilePlotID(pObject) .. "_" .. sKey)
	end
	
	--Load Data
	if	sTrueKey ~= nil then
		Val = Load_Booleanfy(MY_MOD_SAVE[sTrueKey])
		--print("Load", sTrueKey, Val)
		return Val
	else
		--print("Error on Load: Key Creation Failed")
	end
end