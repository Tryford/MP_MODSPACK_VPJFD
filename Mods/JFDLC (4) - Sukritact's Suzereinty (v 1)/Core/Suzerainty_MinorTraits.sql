--==========================================================================================================================
-- SUZERAIN TRAITS
--==========================================================================================================================
-- Suk_SuzerainTraits
--------------------------------	
INSERT INTO Suk_SuzerainTraits
		(MinorCivType,		Type,							Description)
SELECT	Type,				'SUZERAINTRAIT_' || Type,		'TXT_KEY_SUZERAINTRAIT_' || Type	
FROM MinorCivilizations;
------------------------------
-- Icons
------------------------------
-- Cultured
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_CULTUREDMINOR_ATLAS", PortraitIndex = "0" WHERE MinorCivType = "MINOR_CIV_SUK_NAN_MADOL";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_CULTUREDMINOR_ATLAS", PortraitIndex = "1" WHERE MinorCivType = "MINOR_CIV_SUK_ULM";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_CULTUREDMINOR_ATLAS", PortraitIndex = "2" WHERE MinorCivType = "MINOR_CIV_SUK_URBINO";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_CULTUREDMINOR_ATLAS", PortraitIndex = "3" WHERE MinorCivType = "MINOR_CIV_SUK_BOLOGNA";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_CULTUREDMINOR_ATLAS", PortraitIndex = "4" WHERE MinorCivType = "MINOR_CIV_SUK_ABOMEY";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_CULTUREDMINOR_ATLAS", PortraitIndex = "5" WHERE MinorCivType = "MINOR_CIV_SUK_LWOW";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_CULTUREDMINOR_ATLAS", PortraitIndex = "6" WHERE MinorCivType = "MINOR_CIV_SUK_SAN_JOSE";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_CULTUREDMINOR_ATLAS", PortraitIndex = "7" WHERE MinorCivType = "MINOR_CIV_SUK_AVA";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_CULTUREDMINOR_ATLAS", PortraitIndex = "8" WHERE MinorCivType = "MINOR_CIV_SUK_SICAN";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_CULTUREDMINOR_ATLAS", PortraitIndex = "9" WHERE MinorCivType = "MINOR_CIV_SUK_SOBA";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_CULTUREDMINOR_ATLAS", PortraitIndex = "10" WHERE MinorCivType = "MINOR_CIV_SUK_PALMYRA";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_CULTUREDMINOR_ATLAS", PortraitIndex = "11" WHERE MinorCivType = "MINOR_CIV_SUK_BRATISLAVA";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_CULTUREDMINOR_ATLAS", PortraitIndex = "12" WHERE MinorCivType = "MINOR_CIV_SUK_NAQADA";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_CULTUREDMINOR_ATLAS", PortraitIndex = "13" WHERE MinorCivType = "MINOR_CIV_SUK_MONACO";

-- Fertile
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_FERTILEMINOR_ATLAS", PortraitIndex = "0" WHERE MinorCivType = "MINOR_CIV_SUK_VIJAYA";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_FERTILEMINOR_ATLAS", PortraitIndex = "1" WHERE MinorCivType = "MINOR_CIV_SUK_MESA_VERDE";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_FERTILEMINOR_ATLAS", PortraitIndex = "2" WHERE MinorCivType = "MINOR_CIV_SUK_SAN_JUAN";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_FERTILEMINOR_ATLAS", PortraitIndex = "3" WHERE MinorCivType = "MINOR_CIV_SUK_KUK";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_FERTILEMINOR_ATLAS", PortraitIndex = "4" WHERE MinorCivType = "MINOR_CIV_SUK_SNAKETOWN";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_FERTILEMINOR_ATLAS", PortraitIndex = "5" WHERE MinorCivType = "MINOR_CIV_SUK_CATALHOYUK";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_FERTILEMINOR_ATLAS", PortraitIndex = "6" WHERE MinorCivType = "MINOR_CIV_SUK_REVAL";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_FERTILEMINOR_ATLAS", PortraitIndex = "7" WHERE MinorCivType = "MINOR_CIV_SUK_RIGA";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_FERTILEMINOR_ATLAS", PortraitIndex = "8" WHERE MinorCivType = "MINOR_CIV_SUK_ISANAPURA";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_FERTILEMINOR_ATLAS", PortraitIndex = "9" WHERE MinorCivType = "MINOR_CIV_SUK_NOK";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_FERTILEMINOR_ATLAS", PortraitIndex = "10" WHERE MinorCivType = "MINOR_CIV_SUK_KATSINA";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_FERTILEMINOR_ATLAS", PortraitIndex = "11" WHERE MinorCivType = "MINOR_CIV_SUK_BONGA";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_FERTILEMINOR_ATLAS", PortraitIndex = "12" WHERE MinorCivType = "MINOR_CIV_SUK_SYRACUSE";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_FERTILEMINOR_ATLAS", PortraitIndex = "13" WHERE MinorCivType = "MINOR_CIV_SUK_ANTANANARIVO";

-- Mercantile
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_MERCANTILEMINOR_ATLAS", PortraitIndex = "0" WHERE MinorCivType = "MINOR_CIV_SUK_SINGAPORE";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_MERCANTILEMINOR_ATLAS", PortraitIndex = "1" WHERE MinorCivType = "MINOR_CIV_SUK_MARIEHAMN";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_MERCANTILEMINOR_ATLAS", PortraitIndex = "2" WHERE MinorCivType = "MINOR_CIV_SUK_OYO_ILE";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_MERCANTILEMINOR_ATLAS", PortraitIndex = "3" WHERE MinorCivType = "MINOR_CIV_SUK_DORPAT";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_MERCANTILEMINOR_ATLAS", PortraitIndex = "4" WHERE MinorCivType = "MINOR_CIV_SUK_LUBECK";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_MERCANTILEMINOR_ATLAS", PortraitIndex = "5" WHERE MinorCivType = "MINOR_CIV_SUK_HONG_KONG";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_MERCANTILEMINOR_ATLAS", PortraitIndex = "6" WHERE MinorCivType = "MINOR_CIV_SUK_SAMARKAND";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_MERCANTILEMINOR_ATLAS", PortraitIndex = "7" WHERE MinorCivType = "MINOR_CIV_SUK_GADIR";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_MERCANTILEMINOR_ATLAS", PortraitIndex = "8" WHERE MinorCivType = "MINOR_CIV_SUK_ANURADHAPURA";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_MERCANTILEMINOR_ATLAS", PortraitIndex = "9" WHERE MinorCivType = "MINOR_CIV_SUK_MANICA";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_MERCANTILEMINOR_ATLAS", PortraitIndex = "10" WHERE MinorCivType = "MINOR_CIV_SUK_ORMUS";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_MERCANTILEMINOR_ATLAS", PortraitIndex = "11" WHERE MinorCivType = "MINOR_CIV_SUK_MOGADISHU";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_MERCANTILEMINOR_ATLAS", PortraitIndex = "12" WHERE MinorCivType = "MINOR_CIV_SUK_MALACCA";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_MERCANTILEMINOR_ATLAS", PortraitIndex = "13" WHERE MinorCivType = "MINOR_CIV_SUK_ADEN";

-- Militaristic
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_MILITARISTICMINOR_ATLAS", PortraitIndex = "0" WHERE MinorCivType = "MINOR_CIV_SUK_VALLETTA";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_MILITARISTICMINOR_ATLAS", PortraitIndex = "1" WHERE MinorCivType = "MINOR_CIV_SUK_DALI";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_MILITARISTICMINOR_ATLAS", PortraitIndex = "2" WHERE MinorCivType = "MINOR_CIV_SUK_JERICHO";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_MILITARISTICMINOR_ATLAS", PortraitIndex = "3" WHERE MinorCivType = "MINOR_CIV_SUK_HOLMGARD";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_MILITARISTICMINOR_ATLAS", PortraitIndex = "4" WHERE MinorCivType = "MINOR_CIV_SUK_GIBRALTAR";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_MILITARISTICMINOR_ATLAS", PortraitIndex = "5" WHERE MinorCivType = "MINOR_CIV_SUK_SOKOTO";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_MILITARISTICMINOR_ATLAS", PortraitIndex = "6" WHERE MinorCivType = "MINOR_CIV_SUK_TLAXCALA";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_MILITARISTICMINOR_ATLAS", PortraitIndex = "7" WHERE MinorCivType = "MINOR_CIV_SUK_PSKOV";

-- Religious
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_RELIGIOUSMINOR_ATLAS", PortraitIndex = "0" WHERE MinorCivType = "MINOR_CIV_SUK_AVIGNON";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_RELIGIOUSMINOR_ATLAS", PortraitIndex = "1" WHERE MinorCivType = "MINOR_CIV_SUK_JERUSALEM";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_RELIGIOUSMINOR_ATLAS", PortraitIndex = "2" WHERE MinorCivType = "MINOR_CIV_SUK_LINDISFARNE";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_RELIGIOUSMINOR_ATLAS", PortraitIndex = "3" WHERE MinorCivType = "MINOR_CIV_SUK_IFE";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_RELIGIOUSMINOR_ATLAS", PortraitIndex = "4" WHERE MinorCivType = "MINOR_CIV_SUK_WITTENBERG";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_RELIGIOUSMINOR_ATLAS", PortraitIndex = "5" WHERE MinorCivType = "MINOR_CIV_SUK_GOBEKLI_TEPE";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_RELIGIOUSMINOR_ATLAS", PortraitIndex = "6" WHERE MinorCivType = "MINOR_CIV_SUK_UKONSAARI";
UPDATE Suk_SuzerainTraits SET IconAtlas = "SUZERAINITY_RELIGIOUSMINOR_ATLAS", PortraitIndex = "7" WHERE MinorCivType = "MINOR_CIV_SUK_VARANASI";

-- Hong Kong, EE Support
UPDATE Suk_SuzerainTraits
	SET Description = 'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_HONG_KONG_EE'
	WHERE Type = 'SUZERAINTRAIT_MINOR_CIV_SUK_HONG_KONG'
	AND EXISTS (SELECT * FROM BuildingClasses WHERE Type = 'BUILDINGCLASS_EE_WEIGH_HOUSE');
--------------------------------
-- Suk_SuzerainTrait_FreePolicies
--------------------------------	
INSERT INTO Suk_SuzerainTrait_FreePolicies
			(SuzerainTraitType,								PolicyType)
VALUES		('SUZERAINTRAIT_MINOR_CIV_SUK_KUK',				'POLICY_MINOR_CIV_SUK_KUK'),
			('SUZERAINTRAIT_MINOR_CIV_SUK_MARIEHAMN',		'POLICY_MINOR_CIV_SUK_MARIEHAMN'),
			('SUZERAINTRAIT_MINOR_CIV_SUK_ABOMEY',			'POLICY_MINOR_CIV_SUK_ABOMEY'),
			('SUZERAINTRAIT_MINOR_CIV_SUK_GIBRALTAR',		'POLICY_MINOR_CIV_SUK_GIBRALTAR'),
			('SUZERAINTRAIT_MINOR_CIV_SUK_GADIR',			'POLICY_MINOR_CIV_SUK_GADIR'),
			('SUZERAINTRAIT_MINOR_CIV_SUK_SAMARKAND',		'POLICY_MINOR_CIV_SUK_SAMARKAND'),
			('SUZERAINTRAIT_MINOR_CIV_SUK_LUBECK',			'POLICY_MINOR_CIV_SUK_LUBECK'),
			('SUZERAINTRAIT_MINOR_CIV_SUK_ANURADHAPURA',	'POLICY_MINOR_CIV_SUK_ANURADHAPURA'),
			('SUZERAINTRAIT_MINOR_CIV_SUK_MANICA',			'POLICY_MINOR_CIV_SUK_MANICA'),	
			('SUZERAINTRAIT_MINOR_CIV_SUK_SNAKETOWN',		'POLICY_MINOR_CIV_SUK_SNAKETOWN'),
			('SUZERAINTRAIT_MINOR_CIV_SUK_CATALHOYUK',		'POLICY_MINOR_CIV_SUK_CATALHOYUK'),
			('SUZERAINTRAIT_MINOR_CIV_SUK_SAN_JUAN',		'POLICY_MINOR_CIV_SUK_SAN_JUAN'),
			('SUZERAINTRAIT_MINOR_CIV_SUK_VIJAYA',			'POLICY_MINOR_CIV_SUK_VIJAYA'),	
			('SUZERAINTRAIT_MINOR_CIV_SUK_SAN_JOSE',		'POLICY_MINOR_CIV_SUK_SAN_JOSE'),
			('SUZERAINTRAIT_MINOR_CIV_SUK_ULM',				'POLICY_MINOR_CIV_SUK_ULM'),
			('SUZERAINTRAIT_MINOR_CIV_SUK_NOK',				'POLICY_MINOR_CIV_SUK_NOK'),
			('SUZERAINTRAIT_MINOR_CIV_SUK_AVA',				'POLICY_MINOR_CIV_SUK_AVA'),
			('SUZERAINTRAIT_MINOR_CIV_SUK_DALI',			'POLICY_MINOR_CIV_SUK_DALI'),
			('SUZERAINTRAIT_MINOR_CIV_SUK_BOLOGNA',			'POLICY_MINOR_CIV_SUK_BOLOGNA'),
			('SUZERAINTRAIT_MINOR_CIV_SUK_UKONSAARI',		'POLICY_MINOR_CIV_SUK_UKONSAARI'),
			('SUZERAINTRAIT_MINOR_CIV_SUK_LINDISFARNE',		'POLICY_MINOR_CIV_SUK_LINDISFARNE'),
			('SUZERAINTRAIT_MINOR_CIV_SUK_SYRACUSE',		'POLICY_MINOR_CIV_SUK_SYRACUSE'),
			('SUZERAINTRAIT_MINOR_CIV_SUK_ISANAPURA',		'POLICY_MINOR_CIV_SUK_ISANAPURA'),
			('SUZERAINTRAIT_MINOR_CIV_SUK_HONG_KONG',		'POLICY_MINOR_CIV_SUK_HONG_KONG'),
			('SUZERAINTRAIT_MINOR_CIV_SUK_ORMUS',			'POLICY_MINOR_CIV_SUK_ORMUS'),
			('SUZERAINTRAIT_MINOR_CIV_SUK_VARANASI',		'POLICY_MINOR_CIV_SUK_VARANASI'),	
			('SUZERAINTRAIT_MINOR_CIV_SUK_NAQADA',			'POLICY_MINOR_CIV_SUK_NAQADA'),
			('SUZERAINTRAIT_MINOR_CIV_SUK_PALMYRA',			'POLICY_MINOR_CIV_SUK_PALMYRA'),												
			('SUZERAINTRAIT_MINOR_CIV_SUK_JERICHO',			'POLICY_MINOR_CIV_SUK_JERICHO');
--------------------------------
-- Suk_SuzerainTrait_FreeBuildings
--------------------------------	
INSERT INTO Suk_SuzerainTrait_FreeBuildings
			(SuzerainTraitType,								BuildingType)
VALUES		('SUZERAINTRAIT_MINOR_CIV_SUK_REVAL',			'BUILDING_MINOR_CIV_SUK_REVAL'),
			('SUZERAINTRAIT_MINOR_CIV_SUK_PSKOV',			'BUILDING_MINOR_CIV_SUK_PSKOV'),
			('SUZERAINTRAIT_MINOR_CIV_SUK_NAN_MADOL',		'BUILDING_MINOR_CIV_SUK_NAN_MADOL');
--------------------------------
-- Suk_SuzerainTrait_FreePromotions
--------------------------------
INSERT INTO Suk_SuzerainTrait_FreePromotions
			(SuzerainTraitType,								PromotionType)
VALUES		('SUZERAINTRAIT_MINOR_CIV_SUK_VALLETTA',		'PROMOTION_MINOR_CIV_SUK_VALLETTA'),
			('SUZERAINTRAIT_MINOR_CIV_SUK_TLAXCALA',		'PROMOTION_MINOR_CIV_SUK_TLAXCALA');			
--------------------------------
-- Suk_MinorDialogue
--------------------------------	
INSERT INTO Suk_MinorDialogue 	
		(MessageType, 								Message,																MinorCivType,		MinorCivTrait,				MinorCivPersonality)
VALUES	('MESSAGE_SUK_SICAN_GIFT',					'TXT_KEY_MINOR_CIV_SUK_SICAN_DIALOGUE_RESPONSE',						NULL,				NULL,						NULL);		
--==========================================================================================================================
-- SUZERAINITY UI ADDINS
--==========================================================================================================================
-- SuzerainUI_AddinSupport
--------------------------------
INSERT INTO SuzerainUI_AddinSupport (FileName) VALUES ('Interactions_Suk_Avignon.lua');
INSERT INTO SuzerainUI_AddinSupport (FileName) VALUES ('Interactions_Suk_Oyo_Ile.lua');
INSERT INTO SuzerainUI_AddinSupport (FileName) VALUES ('Interactions_Suk_Mesa.lua');
INSERT INTO SuzerainUI_AddinSupport (FileName) VALUES ('Interactions_Suk_Naqada.lua');
INSERT INTO SuzerainUI_AddinSupport (FileName) VALUES ('Interactions_Suk_Gobekli_Tepe.lua');
INSERT INTO SuzerainUI_AddinSupport (FileName) VALUES ('Interactions_Suk_Sican.lua');
--==========================================================================================================================
-- POLICIES
--==========================================================================================================================
-- Policies
--------------------------------
INSERT INTO Policies
			(Type, 										Description,							IsDummy) 
VALUES		('POLICY_MINOR_CIV_SUK_KUK',	 	    	'TXT_KEY_MINOR_CIV_SUK_KUK',			1),
			('POLICY_MINOR_CIV_SUK_MARIEHAMN',	 	   	'TXT_KEY_MINOR_CIV_SUK_MARIEHAMN',		1),
			('POLICY_MINOR_CIV_SUK_ABOMEY',	 	 	  	'TXT_KEY_MINOR_CIV_SUK_ABOMEY',			1),
			('POLICY_MINOR_CIV_SUK_GIBRALTAR',	 	 	'TXT_KEY_MINOR_CIV_SUK_GIBRALTAR',		1),
			('POLICY_MINOR_CIV_SUK_GADIR',	 	 		'TXT_KEY_MINOR_CIV_SUK_GADIR',			1),
			('POLICY_MINOR_CIV_SUK_SAMARKAND',	 	 	'TXT_KEY_MINOR_CIV_SUK_SAMARKAND',		1),
			('POLICY_MINOR_CIV_SUK_LUBECK',	 	 		'TXT_KEY_MINOR_CIV_SUK_LUBECK',			1),	
			('POLICY_MINOR_CIV_SUK_ANURADHAPURA',	 	'TXT_KEY_MINOR_CIV_SUK_ANURADHAPURA',	1),	
			('POLICY_MINOR_CIV_SUK_MANICA',	 			'TXT_KEY_MINOR_CIV_SUK_MANICA',			1),		
			('POLICY_MINOR_CIV_SUK_SNAKETOWN',	 		'TXT_KEY_MINOR_CIV_SUK_SNAKETOWN',		1),
			('POLICY_MINOR_CIV_SUK_CATALHOYUK',	 		'TXT_KEY_MINOR_CIV_SUK_CATALHOYUK',		1),
			('POLICY_MINOR_CIV_SUK_SAN_JUAN',	 		'TXT_KEY_MINOR_CIV_SUK_SAN_JUAN',		1),
			('POLICY_MINOR_CIV_SUK_VIJAYA',	 			'TXT_KEY_MINOR_CIV_SUK_VIJAYA',			1),	
			('POLICY_MINOR_CIV_SUK_SAN_JOSE',	 		'TXT_KEY_MINOR_CIV_SUK_SAN_JOSE',		1),	
			('POLICY_MINOR_CIV_SUK_ULM',		 		'TXT_KEY_MINOR_CIV_SUK_ULM',			1),
			('POLICY_MINOR_CIV_SUK_NOK',		 		'TXT_KEY_MINOR_CIV_SUK_NOK',			1),
			('POLICY_MINOR_CIV_SUK_AVA',		 		'TXT_KEY_MINOR_CIV_SUK_AVA',			1),
			('POLICY_MINOR_CIV_SUK_DALI',	 	 		'TXT_KEY_MINOR_CIV_SUK_DALI',			1),	
			('POLICY_MINOR_CIV_SUK_BOLOGNA',		 	'TXT_KEY_MINOR_CIV_SUK_BOLOGNA',		1),	
			('POLICY_MINOR_CIV_SUK_UKONSAARI',		 	'TXT_KEY_MINOR_CIV_SUK_UKONSAARI',		1),	
			('POLICY_MINOR_CIV_SUK_LINDISFARNE',		'TXT_KEY_MINOR_CIV_SUK_LINDISFARNE',	1),	
			('POLICY_MINOR_CIV_SUK_SYRACUSE',			'TXT_KEY_MINOR_CIV_SUK_SYRACUSE',		1),
			('POLICY_MINOR_CIV_SUK_ISANAPURA',			'TXT_KEY_MINOR_CIV_SUK_ISANAPURA',		1),
			('POLICY_MINOR_CIV_SUK_HONG_KONG',			'TXT_KEY_MINOR_CIV_SUK_HONG_KONG',		1),	
			('POLICY_MINOR_CIV_SUK_ORMUS',				'TXT_KEY_MINOR_CIV_SUK_ORMUS',			1),
			('POLICY_MINOR_CIV_SUK_NAQADA',				'TXT_KEY_MINOR_CIV_SUK_NAQADA',			1),
			('POLICY_MINOR_CIV_SUK_PALMYRA',			'TXT_KEY_MINOR_CIV_SUK_PALMYRA',		1),
			('POLICY_MINOR_CIV_SUK_VARANASI',			'TXT_KEY_MINOR_CIV_SUK_VARANASI',		1),							
			('POLICY_MINOR_CIV_SUK_JERICHO',	 	    'TXT_KEY_MINOR_CIV_SUK_JERICHO',		1);

UPDATE Policies
	SET FreeTradeRoute = 2
	WHERE Type = 'POLICY_MINOR_CIV_SUK_SAMARKAND';

UPDATE Policies
	SET InternalTradeGold = 4
	WHERE Type = 'POLICY_MINOR_CIV_SUK_GADIR';	

UPDATE Policies
	SET CityStateTradeChange = 500
	WHERE Type = 'POLICY_MINOR_CIV_SUK_LUBECK';

UPDATE Policies
	SET IncludesOneShotFreeUnits = 1
	WHERE Type = 'POLICY_MINOR_CIV_SUK_LINDISFARNE';

UPDATE Policies
	SET WonderProductionModifier = 15
	WHERE Type = 'POLICY_MINOR_CIV_SUK_PALMYRA';

UPDATE Policies
	SET ExtraHappinessPerLuxury = 2
	WHERE Type = 'POLICY_MINOR_CIV_SUK_ORMUS';

UPDATE Policies
	SET UnitUpgradeCostMod = -33
	WHERE Type = 'POLICY_MINOR_CIV_SUK_DALI';	
--------------------------------
-- Policy_CapitalYieldPerPopChanges
--------------------------------
INSERT INTO Policy_CapitalYieldPerPopChanges 	
			(PolicyType, 									YieldType, 			Yield)
VALUES		('MINOR_CIV_SUK_VARANASI', 						'YIELD_FAITH',		200);
--------------------------------
-- Policy_YieldChangeWorldWonder
--------------------------------
INSERT INTO Policy_YieldChangeWorldWonder 	
			(PolicyType, 									YieldType, 						Yield)
VALUES		('POLICY_MINOR_CIV_SUK_ISANAPURA', 				'YIELD_FOOD',					2),
			('POLICY_MINOR_CIV_SUK_ISANAPURA', 				'YIELD_GOLDEN_AGE_POINTS',		2);
--------------------------------
-- Policy_LitYieldChanges
--------------------------------
INSERT INTO Policy_LitYieldChanges 	
			(PolicyType, 									YieldType, 			Yield)
VALUES		('POLICY_MINOR_CIV_SUK_LINDISFARNE', 			'YIELD_FAITH',		2),
			('POLICY_MINOR_CIV_SUK_LINDISFARNE', 			'YIELD_SCIENCE',	1);
--------------------------------
-- Policy_ArtYieldChanges
--------------------------------
INSERT INTO Policy_ArtYieldChanges 	
			(PolicyType, 							YieldType, 			Yield)
VALUES		('POLICY_MINOR_CIV_SUK_NOK', 			'YIELD_FOOD',		2),
			('POLICY_MINOR_CIV_SUK_NOK', 			'YIELD_PRODUCTION',	2);
--------------------------------
-- Policy_ArtifactYieldChanges
--------------------------------
INSERT INTO Policy_ArtifactYieldChanges 	
			(PolicyType, 							YieldType, 			Yield)
VALUES		('POLICY_MINOR_CIV_SUK_NOK', 			'YIELD_FOOD',		2),
			('POLICY_MINOR_CIV_SUK_NOK', 			'YIELD_PRODUCTION',	2);			
--------------------------------
-- Policy_FeatureYieldChanges
--------------------------------
INSERT INTO Policy_FeatureYieldChanges 
			(PolicyType, 									FeatureType,				YieldType, 				Yield)
VALUES 		('POLICY_MINOR_CIV_SUK_KUK', 					'FEATURE_MARSH',			'YIELD_FOOD', 			3),
			('POLICY_MINOR_CIV_SUK_UKONSAARI', 				'FEATURE_FOREST',			'YIELD_FAITH', 			1);
--------------------------------
-- Policy_ResourceYieldChanges
--------------------------------
INSERT INTO Policy_ResourceYieldChanges 
			(PolicyType, 									ResourceType,				YieldType, 				Yield)
VALUES 		('POLICY_MINOR_CIV_SUK_SYRACUSE', 				'RESOURCE_WHEAT',			'YIELD_FOOD', 			1),
			('POLICY_MINOR_CIV_SUK_SYRACUSE', 				'RESOURCE_WHEAT',			'YIELD_CULTURE', 		2);

INSERT INTO Policy_ResourceYieldChanges 
			(PolicyType, 									ResourceType,				YieldType, 				Yield)
SELECT 		'POLICY_MINOR_CIV_SUK_ANURADHAPURA', 			ResourceType,				'YIELD_GOLD', 			1
FROM Improvement_ResourceTypes WHERE ImprovementType IN ('IMPROVEMENT_FARM', 'IMPROVEMENT_PLANTATION');

INSERT INTO Policy_ResourceYieldChanges 
			(PolicyType, 									ResourceType,				YieldType, 				Yield)
SELECT 		'POLICY_MINOR_CIV_SUK_MANICA', 					ResourceType,				'YIELD_GOLD', 			1
FROM Improvement_ResourceTypes WHERE ImprovementType IN ('IMPROVEMENT_PASTURE');

INSERT INTO Policy_ResourceYieldChanges 
			(PolicyType, 									ResourceType,				YieldType, 							Yield)
SELECT 		'POLICY_MINOR_CIV_SUK_CATALHOYUK', 				Type,						'YIELD_GOLDEN_AGE_POINTS', 			2
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_BONUS';

CREATE TRIGGER Policy_ResourceYieldChanges_Suk_Anuradhapura
AFTER INSERT ON Improvement_ResourceTypes
WHEN NEW.ImprovementType  IN ('IMPROVEMENT_FARM', 'IMPROVEMENT_PLANTATION')
BEGIN
  INSERT OR REPLACE INTO Policy_ResourceYieldChanges
  					(PolicyType, 									ResourceType,				YieldType, 				Yield)
  VALUES			('POLICY_MINOR_CIV_SUK_ANURADHAPURA', 			NEW.ResourceType,			'YIELD_GOLD', 			1);
END;

CREATE TRIGGER Policy_ResourceYieldChanges_Suk_Manica
AFTER INSERT ON Improvement_ResourceTypes
WHEN NEW.ImprovementType  IN ('IMPROVEMENT_PASTURE')
BEGIN
  INSERT OR REPLACE INTO Policy_ResourceYieldChanges
  					(PolicyType, 									ResourceType,				YieldType, 				Yield)
  VALUES			('POLICY_MINOR_CIV_SUK_MANICA', 				NEW.ResourceType,			'YIELD_GOLD', 			1);
END;

CREATE TRIGGER Policy_ResourceYieldChanges_Suk_Catalhoyuk
AFTER INSERT ON Resources
WHEN NEW.ResourceClassType = 'RESOURCECLASS_BONUS'
BEGIN
  INSERT OR REPLACE INTO Policy_ResourceYieldChanges
  					(PolicyType, 									ResourceType,				YieldType, 							Yield)
  VALUES			('POLICY_MINOR_CIV_SUK_CATALHOYUK', 			NEW.Type,					'YIELD_GOLDEN_AGE_POINTS', 			2);
END;
--------------------------------
-- Policy_BuildingClassYieldChanges
--------------------------------
INSERT INTO Policy_BuildingClassYieldChanges 
			(PolicyType, 									BuildingClassType,				YieldType, 				YieldChange)
VALUES 		('POLICY_MINOR_CIV_SUK_SNAKETOWN', 				'BUILDINGCLASS_WATERMILL',		'YIELD_CULTURE', 		2),
			('POLICY_MINOR_CIV_SUK_SNAKETOWN', 				'BUILDINGCLASS_GRANARY',		'YIELD_CULTURE', 		2),
			('POLICY_MINOR_CIV_SUK_SNAKETOWN', 				'BUILDINGCLASS_AQUEDUCT',		'YIELD_CULTURE', 		2),
			('POLICY_MINOR_CIV_SUK_HONG_KONG', 				'BUILDINGCLASS_BANK',			'YIELD_PRODUCTION',		2),
			('POLICY_MINOR_CIV_SUK_HONG_KONG', 				'BUILDINGCLASS_STOCK_EXCHANGE',	'YIELD_PRODUCTION',		2),
			('POLICY_MINOR_CIV_SUK_HONG_KONG', 				'BUILDINGCLASS_SEAPORT',		'YIELD_PRODUCTION',		2),
			('POLICY_MINOR_CIV_SUK_NAQADA', 				'BUILDINGCLASS_PALACE',			'YIELD_CULTURE', 		3),									
			('POLICY_MINOR_CIV_SUK_ABOMEY', 				'BUILDINGCLASS_PALACE',			'YIELD_CULTURE', 		3),
			('POLICY_MINOR_CIV_SUK_ABOMEY', 				'BUILDINGCLASS_PALACE',			'YIELD_GOLD', 			3),
		 	('POLICY_MINOR_CIV_SUK_ABOMEY', 				'BUILDINGCLASS_PALACE',	 		'YIELD_SCIENCE',		3),
			('POLICY_MINOR_CIV_SUK_ABOMEY', 				'BUILDINGCLASS_PALACE',			'YIELD_PRODUCTION',		3),
			('POLICY_MINOR_CIV_SUK_ABOMEY', 				'BUILDINGCLASS_PALACE',			'YIELD_FOOD',			3),
			('POLICY_MINOR_CIV_SUK_ABOMEY', 				'BUILDINGCLASS_PALACE',			'YIELD_FAITH',			3);

UPDATE Policy_BuildingClassYieldChanges
	SET BuildingClassType = 'BUILDINGCLASS_EE_WEIGH_HOUSE'
	WHERE PolicyType = 'POLICY_MINOR_CIV_SUK_HONG_KONG' AND BuildingClassType = 'BUILDINGCLASS_SEAPORT'
	AND EXISTS (SELECT * FROM BuildingClasses WHERE Type = 'BUILDINGCLASS_EE_WEIGH_HOUSE');
--------------------------------
-- Policy_BuildingClassYieldModifiers
--------------------------------
INSERT INTO Policy_BuildingClassYieldModifiers 
			(PolicyType, 									BuildingClassType,				YieldType, 				YieldMod)
VALUES 		('POLICY_MINOR_CIV_SUK_HONG_KONG', 				'BUILDINGCLASS_BANK',			'YIELD_PRODUCTION',		2),
			('POLICY_MINOR_CIV_SUK_HONG_KONG', 				'BUILDINGCLASS_STOCK_EXCHANGE',	'YIELD_PRODUCTION',		2),
			('POLICY_MINOR_CIV_SUK_HONG_KONG', 				'BUILDINGCLASS_SEAPORT',		'YIELD_PRODUCTION',		2);

UPDATE Policy_BuildingClassYieldModifiers
	SET BuildingClassType = 'BUILDINGCLASS_EE_WEIGH_HOUSE'
	WHERE PolicyType = 'POLICY_MINOR_CIV_SUK_HONG_KONG' AND BuildingClassType = 'BUILDINGCLASS_SEAPORT'
	AND EXISTS (SELECT * FROM BuildingClasses WHERE Type = 'BUILDINGCLASS_EE_WEIGH_HOUSE');			
--------------------------------
-- Policy_BuildingClassCultureChanges
--------------------------------
INSERT INTO Policy_BuildingClassCultureChanges 
			(PolicyType, 									BuildingClassType,				CultureChange)
VALUES 		('POLICY_MINOR_CIV_SUK_JERICHO', 				'BUILDINGCLASS_WALLS',	 		2),
		 	('POLICY_MINOR_CIV_SUK_JERICHO', 				'BUILDINGCLASS_CASTLE',	 		2);
--------------------------------
-- Policy_BuildingClassProductionModifiers
--------------------------------
INSERT INTO Policy_BuildingClassProductionModifiers 
			(PolicyType, 										BuildingClassType,				ProductionModifier)
VALUES 		('POLICY_MINOR_CIV_SUK_UKONSAARI', 					'BUILDINGCLASS_SHRINE',	 		50),
			('POLICY_MINOR_CIV_SUK_JERICHO', 					'BUILDINGCLASS_WALLS',	 		33),
			('POLICY_MINOR_CIV_SUK_JERICHO', 					'BUILDINGCLASS_CASTLE',	 		33),
			('POLICY_MINOR_CIV_SUK_BOLOGNA', 					'BUILDINGCLASS_LIBRARY',	 	33),
			('POLICY_MINOR_CIV_SUK_BOLOGNA', 					'BUILDINGCLASS_UNIVERSITY',	 	33),
			('POLICY_MINOR_CIV_SUK_MARIEHAMN', 					'BUILDINGCLASS_LIGHTHOUSE',	 	30),
			('POLICY_MINOR_CIV_SUK_MARIEHAMN', 					'BUILDINGCLASS_HARBOR',	 		30),
			('POLICY_MINOR_CIV_SUK_MARIEHAMN', 					'BUILDINGCLASS_EE_DRYDOCK',	 	30),
			('POLICY_MINOR_CIV_SUK_MARIEHAMN', 					'BUILDINGCLASS_SEAPORT',	 	30);
--------------------------------
-- Policy_ImprovementYieldChanges
--------------------------------
INSERT INTO Policy_ImprovementYieldChanges 
			(PolicyType, 									ImprovementType,			YieldType, 				Yield)
VALUES 		('POLICY_MINOR_CIV_SUK_VIJAYA', 				'IMPROVEMENT_LUMBERMILL',	'YIELD_FOOD', 			1);
--------------------------------	
-- Policy_YieldChangesNaturalWonder
--------------------------------
INSERT INTO Policy_YieldChangesNaturalWonder 	
			(PolicyType, 									YieldType, 			Yield)
VALUES		('POLICY_MINOR_CIV_SUK_SAN_JOSE', 				'YIELD_CULTURE', 	3),
			('POLICY_MINOR_CIV_SUK_SAN_JOSE', 				'YIELD_SCIENCE', 	3),
			('POLICY_MINOR_CIV_SUK_SAN_JOSE', 				'YIELD_GOLD', 		3);
--------------------------------
-- Policy_SpecialistYieldChanges
--------------------------------
INSERT INTO Policy_SpecialistYieldChanges 
			(PolicyType, 									SpecialistType,				YieldType, 						Yield)
VALUES 		('POLICY_MINOR_CIV_SUK_AVA', 					'SPECIALIST_ARTIST',		'YIELD_CULTURE', 				2),
			('POLICY_MINOR_CIV_SUK_AVA', 					'SPECIALIST_MUSICIAN',		'YIELD_CULTURE', 				2),
			('POLICY_MINOR_CIV_SUK_AVA', 					'SPECIALIST_WRITER',		'YIELD_CULTURE', 				2),
			('POLICY_MINOR_CIV_SUK_AVA', 					'SPECIALIST_ARTIST',		'YIELD_GOLDEN_AGE_POINTS', 		3),
			('POLICY_MINOR_CIV_SUK_AVA', 					'SPECIALIST_MUSICIAN',		'YIELD_GOLDEN_AGE_POINTS', 		3),
			('POLICY_MINOR_CIV_SUK_AVA', 					'SPECIALIST_WRITER',		'YIELD_GOLDEN_AGE_POINTS', 		3),

			('POLICY_MINOR_CIV_SUK_BOLOGNA', 				'SPECIALIST_SCIENTIST',		'YIELD_CULTURE', 		2),

			('POLICY_MINOR_CIV_SUK_ULM', 					'SPECIALIST_ENGINEER',		'YIELD_CULTURE', 		1),
			('POLICY_MINOR_CIV_SUK_ULM', 					'SPECIALIST_ENGINEER',		'YIELD_PRODUCTION', 	1),
			('POLICY_MINOR_CIV_SUK_ULM', 					'SPECIALIST_MERCHANT',		'YIELD_CULTURE', 		1),
			('POLICY_MINOR_CIV_SUK_ULM', 					'SPECIALIST_MERCHANT',		'YIELD_GOLD', 			1);
--------------------------------
-- Policy_FreeUnitClasses
--------------------------------
INSERT INTO Policy_FreeUnitClasses 	
			(PolicyType, 									UnitClassType, 			Count)
VALUES		('POLICY_MINOR_CIV_SUK_LINDISFARNE', 			'UNITCLASS_WRITER',		1);		
--------------------------------
-- Policy_UnitCombatFreeExperiences
--------------------------------
INSERT INTO Policy_UnitCombatFreeExperiences
			(PolicyType, 								UnitCombatType,				FreeExperience)
VALUES		('POLICY_MINOR_CIV_SUK_GIBRALTAR', 			'UNITCOMBAT_NAVALMELEE',	10),
			('POLICY_MINOR_CIV_SUK_GIBRALTAR', 			'UNITCOMBAT_NAVALRANGED',	10),
			('POLICY_MINOR_CIV_SUK_GIBRALTAR', 			'UNITCOMBAT_SUBMARINE',		10);
--------------------------------
-- Policy_UnitCombatProductionModifiers
--------------------------------
INSERT INTO Policy_UnitCombatProductionModifiers
			(PolicyType, 								UnitCombatType,				ProductionModifier)
VALUES		('POLICY_MINOR_CIV_SUK_GIBRALTAR', 			'UNITCOMBAT_NAVALMELEE',	15),
			('POLICY_MINOR_CIV_SUK_GIBRALTAR', 			'UNITCOMBAT_NAVALRANGED',	15),
			('POLICY_MINOR_CIV_SUK_GIBRALTAR', 			'UNITCOMBAT_SUBMARINE',		15);
--------------------------------
-- Policy_UnitClassProductionModifiers
--------------------------------
INSERT INTO Policy_UnitClassProductionModifiers
			(PolicyType, 								UnitClassType,				ProductionModifier)
VALUES		('POLICY_MINOR_CIV_SUK_SAN_JUAN', 			'UNITCLASS_CARGO_SHIP',		50),
			('POLICY_MINOR_CIV_SUK_SAN_JUAN', 			'UNITCLASS_WORKBOAT',		50),
			('POLICY_MINOR_CIV_SUK_MANICA', 			'UNITCLASS_CARAVAN',		50);
--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
-- BuildingClasses
--------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 				DefaultBuilding, 						Description)
VALUES	('BUILDINGCLASS_MINOR_CIV_SUK_MESA_VERDE', 	'BUILDING_MINOR_CIV_SUK_MESA_VERDE', 	'TXT_KEY_MINOR_CIV_SUK_MESA_VERDE'),
		('BUILDINGCLASS_MINOR_CIV_SUK_NAN_MADOL', 	'BUILDING_MINOR_CIV_SUK_NAN_MADOL', 	'TXT_KEY_MINOR_CIV_SUK_NAN_MADOL'),
		('BUILDINGCLASS_MINOR_CIV_SUK_PSKOV', 		'BUILDING_MINOR_CIV_SUK_PSKOV', 		'TXT_KEY_MINOR_CIV_SUK_PSKOV'),
		('BUILDINGCLASS_MINOR_CIV_SUK_REVAL', 		'BUILDING_MINOR_CIV_SUK_REVAL', 		'TXT_KEY_MINOR_CIV_SUK_REVAL');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
-- Buildings
--------------------------------	
INSERT INTO Buildings 	
		(Type, 						 			BuildingClass, 								GreatWorkCount, Cost, FaithCost, PrereqTech, Description, 							Help)
VALUES	('BUILDING_MINOR_CIV_SUK_MESA_VERDE', 	'BUILDINGCLASS_MINOR_CIV_SUK_MESA_VERDE',	-1, 			-1,   -1, 		 NULL, 		 'TXT_KEY_MINOR_CIV_SUK_MESA_VERDE', 	'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_MESA_VERDE_TT'),
		('BUILDING_MINOR_CIV_SUK_NAN_MADOL', 	'BUILDINGCLASS_MINOR_CIV_SUK_NAN_MADOL',	-1, 			-1,   -1, 		 NULL, 		 'TXT_KEY_MINOR_CIV_SUK_NAN_MADOL', 	'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_NAN_MADOL'),
		('BUILDING_MINOR_CIV_SUK_PSKOV', 		'BUILDINGCLASS_MINOR_CIV_SUK_PSKOV',		-1, 			-1,   -1, 		 NULL, 		 'TXT_KEY_MINOR_CIV_SUK_PSKOV', 		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_PSKOV'),
		('BUILDING_MINOR_CIV_SUK_REVAL', 		'BUILDINGCLASS_MINOR_CIV_SUK_REVAL',		-1, 			-1,   -1, 		 NULL, 		 'TXT_KEY_MINOR_CIV_SUK_REVAL', 		'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_REVAL');

UPDATE Buildings
	SET Defense = 250,
		ExtraCityHitPoints = 25
	WHERE Type = 'BUILDING_MINOR_CIV_SUK_PSKOV';	
--------------------------------
-- Building_YieldModifiers
--------------------------------
INSERT INTO Building_YieldModifiers 	
			(BuildingType, 									YieldType, 		Yield)
VALUES		('BUILDING_MINOR_CIV_SUK_MESA_VERDE', 			'YIELD_FOOD', 	10);
--------------------------------	
-- Building_LakePlotYieldChanges
--------------------------------
INSERT INTO Building_LakePlotYieldChanges 	
			(BuildingType, 									YieldType, 		Yield)
VALUES		('BUILDING_MINOR_CIV_SUK_REVAL', 				'YIELD_FOOD', 	1),
			('BUILDING_MINOR_CIV_SUK_REVAL', 				'YIELD_GOLD', 	1);
--------------------------------	
-- Building_SeaPlotYieldChanges
--------------------------------
INSERT INTO Building_SeaPlotYieldChanges 	
			(BuildingType, 									YieldType, 			Yield)
VALUES		('BUILDING_MINOR_CIV_SUK_NAN_MADOL', 			'YIELD_CULTURE', 	1);
--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================
-- UnitPromotions
--------------------------------
INSERT INTO UnitPromotions 
		(Type, 									Description, 						Help, 														Sound, 				CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_MINOR_CIV_SUK_VALLETTA', 	'TXT_KEY_MINOR_CIV_SUK_VALLETTA', 	'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_VALLETTA_PROMOTION',	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_HIDDEN',		'TXT_KEY_MINOR_CIV_SUK_VALLETTA'),
		('PROMOTION_MINOR_CIV_SUK_TLAXCALA', 	'TXT_KEY_MINOR_CIV_SUK_TLAXCALA', 	'TXT_KEY_SUZERAINTRAIT_MINOR_CIV_SUK_TLAXCALA_PROMOTION',	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_HIDDEN',		'TXT_KEY_MINOR_CIV_SUK_TLAXCALA');

UPDATE UnitPromotions
	SET AdjacentTileHealChange = 5
	WHERE Type = 'PROMOTION_MINOR_CIV_SUK_VALLETTA';
--------------------------------
-- UnitPromotions_UnitCombats
--------------------------------
INSERT INTO UnitPromotions_UnitCombats 
		(PromotionType, 							UnitCombatType)
VALUES	('PROMOTION_MINOR_CIV_SUK_VALLETTA', 		'UNITCOMBAT_RECON'),
		('PROMOTION_MINOR_CIV_SUK_TLAXCALA', 		'UNITCOMBAT_MELEE'),
		('PROMOTION_MINOR_CIV_SUK_TLAXCALA', 		'UNITCOMBAT_GUN');
--------------------------------
-- UnitPromotions_Features
--------------------------------
INSERT INTO UnitPromotions_Features 	
			(PromotionType, 									FeatureType, 			Defense,	Attack)
VALUES		('PROMOTION_MINOR_CIV_SUK_TLAXCALA',				'FEATURE_FOREST',		33,			33),
			('PROMOTION_MINOR_CIV_SUK_TLAXCALA',				'FEATURE_JUNGLE',		33,			33);
--------------------------------
-- UnitPromotions_CivilianUnitType
--------------------------------
INSERT INTO UnitPromotions_CivilianUnitType 
		(PromotionType, 							UnitType)
SELECT	'PROMOTION_MINOR_CIV_SUK_VALLETTA', 		Type
FROM Units WHERE Class IN ('UNITCLASS_PROPHET', 'UNITCLASS_MISSIONARY', 'UNITCLASS_INQUISITOR');
--==========================================================================================================================
--==========================================================================================================================