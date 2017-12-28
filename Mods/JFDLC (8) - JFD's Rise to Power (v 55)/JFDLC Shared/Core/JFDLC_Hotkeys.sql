--=======================================================================================================================
-- SUKRITACT_HOTKEYMANAGER
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS 
	Sukritact_HotkeyManager (
	LuaEventName		text	default NULL,
	Hotkey				text	default NULL, -- Refer to http://modiki.civfanatics.com/index.php?title=KeyType_(Civ5_Type) for a list of keys
	ShiftDown			boolean	default 0,
	CtrlDown			boolean	default 0,
	AltDown				boolean	default 0);

INSERT INTO Sukritact_HotkeyManager
		(LuaEventName, 										Hotkey,			ShiftDown,	CtrlDown,	AltDown)
VALUES	('JFD_RTP_Sovereignty_ShowGovernmentOverview',		'VK_F4',		0,			1,			0),
		('JFD_RTP_Mercenaries_ShowMercenaryOverview',		'VK_F6',		0,			1,			0);
--=======================================================================================================================
--=======================================================================================================================