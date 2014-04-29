#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
X39_MedSys_var_varNames = [];
//Private helper functions
//mainly used for a better overview

_fnc_getKey = 
{
	_keycode = getNumber (_this >> "key");
	_bool1 = (getNumber (_this >> "press_ctrl")) call X39_MedSys_fnc_IntToBoolean;
	_bool2 = (getNumber (_this >> "press_alt")) call X39_MedSys_fnc_IntToBoolean;
	_bool3 = (getNumber (_this >> "press_shift")) call X39_MedSys_fnc_IntToBoolean;
	_useActionKey = (getNumber (_this >> "useActionKey")) call X39_MedSys_fnc_IntToBoolean;
	_actionKey = getText (_this >> "actionKey");
	[_useActionKey, _keycode, _bool1, _bool2, _bool3, _actionKey]
};

//Settings
_Keys = (configFile >> "CfgSettings" >> "X39" >> "x39_settings" >> "keys");
_X39_MedSys_var_Key_SelfInteraction = (_Keys >> "key1") call _fnc_getKey;
_X39_MedSys_var_Key_OthersInteraction = (_Keys >> "key2") call _fnc_getKey;
_arr = [[_X39_MedSys_var_Key_SelfInteraction, X39_MedSys_fnc_SelfInteraction], [_X39_MedSys_var_Key_OthersInteraction, X39_MedSys_fnc_OthersInteraction]];
assignVariable_STR("X39_MedSys_var_Keys", _arr)
_transparency = getNumber (configFile >> "CfgSettings" >> "X39" >> "x39_settings" >> "overlay" >> "transparency");
assignVariable_STR("X39_MedSys_var_Settings_Overlay_Transparency", _transparency)
_refreshRate = getNumber (configFile >> "CfgSettings" >> "X39" >> "x39_settings" >> "overlay" >> "refreshRate");
assignVariable_STR("X39_MedSys_var_Settings_Overlay_RefreshRate", _refreshRate)
_display_blood_pictureValues = [getNumber (configFile >> "CfgSettings" >> "X39" >> "x39_settings" >> "overlay" >> "bleeding" >> "bloodPic1"),
								getNumber (configFile >> "CfgSettings" >> "X39" >> "x39_settings" >> "overlay" >> "bleeding" >> "bloodPic2"),
								getNumber (configFile >> "CfgSettings" >> "X39" >> "x39_settings" >> "overlay" >> "bleeding" >> "bloodPic3"),
								getNumber (configFile >> "CfgSettings" >> "X39" >> "x39_settings" >> "overlay" >> "bleeding" >> "bloodPic4"),
								getNumber (configFile >> "CfgSettings" >> "X39" >> "x39_settings" >> "overlay" >> "bleeding" >> "bloodPic5")];
assignVariable_STR("X39_MedSys_var_Settings_Overlay_Blood_PictureValues", _display_blood_pictureValues)
_enableCamShake = (getNumber (configFile >> "CfgSettings" >> "X39" >> "x39_settings" >> "overlay" >> "enableCamShake")) call X39_MedSys_fnc_IntToBoolean;
assignVariable_STR("X39_MedSys_var_Settings_EnableCamShake", _enableCamShake)
_playEarRingingSound = (getNumber (configFile >> "CfgSettings" >> "X39" >> "x39_settings" >> "overlay" >> "playEarRingingSound")) call X39_MedSys_fnc_IntToBoolean;
assignVariable_STR("X39_MedSys_var_Settings_playEarRingingSound", _playEarRingingSound)
_Overlay_AllowHealthView = (getNumber (configFile >> "CfgSettings" >> "X39" >> "x39_settings" >> "overlay" >> "AllowHealthView")) call X39_MedSys_fnc_IntToBoolean;
assignVariable_STR("X39_MedSys_var_Display_Overlay_AllowHealthView", _Overlay_AllowHealthView)
_Overlay_AllowBoodView = (getNumber (configFile >> "CfgSettings" >> "X39" >> "x39_settings" >> "overlay" >> "AllowBoodView")) call X39_MedSys_fnc_IntToBoolean;
assignVariable_STR("X39_MedSys_var_Display_Overlay_AllowBoodView", _Overlay_AllowBoodView)
_Overlay_AllowLegView = (getNumber (configFile >> "CfgSettings" >> "X39" >> "x39_settings" >> "overlay" >> "AllowLegView")) call X39_MedSys_fnc_IntToBoolean;
assignVariable_STR("X39_MedSys_var_Display_Overlay_AllowLegView", _Overlay_AllowLegView)
_Overlay_AllowTourniquetView =  (getNumber (configFile >> "CfgSettings" >> "X39" >> "x39_settings" >> "overlay" >> "AllowTourniquetView")) call X39_MedSys_fnc_IntToBoolean;
assignVariable_STR("X39_MedSys_var_Display_Overlay_AllowTourniquetView", _Overlay_AllowTourniquetView)
_Overlay_AllowMorphineView =  (getNumber (configFile >> "CfgSettings" >> "X39" >> "x39_settings" >> "overlay" >> "AllowMorphineView")) call X39_MedSys_fnc_IntToBoolean;
assignVariable_STR("X39_MedSys_var_Display_Overlay_AllowMorphineView", _Overlay_AllowMorphineView)
assignVariable_STR("X39_MedSys_var_MedicalMenu_PutUnitIntoVehicle_TempObjectsPlaceholder", ObjNull)
assignVariable_STR("X39_MedSys_var_MedicalMenu_PullUnitFromVehicle_TempObjectsPlaceholder", ObjNull)

_IOMsg_AsHint =  (getNumber (configFile >> "CfgSettings" >> "X39" >> "x39_settings" >> "general" >> "outputMessagesAsHint")) call X39_MedSys_fnc_IntToBoolean;
assignVariable_STR("X39_MedSys_var_IOMsg_AsHint", _IOMsg_AsHint)
_IOMsg_AsSystemChat =  (getNumber (configFile >> "CfgSettings" >> "X39" >> "x39_settings" >> "general" >> "outputMessagesAsSystemMessage")) call X39_MedSys_fnc_IntToBoolean;
assignVariable_STR("X39_MedSys_var_IOMsg_AsSystemChat", _IOMsg_AsSystemChat)

//XEventSystem mod registering
/*
	if(X39_MedSys_var_UsingEventSystem) then {
		["event", [], false, "XMedSys", missionNamespace] call X39_XLib_EH_fnc_triggerEvent
	};
	if(X39_MedSys_var_UsingEventSystem) then {
		_XES_Res = ["event", [], true, "XMedSys", missionNamespace] call X39_XLib_EH_fnc_triggerEvent
		if(typeName _XES_Res == "ARRAY") then
		{
			_var = _XES_Res;
		};
	};
*/
["XMedSys", missionNamespace] call X39_XLib_EH_fnc_registerNamespace;
["Hit_Legs", "XMedSys", missionNamespace] call X39_XLib_EH_fnc_registerEvent;
["Hit_Head", "XMedSys", missionNamespace] call X39_XLib_EH_fnc_registerEvent;
["Hit_Hand", "XMedSys", missionNamespace] call X39_XLib_EH_fnc_registerEvent;
["Hit_Body", "XMedSys", missionNamespace] call X39_XLib_EH_fnc_registerEvent;
["Hit_General", "XMedSys", missionNamespace] call X39_XLib_EH_fnc_registerEvent;

["Killed", "XMedSys", missionNamespace] call X39_XLib_EH_fnc_registerEvent;
["Revived", "XMedSys", missionNamespace] call X39_XLib_EH_fnc_registerEvent;

["DamageChanged", "XMedSys", missionNamespace] call X39_XLib_EH_fnc_registerEvent;




//Internal variables (not allowed to edit during runtime! Or unexpected behaviour will occur!)
assignVariable_STR("X39_MedSys_var_Limitations", [])
assignVariable_STR("X39_MedSys_var_Display_BlackOut_Open", false)
assignVariable_STR("X39_MedSys_var_TickHandlers", [])
assignVariable_STR("X39_MedSys_var_TickRate", 0.25)
assignVariable_STR("X39_MedSys_var_TickRateMaxTicks", 100)

[X39_MedSys_fnc_TH_bleedingHandler]					call X39_MedSys_fnc_registerNewTickHandler;
[X39_MedSys_fnc_TH_walkingHandler]					call X39_MedSys_fnc_registerNewTickHandler;
[X39_MedSys_fnc_TH_tourniquetHandler, 4]			call X39_MedSys_fnc_registerNewTickHandler;
[X39_MedSys_fnc_TH_painHandler]						call X39_MedSys_fnc_registerNewTickHandler;
[X39_MedSys_fnc_TH_HealthRegenOverTimeHandler, 5]	call X39_MedSys_fnc_registerNewTickHandler;
[X39_MedSys_fnc_TH_hearingHandler, 2]				call X39_MedSys_fnc_registerNewTickHandler;



[BANDAGE]		call X39_MedSys_fnc_registerLimitation;
[BLOOD]			call X39_MedSys_fnc_registerLimitation;
[DEFIBRILLATE]	call X39_MedSys_fnc_registerLimitation;
[EPINEPHRINE]	call X39_MedSys_fnc_registerLimitation;
[MORPHINE]		call X39_MedSys_fnc_registerLimitation;
[MEDKIT]		call X39_MedSys_fnc_registerLimitation;
[TOURNIQUET]	call X39_MedSys_fnc_registerLimitation;

assignVariable_STR("X39_MedSys_var_ppEffects_ColorCorrections", -1)
assignVariable_STR("X39_MedSys_var_ppEffects_Blur", -1)
assignVariable_STR("X39_MedSys_var_ppEffects_ColorInversion", -1)
assignVariable_STR("X39_MedSys_var_ppEffects_ChromAberration", -1)


//AllowedToEdit Variables
assignVariable_STR("X39_MedSys_var_UsingEventSystem", false)
assignVariable_STR("X39_MedSys_var_DamageMultiplicator", 1.5)
assignVariable_STR("X39_MedSys_var_Legs_DamageBeforeProneOnly", 0.5)
assignVariable_STR("X39_MedSys_var_Legs_DamageMultiplicator", 0.2)
assignVariable_STR("X39_MedSys_var_Legs_AllowBrokenLegs", true)
assignVariable_STR("X39_MedSys_var_Head_DamageMultiplicator", 1)
assignVariable_STR("X39_MedSys_var_Head_HeadShotDeathLimit", -1)
assignVariable_STR("X39_MedSys_var_Head_HeadShotFakeKilling", true)
assignVariable_STR("X39_MedSys_var_Generic_DamageBeforeKnockOut", 4)
assignVariable_STR("X39_MedSys_var_Generic_DamageBeforePermaKnockOut", 5)
assignVariable_STR("X39_MedSys_var_Generic_DamageBeforeDead", 8) //not really dead but cant be revived with epipen
assignVariable_STR("X39_MedSys_var_Bleeding_BloodLossPerTickModificator", 1)
assignVariable_STR("X39_MedSys_var_Bleeding_StartingBlood", 6000)
assignVariable_STR("X39_MedSys_var_Action_CheckUnit_OutputRealValues", false)
assignVariable_STR("X39_MedSys_var_Bleeding_StartBloodAtMinDamageValueX", 0.25)
assignVariable_STR("X39_MedSys_var_Bleeding_KnockOutBloodLimit", X39_MedSys_var_Bleeding_StartingBlood * 0.2)
assignVariable_STR("X39_MedSys_var_LifeTime", 600)
assignVariable_STR("X39_MedSys_var_PreventGuiOpening", false)
assignVariable_STR("X39_MedSys_var_StartCRP", false)


assignVariable_STR("X39_MedSys_var_BandageBleedingHeal", 7)
assignVariable_STR("X39_MedSys_var_BloodPackValue", X39_MedSys_var_Bleeding_StartingBlood * 0.25)

assignVariable_STR("X39_MedSys_var_Healing_BandageHealValue", 0.1)
assignVariable_STR("X39_MedSys_var_Healing_BloodPackValue", 0.2)
assignVariable_STR("X39_MedSys_var_Healing_MedKitValue", 5)
assignVariable_STR("X39_MedSys_var_Display_TimeBeforeRespawnAvailable_NormalKnockout", 60)
assignVariable_STR("X39_MedSys_var_Display_TimeBeforeRespawnAvailable_Death", X39_MedSys_var_LifeTime / 2)
assignVariable_STR("X39_MedSys_var_Display_BlackOut_MaxFade", 0.5)
assignVariable_STR("X39_MedSys_var_Display_BlackOut_FadeManipulator", 0.025)
assignVariable_STR("X39_MedSys_var_Display_BlackOut_FadeTime_Value", 10)
assignVariable_STR("X39_MedSys_var_Display_BlackOut_FadeTime_RandomMinMax", 10)
assignVariable_STR("X39_MedSys_var_Display_Overlay_EnableHealthView", true)
assignVariable_STR("X39_MedSys_var_Display_Overlay_EnableBoodView", true)
assignVariable_STR("X39_MedSys_var_Display_Overlay_EnableLegView", true)
assignVariable_STR("X39_MedSys_var_Display_Overlay_EnableTourniquetView", true)
assignVariable_STR("X39_MedSys_var_Display_Overlay_EnableMorphineView", true)
assignVariable_STR("X39_MedSys_var_Bleeding_Tourniquet_DamagePerTick", 0.001)
assignVariable_STR("X39_MedSys_var_Force_CamShake", false)

assignVariable_STR("X39_MedSys_var_Bleeding_Allow", true)
assignVariable_STR("X39_MedSys_var_Pain_Allow", true)
assignVariable_STR("X39_MedSys_var_Pain_AllowHealthOvercharge", true)
assignVariable_STR("X39_MedSys_var_Pain_AllowMorphineOverdoseEffect", true)
assignVariable_STR("X39_MedSys_var_Pain_MorphineAlsoHeals", true)
assignVariable_STR("X39_MedSys_var_Pain_MaxHealthOvercharge", 1)
assignVariable_STR("X39_MedSys_var_Pain_HealthOverchargeEffectManipulator", 1)
assignVariable_STR("X39_MedSys_var_Pain_Modificator", 1)
assignVariable_STR("X39_MedSys_var_Pain_MorphineHealValue", 3)
assignVariable_STR("X39_MedSys_var_Pain_MorphineHpHealValue", 0.5)
assignVariable_STR("X39_MedSys_var_Pain_MorphineEffectReducedPerTick", 0.01)
assignVariable_STR("X39_MedSys_var_Pain_ReductionPerTick", 0.01)
assignVariable_STR("X39_MedSys_var_Pain_minPainToMaxPain", 15)

assignVariable_STR("X39_MedSys_var_Pain_ColorCorrections", true)
assignVariable_STR("X39_MedSys_var_Pain_Blur", true)

assignVariable_STR("X39_MedSys_var_Pain_RedScreen", true)
assignVariable_STR("X39_MedSys_var_Pain_GreyScreen", true)
assignVariable_STR("X39_MedSys_var_Pain_GreyScreenManipulator", 1)
assignVariable_STR("X39_MedSys_var_pain_ColorInversion", true)
assignVariable_STR("X39_MedSys_var_pain_ChromAberration", true)
assignVariable_STR("X39_MedSys_var_Pain_disableZeroingOnReceive", false)

assignVariable_STR("X39_MedSys_var_Pain_MaxBlur", 1)
assignVariable_STR("X39_MedSys_var_Bleeding_maxBleeding", 10)
assignVariable_STR("X39_MedSys_var_maxDamage", 10)

assignVariable_STR("X39_MedSys_var_HpRegenOverTime_Allow", true)
assignVariable_STR("X39_MedSys_var_HpRegenOverTime_MaxRegen", 0.20)
assignVariable_STR("X39_MedSys_var_HpRegenOverTime_RegenPerTick", 0.001)
assignVariable_STR("X39_MedSys_var_HpRegenOverTime_OnlyRegenWhenNotBleeding", true)

assignVariable_STR("X39_MedSys_var_KnockOut_MinTimeBetweenTempKnockOuts", 30)
assignVariable_STR("X39_MedSys_var_KnockOut_enableChatWhenKnockedOut", true)
assignVariable_STR("X39_MedSys_var_KnockOut_enableEscMenuWhenKnockedOut", true)
//new 0.3.0
assignVariable_STR("X39_MedSys_var_KnockOut_showRespawnButton", true)
assignVariable_STR("X39_MedSys_var_KnockOut_showAbortButton", true)

assignVariable_STR("X39_MedSys_var_Limitations_MaxHeal", 0.3)
assignVariable_STR("X39_MedSys_var_Limitations_allowHealingLegsInField", true)
assignVariable_STR("X39_MedSys_var_Limitations_allowBloodTransfusionInField", true)
assignVariable_STR("X39_MedSys_var_Limitations_allowHealingHeadInField", true)
assignVariable_STR("X39_MedSys_var_Limitations_serviceProviderRange", 10)
assignVariable_STR("X39_MedSys_var_Limitations_enable", false)

assignVariable_STR("X39_MedSys_var_Hearing_enable", true)
assignVariable_STR("X39_MedSys_var_Hearing_Multiplicator", 1)
assignVariable_STR("X39_MedSys_var_Hearing_CureValue", -0.00001)
assignVariable_STR("X39_MedSys_var_Hearing_earPlugManipulationValue", 0.2)

assignVariable_STR("X39_MedSys_var_KillUnitWhenMaxDamageReached", false)
assignVariable_STR("X39_MedSys_var_allowSpeedLimitations", true)
assignVariable_STR("X39_MedSys_var_allowSpeedLimitations_forceWalkAtXDamage", 3)


assignVariable_STR("X39_MedSys_var_enableDrag", true)
assignVariable_STR("X39_MedSys_var_enableCarry", true)
















_res = [] spawn {
	if(getNumber (configFile >> "CfgSettings" >> "X39" >> "x39_settings" >> "general" >> "enableOnAllMissions") >= 1) then
	{
		[] call X39_MedSys_fnc_initMod;
	};
	if(isServer) then
	{
		[] call X39_MedSys_fnc_applyServerConfig;
	};
};
X39_MedSys_var_VERSION = "0.3.5";