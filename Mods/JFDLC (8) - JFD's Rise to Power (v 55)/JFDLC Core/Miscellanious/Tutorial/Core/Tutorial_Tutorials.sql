--==========================================================================================================================
-- TUTORIALS
--==========================================================================================================================
-- CustomTutorialLevels
------------------------------------------------------------------------------------------------------------------------	
--INSERT INTO CustomTutorialLevels
--		(Description)
--VALUES	('TXT_KEY_OPSCREEN_TUTORIAL_NEW_TO_JFDLC');
------------------------------------------------------------------------------------------------------------------------
-- CustomTutorials
------------------------------------------------------------------------------------------------------------------------			
--INSERT INTO CustomTutorials 	
--		(Type, 										Description, 											Help,													DoNotRepeat,		AdvisorType,			AudioSound)
--VALUES	('TUTORIAL_JFD_INTRODUCTION', 				'TXT_KEY_TUTORIAL_JFD_INTRODUCTION_DESC',				'TXT_KEY_TUTORIAL_JFD_INTRODUCTION_HELP',				1,					'ADVISOR_FOREIGN',		'AS2D_F_A_ADVISOR_SPEECH_SUN_SHINES');
	
--BUILD CHARGES
-- INSERT INTO CustomTutorials 	
		-- (Type, 										Description, 											Help,													DoNotRepeat,		AdvisorType,			AudioSound)
-- SELECT	'TUTORIAL_JFD_BUILD_CHARGES', 				'TXT_KEY_TUTORIAL_JFD_BUILD_CHARGES_DESC',				'TXT_KEY_TUTORIAL_JFD_BUILD_CHARGES_HELP',				1,					'ADVISOR_ECONOMIC',		'AS2D_E_A_ADVISOR_SPEECH_MAY_WANT_CONSIDER_THIS'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);	
		
--COLONIES
-- INSERT INTO CustomTutorials 	
		-- (Type, 										Description, 											Help,													DoNotRepeat,		AdvisorType,			AudioSound)
-- SELECT	'TUTORIAL_JFD_COLONIES', 					'TXT_KEY_TUTORIAL_JFD_COLONIES_DESC',					'TXT_KEY_TUTORIAL_JFD_COLONIES_HELP',					0,					'ADVISOR_FOREIGN',		'AS2D_E_A_ADVISOR_SPEECH_NEED_TO_KNOW_THIS'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

-- INSERT INTO CustomTutorials 	
		-- (Type, 										Description, 											Help,													DoNotRepeat,		AdvisorType,			AudioSound)
-- SELECT	'TUTORIAL_JFD_COLONIES_COLONISTS', 			'TXT_KEY_TUTORIAL_JFD_COLONIES_COLONISTS_DESC',			'TXT_KEY_TUTORIAL_JFD_COLONIES_COLONISTS_HELP',			0,					'ADVISOR_FOREIGN',		NULL
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);	

--DECISIONS
-- INSERT INTO CustomTutorials 		
		-- (Type, 										Description, 											Help,													DoNotRepeat,		AdvisorType,			AudioSound)
-- SELECT	'TUTORIAL_JFD_DECISIONS', 					'TXT_KEY_TUTORIAL_JFD_DECISIONS_DESC',					'TXT_KEY_TUTORIAL_JFD_DECISIONS_HELP',					1,					'ADVISOR_ECONOMIC',		'AS2D_E_A_ADVISOR_SPEECH_EXCUSE_ME'
-- WHERE EXISTS (SELECT Type FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');	

-- INSERT INTO CustomTutorials 	
		-- (Type, 										Description, 											Help,												 	DoNotRepeat,		AdvisorType,			AudioSound)
-- SELECT	'TUTORIAL_JFD_DECISIONS_ADMINISTRATIVE', 	'TXT_KEY_TUTORIAL_JFD_DECISIONS_ADMINISTRATIVE_DESC',	'TXT_KEY_TUTORIAL_JFD_DECISIONS_ADMINISTRATIVE_HELP',	1,					'ADVISOR_ECONOMIC',		NULL
-- WHERE EXISTS (SELECT Type FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');	

--DEVELOPMENT	
-- INSERT INTO CustomTutorials 	
		-- (Type, 										Description, 											Help,													DoNotRepeat,		AdvisorType,			AudioSound)
-- SELECT	'TUTORIAL_JFD_DEVELOPMENT_INCREASE', 		'TXT_KEY_TUTORIAL_JFD_DEVELOPMENT_INCREASE_DESC',		'TXT_KEY_TUTORIAL_JFD_DEVELOPMENT_INCREASE_HELP',		1,					'ADVISOR_ECONOMIC',		'AS2D_D_A_ADVISOR_SPEECH_HAVE_INFORMATION'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

-- INSERT INTO CustomTutorials 	
		-- (Type, 										Description, 											Help,													DoNotRepeat,		AdvisorType,			AudioSound)
-- SELECT	'TUTORIAL_JFD_DEVELOPMENT_DEFICIT', 		'TXT_KEY_TUTORIAL_JFD_DEVELOPMENT_DEFICIT_DESC',		'TXT_KEY_TUTORIAL_JFD_DEVELOPMENT_DEFICIT_HELP',		1,					'ADVISOR_ECONOMIC',		'AS2D_E_A_ADVISOR_SPEECH_DECISIVE_ACTION'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

-- INSERT INTO CustomTutorials 	
		-- (Type, 										Description, 											Help,													DoNotRepeat,		AdvisorType,			AudioSound)
-- SELECT	'TUTORIAL_JFD_DEVELOPMENT_SURPLUS', 		'TXT_KEY_TUTORIAL_JFD_DEVELOPMENT_SURPLUS_DESC',		'TXT_KEY_TUTORIAL_JFD_DEVELOPMENT_SURPLUS_HELP',		1,					'ADVISOR_ECONOMIC',		'AS2D_F_A_ADVISOR_SPEECH_HAPPY_CIRCUMSTANCES'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

--Questions
-- INSERT INTO CustomTutorials 	
		-- (Type, 										Description, 											Help,													DoNotRepeat,		AdvisorType,			AudioSound)
-- SELECT	'TUTORIAL_JFD_DEVELOPMENT_DISTRICTS', 		'TXT_KEY_TUTORIAL_JFD_DEVELOPMENT_DISTRICTS_DESC',		'TXT_KEY_TUTORIAL_JFD_DEVELOPMENT_DISTRICTS_HELP',		0,					'ADVISOR_ECONOMIC',		NULL
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

-- INSERT INTO CustomTutorials 	
		-- (Type, 										Description, 											Help,													DoNotRepeat,		AdvisorType,			AudioSound)
-- SELECT	'TUTORIAL_JFD_DEVELOPMENT_SOURCE', 			'TXT_KEY_TUTORIAL_JFD_DEVELOPMENT_SOURCE_DESC',			'TXT_KEY_TUTORIAL_JFD_DEVELOPMENT_SOURCE_HELP',			0,					'ADVISOR_ECONOMIC',		NULL
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);

--EPITHETS
-- INSERT INTO CustomTutorials 	
		-- (Type, 										Description, 											Help,													DoNotRepeat,		AdvisorType,			AudioSound)
-- SELECT	'TUTORIAL_JFD_EPITHETS', 					'TXT_KEY_TUTORIAL_JFD_EPITHETS_DESC',					'TXT_KEY_TUTORIAL_JFD_EPITHETS_HELP',					1,					'ADVISOR_FOREIGN',		'AS2D_F_A_ADVISOR_SPEECH_HAPPY_CIRCUMSTANCES'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);	

--IDEALS
-- INSERT INTO CustomTutorials 	
		-- (Type, 										Description, 											Help,													DoNotRepeat,		AdvisorType,			AudioSound)
-- SELECT	'TUTORIAL_JFD_IDEALS', 						'TXT_KEY_TUTORIAL_JFD_IDEALS_DESC',						'TXT_KEY_TUTORIAL_JFD_IDEALS_HELP',						1,					'ADVISOR_SCIENCE',		'AS2D_S_A_ADVISOR_SPEECH_INTERRUPT'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_SD_IDEALS_CORE' AND Value = 1);	

--INNOVATIONS
-- INSERT INTO CustomTutorials 	
		-- (Type, 										Description, 											Help,													DoNotRepeat,		AdvisorType,			AudioSound)
-- SELECT	'TUTORIAL_JFD_INNOVATIONS', 				'TXT_KEY_TUTORIAL_JFD_INNOVATIONS_DESC',				'TXT_KEY_TUTORIAL_JFD_INNOVATIONS_HELP',				1,					'ADVISOR_SCIENCE',		'AS2D_S_A_ADVISOR_SPEECH_HAPPY_CIRCUMSTANCE'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);		

--INVESTMENTS
-- INSERT INTO CustomTutorials 	
		-- (Type, 										Description, 											Help,													DoNotRepeat,		AdvisorType,			AudioSound)
-- SELECT	'TUTORIAL_JFD_INVESTMENTS', 				'TXT_KEY_TUTORIAL_JFD_INVESTMENTS_DESC',				'TXT_KEY_TUTORIAL_JFD_INVESTMENTS_HELP',				1,					'ADVISOR_ECONOMIC',		'AS2D_D_A_ADVISOR_SPEECH_AMASSED_FORTUNE'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1);		

--PRIVY COUNCILLORS
-- INSERT INTO CustomTutorials 	
		-- (Type, 										Description, 											Help,													DoNotRepeat,		AdvisorType,			AudioSound)
-- SELECT	'TUTORIAL_JFD_PRIVY_COUNCILLOR', 			'TXT_KEY_TUTORIAL_JFD_PRIVY_COUNCILLOR_DESC',			'TXT_KEY_TUTORIAL_JFD_PRIVY_COUNCILLOR_HELP',			1,					'ADVISOR_ECONOMIC',		'AS2D_D_A_ADVISOR_SPEECH_HAVE_INFORMATION'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);	

-- INSERT INTO CustomTutorials 	
		-- (Type, 										Description, 											Help,													DoNotRepeat,		AdvisorType,			AudioSound)
-- SELECT	'TUTORIAL_JFD_PLAGUES', 					'TXT_KEY_TUTORIAL_JFD_PLAGUES_DESC',				'TXT_KEY_TUTORIAL_JFD_PLAGUES_HELP',						0,					'ADVISOR_ECONOMIC',		'AS2D_E_A_ADVISOR_SPEECH_SERIOUSLY_CONSIDER_THIS'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);	
	
-- INSERT INTO CustomTutorials 		
		-- (Type, 										Description, 											Help,													DoNotRepeat,		AdvisorType,			AudioSound)
-- SELECT	'TUTORIAL_JFD_PLAGUES_PREVENTION', 			'TXT_KEY_TUTORIAL_JFD_PLAGUES_PREVENTION_DESC',			'TXT_KEY_TUTORIAL_JFD_PLAGUES_PREVENTION_HELP',			0,					'ADVISOR_ECONOMIC',		NULL
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

--PIETY
-- INSERT INTO CustomTutorials 	
		-- (Type, 													Description, 														Help,																		Civilopedia,												DoNotRepeat,		AdvisorType,			AudioSound)
-- SELECT	'TUTORIAL_JFD_STATE_RELIGION', 							'TXT_KEY_TUTORIAL_JFD_STATE_RELIGION_DESC',							'TXT_KEY_TUTORIAL_JFD_STATE_RELIGION_HELP',									'TXT_KEY_JFD_PIETY_STATE_RELIGION_HEADING1_TITLE',			1,					'ADVISOR_ECONOMIC',		'AS2D_E_A_ADVISOR_SPEECH_MAY_WANT_CONSIDER_THIS'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);												
											
-- INSERT INTO CustomTutorials 												
		-- (Type, 													Description, 														Help,																		Civilopedia,												DoNotRepeat,		AdvisorType,			AudioSound)
-- SELECT	'TUTORIAL_JFD_STATE_RELIGION_FOUNDER', 					'TXT_KEY_TUTORIAL_JFD_STATE_RELIGION_FOUNDER_DESC',					'TXT_KEY_TUTORIAL_JFD_STATE_RELIGION_FOUNDER_HELP',							'TXT_KEY_JFD_PIETY_STATE_RELIGION_HEADING1_TITLE',			1,					'ADVISOR_ECONOMIC',		'AS2D_E_A_ADVISOR_SPEECH_SERIOUSLY_CONSIDER_THIS'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

-- INSERT INTO CustomTutorials 	
		-- (Type, 													Description, 														Help,																		Civilopedia,												DoNotRepeat,		AdvisorType,			AudioSound)
-- SELECT	'TUTORIAL_JFD_STATE_RELIGION_SECULARIZE', 				'TXT_KEY_TUTORIAL_JFD_STATE_RELIGION_SECULARIZE_DESC',				'TXT_KEY_TUTORIAL_JFD_STATE_RELIGION_SECULARIZE_HELP',						'TXT_KEY_JFD_PIETY_SECULARIZATION_HEADING1_TITLE',			1,					'ADVISOR_ECONOMIC',		'AS2D_E_A_ADVISOR_SPEECH_MAY_WANT_CONSIDER_THIS'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);												

--Questions				
-- INSERT INTO CustomTutorials 												
		-- (Type, 													Description, 														Help,																		Civilopedia,												DoNotRepeat,		AdvisorType,			AudioSound)
-- SELECT	'TUTORIAL_JFD_STATE_RELIGION_FOUNDER_PIETY', 			'TXT_KEY_TUTORIAL_JFD_STATE_RELIGION_PIETY_DESC',					'TXT_KEY_TUTORIAL_JFD_STATE_RELIGION_PIETY_HELP',							'TXT_KEY_JFD_PIETY_HEADING1_TITLE',							1,					'ADVISOR_ECONOMIC',		NULL
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);
				
-- INSERT INTO CustomTutorials 												
		-- (Type, 													Description, 														Help,																		Civilopedia,												DoNotRepeat,		AdvisorType,			AudioSound)
-- SELECT	'TUTORIAL_JFD_STATE_RELIGION_PIETY', 					'TXT_KEY_TUTORIAL_JFD_STATE_RELIGION_PIETY_DESC',					'TXT_KEY_TUTORIAL_JFD_STATE_RELIGION_PIETY_HELP',							'TXT_KEY_JFD_PIETY_STATE_RELIGION_HEADING1_TITLE',			1,					'ADVISOR_ECONOMIC',		NULL
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);						
						
-- INSERT INTO CustomTutorials 							
		-- (Type, 													Description, 														Help,																		Civilopedia,												DoNotRepeat,		AdvisorType,			AudioSound)
-- SELECT	'TUTORIAL_JFD_STATE_RELIGION_PIETY_LEVEL', 				'TXT_KEY_TUTORIAL_JFD_STATE_RELIGION_PIETY_LEVEL_DESC',				'TXT_KEY_TUTORIAL_JFD_STATE_RELIGION_PIETY_LEVEL_HELP',						'TXT_KEY_JFD_PIETY_LEVEL_HEADING1_TITLE',					1,					'ADVISOR_ECONOMIC',		NULL
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

-- INSERT INTO CustomTutorials 	
		-- (Type, 													Description, 														Help,																		Civilopedia,												DoNotRepeat,		AdvisorType,			AudioSound)
-- SELECT	'TUTORIAL_JFD_STATE_RELIGION_PIETY_RESTING_RATE', 		'TXT_KEY_TUTORIAL_JFD_STATE_RELIGION_PIETY_RESTING_RATE_DESC',		'TXT_KEY_TUTORIAL_JFD_STATE_RELIGION_PIETY_RESTING_RATE_HELP',				'TXT_KEY_JFD_PIETY_STATE_RELIGION_HEADING1_TITLE',			1,					'ADVISOR_ECONOMIC',		NULL
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

-- INSERT INTO CustomTutorials 	
		-- (Type, 													Description, 														Help,																		Civilopedia,												DoNotRepeat,		AdvisorType,			AudioSound)
-- SELECT	'TUTORIAL_JFD_STATE_RELIGION_PIETY_RESTING_INCREASE', 	'TXT_KEY_TUTORIAL_JFD_STATE_RELIGION_PIETY_RESTING_INCREASE_DESC',	'TXT_KEY_TUTORIAL_JFD_STATE_RELIGION_PIETY_RESTING_INCREASE_HELP',			'TXT_KEY_JFD_PIETY_STATE_RELIGION_HEADING1_TITLE',			1,					'ADVISOR_ECONOMIC',		NULL
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);	

--SLAVERY
-- INSERT INTO CustomTutorials 	
		-- (Type, 										Description, 											Help,													DoNotRepeat,		AdvisorType,			Civilopedia,												AudioSound)
-- SELECT	'TUTORIAL_JFD_SLAVERY', 					'TXT_KEY_TUTORIAL_JFD_SLAVERY_DESC',					'TXT_KEY_TUTORIAL_JFD_SLAVERY_HELP',					1,					'ADVISOR_MILITARY',		'TXT_KEY_JFD_SLAVERY_HEADING1_TITLE',						'AS2D_M_A_ADVISOR_SPEECH_HAVE_INFORMATION'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);	

-- INSERT INTO CustomTutorials 	
		-- (Type, 										Description, 											Help,													DoNotRepeat,		AdvisorType,			Civilopedia,												AudioSound)
-- SELECT	'TUTORIAL_JFD_SLAVERY_ENSLAVEMENT', 		'TXT_KEY_TUTORIAL_JFD_SLAVERY_ENSLAVEMENT_DESC',		'TXT_KEY_TUTORIAL_JFD_SLAVERY_ENSLAVEMENT_HELP',		0,					'ADVISOR_MILITARY',		'TXT_KEY_JFD_SLAVERY_HEADING1_TITLE',						NULL
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);	

-- INSERT INTO CustomTutorials 	
		-- (Type, 										Description, 											Help,													DoNotRepeat,		AdvisorType,			Civilopedia,												AudioSound)
-- SELECT	'TUTORIAL_JFD_SLAVERY_LABOURER', 			'TXT_KEY_TUTORIAL_JFD_SLAVERY_LABOURER_DESC',			'TXT_KEY_TUTORIAL_JFD_SLAVERY_LABOURER_HELP',			0,					'ADVISOR_MILITARY',		'TXT_KEY_JFD_SLAVERY_HEADING1_TITLE',						NULL
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);	

--SOVEREIGNTY
-- INSERT INTO CustomTutorials 	
		-- (Type, 										Description, 											Help,													DoNotRepeat,		AdvisorType,			AudioSound)
-- SELECT	'TUTORIAL_JFD_REFORMS_FREE', 				'TXT_KEY_TUTORIAL_JFD_REFORMS_FREE_DESC',				'TXT_KEY_TUTORIAL_JFD_REFORMS_FREE_HELP',				1,					'ADVISOR_ECONOMIC',		'AS2D_E_A_ADVISOR_SPEECH_EXCUSE_ME'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);	
------------------------------------------------------------------------------------------------------------------------
-- CustomTutorial_Questions
------------------------------------------------------------------------------------------------------------------------
-- INSERT INTO CustomTutorial_Questions 			
		-- (TutorialType, 							LinkedTutorialType,										Description)
-- SELECT	'TUTORIAL_JFD_COLONIES', 				'TUTORIAL_JFD_COLONIES_COLONISTS',						'TXT_KEY_TUTORIAL_JFD_COLONIES_Q1_DESC'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);
	
--DECISIONS
-- INSERT INTO CustomTutorial_Questions 	
		-- (TutorialType, 							LinkedTutorialType,										Description)
-- SELECT	'TUTORIAL_JFD_DECISIONS', 				'TUTORIAL_JFD_DECISIONS_ADMINISTRATIVE',				'TXT_KEY_TUTORIAL_JFD_DECISIONS_Q1_DESC'
-- WHERE EXISTS (SELECT Type FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');	
	
--DEVELOPMENT
-- INSERT INTO CustomTutorial_Questions 	
		-- (TutorialType, 							LinkedTutorialType,										Description)
-- SELECT	'TUTORIAL_JFD_DEVELOPMENT_INCREASE', 	'TUTORIAL_JFD_DEVELOPMENT_SOURCE',						'TXT_KEY_TUTORIAL_JFD_DEVELOPMENT_Q1_DESC'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);	

-- INSERT INTO CustomTutorial_Questions 	
		-- (TutorialType, 							LinkedTutorialType,										Description)
-- SELECT	'TUTORIAL_JFD_DEVELOPMENT_DEFICIT', 	'TUTORIAL_JFD_DEVELOPMENT_SOURCE',						'TXT_KEY_TUTORIAL_JFD_DEVELOPMENT_Q1_DESC'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);	
	
-- INSERT INTO CustomTutorial_Questions 	
		-- (TutorialType, 							LinkedTutorialType,										Description)
-- SELECT	'TUTORIAL_JFD_DEVELOPMENT_SOURCE', 		'TUTORIAL_JFD_DEVELOPMENT_DISTRICTS',					'TXT_KEY_TUTORIAL_JFD_DEVELOPMENT_Q2_DESC'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);	
	
-- INSERT INTO CustomTutorial_Questions 	
		-- (TutorialType, 							LinkedTutorialType,									Description)
-- SELECT	'TUTORIAL_JFD_PLAGUES', 				'TUTORIAL_JFD_PLAGUES_PREVENTION',					'TXT_KEY_TUTORIAL_JFD_PLAGUES_Q1_DESC'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
	
--PIETY
-- INSERT INTO CustomTutorial_Questions 	
		-- (TutorialType, 										LinkedTutorialType,										Description)
-- SELECT	'TUTORIAL_JFD_STATE_RELIGION', 						'TUTORIAL_JFD_STATE_RELIGION_PIETY',					'TXT_KEY_TUTORIAL_JFD_STATE_RELIGION_Q1_DESC'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

-- INSERT INTO CustomTutorial_Questions 	
		-- (TutorialType, 										LinkedTutorialType,										Description)
-- SELECT	'TUTORIAL_JFD_STATE_RELIGION', 						'TUTORIAL_JFD_STATE_RELIGION_PIETY_RESTING_RATE',		'TXT_KEY_TUTORIAL_JFD_STATE_RELIGION_Q3_DESC'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

-- INSERT INTO CustomTutorial_Questions 	
		-- (TutorialType, 										LinkedTutorialType,										Description)
-- SELECT	'TUTORIAL_JFD_STATE_RELIGION', 						'TUTORIAL_JFD_STATE_RELIGION_PIETY_LEVEL',				'TXT_KEY_TUTORIAL_JFD_STATE_RELIGION_Q2_DESC'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

-- INSERT INTO CustomTutorial_Questions 	
		-- (TutorialType, 										LinkedTutorialType,										Description)
-- SELECT	'TUTORIAL_JFD_STATE_RELIGION_FOUNDER', 				'TUTORIAL_JFD_STATE_RELIGION_FOUNDER_PIETY',			'TXT_KEY_TUTORIAL_JFD_STATE_RELIGION_Q1_DESC'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

-- INSERT INTO CustomTutorial_Questions 	
		-- (TutorialType, 										LinkedTutorialType,										Description)
-- SELECT	'TUTORIAL_JFD_STATE_RELIGION_PIETY_RESTING_RATE', 	'TUTORIAL_JFD_STATE_RELIGION_PIETY_RESTING_INCREASE',	'TXT_KEY_TUTORIAL_JFD_STATE_RELIGION_Q4_DESC'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);
	
--SLAVERY
-- INSERT INTO CustomTutorial_Questions 	
		-- (TutorialType, 							LinkedTutorialType,										Description)
-- SELECT	'TUTORIAL_JFD_SLAVERY', 				'TUTORIAL_JFD_SLAVERY_ENSLAVEMENT',						'TXT_KEY_TUTORIAL_JFD_SLAVERY_Q1_DESC'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);
	
-- INSERT INTO CustomTutorial_Questions 	
		-- (TutorialType, 							LinkedTutorialType,										Description)
-- SELECT	'TUTORIAL_JFD_SLAVERY', 				'TUTORIAL_JFD_SLAVERY_LABOURER',						'TXT_KEY_TUTORIAL_JFD_SLAVERY_Q2_DESC'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);
------------------------------------------------------------------------------------------------------------------------
-- CustomTutorial_Triggers
------------------------------------------------------------------------------------------------------------------------	
--INSERT INTO CustomTutorial_Triggers 	
--		(TutorialType, 								IsOnCapitalFounded)
--VALUES	('TUTORIAL_JFD_INTRODUCTION', 				1);
	
-- INSERT INTO CustomTutorial_Triggers 	
		-- (TutorialType, 								IsOnUnitClassTrained)
-- SELECT	'TUTORIAL_JFD_BUILD_CHARGES', 				Type
-- FROM UnitClasses WHERE Type IN ('UNITCLASS_WORKER', 'UNITCLASS_JFD_WORKER')
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_PROGRESS_BUILD_CHARGES' AND Value = 1);	

-- INSERT INTO CustomTutorial_Triggers 	
		-- (TutorialType, 								IsOnColonyFounded)
-- SELECT	'TUTORIAL_JFD_COLONIES', 					1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

--DECISIONS
-- INSERT INTO CustomTutorial_Triggers 	
		-- (TutorialType, 								IsOnDecisionAvailable)
-- SELECT	'TUTORIAL_JFD_DECISIONS', 					1
-- WHERE EXISTS (SELECT Type FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');	

--DEVELOPMENT
-- INSERT INTO CustomTutorial_Triggers 	
		-- (TutorialType, 								IsOnDevelopmentDeficit)
-- SELECT	'TUTORIAL_JFD_DEVELOPMENT_DEFICIT', 		1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);	

-- INSERT INTO CustomTutorial_Triggers 	
		-- (TutorialType, 								IsOnBuildingConstructed)
-- SELECT	'TUTORIAL_JFD_DEVELOPMENT_INCREASE', 		1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);	

-- INSERT INTO CustomTutorial_Triggers 	
		-- (TutorialType, 								IsOnDevelopmentSurplus)
-- SELECT	'TUTORIAL_JFD_DEVELOPMENT_SURPLUS', 		1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_DEVELOPMENT_CORE' AND Value = 1);	

--EPITHETS
-- INSERT INTO CustomTutorial_Triggers 	
		-- (TutorialType, 								IsOnEpithet)
-- SELECT	'TUTORIAL_JFD_EPITHETS', 					1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_EPITHETS_CORE' AND Value = 1);	

-- INSERT INTO CustomTutorial_Triggers 	
		-- (TutorialType, 								IsOnSocialPolicyScreen)
-- SELECT	'TUTORIAL_JFD_IDEALS', 						1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

-- INSERT INTO CustomTutorial_Triggers 	
		-- (TutorialType, 								IsOnCanInvest)
-- SELECT	'TUTORIAL_JFD_INVESTMENTS', 				1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_INVESTMENTS_CORE' AND Value = 1);

--INNOVATIONS
-- INSERT INTO CustomTutorial_Triggers 	
		-- (TutorialType, 								IsOnInnovation)
-- SELECT	'TUTORIAL_JFD_INNOVATIONS', 				1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIT_INNOVATIONS_CORE' AND Value = 1);

--PIETY
-- INSERT INTO CustomTutorial_Triggers 	
		-- (TutorialType, 								IsOnStateReligion)
-- SELECT	'TUTORIAL_JFD_STATE_RELIGION', 				1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

-- INSERT INTO CustomTutorial_Triggers 	
		-- (TutorialType, 								IsOnChooseBeliefPopupFounder)
-- SELECT	'TUTORIAL_JFD_STATE_RELIGION_FOUNDER', 		1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

-- INSERT INTO CustomTutorial_Triggers 	
		-- (TutorialType, 								IsOnCanSecularize)
-- SELECT	'TUTORIAL_JFD_STATE_RELIGION_SECULARIZE', 	1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CORE' AND Value = 1);

-- INSERT INTO CustomTutorial_Triggers 	
		-- (TutorialType, 							IsOnPlague)
-- SELECT	'TUTORIAL_JFD_PLAGUES', 				1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

--PRIVY COUNCILLORS
-- INSERT INTO CustomTutorial_Triggers 	
		-- (TutorialType, 								IsOnGreatPersonCreated)
-- SELECT	'TUTORIAL_JFD_PRIVY_COUNCILLOR', 			1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--SLAVERY
-- INSERT INTO CustomTutorial_Triggers 	
		-- (TutorialType, 								IsOnShackles)
-- SELECT	'TUTORIAL_JFD_SLAVERY', 					1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

--SOVEREIGNTY
-- INSERT INTO CustomTutorial_Triggers 	
		-- (TutorialType, 								IsOnFreeReform)
-- SELECT	'TUTORIAL_JFD_REFORMS_FREE', 				1
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);	
--==========================================================================================================================
--==========================================================================================================================