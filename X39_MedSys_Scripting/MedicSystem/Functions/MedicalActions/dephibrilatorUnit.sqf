#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	Handle the SelfInteraction KeyPress
 *	(Open correct GUI etc.)
 *
 *	@ParamsCount - 0
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */

#define ITEMSTRING "x39_defibrillator"
private["_animationIndex", "_unit", "_isBleeding", "_damage", "_res"];
_animationIndex = [_this, 0, 0, [0]] call BIS_fnc_param;
_unit = [_this, 1, cursorTarget, [objNull]] call BIS_fnc_param;

call X39_ActionUI_fnc_closeDialog;
if(items player find ITEMSTRING < 0 && items _unit find ITEMSTRING < 0) exitWith{[localize "STR_X39_MedSys_var__msg_NoDefibrilator"] call X39_MedSys_fnc_OutputMessageToPlayer;};
player playActionNow (_animationIndex call X39_MedSys_fnc_getMedicAnimation);
_isBleeding = (_unit call X39_MedSys_fnc_getPlayerBleeding) select 0;
X39_MedSys_var_PreventGuiOpening = true;
sleep 7;
X39_MedSys_var_PreventGuiOpening = false;
if(!(_unit call X39_MedSys_fnc_alive)) then
{
	if (X39_MedSys_var_Head_HeadShotDeathLimit != -1) then
	{
		_damage = _unit call X39_MedSys_fnc_hitzoneHead_getDamage;
		if(_damage <= X39_MedSys_var_Head_HeadShotDeathLimit) then
		{
			_res = [[_unit, false], "X39_MedSys_fnc_fakeKillUnit", _unit, false] spawn BIS_fnc_MP;
		}
		else
		{
			[localize "STR_X39_MedSys_var__msg_CantSaveUnitInField"] call X39_MedSys_fnc_OutputMessageToPlayer;
		};
	}
	else
	{
		if(([_unit, true] call X39_MedSys_fnc_getUnitDamage) >= X39_MedSys_var_Generic_DamageBeforeKnockOut) then
		{
			[format["%1 %2", name _unit, localize "STR_X39_MedSys_var__msg_tooDamagedToBeRevived"]] call X39_MedSys_fnc_OutputMessageToPlayer;
		}
		else
		{
			_res = [[_unit, false], "X39_MedSys_fnc_fakeKillUnit", _unit, false] spawn BIS_fnc_MP;
		};
	};
}
else
{
	[localize "STR_X39_MedSys_var__msg_ThisMakesNoSense"] call X39_MedSys_fnc_OutputMessageToPlayer;
};
player playAction "medicStop";