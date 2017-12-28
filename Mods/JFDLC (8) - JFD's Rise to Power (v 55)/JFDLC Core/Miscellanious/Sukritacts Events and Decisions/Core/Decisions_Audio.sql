--==========================================================================================================================
-- AUDIO
--==========================================================================================================================
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Audio_Sounds 
		(SoundID,									FileName,								LoadType)
VALUES	('SND_SOUND_JFD_DECISION_ENACTED', 			'NotificationPolicyRev2',				'DynamicResident'),
		('SND_SOUND_JFD_POLICY_ADOPTED', 			'SocialPolicyAdopted',					'DynamicResident');
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Audio_2DSounds 
		(ScriptID,									SoundID,								SoundType,		MinVolume,	MaxVolume)
VALUES	('AS2D_JFD_DECISION_ENACTED',				'SND_SOUND_JFD_DECISION_ENACTED',		'GAME_SFX',		100,		100);

UPDATE Audio_2DSounds
SET SoundID = 'SND_SOUND_JFD_POLICY_ADOPTED'
WHERE ScriptID = 'AS2D_INTERFACE_POLICY';
--==========================================================================================================================
--==========================================================================================================================
