#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *
 *	@ParamsCount - 1
 *	@Param1 - Object (UNIT)	- Unit to watch
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
if(!isPlayer _this) exitWith { };
if(!X39_MedSys_var_Hearing_enable) exitWith { };
private["_hearing", "_hearingCALC"];

_hearing = (_this call X39_MedSys_fnc_getUnitHearing);
_hearingCALC = (1 - _hearing) ^ 4;

0.1 fadeMusic _hearingCALC;
0.1 fadeSound _hearingCALC;
0.1 fadeRadio _hearingCALC;
//TFAR related variable:
//Global volume of radio and voice (level of ears health  ) [default value = 1.0]
_this setVariable ["tf_globalVolume", _hearingCALC, true];
if(((profileNamespace getVariable["X39_MedSys_var_Settings_playEarRingingSound", X39_MedSys_var_Settings_playEarRingingSound]) call X39_MedSys_fnc_IntToBoolean) && {_hearing > 0.5}) then
{
	playSound ["X39_Sounds_earRingingSoundLoop_1s", true];
};
[_this, X39_MedSys_var_Hearing_CureValue] call X39_MedSys_fnc_addUnitHearing