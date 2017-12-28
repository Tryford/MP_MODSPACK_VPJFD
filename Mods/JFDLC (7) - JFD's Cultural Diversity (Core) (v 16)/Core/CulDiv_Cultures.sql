--==========================================================================================================================
-- CULTURES
--==========================================================================================================================
-- JFD_CultureBranches
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO JFD_CultureBranches
		(Type,									ShortDescription)
VALUES	('CULTURE_BRANCH_JFD_AFRICA',			'TXT_KEY_CULTURE_BRANCH_JFD_AFRICA_SHORT_DESC'),
		('CULTURE_BRANCH_JFD_CENTRAL_ASIA',		'TXT_KEY_CULTURE_BRANCH_JFD_CENTRAL_ASIA_SHORT_DESC'),
		('CULTURE_BRANCH_JFD_EAST_ASIA',		'TXT_KEY_CULTURE_BRANCH_JFD_EAST_ASIA_SHORT_DESC'),
		('CULTURE_BRANCH_JFD_EUROPE',			'TXT_KEY_CULTURE_BRANCH_JFD_EUROPE_SHORT_DESC'),
		('CULTURE_BRANCH_JFD_MIDDLE_EAST',		'TXT_KEY_CULTURE_BRANCH_JFD_MIDDLE_EAST_SHORT_DESC'),
		('CULTURE_BRANCH_JFD_NORTH_AMERICA',	'TXT_KEY_CULTURE_BRANCH_JFD_NORTH_AMERICA_SHORT_DESC'),
		('CULTURE_BRANCH_JFD_OCEANIA',			'TXT_KEY_CULTURE_BRANCH_JFD_OCEANIA_SHORT_DESC'),
		('CULTURE_BRANCH_JFD_SOUTH_AMERICA',	'TXT_KEY_CULTURE_BRANCH_JFD_SOUTH_AMERICA_SHORT_DESC'),
		('CULTURE_BRANCH_JFD_SOUTH_ASIA',		'TXT_KEY_CULTURE_BRANCH_JFD_SOUTH_ASIA_SHORT_DESC');
--==========================================================================================================================
-- CULTURES
--==========================================================================================================================
-- JFD_CultureTypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO JFD_CultureTypes
		(Type,									BranchType,									LowerType,					ShortDescription,									DefeatScreenEarly,						DefeatScreenMid,					DefeatScreenLate,						ArtDefineTag,				DecisionsTag,				IdealsTag,					SoundtrackTag,				SplashScreenTag,			UnitDialogueTag,					StartDistance,	EmbarkationArtDefineEarly,				EmbarkationArtDefineMid,				FontIcon,								IconAtlas, 								PortraitIndex)
VALUES	('CULTURE_JFD_ABORIGINAL',				'CULTURE_BRANCH_JFD_OCEANIA',				'JFD_Sahul', 				'TXT_KEY_CULTURE_JFD_ABORIGINAL_SHORT_DESC', 		'DefeatScreenAboriginal.dds',			'DefeatScreenAboriginal.dds',		'DefeatScreenAboriginal.dds',			'_JFD_ABORIGINAL',			'JFD_Aboriginal', 			'JFD_Aboriginal', 			'JFD_Aboriginal', 			'JFD_Aboriginal', 			NULL,								30,				'ART_DEF_UNIT_JFD_CANOE',				'ART_DEF_UNIT_JFD_CANOE',				'[ICON_JFD_CULTURE_ABORIGINAL]', 		'JFD_CULTURAL_DIVERSITY_ATLAS',			15),
		('CULTURE_JFD_ANDEAN',					'CULTURE_BRANCH_JFD_SOUTH_AMERICA',			'JFD_Andean', 				'TXT_KEY_CULTURE_JFD_ANDEAN_SHORT_DESC', 			'DefeatScreenEarlyAndean.dds',			'DefeatScreenMidAndean.dds',		'DefeatScreenLateAndean.dds',			'_JFD_ANDEAN',				'JFD_Andean', 				'JFD_Andean', 				'JFD_Andean', 				'JFD_Andean', 				'AS2D_SOUND_JFD_INCAN',				25,				'ART_DEF_UNIT_JFD_MESO_RAFT',			'ART_DEF_UNIT_JFD_MESO_RAFT',			'[ICON_JFD_CULTURE_ANDEAN]',			'JFD_CULTURAL_DIVERSITY_ATLAS',			0),
		('CULTURE_JFD_BANTU',					'CULTURE_BRANCH_JFD_AFRICA',				'JFD_Bantu', 				'TXT_KEY_CULTURE_JFD_BANTU_SHORT_DESC', 			NULL,									NULL,								NULL,									'_JFD_BANTU',				'JFD_Bantu', 				'JFD_Bantu', 				'JFD_Bantu', 				'JFD_Bantu', 				'AS2D_SOUND_JFD_ZULU',				20,				'ART_DEF_UNIT_JFD_BARGE',				'ART_DEF_UNIT_JFD_BARGE',				'[ICON_JFD_CULTURE_BANTU]', 			'JFD_CULTURAL_DIVERSITY_ATLAS',			1),
		('CULTURE_JFD_BHARATA',					'CULTURE_BRANCH_JFD_SOUTH_ASIA',			'JFD_Bharata', 				'TXT_KEY_CULTURE_JFD_BHARATA_SHORT_DESC', 			'DefeatScreenEarlyBharata.dds',			'DefeatScreenMidBharata.dds',		'DefeatScreenEarlyBharata.dds',			'_JFD_BHARATA',				'JFD_Bharata', 				'JFD_Bharata', 				'JFD_Bharata', 				'JFD_Bharata', 				'AS2D_SOUND_JFD_INDIAN',			15,				'ART_DEF_UNIT_JFD_DHOW',				'ART_DEF_UNIT_JFD_DHOW',				'[ICON_JFD_CULTURE_BHARATA]', 			'JFD_CULTURAL_DIVERSITY_ATLAS',			2),
		('CULTURE_JFD_CENTRAL',					'CULTURE_BRANCH_JFD_EUROPE',				'JFD_Central', 				'TXT_KEY_CULTURE_JFD_CENTRAL_SHORT_DESC', 			'DefeatScreenEarlyCentral.dds',			'DefeatScreenMidCentral.dds',		'DefeatScreenLateCentral.dds',			'_JFD_CENTRAL',				'JFD_Central', 				'JFD_Central', 				'JFD_Central', 				'JFD_Central', 				'AS2D_SOUND_JFD_GERMAN',			10,				'ART_DEF_UNIT_GALLEY',					'ART_DEF_UNIT_GALLEON',					'[ICON_JFD_CULTURE_CENTRAL]', 			'JFD_CULTURAL_DIVERSITY_ATLAS',			3),
		('CULTURE_JFD_CLASSICAL',				'CULTURE_BRANCH_JFD_EUROPE',				'JFD_Classical',			'TXT_KEY_CULTURE_JFD_CLASSICAL_SHORT_DESC', 		'DefeatScreenEarlyClassical.dds',		'DefeatScreenMidClassical.dds',		'DefeatScreenLateClassical.dds',		'_JFD_CLASSICAL',			'JFD_Classical',			'JFD_Classical',			'JFD_Classical',			'JFD_Classical',			'AS2D_SOUND_JFD_ROMAN',				10,				'ART_DEF_UNIT_GALLEY',					'ART_DEF_UNIT_GALLEY',					'[ICON_JFD_CULTURE_CLASSICAL]', 		'JFD_CULTURAL_DIVERSITY_ATLAS',			4),
		('CULTURE_JFD_COLONIAL',				'CULTURE_BRANCH_JFD_EUROPE',				'JFD_Colonial', 			'TXT_KEY_CULTURE_JFD_COLONIAL_SHORT_DESC', 			'DefeatScreenEarlyColonial.dds',		'DefeatScreenMidColonial.dds',		'DefeatScreenLateColonial.dds',			'_JFD_WESTERN',				'JFD_Colonial', 			'JFD_Colonial', 			'JFD_Colonial', 			'JFD_Colonial', 			'AS2D_SOUND_JFD_AMERICAN',			25,				'ART_DEF_UNIT_GALLEY',					'ART_DEF_UNIT_GALLEON',					'[ICON_JFD_CULTURE_COLONIAL]', 			'JFD_CULTURAL_DIVERSITY_ATLAS',			5),
		('CULTURE_JFD_EASTERN',					'CULTURE_BRANCH_JFD_EUROPE',				'JFD_Eastern', 				'TXT_KEY_CULTURE_JFD_EASTERN_SHORT_DESC', 			'DefeatScreenEarlyEastern.dds',			'DefeatScreenMidEastern.dds',		'DefeatScreenLateEastern.dds',			'_JFD_EASTERN',				'JFD_Eastern', 				'JFD_Eastern', 				'JFD_Eastern', 				'JFD_Eastern', 				'AS2D_SOUND_JFD_RUSSIAN',			10,				'ART_DEF_UNIT_U_DANISH_LONGBOAT',		'ART_DEF_UNIT_GALLEON',					'[ICON_JFD_CULTURE_EASTERN]', 			'JFD_CULTURAL_DIVERSITY_ATLAS',			6),
		('CULTURE_JFD_EAST_INDIES',				'CULTURE_BRANCH_JFD_EAST_ASIA',				'JFD_EastIndies', 			'TXT_KEY_CULTURE_JFD_EAST_INDIES_SHORT_DESC', 		'DefeatScreenEarlyEastIndies.dds',		'DefeatScreenMidEastIndies.dds',	'DefeatScreenLateEastIndies.dds',		'_JFD_EAST_INDIES',			'JFD_EastIndies', 			'JFD_EastIndies', 			'JFD_EastIndies', 			'JFD_EastIndies', 			'AS2D_SOUND_JFD_KHMER',				10,				'ART_DEF_UNIT_JFD_WAR_JUNK',			'ART_DEF_UNIT_GALLEON',					'[ICON_JFD_CULTURE_EAST_INDIES]', 		'JFD_CULTURAL_DIVERSITY_ATLAS_2',		0),
		('CULTURE_JFD_GREAT_PLAINS',			'CULTURE_BRANCH_JFD_NORTH_AMERICA',			'JFD_TribalAmerican', 		'TXT_KEY_CULTURE_JFD_GREAT_PLAINS_SHORT_DESC', 		NULL,									NULL,								NULL,									'_JFD_GREAT_PLAINS',		'JFD_GreatPlains', 			'JFD_GreatPlains', 			'JFD_GreatPlains', 			'JFD_GreatPlains', 			'AS2D_SOUND_JFD_NATIVE_AMERICAN',	25,				'ART_DEF_UNIT_JFD_CANOE',				'ART_DEF_UNIT_JFD_CANOE',				'[ICON_JFD_CULTURE_GREAT_PLAINS]',		'JFD_CULTURAL_DIVERSITY_ATLAS',			20),
		('CULTURE_JFD_HIMALAYAN',				'CULTURE_BRANCH_JFD_SOUTH_ASIA',			'JFD_Himalayan', 			'TXT_KEY_CULTURE_JFD_HIMALAYAN_SHORT_DESC', 		'DefeatScreenEarlyHimalayan.dds',		'DefeatScreenMidHimalayan.dds',		'DefeatScreenLateHimalayan.dds',		'_JFD_HIMALAYAN',			'JFD_Himalayan', 			'JFD_Himalayan', 			'JFD_Himalayan', 			'JFD_Himalayan', 			'AS2D_SOUND_JFD_INDIAN',			25,				'ART_DEF_UNIT_JFD_DHOW',				'ART_DEF_UNIT_JFD_WAR_JUNK',			'[ICON_JFD_CULTURE_HIMALAYAN]', 		'JFD_CULTURAL_DIVERSITY_ATLAS_2',		1),
		('CULTURE_JFD_IRANIAN',					'CULTURE_BRANCH_JFD_MIDDLE_EAST',			'JFD_Iranian', 				'TXT_KEY_CULTURE_JFD_IRANIAN_SHORT_DESC', 			'DefeatScreenEarlyIranian.dds',			'DefeatScreenMidIranian.dds',		'DefeatScreenLateIranian.dds',			'_JFD_IRANIAN',				'JFD_Iranian', 				'JFD_Iranian', 				'JFD_Iranian', 				'JFD_Iranian', 				'AS2D_SOUND_JFD_PERSIAN',			1,				'ART_DEF_UNIT_JFD_DHOW',				'ART_DEF_UNIT_JFD_DHOW',				'[ICON_JFD_CULTURE_IRANIAN]', 			'JFD_CULTURAL_DIVERSITY_ATLAS_2',		2),
		('CULTURE_JFD_ISLAMIC',					'CULTURE_BRANCH_JFD_MIDDLE_EAST',			'JFD_Islamic', 				'TXT_KEY_CULTURE_JFD_ISLAMIC_SHORT_DESC', 			'DefeatScreenEarlyEarlyIslamic.dds',	'DefeatScreenMidIslamic.dds',		'DefeatScreenLateIslamic.dds',			'_JFD_ISLAMIC',				'JFD_Islamic', 				'JFD_Islamic', 				'JFD_Islamic', 				'JFD_Islamic', 				'AS2D_SOUND_JFD_ARABIC',			1,				'ART_DEF_UNIT_JFD_DHOW',				'ART_DEF_UNIT_JFD_DHOW',				'[ICON_JFD_CULTURE_ISLAMIC]', 			'JFD_CULTURAL_DIVERSITY_ATLAS',			7),
		('CULTURE_JFD_KATUJE',					'CULTURE_BRANCH_JFD_SOUTH_AMERICA',			'JFD_Katuje', 				'TXT_KEY_CULTURE_JFD_KATUJE_SHORT_DESC', 			'DefeatScreenEarlyKatuje.dds',			'DefeatScreenMidKatuje.dds',		'DefeatScreenLateKatuje.dds',			'_JFD_KATUJE',				'JFD_Katuje', 				'JFD_Katuje', 				'JFD_Katuje', 				'JFD_Katuje', 				NULL,								25,				'ART_DEF_UNIT_JFD_CANOE',				'ART_DEF_UNIT_JFD_CANOE',				'[ICON_JFD_CULTURE_KATUJE]', 			'JFD_CULTURAL_DIVERSITY_ATLAS',			11),
		('CULTURE_JFD_MANDALA',					'CULTURE_BRANCH_JFD_EAST_ASIA',				'JFD_Mandala', 				'TXT_KEY_CULTURE_JFD_MANDALA_SHORT_DESC', 			'DefeatScreenEarlyMandala.dds',			'DefeatScreenMidMandala.dds',		'DefeatScreenLateMandala.dds',			'_JFD_MANDALA',				'JFD_Mandala', 				'JFD_Mandala', 				'JFD_Mandala', 				'JFD_Mandala', 				'AS2D_SOUND_JFD_SIAMESE',			25,				'ART_DEF_UNIT_JFD_WAR_JUNK',			'ART_DEF_UNIT_JFD_WAR_JUNK',			'[ICON_JFD_CULTURE_MANDALA]', 			'JFD_CULTURAL_DIVERSITY_ATLAS',			8),
		('CULTURE_JFD_MESOAMERICAN',			'CULTURE_BRANCH_JFD_SOUTH_AMERICA',			'JFD_Mesoamerican', 		'TXT_KEY_CULTURE_JFD_MESOAMERICAN_SHORT_DESC',		'DefeatScreenEarlyMesoamerican.dds',	'DefeatScreenMidMesoamerican.dds',	'DefeatScreenLateMesoamerican.dds',		'_JFD_MESOAMERICAN',		'JFD_Mesoamerican', 		'JFD_Mesoamerican', 		'JFD_Mesoamerican', 		'JFD_Mesoamerican', 		'AS2D_SOUND_JFD_AZTEC',				25,				'ART_DEF_UNIT_JFD_MESO_RAFT',			'ART_DEF_UNIT_JFD_MESO_RAFT',			'[ICON_JFD_CULTURE_MESOAMERICAN]', 		'JFD_CULTURAL_DIVERSITY_ATLAS',			9),
		('CULTURE_JFD_MESOPOTAMIC',				'CULTURE_BRANCH_JFD_MIDDLE_EAST',			'JFD_Mesopotamic', 			'TXT_KEY_CULTURE_JFD_MESOPOTAMIC_SHORT_DESC', 		'DefeatScreenEarlyMesopotamic.dds',		'DefeatScreenMidMesopotamic.dds',	'DefeatScreenLateMesopotamic',			'_JFD_MESOPOTAMIC',			'JFD_Mesopotamic', 			'JFD_Mesopotamic', 			'JFD_Mesopotamic', 			'JFD_Mesopotamic', 			'AS2D_SOUND_JFD_SUMERIAN',			1,				'ART_DEF_UNIT_JFD_BARGE',				'ART_DEF_UNIT_JFD_DHOW',				'[ICON_JFD_CULTURE_MESOPOTAMIC]', 		'JFD_CULTURAL_DIVERSITY_ATLAS',			10),
		('CULTURE_JFD_NORTHERN',				'CULTURE_BRANCH_JFD_EUROPE',				'JFD_Northern', 			'TXT_KEY_CULTURE_JFD_NORTHERN_SHORT_DESC', 			'DefeatScreenEarlyNorthern.dds',		'DefeatScreenMidNorthern.dds',		'DefeatScreenLateNorthern.dds',			'_JFD_NORTHERN',			'JFD_Northern', 			'JFD_Northern', 			'JFD_Northern', 			'JFD_Northern', 			'AS2D_SOUND_JFD_VIKING',			20,				'ART_DEF_UNIT_U_DANISH_LONGBOAT',		'ART_DEF_UNIT_U_DANISH_LONGBOAT',		'[ICON_JFD_CULTURE_NORTHERN]', 			'JFD_CULTURAL_DIVERSITY_ATLAS',			12),
		('CULTURE_JFD_OCEANIC',					'CULTURE_BRANCH_JFD_OCEANIA',				'JFD_Oceanic', 				'TXT_KEY_CULTURE_JFD_OCEANIC_SHORT_DESC', 			'DefeatScreenEarlyOceanic.dds',			'DefeatScreenMidOceanic.dds',		'DefeatScreenLateOceanic.dds',			'_JFD_OCEANIC',				'JFD_Oceanic', 				'JFD_Oceanic', 				'JFD_Oceanic', 				'JFD_Oceanic', 				NULL,								25,				'ART_DEF_UNIT_U_POLYNESIAN_WAR_CANOE',	'ART_DEF_UNIT_U_POLYNESIAN_WAR_CANOE',	'[ICON_JFD_CULTURE_OCEANIC]', 			'JFD_CULTURAL_DIVERSITY_ATLAS',			13),
		('CULTURE_JFD_ORIENTAL',				'CULTURE_BRANCH_JFD_EAST_ASIA',				'JFD_Oriental', 			'TXT_KEY_CULTURE_JFD_ORIENTAL_SHORT_DESC', 			'DefeatScreenEarlyOriental.dds',		'DefeatScreenMidOriental.dds',		'DefeatScreenLateOriental.dds',			'_JFD_ORIENTAL',			'JFD_Oriental', 			'JFD_Oriental', 			'JFD_Oriental', 			'JFD_Oriental', 			'AS2D_SOUND_JFD_CHINESE',			25,				'ART_DEF_UNIT_JFD_WAR_JUNK',			'ART_DEF_UNIT_JFD_WAR_JUNK',			'[ICON_JFD_CULTURE_ORIENTAL]', 			'JFD_CULTURAL_DIVERSITY_ATLAS',			14),
		('CULTURE_JFD_PACIFIC',					'CULTURE_BRANCH_JFD_NORTH_AMERICA',			'JFD_Pacific', 				'TXT_KEY_CULTURE_JFD_PACIFIC_SHORT_DESC', 			NULL,									NULL,								NULL,									'_JFD_PACIFIC',				'JFD_Pacific', 				'JFD_Pacific', 				'JFD_Pacific', 				'JFD_Pacific', 				'AS2D_SOUND_JFD_NATIVE_AMERICAN',	25,				'ART_DEF_UNIT_JFD_CANOE',				'ART_DEF_UNIT_JFD_CANOE',				'[ICON_JFD_CULTURE_PACIFIC]',			'JFD_CULTURAL_DIVERSITY_ATLAS_2',		3),
		--('CULTURE_JFD_PAPAL',					'CULTURE_BRANCH_JFD_EUROPE',				'JFD_Papal', 				'TXT_KEY_CULTURE_JFD_PAPAL_SHORT_DESC', 			'DefeatScreenEarlyPapal.dds',			'DefeatScreenMidPapal.dds',			'DefeatScreenLatePapal.dds',			'_JFD_PAPAL',				'JFD_Papal', 				'JFD_Papal', 				'JFD_Papal', 				'JFD_Papal', 				'AS2D_SOUND_JFD_ROMAN',				30,				'ART_DEF_UNIT_GALLEY',					'ART_DEF_UNIT_GALLEON',					'[ICON_JFD_CULTURE_PAPAL]', 			'JFD_CULTURAL_DIVERSITY_ATLAS_2',		5),
		('CULTURE_JFD_POLAR',					'CULTURE_BRANCH_JFD_NORTH_AMERICA',			'JFD_Polar', 				'TXT_KEY_CULTURE_JFD_POLAR_SHORT_DESC', 			'DefeatScreenEarlyPolar.dds',			'DefeatScreenMidPolar.dds',			'DefeatScreenLatePolar.dds',			'_JFD_POLAR',				'JFD_Polar', 				'JFD_Polar', 				'JFD_Polar', 				'JFD_Polar', 				NULL,								30,				'ART_DEF_UNIT_JFD_CANOE',				'ART_DEF_UNIT_JFD_CANOE',				'[ICON_JFD_CULTURE_POLAR]', 			'JFD_CULTURAL_DIVERSITY_ATLAS',			23),
		('CULTURE_JFD_SAHARAN',					'CULTURE_BRANCH_JFD_AFRICA',				'JFD_Saharan', 				'TXT_KEY_CULTURE_JFD_SAHARAN_SHORT_DESC', 			'DefeatScreenEarlySaharan.dds',			'DefeatScreenMidSaharan.dds',		'DefeatScreenLateSaharan.dds',			'_JFD_SAHARAN',				'JFD_Saharan', 				'JFD_Saharan', 				'JFD_Saharan', 				'JFD_Saharan', 				'AS2D_SOUND_JFD_MALINESE',			15,				'ART_DEF_UNIT_JFD_DHOW',				'ART_DEF_UNIT_JFD_DHOW',				'[ICON_JFD_CULTURE_SAHARAN]', 			'JFD_CULTURAL_DIVERSITY_ATLAS_2',		5),
		('CULTURE_JFD_SEMITIC',					'CULTURE_BRANCH_JFD_MIDDLE_EAST',			'JFD_Semitic', 				'TXT_KEY_CULTURE_JFD_SEMITIC_SHORT_DESC', 			'DefeatScreenEarlySemitic.dds',			'DefeatScreenMidSemitic.dds',		NULL,									'_JFD_SEMITIC',				'JFD_Semitic', 				'JFD_Semitic', 				'JFD_Semitic', 				'JFD_Semitic', 				'AS2D_SOUND_JFD_ETHIOPIAN',			0,				'ART_DEF_UNIT_GALLEY',					'ART_DEF_UNIT_JFD_DHOW',				'[ICON_JFD_CULTURE_SEMITIC]', 			'JFD_CULTURAL_DIVERSITY_ATLAS',			16),
		('CULTURE_JFD_SOUTHERN',				'CULTURE_BRANCH_JFD_EUROPE',				'JFD_Southern',				'TXT_KEY_CULTURE_JFD_SOUTHERN_SHORT_DESC', 			NULL,									NULL,								'DefeatScreenLateSouthern.dds',			'_JFD_SOUTHERN',			'JFD_Southern',				'JFD_Southern',				'JFD_Southern',				'JFD_Southern',				'AS2D_SOUND_JFD_ITALIAN',			10,				'ART_DEF_UNIT_GALLEY',					'ART_DEF_UNIT_GALLEY',					'[ICON_JFD_CULTURE_SOUTHERN]', 			'JFD_CULTURAL_DIVERSITY_ATLAS',			17),
		('CULTURE_JFD_STEPPE',					'CULTURE_BRANCH_JFD_CENTRAL_ASIA',			'JFD_Steppe', 				'TXT_KEY_CULTURE_JFD_STEPPE_SHORT_DESC', 			'DefeatScreenEarlySteppe.dds',			NULL,								'DefeatScreenLateSteppe.dds',			'_JFD_STEPPE',				'JFD_Steppe', 				'JFD_Steppe', 				'JFD_Steppe', 				'JFD_Steppe', 				'AS2D_SOUND_JFD_MONGOL',			5,				'ART_DEF_UNIT_JFD_DHOW',				'ART_DEF_UNIT_JFD_DHOW',				'[ICON_JFD_CULTURE_STEPPE]', 			'JFD_CULTURAL_DIVERSITY_ATLAS',			18),
		('CULTURE_JFD_TOTALITARIAN',			'CULTURE_BRANCH_JFD_EUROPE',				'JFD_Totalitarian', 		'TXT_KEY_CULTURE_JFD_TOTALITARIAN_SHORT_DESC',		NULL,									NULL,								'DefeatScreenLateTotalitarian.dds',		'_JFD_WESTERN',				'JFD_Totalitarian', 		'JFD_Totalitarian', 		'JFD_Totalitarian', 		'JFD_Totalitarian', 		'AS2D_SOUND_JFD_GERMAN',			10,				'ART_DEF_UNIT_GALLEY',					'ART_DEF_UNIT_GALLEON',					'[ICON_JFD_CULTURE_TOTALITARIAN]', 		'JFD_CULTURAL_DIVERSITY_ATLAS',			19),
		('CULTURE_JFD_WEST_AFRICAN',			'CULTURE_BRANCH_JFD_AFRICA',				'JFD_WestAfrican', 			'TXT_KEY_CULTURE_JFD_WEST_AFRICAN_SHORT_DESC', 		NULL,									NULL,								NULL,									'_JFD_WEST_AFRICAN',		'JFD_WestAfrican', 			'JFD_WestAfrican', 			'JFD_WestAfrican', 			'JFD_WestAfrican', 			NULL,								15,				'ART_DEF_UNIT_JFD_DHOW',				'ART_DEF_UNIT_JFD_DHOW',				'[ICON_JFD_CULTURE_WEST_AFRICAN]', 		'JFD_CULTURAL_DIVERSITY_ATLAS',			21),
		('CULTURE_JFD_WESTERN',					'CULTURE_BRANCH_JFD_EUROPE',				'JFD_Western', 				'TXT_KEY_CULTURE_JFD_WESTERN_SHORT_DESC', 			'DefeatScreenEarlyWestern.dds',			'DefeatScreenMidWestern.dds',		'DefeatScreenLateWestern.dds',			'_JFD_WESTERN',				'JFD_Western', 				'JFD_Western', 				'JFD_Western', 				'JFD_Western', 				'AS2D_SOUND_JFD_ENGLISH',			15,				'ART_DEF_UNIT_GALLEY',					'ART_DEF_UNIT_GALLEON',					'[ICON_JFD_CULTURE_WESTERN]', 			'JFD_CULTURAL_DIVERSITY_ATLAS',			22),
		('CULTURE_JFD_WOODLANDS',				'CULTURE_BRANCH_JFD_NORTH_AMERICA',			'JFD_Woodlands', 			'TXT_KEY_CULTURE_JFD_WOODLANDS_SHORT_DESC', 		NULL,									NULL,								NULL,									'_JFD_WOODLANDS',			'JFD_Woodlands', 			'JFD_Woodlands', 			'JFD_Woodlands', 			'JFD_Woodlands', 			'AS2D_SOUND_JFD_NATIVE_AMERICAN',	25,				'ART_DEF_UNIT_JFD_CANOE',				'ART_DEF_UNIT_JFD_CANOE',				'[ICON_JFD_CULTURE_WOODLANDS]',			'JFD_CULTURAL_DIVERSITY_ATLAS_2',		4);
-------------------------------------
-- JFD_CultureType_SubCultures
-------------------------------------
INSERT INTO JFD_CultureType_SubCultures
		(CultureType,							SubCultureType,								ShortDescription)
VALUES	('CULTURE_JFD_CLASSICAL',				'CULTURE_SUB_JFD_ROMAN',					'TXT_KEY_CULTURE_SUB_JFD_ROMAN_SHORT_DESC'),
		('CULTURE_JFD_COLONIAL',				'CULTURE_SUB_JFD_LATIN',					'TXT_KEY_CULTURE_SUB_JFD_LATIN_SHORT_DESC'),
		('CULTURE_JFD_EASTERN',					'CULTURE_SUB_JFD_BYZANTINE',				'TXT_KEY_CULTURE_SUB_JFD_BYZANTINE_SHORT_DESC'),
		('CULTURE_JFD_ISLAMIC',					'CULTURE_SUB_JFD_TURKIC',					'TXT_KEY_CULTURE_SUB_JFD_TURKIC_SHORT_DESC'),
		('CULTURE_JFD_MESOPOTAMIC',				'CULTURE_SUB_JFD_EGYPTIAN',					'TXT_KEY_CULTURE_SUB_JFD_EGYPTIAN_SHORT_DESC'),
		('CULTURE_JFD_NORTHERN',				'CULTURE_SUB_JFD_CELTIC',					'TXT_KEY_CULTURE_SUB_JFD_CELTIC_SHORT_DESC'),
		('CULTURE_JFD_ORIENTAL',				'CULTURE_SUB_JFD_JAPANESE',					'TXT_KEY_CULTURE_SUB_JFD_JAPANESE_SHORT_DESC'),
		('CULTURE_JFD_SEMITIC',					'CULTURE_SUB_JFD_ETHIOPIC',					'TXT_KEY_CULTURE_SUB_JFD_ETHIOPIC_SHORT_DESC'),
		('CULTURE_JFD_SOUTHERN',				'CULTURE_SUB_JFD_PAPAL',					'TXT_KEY_CULTURE_SUB_JFD_PAPAL_SHORT_DESC'),
		('CULTURE_JFD_WESTERN',					'CULTURE_SUB_JFD_BRITISH',					'TXT_KEY_CULTURE_SUB_JFD_BRITISH_SHORT_DESC');
-------------------------------
-- JFD_CultureType_StartingBonuses
-------------------------------
INSERT INTO JFD_CultureType_StartingBonuses
		(CultureType, 							Description, 								FreeResource, 			FreeResourceCount)
VALUES	('CULTURE_JFD_ABORIGINAL',				'TXT_KEY_JFD_DAWN_STARTING_RESOURCE', 		'RESOURCE_GEMS', 		1),					
		('CULTURE_JFD_ANDEAN',					'TXT_KEY_JFD_DAWN_STARTING_RESOURCE', 		'RESOURCE_GOLD', 		1),				
		('CULTURE_JFD_BANTU',					'TXT_KEY_JFD_DAWN_STARTING_RESOURCE', 		'RESOURCE_COW', 		2),				
		('CULTURE_JFD_BHARATA',					'TXT_KEY_JFD_DAWN_STARTING_RESOURCE', 		'RESOURCE_COTTON', 		1),				
		('CULTURE_JFD_CENTRAL',					'TXT_KEY_JFD_DAWN_STARTING_RESOURCE', 		'RESOURCE_SILVER', 		1),			
		('CULTURE_JFD_CLASSICAL',				'TXT_KEY_JFD_DAWN_STARTING_RESOURCE', 		'RESOURCE_COPPER',	 	1),				
		('CULTURE_JFD_COLONIAL',				'TXT_KEY_JFD_DAWN_STARTING_RESOURCE', 		'RESOURCE_SUGAR', 		1),				
		('CULTURE_JFD_EASTERN',					'TXT_KEY_JFD_DAWN_STARTING_RESOURCE', 		'RESOURCE_FUR', 		1),				
		('CULTURE_JFD_EAST_INDIES',				'TXT_KEY_JFD_DAWN_STARTING_RESOURCE',		'RESOURCE_SPICES', 		1),				
		('CULTURE_JFD_GREAT_PLAINS',			'TXT_KEY_JFD_DAWN_STARTING_RESOURCE',		'RESOURCE_BISON', 		2),				
		('CULTURE_JFD_HIMALAYAN',				'TXT_KEY_JFD_DAWN_STARTING_RESOURCE', 		'RESOURCE_DYE', 		1),				
		('CULTURE_JFD_IRANIAN',					'TXT_KEY_JFD_DAWN_STARTING_RESOURCE',		'RESOURCE_GEMS', 		1),				
		('CULTURE_JFD_ISLAMIC',					'TXT_KEY_JFD_DAWN_STARTING_RESOURCE', 		'RESOURCE_INCENSE', 	1),			
		('CULTURE_JFD_KATUJE',					'TXT_KEY_JFD_DAWN_STARTING_RESOURCE', 		'RESOURCE_BANANA', 		1),				
		('CULTURE_JFD_MANDALA',					'TXT_KEY_JFD_DAWN_STARTING_RESOURCE', 		'RESOURCE_IVORY', 		1),				
		('CULTURE_JFD_MESOAMERICAN',			'TXT_KEY_JFD_DAWN_STARTING_RESOURCE', 		'RESOURCE_COCOA', 		1),				
		('CULTURE_JFD_MESOPOTAMIC',				'TXT_KEY_JFD_DAWN_STARTING_RESOURCE', 		'RESOURCE_WHEAT', 		1),				
		('CULTURE_JFD_NORTHERN',				'TXT_KEY_JFD_DAWN_STARTING_RESOURCE', 		'RESOURCE_IRON', 		2),				
		('CULTURE_JFD_OCEANIC',					'TXT_KEY_JFD_DAWN_STARTING_RESOURCE', 		'RESOURCE_FISH', 		2),				
		('CULTURE_JFD_ORIENTAL',				'TXT_KEY_JFD_DAWN_STARTING_RESOURCE', 		'RESOURCE_SILK', 		1),				
		('CULTURE_JFD_PACIFIC',					'TXT_KEY_JFD_DAWN_STARTING_RESOURCE',		'RESOURCE_WHALE', 		1),				
		('CULTURE_JFD_POLAR',					'TXT_KEY_JFD_DAWN_STARTING_RESOURCE', 		'RESOURCE_PEARLS', 		1),				
		('CULTURE_JFD_SAHARAN',					'TXT_KEY_JFD_DAWN_STARTING_RESOURCE', 		'RESOURCE_COPPER',	 	1),				
		('CULTURE_JFD_SEMITIC',					'TXT_KEY_JFD_DAWN_STARTING_RESOURCE', 		'RESOURCE_SHEEP', 		2),				
		('CULTURE_JFD_SOUTHERN',				'TXT_KEY_JFD_DAWN_STARTING_RESOURCE', 		'RESOURCE_WINE', 		1),				
		('CULTURE_JFD_STEPPE',					'TXT_KEY_JFD_DAWN_STARTING_RESOURCE', 		'RESOURCE_HORSE', 		2),				
		('CULTURE_JFD_TOTALITARIAN',			'TXT_KEY_JFD_DAWN_STARTING_RESOURCE', 		'RESOURCE_MARBLE', 		1),				
		('CULTURE_JFD_WEST_AFRICAN',			'TXT_KEY_JFD_DAWN_STARTING_RESOURCE', 		'RESOURCE_STONE', 		1),				
		('CULTURE_JFD_WESTERN',					'TXT_KEY_JFD_DAWN_STARTING_RESOURCE', 		'RESOURCE_SHEEP', 		2),	
		('CULTURE_JFD_WOODLANDS',				'TXT_KEY_JFD_DAWN_STARTING_RESOURCE',		'RESOURCE_DEER', 		2);

UPDATE JFD_CultureType_StartingBonuses
SET FreeResource = 'RESOURCE_OLIVES' 
WHERE CultureType = 'CULTURE_JFD_CLASSICAL'	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);	

UPDATE JFD_CultureType_StartingBonuses
SET FreeResource = 'RESOURCE_COFFEE', FreeResourceCount = 1
WHERE CultureType = 'CULTURE_JFD_SEMITIC'	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);	

UPDATE JFD_CultureType_StartingBonuses
SET FreeResource = 'RESOURCE_JFD_SAFFRON' 
WHERE CultureType = 'CULTURE_JFD_HIMALAYAN'	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);	

UPDATE JFD_CultureType_StartingBonuses
SET FreeResource = 'RESOURCE_LAPIS_LAZULI' 
WHERE CultureType = 'CULTURE_JFD_IRANIAN'	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);	

UPDATE JFD_CultureType_StartingBonuses
SET FreeResource = 'RESOURCE_JFD_FEATHERS' 
WHERE CultureType = 'CULTURE_JFD_KATUJE'	
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_EXPLORATION_RESOURCE_ADDITIONS_LUXURY' AND Value = 1);
--==========================================================================================================================
-- UNIT PROMOTIONS
--==========================================================================================================================
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions 
		(Type, 									MovesChange,	VisibilityChange,	Description, 								Help, 											Sound, 				CannotBeChosen, LostWithUpgrade,	PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_SEMITIC_MOVES', 		1, 				1,					'TXT_KEY_PROMOTION_JFD_SEMITIC_MOVES',		'TXT_KEY_PROMOTION_JFD_SEMITIC_MOVES_HELP', 	'AS2D_IF_LEVELUP', 	1, 				0, 					59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_SEMITIC_MOVES');
--==========================================================================================================================		
--==========================================================================================================================		