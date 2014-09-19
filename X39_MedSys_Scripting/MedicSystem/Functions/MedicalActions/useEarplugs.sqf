#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
#define ITEMSTRING "x39_earplug"

/**
 *	Handle the SelfInteraction KeyPress
 *	(Open correct GUI etc.)
 *
 *	@ParamsCount - 0
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_animationIndex", "_unit", "_currentPain", "_newPain", "_allowedID"];
_animationIndex = [_this, 0, 0, [0]] call BIS_fnc_param;
_unit = [_this, 1, cursorTarget, [objNull]] call BIS_fnc_param;
_hasEarplugs = _unit getVariable ["X39_MedSys_var_hasEarplugs", false];
[] call X39_XLib_fnc_ActionDialog_closeDialog;

//x39_earplug
if(items _unit find ITEMSTRING < 0 && !_hasEarplugs) exitWith{[localize "STR_X39_MedSys_var__msg_NoEarplugs"] call X39_MedSys_fnc_OutputMessageToPlayer;};


if(!_hasEarplugs) then 
{//Put
	_unit setVariable["X39_MedSys_var_hasEarplugs", true, true];
	_unit removeItem ITEMSTRING;
}
else
{//Remove
	_unit setVariable["X39_MedSys_var_hasEarplugs", false, true];
	_unit addItem ITEMSTRING;
};