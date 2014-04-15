#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	evaluate if given unit is able to move or not
 *	
 *	@ParamsCount - 1
 *	@Param1 - OBJECT (UNIT) - unit to be checked
 *	@Return - BOOL - true if unit is able to move, false if not
 *	@Author - X39|Cpt. HM Murdock
 */

_unitLegDamageValue = [_this] call X39_MedSys_fnc_hitzoneLeg_getDamage;
_flag = true;
if(_unitLegDamageValue > X39_MedSys_var_Legs_DamageBeforeProneOnly && X39_MedSys_var_Legs_AllowBrokenLegs) then
{
	_flag = false;
};
_flag 