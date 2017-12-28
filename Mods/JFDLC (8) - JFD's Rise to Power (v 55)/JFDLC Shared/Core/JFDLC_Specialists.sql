--==========================================================================================================================
-- SPECIALISTS
--==========================================================================================================================
-- Specialists
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Specialists SET FontIcon = '[ICON_GREAT_ARTIST]', SlotTexture = 'citizenArtist.dds' WHERE Type = 'SPECIALIST_ARTIST';

UPDATE Specialists SET FontIcon = '[ICON_GREAT_ENGINEER]', SlotTexture = 'citizenEngineer.dds'  WHERE Type = 'SPECIALIST_ENGINEER';

UPDATE Specialists SET SlotTexture = 'citizenMonk.dds'  WHERE Type = 'SPECIALIST_JFD_MONK';

UPDATE Specialists SET FontIcon = '[ICON_GREAT_MERCHANT]', SlotTexture = 'citizenMerchant.dds'  WHERE Type = 'SPECIALIST_MERCHANT';

UPDATE Specialists SET FontIcon = '[ICON_GREAT_MUSICIAN]', SlotTexture = 'citizenArtist.dds'  WHERE Type = 'SPECIALIST_MUSICIAN';

UPDATE Specialists SET FontIcon = '[ICON_GREAT_SCIENTIST]', SlotTexture = 'citizenScientist.dds'  WHERE Type = 'SPECIALIST_SCIENTIST';

UPDATE Specialists SET FontIcon = '[ICON_GREAT_WRITER]', SlotTexture = 'citizenArtist.dds'  WHERE Type = 'SPECIALIST_WRITER';
--==========================================================================================================================
--==========================================================================================================================