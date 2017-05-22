--==========================================================================================================================
-- POUAKAI ENLIGHTENMENT ERA
--==========================================================================================================================
-- CityEvents
--------------------------------------------------------------------------------------------------------------------------	
UPDATE CityEventChoices
SET RequiredBuildingClass = 'BUILDINGCLASS_EE_MENAGERIE', Help = 'TXT_KEY_CITY_EVENT_JFD_MISC_BEAST_CHOICE_3_HELP_EE', Description = 'TXT_KEY_CITY_EVENT_JFD_MISC_BEAST_DESCRIPTION_CHOICE_3_EE'
WHERE Type = 'CITY_EVENT_JFD_MISC_BEAST_CHOICE_3'
AND EXISTS (SELECT Type FROM BuildingClasses WHERE Type = 'BUILDINGCLASS_EE_MENAGERIE');
--------------------------------------------------------------------------------------------------------------------------
-- CityEventChoice_BuildingClassYieldChange
--------------------------------------------------------------------------------------------------------------------------	
UPDATE CityEventChoice_BuildingClassYieldChange
SET BuildingClassType = 'BUILDINGCLASS_EE_MENAGERIE'
WHERE CityEventChoiceType = 'CITY_EVENT_JFD_MISC_BEAST_CHOICE_3'
AND EXISTS (SELECT Type FROM BuildingClasses WHERE Type = 'BUILDINGCLASS_EE_MENAGERIE');
--==========================================================================================================================
--==========================================================================================================================