--==========================================================================================================================	
-- PROCESSES
--==========================================================================================================================			
-- Processes
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Processes 
		(Type,					TechPrereq,			Description,					Help,								Strategy, 								IconAtlas, 					PortraitIndex)
SELECT	'PROCESS_JFD_PIETY',	'TECH_THEOLOGY',	'TXT_KEY_PROCESS_JFD_PIETY',	'TXT_KEY_PROCESS_JFD_PIETY_HELP',	'TXT_KEY_PROCESS_JFD_PIETY_STRATEGY',	'JFD_PIETY_PROCESS_ATLAS',	0
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

UPDATE Processes
SET TechPrereq = 'TECH_JFD_RELIGIOUS_ORDERS' 
WHERE Type = 'PROCESS_JFD_PIETY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_TECH_ADDITIONS_RELIGIOUS_ORDERS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Process_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Process_Flavors 
		(ProcessType,				FlavorType,				Flavor)
SELECT	'PROCESS_JFD_PIETY',		'FLAVOR_RELIGION',		25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	
--==========================================================================================================================
--==========================================================================================================================