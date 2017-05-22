-- Sukritact_HotkeyManager
-- Author: Sukrit
-- DateCreated: 2/4/2016 8:14:30 AM
--=======================================================================================================================
-- Prevent Duplicates
--=======================================================================================================================
if MapModData.Sukritact_HotkeyManager then return end
MapModData.Sukritact_HotkeyManager = true
Events.SequenceGameInitComplete.Add(function() MapModData.Sukritact_HotkeyManager = nil end)
--=======================================================================================================================
-- Globals
--=======================================================================================================================
tNoMods = {}
tShift = {}
tCtrl = {}
tAlt = {}

-- 2 Modifiers
tShiftCtrl = {}
tShiftAlt = {}
tCtrlAlt = {}

-- 3 Modifiers
tShiftCtrlAlt = {}

for tRow in GameInfo.Sukritact_HotkeyManager() do

	local sLuaEvent = tRow.LuaEventName
	local iHotKey = Keys[tRow.Hotkey]

	if sLuaEvent and iHotKey then
		local bShift = tRow.ShiftDown
		local bCtrl = tRow.CtrlDown
		local bAlt = tRow.AltDown

		if bShift and bCtrl and bAlt then
			tShiftCtrlAlt[iHotKey] = LuaEvents[sLuaEvent]

		elseif bShift and bCtrl then
			tShiftCtrl[iHotKey] = LuaEvents[sLuaEvent]

		elseif bShift and bAlt then
			tShiftAlt[iHotKey] = LuaEvents[sLuaEvent]

		elseif bCtrl and bAlt then
			tCtrlAlt[iHotKey] = LuaEvents[sLuaEvent]

		elseif bShift then
			tShift[iHotKey] = LuaEvents[sLuaEvent]

		elseif bCtrl then
			tCtrl[iHotKey] = LuaEvents[sLuaEvent]

		elseif bAlt then
			tAlt[iHotKey] = LuaEvents[sLuaEvent]

		else
			tNoMods[iHotKey] = LuaEvents[sLuaEvent]
		end
	end
end
--=======================================================================================================================
-- InputHandler
--=======================================================================================================================
function InputHandler(uiMsg, wParam, lParam)
	if not(uiMsg == KeyEvents.KeyDown) then return end

	local bShift = UIManager:GetShift()
	local bCtrl = UIManager:GetControl()
	local bAlt = UIManager:GetAlt()

	if bShift and bCtrl and bAlt then
		if tShiftCtrlAlt[wParam] then
			tShiftCtrlAlt[wParam]()
		end
	elseif bShift and bCtrl then
		if tShiftCtrl[wParam] then
			tShiftCtrl[wParam]()
		end

	elseif bShift and bAlt then
		if tShiftAlt[wParam] then
			tShiftAlt[wParam]()
		end

	elseif bCtrl and bAlt then
		if tCtrlAlt[wParam] then
			tCtrlAlt[wParam]()
		end

	elseif bShift then
		if tShift[wParam] then
			tShift[wParam]()
		end

	elseif bCtrl then
		if tCtrl[wParam] then
			tCtrl[wParam]()
		end

	elseif bAlt then
		if tAlt[wParam] then
			tAlt[wParam]()
		end

	else
		if tNoMods[wParam] then
			tNoMods[wParam]()
		end
	end
end
ContextPtr:SetInputHandler(InputHandler)
--=======================================================================================================================
--=======================================================================================================================
