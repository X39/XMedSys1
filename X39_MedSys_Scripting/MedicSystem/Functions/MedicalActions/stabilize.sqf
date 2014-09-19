#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	Handle the SelfInteraction KeyPress
 *	(Open correct GUI etc.)
 *
 *	@ParamsCount - 0
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_animationIndex", "_unit"];

_animationIndex = [_this, 0, 0, [0]] call BIS_fnc_param;
_unit = [_this, 1, cursorTarget, [objNull]] call BIS_fnc_param;
[] call X39_XLib_fnc_ActionDialog_closeDialog;
if(_unit call X39_MedSys_fnc_alive) exitWith {[localize "STR_X39_MedSys_var__msg_ThisMakesNoSense"] call X39_MedSys_fnc_OutputMessageToPlayer;};
player playActionNow (_animationIndex call X39_MedSys_fnc_getMedicAnimation);
X39_XLib_var_ActionDialog_preventMenuOpening = true;
sleep X39_MedSys_var_actionTimeout_Stabilize;
player playAction "medicStop";
X39_XLib_var_ActionDialog_preventMenuOpening = false;
_unit setVariable["X39_MedSys_var_LifeTime_stop", true, true];