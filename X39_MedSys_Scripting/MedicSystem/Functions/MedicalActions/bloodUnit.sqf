#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	Handle the SelfInteraction KeyPress
 *	(Open correct GUI etc.)
 *
 *	@ParamsCount - 0
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */

#define ITEMSTRING "x39_bloodbag"
private["_animationIndex", "_unit", "_allowedID", "_blood"];
_animationIndex = [_this, 0, 0, [0]] call BIS_fnc_param;
_unit = [_this, 1, cursorTarget, [objNull]] call BIS_fnc_param;
_allowedID = [_this, 2, -1, [0]] call BIS_fnc_param;

if(!X39_MedSys_var_Limitations_allowBloodTransfusionInField && _allowedID == ALLOWED_LIMITED) exitWith { [localize "STR_X39_MedSys_var__msg_CantSaveUnitInField"] call X39_MedSys_fnc_OutputMessageToPlayer; };

_blood = _unit getVariable ["X39_MedSys_var_Bleeding_blood", 0];
call X39_ActionUI_fnc_closeDialog;
if(items player find ITEMSTRING < 0 && items _unit find ITEMSTRING < 0) exitWith{[localize "STR_X39_MedSys_var__msg_NoBloodBagLeft"] call X39_MedSys_fnc_OutputMessageToPlayer;};
player playActionNow (_animationIndex call X39_MedSys_fnc_getMedicAnimation);
X39_MedSys_var_PreventGuiOpening = true;
sleep X39_MedSys_var_actionTimeout_BloodUnit;
X39_MedSys_var_PreventGuiOpening = false;
player playAction "medicStop";
_blood = _blood + X39_MedSys_var_BloodPackValue;
if(_blood > X39_MedSys_var_Bleeding_StartingBlood) then
{
	_blood = X39_MedSys_var_Bleeding_StartingBlood;
};
_unit setVariable["X39_MedSys_var_Bleeding_blood", _blood, true];
[_unit, X39_MedSys_var_Healing_BloodPackValue] call X39_MedSys_fnc_healUnit;
if(items _unit find ITEMSTRING > 0) then
{
	_unit removeItem ITEMSTRING;
}
else
{
	player removeItem ITEMSTRING;
};