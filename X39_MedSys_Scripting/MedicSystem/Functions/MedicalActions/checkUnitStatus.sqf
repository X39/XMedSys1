#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	Handle the SelfInteraction KeyPress
 *	(Open correct GUI etc.)
 *
 *	@ParamsCount - 0
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */

private["_animationIndex","_unit","_output","_res"];
_animationIndex = [_this, 0, 0, [0]] call BIS_fnc_param;
_unit = [_this, 1, cursorTarget, [objNull]] call BIS_fnc_param;
_output = format["%1 (%2):", (localize "STR_X39_MedSys_var__msg_Title_UnitReport"), name _unit];
player playActionNow (_animationIndex call X39_MedSys_fnc_getMedicAnimation);
X39_MedSys_var_PreventGuiOpening = true;
sleep 1;
X39_MedSys_var_PreventGuiOpening = false;
player playAction "medicStop";
if(!alive _unit) exitWIth { [parseText (localize "STR_X39_MedSys_var__msg_lifeTime_msg5")] call X39_MedSys_fnc_OutputMessageToPlayer; };
_res = [_unit, X39_MedSys_var_Action_CheckUnit_OutputRealValues] call X39_MedSys_fnc_msg_lifeTime;			if(_res != "") then { _output = format["%1<br />-%2", _output, _res]; };
_res = [_unit, X39_MedSys_var_Action_CheckUnit_OutputRealValues] call X39_MedSys_fnc_msg_damageReceived;	if(_res != "") then { _output = format["%1<br />-%2", _output, _res]; };
_res = [_unit, X39_MedSys_var_Action_CheckUnit_OutputRealValues] call X39_MedSys_fnc_msg_painReceived;		if(_res != "") then { _output = format["%1<br />-%2", _output, _res]; };
_res = [_unit, X39_MedSys_var_Action_CheckUnit_OutputRealValues] call X39_MedSys_fnc_msg_isBleeding;		if(_res != "") then { _output = format["%1<br />-%2", _output, _res]; };
_res = [_unit, X39_MedSys_var_Action_CheckUnit_OutputRealValues] call X39_MedSys_fnc_msg_bloodLeft;			if(_res != "") then { _output = format["%1<br />-%2", _output, _res]; };
_res = [_unit, X39_MedSys_var_Action_CheckUnit_OutputRealValues] call X39_MedSys_fnc_msg_legsBroken;		if(_res != "") then { _output = format["%1<br />-%2", _output, _res]; };
_res = [_unit, X39_MedSys_var_Action_CheckUnit_OutputRealValues] call X39_MedSys_fnc_msg_knockedOut;		if(_res != "") then { _output = format["%1<br />-%2", _output, _res]; };

if(_output == format["%1 (%2):", (localize "STR_X39_MedSys_var__msg_Title_UnitReport"), name _unit]) then
{
	_output = format["%1<br />%2", _output, "-/-"];
};
[parseText _output] call X39_MedSys_fnc_OutputMessageToPlayer;