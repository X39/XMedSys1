#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"

#define ITEMSTRING "x39_bandage"
/**
 *	Handle the SelfInteraction KeyPress
 *	(Open correct GUI etc.)
 *
 *	@ParamsCount - 0
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_animationIndex", "_unit", "_blpt"];
_animationIndex = [_this, 0, 0, [0]] call BIS_fnc_param;
_unit = [_this, 1, cursorTarget, [objNull]] call BIS_fnc_param;

_blpt = _unit getVariable ["X39_MedSys_var_Bleeding_BloodLoosePerTick", 0];
call X39_ActionUI_fnc_closeDialog;
if(items player find ITEMSTRING < 0 && items _unit find ITEMSTRING < 0) exitWith{[localize "STR_X39_MedSys_var__msg_NoBandageLeft"] call X39_MedSys_fnc_OutputMessageToPlayer;};
player playActionNow (_animationIndex call X39_MedSys_fnc_getMedicAnimation);
X39_MedSys_var_PreventGuiOpening = true;
sleep X39_MedSys_var_actionTimeout_BandageUnit;
X39_MedSys_var_PreventGuiOpening = false;
player playAction "medicStop";
_blpt = _blpt - X39_MedSys_var_BandageBleedingHeal;
if(_blpt <= 0) then
{
	[_unit, false] call X39_MedSys_fnc_setPlayerBleeding;
	[format["%1 %2", name _unit, localize "STR_X39_MedSys_var__msg_StoppedBleeding"]] call X39_MedSys_fnc_OutputMessageToPlayer;
}
else
{
	_unit setVariable["X39_MedSys_var_Bleeding_BloodLoosePerTick", _blpt, true];
	[format["%1 %2", name _unit, localize "STR_X39_MedSys_var__msg_StillBleeding"]] call X39_MedSys_fnc_OutputMessageToPlayer;
};
[_unit, X39_MedSys_var_Healing_BandageHealValue] call X39_MedSys_fnc_healUnit;
if(items _unit find ITEMSTRING > 0) then
{
	_unit removeItem ITEMSTRING;
}
else
{
	player removeItem ITEMSTRING;
};