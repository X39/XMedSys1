#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	handles detected damage for the head
 *
 *	@ParamsCount - 2
 *	@Param1 - OBJECT - Object which shall be handled
 *	@Param2 - SCALAR - Damage dealt
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_unit", "_damage", "_XES_Res"];
_unit = _this select 0;
_damage = _this select 1;
_damage = (_unit call X39_MedSys_fnc_hitzoneHead_getDamage) + (_damage * X39_MedSys_var_Head_DamageMultiplicator);

if(X39_MedSys_var_UsingEventSystem) then {
	_XES_Res = ["Hit_Head", [_unit, _damage], true, "XMedSys", missionNamespace] call X39_XLib_EH_fnc_triggerEvent;
	if(typeName _XES_Res == "ARRAY") then
	{
		_damage = _XES_Res;
	};
};

if(_damage >= X39_MedSys_var_Head_HeadShotDeathLimit && X39_MedSys_var_Head_HeadShotDeathLimit != -1) then
{
	DEBUG_LOG_WFn(format["%1 >= X39_MedSys_var_Head_HeadShotDeathLimit (%2)" COMMA _damage COMMA X39_MedSys_var_Head_HeadShotDeathLimit])
	if(X39_MedSys_var_Head_HeadShotFakeKilling) then
	{
		DEBUG_LOG_WFn(format["As result: Unit (%1) will be fakeKilled" COMMA _unit])
		[_unit, false] call X39_MedSys_fnc_fakeKillUnit;
	}
	else
	{
		DEBUG_LOG_WFn(format["As result: Unit (%1) will really be killed (call X39_MedSys_fnc_killUnit)" COMMA _unit])
		_unit call X39_MedSys_fnc_killUnit;
	};
};
[_unit, _damage] call X39_MedSys_fnc_hitzoneHead_setDamage;