#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	heals a unit with the provided value (use negative value to fully heal a unit)
 *
 *	@ParamsCount - 2
 *	@Param1 - OBJECT - Unit to apply damage change to
 *	@Param2 - SCALAR - Damage to heal
 *	@Return - NA
 *	@Author - X39|Cpt. HM Murdock
 */
 private["_unit", "_heal", "_allowID", "_maxHeal"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_heal = [_this, 1, 0, [0]] call BIS_fnc_param;
_allowID = [_this, 2, -1, [0]] call BIS_fnc_param;
_heal = (_unit call X39_MedSys_fnc_getUnitDamage) - _heal;
if(_heal < 0) then
{
	_heal = 0;
};
if(_allowID != -1) then
{
	if(_allowID == ALLOWED_LIMITED) then
	{
		_maxHeal = X39_MedSys_var_Limitations_MaxHeal * X39_MedSys_var_Generic_DamageBeforeDead;
		if(_heal > _maxHeal) then
		{
			_heal = _maxHeal;
		};
	};
};
[_unit, _heal, false] call X39_MedSys_fnc_setUnitDamage;