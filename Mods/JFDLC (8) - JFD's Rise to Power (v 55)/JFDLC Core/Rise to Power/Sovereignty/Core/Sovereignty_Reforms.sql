--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses 
		(Type, 									DefaultBuilding, 					Description)
SELECT	'BUILDINGCLASS_JFD_PUPPET_CITY', 		'BUILDING_JFD_PUPPET_CITY',			'TXT_KEY_BUILDING_JFD_PUPPET_CITY'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 
		(Type, 									BuildingClass, 						Cost, 	FaithCost,	GreatWorkCount,	 NeverCapture,	PrereqTech,		Description, 							Help)
SELECT	'BUILDING_JFD_PUPPET_CITY', 			'BUILDINGCLASS_JFD_PUPPET_CITY', 	-1,		-1,			-1,				 1,				NULL,			'TXT_KEY_BUILDING_JFD_PUPPET_CITY', 	'TXT_KEY_BUILDING_JFD_PUPPET_CITY_HELP'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);		
--==========================================================================================================================	
-- REFORM BRANCHES
--==========================================================================================================================	
-- JFD_ReformBranches
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO JFD_ReformBranches 
		(Type, 								ShortDescription, 											Description,										Adjective,											Help,											BackgroundImage)
VALUES	('REFORM_BRANCH_JFD_GOVERNMENT', 	'TXT_KEY_JFD_REFORM_CATEGORY_GOVERNMENT_SHORT_DESC',		'TXT_KEY_JFD_REFORM_CATEGORY_GOVERNMENT_DESC',		'TXT_KEY_JFD_REFORM_CATEGORY_GOVERNMENT_ADJ',		'TXT_KEY_JFD_REFORM_CATEGORY_GOVERNMENT_HELP',	'ReformBranchMonarchy.dds'),
		('REFORM_BRANCH_JFD_CULTURE', 		'TXT_KEY_JFD_REFORM_CATEGORY_CULTURE_SHORT_DESC',			'TXT_KEY_JFD_REFORM_CATEGORY_CULTURE_DESC',			'TXT_KEY_JFD_REFORM_CATEGORY_CULTURE_ADJ',			'TXT_KEY_JFD_REFORM_CATEGORY_CULTURE_HELP',		'ReformBranchCultural.dds'),
		('REFORM_BRANCH_JFD_ECONOMY', 		'TXT_KEY_JFD_REFORM_CATEGORY_ECONOMY_SHORT_DESC',			'TXT_KEY_JFD_REFORM_CATEGORY_ECONOMY_DESC',			'TXT_KEY_JFD_REFORM_CATEGORY_ECONOMY_ADJ',			'TXT_KEY_JFD_REFORM_CATEGORY_ECONOMY_HELP',		'ReformBranchEconomic.dds'),
		('REFORM_BRANCH_JFD_FOREIGN', 		'TXT_KEY_JFD_REFORM_CATEGORY_FOREIGN_SHORT_DESC',			'TXT_KEY_JFD_REFORM_CATEGORY_FOREIGN_DESC',			'TXT_KEY_JFD_REFORM_CATEGORY_FOREIGN_ADJ',			'TXT_KEY_JFD_REFORM_CATEGORY_FOREIGN_HELP',		'ReformBranchForeign.dds'),
		('REFORM_BRANCH_JFD_INDUSTRY', 		'TXT_KEY_JFD_REFORM_CATEGORY_INDUSTRY_SHORT_DESC',			'TXT_KEY_JFD_REFORM_CATEGORY_INDUSTRY_DESC',		'TXT_KEY_JFD_REFORM_CATEGORY_INDUSTRY_ADJ',			'TXT_KEY_JFD_REFORM_CATEGORY_INDUSTRY_HELP',	'ReformBranchIndustry.dds'),
		('REFORM_BRANCH_JFD_LEGAL', 		'TXT_KEY_JFD_REFORM_CATEGORY_LEGAL_SHORT_DESC',				'TXT_KEY_JFD_REFORM_CATEGORY_LEGAL_DESC',			'TXT_KEY_JFD_REFORM_CATEGORY_LEGAL_ADJ',			'TXT_KEY_JFD_REFORM_CATEGORY_LEGAL_HELP',		'ReformBranchLegal.dds'),
		('REFORM_BRANCH_JFD_MILITARY', 		'TXT_KEY_JFD_REFORM_CATEGORY_MILITARY_SHORT_DESC',			'TXT_KEY_JFD_REFORM_CATEGORY_MILITARY_DESC',		'TXT_KEY_JFD_REFORM_CATEGORY_MILITARY_ADJ',			'TXT_KEY_JFD_REFORM_CATEGORY_MILITARY_HELP',	'ReformBranchMilitary.dds'),
		('REFORM_BRANCH_JFD_RELIGION', 		'TXT_KEY_JFD_REFORM_CATEGORY_RELIGION_SHORT_DESC',			'TXT_KEY_JFD_REFORM_CATEGORY_RELIGION_DESC',		'TXT_KEY_JFD_REFORM_CATEGORY_RELIGION_ADJ',			'TXT_KEY_JFD_REFORM_CATEGORY_RELIGION_HELP',	'ReformBranchReligion.dds');	
--------------------------------------------------------------------------------------------------------------------------
-- JFD_ReformBranch_Alignment
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO JFD_ReformBranch_Alignment 
		(ReformBranchType, 						Alignment, 							MaxRange,	MinRange)
VALUES	('REFORM_BRANCH_JFD_GOVERNMENT', 		'REFORM_RIGHT',						10,			7),
		('REFORM_BRANCH_JFD_GOVERNMENT', 		'REFORM_CENTRE',					6,			5),
		('REFORM_BRANCH_JFD_GOVERNMENT', 		'REFORM_LEFT',						4,			0),
		('REFORM_BRANCH_JFD_CULTURE', 			'REFORM_RIGHT',						10,			7),
		('REFORM_BRANCH_JFD_CULTURE', 			'REFORM_CENTRE',					6,			5),
		('REFORM_BRANCH_JFD_CULTURE', 			'REFORM_LEFT',						4,			0),
		('REFORM_BRANCH_JFD_ECONOMY', 			'REFORM_RIGHT',						10,			7),
		('REFORM_BRANCH_JFD_ECONOMY', 			'REFORM_CENTRE',					6,			5),
		('REFORM_BRANCH_JFD_ECONOMY', 			'REFORM_LEFT',						4,			0),
		('REFORM_BRANCH_JFD_FOREIGN', 			'REFORM_RIGHT',						10,			7),
		('REFORM_BRANCH_JFD_FOREIGN', 			'REFORM_CENTRE',					6,			5),
		('REFORM_BRANCH_JFD_FOREIGN', 			'REFORM_LEFT',						4,			0),
		('REFORM_BRANCH_JFD_INDUSTRY', 			'REFORM_RIGHT',						10,			7),
		('REFORM_BRANCH_JFD_INDUSTRY', 			'REFORM_CENTRE',					6,			5),
		('REFORM_BRANCH_JFD_INDUSTRY', 			'REFORM_LEFT',						4,			0),
		('REFORM_BRANCH_JFD_LEGAL', 			'REFORM_RIGHT',						10,			7),
		('REFORM_BRANCH_JFD_LEGAL', 			'REFORM_CENTRE',					6,			5),
		('REFORM_BRANCH_JFD_LEGAL', 			'REFORM_LEFT',						4,			0),
		('REFORM_BRANCH_JFD_MILITARY', 			'REFORM_RIGHT',						10,			7),
		('REFORM_BRANCH_JFD_MILITARY', 			'REFORM_CENTRE',					6,			5),
		('REFORM_BRANCH_JFD_MILITARY', 			'REFORM_LEFT',						4,			0),
		('REFORM_BRANCH_JFD_RELIGION', 			'REFORM_RIGHT',						10,			7),
		('REFORM_BRANCH_JFD_RELIGION', 			'REFORM_CENTRE',					6,			5),
		('REFORM_BRANCH_JFD_RELIGION', 			'REFORM_LEFT',						4,			0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_ReformBranch_Flavours
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO JFD_ReformBranch_Flavours 
		(ReformBranchType, 						FlavourType, 						AltFlavourType)
VALUES	('REFORM_BRANCH_JFD_GOVERNMENT', 		'FLAVOR_JFD_REFORM_GOVERNMENT',		'FLAVOR_EXPANSION'),
		('REFORM_BRANCH_JFD_CULTURE', 			'FLAVOR_JFD_REFORM_CULTURE',		'FLAVOR_CULTURE'),
		('REFORM_BRANCH_JFD_ECONOMY', 			'FLAVOR_JFD_REFORM_ECONOMY',		'FLAVOR_GOLD'),
		('REFORM_BRANCH_JFD_FOREIGN', 			'FLAVOR_JFD_REFORM_FOREIGN',		'FLAVOR_DIPLOMACY'),
		('REFORM_BRANCH_JFD_INDUSTRY', 			'FLAVOR_JFD_REFORM_INDUSTRY',		'FLAVOR_PRODUCTION'),
		('REFORM_BRANCH_JFD_LEGAL', 			'FLAVOR_JFD_REFORM_LEGAL',			'FLAVOR_HAPPINESS'),
		('REFORM_BRANCH_JFD_MILITARY', 			'FLAVOR_JFD_REFORM_MILITARY',		'FLAVOR_OFFENSE'),
		('REFORM_BRANCH_JFD_RELIGION', 			'FLAVOR_JFD_REFORM_RELIGION',		'FLAVOR_RELIGION');
--==========================================================================================================================	
-- REFORMS
--==========================================================================================================================	
-- JFD_Reforms	
--------------------------------------------------------------------------------------------------------------------------		
--Government	
INSERT INTO JFD_Reforms	
		(Type, 													ReformBranchType,					ReformFlavourType,						IsDisabled,		IsSovereignty,	DefaultActive,	IsLegislature,	IsTitled,	Cost,		AutocracyIndex,	FreedomIndex,	OrderIndex,		MaxSovChange,		FactionSovMod,	ReformCooldownMod,	ReformCostMod,	ReformCostModPerCity,	ReformCostModPerPop,	ResetsAssembly,		ResetsHolySynod,	ResetsImperialCourt,	ResetsImperialDiet,	ResetsParliament,	ResetsSenate,	ResetsLegislature,		AnarchySentimentMod,	Alignment,			FocusIcon,										HeaderDescription, 										HeaderHelp,												ShortDescription,													Description,													Help,																HelpBonus,															HelpPenalty,														LegislatureHelp,									LegislatureIdeologyHelp,								Pedia,																PrereqGovernment, 				PrereqReform,									PrereqEra, 				RequiresNumCityStateFriends,	RequiresStateReligion,	PolicyType)
VALUES	--Legitimacy (First)																																																																																																										    				                            		                                        		                                                                                                                                	                                                    	                                                                                                                                                                    							                                                                                                                                                    			                                
		('REFORM_JFD_LEGITIMACY_WISDOM', 						'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				1,				0,				0,				0,			30,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						10,						'REFORM_RIGHT',		'[ICON_JFD_LEGITIMACY][ICON_JFD_SOVEREIGNTY]',	'TXT_KEY_JFD_REFORM_HEADER_LEGITIMACY_DESC',			'TXT_KEY_JFD_REFORM_HEADER_LEGITIMACY_HELP',			'TXT_KEY_JFD_REFORM_LEGITIMACY_WISDOM_SHORT_DESC',					'TXT_KEY_JFD_REFORM_LEGITIMACY_WISDOM_DESC',					'TXT_KEY_JFD_REFORM_LEGITIMACY_WISDOM_HELP',						'TXT_KEY_JFD_REFORM_LEGITIMACY_WISDOM_HELP_BONUS',					'TXT_KEY_JFD_REFORM_LEGITIMACY_WISDOM_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_LEGITIMACY_WISDOM_PEDIA',						NULL,							NULL,											'ERA_ANCIENT',			0,								0,						'POLICY_REFORM_JFD_LEGITIMACY_WISDOM'),
		('REFORM_JFD_LEGITIMACY_MIGHT', 						'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				1,				1,				0,				0,			15,			1,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						10,						'REFORM_CENTRE',	'[ICON_JFD_LEGITIMACY][ICON_JFD_SOVEREIGNTY]',	'TXT_KEY_JFD_REFORM_HEADER_LEGITIMACY_DESC',			'TXT_KEY_JFD_REFORM_HEADER_LEGITIMACY_HELP',			'TXT_KEY_JFD_REFORM_LEGITIMACY_MIGHT_SHORT_DESC',					'TXT_KEY_JFD_REFORM_LEGITIMACY_MIGHT_DESC',						'TXT_KEY_JFD_REFORM_LEGITIMACY_MIGHT_HELP',							'TXT_KEY_JFD_REFORM_LEGITIMACY_MIGHT_HELP_BONUS',					'TXT_KEY_JFD_REFORM_LEGITIMACY_MIGHT_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_LEGITIMACY_MIGHT_PEDIA',						NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_LEGITIMACY_MIGHT'),
		('REFORM_JFD_LEGITIMACY_WEALTH', 						'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				1,				0,				0,				0,			30,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						10,						'REFORM_LEFT',		'[ICON_JFD_LEGITIMACY][ICON_JFD_SOVEREIGNTY]',	'TXT_KEY_JFD_REFORM_HEADER_LEGITIMACY_DESC',			'TXT_KEY_JFD_REFORM_HEADER_LEGITIMACY_HELP',			'TXT_KEY_JFD_REFORM_LEGITIMACY_WEALTH_SHORT_DESC',					'TXT_KEY_JFD_REFORM_LEGITIMACY_WEALTH_DESC',					'TXT_KEY_JFD_REFORM_LEGITIMACY_WEALTH_HELP',						'TXT_KEY_JFD_REFORM_LEGITIMACY_WEALTH_HELP_BONUS',					'TXT_KEY_JFD_REFORM_LEGITIMACY_WEALTH_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_LEGITIMACY_WEALTH_PEDIA',						NULL,							NULL,											'ERA_ANCIENT',			0,								0,						'POLICY_REFORM_JFD_LEGITIMACY_WEALTH'),
		--State                                                                                                        	                                                            	                                    		                                                                                                                                        		                		                                                            	                                                                        		                                                        				                                                                        	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                										                                                                                    	                                                                                		                                
		('REFORM_JFD_STATE_EMPIRE', 							'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				0,				0,				0,				1,			40,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_JFD_SOVEREIGNTY]',						'TXT_KEY_JFD_REFORM_HEADER_STATE_DESC',					'TXT_KEY_JFD_REFORM_HEADER_STATE_HELP',					'TXT_KEY_JFD_REFORM_STATE_EMPIRE_SHORT_DESC',						'TXT_KEY_JFD_REFORM_STATE_EMPIRE_DESC',							'TXT_KEY_JFD_REFORM_STATE_EMPIRE_HELP',								'TXT_KEY_JFD_REFORM_STATE_EMPIRE_HELP_BONUS',						'TXT_KEY_JFD_REFORM_STATE_EMPIRE_HELP_PENALTY',						NULL,												NULL,													'TXT_KEY_JFD_REFORM_STATE_EMPIRE_PEDIA',							NULL,							NULL,											'ERA_CLASSICAL',		0,								0,						'POLICY_REFORM_JFD_STATE_EMPIRE'),
		('REFORM_JFD_STATE_NATION', 							'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				0,				1,				0,				1,			20,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_STATE_DESC',					'TXT_KEY_JFD_REFORM_HEADER_STATE_HELP',					'TXT_KEY_JFD_REFORM_STATE_NATION_SHORT_DESC',						'TXT_KEY_JFD_REFORM_STATE_NATION_DESC',							'TXT_KEY_JFD_REFORM_STATE_NATION_HELP',								'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_STATE_NATION_PEDIA',							NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_STATE_NATION'),
		('REFORM_JFD_STATE_CITYSTATE', 							'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				0,				0,				0,				1,			40,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_JFD_SOVEREIGNTY]',						'TXT_KEY_JFD_REFORM_HEADER_STATE_DESC',					'TXT_KEY_JFD_REFORM_HEADER_STATE_HELP',					'TXT_KEY_JFD_REFORM_STATE_CITYSTATE_SHORT_DESC',					'TXT_KEY_JFD_REFORM_STATE_CITYSTATE_DESC',						'TXT_KEY_JFD_REFORM_STATE_CITYSTATE_HELP',							'TXT_KEY_JFD_REFORM_STATE_CITYSTATE_HELP_BONUS',					'TXT_KEY_JFD_REFORM_STATE_CITYSTATE_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_STATE_CITYSTATE_PEDIA',							NULL,							NULL,											'ERA_CLASSICAL',		0,								0,						'POLICY_REFORM_JFD_STATE_CITYSTATE'),
		--Legislature (Dictatorship)													            						            	                                                                	            																																														            		                					    																																														                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                        			                                                                                    		                                                                			                                            
		('REFORM_JFD_LEGISLATURE_D_MILITARY', 					'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				0,				0,				1,				1,			50,			1,				0,				0,				0,					0,				0,					0,				0,						0,						1,					0,					0,						0,					0,					0,				1,						10,						'REFORM_RIGHT',		'[ICON_JFD_FACTION]',							'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_D_DESC',			'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_D_HELP',			'TXT_KEY_JFD_REFORM_LEGISLATURE_D_MILITARY_SHORT_DESC',				'TXT_KEY_JFD_REFORM_LEGISLATURE_D_MILITARY_DESC',				'TXT_KEY_JFD_REFORM_LEGISLATURE_D_MILITARY_HELP',					'TXT_KEY_JFD_REFORM_LEGISLATURE_D_MILITARY_HELP_BONUS',				'TXT_KEY_JFD_REFORM_LEGISLATURE_D_MILITARY_HELP_PENALTY',			'TXT_KEY_JFD_GO_LEGISLATURE_TT_MILITARY',			NULL,													'TXT_KEY_JFD_REFORM_LEGISLATURE_D_MILITARY_PEDIA',					'GOVERNMENT_JFD_DICTATORSHIP',	NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_LEGISLATURE_D_MILITARY'),
		('REFORM_JFD_LEGISLATURE_D_PERSONAL', 					'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				0,				1,				0,				1,			25,			1,				0,				0,				0,					0,				0,					0,				0,						0,						1,					0,					0,						0,					0,					0,				1,						30,						'REFORM_CENTRE',	'[ICON_JFD_FACTION]',							'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_D_DESC',			'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_D_HELP',			'TXT_KEY_JFD_REFORM_LEGISLATURE_D_PERSONAL_SHORT_DESC',				'TXT_KEY_JFD_REFORM_LEGISLATURE_D_PERSONAL_DESC',				'TXT_KEY_JFD_REFORM_LEGISLATURE_D_PERSONAL_HELP',					'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_LEGISLATURE_D_PERSONAL_HELP_PENALTY',			'TXT_KEY_JFD_GO_LEGISLATURE_NONE',					NULL,													'TXT_KEY_JFD_REFORM_LEGISLATURE_D_PERSONAL_PEDIA',					'GOVERNMENT_JFD_DICTATORSHIP',	NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_LEGISLATURE_D_PERSONAL'),
		('REFORM_JFD_LEGISLATURE_D_ONE_PARTY', 					'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				0,				0,				1,				1,			50,			1,				0,				1,				0,					0,				0,					0,				0,						0,						1,					0,					0,						0,					0,					0,				1,						10,						'REFORM_LEFT',		'[ICON_JFD_FACTION]',							'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_D_DESC',			'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_D_HELP',			'TXT_KEY_JFD_REFORM_LEGISLATURE_D_ONE_PARTY_SHORT_DESC',			'TXT_KEY_JFD_REFORM_LEGISLATURE_D_ONE_PARTY_DESC',				'TXT_KEY_JFD_REFORM_LEGISLATURE_D_ONE_PARTY_HELP',					'TXT_KEY_JFD_REFORM_LEGISLATURE_D_ONE_PARTY_HELP_BONUS',			'TXT_KEY_JFD_REFORM_LEGISLATURE_D_ONE_PARTY_HELP_PENALTY',			'TXT_KEY_JFD_GO_LEGISLATURE_TT_ONE_PARTY',			NULL,													'TXT_KEY_JFD_REFORM_LEGISLATURE_D_ONE_PARTY_PEDIA',					'GOVERNMENT_JFD_DICTATORSHIP',	NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_LEGISLATURE_D_ONE_PARTY'),
		--Legislature (Holy Rome)																																																																																																																																															            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                    										                                                                                                                                                                			                                
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS', 		'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				0,				0,				1,				1,			50,			1,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					1,						1,					0,					0,				1,						10,						'REFORM_RIGHT',		'[ICON_JFD_FACTION]',							'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_HRE_DESC',		'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_HRE_HELP',		'TXT_KEY_JFD_REFORM_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS_SHORT_DESC',	'TXT_KEY_JFD_REFORM_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS_DESC',	'TXT_KEY_JFD_REFORM_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS_HELP',		'TXT_KEY_JFD_REFORM_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS_HELP_BONUS',	'TXT_KEY_JFD_REFORM_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS_HELP_PENALTY','TXT_KEY_JFD_GO_LEGISLATURE_TT_PRIVILEGIUM_MAIUS',	NULL,													'TXT_KEY_JFD_REFORM_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS_HELP_BONUS',	'GOVERNMENT_JFD_HOLY_ROME',		NULL,											'ERA_MEDIEVAL',			1,								0,						'POLICY_REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS'),
		('REFORM_JFD_LEGISLATURE_HRE_NONE', 					'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				0,				1,				0,				1,			25,			1,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					1,						1,					0,					0,				1,						30,						'REFORM_CENTRE',	'[ICON_JFD_FACTION]',							'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_HRE_DESC',		'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_HRE_HELP',		'TXT_KEY_JFD_REFORM_LEGISLATURE_HRE_NONE_SHORT_DESC',				'TXT_KEY_JFD_REFORM_LEGISLATURE_HRE_NONE_DESC',					'TXT_KEY_JFD_REFORM_LEGISLATURE_HRE_NONE_HELP',						'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_LEGISLATURE_HRE_NONE_HELP',						'TXT_KEY_JFD_GO_LEGISLATURE_NONE',					NULL,													'TXT_KEY_JFD_REFORM_LEGISLATURE_HRE_NONE_PEDIA',					'GOVERNMENT_JFD_HOLY_ROME',		NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_LEGISLATURE_HRE_NONE'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR', 		'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				0,				0,				1,				1,			50,			0,				1,				1,				0,					0,				0,					0,				0,						0,						0,					0,					1,						1,					0,					0,				1,						10,						'REFORM_LEFT',		'[ICON_JFD_FACTION]',							'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_HRE_DESC',		'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_HRE_HELP',		'TXT_KEY_JFD_REFORM_LEGISLATURE_HRE_PRIVILEGIUM_MINOR_SHORT_DESC',	'TXT_KEY_JFD_REFORM_LEGISLATURE_HRE_PRIVILEGIUM_MINOR_DESC',	'TXT_KEY_JFD_REFORM_LEGISLATURE_HRE_PRIVILEGIUM_MINOR_HELP',		'TXT_KEY_JFD_REFORM_LEGISLATURE_HRE_PRIVILEGIUM_MINOR_HELP_BONUS',	'TXT_KEY_JFD_REFORM_LEGISLATURE_HRE_PRIVILEGIUM_MINOR_HELP_PENALTY','TXT_KEY_JFD_GO_LEGISLATURE_TT_PRIVILEGIUM_MINOR',	NULL,													'TXT_KEY_JFD_REFORM_LEGISLATURE_HRE_PRIVILEGIUM_MINOR_HELP_BONUS',	'GOVERNMENT_JFD_HOLY_ROME',		NULL,											'ERA_MEDIEVAL',			1,								0,						'POLICY_REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR'),
		--Legislature (Monarchy)												                                                                                	        																																																																																		                                		               			            		                                                                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                    										                                                                                                                                                    			                                            
		('REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC', 				'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				0,				0,				1,				0,			50,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					1,					0,				1,						10,						'REFORM_RIGHT',		'[ICON_JFD_FACTION]',							'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_M_DESC',			'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_M_HELP',			'TXT_KEY_JFD_REFORM_LEGISLATURE_M_ARISTOCRATIC_SHORT_DESC',			'TXT_KEY_JFD_REFORM_LEGISLATURE_M_ARISTOCRATIC_DESC',			'TXT_KEY_JFD_REFORM_LEGISLATURE_M_ARISTOCRATIC_HELP',				'TXT_KEY_JFD_REFORM_LEGISLATURE_M_ARISTOCRATIC_HELP_BONUS',			'TXT_KEY_JFD_REFORM_LEGISLATURE_M_ARISTOCRATIC_HELP_PENALTY',		'TXT_KEY_JFD_GO_LEGISLATURE_TT_ARISTOCRATIC',		NULL,													'TXT_KEY_JFD_REFORM_LEGISLATURE_M_ARISTOCRATIC_PEDIA',				'GOVERNMENT_JFD_MONARCHY',		NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC'),
		('REFORM_JFD_LEGISLATURE_M_NONE', 						'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				0,				1,				0,				0,			25,			1,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					1,					0,				1,						30,						'REFORM_CENTRE',	'[ICON_JFD_FACTION]',							'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_M_DESC',			'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_M_HELP',			'TXT_KEY_JFD_REFORM_LEGISLATURE_M_NONE_SHORT_DESC',					'TXT_KEY_JFD_REFORM_LEGISLATURE_M_NONE_DESC',					'TXT_KEY_JFD_REFORM_LEGISLATURE_M_NONE_HELP',						'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_LEGISLATURE_M_NONE_HELP_PENALTY',				'TXT_KEY_JFD_GO_LEGISLATURE_NONE',					NULL,													'TXT_KEY_JFD_REFORM_LEGISLATURE_M_NONE_PEDIA',						'GOVERNMENT_JFD_MONARCHY',		NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_LEGISLATURE_M_NONE'),
		('REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY', 				'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				0,				0,				1,				0,			50,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					1,					0,				1,						10,						'REFORM_LEFT',		'[ICON_JFD_FACTION]',							'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_M_DESC',			'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_M_HELP',			'TXT_KEY_JFD_REFORM_LEGISLATURE_M_PARLIAMENTARY_SHORT_DESC',		'TXT_KEY_JFD_REFORM_LEGISLATURE_M_PARLIAMENTARY_DESC',			'TXT_KEY_JFD_REFORM_LEGISLATURE_M_PARLIAMENTARY_HELP',				'TXT_KEY_JFD_REFORM_LEGISLATURE_M_PARLIAMENTARY_HELP_BONUS',		'TXT_KEY_JFD_REFORM_LEGISLATURE_M_PARLIAMENTARY_HELP_PENALTY',		'TXT_KEY_JFD_GO_LEGISLATURE_TT_PARLIAMENTARY',		'TXT_KEY_JFD_GO_LEGISLATURE_TT_PARLIAMENTARY_IDEOLOGY',	'TXT_KEY_JFD_REFORM_LEGISLATURE_M_PARLIAMENTARY_PEDIA',				'GOVERNMENT_JFD_MONARCHY',		NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY'),
		--Legislature (Republic)													                					                	                                                            	            																																														                	                																																																				                                        	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                    			                                                                                            	                                                        			                                            
		('REFORM_JFD_LEGISLATURE_R_OLIGARCHIC', 				'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				0,				0,				1,				1,			50,			0,				0,				1,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					1,				1,						10,						'REFORM_RIGHT',		'[ICON_JFD_FACTION]',							'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_R_DESC',			'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_R_HELP',			'TXT_KEY_JFD_REFORM_LEGISLATURE_R_OLIGARCHIC_SHORT_DESC',			'TXT_KEY_JFD_REFORM_LEGISLATURE_R_OLIGARCHIC_DESC',				'TXT_KEY_JFD_REFORM_LEGISLATURE_R_OLIGARCHIC_HELP',					'TXT_KEY_JFD_REFORM_LEGISLATURE_R_OLIGARCHIC_HELP_BONUS',			'TXT_KEY_JFD_REFORM_LEGISLATURE_R_OLIGARCHIC_HELP_PENALTY',			'TXT_KEY_JFD_GO_LEGISLATURE_TT_OLIGARCHIC',			'TXT_KEY_JFD_GO_LEGISLATURE_TT_OLIGARCHIC_IDEOLOGY',	'TXT_KEY_JFD_REFORM_LEGISLATURE_R_OLIGARCHIC_PEDIA',				'GOVERNMENT_JFD_REPUBLIC',		NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_LEGISLATURE_R_OLIGARCHIC'),
		('REFORM_JFD_LEGISLATURE_R_NONE', 						'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				0,				1,				0,				1,			25,			1,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					1,				1,						30,						'REFORM_CENTRE',	'[ICON_JFD_FACTION]',							'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_R_DESC',			'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_R_HELP',			'TXT_KEY_JFD_REFORM_LEGISLATURE_R_NONE_SHORT_DESC',					'TXT_KEY_JFD_REFORM_LEGISLATURE_R_NONE_DESC',					'TXT_KEY_JFD_REFORM_LEGISLATURE_R_NONE_HELP',						'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_LEGISLATURE_R_NONE_HELP_PENALTY',				'TXT_KEY_JFD_GO_LEGISLATURE_NONE',					NULL,													'TXT_KEY_JFD_REFORM_LEGISLATURE_R_NONE_PEDIA',						'GOVERNMENT_JFD_REPUBLIC',		NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_LEGISLATURE_R_NONE'),
		('REFORM_JFD_LEGISLATURE_R_DEMOCRATIC', 				'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				0,				0,				1,				1,			50,			0,				1,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					1,				1,						10,						'REFORM_LEFT',		'[ICON_JFD_FACTION]',							'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_R_DESC',			'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_R_HELP',			'TXT_KEY_JFD_REFORM_LEGISLATURE_R_DEMOCRATIC_SHORT_DESC',			'TXT_KEY_JFD_REFORM_LEGISLATURE_R_DEMOCRATIC_DESC',				'TXT_KEY_JFD_REFORM_LEGISLATURE_R_DEMOCRATIC_HELP',					'TXT_KEY_JFD_REFORM_LEGISLATURE_R_DEMOCRATIC_HELP_BONUS',			'TXT_KEY_JFD_REFORM_LEGISLATURE_R_DEMOCRATIC_HELP_PENALTY',			'TXT_KEY_JFD_GO_LEGISLATURE_TT_DEMOCRATIC',			NULL,													'TXT_KEY_JFD_REFORM_LEGISLATURE_R_DEMOCRATIC_PEDIA',				'GOVERNMENT_JFD_REPUBLIC',		NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_LEGISLATURE_R_DEMOCRATIC'),
		--Legislature (Shogunate)																																																																																																																																															            				                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            										                                                                                                                                                                			                                
		('REFORM_JFD_LEGISLATURE_S_DAIMYO', 					'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			1,				0,				0,				1,				1,			50,			1,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					1,						0,					0,					0,				1,						10,						'REFORM_RIGHT',		'[ICON_JFD_FACTION]',							'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_SHOGUNATE_DESC',	'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_SHOGUNATE_HELP',	'TXT_KEY_JFD_REFORM_LEGISLATURE_S_DAIMYO_SHORT_DESC',				'TXT_KEY_JFD_REFORM_LEGISLATURE_S_DAIMYO_DESC',					'TXT_KEY_JFD_REFORM_LEGISLATURE_S_DAIMYO_HELP',						'TXT_KEY_JFD_REFORM_LEGISLATURE_S_DAIMYO_HELP_BONUS',				'TXT_KEY_JFD_REFORM_LEGISLATURE_S_DAIMYO_HELP_PENALTY',				'TXT_KEY_JFD_GO_LEGISLATURE_TT_DAIMYO',				NULL,													'TXT_KEY_JFD_REFORM_LEGISLATURE_S_DAIMYO_HELP_BONUS',				'GOVERNMENT_JFD_SHOGUNATE',		NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_LEGISLATURE_S_DAIMYO'),
		('REFORM_JFD_LEGISLATURE_S_NONE', 						'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			1,				0,				1,				0,				1,			25,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					1,						0,					0,					0,				1,						30,						'REFORM_CENTRE',	'[ICON_JFD_FACTION]',							'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_SHOGUNATE_DESC',	'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_SHOGUNATE_HELP',	'TXT_KEY_JFD_REFORM_LEGISLATURE_S_NONE_SHORT_DESC',					'TXT_KEY_JFD_REFORM_LEGISLATURE_S_NONE_DESC',					'TXT_KEY_JFD_REFORM_LEGISLATURE_S_NONE_HELP',						'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_LEGISLATURE_S_NONE_HELP',						'TXT_KEY_JFD_GO_LEGISLATURE_NONE',					NULL,													'TXT_KEY_JFD_REFORM_LEGISLATURE_S_NONE_PEDIA',						'GOVERNMENT_JFD_SHOGUNATE',		NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_LEGISLATURE_S_NONE'),
		('REFORM_JFD_LEGISLATURE_S_EMPEROR', 					'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			1,				0,				0,				1,				1,			50,			0,				0,				1,				0,					0,				0,					0,				0,						0,						0,					0,					1,						0,					0,					0,				1,						10,						'REFORM_LEFT',		'[ICON_JFD_FACTION]',							'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_SHOGUNATE_DESC',	'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_SHOGUNATE_HELP',	'TXT_KEY_JFD_REFORM_LEGISLATURE_S_EMPEROR_SHORT_DESC',				'TXT_KEY_JFD_REFORM_LEGISLATURE_S_EMPEROR_DESC',				'TXT_KEY_JFD_REFORM_LEGISLATURE_S_EMPEROR_HELP',					'TXT_KEY_JFD_REFORM_LEGISLATURE_S_EMPEROR_HELP_BONUS',				'TXT_KEY_JFD_REFORM_LEGISLATURE_S_EMPEROR_HELP_PENALTY',			'TXT_KEY_JFD_GO_LEGISLATURE_TT_EMPEROR',			NULL,													'TXT_KEY_JFD_REFORM_LEGISLATURE_S_EMPEROR_HELP_BONUS',				'GOVERNMENT_JFD_SHOGUNATE',		NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_LEGISLATURE_S_EMPEROR'),
		--Legislature (Theocracy)													                					                                                                            	            																																	    			    					    		            	                																																	                                           								                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        										                                                                    	                                                                                			                                            
		('REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS',				'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				0,				0,				1,				1,			50,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					1,					0,						0,					0,					0,				1,						10,						'REFORM_RIGHT',		'[ICON_JFD_FACTION]',							'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_T_DESC',			'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_T_HELP',			'TXT_KEY_JFD_REFORM_LEGISLATURE_T_AUTOCEPHALOUS_SHORT_DESC',		'TXT_KEY_JFD_REFORM_LEGISLATURE_T_AUTOCEPHALOUS_DESC',			'TXT_KEY_JFD_REFORM_LEGISLATURE_T_AUTOCEPHALOUS_HELP',				'TXT_KEY_JFD_REFORM_LEGISLATURE_T_AUTOCEPHALOUS_HELP_BONUS',		'TXT_KEY_JFD_REFORM_LEGISLATURE_T_AUTOCEPHALOUS_HELP_PENALTY',		'TXT_KEY_JFD_GO_LEGISLATURE_TT_AUTOCEPHALOUS',		NULL,													'TXT_KEY_JFD_REFORM_LEGISLATURE_T_AUTOCEPHALOUS_PEDIA',				'GOVERNMENT_JFD_THEOCRACY',		NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS'),
		('REFORM_JFD_LEGISLATURE_T_NONE', 						'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				0,				1,				0,				1,			25,			1,				0,				0,				0,					0,				0,					0,				0,						0,						0,					1,					0,						0,					0,					0,				1,						30,						'REFORM_CENTRE',	'[ICON_JFD_FACTION]',							'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_T_DESC',			'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_T_HELP',			'TXT_KEY_JFD_REFORM_LEGISLATURE_T_NONE_SHORT_DESC',					'TXT_KEY_JFD_REFORM_LEGISLATURE_T_NONE_DESC',					'TXT_KEY_JFD_REFORM_LEGISLATURE_T_NONE_HELP',						'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_LEGISLATURE_T_NONE_HELP_PENALTY',				'TXT_KEY_JFD_GO_LEGISLATURE_NONE',					NULL,													'TXT_KEY_JFD_REFORM_LEGISLATURE_T_NONE_PEDIA',						'GOVERNMENT_JFD_THEOCRACY',		NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_LEGISLATURE_T_NONE'),
		('REFORM_JFD_LEGISLATURE_T_ECUMENICAL', 				'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				0,				0,				1,				1,			50,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					1,					0,						0,					0,					0,				1,						10,						'REFORM_LEFT',		'[ICON_JFD_FACTION]',							'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_T_DESC',			'TXT_KEY_JFD_REFORM_HEADER_LEGISLATURE_T_HELP',			'TXT_KEY_JFD_REFORM_LEGISLATURE_T_ECUMENICAL_SHORT_DESC',			'TXT_KEY_JFD_REFORM_LEGISLATURE_T_ECUMENICAL_DESC',				'TXT_KEY_JFD_REFORM_LEGISLATURE_T_ECUMENICAL_HELP',					'TXT_KEY_JFD_REFORM_LEGISLATURE_T_ECUMENICAL_HELP_BONUS',			'TXT_KEY_JFD_REFORM_LEGISLATURE_T_ECUMENICAL_HELP_PENALTY',			'TXT_KEY_JFD_GO_LEGISLATURE_TT_ECUMENICAL',			NULL,													'TXT_KEY_JFD_REFORM_LEGISLATURE_T_ECUMENICAL_PEDIA',				'GOVERNMENT_JFD_THEOCRACY',		NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_LEGISLATURE_T_ECUMENICAL'),
		--Succession                                                                            	                                		                                                            							                                                                                                                                        		                		                                                            	                                                                        		                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                   		    								                                                                	                                                                                                		                                
		('REFORM_JFD_SUCCESSION_HEREDITARY', 					'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				0,				0,				0,				0,			50,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_JFD_WLTKD]',								'TXT_KEY_JFD_REFORM_HEADER_SUCCESSION_DESC',			'TXT_KEY_JFD_REFORM_HEADER_SUCCESSION_HELP',			'TXT_KEY_JFD_REFORM_SUCCESSION_HEREDITARY_SHORT_DESC',				'TXT_KEY_JFD_REFORM_SUCCESSION_HEREDITARY_DESC',				'TXT_KEY_JFD_REFORM_SUCCESSION_HEREDITARY_HELP',					'TXT_KEY_JFD_REFORM_SUCCESSION_HEREDITARY_HELP_BONUS',				'TXT_KEY_JFD_REFORM_SUCCESSION_HEREDITARY_HELP_PENALTY',			NULL,												NULL,													'TXT_KEY_JFD_REFORM_SUCCESSION_HEREDITARY_PEDIA',					NULL,							NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_SUCCESSION_HEREDITARY'),
		('REFORM_JFD_SUCCESSION_APPOINTED', 					'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				0,				1,				0,				0,			25,			1,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_SUCCESSION_DESC',			'TXT_KEY_JFD_REFORM_HEADER_SUCCESSION_HELP',			'TXT_KEY_JFD_REFORM_SUCCESSION_APPOINTED_SHORT_DESC',				'TXT_KEY_JFD_REFORM_SUCCESSION_APPOINTED_DESC',					'TXT_KEY_JFD_REFORM_SUCCESSION_APPOINTED_HELP',						'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_SUCCESSION_APPOINTED_PEDIA',					NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_SUCCESSION_APPOINTED'),
		('REFORM_JFD_SUCCESSION_ELECTIVE', 						'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				0,				0,				0,				0,			50,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_GOLDEN_AGE]',							'TXT_KEY_JFD_REFORM_HEADER_SUCCESSION_DESC',			'TXT_KEY_JFD_REFORM_HEADER_SUCCESSION_HELP',			'TXT_KEY_JFD_REFORM_SUCCESSION_ELECTIVE_SHORT_DESC',				'TXT_KEY_JFD_REFORM_SUCCESSION_ELECTIVE_DESC',					'TXT_KEY_JFD_REFORM_SUCCESSION_ELECTIVE_HELP',						'TXT_KEY_JFD_REFORM_SUCCESSION_ELECTIVE_HELP_BONUS',				'TXT_KEY_JFD_REFORM_SUCCESSION_ELECTIVE_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_SUCCESSION_ELECTIVE_PEDIA',						NULL,							NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_SUCCESSION_ELECTIVE'),
		--Legitimacy (Second)	                                                                                                        	                                                           								                                                                                                                                        		                		                                                            	                                                                        		                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                    										                                                                	                                                                                                            
		('REFORM_JFD_LEGITIMACY_DIVINE_RIGHT', 					'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				1,				0,				0,				0,			60,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						10,						'REFORM_RIGHT',		'[ICON_JFD_LEGITIMACY][ICON_JFD_SOVEREIGNTY]',	'TXT_KEY_JFD_REFORM_HEADER_LEGITIMACY_DESC',			'TXT_KEY_JFD_REFORM_HEADER_LEGITIMACY_HELP',			'TXT_KEY_JFD_REFORM_LEGITIMACY_DIVINE_RIGHT_SHORT_DESC',			'TXT_KEY_JFD_REFORM_LEGITIMACY_DIVINE_RIGHT_DESC',				'TXT_KEY_JFD_REFORM_LEGITIMACY_DIVINE_RIGHT_HELP',					'TXT_KEY_JFD_REFORM_LEGITIMACY_DIVINE_RIGHT_HELP_BONUS',			'TXT_KEY_JFD_REFORM_LEGITIMACY_DIVINE_RIGHT_HELP_PENALTY',			NULL,												NULL,													'TXT_KEY_JFD_REFORM_LEGITIMACY_DIVINE_RIGHT_PEDIA',					NULL,							NULL,											'ERA_RENAISSANCE',		0,								1,						'POLICY_REFORM_JFD_LEGITIMACY_DIVINE_RIGHT'),
		('REFORM_JFD_LEGITIMACY_GOVERNANCE', 					'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				1,				1,				0,				0,			30,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						10,						'REFORM_CENTRE',	'[ICON_JFD_LEGITIMACY][ICON_JFD_SOVEREIGNTY]',	'TXT_KEY_JFD_REFORM_HEADER_LEGITIMACY_DESC',			'TXT_KEY_JFD_REFORM_HEADER_LEGITIMACY_HELP',			'TXT_KEY_JFD_REFORM_LEGITIMACY_GOVERNANCE_SHORT_DESC',				'TXT_KEY_JFD_REFORM_LEGITIMACY_GOVERNANCE_DESC',				'TXT_KEY_JFD_REFORM_LEGITIMACY_GOVERNANCE_HELP',					'TXT_KEY_JFD_REFORM_LEGITIMACY_GOVERNANCE_HELP_BONUS',				'TXT_KEY_JFD_REFORM_LEGITIMACY_GOVERNANCE_HELP_PENALTY',			NULL,												NULL,													'TXT_KEY_JFD_REFORM_LEGITIMACY_GOVERNANCE_PEDIA',					NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_LEGITIMACY_GOVERNANCE'),
		('REFORM_JFD_LEGITIMACY_LAW', 							'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				1,				0,				0,				0,			60,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						10,						'REFORM_LEFT',		'[ICON_JFD_LEGITIMACY][ICON_JFD_SOVEREIGNTY]',	'TXT_KEY_JFD_REFORM_HEADER_LEGITIMACY_DESC',			'TXT_KEY_JFD_REFORM_HEADER_LEGITIMACY_HELP',			'TXT_KEY_JFD_REFORM_LEGITIMACY_LAW_SHORT_DESC',						'TXT_KEY_JFD_REFORM_LEGITIMACY_LAW_DESC',						'TXT_KEY_JFD_REFORM_LEGITIMACY_LAW_HELP',							'TXT_KEY_JFD_REFORM_LEGITIMACY_LAW_HELP_BONUS',						'TXT_KEY_JFD_REFORM_LEGITIMACY_LAW_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_LEGITIMACY_LAW_PEDIA',							NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_LEGITIMACY_LAW'),
		--Executive			                                                                                                            																							                                                                                                                                        		                		                                                            	                                                                        		                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                    										                                                                	                                						
		('REFORM_JFD_EXECUTIVE_ABSOLUTE', 						'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				0,				0,				0,				0,			60,			1,				0,				0,				80,					-20,			0,					0,				0,						0,						1,					1,					1,						1,					1,					1,				1,						0,						'REFORM_RIGHT',		'[ICON_JFD_SOVEREIGNTY]',						'TXT_KEY_JFD_REFORM_HEADER_EXECUTIVE_M_DESC',			'TXT_KEY_JFD_REFORM_HEADER_EXECUTIVE_M_HELP',			'TXT_KEY_JFD_REFORM_EXECUTIVE_ABSOLUTE_SHORT_DESC',					'TXT_KEY_JFD_REFORM_EXECUTIVE_ABSOLUTE_DESC',					'TXT_KEY_JFD_REFORM_EXECUTIVE_ABSOLUTE_HELP',						'TXT_KEY_JFD_REFORM_EXECUTIVE_ABSOLUTE_HELP_BONUS',					'TXT_KEY_JFD_REFORM_EXECUTIVE_ABSOLUTE_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_EXECUTIVE_ABSOLUTE_PEDIA',						NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_EXECUTIVE_ABSOLUTE'),
		('REFORM_JFD_EXECUTIVE_DESPOTIC', 						'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				0,				1,				0,				0,			30,			1,				0,				0,				50,					0,				0,					0,				0,						0,						1,					1,					1,						1,					1,					1,				1,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_EXECUTIVE_M_DESC',			'TXT_KEY_JFD_REFORM_HEADER_EXECUTIVE_M_HELP',			'TXT_KEY_JFD_REFORM_EXECUTIVE_DESPOTIC_SHORT_DESC',					'TXT_KEY_JFD_REFORM_EXECUTIVE_DESPOTIC_DESC',					'TXT_KEY_JFD_REFORM_EXECUTIVE_DESPOTIC_HELP',						'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_EXECUTIVE_DESPOTIC_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_EXECUTIVE_DESPOTIC_PEDIA',						NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_EXECUTIVE_DESPOTIC'),
		('REFORM_JFD_EXECUTIVE_CONSTITUTIONAL', 				'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				0,				0,				0,				0,			60,			0,				0,				0,				50,					50,				0,					0,				0,						0,						1,					1,					1,						1,					1,					1,				1,						0,						'REFORM_LEFT',		'[ICON_JFD_FACTION]',							'TXT_KEY_JFD_REFORM_HEADER_EXECUTIVE_M_DESC',			'TXT_KEY_JFD_REFORM_HEADER_EXECUTIVE_M_HELP',			'TXT_KEY_JFD_REFORM_EXECUTIVE_CONSTITUTIONAL_SHORT_DESC',			'TXT_KEY_JFD_REFORM_EXECUTIVE_CONSTITUTIONAL_DESC',				'TXT_KEY_JFD_REFORM_EXECUTIVE_CONSTITUTIONAL_HELP',					'TXT_KEY_JFD_REFORM_EXECUTIVE_CONSTITUTIONAL_HELP_BONUS',			'TXT_KEY_JFD_REFORM_EXECUTIVE_CONSTITUTIONAL_HELP_PENALTY',			NULL,												NULL,													'TXT_KEY_JFD_REFORM_EXECUTIVE_CONSTITUTIONAL_PEDIA',				NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_EXECUTIVE_CONSTITUTIONAL'),
		--Structure 																																																																																																																																														        		                    		                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                										                                                                                    	                                                                                		                                
		('REFORM_JFD_STRUCTURE_UNITARY', 						'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				1,				0,				0,				0,			60,			1,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_HAPPINESS_4]',							'TXT_KEY_JFD_REFORM_HEADER_STRUCTURE_DESC',				'TXT_KEY_JFD_REFORM_HEADER_STRUCTURE_HELP',				'TXT_KEY_JFD_REFORM_STRUCTURE_UNITARY_SHORT_DESC',					'TXT_KEY_JFD_REFORM_STRUCTURE_UNITARY_DESC',					'TXT_KEY_JFD_REFORM_STRUCTURE_UNITARY_HELP',						'TXT_KEY_JFD_REFORM_STRUCTURE_UNITARY_HELP_BONUS',					'TXT_KEY_JFD_REFORM_STRUCTURE_UNITARY_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_STRUCTURE_UNITARY_PEDIA',						NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_STRUCTURE_UNITARY'),
		('REFORM_JFD_STRUCTURE_ASSOCIATION', 					'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				1,				1,				0,				0,			30,			0,				0,				1,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_STRUCTURE_DESC',				'TXT_KEY_JFD_REFORM_HEADER_STRUCTURE_HELP',				'TXT_KEY_JFD_REFORM_STRUCTURE_ASSOCIATION_SHORT_DESC',				'TXT_KEY_JFD_REFORM_STRUCTURE_ASSOCIATION_DESC',				'TXT_KEY_JFD_REFORM_STRUCTURE_ASSOCIATION_HELP',					'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_STRUCTURE_ASSOCIATION_PEDIA',					NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_STRUCTURE_ASSOCIATION'),
		('REFORM_JFD_STRUCTURE_FEDERATION', 					'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				1,				0,				0,				1,			60,			0,				1,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_HAPPINESS_4]',							'TXT_KEY_JFD_REFORM_HEADER_STRUCTURE_DESC',				'TXT_KEY_JFD_REFORM_HEADER_STRUCTURE_HELP',				'TXT_KEY_JFD_REFORM_STRUCTURE_FEDERATION_SHORT_DESC',				'TXT_KEY_JFD_REFORM_STRUCTURE_FEDERATION_DESC',					'TXT_KEY_JFD_REFORM_STRUCTURE_FEDERATION_HELP',						'TXT_KEY_JFD_REFORM_STRUCTURE_FEDERATION_HELP_BONUS',				'TXT_KEY_JFD_REFORM_STRUCTURE_FEDERATION_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_STRUCTURE_FEDERATION_PEDIA',					NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_STRUCTURE_FEDERATION'),
		--Suffrage																																																																																																																																									                                                    				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                    										                                                                	                                                                				                		                                
		('REFORM_JFD_SUFFRAGE_LANDED', 							'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				0,				0,				0,				0,			60,			0,				0,				0,				0,					0,				0,					0,				-5,						0,						0,					0,					0,						0,					0,					0,				0,						20,						'REFORM_RIGHT',		'[ICON_JFD_REFORM][ICON_JFD_SOVEREIGNTY]',		'TXT_KEY_JFD_REFORM_HEADER_SUFFRAGE_DESC',				'TXT_KEY_JFD_REFORM_HEADER_SUFFRAGE_HELP',				'TXT_KEY_JFD_REFORM_SUFFRAGE_LANDED_SHORT_DESC',					'TXT_KEY_JFD_REFORM_SUFFRAGE_LANDED_DESC',						'TXT_KEY_JFD_REFORM_SUFFRAGE_LANDED_HELP',							'TXT_KEY_JFD_REFORM_SUFFRAGE_LANDED_HELP_BONUS',					'TXT_KEY_JFD_REFORM_SUFFRAGE_LANDED_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_SUFFRAGE_LANDED_PEDIA',							NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_SUFFRAGE_LANDED'),
		('REFORM_JFD_SUFFRAGE_NONE', 							'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				0,				1,				0,				0,			60,			1,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_SUFFRAGE_DESC',				'TXT_KEY_JFD_REFORM_HEADER_SUFFRAGE_HELP',				'TXT_KEY_JFD_REFORM_SUFFRAGE_NONE_SHORT_DESC',						'TXT_KEY_JFD_REFORM_SUFFRAGE_NONE_DESC',						'TXT_KEY_JFD_REFORM_SUFFRAGE_NONE_HELP',							'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_SUFFRAGE_NONE_PEDIA',							NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_SUFFRAGE_NONE'),
		('REFORM_JFD_SUFFRAGE_UNIVERSAL', 						'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				0,				0,				0,				0,			60,			0,				1,				1,				0,					0,				0,					0,				0,						-1,						0,					0,					0,						0,					0,					0,				0,						20,						'REFORM_LEFT',		'[ICON_JFD_REFORM][ICON_JFD_SOVEREIGNTY]',		'TXT_KEY_JFD_REFORM_HEADER_SUFFRAGE_DESC',				'TXT_KEY_JFD_REFORM_HEADER_SUFFRAGE_HELP',				'TXT_KEY_JFD_REFORM_SUFFRAGE_UNIVERSAL_SHORT_DESC',					'TXT_KEY_JFD_REFORM_SUFFRAGE_UNIVERSAL_DESC',					'TXT_KEY_JFD_REFORM_SUFFRAGE_UNIVERSAL_HELP',						'TXT_KEY_JFD_REFORM_SUFFRAGE_UNIVERSAL_HELP_BONUS',					'TXT_KEY_JFD_REFORM_SUFFRAGE_UNIVERSAL_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_SUFFRAGE_UNIVERSAL_PEDIA',						NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_SUFFRAGE_UNIVERSAL'),
		--Legitimacy (Third)                                                                                                            	                                                           								                                                                                                                                        		                		                                                            	                                                                        		                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                    										                                                                	                                                                                                		                                
		('REFORM_JFD_LEGITIMACY_SECURITY', 						'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				1,				0,				0,				0,			70,			1,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						10,						'REFORM_RIGHT',		'[ICON_JFD_LEGITIMACY][ICON_JFD_SOVEREIGNTY]',	'TXT_KEY_JFD_REFORM_HEADER_LEGITIMACY_DESC',			'TXT_KEY_JFD_REFORM_HEADER_LEGITIMACY_HELP',			'TXT_KEY_JFD_REFORM_LEGITIMACY_SECURITY_SHORT_DESC',				'TXT_KEY_JFD_REFORM_LEGITIMACY_SECURITY_DESC',					'TXT_KEY_JFD_REFORM_LEGITIMACY_SECURITY_HELP',						'TXT_KEY_JFD_REFORM_LEGITIMACY_SECURITY_HELP_BONUS',				'TXT_KEY_JFD_REFORM_LEGITIMACY_SECURITY_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_LEGITIMACY_SECURITY_PEDIA',						NULL,							NULL,											'ERA_INDUSTRIAL',		0,								0,						'POLICY_REFORM_JFD_LEGITIMACY_SECURITY'),
		('REFORM_JFD_LEGITIMACY_TRADITION', 					'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				1,				1,				0,				0,			45,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						10,						'REFORM_CENTRE',	'[ICON_JFD_LEGITIMACY][ICON_JFD_SOVEREIGNTY]',	'TXT_KEY_JFD_REFORM_HEADER_LEGITIMACY_DESC',			'TXT_KEY_JFD_REFORM_HEADER_LEGITIMACY_HELP',			'TXT_KEY_JFD_REFORM_LEGITIMACY_TRADITION_SHORT_DESC',				'TXT_KEY_JFD_REFORM_LEGITIMACY_TRADITION_DESC',					'TXT_KEY_JFD_REFORM_LEGITIMACY_TRADITION_HELP',						'TXT_KEY_JFD_REFORM_LEGITIMACY_TRADITION_HELP_BONUS',				'TXT_KEY_JFD_REFORM_LEGITIMACY_TRADITION_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_LEGITIMACY_TRADITION_PEDIA',					NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_LEGITIMACY_TRADITION'),
		('REFORM_JFD_LEGITIMACY_CHARISMA', 						'REFORM_BRANCH_JFD_GOVERNMENT',		'FLAVOR_JFD_REFORM_GOVERNMENT',			0,				1,				0,				0,				0,			70,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						10,						'REFORM_LEFT',		'[ICON_JFD_LEGITIMACY][ICON_JFD_SOVEREIGNTY]',	'TXT_KEY_JFD_REFORM_HEADER_LEGITIMACY_DESC',			'TXT_KEY_JFD_REFORM_HEADER_LEGITIMACY_HELP',			'TXT_KEY_JFD_REFORM_LEGITIMACY_CHARISMA_SHORT_DESC',				'TXT_KEY_JFD_REFORM_LEGITIMACY_CHARISMA_DESC',					'TXT_KEY_JFD_REFORM_LEGITIMACY_CHARISMA_HELP',						'TXT_KEY_JFD_REFORM_LEGITIMACY_CHARISMA_HELP_BONUS',				'TXT_KEY_JFD_REFORM_LEGITIMACY_CHARISMA_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_LEGITIMACY_CHARISMA_PEDIA',						NULL,							NULL,											'ERA_INDUSTRIAL',		0,								0,						'POLICY_REFORM_JFD_LEGITIMACY_CHARISMA');
														
--Legal									
INSERT INTO JFD_Reforms									
		(Type, 													ReformBranchType,					ReformFlavourType,						IsDisabled,		IsSovereignty,	DefaultActive,	IsLegislature,	IsTitled,	Cost,		AutocracyIndex,	FreedomIndex,	OrderIndex,		MaxSovChange,		FactionSovMod,	ReformCooldownMod,	ReformCostMod,	ReformCostModPerCity,	ReformCostModPerPop,	ResetsAssembly,		ResetsHolySynod,	ResetsImperialCourt,	ResetsImperialDiet,	ResetsParliament,	ResetsSenate,	ResetsLegislature,		AnarchySentimentMod,	Alignment,			FocusIcon,										HeaderDescription, 										HeaderHelp,												ShortDescription,													Description,													Help,																HelpBonus,															HelpPenalty,														LegislatureHelp,									LegislatureIdeologyHelp,								Pedia,																PrereqGovernment, 				PrereqReform,									PrereqEra, 				RequiresNumCityStateFriends,	RequiresStateReligion,	PolicyType)
VALUES	--Records                            	                                                                                                    																				                                                                                                                                                                                                                                    	                                		                                                    		                                                                                                                            	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                                         		                                
		('REFORM_JFD_RECORDS_WRITTEN', 							'REFORM_BRANCH_JFD_LEGAL',			'FLAVOR_JFD_REFORM_LEGAL',				0,				0,				0,				0,				0,			30,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_JFD_CRIME_PRODUCTION]',					'TXT_KEY_JFD_REFORM_HEADER_RECORDS_DESC',				'TXT_KEY_JFD_REFORM_HEADER_RECORDS_HELP',				'TXT_KEY_JFD_REFORM_RECORDS_WRITTEN_SHORT_DESC',					'TXT_KEY_JFD_REFORM_RECORDS_WRITTEN_DESC',						'TXT_KEY_JFD_REFORM_RECORDS_WRITTEN_HELP',							'TXT_KEY_JFD_REFORM_RECORDS_WRITTEN_HELP_BONUS',					'TXT_KEY_JFD_REFORM_RECORDS_WRITTEN_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_RECORDS_WRITTEN_PEDIA',							NULL,							NULL,											'ERA_ANCIENT',			0,								0,						'POLICY_REFORM_JFD_RECORDS_WRITTEN'),
		('REFORM_JFD_RECORDS_NONE', 							'REFORM_BRANCH_JFD_LEGAL',			'FLAVOR_JFD_REFORM_LEGAL',				0,				0,				1,				0,				0,			15,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_RECORDS_DESC',				'TXT_KEY_JFD_REFORM_HEADER_RECORDS_HELP',				'TXT_KEY_JFD_REFORM_RECORDS_NONE_SHORT_DESC',						'TXT_KEY_JFD_REFORM_RECORDS_NONE_DESC',							'TXT_KEY_JFD_REFORM_RECORDS_NONE_HELP',								'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_RECORDS_NONE_PEDIA',							NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_RECORDS_NONE'),
		('REFORM_JFD_RECORDS_ORAL', 							'REFORM_BRANCH_JFD_LEGAL',			'FLAVOR_JFD_REFORM_LEGAL',				0,				0,				0,				0,				0,			30,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_CULTURE]',								'TXT_KEY_JFD_REFORM_HEADER_RECORDS_DESC',				'TXT_KEY_JFD_REFORM_HEADER_RECORDS_HELP',				'TXT_KEY_JFD_REFORM_RECORDS_ORAL_SHORT_DESC',						'TXT_KEY_JFD_REFORM_RECORDS_ORAL_DESC',							'TXT_KEY_JFD_REFORM_RECORDS_ORAL_HELP',								'TXT_KEY_JFD_REFORM_RECORDS_ORAL_HELP_BONUS',						'TXT_KEY_JFD_REFORM_RECORDS_ORAL_HELP_PENALTY',						NULL,												NULL,													'TXT_KEY_JFD_REFORM_RECORDS_ORAL_PEDIA',							NULL,							NULL,											'ERA_ANCIENT',			0,								0,						'POLICY_REFORM_JFD_RECORDS_ORAL'),
		--System                                                                            	                                	    	                                                            							                                                                                                                                        		                		                                                            	                                                                        		                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                    		    								                                                                                                                                                                		                                
		('REFORM_JFD_SYSTEM_CIVIL', 							'REFORM_BRANCH_JFD_LEGAL',			'FLAVOR_JFD_REFORM_LEGAL',				0,				0,				0,				0,				0,			40,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_JFD_CRIME_BLACK]',						'TXT_KEY_JFD_REFORM_HEADER_SYSTEM_DESC',				'TXT_KEY_JFD_REFORM_HEADER_SYSTEM_HELP',				'TXT_KEY_JFD_REFORM_SYSTEM_CIVIL_SHORT_DESC',						'TXT_KEY_JFD_REFORM_SYSTEM_CIVIL_DESC',							'TXT_KEY_JFD_REFORM_SYSTEM_CIVIL_HELP',								'TXT_KEY_JFD_REFORM_SYSTEM_CIVIL_HELP_BONUS',						'TXT_KEY_JFD_REFORM_SYSTEM_CIVIL_HELP_PENALTY',						NULL,												NULL,													'TXT_KEY_JFD_REFORM_SYSTEM_CIVIL_PEDIA',							NULL,							NULL,											'ERA_CLASSICAL',		0,								0,						'POLICY_REFORM_JFD_SYSTEM_CIVIL'),
		('REFORM_JFD_SYSTEM_CUSTOMARY', 						'REFORM_BRANCH_JFD_LEGAL',			'FLAVOR_JFD_REFORM_LEGAL',				0,				0,				1,				0,				0,			20,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_SYSTEM_DESC',				'TXT_KEY_JFD_REFORM_HEADER_SYSTEM_HELP',				'TXT_KEY_JFD_REFORM_SYSTEM_CUSTOMARY_SHORT_DESC',					'TXT_KEY_JFD_REFORM_SYSTEM_CUSTOMARY_DESC',						'TXT_KEY_JFD_REFORM_SYSTEM_CUSTOMARY_HELP',							'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_SYSTEM_CUSTOMARY_PEDIA',						NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_SYSTEM_CUSTOMARY'),
		('REFORM_JFD_SYSTEM_COMMON', 							'REFORM_BRANCH_JFD_LEGAL',			'FLAVOR_JFD_REFORM_LEGAL',				0,				0,				0,				0,				0,			40,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_JFD_CRIME_BLACK]',						'TXT_KEY_JFD_REFORM_HEADER_SYSTEM_DESC',				'TXT_KEY_JFD_REFORM_HEADER_SYSTEM_HELP',				'TXT_KEY_JFD_REFORM_SYSTEM_COMMON_SHORT_DESC',						'TXT_KEY_JFD_REFORM_SYSTEM_COMMON_DESC',						'TXT_KEY_JFD_REFORM_SYSTEM_COMMON_HELP',							'TXT_KEY_JFD_REFORM_SYSTEM_COMMON_HELP_BONUS',						'TXT_KEY_JFD_REFORM_SYSTEM_COMMON_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_SYSTEM_COMMON_PEDIA',							NULL,							NULL,											'ERA_CLASSICAL',		0,								0,						'POLICY_REFORM_JFD_SYSTEM_COMMON'),
		--Basis                                                                                                                         	                                                            							                                                                                                                                        		                		                                                            	                                                                        		                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                           		    								                                                                                                                                                                		                                
		('REFORM_JFD_BASIS_RELIGIOUS', 							'REFORM_BRANCH_JFD_LEGAL',			'FLAVOR_JFD_REFORM_LEGAL',				0,				0,				0,				0,				0,			50,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_JFD_SOVEREIGNTY]',						'TXT_KEY_JFD_REFORM_HEADER_BASIS_DESC',					'TXT_KEY_JFD_REFORM_HEADER_BASIS_HELP',					'TXT_KEY_JFD_REFORM_BASIS_RELIGIOUS_SHORT_DESC',					'TXT_KEY_JFD_REFORM_BASIS_RELIGIOUS_DESC',						'TXT_KEY_JFD_REFORM_BASIS_RELIGIOUS_HELP',							'TXT_KEY_JFD_REFORM_BASIS_RELIGIOUS_HELP_BONUS',					'TXT_KEY_JFD_REFORM_BASIS_RELIGIOUS_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_BASIS_RELIGIOUS_PEDIA',							NULL,							NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_BASIS_RELIGIOUS'),
		('REFORM_JFD_BASIS_MORAL', 								'REFORM_BRANCH_JFD_LEGAL',			'FLAVOR_JFD_REFORM_LEGAL',				0,				0,				1,				0,				0,			25,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_BASIS_DESC',					'TXT_KEY_JFD_REFORM_HEADER_BASIS_HELP',					'TXT_KEY_JFD_REFORM_BASIS_MORAL_SHORT_DESC',						'TXT_KEY_JFD_REFORM_BASIS_MORAL_DESC',							'TXT_KEY_JFD_REFORM_BASIS_MORAL_HELP',								'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_BASIS_MORAL_PEDIA',								NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_BASIS_MORAL'),
		('REFORM_JFD_BASIS_SECULAR', 							'REFORM_BRANCH_JFD_LEGAL',			'FLAVOR_JFD_REFORM_LEGAL',				0,				0,				0,				0,				0,			50,			0,				1,				1,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_JFD_SOVEREIGNTY]',						'TXT_KEY_JFD_REFORM_HEADER_BASIS_DESC',					'TXT_KEY_JFD_REFORM_HEADER_BASIS_HELP',					'TXT_KEY_JFD_REFORM_BASIS_SECULAR_SHORT_DESC',						'TXT_KEY_JFD_REFORM_BASIS_SECULAR_DESC',						'TXT_KEY_JFD_REFORM_BASIS_SECULAR_HELP',							'TXT_KEY_JFD_REFORM_BASIS_SECULAR_HELP_BONUS',						'TXT_KEY_JFD_REFORM_BASIS_SECULAR_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_BASIS_SECULAR_PEDIA',							NULL,							NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_BASIS_SECULAR'),
		--Execution                                                                                                                     	                                                            							                                                                                                                                        		                		                                                            	                                                                        		                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                           		    								                                                                                                                                                                		                                
		('REFORM_JFD_EXECUTION_RESERVED', 						'REFORM_BRANCH_JFD_LEGAL',			'FLAVOR_JFD_REFORM_LEGAL',				0,				0,				0,				0,				0,			50,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_JFD_CRIME_HAPPINESS]',					'TXT_KEY_JFD_REFORM_HEADER_EXECUTION_DESC',				'TXT_KEY_JFD_REFORM_HEADER_EXECUTION_HELP',				'TXT_KEY_JFD_REFORM_EXECUTION_RESERVED_SHORT_DESC',					'TXT_KEY_JFD_REFORM_EXECUTION_RESERVED_DESC',					'TXT_KEY_JFD_REFORM_EXECUTION_RESERVED_HELP',						'TXT_KEY_JFD_REFORM_EXECUTION_RESERVED_HELP_BONUS',					'TXT_KEY_JFD_REFORM_EXECUTION_RESERVED_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_EXECUTION_RESERVED_PEDIA',						NULL,							NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_EXECUTION_RESERVED'),
		('REFORM_JFD_EXECUTION_ARBITRARY', 						'REFORM_BRANCH_JFD_LEGAL',			'FLAVOR_JFD_REFORM_LEGAL',				0,				0,				1,				0,				0,			25,			1,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_EXECUTION_DESC',				'TXT_KEY_JFD_REFORM_HEADER_EXECUTION_HELP',				'TXT_KEY_JFD_REFORM_EXECUTION_ARBITRARY_SHORT_DESC',				'TXT_KEY_JFD_REFORM_EXECUTION_ARBITRARY_DESC',					'TXT_KEY_JFD_REFORM_EXECUTION_ARBITRARY_HELP',						'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_EXECUTION_ARBITRARY_PEDIA',						NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_EXECUTION_ARBITRARY'),
		('REFORM_JFD_EXECUTION_PROHIBITED', 					'REFORM_BRANCH_JFD_LEGAL',			'FLAVOR_JFD_REFORM_LEGAL',				0,				0,				0,				0,				0,			50,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_JFD_CRIME_PRESTIGE]',							'TXT_KEY_JFD_REFORM_HEADER_EXECUTION_DESC',				'TXT_KEY_JFD_REFORM_HEADER_EXECUTION_HELP',				'TXT_KEY_JFD_REFORM_EXECUTION_PROHIBITED_SHORT_DESC',				'TXT_KEY_JFD_REFORM_EXECUTION_PROHIBITED_DESC',					'TXT_KEY_JFD_REFORM_EXECUTION_PROHIBITED_HELP',						'TXT_KEY_JFD_REFORM_EXECUTION_PROHIBITED_HELP_BONUS',				'TXT_KEY_JFD_REFORM_EXECUTION_PROHIBITED_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_EXECUTION_PROHIBITED_PEDIA',					NULL,							NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_EXECUTION_PROHIBITED'),
		--Peerage                                                                                                                       	                                                            							                                                                                                                                        		                		                                                            	                                                                        		                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                           		    								                                                                                                                                                                    		                                
		('REFORM_JFD_PEERAGE_PRIVILEGED', 						'REFORM_BRANCH_JFD_LEGAL',			'FLAVOR_JFD_REFORM_LEGAL',				0,				0,				0,				0,				0,			50,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_MAGISTRATES]',							'TXT_KEY_JFD_REFORM_HEADER_PEERAGE_DESC',				'TXT_KEY_JFD_REFORM_HEADER_PEERAGE_HELP',				'TXT_KEY_JFD_REFORM_PEERAGE_PRIVILEGED_SHORT_DESC',					'TXT_KEY_JFD_REFORM_PEERAGE_PRIVILEGED_DESC',					'TXT_KEY_JFD_REFORM_PEERAGE_PRIVILEGED_HELP',						'TXT_KEY_JFD_REFORM_PEERAGE_PRIVILEGED_HELP_BONUS',					'TXT_KEY_JFD_REFORM_PEERAGE_PRIVILEGED_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_PEERAGE_PRIVILEGED_PEDIA',						NULL,							NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_PEERAGE_PRIVILEGED'),
		('REFORM_JFD_PEERAGE_NONE', 							'REFORM_BRANCH_JFD_LEGAL',			'FLAVOR_JFD_REFORM_LEGAL',				0,				0,				1,				0,				0,			25,			0,				1,				1,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_PEERAGE_DESC',				'TXT_KEY_JFD_REFORM_HEADER_PEERAGE_HELP',				'TXT_KEY_JFD_REFORM_PEERAGE_NONE_SHORT_DESC',						'TXT_KEY_JFD_REFORM_PEERAGE_NONE_DESC',							'TXT_KEY_JFD_REFORM_PEERAGE_NONE_HELP',								'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_PEERAGE_NONE_PEDIA',							NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_PEERAGE_NONE'),
		('REFORM_JFD_PEERAGE_CEREMONIAL', 						'REFORM_BRANCH_JFD_LEGAL',			'FLAVOR_JFD_REFORM_LEGAL',				0,				0,				0,				0,				0,			50,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_JFD_DIGNITARY]',							'TXT_KEY_JFD_REFORM_HEADER_PEERAGE_DESC',				'TXT_KEY_JFD_REFORM_HEADER_PEERAGE_HELP',				'TXT_KEY_JFD_REFORM_PEERAGE_CEREMONIAL_SHORT_DESC',					'TXT_KEY_JFD_REFORM_PEERAGE_CEREMONIAL_DESC',					'TXT_KEY_JFD_REFORM_PEERAGE_CEREMONIAL_HELP',						'TXT_KEY_JFD_REFORM_PEERAGE_CEREMONIAL_HELP_BONUS',					'TXT_KEY_JFD_REFORM_PEERAGE_CEREMONIAL_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_PEERAGE_CEREMONIAL_PEDIA',						NULL,							NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_PEERAGE_CEREMONIAL'),
		--Administration			                                                                                                    																							                                                                                                                                        		                		                                                            	                                                                        		                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                           		    								                                                                    
		('REFORM_JFD_ADMINISTRATION_TECHNOCRATIC', 				'REFORM_BRANCH_JFD_LEGAL',			'FLAVOR_JFD_REFORM_LEGAL',				0,				0,				0,				0,				0,			60,			0,				0,				1,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_PRODUCTION]',							'TXT_KEY_JFD_REFORM_HEADER_ADMINISTRATION_DESC',		'TXT_KEY_JFD_REFORM_HEADER_ADMINISTRATION_HELP',		'TXT_KEY_JFD_REFORM_ADMINISTRATION_TECHNOCRATIC_SHORT_DESC',		'TXT_KEY_JFD_REFORM_ADMINISTRATION_TECHNOCRATIC_DESC',			'TXT_KEY_JFD_REFORM_ADMINISTRATION_TECHNOCRATIC_HELP',				'TXT_KEY_JFD_REFORM_ADMINISTRATION_TECHNOCRATIC_HELP_BONUS',		'TXT_KEY_JFD_REFORM_ADMINISTRATION_TECHNOCRATIC_HELP_PENALTY',		NULL,												NULL,													'TXT_KEY_JFD_REFORM_ADMINISTRATION_TECHNOCRATIC_PEDIA',				NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_ADMINISTRATION_TECHNOCRATIC'),	
		('REFORM_JFD_ADMINISTRATION_NEPOCRATIC', 				'REFORM_BRANCH_JFD_LEGAL',			'FLAVOR_JFD_REFORM_LEGAL',				0,				0,				1,				0,				0,			30,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_ADMINISTRATION_DESC',		'TXT_KEY_JFD_REFORM_HEADER_ADMINISTRATION_HELP',		'TXT_KEY_JFD_REFORM_ADMINISTRATION_NEPOCRATIC_SHORT_DESC',			'TXT_KEY_JFD_REFORM_ADMINISTRATION_NEPOCRATIC_DESC',			'TXT_KEY_JFD_REFORM_ADMINISTRATION_NEPOCRATIC_HELP',				'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_ADMINISTRATION_NEPOCRATIC_PEDIA',				NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_ADMINISTRATION_NEPOCRATIC'),
		('REFORM_JFD_ADMINISTRATION_BUREAUCRATIC', 				'REFORM_BRANCH_JFD_LEGAL',			'FLAVOR_JFD_REFORM_LEGAL',				0,				0,				0,				0,				0,			60,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_GOLDEN_AGE]',							'TXT_KEY_JFD_REFORM_HEADER_ADMINISTRATION_DESC',		'TXT_KEY_JFD_REFORM_HEADER_ADMINISTRATION_HELP',		'TXT_KEY_JFD_REFORM_ADMINISTRATION_BUREAUCRATIC_SHORT_DESC',		'TXT_KEY_JFD_REFORM_ADMINISTRATION_BUREAUCRATIC_DESC',			'TXT_KEY_JFD_REFORM_ADMINISTRATION_BUREAUCRATIC_HELP',				'TXT_KEY_JFD_REFORM_ADMINISTRATION_BUREAUCRATIC_HELP_BONUS',		'TXT_KEY_JFD_REFORM_ADMINISTRATION_BUREAUCRATIC_HELP_PENALTY',		NULL,												NULL,													'TXT_KEY_JFD_REFORM_ADMINISTRATION_BUREAUCRATIC_PEDIA',				NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_ADMINISTRATION_BUREAUCRATIC'),
		--Constitution                                                                            	                                  																								                                                                                                                                        		                		                                                            	                                                                        		                                                                        		    		                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                       		    								                                                                                                                                                            		                                
		('REFORM_JFD_CONSTITUTION_CODIFIED', 					'REFORM_BRANCH_JFD_LEGAL',			'FLAVOR_JFD_REFORM_LEGAL',				0,				0,				0,				0,				0,			60,			0,				0,				1,				0,					0,				0,					-15,			0,						0,						0,					0,					0,						0,					0,					0,				0,						20,						'REFORM_RIGHT',		'[ICON_JFD_REFORM]',							'TXT_KEY_JFD_REFORM_HEADER_CONSTITUTION_DESC',			'TXT_KEY_JFD_REFORM_HEADER_CONSTITUTION_HELP',			'TXT_KEY_JFD_REFORM_CONSTITUTION_CODIFIED_SHORT_DESC',				'TXT_KEY_JFD_REFORM_CONSTITUTION_CODIFIED_DESC',				'TXT_KEY_JFD_REFORM_CONSTITUTION_CODIFIED_HELP',					'TXT_KEY_JFD_REFORM_CONSTITUTION_CODIFIED_HELP_BONUS',				'TXT_KEY_JFD_REFORM_CONSTITUTION_CODIFIED_HELP_PENALTY',			NULL,												NULL,													'TXT_KEY_JFD_REFORM_CONSTITUTION_CODIFIED_PEDIA',					NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_CONSTITUTION_CODIFIED'),
		('REFORM_JFD_CONSTITUTION_NONE', 						'REFORM_BRANCH_JFD_LEGAL',			'FLAVOR_JFD_REFORM_LEGAL',				0,				0,				1,				0,				0,			30,			1,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_CONSTITUTION_DESC',			'TXT_KEY_JFD_REFORM_HEADER_CONSTITUTION_HELP',			'TXT_KEY_JFD_REFORM_CONSTITUTION_NONE_SHORT_DESC',					'TXT_KEY_JFD_REFORM_CONSTITUTION_NONE_DESC',					'TXT_KEY_JFD_REFORM_CONSTITUTION_NONE_HELP',						'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_CONSTITUTION_NONE_PEDIA',						NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_CONSTITUTION_NONE'),
		('REFORM_JFD_CONSTITUTION_UNCODIFIED', 					'REFORM_BRANCH_JFD_LEGAL',			'FLAVOR_JFD_REFORM_LEGAL',				0,				0,				0,				0,				0,			60,			0,				1,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						20,						'REFORM_LEFT',		'[ICON_CULTURE]',								'TXT_KEY_JFD_REFORM_HEADER_CONSTITUTION_DESC',			'TXT_KEY_JFD_REFORM_HEADER_CONSTITUTION_HELP',			'TXT_KEY_JFD_REFORM_CONSTITUTION_UNCODIFIED_SHORT_DESC',			'TXT_KEY_JFD_REFORM_CONSTITUTION_UNCODIFIED_DESC',				'TXT_KEY_JFD_REFORM_CONSTITUTION_UNCODIFIED_HELP',					'TXT_KEY_JFD_REFORM_CONSTITUTION_UNCODIFIED_HELP_BONUS',			'TXT_KEY_JFD_REFORM_CONSTITUTION_UNCODIFIED_HELP_PENALTY',			NULL,												NULL,													'TXT_KEY_JFD_REFORM_CONSTITUTION_UNCODIFIED_PEDIA',					NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_CONSTITUTION_UNCODIFIED'),
		--Immunity                                                                            	                                  	    	                                                            							                                                                                                                                        		                		                                                            	                                                                        		                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                           		    								                                                                                                                                                                		                                
		('REFORM_JFD_IMMUNITY_SOVEREIGN', 						'REFORM_BRANCH_JFD_LEGAL',			'FLAVOR_JFD_REFORM_LEGAL',				0,				0,				0,				0,				0,			60,			1,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_JFD_CRIME_BLACK]',						'TXT_KEY_JFD_REFORM_HEADER_IMMUNITY_DESC',				'TXT_KEY_JFD_REFORM_HEADER_IMMUNITY_HELP',				'TXT_KEY_JFD_REFORM_IMMUNITY_SOVEREIGN_SHORT_DESC',					'TXT_KEY_JFD_REFORM_IMMUNITY_SOVEREIGN_DESC',					'TXT_KEY_JFD_REFORM_IMMUNITY_SOVEREIGN_HELP',						'TXT_KEY_JFD_REFORM_IMMUNITY_SOVEREIGN_HELP_BONUS',					'TXT_KEY_JFD_REFORM_IMMUNITY_SOVEREIGN_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_IMMUNITY_SOVEREIGN_PEDIA',						NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_IMMUNITY_SOVEREIGN'),
		('REFORM_JFD_IMMUNITY_QUALIFIED', 						'REFORM_BRANCH_JFD_LEGAL',			'FLAVOR_JFD_REFORM_LEGAL',				0,				0,				1,				0,				0,			30,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_IMMUNITY_DESC',				'TXT_KEY_JFD_REFORM_HEADER_IMMUNITY_HELP',				'TXT_KEY_JFD_REFORM_IMMUNITY_QUALIFIED_SHORT_DESC',					'TXT_KEY_JFD_REFORM_IMMUNITY_QUALIFIED_DESC',					'TXT_KEY_JFD_REFORM_IMMUNITY_QUALIFIED_HELP',						'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_IMMUNITY_QUALIFIED_PEDIA',						NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_IMMUNITY_QUALIFIED'),
		('REFORM_JFD_IMMUNITY_NONE', 							'REFORM_BRANCH_JFD_LEGAL',			'FLAVOR_JFD_REFORM_LEGAL',				0,				0,				0,				0,				0,			60,			0,				1,				1,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_JFD_CRIME_BLACK]',						'TXT_KEY_JFD_REFORM_HEADER_IMMUNITY_DESC',				'TXT_KEY_JFD_REFORM_HEADER_IMMUNITY_HELP',				'TXT_KEY_JFD_REFORM_IMMUNITY_NONE_SHORT_DESC',						'TXT_KEY_JFD_REFORM_IMMUNITY_NONE_DESC',						'TXT_KEY_JFD_REFORM_IMMUNITY_NONE_HELP',							'TXT_KEY_JFD_REFORM_IMMUNITY_NONE_HELP_BONUS',						'TXT_KEY_JFD_REFORM_IMMUNITY_NONE_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_IMMUNITY_NONE_PEDIA',							NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_IMMUNITY_NONE'),
		--Judiciary																																																																																																																																																	                    				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                       		    								                                                                                                                                                            			                                
		('REFORM_JFD_JUDICIARY_DEPENDENT', 						'REFORM_BRANCH_JFD_LEGAL',			'FLAVOR_JFD_REFORM_LEGAL',				0,				0,				0,				0,				0,			60,			1,				0,				0,				0,					0,				20,					-15,			0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_JFD_REFORM]',							'TXT_KEY_JFD_REFORM_HEADER_JUDICIARY_M_DESC',			'TXT_KEY_JFD_REFORM_HEADER_JUDICIARY_M_HELP',			'TXT_KEY_JFD_REFORM_JUDICIARY_DEPENDENT_SHORT_DESC',				'TXT_KEY_JFD_REFORM_JUDICIARY_DEPENDENT_DESC',					'TXT_KEY_JFD_REFORM_JUDICIARY_DEPENDENT_HELP',						'TXT_KEY_JFD_REFORM_JUDICIARY_DEPENDENT_HELP_BONUS',				'TXT_KEY_JFD_REFORM_JUDICIARY_DEPENDENT_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_JUDICIARY_DEPENDENT_PEDIA',						NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_JUDICIARY_DEPENDENT'),
		('REFORM_JFD_JUDICIARY_NONE', 							'REFORM_BRANCH_JFD_LEGAL',			'FLAVOR_JFD_REFORM_LEGAL',				0,				0,				1,				0,				0,			30,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_JUDICIARY_M_DESC',			'TXT_KEY_JFD_REFORM_HEADER_JUDICIARY_M_HELP',			'TXT_KEY_JFD_REFORM_JUDICIARY_NONE_SHORT_DESC',						'TXT_KEY_JFD_REFORM_JUDICIARY_NONE_DESC',						'TXT_KEY_JFD_REFORM_JUDICIARY_NONE_HELP',							'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_JUDICIARY_NONE_PEDIA',							NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_JUDICIARY_NONE'),
		('REFORM_JFD_JUDICIARY_INDEPENDENT', 					'REFORM_BRANCH_JFD_LEGAL',			'FLAVOR_JFD_REFORM_LEGAL',				0,				0,				0,				0,				0,			60,			0,				1,				0,				0,					0,				-20,				15,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_JFD_REFORM]',							'TXT_KEY_JFD_REFORM_HEADER_JUDICIARY_M_DESC',			'TXT_KEY_JFD_REFORM_HEADER_JUDICIARY_M_HELP',			'TXT_KEY_JFD_REFORM_JUDICIARY_INDEPENDENT_SHORT_DESC',				'TXT_KEY_JFD_REFORM_JUDICIARY_INDEPENDENT_DESC',				'TXT_KEY_JFD_REFORM_JUDICIARY_INDEPENDENT_HELP',					'TXT_KEY_JFD_REFORM_JUDICIARY_INDEPENDENT_HELP_BONUS',				'TXT_KEY_JFD_REFORM_JUDICIARY_INDEPENDENT_HELP_PENALTY',			NULL,												NULL,													'TXT_KEY_JFD_REFORM_JUDICIARY_INDEPENDENT_PEDIA',					NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_JUDICIARY_INDEPENDENT');
											
--Culture									
INSERT INTO JFD_Reforms									
		(Type, 													ReformBranchType,					ReformFlavourType,						IsDisabled,		IsSovereignty,	DefaultActive,	IsLegislature,	IsTitled,	Cost,		AutocracyIndex,	FreedomIndex,	OrderIndex,		MaxSovChange,		FactionSovMod,	ReformCooldownMod,	ReformCostMod,	ReformCostModPerCity,	ReformCostModPerPop,	ResetsAssembly,		ResetsHolySynod,	ResetsImperialCourt,	ResetsImperialDiet,	ResetsParliament,	ResetsSenate,	ResetsLegislature,		AnarchySentimentMod,	Alignment,			FocusIcon,										HeaderDescription, 										HeaderHelp,												ShortDescription,													Description,													Help,																HelpBonus,															HelpPenalty,														LegislatureHelp,									LegislatureIdeologyHelp,								Pedia,																PrereqGovernment, 				PrereqReform,									PrereqEra, 				RequiresNumCityStateFriends,	RequiresStateReligion,	PolicyType)
VALUES	--Society                                                                                                                                                                                    								                                                                                                                                                                                                                                    	                                                                                                                                                        		    		                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                           		    								                                                                                                                		                                
		('REFORM_JFD_SOCIETY_CASTE', 							'REFORM_BRANCH_JFD_CULTURE',		'FLAVOR_JFD_REFORM_CULTURE',			0,				0,				0,				0,				0,			30,			0,				0,				1,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_GOLDEN_AGE][ICON_HAPPINESS_1]',			'TXT_KEY_JFD_REFORM_HEADER_SOCIETY_DESC',				'TXT_KEY_JFD_REFORM_HEADER_SOCIETY_HELP',				'TXT_KEY_JFD_REFORM_SOCIETY_CASTE_SHORT_DESC',						'TXT_KEY_JFD_REFORM_SOCIETY_CASTE_DESC',						'TXT_KEY_JFD_REFORM_SOCIETY_CASTE_HELP',							'TXT_KEY_JFD_REFORM_SOCIETY_CASTE_HELP_BONUS',						'TXT_KEY_JFD_REFORM_SOCIETY_CASTE_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_SOCIETY_CASTE_PEDIA',							NULL,							NULL,											'ERA_ANCIENT',			0,								0,						'POLICY_REFORM_JFD_SOCIETY_CASTE'),
		('REFORM_JFD_SOCIETY_FAMILY', 							'REFORM_BRANCH_JFD_CULTURE',		'FLAVOR_JFD_REFORM_CULTURE',			0,				0,				1,				0,				0,			15,			1,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_SOCIETY_DESC',				'TXT_KEY_JFD_REFORM_HEADER_SOCIETY_HELP',				'TXT_KEY_JFD_REFORM_SOCIETY_FAMILY_SHORT_DESC',						'TXT_KEY_JFD_REFORM_SOCIETY_FAMILY_DESC',						'TXT_KEY_JFD_REFORM_SOCIETY_FAMILY_HELP',							'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_SOCIETY_FAMILY_PEDIA',							NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_SOCIETY_FAMILY'),
		('REFORM_JFD_SOCIETY_CLASS', 							'REFORM_BRANCH_JFD_CULTURE',		'FLAVOR_JFD_REFORM_CULTURE',			0,				0,				0,				0,				0,			30,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_GOLDEN_AGE][ICON_HAPPINESS_1]',			'TXT_KEY_JFD_REFORM_HEADER_SOCIETY_DESC',				'TXT_KEY_JFD_REFORM_HEADER_SOCIETY_HELP',				'TXT_KEY_JFD_REFORM_SOCIETY_CLASS_SHORT_DESC',						'TXT_KEY_JFD_REFORM_SOCIETY_CLASS_DESC',						'TXT_KEY_JFD_REFORM_SOCIETY_CLASS_HELP',							'TXT_KEY_JFD_REFORM_SOCIETY_CLASS_HELP_BONUS',						'TXT_KEY_JFD_REFORM_SOCIETY_CLASS_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_SOCIETY_CLASS_PEDIA',							NULL,							NULL,											'ERA_ANCIENT',			0,								0,						'POLICY_REFORM_JFD_SOCIETY_CLASS'),
		--Marriage                                                                                                                      	                                                        								                                                                                                                                        		                		                                                            	                                                                        		                                                                        		    		                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                            	                                                   		    								                                                                                                                                                                    		                                
		('REFORM_JFD_MARRIAGE_RELIGIOUS', 						'REFORM_BRANCH_JFD_CULTURE',		'FLAVOR_JFD_REFORM_CULTURE',			0,				0,				0,				0,				0,			40,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_PEACE]',									'TXT_KEY_JFD_REFORM_HEADER_MARRIAGE_DESC',				'TXT_KEY_JFD_REFORM_HEADER_MARRIAGE_HELP',				'TXT_KEY_JFD_REFORM_MARRIAGE_RELIGIOUS_SHORT_DESC',					'TXT_KEY_JFD_REFORM_MARRIAGE_RELIGIOUS_DESC',					'TXT_KEY_JFD_REFORM_MARRIAGE_RELIGIOUS_HELP',						'TXT_KEY_JFD_REFORM_MARRIAGE_RELIGIOUS_HELP_BONUS',					'TXT_KEY_JFD_REFORM_MARRIAGE_RELIGIOUS_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_MARRIAGE_RELIGIOUS_PEDIA',						NULL,							NULL,											'ERA_CLASSICAL',		0,								0,						'POLICY_REFORM_JFD_MARRIAGE_RELIGIOUS'),
		('REFORM_JFD_MARRIAGE_PRIVATE', 						'REFORM_BRANCH_JFD_CULTURE',		'FLAVOR_JFD_REFORM_CULTURE',			0,				0,				1,				0,				0,			20,			0,				1,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_MARRIAGE_DESC',				'TXT_KEY_JFD_REFORM_HEADER_MARRIAGE_HELP',				'TXT_KEY_JFD_REFORM_MARRIAGE_PRIVATE_SHORT_DESC',					'TXT_KEY_JFD_REFORM_MARRIAGE_PRIVATE_DESC',						'TXT_KEY_JFD_REFORM_MARRIAGE_PRIVATE_HELP',							'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_MARRIAGE_PRIVATE_PEDIA',						NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_MARRIAGE_PRIVATE'),
		('REFORM_JFD_MARRIAGE_CIVIC', 							'REFORM_BRANCH_JFD_CULTURE',		'FLAVOR_JFD_REFORM_CULTURE',			0,				0,				0,				0,				0,			40,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_CULTURE]',								'TXT_KEY_JFD_REFORM_HEADER_MARRIAGE_DESC',				'TXT_KEY_JFD_REFORM_HEADER_MARRIAGE_HELP',				'TXT_KEY_JFD_REFORM_MARRIAGE_CIVIC_SHORT_DESC',						'TXT_KEY_JFD_REFORM_MARRIAGE_CIVIC_DESC',						'TXT_KEY_JFD_REFORM_MARRIAGE_CIVIC_HELP',							'TXT_KEY_JFD_REFORM_MARRIAGE_CIVIC_HELP_BONUS',						'TXT_KEY_JFD_REFORM_MARRIAGE_CIVIC_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_MARRIAGE_CIVIC_PEDIA',							NULL,							NULL,											'ERA_CLASSICAL',		0,								0,						'POLICY_REFORM_JFD_MARRIAGE_CIVIC'),
		--Public Works                                     	                                                                    	    	                                                        								                                                                                                                                        		                		                                                            	                                                                        		                                                                        		    		                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                            	                                                                                                                                                                                                                                                                		                                
		('REFORM_JFD_PUBLIC_WORKS_CEREMONIAL', 					'REFORM_BRANCH_JFD_CULTURE',		'FLAVOR_JFD_REFORM_CULTURE',			0,				0,				0,				0,				0,			40,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_PRODUCTION]',							'TXT_KEY_JFD_REFORM_HEADER_PUBLIC_WORKS_DESC',			'TXT_KEY_JFD_REFORM_HEADER_PUBLIC_WORKS_HELP',			'TXT_KEY_JFD_REFORM_PUBLIC_WORKS_CEREMONIAL_SHORT_DESC',			'TXT_KEY_JFD_REFORM_PUBLIC_WORKS_CEREMONIAL_DESC',				'TXT_KEY_JFD_REFORM_PUBLIC_WORKS_CEREMONIAL_HELP',					'TXT_KEY_JFD_REFORM_PUBLIC_WORKS_CEREMONIAL_HELP_BONUS',			'TXT_KEY_JFD_REFORM_PUBLIC_WORKS_CEREMONIAL_HELP_PENALTY',			NULL,												NULL,													'TXT_KEY_JFD_REFORM_PUBLIC_WORKS_CEREMONIAL_PEDIA',					NULL,							NULL,											'ERA_CLASSICAL',		0,								0,						'POLICY_REFORM_JFD_PUBLIC_WORKS_CEREMONIAL'),
		('REFORM_JFD_PUBLIC_WORKS_NONE', 						'REFORM_BRANCH_JFD_CULTURE',		'FLAVOR_JFD_REFORM_CULTURE',			0,				0,				1,				0,				0,			20,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_PUBLIC_WORKS_DESC',			'TXT_KEY_JFD_REFORM_HEADER_PUBLIC_WORKS_HELP',			'TXT_KEY_JFD_REFORM_PUBLIC_WORKS_NONE_SHORT_DESC',					'TXT_KEY_JFD_REFORM_PUBLIC_WORKS_NONE_DESC',					'TXT_KEY_JFD_REFORM_PUBLIC_WORKS_NONE_HELP',						'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_PUBLIC_WORKS_NONE_PEDIA',						NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_PUBLIC_WORKS_NONE'),
		('REFORM_JFD_PUBLIC_WORKS_CIVIC', 						'REFORM_BRANCH_JFD_CULTURE',		'FLAVOR_JFD_REFORM_CULTURE',			0,				0,				0,				0,				0,			40,			0,				0,				1,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_PRODUCTION]',							'TXT_KEY_JFD_REFORM_HEADER_PUBLIC_WORKS_DESC',			'TXT_KEY_JFD_REFORM_HEADER_PUBLIC_WORKS_HELP',			'TXT_KEY_JFD_REFORM_PUBLIC_WORKS_CIVIC_SHORT_DESC',					'TXT_KEY_JFD_REFORM_PUBLIC_WORKS_CIVIC_DESC',					'TXT_KEY_JFD_REFORM_PUBLIC_WORKS_CIVIC_HELP',						'TXT_KEY_JFD_REFORM_PUBLIC_WORKS_CIVIC_HELP_BONUS',					'TXT_KEY_JFD_REFORM_PUBLIC_WORKS_CIVIC_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_PUBLIC_WORKS_CIVIC_PEDIA',						NULL,							NULL,											'ERA_CLASSICAL',		0,								0,						'POLICY_REFORM_JFD_PUBLIC_WORKS_CIVIC'),
		--Speech                                                                                                                        																							                                                                                                                		                		                					                                                	                                                                        		                                                                    		        		                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                            	                                               		    								                                                                                                                                                                		                                
		('REFORM_JFD_SPEECH_CENSORED', 							'REFORM_BRANCH_JFD_CULTURE',		'FLAVOR_JFD_REFORM_CULTURE',			0,				0,				0,				0,				0,			40,			1,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_GOLDEN_AGE][ICON_PRODUCTION]',			'TXT_KEY_JFD_REFORM_HEADER_SPEECH_DESC',				'TXT_KEY_JFD_REFORM_HEADER_SPEECH_HELP',				'TXT_KEY_JFD_REFORM_SPEECH_CENSORED_SHORT_DESC',					'TXT_KEY_JFD_REFORM_SPEECH_CENSORED_DESC',						'TXT_KEY_JFD_REFORM_SPEECH_CENSORED_HELP',							'TXT_KEY_JFD_REFORM_SPEECH_CENSORED_HELP_BONUS',					'TXT_KEY_JFD_REFORM_SPEECH_CENSORED_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_SPEECH_CENSORED_PEDIA',							NULL,							NULL,											'ERA_CLASSICAL',		0,								0,						'POLICY_REFORM_JFD_SPEECH_CENSORED'),
		('REFORM_JFD_SPEECH_ANTI_LIBEL', 						'REFORM_BRANCH_JFD_CULTURE',		'FLAVOR_JFD_REFORM_CULTURE',			0,				0,				1,				0,				0,			20,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_SPEECH_DESC',				'TXT_KEY_JFD_REFORM_HEADER_SPEECH_HELP',				'TXT_KEY_JFD_REFORM_SPEECH_ANTI_LIBEL_SHORT_DESC',					'TXT_KEY_JFD_REFORM_SPEECH_ANTI_LIBEL_DESC',					'TXT_KEY_JFD_REFORM_SPEECH_ANTI_LIBEL_HELP',						'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_SPEECH_ANTI_LIBEL_PEDIA',						NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_SPEECH_ANTI_LIBEL'),
		('REFORM_JFD_SPEECH_FREE', 								'REFORM_BRANCH_JFD_CULTURE',		'FLAVOR_JFD_REFORM_CULTURE',			0,				0,				0,				0,				0,			40,			0,				1,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_GOLDEN_AGE][ICON_CULTURE]',				'TXT_KEY_JFD_REFORM_HEADER_SPEECH_DESC',				'TXT_KEY_JFD_REFORM_HEADER_SPEECH_HELP',				'TXT_KEY_JFD_REFORM_SPEECH_FREE_SHORT_DESC',						'TXT_KEY_JFD_REFORM_SPEECH_FREE_DESC',							'TXT_KEY_JFD_REFORM_SPEECH_FREE_HELP',								'TXT_KEY_JFD_REFORM_SPEECH_FREE_HELP_BONUS',						'TXT_KEY_JFD_REFORM_SPEECH_FREE_HELP_PENALTY',						NULL,												NULL,													'TXT_KEY_JFD_REFORM_SPEECH_FREE_PEDIA',								NULL,							NULL,											'ERA_CLASSICAL',		0,								0,						'POLICY_REFORM_JFD_SPEECH_FREE'),
		--Heraldry                                    	                                                                                	                                                    									                                                                                                                                        		                		                                                            	                                                                        		                                                                    		        		                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                            	                                               		    								                                                                                                                                                                    		                                
		('REFORM_JFD_HERALDRY_MILITARY', 						'REFORM_BRANCH_JFD_CULTURE',		'FLAVOR_JFD_REFORM_CULTURE',			0,				0,				0,				0,				0,			50,			1,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_GREAT_PEOPLE][ICON_WAR]',				'TXT_KEY_JFD_REFORM_HEADER_HERALDRY_DESC',				'TXT_KEY_JFD_REFORM_HEADER_HERALDRY_HELP',				'TXT_KEY_JFD_REFORM_HERALDRY_MILITARY_SHORT_DESC',					'TXT_KEY_JFD_REFORM_HERALDRY_MILITARY_DESC',					'TXT_KEY_JFD_REFORM_HERALDRY_MILITARY_HELP',						'TXT_KEY_JFD_REFORM_HERALDRY_MILITARY_HELP_BONUS',					'TXT_KEY_JFD_REFORM_HERALDRY_MILITARY_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_HERALDRY_MILITARY_PEDIA',						NULL,							NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_HERALDRY_MILITARY'),
		('REFORM_JFD_HERALDRY_NONE', 							'REFORM_BRANCH_JFD_CULTURE',		'FLAVOR_JFD_REFORM_CULTURE',			0,				0,				1,				0,				0,			25,			0,				0,				1,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_HERALDRY_DESC',				'TXT_KEY_JFD_REFORM_HEADER_HERALDRY_HELP',				'TXT_KEY_JFD_REFORM_HERALDRY_NONE_SHORT_DESC',						'TXT_KEY_JFD_REFORM_HERALDRY_NONE_DESC',						'TXT_KEY_JFD_REFORM_HERALDRY_NONE_HELP',							'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_HERALDRY_NONE_PEDIA',							NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_HERALDRY_NONE'),
		('REFORM_JFD_HERALDRY_CIVILIAN', 						'REFORM_BRANCH_JFD_CULTURE',		'FLAVOR_JFD_REFORM_CULTURE',			0,				0,				0,				0,				0,			50,			0,				1,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_JFD_BLUE_FIST][ICON_JFD_WLTKD]',			'TXT_KEY_JFD_REFORM_HEADER_HERALDRY_DESC',				'TXT_KEY_JFD_REFORM_HEADER_HERALDRY_HELP',				'TXT_KEY_JFD_REFORM_HERALDRY_CIVILIAN_SHORT_DESC',					'TXT_KEY_JFD_REFORM_HERALDRY_CIVILIAN_DESC',					'TXT_KEY_JFD_REFORM_HERALDRY_CIVILIAN_HELP',						'TXT_KEY_JFD_REFORM_HERALDRY_CIVILIAN_HELP_BONUS',					'TXT_KEY_JFD_REFORM_HERALDRY_CIVILIAN_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_HERALDRY_CIVILIAN_PEDIA',						NULL,							NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_HERALDRY_CIVILIAN'),
		--Patronage                                 	                                                                                	                                                        								                                                                                                                                        		                		                                                            	                                                                        		                                                                        		    		                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                            	                                                   		    								                                                                                                                                                                    		                                
		('REFORM_JFD_PATRONAGE_ARTISTS', 						'REFORM_BRANCH_JFD_CULTURE',		'FLAVOR_JFD_REFORM_CULTURE',			0,				0,				0,				0,				0,			50,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_GREAT_PEOPLE][ICON_GREAT_WORK]',			'TXT_KEY_JFD_REFORM_HEADER_PATRONAGE_DESC',				'TXT_KEY_JFD_REFORM_HEADER_PATRONAGE_HELP',				'TXT_KEY_JFD_REFORM_PATRONAGE_ARTISTS_SHORT_DESC',					'TXT_KEY_JFD_REFORM_PATRONAGE_ARTISTS_DESC',					'TXT_KEY_JFD_REFORM_PATRONAGE_ARTISTS_HELP',						'TXT_KEY_JFD_REFORM_PATRONAGE_ARTISTS_HELP_BONUS',					'TXT_KEY_JFD_REFORM_PATRONAGE_ARTISTS_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_PATRONAGE_ARTISTS_PEDIA',						NULL,							NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_PATRONAGE_ARTISTS'),
		('REFORM_JFD_PATRONAGE_NONE', 							'REFORM_BRANCH_JFD_CULTURE',		'FLAVOR_JFD_REFORM_CULTURE',			0,				0,				1,				0,				0,			25,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_PATRONAGE_DESC',				'TXT_KEY_JFD_REFORM_HEADER_PATRONAGE_HELP',				'TXT_KEY_JFD_REFORM_PATRONAGE_NONE_SHORT_DESC',						'TXT_KEY_JFD_REFORM_PATRONAGE_NONE_DESC',						'TXT_KEY_JFD_REFORM_PATRONAGE_NONE_HELP',							'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_PATRONAGE_NONE_PEDIA',							NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_PATRONAGE_NONE'),
		('REFORM_JFD_PATRONAGE_MERCHANTS', 						'REFORM_BRANCH_JFD_CULTURE',		'FLAVOR_JFD_REFORM_CULTURE',			0,				0,				0,				0,				0,			50,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_GREAT_PEOPLE][ICON_GOLD]',				'TXT_KEY_JFD_REFORM_HEADER_PATRONAGE_DESC',				'TXT_KEY_JFD_REFORM_HEADER_PATRONAGE_HELP',				'TXT_KEY_JFD_REFORM_PATRONAGE_MERCHANTS_SHORT_DESC',				'TXT_KEY_JFD_REFORM_PATRONAGE_MERCHANTS_DESC',					'TXT_KEY_JFD_REFORM_PATRONAGE_MERCHANTS_HELP',						'TXT_KEY_JFD_REFORM_PATRONAGE_MERCHANTS_HELP_BONUS',				'TXT_KEY_JFD_REFORM_PATRONAGE_MERCHANTS_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_PATRONAGE_MERCHANTS_PEDIA',						NULL,							NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_PATRONAGE_MERCHANTS'),
		--Language                                                                                                                	    	                                                        								                                                                                                                                        		                		                                                            	                                                                        		                                                                        		    		                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                            	                                                   		    								                                                                                                                                                                    		                                
		('REFORM_JFD_LANGUAGE_PROTECTED', 						'REFORM_BRANCH_JFD_CULTURE',		'FLAVOR_JFD_REFORM_CULTURE',			0,				0,				0,				0,				0,			60,			1,				0,				0,				0,					0,				15,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_JFD_CRIME_CULTURE][ICON_CULTURE]',		'TXT_KEY_JFD_REFORM_HEADER_LANGUAGE_DESC',				'TXT_KEY_JFD_REFORM_HEADER_LANGUAGE_HELP',				'TXT_KEY_JFD_REFORM_LANGUAGE_PROTECTED_SHORT_DESC',					'TXT_KEY_JFD_REFORM_LANGUAGE_PROTECTED_DESC',					'TXT_KEY_JFD_REFORM_LANGUAGE_PROTECTED_HELP',						'TXT_KEY_JFD_REFORM_LANGUAGE_PROTECTED_HELP_BONUS',					'TXT_KEY_JFD_REFORM_LANGUAGE_PROTECTED_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_LANGUAGE_PROTECTED_PEDIA',						NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_LANGUAGE_PROTECTED'),
		('REFORM_JFD_LANGUAGE_NONE', 							'REFORM_BRANCH_JFD_CULTURE',		'FLAVOR_JFD_REFORM_CULTURE',			0,				0,				1,				0,				0,			30,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_LANGUAGE_DESC',				'TXT_KEY_JFD_REFORM_HEADER_LANGUAGE_HELP',				'TXT_KEY_JFD_REFORM_LANGUAGE_NONE_SHORT_DESC',						'TXT_KEY_JFD_REFORM_LANGUAGE_NONE_DESC',						'TXT_KEY_JFD_REFORM_LANGUAGE_NONE_HELP',							'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_LANGUAGE_NONE_PEDIA',							NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_LANGUAGE_NONE'),
		('REFORM_JFD_LANGUAGE_ADAPTIVE', 						'REFORM_BRANCH_JFD_CULTURE',		'FLAVOR_JFD_REFORM_CULTURE',			0,				0,				0,				0,				0,			60,			0,				1,				0,				0,					0,				-15,				0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_JFD_REFORM]',							'TXT_KEY_JFD_REFORM_HEADER_LANGUAGE_DESC',				'TXT_KEY_JFD_REFORM_HEADER_LANGUAGE_HELP',				'TXT_KEY_JFD_REFORM_LANGUAGE_ADAPTIVE_SHORT_DESC',					'TXT_KEY_JFD_REFORM_LANGUAGE_ADAPTIVE_DESC',					'TXT_KEY_JFD_REFORM_LANGUAGE_ADAPTIVE_HELP',						'TXT_KEY_JFD_REFORM_LANGUAGE_ADAPTIVE_HELP_BONUS',					'TXT_KEY_JFD_REFORM_LANGUAGE_ADAPTIVE_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_LANGUAGE_ADAPTIVE_PEDIA',						NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_LANGUAGE_ADAPTIVE'),
		--Media                                                                                                                         	                                                        								                                                                                                                                        		                		                                                            	                                                   	                    		                                                                        		    		                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                            	                                                   		    								                                                                                                                                                                    		                                
		('REFORM_JFD_MEDIA_STATE', 								'REFORM_BRANCH_JFD_CULTURE',		'FLAVOR_JFD_REFORM_CULTURE',			0,				0,				0,				0,				0,			60,			1,				0,				1,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_JFD_BLUE_FIST]',							'TXT_KEY_JFD_REFORM_HEADER_MEDIA_DESC',					'TXT_KEY_JFD_REFORM_HEADER_MEDIA_HELP',					'TXT_KEY_JFD_REFORM_MEDIA_STATE_SHORT_DESC',						'TXT_KEY_JFD_REFORM_MEDIA_STATE_DESC',							'TXT_KEY_JFD_REFORM_MEDIA_STATE_HELP',								'TXT_KEY_JFD_REFORM_MEDIA_STATE_HELP_BONUS',						'TXT_KEY_JFD_REFORM_MEDIA_STATE_HELP_PENALTY',						NULL,												NULL,													'TXT_KEY_JFD_REFORM_MEDIA_STATE_PEDIA',								NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_MEDIA_STATE'),
		('REFORM_JFD_MEDIA_NONE', 								'REFORM_BRANCH_JFD_CULTURE',		'FLAVOR_JFD_REFORM_CULTURE',			0,				0,				1,				0,				0,			30,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_MEDIA_DESC',					'TXT_KEY_JFD_REFORM_HEADER_MEDIA_HELP',					'TXT_KEY_JFD_REFORM_MEDIA_NONE_SHORT_DESC',							'TXT_KEY_JFD_REFORM_MEDIA_NONE_DESC',							'TXT_KEY_JFD_REFORM_MEDIA_NONE_HELP',								'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_MEDIA_NONE_PEDIA',								NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_MEDIA_NONE'),
		('REFORM_JFD_MEDIA_INDEPENDENT', 						'REFORM_BRANCH_JFD_CULTURE',		'FLAVOR_JFD_REFORM_CULTURE',			0,				0,				0,				0,				0,			60,			0,				1,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_CULTURE]',								'TXT_KEY_JFD_REFORM_HEADER_MEDIA_DESC',					'TXT_KEY_JFD_REFORM_HEADER_MEDIA_HELP',					'TXT_KEY_JFD_REFORM_MEDIA_INDEPENDENT_SHORT_DESC',					'TXT_KEY_JFD_REFORM_MEDIA_INDEPENDENT_DESC',					'TXT_KEY_JFD_REFORM_MEDIA_INDEPENDENT_HELP',						'TXT_KEY_JFD_REFORM_MEDIA_INDEPENDENT_HELP_BONUS',					'TXT_KEY_JFD_REFORM_MEDIA_INDEPENDENT_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_MEDIA_INDEPENDENT_PEDIA',						NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_MEDIA_INDEPENDENT'),
		--Publications                                                                                                                		                                                   										                                                                                                                        												                                                            	                                                        						                                                                		            		                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                            	                                           		    								                                                                                                                                                                    		                                
		('REFORM_JFD_PUBLICATIONS_PUBLIC', 						'REFORM_BRANCH_JFD_CULTURE',		'FLAVOR_JFD_REFORM_CULTURE',			0,				0,				0,				0,				0,			60,			0,				0,				1,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_GREAT_WORK][ICON_CULTURE]',				'TXT_KEY_JFD_REFORM_HEADER_PUBLICATIONS_DESC',			'TXT_KEY_JFD_REFORM_HEADER_PUBLICATIONS_HELP',			'TXT_KEY_JFD_REFORM_PUBLICATIONS_PUBLIC_SHORT_DESC',				'TXT_KEY_JFD_REFORM_PUBLICATIONS_PUBLIC_DESC',					'TXT_KEY_JFD_REFORM_PUBLICATIONS_PUBLIC_HELP',						'TXT_KEY_JFD_REFORM_PUBLICATIONS_PUBLIC_HELP_BONUS',				'TXT_KEY_JFD_REFORM_PUBLICATIONS_PUBLIC_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_PUBLICATIONS_PUBLIC_PEDIA',						NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_PUBLICATIONS_PUBLIC'),
		('REFORM_JFD_PUBLICATIONS_NONE', 						'REFORM_BRANCH_JFD_CULTURE',		'FLAVOR_JFD_REFORM_CULTURE',			0,				0,				1,				0,				0,			30,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_PUBLICATIONS_DESC',			'TXT_KEY_JFD_REFORM_HEADER_PUBLICATIONS_HELP',			'TXT_KEY_JFD_REFORM_PUBLICATIONS_NONE_SHORT_DESC',					'TXT_KEY_JFD_REFORM_PUBLICATIONS_NONE_DESC',					'TXT_KEY_JFD_REFORM_PUBLICATIONS_NONE_HELP',						'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_PUBLICATIONS_NONE_PEDIA',						NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_PUBLICATIONS_NONE'),
		('REFORM_JFD_PUBLICATIONS_PRIVATE', 					'REFORM_BRANCH_JFD_CULTURE',		'FLAVOR_JFD_REFORM_CULTURE',			0,				0,				0,				0,				0,			60,			0,				1,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_GREAT_WORK][ICON_TOURISM]',				'TXT_KEY_JFD_REFORM_HEADER_PUBLICATIONS_DESC',			'TXT_KEY_JFD_REFORM_HEADER_PUBLICATIONS_HELP',			'TXT_KEY_JFD_REFORM_PUBLICATIONS_PRIVATE_SHORT_DESC',				'TXT_KEY_JFD_REFORM_PUBLICATIONS_PRIVATE_DESC',					'TXT_KEY_JFD_REFORM_PUBLICATIONS_PRIVATE_HELP',						'TXT_KEY_JFD_REFORM_PUBLICATIONS_PRIVATE_HELP_BONUS',				'TXT_KEY_JFD_REFORM_PUBLICATIONS_PRIVATE_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_PUBLICATIONS_PRIVATE_PEDIA',					NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_PUBLICATIONS_PRIVATE');
							
--Economic							
INSERT INTO JFD_Reforms							
		(Type, 													ReformBranchType,					ReformFlavourType,						IsDisabled,		IsSovereignty,	DefaultActive,	IsLegislature,	IsTitled,	Cost,		AutocracyIndex,	FreedomIndex,	OrderIndex,		MaxSovChange,		FactionSovMod,	ReformCooldownMod,	ReformCostMod,	ReformCostModPerCity,	ReformCostModPerPop,	ResetsAssembly,		ResetsHolySynod,	ResetsImperialCourt,	ResetsImperialDiet,	ResetsParliament,	ResetsSenate,	ResetsLegislature,		AnarchySentimentMod,	Alignment,			FocusIcon,										HeaderDescription, 										HeaderHelp,												ShortDescription,													Description,													Help,																HelpBonus,															HelpPenalty,														LegislatureHelp,									LegislatureIdeologyHelp,								Pedia,																PrereqGovernment, 				PrereqReform,									PrereqEra, 				RequiresNumCityStateFriends,	RequiresStateReligion,	PolicyType)
VALUES	--Taxation (Commons)                                     	                                                                                                                                    							                                                                                                                                                                                                                                    	                                                                                                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                   		    								
		('REFORM_JFD_L_TAXATION_HIGH', 							'REFORM_BRANCH_JFD_ECONOMY',		'FLAVOR_JFD_REFORM_ECONOMY',			0,				0,				0,				0,				0,			30,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						20,						'REFORM_RIGHT',		'[ICON_GOLD]',									'TXT_KEY_JFD_REFORM_HEADER_L_TAXATION_DESC',			'TXT_KEY_JFD_REFORM_HEADER_L_TAXATION_HELP',			'TXT_KEY_JFD_REFORM_L_TAXATION_HIGH_SHORT_DESC',					'TXT_KEY_JFD_REFORM_L_TAXATION_HIGH_DESC',						'TXT_KEY_JFD_REFORM_L_TAXATION_HIGH_HELP',							'TXT_KEY_JFD_REFORM_L_TAXATION_HIGH_HELP_BONUS',					'TXT_KEY_JFD_REFORM_L_TAXATION_HIGH_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_L_TAXATION_HIGH_PEDIA',							NULL,							NULL,											'ERA_ANCIENT',			0,								0,						'POLICY_REFORM_JFD_L_TAXATION_HIGH'),
		('REFORM_JFD_L_TAXATION_STANDARD', 						'REFORM_BRANCH_JFD_ECONOMY',		'FLAVOR_JFD_REFORM_ECONOMY',			0,				0,				1,				0,				0,			15,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_L_TAXATION_DESC',			'TXT_KEY_JFD_REFORM_HEADER_L_TAXATION_HELP',			'TXT_KEY_JFD_REFORM_L_TAXATION_STANDARD_SHORT_DESC',				'TXT_KEY_JFD_REFORM_L_TAXATION_STANDARD_DESC',					'TXT_KEY_JFD_REFORM_L_TAXATION_STANDARD_HELP',						'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_L_TAXATION_STANDARD_PEDIA',						NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_L_TAXATION_STANDARD'),
		('REFORM_JFD_L_TAXATION_EXEMPT', 						'REFORM_BRANCH_JFD_ECONOMY',		'FLAVOR_JFD_REFORM_ECONOMY',			0,				0,				0,				0,				0,			30,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						-20,					'REFORM_LEFT',		'[ICON_JFD_ANARCHY]',							'TXT_KEY_JFD_REFORM_HEADER_L_TAXATION_DESC',			'TXT_KEY_JFD_REFORM_HEADER_L_TAXATION_HELP',			'TXT_KEY_JFD_REFORM_L_TAXATION_EXEMPT_SHORT_DESC',					'TXT_KEY_JFD_REFORM_L_TAXATION_EXEMPT_DESC',					'TXT_KEY_JFD_REFORM_L_TAXATION_EXEMPT_HELP',						'TXT_KEY_JFD_REFORM_L_TAXATION_EXEMPT_HELP_BONUS',					'TXT_KEY_JFD_REFORM_L_TAXATION_EXEMPT_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_L_TAXATION_EXEMPT_PEDIA',						NULL,							NULL,											'ERA_ANCIENT',			0,								0,						'POLICY_REFORM_JFD_L_TAXATION_EXEMPT'),	
		--Currency		                                                                                                                																							                                                                                                                                        		                							                                        	                                                                        		                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                          		    								                                                                    
		('REFORM_JFD_CURRENCY_TENDER', 							'REFORM_BRANCH_JFD_ECONOMY',		'FLAVOR_JFD_REFORM_ECONOMY',			0,				0,				0,				0,				0,			40,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_FLOWER]',								'TXT_KEY_JFD_REFORM_HEADER_CURRENCY_DESC',				'TXT_KEY_JFD_REFORM_HEADER_CURRENCY_HELP',				'TXT_KEY_JFD_REFORM_CURRENCY_TENDER_SHORT_DESC',					'TXT_KEY_JFD_REFORM_CURRENCY_TENDER_DESC',						'TXT_KEY_JFD_REFORM_CURRENCY_TENDER_HELP',							'TXT_KEY_JFD_REFORM_CURRENCY_TENDER_HELP_BONUS',					'TXT_KEY_JFD_REFORM_CURRENCY_TENDER_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_CURRENCY_TENDER_PEDIA',							NULL,							NULL,											'ERA_CLASSICAL',		0,								0,						'POLICY_REFORM_JFD_CURRENCY_TENDER'),
		('REFORM_JFD_CURRENCY_BARTER', 							'REFORM_BRANCH_JFD_ECONOMY',		'FLAVOR_JFD_REFORM_ECONOMY',			0,				0,				1,				0,				0,			20,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_CURRENCY_DESC',				'TXT_KEY_JFD_REFORM_HEADER_CURRENCY_HELP',				'TXT_KEY_JFD_REFORM_CURRENCY_BARTER_SHORT_DESC',					'TXT_KEY_JFD_REFORM_CURRENCY_BARTER_DESC',						'TXT_KEY_JFD_REFORM_CURRENCY_BARTER_HELP',							'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_CURRENCY_BARTER_PEDIA',							NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_CURRENCY_BARTER'),
		('REFORM_JFD_CURRENCY_CREDIT', 							'REFORM_BRANCH_JFD_ECONOMY',		'FLAVOR_JFD_REFORM_ECONOMY',			0,				0,				0,				0,				0,			40,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_FLOWER]',								'TXT_KEY_JFD_REFORM_HEADER_CURRENCY_DESC',				'TXT_KEY_JFD_REFORM_HEADER_CURRENCY_HELP',				'TXT_KEY_JFD_REFORM_CURRENCY_CREDIT_SHORT_DESC',					'TXT_KEY_JFD_REFORM_CURRENCY_CREDIT_DESC',						'TXT_KEY_JFD_REFORM_CURRENCY_CREDIT_HELP',							'TXT_KEY_JFD_REFORM_CURRENCY_CREDIT_HELP_BONUS',					'TXT_KEY_JFD_REFORM_CURRENCY_CREDIT_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_CURRENCY_CREDIT_PEDIA',							NULL,							NULL,											'ERA_CLASSICAL',		0,								0,						'POLICY_REFORM_JFD_CURRENCY_CREDIT'),	
		--Taxation (Church)                            		        	                                                                	                                                            							                                                                                                                                        		                		                                                            	                                                                        			                                                                        				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                          		    								                                                                    
		('REFORM_JFD_C_TAXATION_HIGH', 							'REFORM_BRANCH_JFD_ECONOMY',		'FLAVOR_JFD_REFORM_ECONOMY',			0,				0,				0,				0,				0,			50,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_GOLD]',									'TXT_KEY_JFD_REFORM_HEADER_C_TAXATION_DESC',			'TXT_KEY_JFD_REFORM_HEADER_C_TAXATION_HELP',			'TXT_KEY_JFD_REFORM_C_TAXATION_HIGH_SHORT_DESC',					'TXT_KEY_JFD_REFORM_C_TAXATION_HIGH_DESC',						'TXT_KEY_JFD_REFORM_C_TAXATION_HIGH_HELP',							'TXT_KEY_JFD_REFORM_C_TAXATION_HIGH_HELP_BONUS',					'TXT_KEY_JFD_REFORM_C_TAXATION_HIGH_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_C_TAXATION_HIGH_PEDIA',							NULL,							NULL,											'ERA_CLASSICAL',		0,								1,						'POLICY_REFORM_JFD_C_TAXATION_HIGH'),
		('REFORM_JFD_C_TAXATION_STANDARD', 						'REFORM_BRANCH_JFD_ECONOMY',		'FLAVOR_JFD_REFORM_ECONOMY',			0,				0,				1,				0,				0,			25,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_C_TAXATION_DESC',			'TXT_KEY_JFD_REFORM_HEADER_C_TAXATION_HELP',			'TXT_KEY_JFD_REFORM_C_TAXATION_STANDARD_SHORT_DESC',				'TXT_KEY_JFD_REFORM_C_TAXATION_STANDARD_DESC',					'TXT_KEY_JFD_REFORM_C_TAXATION_STANDARD_HELP',						'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_C_TAXATION_STANDARD_PEDIA',						NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_C_TAXATION_STANDARD'),
		('REFORM_JFD_C_TAXATION_EXEMPT', 						'REFORM_BRANCH_JFD_ECONOMY',		'FLAVOR_JFD_REFORM_ECONOMY',			0,				0,				0,				0,				0,			50,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_JFD_PIETY]',								'TXT_KEY_JFD_REFORM_HEADER_C_TAXATION_DESC',			'TXT_KEY_JFD_REFORM_HEADER_C_TAXATION_HELP',			'TXT_KEY_JFD_REFORM_C_TAXATION_EXEMPT_SHORT_DESC',					'TXT_KEY_JFD_REFORM_C_TAXATION_EXEMPT_DESC',					'TXT_KEY_JFD_REFORM_C_TAXATION_EXEMPT_HELP',						'TXT_KEY_JFD_REFORM_C_TAXATION_EXEMPT_HELP_BONUS',					'TXT_KEY_JFD_REFORM_C_TAXATION_EXEMPT_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_C_TAXATION_EXEMPT_PEDIA',						NULL,							NULL,											'ERA_CLASSICAL',		0,								1,						'POLICY_REFORM_JFD_C_TAXATION_EXEMPT'),	
		--Welfare                                     	                                                                                	                                                            							                                                                                                                                        		                		                                                            	                                                                        		                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       		                                
		('REFORM_JFD_WELFARE_STATE', 							'REFORM_BRANCH_JFD_ECONOMY',		'FLAVOR_JFD_REFORM_ECONOMY',			0,				0,				0,				0,				0,			40,			0,				0,				1,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_FOOD]',									'TXT_KEY_JFD_REFORM_HEADER_WELFARE_DESC',				'TXT_KEY_JFD_REFORM_HEADER_WELFARE_HELP',				'TXT_KEY_JFD_REFORM_WELFARE_STATE_SHORT_DESC',						'TXT_KEY_JFD_REFORM_WELFARE_STATE_DESC',						'TXT_KEY_JFD_REFORM_WELFARE_STATE_HELP',							'TXT_KEY_JFD_REFORM_WELFARE_STATE_HELP_BONUS',						'TXT_KEY_JFD_REFORM_WELFARE_STATE_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_WELFARE_STATE_PEDIA',							NULL,							NULL,											'ERA_CLASSICAL',		0,								0,						'POLICY_REFORM_JFD_WELFARE_STATE'),
		('REFORM_JFD_WELFARE_BASIC', 							'REFORM_BRANCH_JFD_ECONOMY',		'FLAVOR_JFD_REFORM_ECONOMY',			0,				0,				1,				0,				0,			20,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_WELFARE_DESC',				'TXT_KEY_JFD_REFORM_HEADER_WELFARE_HELP',				'TXT_KEY_JFD_REFORM_WELFARE_BASIC_SHORT_DESC',						'TXT_KEY_JFD_REFORM_WELFARE_BASIC_DESC',						'TXT_KEY_JFD_REFORM_WELFARE_BASIC_HELP',							'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_WELFARE_BASIC_PEDIA',							NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_WELFARE_BASIC'),
		('REFORM_JFD_WELFARE_CHARITY', 							'REFORM_BRANCH_JFD_ECONOMY',		'FLAVOR_JFD_REFORM_ECONOMY',			0,				0,				0,				0,				0,			40,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_GOLD]',									'TXT_KEY_JFD_REFORM_HEADER_WELFARE_DESC',				'TXT_KEY_JFD_REFORM_HEADER_WELFARE_HELP',				'TXT_KEY_JFD_REFORM_WELFARE_CHARITY_SHORT_DESC',					'TXT_KEY_JFD_REFORM_WELFARE_CHARITY_DESC',						'TXT_KEY_JFD_REFORM_WELFARE_CHARITY_HELP',							'TXT_KEY_JFD_REFORM_WELFARE_CHARITY_HELP_BONUS',					'TXT_KEY_JFD_REFORM_WELFARE_CHARITY_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_WELFARE_CHARITY_PEDIA',							NULL,							NULL,											'ERA_CLASSICAL',		0,								0,						'POLICY_REFORM_JFD_WELFARE_CHARITY'),	
		--Guilds                                                                                                                        																							                                                                                                                                        		                		                                                            	                                                                        		                                                                          		        	                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
		('REFORM_JFD_GUILDS_CRAFTS', 							'REFORM_BRANCH_JFD_ECONOMY',		'FLAVOR_JFD_REFORM_ECONOMY',			0,				0,				0,				0,				0,			50,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_SWAP][ICON_FOOD][ICON_PRODUCTION]',		'TXT_KEY_JFD_REFORM_HEADER_GUILDS_DESC',				'TXT_KEY_JFD_REFORM_HEADER_GUILDS_HELP',				'TXT_KEY_JFD_REFORM_GUILDS_CRAFTS_SHORT_DESC',						'TXT_KEY_JFD_REFORM_GUILDS_CRAFTS_DESC',						'TXT_KEY_JFD_REFORM_GUILDS_CRAFTS_HELP',							'TXT_KEY_JFD_REFORM_GUILDS_CRAFTS_HELP_BONUS',						'TXT_KEY_JFD_REFORM_GUILDS_CRAFTS_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_GUILDS_CRAFTS_PEDIA',							NULL,							NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_GUILDS_CRAFTS'),
		('REFORM_JFD_GUILDS_NONE', 								'REFORM_BRANCH_JFD_ECONOMY',		'FLAVOR_JFD_REFORM_ECONOMY',			0,				0,				1,				0,				0,			25,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_GUILDS_DESC',				'TXT_KEY_JFD_REFORM_HEADER_GUILDS_HELP',				'TXT_KEY_JFD_REFORM_GUILDS_NONE_SHORT_DESC',						'TXT_KEY_JFD_REFORM_GUILDS_NONE_DESC',							'TXT_KEY_JFD_REFORM_GUILDS_NONE_HELP',								'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_GUILDS_NONE_PEDIA',								NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_GUILDS_NONE'),
		('REFORM_JFD_GUILDS_COMMERCIAL', 						'REFORM_BRANCH_JFD_ECONOMY',		'FLAVOR_JFD_REFORM_ECONOMY',			0,				0,				0,				0,				0,			50,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_CONNECTED][ICON_GOLD]',					'TXT_KEY_JFD_REFORM_HEADER_GUILDS_DESC',				'TXT_KEY_JFD_REFORM_HEADER_GUILDS_HELP',				'TXT_KEY_JFD_REFORM_GUILDS_COMMERCIAL_SHORT_DESC',					'TXT_KEY_JFD_REFORM_GUILDS_COMMERCIAL_DESC',					'TXT_KEY_JFD_REFORM_GUILDS_COMMERCIAL_HELP',						'TXT_KEY_JFD_REFORM_GUILDS_COMMERCIAL_HELP_BONUS',					'TXT_KEY_JFD_REFORM_GUILDS_COMMERCIAL_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_GUILDS_COMMERCIAL_PEDIA',						NULL,							NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_GUILDS_COMMERCIAL'),	
		--Organization                                                                                                                        																						                                                                                                                                            		                		                                                        	                                                                            		                                                                          		        	                                                	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
		('REFORM_JFD_ORGANIZATION_MUNICIPAL', 					'REFORM_BRANCH_JFD_ECONOMY',		'FLAVOR_JFD_REFORM_ECONOMY',			0,				0,				0,				0,				0,			50,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_JFD_DEVELOPMENT]',						'TXT_KEY_JFD_REFORM_HEADER_ORGANIZATION_DESC',			'TXT_KEY_JFD_REFORM_HEADER_ORGANIZATION_HELP',			'TXT_KEY_JFD_REFORM_ORGANIZATION_MUNICIPAL_SHORT_DESC',				'TXT_KEY_JFD_REFORM_ORGANIZATION_MUNICIPAL_DESC',				'TXT_KEY_JFD_REFORM_ORGANIZATION_MUNICIPAL_HELP',					'TXT_KEY_JFD_REFORM_ORGANIZATION_MUNICIPAL_HELP_BONUS',				'TXT_KEY_JFD_REFORM_ORGANIZATION_MUNICIPAL_HELP_PENALTY',			NULL,												NULL,													'TXT_KEY_JFD_REFORM_ORGANIZATION_MUNICIPAL_PEDIA',					NULL,							NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_ORGANIZATION_MUNICIPAL'),	
		('REFORM_JFD_ORGANIZATION_BALANCED', 					'REFORM_BRANCH_JFD_ECONOMY',		'FLAVOR_JFD_REFORM_ECONOMY',			0,				0,				1,				0,				0,			25,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_ORGANIZATION_DESC',			'TXT_KEY_JFD_REFORM_HEADER_ORGANIZATION_HELP',			'TXT_KEY_JFD_REFORM_ORGANIZATION_BALANCED_SHORT_DESC',				'TXT_KEY_JFD_REFORM_ORGANIZATION_BALANCED_DESC',				'TXT_KEY_JFD_REFORM_ORGANIZATION_BALANCED_HELP',					'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_ORGANIZATION_BALANCED_PEDIA',					NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_ORGANIZATION_BALANCED'),
		('REFORM_JFD_ORGANIZATION_MANORIAL', 					'REFORM_BRANCH_JFD_ECONOMY',		'FLAVOR_JFD_REFORM_ECONOMY',			0,				0,				0,				0,				0,			50,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_JFD_COUNTY]',							'TXT_KEY_JFD_REFORM_HEADER_ORGANIZATION_DESC',			'TXT_KEY_JFD_REFORM_HEADER_ORGANIZATION_HELP',			'TXT_KEY_JFD_REFORM_ORGANIZATION_MANORIAL_SHORT_DESC',				'TXT_KEY_JFD_REFORM_ORGANIZATION_MANORIAL_DESC',				'TXT_KEY_JFD_REFORM_ORGANIZATION_MANORIAL_HELP',					'TXT_KEY_JFD_REFORM_ORGANIZATION_MANORIAL_HELP_BONUS',				'TXT_KEY_JFD_REFORM_ORGANIZATION_MANORIAL_HELP_PENALTY',			NULL,												NULL,													'TXT_KEY_JFD_REFORM_ORGANIZATION_MANORIAL_PEDIA',					NULL,							NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_ORGANIZATION_MANORIAL'),
		--Taxation (Upper)                                     	                                                                        	                                                            							                                                                                                                                        		                		                                                            	                                                                        		                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                          		    								                                                                    
		('REFORM_JFD_U_TAXATION_HIGH', 							'REFORM_BRANCH_JFD_ECONOMY',		'FLAVOR_JFD_REFORM_ECONOMY',			0,				0,				0,				0,				0,			50,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_GOLD]',									'TXT_KEY_JFD_REFORM_HEADER_U_TAXATION_DESC',			'TXT_KEY_JFD_REFORM_HEADER_U_TAXATION_HELP',			'TXT_KEY_JFD_REFORM_U_TAXATION_HIGH_SHORT_DESC',					'TXT_KEY_JFD_REFORM_U_TAXATION_HIGH_DESC',						'TXT_KEY_JFD_REFORM_U_TAXATION_HIGH_HELP',							'TXT_KEY_JFD_REFORM_U_TAXATION_HIGH_HELP_BONUS',					'TXT_KEY_JFD_REFORM_U_TAXATION_HIGH_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_U_TAXATION_HIGH_PEDIA',							NULL,							NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_U_TAXATION_HIGH'),
		('REFORM_JFD_U_TAXATION_STANDARD', 						'REFORM_BRANCH_JFD_ECONOMY',		'FLAVOR_JFD_REFORM_ECONOMY',			0,				0,				1,				0,				0,			25,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_U_TAXATION_DESC',			'TXT_KEY_JFD_REFORM_HEADER_U_TAXATION_HELP',			'TXT_KEY_JFD_REFORM_U_TAXATION_STANDARD_SHORT_DESC',				'TXT_KEY_JFD_REFORM_U_TAXATION_STANDARD_DESC',					'TXT_KEY_JFD_REFORM_U_TAXATION_STANDARD_HELP',						'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_U_TAXATION_STANDARD_PEDIA',						NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_U_TAXATION_STANDARD'),
		('REFORM_JFD_U_TAXATION_EXEMPT', 						'REFORM_BRANCH_JFD_ECONOMY',		'FLAVOR_JFD_REFORM_ECONOMY',			0,				0,				0,				0,				0,			50,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_JFD_SOVEREIGNTY]',						'TXT_KEY_JFD_REFORM_HEADER_U_TAXATION_DESC',			'TXT_KEY_JFD_REFORM_HEADER_U_TAXATION_HELP',			'TXT_KEY_JFD_REFORM_U_TAXATION_EXEMPT_SHORT_DESC',					'TXT_KEY_JFD_REFORM_U_TAXATION_EXEMPT_DESC',					'TXT_KEY_JFD_REFORM_U_TAXATION_EXEMPT_HELP',						'TXT_KEY_JFD_REFORM_U_TAXATION_EXEMPT_HELP_BONUS',					'TXT_KEY_JFD_REFORM_U_TAXATION_EXEMPT_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_U_TAXATION_EXEMPT_PEDIA',						NULL,							NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_U_TAXATION_EXEMPT'),	
		--Development		                                                                                                            																							                                                                                                                                        		                		    					                                    	                                                                        		                                                                                			                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                          		    								                                                                    
		('REFORM_JFD_DEVELOPMENT_HEALTH', 						'REFORM_BRANCH_JFD_ECONOMY',		'FLAVOR_JFD_REFORM_ECONOMY',			0,				0,				0,				0,				0,			60,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_JFD_DEVELOPMENT][ICON_JFD_HEALTH]',		'TXT_KEY_JFD_REFORM_HEADER_DEVELOPMENT_DESC',			'TXT_KEY_JFD_REFORM_HEADER_DEVELOPMENT_HELP',			'TXT_KEY_JFD_REFORM_DEVELOPMENT_HEALTH_SHORT_DESC',					'TXT_KEY_JFD_REFORM_DEVELOPMENT_HEALTH_DESC',					'TXT_KEY_JFD_REFORM_DEVELOPMENT_HEALTH_HELP',						'TXT_KEY_JFD_REFORM_DEVELOPMENT_HEALTH_HELP_BONUS',					'TXT_KEY_JFD_REFORM_DEVELOPMENT_HEALTH_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_DEVELOPMENT_HEALTH_PEDIA',						NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_DEVELOPMENT_HEALTH'),
		('REFORM_JFD_DEVELOPMENT_BALANCED', 					'REFORM_BRANCH_JFD_ECONOMY',		'FLAVOR_JFD_REFORM_ECONOMY',			0,				0,				1,				0,				0,			30,			0,				0,				1,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_DEVELOPMENT_DESC',			'TXT_KEY_JFD_REFORM_HEADER_DEVELOPMENT_HELP',			'TXT_KEY_JFD_REFORM_DEVELOPMENT_BALANCED_SHORT_DESC',				'TXT_KEY_JFD_REFORM_DEVELOPMENT_BALANCED_DESC',					'TXT_KEY_JFD_REFORM_DEVELOPMENT_BALANCED_HELP',						'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_DEVELOPMENT_BALANCED_PEDIA',					NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_DEVELOPMENT_BALANCED'),
		('REFORM_JFD_DEVELOPMENT_HAPPINESS', 					'REFORM_BRANCH_JFD_ECONOMY',		'FLAVOR_JFD_REFORM_ECONOMY',			0,				0,				0,				0,				0,			60,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_JFD_DEVELOPMENT][ICON_HAPPINESS_1]',		'TXT_KEY_JFD_REFORM_HEADER_DEVELOPMENT_DESC',			'TXT_KEY_JFD_REFORM_HEADER_DEVELOPMENT_HELP',			'TXT_KEY_JFD_REFORM_DEVELOPMENT_HAPPINESS_SHORT_DESC',				'TXT_KEY_JFD_REFORM_DEVELOPMENT_HAPPINESS_DESC',				'TXT_KEY_JFD_REFORM_DEVELOPMENT_HAPPINESS_HELP',					'TXT_KEY_JFD_REFORM_DEVELOPMENT_HAPPINESS_HELP_BONUS',				'TXT_KEY_JFD_REFORM_DEVELOPMENT_HAPPINESS_HELP_PENALTY',			NULL,												NULL,													'TXT_KEY_JFD_REFORM_DEVELOPMENT_HAPPINESS_PEDIA',					NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_DEVELOPMENT_HAPPINESS'),	
		--Market			                                                                                                            																							                                                                                                                        												                                                            	                                                        						                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                          		    								                                                                    
		('REFORM_JFD_MARKET_PLANNED', 							'REFORM_BRANCH_JFD_ECONOMY',		'FLAVOR_JFD_REFORM_ECONOMY',			0,				0,				0,				0,				0,			70,			0,				0,				1,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_RES_IRON]',								'TXT_KEY_JFD_REFORM_HEADER_MARKET_DESC',				'TXT_KEY_JFD_REFORM_HEADER_MARKET_HELP',				'TXT_KEY_JFD_REFORM_MARKET_PLANNED_SHORT_DESC',						'TXT_KEY_JFD_REFORM_MARKET_PLANNED_DESC',						'TXT_KEY_JFD_REFORM_MARKET_PLANNED_HELP',							'TXT_KEY_JFD_REFORM_MARKET_PLANNED_HELP_BONUS',						'TXT_KEY_JFD_REFORM_MARKET_PLANNED_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_MARKET_PLANNED_PEDIA',							NULL,							NULL,											'ERA_INDUSTRIAL',		0,								0,						'POLICY_REFORM_JFD_MARKET_PLANNED'),
		('REFORM_JFD_MARKET_MIXED', 							'REFORM_BRANCH_JFD_ECONOMY',		'FLAVOR_JFD_REFORM_ECONOMY',			0,				0,				1,				0,				0,			45,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_MARKET_DESC',				'TXT_KEY_JFD_REFORM_HEADER_MARKET_HELP',				'TXT_KEY_JFD_REFORM_MARKET_MIXED_SHORT_DESC',						'TXT_KEY_JFD_REFORM_MARKET_MIXED_DESC',							'TXT_KEY_JFD_REFORM_MARKET_MIXED_HELP',								'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_MARKET_MIXED_PEDIA',							NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_MARKET_MIXED'),
		('REFORM_JFD_MARKET_FREE', 								'REFORM_BRANCH_JFD_ECONOMY',		'FLAVOR_JFD_REFORM_ECONOMY',			0,				0,				0,				0,				0,			70,			0,				1,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_HAPPINESS_1]',							'TXT_KEY_JFD_REFORM_HEADER_MARKET_DESC',				'TXT_KEY_JFD_REFORM_HEADER_MARKET_HELP',				'TXT_KEY_JFD_REFORM_MARKET_FREE_SHORT_DESC',						'TXT_KEY_JFD_REFORM_MARKET_FREE_DESC',							'TXT_KEY_JFD_REFORM_MARKET_FREE_HELP',								'TXT_KEY_JFD_REFORM_MARKET_FREE_HELP_BONUS',						'TXT_KEY_JFD_REFORM_MARKET_FREE_HELP_PENALTY',						NULL,												NULL,													'TXT_KEY_JFD_REFORM_MARKET_FREE_PEDIA',								NULL,							NULL,											'ERA_INDUSTRIAL',		0,								0,						'POLICY_REFORM_JFD_MARKET_FREE');
									
--Foreign					
INSERT INTO JFD_Reforms					
		(Type, 													ReformBranchType,					ReformFlavourType,						IsDisabled,		IsSovereignty,	DefaultActive,	IsLegislature,	IsTitled,	Cost,		AutocracyIndex,	FreedomIndex,	OrderIndex,		MaxSovChange,		FactionSovMod,	ReformCooldownMod,	ReformCostMod,	ReformCostModPerPuppet,	ReformCostModPerPop,	ResetsAssembly,		ResetsHolySynod,	ResetsImperialCourt,	ResetsImperialDiet,	ResetsParliament,	ResetsSenate,	ResetsLegislature,		AnarchySentimentMod,	Alignment,			FocusIcon,										HeaderDescription, 										HeaderHelp,												ShortDescription,													Description,													Help,																HelpBonus,															HelpPenalty,														LegislatureHelp,									LegislatureIdeologyHelp,								Pedia,																PrereqGovernment, 				PrereqReform,									PrereqEra, 				RequiresNumCityStateFriends,	RequiresStateReligion,	PolicyType)
VALUES	--Power																																																						                                                                                                                                                                                                                                    	                                                                                                                                                				                                                                	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                                                
		('REFORM_JFD_POWER_HARD', 								'REFORM_BRANCH_JFD_FOREIGN',		'FLAVOR_JFD_REFORM_FOREIGN',			0,				0,				0,				0,				0,			30,			1,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_CITY_STATE][ICON_WAR]',					'TXT_KEY_JFD_REFORM_HEADER_POWER_DESC',					'TXT_KEY_JFD_REFORM_HEADER_POWER_HELP',					'TXT_KEY_JFD_REFORM_POWER_HARD_SHORT_DESC',							'TXT_KEY_JFD_REFORM_POWER_HARD_DESC',							'TXT_KEY_JFD_REFORM_POWER_HARD_HELP',								'TXT_KEY_JFD_REFORM_POWER_HARD_HELP_BONUS',							'TXT_KEY_JFD_REFORM_POWER_HARD_HELP_PENALTY',						NULL,												NULL,													'TXT_KEY_JFD_REFORM_POWER_HARD_PEDIA',								NULL,							NULL,											'ERA_ANCIENT',			0,								0,						'POLICY_REFORM_JFD_POWER_HARD'),	
		('REFORM_JFD_POWER_BALANCED', 							'REFORM_BRANCH_JFD_FOREIGN',		'FLAVOR_JFD_REFORM_FOREIGN',			0,				0,				1,				0,				0,			15,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_POWER_DESC',					'TXT_KEY_JFD_REFORM_HEADER_POWER_HELP',					'TXT_KEY_JFD_REFORM_POWER_BALANCED_SHORT_DESC',						'TXT_KEY_JFD_REFORM_POWER_BALANCED_DESC',						'TXT_KEY_JFD_REFORM_POWER_BALANCED_HELP',							'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_POWER_BALANCED_PEDIA',							NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_POWER_BALANCED'),
		('REFORM_JFD_POWER_SOFT', 								'REFORM_BRANCH_JFD_FOREIGN',		'FLAVOR_JFD_REFORM_FOREIGN',			0,				0,				0,				0,				0,			30,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_CITY_STATE][ICON_INFLUENCE]',			'TXT_KEY_JFD_REFORM_HEADER_POWER_DESC',					'TXT_KEY_JFD_REFORM_HEADER_POWER_HELP',					'TXT_KEY_JFD_REFORM_POWER_SOFT_SHORT_DESC',							'TXT_KEY_JFD_REFORM_POWER_SOFT_DESC',							'TXT_KEY_JFD_REFORM_POWER_SOFT_HELP',								'TXT_KEY_JFD_REFORM_POWER_SOFT_HELP_BONUS',							'TXT_KEY_JFD_REFORM_POWER_SOFT_HELP_PENALTY',						NULL,												NULL,													'TXT_KEY_JFD_REFORM_POWER_SOFT_PEDIA',								NULL,							NULL,											'ERA_ANCIENT',			0,								0,						'POLICY_REFORM_JFD_POWER_SOFT'),
		--Claims																																																					                                                                                                                                        		                		                                                            	                                                                        		                                    		                                        		                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
		('REFORM_JFD_CLAIMS_CAUSE', 							'REFORM_BRANCH_JFD_FOREIGN',		'FLAVOR_JFD_REFORM_FOREIGN',			0,				0,				0,				0,				0,			50,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_CITY_STATE][ICON_JFD_CLAIM_MEDIUM]',		'TXT_KEY_JFD_REFORM_HEADER_CLAIMS_DESC',				'TXT_KEY_JFD_REFORM_HEADER_CLAIMS_HELP',				'TXT_KEY_JFD_REFORM_CLAIMS_CAUSE_SHORT_DESC',						'TXT_KEY_JFD_REFORM_CLAIMS_CAUSE_DESC',							'TXT_KEY_JFD_REFORM_CLAIMS_CAUSE_HELP',								'TXT_KEY_JFD_REFORM_CLAIMS_CAUSE_HELP_BONUS',						'TXT_KEY_JFD_REFORM_CLAIMS_CAUSE_HELP_PENALTY',						NULL,												NULL,													'TXT_KEY_JFD_REFORM_CLAIMS_CAUSE_PEDIA',							NULL,							NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_CLAIMS_CAUSE'),	
		('REFORM_JFD_CLAIMS_MIXED', 							'REFORM_BRANCH_JFD_FOREIGN',		'FLAVOR_JFD_REFORM_FOREIGN',			0,				0,				1,				0,				0,			25,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_CLAIMS_DESC',				'TXT_KEY_JFD_REFORM_HEADER_CLAIMS_HELP',				'TXT_KEY_JFD_REFORM_CLAIMS_MIXED_SHORT_DESC',						'TXT_KEY_JFD_REFORM_CLAIMS_MIXED_DESC',							'TXT_KEY_JFD_REFORM_CLAIMS_MIXED_HELP',								'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_CLAIMS_MIXED_PEDIA',							NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_CLAIMS_MIXED'),
		('REFORM_JFD_CLAIMS_INVESTMENT', 						'REFORM_BRANCH_JFD_FOREIGN',		'FLAVOR_JFD_REFORM_FOREIGN',			0,				0,				0,				0,				0,			50,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_CITY_STATE][ICON_JFD_CLAIM_MEDIUM]',		'TXT_KEY_JFD_REFORM_HEADER_CLAIMS_DESC',				'TXT_KEY_JFD_REFORM_HEADER_CLAIMS_HELP',				'TXT_KEY_JFD_REFORM_CLAIMS_INVESTMENT_SHORT_DESC',					'TXT_KEY_JFD_REFORM_CLAIMS_INVESTMENT_DESC',					'TXT_KEY_JFD_REFORM_CLAIMS_INVESTMENT_HELP',						'TXT_KEY_JFD_REFORM_CLAIMS_INVESTMENT_HELP_BONUS',					'TXT_KEY_JFD_REFORM_CLAIMS_INVESTMENT_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_CLAIMS_INVESTMENT_PEDIA',						NULL,							NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_CLAIMS_INVESTMENT'),
		--Intelligence																																																				                                                                                                                                        		                		                                                            	                                                                        		                                    		                                        		                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
		('REFORM_JFD_INTELLIGENCE_COVERT', 						'REFORM_BRANCH_JFD_FOREIGN',		'FLAVOR_JFD_REFORM_FOREIGN',			0,				0,				0,				0,				0,			60,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_SPY][ICON_INFLUENCE]',					'TXT_KEY_JFD_REFORM_HEADER_INTELLIGENCE_DESC',			'TXT_KEY_JFD_REFORM_HEADER_INTELLIGENCE_HELP',			'TXT_KEY_JFD_REFORM_INTELLIGENCE_COVERT_SHORT_DESC',				'TXT_KEY_JFD_REFORM_INTELLIGENCE_COVERT_DESC',					'TXT_KEY_JFD_REFORM_INTELLIGENCE_COVERT_HELP',						'TXT_KEY_JFD_REFORM_INTELLIGENCE_COVERT_HELP_BONUS',				'TXT_KEY_JFD_REFORM_INTELLIGENCE_COVERT_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_INTELLIGENCE_COVERT_PEDIA',						NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_INTELLIGENCE_COVERT'),	
		('REFORM_JFD_INTELLIGENCE_PASSIVE', 					'REFORM_BRANCH_JFD_FOREIGN',		'FLAVOR_JFD_REFORM_FOREIGN',			0,				0,				1,				0,				0,			30,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_INTELLIGENCE_DESC',			'TXT_KEY_JFD_REFORM_HEADER_INTELLIGENCE_HELP',			'TXT_KEY_JFD_REFORM_INTELLIGENCE_PASSIVE_SHORT_DESC',				'TXT_KEY_JFD_REFORM_INTELLIGENCE_PASSIVE_DESC',					'TXT_KEY_JFD_REFORM_INTELLIGENCE_PASSIVE_HELP',						'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_INTELLIGENCE_PASSIVE_PEDIA',					NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_INTELLIGENCE_PASSIVE'),
		('REFORM_JFD_INTELLIGENCE_CLANDESTINE', 				'REFORM_BRANCH_JFD_FOREIGN',		'FLAVOR_JFD_REFORM_FOREIGN',			0,				0,				0,				0,				0,			60,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_SPY][ICON_RESEARCH]',					'TXT_KEY_JFD_REFORM_HEADER_INTELLIGENCE_DESC',			'TXT_KEY_JFD_REFORM_HEADER_INTELLIGENCE_HELP',			'TXT_KEY_JFD_REFORM_INTELLIGENCE_CLANDESTINE_SHORT_DESC',			'TXT_KEY_JFD_REFORM_INTELLIGENCE_CLANDESTINE_DESC',				'TXT_KEY_JFD_REFORM_INTELLIGENCE_CLANDESTINE_HELP',					'TXT_KEY_JFD_REFORM_INTELLIGENCE_CLANDESTINE_HELP_BONUS',			'TXT_KEY_JFD_REFORM_INTELLIGENCE_CLANDESTINE_HELP_PENALTY',			NULL,												NULL,													'TXT_KEY_JFD_REFORM_INTELLIGENCE_CLANDESTINE_PEDIA',				NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_INTELLIGENCE_CLANDESTINE'),
		--Migration																																																					                                                                                                                                                                                                                                    	                                                                                                                                                                                                                                	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                                                            
		--Trade																																																						                                                                                                                                        		                		                                                            	                                                                        		                                    		                                        		                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
		('REFORM_JFD_TRADE_REGULATED', 							'REFORM_BRANCH_JFD_FOREIGN',		'FLAVOR_JFD_REFORM_FOREIGN',			0,				0,				0,				0,				0,			60,			1,				0,				1,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_SWAP][ICON_JFD_DISEASE]',				'TXT_KEY_JFD_REFORM_HEADER_TRADE_DESC',					'TXT_KEY_JFD_REFORM_HEADER_TRADE_HELP',					'TXT_KEY_JFD_REFORM_TRADE_REGULATED_SHORT_DESC',					'TXT_KEY_JFD_REFORM_TRADE_REGULATED_DESC',						'TXT_KEY_JFD_REFORM_TRADE_REGULATED_HELP',							'TXT_KEY_JFD_REFORM_TRADE_REGULATED_HELP_BONUS',					'TXT_KEY_JFD_REFORM_TRADE_REGULATED_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_TRADE_REGULATED_PEDIA',							NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_TRADE_REGULATED'),	
		('REFORM_JFD_TRADE_NONE', 								'REFORM_BRANCH_JFD_FOREIGN',		'FLAVOR_JFD_REFORM_FOREIGN',			0,				0,				1,				0,				0,			30,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_TRADE_DESC',					'TXT_KEY_JFD_REFORM_HEADER_TRADE_HELP',					'TXT_KEY_JFD_REFORM_TRADE_NONE_SHORT_DESC',							'TXT_KEY_JFD_REFORM_TRADE_NONE_DESC',							'TXT_KEY_JFD_REFORM_TRADE_NONE_HELP',								'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_TRADE_NONE_PEDIA',								NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_TRADE_NONE'),
		('REFORM_JFD_TRADE_FREE', 								'REFORM_BRANCH_JFD_FOREIGN',		'FLAVOR_JFD_REFORM_FOREIGN',			0,				0,				0,				0,				0,			60,			0,				1,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_SWAP][ICON_GOLD]',						'TXT_KEY_JFD_REFORM_HEADER_TRADE_DESC',					'TXT_KEY_JFD_REFORM_HEADER_TRADE_HELP',					'TXT_KEY_JFD_REFORM_TRADE_FREE_SHORT_DESC',							'TXT_KEY_JFD_REFORM_TRADE_FREE_DESC',							'TXT_KEY_JFD_REFORM_TRADE_FREE_HELP',								'TXT_KEY_JFD_REFORM_TRADE_FREE_HELP_BONUS',							'TXT_KEY_JFD_REFORM_TRADE_FREE_HELP_PENALTY',						NULL,												NULL,													'TXT_KEY_JFD_REFORM_TRADE_FREE_PEDIA',								NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_TRADE_FREE'),
		--Citizenship																																																				                                                                                                                                        		                		                                                            	                                                                        		                                    		                                        		                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
		('REFORM_JFD_CITIZENSHIP_NONE', 						'REFORM_BRANCH_JFD_FOREIGN',		'FLAVOR_JFD_REFORM_FOREIGN',			0,				0,				0,				0,				0,			70,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_PUPPET][ICON_JFD_SOVEREIGNTY]',			'TXT_KEY_JFD_REFORM_HEADER_CITIZENSHIP_DESC',			'TXT_KEY_JFD_REFORM_HEADER_CITIZENSHIP_HELP',			'TXT_KEY_JFD_REFORM_CITIZENSHIP_NONE_SHORT_DESC',					'TXT_KEY_JFD_REFORM_CITIZENSHIP_NONE_DESC',						'TXT_KEY_JFD_REFORM_CITIZENSHIP_NONE_HELP',							'TXT_KEY_JFD_REFORM_CITIZENSHIP_NONE_HELP_BONUS',					'TXT_KEY_JFD_REFORM_CITIZENSHIP_NONE_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_CITIZENSHIP_NONE_PEDIA',						NULL,							NULL,											'ERA_INDUSTRIAL',		0,								0,						'POLICY_REFORM_JFD_CITIZENSHIP_NONE'),	
		('REFORM_JFD_CITIZENSHIP_LIMITED', 						'REFORM_BRANCH_JFD_FOREIGN',		'FLAVOR_JFD_REFORM_FOREIGN',			0,				0,				1,				0,				0,			45,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_CITIZENSHIP_DESC',			'TXT_KEY_JFD_REFORM_HEADER_CITIZENSHIP_HELP',			'TXT_KEY_JFD_REFORM_CITIZENSHIP_LIMITED_SHORT_DESC',				'TXT_KEY_JFD_REFORM_CITIZENSHIP_LIMITED_DESC',					'TXT_KEY_JFD_REFORM_CITIZENSHIP_LIMITED_HELP',						'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_CITIZENSHIP_LIMITED_PEDIA',						NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_CITIZENSHIP_LIMITED'),
		('REFORM_JFD_CITIZENSHIP_FULL', 						'REFORM_BRANCH_JFD_FOREIGN',		'FLAVOR_JFD_REFORM_FOREIGN',			0,				0,				0,				0,				0,			70,			0,				0,				0,				0,					0,				0,					0,				5,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_PUPPET][ICON_JFD_BLUE_FIST]',			'TXT_KEY_JFD_REFORM_HEADER_CITIZENSHIP_DESC',			'TXT_KEY_JFD_REFORM_HEADER_CITIZENSHIP_HELP',			'TXT_KEY_JFD_REFORM_CITIZENSHIP_FULL_SHORT_DESC',					'TXT_KEY_JFD_REFORM_CITIZENSHIP_FULL_DESC',						'TXT_KEY_JFD_REFORM_CITIZENSHIP_FULL_HELP',							'TXT_KEY_JFD_REFORM_CITIZENSHIP_FULL_HELP_BONUS',					'TXT_KEY_JFD_REFORM_CITIZENSHIP_FULL_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_CITIZENSHIP_FULL_PEDIA',						NULL,							NULL,											'ERA_INDUSTRIAL',		0,								0,						'POLICY_REFORM_JFD_CITIZENSHIP_FULL'),
		--Taxation (Colonies)                            		        	                                                            	                                                                						                                                                                                                                        		                		                                                            	                                                                        		    	                                                                        			                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                   		    								                                                                                    
		('REFORM_JFD_CO_TAXATION_HIGH', 						'REFORM_BRANCH_JFD_FOREIGN',		'FLAVOR_JFD_REFORM_ECONOMY',			0,				0,				0,				0,				0,			70,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_JFD_COLONY][ICON_GOLD]',					'TXT_KEY_JFD_REFORM_HEADER_CO_TAXATION_DESC',			'TXT_KEY_JFD_REFORM_HEADER_CO_TAXATION_HELP',			'TXT_KEY_JFD_REFORM_CO_TAXATION_HIGH_SHORT_DESC',					'TXT_KEY_JFD_REFORM_CO_TAXATION_HIGH_DESC',						'TXT_KEY_JFD_REFORM_CO_TAXATION_HIGH_HELP',							'TXT_KEY_JFD_REFORM_CO_TAXATION_HIGH_HELP_BONUS',					'TXT_KEY_JFD_REFORM_CO_TAXATION_HIGH_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_CO_TAXATION_HIGH_PEDIA',						NULL,							NULL,											'ERA_INDUSTRIAL',		0,								0,						'POLICY_REFORM_JFD_CO_TAXATION_HIGH'),
		('REFORM_JFD_CO_TAXATION_STANDARD', 					'REFORM_BRANCH_JFD_FOREIGN',		'FLAVOR_JFD_REFORM_ECONOMY',			0,				0,				1,				0,				0,			45,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_CO_TAXATION_DESC',			'TXT_KEY_JFD_REFORM_HEADER_CO_TAXATION_HELP',			'TXT_KEY_JFD_REFORM_CO_TAXATION_STANDARD_SHORT_DESC',				'TXT_KEY_JFD_REFORM_CO_TAXATION_STANDARD_DESC',					'TXT_KEY_JFD_REFORM_CO_TAXATION_STANDARD_HELP',						'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_CO_TAXATION_STANDARD_PEDIA',					NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_CO_TAXATION_STANDARD'),
		('REFORM_JFD_CO_TAXATION_EXEMPT', 						'REFORM_BRANCH_JFD_FOREIGN',		'FLAVOR_JFD_REFORM_ECONOMY',			0,				0,				0,				0,				0,			70,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_JFD_COLONY][ICON_JFD_BLUE_FIST]',		'TXT_KEY_JFD_REFORM_HEADER_CO_TAXATION_DESC',			'TXT_KEY_JFD_REFORM_HEADER_CO_TAXATION_HELP',			'TXT_KEY_JFD_REFORM_CO_TAXATION_EXEMPT_SHORT_DESC',					'TXT_KEY_JFD_REFORM_CO_TAXATION_EXEMPT_DESC',					'TXT_KEY_JFD_REFORM_CO_TAXATION_EXEMPT_HELP',						'TXT_KEY_JFD_REFORM_CO_TAXATION_EXEMPT_HELP_BONUS',					'TXT_KEY_JFD_REFORM_CO_TAXATION_EXEMPT_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_CO_TAXATION_EXEMPT_PEDIA',						NULL,							NULL,											'ERA_INDUSTRIAL',		0,								0,						'POLICY_REFORM_JFD_CO_TAXATION_EXEMPT'),	
		--Tribes																																																					                                                                                                                                        		                		                                                            	                                                                        		                                		                                            	                                                        	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
		('REFORM_JFD_TRIBES_RESERVATION', 						'REFORM_BRANCH_JFD_FOREIGN',		'FLAVOR_JFD_REFORM_FOREIGN',			0,				0,				0,				0,				0,			70,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_JFD_TRIBE][ICON_CULTURE]',				'TXT_KEY_JFD_REFORM_HEADER_TRIBES_DESC',				'TXT_KEY_JFD_REFORM_HEADER_TRIBES_HELP',				'TXT_KEY_JFD_REFORM_TRIBES_RESERVATION_SHORT_DESC',					'TXT_KEY_JFD_REFORM_TRIBES_RESERVATION_DESC',					'TXT_KEY_JFD_REFORM_TRIBES_RESERVATION_HELP',						'TXT_KEY_JFD_REFORM_TRIBES_RESERVATION_HELP_BONUS',					'TXT_KEY_JFD_REFORM_TRIBES_RESERVATION_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_TRIBES_RESERVATION_PEDIA',						NULL,							NULL,											'ERA_INDUSTRIAL',		0,								0,						'POLICY_REFORM_JFD_TRIBES_RESERVATION'),	
		('REFORM_JFD_TRIBES_NONE', 								'REFORM_BRANCH_JFD_FOREIGN',		'FLAVOR_JFD_REFORM_FOREIGN',			0,				0,				1,				0,				0,			45,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_TRIBES_DESC',				'TXT_KEY_JFD_REFORM_HEADER_TRIBES_HELP',				'TXT_KEY_JFD_REFORM_TRIBES_NONE_SHORT_DESC',						'TXT_KEY_JFD_REFORM_TRIBES_NONE_DESC',							'TXT_KEY_JFD_REFORM_TRIBES_NONE_HELP',								'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_TRIBES_NONE_PEDIA',								NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_TRIBES_NONE'),
		('REFORM_JFD_TRIBES_ASSIMILATION', 						'REFORM_BRANCH_JFD_FOREIGN',		'FLAVOR_JFD_REFORM_FOREIGN',			0,				0,				0,				0,				0,			70,			0,				0,				1,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_JFD_TRIBE][ICON_TOURISM]',				'TXT_KEY_JFD_REFORM_HEADER_TRIBES_DESC',				'TXT_KEY_JFD_REFORM_HEADER_TRIBES_HELP',				'TXT_KEY_JFD_REFORM_TRIBES_ASSIMILATION_SHORT_DESC',				'TXT_KEY_JFD_REFORM_TRIBES_ASSIMILATION_DESC',					'TXT_KEY_JFD_REFORM_TRIBES_ASSIMILATION_HELP',						'TXT_KEY_JFD_REFORM_TRIBES_ASSIMILATION_HELP_BONUS',				'TXT_KEY_JFD_REFORM_TRIBES_ASSIMILATION_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_TRIBES_ASSIMILATION_PEDIA',						NULL,							NULL,											'ERA_INDUSTRIAL',		0,								0,						'POLICY_REFORM_JFD_TRIBES_ASSIMILATION'),
		--Tourism																																																					                                                                                                                                        		                		                                                            	                                                                        		                                    		                                        		                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
		('REFORM_JFD_TOURISM_LIMITED', 							'REFORM_BRANCH_JFD_FOREIGN',		'FLAVOR_JFD_REFORM_FOREIGN',			0,				0,				0,				0,				0,			70,			1,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_TOURISM]',								'TXT_KEY_JFD_REFORM_HEADER_TOURISM_DESC',				'TXT_KEY_JFD_REFORM_HEADER_TOURISM_HELP',				'TXT_KEY_JFD_REFORM_TOURISM_LIMITED_SHORT_DESC',					'TXT_KEY_JFD_REFORM_TOURISM_LIMITED_DESC',						'TXT_KEY_JFD_REFORM_TOURISM_LIMITED_HELP',							'TXT_KEY_JFD_REFORM_TOURISM_LIMITED_HELP_BONUS',					'TXT_KEY_JFD_REFORM_TOURISM_LIMITED_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_TOURISM_LIMITED_PEDIA',							NULL,							NULL,											'ERA_INDUSTRIAL',		0,								0,						'POLICY_REFORM_JFD_TOURISM_LIMITED'),	
		('REFORM_JFD_TOURISM_NONE', 							'REFORM_BRANCH_JFD_FOREIGN',		'FLAVOR_JFD_REFORM_FOREIGN',			0,				0,				1,				0,				0,			45,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_TOURISM_DESC',				'TXT_KEY_JFD_REFORM_HEADER_TOURISM_HELP',				'TXT_KEY_JFD_REFORM_TOURISM_NONE_SHORT_DESC',						'TXT_KEY_JFD_REFORM_TOURISM_NONE_DESC',							'TXT_KEY_JFD_REFORM_TOURISM_NONE_HELP',								'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_TOURISM_NONE_PEDIA',							NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_TOURISM_NONE'),
		('REFORM_JFD_TOURISM_FREE', 							'REFORM_BRANCH_JFD_FOREIGN',		'FLAVOR_JFD_REFORM_FOREIGN',			0,				0,				0,				0,				0,			70,			0,				1,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_JFD_CRIME_BLACK]',						'TXT_KEY_JFD_REFORM_HEADER_TOURISM_DESC',				'TXT_KEY_JFD_REFORM_HEADER_TOURISM_HELP',				'TXT_KEY_JFD_REFORM_TOURISM_FREE_SHORT_DESC',						'TXT_KEY_JFD_REFORM_TOURISM_FREE_DESC',							'TXT_KEY_JFD_REFORM_TOURISM_FREE_HELP',								'TXT_KEY_JFD_REFORM_TOURISM_FREE_HELP_BONUS',						'TXT_KEY_JFD_REFORM_TOURISM_FREE_HELP_PENALTY',						NULL,												NULL,													'TXT_KEY_JFD_REFORM_TOURISM_FREE_PEDIA',							NULL,							NULL,											'ERA_INDUSTRIAL',		0,								0,						'POLICY_REFORM_JFD_TOURISM_FREE');
							
--Industry						
INSERT INTO JFD_Reforms						
		(Type, 													ReformBranchType,					ReformFlavourType,						IsDisabled,		IsSovereignty,	DefaultActive,	IsLegislature,	IsTitled,	Cost,		AutocracyIndex,	FreedomIndex,	OrderIndex,		MaxSovChange,		FactionSovMod,	ReformCooldownMod,	ReformCostMod,	ReformCostModPerCity,	ReformCostModPerPop,	ResetsAssembly,		ResetsHolySynod,	ResetsImperialCourt,	ResetsImperialDiet,	ResetsParliament,	ResetsSenate,	ResetsLegislature,		AnarchySentimentMod,	Alignment,			FocusIcon,										HeaderDescription, 										HeaderHelp,												ShortDescription,													Description,													Help,																HelpBonus,															HelpPenalty,														LegislatureHelp,									LegislatureIdeologyHelp,								Pedia,																PrereqGovernment, 				PrereqReform,									PrereqEra, 				RequiresNumCityStateFriends,	RequiresStateReligion,	PolicyType)
VALUES	--Labour																																																					                                                                                                                                                                        					                                        	                                                                                                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                   		    								
		('REFORM_JFD_LABOUR_BONDED', 							'REFORM_BRANCH_JFD_INDUSTRY',		'FLAVOR_JFD_REFORM_INDUSTRY',			0,				0,				0,				0,				0,			30,			1,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_WORKER]',								'TXT_KEY_JFD_REFORM_HEADER_LABOUR_DESC',				'TXT_KEY_JFD_REFORM_HEADER_LABOUR_HELP',				'TXT_KEY_JFD_REFORM_LABOUR_BONDED_SHORT_DESC',						'TXT_KEY_JFD_REFORM_LABOUR_BONDED_DESC',						'TXT_KEY_JFD_REFORM_LABOUR_BONDED_HELP',							'TXT_KEY_JFD_REFORM_LABOUR_BONDED_HELP_BONUS',						'TXT_KEY_JFD_REFORM_LABOUR_BONDED_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_LABOUR_BONDED_PEDIA',							NULL,							NULL,											'ERA_ANCIENT',			0,								0,						'POLICY_REFORM_JFD_LABOUR_BONDED'),	
		('REFORM_JFD_LABOUR_CORVEE', 							'REFORM_BRANCH_JFD_INDUSTRY',		'FLAVOR_JFD_REFORM_INDUSTRY',			0,				0,				1,				0,				0,			15,			0,				0,				1,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_LABOUR_DESC',				'TXT_KEY_JFD_REFORM_HEADER_LABOUR_HELP',				'TXT_KEY_JFD_REFORM_LABOUR_CORVEE_SHORT_DESC',						'TXT_KEY_JFD_REFORM_LABOUR_CORVEE_DESC',						'TXT_KEY_JFD_REFORM_LABOUR_CORVEE_HELP',							'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_LABOUR_CORVEE_PEDIA',							NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_LABOUR_CORVEE'),
		('REFORM_JFD_LABOUR_EMANCIPATED', 						'REFORM_BRANCH_JFD_INDUSTRY',		'FLAVOR_JFD_REFORM_INDUSTRY',			0,				0,				0,				0,				0,			30,			0,				1,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_PRODUCTION]',							'TXT_KEY_JFD_REFORM_HEADER_LABOUR_DESC',				'TXT_KEY_JFD_REFORM_HEADER_LABOUR_HELP',				'TXT_KEY_JFD_REFORM_LABOUR_EMANCIPATED_SHORT_DESC',					'TXT_KEY_JFD_REFORM_LABOUR_EMANCIPATED_DESC',					'TXT_KEY_JFD_REFORM_LABOUR_EMANCIPATED_HELP',						'TXT_KEY_JFD_REFORM_LABOUR_EMANCIPATED_HELP_BONUS',					'TXT_KEY_JFD_REFORM_LABOUR_EMANCIPATED_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_LABOUR_EMANCIPATED_PEDIA',						NULL,							NULL,											'ERA_ANCIENT',			0,								0,						'POLICY_REFORM_JFD_LABOUR_EMANCIPATED'),
		--Planning			                                                                                                            																							                                                                                                                                        		                		                                                            	                                                                        		                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                       		    								                                                                    
		('REFORM_JFD_PLANNING_RURAL', 							'REFORM_BRANCH_JFD_INDUSTRY',		'FLAVOR_JFD_REFORM_INDUSTRY',			0,				0,				0,				0,				0,			40,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_WORKER]',								'TXT_KEY_JFD_REFORM_HEADER_PLANNING_DESC',				'TXT_KEY_JFD_REFORM_HEADER_PLANNING_HELP',				'TXT_KEY_JFD_REFORM_PLANNING_RURAL_SHORT_DESC',						'TXT_KEY_JFD_REFORM_PLANNING_RURAL_DESC',						'TXT_KEY_JFD_REFORM_PLANNING_RURAL_HELP',							'TXT_KEY_JFD_REFORM_PLANNING_RURAL_HELP_BONUS',						'TXT_KEY_JFD_REFORM_PLANNING_RURAL_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_PLANNING_RURAL_PEDIA',							NULL,							NULL,											'ERA_CLASSICAL',		0,								0,						'POLICY_REFORM_JFD_PLANNING_RURAL'),	
		('REFORM_JFD_PLANNING_BALANCED', 						'REFORM_BRANCH_JFD_INDUSTRY',		'FLAVOR_JFD_REFORM_INDUSTRY',			0,				0,				1,				0,				0,			20,			0,				0,				1,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_PLANNING_DESC',				'TXT_KEY_JFD_REFORM_HEADER_PLANNING_HELP',				'TXT_KEY_JFD_REFORM_PLANNING_BALANCED_SHORT_DESC',					'TXT_KEY_JFD_REFORM_PLANNING_BALANCED_DESC',					'TXT_KEY_JFD_REFORM_PLANNING_BALANCED_HELP',						'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_PLANNING_BALANCED_PEDIA',						NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_PLANNING_BALANCED'),
		('REFORM_JFD_PLANNING_URBAN', 							'REFORM_BRANCH_JFD_INDUSTRY',		'FLAVOR_JFD_REFORM_INDUSTRY',			0,				0,				0,				0,				0,			40,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_PRODUCTION]',							'TXT_KEY_JFD_REFORM_HEADER_PLANNING_DESC',				'TXT_KEY_JFD_REFORM_HEADER_PLANNING_HELP',				'TXT_KEY_JFD_REFORM_PLANNING_URBAN_SHORT_DESC',						'TXT_KEY_JFD_REFORM_PLANNING_URBAN_DESC',						'TXT_KEY_JFD_REFORM_PLANNING_URBAN_HELP',							'TXT_KEY_JFD_REFORM_PLANNING_URBAN_HELP_BONUS',						'TXT_KEY_JFD_REFORM_PLANNING_URBAN_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_PLANNING_URBAN_PEDIA',							NULL,							NULL,											'ERA_CLASSICAL',		0,								0,						'POLICY_REFORM_JFD_PLANNING_URBAN'),
		--Patents                                                                                                               	    																							                                                                                                                                        		                		                                                            	                                                                        		                                                            		                		                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                       		    								                                                                                    
		('REFORM_JFD_PATENTS_UNLIMITED', 						'REFORM_BRANCH_JFD_INDUSTRY',		'FLAVOR_JFD_REFORM_INDUSTRY',			0,				0,				0,				0,				0,			50,			0,				1,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						-30,					'REFORM_RIGHT',		'[ICON_RESEARCH]',								'TXT_KEY_JFD_REFORM_HEADER_PATENTS_DESC',				'TXT_KEY_JFD_REFORM_HEADER_PATENTS_HELP',				'TXT_KEY_JFD_REFORM_PATENTS_UNLIMITED_SHORT_DESC',					'TXT_KEY_JFD_REFORM_PATENTS_UNLIMITED_DESC',					'TXT_KEY_JFD_REFORM_PATENTS_UNLIMITED_HELP',						'TXT_KEY_JFD_REFORM_PATENTS_UNLIMITED_HELP_BONUS',					'TXT_KEY_JFD_REFORM_PATENTS_UNLIMITED_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_PATENTS_UNLIMITED_PEDIA',						NULL,							NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_PATENTS_UNLIMITED'),	
		('REFORM_JFD_PATENTS_LETTERS', 							'REFORM_BRANCH_JFD_INDUSTRY',		'FLAVOR_JFD_REFORM_INDUSTRY',			0,				0,				1,				0,				0,			25,			1,				0,				1,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_PATENTS_DESC',				'TXT_KEY_JFD_REFORM_HEADER_PATENTS_HELP',				'TXT_KEY_JFD_REFORM_PATENTS_LETTERS_SHORT_DESC',					'TXT_KEY_JFD_REFORM_PATENTS_LETTERS_DESC',						'TXT_KEY_JFD_REFORM_PATENTS_LETTERS_HELP',							'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_PATENTS_LETTERS_PEDIA',							NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_PATENTS_LETTERS'),
		('REFORM_JFD_PATENTS_LIMITED', 							'REFORM_BRANCH_JFD_INDUSTRY',		'FLAVOR_JFD_REFORM_INDUSTRY',			0,				0,				0,				0,				0,			50,			0,				1,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						30,						'REFORM_LEFT',		'[ICON_RESEARCH]',								'TXT_KEY_JFD_REFORM_HEADER_PATENTS_DESC',				'TXT_KEY_JFD_REFORM_HEADER_PATENTS_HELP',				'TXT_KEY_JFD_REFORM_PATENTS_LIMITED_SHORT_DESC',					'TXT_KEY_JFD_REFORM_PATENTS_LIMITED_DESC',						'TXT_KEY_JFD_REFORM_PATENTS_LIMITED_HELP',							'TXT_KEY_JFD_REFORM_PATENTS_LIMITED_HELP_BONUS',					'TXT_KEY_JFD_REFORM_PATENTS_LIMITED_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_PATENTS_LIMITED_PEDIA',							NULL,							NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_PATENTS_LIMITED'),	
		--Scholarship	                                                                                                                																							                                                                                                                                        		                		                                                            	                                                                        		                                                                            				                                                    	                                               	    	                                                                                                                                                                                                                                                                                                                                                                                               		    								                                                                        
		('REFORM_JFD_SCHOLARSHIP_ENGINEERING', 					'REFORM_BRANCH_JFD_INDUSTRY',		'FLAVOR_JFD_REFORM_INDUSTRY',			0,				0,				0,				0,				0,			60,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_GREAT_PEOPLE]',							'TXT_KEY_JFD_REFORM_HEADER_SCHOLARSHIP_DESC',			'TXT_KEY_JFD_REFORM_HEADER_SCHOLARSHIP_HELP',			'TXT_KEY_JFD_REFORM_SCHOLARSHIP_ENGINEERING_SHORT_DESC',			'TXT_KEY_JFD_REFORM_SCHOLARSHIP_ENGINEERING_DESC',				'TXT_KEY_JFD_REFORM_SCHOLARSHIP_ENGINEERING_HELP',					'TXT_KEY_JFD_REFORM_SCHOLARSHIP_ENGINEERING_HELP_BONUS',			'TXT_KEY_JFD_REFORM_SCHOLARSHIP_ENGINEERING_HELP_PENALTY',			NULL,												NULL,													'TXT_KEY_JFD_REFORM_SCHOLARSHIP_ENGINEERING_PEDIA',					NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_SCHOLARSHIP_ENGINEERING'),	
		('REFORM_JFD_SCHOLARSHIP_NONE', 						'REFORM_BRANCH_JFD_INDUSTRY',		'FLAVOR_JFD_REFORM_INDUSTRY',			0,				0,				1,				0,				0,			30,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_SCHOLARSHIP_DESC',			'TXT_KEY_JFD_REFORM_HEADER_SCHOLARSHIP_HELP',			'TXT_KEY_JFD_REFORM_SCHOLARSHIP_NONE_SHORT_DESC',					'TXT_KEY_JFD_REFORM_SCHOLARSHIP_NONE_DESC',						'TXT_KEY_JFD_REFORM_SCHOLARSHIP_NONE_HELP',							'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_SCHOLARSHIP_NONE_PEDIA',						NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_SCHOLARSHIP_NONE'),
		('REFORM_JFD_SCHOLARSHIP_RESEARCH', 					'REFORM_BRANCH_JFD_INDUSTRY',		'FLAVOR_JFD_REFORM_INDUSTRY',			0,				0,				0,				0,				0,			60,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_GREAT_PEOPLE]',							'TXT_KEY_JFD_REFORM_HEADER_SCHOLARSHIP_DESC',			'TXT_KEY_JFD_REFORM_HEADER_SCHOLARSHIP_HELP',			'TXT_KEY_JFD_REFORM_SCHOLARSHIP_RESEARCH_SHORT_DESC',				'TXT_KEY_JFD_REFORM_SCHOLARSHIP_RESEARCH_DESC',					'TXT_KEY_JFD_REFORM_SCHOLARSHIP_RESEARCH_HELP',						'TXT_KEY_JFD_REFORM_SCHOLARSHIP_RESEARCH_HELP_BONUS',				'TXT_KEY_JFD_REFORM_SCHOLARSHIP_RESEARCH_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_SCHOLARSHIP_RESEARCH_PEDIA',					NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_SCHOLARSHIP_RESEARCH'),
		--Education	                                                                                                                    																							                                                                                                                                        		                		                                                            	                                                                        		                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                   		    								                                                                    
		('REFORM_JFD_EDUCATION_TECHNICAL', 						'REFORM_BRANCH_JFD_INDUSTRY',		'FLAVOR_JFD_REFORM_INDUSTRY',			0,				0,				0,				0,				0,			70,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_PRODUCTION]',							'TXT_KEY_JFD_REFORM_HEADER_EDUCATION_DESC',				'TXT_KEY_JFD_REFORM_HEADER_EDUCATION_HELP',				'TXT_KEY_JFD_REFORM_EDUCATION_TECHNICAL_SHORT_DESC',				'TXT_KEY_JFD_REFORM_EDUCATION_TECHNICAL_DESC',					'TXT_KEY_JFD_REFORM_EDUCATION_TECHNICAL_HELP',						'TXT_KEY_JFD_REFORM_EDUCATION_TECHNICAL_HELP_BONUS',				'TXT_KEY_JFD_REFORM_EDUCATION_TECHNICAL_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_EDUCATION_TECHNICAL_PEDIA',						NULL,							NULL,											'ERA_INDUSTRIAL',		0,								0,						'POLICY_REFORM_JFD_EDUCATION_TECHNICAL'),	
		('REFORM_JFD_EDUCATION_NONE', 							'REFORM_BRANCH_JFD_INDUSTRY',		'FLAVOR_JFD_REFORM_INDUSTRY',			0,				0,				1,				0,				0,			45,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_EDUCATION_DESC',				'TXT_KEY_JFD_REFORM_HEADER_EDUCATION_HELP',				'TXT_KEY_JFD_REFORM_EDUCATION_NONE_SHORT_DESC',						'TXT_KEY_JFD_REFORM_EDUCATION_NONE_DESC',						'TXT_KEY_JFD_REFORM_EDUCATION_NONE_HELP',							'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_EDUCATION_NONE_PEDIA',							NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_EDUCATION_NONE'),
		('REFORM_JFD_EDUCATION_ACADEMIC', 						'REFORM_BRANCH_JFD_INDUSTRY',		'FLAVOR_JFD_REFORM_INDUSTRY',			0,				0,				0,				0,				0,			70,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_RESEARCH]',								'TXT_KEY_JFD_REFORM_HEADER_EDUCATION_DESC',				'TXT_KEY_JFD_REFORM_HEADER_EDUCATION_HELP',				'TXT_KEY_JFD_REFORM_EDUCATION_ACADEMIC_SHORT_DESC',					'TXT_KEY_JFD_REFORM_EDUCATION_ACADEMIC_DESC',					'TXT_KEY_JFD_REFORM_EDUCATION_ACADEMIC_HELP',						'TXT_KEY_JFD_REFORM_EDUCATION_ACADEMIC_HELP_BONUS',					'TXT_KEY_JFD_REFORM_EDUCATION_ACADEMIC_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_EDUCATION_ACADEMIC_PEDIA',						NULL,							NULL,											'ERA_INDUSTRIAL',		0,								0,						'POLICY_REFORM_JFD_EDUCATION_ACADEMIC'),
		--Healthcare	                                                                                                                																							                                                                                                                                        		                		                                                            	                                                                        		                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                       		    								                                                                    
		('REFORM_JFD_HEALTHCARE_PUBLIC', 						'REFORM_BRANCH_JFD_INDUSTRY',		'FLAVOR_JFD_REFORM_INDUSTRY',			0,				0,				0,				0,				0,			70,			0,				0,				1,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_JFD_HEALTH][ICON_FOOD]',					'TXT_KEY_JFD_REFORM_HEADER_HEALTHCARE_DESC',			'TXT_KEY_JFD_REFORM_HEADER_HEALTHCARE_HELP',			'TXT_KEY_JFD_REFORM_HEALTHCARE_PUBLIC_SHORT_DESC',					'TXT_KEY_JFD_REFORM_HEALTHCARE_PUBLIC_DESC',					'TXT_KEY_JFD_REFORM_HEALTHCARE_PUBLIC_HELP',						'TXT_KEY_JFD_REFORM_HEALTHCARE_PUBLIC_HELP_BONUS',					'TXT_KEY_JFD_REFORM_HEALTHCARE_PUBLIC_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_HEALTHCARE_PUBLIC_PEDIA',						NULL,							NULL,											'ERA_INDUSTRIAL',		0,								0,						'POLICY_REFORM_JFD_HEALTHCARE_PUBLIC'),	
		('REFORM_JFD_HEALTHCARE_BASIC', 						'REFORM_BRANCH_JFD_INDUSTRY',		'FLAVOR_JFD_REFORM_INDUSTRY',			0,				0,				1,				0,				0,			45,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_HEALTHCARE_DESC',			'TXT_KEY_JFD_REFORM_HEADER_HEALTHCARE_HELP',			'TXT_KEY_JFD_REFORM_HEALTHCARE_BASIC_SHORT_DESC',					'TXT_KEY_JFD_REFORM_HEALTHCARE_BASIC_DESC',						'TXT_KEY_JFD_REFORM_HEALTHCARE_BASIC_HELP',							'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_HEALTHCARE_BASIC_PEDIA',						NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_HEALTHCARE_BASIC'),
		('REFORM_JFD_HEALTHCARE_PRIVATE', 						'REFORM_BRANCH_JFD_INDUSTRY',		'FLAVOR_JFD_REFORM_INDUSTRY',			0,				0,				0,				0,				0,			70,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_JFD_CRIME_HEALTH][ICON_JFD_HEALTH]',		'TXT_KEY_JFD_REFORM_HEADER_HEALTHCARE_DESC',			'TXT_KEY_JFD_REFORM_HEADER_HEALTHCARE_HELP',			'TXT_KEY_JFD_REFORM_HEALTHCARE_PRIVATE_SHORT_DESC',					'TXT_KEY_JFD_REFORM_HEALTHCARE_PRIVATE_DESC',					'TXT_KEY_JFD_REFORM_HEALTHCARE_PRIVATE_HELP',						'TXT_KEY_JFD_REFORM_HEALTHCARE_PRIVATE_HELP_BONUS',					'TXT_KEY_JFD_REFORM_HEALTHCARE_PRIVATE_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_HEALTHCARE_PRIVATE_PEDIA',						NULL,							NULL,											'ERA_INDUSTRIAL',		0,								0,						'POLICY_REFORM_JFD_HEALTHCARE_PRIVATE'),
		--Environment	                                                                                                              																								                                                                                                                                        		                		                                                            	                                                                        		                                                                                    	                                                        	                                                    	                                                                                                                                                                                                                                                                                                                                                                                           		    								                                                                                
		('REFORM_JFD_ENVIRONMENT_PROTECTED', 					'REFORM_BRANCH_JFD_INDUSTRY',		'FLAVOR_JFD_REFORM_INDUSTRY',			0,				0,				0,				0,				0,			70,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_JFD_HEALTH][ICON_RESEARCH]',				'TXT_KEY_JFD_REFORM_HEADER_ENVIRONMENT_DESC',			'TXT_KEY_JFD_REFORM_HEADER_ENVIRONMENT_HELP',			'TXT_KEY_JFD_REFORM_ENVIRONMENT_PROTECTED_SHORT_DESC',				'TXT_KEY_JFD_REFORM_ENVIRONMENT_PROTECTED_DESC',				'TXT_KEY_JFD_REFORM_ENVIRONMENT_PROTECTED_HELP',					'TXT_KEY_JFD_REFORM_ENVIRONMENT_PROTECTED_HELP_BONUS',				'TXT_KEY_JFD_REFORM_ENVIRONMENT_PROTECTED_HELP_PENALTY',			NULL,												NULL,													'TXT_KEY_JFD_REFORM_ENVIRONMENT_PROTECTED_PEDIA',					NULL,							NULL,											'ERA_INDUSTRIAL',		0,								0,						'POLICY_REFORM_JFD_ENVIRONMENT_PROTECTED'),	
		('REFORM_JFD_ENVIRONMENT_NONE', 						'REFORM_BRANCH_JFD_INDUSTRY',		'FLAVOR_JFD_REFORM_INDUSTRY',			0,				0,				1,				0,				0,			45,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_ENVIRONMENT_DESC',			'TXT_KEY_JFD_REFORM_HEADER_ENVIRONMENT_HELP',			'TXT_KEY_JFD_REFORM_ENVIRONMENT_NONE_SHORT_DESC',					'TXT_KEY_JFD_REFORM_ENVIRONMENT_NONE_DESC',						'TXT_KEY_JFD_REFORM_ENVIRONMENT_NONE_HELP',							'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_ENVIRONMENT_NONE_PEDIA',						NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_ENVIRONMENT_NONE'),
		('REFORM_JFD_ENVIRONMENT_EXTORTED', 					'REFORM_BRANCH_JFD_INDUSTRY',		'FLAVOR_JFD_REFORM_INDUSTRY',			0,				0,				0,				0,				0,			70,			0,				1,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_PRODUCTION][ICON_FOOD]',					'TXT_KEY_JFD_REFORM_HEADER_ENVIRONMENT_DESC',			'TXT_KEY_JFD_REFORM_HEADER_ENVIRONMENT_HELP',			'TXT_KEY_JFD_REFORM_ENVIRONMENT_EXTORTED_SHORT_DESC',				'TXT_KEY_JFD_REFORM_ENVIRONMENT_EXTORTED_DESC',					'TXT_KEY_JFD_REFORM_ENVIRONMENT_EXTORTED_HELP',						'TXT_KEY_JFD_REFORM_ENVIRONMENT_EXTORTED_HELP_BONUS',				'TXT_KEY_JFD_REFORM_ENVIRONMENT_EXTORTED_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_ENVIRONMENT_EXTORTED_PEDIA',					NULL,							NULL,											'ERA_INDUSTRIAL',		0,								0,						'POLICY_REFORM_JFD_ENVIRONMENT_EXTORTED'),
		--Property			                                                                                                            																							                                                                                                                                        		                		                                                            	                                                                        		                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                       		    								                                                                    
		('REFORM_JFD_PROPERTY_STATE', 							'REFORM_BRANCH_JFD_INDUSTRY',		'FLAVOR_JFD_REFORM_INDUSTRY',			0,				0,				0,				0,				0,			70,			0,				0,				1,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_PRODUCTION]',							'TXT_KEY_JFD_REFORM_HEADER_PROPERTY_DESC',				'TXT_KEY_JFD_REFORM_HEADER_PROPERTY_HELP',				'TXT_KEY_JFD_REFORM_PROPERTY_STATE_SHORT_DESC',						'TXT_KEY_JFD_REFORM_PROPERTY_STATE_DESC',						'TXT_KEY_JFD_REFORM_PROPERTY_STATE_HELP',							'TXT_KEY_JFD_REFORM_PROPERTY_STATE_HELP_BONUS',						'TXT_KEY_JFD_REFORM_PROPERTY_STATE_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_PROPERTY_STATE_PEDIA',							NULL,							NULL,											'ERA_INDUSTRIAL',		0,								0,						'POLICY_REFORM_JFD_PROPERTY_STATE'),
		('REFORM_JFD_PROPERTY_PERSONAL', 						'REFORM_BRANCH_JFD_INDUSTRY',		'FLAVOR_JFD_REFORM_INDUSTRY',			0,				0,				1,				0,				0,			45,			1,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_PROPERTY_DESC',				'TXT_KEY_JFD_REFORM_HEADER_PROPERTY_HELP',				'TXT_KEY_JFD_REFORM_PROPERTY_PERSONAL_SHORT_DESC',					'TXT_KEY_JFD_REFORM_PROPERTY_PERSONAL_DESC',					'TXT_KEY_JFD_REFORM_PROPERTY_PERSONAL_HELP',						'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_PROPERTY_PERSONAL_PEDIA',						NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_PROPERTY_PERSONAL'),
		('REFORM_JFD_PROPERTY_PRIVATE', 						'REFORM_BRANCH_JFD_INDUSTRY',		'FLAVOR_JFD_REFORM_INDUSTRY',			0,				0,				0,				0,				0,			70,			0,				1,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_INVEST]',								'TXT_KEY_JFD_REFORM_HEADER_PROPERTY_DESC',				'TXT_KEY_JFD_REFORM_HEADER_PROPERTY_HELP',				'TXT_KEY_JFD_REFORM_PROPERTY_PRIVATE_SHORT_DESC',					'TXT_KEY_JFD_REFORM_PROPERTY_PRIVATE_DESC',						'TXT_KEY_JFD_REFORM_PROPERTY_PRIVATE_HELP',							'TXT_KEY_JFD_REFORM_PROPERTY_PRIVATE_HELP_BONUS',					'TXT_KEY_JFD_REFORM_PROPERTY_PRIVATE_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_PROPERTY_PRIVATE_PEDIA',						NULL,							NULL,											'ERA_INDUSTRIAL',		0,								0,						'POLICY_REFORM_JFD_PROPERTY_PRIVATE'),	
		--Trade Unions	                                                                                                          	    																							                                                                                                                        												                                                            	                                                        						                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                       		    								                                                                    
		('REFORM_JFD_TRADE_UNIONS_STATE', 						'REFORM_BRANCH_JFD_INDUSTRY',		'FLAVOR_JFD_REFORM_INDUSTRY',			0,				0,				0,				0,				0,			70,			0,				0,				1,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						-30,					'REFORM_RIGHT',		'[ICON_JFD_ANARCHY]',							'TXT_KEY_JFD_REFORM_HEADER_TRADE_UNIONS_DESC',			'TXT_KEY_JFD_REFORM_HEADER_TRADE_UNIONS_HELP',			'TXT_KEY_JFD_REFORM_TRADE_UNIONS_STATE_SHORT_DESC',					'TXT_KEY_JFD_REFORM_TRADE_UNIONS_STATE_DESC',					'TXT_KEY_JFD_REFORM_TRADE_UNIONS_STATE_HELP',						'TXT_KEY_JFD_REFORM_TRADE_UNIONS_STATE_HELP_BONUS',					'TXT_KEY_JFD_REFORM_TRADE_UNIONS_STATE_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_TRADE_UNIONS_STATE_PEDIA',						NULL,							NULL,											'ERA_INDUSTRIAL',		0,								0,						'POLICY_REFORM_JFD_TRADE_UNIONS_STATE'),	
		('REFORM_JFD_TRADE_UNIONS_NONE', 						'REFORM_BRANCH_JFD_INDUSTRY',		'FLAVOR_JFD_REFORM_INDUSTRY',			0,				0,				1,				0,				0,			45,			1,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_TRADE_UNIONS_DESC',			'TXT_KEY_JFD_REFORM_HEADER_TRADE_UNIONS_HELP',			'TXT_KEY_JFD_REFORM_TRADE_UNIONS_NONE_SHORT_DESC',					'TXT_KEY_JFD_REFORM_TRADE_UNIONS_NONE_DESC',					'TXT_KEY_JFD_REFORM_TRADE_UNIONS_NONE_HELP',						'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_TRADE_UNIONS_NONE_PEDIA',						NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_TRADE_UNIONS_NONE'),
		('REFORM_JFD_TRADE_UNIONS_FREE', 						'REFORM_BRANCH_JFD_INDUSTRY',		'FLAVOR_JFD_REFORM_INDUSTRY',			0,				0,				0,				0,				0,			70,			0,				1,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						30,						'REFORM_LEFT',		'[ICON_RESISTANCE]',							'TXT_KEY_JFD_REFORM_HEADER_TRADE_UNIONS_DESC',			'TXT_KEY_JFD_REFORM_HEADER_TRADE_UNIONS_HELP',			'TXT_KEY_JFD_REFORM_TRADE_UNIONS_FREE_SHORT_DESC',					'TXT_KEY_JFD_REFORM_TRADE_UNIONS_FREE_DESC',					'TXT_KEY_JFD_REFORM_TRADE_UNIONS_FREE_HELP',						'TXT_KEY_JFD_REFORM_TRADE_UNIONS_FREE_HELP_BONUS',					'TXT_KEY_JFD_REFORM_TRADE_UNIONS_FREE_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_TRADE_UNIONS_FREE_PEDIA',						NULL,							NULL,											'ERA_INDUSTRIAL',		0,								0,						'POLICY_REFORM_JFD_TRADE_UNIONS_FREE');	
					
--Military							
INSERT INTO JFD_Reforms							
		(Type, 													ReformBranchType,					ReformFlavourType,						IsDisabled,		IsSovereignty,	DefaultActive,	IsLegislature,	IsTitled,	Cost,		AutocracyIndex,	FreedomIndex,	OrderIndex,		MaxSovChange,		FactionSovMod,	ReformCooldownMod,	ReformCostMod,	ReformCostModPerCity,	ReformCostModPerPop,	ResetsAssembly,		ResetsHolySynod,	ResetsImperialCourt,	ResetsImperialDiet,	ResetsParliament,	ResetsSenate,	ResetsLegislature,		AnarchySentimentMod,	Alignment,			FocusIcon,										HeaderDescription, 										HeaderHelp,												ShortDescription,													Description,													Help,																HelpBonus,															HelpPenalty,														LegislatureHelp,									LegislatureIdeologyHelp,								Pedia,																PrereqGovernment, 				PrereqReform,									PrereqEra, 				RequiresNumCityStateFriends,	RequiresStateReligion,	PolicyType)
VALUES	--Slavery	                                                                                                            	    																							                                                                                                                                                                                                                                    	                                                                                                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                   		    								
		('REFORM_JFD_SLAVERY_ELITE', 							'REFORM_BRANCH_JFD_MILITARY',		'FLAVOR_JFD_REFORM_MILITARY',			0,				0,				0,				0,				0,			30,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_WAR][ICON_JFD_SHACKLES]',				'TXT_KEY_JFD_REFORM_HEADER_SLAVERY_DESC',				'TXT_KEY_JFD_REFORM_HEADER_SLAVERY_HELP',				'TXT_KEY_JFD_REFORM_SLAVERY_ELITE_SHORT_DESC',						'TXT_KEY_JFD_REFORM_SLAVERY_ELITE_DESC',						'TXT_KEY_JFD_REFORM_SLAVERY_ELITE_HELP',							'TXT_KEY_JFD_REFORM_SLAVERY_ELITE_HELP_BONUS',						'TXT_KEY_JFD_REFORM_SLAVERY_ELITE_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_SLAVERY_ELITE_PEDIA',							NULL,							NULL,											'ERA_ANCIENT',			0,								0,						'POLICY_REFORM_JFD_SLAVERY_ELITE'),	
		('REFORM_JFD_SLAVERY_STANDARD', 						'REFORM_BRANCH_JFD_MILITARY',		'FLAVOR_JFD_REFORM_MILITARY',			0,				0,				1,				0,				0,			15,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_SLAVERY_DESC',				'TXT_KEY_JFD_REFORM_HEADER_SLAVERY_HELP',				'TXT_KEY_JFD_REFORM_SLAVERY_STANDARD_SHORT_DESC',					'TXT_KEY_JFD_REFORM_SLAVERY_STANDARD_DESC',						'TXT_KEY_JFD_REFORM_SLAVERY_STANDARD_HELP',							'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_SLAVERY_STANDARD_PEDIA',						NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_SLAVERY_STANDARD'),
		('REFORM_JFD_SLAVERY_DISPOSABLE', 						'REFORM_BRANCH_JFD_MILITARY',		'FLAVOR_JFD_REFORM_MILITARY',			0,				0,				0,				0,				0,			30,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_WAR][ICON_JFD_SHACKLES]',				'TXT_KEY_JFD_REFORM_HEADER_SLAVERY_DESC',				'TXT_KEY_JFD_REFORM_HEADER_SLAVERY_HELP',				'TXT_KEY_JFD_REFORM_SLAVERY_DISPOSABLE_SHORT_DESC',					'TXT_KEY_JFD_REFORM_SLAVERY_DISPOSABLE_DESC',					'TXT_KEY_JFD_REFORM_SLAVERY_DISPOSABLE_HELP',						'TXT_KEY_JFD_REFORM_SLAVERY_DISPOSABLE_HELP_BONUS',					'TXT_KEY_JFD_REFORM_SLAVERY_DISPOSABLE_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_SLAVERY_DISPOSABLE_PEDIA',						NULL,							NULL,											'ERA_ANCIENT',			0,								0,						'POLICY_REFORM_JFD_SLAVERY_DISPOSABLE'),
		--Conflict																																																					                                                                                                                                        		                		                                                            	                                                                        		                                                                            				                                                    	                                                		                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
		('REFORM_JFD_CONFLICT_OFFENSE', 						'REFORM_BRANCH_JFD_MILITARY',		'FLAVOR_JFD_REFORM_MILITARY',			0,				0,				0,				0,				0,			30,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_PRODUCTION][ICON_WAR]',					'TXT_KEY_JFD_REFORM_HEADER_CONFLICT_DESC',				'TXT_KEY_JFD_REFORM_HEADER_CONFLICT_HELP',				'TXT_KEY_JFD_REFORM_CONFLICT_OFFENSE_SHORT_DESC',					'TXT_KEY_JFD_REFORM_CONFLICT_OFFENSE_DESC',						'TXT_KEY_JFD_REFORM_CONFLICT_OFFENSE_HELP',							'TXT_KEY_JFD_REFORM_CONFLICT_OFFENSE_HELP_BONUS',					'TXT_KEY_JFD_REFORM_CONFLICT_OFFENSE_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_CONFLICT_OFFENSE_PEDIA',						NULL,							NULL,											'ERA_CLASSICAL',		0,								0,						'POLICY_REFORM_JFD_CONFLICT_OFFENSE'),	
		('REFORM_JFD_CONFLICT_MIXED', 							'REFORM_BRANCH_JFD_MILITARY',		'FLAVOR_JFD_REFORM_MILITARY',			0,				0,				1,				0,				0,			15,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_CONFLICT_DESC',				'TXT_KEY_JFD_REFORM_HEADER_CONFLICT_HELP',				'TXT_KEY_JFD_REFORM_CONFLICT_MIXED_SHORT_DESC',						'TXT_KEY_JFD_REFORM_CONFLICT_MIXED_DESC',						'TXT_KEY_JFD_REFORM_CONFLICT_MIXED_HELP',							'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_CONFLICT_MIXED_PEDIA',							NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_CONFLICT_MIXED'),
		('REFORM_JFD_CONFLICT_DEFENSE', 						'REFORM_BRANCH_JFD_MILITARY',		'FLAVOR_JFD_REFORM_MILITARY',			0,				0,				0,				0,				0,			30,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_PRODUCTION][ICON_STRENGTH]',				'TXT_KEY_JFD_REFORM_HEADER_CONFLICT_DESC',				'TXT_KEY_JFD_REFORM_HEADER_CONFLICT_HELP',				'TXT_KEY_JFD_REFORM_CONFLICT_DEFENSE_SHORT_DESC',					'TXT_KEY_JFD_REFORM_CONFLICT_DEFENSE_DESC',						'TXT_KEY_JFD_REFORM_CONFLICT_DEFENSE_HELP',							'TXT_KEY_JFD_REFORM_CONFLICT_DEFENSE_HELP_BONUS',					'TXT_KEY_JFD_REFORM_CONFLICT_DEFENSE_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_CONFLICT_DEFENSE_PEDIA',						NULL,							NULL,											'ERA_CLASSICAL',		0,								0,						'POLICY_REFORM_JFD_CONFLICT_DEFENSE'),
		--Conquest                                                                                                                    																								                                                                                                                    	                		                						                                            	                                                                        		                                                                        		    		                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                   		    								                                                                                    
		('REFORM_JFD_CONQUEST_SUBJUGATION', 					'REFORM_BRANCH_JFD_MILITARY',		'FLAVOR_JFD_REFORM_MILITARY',			0,				0,				0,				0,				0,			30,			1,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_OCCUPIED][ICON_PRODUCTION]',				'TXT_KEY_JFD_REFORM_HEADER_CONQUEST_DESC',				'TXT_KEY_JFD_REFORM_HEADER_CONQUEST_HELP',				'TXT_KEY_JFD_REFORM_CONQUEST_SUBJUGATION_SHORT_DESC',				'TXT_KEY_JFD_REFORM_CONQUEST_SUBJUGATION_DESC',					'TXT_KEY_JFD_REFORM_CONQUEST_SUBJUGATION_HELP',						'TXT_KEY_JFD_REFORM_CONQUEST_SUBJUGATION_HELP_BONUS',				'TXT_KEY_JFD_REFORM_CONQUEST_SUBJUGATION_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_CONQUEST_SUBJUGATION_PEDIA',					NULL,							NULL,											'ERA_CLASSICAL',		0,								0,						'POLICY_REFORM_JFD_CONQUEST_SUBJUGATION'),	
		('REFORM_JFD_CONQUEST_ASSIMILATION', 					'REFORM_BRANCH_JFD_MILITARY',		'FLAVOR_JFD_REFORM_MILITARY',			0,				0,				1,				0,				0,			15,			0,				0,				1,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_CONQUEST_DESC',				'TXT_KEY_JFD_REFORM_HEADER_CONQUEST_HELP',				'TXT_KEY_JFD_REFORM_CONQUEST_ASSIMILATION_SHORT_DESC',				'TXT_KEY_JFD_REFORM_CONQUEST_ASSIMILATION_DESC',				'TXT_KEY_JFD_REFORM_CONQUEST_ASSIMILATION_HELP',					'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_CONQUEST_ASSIMILATION_PEDIA',					NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_CONQUEST_ASSIMILATION'),
		('REFORM_JFD_CONQUEST_COOPTATION', 						'REFORM_BRANCH_JFD_MILITARY',		'FLAVOR_JFD_REFORM_MILITARY',			0,				0,				0,				0,				0,			30,			0,				1,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_OCCUPIED][ICON_HAPPINESS_4]',			'TXT_KEY_JFD_REFORM_HEADER_CONQUEST_DESC',				'TXT_KEY_JFD_REFORM_HEADER_CONQUEST_HELP',				'TXT_KEY_JFD_REFORM_CONQUEST_COOPTATION_SHORT_DESC',				'TXT_KEY_JFD_REFORM_CONQUEST_COOPTATION_DESC',					'TXT_KEY_JFD_REFORM_CONQUEST_COOPTATION_HELP',						'TXT_KEY_JFD_REFORM_CONQUEST_COOPTATION_HELP_BONUS',				'TXT_KEY_JFD_REFORM_CONQUEST_COOPTATION_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_CONQUEST_COOPTATION_PEDIA',						NULL,							NULL,											'ERA_CLASSICAL',		0,								0,						'POLICY_REFORM_JFD_CONQUEST_COOPTATION'),
		--Levies	                                                                                                                    																							                                                                                                                                        		                		                                                            	                                                                        		                                                                        		    		                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                               		    								                                                                                        
		('REFORM_JFD_LEVIES_FRONTLINE', 						'REFORM_BRANCH_JFD_MILITARY',		'FLAVOR_JFD_REFORM_MILITARY',			0,				0,				0,				0,				0,			50,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_JFD_LEVIES]',							'TXT_KEY_JFD_REFORM_HEADER_LEVIES_DESC',				'TXT_KEY_JFD_REFORM_HEADER_LEVIES_HELP',				'TXT_KEY_JFD_REFORM_LEVIES_FRONTLINE_SHORT_DESC',					'TXT_KEY_JFD_REFORM_LEVIES_FRONTLINE_DESC',						'TXT_KEY_JFD_REFORM_LEVIES_FRONTLINE_HELP',							'TXT_KEY_JFD_REFORM_LEVIES_FRONTLINE_HELP_BONUS',					'TXT_KEY_JFD_REFORM_LEVIES_FRONTLINE_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_LEVIES_FRONTLINE_PEDIA',						NULL,							NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_LEVIES_FRONTLINE'),	
		('REFORM_JFD_LEVIES_STANDARD', 							'REFORM_BRANCH_JFD_MILITARY',		'FLAVOR_JFD_REFORM_MILITARY',			0,				0,				1,				0,				0,			25,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_LEVIES_DESC',				'TXT_KEY_JFD_REFORM_HEADER_LEVIES_HELP',				'TXT_KEY_JFD_REFORM_LEVIES_STANDARD_SHORT_DESC',					'TXT_KEY_JFD_REFORM_LEVIES_STANDARD_DESC',						'TXT_KEY_JFD_REFORM_LEVIES_STANDARD_HELP',							'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_LEVIES_STANDARD_PEDIA',							NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_LEVIES_STANDARD'),
		('REFORM_JFD_LEVIES_RESERVE', 							'REFORM_BRANCH_JFD_MILITARY',		'FLAVOR_JFD_REFORM_MILITARY',			0,				0,				0,				0,				0,			50,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_STRENGTH]',								'TXT_KEY_JFD_REFORM_HEADER_LEVIES_DESC',				'TXT_KEY_JFD_REFORM_HEADER_LEVIES_HELP',				'TXT_KEY_JFD_REFORM_LEVIES_RESERVE_SHORT_DESC',						'TXT_KEY_JFD_REFORM_LEVIES_RESERVE_DESC',						'TXT_KEY_JFD_REFORM_LEVIES_RESERVE_HELP',							'TXT_KEY_JFD_REFORM_LEVIES_RESERVE_HELP_BONUS',						'TXT_KEY_JFD_REFORM_LEVIES_RESERVE_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_LEVIES_RESERVE_PEDIA',							NULL,							NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_LEVIES_RESERVE'),
		--Recruitment	                                                                                                                																							                                                                                                                                        		                		                                                            	                                                                        		                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                       		    									                                                                            
		('REFORM_JFD_RECRUITMENT_PROFESSIONAL', 				'REFORM_BRANCH_JFD_MILITARY',		'FLAVOR_JFD_REFORM_MILITARY',			0,				0,				0,				0,				0,			50,			1,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_WAR]',									'TXT_KEY_JFD_REFORM_HEADER_RECRUITMENT_DESC',			'TXT_KEY_JFD_REFORM_HEADER_RECRUITMENT_HELP',			'TXT_KEY_JFD_REFORM_RECRUITMENT_PROFESSIONAL_SHORT_DESC',			'TXT_KEY_JFD_REFORM_RECRUITMENT_PROFESSIONAL_DESC',				'TXT_KEY_JFD_REFORM_RECRUITMENT_PROFESSIONAL_HELP',					'TXT_KEY_JFD_REFORM_RECRUITMENT_PROFESSIONAL_HELP_BONUS',			'TXT_KEY_JFD_REFORM_RECRUITMENT_PROFESSIONAL_HELP_PENALTY',			NULL,												NULL,													'TXT_KEY_JFD_REFORM_RECRUITMENT_PROFESSIONAL_PEDIA',				NULL,							NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_RECRUITMENT_PROFESSIONAL'),	
		('REFORM_JFD_RECRUITMENT_CONSCRIPT', 					'REFORM_BRANCH_JFD_MILITARY',		'FLAVOR_JFD_REFORM_MILITARY',			0,				0,				1,				0,				0,			25,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_RECRUITMENT_DESC',			'TXT_KEY_JFD_REFORM_HEADER_RECRUITMENT_HELP',			'TXT_KEY_JFD_REFORM_RECRUITMENT_CONSCRIPT_SHORT_DESC',				'TXT_KEY_JFD_REFORM_RECRUITMENT_CONSCRIPT_DESC',				'TXT_KEY_JFD_REFORM_RECRUITMENT_CONSCRIPT_HELP',					'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_RECRUITMENT_CONSCRIPT_PEDIA',					NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_RECRUITMENT_CONSCRIPT'),
		('REFORM_JFD_RECRUITMENT_MERCENARY', 					'REFORM_BRANCH_JFD_MILITARY',		'FLAVOR_JFD_REFORM_MILITARY',			0,				0,				0,				0,				0,			50,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_JFD_MERCENARY]',							'TXT_KEY_JFD_REFORM_HEADER_RECRUITMENT_DESC',			'TXT_KEY_JFD_REFORM_HEADER_RECRUITMENT_HELP',			'TXT_KEY_JFD_REFORM_RECRUITMENT_MERCENARY_SHORT_DESC',				'TXT_KEY_JFD_REFORM_RECRUITMENT_MERCENARY_DESC',				'TXT_KEY_JFD_REFORM_RECRUITMENT_MERCENARY_HELP',					'TXT_KEY_JFD_REFORM_RECRUITMENT_MERCENARY_HELP_BONUS',				'TXT_KEY_JFD_REFORM_RECRUITMENT_MERCENARY_HELP_PENALTY',			NULL,												NULL,													'TXT_KEY_JFD_REFORM_RECRUITMENT_MERCENARY_PEDIA',					NULL,							NULL,											'ERA_MEDIEVAL',			0,								0,						'POLICY_REFORM_JFD_RECRUITMENT_MERCENARY'),
		--Command	                                                                                                                    																							                                                                                                                                        		                		                                                            	                                                                        		                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                       		    								                                                                                
		('REFORM_JFD_COMMAND_SOVEREIGN', 						'REFORM_BRANCH_JFD_MILITARY',		'FLAVOR_JFD_REFORM_MILITARY',			0,				0,				0,				0,				0,			60,			1,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_STRENGTH]',								'TXT_KEY_JFD_REFORM_HEADER_COMMAND_DESC',				'TXT_KEY_JFD_REFORM_HEADER_COMMAND_HELP',				'TXT_KEY_JFD_REFORM_COMMAND_SOVEREIGN_SHORT_DESC',					'TXT_KEY_JFD_REFORM_COMMAND_SOVEREIGN_DESC',					'TXT_KEY_JFD_REFORM_COMMAND_SOVEREIGN_HELP',						'TXT_KEY_JFD_REFORM_COMMAND_SOVEREIGN_HELP_BONUS',					'TXT_KEY_JFD_REFORM_COMMAND_SOVEREIGN_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_COMMAND_SOVEREIGN_PEDIA',						NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_COMMAND_SOVEREIGN'),	
		('REFORM_JFD_COMMAND_MILITARY', 						'REFORM_BRANCH_JFD_MILITARY',		'FLAVOR_JFD_REFORM_MILITARY',			0,				0,				1,				0,				0,			30,			1,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_COMMAND_DESC',				'TXT_KEY_JFD_REFORM_HEADER_COMMAND_HELP',				'TXT_KEY_JFD_REFORM_COMMAND_MILITARY_SHORT_DESC',					'TXT_KEY_JFD_REFORM_COMMAND_MILITARY_DESC',						'TXT_KEY_JFD_REFORM_COMMAND_MILITARY_HELP',							'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_COMMAND_MILITARY_PEDIA',						NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_COMMAND_MILITARY'),
		('REFORM_JFD_COMMAND_STATE', 							'REFORM_BRANCH_JFD_MILITARY',		'FLAVOR_JFD_REFORM_MILITARY',			0,				0,				0,				0,				0,			60,			0,				0,				1,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_STRENGTH]',								'TXT_KEY_JFD_REFORM_HEADER_COMMAND_DESC',				'TXT_KEY_JFD_REFORM_HEADER_COMMAND_HELP',				'TXT_KEY_JFD_REFORM_COMMAND_STATE_SHORT_DESC',						'TXT_KEY_JFD_REFORM_COMMAND_STATE_DESC',						'TXT_KEY_JFD_REFORM_COMMAND_STATE_HELP',							'TXT_KEY_JFD_REFORM_COMMAND_STATE_HELP_BONUS',						'TXT_KEY_JFD_REFORM_COMMAND_STATE_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_COMMAND_STATE_PEDIA',							NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_COMMAND_STATE'),
		--Technology	                                                                                                              																								                                                                                                                                        		                		                                                            	                                                                        		                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                       		    								                                                                                
		('REFORM_JFD_TECHNOLOGY_TACTICS', 						'REFORM_BRANCH_JFD_MILITARY',		'FLAVOR_JFD_REFORM_MILITARY',			0,				0,				0,				0,				0,			60,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_WAR]',									'TXT_KEY_JFD_REFORM_HEADER_TECHNOLOGY_DESC',			'TXT_KEY_JFD_REFORM_HEADER_TECHNOLOGY_HELP',			'TXT_KEY_JFD_REFORM_TECHNOLOGY_TACTICS_SHORT_DESC',					'TXT_KEY_JFD_REFORM_TECHNOLOGY_TACTICS_DESC',					'TXT_KEY_JFD_REFORM_TECHNOLOGY_TACTICS_HELP',						'TXT_KEY_JFD_REFORM_TECHNOLOGY_TACTICS_HELP_BONUS',					'TXT_KEY_JFD_REFORM_TECHNOLOGY_TACTICS_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_TECHNOLOGY_TACTICS_PEDIA',						NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_TECHNOLOGY_TACTICS'),	
		('REFORM_JFD_TECHNOLOGY_BALANCED', 						'REFORM_BRANCH_JFD_MILITARY',		'FLAVOR_JFD_REFORM_MILITARY',			0,				0,				1,				0,				0,			30,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_TECHNOLOGY_DESC',			'TXT_KEY_JFD_REFORM_HEADER_TECHNOLOGY_HELP',			'TXT_KEY_JFD_REFORM_TECHNOLOGY_BALANCED_SHORT_DESC',				'TXT_KEY_JFD_REFORM_TECHNOLOGY_BALANCED_DESC',					'TXT_KEY_JFD_REFORM_TECHNOLOGY_BALANCED_HELP',						'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_TECHNOLOGY_BALANCED_PEDIA',						NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_TECHNOLOGY_BALANCED'),
		('REFORM_JFD_TECHNOLOGY_EQUIPMENT', 					'REFORM_BRANCH_JFD_MILITARY',		'FLAVOR_JFD_REFORM_MILITARY',			0,				0,				0,				0,				0,			60,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_WAR]',									'TXT_KEY_JFD_REFORM_HEADER_TECHNOLOGY_DESC',			'TXT_KEY_JFD_REFORM_HEADER_TECHNOLOGY_HELP',			'TXT_KEY_JFD_REFORM_TECHNOLOGY_EQUIPMENT_SHORT_DESC',				'TXT_KEY_JFD_REFORM_TECHNOLOGY_EQUIPMENT_DESC',					'TXT_KEY_JFD_REFORM_TECHNOLOGY_EQUIPMENT_HELP',						'TXT_KEY_JFD_REFORM_TECHNOLOGY_EQUIPMENT_HELP_BONUS',				'TXT_KEY_JFD_REFORM_TECHNOLOGY_EQUIPMENT_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_TECHNOLOGY_EQUIPMENT_PEDIA',					NULL,							NULL,											'ERA_RENAISSANCE',		0,								0,						'POLICY_REFORM_JFD_TECHNOLOGY_EQUIPMENT'),
		--Police	                                                                                                              	    																							                                                                                                                                        		                		                                                            	                                                                        		                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                   		    								                                                                                    
		('REFORM_JFD_POLICE_MILITARY', 							'REFORM_BRANCH_JFD_MILITARY',		'FLAVOR_JFD_REFORM_MILITARY',			0,				0,				0,				0,				0,			70,			1,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_JFD_RED_FIST][ICON_JFD_REVOLT]',			'TXT_KEY_JFD_REFORM_HEADER_POLICE_DESC',				'TXT_KEY_JFD_REFORM_HEADER_POLICE_HELP',				'TXT_KEY_JFD_REFORM_POLICE_MILITARY_SHORT_DESC',					'TXT_KEY_JFD_REFORM_POLICE_MILITARY_DESC',						'TXT_KEY_JFD_REFORM_POLICE_MILITARY_HELP',							'TXT_KEY_JFD_REFORM_POLICE_MILITARY_HELP_BONUS',					'TXT_KEY_JFD_REFORM_POLICE_MILITARY_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_POLICE_MILITARY_PEDIA',							NULL,							NULL,											'ERA_INDUSTRIAL',		0,								0,						'POLICY_REFORM_JFD_POLICE_MILITARY'),	
		('REFORM_JFD_POLICE_VOLUNTEER', 						'REFORM_BRANCH_JFD_MILITARY',		'FLAVOR_JFD_REFORM_MILITARY',			0,				0,				1,				0,				0,			45,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_POLICE_DESC',				'TXT_KEY_JFD_REFORM_HEADER_POLICE_HELP',				'TXT_KEY_JFD_REFORM_POLICE_VOLUNTEER_SHORT_DESC',					'TXT_KEY_JFD_REFORM_POLICE_VOLUNTEER_DESC',						'TXT_KEY_JFD_REFORM_POLICE_VOLUNTEER_HELP',							'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_POLICE_VOLUNTEER_PEDIA',						NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_POLICE_VOLUNTEER'),
		('REFORM_JFD_POLICE_CIVILIAN', 							'REFORM_BRANCH_JFD_MILITARY',		'FLAVOR_JFD_REFORM_MILITARY',			0,				0,				0,				0,				0,			70,			0,				1,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_JFD_CRIME_TOURISM][ICON_TOURISM]',		'TXT_KEY_JFD_REFORM_HEADER_POLICE_DESC',				'TXT_KEY_JFD_REFORM_HEADER_POLICE_HELP',				'TXT_KEY_JFD_REFORM_POLICE_CIVILIAN_SHORT_DESC',					'TXT_KEY_JFD_REFORM_POLICE_CIVILIAN_DESC',						'TXT_KEY_JFD_REFORM_POLICE_CIVILIAN_HELP',							'TXT_KEY_JFD_REFORM_POLICE_CIVILIAN_HELP_BONUS',					'TXT_KEY_JFD_REFORM_POLICE_CIVILIAN_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_POLICE_CIVILIAN_PEDIA',							NULL,							NULL,											'ERA_INDUSTRIAL',		0,								0,						'POLICY_REFORM_JFD_POLICE_CIVILIAN'),
		--Weapons 	                                                                                                                    																							                                                                                                                        												                                                            	                                                        						                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                               		    								                                                                                        
		('REFORM_JFD_WEAPONS_LOCAL', 							'REFORM_BRANCH_JFD_MILITARY',		'FLAVOR_JFD_REFORM_MILITARY',			0,				0,				0,				0,				0,			70,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_WAR][ICON_PRODUCTION]',					'TXT_KEY_JFD_REFORM_HEADER_WEAPONS_DESC',				'TXT_KEY_JFD_REFORM_HEADER_WEAPONS_HELP',				'TXT_KEY_JFD_REFORM_WEAPONS_LOCAL_SHORT_DESC',						'TXT_KEY_JFD_REFORM_WEAPONS_LOCAL_DESC',						'TXT_KEY_JFD_REFORM_WEAPONS_LOCAL_HELP',							'TXT_KEY_JFD_REFORM_WEAPONS_LOCAL_HELP_BONUS',						'TXT_KEY_JFD_REFORM_WEAPONS_LOCAL_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_WEAPONS_LOCAL_PEDIA',							NULL,							NULL,											'ERA_INDUSTRIAL',		0,								0,						'POLICY_REFORM_JFD_WEAPONS_LOCAL'),	
		('REFORM_JFD_WEAPONS_MIXED', 							'REFORM_BRANCH_JFD_MILITARY',		'FLAVOR_JFD_REFORM_MILITARY',			0,				0,				1,				0,				0,			45,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_WEAPONS_DESC',				'TXT_KEY_JFD_REFORM_HEADER_WEAPONS_HELP',				'TXT_KEY_JFD_REFORM_WEAPONS_MIXED_SHORT_DESC',						'TXT_KEY_JFD_REFORM_WEAPONS_MIXED_DESC',						'TXT_KEY_JFD_REFORM_WEAPONS_MIXED_HELP',							'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_WEAPONS_MIXED_PEDIA',							NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_WEAPONS_MIXED'),
		('REFORM_JFD_WEAPONS_FOREIGN', 							'REFORM_BRANCH_JFD_MILITARY',		'FLAVOR_JFD_REFORM_MILITARY',			0,				0,				0,				0,				0,			70,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_WAR][ICON_GOLD]',						'TXT_KEY_JFD_REFORM_HEADER_WEAPONS_DESC',				'TXT_KEY_JFD_REFORM_HEADER_WEAPONS_HELP',				'TXT_KEY_JFD_REFORM_WEAPONS_FOREIGN_SHORT_DESC',					'TXT_KEY_JFD_REFORM_WEAPONS_FOREIGN_DESC',						'TXT_KEY_JFD_REFORM_WEAPONS_FOREIGN_HELP',							'TXT_KEY_JFD_REFORM_WEAPONS_FOREIGN_HELP_BONUS',					'TXT_KEY_JFD_REFORM_WEAPONS_FOREIGN_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_WEAPONS_FOREIGN_PEDIA',							NULL,							NULL,											'ERA_INDUSTRIAL',		0,								0,						'POLICY_REFORM_JFD_WEAPONS_FOREIGN');
							
--Religion							
INSERT INTO JFD_Reforms							
		(Type, 													ReformBranchType,					ReformFlavourType,						IsDisabled,		IsSovereignty,	DefaultActive,	IsLegislature,	IsTitled,	Cost,		AutocracyIndex,	FreedomIndex,	OrderIndex,		MaxSovChange,		FactionSovMod,	ReformCooldownMod,	ReformCostMod,	ReformCostModPerCity,	ReformCostModPerPop,	ResetsAssembly,		ResetsHolySynod,	ResetsImperialCourt,	ResetsImperialDiet,	ResetsParliament,	ResetsSenate,	ResetsLegislature,		AnarchySentimentMod,	Alignment,			FocusIcon,										HeaderDescription, 										HeaderHelp,												ShortDescription,													Description,													Help,																HelpBonus,															HelpPenalty,														LegislatureHelp,									LegislatureIdeologyHelp,								Pedia,																PrereqGovernment, 				PrereqReform,									PrereqEra, 				RequiresFoundedReligion,		RequiresStateReligion,	PolicyType)
VALUES	--Worship                                   	                                                                                                                                            								                                                                                                                                                                                                                                    	                                                                                                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             		                                
		('REFORM_JFD_WORSHIP_SACRIFICE', 						'REFORM_BRANCH_JFD_RELIGION',		'FLAVOR_JFD_REFORM_RELIGION',			0,				0,				0,				0,				0,			30,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_STRENGTH][ICON_WAR]',					'TXT_KEY_JFD_REFORM_HEADER_WORSHIP_DESC',				'TXT_KEY_JFD_REFORM_HEADER_WORSHIP_HELP',				'TXT_KEY_JFD_REFORM_WORSHIP_SACRIFICE_SHORT_DESC',					'TXT_KEY_JFD_REFORM_WORSHIP_SACRIFICE_DESC',					'TXT_KEY_JFD_REFORM_WORSHIP_SACRIFICE_HELP',						'TXT_KEY_JFD_REFORM_WORSHIP_SACRIFICE_HELP_BONUS',					'TXT_KEY_JFD_REFORM_WORSHIP_SACRIFICE_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_WORSHIP_SACRIFICE_PEDIA',						NULL,							NULL,											'ERA_ANCIENT',			0,								0,						'POLICY_REFORM_JFD_WORSHIP_SACRIFICE'),
		('REFORM_JFD_WORSHIP_PRIVATE', 							'REFORM_BRANCH_JFD_RELIGION',		'FLAVOR_JFD_REFORM_RELIGION',			0,				0,				1,				0,				0,			15,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_WORSHIP_DESC',				'TXT_KEY_JFD_REFORM_HEADER_WORSHIP_HELP',				'TXT_KEY_JFD_REFORM_WORSHIP_PRIVATE_SHORT_DESC',					'TXT_KEY_JFD_REFORM_WORSHIP_PRIVATE_DESC',						'TXT_KEY_JFD_REFORM_WORSHIP_PRIVATE_HELP',							'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_WORSHIP_PRIVATE_PEDIA',							NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_WORSHIP_PRIVATE'),
		('REFORM_JFD_WORSHIP_PROCREATION', 						'REFORM_BRANCH_JFD_RELIGION',		'FLAVOR_JFD_REFORM_RELIGION',			0,				0,				0,				0,				0,			30,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_JFD_CRIME_FOOD][ICON_FOOD]',				'TXT_KEY_JFD_REFORM_HEADER_WORSHIP_DESC',				'TXT_KEY_JFD_REFORM_HEADER_WORSHIP_HELP',				'TXT_KEY_JFD_REFORM_WORSHIP_PROCREATION_SHORT_DESC',				'TXT_KEY_JFD_REFORM_WORSHIP_PROCREATION_DESC',					'TXT_KEY_JFD_REFORM_WORSHIP_PROCREATION_HELP',						'TXT_KEY_JFD_REFORM_WORSHIP_PROCREATION_HELP_BONUS',				'TXT_KEY_JFD_REFORM_WORSHIP_PROCREATION_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_WORSHIP_PROCREATION_PEDIA',						NULL,							NULL,											'ERA_ANCIENT',			0,								0,						'POLICY_REFORM_JFD_WORSHIP_PROCREATION'),
		--Festivals                                   	                                                                                	                                                        								                                                                                                                                        		                		                                                            	                                                                        		                                                                        		    		                                                                                                            	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             		                                
		('REFORM_JFD_FESTIVALS_HEALING', 						'REFORM_BRANCH_JFD_RELIGION',		'FLAVOR_JFD_REFORM_RELIGION',			0,				0,				0,				0,				0,			40,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_JFD_HEALTH]',							'TXT_KEY_JFD_REFORM_HEADER_FESTIVALS_DESC',				'TXT_KEY_JFD_REFORM_HEADER_FESTIVALS_HELP',				'TXT_KEY_JFD_REFORM_FESTIVALS_HEALING_SHORT_DESC',					'TXT_KEY_JFD_REFORM_FESTIVALS_HEALING_DESC',					'TXT_KEY_JFD_REFORM_FESTIVALS_HEALING_HELP',						'TXT_KEY_JFD_REFORM_FESTIVALS_HEALING_HELP_BONUS',					'TXT_KEY_JFD_REFORM_FESTIVALS_HEALING_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_FESTIVALS_HEALING_PEDIA',						NULL,							NULL,											'ERA_CLASSICAL',		0,								0,						'POLICY_REFORM_JFD_FESTIVALS_HEALING'),
		('REFORM_JFD_FESTIVALS_NONE', 							'REFORM_BRANCH_JFD_RELIGION',		'FLAVOR_JFD_REFORM_RELIGION',			0,				0,				1,				0,				0,			20,			0,				0,				1,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_FESTIVALS_DESC',				'TXT_KEY_JFD_REFORM_HEADER_FESTIVALS_HELP',				'TXT_KEY_JFD_REFORM_FESTIVALS_NONE_SHORT_DESC',						'TXT_KEY_JFD_REFORM_FESTIVALS_NONE_DESC',						'TXT_KEY_JFD_REFORM_FESTIVALS_NONE_HELP',							'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_FESTIVALS_NONE_PEDIA',							NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_FESTIVALS_NONE'),
		('REFORM_JFD_FESTIVALS_PRAYER', 						'REFORM_BRANCH_JFD_RELIGION',		'FLAVOR_JFD_REFORM_RELIGION',			0,				0,				0,				0,				0,			40,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_PEACE]',									'TXT_KEY_JFD_REFORM_HEADER_FESTIVALS_DESC',				'TXT_KEY_JFD_REFORM_HEADER_FESTIVALS_HELP',				'TXT_KEY_JFD_REFORM_FESTIVALS_PRAYER_SHORT_DESC',					'TXT_KEY_JFD_REFORM_FESTIVALS_PRAYER_DESC',						'TXT_KEY_JFD_REFORM_FESTIVALS_PRAYER_HELP',							'TXT_KEY_JFD_REFORM_FESTIVALS_PRAYER_HELP_BONUS',					'TXT_KEY_JFD_REFORM_FESTIVALS_PRAYER_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_FESTIVALS_PRAYER_PEDIA',						NULL,							NULL,											'ERA_CLASSICAL',		0,								0,						'POLICY_REFORM_JFD_FESTIVALS_PRAYER'),
		--Investiture                                   	                                                                    	    	                                                            							                                                                                                                                        		                		                                                            	                                                                        		                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     		                                
		('REFORM_JFD_INVESTITURE_STATE', 						'REFORM_BRANCH_JFD_RELIGION',		'FLAVOR_JFD_REFORM_RELIGION',			0,				0,				0,				0,				0,			50,			1,				0,				1,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_PEACE]',									'TXT_KEY_JFD_REFORM_HEADER_INVESTITURE_DESC',			'TXT_KEY_JFD_REFORM_HEADER_INVESTITURE_HELP',			'TXT_KEY_JFD_REFORM_INVESTITURE_STATE_SHORT_DESC',					'TXT_KEY_JFD_REFORM_INVESTITURE_STATE_DESC',					'TXT_KEY_JFD_REFORM_INVESTITURE_STATE_HELP',						'TXT_KEY_JFD_REFORM_INVESTITURE_STATE_HELP_BONUS',					'TXT_KEY_JFD_REFORM_INVESTITURE_STATE_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_INVESTITURE_STATE_PEDIA',						NULL,							NULL,											'ERA_MEDIEVAL',			0,								1,						'POLICY_REFORM_JFD_INVESTITURE_STATE'),
		('REFORM_JFD_INVESTITURE_NONE', 						'REFORM_BRANCH_JFD_RELIGION',		'FLAVOR_JFD_REFORM_RELIGION',			0,				0,				1,				0,				0,			25,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_INVESTITURE_DESC',			'TXT_KEY_JFD_REFORM_HEADER_INVESTITURE_HELP',			'TXT_KEY_JFD_REFORM_INVESTITURE_NONE_SHORT_DESC',					'TXT_KEY_JFD_REFORM_INVESTITURE_NONE_DESC',						'TXT_KEY_JFD_REFORM_INVESTITURE_NONE_HELP',							'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_INVESTITURE_NONE_PEDIA',						NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_INVESTITURE_NONE'),
		('REFORM_JFD_INVESTITURE_CHURCH', 						'REFORM_BRANCH_JFD_RELIGION',		'FLAVOR_JFD_REFORM_RELIGION',			0,				0,				0,				0,				0,			50,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_JFD_PIETY]',								'TXT_KEY_JFD_REFORM_HEADER_INVESTITURE_DESC',			'TXT_KEY_JFD_REFORM_HEADER_INVESTITURE_HELP',			'TXT_KEY_JFD_REFORM_INVESTITURE_CHURCH_SHORT_DESC',					'TXT_KEY_JFD_REFORM_INVESTITURE_CHURCH_DESC',					'TXT_KEY_JFD_REFORM_INVESTITURE_CHURCH_HELP',						'TXT_KEY_JFD_REFORM_INVESTITURE_CHURCH_HELP_BONUS',					'TXT_KEY_JFD_REFORM_INVESTITURE_CHURCH_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_INVESTITURE_CHURCH_PEDIA',						NULL,							NULL,											'ERA_MEDIEVAL',			0,								1,						'POLICY_REFORM_JFD_INVESTITURE_CHURCH'),
		--Orders                                   	                                                                                    	                                                    									                                                                                                                                        		                		                                                            	                                                                        		                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             		                                
		('REFORM_JFD_ORDERS_MILITANT', 							'REFORM_BRANCH_JFD_RELIGION',		'FLAVOR_JFD_REFORM_RELIGION',			0,				0,				0,				0,				0,			50,			1,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_GOLDEN_AGE]',							'TXT_KEY_JFD_REFORM_HEADER_ORDERS_DESC',				'TXT_KEY_JFD_REFORM_HEADER_ORDERS_HELP',				'TXT_KEY_JFD_REFORM_ORDERS_MILITANT_SHORT_DESC',					'TXT_KEY_JFD_REFORM_ORDERS_MILITANT_DESC',						'TXT_KEY_JFD_REFORM_ORDERS_MILITANT_HELP',							'TXT_KEY_JFD_REFORM_ORDERS_MILITANT_HELP_BONUS',					'TXT_KEY_JFD_REFORM_ORDERS_MILITANT_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_ORDERS_MILITANT_PEDIA',							NULL,							NULL,											'ERA_MEDIEVAL',			0,								1,						'POLICY_REFORM_JFD_ORDERS_MILITANT'),
		('REFORM_JFD_ORDERS_NONE', 								'REFORM_BRANCH_JFD_RELIGION',		'FLAVOR_JFD_REFORM_RELIGION',			0,				0,				1,				0,				0,			25,			0,				0,				1,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_ORDERS_DESC',				'TXT_KEY_JFD_REFORM_HEADER_ORDERS_HELP',				'TXT_KEY_JFD_REFORM_ORDERS_NONE_SHORT_DESC',						'TXT_KEY_JFD_REFORM_ORDERS_NONE_DESC',							'TXT_KEY_JFD_REFORM_ORDERS_NONE_HELP',								'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_ORDERS_NONE_PEDIA',								NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_ORDERS_NONE'),
		('REFORM_JFD_ORDERS_CHARITABLE', 						'REFORM_BRANCH_JFD_RELIGION',		'FLAVOR_JFD_REFORM_RELIGION',			0,				0,				0,				0,				0,			50,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_STRENGTH]',								'TXT_KEY_JFD_REFORM_HEADER_ORDERS_DESC',				'TXT_KEY_JFD_REFORM_HEADER_ORDERS_HELP',				'TXT_KEY_JFD_REFORM_ORDERS_CHARITABLE_SHORT_DESC',					'TXT_KEY_JFD_REFORM_ORDERS_CHARITABLE_DESC',					'TXT_KEY_JFD_REFORM_ORDERS_CHARITABLE_HELP',						'TXT_KEY_JFD_REFORM_ORDERS_CHARITABLE_HELP_BONUS',					'TXT_KEY_JFD_REFORM_ORDERS_CHARITABLE_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_ORDERS_CHARITABLE_PEDIA',						NULL,							NULL,											'ERA_MEDIEVAL',			0,								1,						'POLICY_REFORM_JFD_ORDERS_CHARITABLE'),
		--Sainthood                                   	                                                                                	                                                        								                                                                                                                                        		                		                                                            	                                                                        		                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 		                                
		('REFORM_JFD_SAINTHOOD_INFORMAL', 						'REFORM_BRANCH_JFD_RELIGION',		'FLAVOR_JFD_REFORM_RELIGION',			0,				0,				0,				0,				0,			50,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_JFD_WLTKD][ICON_FOOD]',					'TXT_KEY_JFD_REFORM_HEADER_SAINTHOOD_DESC',				'TXT_KEY_JFD_REFORM_HEADER_SAINTHOOD_HELP',				'TXT_KEY_JFD_REFORM_SAINTHOOD_INFORMAL_SHORT_DESC',					'TXT_KEY_JFD_REFORM_SAINTHOOD_INFORMAL_DESC',					'TXT_KEY_JFD_REFORM_SAINTHOOD_INFORMAL_HELP',						'TXT_KEY_JFD_REFORM_SAINTHOOD_INFORMAL_HELP_BONUS',					'TXT_KEY_JFD_REFORM_SAINTHOOD_INFORMAL_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_SAINTHOOD_INFORMAL_PEDIA',						NULL,							NULL,											'ERA_MEDIEVAL',			0,								1,						'POLICY_REFORM_JFD_SAINTHOOD_INFORMAL'),
		('REFORM_JFD_SAINTHOOD_NONE', 							'REFORM_BRANCH_JFD_RELIGION',		'FLAVOR_JFD_REFORM_RELIGION',			0,				0,				1,				0,				0,			25,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_SAINTHOOD_DESC',				'TXT_KEY_JFD_REFORM_HEADER_SAINTHOOD_HELP',				'TXT_KEY_JFD_REFORM_SAINTHOOD_NONE_SHORT_DESC',						'TXT_KEY_JFD_REFORM_SAINTHOOD_NONE_DESC',						'TXT_KEY_JFD_REFORM_SAINTHOOD_NONE_HELP',							'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_SAINTHOOD_NONE_PEDIA',							NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_SAINTHOOD_NONE'),
		('REFORM_JFD_SAINTHOOD_FORMAL', 						'REFORM_BRANCH_JFD_RELIGION',		'FLAVOR_JFD_REFORM_RELIGION',			0,				0,				0,				0,				0,			50,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_JFD_WLTKD][ICON_PEACE]',					'TXT_KEY_JFD_REFORM_HEADER_SAINTHOOD_DESC',				'TXT_KEY_JFD_REFORM_HEADER_SAINTHOOD_HELP',				'TXT_KEY_JFD_REFORM_SAINTHOOD_FORMAL_SHORT_DESC',					'TXT_KEY_JFD_REFORM_SAINTHOOD_FORMAL_DESC',						'TXT_KEY_JFD_REFORM_SAINTHOOD_FORMAL_HELP',							'TXT_KEY_JFD_REFORM_SAINTHOOD_FORMAL_HELP_BONUS',					'TXT_KEY_JFD_REFORM_SAINTHOOD_FORMAL_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_SAINTHOOD_FORMAL_PEDIA',						NULL,							NULL,											'ERA_MEDIEVAL',			0,								1,						'POLICY_REFORM_JFD_SAINTHOOD_FORMAL'),
		--Appeals                                   	                                                                              		                                                        								                                                                                                                                        		                		                                                            	                                                                        		                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 		                                
		('REFORM_JFD_APPEALS_STATE', 							'REFORM_BRANCH_JFD_RELIGION',		'FLAVOR_JFD_REFORM_RELIGION',			0,				0,				0,				0,				0,			60,			1,				0,				1,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_MISSIONARY]',							'TXT_KEY_JFD_REFORM_HEADER_APPEALS_DESC',				'TXT_KEY_JFD_REFORM_HEADER_APPEALS_HELP',				'TXT_KEY_JFD_REFORM_APPEALS_STATE_SHORT_DESC',						'TXT_KEY_JFD_REFORM_APPEALS_STATE_DESC',						'TXT_KEY_JFD_REFORM_APPEALS_STATE_HELP',							'TXT_KEY_JFD_REFORM_APPEALS_STATE_HELP_BONUS',						'TXT_KEY_JFD_REFORM_APPEALS_STATE_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_APPEALS_STATE_PEDIA',							NULL,							NULL,											'ERA_RENAISSANCE',		0,								1,						'POLICY_REFORM_JFD_APPEALS_STATE'),
		('REFORM_JFD_APPEALS_NONE', 							'REFORM_BRANCH_JFD_RELIGION',		'FLAVOR_JFD_REFORM_RELIGION',			0,				0,				1,				0,				0,			30,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_APPEALS_DESC',				'TXT_KEY_JFD_REFORM_HEADER_APPEALS_HELP',				'TXT_KEY_JFD_REFORM_APPEALS_NONE_SHORT_DESC',						'TXT_KEY_JFD_REFORM_APPEALS_NONE_DESC',							'TXT_KEY_JFD_REFORM_APPEALS_NONE_HELP',								'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_APPEALS_NONE_PEDIA',							NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_APPEALS_NONE'),
		('REFORM_JFD_APPEALS_CHURCH', 							'REFORM_BRANCH_JFD_RELIGION',		'FLAVOR_JFD_REFORM_RELIGION',			0,				0,				0,				0,				0,			60,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_JFD_PIETY]',								'TXT_KEY_JFD_REFORM_HEADER_APPEALS_DESC',				'TXT_KEY_JFD_REFORM_HEADER_APPEALS_HELP',				'TXT_KEY_JFD_REFORM_APPEALS_CHURCH_SHORT_DESC',						'TXT_KEY_JFD_REFORM_APPEALS_CHURCH_DESC',						'TXT_KEY_JFD_REFORM_APPEALS_CHURCH_HELP',							'TXT_KEY_JFD_REFORM_APPEALS_CHURCH_HELP_BONUS',						'TXT_KEY_JFD_REFORM_APPEALS_CHURCH_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_APPEALS_CHURCH_PEDIA',							NULL,							NULL,											'ERA_RENAISSANCE',		0,								1,						'POLICY_REFORM_JFD_APPEALS_CHURCH'),
		--Missions                                   	                                                                            	                                                            								                                                                                                                                        		                		                                                            	                                                                        		                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 		                                
		('REFORM_JFD_MISSIONS_ABROAD', 							'REFORM_BRANCH_JFD_RELIGION',		'FLAVOR_JFD_REFORM_RELIGION',			0,				0,				0,				0,				0,			60,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_SWAP][ICON_MISSIONARY]',					'TXT_KEY_JFD_REFORM_HEADER_MISSIONS_DESC',				'TXT_KEY_JFD_REFORM_HEADER_MISSIONS_HELP',				'TXT_KEY_JFD_REFORM_MISSIONS_ABROAD_SHORT_DESC',					'TXT_KEY_JFD_REFORM_MISSIONS_ABROAD_DESC',						'TXT_KEY_JFD_REFORM_MISSIONS_ABROAD_HELP',							'TXT_KEY_JFD_REFORM_MISSIONS_ABROAD_HELP_BONUS',					'TXT_KEY_JFD_REFORM_MISSIONS_ABROAD_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_MISSIONS_ABROAD_PEDIA',							NULL,							NULL,											'ERA_RENAISSANCE',		0,								1,						'POLICY_REFORM_JFD_MISSIONS_ABROAD'),
		('REFORM_JFD_MISSIONS_BALANCED', 						'REFORM_BRANCH_JFD_RELIGION',		'FLAVOR_JFD_REFORM_RELIGION',			0,				0,				1,				0,				0,			30,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_MISSIONS_DESC',				'TXT_KEY_JFD_REFORM_HEADER_MISSIONS_HELP',				'TXT_KEY_JFD_REFORM_MISSIONS_BALANCED_SHORT_DESC',					'TXT_KEY_JFD_REFORM_MISSIONS_BALANCED_DESC',					'TXT_KEY_JFD_REFORM_MISSIONS_BALANCED_HELP',						'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_MISSIONS_BALANCED_PEDIA',						NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_MISSIONS_BALANCED'),
		('REFORM_JFD_MISSIONS_DOMESTIC', 						'REFORM_BRANCH_JFD_RELIGION',		'FLAVOR_JFD_REFORM_RELIGION',			0,				0,				0,				0,				0,			60,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_RELIGION][ICON_MISSIONARY]',				'TXT_KEY_JFD_REFORM_HEADER_MISSIONS_DESC',				'TXT_KEY_JFD_REFORM_HEADER_MISSIONS_HELP',				'TXT_KEY_JFD_REFORM_MISSIONS_DOMESTIC_SHORT_DESC',					'TXT_KEY_JFD_REFORM_MISSIONS_DOMESTIC_DESC',					'TXT_KEY_JFD_REFORM_MISSIONS_DOMESTIC_HELP',						'TXT_KEY_JFD_REFORM_MISSIONS_DOMESTIC_HELP_BONUS',					'TXT_KEY_JFD_REFORM_MISSIONS_DOMESTIC_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_MISSIONS_DOMESTIC_PEDIA',						NULL,							NULL,											'ERA_RENAISSANCE',		0,								1,						'POLICY_REFORM_JFD_MISSIONS_DOMESTIC'),
		--Schooling                                   	                                                                                	                                                        								                                                                                                                                        		                		                                                            	                                                                        		                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 		                                
		('REFORM_JFD_SCHOOLING_NATURAL', 						'REFORM_BRANCH_JFD_RELIGION',		'FLAVOR_JFD_REFORM_RELIGION',			0,				0,				0,				0,				0,			60,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_PEACE]',									'TXT_KEY_JFD_REFORM_HEADER_SCHOOLING_DESC',				'TXT_KEY_JFD_REFORM_HEADER_SCHOOLING_HELP',				'TXT_KEY_JFD_REFORM_SCHOOLING_NATURAL_SHORT_DESC',					'TXT_KEY_JFD_REFORM_SCHOOLING_NATURAL_DESC',					'TXT_KEY_JFD_REFORM_SCHOOLING_NATURAL_HELP',						'TXT_KEY_JFD_REFORM_SCHOOLING_NATURAL_HELP_BONUS',					'TXT_KEY_JFD_REFORM_SCHOOLING_NATURAL_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_SCHOOLING_NATURAL_PEDIA',						NULL,							NULL,											'ERA_RENAISSANCE',		0,								1,						'POLICY_REFORM_JFD_SCHOOLING_NATURAL'),
		('REFORM_JFD_SCHOOLING_SECULAR', 						'REFORM_BRANCH_JFD_RELIGION',		'FLAVOR_JFD_REFORM_RELIGION',			0,				0,				1,				0,				0,			30,			0,				1,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_SCHOOLING_DESC',				'TXT_KEY_JFD_REFORM_HEADER_SCHOOLING_HELP',				'TXT_KEY_JFD_REFORM_SCHOOLING_SECULAR_SHORT_DESC',					'TXT_KEY_JFD_REFORM_SCHOOLING_SECULAR_DESC',					'TXT_KEY_JFD_REFORM_SCHOOLING_SECULAR_HELP',						'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_SCHOOLING_SECULAR_PEDIA',						NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_SCHOOLING_SECULAR'),
		('REFORM_JFD_SCHOOLING_SCRIPTURAL', 					'REFORM_BRANCH_JFD_RELIGION',		'FLAVOR_JFD_REFORM_RELIGION',			0,				0,				0,				0,				0,			60,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_RESEARCH]',								'TXT_KEY_JFD_REFORM_HEADER_SCHOOLING_DESC',				'TXT_KEY_JFD_REFORM_HEADER_SCHOOLING_HELP',				'TXT_KEY_JFD_REFORM_SCHOOLING_SCRIPTURAL_SHORT_DESC',				'TXT_KEY_JFD_REFORM_SCHOOLING_SCRIPTURAL_DESC',					'TXT_KEY_JFD_REFORM_SCHOOLING_SCRIPTURAL_HELP',						'TXT_KEY_JFD_REFORM_SCHOOLING_SCRIPTURAL_HELP_BONUS',				'TXT_KEY_JFD_REFORM_SCHOOLING_SCRIPTURAL_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_SCHOOLING_SCRIPTURAL_PEDIA',					NULL,							NULL,											'ERA_RENAISSANCE',		0,								1,						'POLICY_REFORM_JFD_SCHOOLING_SCRIPTURAL'),
		--Sects                                   	                                                                              	    	                                                    									                                                                                                                        												                                                            	                                                        						                                                                            				                                                    	                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             		                                
		('REFORM_JFD_SECTS_FUNDAMENTAL', 						'REFORM_BRANCH_JFD_RELIGION',		'FLAVOR_JFD_REFORM_RELIGION',			0,				0,				0,				0,				0,			70,			1,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_RIGHT',		'[ICON_JFD_PIETY]',								'TXT_KEY_JFD_REFORM_HEADER_SECTS_DESC',					'TXT_KEY_JFD_REFORM_HEADER_SECTS_HELP',					'TXT_KEY_JFD_REFORM_SECTS_FUNDAMENTAL_SHORT_DESC',					'TXT_KEY_JFD_REFORM_SECTS_FUNDAMENTAL_DESC',					'TXT_KEY_JFD_REFORM_SECTS_FUNDAMENTAL_HELP',						'TXT_KEY_JFD_REFORM_SECTS_FUNDAMENTAL_HELP_BONUS',					'TXT_KEY_JFD_REFORM_SECTS_FUNDAMENTAL_HELP_PENALTY',				NULL,												NULL,													'TXT_KEY_JFD_REFORM_SECTS_FUNDAMENTAL_PEDIA',						NULL,							NULL,											'ERA_INDUSTRIAL',		0,								1,						'POLICY_REFORM_JFD_SECTS_FUNDAMENTAL'),
		('REFORM_JFD_SECTS_PREVAILING', 						'REFORM_BRANCH_JFD_RELIGION',		'FLAVOR_JFD_REFORM_RELIGION',			0,				0,				1,				0,				0,			45,			0,				0,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_CENTRE',	NULL,											'TXT_KEY_JFD_REFORM_HEADER_SECTS_DESC',					'TXT_KEY_JFD_REFORM_HEADER_SECTS_HELP',					'TXT_KEY_JFD_REFORM_SECTS_PREVAILING_SHORT_DESC',					'TXT_KEY_JFD_REFORM_SECTS_PREVAILING_DESC',						'TXT_KEY_JFD_REFORM_SECTS_PREVAILING_HELP',							'TXT_KEY_JFD_REFORM_HELP_NONE',										'TXT_KEY_JFD_REFORM_HELP_NONE',										NULL,												NULL,													'TXT_KEY_JFD_REFORM_SECTS_PREVAILING_PEDIA',						NULL,							NULL,											NULL,					0,								0,						'POLICY_REFORM_JFD_SECTS_PREVAILING'),
		('REFORM_JFD_SECTS_UNIVERSAL', 							'REFORM_BRANCH_JFD_RELIGION',		'FLAVOR_JFD_REFORM_RELIGION',			0,				0,				0,				0,				0,			70,			0,				1,				0,				0,					0,				0,					0,				0,						0,						0,					0,					0,						0,					0,					0,				0,						0,						'REFORM_LEFT',		'[ICON_JFD_PIETY]',								'TXT_KEY_JFD_REFORM_HEADER_SECTS_DESC',					'TXT_KEY_JFD_REFORM_HEADER_SECTS_HELP',					'TXT_KEY_JFD_REFORM_SECTS_UNIVERSAL_SHORT_DESC',					'TXT_KEY_JFD_REFORM_SECTS_UNIVERSAL_DESC',						'TXT_KEY_JFD_REFORM_SECTS_UNIVERSAL_HELP',							'TXT_KEY_JFD_REFORM_SECTS_UNIVERSAL_HELP_BONUS',					'TXT_KEY_JFD_REFORM_SECTS_UNIVERSAL_HELP_PENALTY',					NULL,												NULL,													'TXT_KEY_JFD_REFORM_SECTS_UNIVERSAL_PEDIA',							NULL,							NULL,											'ERA_INDUSTRIAL',		0,								1,						'POLICY_REFORM_JFD_SECTS_UNIVERSAL');
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_Legitimacies
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO JFD_Reform_Legitimacies
		(ReformType,											Help,													SovereigntyWhenChanceries,	SovereigntyWhenMonasteries,	SovereigntyWhenConnected,	SovereigntyWhenExcessHappiness,	SovereigntyWhenGarrisoned,	SovereigntyWhenHighCourt,	SovereigntyWhenPatriotic,	SovereigntyWhenPopulation,	SovereigntyWhenSpecialist,	SovereigntyWhenStateReligion,	SovereigntyWhenTradition)
VALUES	('REFORM_JFD_BASIS_RELIGIOUS',							'TXT_KEY_JFD_SOVEREIGNTY_FROM_MONASTERIES',				0,							10,							0,							0,								0,							0,							0,							0,							0,							0,								0),
		('REFORM_JFD_BASIS_SECULAR',							'TXT_KEY_JFD_SOVEREIGNTY_FROM_CHANCERIES',				10,							0,							0,							0,								0,							0,							0,							0,							0,							0,								0),
		('REFORM_JFD_LEGITIMACY_WISDOM',						'TXT_KEY_JFD_SOVEREIGNTY_FROM_SPECIALISTS',				0,							0,							0,							0,								0,							0,							0,							0,							20,							0,								5),
		('REFORM_JFD_LEGITIMACY_MIGHT',							'TXT_KEY_JFD_SOVEREIGNTY_FROM_GARRISONS',				0,							0,							0,							0,								10,							0,							0,							0,							0,							0,								5),
		('REFORM_JFD_LEGITIMACY_WEALTH',						'TXT_KEY_JFD_SOVEREIGNTY_FROM_CITY_CONNECTIONS',		0,							0,							15,							0,								0,							0,							0,							0,							0,							0,								5),
		('REFORM_JFD_LEGITIMACY_DIVINE_RIGHT',					'TXT_KEY_JFD_SOVEREIGNTY_FROM_STATE_RELIGIONS',			0,							0,							0,							0,								0,							0,							0,							0,							0,							20,								5),
		('REFORM_JFD_LEGITIMACY_GOVERNANCE',					'TXT_KEY_JFD_SOVEREIGNTY_FROM_POPULATION',				0,							0,							0,							0,								0,							0,							0,							10,							0,							0,								5),
		('REFORM_JFD_LEGITIMACY_LAW',							'TXT_KEY_JFD_SOVEREIGNTY_FROM_HIGH_COURTS',				0,							0,							0,							0,								0,							15,							0,							0,							0,							0,								5),
		('REFORM_JFD_LEGITIMACY_SECURITY',						'TXT_KEY_JFD_SOVEREIGNTY_FROM_LOYALTY',					0,							0,							0,							0,								0,							0,							20,							0,							0,							0,								5),
		('REFORM_JFD_LEGITIMACY_CHARISMA',						'TXT_KEY_JFD_SOVEREIGNTY_FROM_HAPPINESS',				0,							0,							0,							15,								0,							0,							0,							0,							0,							0,								5),
		('REFORM_JFD_LEGITIMACY_TRADITION',						'TXT_KEY_JFD_SOVEREIGNTY_FROM_TRADITION',				0,							0,							0,							0,								0,							0,							0,							0,							0,							0,								0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_Negates
--------------------------------------------------------------------------------------------------------------------------	
--Government
INSERT INTO JFD_Reform_Negates
		(ReformType,											ReformNegateType)
VALUES	--Executive
		('REFORM_JFD_EXECUTIVE_ABSOLUTE',						'REFORM_JFD_EXECUTIVE_DESPOTIC'),
		('REFORM_JFD_EXECUTIVE_ABSOLUTE',						'REFORM_JFD_EXECUTIVE_CONSTITUTIONAL'),
		('REFORM_JFD_EXECUTIVE_DESPOTIC',						'REFORM_JFD_EXECUTIVE_CONSTITUTIONAL'),
		('REFORM_JFD_EXECUTIVE_DESPOTIC',						'REFORM_JFD_EXECUTIVE_ABSOLUTE'),
		('REFORM_JFD_EXECUTIVE_CONSTITUTIONAL',					'REFORM_JFD_EXECUTIVE_ABSOLUTE'),
		('REFORM_JFD_EXECUTIVE_CONSTITUTIONAL',					'REFORM_JFD_EXECUTIVE_DESPOTIC'),
		--State
		('REFORM_JFD_STATE_EMPIRE',								'REFORM_JFD_STATE_CITYSTATE'),
		('REFORM_JFD_STATE_EMPIRE',								'REFORM_JFD_STATE_NATION'),
		('REFORM_JFD_STATE_NATION',								'REFORM_JFD_STATE_EMPIRE'),
		('REFORM_JFD_STATE_NATION',								'REFORM_JFD_STATE_CITYSTATE'),
		('REFORM_JFD_STATE_CITYSTATE',							'REFORM_JFD_STATE_NATION'),
		('REFORM_JFD_STATE_CITYSTATE',							'REFORM_JFD_STATE_EMPIRE'),	
		--Legislature (Holy Rome)
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS',		'REFORM_JFD_LEGISLATURE_S_DAIMYO'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS',		'REFORM_JFD_LEGISLATURE_S_NONE'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS',		'REFORM_JFD_LEGISLATURE_S_EMPEROR'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS',		'REFORM_JFD_LEGISLATURE_HRE_NONE'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS',		'REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS',		'REFORM_JFD_LEGISLATURE_D_PERSONAL'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS',		'REFORM_JFD_LEGISLATURE_D_ONE_PARTY'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS',		'REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS',		'REFORM_JFD_LEGISLATURE_M_NONE'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS',		'REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS',		'REFORM_JFD_LEGISLATURE_R_OLIGARCHIC'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS',		'REFORM_JFD_LEGISLATURE_R_NONE'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS',		'REFORM_JFD_LEGISLATURE_R_DEMOCRATIC'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS',		'REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS',		'REFORM_JFD_LEGISLATURE_T_NONE'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS',		'REFORM_JFD_LEGISLATURE_T_ECUMENICAL'),
		('REFORM_JFD_LEGISLATURE_HRE_NONE',						'REFORM_JFD_LEGISLATURE_S_DAIMYO'),
		('REFORM_JFD_LEGISLATURE_HRE_NONE',						'REFORM_JFD_LEGISLATURE_S_NONE'),
		('REFORM_JFD_LEGISLATURE_HRE_NONE',						'REFORM_JFD_LEGISLATURE_S_EMPEROR'),
		('REFORM_JFD_LEGISLATURE_HRE_NONE',						'REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR'),
		('REFORM_JFD_LEGISLATURE_HRE_NONE',						'REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS'),
		('REFORM_JFD_LEGISLATURE_HRE_NONE',						'REFORM_JFD_LEGISLATURE_D_ONE_PARTY'),
		('REFORM_JFD_LEGISLATURE_HRE_NONE',						'REFORM_JFD_LEGISLATURE_D_MILITARY'),
		('REFORM_JFD_LEGISLATURE_HRE_NONE',						'REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC'),
		('REFORM_JFD_LEGISLATURE_HRE_NONE',						'REFORM_JFD_LEGISLATURE_M_NONE'),
		('REFORM_JFD_LEGISLATURE_HRE_NONE',						'REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY'),
		('REFORM_JFD_LEGISLATURE_HRE_NONE',						'REFORM_JFD_LEGISLATURE_R_OLIGARCHIC'),
		('REFORM_JFD_LEGISLATURE_HRE_NONE',						'REFORM_JFD_LEGISLATURE_R_NONE'),
		('REFORM_JFD_LEGISLATURE_HRE_NONE',						'REFORM_JFD_LEGISLATURE_R_DEMOCRATIC'),
		('REFORM_JFD_LEGISLATURE_HRE_NONE',						'REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS'),
		('REFORM_JFD_LEGISLATURE_HRE_NONE',						'REFORM_JFD_LEGISLATURE_T_NONE'),
		('REFORM_JFD_LEGISLATURE_HRE_NONE',						'REFORM_JFD_LEGISLATURE_T_ECUMENICAL'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR',		'REFORM_JFD_LEGISLATURE_S_DAIMYO'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR',		'REFORM_JFD_LEGISLATURE_S_NONE'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR',		'REFORM_JFD_LEGISLATURE_S_EMPEROR'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR',		'REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR',		'REFORM_JFD_LEGISLATURE_HRE_NONE'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR',		'REFORM_JFD_LEGISLATURE_D_MILITARY'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR',		'REFORM_JFD_LEGISLATURE_D_PERSONAL'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR',		'REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR',		'REFORM_JFD_LEGISLATURE_M_NONE'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR',		'REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR',		'REFORM_JFD_LEGISLATURE_R_OLIGARCHIC'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR',		'REFORM_JFD_LEGISLATURE_R_NONE'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR',		'REFORM_JFD_LEGISLATURE_R_DEMOCRATIC'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR',		'REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR',		'REFORM_JFD_LEGISLATURE_T_NONE'),
		('REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR',		'REFORM_JFD_LEGISLATURE_T_ECUMENICAL'),
		--Legislature (Dictatorship)
		('REFORM_JFD_LEGISLATURE_D_MILITARY',					'REFORM_JFD_LEGISLATURE_S_DAIMYO'),
		('REFORM_JFD_LEGISLATURE_D_MILITARY',					'REFORM_JFD_LEGISLATURE_S_NONE'),
		('REFORM_JFD_LEGISLATURE_D_MILITARY',					'REFORM_JFD_LEGISLATURE_S_EMPEROR'),
		('REFORM_JFD_LEGISLATURE_D_MILITARY',					'REFORM_JFD_LEGISLATURE_D_PERSONAL'),
		('REFORM_JFD_LEGISLATURE_D_MILITARY',					'REFORM_JFD_LEGISLATURE_D_ONE_PARTY'),
		('REFORM_JFD_LEGISLATURE_D_MILITARY',					'REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC'),
		('REFORM_JFD_LEGISLATURE_D_MILITARY',					'REFORM_JFD_LEGISLATURE_M_NONE'),
		('REFORM_JFD_LEGISLATURE_D_MILITARY',					'REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY'),
		('REFORM_JFD_LEGISLATURE_D_MILITARY',					'REFORM_JFD_LEGISLATURE_R_OLIGARCHIC'),
		('REFORM_JFD_LEGISLATURE_D_MILITARY',					'REFORM_JFD_LEGISLATURE_R_NONE'),
		('REFORM_JFD_LEGISLATURE_D_MILITARY',					'REFORM_JFD_LEGISLATURE_R_DEMOCRATIC'),
		('REFORM_JFD_LEGISLATURE_D_MILITARY',					'REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS'),
		('REFORM_JFD_LEGISLATURE_D_MILITARY',					'REFORM_JFD_LEGISLATURE_T_NONE'),
		('REFORM_JFD_LEGISLATURE_D_MILITARY',					'REFORM_JFD_LEGISLATURE_T_ECUMENICAL'),
		('REFORM_JFD_LEGISLATURE_D_MILITARY',					'REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS'),
		('REFORM_JFD_LEGISLATURE_D_MILITARY',					'REFORM_JFD_LEGISLATURE_HRE_NONE'),
		('REFORM_JFD_LEGISLATURE_D_MILITARY',					'REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR'),
		('REFORM_JFD_LEGISLATURE_D_PERSONAL',					'REFORM_JFD_LEGISLATURE_S_DAIMYO'),
		('REFORM_JFD_LEGISLATURE_D_PERSONAL',					'REFORM_JFD_LEGISLATURE_S_NONE'),
		('REFORM_JFD_LEGISLATURE_D_PERSONAL',					'REFORM_JFD_LEGISLATURE_S_EMPEROR'),
		('REFORM_JFD_LEGISLATURE_D_PERSONAL',					'REFORM_JFD_LEGISLATURE_D_ONE_PARTY'),
		('REFORM_JFD_LEGISLATURE_D_PERSONAL',					'REFORM_JFD_LEGISLATURE_D_MILITARY'),
		('REFORM_JFD_LEGISLATURE_D_PERSONAL',					'REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC'),
		('REFORM_JFD_LEGISLATURE_D_PERSONAL',					'REFORM_JFD_LEGISLATURE_M_NONE'),
		('REFORM_JFD_LEGISLATURE_D_PERSONAL',					'REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY'),
		('REFORM_JFD_LEGISLATURE_D_PERSONAL',					'REFORM_JFD_LEGISLATURE_R_OLIGARCHIC'),
		('REFORM_JFD_LEGISLATURE_D_PERSONAL',					'REFORM_JFD_LEGISLATURE_R_NONE'),
		('REFORM_JFD_LEGISLATURE_D_PERSONAL',					'REFORM_JFD_LEGISLATURE_R_DEMOCRATIC'),
		('REFORM_JFD_LEGISLATURE_D_PERSONAL',					'REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS'),
		('REFORM_JFD_LEGISLATURE_D_PERSONAL',					'REFORM_JFD_LEGISLATURE_T_NONE'),
		('REFORM_JFD_LEGISLATURE_D_PERSONAL',					'REFORM_JFD_LEGISLATURE_T_ECUMENICAL'),
		('REFORM_JFD_LEGISLATURE_D_PERSONAL',					'REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS'),
		('REFORM_JFD_LEGISLATURE_D_PERSONAL',					'REFORM_JFD_LEGISLATURE_HRE_NONE'),
		('REFORM_JFD_LEGISLATURE_D_PERSONAL',					'REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR'),
		('REFORM_JFD_LEGISLATURE_D_ONE_PARTY',					'REFORM_JFD_LEGISLATURE_S_DAIMYO'),
		('REFORM_JFD_LEGISLATURE_D_ONE_PARTY',					'REFORM_JFD_LEGISLATURE_S_NONE'),
		('REFORM_JFD_LEGISLATURE_D_ONE_PARTY',					'REFORM_JFD_LEGISLATURE_S_EMPEROR'),
		('REFORM_JFD_LEGISLATURE_D_ONE_PARTY',					'REFORM_JFD_LEGISLATURE_D_MILITARY'),
		('REFORM_JFD_LEGISLATURE_D_ONE_PARTY',					'REFORM_JFD_LEGISLATURE_D_PERSONAL'),
		('REFORM_JFD_LEGISLATURE_D_ONE_PARTY',					'REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC'),
		('REFORM_JFD_LEGISLATURE_D_ONE_PARTY',					'REFORM_JFD_LEGISLATURE_M_NONE'),
		('REFORM_JFD_LEGISLATURE_D_ONE_PARTY',					'REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY'),
		('REFORM_JFD_LEGISLATURE_D_ONE_PARTY',					'REFORM_JFD_LEGISLATURE_R_OLIGARCHIC'),
		('REFORM_JFD_LEGISLATURE_D_ONE_PARTY',					'REFORM_JFD_LEGISLATURE_R_NONE'),
		('REFORM_JFD_LEGISLATURE_D_ONE_PARTY',					'REFORM_JFD_LEGISLATURE_R_DEMOCRATIC'),
		('REFORM_JFD_LEGISLATURE_D_ONE_PARTY',					'REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS'),
		('REFORM_JFD_LEGISLATURE_D_ONE_PARTY',					'REFORM_JFD_LEGISLATURE_T_NONE'),
		('REFORM_JFD_LEGISLATURE_D_ONE_PARTY',					'REFORM_JFD_LEGISLATURE_T_ECUMENICAL'),
		('REFORM_JFD_LEGISLATURE_D_ONE_PARTY',					'REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS'),
		('REFORM_JFD_LEGISLATURE_D_ONE_PARTY',					'REFORM_JFD_LEGISLATURE_HRE_NONE'),
		('REFORM_JFD_LEGISLATURE_D_ONE_PARTY',					'REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR'),
		--Legislature (Monarchy)
		('REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC',				'REFORM_JFD_LEGISLATURE_S_DAIMYO'),
		('REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC',				'REFORM_JFD_LEGISLATURE_S_NONE'),
		('REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC',				'REFORM_JFD_LEGISLATURE_S_EMPEROR'),
		('REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC',				'REFORM_JFD_LEGISLATURE_M_NONE'),
		('REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC',				'REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY'),
		('REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC',				'REFORM_JFD_LEGISLATURE_D_MILITARY'),
		('REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC',				'REFORM_JFD_LEGISLATURE_D_PERSONAL'),
		('REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC',				'REFORM_JFD_LEGISLATURE_D_ONE_PARTY'),
		('REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC',				'REFORM_JFD_LEGISLATURE_R_OLIGARCHIC'),
		('REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC',				'REFORM_JFD_LEGISLATURE_R_NONE'),
		('REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC',				'REFORM_JFD_LEGISLATURE_R_DEMOCRATIC'),
		('REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC',				'REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS'),
		('REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC',				'REFORM_JFD_LEGISLATURE_T_NONE'),
		('REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC',				'REFORM_JFD_LEGISLATURE_T_ECUMENICAL'),
		('REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC',				'REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS'),
		('REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC',				'REFORM_JFD_LEGISLATURE_HRE_NONE'),
		('REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC',				'REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR'),
		('REFORM_JFD_LEGISLATURE_M_NONE',						'REFORM_JFD_LEGISLATURE_S_DAIMYO'),
		('REFORM_JFD_LEGISLATURE_M_NONE',						'REFORM_JFD_LEGISLATURE_S_NONE'),
		('REFORM_JFD_LEGISLATURE_M_NONE',						'REFORM_JFD_LEGISLATURE_S_EMPEROR'),
		('REFORM_JFD_LEGISLATURE_M_NONE',						'REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY'),
		('REFORM_JFD_LEGISLATURE_M_NONE',						'REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC'),
		('REFORM_JFD_LEGISLATURE_M_NONE',						'REFORM_JFD_LEGISLATURE_D_MILITARY'),
		('REFORM_JFD_LEGISLATURE_M_NONE',						'REFORM_JFD_LEGISLATURE_D_PERSONAL'),
		('REFORM_JFD_LEGISLATURE_M_NONE',						'REFORM_JFD_LEGISLATURE_D_ONE_PARTY'),
		('REFORM_JFD_LEGISLATURE_M_NONE',						'REFORM_JFD_LEGISLATURE_R_OLIGARCHIC'),
		('REFORM_JFD_LEGISLATURE_M_NONE',						'REFORM_JFD_LEGISLATURE_R_NONE'),
		('REFORM_JFD_LEGISLATURE_M_NONE',						'REFORM_JFD_LEGISLATURE_R_DEMOCRATIC'),
		('REFORM_JFD_LEGISLATURE_M_NONE',						'REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS'),
		('REFORM_JFD_LEGISLATURE_M_NONE',						'REFORM_JFD_LEGISLATURE_T_NONE'),
		('REFORM_JFD_LEGISLATURE_M_NONE',						'REFORM_JFD_LEGISLATURE_T_ECUMENICAL'),
		('REFORM_JFD_LEGISLATURE_M_NONE',						'REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS'),
		('REFORM_JFD_LEGISLATURE_M_NONE',						'REFORM_JFD_LEGISLATURE_HRE_NONE'),
		('REFORM_JFD_LEGISLATURE_M_NONE',						'REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR'),
		('REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY',				'REFORM_JFD_LEGISLATURE_S_DAIMYO'),
		('REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY',				'REFORM_JFD_LEGISLATURE_S_NONE'),
		('REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY',				'REFORM_JFD_LEGISLATURE_S_EMPEROR'),
		('REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY',				'REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC'),
		('REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY',				'REFORM_JFD_LEGISLATURE_M_NONE'),
		('REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY',				'REFORM_JFD_LEGISLATURE_D_MILITARY'),
		('REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY',				'REFORM_JFD_LEGISLATURE_D_PERSONAL'),
		('REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY',				'REFORM_JFD_LEGISLATURE_D_ONE_PARTY'),
		('REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY',				'REFORM_JFD_LEGISLATURE_R_OLIGARCHIC'),
		('REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY',				'REFORM_JFD_LEGISLATURE_R_NONE'),
		('REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY',				'REFORM_JFD_LEGISLATURE_R_DEMOCRATIC'),
		('REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY',				'REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS'),
		('REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY',				'REFORM_JFD_LEGISLATURE_T_NONE'),
		('REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY',				'REFORM_JFD_LEGISLATURE_T_ECUMENICAL'),
		('REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY',				'REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS'),
		('REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY',				'REFORM_JFD_LEGISLATURE_HRE_NONE'),
		('REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY',				'REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR'),
		--Legislature (Republic)
		('REFORM_JFD_LEGISLATURE_R_OLIGARCHIC',					'REFORM_JFD_LEGISLATURE_S_DAIMYO'),
		('REFORM_JFD_LEGISLATURE_R_OLIGARCHIC',					'REFORM_JFD_LEGISLATURE_S_NONE'),
		('REFORM_JFD_LEGISLATURE_R_OLIGARCHIC',					'REFORM_JFD_LEGISLATURE_S_EMPEROR'),
		('REFORM_JFD_LEGISLATURE_R_OLIGARCHIC',					'REFORM_JFD_LEGISLATURE_R_NONE'),
		('REFORM_JFD_LEGISLATURE_R_OLIGARCHIC',					'REFORM_JFD_LEGISLATURE_R_DEMOCRATIC'),
		('REFORM_JFD_LEGISLATURE_R_OLIGARCHIC',					'REFORM_JFD_LEGISLATURE_D_MILITARY'),
		('REFORM_JFD_LEGISLATURE_R_OLIGARCHIC',					'REFORM_JFD_LEGISLATURE_D_PERSONAL'),
		('REFORM_JFD_LEGISLATURE_R_OLIGARCHIC',					'REFORM_JFD_LEGISLATURE_D_ONE_PARTY'),
		('REFORM_JFD_LEGISLATURE_R_OLIGARCHIC',					'REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC'),
		('REFORM_JFD_LEGISLATURE_R_OLIGARCHIC',					'REFORM_JFD_LEGISLATURE_M_NONE'),
		('REFORM_JFD_LEGISLATURE_R_OLIGARCHIC',					'REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY'),
		('REFORM_JFD_LEGISLATURE_R_OLIGARCHIC',					'REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS'),
		('REFORM_JFD_LEGISLATURE_R_OLIGARCHIC',					'REFORM_JFD_LEGISLATURE_T_NONE'),
		('REFORM_JFD_LEGISLATURE_R_OLIGARCHIC',					'REFORM_JFD_LEGISLATURE_T_ECUMENICAL'),
		('REFORM_JFD_LEGISLATURE_R_OLIGARCHIC',					'REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS'),
		('REFORM_JFD_LEGISLATURE_R_OLIGARCHIC',					'REFORM_JFD_LEGISLATURE_HRE_NONE'),
		('REFORM_JFD_LEGISLATURE_R_OLIGARCHIC',					'REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR'),
		('REFORM_JFD_LEGISLATURE_R_NONE',						'REFORM_JFD_LEGISLATURE_S_DAIMYO'),
		('REFORM_JFD_LEGISLATURE_R_NONE',						'REFORM_JFD_LEGISLATURE_S_NONE'),
		('REFORM_JFD_LEGISLATURE_R_NONE',						'REFORM_JFD_LEGISLATURE_S_EMPEROR'),
		('REFORM_JFD_LEGISLATURE_R_NONE',						'REFORM_JFD_LEGISLATURE_R_DEMOCRATIC'),
		('REFORM_JFD_LEGISLATURE_R_NONE',						'REFORM_JFD_LEGISLATURE_R_OLIGARCHIC'),
		('REFORM_JFD_LEGISLATURE_R_NONE',						'REFORM_JFD_LEGISLATURE_D_MILITARY'),
		('REFORM_JFD_LEGISLATURE_R_NONE',						'REFORM_JFD_LEGISLATURE_D_PERSONAL'),
		('REFORM_JFD_LEGISLATURE_R_NONE',						'REFORM_JFD_LEGISLATURE_D_ONE_PARTY'),
		('REFORM_JFD_LEGISLATURE_R_NONE',						'REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC'),
		('REFORM_JFD_LEGISLATURE_R_NONE',						'REFORM_JFD_LEGISLATURE_M_NONE'),
		('REFORM_JFD_LEGISLATURE_R_NONE',						'REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY'),
		('REFORM_JFD_LEGISLATURE_R_NONE',						'REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS'),
		('REFORM_JFD_LEGISLATURE_R_NONE',						'REFORM_JFD_LEGISLATURE_T_NONE'),
		('REFORM_JFD_LEGISLATURE_R_NONE',						'REFORM_JFD_LEGISLATURE_T_ECUMENICAL'),
		('REFORM_JFD_LEGISLATURE_R_NONE',						'REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS'),
		('REFORM_JFD_LEGISLATURE_R_NONE',						'REFORM_JFD_LEGISLATURE_HRE_NONE'),
		('REFORM_JFD_LEGISLATURE_R_NONE',						'REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR'),
		('REFORM_JFD_LEGISLATURE_R_DEMOCRATIC',					'REFORM_JFD_LEGISLATURE_S_DAIMYO'),
		('REFORM_JFD_LEGISLATURE_R_DEMOCRATIC',					'REFORM_JFD_LEGISLATURE_S_NONE'),
		('REFORM_JFD_LEGISLATURE_R_DEMOCRATIC',					'REFORM_JFD_LEGISLATURE_S_EMPEROR'),
		('REFORM_JFD_LEGISLATURE_R_DEMOCRATIC',					'REFORM_JFD_LEGISLATURE_R_OLIGARCHIC'),
		('REFORM_JFD_LEGISLATURE_R_DEMOCRATIC',					'REFORM_JFD_LEGISLATURE_R_NONE'),
		('REFORM_JFD_LEGISLATURE_R_DEMOCRATIC',					'REFORM_JFD_LEGISLATURE_D_MILITARY'),
		('REFORM_JFD_LEGISLATURE_R_DEMOCRATIC',					'REFORM_JFD_LEGISLATURE_D_PERSONAL'),
		('REFORM_JFD_LEGISLATURE_R_DEMOCRATIC',					'REFORM_JFD_LEGISLATURE_D_ONE_PARTY'),
		('REFORM_JFD_LEGISLATURE_R_DEMOCRATIC',					'REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC'),
		('REFORM_JFD_LEGISLATURE_R_DEMOCRATIC',					'REFORM_JFD_LEGISLATURE_M_NONE'),
		('REFORM_JFD_LEGISLATURE_R_DEMOCRATIC',					'REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY'),
		('REFORM_JFD_LEGISLATURE_R_DEMOCRATIC',					'REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS'),
		('REFORM_JFD_LEGISLATURE_R_DEMOCRATIC',					'REFORM_JFD_LEGISLATURE_T_NONE'),
		('REFORM_JFD_LEGISLATURE_R_DEMOCRATIC',					'REFORM_JFD_LEGISLATURE_T_ECUMENICAL'),
		('REFORM_JFD_LEGISLATURE_R_DEMOCRATIC',					'REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS'),
		('REFORM_JFD_LEGISLATURE_R_DEMOCRATIC',					'REFORM_JFD_LEGISLATURE_HRE_NONE'),
		('REFORM_JFD_LEGISLATURE_R_DEMOCRATIC',					'REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR'),
		--Legislature (Shogunate)
		('REFORM_JFD_LEGISLATURE_S_DAIMYO',						'REFORM_JFD_LEGISLATURE_S_NONE'),
		('REFORM_JFD_LEGISLATURE_S_DAIMYO',						'REFORM_JFD_LEGISLATURE_S_EMPEROR'),
		('REFORM_JFD_LEGISLATURE_S_DAIMYO',						'REFORM_JFD_LEGISLATURE_D_PERSONAL'),
		('REFORM_JFD_LEGISLATURE_S_DAIMYO',						'REFORM_JFD_LEGISLATURE_D_ONE_PARTY'),
		('REFORM_JFD_LEGISLATURE_S_DAIMYO',						'REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC'),
		('REFORM_JFD_LEGISLATURE_S_DAIMYO',						'REFORM_JFD_LEGISLATURE_M_NONE'),
		('REFORM_JFD_LEGISLATURE_S_DAIMYO',						'REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY'),
		('REFORM_JFD_LEGISLATURE_S_DAIMYO',						'REFORM_JFD_LEGISLATURE_R_OLIGARCHIC'),
		('REFORM_JFD_LEGISLATURE_S_DAIMYO',						'REFORM_JFD_LEGISLATURE_R_NONE'),
		('REFORM_JFD_LEGISLATURE_S_DAIMYO',						'REFORM_JFD_LEGISLATURE_R_DEMOCRATIC'),
		('REFORM_JFD_LEGISLATURE_S_DAIMYO',						'REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS'),
		('REFORM_JFD_LEGISLATURE_S_DAIMYO',						'REFORM_JFD_LEGISLATURE_T_NONE'),
		('REFORM_JFD_LEGISLATURE_S_DAIMYO',						'REFORM_JFD_LEGISLATURE_T_ECUMENICAL'),
		('REFORM_JFD_LEGISLATURE_S_NONE',						'REFORM_JFD_LEGISLATURE_S_EMPEROR'),
		('REFORM_JFD_LEGISLATURE_S_NONE',						'REFORM_JFD_LEGISLATURE_S_DAIMYO'),
		('REFORM_JFD_LEGISLATURE_S_NONE',						'REFORM_JFD_LEGISLATURE_D_ONE_PARTY'),
		('REFORM_JFD_LEGISLATURE_S_NONE',						'REFORM_JFD_LEGISLATURE_D_MILITARY'),
		('REFORM_JFD_LEGISLATURE_S_NONE',						'REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC'),
		('REFORM_JFD_LEGISLATURE_S_NONE',						'REFORM_JFD_LEGISLATURE_M_NONE'),
		('REFORM_JFD_LEGISLATURE_S_NONE',						'REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY'),
		('REFORM_JFD_LEGISLATURE_S_NONE',						'REFORM_JFD_LEGISLATURE_R_OLIGARCHIC'),
		('REFORM_JFD_LEGISLATURE_S_NONE',						'REFORM_JFD_LEGISLATURE_R_NONE'),
		('REFORM_JFD_LEGISLATURE_S_NONE',						'REFORM_JFD_LEGISLATURE_R_DEMOCRATIC'),
		('REFORM_JFD_LEGISLATURE_S_NONE',						'REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS'),
		('REFORM_JFD_LEGISLATURE_S_NONE',						'REFORM_JFD_LEGISLATURE_T_NONE'),
		('REFORM_JFD_LEGISLATURE_S_NONE',						'REFORM_JFD_LEGISLATURE_T_ECUMENICAL'),
		('REFORM_JFD_LEGISLATURE_S_EMPEROR',					'REFORM_JFD_LEGISLATURE_S_DAIMYO'),
		('REFORM_JFD_LEGISLATURE_S_EMPEROR',					'REFORM_JFD_LEGISLATURE_S_NONE'),
		('REFORM_JFD_LEGISLATURE_S_EMPEROR',					'REFORM_JFD_LEGISLATURE_D_MILITARY'),
		('REFORM_JFD_LEGISLATURE_S_EMPEROR',					'REFORM_JFD_LEGISLATURE_D_PERSONAL'),
		('REFORM_JFD_LEGISLATURE_S_EMPEROR',					'REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC'),
		('REFORM_JFD_LEGISLATURE_S_EMPEROR',					'REFORM_JFD_LEGISLATURE_M_NONE'),
		('REFORM_JFD_LEGISLATURE_S_EMPEROR',					'REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY'),
		('REFORM_JFD_LEGISLATURE_S_EMPEROR',					'REFORM_JFD_LEGISLATURE_R_OLIGARCHIC'),
		('REFORM_JFD_LEGISLATURE_S_EMPEROR',					'REFORM_JFD_LEGISLATURE_R_NONE'),
		('REFORM_JFD_LEGISLATURE_S_EMPEROR',					'REFORM_JFD_LEGISLATURE_R_DEMOCRATIC'),
		('REFORM_JFD_LEGISLATURE_S_EMPEROR',					'REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS'),
		('REFORM_JFD_LEGISLATURE_S_EMPEROR',					'REFORM_JFD_LEGISLATURE_T_NONE'),
		('REFORM_JFD_LEGISLATURE_S_EMPEROR',					'REFORM_JFD_LEGISLATURE_T_ECUMENICAL'),
		--Legislature (Theocracy)
		('REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS',				'REFORM_JFD_LEGISLATURE_S_DAIMYO'),
		('REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS',				'REFORM_JFD_LEGISLATURE_S_NONE'),
		('REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS',				'REFORM_JFD_LEGISLATURE_S_EMPEROR'),
		('REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS',				'REFORM_JFD_LEGISLATURE_T_NONE'),
		('REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS',				'REFORM_JFD_LEGISLATURE_T_ECUMENICAL'),
		('REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS',				'REFORM_JFD_LEGISLATURE_D_MILITARY'),
		('REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS',				'REFORM_JFD_LEGISLATURE_D_PERSONAL'),
		('REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS',				'REFORM_JFD_LEGISLATURE_D_ONE_PARTY'),
		('REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS',				'REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC'),
		('REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS',				'REFORM_JFD_LEGISLATURE_M_NONE'),
		('REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS',				'REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY'),
		('REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS',				'REFORM_JFD_LEGISLATURE_R_OLIGARCHIC'),
		('REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS',				'REFORM_JFD_LEGISLATURE_R_NONE'),
		('REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS',				'REFORM_JFD_LEGISLATURE_R_DEMOCRATIC'),
		('REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS',				'REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS'),
		('REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS',				'REFORM_JFD_LEGISLATURE_HRE_NONE'),
		('REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS',				'REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR'),
		('REFORM_JFD_LEGISLATURE_T_NONE',						'REFORM_JFD_LEGISLATURE_S_DAIMYO'),
		('REFORM_JFD_LEGISLATURE_T_NONE',						'REFORM_JFD_LEGISLATURE_S_NONE'),
		('REFORM_JFD_LEGISLATURE_T_NONE',						'REFORM_JFD_LEGISLATURE_S_EMPEROR'),
		('REFORM_JFD_LEGISLATURE_T_NONE',						'REFORM_JFD_LEGISLATURE_T_ECUMENICAL'),
		('REFORM_JFD_LEGISLATURE_T_NONE',						'REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS'),
		('REFORM_JFD_LEGISLATURE_T_NONE',						'REFORM_JFD_LEGISLATURE_D_MILITARY'),
		('REFORM_JFD_LEGISLATURE_T_NONE',						'REFORM_JFD_LEGISLATURE_D_PERSONAL'),
		('REFORM_JFD_LEGISLATURE_T_NONE',						'REFORM_JFD_LEGISLATURE_D_ONE_PARTY'),
		('REFORM_JFD_LEGISLATURE_T_NONE',						'REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC'),
		('REFORM_JFD_LEGISLATURE_T_NONE',						'REFORM_JFD_LEGISLATURE_M_NONE'),
		('REFORM_JFD_LEGISLATURE_T_NONE',						'REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY'),
		('REFORM_JFD_LEGISLATURE_T_NONE',						'REFORM_JFD_LEGISLATURE_R_OLIGARCHIC'),
		('REFORM_JFD_LEGISLATURE_T_NONE',						'REFORM_JFD_LEGISLATURE_R_NONE'),
		('REFORM_JFD_LEGISLATURE_T_NONE',						'REFORM_JFD_LEGISLATURE_R_DEMOCRATIC'),
		('REFORM_JFD_LEGISLATURE_T_NONE',						'REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS'),
		('REFORM_JFD_LEGISLATURE_T_NONE',						'REFORM_JFD_LEGISLATURE_HRE_NONE'),
		('REFORM_JFD_LEGISLATURE_T_NONE',						'REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR'),
		('REFORM_JFD_LEGISLATURE_T_ECUMENICAL',					'REFORM_JFD_LEGISLATURE_S_DAIMYO'),
		('REFORM_JFD_LEGISLATURE_T_ECUMENICAL',					'REFORM_JFD_LEGISLATURE_S_NONE'),
		('REFORM_JFD_LEGISLATURE_T_ECUMENICAL',					'REFORM_JFD_LEGISLATURE_S_EMPEROR'),
		('REFORM_JFD_LEGISLATURE_T_ECUMENICAL',					'REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS'),
		('REFORM_JFD_LEGISLATURE_T_ECUMENICAL',					'REFORM_JFD_LEGISLATURE_T_NONE'),
		('REFORM_JFD_LEGISLATURE_T_ECUMENICAL',					'REFORM_JFD_LEGISLATURE_D_MILITARY'),
		('REFORM_JFD_LEGISLATURE_T_ECUMENICAL',					'REFORM_JFD_LEGISLATURE_D_PERSONAL'),
		('REFORM_JFD_LEGISLATURE_T_ECUMENICAL',					'REFORM_JFD_LEGISLATURE_D_ONE_PARTY'),
		('REFORM_JFD_LEGISLATURE_T_ECUMENICAL',					'REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC'),
		('REFORM_JFD_LEGISLATURE_T_ECUMENICAL',					'REFORM_JFD_LEGISLATURE_M_NONE'),
		('REFORM_JFD_LEGISLATURE_T_ECUMENICAL',					'REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY'),
		('REFORM_JFD_LEGISLATURE_T_ECUMENICAL',					'REFORM_JFD_LEGISLATURE_R_OLIGARCHIC'),
		('REFORM_JFD_LEGISLATURE_T_ECUMENICAL',					'REFORM_JFD_LEGISLATURE_R_NONE'),
		('REFORM_JFD_LEGISLATURE_T_ECUMENICAL',					'REFORM_JFD_LEGISLATURE_R_DEMOCRATIC'),
		('REFORM_JFD_LEGISLATURE_T_ECUMENICAL',					'REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS'),
		('REFORM_JFD_LEGISLATURE_T_ECUMENICAL',					'REFORM_JFD_LEGISLATURE_HRE_NONE'),
		('REFORM_JFD_LEGISLATURE_T_ECUMENICAL',					'REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR'),
		--Suffrage
		('REFORM_JFD_SUFFRAGE_LANDED',							'REFORM_JFD_SUFFRAGE_UNIVERSAL'),
		('REFORM_JFD_SUFFRAGE_LANDED',							'REFORM_JFD_SUFFRAGE_NONE'),
		('REFORM_JFD_SUFFRAGE_NONE',							'REFORM_JFD_SUFFRAGE_LANDED'),
		('REFORM_JFD_SUFFRAGE_NONE',							'REFORM_JFD_SUFFRAGE_UNIVERSAL'),
		('REFORM_JFD_SUFFRAGE_UNIVERSAL',						'REFORM_JFD_SUFFRAGE_NONE'),
		('REFORM_JFD_SUFFRAGE_UNIVERSAL',						'REFORM_JFD_SUFFRAGE_LANDED'),
		--Legitimacy (First)
		('REFORM_JFD_LEGITIMACY_WISDOM',						'REFORM_JFD_LEGITIMACY_WEALTH'),
		('REFORM_JFD_LEGITIMACY_WISDOM',						'REFORM_JFD_LEGITIMACY_MIGHT'),
		('REFORM_JFD_LEGITIMACY_MIGHT',							'REFORM_JFD_LEGITIMACY_WISDOM'),
		('REFORM_JFD_LEGITIMACY_MIGHT',							'REFORM_JFD_LEGITIMACY_WEALTH'),
		('REFORM_JFD_LEGITIMACY_WEALTH',						'REFORM_JFD_LEGITIMACY_MIGHT'),
		('REFORM_JFD_LEGITIMACY_WEALTH',						'REFORM_JFD_LEGITIMACY_WISDOM'),
		--Legitimacy (Second)
		('REFORM_JFD_LEGITIMACY_DIVINE_RIGHT',					'REFORM_JFD_LEGITIMACY_LAW'),
		('REFORM_JFD_LEGITIMACY_DIVINE_RIGHT',					'REFORM_JFD_LEGITIMACY_GOVERNANCE'),
		('REFORM_JFD_LEGITIMACY_GOVERNANCE',					'REFORM_JFD_LEGITIMACY_DIVINE_RIGHT'),
		('REFORM_JFD_LEGITIMACY_GOVERNANCE',					'REFORM_JFD_LEGITIMACY_LAW'),
		('REFORM_JFD_LEGITIMACY_LAW',							'REFORM_JFD_LEGITIMACY_GOVERNANCE'),
		('REFORM_JFD_LEGITIMACY_LAW',							'REFORM_JFD_LEGITIMACY_DIVINE_RIGHT'),
		--Legitimacy (Third)
		('REFORM_JFD_LEGITIMACY_SECURITY',						'REFORM_JFD_LEGITIMACY_CHARISMA'),
		('REFORM_JFD_LEGITIMACY_SECURITY',						'REFORM_JFD_LEGITIMACY_TRADITION'),
		('REFORM_JFD_LEGITIMACY_TRADITION',						'REFORM_JFD_LEGITIMACY_SECURITY'),
		('REFORM_JFD_LEGITIMACY_TRADITION',						'REFORM_JFD_LEGITIMACY_CHARISMA'),
		('REFORM_JFD_LEGITIMACY_CHARISMA',						'REFORM_JFD_LEGITIMACY_TRADITION'),
		('REFORM_JFD_LEGITIMACY_CHARISMA',						'REFORM_JFD_LEGITIMACY_SECURITY'),
		--Structure 
		('REFORM_JFD_STRUCTURE_UNITARY',						'REFORM_JFD_STRUCTURE_FEDERATION'),
		('REFORM_JFD_STRUCTURE_UNITARY',						'REFORM_JFD_STRUCTURE_ASSOCIATION'),
		('REFORM_JFD_STRUCTURE_ASSOCIATION',					'REFORM_JFD_STRUCTURE_UNITARY'),
		('REFORM_JFD_STRUCTURE_ASSOCIATION',					'REFORM_JFD_STRUCTURE_FEDERATION'),
		('REFORM_JFD_STRUCTURE_FEDERATION',						'REFORM_JFD_STRUCTURE_ASSOCIATION'),
		('REFORM_JFD_STRUCTURE_FEDERATION',						'REFORM_JFD_STRUCTURE_UNITARY'),
		--Succession 
		('REFORM_JFD_SUCCESSION_HEREDITARY',					'REFORM_JFD_SUCCESSION_ELECTIVE'),
		('REFORM_JFD_SUCCESSION_HEREDITARY',					'REFORM_JFD_SUCCESSION_APPOINTED'),
		('REFORM_JFD_SUCCESSION_APPOINTED',						'REFORM_JFD_SUCCESSION_HEREDITARY'),
		('REFORM_JFD_SUCCESSION_APPOINTED',						'REFORM_JFD_SUCCESSION_ELECTIVE'),
		('REFORM_JFD_SUCCESSION_ELECTIVE',						'REFORM_JFD_SUCCESSION_APPOINTED'),
		('REFORM_JFD_SUCCESSION_ELECTIVE',						'REFORM_JFD_SUCCESSION_HEREDITARY');
		
--Legal
INSERT INTO JFD_Reform_Negates
		(ReformType,											ReformNegateType)
VALUES	--Administration
		('REFORM_JFD_ADMINISTRATION_TECHNOCRATIC',				'REFORM_JFD_ADMINISTRATION_NEPOCRATIC'),
		('REFORM_JFD_ADMINISTRATION_TECHNOCRATIC',				'REFORM_JFD_ADMINISTRATION_BUREAUCRATIC'),
		('REFORM_JFD_ADMINISTRATION_NEPOCRATIC',				'REFORM_JFD_ADMINISTRATION_BUREAUCRATIC'),
		('REFORM_JFD_ADMINISTRATION_NEPOCRATIC',				'REFORM_JFD_ADMINISTRATION_TECHNOCRATIC'),
		('REFORM_JFD_ADMINISTRATION_BUREAUCRATIC',				'REFORM_JFD_ADMINISTRATION_TECHNOCRATIC'),
		('REFORM_JFD_ADMINISTRATION_BUREAUCRATIC',				'REFORM_JFD_ADMINISTRATION_NEPOCRATIC'),
		--Basis 
		('REFORM_JFD_BASIS_RELIGIOUS',							'REFORM_JFD_BASIS_SECULAR'),
		('REFORM_JFD_BASIS_RELIGIOUS',							'REFORM_JFD_BASIS_MORAL'),
		('REFORM_JFD_BASIS_MORAL',								'REFORM_JFD_BASIS_RELIGIOUS'),
		('REFORM_JFD_BASIS_MORAL',								'REFORM_JFD_BASIS_SECULAR'),
		('REFORM_JFD_BASIS_SECULAR',							'REFORM_JFD_BASIS_MORAL'),
		('REFORM_JFD_BASIS_SECULAR',							'REFORM_JFD_BASIS_RELIGIOUS'),
		--Constitution
		('REFORM_JFD_CONSTITUTION_CODIFIED',					'REFORM_JFD_CONSTITUTION_UNCODIFIED'),
		('REFORM_JFD_CONSTITUTION_CODIFIED',					'REFORM_JFD_CONSTITUTION_NONE'),
		('REFORM_JFD_CONSTITUTION_NONE',						'REFORM_JFD_CONSTITUTION_CODIFIED'),
		('REFORM_JFD_CONSTITUTION_NONE',						'REFORM_JFD_CONSTITUTION_UNCODIFIED'),
		('REFORM_JFD_CONSTITUTION_UNCODIFIED',					'REFORM_JFD_CONSTITUTION_NONE'),
		('REFORM_JFD_CONSTITUTION_UNCODIFIED',					'REFORM_JFD_CONSTITUTION_CODIFIED'),
		--Execution 
		('REFORM_JFD_EXECUTION_RESERVED',						'REFORM_JFD_EXECUTION_PROHIBITED'),
		('REFORM_JFD_EXECUTION_RESERVED',						'REFORM_JFD_EXECUTION_ARBITRARY'),
		('REFORM_JFD_EXECUTION_ARBITRARY',						'REFORM_JFD_EXECUTION_RESERVED'),
		('REFORM_JFD_EXECUTION_ARBITRARY',						'REFORM_JFD_EXECUTION_PROHIBITED'),
		('REFORM_JFD_EXECUTION_PROHIBITED',						'REFORM_JFD_EXECUTION_ARBITRARY'),
		('REFORM_JFD_EXECUTION_PROHIBITED',						'REFORM_JFD_EXECUTION_RESERVED'),
		--Immunity 
		('REFORM_JFD_IMMUNITY_SOVEREIGN',						'REFORM_JFD_IMMUNITY_NONE'),
		('REFORM_JFD_IMMUNITY_SOVEREIGN',						'REFORM_JFD_IMMUNITY_QUALIFIED'),
		('REFORM_JFD_IMMUNITY_QUALIFIED',						'REFORM_JFD_IMMUNITY_SOVEREIGN'),
		('REFORM_JFD_IMMUNITY_QUALIFIED',						'REFORM_JFD_IMMUNITY_NONE'),
		('REFORM_JFD_IMMUNITY_NONE',							'REFORM_JFD_IMMUNITY_QUALIFIED'),
		('REFORM_JFD_IMMUNITY_NONE',							'REFORM_JFD_IMMUNITY_SOVEREIGN'),
		--Judiciary
		('REFORM_JFD_JUDICIARY_DEPENDENT',						'REFORM_JFD_JUDICIARY_INDEPENDENT'),
		('REFORM_JFD_JUDICIARY_DEPENDENT',						'REFORM_JFD_JUDICIARY_NONE'),
		('REFORM_JFD_JUDICIARY_NONE',							'REFORM_JFD_JUDICIARY_DEPENDENT'),
		('REFORM_JFD_JUDICIARY_NONE',							'REFORM_JFD_JUDICIARY_INDEPENDENT'),
		('REFORM_JFD_JUDICIARY_INDEPENDENT',					'REFORM_JFD_JUDICIARY_NONE'),
		('REFORM_JFD_JUDICIARY_INDEPENDENT',					'REFORM_JFD_JUDICIARY_DEPENDENT'),
		--Peerage 	
		('REFORM_JFD_PEERAGE_PRIVILEGED',						'REFORM_JFD_PEERAGE_CEREMONIAL'),
		('REFORM_JFD_PEERAGE_PRIVILEGED',						'REFORM_JFD_PEERAGE_NONE'),
		('REFORM_JFD_PEERAGE_NONE',								'REFORM_JFD_PEERAGE_PRIVILEGED'),
		('REFORM_JFD_PEERAGE_NONE',								'REFORM_JFD_PEERAGE_CEREMONIAL'),
		('REFORM_JFD_PEERAGE_CEREMONIAL',						'REFORM_JFD_PEERAGE_NONE'),
		('REFORM_JFD_PEERAGE_CEREMONIAL',						'REFORM_JFD_PEERAGE_PRIVILEGED'),
		--Records
		('REFORM_JFD_RECORDS_WRITTEN',							'REFORM_JFD_RECORDS_ORAL'),
		('REFORM_JFD_RECORDS_WRITTEN',							'REFORM_JFD_RECORDS_NONE'),
		('REFORM_JFD_RECORDS_NONE',								'REFORM_JFD_RECORDS_WRITTEN'),
		('REFORM_JFD_RECORDS_NONE',								'REFORM_JFD_RECORDS_ORAL'),
		('REFORM_JFD_RECORDS_ORAL',								'REFORM_JFD_RECORDS_NONE'),
		('REFORM_JFD_RECORDS_ORAL',								'REFORM_JFD_RECORDS_WRITTEN'),
		--System 
		('REFORM_JFD_SYSTEM_CIVIL',								'REFORM_JFD_SYSTEM_COMMON'),
		('REFORM_JFD_SYSTEM_CIVIL',								'REFORM_JFD_SYSTEM_CUSTOMARY'),
		('REFORM_JFD_SYSTEM_CUSTOMARY',							'REFORM_JFD_SYSTEM_CIVIL'),
		('REFORM_JFD_SYSTEM_CUSTOMARY',							'REFORM_JFD_SYSTEM_COMMON'),
		('REFORM_JFD_SYSTEM_COMMON',							'REFORM_JFD_SYSTEM_CUSTOMARY'),
		('REFORM_JFD_SYSTEM_COMMON',							'REFORM_JFD_SYSTEM_CIVIL');
		
--Culture
INSERT INTO JFD_Reform_Negates	
		(ReformType,											ReformNegateType)
VALUES	--Heraldry	
		('REFORM_JFD_HERALDRY_MILITARY',						'REFORM_JFD_HERALDRY_CIVILIAN'),
		('REFORM_JFD_HERALDRY_MILITARY',						'REFORM_JFD_HERALDRY_NONE'),
		('REFORM_JFD_HERALDRY_NONE',							'REFORM_JFD_HERALDRY_MILITARY'),
		('REFORM_JFD_HERALDRY_NONE',							'REFORM_JFD_HERALDRY_CIVILIAN'),
		('REFORM_JFD_HERALDRY_CIVILIAN',						'REFORM_JFD_HERALDRY_NONE'),
		('REFORM_JFD_HERALDRY_CIVILIAN',						'REFORM_JFD_HERALDRY_MILITARY'),
		--Language
		('REFORM_JFD_LANGUAGE_PROTECTED',						'REFORM_JFD_LANGUAGE_ADAPTIVE'),
		('REFORM_JFD_LANGUAGE_PROTECTED',						'REFORM_JFD_LANGUAGE_NONE'),
		('REFORM_JFD_LANGUAGE_NONE',							'REFORM_JFD_LANGUAGE_PROTECTED'),
		('REFORM_JFD_LANGUAGE_NONE',							'REFORM_JFD_LANGUAGE_ADAPTIVE'),
		('REFORM_JFD_LANGUAGE_ADAPTIVE',						'REFORM_JFD_LANGUAGE_NONE'),
		('REFORM_JFD_LANGUAGE_ADAPTIVE',						'REFORM_JFD_LANGUAGE_PROTECTED'),
		--Marriage 	
		('REFORM_JFD_MARRIAGE_RELIGIOUS',						'REFORM_JFD_MARRIAGE_CIVIC'),
		('REFORM_JFD_MARRIAGE_RELIGIOUS',						'REFORM_JFD_MARRIAGE_PRIVATE'),
		('REFORM_JFD_MARRIAGE_PRIVATE',							'REFORM_JFD_MARRIAGE_RELIGIOUS'),
		('REFORM_JFD_MARRIAGE_PRIVATE',							'REFORM_JFD_MARRIAGE_CIVIC'),
		('REFORM_JFD_MARRIAGE_CIVIC',							'REFORM_JFD_MARRIAGE_PRIVATE'),
		('REFORM_JFD_MARRIAGE_CIVIC',							'REFORM_JFD_MARRIAGE_RELIGIOUS'),
		--Media 	
		('REFORM_JFD_MEDIA_STATE',								'REFORM_JFD_MEDIA_INDEPENDENT'),
		('REFORM_JFD_MEDIA_STATE',								'REFORM_JFD_MEDIA_NONE'),
		('REFORM_JFD_MEDIA_NONE',								'REFORM_JFD_MEDIA_STATE'),
		('REFORM_JFD_MEDIA_NONE',								'REFORM_JFD_MEDIA_INDEPENDENT'),
		('REFORM_JFD_MEDIA_INDEPENDENT',						'REFORM_JFD_MEDIA_NONE'),
		('REFORM_JFD_MEDIA_INDEPENDENT',						'REFORM_JFD_MEDIA_STATE'),
		--Patronage	
		('REFORM_JFD_PATRONAGE_ARTISTS',						'REFORM_JFD_PATRONAGE_MERCHANTS'),
		('REFORM_JFD_PATRONAGE_ARTISTS',						'REFORM_JFD_PATRONAGE_NONE'),
		('REFORM_JFD_PATRONAGE_NONE',							'REFORM_JFD_PATRONAGE_ARTISTS'),
		('REFORM_JFD_PATRONAGE_NONE',							'REFORM_JFD_PATRONAGE_MERCHANTS'),
		('REFORM_JFD_PATRONAGE_MERCHANTS',						'REFORM_JFD_PATRONAGE_NONE'),
		('REFORM_JFD_PATRONAGE_MERCHANTS',						'REFORM_JFD_PATRONAGE_ARTISTS'),
		--Publications
		('REFORM_JFD_PUBLICATIONS_PRIVATE',						'REFORM_JFD_PUBLICATIONS_PUBLIC'),
		('REFORM_JFD_PUBLICATIONS_PRIVATE',						'REFORM_JFD_PUBLICATIONS_NONE'),
		('REFORM_JFD_PUBLICATIONS_NONE',						'REFORM_JFD_PUBLICATIONS_PRIVATE'),
		('REFORM_JFD_PUBLICATIONS_NONE',						'REFORM_JFD_PUBLICATIONS_PUBLIC'),
		('REFORM_JFD_PUBLICATIONS_PUBLIC',						'REFORM_JFD_PUBLICATIONS_NONE'),
		('REFORM_JFD_PUBLICATIONS_PUBLIC',						'REFORM_JFD_PUBLICATIONS_PRIVATE'),
		--Public Works 	
		('REFORM_JFD_PUBLIC_WORKS_CEREMONIAL',					'REFORM_JFD_PUBLIC_WORKS_CIVIC'),
		('REFORM_JFD_PUBLIC_WORKS_CEREMONIAL',					'REFORM_JFD_PUBLIC_WORKS_NONE'),
		('REFORM_JFD_PUBLIC_WORKS_NONE',						'REFORM_JFD_PUBLIC_WORKS_CEREMONIAL'),
		('REFORM_JFD_PUBLIC_WORKS_NONE',						'REFORM_JFD_PUBLIC_WORKS_CIVIC'),
		('REFORM_JFD_PUBLIC_WORKS_CIVIC',						'REFORM_JFD_PUBLIC_WORKS_NONE'),
		('REFORM_JFD_PUBLIC_WORKS_CIVIC',						'REFORM_JFD_PUBLIC_WORKS_CEREMONIAL'),	
		--Society
		('REFORM_JFD_SOCIETY_CASTE',							'REFORM_JFD_SOCIETY_CLASS'),
		('REFORM_JFD_SOCIETY_CASTE',							'REFORM_JFD_SOCIETY_FAMILY'),
		('REFORM_JFD_SOCIETY_FAMILY',							'REFORM_JFD_SOCIETY_CASTE'),
		('REFORM_JFD_SOCIETY_FAMILY',							'REFORM_JFD_SOCIETY_CLASS'),
		('REFORM_JFD_SOCIETY_CLASS',							'REFORM_JFD_SOCIETY_FAMILY'),
		('REFORM_JFD_SOCIETY_CLASS',							'REFORM_JFD_SOCIETY_CASTE'),
		--Speech 	
		('REFORM_JFD_SPEECH_CENSORED',							'REFORM_JFD_SPEECH_FREE'),
		('REFORM_JFD_SPEECH_CENSORED',							'REFORM_JFD_SPEECH_ANTI_LIBEL'),
		('REFORM_JFD_SPEECH_ANTI_LIBEL',						'REFORM_JFD_SPEECH_CENSORED'),
		('REFORM_JFD_SPEECH_ANTI_LIBEL',						'REFORM_JFD_SPEECH_FREE'),
		('REFORM_JFD_SPEECH_FREE',								'REFORM_JFD_SPEECH_ANTI_LIBEL'),
		('REFORM_JFD_SPEECH_FREE',								'REFORM_JFD_SPEECH_CENSORED');		
		
--Economic
INSERT INTO JFD_Reform_Negates	
		(ReformType,											ReformNegateType)
VALUES	--Currency
		('REFORM_JFD_CURRENCY_CREDIT',							'REFORM_JFD_CURRENCY_BARTER'),
		('REFORM_JFD_CURRENCY_CREDIT',							'REFORM_JFD_CURRENCY_TENDER'),
		('REFORM_JFD_CURRENCY_BARTER',							'REFORM_JFD_CURRENCY_TENDER'),
		('REFORM_JFD_CURRENCY_BARTER',							'REFORM_JFD_CURRENCY_CREDIT'),
		('REFORM_JFD_CURRENCY_TENDER',							'REFORM_JFD_CURRENCY_CREDIT'),
		('REFORM_JFD_CURRENCY_TENDER',							'REFORM_JFD_CURRENCY_BARTER'),
		--Development
		('REFORM_JFD_DEVELOPMENT_HAPPINESS',					'REFORM_JFD_DEVELOPMENT_BALANCED'),
		('REFORM_JFD_DEVELOPMENT_HAPPINESS',					'REFORM_JFD_DEVELOPMENT_HEALTH'),
		('REFORM_JFD_DEVELOPMENT_BALANCED',						'REFORM_JFD_DEVELOPMENT_HEALTH'),
		('REFORM_JFD_DEVELOPMENT_BALANCED',						'REFORM_JFD_DEVELOPMENT_HAPPINESS'),
		('REFORM_JFD_DEVELOPMENT_HEALTH',						'REFORM_JFD_DEVELOPMENT_HAPPINESS'),
		('REFORM_JFD_DEVELOPMENT_HEALTH',						'REFORM_JFD_DEVELOPMENT_BALANCED'),
		--Guilds
		('REFORM_JFD_GUILDS_CRAFTS',							'REFORM_JFD_GUILDS_COMMERCIAL'),
		('REFORM_JFD_GUILDS_CRAFTS',							'REFORM_JFD_GUILDS_NONE'),
		('REFORM_JFD_GUILDS_NONE',								'REFORM_JFD_GUILDS_CRAFTS'),
		('REFORM_JFD_GUILDS_NONE',								'REFORM_JFD_GUILDS_COMMERCIAL'),
		('REFORM_JFD_GUILDS_COMMERCIAL',						'REFORM_JFD_GUILDS_NONE'),
		('REFORM_JFD_GUILDS_COMMERCIAL',						'REFORM_JFD_GUILDS_CRAFTS'),
		--Organization
		('REFORM_JFD_ORGANIZATION_MUNICIPAL',					'REFORM_JFD_ORGANIZATION_BALANCED'),
		('REFORM_JFD_ORGANIZATION_MUNICIPAL',					'REFORM_JFD_ORGANIZATION_MANORIAL'),
		('REFORM_JFD_ORGANIZATION_BALANCED',					'REFORM_JFD_ORGANIZATION_MANORIAL'),
		('REFORM_JFD_ORGANIZATION_BALANCED',					'REFORM_JFD_ORGANIZATION_MUNICIPAL'),
		('REFORM_JFD_ORGANIZATION_MANORIAL',					'REFORM_JFD_ORGANIZATION_MUNICIPAL'),
		('REFORM_JFD_ORGANIZATION_MANORIAL',					'REFORM_JFD_ORGANIZATION_BALANCED'),
		--Market
		('REFORM_JFD_MARKET_FREE',								'REFORM_JFD_MARKET_MIXED'),
		('REFORM_JFD_MARKET_FREE',								'REFORM_JFD_MARKET_PLANNED'),
		('REFORM_JFD_MARKET_MIXED',								'REFORM_JFD_MARKET_PLANNED'),
		('REFORM_JFD_MARKET_MIXED',								'REFORM_JFD_MARKET_FREE'),
		('REFORM_JFD_MARKET_PLANNED',							'REFORM_JFD_MARKET_FREE'),
		('REFORM_JFD_MARKET_PLANNED',							'REFORM_JFD_MARKET_MIXED'),
		--Taxation (Church)
		('REFORM_JFD_C_TAXATION_EXEMPT',						'REFORM_JFD_C_TAXATION_STANDARD'),
		('REFORM_JFD_C_TAXATION_EXEMPT',						'REFORM_JFD_C_TAXATION_HIGH'),
		('REFORM_JFD_C_TAXATION_STANDARD',						'REFORM_JFD_C_TAXATION_HIGH'),
		('REFORM_JFD_C_TAXATION_STANDARD',						'REFORM_JFD_C_TAXATION_EXEMPT'),
		('REFORM_JFD_C_TAXATION_HIGH',							'REFORM_JFD_C_TAXATION_EXEMPT'),
		('REFORM_JFD_C_TAXATION_HIGH',							'REFORM_JFD_C_TAXATION_STANDARD'),
		--Taxation (Commons)
		('REFORM_JFD_L_TAXATION_EXEMPT',						'REFORM_JFD_L_TAXATION_STANDARD'),
		('REFORM_JFD_L_TAXATION_EXEMPT',						'REFORM_JFD_L_TAXATION_HIGH'),
		('REFORM_JFD_L_TAXATION_STANDARD',						'REFORM_JFD_L_TAXATION_HIGH'),
		('REFORM_JFD_L_TAXATION_STANDARD',						'REFORM_JFD_L_TAXATION_EXEMPT'),
		('REFORM_JFD_L_TAXATION_HIGH',							'REFORM_JFD_L_TAXATION_EXEMPT'),
		('REFORM_JFD_L_TAXATION_HIGH',							'REFORM_JFD_L_TAXATION_STANDARD'),
		--Taxation (Elite)
		('REFORM_JFD_U_TAXATION_EXEMPT',						'REFORM_JFD_U_TAXATION_STANDARD'),
		('REFORM_JFD_U_TAXATION_EXEMPT',						'REFORM_JFD_U_TAXATION_HIGH'),
		('REFORM_JFD_U_TAXATION_STANDARD',						'REFORM_JFD_U_TAXATION_HIGH'),
		('REFORM_JFD_U_TAXATION_STANDARD',						'REFORM_JFD_U_TAXATION_EXEMPT'),
		('REFORM_JFD_U_TAXATION_HIGH',							'REFORM_JFD_U_TAXATION_EXEMPT'),
		('REFORM_JFD_U_TAXATION_HIGH',							'REFORM_JFD_U_TAXATION_STANDARD'),
		--Welfare
		('REFORM_JFD_WELFARE_STATE',							'REFORM_JFD_WELFARE_CHARITY'),
		('REFORM_JFD_WELFARE_STATE',							'REFORM_JFD_WELFARE_BASIC'),
		('REFORM_JFD_WELFARE_BASIC',							'REFORM_JFD_WELFARE_STATE'),
		('REFORM_JFD_WELFARE_BASIC',							'REFORM_JFD_WELFARE_CHARITY'),
		('REFORM_JFD_WELFARE_CHARITY',							'REFORM_JFD_WELFARE_BASIC'),
		('REFORM_JFD_WELFARE_CHARITY',							'REFORM_JFD_WELFARE_STATE');
		
--Foreign
INSERT INTO JFD_Reform_Negates	
		(ReformType,											ReformNegateType)
VALUES	--Citizenship	
		('REFORM_JFD_CITIZENSHIP_NONE',							'REFORM_JFD_CITIZENSHIP_LIMITED'),
		('REFORM_JFD_CITIZENSHIP_NONE',							'REFORM_JFD_CITIZENSHIP_FULL'),
		('REFORM_JFD_CITIZENSHIP_LIMITED',						'REFORM_JFD_CITIZENSHIP_FULL'),
		('REFORM_JFD_CITIZENSHIP_LIMITED',						'REFORM_JFD_CITIZENSHIP_NONE'),
		('REFORM_JFD_CITIZENSHIP_FULL',							'REFORM_JFD_CITIZENSHIP_NONE'),
		('REFORM_JFD_CITIZENSHIP_FULL',							'REFORM_JFD_CITIZENSHIP_LIMITED'),
		--Claims
		('REFORM_JFD_CLAIMS_CAUSE',								'REFORM_JFD_CLAIMS_MIXED'),
		('REFORM_JFD_CLAIMS_CAUSE',								'REFORM_JFD_CLAIMS_INVESTMENT'),
		('REFORM_JFD_CLAIMS_MIXED',								'REFORM_JFD_CLAIMS_INVESTMENT'),
		('REFORM_JFD_CLAIMS_MIXED',								'REFORM_JFD_CLAIMS_CAUSE'),
		('REFORM_JFD_CLAIMS_INVESTMENT',						'REFORM_JFD_CLAIMS_CAUSE'),
		('REFORM_JFD_CLAIMS_INVESTMENT',						'REFORM_JFD_CLAIMS_MIXED'),
		--Intelligence
		('REFORM_JFD_INTELLIGENCE_COVERT',						'REFORM_JFD_INTELLIGENCE_PASSIVE'),
		('REFORM_JFD_INTELLIGENCE_COVERT',						'REFORM_JFD_INTELLIGENCE_CLANDESTINE'),
		('REFORM_JFD_INTELLIGENCE_PASSIVE',						'REFORM_JFD_INTELLIGENCE_CLANDESTINE'),
		('REFORM_JFD_INTELLIGENCE_PASSIVE',						'REFORM_JFD_INTELLIGENCE_COVERT'),
		('REFORM_JFD_INTELLIGENCE_CLANDESTINE',					'REFORM_JFD_INTELLIGENCE_COVERT'),
		('REFORM_JFD_INTELLIGENCE_CLANDESTINE',					'REFORM_JFD_INTELLIGENCE_PASSIVE'),	
		--Power
		('REFORM_JFD_POWER_HARD',								'REFORM_JFD_POWER_BALANCED'),
		('REFORM_JFD_POWER_HARD',								'REFORM_JFD_POWER_SOFT'),
		('REFORM_JFD_POWER_BALANCED',							'REFORM_JFD_POWER_SOFT'),
		('REFORM_JFD_POWER_BALANCED',							'REFORM_JFD_POWER_HARD'),
		('REFORM_JFD_POWER_SOFT',								'REFORM_JFD_POWER_HARD'),
		('REFORM_JFD_POWER_SOFT',								'REFORM_JFD_POWER_BALANCED'),
		--Taxation (Colonies)
		('REFORM_JFD_CO_TAXATION_EXEMPT',						'REFORM_JFD_CO_TAXATION_STANDARD'),
		('REFORM_JFD_CO_TAXATION_EXEMPT',						'REFORM_JFD_CO_TAXATION_HIGH'),
		('REFORM_JFD_CO_TAXATION_STANDARD',						'REFORM_JFD_CO_TAXATION_HIGH'),
		('REFORM_JFD_CO_TAXATION_STANDARD',						'REFORM_JFD_CO_TAXATION_EXEMPT'),
		('REFORM_JFD_CO_TAXATION_HIGH',							'REFORM_JFD_CO_TAXATION_EXEMPT'),
		('REFORM_JFD_CO_TAXATION_HIGH',							'REFORM_JFD_CO_TAXATION_STANDARD'),
		--Tourism
		('REFORM_JFD_TOURISM_LIMITED',							'REFORM_JFD_TOURISM_NONE'),
		('REFORM_JFD_TOURISM_LIMITED',							'REFORM_JFD_TOURISM_FREE'),
		('REFORM_JFD_TOURISM_NONE',								'REFORM_JFD_TOURISM_FREE'),
		('REFORM_JFD_TOURISM_NONE',								'REFORM_JFD_TOURISM_LIMITED'),
		('REFORM_JFD_TOURISM_FREE',								'REFORM_JFD_TOURISM_LIMITED'),
		('REFORM_JFD_TOURISM_FREE',								'REFORM_JFD_TOURISM_NONE'),
		--Trade
		('REFORM_JFD_TRADE_REGULATED',							'REFORM_JFD_TRADE_NONE'),
		('REFORM_JFD_TRADE_REGULATED',							'REFORM_JFD_TRADE_FREE'),
		('REFORM_JFD_TRADE_NONE',								'REFORM_JFD_TRADE_FREE'),
		('REFORM_JFD_TRADE_NONE',								'REFORM_JFD_TRADE_REGULATED'),
		('REFORM_JFD_TRADE_FREE',								'REFORM_JFD_TRADE_REGULATED'),
		('REFORM_JFD_TRADE_FREE',								'REFORM_JFD_TRADE_NONE'),
		--Tribes	
		('REFORM_JFD_TRIBES_RESERVATION',						'REFORM_JFD_TRIBES_NONE'),
		('REFORM_JFD_TRIBES_RESERVATION',						'REFORM_JFD_TRIBES_ASSIMILATION'),
		('REFORM_JFD_TRIBES_NONE',								'REFORM_JFD_TRIBES_ASSIMILATION'),
		('REFORM_JFD_TRIBES_NONE',								'REFORM_JFD_TRIBES_RESERVATION'),
		('REFORM_JFD_TRIBES_ASSIMILATION',						'REFORM_JFD_TRIBES_RESERVATION'),
		('REFORM_JFD_TRIBES_ASSIMILATION',						'REFORM_JFD_TRIBES_NONE');
		
--Industry
INSERT INTO JFD_Reform_Negates	
		(ReformType,											ReformNegateType)
VALUES	--Education
		('REFORM_JFD_EDUCATION_TECHNICAL',						'REFORM_JFD_EDUCATION_NONE'),
		('REFORM_JFD_EDUCATION_TECHNICAL',						'REFORM_JFD_EDUCATION_ACADEMIC'),
		('REFORM_JFD_EDUCATION_NONE',							'REFORM_JFD_EDUCATION_ACADEMIC'),
		('REFORM_JFD_EDUCATION_NONE',							'REFORM_JFD_EDUCATION_TECHNICAL'),
		('REFORM_JFD_EDUCATION_ACADEMIC',						'REFORM_JFD_EDUCATION_TECHNICAL'),
		('REFORM_JFD_EDUCATION_ACADEMIC',						'REFORM_JFD_EDUCATION_NONE'),
		--Environment
		('REFORM_JFD_ENVIRONMENT_PROTECTED',					'REFORM_JFD_ENVIRONMENT_NONE'),
		('REFORM_JFD_ENVIRONMENT_PROTECTED',					'REFORM_JFD_ENVIRONMENT_EXTORTED'),
		('REFORM_JFD_ENVIRONMENT_NONE',							'REFORM_JFD_ENVIRONMENT_EXTORTED'),
		('REFORM_JFD_ENVIRONMENT_NONE',							'REFORM_JFD_ENVIRONMENT_PROTECTED'),
		('REFORM_JFD_ENVIRONMENT_EXTORTED',						'REFORM_JFD_ENVIRONMENT_PROTECTED'),
		('REFORM_JFD_ENVIRONMENT_EXTORTED',						'REFORM_JFD_ENVIRONMENT_NONE'),
		--Healthcare
		('REFORM_JFD_HEALTHCARE_PUBLIC',						'REFORM_JFD_HEALTHCARE_BASIC'),
		('REFORM_JFD_HEALTHCARE_PUBLIC',						'REFORM_JFD_HEALTHCARE_PRIVATE'),
		('REFORM_JFD_HEALTHCARE_BASIC',							'REFORM_JFD_HEALTHCARE_PRIVATE'),
		('REFORM_JFD_HEALTHCARE_BASIC',							'REFORM_JFD_HEALTHCARE_PUBLIC'),
		('REFORM_JFD_HEALTHCARE_PRIVATE',						'REFORM_JFD_HEALTHCARE_PUBLIC'),
		('REFORM_JFD_HEALTHCARE_PRIVATE',						'REFORM_JFD_HEALTHCARE_BASIC'),
		--Labour
		('REFORM_JFD_LABOUR_BONDED',							'REFORM_JFD_LABOUR_CORVEE'),
		('REFORM_JFD_LABOUR_BONDED',							'REFORM_JFD_LABOUR_EMANCIPATED'),
		('REFORM_JFD_LABOUR_CORVEE',							'REFORM_JFD_LABOUR_EMANCIPATED'),
		('REFORM_JFD_LABOUR_CORVEE',							'REFORM_JFD_LABOUR_BONDED'),
		('REFORM_JFD_LABOUR_EMANCIPATED',						'REFORM_JFD_LABOUR_BONDED'),
		('REFORM_JFD_LABOUR_EMANCIPATED',						'REFORM_JFD_LABOUR_CORVEE'),
		--Patents
		('REFORM_JFD_PATENTS_UNLIMITED',						'REFORM_JFD_PATENTS_LETTERS'),
		('REFORM_JFD_PATENTS_UNLIMITED',						'REFORM_JFD_PATENTS_LIMITED'),
		('REFORM_JFD_PATENTS_LETTERS',							'REFORM_JFD_PATENTS_LIMITED'),
		('REFORM_JFD_PATENTS_LETTERS',							'REFORM_JFD_PATENTS_UNLIMITED'),
		('REFORM_JFD_PATENTS_LIMITED',							'REFORM_JFD_PATENTS_UNLIMITED'),
		('REFORM_JFD_PATENTS_LIMITED',							'REFORM_JFD_PATENTS_LETTERS'),
		--Planning
		('REFORM_JFD_PLANNING_RURAL',							'REFORM_JFD_PLANNING_BALANCED'),
		('REFORM_JFD_PLANNING_RURAL',							'REFORM_JFD_PLANNING_URBAN'),
		('REFORM_JFD_PLANNING_BALANCED',						'REFORM_JFD_PLANNING_URBAN'),
		('REFORM_JFD_PLANNING_BALANCED',						'REFORM_JFD_PLANNING_RURAL'),
		('REFORM_JFD_PLANNING_URBAN',							'REFORM_JFD_PLANNING_RURAL'),
		('REFORM_JFD_PLANNING_URBAN',							'REFORM_JFD_PLANNING_BALANCED'),
		--Property
		('REFORM_JFD_PROPERTY_PRIVATE',							'REFORM_JFD_PROPERTY_PERSONAL'),
		('REFORM_JFD_PROPERTY_PRIVATE',							'REFORM_JFD_PROPERTY_STATE'),
		('REFORM_JFD_PROPERTY_PERSONAL',						'REFORM_JFD_PROPERTY_STATE'),
		('REFORM_JFD_PROPERTY_PERSONAL',						'REFORM_JFD_PROPERTY_PRIVATE'),
		('REFORM_JFD_PROPERTY_STATE',							'REFORM_JFD_PROPERTY_PRIVATE'),
		('REFORM_JFD_PROPERTY_STATE',							'REFORM_JFD_PROPERTY_PERSONAL'),
		--Scholarship
		('REFORM_JFD_SCHOLARSHIP_ENGINEERING',					'REFORM_JFD_SCHOLARSHIP_NONE'),
		('REFORM_JFD_SCHOLARSHIP_ENGINEERING',					'REFORM_JFD_SCHOLARSHIP_RESEARCH'),
		('REFORM_JFD_SCHOLARSHIP_NONE',							'REFORM_JFD_SCHOLARSHIP_RESEARCH'),
		('REFORM_JFD_SCHOLARSHIP_NONE',							'REFORM_JFD_SCHOLARSHIP_ENGINEERING'),
		('REFORM_JFD_SCHOLARSHIP_RESEARCH',						'REFORM_JFD_SCHOLARSHIP_ENGINEERING'),
		('REFORM_JFD_SCHOLARSHIP_RESEARCH',						'REFORM_JFD_SCHOLARSHIP_NONE'),
		--Trade Unions
		('REFORM_JFD_TRADE_UNIONS_STATE',						'REFORM_JFD_TRADE_UNIONS_NONE'),
		('REFORM_JFD_TRADE_UNIONS_STATE',						'REFORM_JFD_TRADE_UNIONS_FREE'),
		('REFORM_JFD_TRADE_UNIONS_NONE',						'REFORM_JFD_TRADE_UNIONS_FREE'),
		('REFORM_JFD_TRADE_UNIONS_NONE',						'REFORM_JFD_TRADE_UNIONS_STATE'),
		('REFORM_JFD_TRADE_UNIONS_FREE',						'REFORM_JFD_TRADE_UNIONS_STATE'),
		('REFORM_JFD_TRADE_UNIONS_FREE',						'REFORM_JFD_TRADE_UNIONS_NONE');
		
--Military
INSERT INTO JFD_Reform_Negates	
		(ReformType,											ReformNegateType)
VALUES	--Command
		('REFORM_JFD_COMMAND_SOVEREIGN',						'REFORM_JFD_COMMAND_MILITARY'),
		('REFORM_JFD_COMMAND_SOVEREIGN',						'REFORM_JFD_COMMAND_STATE'),
		('REFORM_JFD_COMMAND_MILITARY',							'REFORM_JFD_COMMAND_STATE'),
		('REFORM_JFD_COMMAND_MILITARY',							'REFORM_JFD_COMMAND_SOVEREIGN'),
		('REFORM_JFD_COMMAND_STATE',							'REFORM_JFD_COMMAND_SOVEREIGN'),
		('REFORM_JFD_COMMAND_STATE',							'REFORM_JFD_COMMAND_MILITARY'),
		--Conflict
		('REFORM_JFD_CONFLICT_OFFENSE',							'REFORM_JFD_CONFLICT_MIXED'),
		('REFORM_JFD_CONFLICT_OFFENSE',							'REFORM_JFD_CONFLICT_DEFENSE'),
		('REFORM_JFD_CONFLICT_MIXED',							'REFORM_JFD_CONFLICT_DEFENSE'),
		('REFORM_JFD_CONFLICT_MIXED',							'REFORM_JFD_CONFLICT_OFFENSE'),
		('REFORM_JFD_CONFLICT_DEFENSE',							'REFORM_JFD_CONFLICT_OFFENSE'),
		('REFORM_JFD_CONFLICT_DEFENSE',							'REFORM_JFD_CONFLICT_MIXED'),
		--Conquest
		('REFORM_JFD_CONQUEST_SUBJUGATION',						'REFORM_JFD_CONQUEST_ASSIMILATION'),
		('REFORM_JFD_CONQUEST_SUBJUGATION',						'REFORM_JFD_CONQUEST_COOPTATION'),
		('REFORM_JFD_CONQUEST_ASSIMILATION',					'REFORM_JFD_CONQUEST_COOPTATION'),
		('REFORM_JFD_CONQUEST_ASSIMILATION',					'REFORM_JFD_CONQUEST_SUBJUGATION'),
		('REFORM_JFD_CONQUEST_COOPTATION',						'REFORM_JFD_CONQUEST_SUBJUGATION'),
		('REFORM_JFD_CONQUEST_COOPTATION',						'REFORM_JFD_CONQUEST_ASSIMILATION'),
		--Levies
		('REFORM_JFD_LEVIES_FRONTLINE',							'REFORM_JFD_LEVIES_STANDARD'),
		('REFORM_JFD_LEVIES_FRONTLINE',							'REFORM_JFD_LEVIES_RESERVE'),
		('REFORM_JFD_LEVIES_STANDARD',							'REFORM_JFD_LEVIES_RESERVE'),
		('REFORM_JFD_LEVIES_STANDARD',							'REFORM_JFD_LEVIES_FRONTLINE'),
		('REFORM_JFD_LEVIES_RESERVE',							'REFORM_JFD_LEVIES_FRONTLINE'),
		('REFORM_JFD_LEVIES_RESERVE',							'REFORM_JFD_LEVIES_STANDARD'),
		--Police
		('REFORM_JFD_POLICE_MILITARY',							'REFORM_JFD_POLICE_VOLUNTEER'),
		('REFORM_JFD_POLICE_MILITARY',							'REFORM_JFD_POLICE_CIVILIAN'),
		('REFORM_JFD_POLICE_VOLUNTEER',							'REFORM_JFD_POLICE_CIVILIAN'),
		('REFORM_JFD_POLICE_VOLUNTEER',							'REFORM_JFD_POLICE_MILITARY'),
		('REFORM_JFD_POLICE_CIVILIAN',							'REFORM_JFD_POLICE_MILITARY'),
		('REFORM_JFD_POLICE_CIVILIAN',							'REFORM_JFD_POLICE_VOLUNTEER'),
		--Recruitment
		('REFORM_JFD_RECRUITMENT_PROFESSIONAL',					'REFORM_JFD_RECRUITMENT_CONSCRIPT'),
		('REFORM_JFD_RECRUITMENT_PROFESSIONAL',					'REFORM_JFD_RECRUITMENT_MERCENARY'),
		('REFORM_JFD_RECRUITMENT_CONSCRIPT',					'REFORM_JFD_RECRUITMENT_MERCENARY'),
		('REFORM_JFD_RECRUITMENT_CONSCRIPT',					'REFORM_JFD_RECRUITMENT_PROFESSIONAL'),
		('REFORM_JFD_RECRUITMENT_MERCENARY',					'REFORM_JFD_RECRUITMENT_PROFESSIONAL'),
		('REFORM_JFD_RECRUITMENT_MERCENARY',					'REFORM_JFD_RECRUITMENT_CONSCRIPT'),
		--Slavery
		('REFORM_JFD_SLAVERY_ELITE',							'REFORM_JFD_SLAVERY_STANDARD'),
		('REFORM_JFD_SLAVERY_ELITE',							'REFORM_JFD_SLAVERY_DISPOSABLE'),
		('REFORM_JFD_SLAVERY_STANDARD',							'REFORM_JFD_SLAVERY_DISPOSABLE'),
		('REFORM_JFD_SLAVERY_STANDARD',							'REFORM_JFD_SLAVERY_ELITE'),
		('REFORM_JFD_SLAVERY_DISPOSABLE',						'REFORM_JFD_SLAVERY_ELITE'),
		('REFORM_JFD_SLAVERY_DISPOSABLE',						'REFORM_JFD_SLAVERY_STANDARD'),
		--Technology
		('REFORM_JFD_TECHNOLOGY_TACTICS',						'REFORM_JFD_TECHNOLOGY_BALANCED'),
		('REFORM_JFD_TECHNOLOGY_TACTICS',						'REFORM_JFD_TECHNOLOGY_EQUIPMENT'),
		('REFORM_JFD_TECHNOLOGY_BALANCED',						'REFORM_JFD_TECHNOLOGY_EQUIPMENT'),
		('REFORM_JFD_TECHNOLOGY_BALANCED',						'REFORM_JFD_TECHNOLOGY_TACTICS'),
		('REFORM_JFD_TECHNOLOGY_EQUIPMENT',						'REFORM_JFD_TECHNOLOGY_TACTICS'),
		('REFORM_JFD_TECHNOLOGY_EQUIPMENT',						'REFORM_JFD_TECHNOLOGY_BALANCED'),
		--Weapons
		('REFORM_JFD_WEAPONS_LOCAL',							'REFORM_JFD_WEAPONS_MIXED'),
		('REFORM_JFD_WEAPONS_LOCAL',							'REFORM_JFD_WEAPONS_FOREIGN'),
		('REFORM_JFD_WEAPONS_MIXED',							'REFORM_JFD_WEAPONS_FOREIGN'),
		('REFORM_JFD_WEAPONS_MIXED',							'REFORM_JFD_WEAPONS_LOCAL'),
		('REFORM_JFD_WEAPONS_FOREIGN',							'REFORM_JFD_WEAPONS_LOCAL'),
		('REFORM_JFD_WEAPONS_FOREIGN',							'REFORM_JFD_WEAPONS_MIXED');
		
--Religion
INSERT INTO JFD_Reform_Negates	
		(ReformType,											ReformNegateType)
VALUES	--Appeals
		('REFORM_JFD_APPEALS_STATE',							'REFORM_JFD_APPEALS_CHURCH'),
		('REFORM_JFD_APPEALS_STATE',							'REFORM_JFD_APPEALS_NONE'),
		('REFORM_JFD_APPEALS_NONE',								'REFORM_JFD_APPEALS_STATE'),
		('REFORM_JFD_APPEALS_NONE',								'REFORM_JFD_APPEALS_CHURCH'),
		('REFORM_JFD_APPEALS_CHURCH',							'REFORM_JFD_APPEALS_NONE'),
		('REFORM_JFD_APPEALS_CHURCH',							'REFORM_JFD_APPEALS_STATE'),
		--Festivals
		('REFORM_JFD_FESTIVALS_HEALING',						'REFORM_JFD_FESTIVALS_PRAYER'),
		('REFORM_JFD_FESTIVALS_HEALING',						'REFORM_JFD_FESTIVALS_NONE'),
		('REFORM_JFD_FESTIVALS_NONE',							'REFORM_JFD_FESTIVALS_HEALING'),
		('REFORM_JFD_FESTIVALS_NONE',							'REFORM_JFD_FESTIVALS_PRAYER'),
		('REFORM_JFD_FESTIVALS_PRAYER',							'REFORM_JFD_FESTIVALS_NONE'),
		('REFORM_JFD_FESTIVALS_PRAYER',							'REFORM_JFD_FESTIVALS_HEALING'),
		--Investiture
		('REFORM_JFD_INVESTITURE_STATE',						'REFORM_JFD_INVESTITURE_CHURCH'),
		('REFORM_JFD_INVESTITURE_STATE',						'REFORM_JFD_INVESTITURE_NONE'),
		('REFORM_JFD_INVESTITURE_NONE',							'REFORM_JFD_INVESTITURE_STATE'),
		('REFORM_JFD_INVESTITURE_NONE',							'REFORM_JFD_INVESTITURE_CHURCH'),
		('REFORM_JFD_INVESTITURE_CHURCH',						'REFORM_JFD_INVESTITURE_NONE'),
		('REFORM_JFD_INVESTITURE_CHURCH',						'REFORM_JFD_INVESTITURE_STATE'),
		--Missions
		('REFORM_JFD_MISSIONS_ABROAD',							'REFORM_JFD_MISSIONS_DOMESTIC'),
		('REFORM_JFD_MISSIONS_ABROAD',							'REFORM_JFD_MISSIONS_BALANCED'),
		('REFORM_JFD_MISSIONS_BALANCED',						'REFORM_JFD_MISSIONS_ABROAD'),
		('REFORM_JFD_MISSIONS_BALANCED',						'REFORM_JFD_MISSIONS_DOMESTIC'),
		('REFORM_JFD_MISSIONS_DOMESTIC',							'REFORM_JFD_MISSIONS_BALANCED'),
		('REFORM_JFD_MISSIONS_DOMESTIC',							'REFORM_JFD_MISSIONS_ABROAD'),
		--Orders
		('REFORM_JFD_ORDERS_MILITANT',							'REFORM_JFD_ORDERS_CHARITABLE'),
		('REFORM_JFD_ORDERS_MILITANT',							'REFORM_JFD_ORDERS_NONE'),
		('REFORM_JFD_ORDERS_NONE',								'REFORM_JFD_ORDERS_MILITANT'),
		('REFORM_JFD_ORDERS_NONE',								'REFORM_JFD_ORDERS_CHARITABLE'),
		('REFORM_JFD_ORDERS_CHARITABLE',						'REFORM_JFD_ORDERS_NONE'),
		('REFORM_JFD_ORDERS_CHARITABLE',						'REFORM_JFD_ORDERS_MILITANT'),
		--Sainthood
		('REFORM_JFD_SAINTHOOD_INFORMAL',						'REFORM_JFD_SAINTHOOD_FORMAL'),
		('REFORM_JFD_SAINTHOOD_INFORMAL',						'REFORM_JFD_SAINTHOOD_NONE'),
		('REFORM_JFD_SAINTHOOD_NONE',							'REFORM_JFD_SAINTHOOD_INFORMAL'),
		('REFORM_JFD_SAINTHOOD_NONE',							'REFORM_JFD_SAINTHOOD_FORMAL'),
		('REFORM_JFD_SAINTHOOD_FORMAL',							'REFORM_JFD_SAINTHOOD_NONE'),
		('REFORM_JFD_SAINTHOOD_FORMAL',							'REFORM_JFD_SAINTHOOD_INFORMAL'),
		--Schooling
		('REFORM_JFD_SCHOOLING_NATURAL',						'REFORM_JFD_SCHOOLING_SCRIPTURAL'),
		('REFORM_JFD_SCHOOLING_NATURAL',						'REFORM_JFD_SCHOOLING_SECULAR'),
		('REFORM_JFD_SCHOOLING_SECULAR',						'REFORM_JFD_SCHOOLING_NATURAL'),
		('REFORM_JFD_SCHOOLING_SECULAR',						'REFORM_JFD_SCHOOLING_SCRIPTURAL'),
		('REFORM_JFD_SCHOOLING_SCRIPTURAL',						'REFORM_JFD_SCHOOLING_SECULAR'),
		('REFORM_JFD_SCHOOLING_SCRIPTURAL',						'REFORM_JFD_SCHOOLING_NATURAL'),
		--Sects
		('REFORM_JFD_SECTS_FUNDAMENTAL',						'REFORM_JFD_SECTS_UNIVERSAL'),
		('REFORM_JFD_SECTS_FUNDAMENTAL',						'REFORM_JFD_SECTS_PREVAILING'),
		('REFORM_JFD_SECTS_PREVAILING',							'REFORM_JFD_SECTS_FUNDAMENTAL'),
		('REFORM_JFD_SECTS_PREVAILING',							'REFORM_JFD_SECTS_UNIVERSAL'),
		('REFORM_JFD_SECTS_UNIVERSAL',							'REFORM_JFD_SECTS_PREVAILING'),
		('REFORM_JFD_SECTS_UNIVERSAL',							'REFORM_JFD_SECTS_FUNDAMENTAL'),
		--Worship
		('REFORM_JFD_WORSHIP_SACRIFICE',						'REFORM_JFD_WORSHIP_PROCREATION'),
		('REFORM_JFD_WORSHIP_SACRIFICE',						'REFORM_JFD_WORSHIP_PRIVATE'),
		('REFORM_JFD_WORSHIP_PRIVATE',							'REFORM_JFD_WORSHIP_SACRIFICE'),
		('REFORM_JFD_WORSHIP_PRIVATE',							'REFORM_JFD_WORSHIP_PROCREATION'),
		('REFORM_JFD_WORSHIP_PROCREATION',						'REFORM_JFD_WORSHIP_PRIVATE'),
		('REFORM_JFD_WORSHIP_PROCREATION',						'REFORM_JFD_WORSHIP_SACRIFICE');
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_ClaimMods
--------------------------------------------------------------------------------------------------------------------------
--FOREIGN: Claims
INSERT INTO JFD_Reform_ClaimMods
		(ReformType,								CauseChange,					ClaimCostMod)
SELECT	'REFORM_JFD_CLAIMS_CAUSE',					1,								35
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO JFD_Reform_ClaimMods
		(ReformType,								CauseChange, 				ClaimCostMod)
SELECT	'REFORM_JFD_CLAIMS_INVESTMENT',				-1,							-35
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_ContractModifiers
--------------------------------------------------------------------------------------------------------------------------
--MILITARY: Recruitment
INSERT INTO JFD_Reform_ContractMods
		(ReformType,								CostMod,			TurnsMod)
SELECT	'REFORM_JFD_RECRUITMENT_MERCENARY',			-20,				15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);	
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_CrimeMods
--------------------------------------------------------------------------------------------------------------------------	
--LEGAL: Administration
INSERT INTO JFD_Reform_CrimeMods
		(ReformType,								CrimeType,				CrimeMod)
SELECT	'REFORM_JFD_ADMINISTRATION_BUREAUCRATIC', 	'CRIME_JFD_GOLD',		25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO JFD_Reform_CrimeMods
		(ReformType,								CrimeType,				CrimeMod)
SELECT	'REFORM_JFD_ADMINISTRATION_TECHNOCRATIC', 	'CRIME_JFD_GOLD',		25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--LEGAL: Execution
INSERT INTO JFD_Reform_CrimeMods
		(ReformType,								CrimeType,				CrimeMod)
SELECT	'REFORM_JFD_EXECUTION_PROHIBITED', 			'CRIME_JFD_GAP',		-20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);	

INSERT INTO JFD_Reform_CrimeMods
		(ReformType,								CrimeType,				CrimeMod)
SELECT	'REFORM_JFD_EXECUTION_RESERVED', 			'CRIME_JFD_HAPPINESS',	-20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--LEGAL: Records
INSERT INTO JFD_Reform_CrimeMods
		(ReformType,								CrimeType,				CrimeMod)
SELECT	'REFORM_JFD_RECORDS_ORAL', 					'CRIME_JFD_PRODUCTION',	20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO JFD_Reform_CrimeMods
		(ReformType,								CrimeType,				CrimeMod)
SELECT	'REFORM_JFD_RECORDS_WRITTEN', 				'CRIME_JFD_PRODUCTION',	-20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--CULTURE: Language
INSERT INTO JFD_Reform_CrimeMods
		(ReformType,								CrimeType,				CrimeMod)
SELECT	'REFORM_JFD_LANGUAGE_ADAPTIVE', 			'CRIME_JFD_CULTURE',	20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO JFD_Reform_CrimeMods
		(ReformType,								CrimeType,				CrimeMod)
SELECT	'REFORM_JFD_LANGUAGE_PROTECTED', 			'CRIME_JFD_CULTURE',	-20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--INDUSTRY: Healthcare
INSERT INTO JFD_Reform_CrimeMods
		(ReformType,								CrimeType,				CrimeMod)
SELECT	'REFORM_JFD_HEALTHCARE_PRIVATE', 			'CRIME_JFD_HEALTH',		-33
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO JFD_Reform_CrimeMods
		(ReformType,								CrimeType,				CrimeMod)
SELECT	'REFORM_JFD_HEALTHCARE_PUBLIC', 			'CRIME_JFD_HEALTH',		33
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--INDUSTRY: Patents
INSERT INTO JFD_Reform_CrimeMods
		(ReformType,								CrimeType,				CrimeMod)
SELECT	'REFORM_JFD_PATENTS_LIMITED', 				'CRIME_JFD_SCIENCE',	25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);	

INSERT INTO JFD_Reform_CrimeMods
		(ReformType,								CrimeType,				CrimeMod)
SELECT	'REFORM_JFD_PATENTS_UNLIMITED', 			'CRIME_JFD_SCIENCE',	25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);	

--MILITARY: Police
INSERT INTO JFD_Reform_CrimeMods
		(ReformType,								CrimeType,				CrimeMod)
SELECT	'REFORM_JFD_POLICE_CIVILIAN', 				'CRIME_JFD_TOURISM',	-25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO JFD_Reform_CrimeMods
		(ReformType,								CrimeType,				CrimeMod)
SELECT	'REFORM_JFD_POLICE_MILITARY', 				'CRIME_JFD_TOURISM',	25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--RELIGION: Sects
INSERT INTO JFD_Reform_CrimeMods
		(ReformType,								CrimeType,				CrimeMod)
SELECT	'REFORM_JFD_SECTS_FUNDAMENTAL', 			'CRIME_JFD_FAITH',		33
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--RELIGION: Worship
INSERT INTO JFD_Reform_CrimeMods
		(ReformType,								CrimeType,				CrimeMod)
SELECT	'REFORM_JFD_WORSHIP_PROCREATION', 			'CRIME_JFD_FOOD',		-20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO JFD_Reform_CrimeMods
		(ReformType,								CrimeType,				CrimeMod)
SELECT	'REFORM_JFD_WORSHIP_SACRIFICE', 			'CRIME_JFD_FOOD',		20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_DecisionMods
--------------------------------------------------------------------------------------------------------------------------
--CULTURE: Claims
INSERT INTO JFD_Reform_DecisionMods
		(ReformType,								ExpendedResourceType,			ExpendedResourceChange)
SELECT	'REFORM_JFD_PEERAGE_CEREMONIAL',			'RESOURCE_JFD_DIGNITARIES',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO JFD_Reform_DecisionMods
		(ReformType,								ExpendedResourceType,			ExpendedResourceChange)
SELECT	'REFORM_JFD_PEERAGE_PRIVILEGED',			'RESOURCE_MAGISTRATES',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM Resources WHERE Type = 'RESOURCE_MAGISTRATES');
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
--MILITARY: Command
INSERT INTO JFD_Reform_FreePromotions
		(ReformType,								PromotionType, 							IsCombatOnly)
SELECT	'REFORM_JFD_COMMAND_SOVEREIGN',				'PROMOTION_JFD_COMMAND_SOVEREIGN',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO JFD_Reform_FreePromotions
		(ReformType,								PromotionType, 							IsCombatOnly)
SELECT	'REFORM_JFD_COMMAND_STATE',					'PROMOTION_JFD_COMMAND_STATE',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--RELIGIONS: Orders
INSERT INTO JFD_Reform_FreePromotions
		(ReformType,								PromotionType, 							IsCombatOnly,	RequiresFaithPurchase)
SELECT	'REFORM_JFD_ORDERS_CHARITABLE',				'PROMOTION_JFD_ORDERS_CHARITABLE',		1,				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO JFD_Reform_FreePromotions
		(ReformType,								PromotionType, 							IsCombatOnly,	RequiresFaithPurchase)
SELECT	'REFORM_JFD_ORDERS_MILITANT',				'PROMOTION_JFD_ORDERS_MILITANT',		1,				1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_DevelopmentMods
--------------------------------------------------------------------------------------------------------------------------	
--INDUSTRY: Planning
INSERT INTO JFD_Reform_DevelopmentMods
		(ReformType,								DevelopmentBuildingMod)
SELECT	'REFORM_JFD_PLANNING_RURAL', 				-25						
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PLANNING_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO JFD_Reform_DevelopmentMods
		(ReformType,								DevelopmentImprovementMod)
SELECT	'REFORM_JFD_PLANNING_URBAN', 				-25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PLANNING_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_HappinessMods
--------------------------------------------------------------------------------------------------------------------------	
--LEGAL: Execution
INSERT INTO JFD_Reform_HappinessMods
		(ReformType,								ResistanceMod)
SELECT	'REFORM_JFD_EXECUTION_PROHIBITED', 			-20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HAPPINESS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--INDUSTRY: Trade Unions
INSERT INTO JFD_Reform_HappinessMods
		(ReformType,								ResistanceMod)
SELECT	'REFORM_JFD_TRADE_UNIONS_FREE', 			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HAPPINESS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO JFD_Reform_HappinessMods
		(ReformType,								ResistanceMod)
SELECT	'REFORM_JFD_TRADE_UNIONS_STATE', 			-20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HAPPINESS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_HealthMods
--------------------------------------------------------------------------------------------------------------------------	
--FOREIGN: Trade
INSERT INTO JFD_Reform_HealthMods
		(ReformType,								DiseaseTRMod)
SELECT	'REFORM_JFD_TRADE_FREE', 					20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO JFD_Reform_HealthMods
		(ReformType,								DiseaseTRMod)
SELECT	'REFORM_JFD_TRADE_REGULATED', 				-20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--INDUSTRY: Healthcare
INSERT INTO JFD_Reform_HealthMods
		(ReformType,								HealthToFoodMod)
SELECT	'REFORM_JFD_HEALTHCARE_PRIVATE', 			-20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO JFD_Reform_HealthMods
		(ReformType,								HealthToFoodMod)
SELECT	'REFORM_JFD_HEALTHCARE_PUBLIC', 			20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_LoyaltyMods
--------------------------------------------------------------------------------------------------------------------------	
--LEGAL: Execution
INSERT INTO JFD_Reform_LoyaltyMods
		(ReformType,								RevoltMod)
SELECT	'REFORM_JFD_EXECUTION_RESERVED', 			-20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--CULTURE: Heraldry
INSERT INTO JFD_Reform_LoyaltyMods
		(ReformType,								CitizenRevoltSentimentMod,		CitizenWLTKDSentimentMod)
SELECT	'REFORM_JFD_HERALDRY_CIVILIAN', 			25,								25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--MILITARY: Police
INSERT INTO JFD_Reform_LoyaltyMods
		(ReformType,								RevoltMod)
SELECT	'REFORM_JFD_POLICE_CIVILIAN', 				-20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HAPPINESS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO JFD_Reform_LoyaltyMods
		(ReformType,								RevoltMod)
SELECT	'REFORM_JFD_POLICE_MILITARY', 				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HAPPINESS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_OrganizedCrimeMods
--------------------------------------------------------------------------------------------------------------------------	
--LEGAL: Immunity
INSERT INTO JFD_Reform_OrganizedCrimeMods
		(ReformType,								ThresholdMod)
SELECT	'REFORM_JFD_IMMUNITY_NONE', 				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_PietyMods
--------------------------------------------------------------------------------------------------------------------------
--ECONOMY: Taxation (Church)
INSERT INTO JFD_Reform_PietyMods
		(ReformType,								PietyYieldMod)
SELECT	'REFORM_JFD_C_TAXATION_HIGH',				-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO JFD_Reform_PietyMods
		(ReformType,								PietyYieldMod)
SELECT	'REFORM_JFD_C_TAXATION_EXEMPT',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--RELIGION: Appeals
INSERT INTO JFD_Reform_PietyMods
		(ReformType,								PietyYieldMod)
SELECT	'REFORM_JFD_APPEALS_CHURCH',				-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO JFD_Reform_PietyMods
		(ReformType,								RestingRateChange)
SELECT	'REFORM_JFD_APPEALS_CHURCH',				20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO JFD_Reform_PietyMods
		(ReformType,								RestingRateChange)
SELECT	'REFORM_JFD_APPEALS_STATE',					-20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO JFD_Reform_PietyMods
		(ReformType,								PietyYieldMod)
SELECT	'REFORM_JFD_APPEALS_STATE',					-15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--RELIGION: Investiture
INSERT INTO JFD_Reform_PietyMods
		(ReformType,								PietyYieldMod)
SELECT	'REFORM_JFD_INVESTITURE_CHURCH',			15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO JFD_Reform_PietyMods
		(ReformType,								PietyYieldMod)
SELECT	'REFORM_JFD_INVESTITURE_STATE',				-15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--RELIGION: Missions
INSERT INTO JFD_Reform_PietyMods
		(ReformType,								StateReligionPressureMod)
SELECT	'REFORM_JFD_MISSIONS_DOMESTIC',				100
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO JFD_Reform_PietyMods
		(ReformType,								StateReligionPressureMod)
SELECT	'REFORM_JFD_MISSIONS_ABROAD',				-50
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_DevelopmentMods
--------------------------------------------------------------------------------------------------------------------------
--ECONOMY: Organization
INSERT INTO JFD_Reform_DevelopmentMods
		(ReformType,								DevelopmentThresholdMod)
SELECT	'REFORM_JFD_ORGANIZATION_MANORIAL',			25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO JFD_Reform_DevelopmentMods
		(ReformType,								DevelopmentThresholdMod)
SELECT	'REFORM_JFD_ORGANIZATION_MUNICIPAL',		-25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Reform_ProvinceMods
--------------------------------------------------------------------------------------------------------------------------
--ECONOMY: Organization
INSERT INTO JFD_Reform_ProvinceMods
		(ReformType,								ProvinceImprovementReqMod,  ProvincePopulationReqMod)
SELECT	'REFORM_JFD_ORGANIZATION_MANORIAL',			-20,						-20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO JFD_Reform_ProvinceMods
		(ReformType,								ProvinceImprovementReqMod,  ProvincePopulationReqMod)
SELECT	'REFORM_JFD_ORGANIZATION_MUNICIPAL',		20,							20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------			
-- JFD_Reform_SlaveryMods
--------------------------------------------------------------------------------------------------------------------------
--MILITARY: Slavery
INSERT INTO JFD_Reform_SlaveryMods
		(ReformType,								MaxHPChange,		ShackleCostMod)
SELECT	'REFORM_JFD_SLAVERY_DISPOSABLE', 			-20,				-25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO JFD_Reform_SlaveryMods
		(ReformType,								FreeExperience,		ShackleCostMod)
SELECT	'REFORM_JFD_SLAVERY_ELITE', 				30,					20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Reform_JFD_ProsperityMods
--------------------------------------------------------------------------------------------------------------------------	
--Currency
-- INSERT INTO Reform_JFD_ProsperityMods
		-- (ReformType,											CurrencyMod)
-- SELECT	'REFORM_JFD_CURRENCY_TENDER', 							15
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

-- INSERT INTO Reform_JFD_ProsperityMods
		-- (ReformType,											CurrencyMod)
-- SELECT	'REFORM_JFD_CURRENCY_CREDIT', 							40
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PROSPERITY_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--==========================================================================================================================	
-- SOCIAL POLICIES
--==========================================================================================================================
-- Policies
--------------------------------------------------------------------------------------------------------------------------
--Government Reforms	
INSERT INTO Policies
		(Type,														WLTKDModifier,					GoldenAgeDurationMod,					CityCountUnhappinessMod,				UnhappinessMod,							Description)
VALUES	--Executive						                                                                                            		                							
		('POLICY_REFORM_JFD_EXECUTIVE_ABSOLUTE',					0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_EXECUTIVE_ABSOLUTE_SHORT_DESC'),
		('POLICY_REFORM_JFD_EXECUTIVE_DESPOTIC',					0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_EXECUTIVE_DESPOTIC_SHORT_DESC'),
		('POLICY_REFORM_JFD_EXECUTIVE_CONSTITUTIONAL',				0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_EXECUTIVE_CONSTITUTIONAL_SHORT_DESC'),
		--State                                   						                                                            		                								
		('POLICY_REFORM_JFD_STATE_EMPIRE',							0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_STATE_EMPIRE_SHORT_DESC'),
		('POLICY_REFORM_JFD_STATE_NATION',							0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_STATE_NATION_SHORT_DESC'),
		('POLICY_REFORM_JFD_STATE_CITYSTATE',						0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_STATE_CITYSTATE_SHORT_DESC'),	
		--Legislature (Holy Rome)			                             						                                    		                								
		('POLICY_REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS',		0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_LEGISLATURE_HRE_PRIVILEGIUM_MAIUS_SHORT_DESC'),
		('POLICY_REFORM_JFD_LEGISLATURE_HRE_NONE',					0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_LEGISLATURE_HRE_NONE_SHORT_DESC'),
		('POLICY_REFORM_JFD_LEGISLATURE_HRE_PRIVILEGIUM_MINOR',		0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_LEGISLATURE_HRE_PRIVILEGIUM_MINOR_SHORT_DESC'),
		--Legislature (Dictatorship)                                    						                                    		                								
		('POLICY_REFORM_JFD_LEGISLATURE_D_MILITARY',				0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_LEGISLATURE_D_MILITARY_SHORT_DESC'),
		('POLICY_REFORM_JFD_LEGISLATURE_D_PERSONAL',				0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_LEGISLATURE_D_PERSONAL_SHORT_DESC'),
		('POLICY_REFORM_JFD_LEGISLATURE_D_ONE_PARTY',				0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_LEGISLATURE_D_ONE_PARTY_SHORT_DESC'),
		--Legislature (Monarchy)                                    						                                        		                								
		('POLICY_REFORM_JFD_LEGISLATURE_M_ARISTOCRATIC',			0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_LEGISLATURE_M_ARISTOCRATIC_SHORT_DESC'),
		('POLICY_REFORM_JFD_LEGISLATURE_M_NONE',					0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_LEGISLATURE_M_NONE_SHORT_DESC'),
		('POLICY_REFORM_JFD_LEGISLATURE_M_PARLIAMENTARY',			0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_LEGISLATURE_M_PARLIAMENTARY_SHORT_DESC'),
		--Legislature (Republic)                                    						                                        		                								
		('POLICY_REFORM_JFD_LEGISLATURE_R_OLIGARCHIC',				0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_LEGISLATURE_R_OLIGARCHIC_SHORT_DESC'),
		('POLICY_REFORM_JFD_LEGISLATURE_R_NONE',					0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_LEGISLATURE_R_NONE_SHORT_DESC'),
		('POLICY_REFORM_JFD_LEGISLATURE_R_DEMOCRATIC',				0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_LEGISLATURE_R_DEMOCRATIC_SHORT_DESC'),
		--Legislature (Shogunate)			                             						                                    		                								
		('POLICY_REFORM_JFD_LEGISLATURE_S_EMPEROR',					0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_LEGISLATURE_S_EMPEROR_SHORT_DESC'),
		('POLICY_REFORM_JFD_LEGISLATURE_S_NONE',					0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_LEGISLATURE_S_NONE_SHORT_DESC'),
		('POLICY_REFORM_JFD_LEGISLATURE_S_DAIMYO',					0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_LEGISLATURE_S_EMPEROR_SHORT_DESC'),
		--Legislature (Theocracy)                                   						                                        		                								
		('POLICY_REFORM_JFD_LEGISLATURE_T_AUTOCEPHALOUS',			0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_LEGISLATURE_T_AUTOCEPHALOUS_SHORT_DESC'),
		('POLICY_REFORM_JFD_LEGISLATURE_T_NONE',					0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_LEGISLATURE_T_NONE_SHORT_DESC'),
		('POLICY_REFORM_JFD_LEGISLATURE_T_ECUMENICAL',				0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_LEGISLATURE_T_ECUMENICAL_SHORT_DESC'),
		--Suffrage                 						                                                                            		                								
		('POLICY_REFORM_JFD_SUFFRAGE_LANDED',						0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_SUFFRAGE_LANDED_SHORT_DESC'),
		('POLICY_REFORM_JFD_SUFFRAGE_NONE',							0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_SUFFRAGE_NONE_SHORT_DESC'),
		('POLICY_REFORM_JFD_SUFFRAGE_UNIVERSAL',					0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_SUFFRAGE_UNIVERSAL_SHORT_DESC'),
		--Legitimacy (First)                                        						                                        		                								
		('POLICY_REFORM_JFD_LEGITIMACY_WISDOM',						0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_LEGITIMACY_WISDOM_SHORT_DESC'),
		('POLICY_REFORM_JFD_LEGITIMACY_MIGHT',						0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_LEGITIMACY_MIGHT_SHORT_DESC'),
		('POLICY_REFORM_JFD_LEGITIMACY_WEALTH',						0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_LEGITIMACY_WEALTH_SHORT_DESC'),
		--Legitimacy (Second)                                       						                                        		                								
		('POLICY_REFORM_JFD_LEGITIMACY_DIVINE_RIGHT',				0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_LEGITIMACY_DIVINE_RIGHT_SHORT_DESC'),
		('POLICY_REFORM_JFD_LEGITIMACY_GOVERNANCE',					0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_LEGITIMACY_GOVERNANCE_SHORT_DESC'),
		('POLICY_REFORM_JFD_LEGITIMACY_LAW',						0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_LEGITIMACY_LAW_SHORT_DESC'),
		--Legitimacy (Third)                                        						                                        		                								
		('POLICY_REFORM_JFD_LEGITIMACY_SECURITY',					0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_LEGITIMACY_SECURITY_SHORT_DESC'),
		('POLICY_REFORM_JFD_LEGITIMACY_TRADITION',					0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_LEGITIMACY_TRADITION_SHORT_DESC'),
		('POLICY_REFORM_JFD_LEGITIMACY_CHARISMA',					0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_LEGITIMACY_CHARISMA_SHORT_DESC'),	
		--Structure                            						                                                                		                								
		('POLICY_REFORM_JFD_STRUCTURE_UNITARY',						0,								0,										20,										-20,									'TXT_KEY_JFD_REFORM_STRUCTURE_UNITARY_SHORT_DESC'),
		('POLICY_REFORM_JFD_STRUCTURE_ASSOCIATION',					0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_STRUCTURE_ASSOCIATION_SHORT_DESC'),
		('POLICY_REFORM_JFD_STRUCTURE_FEDERATION',					0,								0,										-20,									20,										'TXT_KEY_JFD_REFORM_STRUCTURE_FEDERATION_SHORT_DESC'),
		--Succession                                                                        				                						        								                				        					
		('POLICY_REFORM_JFD_SUCCESSION_HEREDITARY',					25,								-25,									0,										0,										'TXT_KEY_JFD_REFORM_SUCCESSION_HEREDITARY_SHORT_DESC'),
		('POLICY_REFORM_JFD_SUCCESSION_APPOINTED',					0,								0,										0,										0,										'TXT_KEY_JFD_REFORM_SUCCESSION_APPOINTED_SHORT_DESC'),
		('POLICY_REFORM_JFD_SUCCESSION_ELECTIVE',					-25,							25,										0,										0,										'TXT_KEY_JFD_REFORM_SUCCESSION_ELECTIVE_SHORT_DESC');
				
--Legal Reforms			
INSERT INTO Policies		
		(Type,														PlotGoldCostMod,				PolicyCostModifier,						Description)
VALUES	--Administration                                  			  		                          		                        															
		('POLICY_REFORM_JFD_ADMINISTRATION_TECHNOCRATIC',			0,								0,										'TXT_KEY_JFD_REFORM_ADMINISTRATION_TECHNOCRATIC_SHORT_DESC'),
		('POLICY_REFORM_JFD_ADMINISTRATION_NEPOCRATIC',				0,								0,										'TXT_KEY_JFD_REFORM_ADMINISTRATION_NEPOCRATIC_SHORT_DESC'),
		('POLICY_REFORM_JFD_ADMINISTRATION_BUREAUCRATIC',			0,								0,										'TXT_KEY_JFD_REFORM_ADMINISTRATION_BUREAUCRATIC_SHORT_DESC'),
		--Basis                                                     						
		('POLICY_REFORM_JFD_BASIS_RELIGIOUS',						0,								0,										'TXT_KEY_JFD_REFORM_BASIS_RELIGIOUS_SHORT_DESC'),
		('POLICY_REFORM_JFD_BASIS_MORAL',							0,								0,										'TXT_KEY_JFD_REFORM_BASIS_MORAL_SHORT_DESC'),
		('POLICY_REFORM_JFD_BASIS_SECULAR',							0,								0,										'TXT_KEY_JFD_REFORM_BASIS_SECULAR_SHORT_DESC'),
		--Constitution                                              				
		('POLICY_REFORM_JFD_CONSTITUTION_CODIFIED',					0,								0,										'TXT_KEY_JFD_REFORM_CONSTITUTION_CODIFIED_SHORT_DESC'),
		('POLICY_REFORM_JFD_CONSTITUTION_NONE',						0,								0,										'TXT_KEY_JFD_REFORM_CONSTITUTION_NONE_SHORT_DESC'),
		('POLICY_REFORM_JFD_CONSTITUTION_UNCODIFIED',				0,								-15,									'TXT_KEY_JFD_REFORM_CONSTITUTION_UNCODIFIED_SHORT_DESC'),
		--Execution                                                 						
		('POLICY_REFORM_JFD_EXECUTION_RESERVED',					0,								0,										'TXT_KEY_JFD_REFORM_EXECUTION_RESERVED_SHORT_DESC'),
		('POLICY_REFORM_JFD_EXECUTION_ARBITRARY',					0,								0,										'TXT_KEY_JFD_REFORM_EXECUTION_ARBITRARY_SHORT_DESC'),
		('POLICY_REFORM_JFD_EXECUTION_PROHIBITED',					0,								0,										'TXT_KEY_JFD_REFORM_EXECUTION_PROHIBITED_SHORT_DESC'),
		--Immunity                                                  						
		('POLICY_REFORM_JFD_IMMUNITY_NONE',							0,								0,										'TXT_KEY_JFD_REFORM_IMMUNITY_NONE_SHORT_DESC'),
		('POLICY_REFORM_JFD_IMMUNITY_QUALIFIED',					0,								0,										'TXT_KEY_JFD_REFORM_IMMUNITY_QUALIFIED_SHORT_DESC'),
		('POLICY_REFORM_JFD_IMMUNITY_SOVEREIGN',					0,								0,										'TXT_KEY_JFD_REFORM_IMMUNITY_SOVEREIGN_SHORT_DESC'),
		--Judiciary                                                 						
		('POLICY_REFORM_JFD_JUDICIARY_DEPENDENT',					0,								0,										'TXT_KEY_JFD_REFORM_JUDICIARY_DEPENDENT_SHORT_DESC'),
		('POLICY_REFORM_JFD_JUDICIARY_NONE',						0,								0,										'TXT_KEY_JFD_REFORM_JUDICIARY_NONE_SHORT_DESC'),
		('POLICY_REFORM_JFD_JUDICIARY_INDEPENDENT',					0,								0,										'TXT_KEY_JFD_REFORM_JUDICIARY_INDEPENDENT_SHORT_DESC'),
		--Peerage                                                                               	                            			                            								
		('POLICY_REFORM_JFD_PEERAGE_PRIVILEGED',					0,								0,										'TXT_KEY_JFD_REFORM_PEERAGE_PRIVILEGED_SHORT_DESC'),
		('POLICY_REFORM_JFD_PEERAGE_NONE',							0,								0,										'TXT_KEY_JFD_REFORM_PEERAGE_NONE_SHORT_DESC'),
		('POLICY_REFORM_JFD_PEERAGE_CEREMONIAL',					0,								0,										'TXT_KEY_JFD_REFORM_PEERAGE_CEREMONIAL_SHORT_DESC'),
		--Records                                                                               	                            			                            								
		('POLICY_REFORM_JFD_RECORDS_WRITTEN',						20,								0,										'TXT_KEY_JFD_REFORM_RECORDS_WRITTEN_SHORT_DESC'),
		('POLICY_REFORM_JFD_RECORDS_NONE',							0,								0,										'TXT_KEY_JFD_REFORM_RECORDS_NONE_SHORT_DESC'),
		('POLICY_REFORM_JFD_RECORDS_ORAL',							-20,							0,										'TXT_KEY_JFD_REFORM_RECORDS_ORAL_SHORT_DESC'),
		--System                                                    						
		('POLICY_REFORM_JFD_SYSTEM_CIVIL',							0,								0,										'TXT_KEY_JFD_REFORM_SYSTEM_CIVIL_SHORT_DESC'),
		('POLICY_REFORM_JFD_SYSTEM_CUSTOMARY',						0,								0,										'TXT_KEY_JFD_REFORM_SYSTEM_CUSTOMARY_SHORT_DESC'),
		('POLICY_REFORM_JFD_SYSTEM_COMMON',							0,								0,										'TXT_KEY_JFD_REFORM_SYSTEM_COMMON_SHORT_DESC');
						
--Culture Reforms				
INSERT INTO Policies				
		(Type,														BuildingGoldMaintenanceMod,		HappinessToGoldenAgePoints,				GoldenAgeMeterMod,						GreatArtistRateModifier,				GreatMerchantRateModifier,				GreatMusicianRateModifier,			GreatWriterRateModifier,				GreatAdmiralRateModifier,			GreatGeneralRateModifier,											Description)
VALUES	--Heraldry                                    			   	                	                            			                            			                            			                                		        	                    		                        		            	                		        	                		    									
		('POLICY_REFORM_JFD_HERALDRY_MILITARY',						0,								0,										0,										0,										0,										0,									0,										10,									10,																	'TXT_KEY_JFD_REFORM_HERALDRY_MILITARY_SHORT_DESC'),
		('POLICY_REFORM_JFD_HERALDRY_NONE',							0,								0,										0,										0,										0,										0,									0,										0,									0,																	'TXT_KEY_JFD_REFORM_HERALDRY_NONE_SHORT_DESC'),
		('POLICY_REFORM_JFD_HERALDRY_CIVILIAN',						0,								0,										0,										0,										0,										0,									0,										0,									0,																	'TXT_KEY_JFD_REFORM_HERALDRY_CIVILIAN_SHORT_DESC'),
		--Language                                                   				            	            							            							            							                            			                            		                            			                            		                            										
		('POLICY_REFORM_JFD_LANGUAGE_PROTECTED',					0,								0,										0,										0,										0,										0,									0,										0,									0,																	'TXT_KEY_JFD_REFORM_LANGUAGE_PROTECTED_SHORT_DESC'),
		('POLICY_REFORM_JFD_LANGUAGE_NONE',							0,								0,										0,										0,										0,										0,									0,										0,									0,																	'TXT_KEY_JFD_REFORM_LANGUAGE_NONE_SHORT_DESC'),
		('POLICY_REFORM_JFD_LANGUAGE_ADAPTIVE',						0,								0,										0,										0,										0,										0,									0,										0,									0,																	'TXT_KEY_JFD_REFORM_LANGUAGE_ADAPTIVE_SHORT_DESC'),
		--Marriage                                               					            	            							            							            							                            			                            		                            			                            		                            										
		('POLICY_REFORM_JFD_MARRIAGE_RELIGIOUS',					0,								0,										0,										0,										0,										0,									0,										0,									0,																	'TXT_KEY_JFD_REFORM_MARRIAGE_RELIGIOUS_SHORT_DESC'),
		('POLICY_REFORM_JFD_MARRIAGE_PRIVATE',						0,								0,										0,										0,										0,										0,									0,										0,									0,																	'TXT_KEY_JFD_REFORM_MARRIAGE_PRIVATE_SHORT_DESC'),
		('POLICY_REFORM_JFD_MARRIAGE_CIVIC',						0,								0,										0,										0,										0,										0,									0,										0,									0,																	'TXT_KEY_JFD_REFORM_MARRIAGE_CIVIC_SHORT_DESC'),
		--Media                                                                        					                        				                        				                        			                            			                            		                            			                            		                            										
		('POLICY_REFORM_JFD_MEDIA_STATE',							0,								0,										0,										0,										0,										0,									0,										0,									0,																	'TXT_KEY_JFD_REFORM_MEDIA_STATE_SHORT_DESC'),
		('POLICY_REFORM_JFD_MEDIA_NONE',							0,								0,										0,										0,										0,										0,									0,										0,									0,																	'TXT_KEY_JFD_REFORM_MEDIA_NONE_SHORT_DESC'),
		('POLICY_REFORM_JFD_MEDIA_INDEPENDENT',						0,								0,										0,										0,										0,										0,									0,										0,									0,																	'TXT_KEY_JFD_REFORM_MEDIA_INDEPENDENT_SHORT_DESC'),
		--Patronage                                         							   																																		                        				                      				                        				                        			                        										
		('POLICY_REFORM_JFD_PATRONAGE_ARTISTS',						0,								0,										0,										10,										0,										10,									10,										0,									0,																	'TXT_KEY_JFD_REFORM_PATRONAGE_ARTISTS_SHORT_DESC'),
		('POLICY_REFORM_JFD_PATRONAGE_NONE',						0,								0,										0,										0,										0,										0,									0,										0,									0,																	'TXT_KEY_JFD_REFORM_PATRONAGE_NONE_SHORT_DESC'),
		('POLICY_REFORM_JFD_PATRONAGE_MERCHANTS',					0,								0,										0,										0,										10,										0,									0,										0,									0,																	'TXT_KEY_JFD_REFORM_PATRONAGE_MERCHANTS_SHORT_DESC'),
		--Publications                                    											                      				                            	                                                    		                		    	    			        		                        											
		('POLICY_REFORM_JFD_PUBLICATIONS_PRIVATE',					0,								0,										0,										0,										0,										0,									0,										0,									0,																	'TXT_KEY_JFD_REFORM_PUBLICATIONS_PRIVATE_SHORT_DESC'),
		('POLICY_REFORM_JFD_PUBLICATIONS_NONE',						0,								0,										0,										0,										0,										0,									0,										0,									0,																	'TXT_KEY_JFD_REFORM_PUBLICATIONS_NONE_SHORT_DESC'),
		('POLICY_REFORM_JFD_PUBLICATIONS_PUBLIC',					0,								0,										0,										0,										0,										0,									0,										0,									0,																	'TXT_KEY_JFD_REFORM_PUBLICATIONS_PUBLIC_SHORT_DESC'),
		--Public Works                                              			      		    	                            			                            			                            			                            			                            		                            			                            		                            										
		('POLICY_REFORM_JFD_PUBLIC_WORKS_CEREMONIAL',				10,								0,										0,										0,										0,										0,									0,										0,									0,																	'TXT_KEY_JFD_REFORM_PUBLIC_WORKS_CEREMONIAL_SHORT_DESC'),
		('POLICY_REFORM_JFD_PUBLIC_WORKS_NONE',						0,								0,										0,										0,										0,										0,									0,										0,									0,																	'TXT_KEY_JFD_REFORM_PUBLIC_WORKS_NONE_SHORT_DESC'),
		('POLICY_REFORM_JFD_PUBLIC_WORKS_CIVIC',					10,								0,										0,										0,										0,										0,									0,										0,									0,																	'TXT_KEY_JFD_REFORM_PUBLIC_WORKS_CIVIC_SHORT_DESC'),
		--Society                                     											                      				                          				                          				                            	    			                            		                    		        	                    		    	                    		        								
		('POLICY_REFORM_JFD_SOCIETY_CASTE',							0,								-20,									-20,									0,										0,										0,									0,										0,									0,																	'TXT_KEY_JFD_REFORM_SOCIETY_CASTE_SHORT_DESC'),
		('POLICY_REFORM_JFD_SOCIETY_FAMILY',						0,								0,										0,										0,										0,										0,									0,										0,									0,																	'TXT_KEY_JFD_REFORM_SOCIETY_FAMILY_SHORT_DESC'),
		('POLICY_REFORM_JFD_SOCIETY_CLASS',							0,								20,										20,										0,										0,										0,									0,										0,									0,																	'TXT_KEY_JFD_REFORM_SOCIETY_CLASS_SHORT_DESC'),
		--Speech                                                   				            	            							            							            							                                			                            		                        		    	                        			                        		    								
		('POLICY_REFORM_JFD_SPEECH_CENSORED',						0,								0,										0,										0,										0,										0,									0,										0,									0,																	'TXT_KEY_JFD_REFORM_SPEECH_CENSORED_SHORT_DESC'),
		('POLICY_REFORM_JFD_SPEECH_ANTI_LIBEL',						0,								0,										0,										0,										0,										0,									0,										0,									0,																	'TXT_KEY_JFD_REFORM_SPEECH_ANTI_LIBEL_SHORT_DESC'),
		('POLICY_REFORM_JFD_SPEECH_FREE',							0,								0,										0,										0,										0,										0,									0,										0,									0,																	'TXT_KEY_JFD_REFORM_SPEECH_FREE_SHORT_DESC');
					
--Economic Reforms					
INSERT INTO Policies					
		(Type,														BuildingProductionModifier,		CityGrowthMod,							ExtraHappinessPerLuxury,				InvestmentModifier,						StrategicResourceMod,					InternalTradeRouteYieldModifier,	CityConnectionTradeRouteGoldModifier,	Description)
VALUES	--Currency                                  			      		                    	    	                    			    	                    			  		                				    	                				    								    									    
		('POLICY_REFORM_JFD_CURRENCY_CREDIT',						0,								0,										0,										0,										0,										0,									0,										'TXT_KEY_JFD_REFORM_CURRENCY_CREDIT_SHORT_DESC'),
		('POLICY_REFORM_JFD_CURRENCY_BARTER',						0,								0,										0,										0,										0,										0,									0,										'TXT_KEY_JFD_REFORM_CURRENCY_BARTER_SHORT_DESC'),
		('POLICY_REFORM_JFD_CURRENCY_TENDER',						0,								0,										0,										0,										0,										0,									0,										'TXT_KEY_JFD_REFORM_CURRENCY_TENDER_SHORT_DESC'),
		--Development                                  			      		                    	    	                    			    	                    			  		                				    	                				    								    									    
		('POLICY_REFORM_JFD_DEVELOPMENT_HAPPINESS',					0,								0,										0,										0,										0,										0,									0,										'TXT_KEY_JFD_REFORM_DEVELOPMENT_HAPPINESS_SHORT_DESC'),
		('POLICY_REFORM_JFD_DEVELOPMENT_BALANCED',					0,								0,										0,										0,										0,										0,									0,										'TXT_KEY_JFD_REFORM_DEVELOPMENT_BALANCED_SHORT_DESC'),
		('POLICY_REFORM_JFD_DEVELOPMENT_HEALTH',					0,								0,										0,										0,										0,										0,									0,										'TXT_KEY_JFD_REFORM_DEVELOPMENT_HEALTH_SHORT_DESC'),
		--Guilds                                  			      		                                        						                            			                                	    	            										
		('POLICY_REFORM_JFD_GUILDS_CRAFTS',							0,								0,										0,										0,										0,										20,									0,										'TXT_KEY_JFD_REFORM_GUILDS_CRAFTS_SHORT_DESC'),
		('POLICY_REFORM_JFD_GUILDS_NONE',							0,								0,										0,										0,										0,										0,									0,										'TXT_KEY_JFD_REFORM_GUILDS_NONE_SHORT_DESC'),
		('POLICY_REFORM_JFD_GUILDS_COMMERCIAL',						0,								0,										0,										0,										0,										0,									20,										'TXT_KEY_JFD_REFORM_GUILDS_COMMERCIAL_SHORT_DESC'),
		--Market                                  			      		                    	  		                        				                        				                    					                    																							
		('POLICY_REFORM_JFD_MARKET_FREE',							0,								0,										2,										0,										0,										0,									0,										'TXT_KEY_JFD_REFORM_MARKET_FREE_SHORT_DESC'),
		('POLICY_REFORM_JFD_MARKET_MIXED',							0,								0,										0,										0,										0,										0,									0,										'TXT_KEY_JFD_REFORM_MARKET_MIXED_SHORT_DESC'),
		('POLICY_REFORM_JFD_MARKET_PLANNED',						0,								0,										0,										0,										150,									0,									0,										'TXT_KEY_JFD_REFORM_MARKET_PLANNED_SHORT_DESC'),
		--Organization                                  			      		                                        						                            			                                	    	            										
		('POLICY_REFORM_JFD_ORGANIZATION_MUNICIPAL',				0,								0,										0,										0,										0,										0,									0,										'TXT_KEY_JFD_REFORM_ORGANIZATION_MUNICIPAL_SHORT_DESC'),
		('POLICY_REFORM_JFD_ORGANIZATION_BALANCED',					0,								0,										0,										0,										0,										0,									0,										'TXT_KEY_JFD_REFORM_ORGANIZATION_BALANCED_SHORT_DESC'),
		('POLICY_REFORM_JFD_ORGANIZATION_MANORIAL',					0,								0,										0,										0,										0,										0,									0,										'TXT_KEY_JFD_REFORM_ORGANIZATION_MANORIAL_SHORT_DESC'),
		--Taxation (Church)                                  			      		    	    	  		      		        			  		      		        				      		    											                	
		('POLICY_REFORM_JFD_C_TAXATION_EXEMPT',						0,								0,										0,										0,										0,										0,									0,										'TXT_KEY_JFD_REFORM_C_TAXATION_EXEMPT_SHORT_DESC'),
		('POLICY_REFORM_JFD_C_TAXATION_STANDARD',					0,								0,										0,										0,										0,										0,									0,										'TXT_KEY_JFD_REFORM_C_TAXATION_STANDARD_SHORT_DESC'),
		('POLICY_REFORM_JFD_C_TAXATION_HIGH',						0,								0,										0,										0,										0,										0,									0,										'TXT_KEY_JFD_REFORM_C_TAXATION_HIGH_SHORT_DESC'),
		--Taxation (Commons)                                  			      		            		      		            				      		            				      		        					      		        					      								      								
		('POLICY_REFORM_JFD_L_TAXATION_EXEMPT',						0,								0,										0,										0,										0,										0,									0,										'TXT_KEY_JFD_REFORM_L_TAXATION_EXEMPT_SHORT_DESC'),
		('POLICY_REFORM_JFD_L_TAXATION_STANDARD',					0,								0,										0,										0,										0,										0,									0,										'TXT_KEY_JFD_REFORM_L_TAXATION_STANDARD_SHORT_DESC'),
		('POLICY_REFORM_JFD_L_TAXATION_HIGH',						0,								0,										0,										0,										0,										0,									0,										'TXT_KEY_JFD_REFORM_L_TAXATION_HIGH_SHORT_DESC'),
		--Taxation (Upper)                                  			      		            		      		            				      		            				      		        					      		        					      								      								
		('POLICY_REFORM_JFD_U_TAXATION_EXEMPT',						0,								0,										0,										0,										0,										0,									0,										'TXT_KEY_JFD_REFORM_U_TAXATION_EXEMPT_SHORT_DESC'),
		('POLICY_REFORM_JFD_U_TAXATION_STANDARD',					0,								0,										0,										0,										0,										0,									0,										'TXT_KEY_JFD_REFORM_U_TAXATION_STANDARD_SHORT_DESC'),
		('POLICY_REFORM_JFD_U_TAXATION_HIGH',						0,								0,										0,										0,										0,										0,									0,										'TXT_KEY_JFD_REFORM_U_TAXATION_HIGH_SHORT_DESC'),
		--Welfare                                  			      		                        		                        				                        				                    					                    																							
		('POLICY_REFORM_JFD_WELFARE_CHARITY',						0,								-10,									0,										0,										0,										0,									0,										'TXT_KEY_JFD_REFORM_WELFARE_CHARITY_SHORT_DESC'),
		('POLICY_REFORM_JFD_WELFARE_BASIC',							0,								0,										0,										0,										0,										0,									0,										'TXT_KEY_JFD_REFORM_WELFARE_BASIC_SHORT_DESC'),
		('POLICY_REFORM_JFD_WELFARE_STATE',							0,								10,										0,										0,										0,										0,									0,										'TXT_KEY_JFD_REFORM_WELFARE_STATE_SHORT_DESC');
										
--Foreign Reforms								
INSERT INTO Policies								
		(Type,														CityStateCombatModifier,		EspionageModifier,						MinorQuestFriendshipMod,				OpenBordersTourismModifier,				RiggingElectionModifier,				PuppetUnhappinessModPolicy,			StealTechFasterModifier,				TradeRouteLandDistanceModifier,			TradeRouteSeaDistanceModifier,					Description)
VALUES	--Citizenship                 			      	            																															
		('POLICY_REFORM_JFD_CITIZENSHIP_NONE',						0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_CITIZENSHIP_NONE_SHORT_DESC'),
		('POLICY_REFORM_JFD_CITIZENSHIP_LIMITED',					0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_CITIZENSHIP_LIMITED_SHORT_DESC'),
		('POLICY_REFORM_JFD_CITIZENSHIP_FULL',						0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_CITIZENSHIP_FULL_SHORT_DESC'),
		--Claims                 			      	            																									    					                    					                    			                          			                          														
		('POLICY_REFORM_JFD_CLAIMS_CAUSE',							0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_CLAIMS_CAUSE_SHORT_DESC'),
		('POLICY_REFORM_JFD_CLAIMS_MIXED',							0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_CLAIMS_MIXED_SHORT_DESC'),
		('POLICY_REFORM_JFD_CLAIMS_INVESTMENT',						0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_CLAIMS_INVESTMENT_SHORT_DESC'),
		--Intelligence                 			      	            																														                    					                    			                           			                           													
		('POLICY_REFORM_JFD_INTELLIGENCE_COVERT',					0,								15,										0,										0,										25,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_INTELLIGENCE_COVERT_SHORT_DESC'),
		('POLICY_REFORM_JFD_INTELLIGENCE_PASSIVE',					0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_INTELLIGENCE_PASSIVE_SHORT_DESC'),
		('POLICY_REFORM_JFD_INTELLIGENCE_CLANDESTINE',				0,								15,										0,										0,										0,										0,									25,										0,										0,												'TXT_KEY_JFD_REFORM_INTELLIGENCE_CLANDESTINE_SHORT_DESC'),
		--Power                 			      	            																														                    					                    			                           				                       											
		('POLICY_REFORM_JFD_POWER_HARD',							20,								0,										-15,									0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_POWER_HARD_SHORT_DESC'),
		('POLICY_REFORM_JFD_POWER_BALANCED',						0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_POWER_BALANCED_SHORT_DESC'),
		('POLICY_REFORM_JFD_POWER_SOFT',							-20,							0,										15,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_POWER_SOFT_SHORT_DESC'),
		--Taxation (Colonies)                                  			      		    	    		  		      							  		      						    	      		    																																						
		('POLICY_REFORM_JFD_CO_TAXATION_EXEMPT',					0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_CO_TAXATION_EXEMPT_SHORT_DESC'),
		('POLICY_REFORM_JFD_CO_TAXATION_STANDARD',					0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_CO_TAXATION_STANDARD_SHORT_DESC'),
		('POLICY_REFORM_JFD_CO_TAXATION_HIGH',						0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_CO_TAXATION_HIGH_SHORT_DESC'),
		--Tourism                 			      	            																									    					                    					                    			                          			                          														
		('POLICY_REFORM_JFD_TOURISM_LIMITED',						0,								0,										0,										-25,									0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_TOURISM_LIMITED_SHORT_DESC'),
		('POLICY_REFORM_JFD_TOURISM_NONE',							0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_TOURISM_NONE_SHORT_DESC'),
		('POLICY_REFORM_JFD_TOURISM_FREE',							0,								0,										0,										25,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_TOURISM_FREE_SHORT_DESC'),
		--Trade                                  			      		                        		                						                    					                						                																																													
		('POLICY_REFORM_JFD_TRADE_REGULATED',						0,								0,										0,										0,										0,										0,									0,										-33,									-33,											'TXT_KEY_JFD_REFORM_TRADE_REGULATED_SHORT_DESC'),
		('POLICY_REFORM_JFD_TRADE_NONE',							0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_TRADE_NONE_SHORT_DESC'),
		('POLICY_REFORM_JFD_TRADE_FREE',							0,								0,										0,										0,										0,										0,									0,										33,										33,												'TXT_KEY_JFD_REFORM_TRADE_FREE_SHORT_DESC'),
		--Tribes                 			      	            																                                        											                                                				
		('POLICY_REFORM_JFD_TRIBES_RESERVATION',					0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_TRIBES_RESERVATION_SHORT_DESC'),
		('POLICY_REFORM_JFD_TRIBES_NONE',							0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_TRIBES_NONE_SHORT_DESC'),
		('POLICY_REFORM_JFD_TRIBES_ASSIMILATION',					0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_TRIBES_ASSIMILATION_SHORT_DESC');
												
--Industry Reforms										
INSERT INTO Policies										
		(Type,														BuildingProductionModifier,		CityGrowthMod,							GreatEngineerRateModifier,				GreatScientistBeakerModifier,			GreatScientistRateModifier,				InvestmentModifier,					ImprovementUpgradeRateModifier,			WorkerSpeedModifier,					Description)
VALUES	--Education                                  			      		                                                    			                                	                					    	                												
		('POLICY_REFORM_JFD_EDUCATION_TECHNICAL',					0,								0,										0,										0,										0,										0,									0,										0,										'TXT_KEY_JFD_REFORM_EDUCATION_TECHNICAL_SHORT_DESC'),
		('POLICY_REFORM_JFD_EDUCATION_NONE',						0,								0,										0,										0,										0,										0,									0,										0,										'TXT_KEY_JFD_REFORM_EDUCATION_NONE_SHORT_DESC'),
		('POLICY_REFORM_JFD_EDUCATION_ACADEMIC',					0,								0,										0,										0,										0,										0,									0,										0,										'TXT_KEY_JFD_REFORM_EDUCATION_ACADEMIC_SHORT_DESC'),
		--Environment                                  			      		                                        						                            			                                		                                		                											
		('POLICY_REFORM_JFD_ENVIRONMENT_PROTECTED',					0,								0,										0,										0,										0,										0,									0,										0,										'TXT_KEY_JFD_REFORM_ENVIRONMENT_PROTECTED_SHORT_DESC'),
		('POLICY_REFORM_JFD_ENVIRONMENT_NONE',						0,								0,										0,										0,										0,										0,									0,										0,										'TXT_KEY_JFD_REFORM_ENVIRONMENT_NONE_SHORT_DESC'),
		('POLICY_REFORM_JFD_ENVIRONMENT_EXTORTED',					0,								0,										0,										0,										0,										0,									0,										0,										'TXT_KEY_JFD_REFORM_ENVIRONMENT_EXTORTED_SHORT_DESC'),
		--Healthcare                                  			      		                                        						                            			                                		                                		                											
		('POLICY_REFORM_JFD_HEALTHCARE_PUBLIC',						0,								0,										0,										0,										0,										0,									0,										0,										'TXT_KEY_JFD_REFORM_HEALTHCARE_PUBLIC_SHORT_DESC'),
		('POLICY_REFORM_JFD_HEALTHCARE_BASIC',						0,								0,										0,										0,										0,										0,									0,										0,										'TXT_KEY_JFD_REFORM_HEALTHCARE_BASIC_SHORT_DESC'),
		('POLICY_REFORM_JFD_HEALTHCARE_PRIVATE',					0,								0,										0,										0,										0,										0,									0,										0,										'TXT_KEY_JFD_REFORM_HEALTHCARE_PRIVATE_SHORT_DESC'),
		--Labour                                  			      		                                            						                            			                                		                                		                											
		('POLICY_REFORM_JFD_LABOUR_BONDED',							0,								0,										0,										0,										0,										0,									0,										20,										'TXT_KEY_JFD_REFORM_LABOUR_BONDED_SHORT_DESC'),
		('POLICY_REFORM_JFD_LABOUR_CORVEE',							0,								0,										0,										0,										0,										0,									0,										0,										'TXT_KEY_JFD_REFORM_LABOUR_CORVEE_SHORT_DESC'),
		('POLICY_REFORM_JFD_LABOUR_EMANCIPATED',					0,								0,										0,										0,										0,										0,									0,										-20,									'TXT_KEY_JFD_REFORM_LABOUR_EMANCIPATED_SHORT_DESC'),
		--Patents                 			      		                                    						                            			                                		                		        		                						                					
		('POLICY_REFORM_JFD_PATENTS_UNLIMITED',						0,								0,										0,										25,										0,										0,									0,										0,										'TXT_KEY_JFD_REFORM_PATENTS_UNLIMITED_SHORT_DESC'),
		('POLICY_REFORM_JFD_PATENTS_LETTERS',						0,								0,										0,										0,										0,										0,									0,										0,										'TXT_KEY_JFD_REFORM_PATENTS_LETTERS_SHORT_DESC'),
		('POLICY_REFORM_JFD_PATENTS_LIMITED',						0,								0,										0,										0,										0,										0,									0,										0,										'TXT_KEY_JFD_REFORM_PATENTS_LIMITED_SHORT_DESC'),
		--Planning                                  			      		                                        						                            			                                		                                		                                    						
		('POLICY_REFORM_JFD_PLANNING_RURAL',						0,								0,										0,										0,										0,										0,									33,										0,										'TXT_KEY_JFD_REFORM_PLANNING_RURAL_SHORT_DESC'),
		('POLICY_REFORM_JFD_PLANNING_BALANCED',						0,								0,										0,										0,										0,										0,									0,										0,										'TXT_KEY_JFD_REFORM_PLANNING_BALANCED_SHORT_DESC'),
		('POLICY_REFORM_JFD_PLANNING_URBAN',						10,								0,										0,										0,										0,										0,									0,										0,										'TXT_KEY_JFD_REFORM_PLANNING_URBAN_SHORT_DESC'),
		--Property                                  			      		                    	  		                				  									  									    									    	  		                    								
		('POLICY_REFORM_JFD_PROPERTY_PRIVATE',						-10,							0,										0,										0,										0,										-15,								0,										0,										'TXT_KEY_JFD_REFORM_PROPERTY_PRIVATE_SHORT_DESC'),
		('POLICY_REFORM_JFD_PROPERTY_PERSONAL',						0,								0,										0,										0,										0,										0,									0,										0,										'TXT_KEY_JFD_REFORM_PROPERTY_PERSONAL_SHORT_DESC'),
		('POLICY_REFORM_JFD_PROPERTY_STATE',						10,								0,										0,										0,										0,										15,									0,										0,										'TXT_KEY_JFD_REFORM_PROPERTY_STATE_SHORT_DESC'),
		--Scholarships                                  			      		                                    						                            			                                		                                		                					        						
		('POLICY_REFORM_JFD_SCHOLARSHIP_ENGINEERING',				0,								0,										10,										0,										0,										0,									0,										0,										'TXT_KEY_JFD_REFORM_SCHOLARSHIP_ENGINEERING_SHORT_DESC'),
		('POLICY_REFORM_JFD_SCHOLARSHIP_NONE',						0,								0,										0,										0,										0,										0,									0,										0,										'TXT_KEY_JFD_REFORM_SCHOLARSHIP_NONE_SHORT_DESC'),
		('POLICY_REFORM_JFD_SCHOLARSHIP_RESEARCH',					0,								0,										0,										0,										10,										0,									0,										0,										'TXT_KEY_JFD_REFORM_SCHOLARSHIP_RESEARCH_SHORT_DESC'),
		--Trade Unions                                  			      		                                    						                            			                                		                                		                					                						
		('POLICY_REFORM_JFD_TRADE_UNIONS_STATE',					0,								0,										0,										0,										0,										0,									0,										0,										'TXT_KEY_JFD_REFORM_TRADE_UNIONS_STATE_SHORT_DESC'),
		('POLICY_REFORM_JFD_TRADE_UNIONS_NONE',						0,								0,										0,										0,										0,										0,									0,										0,										'TXT_KEY_JFD_REFORM_TRADE_UNIONS_NONE_SHORT_DESC'),
		('POLICY_REFORM_JFD_TRADE_UNIONS_FREE',						0,								0,										0,										0,										0,										0,									0,										0,										'TXT_KEY_JFD_REFORM_TRADE_UNIONS_FREE_SHORT_DESC');
									
--Military Reforms									
INSERT INTO Policies									
		(Type,														CityStrengthMod,				ExpModifier,							MilitaryProductionModifier,				OccupiedPopulationUnhappinessMod,		OccupiedProdMod,						MilitaryProductionModifier,			UnitGoldMaintenanceMod,					UnitUpgradeCostMod,						UnitPurchaseCostModifier,						Description)
VALUES	--Command                 			      	                                																									
		('POLICY_REFORM_JFD_COMMAND_SOVEREIGN',						0,								0,										0,										0,										0,										0,									10,										0,										0,												'TXT_KEY_JFD_REFORM_COMMAND_SOVEREIGN_SHORT_DESC'),
		('POLICY_REFORM_JFD_COMMAND_MILITARY',						0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_COMMAND_MILITARY_SHORT_DESC'),
		('POLICY_REFORM_JFD_COMMAND_STATE',							0,								0,										0,										0,										0,										0,									10,										0,										0,												'TXT_KEY_JFD_REFORM_COMMAND_STATE_SHORT_DESC'),
		--Conflict                 			      	                                				                            			                            			                                    	                    					                            		                        				                   														
		('POLICY_REFORM_JFD_CONFLICT_OFFENSE',						0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_CONFLICT_OFFENSE_SHORT_DESC'),
		('POLICY_REFORM_JFD_CONFLICT_MIXED',						0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_CONFLICT_MIXED_SHORT_DESC'),
		('POLICY_REFORM_JFD_CONFLICT_DEFENSE',						0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_CONFLICT_DEFENSE_SHORT_DESC'),
		--Conquest                 			      	                            				                            								        			                                    	                                    	                                		                    			    	               															
		('POLICY_REFORM_JFD_CONQUEST_SUBJUGATION',					0,								0,										0,										25,										33,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_CONQUEST_SUBJUGATION_SHORT_DESC'),
		('POLICY_REFORM_JFD_CONQUEST_ASSIMILATION',					0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_CONQUEST_ASSIMILATION_SHORT_DESC'),
		('POLICY_REFORM_JFD_CONQUEST_COOPTATION',					0,								0,										0,										-25,									-33,									0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_CONQUEST_COOPTATION_SHORT_DESC'),
		--Levies                 			      	            	                							            							            							                        	                    					                            		                        				                   													
		('POLICY_REFORM_JFD_LEVIES_FRONTLINE',						-20,							0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_LEVIES_FRONTLINE_SHORT_DESC'),
		('POLICY_REFORM_JFD_LEVIES_STANDARD',						0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_LEVIES_STANDARD_SHORT_DESC'),
		('POLICY_REFORM_JFD_LEVIES_RESERVE',						20,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_LEVIES_RESERVE_SHORT_DESC'),
		--Police                 			      	            	                							            							                						                        	                    					                            		                        				                   															
		('POLICY_REFORM_JFD_POLICE_MILITARY',						0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_POLICE_MILITARY_SHORT_DESC'),
		('POLICY_REFORM_JFD_POLICE_VOLUNTEER',						0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_POLICE_VOLUNTEER_SHORT_DESC'),
		('POLICY_REFORM_JFD_POLICE_CIVILIAN',						0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_POLICE_CIVILIAN_SHORT_DESC'),
		--Recruitment                 			      	                            								            							            							                    	                    					                            		                        				                   														
		('POLICY_REFORM_JFD_RECRUITMENT_PROFESSIONAL',				0,								0,										0,										0,										0,										0,									15,										0,										0,												'TXT_KEY_JFD_REFORM_RECRUITMENT_PROFESSIONAL_SHORT_DESC'),
		('POLICY_REFORM_JFD_RECRUITMENT_CONSCRIPT',					0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_RECRUITMENT_CONSCRIPT_SHORT_DESC'),
		('POLICY_REFORM_JFD_RECRUITMENT_MERCENARY',					0,								0,										0,										0,										0,										-20,								0,										0,										0,												'TXT_KEY_JFD_REFORM_RECRUITMENT_MERCENARY_SHORT_DESC'),
		--Slavery                 			      	                                				                            			                            			                                    	                    					                            		                        				                   														
		('POLICY_REFORM_JFD_SLAVERY_ELITE',							0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_SLAVERY_ELITE_SHORT_DESC'),
		('POLICY_REFORM_JFD_SLAVERY_STANDARD',						0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_SLAVERY_STANDARD_SHORT_DESC'),
		('POLICY_REFORM_JFD_SLAVERY_DISPOSABLE',					0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_SLAVERY_DISPOSABLE_SHORT_DESC'),
		--Spending                           			    		                																				    									            	                    					                            		                        				                  																
		('POLICY_REFORM_JFD_WEAPONS_LOCAL',							0,								0,										20,										0,										0,										0,									0,										0,										20,												'TXT_KEY_JFD_REFORM_WEAPONS_LOCAL_SHORT_DESC'),
		('POLICY_REFORM_JFD_WEAPONS_MIXED',							0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_WEAPONS_MIXED_SHORT_DESC'),
		('POLICY_REFORM_JFD_WEAPONS_FOREIGN',						0,								0,										-20,									0,										0,										0,									0,										0,										-20,											'TXT_KEY_JFD_REFORM_WEAPONS_FOREIGN_SHORT_DESC'),
		--Technology                 			      	                            				                            			                            			                                    	                    					                            		                        				                   																	
		('POLICY_REFORM_JFD_TECHNOLOGY_TACTICS',					0,								20,										0,										0,										0,										0,									10,										0,										0,												'TXT_KEY_JFD_REFORM_TECHNOLOGY_TACTICS_SHORT_DESC'),
		('POLICY_REFORM_JFD_TECHNOLOGY_BALANCED',					0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_TECHNOLOGY_BALANCED_SHORT_DESC'),
		('POLICY_REFORM_JFD_TECHNOLOGY_EQUIPMENT',					0,								0,										0,										0,										0,										0,									10,										-33,									0,												'TXT_KEY_JFD_REFORM_TECHNOLOGY_EQUIPMENT_SHORT_DESC');	
																					
--Religion Reforms																			
INSERT INTO Policies																				
		(Type,														BarbarianCombatBonus,			CityGrowthMod,							ConversionModifier,						FaithCostModifier,						GreatPeopleRateModifier,				RemovesPietyIdeologyPenalty,		TradeReligionModifier,					UnhappinessMod,							WLTKDModifier,									Description)
VALUES	--Appeals                                        				                    		                						                        				                    					                            			                                	                																		
		('POLICY_REFORM_JFD_APPEALS_STATE',							0,								0,										-25,									0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_APPEALS_STATE_SHORT_DESC'),
		('POLICY_REFORM_JFD_APPEALS_NONE',							0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_APPEALS_NONE_SHORT_DESC'),
		('POLICY_REFORM_JFD_APPEALS_CHURCH',						0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_APPEALS_CHURCH_SHORT_DESC'),	
		--Festivals                                        				                    		                						                        				                    					            			    			                                																					
		('POLICY_REFORM_JFD_FESTIVALS_HEALING',						0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_FESTIVALS_HEALING_SHORT_DESC'),
		('POLICY_REFORM_JFD_FESTIVALS_NONE',						0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_FESTIVALS_NONE_SHORT_DESC'),
		('POLICY_REFORM_JFD_FESTIVALS_PRAYER',						0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_FESTIVALS_PRAYER_SHORT_DESC'),	
		--Investiture                                        				                		                						                        				                    					                						                                																					
		('POLICY_REFORM_JFD_INVESTITURE_STATE',						0,								0,										0,										-10,									0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_INVESTITURE_STATE_SHORT_DESC'),
		('POLICY_REFORM_JFD_INVESTITURE_NONE',						0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_INVESTITURE_NONE_SHORT_DESC'),
		('POLICY_REFORM_JFD_INVESTITURE_CHURCH',					0,								0,										0,										10,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_INVESTITURE_CHURCH_SHORT_DESC'),	
		--Missions                                        				                		                						                        				                    					                            			                                		                						            					    									
		('POLICY_REFORM_JFD_MISSIONS_ABROAD',						0,								0,										0,										0,										0,										0,									20,										0,										0,												'TXT_KEY_JFD_REFORM_MISSIONS_ABROAD_SHORT_DESC'),
		('POLICY_REFORM_JFD_MISSIONS_BALANCED',						0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_MISSIONS_BALANCED_SHORT_DESC'),
		('POLICY_REFORM_JFD_MISSIONS_DOMESTIC',						0,								0,										0,										0,										0,										0,									-20,									0,										0,												'TXT_KEY_JFD_REFORM_MISSIONS_DOMESTIC_SHORT_DESC'),	
		--Orders                                        			                        		                						                						                    																				            																																	
		('POLICY_REFORM_JFD_ORDERS_MILITANT',						0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_ORDERS_MILITANT_SHORT_DESC'),
		('POLICY_REFORM_JFD_ORDERS_NONE',							0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_ORDERS_NONE_SHORT_DESC'),
		('POLICY_REFORM_JFD_ORDERS_CHARITABLE',						0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_ORDERS_CHARITABLE_SHORT_DESC'),	
		--Sainthood                                        				                    		                						                        				                    					                            			                                	                						                														
		('POLICY_REFORM_JFD_SAINTHOOD_INFORMAL',					0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_SAINTHOOD_INFORMAL_SHORT_DESC'),
		('POLICY_REFORM_JFD_SAINTHOOD_NONE',						0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_SAINTHOOD_NONE_SHORT_DESC'),
		('POLICY_REFORM_JFD_SAINTHOOD_FORMAL',						0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_SAINTHOOD_FORMAL_SHORT_DESC'),	
		--Schooling                                        			                        		                						                						                    																				            																																	
		('POLICY_REFORM_JFD_SCHOOLING_NATURAL',						0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_SCHOOLING_NATURAL_SHORT_DESC'),
		('POLICY_REFORM_JFD_SCHOOLING_SECULAR',						0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_SCHOOLING_SECULAR_SHORT_DESC'),
		('POLICY_REFORM_JFD_SCHOOLING_SCRIPTURAL',					0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_SCHOOLING_SCRIPTURAL_SHORT_DESC'),	
		--Sects                                        			                            		                						                						                    																				            																																	
		('POLICY_REFORM_JFD_SECTS_FUNDAMENTAL',						0,								0,										0,										0,										0,										1,									0,										0,										0,												'TXT_KEY_JFD_REFORM_SECTS_FUNDAMENTAL_SHORT_DESC'),
		('POLICY_REFORM_JFD_SECTS_PREVAILING',						0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_SECTS_PREVAILING_SHORT_DESC'),
		('POLICY_REFORM_JFD_SECTS_UNIVERSAL',						0,								0,										33,										0,										0,										1,									0,										0,										0,												'TXT_KEY_JFD_REFORM_SECTS_UNIVERSAL_SHORT_DESC'),	
		--Worship                                        			                        		                						                						                    																				            																																	
		('POLICY_REFORM_JFD_WORSHIP_SACRIFICE',						20,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_WORSHIP_SACRIFICE_SHORT_DESC'),
		('POLICY_REFORM_JFD_WORSHIP_PRIVATE',						0,								0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_WORSHIP_PRIVATE_SHORT_DESC'),
		('POLICY_REFORM_JFD_WORSHIP_PROCREATION',					-20,							0,										0,										0,										0,										0,									0,										0,										0,												'TXT_KEY_JFD_REFORM_WORSHIP_PROCREATION_SHORT_DESC');	
--------------------------------------------------------------------------------------------------------------------------					
-- Policy_UnitCombatFreeExperiences	
--------------------------------------------------------------------------------------------------------------------------	
--MILITARY: Recruitment	
INSERT INTO Policy_UnitCombatFreeExperiences
		(PolicyType,										UnitCombatType,			FreeExperience)
SELECT	'POLICY_REFORM_JFD_RECRUITMENT_PROFESSIONAL', 		Type,					20
FROM UnitCombatInfos WHERE Type IS NOT NULL
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_MERCENARIES_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------				
-- Policy_UnitCombatProductionModifiers
--------------------------------------------------------------------------------------------------------------------------
--INDUSTRY: Labour
INSERT INTO Policy_UnitCombatProductionModifiers
		(PolicyType,										UnitCombatType,			ProductionModifier)
SELECT	'POLICY_REFORM_JFD_LABOUR_EMANCIPATED', 			'UNITCOMBAT_CIVILIAN',	20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_UnitCombatProductionModifiers
		(PolicyType,										UnitCombatType,			ProductionModifier)
SELECT	'POLICY_REFORM_JFD_LABOUR_BONDED', 					'UNITCOMBAT_CIVILIAN',	-20
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_YieldModifiers
--------------------------------------------------------------------------------------------------------------------------	
--LEGAL: Basis
INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType, 					Yield)
SELECT	'POLICY_REFORM_JFD_BASIS_RELIGIOUS', 				'YIELD_CULTURE', 			-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType, 					Yield)
SELECT	'POLICY_REFORM_JFD_BASIS_SECULAR', 					'YIELD_FAITH', 				-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--LEGAL: System
INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType, 					Yield)
SELECT	'POLICY_REFORM_JFD_SYSTEM_CIVIL', 					'YIELD_CULTURE', 			-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType, 					Yield)
SELECT	'POLICY_REFORM_JFD_SYSTEM_COMMON', 					'YIELD_CULTURE', 			-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--CULTURE: Heraldry
INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType, 					Yield)
SELECT	'POLICY_REFORM_JFD_HERALDRY_CIVILIAN', 				'YIELD_CULTURE', 			-5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType, 					Yield)
SELECT	'POLICY_REFORM_JFD_HERALDRY_MILITARY', 				'YIELD_CULTURE', 			-5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--CULTURE: Marriage
INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType, 					Yield)
SELECT	'POLICY_REFORM_JFD_MARRIAGE_CIVIC', 				'YIELD_FAITH', 				-15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType, 					Yield)
SELECT	'POLICY_REFORM_JFD_MARRIAGE_RELIGIOUS', 			'YIELD_CULTURE', 			-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--CULTURE: Patronage
INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType,					Yield)
SELECT	'POLICY_REFORM_JFD_PATRONAGE_ARTISTS', 				'YIELD_GOLD',				-5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType,					Yield)
SELECT	'POLICY_REFORM_JFD_PATRONAGE_MERCHANTS', 			'YIELD_CULTURE',			-5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--CULTURE: Peerage
INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType,					Yield)
SELECT	'POLICY_REFORM_JFD_PEERAGE_CEREMONIAL', 			'YIELD_JFD_CRIME',			5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType,					Yield)
SELECT	'POLICY_REFORM_JFD_PEERAGE_PRIVILEGED', 			'YIELD_JFD_CRIME',			5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

--ECONOMY: Guilds
INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType,					Yield)
SELECT	'POLICY_REFORM_JFD_GUILDS_COMMERCIAL', 				'YIELD_PRODUCTION',			-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType,					Yield)
SELECT	'POLICY_REFORM_JFD_GUILDS_CRAFTS', 					'YIELD_GOLD',				-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--ECONOMY: Market
INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType,					Yield)
SELECT	'POLICY_REFORM_JFD_MARKET_FREE', 					'YIELD_PRODUCTION',			-15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);	
	
INSERT INTO Policy_YieldModifiers	
		(PolicyType,										YieldType,					Yield)
SELECT	'POLICY_REFORM_JFD_MARKET_PLANNED', 				'YIELD_GOLD',				-15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--ECONOMY: Tax (Upper)
INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType,					Yield)
SELECT	'POLICY_REFORM_JFD_U_TAXATION_EXEMPT', 				'YIELD_JFD_SOVEREIGNTY',	10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);	

--ECONOMY: Welfare
INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType,					Yield)
SELECT	'POLICY_REFORM_JFD_WELFARE_CHARITY', 				'YIELD_GOLD',				15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType,					Yield)
SELECT	'POLICY_REFORM_JFD_WELFARE_STATE', 					'YIELD_GOLD',				-15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--INDUSTRY: Scholarship
INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType,					Yield)
SELECT	'POLICY_REFORM_JFD_SCHOLARSHIP_ENGINEERING', 		'YIELD_GOLD',				-5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType,					Yield)
SELECT	'POLICY_REFORM_JFD_SCHOLARSHIP_RESEARCH', 			'YIELD_GOLD',				-5
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--MILITARY: Spending 
INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType,					Yield)
SELECT	'POLICY_REFORM_JFD_WEAPONS_LOCAL', 					'YIELD_GOLD',				-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType,					Yield)
SELECT	'POLICY_REFORM_JFD_WEAPONS_FOREIGN', 				'YIELD_GOLD',				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--FOREIGN: Tourism
INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType,					Yield)
SELECT	'POLICY_REFORM_JFD_TOURISM_FREE', 					'YIELD_JFD_CRIME',			15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType,					Yield)
SELECT	'POLICY_REFORM_JFD_TOURISM_LIMITED', 				'YIELD_JFD_CRIME',			-15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1);

--INDUSTRY: Education
INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType,					Yield)
SELECT	'POLICY_REFORM_JFD_EDUCATION_ACADEMIC', 			'YIELD_GOLD',				-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType,					Yield)
SELECT	'POLICY_REFORM_JFD_EDUCATION_TECHNICAL', 			'YIELD_GOLD',				-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--RELIGON: Festivals
INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType, 					Yield)
SELECT	'POLICY_REFORM_JFD_FESTIVALS_HEALING', 				'YIELD_GOLD', 				-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType, 					Yield)
SELECT	'POLICY_REFORM_JFD_FESTIVALS_PRAYER', 				'YIELD_GOLD', 				-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--RELIGION: Schooling
INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType,					Yield)
SELECT	'POLICY_REFORM_JFD_SCHOOLING_NATURAL', 				'YIELD_CULTURE',			-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType,					Yield)
SELECT	'POLICY_REFORM_JFD_SCHOOLING_SCRIPTURAL', 			'YIELD_CULTURE',			-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--RELIGION: Orders
INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType,					Yield)
SELECT	'POLICY_REFORM_JFD_ORDERS_CHARITABLE', 				'YIELD_FAITH',				-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_YieldModifiers
		(PolicyType,										YieldType,					Yield)
SELECT	'POLICY_REFORM_JFD_ORDERS_MILITANT', 				'YIELD_FAITH',				-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_SpecialistYieldChanges
--------------------------------------------------------------------------------------------------------------------------
--LEGAL: Administration
INSERT INTO Policy_SpecialistYieldChanges
		(PolicyType,										SpecialistType, 		YieldType, 					Yield)
SELECT	'POLICY_REFORM_JFD_ADMINISTRATION_BUREAUCRATIC', 	Type,					'YIELD_GOLDEN_AGE_POINTS',	4
FROM Specialists WHERE Type IN ('SPECIALIST_JFD_DIGNITARY', 'SPECIALIST_JFD_MAGISTRATE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_SpecialistYieldChanges
		(PolicyType,										SpecialistType, 		YieldType, 					Yield)
SELECT	'POLICY_REFORM_JFD_ADMINISTRATION_TECHNOCRATIC', 	Type,					'YIELD_PRODUCTION',			2
FROM Specialists WHERE Type IN ('SPECIALIST_ENGINEER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--INDUSTRY: Education
INSERT INTO Policy_SpecialistYieldChanges
		(PolicyType,										SpecialistType, 		YieldType, 					Yield)
SELECT	'POLICY_REFORM_JFD_EDUCATION_ACADEMIC', 			Type,					'YIELD_SCIENCE',			2
FROM Specialists WHERE Type IN ('SPECIALIST_SCIENTIST')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_SpecialistYieldChanges
		(PolicyType,										SpecialistType, 		YieldType, 					Yield)
SELECT	'POLICY_REFORM_JFD_EDUCATION_TECHNICAL', 			Type,					'YIELD_PRODUCTION',			2
FROM Specialists WHERE Type IN ('SPECIALIST_ENGINEER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--RELIGION: Schooling
INSERT INTO Policy_SpecialistYieldChanges
		(PolicyType,										SpecialistType, 		YieldType, 					Yield)
SELECT	'POLICY_REFORM_JFD_SCHOOLING_NATURAL', 				Type,					'YIELD_FAITH',				2
FROM Specialists WHERE Type IN ('SPECIALIST_SCIENTIST')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_SpecialistYieldChanges
		(PolicyType,										SpecialistType, 		YieldType, 					Yield)
SELECT	'POLICY_REFORM_JFD_SCHOOLING_SCRIPTURAL', 			Type,					'YIELD_SCIENCE',			2
FROM Specialists WHERE Type IN ('SPECIALIST_JFD_MONK')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_SpecialistYieldChanges
--------------------------------------------------------------------------------------------------------------------------
--INDUSTRY: Patents
INSERT INTO Policy_ImprovementYieldChanges
		(PolicyType,										ImprovementType, 		YieldType, 					Yield)
SELECT	'POLICY_REFORM_JFD_PATENTS_LIMITED', 				Type,					'YIELD_SCIENCE',			2
FROM Improvements WHERE Type IN ('IMPROVEMENT_ACADEMY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_GreatWorkYieldChanges
--------------------------------------------------------------------------------------------------------------------------
--CULTURE: Publications
INSERT INTO Policy_GreatWorkYieldChanges
		(PolicyType,								YieldType, 					Yield)
SELECT	'POLICY_REFORM_JFD_PUBLICATIONS_PUBLIC', 	'YIELD_CULTURE',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_GreatWorkYieldChanges
		(PolicyType,								YieldType, 					Yield)
SELECT	'POLICY_REFORM_JFD_PUBLICATIONS_PUBLIC', 	'YIELD_TOURISM',			-1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_GreatWorkYieldChanges
		(PolicyType,								YieldType, 					Yield)
SELECT	'POLICY_REFORM_JFD_PUBLICATIONS_PRIVATE', 	'YIELD_CULTURE',			-1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_GreatWorkYieldChanges
		(PolicyType,								YieldType, 					Yield)
SELECT	'POLICY_REFORM_JFD_PUBLICATIONS_PRIVATE', 	'YIELD_TOURISM',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_FeatureYieldChanges
--------------------------------------------------------------------------------------------------------------------------
--INDUSTRY: Environment
INSERT INTO Policy_FeatureYieldChanges
		(PolicyType,								FeatureType,		YieldType, 				Yield)
SELECT	'POLICY_REFORM_JFD_ENVIRONMENT_EXTORTED', 	'FEATURE_FOREST',	'YIELD_PRODUCTION',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Policy_FeatureYieldChanges
		(PolicyType,								FeatureType,		YieldType, 				Yield)
SELECT	'POLICY_REFORM_JFD_ENVIRONMENT_EXTORTED', 	'FEATURE_JUNGLE',	'YIELD_FOOD',			1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Policy_FeatureYieldChanges
		(PolicyType,								FeatureType,		YieldType, 				Yield)
SELECT	'POLICY_REFORM_JFD_ENVIRONMENT_EXTORTED', 	Type,				'YIELD_JFD_DISEASE',	1
FROM Features WHERE Type IN ('FEATURE_JUNGLE', 'FEATURE_FOREST')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Policy_FeatureYieldChanges
		(PolicyType,								FeatureType,		YieldType, 				Yield)
SELECT	'POLICY_REFORM_JFD_ENVIRONMENT_PROTECTED', 	'FEATURE_FOREST',	'YIELD_JFD_HEALTH',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Policy_FeatureYieldChanges
		(PolicyType,								FeatureType,		YieldType, 				Yield)
SELECT	'POLICY_REFORM_JFD_ENVIRONMENT_PROTECTED', 	'FEATURE_JUNGLE',	'YIELD_SCIENCE',		1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Policy_FeatureYieldChanges
		(PolicyType,								FeatureType,		YieldType, 				Yield)
SELECT	'POLICY_REFORM_JFD_ENVIRONMENT_PROTECTED', 	'FEATURE_FOREST',	'YIELD_PRODUCTION',		-1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);

INSERT INTO Policy_FeatureYieldChanges
		(PolicyType,								FeatureType,		YieldType, 				Yield)
SELECT	'POLICY_REFORM_JFD_ENVIRONMENT_PROTECTED', 	'FEATURE_JUNGLE',	'YIELD_FOOD',			-1
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_WLTKDYieldMod
--------------------------------------------------------------------------------------------------------------------------
--RELIGION: Sainthood
INSERT INTO Policy_WLTKDYieldMod
		(PolicyType,								YieldType, 			Yield)
SELECT	'POLICY_REFORM_JFD_SAINTHOOD_FORMAL', 		'YIELD_FAITH',		15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_WLTKDYieldMod
		(PolicyType,								YieldType, 			Yield)
SELECT	'POLICY_REFORM_JFD_SAINTHOOD_FORMAL', 		'YIELD_FOOD',		-15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_WLTKDYieldMod
		(PolicyType,								YieldType, 			Yield)
SELECT	'POLICY_REFORM_JFD_SAINTHOOD_INFORMAL', 	'YIELD_FAITH',		-15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_WLTKDYieldMod
		(PolicyType,								YieldType, 			Yield)
SELECT	'POLICY_REFORM_JFD_SAINTHOOD_INFORMAL', 	'YIELD_FOOD',		15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_GoldenAgeYieldMod
--------------------------------------------------------------------------------------------------------------------------
--CULTURE: Expression
INSERT INTO Policy_GoldenAgeYieldMod
		(PolicyType,								YieldType, 			Yield)
SELECT	'POLICY_REFORM_JFD_SPEECH_CENSORED', 		'YIELD_CULTURE',	-15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_GoldenAgeYieldMod
		(PolicyType,								YieldType, 			Yield)
SELECT	'POLICY_REFORM_JFD_SPEECH_CENSORED', 		'YIELD_PRODUCTION',	15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_GoldenAgeYieldMod
		(PolicyType,								YieldType, 			Yield)
SELECT	'POLICY_REFORM_JFD_SPEECH_FREE', 			'YIELD_CULTURE',	15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_GoldenAgeYieldMod
		(PolicyType,								YieldType, 			Yield)
SELECT	'POLICY_REFORM_JFD_SPEECH_FREE', 			'YIELD_PRODUCTION',	-15
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_BuildingClassProductionModifiers
--------------------------------------------------------------------------------------------------------------------------
--CULTURE: Public Works
INSERT INTO Policy_BuildingClassProductionModifiers
		(PolicyType,										BuildingClassType, 		ProductionModifier)
SELECT	'POLICY_REFORM_JFD_PUBLIC_WORKS_CEREMONIAL', 		Type,					15
FROM BuildingClasses WHERE MaxPlayerInstances = 1
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassProductionModifiers
		(PolicyType,										BuildingClassType, 		ProductionModifier)
SELECT	'POLICY_REFORM_JFD_PUBLIC_WORKS_CIVIC', 			Type,					15
FROM BuildingClasses WHERE MaxGlobalInstances = 1
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

CREATE TRIGGER JFDRTP_Sovereigny_BuildingClassProductionModifiers
AFTER INSERT ON BuildingClasses 
WHEN NEW.MaxPlayerInstances = 1 OR NEW.MaxGlobalInstances = 1
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1)
BEGIN
	INSERT INTO Policy_BuildingClassProductionModifiers
			(PolicyType,									BuildingClassType, 		ProductionModifier)
	SELECT	'POLICY_REFORM_JFD_PUBLIC_WORKS_CEREMONIAL', 	Type,					15
	FROM BuildingClasses WHERE NEW.MaxPlayerInstances = 1;
	
	INSERT INTO Policy_BuildingClassProductionModifiers
			(PolicyType,									BuildingClassType, 		ProductionModifier)
	SELECT	'POLICY_REFORM_JFD_PUBLIC_WORKS_CIVIC', 		Type,					15
	FROM BuildingClasses WHERE NEW.MaxGlobalInstances = 1;
END;

--ECONOMY: Organization
INSERT INTO Policy_BuildingClassProductionModifiers
		(PolicyType,										BuildingClassType, 		ProductionModifier)
SELECT	'POLICY_REFORM_JFD_ORGANIZATION_MANORIAL', 			Type,					50
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_MANSION', 'BUILDINGCLASS_JFD_MANOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassProductionModifiers
		(PolicyType,										BuildingClassType, 		ProductionModifier)
SELECT	'POLICY_REFORM_JFD_ORGANIZATION_MUNICIPAL', 		Type,					-50
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_MANSION', 'BUILDINGCLASS_JFD_MANOR')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--MILITARY: Conflict
INSERT INTO Policy_BuildingClassProductionModifiers
		(PolicyType,										BuildingClassType, 		ProductionModifier)
SELECT	'POLICY_REFORM_JFD_CONFLICT_DEFENSE', 				Type,					33
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_WALLS', 'BUILDINGCLASS_CASTLE', 'BUILDINGCLASS_EE_BASTION', 'BUILDINGCLASS_ARSENAL', 'BUILDINGCLASS_MILITARY_BASE', 'BUILDINGCLASS_BOMB_SHELTER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassProductionModifiers
		(PolicyType,										BuildingClassType, 		ProductionModifier)
SELECT	'POLICY_REFORM_JFD_CONFLICT_DEFENSE', 				Type,					-33
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_BARRACKS', 'BUILDINGCLASS_ARMORY', 'BUILDINGCLASS_MILITARY_ACADEMY', 'BUILDINGCLASS_JFD_DRILL_ACADEMY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassProductionModifiers
		(PolicyType,										BuildingClassType, 		ProductionModifier)
SELECT	'POLICY_REFORM_JFD_CONFLICT_OFFENSE', 				Type,					33
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_BARRACKS', 'BUILDINGCLASS_ARMORY', 'BUILDINGCLASS_MILITARY_ACADEMY', 'BUILDINGCLASS_JFD_DRILL_ACADEMY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassProductionModifiers
		(PolicyType,										BuildingClassType, 		ProductionModifier)
SELECT	'POLICY_REFORM_JFD_CONFLICT_OFFENSE', 				Type,					-33
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_WALLS', 'BUILDINGCLASS_CASTLE', 'BUILDINGCLASS_EE_BASTION', 'BUILDINGCLASS_ARSENAL', 'BUILDINGCLASS_MILITARY_BASE', 'BUILDINGCLASS_BOMB_SHELTER')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_BuildingClassTourismModifiers
--------------------------------------------------------------------------------------------------------------------------
--FOREIGN: Tribes
INSERT INTO Policy_BuildingClassTourismModifiers
		(PolicyType,								BuildingClassType, 				TourismModifier)
SELECT	'POLICY_REFORM_JFD_TRIBES_ASSIMILATION', 	Type,							10
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_BEDOUIN', 'BUILDINGCLASS_JFD_BHAKTI', 'BUILDINGCLASS_JFD_CHAVIN', 'BUILDINGCLASS_JFD_COMANCHE', 'BUILDINGCLASS_JFD_COSSACKS', 'BUILDINGCLASS_JFD_DOGON', 'BUILDINGCLASS_JFD_DORSET', 'BUILDINGCLASS_JFD_HURON', 'BUILDINGCLASS_JFD_ITZA', 'BUILDINGCLASS_JFD_KHOIKHOI', 'BUILDINGCLASS_JFD_KOROWAI', 'BUILDINGCLASS_JFD_KUNTA', 'BUILDINGCLASS_JFD_KWAK', 'BUILDINGCLASS_JFD_MATSUDAIRA', 'BUILDINGCLASS_JFD_MAYAIMI', 'BUILDINGCLASS_JFD_SHAOLIN', 'BUILDINGCLASS_JFD_SUFI', 'BUILDINGCLASS_JFD_TARTARS', 'BUILDINGCLASS_JFD_TLAXCALA', 'BUILDINGCLASS_JFD_UDASI')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_TRIBES_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_BuildingClassYieldModifiers
--------------------------------------------------------------------------------------------------------------------------
--LEGAL: Immunity
INSERT INTO Policy_BuildingClassYieldModifiers
		(PolicyType,								BuildingClassType, 						YieldType, 			YieldMod)
SELECT	'POLICY_REFORM_JFD_IMMUNITY_SOVEREIGN', 	'BUILDINGCLASS_PALACE',					'YIELD_JFD_CRIME', 	-25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);	

INSERT INTO Policy_BuildingClassYieldModifiers
		(PolicyType,								BuildingClassType, 						YieldType, 			YieldMod)
SELECT	Type, 										'BUILDINGCLASS_JFD_MAGISTRATE_COURT',	'YIELD_JFD_CRIME', 	5
FROM Policies WHERE Type IN ('POLICY_REFORM_JFD_IMMUNITY_SOVEREIGN', 'POLICY_REFORM_JFD_IMMUNITY_NONE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldModifiers
		(PolicyType,								BuildingClassType, 						YieldType, 			YieldMod)
SELECT	Type, 										'BUILDINGCLASS_JFD_HIGH_COURT',			'YIELD_JFD_CRIME', 	5
FROM Policies WHERE Type IN ('POLICY_REFORM_JFD_IMMUNITY_SOVEREIGN', 'POLICY_REFORM_JFD_IMMUNITY_NONE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE_ORGANIZED' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--LEGAL: System
INSERT INTO Policy_BuildingClassYieldModifiers
		(PolicyType,								BuildingClassType, 						YieldType, 			YieldMod)
SELECT	'POLICY_REFORM_JFD_SYSTEM_CIVIL', 			'BUILDINGCLASS_JFD_MAGISTRATE_COURT',	'YIELD_JFD_CRIME', 	-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldModifiers
		(PolicyType,								BuildingClassType, 						YieldType, 			YieldMod)
SELECT	'POLICY_REFORM_JFD_SYSTEM_CIVIL', 			'BUILDINGCLASS_JFD_HIGH_COURT',			'YIELD_JFD_CRIME', 	-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldModifiers
		(PolicyType,								BuildingClassType, 						YieldType, 			YieldMod)
SELECT	'POLICY_REFORM_JFD_SYSTEM_COMMON', 			'BUILDINGCLASS_CONSTABLE',				'YIELD_JFD_CRIME', 	-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldModifiers
		(PolicyType,								BuildingClassType, 						YieldType, 			YieldMod)
SELECT	'POLICY_REFORM_JFD_SYSTEM_COMMON', 			'BUILDINGCLASS_JFD_JAIL',				'YIELD_JFD_CRIME', 	-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--CULTURE: Media
INSERT INTO Policy_BuildingClassYieldModifiers
		(PolicyType,								BuildingClassType, 		YieldType, 							YieldMod)
SELECT	'POLICY_REFORM_JFD_MEDIA_INDEPENDENT', 		Type,					'YIELD_CULTURE', 					5
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_THEATRE', 'BUILDINGCLASS_BROADCAST_TOWER')		
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)		
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);		
		
INSERT INTO Policy_BuildingClassYieldModifiers		
		(PolicyType,								BuildingClassType, 		YieldType, 							YieldMod)
SELECT	'POLICY_REFORM_JFD_MEDIA_INDEPENDENT', 		Type,					'YIELD_JFD_LOYALTY', 				-5
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_THEATRE', 'BUILDINGCLASS_BROADCAST_TOWER')		
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)		
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);		
		
INSERT INTO Policy_BuildingClassYieldModifiers		
		(PolicyType,								BuildingClassType, 		YieldType, 							YieldMod)
SELECT	'POLICY_REFORM_JFD_MEDIA_STATE', 			Type,					'YIELD_CULTURE', 					-5
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_THEATRE', 'BUILDINGCLASS_BROADCAST_TOWER')		
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)		
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);		
		
INSERT INTO Policy_BuildingClassYieldModifiers		
		(PolicyType,								BuildingClassType, 		YieldType, 							YieldMod)
SELECT	'POLICY_REFORM_JFD_MEDIA_STATE', 			Type,					'YIELD_JFD_LOYALTY', 				5
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_THEATRE', 'BUILDINGCLASS_BROADCAST_TOWER')		
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)		
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);		
		
--CULTURE: Marriage		
INSERT INTO Policy_BuildingClassYieldModifiers		
		(PolicyType,								BuildingClassType, 		YieldType, 							YieldMod)
SELECT	'POLICY_REFORM_JFD_MARRIAGE_CIVIC',			Type,					'YIELD_CULTURE', 					10
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_MAGISTRATE_COURT')		
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)		
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);		
		
INSERT INTO Policy_BuildingClassYieldModifiers		
		(PolicyType,								BuildingClassType, 		YieldType, 							YieldMod)
SELECT	'POLICY_REFORM_JFD_MARRIAGE_RELIGIOUS', 	Type,					'YIELD_FAITH', 						15
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_TEMPLE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--ECONOMY: Taxation (Church)
INSERT INTO Policy_BuildingClassYieldModifiers
		(PolicyType,								BuildingClassType, 				YieldType, 					YieldMod)
SELECT	'POLICY_REFORM_JFD_C_TAXATION_EXEMPT', 		'BUILDINGCLASS_TEMPLE',			'YIELD_GOLD', 				-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldModifiers
		(PolicyType,								BuildingClassType, 				YieldType, 					YieldMod)
SELECT	'POLICY_REFORM_JFD_C_TAXATION_HIGH',	 	'BUILDINGCLASS_TEMPLE',			'YIELD_GOLD', 				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--ECONOMY: Taxation (Lower)
INSERT INTO Policy_BuildingClassYieldModifiers
		(PolicyType,								BuildingClassType, 				YieldType, 					YieldMod)
SELECT	'POLICY_REFORM_JFD_L_TAXATION_EXEMPT', 		'BUILDINGCLASS_JFD_ASSEMBLY',	'YIELD_GOLD', 				-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldModifiers
		(PolicyType,								BuildingClassType, 				YieldType, 					YieldMod)
SELECT	'POLICY_REFORM_JFD_L_TAXATION_HIGH',	 	'BUILDINGCLASS_JFD_ASSEMBLY',	'YIELD_GOLD', 				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_CORE' AND Value = 1);

--ECONOMY: Taxation (Upper)
INSERT INTO Policy_BuildingClassYieldModifiers
		(PolicyType,								BuildingClassType, 				YieldType, 					YieldMod)
SELECT	'POLICY_REFORM_JFD_U_TAXATION_EXEMPT', 		'BUILDINGCLASS_JFD_CHANCERY',	'YIELD_GOLD', 				-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldModifiers
		(PolicyType,								BuildingClassType, 				YieldType, 					YieldMod)
SELECT	'POLICY_REFORM_JFD_U_TAXATION_HIGH',	 	'BUILDINGCLASS_JFD_CHANCERY',	'YIELD_GOLD', 				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_CLAIMS_CORE' AND Value = 1);

--FOREIGN: Citizenship
INSERT INTO Policy_BuildingClassYieldModifiers
		(PolicyType,								BuildingClassType, 							YieldType, 					YieldMod)
SELECT	'POLICY_REFORM_JFD_CITIZENSHIP_FULL', 		'BUILDINGCLASS_JFD_PUPPET_CITY',			'YIELD_JFD_LOYALTY', 		25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldModifiers
		(PolicyType,								BuildingClassType, 							YieldType, 					YieldMod)
SELECT	'POLICY_REFORM_JFD_CITIZENSHIP_NONE', 		'BUILDINGCLASS_JFD_PUPPET_CITY',			'YIELD_JFD_LOYALTY', 		-25
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--FOREIGN: Taxation (Colonies)
INSERT INTO Policy_BuildingClassYieldModifiers
		(PolicyType,								BuildingClassType, 							YieldType, 					YieldMod)
SELECT	'POLICY_REFORM_JFD_CO_TAXATION_EXEMPT', 	'BUILDINGCLASS_JFD_GOVERNORS_MANSION',		'YIELD_GOLD', 				-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldModifiers
		(PolicyType,								BuildingClassType, 							YieldType, 					YieldMod)
SELECT	'POLICY_REFORM_JFD_CO_TAXATION_HIGH',	 	'BUILDINGCLASS_JFD_GOVERNORS_MANSION',		'YIELD_GOLD', 				10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldModifiers
		(PolicyType,								BuildingClassType, 							YieldType, 					YieldMod)
SELECT	'POLICY_REFORM_JFD_CO_TAXATION_EXEMPT', 	'BUILDINGCLASS_JFD_GOVERNORS_MANSION',		'YIELD_JFD_LOYALTY', 		10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);	
	
INSERT INTO Policy_BuildingClassYieldModifiers	
		(PolicyType,								BuildingClassType, 							YieldType, 					YieldMod)
SELECT	'POLICY_REFORM_JFD_CO_TAXATION_HIGH',	 	'BUILDINGCLASS_JFD_GOVERNORS_MANSION',		'YIELD_JFD_LOYALTY', 		-10
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

--FOREIGN: Tribes
INSERT INTO Policy_BuildingClassYieldModifiers
		(PolicyType,								BuildingClassType, 				YieldType, 					YieldMod)
SELECT	'POLICY_REFORM_JFD_TRIBES_ASSIMILATION', 	Type,							'YIELD_JFD_CRIME', 			10
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_BEDOUIN', 'BUILDINGCLASS_JFD_BHAKTI', 'BUILDINGCLASS_JFD_CHAVIN', 'BUILDINGCLASS_JFD_COMANCHE', 'BUILDINGCLASS_JFD_COSSACKS', 'BUILDINGCLASS_JFD_DOGON', 'BUILDINGCLASS_JFD_DORSET', 'BUILDINGCLASS_JFD_HURON', 'BUILDINGCLASS_JFD_ITZA', 'BUILDINGCLASS_JFD_KHOIKHOI', 'BUILDINGCLASS_JFD_KOROWAI', 'BUILDINGCLASS_JFD_KUNTA', 'BUILDINGCLASS_JFD_KWAK', 'BUILDINGCLASS_JFD_MATSUDAIRA', 'BUILDINGCLASS_JFD_MAYAIMI', 'BUILDINGCLASS_JFD_SHAOLIN', 'BUILDINGCLASS_JFD_SUFI', 'BUILDINGCLASS_JFD_TARTARS', 'BUILDINGCLASS_JFD_TLAXCALA', 'BUILDINGCLASS_JFD_UDASI')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_TRIBES_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldModifiers
		(PolicyType,								BuildingClassType, 				YieldType, 					YieldMod)
SELECT	'POLICY_REFORM_JFD_TRIBES_RESERVATION',		Type,							'YIELD_CULTURE', 			10
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_BEDOUIN', 'BUILDINGCLASS_JFD_BHAKTI', 'BUILDINGCLASS_JFD_CHAVIN', 'BUILDINGCLASS_JFD_COMANCHE', 'BUILDINGCLASS_JFD_COSSACKS', 'BUILDINGCLASS_JFD_DOGON', 'BUILDINGCLASS_JFD_DORSET', 'BUILDINGCLASS_JFD_HURON', 'BUILDINGCLASS_JFD_ITZA', 'BUILDINGCLASS_JFD_KHOIKHOI', 'BUILDINGCLASS_JFD_KOROWAI', 'BUILDINGCLASS_JFD_KUNTA', 'BUILDINGCLASS_JFD_KWAK', 'BUILDINGCLASS_JFD_MATSUDAIRA', 'BUILDINGCLASS_JFD_MAYAIMI', 'BUILDINGCLASS_JFD_SHAOLIN', 'BUILDINGCLASS_JFD_SUFI', 'BUILDINGCLASS_JFD_TARTARS', 'BUILDINGCLASS_JFD_TLAXCALA', 'BUILDINGCLASS_JFD_UDASI')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_TRIBES_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldModifiers
		(PolicyType,								BuildingClassType, 				YieldType, 					YieldMod)
SELECT	'POLICY_REFORM_JFD_TRIBES_RESERVATION',		Type,							'YIELD_JFD_CRIME', 			10
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_BEDOUIN', 'BUILDINGCLASS_JFD_BHAKTI', 'BUILDINGCLASS_JFD_CHAVIN', 'BUILDINGCLASS_JFD_COMANCHE', 'BUILDINGCLASS_JFD_COSSACKS', 'BUILDINGCLASS_JFD_DOGON', 'BUILDINGCLASS_JFD_DORSET', 'BUILDINGCLASS_JFD_HURON', 'BUILDINGCLASS_JFD_ITZA', 'BUILDINGCLASS_JFD_KHOIKHOI', 'BUILDINGCLASS_JFD_KOROWAI', 'BUILDINGCLASS_JFD_KUNTA', 'BUILDINGCLASS_JFD_KWAK', 'BUILDINGCLASS_JFD_MATSUDAIRA', 'BUILDINGCLASS_JFD_MAYAIMI', 'BUILDINGCLASS_JFD_SHAOLIN', 'BUILDINGCLASS_JFD_SUFI', 'BUILDINGCLASS_JFD_TARTARS', 'BUILDINGCLASS_JFD_TLAXCALA', 'BUILDINGCLASS_JFD_UDASI')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_CRIMES_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_TRIBES_CORE' AND Value = 1);

--RELIGON: Festivals
INSERT INTO Policy_BuildingClassYieldModifiers
		(PolicyType,								BuildingClassType, 				YieldType, 					YieldMod)
SELECT	'POLICY_REFORM_JFD_FESTIVALS_HEALING', 		Type,							'YIELD_JFD_HEALTH', 		10
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_TEMPLE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldModifiers
		(PolicyType,								BuildingClassType, 				YieldType, 					YieldMod)
SELECT	'POLICY_REFORM_JFD_FESTIVALS_PRAYER', 		Type,							'YIELD_FAITH', 				10
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_TEMPLE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_HEALTH_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_SOVEREIGNTY_CORE' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================