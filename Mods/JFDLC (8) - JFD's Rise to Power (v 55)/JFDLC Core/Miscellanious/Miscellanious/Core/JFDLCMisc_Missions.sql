--==========================================================================================================================
-- MISSIONS
--==========================================================================================================================
-- Missions
------------------------------------------------------------------------------------------------------------------------
UPDATE Missions
SET OrderPriority = 201
WHERE Type IN ('MISSION_MULTIPLE_UPGRADE', 'MISSION_CULTURE_BOMB', 'MISSION_GOLDEN_AGE', 'MISSION_GIVE_POLICIES', 'MISSION_JFD_ASSIMILATE', 'MISSION_JFD_CONVERT_GREAT_GENERAL', 'MISSION_JFD_HOST_FILM_FESTIVAL', 'MISSION_JFD_POPULATION', 'MISSION_ONE_SHOT_TOURISM', 'MISSION_CHANGE_ADMIRAL_PORT', 'MISSION_CHANGE_TRADE_ROUTE_HOME_CITY');

UPDATE Missions
SET OrderPriority = 202
WHERE Type IN ('MISSION_CREATE_GREAT_WORK', 'MISSION_FOUND', 'MISSION_ESTABLISH_TRADE_ROUTE', 'MISSION_JFD_DECLARE_REPENTANCE', 'MISSION_JFD_CURE_PLAGUE', 'MISSION_JFD_DIGNITARIES', 'MISSION_JFD_MAGISTRATES', 'MISSION_JFD_CLERICS', 'MISSION_JFD_CAPTAINS', 'MISSION_JFD_INVENTORS', 'MISSION_REMOVE_HERESY', 'MISSION_REPAIR_FLEET', 'MISSION_SELL_EXOTIC_GOODS', 'MISSION_SPREAD_RELIGION', 'MISSION_TRADE');

UPDATE Missions
SET OrderPriority = 203
WHERE Type IN ('MISSION_FOUND_RELIGION', 'MISSION_ENHANCE_RELIGION', 'MISSION_JFD_START_REFORMATION');

UPDATE Missions
SET OrderPriority = 204
WHERE Type IN ('MISSION_JFD_JOIN_COUNCIL');
--==========================================================================================================================
--==========================================================================================================================