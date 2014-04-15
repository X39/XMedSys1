#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	
 *
 *	@ParamsCount - 1
 *	@Param1 - Unit - N/A
 *	@Return - SCALAR - Damage on units head
 *	@Author - X39|Cpt. HM Murdock
 */
_unit = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith
{
	diag_log format["head_getDamage: no unit given! %1", _this];
};
(_unit getVariable "X39_MedSys_var_Legs_Damage")