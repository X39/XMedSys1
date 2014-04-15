#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	Returns the correctly calculated unit damage
 *
 *	@ParamsCount - 2
 *	@Param1 - Object (Unit) - unit the value should be get from
 *	@Param2 - BOOL - get pure damage without pain etc.
 *	@Return - SCALAR
 *	@Author - X39|Cpt. HM Murdock
 */
private["_unit", "_getPureDamage", "_dmg", "_dmg2"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_getPureDamage = [_this, 1, false, [false]] call BIS_fnc_param;

_dmg = _unit getVariable ["X39_MedSys_var_UnitDamage", -1];
if(!_getPureDamage) then
{
	_dmg2 = _dmg + (((_unit getVariable ["X39_MedSys_var_Pain", 0]) / X39_MedSys_var_Pain_minPainToMaxPain) * X39_MedSys_var_Pain_MaxHealthOvercharge);
	if(_dmg2 >= 0) then
	{
		_dmg = _dmg2;
	}
	else
	{
		_dmg = 0;
	};
};
_dmg