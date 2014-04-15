#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	MessageGenerator
 *
 *	@ParamsCount - 1
 *	@Param1 - Object(Unit) - N/A
 *	@Return - String - N/A
 *	@Author - X39|Cpt. HM Murdock
 */

private["_output", "_knockedOut", "_alive"];
_unit = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_outputRealValueOnly = [_this, 1, false, [false]] call BIS_fnc_param;

_output = "";
_knockedOut = _unit call X39_MedSys_fnc_isUnitKnockedOut;
_alive = _unit call X39_MedSys_fnc_alive;
if(_outputRealValueOnly) then
{
	_output = format["%1", if(_knockedOut && _alive) then {localize ""} else { if(!_alive) then {localize ""} else { "" } } ];
}
else
{
	if(_knockedOut || !_alive) then
	{
		_output = (localize "STR_X39_MedSys_var__msg_knockedOut");
	}
	else
	{
		_output = "";
	};
};
_output