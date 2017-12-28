--==========================================================================================================================
-- EPITHETS
--==========================================================================================================================
-- JFD_Epithets
-------------------------------------
INSERT INTO JFD_Epithets	
		(Type,						AcquisitionChance,	IsOnUnitClassBorn,		ImprovementMod,							NumImprovementMod,				ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_AFFLUENT',		1,					'UNITCLASS_MERCHANT',	'IMPROVEMENT_CUSTOMS_HOUSE',			3,								'TXT_KEY_EPITHET_JFD_AFFLUENT_SHORT_DESC',			'TXT_KEY_EPITHET_JFD_AFFLUENT_DESC',		'TXT_KEY_EPITHET_JFD_AFFLUENT_HELP',		'POLICY_EPITHET_JFD_AFFLUENT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);							
							
INSERT INTO JFD_Epithets		
		(Type,						AcquisitionChance,	IsOnWonderConstructed,																			ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_AUGUSTUS',		1,					1,																								'TXT_KEY_EPITHET_JFD_AUGUSTUS_SHORT_DESC',			'TXT_KEY_EPITHET_JFD_AUGUSTUS_DESC',		'TXT_KEY_EPITHET_JFD_AUGUSTUS_HELP',		'POLICY_EPITHET_JFD_AUGUSTUS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);				
				
INSERT INTO JFD_Epithets							
		(Type,						AcquisitionChance,	IsOnUnitClassBorn,		ImprovementMod,							NumImprovementMod,				ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_BLESSED',		1,					'UNITCLASS_PROPHET',	'IMPROVEMENT_HOLY_SITE',				3,								'TXT_KEY_EPITHET_JFD_BLESSED_SHORT_DESC',			'TXT_KEY_EPITHET_JFD_BLESSED_DESC',			'TXT_KEY_EPITHET_JFD_BLESSED_HELP',			'POLICY_EPITHET_JFD_BLESSED'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);							
							
INSERT INTO JFD_Epithets							
		(Type,						AcquisitionChance,	IsOnCityWLTKD,													NumHappinessMod,				ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_BELOVED',		1,					1,																0.3,							'TXT_KEY_EPITHET_JFD_BELOVED_SHORT_DESC',			'TXT_KEY_EPITHET_JFD_BELOVED_DESC',			'TXT_KEY_EPITHET_JFD_BELOVED_HELP',			'POLICY_EPITHET_JFD_BELOVED'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);							
							
INSERT INTO JFD_Epithets							
		(Type,						AcquisitionChance,	IsOnAggressiveWar,												NumTheirCitiesMod,				ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_BOLD',			1,					1,																1,								'TXT_KEY_EPITHET_JFD_BOLD_SHORT_DESC',				'TXT_KEY_EPITHET_JFD_BOLD_DESC',			'TXT_KEY_EPITHET_JFD_BOLD_HELP',			'POLICY_EPITHET_JFD_BOLD'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);							
							
INSERT INTO JFD_Epithets							
		(Type,						AcquisitionChance,	IsOnAnyWonderConstructed,										NumWondersMod,					ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_BUILDER',		1,					1,																0.5,							'TXT_KEY_EPITHET_JFD_BUILDER_SHORT_DESC',			'TXT_KEY_EPITHET_JFD_BUILDER_DESC',			'TXT_KEY_EPITHET_JFD_BUILDER_HELP',			'POLICY_EPITHET_JFD_BUILDER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);							
							
INSERT INTO JFD_Epithets							
		(Type,						AcquisitionChance,	IsOnUnitClassBorn,												NumUnitClassMod,				ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_COMMONER',		1,					'UNITCLASS_WORKER',												0.2,							'TXT_KEY_EPITHET_JFD_COMMONER_SHORT_DESC',			'TXT_KEY_EPITHET_JFD_COMMONER_DESC',		'TXT_KEY_EPITHET_JFD_COMMONER_HELP',		'POLICY_EPITHET_JFD_COMMONER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);							
							
INSERT INTO JFD_Epithets							
		(Type,						AcquisitionChance,	IsOnCityConquered,												NumCourthouseMod,				ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_CONQUEROR',	1,					1,																2,								'TXT_KEY_EPITHET_JFD_CONQUEROR_SHORT_DESC',			'TXT_KEY_EPITHET_JFD_CONQUEROR_DESC',		'TXT_KEY_EPITHET_JFD_CONQUEROR_HELP',		'POLICY_EPITHET_JFD_CONQUEROR'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);					
					
INSERT INTO JFD_Epithets					
		(Type,						AcquisitionChance,	IsOnCityOtherReligionConquered,									NumCityStateReligionMod,		ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_CRUSADER',		1,					1,																2,								'TXT_KEY_EPITHET_JFD_CRUSADER_SHORT_DESC',			'TXT_KEY_EPITHET_JFD_CRUSADER_DESC',		'TXT_KEY_EPITHET_JFD_CRUSADER_HELP',		'POLICY_EPITHET_JFD_CRUSADER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);					
					
INSERT INTO JFD_Epithets					
		(Type,						AcquisitionChance,	IsOnCityStateBully,												NumStrengthMod,					ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_CRUEL',		10,					1,																1,								'TXT_KEY_EPITHET_JFD_CRUEL_SHORT_DESC',				'TXT_KEY_EPITHET_JFD_CRUEL_DESC',			'TXT_KEY_EPITHET_JFD_CRUEL_HELP',			'POLICY_EPITHET_JFD_CRUEL'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);					
				
INSERT INTO JFD_Epithets					
		(Type,						AcquisitionChance,	IsOnCityStateClaimed,											NumCityStateFriendsMod,			ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_DIPLOMAT',		10,					1,																1,								'TXT_KEY_EPITHET_JFD_DIPLOMAT_SHORT_DESC',			'TXT_KEY_EPITHET_JFD_DIPLOMAT_DESC',		'TXT_KEY_EPITHET_JFD_DIPLOMAT_HELP',		'POLICY_EPITHET_JFD_DIPLOMAT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);		
	
INSERT INTO JFD_Epithets					
		(Type,						AcquisitionChance,	IsOnUnitClassBorn,		ImprovementMod,							NumImprovementMod,				ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_ENGINEERING',	1,					'UNITCLASS_ENGINEER',	'IMPROVEMENT_MANUFACTORY',				3,								'TXT_KEY_EPITHET_JFD_ENGINEERING_SHORT_DESC',		'TXT_KEY_EPITHET_JFD_ENGINEERING_DESC',		'TXT_KEY_EPITHET_JFD_ENGINEERING_HELP',		'POLICY_EPITHET_JFD_ENGINEERING'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);			
			
INSERT INTO JFD_Epithets			
		(Type,						AcquisitionChance,	IsOnFirstToEra,																					ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_ENLIGHTENED',	100,				'ERA_RENAISSANCE',																				'TXT_KEY_EPITHET_JFD_ENLIGHTENED_SHORT_DESC',		'TXT_KEY_EPITHET_JFD_ENLIGHTENED_DESC',		'TXT_KEY_EPITHET_JFD_ENLIGHTENED_HELP',		'POLICY_EPITHET_JFD_ENLIGHTENED'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);		
		
INSERT INTO JFD_Epithets		
		(Type,						AcquisitionChance,	IsOnNaturalWonderDiscovered,									NumNaturalWonderDiscoveredMod,	ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_EXPLORER',		5,					1,																2,								'TXT_KEY_EPITHET_JFD_EXPLORER_SHORT_DESC',			'TXT_KEY_EPITHET_JFD_EXPLORER_DESC',		'TXT_KEY_EPITHET_JFD_EXPLORER_HELP',		'POLICY_EPITHET_JFD_EXPLORER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);			
			
INSERT INTO JFD_Epithets			
		(Type,						AcquisitionChance,	IsOnUnitClassBorn,												NumThisUnitClassMod,			ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_GREAT',		1,					'UNITCLASS_GREAT_GENERAL',										2,								'TXT_KEY_EPITHET_JFD_GREAT_SHORT_DESC',				'TXT_KEY_EPITHET_JFD_GREAT_DESC',			'TXT_KEY_EPITHET_JFD_GREAT_HELP',			'POLICY_EPITHET_JFD_GREAT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);		
		
INSERT INTO JFD_Epithets		
		(Type,						AcquisitionChance,	IsOnWonderConstructed,																			ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_GREEK',		1,					1,																								'TXT_KEY_EPITHET_JFD_GREEK_SHORT_DESC',				'TXT_KEY_EPITHET_JFD_GREEK_DESC',			'TXT_KEY_EPITHET_JFD_GREEK_HELP',			'POLICY_EPITHET_JFD_GREEK'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);				
				
INSERT INTO JFD_Epithets				
		(Type,						AcquisitionChance,	IsOnBuildingClassConstructed,																	ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_LAWGIVER',		1,					1,																								'TXT_KEY_EPITHET_JFD_LAWGIVER_SHORT_DESC',			'TXT_KEY_EPITHET_JFD_LAWGIVER_DESC',		'TXT_KEY_EPITHET_JFD_LAWGIVER_HELP',		'POLICY_EPITHET_JFD_LAWGIVER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);			
				
INSERT INTO JFD_Epithets				
		(Type,						AcquisitionChance,	IsOnCityStateLiberated,																			ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_LIBERATOR',	10,					1,																								'TXT_KEY_EPITHET_JFD_LIBERATOR_SHORT_DESC',			'TXT_KEY_EPITHET_JFD_LIBERATOR_DESC',		'TXT_KEY_EPITHET_JFD_LIBERATOR_HELP',		'POLICY_EPITHET_JFD_LIBERATOR'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);			
			
INSERT INTO JFD_Epithets			
		(Type,						AcquisitionChance,	IsOnHolyCityCaptured,											NumHolyCitiesMod,				ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_LIONHEART',	2,					1,																2,								'TXT_KEY_EPITHET_JFD_LIONHEART_SHORT_DESC',			'TXT_KEY_EPITHET_JFD_LIONHEART_DESC',		'TXT_KEY_EPITHET_JFD_LIONHEART_HELP',		'POLICY_EPITHET_JFD_LIONHEART'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);						
					
INSERT INTO JFD_Epithets					
		(Type,						AcquisitionChance,	IsOnUnitClassBorn,					SpecialistMod,				NumSpecialistMod,				ShortDescription,									Description,							 	Help,										PolicyType)
SELECT	'EPITHET_JFD_HEALER',		1,					'UNITCLASS_JFD_GREAT_DOCTOR',		'SPECIALIST_JFD_DOCTOR',	1,								'TXT_KEY_EPITHET_JFD_HEALER_SHORT_DESC',			'TXT_KEY_EPITHET_JFD_HEALER_DESC',	 		'TXT_KEY_EPITHET_JFD_HEALER_HELP',			'POLICY_EPITHET_JFD_HEALER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);	
	
INSERT INTO JFD_Epithets	
		(Type,						AcquisitionChance,	IsOnBuildingClassConstructed,																	ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_HOLY',			1,					1,																								'TXT_KEY_EPITHET_JFD_HOLY_SHORT_DESC',				'TXT_KEY_EPITHET_JFD_HOLY_DESC',			'TXT_KEY_EPITHET_JFD_HOLY_HELP',			'POLICY_EPITHET_JFD_HOLY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);	
	
INSERT INTO JFD_Epithets	
		(Type,						AcquisitionChance,	IsOnUnitClassBorn,					ResourceMod,				NumResourceMod,					ShortDescription,									 Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_JUST',			1,					'UNITCLASS_JFD_GREAT_MAGISTRATE',	'RESOURCE_MAGISTRATES',		2,								'TXT_KEY_EPITHET_JFD_JUST_SHORT_DESC',	 			'TXT_KEY_EPITHET_JFD_JUST_DESC',			'TXT_KEY_EPITHET_JFD_JUST_HELP',			'POLICY_EPITHET_JFD_JUST'
WHERE EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO JFD_Epithets
		(Type,						AcquisitionChance,	IsOnBuildingPurchased,											NumGoldMod,						ShortDescription,									Description,							 	Help,										PolicyType)
SELECT	'EPITHET_JFD_MAGNANIMOUS',	1,					1,																0.1,							'TXT_KEY_EPITHET_JFD_MAGNANIMOUS_SHORT_DESC',		'TXT_KEY_EPITHET_JFD_MAGNANIMOUS_DESC',	 	'TXT_KEY_EPITHET_JFD_MAGNANIMOUS_HELP',		'POLICY_EPITHET_JFD_MAGNANIMOUS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);			
			
INSERT INTO JFD_Epithets			
		(Type,						AcquisitionChance,	IsOnGoldenAge,													NumHappinessMod,				ShortDescription,									Description,							 	Help,										PolicyType)
SELECT	'EPITHET_JFD_MAGNIFICENT',	1,					1,																0.5,							'TXT_KEY_EPITHET_JFD_MAGNIFICENT_SHORT_DESC',		'TXT_KEY_EPITHET_JFD_MAGNIFICENT_DESC',		'TXT_KEY_EPITHET_JFD_MAGNIFICENT_HELP',		'POLICY_EPITHET_JFD_MAGNIFICENT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);		
		
INSERT INTO JFD_Epithets		
		(Type,						AcquisitionChance,	IsOnWonderConstructed,																			ShortDescription,									Description,							 	Help,										PolicyType)
SELECT	'EPITHET_JFD_MAHARAJ',		1,					1,																								'TXT_KEY_EPITHET_JFD_MAHARAJ_SHORT_DESC',			'TXT_KEY_EPITHET_JFD_MAHARAJ_DESC',		 	'TXT_KEY_EPITHET_JFD_MAHARAJ_HELP',			'POLICY_EPITHET_JFD_MAHARAJ'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);	
	
INSERT INTO JFD_Epithets	
		(Type,						AcquisitionChance,	IsOnMercenaryHired,												NumContractsMod,				ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_MERCENARY',	1,					1,																3,								'TXT_KEY_EPITHET_JFD_MERCENARY_SHORT_DESC',			'TXT_KEY_EPITHET_JFD_MERCENARY_DESC',		'TXT_KEY_EPITHET_JFD_MERCENARY_HELP',		'POLICY_EPITHET_JFD_MERCENARY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)		
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);		
		
INSERT INTO JFD_Epithets				
		(Type,						AcquisitionChance,	IsOnBuildingClassConstructed,																	ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_MONK',			1,					1,																								'TXT_KEY_EPITHET_JFD_MONK_SHORT_DESC',				'TXT_KEY_EPITHET_JFD_MONK_DESC',			'TXT_KEY_EPITHET_JFD_MONK_HELP',			'POLICY_EPITHET_JFD_MONK'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);		

INSERT INTO JFD_Epithets		
		(Type,						AcquisitionChance,	IsOnUnitClassBorn,												NumThisUnitClassMod,			ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_NAVIGATOR',	1,					'UNITCLASS_GREAT_ADMIRAL',										2,								'TXT_KEY_EPITHET_JFD_NAVIGATOR_SHORT_DESC',			'TXT_KEY_EPITHET_JFD_NAVIGATOR_DESC',		'TXT_KEY_EPITHET_JFD_NAVIGATOR_HELP',		'POLICY_EPITHET_JFD_NAVIGATOR'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);	
	
INSERT INTO JFD_Epithets	
		(Type,						AcquisitionChance,	IsOnUnitClassBorn,					ResourceMod,				NumResourceMod,					ShortDescription,						 			Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_NOBLE',		1,					'UNITCLASS_JFD_GREAT_DIGNITARY',	'RESOURCE_JFD_DIGNITARIES',	2,								'TXT_KEY_EPITHET_JFD_NOBLE_SHORT_DESC',	 			'TXT_KEY_EPITHET_JFD_NOBLE_DESC',			'TXT_KEY_EPITHET_JFD_NOBLE_HELP',			'POLICY_EPITHET_JFD_NOBLE'
WHERE EXISTS (SELECT Type FROM UnitClasses WHERE Type = 'UNITCLASS_JFD_GREAT_DIGNITARY')			
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);			
				
INSERT INTO JFD_Epithets				
		(Type,						AcquisitionChance,	IsOnPolicyBranch,												NumPolicyBranchMod,				ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_PHILOSOPHER',	1,					5,																1,								'TXT_KEY_EPITHET_JFD_PHILOSOPHER_SHORT_DESC',		'TXT_KEY_EPITHET_JFD_PHILOSOPHER_DESC',		'TXT_KEY_EPITHET_JFD_PHILOSOPHER_HELP',		'POLICY_EPITHET_JFD_PHILOSOPHER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);		
		
INSERT INTO JFD_Epithets				
		(Type,						AcquisitionChance,	IsOnBuildingFaithPurchased,										NumFaithMod,					ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_PIOUS',		1,					1,																0.1,							'TXT_KEY_EPITHET_JFD_PIOUS_SHORT_DESC',				'TXT_KEY_EPITHET_JFD_PIOUS_DESC',			'TXT_KEY_EPITHET_JFD_PIOUS_HELP',			'POLICY_EPITHET_JFD_PIOUS'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);		

INSERT INTO JFD_Epithets			
		(Type,						AcquisitionChance,	IsOnCityYourReligionConquered,									NumCityStateReligionMod,		ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_REDEEMER',		1,					1,																2,								'TXT_KEY_EPITHET_JFD_REDEEMER_SHORT_DESC',			'TXT_KEY_EPITHET_JFD_REDEEMER_DESC',		'TXT_KEY_EPITHET_JFD_REDEEMER_HELP',		'POLICY_EPITHET_JFD_REDEEMER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO JFD_Epithets					
		(Type,						AcquisitionChance,	IsOnReformPassed,												NumReformMod,					ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_REFORMER',		2,					1,																1,								'TXT_KEY_EPITHET_JFD_REFORMER_SHORT_DESC',			'TXT_KEY_EPITHET_JFD_REFORMER_DESC',			'TXT_KEY_EPITHET_JFD_REFORMER_HELP',			'POLICY_EPITHET_JFD_REFORMER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);	

INSERT INTO JFD_Epithets
		(Type,						AcquisitionChance,	IsOnBuildingClassConstructed,																	ShortDescription,									Description,							 	Help,										PolicyType)
SELECT	'EPITHET_JFD_SCHOLAR',		1,					1,																								'TXT_KEY_EPITHET_JFD_SCHOLAR_SHORT_DESC',			'TXT_KEY_EPITHET_JFD_SCHOLAR_DESC',			'TXT_KEY_EPITHET_JFD_SCHOLAR_HELP',			'POLICY_EPITHET_JFD_SCHOLAR'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO JFD_Epithets					
		(Type,						AcquisitionChance,	IsOnSlavePurchased,					ResourceMod,				NumResourceMod,					ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_SLAVER',		1,					1,									'RESOURCE_JFD_SHACKLES',	2,								'TXT_KEY_EPITHET_JFD_SLAVER_SHORT_DESC',			'TXT_KEY_EPITHET_JFD_SLAVER_DESC',			'TXT_KEY_EPITHET_JFD_SLAVER_HELP',			'POLICY_EPITHET_JFD_SLAVER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);	

INSERT INTO JFD_Epithets					
		(Type,						AcquisitionChance,	IsOnBarbarianKilled,																			ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_SLAYER',		2,					1,																								'TXT_KEY_EPITHET_JFD_SLAYER_SHORT_DESC',			'TXT_KEY_EPITHET_JFD_SLAYER_DESC',			'TXT_KEY_EPITHET_JFD_SLAYER_HELP',			'POLICY_EPITHET_JFD_SLAYER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);	

INSERT INTO JFD_Epithets					
		(Type,						AcquisitionChance,	IsOnLevyPurchased,												NumPopulationMod,				ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_SOLDIER',		1,					1,																0.2,							'TXT_KEY_EPITHET_JFD_SOLDIER_SHORT_DESC',			'TXT_KEY_EPITHET_JFD_SOLDIER_DESC',			'TXT_KEY_EPITHET_JFD_SOLDIER_HELP',			'POLICY_EPITHET_JFD_SOLDIER'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE_LEVIES' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);		

INSERT INTO JFD_Epithets
		(Type,						AcquisitionChance,	IsOnWonderConstructed,				HasFeminineAlt,												ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_SUN_KING',		100,				1,									1,															'TXT_KEY_EPITHET_JFD_SUN_KING_SHORT_DESC',			'TXT_KEY_EPITHET_JFD_SUN_KING_DESC',		'TXT_KEY_EPITHET_JFD_SUN_KING_HELP',		'POLICY_EPITHET_JFD_SUN_KING'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)		
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_VERSAILLES' OR Type = 'BUILDING_JFD_VERSAILLES');		
		
INSERT INTO JFD_Epithets		
		(Type,						AcquisitionChance,	IsOnCityRazed,													NumCityMod,						ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_TERRIBLE',		1,					1,																2,								'TXT_KEY_EPITHET_JFD_TERRIBLE_SHORT_DESC',			'TXT_KEY_EPITHET_JFD_TERRIBLE_DESC',		'TXT_KEY_EPITHET_JFD_TERRIBLE_HELP',		'POLICY_EPITHET_JFD_TERRIBLE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);	
	
INSERT INTO JFD_Epithets	
		(Type,						AcquisitionChance,	IsOnUnitClassBorn,					ImprovementMod,				NumImprovementMod,				ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_WISE',			1,					'UNITCLASS_SCIENTIST',				'IMPROVEMENT_ACADEMY',		3,								'TXT_KEY_EPITHET_JFD_WISE_SHORT_DESC',				'TXT_KEY_EPITHET_JFD_WISE_DESC',			'TXT_KEY_EPITHET_JFD_WISE_HELP',			'POLICY_EPITHET_JFD_WISE'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);		
		
INSERT INTO JFD_Epithets		
		(Type,						AcquisitionChance,	IsOnUnitFaithPurchase,											NumFaithMod,					ShortDescription,									Description,								Help,										PolicyType)
SELECT	'EPITHET_JFD_ZEALOT',		0.5,				1,																0.1,							'TXT_KEY_EPITHET_JFD_ZEALOT_SHORT_DESC',			'TXT_KEY_EPITHET_JFD_ZEALOT_DESC',			'TXT_KEY_EPITHET_JFD_ZEALOT_HELP',			'POLICY_EPITHET_JFD_ZEALOT'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);
------------------------------------------------------------
-- JFD_Epithet_ReligionTitles
------------------------------------------------------------
INSERT INTO JFD_Epithet_ReligionTitles
		(EpithetType,				ReligionType,				ShortDescription)
SELECT	'EPITHET_JFD_CRUSADER',		'RELIGION_ISLAM',			'TXT_KEY_EPITHET_JFD_CRUSADER_SHORT_DESC_ISLAM'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO JFD_Epithet_ReligionTitles
		(EpithetType,				ReligionType,				ShortDescription)
SELECT	'EPITHET_JFD_REDEEMER',		'RELIGION_BUDDHISM',		'TXT_KEY_EPITHET_JFD_REDEEMER_SHORT_DESC_BUDDHISM'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO JFD_Epithet_ReligionTitles
		(EpithetType,				ReligionType,				ShortDescription)
SELECT	'EPITHET_JFD_REDEEMER',		'RELIGION_HINDUISM',		'TXT_KEY_EPITHET_JFD_REDEEMER_SHORT_DESC_HINDUISM'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO JFD_Epithet_ReligionTitles
		(EpithetType,				ReligionType,				ShortDescription)
SELECT	'EPITHET_JFD_REDEEMER',		'RELIGION_ISLAM',			'TXT_KEY_EPITHET_JFD_REDEEMER_SHORT_DESC_ISLAM'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO JFD_Epithet_ReligionTitles
		(EpithetType,				ReligionType,				ShortDescription)
SELECT	'EPITHET_JFD_REDEEMER',		'RELIGION_ZOROASTRIANISM',	'TXT_KEY_EPITHET_JFD_REDEEMER_SHORT_DESC_ZOROASTRIANISM'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);
-------------------------------------
-- JFD_Epithet_BuildingClasses
-------------------------------------
INSERT INTO JFD_Epithet_BuildingClasses
		(EpithetType,				BuildingClassType,		NumBuildingClassMod)
SELECT	'EPITHET_JFD_AUGUSTUS',		Type,					5
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_CIRCUS_MAXIMUS', 'BUILDINGCLASS_HEROIC_EPIC', 'BUILDINGCLASS_NATIONAL_EPIC', 'BUILDINGCLASS_NATIONAL_COLLEGE', 'BUILDINGCLASS_GRAND_TEMPLE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO JFD_Epithet_BuildingClasses
		(EpithetType,				BuildingClassType,		NumBuildingClassMod)
SELECT	'EPITHET_JFD_GREEK',		Type,					5
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_TEMPLE_ARTEMIS', 'BUILDINGCLASS_STATUE_ZEUS', 'BUILDINGCLASS_GREAT_LIBRARY', 'BUILDINGCLASS_GREAT_LIGHTHOUSE', 'BUILDINGCLASS_ORACLE', 'BUILDINGCLASS_PARTHENON')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO JFD_Epithet_BuildingClasses
		(EpithetType,				BuildingClassType,		NumBuildingClassMod)
SELECT	'EPITHET_JFD_LAWGIVER',		Type,					1
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_MAGISTRATE_COURT', 'BUILDINGCLASS_JFD_HIGH_COURT')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO JFD_Epithet_BuildingClasses
		(EpithetType,				BuildingClassType,		NumBuildingClassMod)
SELECT	'EPITHET_JFD_HOLY',			Type,					1
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_SHRINE', 'BUILDINGCLASS_TEMPLE', 'BUILDINGCLASS_MONASTERY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO JFD_Epithet_BuildingClasses
		(EpithetType,				BuildingClassType,		NumBuildingClassMod)
SELECT	'EPITHET_JFD_MAHARAJ',		Type,					5
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_BOROBUDUR', 'BUILDINGCLASS_ANGKOR_WAT', 'BUILDINGCLASS_TAJ_MAHAL', 'BUILDINGCLASS_WAT_PHRA_KAEW', 'BUILDINGCLASS_RED_FORT', 'BUILDING_JFD_BUDDHAS_BAMIYAN', 'BUILDING_JFD_TODAI')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO JFD_Epithet_BuildingClasses
		(EpithetType,				BuildingClassType,		NumBuildingClassMod)
SELECT	'EPITHET_JFD_MONK',			Type,					2
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_MONASTERY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO JFD_Epithet_BuildingClasses
		(EpithetType,				BuildingClassType,		NumBuildingClassMod)
SELECT	'EPITHET_JFD_SCHOLAR',		Type,					1
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_LIBRARY', 'BUILDINGCLASS_UNIVERSITY', 'BUILDINGCLASS_PUBLIC_SCHOOL')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);

INSERT INTO JFD_Epithet_BuildingClasses
		(EpithetType,				BuildingClassType)
SELECT	'EPITHET_JFD_SUN_KING',		'BUILDINGCLASS_JFD_VERSAILLES'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_JFD_VERSAILLES');

INSERT INTO JFD_Epithet_BuildingClasses
		(EpithetType,				BuildingClassType)
SELECT	'EPITHET_JFD_SUN_KING',		'BUILDINGCLASS_EE_VERSAILLES'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_VERSAILLES');
-------------------------------------
-- JFD_Epithet_ClaimMods
-------------------------------------
INSERT INTO JFD_Epithet_ClaimMods
		(EpithetType,				CauseChange)
SELECT	'EPITHET_JFD_DIPLOMAT',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE_CLAIMS' AND Value = 1);	
-------------------------------------
-- JFD_Epithet_SovereigntyMods
-------------------------------------
INSERT INTO JFD_Epithet_SovereigntyMods
		(EpithetType,				ReformCooldownMod)
SELECT	'EPITHET_JFD_REFORMER',		-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);	
--========================================================================================================================================================================
--========================================================================================================================================================================