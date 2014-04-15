#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	N/A
 *
 *	@ParamsCount - 3
 *	@Param1 - OBJECT (Unit) - N/A
 *	@Param2 - SCALAR - N/A
 *	@Param3 - BOOL - do KnockOutCheck
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_damage = [_this, 1, -1, [0]] call BIS_fnc_param;
_doKnockOutCheck = [_this, 2, true, [false]] call BIS_fnc_param;
if(X39_MedSys_var_UsingEventSystem) then {
	_XES_Res = ["DamageChanged", [_unit, _damage, _doKnockOutCheck], true, "XMedSys", missionNamespace] call X39_XLib_EH_fnc_triggerEvent;
	if(typeName _XES_Res == "ARRAY") then
	{
		_damage = _XES_Res;
	};
};
if(_damage > X39_MedSys_var_maxDamage && X39_MedSys_var_maxDamage != -1) then
{
	_damage = X39_MedSys_var_maxDamage;
};
_unit setVariable ["X39_MedSys_var_UnitDamage", _damage, true];
if(_doKnockOutCheck) then
{
	_unit call X39_MedSys_fnc_knockOutCheck;
};