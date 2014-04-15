#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	Adds a positive/negative value to hearing ability 
 *
 *	@ParamsCount - 2
 *	@Param1 - OBJECT (Unit) - unit to change
 *	@Param2 - SCALAR - value to add
 *	@Return - SCALAR - new value
 *	@Author - X39|Cpt. HM Murdock
 */
private["_unit", "_hearingAbilityAdd", "_hearingAbility"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_hearingAbilityAdd = [_this, 1, -1, [0]] call BIS_fnc_param;

_hearingAbility = _unit getVariable ["X39_MedSys_var_Hearing", 0];
_hearingAbility = _hearingAbility + (_hearingAbilityAdd * X39_MedSys_var_Hearing_Multiplicator);
if(_hearingAbility < 0) then { _hearingAbility = 0; };
if(_hearingAbility > 1) then { _hearingAbility = 1; };
_unit setVariable ["X39_MedSys_var_Hearing", _hearingAbility, true];
