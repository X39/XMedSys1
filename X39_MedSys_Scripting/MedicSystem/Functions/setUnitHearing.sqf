#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	Sets the units hearing ability
 *
 *	@ParamsCount - 2
 *	@Param1 - OBJECT (Unit) - N/A
 *	@Param2 - SCALAR - N/A
 *	@Param3 - BOOL - do KnockOutCheck
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_unit", "_hearingAbility"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_hearingAbility = [_this, 1, -1, [0]] call BIS_fnc_param;

_unit setVariable ["X39_MedSys_var_Hearing", _hearingAbility, true];
