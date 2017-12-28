--==========================================================================================================================
-- GREAT WORKS
--==========================================================================================================================
-- GreatWorkArtifactClasses
------------------------------
INSERT INTO GreatWorkArtifactClasses
		(Type,						Value)
SELECT	'ARTIFACT_JFD_RELIC',		9
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_GREAT_PEOPLE_CHANGES_PROPHET' AND Value = 1);
------------------------------
-- GreatWorks
------------------------------
INSERT INTO GreatWorks
		(Type,						GreatWorkClassType,		ArtifactClassType,		Image,						Audio,							Description)
VALUES	('GREAT_WORK_JFD_RELIC_1',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_1'),
		('GREAT_WORK_JFD_RELIC_2',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_2'),
		('GREAT_WORK_JFD_RELIC_3',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_3'),
		('GREAT_WORK_JFD_RELIC_4',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_4'),
		('GREAT_WORK_JFD_RELIC_5',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_5'),
		('GREAT_WORK_JFD_RELIC_6',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_6'),
		('GREAT_WORK_JFD_RELIC_7',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_7'),
		('GREAT_WORK_JFD_RELIC_8',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_8'),
		('GREAT_WORK_JFD_RELIC_9',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_9'),
		('GREAT_WORK_JFD_RELIC_10',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_10'),
		('GREAT_WORK_JFD_RELIC_11',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_11'),
		('GREAT_WORK_JFD_RELIC_12',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_12'),
		('GREAT_WORK_JFD_RELIC_13',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_13'),
		('GREAT_WORK_JFD_RELIC_14',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_14'),
		('GREAT_WORK_JFD_RELIC_15',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_15'),
		('GREAT_WORK_JFD_RELIC_16',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_16'),
		('GREAT_WORK_JFD_RELIC_17',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_17'),
		('GREAT_WORK_JFD_RELIC_18',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_18'),
		('GREAT_WORK_JFD_RELIC_19',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_19'),
		('GREAT_WORK_JFD_RELIC_20',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_20'),
		('GREAT_WORK_JFD_RELIC_21',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_21'),
		('GREAT_WORK_JFD_RELIC_22',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_22'),
		('GREAT_WORK_JFD_RELIC_23',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_23'),
		('GREAT_WORK_JFD_RELIC_24',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_24'),
		('GREAT_WORK_JFD_RELIC_25',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_25'),
		('GREAT_WORK_JFD_RELIC_26',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_26'),
		('GREAT_WORK_JFD_RELIC_27',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_27'),
		('GREAT_WORK_JFD_RELIC_28',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_28'),
		('GREAT_WORK_JFD_RELIC_29',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_29'),
		('GREAT_WORK_JFD_RELIC_30',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_30'),
		('GREAT_WORK_JFD_RELIC_31',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_31'),
		('GREAT_WORK_JFD_RELIC_32',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_32'),
		('GREAT_WORK_JFD_RELIC_33',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_33'),
		('GREAT_WORK_JFD_RELIC_34',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_34'),
		('GREAT_WORK_JFD_RELIC_35',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_35'),
		('GREAT_WORK_JFD_RELIC_36',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_36'),
		('GREAT_WORK_JFD_RELIC_37',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_37'),
		('GREAT_WORK_JFD_RELIC_38',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_38'),
		('GREAT_WORK_JFD_RELIC_39',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_39'),
		('GREAT_WORK_JFD_RELIC_40',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_40'),
		('GREAT_WORK_JFD_RELIC_41',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_41'),
		('GREAT_WORK_JFD_RELIC_42',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_42'),
		('GREAT_WORK_JFD_RELIC_43',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_43'),
		('GREAT_WORK_JFD_RELIC_44',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_44'),
		('GREAT_WORK_JFD_RELIC_45',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_45'),
		('GREAT_WORK_JFD_RELIC_46',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_46'),
		('GREAT_WORK_JFD_RELIC_47',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_47'),
		('GREAT_WORK_JFD_RELIC_48',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_48'),
		('GREAT_WORK_JFD_RELIC_49',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_49'),
		('GREAT_WORK_JFD_RELIC_50',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_50'),
		('GREAT_WORK_JFD_RELIC_51',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_51'),
		('GREAT_WORK_JFD_RELIC_52',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_52'),
		('GREAT_WORK_JFD_RELIC_53',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_53'),
		('GREAT_WORK_JFD_RELIC_54',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_54'),
		('GREAT_WORK_JFD_RELIC_55',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_55'),
		('GREAT_WORK_JFD_RELIC_56',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_56'),
		('GREAT_WORK_JFD_RELIC_57',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_57'),
		('GREAT_WORK_JFD_RELIC_58',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_58'),
		('GREAT_WORK_JFD_RELIC_59',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_59'),
		('GREAT_WORK_JFD_RELIC_60',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_60'),
		('GREAT_WORK_JFD_RELIC_61',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_61'),
		('GREAT_WORK_JFD_RELIC_62',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_62'),
		('GREAT_WORK_JFD_RELIC_63',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_63'),
		('GREAT_WORK_JFD_RELIC_64',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_64'),
		('GREAT_WORK_JFD_RELIC_65',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_65'),
		('GREAT_WORK_JFD_RELIC_66',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_66'),
		('GREAT_WORK_JFD_RELIC_67',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_67'),
		('GREAT_WORK_JFD_RELIC_68',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_68'),
		('GREAT_WORK_JFD_RELIC_69',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_69'),
		('GREAT_WORK_JFD_RELIC_70',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_70'),
		('GREAT_WORK_JFD_RELIC_71',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_71'),
		('GREAT_WORK_JFD_RELIC_72',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_72'),
		('GREAT_WORK_JFD_RELIC_73',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_73'),
		('GREAT_WORK_JFD_RELIC_74',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_74'),
		('GREAT_WORK_JFD_RELIC_75',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_75'),
		('GREAT_WORK_JFD_RELIC_76',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_76'),
		('GREAT_WORK_JFD_RELIC_77',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_77'),
		('GREAT_WORK_JFD_RELIC_78',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_78'),
		('GREAT_WORK_JFD_RELIC_79',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_79'),
		('GREAT_WORK_JFD_RELIC_80',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_80'),
		('GREAT_WORK_JFD_RELIC_81',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_81'),
		('GREAT_WORK_JFD_RELIC_82',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_82'),
		('GREAT_WORK_JFD_RELIC_83',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_83'),
		('GREAT_WORK_JFD_RELIC_84',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_84'),
		('GREAT_WORK_JFD_RELIC_85',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_85'),
		('GREAT_WORK_JFD_RELIC_86',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_86'),
		('GREAT_WORK_JFD_RELIC_87',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_87'),
		('GREAT_WORK_JFD_RELIC_88',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_88'),
		('GREAT_WORK_JFD_RELIC_89',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_89'),
		('GREAT_WORK_JFD_RELIC_90',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_90'),
		('GREAT_WORK_JFD_RELIC_91',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_91'),
		('GREAT_WORK_JFD_RELIC_92',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_92'),
		('GREAT_WORK_JFD_RELIC_93',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_93'),
		('GREAT_WORK_JFD_RELIC_94',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_94'),
		('GREAT_WORK_JFD_RELIC_95',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_95'),
		('GREAT_WORK_JFD_RELIC_96',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_96'),
		('GREAT_WORK_JFD_RELIC_97',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_97'),
		('GREAT_WORK_JFD_RELIC_98',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_98'),
		('GREAT_WORK_JFD_RELIC_99',	'GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_99'),
		('GREAT_WORK_JFD_RELIC_100','GREAT_WORK_ARTIFACT',	'ARTIFACT_JFD_RELIC',	'Relic_background.dds',		'AS2D_GREAT_WORK_JFD_RELIC',	'TXT_KEY_ARTIFACT_GREAT_WORK_JFD_RELIC_100');
DELETE FROM GreatWorks WHERE ArtifactClassType = 'ARTIFACT_JFD_RELIC'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_GREAT_PEOPLE_CHANGES_PROPHET' AND Value = 0);
--==========================================================================================================================
--==========================================================================================================================