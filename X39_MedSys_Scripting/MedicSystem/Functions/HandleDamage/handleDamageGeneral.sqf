#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	gets callen everytime the unit takes damage
 *	
 *	Internal info:
 *	This function is running asynchron to other DamageHandlers (for example handleBody)!
 *	ALSO this is only executed everytime a BODY PART is taking damage (generic damage is not resulting in execution)
 *
 *	@ParamsCount - 2
 *	@Param1 - OBJECT - Object which shall be handled
 *	@Param2 - SCALAR - Damage dealt
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_unit", "_damage", "_XES_Res", "_oldBloodLoosePerTick", "_newBloodLoosePerTick"];
_unit = _this select 0;
_damage = _this select 1;
if(_damage > X39_MedSys_var_Bleeding_StartBloodAtMinDamageValueX) then {
	 _oldBloodLoosePerTick = _unit getVariable ["X39_MedSys_var_Bleeding_BloodLoosePerTick", 0];
	 _newBloodLoosePerTick = _oldBloodLoosePerTick + (_damage * X39_MedSys_var_Bleeding_BloodLossPerTickModificator);
	 if(_newBloodLoosePerTick > X39_MedSys_var_Bleeding_maxBleeding) then
	 {
		_newBloodLoosePerTick = X39_MedSys_var_Bleeding_maxBleeding;
	 };
	 _unit setVariable ["X39_MedSys_var_Bleeding_BloodLoosePerTick", _newBloodLoosePerTick, true];
	 [_unit, true] call X39_MedSys_fnc_setPlayerBleeding;
};
[_unit, (_unit getVariable ["X39_MedSys_var_Pain", 0]) + (_damage * X39_MedSys_var_Pain_Modificator)] call X39_MedSys_fnc_setUnitPain;