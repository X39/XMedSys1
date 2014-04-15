#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	
 *
 *	@ParamsCount - 2
 *	@Param1 - Unit - N/A
 *	@Param2 - SCALAR - DamageToSet
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
_unit = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_val = [_this, 1, -1, [1]] call BIS_fnc_param;
if(isNull _unit) exitWith
{
	diag_log format["head_getDamage: no unit given! %1", _this];
};
if(_val < 0) exitWith
{
	diag_log format["head_getDamage: no valid value given (>0 && SCALAR)! %1", _this];
};

_unit setVariable["X39_MedSys_var_Head_Damage", _val, true];