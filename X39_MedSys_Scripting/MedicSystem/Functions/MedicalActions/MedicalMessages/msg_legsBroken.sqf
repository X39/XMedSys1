#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	MessageGenerator
 *
 *	@ParamsCount - 1
 *	@Param1 - Object(Unit) - N/A
 *	@Return - String - N/A
 *	@Author - X39|Cpt. HM Murdock
 */

private["_output"];
_unit = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_outputRealValueOnly = [_this, 1, false, [false]] call BIS_fnc_param;

_output = "";
if!(_unit call X39_MedSys_fnc_isUnitAbleToMove) then
{
	_output = (localize "STR_X39_MedSys_var__msg_legsBroken");
}
else
{
	_output = "";
};
_output